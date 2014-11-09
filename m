From: Ondrej Zary <linux@rainbow-software.org>
Subject: [PATCH] toshiba-acpi: Add missing ID (TOS6207)
Date: Mon, 10 Nov 2014 00:11:54 +0100
Message-ID: <1415574714-3847-1-git-send-email-linux@rainbow-software.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>, Seth Forshee <seth.forshee@canonical.com>, Kernel development list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

toshiba-acpi was always missing TOS6207 ID so it did not load automatically
on some laptops (such as Portege R100). But it worked fine if loaded manually.
Commit 135740de7764 ("toshiba_acpi: Convert to use acpi_driver") broke that
and the driver does not work even when loaded manually since then.

Add TOS6207 ID to fix it.

Tested on Toshiba Portege R100.

Signed-off-by: Ondrej Zary <linux@rainbow-software.org>
---
 drivers/platform/x86/toshiba_acpi.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index ef3a190..833c879 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -186,6 +186,7 @@ static struct toshiba_acpi_dev *toshiba_acpi;
 
 static const struct acpi_device_id toshiba_device_ids[] = {
 	{"TOS6200", 0},
+	{"TOS6207", 0},
 	{"TOS6208", 0},
 	{"TOS1900", 0},
 	{"", 0},
-- 
Ondrej Zary
