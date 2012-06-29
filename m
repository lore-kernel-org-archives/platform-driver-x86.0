From: =?UTF-8?q?Tomasz=20Mo=C5=84?= <desowin@gmail.com>
Subject: [PATCH 1/1] x86/platform: samsung-laptop: Update Kconfig dependencies.
Date: Fri, 29 Jun 2012 22:59:42 +0200
Message-ID: <1341003582-4481-1-git-send-email-desowin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Tomasz=20Mo=C5=84?= <desowin@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

samsung-laptop driver can be compiled if ACPI_VIDEO is either compiled =
or
exluded. Trying to built-in the samsung-laptop driver when ACPI_VIDEO i=
s
compiled as module results in linking error.

This patch resolves this problem by setting proper dependencies in Kcon=
fig.

Signed-off-by: Tomasz Mo=C5=84 <desowin@gmail.com>
---
 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index 2a262f5..5add45e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -717,6 +717,7 @@ config XO15_EBOOK
 config SAMSUNG_LAPTOP
 	tristate "Samsung Laptop driver"
 	depends on X86
+	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
 	depends on RFKILL || RFKILL =3D n
 	depends on BACKLIGHT_CLASS_DEVICE
 	select LEDS_CLASS
--=20
1.7.10
