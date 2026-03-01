Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11F430DEDD
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772402607; cv=none; b=oj7iTi/hz6GlcLysOtDE6vUZzUuaxM79yJqliv3X6dtugpiI4E8dE2V7685uPcKvSP1b11rhsFZoh+C+GQsg+S3qc6fBHy4eKYoDgOqSh+shOpAShBo/iFK8Badt46d06FV/+/B6OjGqJ/b949kVvm63NuVLJ41ZqBJjY2R6jyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772402607; c=relaxed/simple;
	bh=VCylgZQncSyqoN7C8ODKltxOZWN/lxoFBdaBnVHoaF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KL8LjEzVb+jqvGHUJuR4cRHYhQzrZwbK+dNvGCdMhkATcuzvyUY+RKGmLz2hluYE4MCOsy5zG0SuIjLpwC4z1asLkBC+hN3aB2gZYsaw5TZzeyIxPhkG8secYIR2yPf+Sspi6AoBW+YNNNdYpueDFiMO7HD9R72TNP5QS96q3Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFzumPYO; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFzumPYO"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8f97c626aaso677440966b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Mar 2026 14:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772402604; x=1773007404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yui3ymFCyEpHiRs8FdVnaFqpQEU0+fBY2RWoLXUjTXo=;
        b=hFzumPYOkzts82bYPg54v8QcXZNm3kfhtm9gWZbys1EATbWlwoNccnPpkCLG/+TMJf
         WQiWNMhy6hQatVseLIOVJ2gSqIVxZrTbnLVONlFfCDj2a48ZgPi5NQODPd8KE7sKBf/1
         h8fmYpaj12YUo6D40gXX4g9BU8ryMDu7/lBXGTS0XCklcr11oWjFhUlBamvhYOrGvA+Z
         etMYrCuFnaF0JHGVnFKQ9mGRWP8qvildeXAh7LwhSiailGLc1R+piUeTZuoRLE0XV7wv
         y+T2gZd5RVx4dBnV6TnuhzB4WUJ3FHXaEKnvDrCiJahmw3IYKaZsXwzC5kHqSZWCCbpI
         4dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772402604; x=1773007404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yui3ymFCyEpHiRs8FdVnaFqpQEU0+fBY2RWoLXUjTXo=;
        b=YQdYe2mKojlrJTwuE6hlj8wijnYOLzP44TuWma3d/SRQiURr54jlXi/t89AmJ8eLP4
         Un9JRnGarMdbxnyL88ylZJr+tANLWzFmOtpsdRsOnusWmX3AWOhnanzv9ZojKjD8U6Q8
         CWeEalm9o2XSf7R0dIRAmOevepgMwPEDLqmojCzDvJsNYQzDepAn68VJbJkr1yuMbP1+
         r+IZ55qsTNouQk09Pxr6xElNrobGEQW8nU0W6YZOCfg+Gd0oin5zhHMoOAbVDz5J1vqj
         baZMqmLZ2hHXmppMRujC+FHgZg4+tTJX/4ba1gwHfey7Wx5O97nIP8AqVSLJX6PeuSZV
         wt7A==
X-Gm-Message-State: AOJu0YzkWgUGUcAh7NwamwnKrdZD/9iat+224U9HawBTAN8Cd293KR/g
	Mg+nXhcohQizwcVOtCxssnW+SrJpO1bsXhtWGm/DpGugiYHRTcAtLC9iCFShLQ==
X-Gm-Gg: ATEYQzzAVlcwSLSznH4HY1R4e54f/sY6vql0y/dwmD0cc+04cdyz1Dj8kdxQztI/Xli
	qtTWizhndqf+pYNX7/qU5OW8Q9SklLwnFzTsa63JmyDbpw40rGhVstne9XOgOXTaTCdeyZknIEg
	kRTZQPNmmIVdx92kzWxpiMb9l9AR7aArzaHlViIj0o+TiN3JDvq5JpaTVn73XSey2xQQdLJpR15
	ll3jArKLqwc2Ntomz+ZWEBFZUh8+6HldutWt8t0Uo+vJvfgtka0aiiTZQul2dkYxTQbYUTVkPet
	4i0cTj9viIlGOVOC00CrHCJ5dTb8r5Nd3oomNjEqtMfLutNj9Cu3Y7rtOmbTno1L4xBCbdCFPVE
	ogcMH6rJCZPkUrUSVGNoHNMEyyZzyy2Cud5WMzKAMXqZUMliBi3tci3yLK6JcfoJ7fSs9nf7SKn
	K9tKmvacxQcE682fIeHQ==
X-Received: by 2002:a17:907:787:b0:b87:718:5da2 with SMTP id a640c23a62f3a-b937637a69amr618761866b.1.1772402604183;
        Sun, 01 Mar 2026 14:03:24 -0800 (PST)
