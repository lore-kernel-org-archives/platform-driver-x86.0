From: Colin King <colin.king@canonical.com>
Subject: [PATCH] platform: x86: dell-smo8800: remove redundant assignments to byte_data
Date: Tue, 31 Oct 2017 11:03:18 +0000
Message-ID: <20171031110318.20985-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
Sender: kernel-janitors-owner@vger.kernel.org
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable byte_data is being initialized and re-assigned with values that
are never read. Remove these as these redundant assignments. Cleans up
clang warning:

drivers/platform/x86/dell-smo8800.c:106:2: warning: Value stored to 'byte_data'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/platform/x86/dell-smo8800.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-smo8800.c b/drivers/platform/x86/dell-smo8800.c
index 37e646034ef8..1d87237bc731 100644
--- a/drivers/platform/x86/dell-smo8800.c
+++ b/drivers/platform/x86/dell-smo8800.c
@@ -90,7 +90,7 @@ static ssize_t smo8800_misc_read(struct file *file, char __user *buf,
 					 struct smo8800_device, miscdev);
 
 	u32 data = 0;
-	unsigned char byte_data = 0;
+	unsigned char byte_data;
 	ssize_t retval = 1;
 
 	if (count < 1)
@@ -103,7 +103,6 @@ static ssize_t smo8800_misc_read(struct file *file, char __user *buf,
 	if (retval)
 		return retval;
 
-	byte_data = 1;
 	retval = 1;
 
 	if (data < 255)
-- 
2.14.1

