From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 3/3] toshiba_acpi: Fix the enabling of the Special Functions
Date: Thu, 26 Feb 2015 10:57:14 -0700
Message-ID: <1424973434-3032-4-git-send-email-coproscefalo@gmail.com>
References: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Some Toshiba laptops with the "Special Functions" feature enabled
fail to properly enable such feature unless a specific value is
used to enable the hotkey events.

This patch adds a new function called "*_enable_special_functions",
that simply makes a call to the HCI_HOTKEY_EVENT call, but this time
we are using a different parameter to make the "Special Functions"
mode work as expected.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 10e0773..09c6a2f 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2336,6 +2336,20 @@ static int toshiba_acpi_enable_hotkeys(struct toshiba_acpi_dev *dev)
 	return 0;
 }
 
+static void toshiba_acpi_enable_special_functions(struct toshiba_acpi_dev *dev)
+{
+	u32 result;
+
+	/*
+	 * Re-activate the hotkeys, but this time, we are using the
+	 * "Special Functions" mode.
+	 */
+	result = hci_write1(dev, HCI_HOTKEY_EVENT,
+		    HCI_HOTKEY_ENABLE_SPECIAL);
+	if (result != TOS_SUCCESS)
+		pr_err("Could not enable the Special Function mode\n");
+}
+
 static bool toshiba_acpi_i8042_filter(unsigned char data, unsigned char str,
 				      struct serio *port)
 {
@@ -2738,6 +2752,12 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 
 	ret = toshiba_function_keys_get(dev, &dummy);
 	dev->kbd_function_keys_supported = !ret;
+	/*
+	 * Enable the "Special Functions" mode only if they are
+	 * supported and if they are activated.
+	 */
+	if (dev->kbd_function_keys_supported && dummy == 1)
+		toshiba_acpi_enable_special_functions(dev);
 
 	ret = toshiba_panel_power_on_get(dev, &dummy);
 	dev->panel_power_on_supported = !ret;
-- 
2.2.2
