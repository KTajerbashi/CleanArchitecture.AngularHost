# syntax=docker/dockerfile:1

# ---- Stage 1: Build the Angular client ----
FROM node:20-alpine AS angular-build
WORKDIR /client
COPY Src/3.EndPoints/AngularApp.EndPoint.WebApp/ClientApp/package*.json ./
RUN npm ci
COPY Src/3.EndPoints/AngularApp.EndPoint.WebApp/ClientApp/ ./
RUN npm run build -- --configuration production

# ---- Stage 2: Restore & publish the .NET WebApp ----
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS dotnet-build
WORKDIR /src
COPY AngularApp.slnx ./
COPY Src/ ./Src/
# Drop the Angular build output where the .NET build expects it
COPY --from=angular-build /client/dist ./Src/3.EndPoints/AngularApp.EndPoint.WebApp/ClientApp/dist
RUN dotnet restore Src/3.EndPoints/AngularApp.EndPoint.WebApp/AngularApp.EndPoint.WebApp.csproj
RUN dotnet publish Src/3.EndPoints/AngularApp.EndPoint.WebApp/AngularApp.EndPoint.WebApp.csproj \
    -c Release -o /app/publish /p:UseAppHost=false

# ---- Stage 3: Runtime image ----
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS final
WORKDIR /app
COPY --from=dotnet-build /app/publish .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080
ENTRYPOINT ["dotnet", "AngularApp.EndPoint.WebApp.dll"]
