Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902113806D6
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627658; cv=none; b=EvskfWZ5mqMSo83mQjQ9ewZli+1Ag12ilnqTcoTtL/EF6wvxBc73ChJLluptAx2kkyyV3LpAVKNIkXE/pA4CwndGFoQER7yOhm/9m+j/c5R+gW10+q8CQr2Ey3CsVbIwMJ2mWU5ZvIPp3zwDHeqfLPCQ49+sn7BSHBRde6KEvIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627658; c=relaxed/simple;
	bh=jR3g2LEs6PZpulT7IxU4LSKN5CIY7gOIB8OtU+If5i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5/z1UEoCQVzCLRvnSpXDsoKaD/uK3sLfMSJlqSFidulXzcQEeXjzsPobKewlsdzC0PbpMGx6ffupM3asa5/k45FaHBp8yKf9ZNV60UqeLQ6ecstRd4lz0HQ7XiNuOo2xq3flFchoepDKEygV5OFwEFU0+9R0Jyx6Cwq5srofak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJNJzqPV; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJNJzqPV"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15756f82e8aso2759019c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627656; x=1792232456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JE80p0aKkjW4uC1WzGsP+ZY/2cS53zFB3ufUOEOIpkQ=;
        b=GJNJzqPVPTLuHSQMqX8xZEHbljz7hQ3Ho0A2r+7GrRhft8zYAHApMAUYeE9a51/Elv
         H7MUSCH+A2bNtpS0pEyFnkJZeexVCiAExH+8Y5B/3xNNiiZ1XTZr7818DlUrC0HpUBDb
         lpPpCM2pUcmM+1l23ip3djIFJ1lR31HR0NoXYxiaHhb3A0pDAEeIHUv2/0ymA3Iwvda3
         pziNcO+JOm9JEnP21hnad97gDVhQ+suonbENThTnOsfV/2X3J2gHyYfe7THNMnemz9/e
         C6zsjiwK1hzsYhVZrHiJrxeIeV0BvI5on61q3ONt+To8sCU+8awVFWvBSUFyd+iDaL6c
         jSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627656; x=1792232456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JE80p0aKkjW4uC1WzGsP+ZY/2cS53zFB3ufUOEOIpkQ=;
        b=08bHZWjQwBWbfz9umvj1kv2I9RlrKNp0C51GTP/v4Gdo10Muqb0fZfsXSMlAfiDauA
         vYoVREI4JxPHW0505NbDaKbET4v6C8C64HLr5BoD8diLgOlFOJGDTdU1G1wBfRq41und
         0lu1eciS9moHJHJaniqIYbA/ulfNFuNaCMU+rXdFJEfZajWpoKs6D+meF0duoGp6y5Ru
         GMOL8ckyjsKQ1Na5kwGMSi/lEGLv+Y9v7m2POzeQYBzXbzdAXX1QV4P7AUE5CuNb5xu2
         0YoGXevJLdClZAHsMUtXRklEkdzP025zFHe00CQuGVzk6WOQ/g3eJz9l4ffNf14pZzQ0
         wrgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqzyJ1/ToKAYcMPTGLrRRPuQkGCU/GFDhuHKjoa3t0sGuF5E3GXlr7z8Zy+bEQCsxVCfnmWPRu8D71vB/Lc0MDCYIV@vger.kernel.org
X-Gm-Message-State: AFq9FYL5mHhLdF7oU9GEQuTLmOtuAbBF4rkCnvggjgWfLxVg8VNtDy46
	hLc7saauE9mjYl+c1CLeV/8lQnh4PtJPP/ePtD7shSjnohwI+V7Y+pFsaAXPlA==
