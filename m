From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 3/3] toshiba_acpi: Fix typo in *_cooling_method_set function
Date: Tue, 16 Aug 2016 12:06:17 -0600
Message-ID: <20160816180617.1743-4-coproscefalo@gmail.com>
References: <20160816180617.1743-1-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33990 "EHLO
	mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752986AbcHPSHA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Aug 2016 14:07:00 -0400
In-Reply-To: <20160816180617.1743-1-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

This patch simply fixes a typo in the error string printed in such
function.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 2256cf5..254a4d5 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1285,7 +1285,7 @@ static int toshiba_cooling_method_set(struct toshiba_acpi_dev *dev, u32 state)
 	u32 result = hci_write(dev, HCI_COOLING_METHOD, state);
 
 	if (result == TOS_FAILURE)
-		pr_err("ACPI call to get Cooling Method failed\n");
+		pr_err("ACPI call to set Cooling Method failed\n");
 
 	if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-- 
2.9.2
