From: Andrej Gelenberg <andrej.gelenberg@udo.edu>
Subject: [PATCH] thinkpad_acpi: add support for thinkpad x100e
Date: Sun, 09 May 2010 21:05:57 +0200
Message-ID: <4BE70795.6060403@udo.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.HRZ.Uni-Dortmund.DE ([129.217.128.51]:33817 "EHLO
	unimail.uni-dortmund.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181Ab0EITXh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 9 May 2010 15:23:37 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: borislav@users.sf.net, hmh@hmh.eng.br
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

Embedded controller path is "\\_SB.PCI0.LPC0.EC" on Lenovo Thinkpad X100e.

  Signed-off-by: Andrej Gelenberg <andrej.gelenberg@udo.edu>

---
  drivers/platform/x86/thinkpad_acpi.c |    1 +
  1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c 
b/drivers/platform/x86/thinkpad_acpi.c
index 63290b3..7113457 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -508,6 +508,7 @@ TPACPI_HANDLE(ec, root, "\\_SB.PCI0.ISA.EC0", 
/* 240, 240x */
            "\\_SB.PCI0.AD4S.EC0",       /* i1400, R30 */
            "\\_SB.PCI0.ICH3.EC0",       /* R31 */
            "\\_SB.PCI0.LPC.EC", /* all others */
+          "\\_SB.PCI0.LPC0.EC",        /* X100e */
            );

  TPACPI_HANDLE(ecrd, ec, "ECRD");       /* 570 */
-- 
1.7.1
