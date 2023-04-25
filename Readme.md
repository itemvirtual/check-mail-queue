# Bash Script to Monitor Postfix Mail Queue

This Bash script monitors the Postfix mail queue and sends an email to the specified recipients if the number of messages in the queue exceeds a certain threshold. The script can be configured with the following parameters:

- `-t`: The email address of the primary recipient (required)
- `-c`: The email address of the CC recipient (optional)
- `-m`: The maximum number of messages in the queue before an alert is sent (default: 20)

## Usage

To use the script, simply run it with the appropriate parameters:

```bash
./monitor_mail_queue.sh -t recipient@example.com -c cc_recipient@example.com -m 50
```

This will monitor the Postfix mail queue and send an email to recipient@example.com and cc_recipient@example.com if the number of messages in the queue exceeds 50.

## Installation

To install the script, simply clone this repository to your local machine:

```bash
git clone https://github.com/your-username/postfix-mail-queue-monitor.git
```

Then, navigate to the repository directory and make the script executable:

```bash
cd postfix-mail-queue-monitor
chmod +x monitor_mail_queue.sh
```

Add this script to your crontab
