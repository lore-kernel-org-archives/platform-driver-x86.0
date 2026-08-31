Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9933A38C402
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208497; cv=none; b=SOGnJodZi6WpNcXEcj6i0z8cx11+iqy1tP+Si0atGVsEhIlL7y1dwq7v0PRyf23gf2JSm5q0WgW6I5pjEQfHwxI4AAOTpqg4e6PCfyGMtM8Vcef2A+YfTQ28bqLjAao+0F/Hajdd8AUcQx8V0OhkxSYQWhDNj0Bv6VAIbRyHQIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208497; c=relaxed/simple;
	bh=FL78rclV+IdeJW+ekBN7/QGoWNQ9BFDAv8ispgcPRqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STh2wTVZwDjJ8RjF3wexYsFQogUns1qKzpOFNRlVQ3CZc6VqHRufMAyiGxGj7WgsWfwBjt71ofJsXg02tye/J/TUkmtqIxcOvV/OVuPcoVgfC60n/2H4YAURUNzlqaAB3k4MigAXf1c0oFfoOm1VuX2wxO/18lwDwsGdZpEgYpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPp6gIxs; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPp6gIxs"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3883139a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 13:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788208495; x=1788813295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HSlql4RoUUTRImnVuqTauaujxD7Mb7m7PbW8imcSMrQ=;
        b=fPp6gIxsQ+yMlfNBXYaEI0RJ2lPGRiR6zZSu3vg9Q3lxaf42ecuEkCbax5UY8knP9u
         7kBUmB14q8UuMjcclgQx1ztldqAQTc/fGUHyA6uH2siPVO5j/GkJkL+rYdItdYMGbGj0
         8vXCQILFdo7qB0aPfh1H388r0cwAsFpNcuZBSxqwXbQ8Z6Bj0jFpJ7GOtkCc/xO0vwsQ
         2Cj2cm6Kw11/6ZmFHDzNY5pD9hkLgMI+N4Mp6Xt8BO1Ea89+HOa7uLyM8OJv1EGSftQJ
         i+nYxWwHcZH+O2JBIdRMj6FDc6WhIftA0t302zbLNMMHB0JZn9EgjBmTduFCBRvQGaOx
         /gFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788208495; x=1788813295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HSlql4RoUUTRImnVuqTauaujxD7Mb7m7PbW8imcSMrQ=;
        b=ZDqmFgnSLKC6mJrRR5dBLnIdzqQuUvYmdmAg8sbOUqf8XFzwnlex7s5xpB13SAqJIL
         NQ/cmYwsh0Au07vQoF45F7PfAsnA0N6s6zl3tbUjQmtg2FIF4hBriyNLYK7Za+PCLjCi
         r+Y8fjRZxbxWd2F74L0bm4WZqVw34BNvdpYyqY7dwfVs+J86yMSLpZiFyiNmSl/9gXl3
         nSZjZEq89kwKBH+lfN4Hab3GWdgJgeNPMs6peyUzXIEZYHK7IAMajN6Mwke9rAWHyTMC
         8jb5glohI/MQYgqJYfNbhRsdQL9rpDOtTfVNNDRMyvxxmGSTLsetYgG2bCKEoysXOLw+
         dQNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPVylR3o21WxOZ967BdyCRkxeU4VhyvhO8nVk4QZbkncg72ITAa6vhuKiV95vizpMcNZCdJByXJgjtF7g1vyW5fC4C@vger.kernel.org
X-Gm-Message-State: AFuF++nBWeBjVM0ss5yk01kzmOv3USzSM1o/UE8tEpChl5x5o4Nt6uTq
	8v+YEgQsTRk5lpnP0mUPO3riciqhJX6hbBrrSfrNaHWYtItOn3H+FOvV
