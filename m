From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 11/14] thinkpad-acpi: explain errors from acpi_install_notify_handler
Date: Wed, 19 May 2010 00:26:21 -0300
Message-ID: <1274239584-17743-12-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:33332 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756050Ab0ESD0f (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:35 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Log more human-friendly errors instead of numeric values when
setup_acpi_notify() fails to install a notification handler.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index da3a70b..a39f159 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -785,8 +785,8 @@ static int __init setup_acpi_notify(struct ibm_struct *ibm)
 			       "handling %s events\n", ibm->name);
 		} else {
 			printk(TPACPI_ERR
-			       "acpi_install_notify_handler(%s) failed: %d\n",
-			       ibm->name, status);
+			       "acpi_install_notify_handler(%s) failed: %s\n",
+			       ibm->name, acpi_format_exception(status));
 		}
 		return -ENODEV;
 	}
-- 
1.7.1

