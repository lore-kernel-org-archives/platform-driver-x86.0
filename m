Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EA840B366
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227755; cv=none; b=n/kTAeI2bcxFSdw0orJhJ4cdkt+xf6fp01Figu3D7aBzNr4zjEm6vU6Qh7Qqm6sL5MYCqHxZZm3beRu/nQU+PH2ExFJK9908OGdC04GaMWgKpXq5nIxMTkcoikfUFFDREMK6CvO2LRzphluDlTsvQPa+/Pql2tJledR4wKF1/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227755; c=relaxed/simple;
	bh=8LUc3T6qcF8rKLeGVcCa+6lKE9nEqeWd3FQ47bcEyZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCGCaHo0fcgrXHR2LEs/QE0Oi6kW2AUhEpTrFkA1TDoAr9Y4l6Tmqj67Bbw4tYpD2AHIDaPjPv6R4xjFtVvGQ4JeDD+Z9R/ZxXKghnWf9cr40gDo5fvzIroMWab8rChDdfDGxj50Tsc7TUXZfl1rIEo+fYIo5fp3qm8k10pd5FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J444Uawl; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J444Uawl"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1670dad7a8so538189366b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 01:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785227742; x=1785832542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PcWn2e/pqOXEePn1KtOQa2v1NKIiM7/wI3pZ+wT/mSA=;
        b=J444UawlIkI4phEfEkn4kz/srVOf5uO4IGX36JS+cMCJJVCIVKkZyFiWAy00AqfWJ/
         n5lsLVTG6G1YSB/nqBeZ77OJQsPZ4JiVjkwVZ0JhM2tmgN4fkDiv/9dJQmBcRDWO9gsB
         2EfLt1obakERBWA9pehaIHSHUIfsitdyE84aLfSTbDw+NzQa3WtxK7+EZBJow3m0OaPo
         yKs9aNdi4BirLRW2TQzYfOMiwG+eupBUS/vy2okXB7d752JUYOuEckkhGjUV2T8x/5eg
         Ptum94cVmP1zhXc5WXaAAR//4xAdi6pecTrREmQGBUNaO76lb8C/0UXOxkT4I+Craf4n
         +URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227742; x=1785832542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PcWn2e/pqOXEePn1KtOQa2v1NKIiM7/wI3pZ+wT/mSA=;
        b=EbaeNKsu1iGyawo+xhknBKI2FRk9Ttto/Pd2+vqGI5qSUYrT84p2PuuBF/ayJMQLoO
         FeGBhhLOL9Dd6BCVrUztj0IYqG2Ddc0ARlbV9mJfKbeUX60QXjTSdJx39ydnfXIN3qKU
         XiBDBavZtMkHM1K7EsKbicqhf9sktelHs+2sglILUBwuuRJROHTkF+uC+iZhwDE/RJQc
         9Fv05Hitvjk4/N5jUxEfliJZj6mcxmxKNFvEHP/AMWSRqfPyeWKzTgZmfQKBdouzFRcn
         oq+ur+4ufEleK4pUZzpt8DgKX755lTZ23tt/krPfa5UPRWpEUN6tDHxtpWyP/IWiauBF
         H4gQ==
X-Gm-Message-State: AOJu0YyF3AFC9mdoJLQFgFkSsLOUxz8qpiJTLAO3ef89b+SCIqUrxni0
	zViICztQ0caArYd4fIgLf79o+F+g3Jp2kJ85Y4z1tkTdMJ5j4syDPCRs9t2OI5g0U0E=
