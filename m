Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763AB360;
	Fri, 27 Dec 2024 04:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735275029; cv=none; b=LN0iqTzfU9DgQOFyR/ANcwJD/kLbadeKqBsWYN22jyNOEHALUom+jl6mlMvTaTQo9EwWs0MIqhNDmGMTQJZ0r2K2ci1abaJC1McmARw4rQMpo5YREenYJdJBMqYh/NAAe+uMHTWtXwxUQVot6BcvELXyAJ+yUivfWqeiJXTy3GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735275029; c=relaxed/simple;
	bh=swmLgBZb2+NXGim+RPxNxFARnE7Gd7qJe/WEcYkqv94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qUDQA5OqWBRi7tnHXco4cnx5sXmCpNY3zWJW9FgUBr8OHfejpJNMk9aOCfib6p8vZ1iWgboBvQqiW1TyiFyLR0/UDzcGVf7w71Ki7wHmQF317ZzTiG4WB5p6cDgCdChtxME1ZT2UtmzcO42bMfccTmfIwJ5lOgQb9p3YF9ixHUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZiZMsPc; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZiZMsPc"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e38938a55e7so6889853276.2;
        Thu, 26 Dec 2024 20:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735275025; x=1735879825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mfFPb05f9yJJMJH/JDtIihg55X/Y4bT6/37NooxIdB8=;
        b=hZiZMsPcSg028ZjXuLbKdq9rGmJTtKPSoVFfy/ZaZFr0Eg+w4F9dTTASE5tu27US7Z
         rZUxdKCipTQ+tQYMn1vCTk75CYji3RqMTu/f0HDyNiLw18NHterkrIdJU3ut3l0kSJ+C
         F77lto/aizEdUNJPGr68C7F3SPqIRYGEK6nJKugvnIkRR7fGRGSU8Q5eALOJSuxW22hN
         Jozsq4aGA5u924ZcbQHw82nAr5X1JQKb1slKNQEw1gtRubkgvP1O3E9LGm+iOBYps5Ei
         LKUeMWjs0l44nxs+W9fEIAbb2zQe79ZgFocau1sh7vrO9m2hJ2B7HCb/gAHclJ4jr2CV
         0Jow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735275025; x=1735879825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfFPb05f9yJJMJH/JDtIihg55X/Y4bT6/37NooxIdB8=;
        b=VBl0kE5VPmKGhb8qvsaoI3JKeX4l4n+EuJDKCUsXU48HYQUQ8i2pCA7cGBIn0Vwz9g
         xMrZXE9/2WQuMyGazH/BdeZlFKNyvQe7KemgjAPnl1cmD/PAdz7yEYO/QwjT7a2LXP0A
         bQ4N2j3DIykR04oDvkGR3OpOoDeM/efO3qZT+HmndxoZx6tNmlRAQxnGavt9W+4564cr
         cJyoce0JUDBRj3rlhc9IXJaknS5Ytk9HRohhjO2QZ929EShXnROXKjE/LzXEP5JYWPa/
         +0d+xI1CPH0/JEKlcMo3J+5Y6R5DFOuJRkHxFEVqsKorwVw0jRr19PZFI51lkoVeHH9h
         zpDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX569GtCG8aTZu8LPSjgOBv4Yu5EhA9e8Q1spsFQyN2RrQk61MN98IuVjjPrWAdBLrYpVHzhL6cMZSR110=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwCZy9SA2kf6vKB7FkXr+4c3EWXrYjz7VHlyDJgNdrQp15Jy1L
	k3tZshDQxk0cp8uVA6Om388maxEJKpTce2dvZSZr1ScnNvZzM2Yn
X-Gm-Gg: ASbGncvkmG0ejFS/zkmD7zjLtyXf25wwG/evk/OP7jE1PDUaSy7nPhC065C8gL5rhGk
	c0m8ihcegUrUBqYXydWcxYXzy+3O9TCxkiJm7xLNjBLp7KXWG5gpjD28HeBgp9UtXgXhXwK6a1e
	THhJl40vx2WXO+mYgBWURm6/JiSlh1sr/r6kn0UnFnRr7NGzwOXWPAZeTqKSqUKcqxOo5rE/b1Z
	i/Jk06JA8nzA5DQuojquXGvjGMlRUVKoL+a8jsruvqM1Z487ZbDnQ==
X-Google-Smtp-Source: AGHT+IEdItzmUWvwSnFMgfHrCbnmakE5AfrleO4l5bcOUc0Dqu9r+l8e1IvZt7cOiq+rcNTfV8yqBg==
X-Received: by 2002:a05:690c:688e:b0:6ef:6eba:1d4f with SMTP id 00721157ae682-6f3f80cd9cemr196268717b3.1.1735275025316;
        Thu, 26 Dec 2024 20:50:25 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e7444c7asm40537867b3.37.2024.12.26.20.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:50:24 -0800 (PST)
Date: Thu, 26 Dec 2024 23:50:21 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 09/20] alienware-wmi: Add a state container for thermal
 control methods
Message-ID: <i2b2hkfpwkwa6hla2f5ezrlu7ujbvkdfjxz2tuzajbhsyeoumy@yb3iq7m5du3k>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-10-kuurtb@gmail.com>
 <95e34926-4f06-4443-9798-9089f6073786@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95e34926-4f06-4443-9798-9089f6073786@gmx.de>

