From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 1/2] fujitsu-laptop: Use module name in debug messages
Date: Thu, 23 Jun 2016 12:02:47 +0200
Message-ID: <1466676168-4199-2-git-send-email-kernel@kempniu.pl>
References: <20160616234630.GB4764@marvin.atrad.com.au>
 <1466676168-4199-1-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466676168-4199-1-git-send-email-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

vdbg_printk() always prefixes the log messages it generates with
"FUJ02B1", which can be misleading, because it might have been called
while handling a notify for ACPI device FUJ02E3 or during module
initialization etc.  Employ pr_fmt() to prefix debug messages with the
module name instead and thus avoid confusion.

Reported-by: Jan-Marek Glogowski <glogow@fbihome.de>
Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x=
86/fujitsu-laptop.c
index ce41bc3..04e633d 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -136,7 +136,7 @@
 #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
 #define vdbg_printk(a_dbg_level, format, arg...) \
 	do { if (dbg_level & a_dbg_level) \
-		printk(FUJLAPTOP_DEBUG "%s: " format, __func__ , ## arg); \
+		printk(KERN_DEBUG pr_fmt("%s: " format), __func__, ## arg); \
 	} while (0)
 #else
 #define vdbg_printk(a_dbg_level, format, arg...) \
--=20
1.7.10.4
