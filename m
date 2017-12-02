From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/4] platform/x86: ideapad-laptop: Remove unnesscary else
Date: Sat,  2 Dec 2017 21:45:31 +0800
Message-ID: <20171202134534.3252-1-jiaxun.yang@flygoat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ike Panhc <ike.pan@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Jargoyhen <rjargoyhen@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: platform-driver-x86.vger.kernel.org

To deal with checkpatch warning:
WARNING: else is not generally useful after a break or return

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 53ab4e0f8962..9f2a4bc58df0 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -124,10 +124,10 @@ static int read_method_int(acpi_handle handle, const char *method, int *val)
 	if (ACPI_FAILURE(status)) {
 		*val = -1;
 		return -1;
-	} else {
-		*val = result;
-		return 0;
 	}
+	*val = result;
+	return 0;
+
 }
 
 static int method_gbmd(acpi_handle handle, unsigned long *ret)
@@ -164,10 +164,10 @@ static int method_vpcr(acpi_handle handle, int cmd, int *ret)
 	if (ACPI_FAILURE(status)) {
 		*ret = -1;
 		return -1;
-	} else {
-		*ret = result;
-		return 0;
 	}
+	*ret = result;
+	return 0;
+
 }
 
 static int method_vpcw(acpi_handle handle, int cmd, int data)
-- 
2.14.1
