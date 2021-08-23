Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3C7C4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 17:12:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63BE761372
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 17:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhHWRNd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Aug 2021 13:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhHWRNd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Aug 2021 13:13:33 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F37DC061575
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Aug 2021 10:12:50 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i6so3519914wrv.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Aug 2021 10:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tp902ygnCAVS7WmmeqCMoMKGrMsordS8rBjjfFCYoM4=;
        b=jdyQInJRCautzz+a5UMubdlOaxEMVWKD2LNGxmh0dQPadQi8wTQp6jOpZHkjHe4vyx
         9iAQdu/WpmTgVIKgu2OtxMBRbV17Lbttpsl/8qjl5co7jDckWowNpXJ1xS60HLay5LCg
         7UgTFEcgIoZ5TX189R6Hr+snXF3p+bBZBY/aZcbJN+JoAhfdTnaZjYa/yVATUw6ynikt
         IMWZwBy+CC7aZKp/F9psUjUmu6tVwSQXQ48ZSAivDBcN3uwNpqDpUS5Bidyo9GYqm+o/
         5mLZ3jFY9TcObn1t+ExeoaPFItc01+EwL/LdLxX8ZgTwKw8LyTNOb0o8PfjO9lwkt0tR
         O79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tp902ygnCAVS7WmmeqCMoMKGrMsordS8rBjjfFCYoM4=;
        b=DK0/2780Kw9SeMrDEjWTXXM3ntrNSIb4tuXsrsznoRNvTHz/s83OZW2/8bMQUl6AKf
         sgC3fMbalfG19lX08Cpd1Jvry3VJsVDyX/ND77YuEgiZRVRc/9jUytzlSfhJcD0RftBf
         nKpUQICq3p52q1jt2AF55A8R9JiWfHyIRjsvIpbr7OqlE5vI6iKZWmRuELYm/lyXOOVO
         ywMNHKCyZTFHdSdbAGZ7wAjI8P8mWD79KRQ64FgwlSuLjkB7CRMZixyLQgKecpJETaa4
         8SgBrS5TBgCQF47WTMiEAE0gtx4FrlIaLdsb4MeZe28ifrvp0Q9JZn/YiOtN7Y8R1zcJ
         F3GA==
X-Gm-Message-State: AOAM530PZluuY4zTMqPLUKC4vqM74zIokBt/tW4cThl/r8yPyiNqnhR+
        h1HpnsIJ4bQJjWCHYcE1kHU=
X-Google-Smtp-Source: ABdhPJx3gQbMDCeWI62SvztQuBFfhS2rptqW6++dQiEqPeO9brvhs+YkWjbffAINDutoO1YzEdTX4A==
X-Received: by 2002:adf:f889:: with SMTP id u9mr3850829wrp.67.1629738768659;
        Mon, 23 Aug 2021 10:12:48 -0700 (PDT)
Received: from omen.localdomain ([188.127.120.115])
        by smtp.gmail.com with ESMTPSA id f66sm8071128wma.34.2021.08.23.10.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:12:48 -0700 (PDT)
Date:   Mon, 23 Aug 2021 19:12:45 +0200
From:   Enver Balalic <balalic.enver@gmail.com>
To:     =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com, jdelvare@suse.com,
        linux@roeck-us.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <20210823171245.q3hu5eki6zbf5ijx@omen.localdomain>
References: <20210823141521.2gxhsoqx7brrovfl@omen.localdomain>
 <hAisOfmIeiaMvSxmFY6D-GL2f-Fo94dNFcQj5bl4j0Lj08YDiTXMzfOHErbNqkGJ_2vrdadsbcv27qIB-YMliEfqs3H7QAzrpEdQZ0rLc0o=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hAisOfmIeiaMvSxmFY6D-GL2f-Fo94dNFcQj5bl4j0Lj08YDiTXMzfOHErbNqkGJ_2vrdadsbcv27qIB-YMliEfqs3H7QAzrpEdQZ0rLc0o=@protonmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Aug 23, 2021 at 04:40:08PM +0000, Barnabás Pőcze wrote:
