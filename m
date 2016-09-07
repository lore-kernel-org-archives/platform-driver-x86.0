From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_bluetooth: Decouple an error checking status code
Date: Wed,  7 Sep 2016 09:28:15 -0600
Message-ID: <20160907152815.5950-4-coproscefalo@gmail.com>
References: <20160907152815.5950-1-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160907152815.5950-1-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch simply decouples te error checking of the ACPI status and
the actual BT status, as those two were nested in an if/else check,
but are completely unrelated.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_bluetooth.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platform/x86/toshiba_bluetooth.c
index 5db495dd..be1d137 100644
--- a/drivers/platform/x86/toshiba_bluetooth.c
+++ b/drivers/platform/x86/toshiba_bluetooth.c
@@ -80,7 +80,9 @@ static int toshiba_bluetooth_present(acpi_handle handle)
 	if (ACPI_FAILURE(result)) {
 		pr_err("ACPI call to query Bluetooth presence failed\n");
 		return -ENXIO;
-	} else if (!bt_present) {
+	}
+
+	if (!bt_present) {
 		pr_info("Bluetooth device not present\n");
 		return -ENODEV;
 	}
-- 
2.9.3
