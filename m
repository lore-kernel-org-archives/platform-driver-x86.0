Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E68A1CBE8A
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Oct 2024 10:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729937214; cv=none; b=OG/ZNSqoNDPXMpRy10UOMbGuKXt199JIdiiBY++0k4kaMMbiL22mCrUdg3OOg0fi3v+AwIAa4EBahwS+gqweBlz33G8a1hs4pHGfUgEHtkQSHbNE0smK6Kw7JfkZOaeCF4DEt8C4rKizgzLaJrxxKUVKGpeseL7us9/6nzIYSDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729937214; c=relaxed/simple;
	bh=iT17q3PtvsKVVWlAB0xVzvrtoV1UpG6Cla6RP4nKJ2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=afjLbfg48iSq2sY3MK0LKMkrK2r+vtTa9IcdW3l5nOJwev6DXtvNO5eUkY4Fgu4U3kkvVtD/F0ruPfXBwgDAzrGPCc2qjZFMs1VN2X8oaaC3ouQdCg5I1yC4O6vVLG8OSRbv8FF7mgSOEU/TF23CT1FuYMFVzAyoEl5C+Yzd0Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bU7Ged+G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bU7Ged+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729937211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/xhv1+b5m30tQ2V9ReCJqtNQVpNuW63djAAN6O+g2C4=;
	b=bU7Ged+G945wdKe7c9CIbhS9xOLHFxl8arkCDWU2fDifCOXQ7cONaAzPDqQZj7EWnMmCGr
	88tAby0N6Q3nLHe9ZLcJ0rRNVwScfytyV8DT4Y/9FTpo1hijcDckhc0CicuZbw2nknpF0H
	0bp4vYqItWF9hZrY+BqS+xiayvn3+x4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-tbMVMowmOhKRCi2U7hqZbw-1; Sat, 26 Oct 2024 06:06:47 -0400
X-MC-Unique: tbMVMowmOhKRCi2U7hqZbw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a99fa9f0c25so187422166b.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Oct 2024 03:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729937206; x=1730542006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xhv1+b5m30tQ2V9ReCJqtNQVpNuW63djAAN6O+g2C4=;
        b=PpScUlu4ffXEPGv6AriV2GVyLjg5Q4/9h/mTQ20l2yNEEv4/xTphvQuYrC0CbwJCmJ
         w2JYVULP6CfDWxtNMaSy7X8ylCGZ2y8TudqnIqV6Gpjfu8B5lyjw9269NncOGICG8MGx
         zG1PS0DVBfNi+Ddu9fDHifVXOLDJ0AeYEj7R/fflKdHickEyKaUW6bMKSMQ1E3CnmNCU
         3HamqtHzdDzNh5CDzmu9vcfqtNTdGZD+itHlhQfaMx8/C7yqRLNhBd08akQLP/VYdx2Y
         t9svVh5+SpAQ7B7MkkdxGRz2rzy4133Q/IhuN5u22zVZOI5io1Tx3o9Jfr2G+dNDrgXC
         ShDw==
X-Forwarded-Encrypted: i=1; AJvYcCUpVvdR0p+kvMzRGZ4coreZK/c37eAWxoQ00UkZcRQlenQFhgaavjO0PSgpxQhCCTnRv3cGtcI4lmguvOZFWR9G+udU@vger.kernel.org
X-Gm-Message-State: AOJu0YxunFHPj/BUFjeEcx0/Da5z8RFSixQxWZTbeXKUQCMSH+/8WOB+
	mSJzop1/n8ak6bIi2lML/etmLD7UZJ4ImQFt/XF6HE7xOSLgyA8caIVcr0yhrEURmdPwC3ZED+Q
	uV+oSOP63PHbbPg5GFIPaiyYSGdTr1l2jFdNx7tYXHX4rXutg97hyTRzUkYi2NAGt3givsEc=
X-Received: by 2002:a17:907:3204:b0:a9a:825:4c46 with SMTP id a640c23a62f3a-a9de5f66095mr143237566b.28.1729937206344;
        Sat, 26 Oct 2024 03:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjzd66VSfmbE6a/PmIgA5tRRvaqKEjO55p9KQ0QO3fCz/oAy+qnzABJmGMxKzZn329gAG5bQ==
X-Received: by 2002:a17:907:3204:b0:a9a:825:4c46 with SMTP id a640c23a62f3a-a9de5f66095mr143233866b.28.1729937205779;
        Sat, 26 Oct 2024 03:06:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdecbsm159602066b.5.2024.10.26.03.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:06:45 -0700 (PDT)
Message-ID: <6e7bc5fb-6b6d-40e3-b974-fd839a0d6b55@redhat.com>
Date: Sat, 26 Oct 2024 12:06:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] ACPI: platform-profile: Add a name member to handlers
To: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Lee Chun-Yi <jlee@suse.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Ike Panhc <ike.pan@canonical.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Alexis Belmonte <alexbelm48@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ai Chao <aichao@kylinos.cn>, Gergo Koteles <soyer@irl.hu>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 "open list:MICROSOFT SURFACE PLATFORM PROFILE DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 "open list:THINKPAD ACPI EXTRAS DRIVER"
 <ibm-acpi-devel@lists.sourceforge.net>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Matthew Schwartz <matthew.schwartz@linux.dev>
References: <20241025193055.2235-1-mario.limonciello@amd.com>
 <20241025193055.2235-2-mario.limonciello@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241025193055.2235-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Oct-24 9:30 PM, Mario Limonciello wrote:
