Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E162CC432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 20:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB88B60FC1
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 20:31:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239072AbhHYUcC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 16:32:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbhHYUcB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 16:32:01 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E82C061757
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 13:31:15 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id m11-20020a056820034b00b0028bb60b551fso186662ooe.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 13:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KYqe8JKHNYTMBSJFfv1Hv3G0ZzbxJ8LlL3i+63XeEkI=;
        b=RYZX7lNpqMpLpHSNphl2upN/EtWg8qLFgh2zY2fPr4QOYSxHgtWotuBEX4Rw1lzm2O
         s/jjaa/v9xKpzZLRjZiz/ySMjIxfnfHXWWX3wmq76DBRUphnk61phum3EDWyGUDznAxp
         VSu6wdc6/fn8DHqJRGT0rmYP9sezmROf+/nE3W9cGpP6HC4b8E5p5F7dZelPQEW19SkG
         f54O8j02C4J2yePk5M52tQvU4sOxKevN76C0AYpOOffjRHnB77h2/By5ZieNMQJ2edQm
         dsTIPIzO5mxMBJJlBNB87p2onfUmwkeELHh9eGCUWmoSXP1tfh2t5IoKKYJuBawBkZ5y
         sKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=KYqe8JKHNYTMBSJFfv1Hv3G0ZzbxJ8LlL3i+63XeEkI=;
        b=Lm8PXR17G/Wdmd5bEsuwAcM8dA2IBnpE42uF9D1ao0Qmb2siHVwEkD7ZVzICDZht8r
         ZtVTpJZI94tnEI+EcAlD1JV5bz1D2l2M23tCvYYUe9OrhMQYFMZOQo8gciIqMET8nQMb
         3lptX8SoZjt4g6n+hcv7pJyQ16K+YB+JpRkiISacrmpHsgTowOzT7K+rukd9fLEyimr1
         7uJai++TlKeZKBVfLsi3aU8whO5elbNLdiXoS0xuYvsMc0CyDeN11vtSg5vNTbf7UHW5
         w9MjC401sjUh8qkVsQjv6InP+kD2Ta/DoKrVuZEIs0XKpz5K/Q9QpJyAB0me8bM7xGw0
         tfZw==
X-Gm-Message-State: AOAM530wEJyvN35SRttZ1EBCRLUpYJsVgKTQBdO4naWY/84pTP8vOII7
        i+H80XGc+A9aqp7puQd5vO8=
X-Google-Smtp-Source: ABdhPJzwMLfcQvM0fERblGGkMxbv/NE1oIPGZOADPHF9MsIWjNnP6rHcY/BED4T9tvcv9ZxL4BeGhA==
X-Received: by 2002:a4a:966d:: with SMTP id r42mr151917ooi.11.1629923474563;
        Wed, 25 Aug 2021 13:31:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f126sm184808oob.9.2021.08.25.13.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 13:31:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 25 Aug 2021 13:31:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Enver Balalic <balalic.enver@gmail.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH v3] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <20210825203112.GH432917@roeck-us.net>
References: <20210823185407.i7tk5bgofedqxfxf@omen.localdomain>
 <20210824173501.GA3402937@roeck-us.net>
 <20210824191132.o2eym6rq7pjgsxqy@omen.localdomain>
 <20210824193241.GA3414880@roeck-us.net>
 <20210825165852.ga5r6arfow7xv4dl@omen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825165852.ga5r6arfow7xv4dl@omen.localdomain>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Aug 25, 2021 at 06:58:52PM +0200, Enver Balalic wrote:
> Hi, 
> 
> before I go out and send out a V4 of this, I wanted to check
> if you agree with the changes I plan on making
> 
[ ... ]

