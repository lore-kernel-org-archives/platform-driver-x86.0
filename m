Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C363CF95E
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180459; cv=none; b=mKqNUul1UVEZl0pM7Mnfvgm1IKTdT4aB4RI1QDV5SROHTSp2k0oLZ4dYbE2uRz+eoBep7PSuyj5IyGZ5EbUMpQNSbcS4jbW7ptIInX48MQx5GEuNDB8xn8XVFneVL9Vd2SWsRfz00w5eaIM0JeqOAXWQEt9kClFXATa8Laa65aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180459; c=relaxed/simple;
	bh=wh/usU8PfMdv8Q0zcva5WvxQQI9WUSSFSzU9ey8jYxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yg/9NiDpBx5OCG047ix5TUeuysUnXvJS+lPzFpCugL8YnBHeAFzW5S/S45b9a9Kl2iPjmMsh8GWNfG9CEGvHbXt68sOiWhsdOTQxAimKUxV6CUV+PkPqh1hvXCjKNbzbS5PQttYDhtqJaz/d3B/RT1ahiHRvt0jvNx6OdYbBJK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aW4FYJdH; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aW4FYJdH"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so5890051a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180455; x=1788785255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wgm3ZGfYPmE/vTxPbnTRUSBVqhRpYYPYKdu/n7NN0+A=;
        b=aW4FYJdHMvAHmv43bxg7/qcAGOr31VqhPy/9bev0g84ZCZQEEb+Gxt9ZmtSpgF/Ol6
         65TkabUFwCw6yAUaIkeVpV7vKkqAFDeVYnUYeMw/OQhFmsteWE2QDzNaPFFnf3gY6fF/
         lbZJHUjhYxQFY9db4d9DgWhE+5LGoNidK8eGf8o2EzQPzDqaZfTKG2kujBo0lXBp7lVE
         C7TbscmlSA91LWQFHoPfIrYkxF2o17RLMj+eqi2IxB3vbE2bCDb/8Ujl9KeZJjEeoLOc
         HkuxyCQM5g8S4dtESlHuiY5yeSiNoVU1RglVWjt95EXBZ3nzQBjzKbXy8zZN7we3J3Oo
         +4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180455; x=1788785255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wgm3ZGfYPmE/vTxPbnTRUSBVqhRpYYPYKdu/n7NN0+A=;
        b=EIbFNNY8BEIAZ+/zKZ5Ybs3QTVCxHhkB4q4AKCzW8djOBYSWeZTb+MojqLEyPEaTNf
         7aMkqmeEWf5YwDzJWbAg+cfeb43+5gKOxrKdQgizM5s85gxfKfIyKenp+otPCZ+kYGHL
         CnjShNY5wXr88xq9Zomtrs8/cEF7cgm7Cv+H8XZf1L00Y+fOVXr+VBa3deDRrZxPdoua
         49giA/c/jUMy3VTv7MDXiEj+NM7ytHzSXJ6kjeYldL5i6ZbUd1pe9HVcY9btKMxTlTHT
         8tZAN3s3Sjjxm7Bc1OA74CWoNSRxrTOrb3nc6/Nij5kIwSxsHUC8LjI6Ls1PvgIHe5wI
         78ww==
X-Forwarded-Encrypted: i=1; AKwUvBwJ2Zv7r6w9M7AsHREGRXI0kjnrZomADsiEuTu7daU1IS4fQD1/I+jq7tga5IvOTAMNMgC0W9SAIVIJ4lpknq0vlhTs@vger.kernel.org
X-Gm-Message-State: AFuF++lolP/leU1qICyZEohMeJ8ZR861+DOTVyhogfsI4001Hha8ewvP
	rPLSHjm0Q/zKCF7MOVkgdivCyr88bacYYjN+CeNmb1Y2WoQFzRoFGEbY
