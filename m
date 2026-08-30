Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3CA3B27F8
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088534; cv=none; b=Klg6wWhI89qwZb6QUqC08eSDSIgykJm42VeRIMbjSoG6+HF+KgxhYlUSvQQhtZ0ZpNjUTiZeanxOh3j0kF5hwpgdWxxdslyC/Al01d4Morl9z+O0vkwElqpdRexpM8UDur6AsQ2nELl/CiqwkQEO1kkNs5EWvencPCDerUO/NlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088534; c=relaxed/simple;
	bh=KZ/fD8FH+Wlo4KWrp3tSDdM6Rhcc8zTyI0ZU4yMUbuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QxLNGv6CAPFaVwEGc8TW18zogw+IeEpVFrdOfpt+W5jcFm4LD88X6MyXnicM6rxFqyRNtk4C8Mr7hKrOBnFcby5AjcbsBXktdSiCzHZ647Z4lAWOwgP1E0skqGeuqgU+XVUwkUipB3nzw62YIfWmG9uM2gbryEFBVeJ8d9xkRso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L2uMRw3i; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L2uMRw3i"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1ceadbd16so2594697a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088527; x=1788693327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNBolfdjDJZim1d0V9ZQFfyaRgxWkpiwGCAz20WAkoM=;
        b=L2uMRw3iUVVbPwmVG0zGOQ+LoVFaMC/YFPSUlISVxytd0CMfq85FqmA2BWV7vh9mW7
         PlcWnxF2pgaLRB+IGk276yIN5XwXj60L1zE08VhafD4+KoqdClKyu0k3U0ZhEvXFjw4n
         EFlqVuc3SOZAyXJCIinlN/yI3JVCIxZ+4trT40ghI5fC7eAa1n07k2baCyQjHTij1wVL
         29YspZcWktvJcbyx7xl9zEzTDCnBtUGRr3OmChh7wRleUViUJfTtoaoSFaMeFTLMWP2z
         krXKMLA+t/jQAMuyi76nktE4a0sQJ3xJLuQrJMCtWqfIHPewOUKMw/KV1ffmqAiIUcLD
         R30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088527; x=1788693327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNBolfdjDJZim1d0V9ZQFfyaRgxWkpiwGCAz20WAkoM=;
        b=KXfNYNtMMK+v/t01aRgIav6m4NRqt1kXTn7Qe0jti4wpcl8YxAIuiucaACsiDwTMhg
         VYeR8WL7WE+A121rSE5BS4z74gVY6YEsVOCpinUYzKGtmlA47jTlcnPpRByZTRqB31OA
         fE5KOEIX/xcPhxNXrfV+EKmjp0zhYoFFxxoUafQLfwvJSwQNu12+zALp8l9oGuTAV8ha
         9u4xnalT4S7YymqtD1BQWzADNfs2jC8ybsz7D+HyTgzsUjX94w5Je13XE6jz702RzSIN
         Iq/pP8rjwaHlSwYSnxp5wFMiwVPw5wCql/cqkg7Ga4wq2EJLgapYSE6qD5oC+u7zh5OO
         nNMA==
X-Gm-Message-State: AFuF++nCb3fpwPFmCHCF94+kmxn6HvkXDYW8AiM1jlYYsCsUF0dEX3fs
	eTFWwOVr2yBOONqooc7qI6cmEXh2q6OAlUL5/79F6jCnc8Qvotl5pRYf
X-Gm-Gg: AYBFou1qo94w5x+D4ihq66CawRqqOyQtWlm1kTmcvCm9m+OHzeZixIxdWwATS+loOZS
	06mv8Ok9C+/vU+6BFRH97r7stmEZmH1oJuSazeSSa4VlY01wanGT/0lUJFK4rUgyeei/JhLwz9w
	i/tlvquLp+FpQ6n1SY2Q6uO4cY5/oSk9gMW6M8pR2Y1RrJwV5dPahzv5NX6ZmgF/SE/H3ILpE4f
	UEkrjqZpI1ntw7u0zxzkCbMcNzpN+s0TM2tpigq+YuenttjBxoWJMp9fBtXI5POJY7tB5xspmIC
	vPkNeeGOKP52sIo87y5z5g2wok21QsdveB15BY+Kf7/+8vvnPWnp3ajIJmXcJ/s876oyYKG3kMH
	Ah8eNQXe5HZ0lyG39LsluuV5yWcuOq7BUWFoj98tLbiwd3Xb/vqpKVmqL8uYm+jdrns8G5htoij
	gyqf6z0+6WeFO5XACIan8NA3gFlWjhood3SyF6kspBnX5o80uscMoW4MYojRVsmWXO4ewvuQvAc
	aVvbWVtRTHNduGbfWk7p8EOFfVHEDMcBtSJAbOOoobhKrYeU9M=
X-Received: by 2002:a17:90b:4fca:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-396d0daf8d9mr31040405a91.4.1788088526642;
        Sun, 30 Aug 2026 04:15:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 30 Aug 2026 04:15:10 -0700
Subject: [PATCH 6/6] platform/x86: x86-android-tablets: use shared battery
 swnode group on Yoga Tab 2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x86-android-lenovo-swnode-v1-6-066a91acb4ba@gmail.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

The WM5102 codec software node lenovo_yoga_tab2_830_1050_wm5102 is
registered automatically when attached to the codec device via
device_add_software_node() in lenovo_yoga_tab2_830_1050_init_codec().

Including it in lenovo_yoga_tab2_830_1050_swnodes is therefore
redundant, leaving generic_lipo_hv_4v35_battery_node as the only node
needing registration.

Switch lenovo_yoga_tab2_830_1050_info and lenovo_yoga_tab2_1380_info to
use the shared generic_lipo_hv_4v35_battery_swnodes group directly and
drop the custom lenovo_yoga_tab2_830_1050_swnodes array.

Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index cd8cee1f4aed..52d96ae89078 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -427,12 +427,6 @@ static const struct software_node lenovo_yoga_tab2_830_1050_wm5102 = {
 	.properties = lenovo_yoga_tab2_830_1050_wm1502_props,
 };
 
-static const struct software_node *lenovo_yoga_tab2_830_1050_swnodes[] = {
-	&lenovo_yoga_tab2_830_1050_wm5102,
-	&generic_lipo_hv_4v35_battery_node,
-	NULL
-};
-
 static int __init lenovo_yoga_tab2_830_1050_init(struct device *dev);
 static void lenovo_yoga_tab2_830_1050_exit(void);
 
@@ -448,7 +442,7 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.pdev_info = lenovo_yoga_tab2_830_1050_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_pdevs),
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
-	.swnode_group = lenovo_yoga_tab2_830_1050_swnodes,
+	.swnode_group = generic_lipo_hv_4v35_battery_swnodes,
 	.modules = lenovo_yoga_tab2_modules,
 	.has_crystalcove = true,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
@@ -794,7 +788,7 @@ const struct x86_dev_info lenovo_yoga_tab2_1380_info __initconst = {
 	.pdev_info = lenovo_yoga_tab2_1380_pdevs,
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_1380_pdevs),
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
-	.swnode_group = lenovo_yoga_tab2_830_1050_swnodes,
+	.swnode_group = generic_lipo_hv_4v35_battery_swnodes,
 	.modules = lenovo_yoga_tab2_modules,
 	.has_crystalcove = true,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,

-- 
2.55.0.897.gb25b4bd76c-goog

