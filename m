Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C96D3B14C8
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088521; cv=none; b=bzGCNX/KyUeae1Br8lkh7EKmfN+RqJOk294WVKJatrQNLHIGGzlo+nruN9mYl8rjyT91eA0DRJ+1nFa66zLF/keVShd5yxhGayr5wS4ZttKaS63aNyjQfl0KNQeDApeIhqnN6bvxm5K5dD8kjfed8T2PU5MYJHREOnoVIw95jrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088521; c=relaxed/simple;
	bh=eyDDi/hj33KPiiGi1bcVYD+lSsfPmyqoGVEsktLoN4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZTDCHYXIMCBgFMR3gAHbUivpXHijyEF+8Obymq8U5pDdirq8XmO2n+iggnlCaujB2j7yx2iNT4+VkoN2qwGHUjq9WihZQpuXHPk5Rk0o6aJGURjwNSeBqGw/lQa8EMnIIWHpt2L+TFh/hXPjnMnfV4VKWasya3foPzk1U0g4Z7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEd8VzLZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEd8VzLZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2611011a91.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088515; x=1788693315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5McLVfOcUe323ZqnXbKqgnGk8UnfNHbpkIXezyE7ocw=;
        b=HEd8VzLZfaFiaZFxhJwiqETXH69QJsdsx4Yfh68Mht0vmNtX/9/5xpL+eGd6HUpKOR
         GkNCPr8OJkdcLdhUh99Bo0CtQ+sUU+bvzz6dsOfD9Iaom+Uurwel6UaeRKphMOXUmNcG
         WD2JZuo/5D27MbQRrg+UpNj2jaMmA9oIfERmhh2AfWayEVb/W7UNvJ4zmz570kTnAQ4L
         6VzVJed20uen7h0uowadVnrJvU0jRPO4C4eg3Lsyo01K39JVyqinEFFuOfS62oonyo9D
         HHa6ihKA19Vdsq8SZ4GEtt0rr7ezUY247VJpkf94Q8xdmvgO5YT6LHMrQqkmOMW/x2aS
         O5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088515; x=1788693315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5McLVfOcUe323ZqnXbKqgnGk8UnfNHbpkIXezyE7ocw=;
        b=sX9+BMeuj8pkiCwmfih+DLJL/Nvs1Uf3fqYsvwcRxs9F4/Jqmo1Rw2oqQKelOSviqd
         J0pVN2wv4FM25XBGb9RuL5z0TXyr+y6AZF3mV7dHdttdwtipA8UyA0y/G+2miN1BbJbV
         jLRJdNZ3e7C0+sY2/ITdwwDw/9gZ3vjBFY2KD7mg6Q5WD9Qkzxx1SCWPsTq0hwqI85yQ
         IWDlpg8T306rpGsJ1uOh7dVEmqp6r4c3cEbqZ466JxIVCAZtPBz8S8e0cRY453XJjbp0
         b1Y7xd3oH63sFIa1UNvtsUvq8iBxtky7Vm8CacwrAj9VJQpSRGY8PNwcxzywJFFASWHw
         Rz0w==
X-Gm-Message-State: AFuF++k8HiyoXCTxNFxcfgEBCnaOUYNYpYR0jXH6nvStCR6zCrULjc3h
	VB5bBTCMYm09t1zND8GbXFqML5CxMSZBUVyQIdVAqhYdwzCKWuDm2VrR
X-Gm-Gg: AYBFou3uB1wEgHejOemGSK+9Zgn/RiKkXecRrjn8gAOHYhqOeWhUXc2zP3LTMusgNQn
	a4+Grt/k5QZ4VIL8uzBqPWypfWzTyqWDL1J7nZw5LLyqFa707xik8dT4dE/cFW0kqWiBtsR3mbd
	sBfZnLVF5ygKU3ZpoDwML/62Li/0h1Eerh+hNstf8BbvMQFBhjnJqOwUedA8MCGAe/Dx73XHyqA
	gGl+Tfu18i5N9lAb9tWpq6XoZV3xhrd+wvtDBOF7QVfcMQg6nUTXMElogfLTkzBjaqR5rRoK5/C
	R2hRNe8cjGDSLssx0DKatw66l4W3MY8TBOX2NmwoOKtunlNlG86xQBhRXdc6E3KFYCFUgLu7LQJ
	ncmQpUyJwt6ZgYGv5HZw5pY8K1EzjsnaJlpm2IlJe5/X8J9btdO/Xw3vymM7dXgSViPyC2y5qmR
	7textPBqp7d5SmjUINbHbNALOuQsQWhQ3G3yXJHLUO2G4hsLY8kBYjMH5KNQ3Eck+5Hoq9OeGjp
	BmAco5ZnJ1c8cc6ZcCgOdDC3QCy8J6sluIPJmJElm3pmW0v6IjwiTFqOMOgCg==
