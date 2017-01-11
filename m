From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 4/4] platform/x86: fujitsu-laptop: make hotkey handling functions more similar
Date: Wed, 11 Jan 2017 09:59:33 +0100
Message-ID: <20170111085933.2486-5-kernel@kempniu.pl>
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

Make two minor tweaks to acpi_fujitsu_hotkey_press() to make it more
similar to acpi_fujitsu_hotkey_release():

  * call vdbg_printk() after reporting the input event,
  * return immediately when kfifo_in_locked() fails.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 06653a8594ed..96f8163d5002 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -1035,18 +1035,18 @@ static void acpi_fujitsu_hotkey_press(int keycode)
 	struct input_dev *input = fujitsu_hotkey->input;
 	int status;
 
-	vdbg_printk(FUJLAPTOP_DBG_TRACE,
-		    "Push keycode into ringbuffer [%d]\n", keycode);
 	status = kfifo_in_locked(&fujitsu_hotkey->fifo,
 				 (unsigned char *)&keycode, sizeof(keycode),
 				 &fujitsu_hotkey->fifo_lock);
 	if (status != sizeof(keycode)) {
 		vdbg_printk(FUJLAPTOP_DBG_WARN,
 			    "Could not push keycode [0x%x]\n", keycode);
-	} else {
-		input_report_key(input, keycode, 1);
-		input_sync(input);
+		return;
 	}
+	input_report_key(input, keycode, 1);
+	input_sync(input);
+	vdbg_printk(FUJLAPTOP_DBG_TRACE,
+		    "Push keycode into ringbuffer [%d]\n", keycode);
 }
 
 static void acpi_fujitsu_hotkey_release(void)
-- 
2.11.0
