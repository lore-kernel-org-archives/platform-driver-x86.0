Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7411C282F15
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 21:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772488031; cv=none; b=cw5RkDfgykAJLV2IXQHY/YUfNaLacDWGaShmEUZW1baZNfLoWHPwggihDJktNup/PVn8870wI7csC1p5rb4Owt6uS15rvHeANeBmsM+ViVgszRW9UQIDn0QyXF9cy5TGQwhC07yNFhS6rpl6BYurbY7WzLuNiHJ1CwqV32cxIBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772488031; c=relaxed/simple;
	bh=dT1IXpalStu+SPP9/yEyDqBe3CEMKoo1liAQefdKDQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2gU36VNxkCH6DZb4cMnSlU8az8oQ17AZ60Db/PBW+sRK6PrPslgCz/kJa72GtX6IrzMS2V5zDltfLiZVGKi7CW7X9/JIt+v7H6pnpl7BWYND6qqesXrFbzua2Nr6Vf2kBeYLhb1kU5QRT/L1H1RUJSDtY6mcvoovtEr75GyVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bs5vcCy8; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bs5vcCy8"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65fa4713bd3so8657634a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Mar 2026 13:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772488028; x=1773092828; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Qa7Jz/rcInO9VwDsbRR68ssYjFYwIx+VKYrsv2Ktt4=;
        b=bs5vcCy8Vr5REfVUO8T0946aFCmxUSSNSOskfC7zRh0BstpuN9YUZrxjT66p/1WFu6
         EkjdB2cRiLnplxUbnXAbtTT1L5/qoLXa/I8ZRUgv72ZyMzHLRGfEvqWC3Rx5n6+PSbGl
         dR2kHzbTlFOQucfBooDTSWVKUcEq8f3jYEV437msTx0VERGvRdSqNXtgjNJHYLgK1Jfv
         0g2bNwazSasG2ob6iuhLwG00bINS4fNUHQsxm9QJZ7HuH4cDanGmn+jPO0FnwoUg5GRq
         9X9WFcT9zb1gZJfF0QgRfpgK/GCFbCjJWIUbZUoi2r4j+lydI71Su+TqkJIOGEmIoZg5
         Wqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772488028; x=1773092828;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Qa7Jz/rcInO9VwDsbRR68ssYjFYwIx+VKYrsv2Ktt4=;
        b=Gkf5BxAtPJtxrHLT+qbhIe9ojFW1NaQBGZ5OlHdq8ItXbdM+dcmPDQ0goTJkLkJXZG
         4hnqQunawRY6+U5LysCG2C3+JGI9hBkuk9zjNJMZ8MDyIlXuBK4bG9MPEq4sk0ekuiqZ
         HQp6wAdqlU1XrZ8uiiGUD9Wf3HH5beQW7vxQM3gzoq68zaV7zw3XMJjauWUQiTu5tzhD
         l8WJ4+5eRpiT0kCNkeGg9TNuEqdvrWD5l+3KHRjyorLI4CiAZ++zpa4W46ppS0CwUOBe
         E6yYBoAFXAQJD9kDxWfqagibrN7DSwC3xwk3+EENau1ruxHAM0/iaVvzM+i6MdUjCCEp
         LJrw==
X-Forwarded-Encrypted: i=1; AJvYcCWuIUe3WPIkLrKzkABoNOEEqHm/5iKjp4wa7N30rGEvw0U1DHWc3gxwiMcBxhBuyUCXjR6Tf5oLx+gKuY4otN3uEH72@vger.kernel.org
X-Gm-Message-State: AOJu0YzPItiDhJyzzujOhy37zfmzAueIBL43IK77oHMAVSXtWG1RqHMC
	YFRhT0pQ9tnyqlWgh+OZqjfhf4MUc0RGmEKoPui9Aonbjn+6SKaq88jsCn/Oag==
