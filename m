From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 06/33] platform/x86: dell-laptop: disable kbd backlight on Inspiron 10xx
Date: Thu, 23 Jan 2020 20:16:41 -0500
Message-ID: <20200124011708.18232-6-sashal@kernel.org>
References: <20200124011708.18232-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20200124011708.18232-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>, Mario Limonciello <mario.limonciello@dell.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sasha Levin <sashal@kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>

[ Upstream commit 10b65e2915b2fcc606d173e98a972850101fb4c4 ]

This patch adds a quirk disabling keyboard backlight support for the
Dell Inspiron 1012 and 1018.

Those models wrongly report supporting keyboard backlight control
features (through SMBIOS tokens) even though they're not equipped with
a backlit keyboard. This led to broken controls being exposed
through sysfs by this driver which froze the system when used.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=107651
Signed-off-by: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/dell-laptop.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index d27be2836bc21..74e988f839e85 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -33,6 +33,7 @@
 
 struct quirk_entry {
 	bool touchpad_led;
+	bool kbd_led_not_present;
 	bool kbd_led_levels_off_1;
 	bool kbd_missing_ac_tag;
 
@@ -73,6 +74,10 @@ static struct quirk_entry quirk_dell_latitude_e6410 = {
 	.kbd_led_levels_off_1 = true,
 };
 
+static struct quirk_entry quirk_dell_inspiron_1012 = {
+	.kbd_led_not_present = true,
+};
+
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "dell-laptop",
@@ -310,6 +315,24 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_dell_latitude_e6410,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 1012",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1012"),
+		},
+		.driver_data = &quirk_dell_inspiron_1012,
+	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron 1018",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1018"),
+		},
+		.driver_data = &quirk_dell_inspiron_1012,
+	},
 	{ }
 };
 
@@ -1493,6 +1516,9 @@ static void kbd_init(void)
 {
 	int ret;
 
+	if (quirks && quirks->kbd_led_not_present)
+		return;
+
 	ret = kbd_init_info();
 	kbd_init_tokens();
 
-- 
2.20.1