On Fri, Dec 27, 2024 at 04:26:05AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:59 schrieb Kurt Borja:
> 
> > Refactor all thermal control methods to use the newly defined awcc_priv
> > state container instead of global variables.
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 71 +++++++++++++++++------
> >   1 file changed, 52 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index f2f6842e27e6..c4ca141d628e 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -403,6 +403,12 @@ struct wmax_u32_args {
> >   	u8 arg3;
> >   };
> > 
> > +struct awcc_priv {
> > +	struct wmi_device *wdev;
> > +	struct platform_profile_handler pp_handler;
> > +	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> > +};
> > +
> >   struct alienfx_priv {
> >   	struct platform_device *pdev;
> >   	struct led_classdev global_led;
> > @@ -415,9 +421,6 @@ struct alienfx_platdata {
> >   	struct wmi_device *wdev;
> >   };
> > 
> > -static struct platform_profile_handler pp_handler;
> > -static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> > -
> >   static u8 interface;
> > 
> >   /*
> > @@ -1027,6 +1030,10 @@ static int thermal_profile_get(struct platform_profile_handler *pprof,
> >   static int thermal_profile_set(struct platform_profile_handler *pprof,
> >   			       enum platform_profile_option profile)
> >   {
> > +	struct awcc_priv *priv;
> > +
> > +	priv = container_of(pprof, struct awcc_priv, pp_handler);
> 
> Please merge those two statements.

Ack.

> 
> > +
> >   	if (quirks->gmode) {
> >   		u32 gmode_status;
> >   		int ret;
> > @@ -1047,18 +1054,21 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
> >   		}
> >   	}
> > 
> > -	return wmax_thermal_control(supported_thermal_profiles[profile]);
> > +	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
> >   }
> > 
> >   static int create_thermal_profile(struct wmi_device *wdev)
> >   {
> >   	enum platform_profile_option profile;
> >   	enum wmax_thermal_mode mode;
> > +	struct awcc_priv *priv;
> >   	u8 sys_desc[4];
> >   	u32 first_mode;
> >   	u32 out_data;
> >   	int ret;
> > 
> > +	priv = dev_get_drvdata(&wdev->dev);
> 
> Same as above.

Ack.

> 
> > +
> >   	ret = wmax_thermal_information(WMAX_OPERATION_SYS_DESCRIPTION,
> >   				       0, (u32 *) &sys_desc);
> >   	if (ret < 0)
> > @@ -1081,33 +1091,56 @@ static int create_thermal_profile(struct wmi_device *wdev)
> > 
> >   		mode = out_data & WMAX_THERMAL_MODE_MASK;
> >   		profile = wmax_mode_to_platform_profile[mode];
> > -		supported_thermal_profiles[profile] = out_data;
> > +		priv->supported_thermal_profiles[profile] = out_data;
> > 
> > -		set_bit(profile, pp_handler.choices);
> > +		set_bit(profile, priv->pp_handler.choices);
> >   	}
> > 
> > -	if (bitmap_empty(pp_handler.choices, PLATFORM_PROFILE_LAST))
> > +	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
> >   		return -ENODEV;
> > 
> >   	if (quirks->gmode) {
> > -		supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
> > +		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
> >   			WMAX_THERMAL_MODE_GMODE;
> > 
> > -		set_bit(PLATFORM_PROFILE_PERFORMANCE, pp_handler.choices);
> > +		set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pp_handler.choices);
> >   	}
> > 
> > -	pp_handler.profile_get = thermal_profile_get;
> > -	pp_handler.profile_set = thermal_profile_set;
> > -	pp_handler.name = "alienware-wmi";
> > -	pp_handler.dev = &wdev->dev;
> > +	priv->pp_handler.profile_get = thermal_profile_get;
> > +	priv->pp_handler.profile_set = thermal_profile_set;
> > +	priv->pp_handler.name = "alienware-wmi";
> > +	priv->pp_handler.dev = &wdev->dev;
> > 
> > -	return platform_profile_register(&pp_handler);
> > +	return platform_profile_register(&priv->pp_handler);
> >   }
> > 
> > -static void remove_thermal_profile(void)
> > +static int alienware_awcc_setup(struct wmi_device *wdev)
> >   {
> > -	if (quirks->thermal)
> > -		platform_profile_remove(&pp_handler);
> > +	struct awcc_priv *priv;
> > +	int ret;
> > +
> > +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	dev_set_drvdata(&wdev->dev, priv);
> > +
> > +	priv->wdev = wdev;
> > +
> > +	ret = create_thermal_profile(wdev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> 
> Just directly return the result of create_thermal_profile() here.

Ack.

> 
> With those minor issues being fixed:
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Thanks!

> 
> > +}
> > +
> > +static void alienware_awcc_exit(struct wmi_device *wdev)
> > +{
> > +	struct awcc_priv *priv;
> > +
> > +	priv = dev_get_drvdata(&wdev->dev);
> 
> Please merge both statements.
> 
> > +
> > +	platform_profile_remove(&priv->pp_handler);
> >   }
> > 
> >   /*
> > @@ -1242,7 +1275,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> >   	int ret = 0;
> > 
> >   	if (quirks->thermal)
> > -		ret = create_thermal_profile(wdev);
> > +		ret = alienware_awcc_setup(wdev);
> >   	else
> >   		ret = alienware_alienfx_setup(&pdata);
> > 
> > @@ -1252,7 +1285,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> >   static void wmax_wmi_remove(struct wmi_device *wdev)
> >   {
> >   	if (quirks->thermal)
> > -		remove_thermal_profile();
> > +		alienware_awcc_exit(wdev);
> >   	else
> >   		alienware_alienfx_exit(wdev);
> >   }
