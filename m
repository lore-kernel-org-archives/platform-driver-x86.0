Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66205262D1A
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 17:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294912; cv=none; b=UgSXhVkRT9FIa9O6R19Ha8zSEkrD5koK/agSjnOq4Rkc/IGdXeo6FRBS0rHTienNCOxtM6A2odJhfIHyDSxMyz76iJYNFUeckBaZEXGKUrcCqQ7uOxARjFrTg0dK2/xUAGUQj0K7tWVfyQNdKoUqH30uDJ7ydCWvMGZGnMLFDJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294912; c=relaxed/simple;
	bh=L2mc7++2m+KbwXPJfmeanEsMndjpINIhEyR+p/vnM+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c9w0kxUrpTB3DYtkNtBsSi7gttKepZo6Q8KcXlmM3TL1WOBMJ2AoL8gjg6M1Q8rzpcnkk1d0nNRTQ+4eWA/qnxcQ8LxfR0ofGHCKyPCl+KQR9QlQuaoWSyOtgSy/fzzBQVJnrvm4h5nVYVx6Vigltkg3IbfFIeXIZDbqUI0nJ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Fnhp/kpW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Fnhp/kpW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dc6d9b292so2497129f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Feb 2025 09:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294907; x=1739899707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRpmne0VBcJf7jZbKVrpAIB9gKqtJmCGDdvQHW0V2jE=;
        b=Fnhp/kpWy26zCmDlS+7E/PqgYtKlUyBQD+13KweG+yCARAV7VOeKs/5/7qXQfz19rK
         +RbI9ZVTxjwyGbJ9b60Ji5Rp4vnyNgs+fjoJhmNEw2E9rekpaqP8U3Nk9tj/nJPxAXWG
         E6uLI6B3T29/RYF9a4ZWrPUy4bfJnx5HRfAba99Q/JhjHXFAJnernIoWpvw3kI9E8l1r
         hOBX0dZTb9fLMElE6AauDmJsYh+sOCjzcZ/Nj5dfQxAxbjAYQrJD08G7k1i5a2eybDUp
         cwBdaZ/2/WgVw5RMhPSYIdf2Ex5qaG318lbSY+05Xr2ubYA2quEyRu1dvmUlB5XC4d1A
         2XGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294907; x=1739899707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRpmne0VBcJf7jZbKVrpAIB9gKqtJmCGDdvQHW0V2jE=;
        b=DYLAZjTPVkDonAIb1eZBg6C1sh1RgFclmOur15kQGlsYNZxE9IGW9gMjsohMzeC2sh
         lk+d8izUBhnOzs6TY5FmneGrVmT0bNTiTyZcMksTZRF6UYkUIB+L+RpTMtdTZFMkBNeD
         2oqwY3k+2Nlca137PF5rwYLeWclh7MCXRnCRyS6mhn+ZGyUk7wmVyrP9nUh2iHUQMEi0
         x+WWoN2kYJjElxfRBtpoQyWyXV5/Jl2Mk6EZcLtqer5nE2JHcYtd5740VKHa7Dx5sGDM
         MdOXGdVB31hyjF/pxPSgIJdx5eAZ3wGSPBNMX+O6rk+4ir703oezUt+BM10qRueIZj51
         hJhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHhpGyrXCHoNdDil0JdSs/eNYxA+u2thrO8wwKQkgBG5IY2sirgcS1cxiblvpB6q4XHvrRHeT7s5qYtaFILL7PfaXX@vger.kernel.org
X-Gm-Message-State: AOJu0Yybu53uh5GiIGtSd1Kwd0lG3wQnMIydgSR5NSAhpR4UooB19ZSc
	E0fiZ9WM/cB7/Tah29bejgsvb/3UFzK7DnnTYx9qYj99vezox3ZooGSKgGiYmxk=
X-Gm-Gg: ASbGncvfCcIBSn2oU3GMcREwQZgurSGfMzaMI8nFu6aqZUc/z3APd4lbSqlyNqgff5v
	E85l48aXAQ9c9K92FesHCI3CZp9H9YSTaS82SqjiZhmVZfPnpiy0NnKtgn4zMp4AWFH7hHPIGB2
	CPhl+n82wW/KNQJtd231vKkzOqf0LpuBVwEae7hfzLA+gVTpHLHUris91vXwhGyxYCT95KZ/KuZ
	tCV3Y8qoEDBgcr53VVuNDuav5JTtv5uirQtMBtGvZ17Ve1sPiahnaqJyDDlDWxeu58opmLGs4w0
	2zYw21f6lgsJVtg8Kg==
X-Google-Smtp-Source: AGHT+IGy2T23PgwDmJGcN14Q/mCFh4UYzD0ptO9o4GXW666CumGfNzzI0RhLancAMnBStTnS1c8Jkg==
X-Received: by 2002:a05:6000:1f82:b0:38d:e1b1:be99 with SMTP id ffacd0b85a97d-38de4193da8mr3997996f8f.23.1739294907528;
        Tue, 11 Feb 2025 09:28:27 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 1/7] driver core: auxiliary bus: add device creation helpers
