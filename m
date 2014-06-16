From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH RESEND] fujitsu-laptop: Clear build warnings
Date: Mon, 16 Jun 2014 11:55:13 +0200
Message-ID: <20140616115513.5d170041@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54475 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754997AbaFPJzR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Jun 2014 05:55:17 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Jonathan Woithe <jwoithe@just42.net>, Matthew Garrett <matthew.garrett@nebula.com>

When CONFIG_FUJITSU_LAPTOP_DEBUG is disabled and W=1, the
fujitsu-laptop driver builds with the following warnings:

drivers/platform/x86/fujitsu-laptop.c: In function "bl_update_status":
drivers/platform/x86/fujitsu-laptop.c:409:8: warning: suggest braces around empty body in an "if" statement [-Wempty-body]
    ret);
        ^
drivers/platform/x86/fujitsu-laptop.c:418:8: warning: suggest braces around empty body in an "if" statement [-Wempty-body]
    ret);
        ^

Rework the debug printk helper macro to get rid of these. I verified
that this change has no effect on the generated binary, both in the
debug and non-debug case.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Acked-by: Jonathan Woithe <jwoithe@just42.net>
Cc: Matthew Garrett <matthew.garrett@nebula.com>
---
Matthew, Jonathan acked this patch 3 months ago (March 17th), can you
please apply it? Thanks.

 drivers/platform/x86/fujitsu-laptop.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

--- linux-3.14-rc6.orig/drivers/platform/x86/fujitsu-laptop.c	2014-03-17 11:31:19.961145958 +0100
+++ linux-3.14-rc6/drivers/platform/x86/fujitsu-laptop.c	2014-03-17 11:46:56.242465978 +0100
@@ -129,15 +129,14 @@
 #define FUJLAPTOP_DBG_INFO	  0x0004
 #define FUJLAPTOP_DBG_TRACE	  0x0008
 
-#define dbg_printk(a_dbg_level, format, arg...) \
+#ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
+#define vdbg_printk(a_dbg_level, format, arg...) \
 	do { if (dbg_level & a_dbg_level) \
 		printk(FUJLAPTOP_DEBUG "%s: " format, __func__ , ## arg); \
 	} while (0)
-#ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
-#define vdbg_printk(a_dbg_level, format, arg...) \
-	dbg_printk(a_dbg_level, format, ## arg)
 #else
-#define vdbg_printk(a_dbg_level, format, arg...)
+#define vdbg_printk(a_dbg_level, format, arg...) \
+	do { } while (0)
 #endif
 
 /* Device controlling the backlight and associated keys */


-- 
Jean Delvare
SUSE L3 Support
