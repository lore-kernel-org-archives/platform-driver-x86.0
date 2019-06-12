From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 3/8] platform: x86: dell-laptop: no need to check return value of debugfs_create functions
Date: Wed, 12 Jun 2019 14:12:53 +0200
Message-ID: <20190612121258.19535-3-gregkh@linuxfoundation.org>
References: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612121258.19535-1-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "Pali Rohár" <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/x86/dell-laptop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index a561f653cf13..94a2f259031c 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -2176,9 +2176,8 @@ static int __init dell_init(void)
 	kbd_led_init(&platform_device->dev);
 
 	dell_laptop_dir = debugfs_create_dir("dell_laptop", NULL);
-	if (dell_laptop_dir != NULL)
-		debugfs_create_file("rfkill", 0444, dell_laptop_dir, NULL,
-				    &dell_debugfs_fops);
+	debugfs_create_file("rfkill", 0444, dell_laptop_dir, NULL,
+			    &dell_debugfs_fops);
 
 	dell_laptop_register_notifier(&dell_laptop_notifier);
 
-- 
2.22.0