Date: Tue, 11 Feb 2025 18:27:58 +0100
Message-ID: <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4290; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=L2mc7++2m+KbwXPJfmeanEsMndjpINIhEyR+p/vnM+0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g2Jb64zhGo4nYo4f11I5GNQZEAzlSZ9Yo5d
 ngkcisRo/6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uINgAKCRDm/A8cN/La
 hf93D/9ySJRRpTfhwXJWNiKfMhcJCrBwzYVVixaTTNiJUGMkApqchMSmB0zNWhrawPaDlId3Qiv
 auxx3nD/C8QUQGOe3pmyimoKTtJX68sya3tWzYS13H4Sa0H9qFl2RM0zYZ2KeIfFaB5bXjAyZbp
 8AafPJDeusV3rANuFGpxeUk8OJf2I26NERiAMf4JIeYfEk+DdUX/qaaekow/K+zX0friJeeHzfS
 n3nNP0mPksNRZ70HmTScJgvfPOEIO1hH8exi8I+Ge5RadGPr4ZAvrdduyqDrUcI+eC7Vw/vJkNh
 sW2YMStxssdA3V4ydPTzpH9vn+vlpXW1isL2h2lNUHHsZ6qQneIycJfGJCCYP1GDRky2C6AtPib
 l71wFmbfhXQPTnOmW1byyhQNUf2DG0Kse6unCPxWmU2O+bBwnBvUp3XtMEU/LOPI0MGCpZctNwz
 teda+aTYeFlWq/IRpLHb256e0QTj8OwBd64Y8+cWTJlY3OJswpzqv3zklJ0nKa5VDXQDUjv8dE/
 3Z3LHSVu21jO5GhGjKjzeZeJVnbohnbeTurbB9m0HLLQkVNy1b6qdMD98Y9uIm1F0V6fv5ak8Ji
 vqYRsnbb3UUjcLUi7RMxyNaRwF7lp8opYquywNB5WMkoWzbD21tWKnQOr6ID3hMTihGNxCRzIyH O4UjCmzh9bo+k5A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

Add helper functions to create a device on the auxiliary bus.

This is meant for fairly simple usage of the auxiliary bus, to avoid having
the same code repeated in the different drivers.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/base/auxiliary.c      | 88 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/auxiliary_bus.h | 10 +++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..0f697c9c243dc9a50498a52362806db594345faf 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -385,6 +385,94 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
 }
 EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
 
+static void auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	kfree(auxdev);
+}
+
+static struct auxiliary_device *auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
+	if (!auxdev)
+		return ERR_PTR(-ENOMEM);
+
+	auxdev->id = id;
+	auxdev->name = devname;
+	auxdev->dev.parent = dev;
+	auxdev->dev.platform_data = platform_data;
+	auxdev->dev.release = auxiliary_device_release;
+	device_set_of_node_from_dev(&auxdev->dev, dev);
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		kfree(auxdev);
+		return ERR_PTR(ret);
+	}
+
+	ret = __auxiliary_device_add(auxdev, modname);
+	if (ret) {
+		/*
+		 * NOTE: It may look odd but auxdev should not be freed
+		 * here. auxiliary_device_uninit() calls device_put()
+		 * which call the device release function, freeing auxdev.
+		 */
+		auxiliary_device_uninit(auxdev);
+		return ERR_PTR(ret);
+	}
+
+	return auxdev;
+}
+
+static void auxiliary_device_destroy(void *_auxdev)
+{
+	struct auxiliary_device *auxdev = _auxdev;
+
+	auxiliary_device_delete(auxdev);
+	auxiliary_device_uninit(auxdev);
+}
+
+/**
+ * __devm_auxiliary_device_create - create a device on the auxiliary bus
+ * @dev: parent device
+ * @modname: module name used to create the auxiliary driver name.
+ * @devname: auxiliary bus device name
+ * @platform_data: auxiliary bus device platform data
+ * @id: auxiliary bus device id
+ *
+ * Device managed helper to create an auxiliary bus device.
+ * The device create matches driver 'modname.devname' on the auxiliary bus.
+ */
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id)
+{
+	struct auxiliary_device *auxdev;
+	int ret;
+
+	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
+	if (IS_ERR(auxdev))
+		return auxdev;
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
+				       auxdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return auxdev;
+}
+EXPORT_SYMBOL_GPL(__devm_auxiliary_device_create);
+
 void __init auxiliary_bus_init(void)
 {
 	WARN_ON(bus_register(&auxiliary_bus_type));
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 65dd7f15437474468acf0e28f6932a7ff2cfff2c..c098568eeed2a518b055afbf1f1e68623a2c109a 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -254,6 +254,16 @@ int __auxiliary_driver_register(struct auxiliary_driver *auxdrv, struct module *
 
 void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv);
 
+struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
+							const char *modname,
+							const char *devname,
+							void *platform_data,
+							int id);
+
+#define devm_auxiliary_device_create(dev, devname, platform_data, id) \
+	__devm_auxiliary_device_create(dev, KBUILD_MODNAME, devname,  \
+				       platform_data, id)
+
 /**
  * module_auxiliary_driver() - Helper macro for registering an auxiliary driver
  * @__auxiliary_driver: auxiliary driver struct

-- 
2.45.2

