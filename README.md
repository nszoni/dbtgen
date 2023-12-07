# dbtgen

dbt: write nothing, generate (almost) everything

## This project uses GitHub Archive dataset hosted by BigQuery.

[GH Archive](https://www.gharchive.org/#bigquery)

```sql
SELECT event as issue_status, COUNT(*) as cnt FROM (
  SELECT type, repo.name, actor.login,
    JSON_EXTRACT(payload, '$.action') as event, 
  FROM `githubarchive.day.20231215`
  WHERE type = 'IssuesEvent'
)
GROUP by issue_status;
```

## This project uses DevContainers.


1. Ensure you have the following prerequisites installed:
    - [Docker](https://www.docker.com/products/docker-desktop)
    - [Visual Studio Code](https://code.visualstudio.com/)
    - [Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) for Visual Studio Code

2. Clone the repository to your local machine.

3. Open the cloned repository in Visual Studio Code.

4. When you open the project, Visual Studio Code will prompt you with a notification asking if you would like to reopen the project in a container. Choose "Reopen in Container". If you don't see this notification, you can press `F1`, type `Remote-Containers: Reopen Folder in Container` and press `Enter`.

5. Visual Studio Code will then start building the Docker container defined in the `.devcontainer` directory of the project. This may take a few minutes the first time.

6. Once the container is built, Visual Studio Code will automatically connect to it. You're now working inside the DevContainer!

Remember, any changes you make inside the container will be reflected in your project directory on your host machine, and vice versa.

## Troubleshooting
If you encounter any issues during deployment or need further assistance, please check the following resources:

- [Official dbt documentation](https://docs.getdbt.com/)
- [dbt Slack](https://www.getdbt.com/community/join-the-community)

## Contributing
Contributions are welcomed through GitHub pull requests.