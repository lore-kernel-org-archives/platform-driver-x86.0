Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F59C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 16:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4854D61056
	for <platform-driver-x86@archiver.kernel.org>; Wed, 25 Aug 2021 16:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbhHYQ7o (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Aug 2021 12:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231916AbhHYQ7o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 12:59:44 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC908C061757
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 09:58:57 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id u3so53001480ejz.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Aug 2021 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ymkfSWQCyn1mF1d45rjzRG911hpzpjBjn0hgQd/KJa4=;
        b=lcIEpUdN9W855O/pBdHqkmj3A1B5FSj9ySfkJmJd+KzZ4IHwesH82zzFX2cn9bSXYP
         Cwh0/0EdfWrIl6PIY1ABikGd0uIH7Rq2OW2jJSpUCpU1gDv1h+thyt42nRPeeZrWu/BW
         SwIhWhyrpRwLb4q7H1KpjjKFAlQq5DB+9vrZJAPKg2pp3G+9D/UQz6EHzGD/4n/oPeX8
         a4w6d2lKk7JiydzJIMc//1P7Wa4CIZKz9BemdgD3gPBagd6vgp5/neY9FTCTybQmd2+e
         ogujQrwMiyAD1t5dPqnAjj9i92uFmR+nUMbTYjQEPwnvDqL/JgQRmSsQXjgTzumpEcll
         G0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ymkfSWQCyn1mF1d45rjzRG911hpzpjBjn0hgQd/KJa4=;
        b=EQG5oyvve29upz8B3K9TPXCp2LIvIPQpqHqxL6328rnAH4obpy/ZWHrwdeA4KCHJ8q
         YZ9hcYbadV8E5vgczFvhK38FdZbrae0dC8w0g3v1AV/k0TKTxYmROPIYdS9xNUve4Zrs
         lCi1lDY1VmD8NwOjrUomxZYfie2C2K2jpTs3LgHwaq7hbpioKDv6aJvarVzTGIpt48eK
         cjRYzQBGnrs2RI6+3HySofe7VNy0y2xCrQo4zg9T2fPoqzck7f6GGPpZrf0aOkLf/WCm
         kM6CDiqPmX0F5SprTZMtOmVQ3TmtYDcEyffk1P+4hied+zbPGLHWaIntdd6dtEfLbStP
         fpmQ==
X-Gm-Message-State: AOAM532wtRw/rVpTxhTcibUf4Wx3Fji4u4NQMvv5dWvjO4AS/ZPS5AJs
        jyxVwXvKrn8zS+tUKHF3/n4=
X-Google-Smtp-Source: ABdhPJxhtx04UOH1X3A5sQHwoOukd/3ykhJirNxXjNeqX/oPULOjFtsCF6qLFlLtGBnZyswDT4b8DQ==
X-Received: by 2002:a17:907:ea1:: with SMTP id ho33mr6203953ejc.271.1629910736289;
        Wed, 25 Aug 2021 09:58:56 -0700 (PDT)
Received: from omen.localdomain ([109.175.38.255])
        by smtp.gmail.com with ESMTPSA id u23sm315792edr.42.2021.08.25.09.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 09:58:55 -0700 (PDT)
Date:   Wed, 25 Aug 2021 18:58:52 +0200
From:   Enver Balalic <balalic.enver@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH v3] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <20210825165852.ga5r6arfow7xv4dl@omen.localdomain>
References: <20210823185407.i7tk5bgofedqxfxf@omen.localdomain>
 <20210824173501.GA3402937@roeck-us.net>
 <20210824191132.o2eym6rq7pjgsxqy@omen.localdomain>
 <20210824193241.GA3414880@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824193241.GA3414880@roeck-us.net>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi, 

before I go out and send out a V4 of this, I wanted to check
if you agree with the changes I plan on making

