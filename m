Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E49426436
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 22:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788044257; cv=none; b=sC0zTiGzIDcBPGX4CuB4W+1ltE6nmIf5ufXPfj63UUZJ3LS8YG9D5my1tgtD8BXqa6+Ij+CVbJq8O+mzfJ4+MXbzTQ0ygSyOYKpoVWkuvy9hYalHOIrPzC5N+osWBpwitMsaiRaz7Zjdavsp/F03b5SdPcqmaPn03PHvmf+5/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788044257; c=relaxed/simple;
	bh=cjcLOY/D7lVRaByVczqrL5rjjCkLFHF7BPCS1jyPqUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWs9wCZ/4xEZtG7FX3rMPk0hH3RtoPudPxAoJe24iYLTb5CV/LcjCB6WnPpxCg59jUPJYlZjmXfO1A/soIH6ZbmJDUqUm/QHGbcYTdeOaN1XCovSTC/8NmNvXaOp0tC18U6fxxlV9MFP44pXJM5Z/74VpE1OxGmztnqXuUcP+90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXupkFy1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXupkFy1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso23355195e9.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 15:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788044254; x=1788649054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VF9RZeRdjwZZGV5LYrTlCzInFj7A0kFinPR+50b7jeI=;
        b=bXupkFy1rtni87eGI1RobMePPu9r7efs4nLdgTIIBZ8rRHMmOXm0tH7kHnKnnatlI1
         lJG+SGIkVSizP+pPOB81gub5F1o2Ie7KDcX+GbDb7Vt4r/oDsoQA4v6Krw4vz0r3XVFY
         8ZkM+7E9hC1IQiHNDbAeIaaSVU2bNV6pNDPcGJ5x+Lor7M8lsEHZuyCVTTMr6w440zAS
         llpwojUQqW+IXyjPssBFqo5dqatxRk/fJ8nPM8bIWkBPa0e64PEr72vt2vJVRjAsjxpu
         d+T64J7FbHycV4pfGSaZngPy/jvOeAnW50z8twZlLl2a8NdW2+y6SWHaCzK2lAxUjuHH
         wqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788044254; x=1788649054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VF9RZeRdjwZZGV5LYrTlCzInFj7A0kFinPR+50b7jeI=;
        b=a8K/Jh95TsCuwfYwQLgzn+rCVJA1tqBpBiz6koG3d2kD1QHvpGpMM342TfMm3fuApV
         Ch+EZnloxZERMoN9uasPP9OQLdn3P5gVcAdJ5W7/8XPw+PQP3oP4+Iq9OuyPZNW2osL7
         wBP/SJRWm+Dvu9oQ7HrhKJXlStVZB4T0OUqd5B2xn7RkpCwA2t2jwtDCy7c5GhxyoPmw
         hNTlTfNg4MJxBKmbgTJuFMVoUW+uhcouIzD9Mu24TdUWp38gYC9ntV/02Uv4x/CUbgI8
         VFQCZ7M/buj5r2wv2uqZnaAfwPihNj6yQHJZ7fuK8kvUMrjUOe5VU2YUnP/ANa97iamf
         JobQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSMVMdFASo/ZUAhRcgEQ5Rlf7rEjy4ldpzqRZxQ9FMiWvxN6evkYzA/Kw+168QoMPk6Sp8fCJgmG57jElcneFAtLdZ@vger.kernel.org
X-Gm-Message-State: AFuF++m7Ohn3a6vG43DKYP6Cu2nRyCxLYkVfMGypqZarvzRus0vF69AD
	o6Xof3mTydDetLn9lGtaBs+8wroc++V3gEW6DCcFcTwGy5evei9LAA9d
X-Gm-Gg: AR+sD112F2cX+p6NQ9viHjQk1BUNWxEojcwjcKgmboggWWU3ZL+YrwbhMss3ErjDt3b
	Ons/6RsaMKIwddZf3e0ilOPS/b9ueSE8yn0XQV8HwB51YzYKtbp/kDUQiBgTEgvYu3bx7Um4RD0
	H7+y5BggraQJUCwwqeDpaCX0PMyZx688dfoV82KVipPWkTW9JofqQ+TJqnhh98Y9DkqeukUCgh7
	Z+PT8ZzUvEvu+alnXi6Oj574zsBfg8lUI//43JfNHNdy/uXhQx2HkbhDICpecclmYmplqV3m6zg
	I/ogdWbJbTkZLTLB5NG3aAZ1SkGgdarro0ZfHpwg/FF65Bp9hDZFKjZ/dsxZq1uLTdHqfoDGJfh
	+3dYGiBQmu2BjcAHI/kCDpOAaHTLqNHa97jAuThL4WR3dFL7SY1jv133F5DzWZeq+/udKsbbkpr
	XX6+JV46Bzm1o6gOp3+H5xWTqyaM8r6tX+l7ZNQ0wd1DJ1rIh/FG4ksVQQFnJSbBx+empm26qug
	JjcO5Pvt9sPRUJyu9nKmF9xq46DgAzSYBatqmYus04S
X-Received: by 2002:a05:600c:6207:b0:49c:d28f:2cd6 with SMTP id 5b1f17b1804b1-49cd28f2e19mr26580525e9.12.1788044253876;
        Sat, 29 Aug 2026 15:57:33 -0700 (PDT)
