Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44C6282F3A
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469028; cv=none; b=I3fESxyPlUtLr+ifGA9cl1aKm/iC1Y5rXHbRQBN6/GqCBvCEcQYCXWv9NludwbRbEsS+v6OhE6CaPaB55GXkzgr6CaiS5m/boCB/UmlD8nhySmTvgD+V1iy+6B/L3NaGNDTjP6G1nHwddZptSGVEiT1Q2c2cn9iJEit3qRWh2JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469028; c=relaxed/simple;
	bh=6LkRSSS97o3PcrNWhZzAVREbEPHBDuko3wAt6mgzEO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eDVg9ETxBnklqIO/hNGX6fTiSigE74vMXFNg26vmfWfLXo0W6TkRfZo+W5ht6Wq/RKwO2mTNpD4fLiCSM8oyTeezhUVAiLmyMiTUzxWiEWtFP4+Y4Cizj8o+4GG3FHcMdKzHKkZ6+CUOcROMU7PQo/DO1VkFYU7wrmHCRXHw/LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niigwbWk; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niigwbWk"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so1357840eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2026 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469026; x=1792073826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AL+Se8ubZFFd0YcKW6Z2MhQohg4JMwqY1/Mhy4NKfac=;
        b=niigwbWk8TufxANbvlWUJ20BZ/AKURclP9JK9v97zqd/H5jRpBwIn/3TiCga/W0bZj
         p8+TghMehmnMvO9vh0ZRfs+bzWrVK5rqzCz6TXiAZxa1Iw1ygH2uQqogy8ZyIzOUlvdu
         OXTxOHFT10J4QHm1XvU3xXl9WHLiw1fyKQOixJMyfi8aDUuJFbv/HD4MlTqiGfb6F/Fx
         CAYpvDCmi5PzBjuvSp9btMEixK3C8umwtoahI0d8glQQakIV11qU89lk/jB2lVPcCJ2n
         MakiRFbSt/OEqvBnya3Nj6GH2kTSfS1P3pV5N0+VkXIRbvSVeYqKIj6PAQ3MxP7vtMgv
         Gr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469026; x=1792073826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AL+Se8ubZFFd0YcKW6Z2MhQohg4JMwqY1/Mhy4NKfac=;
        b=mqHmXAyhiulxc5cxPPA/mRqRc8Y9RkrQOu2pHdv06ivZUex2nDh1x/H7Cy6WLFTmqW
         yKTHDm52AtyExDbXOfxieE07XIlCI+aGNsr/A8YDj9bKhefn1+Lr8qttKSmvKWaie3jO
         EbecPB2ap2yuOK5TgNBJsgP/SY4XReiC57iq6amuONXPbZNhXdyqmUyvkEfsVwaHUa6F
         CmPU5R23mkEg15VF9IJol0+bJs8OXkrnghsyCOtIoDre8Td3QEimiJnvdwWZGvLXqqlP
         77v33r/RfTkkj/oWXpLzio1IrKq97LKlTmNM7/D9N/tGoRA2jFkph86nN7QH2Dh02RPf
         iyGg==
X-Forwarded-Encrypted: i=1; AKwUvBzqB/yry5JZ+EdD19OneaBuj734KzTpzZTSKbkVo4QcV7WP52ONqBUTKobs0nx6t48DTFVJjh4Kvtf6nd/pXoqdcFPW@vger.kernel.org
X-Gm-Message-State: AFq9FYKcENS/ks2Hc+p6Gd9fk6dJ78VNRWaSjyAMqYEUyAc9CKeWepwn
	jLyQQfpeD7Yy3dJeC2nTEyOYX8pLShb6ct+hc9ahrgH7cViYXTgCQ0dI
X-Gm-Gg: AYBFou22qOXyerXOql+4DxvnLjz68EbXi/FJUaRgxV9QyDDzhCIvRiMiGqU5xGrP3wY
	j0FAjIN4sL3yx8dnP+GEl0r8l+pn6msDn5OFzEYaObGK7e4vMTyDwyxa78ZEIU3gAzfa4KwQv1J
	IvBwri0PRvKIMzegGumQs47OxJb5VL6I0OGXNOcrA9L21oZVc7EFGTYoE6vlwYynymATV4LB03O
	HJDpy25YmrhYHN+rwDGuIa9EIsyZ7g1l+MrLHIvQ2+FBJL9Q/ILdcn3ktXe510A+dJQ/A0doJiJ
	1p8GWQkA6/Z2NpdmWjqcmS4hsOZf3L4EAdI85bRCaaN2DK29Yvkl2BjKnbPLmkO7BCZ7LrmYD4e
	Y+d0kBNSCfTZe/eRvje/Dzv9104zMLMruIJCkyE8tWSgzbX8thC1bMPYH2WAQRf2fki9dZHiLx4
	MWJyN7CdfMEPbVuBJ6fZPHsRpgFVlWyc5xDR2piJUJQIZty1XJtCXCB+WET8jYZ8bUo6Ae6hzTe
	cqnLk1dKe1kwQPj4TjXaEFBi8k=
