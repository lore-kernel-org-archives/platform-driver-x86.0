From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 3/4] platform/x86: fujitsu-laptop: break up complex loop condition
Date: Wed, 11 Jan 2017 09:59:32 +0100
Message-ID: <20170111085933.2486-4-kernel@kempniu.pl>
References: <20170111085933.2486-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170111085933.2486-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The loop condition in acpi_fujitsu_hotkey_release() includes an
assignment, a four-argument function call and a comparison, making it
hard to read.  Separate the assignment from the comparison to improve
readability.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index e57d3724d2ce..06653a8594ed 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -1054,11 +1054,13 @@ static void acpi_fujitsu_hotkey_release(void)
 	struct input_dev *input = fujitsu_hotkey->input;
 	int keycode, status;
 
-	while ((status = kfifo_out_locked(&fujitsu_hotkey->fifo,
+	while (true) {
+		status = kfifo_out_locked(&fujitsu_hotkey->fifo,
 					  (unsigned char *)&keycode,
 					  sizeof(keycode),
-					  &fujitsu_hotkey->fifo_lock))
-					  == sizeof(keycode)) {
+					  &fujitsu_hotkey->fifo_lock);
+		if (status != sizeof(keycode))
+			return;
 		input_report_key(input, keycode, 0);
 		input_sync(input);
 		vdbg_printk(FUJLAPTOP_DBG_TRACE,
-- 
2.11.0
