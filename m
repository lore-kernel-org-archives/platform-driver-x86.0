From: Adam Lee <adam.lee@canonical.com>
Subject: [PATCH 3/3] thinkpad_acpi: add LED quirks of models which don't have EC controllable LEDs
Date: Fri,  7 Jun 2013 16:20:09 +0800
Message-ID: <1370593209-21358-4-git-send-email-adam.lee@canonical.com>
References: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:35147 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753581Ab3FGIWs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Jun 2013 04:22:48 -0400
Received: by mail-pb0-f42.google.com with SMTP id un1so237437pbc.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Jun 2013 01:22:48 -0700 (PDT)
In-Reply-To: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Matthew Garrett <matthew.garrett@nebula.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Alex Hung <alex.hung@canonical.com>, Bjorn Mork <bjorn@mork.no>

Some new Lenovo or ThinkPad laptops don't have EC controllable LEDs.
This patch adds their quirks.

Signed-off-by: Adam Lee <adam.lee@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2fb1f1c..4cc7d73 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5268,6 +5268,12 @@ static const struct tpacpi_quirk led_useful_qtable[] __initconst = {
 	TPACPI_Q_IBM('7', 'F', 0x1f97), /* Z61* (1) */
 	TPACPI_Q_IBM('7', 'B', 0x1fb7), /* X60 (1) */
 
+	/* Models don't have EC controllable LEDs */
+	TPACPI_Q_LNV('G', 'D', 0), /* ThinkPad Twist */
+	TPACPI_Q_LNV('H', '0', 0), /* ThinkPad E430 */
+	TPACPI_Q_LNV('H', 'C', 0), /* Lenovo E49L */
+	TPACPI_Q_LNV('H', 'D', 0), /* Lenovo K4350 */
+
 	/* (1) - may have excess leds enabled on MSB */
 
 	/* Defaults (order matters, keep last, don't reorder!) */
-- 
1.7.10.4
