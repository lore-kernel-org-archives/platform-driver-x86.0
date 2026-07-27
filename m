Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DADF3BB67B
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 22:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785189611; cv=none; b=Kgl43Pn/oRh/spRtkXSRssqxw0cb5jBBUYaQOD6IExhkE5fGKsq5dhTgpzzK2R5cYN9pOHsxO8dTvD5GDqMNDGDlviub+aYQ2QTKGH/yDtPVZ30WzRlOFAqSnxRmsxvs1Zl1JjT4snsGmkOLzqCgg8CCKh+yVQQbqAkdLjvK1lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785189611; c=relaxed/simple;
	bh=+tpBehFHHRzpjwcHspGdrcYhHMU010vNYRitsmDKv2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TsgQh/w3jKIcJAU8pSlheWECE0dGljhvazlA0wNcbdd8KA8ZVLsq5TCB2xaKGOq0GCoDWMlRR0xe6F4I9XrFZg+RDX6tFXhRgI6ZkiSbYKy0NPbt5W/oY0uZwv2txa3S+Wzil4elUiHTEsDSSQnfb+A/cUwU9EwAJdys33c2S4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0CZuwXY; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0CZuwXY"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso4482921a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 15:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785189607; x=1785794407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYbfcGu0sV3hhdUkoZ9Ne01SzTLDU29O3Krf7wBZHZ8=;
        b=W0CZuwXYaUqf79XLXyFz/o1fTFUf1nVNKri/q//7whOReHf4AxFbzYAanJ/3pUNmba
         JhBG16Kp8Ncd0fm/8yQecjANoN1S8Fbjz9Pqrnld/0M3SarkFPtiil2hksJfM+4+dZ3o
         giRhJpsSY1VHBhuluhJKe/UlLSPAOogxBpFYkBlqKVocW3YOAGOBjganau5wdNrBylx7
         O3ThmHo5ZOQDVt2PgDBDlVqfNLg1Uj5k012uixSzU3EJh3yZG+n0TKnt5rqmVINYo3n/
         +NTUxj/xqhvww/GzixhA6XbngnFF/UkagkC8td4FssaWjVBz84ks5bLOfC5jl9OWscO0
         T8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785189607; x=1785794407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYbfcGu0sV3hhdUkoZ9Ne01SzTLDU29O3Krf7wBZHZ8=;
        b=hIAuoAiNI4LjJp/LQh5ABPCApOYt9ZDlUsF1/4EtGRV8A2Cugjbt1F1RvI4qajmvI1
         vPHW+d2nYsinTVOwqna029b2QV3RhJiBHhEj6GCpXpUln+pn9yvmigSV+hqCOVbNqyHj
         zbjKqO0BSvCWbGRBwNUcJimOMRrnRyfs1kX0c6d0++1rjk/79P1buONXPE0Zjf39+hWx
         gvAbJ/QHIlh3mT5IipVQPjvMI4wf0uobZscXS1QLBaHh9TZdUuCRq0vW9tKahTw2OtL6
         xsnS6vYHefSI7QhtaaTlTliyLSBUXUwNjSM7hKd8AKcD7Y7f1iL/xmjJ0Fm3V72//Qyo
         m6qA==
X-Gm-Message-State: AOJu0YxT6Conbiiu16hxaIHea09/fL6hmg955oCIOrWuBM/Sx/CWEAnB
	YbnT8StvOZbF2gCByb9VmxHUxYSa050c2tAOPhn6ltvaqmIuTCd4RfJlvpkkZyaJPww=
X-Gm-Gg: AR+sD10toJgLSG7fCDRZ/g7d0o2jGVwlPiLk5jZxOv7kOC01qWnnuwKxSH5lH+Zdy6D
	YdVVA2RbtEA9LbF3SMVRO5flRk3c8mjO4007yYqtC2/TTzdg+LsQs5Vm6PFs21PNd3W7ZRGkJo/
	0jB4I6pG+SkT6LccI63e1M91wbi0gA6ge1DYYQOEFj3cHAQH7Zcyk/gjj6uxK+CFP1Axp5/yHQv
	eOQcfuwWz69VcdgkDcwTVPOZPMoYgUyz+IeS0F84dfzXRc7b0sSY0lDTU1qn7ABbj6YlqhDZJXw
	KIm013CvWOxzHD8rNE+6qTsvcB++uOhIcfIVrvNmQC3x+eyWd4WmiA36EmLOPFahtqy5FIWlblv
	Uci+Z83263r1hIJT/1xFLG+9+qyW6whWWQX49RLSF7qqkFIFOr+2R5HDK0XiDTA26zC5L
X-Received: by 2002:a05:6402:42c9:b0:699:fbe4:16d4 with SMTP id 4fb4d7f45d1cf-69fc111ac6fmr3924141a12.18.1785189607345;
        Mon, 27 Jul 2026 15:00:07 -0700 (PDT)