> Hi
> 
> 
> 2021. augusztus 23., hétfő 16:15 keltezéssel, Enver Balalic írta:
> > This patch adds support for HP Omen laptops.
> > It adds support for most things that can be controlled via the
> > Windows Omen Command Center application.
> >
> >  - Fan speed monitoring through hwmon
> >  - Platform Profile support (cool, balanced, performance)
> >  - Max fan speed function toggle
> >
> > Also exposes the existing HDD temperature through hwmon since
> > this driver didn't use hwmon before this patch.
> >
> > This patch has been tested on a 2020 HP Omen 15 (AMD) 15-en0023dx.
> >
> >  - V1
> >    Initial Patch
> >  - V2
> >    Use standard hwmon ABI attributes
> >    Add existing non-standard "hddtemp" to hwmon
> >
> > Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
> > ---
> >  drivers/platform/x86/Kconfig  |   1 +
> >  drivers/platform/x86/hp-wmi.c | 302 ++++++++++++++++++++++++++++++++--
> >  2 files changed, 292 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index d12db6c316ea..f0b3d94e182b 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -431,6 +431,7 @@ config HP_WMI
> >  	tristate "HP WMI extras"
> >  	depends on ACPI_WMI
> >  	depends on INPUT
> > +	depends on HWMON
> >  	depends on RFKILL || RFKILL = n
> >  	select INPUT_SPARSEKMAP
> >  	select ACPI_PLATFORM_PROFILE
> > diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> > index 027a1467d009..20cf8a32e76e 100644
> > --- a/drivers/platform/x86/hp-wmi.c
> > +++ b/drivers/platform/x86/hp-wmi.c
> > @@ -22,6 +22,7 @@
> > [...]
> >  enum hp_wmi_command {
> >  	HPWMI_READ	= 0x01,
> >  	HPWMI_WRITE	= 0x02,
> >  	HPWMI_ODM	= 0x03,
> > +	HPWMI_GM    = 0x20008,
>                 ^^^^
> The other command values are aligned using a single tab.
> 
> 
> >  };
> > [...]
> > +static int hp_wmi_get_fan_speed(int fan)
> > +{
> > +	int fsh, fsl, fan_speed;
> > +	char fan_data[4] = { fan, 0, 0, 0 };
> > +
> > +	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
> > +				       &fan_data, sizeof(fan_data),
> > +				       sizeof(fan_data));
> > +
> > +	if (ret != 0)
> > +		return -EINVAL;
> > +
> > +	fsh = fan_data[2];
> > +	fsl = fan_data[3];
> > +
> > +	// sometimes one of these can be negative
> 
> If the speed is e.g. 1279 RPM, that's 0x04FF, which will be 4 and -1 if you interpret
> the bytes as a signed values on x86. Isn't this what's happening here? Or is the
> reason known?
Yes, that is what's happening. I initially had this working as a python script via
the acpi_call module first, and python didn't overflow to -1 here so I didn't think of 
that.
> 
> 
> > +	fan_speed = ((fsh > 0 ? fsh : 0) << 8) | (fsl > 0 ? fsl : 0);
> > +
> > +	return fan_speed;
> > +}
> > [...]
> > +static int omen_thermal_profile_set(int mode)
> > +{
> > +	char buffer[2] = {0, mode};
> > +	int ret;
> > +
> > +	if (mode < 0 || mode > 2)
> > +		return -EINVAL;
> > +
> > +	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
> > +				   &buffer, sizeof(buffer), sizeof(buffer));
> > +
> > +	if (ret)
> > +		return ret < 0 ? ret : -EINVAL;
> 
> I think something like EIO would be more appropriate than EINVAL.
> (In other functions, too.)
I copied this part from the other set/get methods in this driver, they
return -EINVAL on fail here.
> 
> 
> > +
> > +	return mode;
> > +}
> > [...]
> > +static int omen_thermal_profile_get(void)
> 
> I would put this function next to `omen_thermal_profile_set`.
> 
> 
> > +{
> > +	u8 data;
> > +
> > +	int ret = ec_read(HP_OMEN_EC_THERMAL_PROFILE_OFFSET, &data);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	return data;
> > +}
> > [...]
> > +static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > +			u32 attr, int channel, long *val)
> > +{
> > +	switch (type) {
> > +	case hwmon_temp:
> > +		return hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
> > +	case hwmon_fan:
> > +		int ret = hp_wmi_get_fan_speed(channel);
> > +
> > +		if (ret < 0)
> > +			return -EINVAL;
> > +		*val = ret;
> > +		return 0;
> > +	case hwmon_pwm:
> > +		return hp_wmi_fan_speed_max_get();
> 
> Shouldn't this "mapped back"? 1 -> 0, 0 -> 2?
Yes, it should.
> 
> 
> > +	default:
> > +		return -EINVAL;
> > +	};
>          ^
> This semicolon is not needed.
> 
> 
> > +}
> > +
> > +static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> > +			u32 attr, int channel, long val)
> > +{
> > +	switch (type) {
> > +	case hwmon_pwm:
> > +		switch (val) {
> > +		case 0:
> > +			// 1 is no fan speed control(automatic), which is 1 for us
>                                                    ^^
> Small thing, but I'd put a space there.
> 
> 
> > +			return hp_wmi_fan_speed_max_set(1);
> > +		case 2:
> > +			// 2 is automatic speed control, which is 0 for us
> > +			return hp_wmi_fan_speed_max_set(0);
> > +		default:
> > +			// we don't support manual fan speed control
> > +			return -EOPNOTSUPP;
> 
> /* this type of comments is preferred */
Noted, I ran this through checkpatch.pl and it didn't lint that,
thanks for the heads up.
> 
> 
> > +		}
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > [...]
> 
> 
> Best regards,
> Barnabás Pőcze

Thank you very much for the review, I'll fix these and anything else
that comes in and send out a V3.

Regards,
Enver.
