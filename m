Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319607EF09;
	Thu,  2 Jan 2025 18:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843963; cv=none; b=ieARk9xkAUKO3Xlj4UgwwbEnw033MVrfJ5MKvHAFikDS90C/Uvc1QA+Cy9VqXgXvz53ZfJGsqSB5eXnvT6c9ecb3RAoV4e1Rp/4kp+z1ieovJVgjBMfaPcVg8yDqhUxIRGxsrPPwYZMrROp4pefTigGNTAbNEKJgfoheqRdKjR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843963; c=relaxed/simple;
	bh=R7R1bsUwBo4zpO+StBRB8FjaJm9u9fqIV7lce+GnSLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzoS0JucR8RHS55PyJ7bsTDZcQDom4G74i0Otp7BvUUgxOl+VuX/auMx4/mfLHHC3rS+nGBYpn+1vN4EJGqWzjdwActCv+YDL387NT3apVYrkwKJELOtc16k4UvRrf+li+uu2KfNmqEB8kqImplqSMvb5xEKV9PB7kDTD6l79XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8fOlh2a; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8fOlh2a"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6c3629816so586414085a.1;
        Thu, 02 Jan 2025 10:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735843960; x=1736448760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zFLd6fVMXMQxOsHNGzIF3TeBm1riTtvDlW8oP6spmKM=;
        b=Z8fOlh2aaizFLZ9lQUbNvpkDyCzpUEdHvObL6H50+yRM07F9FsoLCuRFtKxv1OArz9
         /s6D09M8knCN+RVKIbC97Z9BpkVHu0nWsQV54stAZsx192kX9ueS2rq3H/Iiq5dz054N
         IyTp7pfEcu8dX/mvpSWqHnzW2GfGUI/vl2eSFUUfXE3Ew8GqiB3822Fs7zGXrie5wcs+
         aOZS8iWS848xj6Y+LcDVCrgF4A5jkGAGol74B5yFjfGT8WqGQWNedAiwE1weNzrm0wZm
         7bVtqsvuRWeWLpVAiaEpU8zhWl44qKfg23aTpHE+qi8LYyJpdvVoXMHqdCu7Yl+2zyaI
         rLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843960; x=1736448760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFLd6fVMXMQxOsHNGzIF3TeBm1riTtvDlW8oP6spmKM=;
        b=lRsB/jgBX9qiRtqw9NpZm7Hv9axjdfNTjS8ZIY69lzmj8qLk/6x3uCaEuZB94qcPFo
         wlKECGXn0+51qmeaSGh9UPJ35f6SfWXSebdnRb4G13wFBzbQCXB1RW7iZx5PouM/Cs5C
         0S9vzSFj+dYQf0OYeA4dOZm72yLZ2pynK7d+dA61gHy56V5cOuypglywMg1YHCDddVch
         6SpKJBP57Y9f2KD0ZODhEw9/SYL3pZQNj7E4iwKcMRBlWFgGy8JmQdrvLmJwf4gS199S
         eUJShBr2zqLv9LXec+mj70gBmNjs97Qd7g+Yu8B875np2FJAn/Se9BVAgh4hZSKoSZwe
         LTPA==
X-Forwarded-Encrypted: i=1; AJvYcCV+0QkBJuN2hPkAoVE/+hh1EtRlHYYEwEmZIHEbibbE6TzCEQ13lJETXlOsOpjqTqWcADik2hL+6XvImLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEuwaQh+Kltd1mr21GjHcc2L7teMqsApnZqSDqixK8xP1ZJAdb
	a4ZkNp9vO8QZZEyBNjxH5cGRJ3gGRsFmyeGX+O9UVu7I5cQJaCor
X-Gm-Gg: ASbGncvYeA7+Ae1UZoR0s8t9h2uwwvSDP6qTPM9/XzfPk6Va4mdDYyJr+h713RHhnuU
	aNgbDkCF170N/BTvTFyANfJja+JNFBBWp2knudt52HuvJg4hadnlxB8f9hvtEe2QY4W6sP5FG/7
	bVTUQFDPQhplRsoq0lF9Vv/KaTofAvpwzRDBhNegqE+vLpxxT3olnkP3Y7h9RkfRHf89sj4HjBf
	GAg173hNd35YWyRGSP3a1vBUPNN5XRNAnEDi7lkBQuAQMp3gypIew==