X-Gm-Gg: AYBFou1KCEoxXy7jo+aCuSkHbs7mwkKBQ1tI43bD6lIj2OgoZd1ceetC6xFDXObHF0C
	pr1Zx2n4CDnu8c2oLUcXbhkvC8uIJIxXg8fq63gSTDD28Kr6tQSqeNO8JHCmn1dNxukCaZKvyTg
	V+iD8MYwe4/3TcVoTkHg34Rxg0xgkF2zR9bp+ef9lbay3796WZaru+W6hjh4i8m7njRIMJkeyBV
	OljSRJY9CYOOp7pElvG9/Ee3Bi/h84og/uwyVpXBmOwfkAiTJ2PSziyyzJjoFvBlqFFMpA85pck
	5Mq/GWZiiex0qPnXK+HZsuHQY9jyWaelP1MeAiuZWyeUrNnFcBraWEvK/SLMPNeStrrmVSnKcNN
	rri1+H5YqdaqEp/qYhhTw5ZPXGWFzPtyQ+6B2zZKnFBqoCAFtxAsqnFY7FWpOEZczP/Ofrnos7z
	Uz7Zz/XQfMa4s16zG09kyeC7sKPecSY+jWQDdCeVv3lbF3g8nICh7udCMXfMcZ0Ql/JZr2Qxc8N
	ChlpBgd1trvwaVVzZIK0dcEqBzsKA==
X-Received: by 2002:a17:90b:590f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-3989be5b4bdmr27613593a91.18.1788180455457;
        Mon, 31 Aug 2026 05:47:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:15e9:e9f4:23e3:4f32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa400c8sm34340875eec.30.2026.08.31.05.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:47:30 -0700 (PDT)
Date: Mon, 31 Aug 2026 05:47:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
Message-ID: <apV3jbqWfNRa8zN2@google.com>
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
 <eadd7091-c61e-4fb7-b1a4-cf307108b199@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eadd7091-c61e-4fb7-b1a4-cf307108b199@kernel.org>

On Mon, Aug 31, 2026 at 11:42:06AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 30-Aug-26 1:15 PM, Dmitry Torokhov wrote:
> > When gpiolib dropped name-against-label matching in favor of firmware node
> > identity mapping, lookups referencing unattached software nodes (such as
> > arizona and gpio_crystalcove in x86-android-tablets) stopped working.
> > 
> > This series fixes the lookups and cleans up redundant software node
> > registrations on Lenovo tablets:
> > - Point Arizona GPIO property entries directly to the codec device software
> >   node, which is attached to the parent device.
> > - Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
> >   during devres action teardown.
> > - Generalize gpio_secondary_fwnode_init() to accept a node group argument
> >   and use it to attach crystalcove_gpiochip_node as a secondary firmware
> >   node to INT33FD:00 on Lenovo Yoga Tab 2 models.
> > - Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
> >   Yoga Tab 2 models where codec software nodes are already registered when
> >   attached to their respective devices.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> So I've given this a test on a Yoga Tablet 3 (yt3) tablet yesterday and
> there everything works.
> 
> Then I also tested this on a Lenovo Yoga Tablet 2 1380 since the YT3 does
> not cover the crystal_cove GPIO case and there things do not work.
> 
> It seems that trying to get the crystal_cove GPIOs indefinetely returns
> -EPROBE_DEFER. I'll try to debug thus further this evening.

I wonder if the patch below will help.

Thanks.

-- 
Dmitry

From 9376af2b6a9c91cd6a05969b583f40d451050988 Mon Sep 17 00:00:00 2001
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 31 Aug 2026 04:59:24 -0700
Subject: [PATCH] gpio: crystalcove: add missing MODULE_ALIAS()

The crystalcove GPIO driver lacks a MODULE_ALIAS() to allow it to be
auto-loaded. This results in consumers indefinitely deferring their
probe with -EPROBE_DEFER (waiting for the GPIO controller to appear)
when it's compiled as a module, as it will never be loaded.

Fix this by adding the missing platform alias.

Fixes: 104fb1d5153c ("gpio: Add support for Intel Crystal Cove PMIC")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-crystalcove.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 0fb5c06d0886..ab7fab5b9754 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -396,3 +396,4 @@ module_platform_driver(crystalcove_gpio_driver);
 MODULE_AUTHOR("Yang, Bin <bin.yang@intel.com>");
 MODULE_DESCRIPTION("Intel Crystal Cove GPIO Driver");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:crystal_cove_gpio");
-- 
2.55.0.897.gb25b4bd76c-goog




