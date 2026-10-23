Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=71.18.227.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792727315;
	b=gOqCnL6h+WpNRaM6HmKgjuUO0YiyxZQioawL5pyqli1ccI7WPnc3CWrx4BmETFCTQSiT
	 BzLlSp8Cgz+pJE8zOpr3J5DfBDcCqorz7EafWK+MY7Ft004cvBFBMqQGXxuhejvmsLl3b
	 5KwLjEoR2Nf0fzLS5UImxJ8oJ1ZynZlfo3mclxGxrAFdZ00ZBaYXfGoGzJQ6Rog6uMr3i
	 R5CygX5kWLcirWvC2boNtTDE6ZWGn6ECDbmZWqB8DwKJv0i/0kkycUFMKj9QaVvyhZcag
	 w8gdkm6ydPN9tVUbZRJu+X0tqmr2svtf2ayrye0ixxnHvhvMZIe9ycrNC2uDZp7eXOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792727315;
	h=DMARC-Filter:DKIM-Signature:Content-Transfer-Encoding:
	 X-Original-From:Subject:Date:Message-Id:To:From:X-Mailer:Received:
	 X-Lms-Return-Path:Content-Type:Cc:Mime-Version;
	bh=4RgiMbSfv1Ffg9FSRDhGJXIih2wLIs1zUAkiNv6268E=;
	b=xK/J4Y+HTM538BsCDKLjO1OSDchpOdeI9pqgKulMgnv4iUKCCHNZmnMEqRLV65xmxZXV
	 0Vq/5BI2LBftzF0Tdxs6k97GgzYHDsw6bnMw2A6ENNImJtwU/q8iPW6gDIZf3vX5fbl+l
	 bSXeNrGkNDNTAO6P2t5Xyh41MgmIJJDv+tUECpmHSPvXlVVvZ72gtcziHvRzGHZUn59/h
	 t9Ymin9tn6ba8KfomFF4zrYJPx3AZB+tq8Bqxr5pcUDK1ziT3KLmifLq2t4Wo3LMGQR7n
	 2THfEGUeZ/qWnRJ+CX+RqGmhYZbhHD5cLo9U3CgaYbxVLzYF6tkAJ+LCpvmJxgt8FHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qb.edu.kg;
	spf=pass smtp.mailfrom=qb.edu.kg;
	dkim=pass header.d=qb-edu-kg.20200927.dkim.feishu.cn header.i=@qb-edu-kg.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=uZ+ODgAl;
	arc=none smtp.remote-ip=71.18.227.2
Received: from sg-2-2.ptr.blmpb.com (sg-2-2.ptr.blmpb.com [71.18.227.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51ED606A320
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Oct 2026 03:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A51ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=qb.edu.kg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qb.edu.kg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qb-edu-kg.20200927.dkim.feishu.cn header.i=@qb-edu-kg.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=uZ+ODgAl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=qb-edu-kg.20200927.dkim.feishu.cn; t=1792727307;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=4RgiMbSfv1Ffg9FSRDhGJXIih2wLIs1zUAkiNv6268E=;
 b=uZ+ODgAlJnH/dvMgtgLdjH/8KoFrph5oHb9Lv9hcdt03hIJuTEz5/fvLkTxhu05ll0Mu1T
 +gp18E1VzyEm31a79oVfbiUIoJTERmJKQ2w4zbe6gfX0gGWppS/wfdnztL0U1SIXyrb9Q3
 jvXHI+YBl/8oKi6xap9s5nR1ixWgNrtmxabmJnDUYZWPchWg2ydJgDVv7gf/uaxwdyWTeI
 U3wmYhq2woSUs2JrBZr91RBKdmJ75KhXdnpJrW8Px2PrR9Tx7F76vGl/UvhSNYj1c9lwku
 01J4xuzoY6aeSuMkPuC9XuOYn/G/141UWfaiRksOBOQx5RvN4XYGah11uvBurQ==
Content-Transfer-Encoding: 7bit
X-Original-From: dydydd <admin@qb.edu.kg>
Subject: [PATCH 1/2] platform/x86: uniwill: Add MECHREVO Jiaolong 16K (GM6BG0Q)
Date: Fri, 23 Oct 2026 11:48:21 +0800
Message-Id: <20261023034822.141263-1-admin@qb.edu.kg>
To: "Armin Wolf" <W_Armin@gmx.de>
From: "dydydd" <admin@qb.edu.kg>
X-Mailer: git-send-email 2.56.0
Received: from archlinux.localdomain ([223.104.85.253]) by smtp.feishu.cn with ESMTPS; Fri, 23 Oct 2026 11:48:24 +0800
X-Lms-Return-Path: <lba+26adad909+d6ea76+vger.kernel.org+admin@qb.edu.kg>
Content-Type: text/plain; charset=UTF-8
Cc: "Hans de Goede" <hansg@kernel.org>, 
	"Ilpo Jarvinen" <ilpo.jarvinen@linux.intel.com>, 
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

Add a DMI entry for the MECHREVO Jiaolong 16K, which is built by Uniwill
on the GM6BG0Q board (BIOS project ID "IDQ", EC version 1.24).

The feature set was determined by testing every sysfs attribute exposed
by the driver on the actual machine:

  - fn_lock, super_key_enable and touchpad_toggle_enable are writable and
    take effect
  - the battery exposes charge_types (Trickle/Standard/Long_Life) instead
    of charge_control_end_threshold, so BATTERY_CHARGE_MODES is used
  - cpu_temp, gpu_temp, fan1_input and fan2_input report plausible values
  - the keyboard backlight is RGB with four brightness levels
  - ac_auto_boot and usb_powershare_high are writable
  - usb_c_power_priority switches between charging and performance
  - ctgp_offset is writable

This machine has no lightbar, so UNIWILL_FEATURE_LIGHTBAR is left out.

Tested on: MECHREVO Jiaolong16K Series GM6BG0Q, BIOS N.1.19MRO15,
           EC 1.24, AMD Rembrandt, NVIDIA RTX 4060 Mobile.

Signed-off-by: dydydd <admin@qb.edu.kg>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 26 +++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7a2eeaec..94ed83ed 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2677,6 +2677,24 @@ static struct uniwill_device_descriptor machenike_l16p_descriptor __initdata = {
 	.kbd_led_max_brightness = 4,
 };
 
+static struct uniwill_device_descriptor mechrevo_gm6bg0q_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
+		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_GPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
+		    UNIWILL_FEATURE_AC_AUTO_BOOT |
+		    UNIWILL_FEATURE_USB_POWERSHARE,
+	.kbd_led_single_color = false,
+	.kbd_led_max_brightness = 4,
+};
+
 static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __initdata = {
 	.features = UNIWILL_FEATURE_SUPER_KEY |
 		    UNIWILL_FEATURE_LIGHTBAR |
@@ -2877,6 +2895,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &machenike_l16p_descriptor,
 	},
+	{
+		.ident = "MECHREVO Jiaolong 16K GM6BG0Q",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6BG0Q"),
+		},
+		.driver_data = &mechrevo_gm6bg0q_descriptor,
+	},
 	{
 		.ident = "XMG FUSION 15 (L19)",
 		.matches = {
-- 
2.56.0
