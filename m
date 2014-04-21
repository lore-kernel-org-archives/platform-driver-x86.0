From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 08/11] driver: thinkpad_acpi: replace printk with pr_debug
Date: Mon, 21 Apr 2014 21:10:53 +0200
Message-ID: <1398107456-31080-9-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-4-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-5-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-6-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-7-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-8-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:40508 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753812AbaDUTLO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:14 -0400
Received: by mail-ee0-f46.google.com with SMTP id t10so3845373eei.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:14 -0700 (PDT)
In-Reply-To: <1398107456-31080-8-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the "Prefer [subsystem eg: netdev]_dbg([subsystem]
dev, ... then dev_dbg(dev, ... then pr_debug(...  to printk(KERN_DEBUG"
checkpath warning.

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index eba72e7..8631981 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -389,7 +389,7 @@ static bool tpacpi_uwb_emulstate;
 #define dbg_printk(a_dbg_level, format, arg...)				\
 do {									\
 	if (dbg_level & (a_dbg_level))					\
-		printk(KERN_DEBUG pr_fmt("%s: " format),		\
+		pr_debug(pr_fmt("%s: " format),		\
 		       __func__, ##arg);				\
 } while (0)
 
@@ -404,7 +404,7 @@ static inline const char *str_supported(int is_supported) { return ""; }
 
 static void tpacpi_log_usertask(const char * const what)
 {
-	printk(KERN_DEBUG pr_fmt("%s: access by process with PID %d\n"),
+	pr_debug(pr_fmt("%s: access by process with PID %d\n"),
 	       what, task_tgid_vnr(current));
 }
 
@@ -412,7 +412,7 @@ static void tpacpi_log_usertask(const char * const what)
 do {									\
 	if (unlikely((dbg_level & TPACPI_DBG_DISCLOSETASK) &&		\
 		     (tpacpi_lifecycle == TPACPI_LIFE_RUNNING))) {	\
-		printk(KERN_DEBUG pr_fmt("%s: PID %d: " format),	\
+		pr_debug(pr_fmt("%s: PID %d: " format),	\
 		       what, task_tgid_vnr(current), ## arg);		\
 	}								\
 } while (0)
-- 
1.8.1.2
