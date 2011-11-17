From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH] platform/x86: fix dell-laptop function prototypes
Date: Wed, 16 Nov 2011 18:20:51 -0800
Message-ID: <4EC46F83.2030901@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:59916 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755193Ab1KQCWo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Nov 2011 21:22:44 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build warnings:
drivers/platform/x86/dell-laptop.c:592:13: warning: function declaration isn't a prototype
drivers/platform/x86/dell-laptop.c:599:13: warning: function declaration isn't a prototype

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Matthew Garrett <mjg@redhat.com>
---
 drivers/platform/x86/dell-laptop.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- lnx-32-rc2.orig/drivers/platform/x86/dell-laptop.c
+++ lnx-32-rc2/drivers/platform/x86/dell-laptop.c
@@ -589,14 +589,14 @@ static const struct backlight_ops dell_o
 	.update_status  = dell_send_intensity,
 };
 
-static void touchpad_led_on()
+static void touchpad_led_on(void)
 {
 	int command = 0x97;
 	char data = 1;
 	i8042_command(&data, command | 1 << 12);
 }
 
-static void touchpad_led_off()
+static void touchpad_led_off(void)
 {
 	int command = 0x97;
 	char data = 2;