> In order to prepare for allowing multiple handlers, introduce
> a name field that can be used to distinguish between different
> handlers.
> 
> Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/surface/surface_platform_profile.c | 1 +
>  drivers/platform/x86/acer-wmi.c                     | 1 +
>  drivers/platform/x86/amd/pmf/sps.c                  | 1 +
>  drivers/platform/x86/asus-wmi.c                     | 1 +
>  drivers/platform/x86/dell/dell-pc.c                 | 1 +
>  drivers/platform/x86/hp/hp-wmi.c                    | 1 +
>  drivers/platform/x86/ideapad-laptop.c               | 1 +
>  drivers/platform/x86/inspur_platform_profile.c      | 1 +
>  drivers/platform/x86/thinkpad_acpi.c                | 1 +
>  include/linux/platform_profile.h                    | 1 +
>  10 files changed, 10 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_platform_profile.c b/drivers/platform/surface/surface_platform_profile.c
> index 3de864bc66108..61aa488a80eb5 100644
> --- a/drivers/platform/surface/surface_platform_profile.c
> +++ b/drivers/platform/surface/surface_platform_profile.c
> @@ -211,6 +211,7 @@ static int surface_platform_profile_probe(struct ssam_device *sdev)
>  
>  	tpd->sdev = sdev;
>  
> +	tpd->handler.name = "Surface Platform Profile";
>  	tpd->handler.profile_get = ssam_platform_profile_get;
>  	tpd->handler.profile_set = ssam_platform_profile_set;
>  
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index d09baa3d3d902..53fbc9b4d3df7 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1878,6 +1878,7 @@ static int acer_platform_profile_setup(void)
>  	if (quirks->predator_v4) {
>  		int err;
>  
> +		platform_profile_handler.name = "acer-wmi";
>  		platform_profile_handler.profile_get =
>  			acer_predator_v4_platform_profile_get;
>  		platform_profile_handler.profile_set =
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index 92f7fb22277dc..e2d0cc92c4396 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -405,6 +405,7 @@ int amd_pmf_init_sps(struct amd_pmf_dev *dev)
>  		amd_pmf_set_sps_power_limits(dev);
>  	}
>  
> +	dev->pprof.name = "amd-pmf";
>  	dev->pprof.profile_get = amd_pmf_profile_get;
>  	dev->pprof.profile_set = amd_pmf_profile_set;
>  
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 2ccc23b259d3e..c7c104c65a85a 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3910,6 +3910,7 @@ static int platform_profile_setup(struct asus_wmi *asus)
>  
>  	dev_info(dev, "Using throttle_thermal_policy for platform_profile support\n");
>  
> +	asus->platform_profile_handler.name = "asus-wmi";
>  	asus->platform_profile_handler.profile_get = asus_wmi_platform_profile_get;
>  	asus->platform_profile_handler.profile_set = asus_wmi_platform_profile_set;
>  
> diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
> index 972385ca1990b..3cf79e55e3129 100644
> --- a/drivers/platform/x86/dell/dell-pc.c
> +++ b/drivers/platform/x86/dell/dell-pc.c
> @@ -247,6 +247,7 @@ static int thermal_init(void)
>  	thermal_handler = kzalloc(sizeof(*thermal_handler), GFP_KERNEL);
>  	if (!thermal_handler)
>  		return -ENOMEM;
> +	thermal_handler->name = "dell-pc";
>  	thermal_handler->profile_get = thermal_platform_profile_get;
>  	thermal_handler->profile_set = thermal_platform_profile_set;
>  
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 81ccc96ffe40a..26cac73caf2b9 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -1624,6 +1624,7 @@ static int thermal_profile_setup(void)
>  		set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
>  	}
>  
> +	platform_profile_handler.name = "hp-wmi";
>  	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
>  	set_bit(PLATFORM_PROFILE_PERFORMANCE, platform_profile_handler.choices);
>  
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 9d8c3f064050e..1f94c14c3b832 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1102,6 +1102,7 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
>  
>  	mutex_init(&priv->dytc->mutex);
>  
> +	priv->dytc->pprof.name = "ideapad-laptop";
>  	priv->dytc->priv = priv;
>  	priv->dytc->pprof.profile_get = dytc_profile_get;
>  	priv->dytc->pprof.profile_set = dytc_profile_set;
> diff --git a/drivers/platform/x86/inspur_platform_profile.c b/drivers/platform/x86/inspur_platform_profile.c
> index 8440defa67886..03da2c8cf6789 100644
> --- a/drivers/platform/x86/inspur_platform_profile.c
> +++ b/drivers/platform/x86/inspur_platform_profile.c
> @@ -177,6 +177,7 @@ static int inspur_wmi_probe(struct wmi_device *wdev, const void *context)
>  	priv->wdev = wdev;
>  	dev_set_drvdata(&wdev->dev, priv);
>  
> +	priv->handler.name = "inspur-wmi";
>  	priv->handler.profile_get = inspur_platform_profile_get;
>  	priv->handler.profile_set = inspur_platform_profile_set;
>  
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 4c1b0553f8720..c8c316b8507a5 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10549,6 +10549,7 @@ static void dytc_profile_refresh(void)
>  }
>  
>  static struct platform_profile_handler dytc_profile = {
> +	.name = "thinkpad-acpi",
>  	.profile_get = dytc_profile_get,
>  	.profile_set = dytc_profile_set,
>  };
> diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
> index f5492ed413f36..6fa988e417428 100644
> --- a/include/linux/platform_profile.h
> +++ b/include/linux/platform_profile.h
> @@ -27,6 +27,7 @@ enum platform_profile_option {
>  };
>  
>  struct platform_profile_handler {
> +	const char *name;
>  	unsigned long choices[BITS_TO_LONGS(PLATFORM_PROFILE_LAST)];
>  	int (*profile_get)(struct platform_profile_handler *pprof,
>  				enum platform_profile_option *profile);

