From: Jesper Juhl <jj@chaosbits.net>
Subject: [PATCH] ACPI Thinkpad: We must always call va_end() after va_start()
 but do not do so in thinkpad_acpi.c::acpi_evalf()
Date: Fri, 24 Dec 2010 19:56:28 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1012241952200.28973@swampdragon.chaosbits.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from swampdragon.chaosbits.net ([90.184.90.115]:19431 "EHLO
	swampdragon.chaosbits.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752736Ab0LXTGU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 24 Dec 2010 14:06:20 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net
Cc: Borislav Deianov <borislav@users.sf.net>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

In drivers/platform/x86/thinkpad_acpi.c::acpi_evalf() we don't always call 
va_end() after va_start(). This patch corrects that.


Signed-off-by: Jesper Juhl <jj@chaosbits.net>
---
 thinkpad_acpi.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e8c2199..d053c0e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -589,6 +589,7 @@ static int acpi_evalf(acpi_handle handle,
 		default:
 			printk(TPACPI_ERR "acpi_evalf() called "
 			       "with invalid format character '%c'\n", c);
+			va_end(ap);
 			return 0;
 		}
 	}



-- 
Jesper Juhl <jj@chaosbits.net>            http://www.chaosbits.net/
Don't top-post http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please.
