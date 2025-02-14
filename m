Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D8F21C19C
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Feb 2025 08:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739523582; cv=none; b=Yv5+WNe0sSmTvO0aIksOym0BkE1muuOxMfPvG0Ert3bhz3xmOjocsket102PvCLxl2jdqfqSmbUNPxr33MGdIr4pT7V2ffYNCsEv6T6W+TYVXLqpktjfMgVY0rsBuuglfT7gVP2OTyRYCaloJ5uISYyb3VR7OESOUvSpG44RWRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739523582; c=relaxed/simple;
	bh=lIqag3A/X2pmc4BRaks73YT6X86Cppexn1l2jgDjt0Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T16lDYOeyJUWZJ3nVKEnvZGJbpHPuxbf7s69jOq6/BF5N4f3D6Bi1SFb9kw36D2Kl66ZprM+O7mPwKCb+qB9BcwZLRjZQOdRvn5lb0/2/GAF60zzjcu5JgmoXXGl5tM75NaWdnDDQnrkJxFprj2PllEfSG4PZXzY355Kg3Z+gso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OIacxsyd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OIacxsyd"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso149207f8f.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Feb 2025 00:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739523577; x=1740128377; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zoda2EDe08w9D7LB4RKFhW/A5U1oY6oOY5HMe4wfwNc=;
        b=OIacxsyd5OVWk5oYDGblY5KZhNDbhpdl5XK+UAPOdf5iDTNuWzhh9bYwPNI0mOsSYc
         uSFR4eOXST3uhvFqwK6SqVDze41XqmYxs/dJMbxQ5tBLOIqkmmSROiX/wLynu2X+N04t
         xmmTnKI8IMczZrHLjvRI6SqzBLeLwT/lOTp8zVE8grvrB+v42YTgodrNo8RT5UZIPhd8
         XGHfN9a7hhAVTZqrNUpBUxKyZkhbXIkRRq01qK3V6ZbOMQdG4LIpOgV4zesXH/G8yMS4
         ABZ3edysKAmALcsAJwlOg+G1UI3ZnTxg5euvhEjoc0vcwy9UXfBZ1k3V2y3sjrTbBKMC
         1QxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739523577; x=1740128377;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zoda2EDe08w9D7LB4RKFhW/A5U1oY6oOY5HMe4wfwNc=;
        b=OpI4tIatEhB1cAL3R5H17IK8upzrHMd6eTXsXiaL9dZlXqoQjdbHhaJ2zEQiI1vYcN
         JFs+w19J6bj1ShBNDJY1Pb/g1qMvoYzz3mMaD6eytcNcFlfVcQgcEepN9cXTO8u2Fl9a
         Z86nKmFP8Qq+4JqEkO0nFMHtmd0nFKet4nNGyG8L52oXa45koDSahLl1ZJWLZtI43Cg9
         YDsYhOVhCiQXDntNQnE6idy6g7kEuham20c6stly/gxfPEwxwECEhxcaC4MjijNhHelf
         XejU0HoRQcRn5E72A89Vgy76eLi97fFnCbdn0r7HkBFop0y2UxJCEl1sj4cLPKM3cOay
         gyTA==
X-Forwarded-Encrypted: i=1; AJvYcCU8ywLfl2LWGwuTuoIaFRf9Kne28YH/iZfm7eWicvwgu1u4ztUDFs47MMwchUKFZDGf16D8cCfvcTNDz4z4E6Ez5cpY@vger.kernel.org
X-Gm-Message-State: AOJu0YzFm7d1KDEo5AacPxtOCdBhE9EPxUI1Yu9ZBQf0Scd6JArJSCYJ
	YYYUR155aTv03tgeZROkzhcV8XDq0HX6g3c49wC+kGd6uxPgXjoxDrQ32ql7+1I=
X-Gm-Gg: ASbGncta9jbd9T1Hoo+xR2u0Re+33Ol62sDomJNM6YS5Bpq2yt3O5r+MS0bdRCadIIs
	ycgwUt2G6uBxQ7knx1LCw3LYzPONSGWcV3wuscP7DhPoRIb3xhG4EkA9nKBguR8wN2ud6bbeBHM
	zsZA3GBa5ylaRg0p/xlhYInvxh7h7wVsHDW3phcqDU0pyh5KlIcM+QY0HqsYrduq+ywKZIJyJA7
	rMa+o2zv740EAPhZSCCpBHtbfTlZMFxfqG+awHr4xJv37HtBvghL9Jy5ZjFct/6Vug/+hTWcbp4
	rWTaECHJ6jWS9hc=