X-Gm-Gg: ATEYQzxepVDAB2N4e4fFiTg65EDDWN2tV4LKwQHQd7j5GmT9lbFisoOe5BWEgG7F2/N
	53Xvq2cWn8daxuOi3b8Pq6rwU4hISdnbZJUZ0dqoNJQZC27hcKK0EZUdObsVYYMlaazt5IpaPaH
	JqQpDJljpK+T8N1sG0WQX/B/x48kQgA+RY0WJE5Gm7tRGLq1MLVHlSKlW81GaIKnnOnnexyP1Mc
	mhT862OesbcabzE84YxkDfDZz3VvMIhKDiGBHCMw+ofZKGWB9tSS0Llo9RR4jdzdjIV9KHXUmpc
	dNgoBkC70SPh3qiMiK0K12qb9SrHQl/T7ctDJ5W1mw2kdUlN11kqVg9MqV4Eo4alSfKOdziuR17
	cYt8GUakblWf1hWEREzQ7RiaJdP4dM9fVtaRD6U0MaWF/Fj3XZyVzTOCoCHFzKy5RDHdEsKv2aF
	KOI1uMQ4hG6y0lgg==
X-Received: by 2002:a17:907:fdca:b0:b8f:9dc5:4c83 with SMTP id a640c23a62f3a-b93763a48a8mr841871366b.13.1772488027447;
        Mon, 02 Mar 2026 13:47:07 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9385836a84sm370149066b.59.2026.03.02.13.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 13:47:06 -0800 (PST)
Date: Mon, 2 Mar 2026 23:47:06 +0200
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform: x86-android-tablets: lenovo: Add Yoga
 Book haptics entries
Message-ID: <aaYETFppGQHDGQ_G@jekhomev>
References: <20260302-x86-tablets-yogabook-v2-0-061768d5c9e7@gmail.com>
 <20260302-x86-tablets-yogabook-v2-1-061768d5c9e7@gmail.com>
 <33d45e2e-f319-65ae-a05a-279d72411979@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33d45e2e-f319-65ae-a05a-279d72411979@linux.intel.com>

