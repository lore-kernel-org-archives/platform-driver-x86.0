Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAF93321D6;
	Mon, 17 Nov 2025 13:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763385951; cv=none; b=fgF9NoCdYdsmqYTrC+ffO/2sZU0D175GoZTspSNLPg2tXRgpXkjHt1KFPEjrSFKTUGlnRZ/NhsxUnNq4l6lw5WEnS2cUxhKcJvYI2IZ5VKIFb0nhjSmvTxO7B43Pz+z6ZLcFJ4MCMG8Nq9LZjp8D6rSg1kJMVmurn0TlnE1GvG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763385951; c=relaxed/simple;
	bh=YmWX2Gi0OsxOFG7i+Ud/QlWldcMk2r3M6aKvlwYhBgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I2F7yGd7ihXN8i9WK32AwPKMmASDhzE9quIiAwXu72Ohsm7JF1WNUxqv7LJiv+HzNiQlYDROftcwqMCrAmMk9vwO3xhbfxM8PZCOPjLF4JL08Eo2KQe4ATFR5jKgE031+E0I0U+MBt5G15yzXHrI7k0fSPO3rg54jSIiat2rXuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=rG557jip; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="rG557jip"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 890712FC005B;
	Mon, 17 Nov 2025 14:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763385940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09+C2bipGhUKbdKW2J8ftQ4CfjOLsjOqY6OZWYEQ4Qs=;
	b=rG557jip08b5j0jOFo9Jgnr7dk2MmdN/KAJ4GX65/xD3UpdceWvd7fafyDYo9vbQy+5by3
	yMW4jZ5xMYx8ZFQ2RA4JuPj7oa74tsdwzlENOWXF5GOoWGp0ldBgaqSZ4QwbGvEbvUcheX
	zFRORwkohM0RL5vng+NpzO3Ox8+6c0U=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 5/6] platform/x86/uniwill: Run callbacks of uniwill_dmi_table
Date: Mon, 17 Nov 2025 14:24:02 +0100
Message-ID: <20251117132530.32460-6-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117132530.32460-1-wse@tuxedocomputers.com>
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dmi_system_id uniwill_dmi_table[] has a callback field.

This patch calls these callbacks with EC read/write access. It also moves
the supported_features assignment further back into the code.

This enables the callbacks to dynamically determine supported_features
flags based on EC readouts.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 29 ++++++++++++---------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 9412783698685..15a94c256f728 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -335,6 +335,7 @@ struct uniwill_data {
 	struct mutex input_lock;	/* Protects input sequence during notify */
 	struct input_dev *input_device;
 	struct notifier_block nb;
+	struct dmi_system_id id;
 };
 
 struct uniwill_battery_entry {
@@ -1767,6 +1768,7 @@ MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
 
 static int uniwill_probe(struct platform_device *pdev)
 {
+	const struct dmi_system_id *id;
 	struct uniwill_data *data;
 	struct regmap *regmap;
 	acpi_handle handle;
@@ -1788,6 +1790,19 @@ static int uniwill_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
+	if (force) {
+		/* Assume that the device supports all features */
+		supported_features = UINT_MAX;
+		pr_warn("Loading on a potentially unsupported device\n");
+	} else {
+		/* Match is guaranteed, otherwise init would have aborted */
+		id = dmi_first_match(uniwill_dmi_table);
+		memcpy(&data->id, id, sizeof(data->id));
+		if (data->id.callback)
+			data->id.callback(&data->id);
+		supported_features = (uintptr_t)data->id.driver_data;
+	}
+
 	data->regmap = regmap;
 	ret = devm_mutex_init(&pdev->dev, &data->super_key_lock);
 	if (ret < 0)
@@ -1938,20 +1953,10 @@ static struct platform_driver uniwill_driver = {
 
 static int __init uniwill_init(void)
 {
-	const struct dmi_system_id *id;
 	int ret;
 
-	id = dmi_first_match(uniwill_dmi_table);
-	if (!id) {
-		if (!force)
-			return -ENODEV;
-
-		/* Assume that the device supports all features */
-		supported_features = UINT_MAX;
-		pr_warn("Loading on a potentially unsupported device\n");
-	} else {
-		supported_features = (uintptr_t)id->driver_data;
-	}
+	if (!dmi_first_match(uniwill_dmi_table) && !force)
+		return -ENODEV;
 
 	ret = platform_driver_register(&uniwill_driver);
 	if (ret < 0)
-- 
2.43.0