> > > > >  static int thermal_profile_get(void)
> > > > >  {
> > > > >  	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> > > > > @@ -946,19 +1092,34 @@ static int thermal_profile_setup(void)
> > > > >  	int err, tp;
> > > > >  
> > > > >  	tp = thermal_profile_get();
> > > > > -	if (tp < 0)
> > > > > -		return tp;
> > > > > +	if (tp >= 0) {
> > > > > +		/*
> > > > > +		* call thermal profile write command to ensure that the firmware correctly
> > > > > +		* sets the OEM variables for the DPTF
> > > > > +		*/
> > > > > +		err = thermal_profile_set(tp);
> > > > > +		if (err)
> > > > > +			return err;
> > > > >  
> > > > > -	/*
> > > > > -	 * call thermal profile write command to ensure that the firmware correctly
> > > > > -	 * sets the OEM variables for the DPTF
> > > > > -	 */
> > > > > -	err = thermal_profile_set(tp);
> > > > > -	if (err)
> > > > > -		return err;
> > > > > +		platform_profile_handler.profile_get = platform_profile_get;
> > > > > +		platform_profile_handler.profile_set = platform_profile_set;
> > > > > +	}
> > > > 
> > > > I don't really understand the above logic change. Why is
> > > > the error from thermal_profile_get() now ignored ?
> > > > 
> > > > >  
> > > > > -	platform_profile_handler.profile_get = platform_profile_get,
> > > > > -	platform_profile_handler.profile_set = platform_profile_set,
> > > > > +	tp = omen_thermal_profile_get();
> > > > > +	if (tp >= 0) {
> > > > > +		/*
> > > > > +		* call thermal profile write command to ensure that the firmware correctly
> > > > > +		* sets the OEM variables
> > > > > +		*/
> > > > > +		err = omen_thermal_profile_set(tp);
> > > > > +		if (err < 0)
> > > > > +			return err;
> > > > > +
> > > > > +		platform_profile_handler.profile_get = platform_profile_omen_get;
> > > > > +		platform_profile_handler.profile_set = platform_profile_omen_set;
> > > > 
> > > > It looks like omen_thermal_profile_get() has priority over
> > > > thermal_profile_get(). If so, it might make more sense to execute it first
> > > > and only call thermal_profile_get() if omen_thermal_profile_get() returned
> > > > an error. If ignoring the result from thermal_profile_get() is on purpose,
> > > > it might make sense to drop that code entirely.
> > > > 
> > > > I am not entirely sure I understand what this code is supposed to be doing,
> > > > though. Some comments might be useful.
> > > Looking at it again, as it stands this is wrong, the omen code should only
> > > run if the regular thermal_profile_get() returns an error, and not how it
> > > is now.
> > > 
> > > Background to this is that the thermal_profile_get() code doesn't work on
> > > the Omen, so the omen specific path is needed, but only in the case that
> > > the regular, non-omen code fails.
> > > 
> > > As for ignoring the errors, I guess that in the case that both the regular
> > > thermal_profile_get, and omen_thermal_profile_get fail, this function
> > > should just return -EOPNOTSUPP instead of returning the error code of the
> > > last function that ran (omen one) like it does now ?
> > 
> > I can't really say since I am not that involved in the driver.
> > All I noticed is that the code is odd and difficult to understand.
> > There should be a better means to determine if the system is an
> > "Omen" than trial and error, possibly from its DMI data or maybe
> > from its WMI GUIDs.
> I took a look at how the Windows Omen Command Center program detects what machine
> is an Omen, and I found they match the DMI Board Name against a list of Omen
> board names. I should do the same in this case.

I would think so, but that is really a decision to be made by the driver
maintainer.

> > 
> > > > 
> > > > > +	} else {
> > > > > +		return tp;
> > > > > +	}
> > > > 
> > > > 	if (tp < 0)
> > > > 		return tp;
> > > > 
> > > > followed by non-error code would be more common.
> > > > 
> > > > >  
> > > > >  	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
> > > > >  	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
> > > > > @@ -973,6 +1134,8 @@ static int thermal_profile_setup(void)
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > +static int hp_wmi_hwmon_init(void);
> > > > > +
> > > > >  static int __init hp_wmi_bios_setup(struct platform_device *device)
> > > > >  {
> > > > >  	/* clear detected rfkill devices */
> > > > > @@ -984,6 +1147,8 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
> > > > >  	if (hp_wmi_rfkill_setup(device))
> > > > >  		hp_wmi_rfkill2_setup(device);
> > > > >  
> > > > > +	hp_wmi_hwmon_init();
> > > > > +
> > > > This doesn't really make sense. If it is critical, it should abort here.
> > > > If it isn't, the function should not return an error only for it to be
> > > > ignored.
> > > > 
> > > > Also, if hwmon functionality isn't critical, the driver should not depend
> > > > on HWMON since it performs perfectly fine without it.
> > > Here if it's running on an omen and HWMON isn't there, there is no reporting
> > > of fan speeds and the max/auto toggle won't work. So I don't know if that is
> > > considered `critical`. I would guess not ?
> > 
> > The point I am trying to make is
> > 
> > 1) If the return value from hp_wmi_hwmon_init() is ignored,
> >    hp_wmi_hwmon_init() should not return a value.
> > 
> > 2) If the return value from hp_wmi_hwmon_init() is ignored, the hwmon
> >    functionality is not critical, and the driver should not depend on HWMON.
> > 
> > "critical", in the sense I meant, means critical to system operation.
> > The meaning depends on the driver author, of course. I can not really say
> > if the driver should depend on HWMON or not. All I can say is that it is
> > inconsistent to make the driver depend on HWMON and then to ignore that
> > hwmon device instantiation failed.
> I took a look at how other vendor's WMI drivers handle this, and a couple of
> them depend on HWMON (asus, gigabyte), while the thinkpad and eeepc ones
> select HWMON instead of depending on it. Here I think I should just handle
> this error properly, and leave the HWMON dependency in this driver ?