Received: from [127.0.1.1] ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13593sm400915866b.3.2026.03.01.14.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 14:03:23 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Mon, 02 Mar 2026 00:03:14 +0200
Subject: [PATCH v2 1/2] platform: x86-android-tablets: lenovo: Add Yoga
 Book haptics entries
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-x86-tablets-yogabook-v2-1-061768d5c9e7@gmail.com>
References: <20260302-x86-tablets-yogabook-v2-0-061768d5c9e7@gmail.com>
In-Reply-To: <20260302-x86-tablets-yogabook-v2-0-061768d5c9e7@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yauhen Kharuzhy <jekhor@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772402602; l=4650;
 i=jekhor@gmail.com; s=20260301; h=from:subject:message-id;
 bh=VCylgZQncSyqoN7C8ODKltxOZWN/lxoFBdaBnVHoaF4=;
 b=y6G0p/4K216nvriq4dcLopQcMSa2vhPdx8VBYjiZjyPMWt4zX2JsrzAjrik2wZ90PONKydrty
 l6z+2S1y2ksCcnw4p2OU13Hz5h4ZtBmnd6tQVtuPpIPOnk4QxDh7qqJ
X-Developer-Key: i=jekhor@gmail.com; a=ed25519;
 pk=C/csaZJs7UBNDgeJcUAmPu4ntqNeaZ3BKfBQiH8tuGc=

Add drv2604l i2c_board_info for drv2604l haptics drivers present in
Lenovo Yoga Book YB1-X90 and YB1-X91. Set properties required for device
initialization and self-calibration.

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 92 +++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 8d825e0b4661..bc10f00da8c6 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -10,6 +10,8 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/cleanup.h>
+#include <linux/device.h>
 #include <linux/efi.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
@@ -114,6 +116,32 @@ static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
 	.properties = lenovo_yb1_x90_hideep_ts_props,
 };
 
+static const struct property_entry lenovo_yb1_x9x_drv2604l_0_props[] = {
+	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
+	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
+	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[0], 79, GPIO_ACTIVE_HIGH),
+	{}
+};
+
+static const struct software_node lenovo_yb1_x9x_drv2604l_0_node = {
+	.properties = lenovo_yb1_x9x_drv2604l_0_props,
+};
+
+static const struct property_entry lenovo_yb1_x9x_drv2604l_1_props[] = {
+	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
+	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
+	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[1], 47, GPIO_ACTIVE_HIGH),
+	{}
+};
+
+static const struct software_node lenovo_yb1_x9x_drv2604l_1_node = {
+	.properties = lenovo_yb1_x9x_drv2604l_1_props,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -159,6 +187,24 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
 			.polarity = ACPI_ACTIVE_LOW,
 			.con_id = "wacom_irq",
 		},
+	}, {
+		/* Keyboard haptics driver */
+		.board_info = {
+			.type = "drv2604l",
+			.addr = 0x5a,
+			.dev_name = "drv2604l.0",
+			.swnode = &lenovo_yb1_x9x_drv2604l_0_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* Keyboard haptics driver */
+		.board_info = {
+			.type = "drv2604l",
+			.addr = 0x5a,
+			.dev_name = "drv2604l.1",
+			.swnode = &lenovo_yb1_x9x_drv2604l_1_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C4",
 	}, {
 		/* LP8557 Backlight controller */
 		.board_info = {
@@ -283,9 +329,55 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 	},
 };
 
+#define YB1_X91_DRV2604L_0_DEVICE "i2c-DRV2604:00"
+#define YB1_X91_DRV2604L_1_DEVICE "i2c-DRV2604:01"
+
+static int __init lenovo_yb1_x91_init(struct device *dev)
+{
+	struct device *drv2604l_0_dev __free(put_device) = NULL;
+	struct device *drv2604l_1_dev __free(put_device) = NULL;
+	int ret = 0;
+
+	drv2604l_0_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
+						 YB1_X91_DRV2604L_0_DEVICE);
+	if (!drv2604l_0_dev) {
+		pr_err("error: cannot find %s device\n",
+		       YB1_X91_DRV2604L_0_DEVICE);
+		return -ENODEV;
+	}
+
+	ret = device_create_managed_software_node(drv2604l_0_dev,
+					lenovo_yb1_x9x_drv2604l_0_props, NULL);
+	if (ret) {
+		pr_err("error: cannot create software node for %s: %d\n",
+		       YB1_X91_DRV2604L_0_DEVICE, ret);
+		return ret;
+	}
+
+	drv2604l_1_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
+						 YB1_X91_DRV2604L_1_DEVICE);
+	if (!drv2604l_1_dev) {
+		pr_err("error: cannot find %s device\n",
+		       YB1_X91_DRV2604L_1_DEVICE);
+		return -ENODEV;
+	}
+
+	ret = device_create_managed_software_node(drv2604l_1_dev,
+					lenovo_yb1_x9x_drv2604l_1_props, NULL);
+	if (ret) {
+		pr_err("error: cannot create software node for %s\n",
+		       YB1_X91_DRV2604L_1_DEVICE);
+		return ret;
+	}
+
+	return 0;
+}
+
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
 	.i2c_client_info = lenovo_yogabook_x91_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x91_i2c_clients),
+	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
+	.init = lenovo_yb1_x91_init,
 };
 
 /* Lenovo Yoga Tablet 2 1050F/L's Android factory image has everything hardcoded */

-- 
2.51.0

