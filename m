From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 3/4] platform/x86: intel-hid: use devm_input_allocate_device() for HID events input device
Date: Fri, 24 Feb 2017 11:33:08 +0100
Message-ID: <20170224103309.19463-4-kernel@kempniu.pl>
References: <20170224103309.19463-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34721 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751246AbdBXKdp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Feb 2017 05:33:45 -0500
Received: by mail-lf0-f65.google.com with SMTP id x142so292264lfd.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Feb 2017 02:33:18 -0800 (PST)
In-Reply-To: <20170224103309.19463-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

intel_hid_input_setup() is only called from the platform driver's .probe
callback.  Use the devm variant of input_allocate_device() for
allocating memory for the HID events input device in order to simplify
two error paths and get rid of intel_hid_input_destroy().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/intel-hid.c | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 89d1d98e3214..b17f33b832c2 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -144,28 +144,20 @@ static int intel_hid_input_setup(struct platform_device *device)
 	struct intel_hid_priv *priv = dev_get_drvdata(&device->dev);
 	int ret;
 
-	priv->input_dev = input_allocate_device();
+	priv->input_dev = devm_input_allocate_device(&device->dev);
 	if (!priv->input_dev)
 		return -ENOMEM;
 
 	ret = sparse_keymap_setup(priv->input_dev, intel_hid_keymap, NULL);
 	if (ret)
-		goto err_free_device;
+		return ret;
 
 	priv->input_dev->dev.parent = &device->dev;
 	priv->input_dev->name = "Intel HID events";
 	priv->input_dev->id.bustype = BUS_HOST;
 	set_bit(KEY_RFKILL, priv->input_dev->keybit);
 
-	ret = input_register_device(priv->input_dev);
-	if (ret)
-		goto err_free_device;
-
-	return 0;
-
-err_free_device:
-	input_free_device(priv->input_dev);
-	return ret;
+	return input_register_device(priv->input_dev);
 }
 
 static int intel_button_array_input_setup(struct platform_device *device)
@@ -189,13 +181,6 @@ static int intel_button_array_input_setup(struct platform_device *device)
 	return input_register_device(priv->array);
 }
 
-static void intel_hid_input_destroy(struct platform_device *device)
-{
-	struct intel_hid_priv *priv = dev_get_drvdata(&device->dev);
-
-	input_unregister_device(priv->input_dev);
-}
-
 static void notify_handler(acpi_handle handle, u32 event, void *context)
 {
 	struct platform_device *device = context;
@@ -270,10 +255,8 @@ static int intel_hid_probe(struct platform_device *device)
 					     ACPI_DEVICE_NOTIFY,
 					     notify_handler,
 					     device);
-	if (ACPI_FAILURE(status)) {
-		err = -EBUSY;
-		goto err_remove_input;
-	}
+	if (ACPI_FAILURE(status))
+		return -EBUSY;
 
 	err = intel_hid_set_enable(&device->dev, true);
 	if (err)
@@ -294,9 +277,6 @@ static int intel_hid_probe(struct platform_device *device)
 err_remove_notify:
 	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
 
-err_remove_input:
-	intel_hid_input_destroy(device);
-
 	return err;
 }
 
@@ -305,7 +285,6 @@ static int intel_hid_remove(struct platform_device *device)
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
 
 	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY, notify_handler);
-	intel_hid_input_destroy(device);
 	intel_hid_set_enable(&device->dev, false);
 	intel_button_array_enable(&device->dev, false);
 
-- 
2.11.1