X-Gm-Gg: AYBFou3RlQ/C2ZEZc/+dkOKiigo771AoS5DxjwaQh5Ebo3jzvdd6WFNt59HULPZYLxc
	J6K5Z19ZO/teaV2ywqfz0n7ZXOXdnlbZslT0FVy8LipuOsBXscakIaohlTAtez0DfUUe1LeFzfs
	X7dqChFwCSQ07rXGVtwnHgymEbJcHNHJRqnXvf0HoYXvGcWGoe61fLNAyjSOd/6doDSDp4dzzWM
	lHOzbsRnnWTvCdlySyzwku7omy+eUxLZMDziEBAGsBWc3CwNgt95eRgcIDnnxvhr3tM1XO22Egj
	qyfk6x7Jtb/cPqtNP9DabXxTpSjIQzuD0Mjc1HQfs2jcEjUdXP7Gjq6bUZT/iI4zknDRnJg4c6y
	MnrdLstJ5UeNqgtKAg41skkcmLlGRX9DM+HJg/k8U2L/d6mIrGpzFma1mFNC+9qoFKL262BmqvA
	Fza0cstLsCVuOnINrUnVElwQMnJNq5Xws61y0CVz526TYglNi3JMBnToLKuvivk8bXfWx/BebX9
	brtJXNc4/QRnlR/qxrGXQkcrMd6yUAHPmYcaA==
X-Received: by 2002:a05:7022:5f1b:b0:16e:a290:12bc with SMTP id a92af1059eb24-16ea2b0303emr1064711c88.12.1791627656404;
        Sat, 10 Oct 2026 03:20:56 -0700 (PDT)
Received: from chitransh.. ([2401:4900:c920:95f0:d96a:36c9:8c1e:6661])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm12429714c88.19.2026.10.10.03.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:20:55 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4 2/2] platform/x86: dell-uart-backlight: fall back to PCH PWM on UART timeout
Date: Sat, 10 Oct 2026 15:50:12 +0530
Message-ID: <20261010102012.110394-3-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010102012.110394-1-chitranshmandhaniya@gmail.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
 <20261010102012.110394-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Some Dell OptiPlex AIO 7410 (35W, board 01KP8D) ship with DELL0501 in
the ACPI DSDT (status = 0x0F) even though no UART scalar board is
physically present.  This causes acpi_video_get_backlight_type() to
return acpi_backlight_dell_uart, which makes i915 skip registering
intel_backlight.  The dell-uart-backlight driver then times out talking
to the absent board and the probe fails, leaving the machine with zero
backlight control.

A BIOS update fixes this on some models (e.g. OptiPlex 7420, board
0914RT) by setting DELL0501 _STA to 0, but Dell has not shipped a
corrected BIOS for the 7410 even in the latest release (1.37.0,
2026-05-28).

When the initial get_version command returns -ETIMEDOUT, fall back to
driving the backlight through the Intel PCH PWM registers (BLC_PWM_CTL /
BLC_PWM_FREQ / BLC_PWM_DUTY at MMIO BAR0 + 0xC8250).  The fallback
reads the BIOS-programmed PWM frequency as max_brightness and registers
a BACKLIGHT_PLATFORM device so that compositors (Weston, GNOME, KDE)
pick it up normally.

Tested on:
  - OptiPlex AIO 7410 35W (01KP8D) -- UART times out, PCH PWM fallback
    activates, backlight fully functional via sysfs and compositor.
  - OptiPlex AIO 7420 35W (0914RT, old BIOS) -- same timeout and
    fallback, backlight works.
  - OptiPlex AIO 7420 35W (0914RT, new BIOS) -- DELL0501 absent, driver
    not loaded, intel_backlight works natively (no regression).

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610100706.x2lcbo7S-lkp@intel.com/

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 109 +++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index e3b7f1beda5b..15ce637442df 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -13,10 +13,13 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/serdev.h>
+#include <linux/sizes.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/wait.h>
@@ -50,6 +53,12 @@
 #define MIN_RESP_LEN			3
 #define MAX_RESP_LEN			80
 