X-Google-Smtp-Source: AGHT+IHr8NGbRnNCNsasOEgGwEH9hogJeR/Q2q11CcGnTNY+PAq+96jRXtyg1EfxGENX3t8ZZduxZg==
X-Received: by 2002:a5d:5250:0:b0:38f:3141:8912 with SMTP id ffacd0b85a97d-38f31418a8cmr220671f8f.24.1739523576712;
        Fri, 14 Feb 2025 00:59:36 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:baa6:bc65:b9db:3759])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f258ccda0sm4052204f8f.27.2025.02.14.00.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 00:59:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Dave Ertman
 <david.m.ertman@intel.com>,  Ira Weiny <ira.weiny@intel.com>,  "Rafael J.
 Wysocki" <rafael@kernel.org>,  Stephen Boyd <sboyd@kernel.org>,  Arnd
 Bergmann <arnd@arndb.de>,  Danilo Krummrich <dakr@kernel.org>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
  Douglas Anderson <dianders@chromium.org>,  Andrzej Hajda
 <andrzej.hajda@intel.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de Goede
 <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
  Bryan O'Donoghue <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 2/7] reset: mpfs: use the auxiliary device creation
 helper
In-Reply-To: <20250213-crown-clustered-81c6434c892b@spud> (Conor Dooley's
	message of "Thu, 13 Feb 2025 17:59:07 +0000")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-2-7edb50524909@baylibre.com>
	<20250213-crown-clustered-81c6434c892b@spud>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 09:59:35 +0100
Message-ID: <1jv7tczytk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 13 Feb 2025 at 17:59, Conor Dooley <conor@kernel.org> wrote:

> On Tue, Feb 11, 2025 at 06:27:59PM +0100, Jerome Brunet wrote:
>> The auxiliary device creation of this driver is simple enough to
>> use the available auxiliary device creation helper.
>> 
>> Use it and remove some boilerplate code.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-mpfs.c | 52 +++-------------------------------------------
>>  1 file changed, 3 insertions(+), 49 deletions(-)
>> 
>> diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
>> index 574e59db83a4fcf30b60cb5f638607a2ec7b0580..bbea64862181877eb7ae51fdaa9e50ffac17c908 100644
>> --- a/drivers/reset/reset-mpfs.c
>> +++ b/drivers/reset/reset-mpfs.c
>> @@ -155,62 +155,16 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
>>  	return devm_reset_controller_register(dev, rcdev);
>>  }
>>  
>> -static void mpfs_reset_unregister_adev(void *_adev)
>> -{
>> -	struct auxiliary_device *adev = _adev;
>> -
>> -	auxiliary_device_delete(adev);
>> -	auxiliary_device_uninit(adev);
>> -}
>> -
>> -static void mpfs_reset_adev_release(struct device *dev)
>> -{
>> -	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> -
>> -	kfree(adev);
>> -}
>> -
>> -static struct auxiliary_device *mpfs_reset_adev_alloc(struct device *clk_dev)
>> -{
>> -	struct auxiliary_device *adev;
>> -	int ret;
>> -
>> -	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
>> -	if (!adev)
>> -		return ERR_PTR(-ENOMEM);
>> -
>> -	adev->name = "reset-mpfs";
>> -	adev->dev.parent = clk_dev;
>> -	adev->dev.release = mpfs_reset_adev_release;
>> -	adev->id = 666u;
>> -
>> -	ret = auxiliary_device_init(adev);
>> -	if (ret) {
>> -		kfree(adev);
>> -		return ERR_PTR(ret);
>> -	}
>> -
>> -	return adev;
>> -}
>> -
>>  int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
>>  {
>>  	struct auxiliary_device *adev;
>> -	int ret;
>>  
>> -	adev = mpfs_reset_adev_alloc(clk_dev);
>> +	adev = devm_auxiliary_device_create(clk_dev, "reset-mpfs",
>> +					    (__force void *)base, 666u);
>
> Moving the boilerplate into a helper makes sense:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> One think that's always felt a bit meh to me is this id number stuff,
> I just threw in 666 for meme value.

:)

> The whole thing seems super
> arbitrary, do any of the users of this helper actually put meaningful
> values into the id parameter?

In example changes I've sent, no.

In other simple usages (those using container_of()) of the auxiliary
bus, I think there are a few that uses 0 and 1 for 2 instances.

I guess your question is "do we really need this parameter here ?"

We could remove it and still address 90% of the original target.

Keeping it leaves the door open in case the figure above does not hold
and it is pretty cheap to do. It could also enable drivers requiring an
IDA to use the helper, possibly.

>
>>  	if (IS_ERR(adev))
>>  		return PTR_ERR(adev);
>>  
>> -	ret = auxiliary_device_add(adev);
>> -	if (ret) {
>> -		auxiliary_device_uninit(adev);
>> -		return ret;
>> -	}
>> -
>> -	adev->dev.platform_data = (__force void *)base;
>> -
>> -	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
>> +	return 0;
>>  }
>>  EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
>>  
>> 
>> -- 
>> 2.45.2
>> 

-- 
Jerome