X-Google-Smtp-Source: AGHT+IFwDrZC1NDlwW2PGMEfyNJqoH72Pe1Quw9DT/IAIc67nHywe01pmAFRHE7CJC8ifbXNuiCeOg==
X-Received: by 2002:a05:620a:8005:b0:7b6:d4b9:b5a6 with SMTP id af79cd13be357-7b9ba6ef9dfmr7232358885a.11.1735843959960;
        Thu, 02 Jan 2025 10:52:39 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2ce6f6sm1203188685a.27.2025.01.02.10.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:52:39 -0800 (PST)
Date: Thu, 2 Jan 2025 13:52:36 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com
Subject: Re: [PATCH v2 09/20] alienware-wmi: Add a state container for
 thermal control methods
Message-ID: <hw5zica4lqenymejt6qihjdo3osism3kx724rx7csuwuwkjpne@oam5tloectn6>
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-11-kuurtb@gmail.com>
 <a4bb4c1f-a41a-48bd-b7aa-9b9428637a27@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4bb4c1f-a41a-48bd-b7aa-9b9428637a27@gmx.de>

On Thu, Jan 02, 2025 at 05:19:45PM +0100, Armin Wolf wrote:
> Am 29.12.24 um 20:44 schrieb Kurt Borja:
> 
> > Refactor all thermal control methods to use the newly defined awcc_priv
> > state container instead of global variables.
> > 
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 66 ++++++++++++++++-------
> >   1 file changed, 47 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index 87a7997579c9..512384635c4c 100644
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
> >   	struct quirk_entry *quirks;
> > @@ -416,9 +422,6 @@ struct alienfx_platdata {
> >   	struct wmi_device *wdev;
> >   };
> > 
> > -static struct platform_profile_handler pp_handler;
> > -static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> > -
> >   static u8 interface;
> > 
> >   /*
> > @@ -1051,6 +1054,8 @@ static int thermal_profile_get(struct platform_profile_handler *pprof,
> >   static int thermal_profile_set(struct platform_profile_handler *pprof,
> >   			       enum platform_profile_option profile)
> >   {
> > +	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
> > +
> >   	if (quirks->gmode) {
> >   		u32 gmode_status;
> >   		int ret;
> > @@ -1071,11 +1076,12 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
> >   		}
> >   	}
> > 
> > -	return wmax_thermal_control(supported_thermal_profiles[profile]);
> > +	return wmax_thermal_control(priv->supported_thermal_profiles[profile]);
> >   }
> > 
> >   static int create_thermal_profile(struct wmi_device *wdev)
> >   {
> > +	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
> >   	enum platform_profile_option profile;
> >   	enum wmax_thermal_mode mode;
> >   	u8 sys_desc[4];
> > @@ -1105,33 +1111,55 @@ static int create_thermal_profile(struct wmi_device *wdev)
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
> > +	priv->wdev = wdev;
> > +
> > +	ret = create_thermal_profile(wdev);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return 0;
> 
> Please directly return the result of create_thermal_profile() here.

Sure!

> 
> > +}
> > +
> > +static void alienware_awcc_exit(struct wmi_device *wdev)
> > +{
> > +	struct awcc_priv *priv;
> > +
> > +	priv = dev_get_drvdata(&wdev->dev);
> 
> Please assign priv directly.

I will.

> 
> With those minor issues being fixed:
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> 
> > +
> > +	platform_profile_remove(&priv->pp_handler);
> >   }
> > 
> >   /*
> > @@ -1271,7 +1299,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> >   	int ret;
> > 
> >   	if (quirks->thermal) {
> > -		ret = create_thermal_profile(wdev);
> > +		ret = alienware_awcc_setup(wdev);
> >   	} else {
> >   		ret = alienware_alienfx_setup(&pdata);
> >   		if (ret < 0)
> > @@ -1287,7 +1315,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> >   static void wmax_wmi_remove(struct wmi_device *wdev)
> >   {
> >   	if (quirks->thermal)
> > -		remove_thermal_profile();
> > +		alienware_awcc_exit(wdev);
> >   	else
> >   		alienware_alienfx_exit(wdev);
> >   }
