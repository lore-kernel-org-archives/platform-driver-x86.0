From: Ayman Bagabas <ayman.bagabas@gmail.com>
Subject: [PATCH v2 4/8] platform/x86: huawei-wmi: control micmute LED through WMI interface
Date: Wed, 12 Jun 2019 23:04:11 -0400
Message-ID: <20190613030416.25807-6-ayman.bagabas@gmail.com>
References: <20190613030416.25807-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190613030416.25807-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ayman.bagabas@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Using HWMI interface, micmute LED can be controlled on supported models.
`MateBook X` from 2017, doesn't provide controlling the micmute
LED through this interface instead it uses another "legacy" interface
that is not "fully" implemented yet.
Currently, this "legacy" interface is used for hotkeys on this specific
model. A quirk is set to use ACPI method to control micmute LED on
MateBook X (2017).

Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 74 ++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 647c5a6c8ab3..358d9d168300 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -239,42 +239,52 @@ static int huawei_wmi_cmd(struct device *dev, u64 arg, u8 *buf, size_t buflen)
 static int huawei_wmi_micmute_led_set(struct led_classdev *led_cdev,
 		enum led_brightness brightness)
 {
-	char *acpi_method;
-	acpi_handle handle;
-	acpi_status status;
-	union acpi_object args[3];
-	struct acpi_object_list arg_list = {
-		.pointer = args,
-		.count = ARRAY_SIZE(args),
-	};
-
-	handle = ec_get_handle();
-	if (!handle) {
-		dev_err(led_cdev->dev->parent, "Failed to get EC handle\n");
-		return -ENODEV;
-	}
+	/* This is a workaround until the "legacy" interface is implemented. */
+	if (quirks && quirks->ec_micmute) {
+		char *acpi_method;
+		acpi_handle handle;
+		acpi_status status;
+		union acpi_object args[3];
+		struct acpi_object_list arg_list = {
+			.pointer = args,
+			.count = ARRAY_SIZE(args),
+		};
+
+		handle = ec_get_handle();
+		if (!handle) {
+			dev_err(led_cdev->dev->parent, "Failed to get EC handle\n");
+			return -ENODEV;
+		}
 
-	args[0].type = args[1].type = args[2].type = ACPI_TYPE_INTEGER;
-	args[1].integer.value = 0x04;
-
-	if (acpi_has_method(handle, "SPIN")) {
-		acpi_method = "SPIN";
-		args[0].integer.value = 0;
-		args[2].integer.value = brightness ? 1 : 0;
-	} else if (acpi_has_method(handle, "WPIN")) {
-		acpi_method = "WPIN";
-		args[0].integer.value = 1;
-		args[2].integer.value = brightness ? 0 : 1;
+		args[0].type = args[1].type = args[2].type = ACPI_TYPE_INTEGER;
+		args[1].integer.value = 0x04;
+
+		if (acpi_has_method(handle, "SPIN")) {
+			acpi_method = "SPIN";
+			args[0].integer.value = 0;
+			args[2].integer.value = brightness ? 1 : 0;
+		} else if (acpi_has_method(handle, "WPIN")) {
+			acpi_method = "WPIN";
+			args[0].integer.value = 1;
+			args[2].integer.value = brightness ? 0 : 1;
+		} else {
+			return -ENODEV;
+		}
+
+		status = acpi_evaluate_object(handle, acpi_method, &arg_list, NULL);
+		if (ACPI_FAILURE(status)) {
+			return -ENODEV;
+		}
+
+		return 0;
 	} else {
-		return -ENODEV;
-	}
+		u8 arg[8];
 
-	status = acpi_evaluate_object(handle, acpi_method, &arg_list, NULL);
-	if (ACPI_FAILURE(status)) {
-		return -ENODEV;
-	}
+		*(u64 *)arg = MICMUTE_LED_SET;
+		arg[2] = brightness;
 
-	return 0;
+		return huawei_wmi_cmd(led_cdev->dev->parent, *(u64 *)arg, NULL, NULL);
+	}
 }
 
 static int huawei_wmi_leds_setup(struct device *dev)
-- 
2.20.1