On Tue, Aug 24, 2021 at 12:32:41PM -0700, Guenter Roeck wrote:
> On Tue, Aug 24, 2021 at 09:11:32PM +0200, Enver Balalic wrote:
> > On Tue, Aug 24, 2021 at 10:35:01AM -0700, Guenter Roeck wrote:
> > > On Mon, Aug 23, 2021 at 08:54:07PM +0200, Enver Balalic wrote:
> > > > This patch adds support for HP Omen laptops.
> > > > It adds support for most things that can be controlled via the
> > > > Windows Omen Command Center application.
> > > > 
> > > >  - Fan speed monitoring through hwmon
> > > >  - Platform Profile support (cool, balanced, performance)
> > > >  - Max fan speed function toggle
> > > > 
> > > > Also exposes the existing HDD temperature through hwmon since
> > > > this driver didn't use hwmon before this patch.
> > > > 
> > > > This patch has been tested on a 2020 HP Omen 15 (AMD) 15-en0023dx.
> > > > 
> > > >  - V1
> > > >    Initial Patch
> > > >  - V2
> > > >    Use standard hwmon ABI attributes
> > > >    Add existing non-standard "hddtemp" to hwmon
> > > >  - V3
> > > >    Fix overflow issue in "hp_wmi_get_fan_speed"
> > > >    Map max fan speed value back to hwmon values on read
> > > >    Code style fixes
> > > >    Fix issue with returning values from "hp_wmi_hwmon_read",
> > > >    the value to return should be written to val and not just
> > > >    returned from the function
> > > > 
> > > > Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
> > > > ---
> > > >  drivers/platform/x86/Kconfig  |   1 +
> > > >  drivers/platform/x86/hp-wmi.c | 320 ++++++++++++++++++++++++++++++++--
> > > >  2 files changed, 310 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > > > index d12db6c316ea..f0b3d94e182b 100644
> > > > --- a/drivers/platform/x86/Kconfig
> > > > +++ b/drivers/platform/x86/Kconfig
> > > > @@ -431,6 +431,7 @@ config HP_WMI
> > > >  	tristate "HP WMI extras"
> > > >  	depends on ACPI_WMI
> > > >  	depends on INPUT
> > > > +	depends on HWMON
> > > >  	depends on RFKILL || RFKILL = n
> > > >  	select INPUT_SPARSEKMAP
> > > >  	select ACPI_PLATFORM_PROFILE
> > > > diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> > > > index 027a1467d009..8c1fe1df6462 100644
> > > > --- a/drivers/platform/x86/hp-wmi.c
> > > > +++ b/drivers/platform/x86/hp-wmi.c
> > > > @@ -22,6 +22,7 @@
> > > >  #include <linux/input/sparse-keymap.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/platform_profile.h>
> > > > +#include <linux/hwmon.h>
> > > >  #include <linux/acpi.h>
> > > >  #include <linux/rfkill.h>
> > > >  #include <linux/string.h>
> > > > @@ -39,6 +40,7 @@ MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=aut
> > > >  
> > > >  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
> > > >  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> > > > +#define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> > > >  
> > > >  enum hp_wmi_radio {
> > > >  	HPWMI_WIFI	= 0x0,
> > > > @@ -89,10 +91,18 @@ enum hp_wmi_commandtype {
> > > >  	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
> > > >  };
> > > >  
> > > > +enum hp_wmi_gm_commandtype {
> > > > +	HPWMI_FAN_SPEED_GET_QUERY = 0x11,
> > > > +	HPWMI_SET_PERFORMANCE_MODE = 0x1A,
> > > > +	HPWMI_FAN_SPEED_MAX_GET_QUERY = 0x26,
> > > > +	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
> > > > +};
> > > > +
> > > >  enum hp_wmi_command {
> > > >  	HPWMI_READ	= 0x01,
> > > >  	HPWMI_WRITE	= 0x02,
> > > >  	HPWMI_ODM	= 0x03,
> > > > +	HPWMI_GM	= 0x20008,
> > > >  };
> > > >  
> > > >  enum hp_wmi_hardware_mask {
> > > > @@ -120,12 +130,23 @@ enum hp_wireless2_bits {
> > > >  	HPWMI_POWER_FW_OR_HW	= HPWMI_POWER_BIOS | HPWMI_POWER_HARD,
> > > >  };
> > > >  
> > > > +
> > > > +enum hp_thermal_profile_omen {
> > > > +	HP_OMEN_THERMAL_PROFILE_DEFAULT     = 0x00,
> > > > +	HP_OMEN_THERMAL_PROFILE_PERFORMANCE = 0x01,
> > > > +	HP_OMEN_THERMAL_PROFILE_COOL        = 0x02,
> > > > +};
> > > > +
> > > >  enum hp_thermal_profile {
> > > >  	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
> > > >  	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> > > >  	HP_THERMAL_PROFILE_COOL			= 0x02
> > > >  };
> > > >  
> > > > +static const char *const hp_wmi_temp_label[] = {
> > > > +	"HDD",
> > > > +};
> > > > +
> > > >  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
> > > >  #define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
> > > >  
> > > > @@ -279,6 +300,24 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
> > > >  	return ret;
> > > >  }
> > > >  
> > > > +static int hp_wmi_get_fan_speed(int fan)
> > > > +{
> > > > +	u8 fsh, fsl;
> > > > +	char fan_data[4] = { fan, 0, 0, 0 };
> > > > +
> > > > +	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
> > > > +				       &fan_data, sizeof(fan_data),
> > > > +				       sizeof(fan_data));
> > > > +
> > > > +	if (ret != 0)
> > > > +		return -EINVAL;
> > > > +
> > > > +	fsh = fan_data[2];
> > > > +	fsl = fan_data[3];
> > > > +
> > > > +	return (fsh << 8) | fsl;
> > > > +}
> > > > +
> > > >  static int hp_wmi_read_int(int query)
> > > >  {
> > > >  	int val = 0, ret;
> > > > @@ -302,6 +341,61 @@ static int hp_wmi_hw_state(int mask)
> > > >  	return !!(state & mask);
> > > >  }
> > > >  
> > > > +static int omen_thermal_profile_set(int mode)
> > > > +{
> > > > +	char buffer[2] = {0, mode};
> > > > +	int ret;
> > > > +
> > > > +	if (mode < 0 || mode > 2)
> > > > +		return -EINVAL;
> > > > +
> > > > +	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
> > > > +				   &buffer, sizeof(buffer), sizeof(buffer));
> > > > +
> > > > +	if (ret)
> > > > +		return ret < 0 ? ret : -EINVAL;
> > > > +
> > > > +	return mode;
> > > > +}
> > > > +
> > > > +static int omen_thermal_profile_get(void)
> > > > +{
> > > > +	u8 data;
> > > > +
> > > > +	int ret = ec_read(HP_OMEN_EC_THERMAL_PROFILE_OFFSET, &data);
> > > > +
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	return data;
> > > > +}
> > > > +
> > > > +static int hp_wmi_fan_speed_max_set(int enabled)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
> > > > +				   &enabled, sizeof(enabled), sizeof(enabled));
> > > > +
> > > > +	if (ret)
> > > > +		return ret < 0 ? ret : -EINVAL;
> > > > +
> > > > +	return enabled;
> > > > +}
> > > > +
> > > > +static int hp_wmi_fan_speed_max_get(void)
> > > > +{
> > > > +	int val = 0, ret;
> > > > +
> > > > +	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> > > > +				   &val, sizeof(val), sizeof(val));
> > > > +
> > > > +	if (ret)
> > > > +		return ret < 0 ? ret : -EINVAL;
> > > > +
> > > > +	return val;
> > > > +}
> > > > +
> > > >  static int __init hp_wmi_bios_2008_later(void)
> > > >  {
> > > >  	int state = 0;
> > > > @@ -878,6 +972,58 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
> > > >  	return err;
> > > >  }
> > > >  
> > > > +static int platform_profile_omen_get(struct platform_profile_handler *pprof,
> > > > +				enum platform_profile_option *profile)
> > > > +{
> > > > +	int tp;
> > > > +
> > > > +	tp = omen_thermal_profile_get();
> > > > +	if (tp < 0)
> > > > +		return tp;
> > > > +
> > > > +	switch (tp) {
> > > > +	case HP_OMEN_THERMAL_PROFILE_PERFORMANCE:
> > > > +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> > > > +		break;
> > > > +	case HP_OMEN_THERMAL_PROFILE_DEFAULT:
> > > > +		*profile = PLATFORM_PROFILE_BALANCED;
> > > > +		break;
> > > > +	case HP_OMEN_THERMAL_PROFILE_COOL:
> > > > +		*profile = PLATFORM_PROFILE_COOL;
> > > > +		break;
> > > > +	default:
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int platform_profile_omen_set(struct platform_profile_handler *pprof,
> > > > +				enum platform_profile_option profile)
> > > > +{
> > > > +	int err, tp;
> > > > +
> > > > +	switch (profile) {
> > > > +	case PLATFORM_PROFILE_PERFORMANCE:
> > > > +		tp = HP_OMEN_THERMAL_PROFILE_PERFORMANCE;
> > > > +		break;
> > > > +	case PLATFORM_PROFILE_BALANCED:
> > > > +		tp = HP_OMEN_THERMAL_PROFILE_DEFAULT;
> > > > +		break;
> > > > +	case PLATFORM_PROFILE_COOL:
> > > > +		tp = HP_OMEN_THERMAL_PROFILE_COOL;
> > > > +		break;
> > > > +	default:
> > > > +		return -EOPNOTSUPP;
> > > > +	}
> > > > +
> > > > +	err = omen_thermal_profile_set(tp);
> > > > +	if (err < 0)
> > > > +		return err;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static int thermal_profile_get(void)
> > > >  {
> > > >  	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> > > > @@ -946,19 +1092,34 @@ static int thermal_profile_setup(void)
> > > >  	int err, tp;
> > > >  
> > > >  	tp = thermal_profile_get();
> > > > -	if (tp < 0)
> > > > -		return tp;
> > > > +	if (tp >= 0) {
> > > > +		/*
> > > > +		* call thermal profile write command to ensure that the firmware correctly
> > > > +		* sets the OEM variables for the DPTF
> > > > +		*/
> > > > +		err = thermal_profile_set(tp);
> > > > +		if (err)
> > > > +			return err;
> > > >  
> > > > -	/*
> > > > -	 * call thermal profile write command to ensure that the firmware correctly
> > > > -	 * sets the OEM variables for the DPTF
> > > > -	 */
> > > > -	err = thermal_profile_set(tp);
> > > > -	if (err)
> > > > -		return err;
> > > > +		platform_profile_handler.profile_get = platform_profile_get;
> > > > +		platform_profile_handler.profile_set = platform_profile_set;
> > > > +	}
> > > 
> > > I don't really understand the above logic change. Why is
> > > the error from thermal_profile_get() now ignored ?
> > > 
> > > >  
> > > > -	platform_profile_handler.profile_get = platform_profile_get,
> > > > -	platform_profile_handler.profile_set = platform_profile_set,
> > > > +	tp = omen_thermal_profile_get();
> > > > +	if (tp >= 0) {
> > > > +		/*
> > > > +		* call thermal profile write command to ensure that the firmware correctly
> > > > +		* sets the OEM variables
> > > > +		*/
> > > > +		err = omen_thermal_profile_set(tp);
> > > > +		if (err < 0)
> > > > +			return err;
> > > > +
> > > > +		platform_profile_handler.profile_get = platform_profile_omen_get;
> > > > +		platform_profile_handler.profile_set = platform_profile_omen_set;
> > > 
> > > It looks like omen_thermal_profile_get() has priority over
> > > thermal_profile_get(). If so, it might make more sense to execute it first
> > > and only call thermal_profile_get() if omen_thermal_profile_get() returned
> > > an error. If ignoring the result from thermal_profile_get() is on purpose,
> > > it might make sense to drop that code entirely.
> > > 
> > > I am not entirely sure I understand what this code is supposed to be doing,
> > > though. Some comments might be useful.
> > Looking at it again, as it stands this is wrong, the omen code should only
> > run if the regular thermal_profile_get() returns an error, and not how it
> > is now.
> > 
> > Background to this is that the thermal_profile_get() code doesn't work on
> > the Omen, so the omen specific path is needed, but only in the case that
> > the regular, non-omen code fails.
> > 
> > As for ignoring the errors, I guess that in the case that both the regular
> > thermal_profile_get, and omen_thermal_profile_get fail, this function
> > should just return -EOPNOTSUPP instead of returning the error code of the
> > last function that ran (omen one) like it does now ?
> 
> I can't really say since I am not that involved in the driver.
> All I noticed is that the code is odd and difficult to understand.
> There should be a better means to determine if the system is an
> "Omen" than trial and error, possibly from its DMI data or maybe
> from its WMI GUIDs.
I took a look at how the Windows Omen Command Center program detects what machine
is an Omen, and I found they match the DMI Board Name against a list of Omen
board names. I should do the same in this case.
> 
> > > 
> > > > +	} else {
> > > > +		return tp;
> > > > +	}
> > > 
> > > 	if (tp < 0)
> > > 		return tp;
> > > 
> > > followed by non-error code would be more common.
> > > 
> > > >  
> > > >  	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
> > > >  	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
> > > > @@ -973,6 +1134,8 @@ static int thermal_profile_setup(void)
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +static int hp_wmi_hwmon_init(void);
> > > > +
> > > >  static int __init hp_wmi_bios_setup(struct platform_device *device)
> > > >  {
> > > >  	/* clear detected rfkill devices */
> > > > @@ -984,6 +1147,8 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
> > > >  	if (hp_wmi_rfkill_setup(device))
> > > >  		hp_wmi_rfkill2_setup(device);
> > > >  
> > > > +	hp_wmi_hwmon_init();
> > > > +
> > > This doesn't really make sense. If it is critical, it should abort here.
> > > If it isn't, the function should not return an error only for it to be
> > > ignored.
> > > 
> > > Also, if hwmon functionality isn't critical, the driver should not depend
> > > on HWMON since it performs perfectly fine without it.
> > Here if it's running on an omen and HWMON isn't there, there is no reporting
> > of fan speeds and the max/auto toggle won't work. So I don't know if that is
> > considered `critical`. I would guess not ?
> 
> The point I am trying to make is
> 
> 1) If the return value from hp_wmi_hwmon_init() is ignored,
>    hp_wmi_hwmon_init() should not return a value.
> 
> 2) If the return value from hp_wmi_hwmon_init() is ignored, the hwmon
>    functionality is not critical, and the driver should not depend on HWMON.
> 
> "critical", in the sense I meant, means critical to system operation.
> The meaning depends on the driver author, of course. I can not really say
> if the driver should depend on HWMON or not. All I can say is that it is
> inconsistent to make the driver depend on HWMON and then to ignore that
> hwmon device instantiation failed.
I took a look at how other vendor's WMI drivers handle this, and a couple of
them depend on HWMON (asus, gigabyte), while the thinkpad and eeepc ones
select HWMON instead of depending on it. Here I think I should just handle
this error properly, and leave the HWMON dependency in this driver ?
> 
> > > 
> > > >  	thermal_profile_setup();
> > > >  
> > > >  	return 0;
> > > > @@ -1068,6 +1233,139 @@ static struct platform_driver hp_wmi_driver = {
> > > >  	.remove = __exit_p(hp_wmi_bios_remove),
> > > >  };
> > > >  
> > > > +static umode_t hp_wmi_hwmon_is_visible(const void *data,
> > > > +					enum hwmon_sensor_types type,
> > > > +					u32 attr, int channel)
> > > > +{
> > > > +	switch (type) {
> > > > +	case hwmon_temp:
> > > > +		if (hp_wmi_read_int(HPWMI_HDDTEMP_QUERY) >= 0)
> > > > +			return 0444;
> > > > +		else
> > > 
> > > else after return is unnecessary (static analyzers will complain).
> > > 
> > > > +			return 0;
> > > > +	case hwmon_pwm:
> > > > +		return 0644;
> > > > +	case hwmon_fan:
> > > > +		if (hp_wmi_get_fan_speed(channel) >= 0)
> > > > +			return 0444;
> > > > +		else
> > > 
> > > Same as above.
> > > 
> > > > +			return 0;
> > > > +	default:
> > > > +		return 0;
> > > > +	}
> > > > +}
> > > > +
> > > > +static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > > > +			u32 attr, int channel, long *val)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	switch (type) {
> > > > +	case hwmon_temp:
> > > > +		ret = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
> > > > +
> > > > +		if (ret < 0)
> > > > +			return ret;
> > > > +		*val = ret;
> > > 
> > > hddtemp is not documented, so the reported units are unknown.
> > > Is this in milli-degrees C ? If yes, a comment might be useful.
> > > If not, please adjust.
> > The previous version of this patch added hwmon to this driver,
> > before this value was exposed via a non-standard hddtemp param.
> > That param didn't have a specified unit, so that's an unknown to
> > me. It isn't documented anywhere in the driver.
> > The old hddtemp param just printed out the integer value.
> > Should this be removed then since it's an unknown ?
> 
> Question is what that integer value reflects. Presumably you have the
> system, so you should be able to see the value. From there it should be
> possible to determine the scale and if it is reported in degrees C or
> in Kelvin.
Actually, this functionality doesn't work on my system so I
can't figure out what the unit it is that way. So maybe it would be best 
to leave it out of HWMON and just let it be a non-standard sysfs attribute
like it was before this patch ?
> 
> Guenter

Thanks,
Enver.
