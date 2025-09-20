Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D9F269B0D
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398856; cv=none; b=S5cCsdIz6e7JiiVzwv+5b9xISRzKW7gloYMy9cwtYS8w60DnoL3rIPNZQR9xG7KIPGjsFZaq+CmAJ8m9ToU52IAfZz0k9E/2VrsYOaEEGwZamI/3kXyuGwZLeXtg3BBrjT65vKp9txh1QYhcoQb37mOpYvqk9Ga7Q8oVW7KqzVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398856; c=relaxed/simple;
	bh=cLTxmpcxmpDzP7s1ogpMkwyweOWBmQvTwC2tsoV/TVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WEo0c6komJR0S8uVlFI5r6e6zDtBqDYCmsg2PbXLCbN5WccrclOankUzt/3NR73H5Mwq2FLprWlBFBc3ZEoIx498doB3h4k9olQnOfGBkz/fmaOIn837aokObpskDM9c2kqQIEHdedZu7I4muLNvYLRA3JbRiz2c06+D8/6N1oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOvkIjwr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOvkIjwr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E942C4CEF0;
	Sat, 20 Sep 2025 20:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398855;
	bh=cLTxmpcxmpDzP7s1ogpMkwyweOWBmQvTwC2tsoV/TVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dOvkIjwrdiBSharHBjU5CTOK01OlqgkYf929tWZO6CazvVfRczEkXw6G7/nfhy/os
	 McJeGc9k1DGQaYPdVU2Q9wrhNKvDpcRe+M09+dd6CqnMNIXawan/GdjoJKJjCcXLIr
	 NviN/8BuRZ83+dL7x1Z+bartqAH50QL9k/qPBeFs7Xzabu5mCb+DeO4kTgyR6eu4+m
	 R7U7oRJO5hcX0vxAfFYArzG2CIhgTggIZlg5mfdtoIn9A0ubXYrTaxsiMn7EUtgplS
	 rpn4lzuMsOMiZTwIRD9h069tC6VGDLki8WGbBqiVp2KG538BQDGjzKDOhQqLcDInOC
	 9/hmdyGLcdvDw==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 10/20] platform/x86: x86-android-tablets: remove support for GPIO lookup tables
Date: Sat, 20 Sep 2025 22:07:03 +0200
Message-ID: <20250920200713.20193-11-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920200713.20193-1-hansg@kernel.org>
References: <20250920200713.20193-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Now that everything that used the lookup tables has been switched to
using property entries to describe GPIOs, we can remove support for
registering and unregistering the lookup tables.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/x86-android-tablets/core.c           | 8 --------
 .../x86/x86-android-tablets/x86-android-tablets.h         | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 7b5942010c78..1eb59c999baf 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -153,7 +153,6 @@ static struct spi_device **spi_devs;
 static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
 static struct gpio_keys_button *buttons;
-static struct gpiod_lookup_table * const *gpiod_lookup_tables;
 static const struct software_node *bat_swnode;
 static const struct software_node **gpiochip_node_group;
 static void (*exit_handler)(void);
@@ -394,9 +393,6 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 
 	if (gpiochip_node_group)
 		software_node_unregister_node_group(gpiochip_node_group);
-
-	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
-		gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
 }
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
@@ -420,10 +416,6 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 	for (i = 0; dev_info->modules && dev_info->modules[i]; i++)
 		request_module(dev_info->modules[i]);
 
-	gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
-	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
-		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
-
 	switch (dev_info->gpiochip_type) {
 	case X86_GPIOCHIP_BAYTRAIL:
 		gpiochip_node_group = baytrail_gpiochip_node_group;
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index a54d09408866..d037e3962a51 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -17,7 +17,6 @@
 #include <linux/spi/spi.h>
 
 struct gpio_desc;
-struct gpiod_lookup_table;
 struct platform_device_info;
 struct software_node;
 
@@ -91,7 +90,6 @@ struct x86_gpio_button {
 struct x86_dev_info {
 	const char * const *modules;
 	const struct software_node *bat_swnode;
-	struct gpiod_lookup_table * const *gpiod_lookup_tables;
 	const struct x86_i2c_client_info *i2c_client_info;
 	const struct x86_spi_dev_info *spi_dev_info;
 	const struct platform_device_info *pdev_info;
-- 
2.51.0

