From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 14/14] thinkpad-acpi: document backlight level writeback at driver init
Date: Wed, 19 May 2010 00:26:24 -0300
Message-ID: <1274239584-17743-15-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:44239 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756050Ab0ESD0f (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:35 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Document this, it is no fun to try to second guess why this sort of
stuff is in place years after it was added...

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b3bfce9..4bdb137 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6397,6 +6397,10 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 			"or not on your ThinkPad\n", TPACPI_MAIL);
 	}
 
+	/* Added by mistake in early 2007.  Probably useless, but it could
+	 * be working around some unknown firmware problem where the value
+	 * read at startup doesn't match the real hardware state... so leave
+	 * it in place just in case */
 	backlight_update_status(ibm_backlight_device);
 
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_BRGHT,
-- 
1.7.1

