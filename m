Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37A41FB3
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314883; cv=none; b=tYGbcqA7Olhte+G7pLmK43kpFndm7GvOkjbYlJDJlwV+T8dS7Ibl9uTfzHGI6ICQnECEjCFy/jgXCLlNNSm32J+WLl1w6wiHt/slqk9aPKb18z3vOInWnN2Rpl1BXtmUUFO9xxgrgOGqKQPPbiJxA6wOXYY643nBFnNlp68Y+vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314883; c=relaxed/simple;
	bh=0DLzpEtHZA6Kz3HisW/bXaIUn5lQH5Tx0fJOslzEo4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qv5GMOM5spDF+KEJrPKt9BN2hTj+617oV6u4ggjZh1BTZ2Elkj4YRWMUOPyxzRoewOAnQsPT00dNyRdNxj6o/nF7W8q4v6oVNjnrmDiZ8HjVl+eg8go47ddgWN6yyYUdBL3dXB6gpDtczK95tdMJ4Ly+vYn0ENHwsxCBEa+hobc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tILZgu2M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tILZgu2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB21C4CEF0;
	Fri, 19 Sep 2025 20:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314883;
	bh=0DLzpEtHZA6Kz3HisW/bXaIUn5lQH5Tx0fJOslzEo4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tILZgu2MypO/zu/4DzBiZ5lMchdFLBnc26zFVYUBCwVR6fz4N0D6jzYLwfwyjQN2n
	 F2pNcViNGLZNS2iggrhWjjPlDo3+1aocJmsFu0GGL6Jsx21PyLlVA3pr8QvgNVUhqH
	 zLki45zK0gnso6MAijNrY/KNMG7oL4d0fKCv/fNM5HkqGJwKk/8rdpgeA24n/hRrEN
	 t987K8LTPKWEo4oeab4klCUiXR87+2+oEkVKZ5/XXEkApeWR22cPRhGPVaahbLOYmI
	 CIoTWM9OXqADtOXPaH+FQl7ltnAj1Fg/iypy8EeJjG1cmTpIu4wnTZaCnc9bTVIVEc
	 S4YQkxFfQVh7A==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 10/19] platform/x86: x86-android-tablets: remove support for GPIO lookup tables
Date: Fri, 19 Sep 2025 22:47:33 +0200
Message-ID: <20250919204742.25581-11-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919204742.25581-1-hansg@kernel.org>
References: <20250919204742.25581-1-hansg@kernel.org>
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