X-Gm-Gg: AR+sD10KYOJv/QhaAcoUTkld8WlcElFiByGDsxhOT2MtPoUJugvc7COCedwu5tilmyf
	iUmUkrZhtcY5DlVXd4O7WNkLEhVCxaKbKutANKLqg7sVQmmg+cGsDvXx4t+JHCjzXNn9be1ix4Q
	ZLez3x35BOKkC/Z5ae3OiMvbJA8MaMlrr9Bld7vgM7pmNV3jHcGTZJnu3SQWqRIk+uHzSayBCTM
	AprGrmzB+YBX3sRUbzni+6txkNZEsAxJC/4cr+L24gZW2+Tjj6FaR9pwZ/esTnr3d7TCPyoPOzj
	bY5Zo8cX4m8AAdOOpSIO8cRZ6+IecWXye20yajT8Sol4LM7CrfvS/3fujXuPWeL47wHeG9GPd35
	RT+BbjPeAlASxQYKAr1dOY15G4NBGzMWA3/coGYkhsUk0rWwzmagU6VcH+7mQBk/rrZKz
X-Received: by 2002:a17:907:9414:b0:c16:1df9:6eda with SMTP id a640c23a62f3a-c1f72199a7bmr58822566b.49.1785227742229;
        Tue, 28 Jul 2026 01:35:42 -0700 (PDT)
