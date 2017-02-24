From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 2/4] platform/x86: intel-hid: make intel_hid_set_enable() take a boolean argument
Date: Fri, 24 Feb 2017 11:33:07 +0100
Message-ID: <20170224103309.19463-3-kernel@kempniu.pl>
References: <20170224103309.19463-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170224103309.19463-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

As the integer value passed to intel_hid_set_enable() is always
explicitly passed and is used solely as a boolean value, make it a bool.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/intel-hid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 4d1c5eb3a96d..89d1d98e3214 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -77,7 +77,7 @@ struct intel_hid_priv {
 	struct input_dev *array;
 };
 
-static int intel_hid_set_enable(struct device *device, int enable)
+static int intel_hid_set_enable(struct device *device, bool enable)
 {
 	acpi_status status;
 
@@ -118,7 +118,7 @@ static void intel_button_array_enable(struct device *device, bool enable)
 
 static int intel_hid_pl_suspend_handler(struct device *device)
 {
-	intel_hid_set_enable(device, 0);
+	intel_hid_set_enable(device, false);
 	intel_button_array_enable(device, false);
 
 	return 0;
@@ -126,7 +126,7 @@ static int intel_hid_pl_suspend_handler(struct device *device)
 
 static int intel_hid_pl_resume_handler(struct device *device)
 {
-	intel_hid_set_enable(device, 1);
+	intel_hid_set_enable(device, true);
 	intel_button_array_enable(device, true);
 
 	return 0;
@@ -275,7 +275,7 @@ static int intel_hid_probe(struct platform_device *device)
 		goto err_remove_input;
 	}
 
-	err = intel_hid_set_enable(&device->dev, 1);
+	err = intel_hid_set_enable(&device->dev, true);
 	if (err)
 		goto err_remove_notify;
 
@@ -306,7 +306,7 @@ static int intel_hid_remove(struct platform_device *device)
 
 	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
 	intel_hid_input_destroy(device);
-	intel_hid_set_enable(&device->dev, 0);
+	intel_hid_set_enable(&device->dev, false);
 	intel_button_array_enable(&device->dev, false);
 
 	/*
-- 
2.11.1
