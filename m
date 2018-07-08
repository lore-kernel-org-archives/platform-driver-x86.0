From: Damien =?UTF-8?B?VGjDqWJhdWx0?= <damien@dtbo.net>
Subject: [PATCH] dell-laptop: Fix backlight detection
Date: Sun, 8 Jul 2018 17:02:20 +0200
Message-ID: <20180708170220.35f40818@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Fix return code check for "max brightness" ACPI call.

The dell laptop ACPI video brightness control is not present on dell
laptops anymore, but was present in older kernel versions.

The code that checks the return value is incorrect since the SMM
refactoring.

The old code was:
  if (buffer->output[0] =3D=3D 0)

Which was changed to:
  ret =3D dell_send_request(...)
  if (ret)

However, dell_send_request() will return 0 if buffer->output[0] =3D=3D 0,
so we must change the check to:
  if (ret =3D=3D 0)

This issue was found on a Dell M4800 laptop, and the fix tested on it
as well.

Fixes: 549b4930f057 ("dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Damien Th=C3=A9bault <damien@dtbo.net>
Tested-by: Damien Th=C3=A9bault <damien@dtbo.net>
---
 drivers/platform/x86/dell-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c
b/drivers/platform/x86/dell-laptop.c index f1fa8612db40..06978c14c83b
100644 --- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -2185,7 +2185,7 @@ static int __init dell_init(void)
 		dell_fill_request(&buffer, token->location, 0, 0, 0);
 		ret =3D dell_send_request(&buffer,
 					CLASS_TOKEN_READ,
SELECT_TOKEN_AC);
-		if (ret)
+		if (ret =3D=3D 0)
 			max_intensity =3D buffer.output[3];
 	}
=20
--=20
2.17.1
