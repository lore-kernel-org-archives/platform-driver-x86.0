From: Joe Perches <joe@perches.com>
Subject: [PATCH] thinkpad_acpi: Remove side effects from vdbg_printk ->
 no_printk macro
Date: Wed, 26 Aug 2015 11:13:38 -0700
Message-ID: <1440612818.2780.24.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay0228.hostedemail.com ([216.40.44.228]:38959 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751313AbbHZSNo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 26 Aug 2015 14:13:44 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

vdbg_printk when not using CONFIG_THINKPAD_ACPI_DEBUG uses
no_printk which produces no logging output but always
evaluates arguments.

Change the macro to surround the no_printk call with
	do { if (0) no_printk(...); } while (0)
to avoid the unnecessary argument evaluations.

$ size drivers/platform/x86/thinkpad_acpi.o*
   text	   data	    bss	    dec	    hex	filename
  60918	   6184	    824	  67926	  10956	drivers/platform/x86/thinkpad_acpi.o.new
  60927	   6184	    824	  67935	  1095f	drivers/platform/x86/thinkpad_acpi.o.old

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 33e488c..131dd74 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -402,7 +402,7 @@ static const char *str_supported(int is_supported);
 #else
 static inline const char *str_supported(int is_supported) { return ""; }
 #define vdbg_printk(a_dbg_level, format, arg...)	\
-	no_printk(format, ##arg)
+	do { if (0) no_printk(format, ##arg); } while (0)
 #endif
 
 static void tpacpi_log_usertask(const char * const what)