+/* PCH PWM backlight registers relative to Intel GPU MMIO BAR0 */
+#define PCH_BLC_PWM_CTL		0xC8250
+#define PCH_BLC_PWM_FREQ	0xC8254
+#define PCH_BLC_PWM_DUTY	0xC8258
+#define PCH_BLC_PWM_ENABLE	BIT(31)
+
 struct dell_uart_backlight {
 	struct mutex mutex;
 	wait_queue_head_t wait_queue;
@@ -64,6 +73,11 @@ struct dell_uart_backlight {
 	int power;
 };
 
+struct dell_pwm_backlight {
+	void __iomem *mmio;
+	u32 max_brightness;
+};
+
 /* Checksum: SUM(Length and Cmd and Data) xor 0xFF */
 static u8 dell_uart_checksum(u8 *buf, int len)
 {
@@ -267,6 +281,93 @@ static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
 	.write_wakeup = serdev_device_write_wakeup,
 };
 
+/*
+ * Some Dell AIO models (e.g. OptiPlex 7410) declare DELL0501 in ACPI but
+ * have no physical UART scalar board. When the UART times out fall back
+ * to driving the Intel PCH PWM backlight registers directly.
+ */
+static int dell_pwm_update_status(struct backlight_device *bd)
+{
+	struct dell_pwm_backlight *pwm = bl_get_data(bd);
+	u32 duty;
+
+	if (bd->props.power != BACKLIGHT_POWER_ON ||
+	    bd->props.state & BL_CORE_SUSPENDED)
+		duty = 0;
+	else
+		duty = bd->props.brightness;
+
+	writel(duty, pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
+	return 0;
+}
+
+static int dell_pwm_get_brightness(struct backlight_device *bd)
+{
+	struct dell_pwm_backlight *pwm = bl_get_data(bd);
+
+	return readl(pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
+}
+
+static const struct backlight_ops dell_pwm_backlight_ops = {
+	.update_status  = dell_pwm_update_status,
+	.get_brightness = dell_pwm_get_brightness,
+};
+
+static int dell_pwm_fallback_register(struct device *dev)
+{
+	struct dell_pwm_backlight *pwm;
+	struct backlight_device *bl;
+	struct pci_dev *gpu;
+	struct backlight_properties props = {};
+	resource_size_t bar0;
+	u32 freq, duty, ctl;
+
+	gpu = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NULL);
+	if (!gpu || gpu->vendor != PCI_VENDOR_ID_INTEL) {
+		pci_dev_put(gpu);
+		dev_warn(dev, "No Intel GPU found, cannot fall back to PCH PWM\n");
+		return -ENODEV;
+	}
+
+	bar0 = pci_resource_start(gpu, 0);
+	pci_dev_put(gpu);
+	if (!bar0) {
+		dev_warn(dev, "Intel GPU BAR0 not assigned\n");
+		return -ENODEV;
+	}
+
+	pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
+	if (!pwm)
+		return -ENOMEM;
+
+	pwm->mmio = devm_ioremap(dev, bar0 + PCH_BLC_PWM_CTL, SZ_16);
+	if (!pwm->mmio) {
+		dev_warn(dev, "Failed to ioremap PCH PWM registers\n");
+		return -ENOMEM;
+	}
+
+	ctl  = readl(pwm->mmio);
+	freq = readl(pwm->mmio + (PCH_BLC_PWM_FREQ - PCH_BLC_PWM_CTL));
+	duty = readl(pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
+
+	if (!(ctl & PCH_BLC_PWM_ENABLE) || freq == 0) {
+		dev_warn(dev, "PCH PWM not enabled by BIOS (ctl=0x%08x freq=%u)\n", ctl, freq);
+		return -ENODEV;
+	}
+
+	pwm->max_brightness = freq;
+
+	dev_info(dev, "Falling back to PCH PWM backlight (max=%u current=%u)\n", freq, duty);
+
+	props.type = BACKLIGHT_PLATFORM;
+	props.brightness = duty;
+	props.max_brightness = freq;
+
+	bl = devm_backlight_device_register(dev, "dell_uart_backlight", dev, pwm,
+					    &dell_pwm_backlight_ops, &props);
+	return PTR_ERR_OR_ZERO(bl);
+}
+
 static int dell_uart_bl_init(struct device *dev, struct dell_uart_backlight *dell_bl)
 {
 	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
@@ -327,7 +428,13 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 	serdev_device_set_baudrate(serdev, 9600);
 	serdev_device_set_flow_control(serdev, false);
 
-	return dell_uart_bl_init(dev, dell_bl);
+	ret = dell_uart_bl_init(dev, dell_bl);
+	if (ret == -ETIMEDOUT) {
+		dev_info(dev, "UART backlight controller not responding, trying PCH PWM fallback\n");
+		return dell_pwm_fallback_register(dev);
+	}
+
+	return ret;
 }
 
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
-- 
2.43.0

