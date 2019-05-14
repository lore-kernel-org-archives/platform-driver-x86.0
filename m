From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v4 09/13] platform/x86: asus-wmi: Refactor error handling
Date: Tue, 14 May 2019 21:03:50 +0200
Message-ID: <18233d8b-0724-f0c7-2931-def225bd650c@gmail.com>
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Remove exit label as it is only used once from the point in code where no
cleanup is required and return can be called immediately.

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 7bfac06abae4..090a00af4017 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -255,7 +255,7 @@ static int asus_wmi_evaluate_method3(u32 method_id,
 				     &input, &output);
 
 	if (ACPI_FAILURE(status))
-		goto exit;
+		return -EIO;
 
 	obj = (union acpi_object *)output.pointer;
 	if (obj && obj->type == ACPI_TYPE_INTEGER)
@@ -266,10 +266,6 @@ static int asus_wmi_evaluate_method3(u32 method_id,
 
 	kfree(obj);
 
-exit:
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
 	if (tmp == ASUS_WMI_UNSUPPORTED_METHOD)
 		return -ENODEV;
 
-- 
2.17.1