Received: from fedora (yeal.ru. [94.103.95.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f19ad49f1sm353753266b.1.2026.07.28.01.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:35:41 -0700 (PDT)
From: Alexander Egorov <begeebe@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	lkml@antheas.dev,
	derekjohn.clark@gmail.com,
	samsagax@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: oxpec: Report tablet mode on OneXPlayer detachables
Date: Tue, 28 Jul 2026 11:35:29 +0300
Message-ID: <20260728083529.329772-3-begeebe@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728083529.329772-1-begeebe@gmail.com>
References: <20260727215947.118292-1-begeebe@gmail.com>
 <20260728083529.329772-1-begeebe@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OneXPlayer X1 family and Super X have detachable pogo-pin
keyboards. The firmware does not expose a tablet-mode input switch.

The Super X keyboard enumerates as 1a86:1305. The X1 family folio
keyboard enumerates as 258a:001e.

Register an input device on these boards and report SW_TABLET_MODE from
the model-specific pogo keyboard USB hotplug state. Other USB and
Bluetooth keyboards do not affect the switch.

A complete dump of the 256-byte Super X EC register map was compared
with the keyboard attached, detached, and reattached. No register
changed predictably with the attachment state.

Tested on a OneXPlayer Super X. Mutter enables accelerometer-driven
display rotation only while the pogo keyboard is absent.

Assisted-by: Codex:gpt-5.6
Signed-off-by: Alexander Egorov <begeebe@gmail.com>
---
 drivers/platform/x86/Kconfig |   2 +
 drivers/platform/x86/oxpec.c | 103 +++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b54b521..3bcbd49 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1055,6 +1055,8 @@ config OXP_EC
 	depends on ACPI_EC
 	depends on ACPI_BATTERY
 	depends on HWMON
+	depends on INPUT
+	depends on USB
 	depends on X86
 	help
 		Enables support for the platform EC of OneXPlayer and AOKZOE
diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index df29e41..5c07a35 100644
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
@@ -55,6 +57,8 @@ enum oxp_board {
 
 static enum oxp_board board;
 static struct device *oxp_dev;
+static struct input_dev *oxp_tablet_mode_input;
+static struct notifier_block oxp_usb_notifier;
 
 /* Fan reading and PWM */
 #define OXP_SENSOR_FAN_REG		0x76 /* Fan reading is 2 registers long */
@@ -293,6 +297,74 @@ static const struct dmi_system_id dmi_table[] = {
 	{},
 };
 
+#define OXP_KEYBOARD_VID_QINHENG	0x1a86
+#define OXP_KEYBOARD_PID_K2445		0x1305
+#define OXP_KEYBOARD_VID_HAILUCK	0x258a
+#define OXP_KEYBOARD_PID_HAILUCK	0x001e
+
+static int oxp_find_keyboard(struct usb_device *udev, void *data)
+{
+	bool *keyboard_attached = data;
+	u16 vid = le16_to_cpu(udev->descriptor.idVendor);
+	u16 pid = le16_to_cpu(udev->descriptor.idProduct);
+
+	switch (board) {
+	case oxp_x1:
+		if (vid == OXP_KEYBOARD_VID_HAILUCK &&
+		    pid == OXP_KEYBOARD_PID_HAILUCK)
+			*keyboard_attached = true;
+		break;
+	case oxp_super_x:
+		if (vid == OXP_KEYBOARD_VID_QINHENG &&
+		    pid == OXP_KEYBOARD_PID_K2445)
+			*keyboard_attached = true;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int oxp_usb_notify(struct notifier_block *nb,
+			  unsigned long action, void *data)
+{
+	struct usb_device *udev = data;
+	u16 vid = le16_to_cpu(udev->descriptor.idVendor);
+	u16 pid = le16_to_cpu(udev->descriptor.idProduct);
+	bool keyboard = false;
+
+	switch (board) {
+	case oxp_x1:
+		keyboard = vid == OXP_KEYBOARD_VID_HAILUCK &&
+			   pid == OXP_KEYBOARD_PID_HAILUCK;
+		break;
+	case oxp_super_x:
+		keyboard = vid == OXP_KEYBOARD_VID_QINHENG &&
+			   pid == OXP_KEYBOARD_PID_K2445;
+		break;
+	default:
+		break;
+	}
+
+	if (!keyboard)
+		return NOTIFY_DONE;
+
+	switch (action) {
+	case USB_DEVICE_ADD:
+		input_report_switch(oxp_tablet_mode_input, SW_TABLET_MODE, false);
+		break;
+	case USB_DEVICE_REMOVE:
+		input_report_switch(oxp_tablet_mode_input, SW_TABLET_MODE, true);
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	input_sync(oxp_tablet_mode_input);
+	return NOTIFY_OK;
+}
+
 /* Helper functions to handle EC read/write */
 static int read_from_ec(u8 reg, int size, long *val)
 {
@@ -948,6 +1020,7 @@ static const struct hwmon_chip_info oxp_ec_chip_info = {
 /* Initialization logic */
 static int oxp_platform_probe(struct platform_device *pdev)
 {
+	bool keyboard_attached = false;
 	struct device *dev = &pdev->dev;
 	struct device *hwdev;
 	int ret;
@@ -965,6 +1038,33 @@ static int oxp_platform_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	switch (board) {
+	case oxp_x1:
+	case oxp_super_x:
+		oxp_tablet_mode_input = devm_input_allocate_device(dev);
+		if (!oxp_tablet_mode_input)
+			return -ENOMEM;
+
+		oxp_tablet_mode_input->name = "OneXPlayer Tablet Mode Switch";
+		oxp_tablet_mode_input->phys = "oxp-platform/input0";
+		oxp_tablet_mode_input->id.bustype = BUS_HOST;
+		input_set_capability(oxp_tablet_mode_input, EV_SW, SW_TABLET_MODE);
+
+		ret = input_register_device(oxp_tablet_mode_input);
+		if (ret)
+			return ret;
+
+		oxp_usb_notifier.notifier_call = oxp_usb_notify;
+		usb_register_notify(&oxp_usb_notifier);
+		usb_for_each_dev(&keyboard_attached, oxp_find_keyboard);
+		input_report_switch(oxp_tablet_mode_input, SW_TABLET_MODE,
+				    !keyboard_attached);
+		input_sync(oxp_tablet_mode_input);
+		break;
+	default:
+		break;
+	}
+
 	return 0;
 }
 
@@ -1005,6 +1105,9 @@ static int __init oxp_platform_init(void)
 
 static void __exit oxp_platform_exit(void)
 {
+	if (board == oxp_x1 || board == oxp_super_x)
+		usb_unregister_notify(&oxp_usb_notifier);
+
 	platform_device_unregister(oxp_platform_device);
 	platform_driver_unregister(&oxp_platform_driver);
 }
-- 
2.55.0

