From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 3/3] toshiba_acpi: Fix typo in *_cooling_method_set function
Date: Mon, 29 Aug 2016 09:37:36 -0600
Message-ID: <20160829153736.18273-4-coproscefalo@gmail.com>
References: <20160829153736.18273-1-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160829153736.18273-1-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch simply fixes a typo in the error string printed in such
function.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index cc14e80..93f9ce1 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -1291,7 +1291,7 @@ static int toshiba_cooling_method_set(struct toshiba_acpi_dev *dev, u32 state)
 	u32 result = hci_write(dev, HCI_COOLING_METHOD, state);
 
 	if (result == TOS_FAILURE)
-		pr_err("ACPI call to get Cooling Method failed\n");
+		pr_err("ACPI call to set Cooling Method failed\n");
 
 	if (result == TOS_NOT_SUPPORTED)
 		return -ENODEV;
-- 
2.9.3
