From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] platform/x86/dell-smo8800: Delete an error message for a
 failed memory allocation in smo8800_add()
Date: Tue, 19 Dec 2017 21:18:27 +0100
Message-ID: <3ce85d6b-6b25-2988-960b-84fa0b7a8c61@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 19 Dec 2017 21:12:10 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/platform/x86/dell-smo8800.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-smo8800.c b/drivers/platform/x86/dell-smo8800.c
index 1d87237bc731..9590d5e7c5ca 100644
--- a/drivers/platform/x86/dell-smo8800.c
+++ b/drivers/platform/x86/dell-smo8800.c
@@ -150,10 +150,8 @@ static int smo8800_add(struct acpi_device *device)
 	struct smo8800_device *smo8800;
 
 	smo8800 = devm_kzalloc(&device->dev, sizeof(*smo8800), GFP_KERNEL);
-	if (!smo8800) {
-		dev_err(&device->dev, "failed to allocate device data\n");
+	if (!smo8800)
 		return -ENOMEM;
-	}
 
 	smo8800->dev = &device->dev;
 	smo8800->miscdev.minor = MISC_DYNAMIC_MINOR;
-- 
2.15.1