X-Received: by 2002:a05:693c:60d2:b0:33c:19bc:d8d2 with SMTP id 5a478bee46e88-3515de8abbamr8804457eec.31.1791469004955;
        Thu, 08 Oct 2026 07:16:44 -0700 (PDT)
Received: from chitransh.. ([2401:4900:93b6:52b7:1d00:31fa:91f5:d431])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb5389sm18012753eec.2.2026.10.08.07.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:16:43 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
Subject: [PATCH] platform/x86: dell-uart-backlight: fall back to PCH PWM on UART timeout
Date: Thu,  8 Oct 2026 19:46:10 +0530
Message-ID: <20261008141610.42894-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
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
  - OptiPlex AIO 7410 35W (01KP8D) -- timeout, fallback activates, works
  - OptiPlex AIO 7420 35W (0914RT, old BIOS) -- timeout, fallback works
  - OptiPlex AIO 7420 35W (0914RT, new BIOS) -- DELL0501 absent, driver
    not loaded, intel_backlight works natively (no regression)

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 116 +++++++++++++++++-
 1 file changed, 113 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..a2045e6c49bd 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -13,8 +13,10 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/serdev.h>
 #include <linux/string.h>
@@ -50,6 +52,11 @@
 #define MIN_RESP_LEN			3
 #define MAX_RESP_LEN			80
 
+/* PCH PWM backlight registers relative to Intel GPU MMIO BAR0 */
+#define PCH_BLC_PWM_CTL		0xC8250
+#define PCH_BLC_PWM_FREQ	0xC8254
+#define PCH_BLC_PWM_DUTY	0xC8258
+
 struct dell_uart_backlight {
 	struct mutex mutex;
 	wait_queue_head_t wait_queue;
@@ -64,6 +71,11 @@ struct dell_uart_backlight {
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
@@ -267,6 +279,97 @@ static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
 	.write_wakeup = serdev_device_write_wakeup,
 };
 
+/*
+ * Some Dell AIO models (e.g. OptiPlex 7410) declare DELL0501 in ACPI but
+ * have no physical UART scalar board.  When the UART times out fall back
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
+	struct backlight_properties props = {};
+	struct backlight_device *bl;
+	struct pci_dev *gpu;
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
+	pwm->mmio = devm_ioremap(dev, bar0 + PCH_BLC_PWM_CTL, 0x10);
+	if (!pwm->mmio) {
+		dev_warn(dev, "Failed to ioremap PCH PWM registers\n");
+		return -ENOMEM;
+	}
+
+	ctl  = readl(pwm->mmio);
+	freq = readl(pwm->mmio + (PCH_BLC_PWM_FREQ - PCH_BLC_PWM_CTL));
+	duty = readl(pwm->mmio + (PCH_BLC_PWM_DUTY - PCH_BLC_PWM_CTL));
+
+	if (!(ctl & BIT(31)) || freq == 0) {
+		dev_warn(dev, "PCH PWM not enabled by BIOS (ctl=0x%08x freq=%u)\n",
+			 ctl, freq);
+		return -ENODEV;
+	}
+
+	pwm->max_brightness = freq;
+
+	dev_info(dev, "Falling back to PCH PWM backlight (max=%u current=%u)\n",
+		 freq, duty);
+
+	props.type = BACKLIGHT_PLATFORM;
+	props.brightness = duty;
+	props.max_brightness = freq;
+
+	bl = devm_backlight_device_register(dev, "dell_uart_backlight",
+					    dev, pwm,
+					    &dell_pwm_backlight_ops,
+					    &props);
+	return PTR_ERR_OR_ZERO(bl);
+}
+
 static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 {
 	u8 get_version[GET_CMD_LEN], resp[MAX_RESP_LEN];
@@ -300,18 +403,18 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 
 	ret = dell_uart_bl_command(dell_bl, get_version, GET_CMD_LEN, resp, MAX_RESP_LEN);
 	if (ret)
-		return dev_err_probe(dev, ret, "getting firmware version\n");
+		goto uart_fail;
 
 	dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + RESP_DATA);
 
 	/* Initialize bl_power to a known value */
 	ret = dell_uart_set_bl_power(dell_bl, BACKLIGHT_POWER_ON);
 	if (ret)
-		return ret;
+		goto uart_fail;
 
 	ret = dell_uart_get_brightness(dell_bl);
 	if (ret < 0)
-		return ret;
+		goto uart_fail;
 
 	props.type = BACKLIGHT_PLATFORM;
 	props.brightness = ret;
@@ -323,6 +426,13 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
 						     &dell_uart_backlight_ops,
 						     &props);
 	return PTR_ERR_OR_ZERO(dell_bl->bl);
+
+uart_fail:
+	if (ret == -ETIMEDOUT) {
+		dev_info(dev, "UART backlight controller not responding, trying PCH PWM fallback\n");
+		return dell_pwm_fallback_register(dev);
+	}
+	return dev_err_probe(dev, ret, "UART backlight communication failed\n");
 }
 
 static struct serdev_device_driver dell_uart_bl_serdev_driver = {
-- 
2.43.0