X-Received: by 2002:a17:90b:1d05:b0:396:65dd:4093 with SMTP id 98e67ed59e1d1-396d0ff519cmr31217212a91.14.1788088515276;
        Sun, 30 Aug 2026 04:15:15 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:14 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 04:15:05 -0700
Subject: [PATCH 1/6] platform/x86: x86-android-tablets: fix Arizona GPIO
 swnode references
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x86-android-lenovo-swnode-v1-1-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

The standalone arizona_gpiochip_node was created when gpiolib supported
matching a software node name against the GPIO chip label ("arizona").
Later, gpiolib replaced name matching with firmware node identity
mapping (and eventually dropped the fallback mechanism), causing GPIO
lookups on unattached software nodes to fail.

In gpio-arizona, the GPIO chip inherits the firmware node of the parent
codec device. Fix the lookups by pointing the GPIO property entries
directly to the codec device software node (which is attached to the
parent device) and dropping the obsolete arizona_gpiochip_node.

Fixes: 611fd6cfe139 ("gpio: swnode: remove deprecated lookup mechanism")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 8d825e0b4661..c34f62bdf8f9 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -61,10 +61,6 @@ static struct lp855x_platform_data lenovo_lp8557_reg_only_pdata = {
 	.initial_brightness = 128,
 };
 
-static const struct software_node arizona_gpiochip_node = {
-	.name = "arizona",
-};
-
 static const struct software_node crystalcove_gpiochip_node = {
 	.name = "gpio_crystalcove",
 };
@@ -416,15 +412,17 @@ static const struct platform_device_info lenovo_yoga_tab2_830_1050_pdevs[] __ini
 
 #define LENOVO_YOGA_TAB2_830_1050_CODEC_NAME "spi-10WM5102:00"
 
+static const struct software_node lenovo_yoga_tab2_830_1050_wm5102;
+
 static const struct property_entry lenovo_yoga_tab2_830_1050_wm1502_props[] = {
 	PROPERTY_ENTRY_GPIO("reset-gpios",
 			    &crystalcove_gpiochip_node, 3, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("wlf,ldoena-gpios",
 			    &baytrail_gpiochip_nodes[1], 23, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("wlf,spkvdd-ena-gpios",
-			    &arizona_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
+			    &lenovo_yoga_tab2_830_1050_wm5102, 2, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios",
-			    &arizona_gpiochip_node, 4, GPIO_ACTIVE_LOW),
+			    &lenovo_yoga_tab2_830_1050_wm5102, 4, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -434,7 +432,6 @@ static const struct software_node lenovo_yoga_tab2_830_1050_wm5102 = {
 
 static const struct software_node *lenovo_yoga_tab2_830_1050_swnodes[] = {
 	&crystalcove_gpiochip_node,
-	&arizona_gpiochip_node,
 	&lenovo_yoga_tab2_830_1050_wm5102,
 	&generic_lipo_hv_4v35_battery_node,
 	NULL
@@ -985,13 +982,15 @@ static struct arizona_pdata lenovo_yt3_wm5102_pdata = {
 	},
 };
 
+static const struct software_node lenovo_yt3_wm5102;
+
 static const struct property_entry lenovo_yt3_wm1502_props[] = {
 	PROPERTY_ENTRY_GPIO("wlf,spkvdd-ena-gpios",
 			    &cherryview_gpiochip_nodes[0], 75, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("wlf,ldoena-gpios",
 			    &cherryview_gpiochip_nodes[0], 81, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[0], 82, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios", &arizona_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios", &lenovo_yt3_wm5102, 2, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -1001,7 +1000,6 @@ static const struct software_node lenovo_yt3_wm5102 = {
 };
 
 static const struct software_node *lenovo_yt3_swnodes[] = {
-	&arizona_gpiochip_node,
 	&lenovo_yt3_wm5102,
 	NULL
 };

-- 
2.55.0.897.gb25b4bd76c-goog