Received: from fedora (yeal.ru. [94.103.95.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5946303sm3345753a12.27.2026.07.27.15.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:00:06 -0700 (PDT)
From: Alexander Egorov <begeebe@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	lkml@antheas.dev,
	derekjohn.clark@gmail.com,
	samsagax@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: oxpec: Report tablet mode on OneXPlayer Super X
Date: Tue, 28 Jul 2026 00:59:47 +0300
Message-ID: <20260727215947.118292-1-begeebe@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OneXPlayer Super X has a detachable pogo-pin keyboard which
enumerates as USB device 1a86:1305. The firmware does not expose a
tablet-mode input switch.

Without SW_TABLET_MODE, userspace treats the built-in controller and
other pointer devices as evidence that the system is in laptop mode.
Mutter consequently leaves automatic display rotation disabled after
the keyboard is detached.

On the Super X DMI match, register a persistent input device and report
SW_TABLET_MODE according to the pogo keyboard USB hotplug state. Report
laptop mode while the keyboard is present and tablet mode while it is
absent. Other USB and Bluetooth keyboards do not affect the switch.

Tested on a OneXPlayer Super X with keyboard attach and detach events.
Mutter changes PanelOrientationManaged in both directions and applies
accelerometer-driven display transforms only while the pogo keyboard is
absent.

Development of this patch used assistance from ChatGPT 5.6 sol.

Signed-off-by: Alexander Egorov <begeebe@gmail.com>
---
 drivers/platform/x86/Kconfig |   7 ++-
 drivers/platform/x86/oxpec.c | 110 +++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b54b521..3e30127 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1055,11 +1055,14 @@ config OXP_EC
 	depends on ACPI_EC
 	depends on ACPI_BATTERY
 	depends on HWMON
+	depends on INPUT
+	depends on USB
 	depends on X86
 	help
 		Enables support for the platform EC of OneXPlayer and AOKZOE
-		handheld devices. This includes fan speed, fan controls, and
-		disabling the default TDP behavior of the device.
+		handheld devices. This includes fan speed, fan controls, disabling
+		the default TDP behavior of the device, and tablet mode reporting
+		on supported detachable models.
 
 source "drivers/platform/x86/tuxedo/Kconfig"
 
diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 99c0dfc..e64ae54 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -18,10 +18,12 @@
 #include <linux/dmi.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
+#include <linux/input.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/processor.h>
+#include <linux/usb.h>
 #include <acpi/battery.h>
 
 /* Handle ACPI lock mechanism */
@@ -55,6 +57,14 @@ enum oxp_board {
 static enum oxp_board board;
 static struct device *oxp_dev;
 
+struct oxp_platform_data {
+	struct input_dev *tablet_mode_input;
+	struct notifier_block usb_notifier;
+};
+
+#define OXP_SUPER_X_KEYBOARD_VID	0x1a86
+#define OXP_SUPER_X_KEYBOARD_PID	0x1305
+
 /* Fan reading and PWM */
 #define OXP_SENSOR_FAN_REG		0x76 /* Fan reading is 2 registers long */
 #define OXP_2_SENSOR_FAN_REG		0x58 /* Fan reading is 2 registers long */
@@ -292,6 +302,94 @@ static const struct dmi_system_id dmi_table[] = {
 	{},
 };
 
+static bool oxp_is_super_x_keyboard(const struct usb_device *udev)
+{
+	return le16_to_cpu(udev->descriptor.idVendor) == OXP_SUPER_X_KEYBOARD_VID &&
+	       le16_to_cpu(udev->descriptor.idProduct) == OXP_SUPER_X_KEYBOARD_PID;
+}
+
+static void oxp_report_keyboard_attached(struct oxp_platform_data *data,
+					 bool attached)
+{
+	/* SW_TABLET_MODE is set when the detachable keyboard is absent. */
+	input_report_switch(data->tablet_mode_input, SW_TABLET_MODE, !attached);
+	input_sync(data->tablet_mode_input);
+}
+
+static int oxp_find_super_x_keyboard(struct usb_device *udev, void *data)
+{
+	bool *attached = data;
+
+	if (oxp_is_super_x_keyboard(udev))
+		*attached = true;
+
+	return 0;
+}
+
+static int oxp_usb_notify(struct notifier_block *nb,
+			  unsigned long action, void *notify_data)
+{
+	struct oxp_platform_data *data =
+		container_of(nb, struct oxp_platform_data, usb_notifier);
+	struct usb_device *udev = notify_data;
+
+	if (!oxp_is_super_x_keyboard(udev))
+		return NOTIFY_DONE;
+
+	switch (action) {
+	case USB_DEVICE_ADD:
+		oxp_report_keyboard_attached(data, true);
+		break;
+	case USB_DEVICE_REMOVE:
+		oxp_report_keyboard_attached(data, false);
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	return NOTIFY_OK;
+}
+
+static void oxp_unregister_usb_notifier(void *notify_block)
+{
+	usb_unregister_notify(notify_block);
+}
+
+static int oxp_register_super_x_tablet_switch(struct device *dev,
+					      struct oxp_platform_data *data)
+{
+	bool keyboard_attached = false;
+	struct input_dev *input;
+	int ret;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return -ENOMEM;
+
+	input->name = "OneXPlayer Super X Tablet Mode Switch";
+	input->phys = "oxp-platform/input0";
+	input->id.bustype = BUS_HOST;
+	input_set_capability(input, EV_SW, SW_TABLET_MODE);
+
+	ret = input_register_device(input);
+	if (ret)
+		return ret;
+
+	data->tablet_mode_input = input;
+	data->usb_notifier.notifier_call = oxp_usb_notify;
+	usb_register_notify(&data->usb_notifier);
+
+	ret = devm_add_action_or_reset(dev, oxp_unregister_usb_notifier,
+				       &data->usb_notifier);
+	if (ret)
+		return ret;
+
+	usb_for_each_dev(&keyboard_attached, oxp_find_super_x_keyboard);
+	oxp_report_keyboard_attached(data, keyboard_attached);
+
+	return 0;
+}
+
 /* Helper functions to handle EC read/write */
 static int read_from_ec(u8 reg, int size, long *val)
 {
@@ -954,6 +1052,18 @@ static int oxp_platform_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	if (dmi_match(DMI_BOARD_NAME, "ONEXPLAYER SUPER X")) {
+		struct oxp_platform_data *data;
+
+		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+		if (!data)
+			return -ENOMEM;
+
+		ret = oxp_register_super_x_tablet_switch(dev, data);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.55.0