X-Gm-Gg: AYBFou1Gyt16JuzFb7Wd2ZUvQqxX7pJU5KNnis3NygEQKRRvjX8E/y4efdBy8v3y5Tw
	sE5c7hJScXyTT6ffyLIQY1hKuGHDx/lgcqq2W9ztxJ3treZc02c5kMjpRTQNOIwNUEaRf0cnZo5
	UEQEJiAy/emcGWklhbm9XVfiQMNVec7m+Cfwg+kGD6x2xHSqHc9JNpe6WBlX35+vA2n03VN6O0/
	1bt58C8yTmiV46WMMOuhZINeKcs+4hKGazaW13Rn934DrM00ZDKgH/JVupFxZBaD13GW3masB2+
	eWIi1FpvAjB8IVjMbwMRk11sZnTSWxt630hfzH2ztYCzq8R1VcD5vnjJx286aD2ezA78dtaV7vz
	fcJ5Gi/0otvyXRcfycMeXVTY5UEi1t3HfZtdN674Lew7v2/sKtw9ltaun2rcCMBuVW2qPHgxkVx
	N1sIJLpT2FvrySRRkxm8dCPQWDgAytNTFinxI5OAL+4/JPGLEJW9PO7rFusQoj6VTHC2qKYFErw
	1z8AOghbNUJTS2KhmOzLv6501F1hRgFBVDHu+bqdw==
X-Received: by 2002:a17:90b:2884:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-398c3c9d103mr19746139a91.0.1788208494695;
        Mon, 31 Aug 2026 13:34:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:15e9:e9f4:23e3:4f32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm14823180eec.1.2026.08.31.13.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:34:53 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:34:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: x86-android-tablets: fix
 gpio_secondary_fwnode_init() not working
Message-ID: <apXk7-_MJ5ZTZFOI@google.com>
References: <20260831201157.36397-1-johannes.goede@oss.qualcomm.com>
 <apXgib0baybxwWSc@google.com>
 <aae3cd89-5c0e-4695-829b-f5e81a0e4633@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aae3cd89-5c0e-4695-829b-f5e81a0e4633@oss.qualcomm.com>

On Mon, Aug 31, 2026 at 10:28:33PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 31-Aug-26 22:22, Dmitry Torokhov wrote:
> > On Mon, Aug 31, 2026 at 10:11:57PM +0200, Hans de Goede wrote:
> >> acpi_bus_find_device_by_name() call returns a pointer to the device object
> >> on the ACPI bus, aka the ACPI companion device.
> >>
> >> gpio_secondary_fwnode_init() then continues with setting the secondary
> >> fwnode on this device. But this is not the actual physical device for
> >> the GPIO controller (e.g. the GPIO controller platform bus device).
> >>
> >> This mismatch is causing GPIO lookups by secondary fwnode to not work.
> >>
> >> Modify gpio_secondary_fwnode_init() to instead set the secondary fwnode
> >> of the first physical device associated with the ACPI companion device.
> >>
> >> This fixes the GPIO lookups not working.
> > 
> > Nice find, thank you!
> > 
> >>
> >> Fixes: 1448c2d2ca5c ("platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips")
> >> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> >> ---
> >>  drivers/platform/x86/x86-android-tablets/core.c | 10 ++++++++--
> >>  1 file changed, 8 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> >> index b028af1c9942..1706287fd136 100644
> >> --- a/drivers/platform/x86/x86-android-tablets/core.c
> >> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> >> @@ -417,9 +417,15 @@ static int gpio_secondary_fwnode_init(struct device *parent,
> >>  		if (WARN_ON(!fwnode))
> >>  			return -ENOENT;
> >>  
> >> -		set_secondary_fwnode(dev, fwnode);
> >> +		struct device *phys_dev = acpi_get_first_physical_node(to_acpi_device(dev));
> >> +		if (!phys_dev)
> >> +			return dev_err_probe(parent,
> >> +					     -ENODEV, "No physical device for ACPI GPIO dev: %s\n",
> >> +					     (*swnode)->name);
> >>  
> >> -		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(dev));
> >> +		set_secondary_fwnode(phys_dev, fwnode);
> >> +
> >> +		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(phys_dev));
> > 
> > I am surprised that acpi_get_first_physical_node() does not bump up
> > refcount of the device...
> > >>  		if (ret)
> >>  			return ret;
> > 
> > This leaks refcount on error though...
> 
> The or_reset part of devm_add_action_or_reset() will call gpio_secondary_unset
> on failure which puts the ref we take here on phys_dev.

Ah, yes, you are right. Sorry for the noise.

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
