Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B404C6F1E
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854601; cv=none; b=T5JRgqt0YFVuEoocGp3F1O4UucIRr2bf1hGJa6J8Leho/NpbwYwYRQD+UW7B5c6Nzo4zfzFJylIM+nI8WsxwrLnjll56Ex/GQ4Jjx5PvTMFi/Hfm3qUDXyQEjBV4MZUBXHIFpJKyRY9s7JnVw/72+ksWm55nhcCGoZJx/i0Yv/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854601; c=relaxed/simple;
	bh=i8e0I6RT2NONCVQGYcI7HSF2J5hymZ9G7KDgcwIVJs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYCbA8zMD8mWZGshuuJM41MORcyGIE9GR/wbhVj4N0vVyf0Jl6x18ZB5QanwqQ4rOaZ1nHlqQm46t+EzLWktRu7h+imr6lMt27mgDuWWoLAD8ALDQFQjREPUWJVVcaZycuLhEhgWsiUX7GannKa1J8g9Qf3KQSJy2uODU4ubnr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qG29QBK0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qG29QBK0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f71156e1aso56719f8f.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 11:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854595; x=1788459395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kfaoFfZK2/xecQPRSoVdIJikE1e/m//LU0wNhG2/Zo=;
        b=qG29QBK0EvYwnpgamq5yEv3cxLjpYEiA4jre+resDAFnQt6+lMp0u/ATbTo1tKoXH4
         8crVkcGXezRui38P7GqB50lUk7VSscTg85YHO3pwFbzqrnK5aOho7B6POYU9HJkagdLW
         +EYJ3hbSvpnjQJAIjwxtmT0CUM9pGOQTUseNAddHxOlI9cv8iaG0TeR3gnagTij6UO7S
         xkKyWyi4j/umau27K2AMseK9RySi8npNOKcjpC/Huo00k6hBc+8Q4kn2weeJmFfRn0CI
         jsoHz0BRVsIwIyJB7vIZP6F/IoAbq2eNMJ2KbKYO+sM9etRDRKmZUeza61FPWt1iJm46
         5Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854595; x=1788459395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kfaoFfZK2/xecQPRSoVdIJikE1e/m//LU0wNhG2/Zo=;
        b=pOfsqzfU15zV1NNDUhi5mxgFso7fe+xcFZsoeiq3x0KQZbyBb0qBNWlg8Gn5UXxN3i
         8i4qBq8/cF9RLmo0TnEC8DJd/Cfyh586rrzP6+pXIgin9ZPO8sXPaRJkqXJDh2uVbfxt
         QfzzAYZEwUIKg2SkrNBPVMlJGcKX7x9pE0glOrsgPYChLX3Yz6PBrvHNuTnoPtvzYv5y
         lj+b57f849HNi3oBDEJRI4f77mrR24WAT9gwx8m5gnRRVb3Z6b1/ZUxtEQ1A/03aZpYW
         3BreY6MzxJNeATs62vNrv/rnorrNvzTJLov7oZlGQ7MKBp4JrdLEFeanyachf/ohTZ39
         IDfQ==
X-Gm-Message-State: AFuF++nVJQ+rFd0B4mG92IJ3tjBg8/cYIYltMzn+vGBu5ITJKfs573dE
	KiDqFCMrEctBKTs19BaArTNC9513b42TLpeKQtxkHdhTxVzjn19eQY4KMov7vyvt
X-Gm-Gg: AR+sD10GJDqMsbiXgPR7gXpfSZdsR0LU9I5eMMvCK67b80gOwzafoF1empKGUVLLXzx
	D18gtFikIN2Jw80HuXyRJ3hLqChop7EJCCFhmBvWX2yxBgjKVvXP1tqhrlKAw+1fHQTDmgIQZO1
	aA9zC1gZHspNtNmBowPMnW1WLSz6bQK8QbzBsmB2JeThbgc2yLz1T1xWpNU+R4KxWadqV9XYnTk
	Esr9ft9uNFBPZbxxVeHcnS1ShcKqHWFDQiNhcaEcFf/mqBGh4BollFYztbm1pYdde4ePZ/BKyZz
	F44gHDBGiYY0xw6E6mtGPNWWGFac4m90YmXam/D90VnJYFqjwe2Kkn1WR8iM3O3gdwx/J4qKHTt
	23NCB79QORaooE2Aeg/RQYsM0d3xENOjwfPrdM5QtMjv+OmzZyV89mBCTf65aedNJQy04SiuuG0
	LKYxb7rrLSorHUHjFeqkLb71rmn4wsA4P6WeIacdZYO09gIm/xVGZKtUk7IjbNesoUNSzXmsWHn
	VOGUY57dNtoq/8mu7uobuDQzU/hWP8WJnifAuf+qbnE
X-Received: by 2002:a05:6000:18af:b0:482:9dc6:16c4 with SMTP id ffacd0b85a97d-482f798ba02mr1260549f8f.1.1787854595208;
        Thu, 27 Aug 2026 11:16:35 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbf33sm11328702f8f.23.2026.08.27.11.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:16:34 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 2/4] platform/x86: x86-android-tablets: Describe Yoga Book haptics
Date: Thu, 27 Aug 2026 20:16:25 +0200
Message-ID: <20260827181627.2427880-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
 <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
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
Assisted-by: LLM sparse
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