On Mon, Mar 02, 2026 at 01:52:38PM +0200, Ilpo Järvinen wrote:
> On Mon, 2 Mar 2026, Yauhen Kharuzhy wrote:
> 
> > Add drv2604l i2c_board_info for drv2604l haptics drivers present in
> > Lenovo Yoga Book YB1-X90 and YB1-X91. Set properties required for device
> > initialization and self-calibration.
> > 
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > ---
> >  drivers/platform/x86/x86-android-tablets/lenovo.c | 92 +++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
> > index 8d825e0b4661..bc10f00da8c6 100644
> > --- a/drivers/platform/x86/x86-android-tablets/lenovo.c
> > +++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
> > @@ -10,6 +10,8 @@
> >  
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >  
> > +#include <linux/cleanup.h>
> > +#include <linux/device.h>
> >  #include <linux/efi.h>
> >  #include <linux/gpio/machine.h>
> >  #include <linux/gpio/property.h>
> > @@ -114,6 +116,32 @@ static const struct software_node lenovo_yb1_x90_hideep_ts_node = {
> >  	.properties = lenovo_yb1_x90_hideep_ts_props,
> >  };
> >  
> > +static const struct property_entry lenovo_yb1_x9x_drv2604l_0_props[] = {
> > +	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
> > +	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
> > +	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
> > +	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
> > +	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[0], 79, GPIO_ACTIVE_HIGH),
> > +	{}
> > +};
> > +
> > +static const struct software_node lenovo_yb1_x9x_drv2604l_0_node = {
> > +	.properties = lenovo_yb1_x9x_drv2604l_0_props,
> > +};
> > +
> > +static const struct property_entry lenovo_yb1_x9x_drv2604l_1_props[] = {
> > +	PROPERTY_ENTRY_U32("vib-rated-mv", 1500),
> > +	PROPERTY_ENTRY_U32("vib-overdrive-mv", 2100),
> > +	PROPERTY_ENTRY_U32("mode", 0), /* LRA */
> > +	PROPERTY_ENTRY_U32("library-sel", 0), /* DRV260X_LIB_EMPTY */
> > +	PROPERTY_ENTRY_GPIO("enable-gpios", &cherryview_gpiochip_nodes[1], 47, GPIO_ACTIVE_HIGH),
> > +	{}
> > +};
> > +
> > +static const struct software_node lenovo_yb1_x9x_drv2604l_1_node = {
> > +	.properties = lenovo_yb1_x9x_drv2604l_1_props,
> > +};
> > +
> >  static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
> >  	{
> >  		/* BQ27542 fuel-gauge */
> > @@ -159,6 +187,24 @@ static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst
> >  			.polarity = ACPI_ACTIVE_LOW,
> >  			.con_id = "wacom_irq",
> >  		},
> > +	}, {
> > +		/* Keyboard haptics driver */
> > +		.board_info = {
> > +			.type = "drv2604l",
> > +			.addr = 0x5a,
> > +			.dev_name = "drv2604l.0",
> > +			.swnode = &lenovo_yb1_x9x_drv2604l_0_node,
> > +		},
> > +		.adapter_path = "\\_SB_.PCI0.I2C1",
> > +	}, {
> > +		/* Keyboard haptics driver */
> > +		.board_info = {
> > +			.type = "drv2604l",
> > +			.addr = 0x5a,
> > +			.dev_name = "drv2604l.1",
> > +			.swnode = &lenovo_yb1_x9x_drv2604l_1_node,
> > +		},
> > +		.adapter_path = "\\_SB_.PCI0.I2C4",
> >  	}, {
> >  		/* LP8557 Backlight controller */
> >  		.board_info = {
> > @@ -283,9 +329,55 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
> >  	},
> >  };
> >  
> > +#define YB1_X91_DRV2604L_0_DEVICE "i2c-DRV2604:00"
> > +#define YB1_X91_DRV2604L_1_DEVICE "i2c-DRV2604:01"
> > +
> > +static int __init lenovo_yb1_x91_init(struct device *dev)
> > +{
> > +	struct device *drv2604l_0_dev __free(put_device) = NULL;
> > +	struct device *drv2604l_1_dev __free(put_device) = NULL;
> > +	int ret = 0;
> > +
> > +	drv2604l_0_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
> 
> Hi,
> 
> Please read the long comment at the beginning of include/linux/cleanup.h
> (in particular the part where it talks about those varname = NULL 
> constructs).
> 
> While the ordering is not a problem here as is, we don't want to use 
> patterns that are dangerous in other situations.

Got it, thanks for pointing that out, I missed that nuance when I was reading
the comment. I will move declaration from function start to real assignments.

> 
> -- 
>  i.
> 
> > +						 YB1_X91_DRV2604L_0_DEVICE);
> > +	if (!drv2604l_0_dev) {
> > +		pr_err("error: cannot find %s device\n",
> > +		       YB1_X91_DRV2604L_0_DEVICE);
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret = device_create_managed_software_node(drv2604l_0_dev,
> > +					lenovo_yb1_x9x_drv2604l_0_props, NULL);
> > +	if (ret) {
> > +		pr_err("error: cannot create software node for %s: %d\n",
> > +		       YB1_X91_DRV2604L_0_DEVICE, ret);
> > +		return ret;
> > +	}
> > +
> > +	drv2604l_1_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
> > +						 YB1_X91_DRV2604L_1_DEVICE);
> > +	if (!drv2604l_1_dev) {
> > +		pr_err("error: cannot find %s device\n",
> > +		       YB1_X91_DRV2604L_1_DEVICE);
> > +		return -ENODEV;
> > +	}
> > +
> > +	ret = device_create_managed_software_node(drv2604l_1_dev,
> > +					lenovo_yb1_x9x_drv2604l_1_props, NULL);
> > +	if (ret) {
> > +		pr_err("error: cannot create software node for %s\n",
> > +		       YB1_X91_DRV2604L_1_DEVICE);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
> >  	.i2c_client_info = lenovo_yogabook_x91_i2c_clients,
> >  	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x91_i2c_clients),
> > +	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
> > +	.init = lenovo_yb1_x91_init,
> >  };
> >  
> >  /* Lenovo Yoga Tablet 2 1050F/L's Android factory image has everything hardcoded */
> > 
> > 
> 

-- 
Yauhen Kharuzhy
