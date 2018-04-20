From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH] platform/x86: Kconfig: Fix dell-laptop dependency chain.
Date: Fri, 20 Apr 2018 12:42:11 -0500
Message-ID: <1524246131-17621-1-git-send-email-mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

As reported by Randy Dunlap:
>> WARNING: unmet direct dependencies detected for DELL_SMBIOS
>>   Depends on [m]: X86 [=y] && X86_PLATFORM_DEVICES [=y]
>>	&& (DCDBAS [=m] ||
>> DCDBAS [=m]=n) && (ACPI_WMI [=n] || ACPI_WMI [=n]=n)
>>   Selected by [y]:
>>   - DELL_LAPTOP [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y]
>> && DMI [=y]
>> && BACKLIGHT_CLASS_DEVICE [=y] && (ACPI_VIDEO [=n] ||
>>	ACPI_VIDEO [=n]=n)
>> && (RFKILL [=n] || RFKILL [=n]=n) && SERIO_I8042 [=y]
>>

Right now it's possible to set dell laptop to compile in but this
causes dell-smbios to compile in which breaks if dcdbas is a module.

Dell laptop shouldn't select dell-smbios anymore, but depend on it.

Fixes: 32d7b19 (platform/x86: dell-smbios: Resolve dependency error on DCDBAS)
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 39d06dd..bc309c5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -154,7 +154,7 @@ config DELL_LAPTOP
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on RFKILL || RFKILL = n
 	depends on SERIO_I8042
-	select DELL_SMBIOS
+	depends on DELL_SMBIOS
 	select POWER_SUPPLY
 	select LEDS_CLASS
 	select NEW_LEDS
-- 
2.7.4
