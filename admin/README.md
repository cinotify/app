# Admin

## Connect

```bash
fly postgres connect -a cinotify-db -d cinotify
```

## Queries

### Top Senders

```sql
SELECT users.email, count(notifications.id)
FROM users
LEFT JOIN notifications
ON (users.id = notifications.user_id)
GROUP BY users.email
ORDER BY COUNT(notifications.id)
DESC
LIMIT 20;
```

### Recent Senders

```sql
SELECT DISTINCT(users.email), notifications.created_at
FROM notifications
LEFT JOIN users
ON (notifications.user_id = users.id)
ORDER BY notifications.created_at
DESC
LIMIT 20;
```
