From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 02/14] thinkpad-acpi: X100e quick fixes
Date: Wed, 19 May 2010 00:26:12 -0300
Message-ID: <1274239584-17743-3-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:49601 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756263Ab0ESD0i (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:38 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

The X100e needs some quick fixes to work semi-right with this driver.
There are much better ways to do this, but we can start with a quick
update and do it properly later.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 21759da..7817cef 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -516,6 +516,7 @@ TPACPI_HANDLE(ec, root, "\\_SB.PCI0.ISA.EC0",	/* 240, 240x */
 	   "\\_SB.PCI0.ISA.EC",	/* A21e, A2xm/p, T20-22, X20-21 */
 	   "\\_SB.PCI0.AD4S.EC0",	/* i1400, R30 */
 	   "\\_SB.PCI0.ICH3.EC0",	/* R31 */
+	   "\\_SB.PCI0.LPC0.EC",	/* X100e and a few others */
 	   "\\_SB.PCI0.LPC.EC",	/* all others */
 	   );
 
@@ -537,6 +538,7 @@ TPACPI_HANDLE(vid, root, "\\_SB.PCI.AGP.VGA",	/* 570 */
 	   "\\_SB.PCI0.AGP0.VID0",	/* 600e/x, 770x */
 	   "\\_SB.PCI0.VID0",	/* 770e */
 	   "\\_SB.PCI0.VID",	/* A21e, G4x, R50e, X30, X40 */
+	   "\\_SB.PCI0.AGP.VGA",	/* X100e and a few others */
 	   "\\_SB.PCI0.AGP.VID",	/* all others */
 	   );				/* R30, R31 */
 
-- 
1.7.1

