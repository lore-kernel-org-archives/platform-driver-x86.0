From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 1/2] toshiba_haps: Split ACPI status error check from HDD protection support
Date: Wed,  7 Sep 2016 09:28:13 -0600
Message-ID: <20160907152815.5950-2-coproscefalo@gmail.com>
References: <20160907152815.5950-1-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160907152815.5950-1-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently the code checking for the ACPI status is mixed along with
the actual HDD protection status check.

This patch splits those two checks are they are not related, printing
an error string in case the ACPI call failed, and then check for
actual HDD protection status.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_haps.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
index 7f2afc6..094f3a8 100644
--- a/drivers/platform/x86/toshiba_haps.c
+++ b/drivers/platform/x86/toshiba_haps.c
@@ -168,9 +168,13 @@ static int toshiba_haps_available(acpi_handle handle)
 	 * A non existent device as well as having (only)
 	 * Solid State Drives can cause the call to fail.
 	 */
-	status = acpi_evaluate_integer(handle, "_STA", NULL,
-				       &hdd_present);
-	if (ACPI_FAILURE(status) || !hdd_present) {
+	status = acpi_evaluate_integer(handle, "_STA", NULL, &hdd_present);
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI call to query HDD protection failed\n");
+		return 0;
+	}
+
+	if (!hdd_present) {
 		pr_info("HDD protection not available or using SSD\n");
 		return 0;
 	}
-- 
2.9.3
