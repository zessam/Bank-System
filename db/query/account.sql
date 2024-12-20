-- name: CreateAccount :one
INSERT INTO accounts (
    owner, 
    balance, 
    currency 
) VALUES (
    $1, $2, $3
) RETURNING *;

-- name: GetAccount :one 
SELECT * FROM accounts
WHERE account_id = $1 LIMIT 1;


-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY account_id
LIMIT $1
OFFSET $2;


-- name: UpdateAccount :exec
UPDATE accounts 
SET balance = $2
WHERE account_id = $1;


-- name: DeleteAccount :exec
DELETE FROM accounts 
WHERE account_id = $1;