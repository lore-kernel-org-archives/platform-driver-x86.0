Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DB538CFF8
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 20:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207761; cv=none; b=hlH7iryTu7ctztb0HuZjB7np65AA7+lkM7WMSAXKF3LpWEB9abihezWnciZYWw/9Dxx+i4rQN7lxo0w+Nz5AQLwApBHfvG2059BO3dxB+qy0I7YI1gZZ2Gh2YXlgHol3M3UiO8AcNI6uKhAdEYG8v1FvA+cg3EVTbBNTdp4nhBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207761; c=relaxed/simple;
	bh=z8BNwrNcUBi4t8zDrEGXYcHCy9vs3R+JPt2ekIg+pdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rx8pxmDuRBd5kWVhkXvhyk9DkL/rtrUDVG6fiZMPCJCNuruyWgj11O9+u/NCjlpMlKg1aqoLXcyax5d96NvCLsdX8I0iEgNU+etEuVr7ckrVD3LE49v1d9b0xH6isVlTkAqRM/29k6OCJner0/k5NqvxstO8XPcpi2ZgdMpi62w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lp9ACPOR; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lp9ACPOR"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1ceadbd16so4278506a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788207758; x=1788812558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBv9tdXwwedJ5wHsBLlzPFEXM6MsuUGHb/cWHTG1zcg=;
        b=Lp9ACPOR2Sksr0CNy6x7TnlTYdIdSuax5YuUPGtTBUk87AOH4F4rUqfjOwdSYYWou6
         34rnMi4qOfLEyIZFbcNN1/G96nEzJHmbeMNTa0VZ0PVlsf/lN/c51VSeWSfMSbyp/Zjy
         WFONa0tZ8Bnu+gmvcsrUIVOTXeMyN5hL1Zy1Sw6JnCKynzcyTcexfym09f1LI2YJc1AA
         8/GNnFbmknGo5Es4edOEH2GX4viU9PphD8tSCqeJCMzMlj5nmlfxy4FmAXxzoAFqduAU
         pnD28xbkD8+ZlnAK0Tt0OXm72CDeuzOR6Wtt6z/fXhbiHBWB/dF2WEU6RezgZzJ/iJ/A
         NtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788207758; x=1788812558;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBv9tdXwwedJ5wHsBLlzPFEXM6MsuUGHb/cWHTG1zcg=;
        b=ILbGYYYvXtf8+HY3TncmzVxJq6zm1yhk0ow5oFv6rr1PH2n6QQn5OTYmxBUH+9BYKk
         +PzY4ssAqWz3G2hX8TKWXt12YCwieBQzJ1yWaAgO/lSaRHn0Qt6PC41JzCK4lAMJdMm+
         6JaF6+F7eZreYZTH2EIhrwIzLq/CITewbwNQfbMVJ6eXCRaHodAX9/45TNNRs3DGIKLU
         lxBy4vkxSyW29Zh+ED50Fwfq7LJSAecQ/d2td+z55CiAg2r8s4r4fn8mLt8hMFmXzMca
         JxfsZNe0Gwp5FRF5qrDu5cbZw+YJirN2ymBc/z+ltpVQixqj7pSiwy79FaSDeNaLejH3
         VyHw==
X-Forwarded-Encrypted: i=1; AHgh+Rqw/XJPSu6Jkv/txIvcxEndnG1Yi4ZIQdSbIa9ngNsSfwh5+uJ3p32BLFUBhz7SrLqf4iPuQoJG1mG0iznIXvxClqF3@vger.kernel.org
X-Gm-Message-State: AFuF++nplVIQU/zlT0zwIgiXjAu01E14KUllolRrObnIDeMD1lWkREsd
	TM+JKFiKjBbop4b5L50gQyWFZX759u9rytMuCqtVhNIshJO875WS9om4
X-Gm-Gg: AR+sD11STs+AkQoq3LJEGFRBW2TM7gAbPP1/xOIKmDrODPTNPI9K/707Arl2PR94Neg
	sEPO+BIdhmv6ZUuuAq5xvW6AwwQJvLlBh78tYTkfJyvK9HlGae4Bcd/YhgnjgtdgewcBo1fC9zE
	EUX5GUXfp7XCnYLu3Iw6YwNUFcKcxlN6X64xzN9mJ4cZYf8xvQugjnubtDeqItVBLzRb5rilAWW
	GXI4jMUfkKrJKaWaTp/bfGtdlbFWVLqzpucXqrDLB39zt8XqzuI7ayweeG2ZTrTGedgzddIRusl
	q1vxWsRAzZUo95e7VlH5JahNds95J+sO6ZnPTNj0L9/DzAAdRKv6SwxvgDIAkt7ZuZ6+SimG82/
	XsgXg635M3A0LsHDafmufq2vRYmnYmlAKQvBk9V/jEyBqbMCA1c1k+hwwCHILowQdFp18LxBoUs
	iGHbJAcsWqYCSNKiWoRuYadngLLv696GB3jIh41Yz0D/8Xjxcs9mD/ilq4TKtktCU8aSOrLj/hP
	SWAjRFV6c9gTaTg2kuYw7eBx4vZZg==
X-Received: by 2002:a05:6a20:d043:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3d265e3f83fmr50211494637.4.1788207758438;
        Mon, 31 Aug 2026 13:22:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:15e9:e9f4:23e3:4f32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm29851683c88.10.2026.08.31.13.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:22:37 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:22:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: x86-android-tablets: fix
 gpio_secondary_fwnode_init() not working
Message-ID: <apXgib0baybxwWSc@google.com>
References: <20260831201157.36397-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831201157.36397-1-johannes.goede@oss.qualcomm.com>

On Mon, Aug 31, 2026 at 10:11:57PM +0200, Hans de Goede wrote:
> acpi_bus_find_device_by_name() call returns a pointer to the device object
> on the ACPI bus, aka the ACPI companion device.
> 
> gpio_secondary_fwnode_init() then continues with setting the secondary
> fwnode on this device. But this is not the actual physical device for
> the GPIO controller (e.g. the GPIO controller platform bus device).
> 
> This mismatch is causing GPIO lookups by secondary fwnode to not work.
> 
> Modify gpio_secondary_fwnode_init() to instead set the secondary fwnode
> of the first physical device associated with the ACPI companion device.
> 
> This fixes the GPIO lookups not working.

Nice find, thank you!

> 
> Fixes: 1448c2d2ca5c ("platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips")
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/platform/x86/x86-android-tablets/core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> index b028af1c9942..1706287fd136 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -417,9 +417,15 @@ static int gpio_secondary_fwnode_init(struct device *parent,
>  		if (WARN_ON(!fwnode))
>  			return -ENOENT;
>  
> -		set_secondary_fwnode(dev, fwnode);
> +		struct device *phys_dev = acpi_get_first_physical_node(to_acpi_device(dev));
> +		if (!phys_dev)
> +			return dev_err_probe(parent,
> +					     -ENODEV, "No physical device for ACPI GPIO dev: %s\n",
> +					     (*swnode)->name);
>  
> -		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(dev));
> +		set_secondary_fwnode(phys_dev, fwnode);
> +
> +		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(phys_dev));

I am surprised that acpi_get_first_physical_node() does not bump up
refcount of the device...

>  		if (ret)
>  			return ret;

This leaks refcount on error though...

>  	}

Thanks.

-- 
Dmitry