Ok with me but, again, the maintainer should have an opinion about this.

> > 
> > > > 
> > > > >  	thermal_profile_setup();
> > > > >  
> > > > >  	return 0;
> > > > > @@ -1068,6 +1233,139 @@ static struct platform_driver hp_wmi_driver = {
> > > > >  	.remove = __exit_p(hp_wmi_bios_remove),
> > > > >  };
> > > > >  
> > > > > +static umode_t hp_wmi_hwmon_is_visible(const void *data,
> > > > > +					enum hwmon_sensor_types type,
> > > > > +					u32 attr, int channel)
> > > > > +{
> > > > > +	switch (type) {
> > > > > +	case hwmon_temp:
> > > > > +		if (hp_wmi_read_int(HPWMI_HDDTEMP_QUERY) >= 0)
> > > > > +			return 0444;
> > > > > +		else
> > > > 
> > > > else after return is unnecessary (static analyzers will complain).
> > > > 
> > > > > +			return 0;
> > > > > +	case hwmon_pwm:
> > > > > +		return 0644;
> > > > > +	case hwmon_fan:
> > > > > +		if (hp_wmi_get_fan_speed(channel) >= 0)
> > > > > +			return 0444;
> > > > > +		else
> > > > 
> > > > Same as above.
> > > > 
> > > > > +			return 0;
> > > > > +	default:
> > > > > +		return 0;
> > > > > +	}
> > > > > +}
> > > > > +
> > > > > +static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > > > > +			u32 attr, int channel, long *val)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	switch (type) {
> > > > > +	case hwmon_temp:
> > > > > +		ret = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
> > > > > +
> > > > > +		if (ret < 0)
> > > > > +			return ret;
> > > > > +		*val = ret;
> > > > 
> > > > hddtemp is not documented, so the reported units are unknown.
> > > > Is this in milli-degrees C ? If yes, a comment might be useful.
> > > > If not, please adjust.
> > > The previous version of this patch added hwmon to this driver,
> > > before this value was exposed via a non-standard hddtemp param.
> > > That param didn't have a specified unit, so that's an unknown to
> > > me. It isn't documented anywhere in the driver.
> > > The old hddtemp param just printed out the integer value.
> > > Should this be removed then since it's an unknown ?
> > 
> > Question is what that integer value reflects. Presumably you have the
> > system, so you should be able to see the value. From there it should be
> > possible to determine the scale and if it is reported in degrees C or
> > in Kelvin.
> Actually, this functionality doesn't work on my system so I
> can't figure out what the unit it is that way. So maybe it would be best 
> to leave it out of HWMON and just let it be a non-standard sysfs attribute
> like it was before this patch ?

Agreed. Sorry, I assumed that this is working everywhere.

Thanks,
Guenter