Received: from 1Z10 ([37.161.113.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm60751835e9.0.2026.08.29.15.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:57:33 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 1/3] platform/x86: x86-android-tablets: Describe Yoga Book haptics
Date: Sun, 30 Aug 2026 00:57:27 +0200
Message-ID: <20260829225729.395270-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829225729.395270-1-mauriziocasciano7@gmail.com>
References: <apLZF6b3F39z6bUc@google.com>
 <20260829225729.395270-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ACPI enumerates the Yoga Book YB1-X91F/L haptic controllers as
DRV2604:00 and DRV2604:01, but omits the properties used by drv260x to
identify their mode, waveform library and enable GPIO.

Register board software nodes and attach them to the existing I2C
devices. Describe the enable signals using their Cherryview GPIO
providers and pins from the firmware resource tables, keeping this
board-specific mapping out of the generic input driver. Hold device
references until removal, reprobe after adding properties to cover an
earlier built-in probe, and detach the nodes in reverse order.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol [sparse]
---
 .../platform/x86/x86-android-tablets/lenovo.c | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 8d825e0b4661..a8c849ee03db 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -114,6 +114,41 @@ static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
 	.properties = lenovo_yb1_x90_hideep_ts_props,
 };
 
+static const struct property_entry lenovo_yb1_x91_drv2604_0_props[] = {
+	PROPERTY_ENTRY_U32("mode", 0), /* DRV260X_LRA_MODE */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[0], 79,
+			    GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct property_entry lenovo_yb1_x91_drv2604_1_props[] = {
+	PROPERTY_ENTRY_U32("mode", 0), /* DRV260X_LRA_MODE */
+	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
+	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[1], 47,
+			    GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_x91_drv2604_0_node = {
+	.properties = lenovo_yb1_x91_drv2604_0_props,
+};
+
+static const struct software_node lenovo_yb1_x91_drv2604_1_node = {
+	.properties = lenovo_yb1_x91_drv2604_1_props,
+};
+
+static const struct software_node *lenovo_yb1_x91_swnodes[] = {
+	&lenovo_yb1_x91_drv2604_0_node,
+	&lenovo_yb1_x91_drv2604_1_node,
+	NULL
+};
+
+static const struct software_node * const lenovo_yb1_x91_drv2604_nodes[] = {
+	&lenovo_yb1_x91_drv2604_0_node,
+	&lenovo_yb1_x91_drv2604_1_node,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -283,9 +318,72 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 	},
 };
 
+#define YB1_X91_DRV2604_0_DEVICE "i2c-DRV2604:00"
+#define YB1_X91_DRV2604_1_DEVICE "i2c-DRV2604:01"
+
+static struct device *lenovo_yb1_x91_drv2604_devs[2];
+
+static void lenovo_yb1_x91_add_haptics_props(struct device *dev, int index,
+					     const char *name)
+{
+	struct device *haptics_dev;
+	int ret;
+
+	haptics_dev = bus_find_device_by_name(&i2c_bus_type, NULL, name);
+	if (!haptics_dev) {
+		dev_warn(dev, "cannot find %s, haptics will be unavailable\n", name);
+		return;
+	}
+
+	ret = device_add_software_node(haptics_dev,
+				       lenovo_yb1_x91_drv2604_nodes[index]);
+	if (ret) {
+		put_device(haptics_dev);
+		dev_warn(dev, "failed to add properties to %s: %d\n", name, ret);
+		return;
+	}
+
+	/* Apply the properties if a built-in driver already attempted to probe. */
+	ret = device_reprobe(haptics_dev);
+	if (ret)
+		dev_warn(dev, "failed to reprobe %s: %d\n", name, ret);
+
+	lenovo_yb1_x91_drv2604_devs[index] = haptics_dev;
+}
+
+static void lenovo_yb1_x91_remove_haptics_props(int index)
+{
+	struct device *haptics_dev = lenovo_yb1_x91_drv2604_devs[index];
+
+	if (!haptics_dev)
+		return;
+
+	device_remove_software_node(haptics_dev);
+	put_device(haptics_dev);
+	lenovo_yb1_x91_drv2604_devs[index] = NULL;
+}
+
+static int __init lenovo_yb1_x91_init(struct device *dev)
+{
+	lenovo_yb1_x91_add_haptics_props(dev, 0, YB1_X91_DRV2604_0_DEVICE);
+	lenovo_yb1_x91_add_haptics_props(dev, 1, YB1_X91_DRV2604_1_DEVICE);
+
+	return 0;
+}
+
+static void lenovo_yb1_x91_exit(void)
+{
+	lenovo_yb1_x91_remove_haptics_props(1);
+	lenovo_yb1_x91_remove_haptics_props(0);
+}
+
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
 	.i2c_client_info = lenovo_yogabook_x91_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x91_i2c_clients),
+	.swnode_group = lenovo_yb1_x91_swnodes,
+	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
+	.init = lenovo_yb1_x91_init,
+	.exit = lenovo_yb1_x91_exit,
 };
 
 /* Lenovo Yoga Tablet 2 1050F/L's Android factory image has everything hardcoded */
-- 
2.53.0

