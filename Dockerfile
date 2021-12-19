FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /src
COPY ["NetCoreServer/NetCoreServer.csproj", "NetCoreServer/"]
RUN dotnet restore "NetCoreServer/NetCoreServer.csproj"
COPY . .
WORKDIR "/src/NetCoreServer"
RUN dotnet build NetCoreServer.csproj -c Release -o /app/build

FROM build AS publish
RUN dotnet publish NetCoreServer.csproj -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "NetCoreServer.dll"]