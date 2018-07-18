From: Damien =?iso-8859-1?Q?Th=E9bault?= <damien@dtbo.net>
Subject: [FIXED][PATCH] dell-laptop: Fix backlight detection
Date: Wed, 18 Jul 2018 12:06:01 +0200
Message-ID: <20180718100601.GA30600@han>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Fix return code check for "max brightness" ACPI call.

The dell laptop ACPI video brightness control is not present on dell
laptops anymore, but was present in older kernel versions.

The code that checks the return value is incorrect since the SMM
refactoring.

The old code was:
  if (buffer->output[0] == 0)

Which was changed to:
  ret = dell_send_request(...)
  if (ret)

However, dell_send_request() will return 0 if buffer->output[0] == 0,
so we must change the check to:
  if (ret == 0)

This issue was found on a Dell M4800 laptop, and the fix tested on it
as well.

Fixes: 549b4930f057 ("dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Damien Thébault <damien@dtbo.net>
Tested-by: Damien Thébault <damien@dtbo.net>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index f1fa8612db40..06978c14c83b 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -2185,7 +2185,7 @@ static int __init dell_init(void)
 		dell_fill_request(&buffer, token->location, 0, 0, 0);
 		ret = dell_send_request(&buffer,
 					CLASS_TOKEN_READ, SELECT_TOKEN_AC);
-		if (ret)
+		if (ret == 0)
 			max_intensity = buffer.output[3];
 	}
 
-- 
2.18.0
