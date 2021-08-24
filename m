Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67EBC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Aug 2021 19:32:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0E6060FD8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Aug 2021 19:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbhHXTd3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Aug 2021 15:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhHXTd2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Aug 2021 15:33:28 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70842C061757
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Aug 2021 12:32:44 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id i3-20020a056830210300b0051af5666070so39324096otc.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Aug 2021 12:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iSVNTz5pyGKKMqQCpHwjX4ZxYnz8CgWZdBOXIyHWXHE=;
        b=qZndeCpoQJoZQ6ig2oaWTzGj9DlH9GVK1YIN4BEZ1rhhouGk8n0LpULf6jntxlYCyO
         vk4RkJ9CNFiuzoLngzjiDn5OuD1oL8VfcZpHcI91ao5Ps2lDMB6fyOEyb0NvDzJMG5s7
         o7QpbY9zHmJX+51gJtgYE63GYL52RtbRgCCuqA/8fyiFKcU3nDlFJ38DMbp3L1OAuJwu
         2hQ4Gb9NAvkdREpZG7HAxQTBVe0hID/SR9+9qJDdVRS79aE0D8jvkQNocN5OqkbKjeot
         V5zA0Zpb5CzHpWJLEIXQy3lhslFdPXdHNR3LHYoIKwv9rlJnEnNKwN9I61YLQ/VZR5Sq
         KMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=iSVNTz5pyGKKMqQCpHwjX4ZxYnz8CgWZdBOXIyHWXHE=;
        b=cue0k396Wne4mu5Mb3RBIpdONSTbEo1tSSwCySKIB/nSmDNl6Ur2kIK/yGYDNFGip5
         6XhKC1uXq3FwNpSwnpaK1PkqFcEBpEY6AUWucxc+QiWBuxucY3XrTDA9qyqsgjSJuavu
         E1+6JPdlJDecj5P8d488TbrZnNCNd0RUxrWfBw1P0h15rsqp3mEwnZOFvmKP7hL00th6
         NJDorn9pKqwMmKHLSPpAXd1btEjxgMjpNBY7gAMSUO2H7dkANr6XKqTVYLNOf/nL5qc0
         4pffediNaL1rDYmEVJ8EL06LHpdXQRNOHcjSozpMfLW9ObfYHPuRSMQkaz5DwIXuRdqo
         3W7g==
X-Gm-Message-State: AOAM531NJRKmmsiZKGPnWibuulOxFcfx52wen+cStRdbDgIsvq3k4qI5
        veFP6DmdjBdp4On4vTn4rI4=
X-Google-Smtp-Source: ABdhPJxprs+HpnSM20ubRR7JD4hOKI2OaMH2TSKWMSepamJHxKqVbNdSZNYqFSGcrPCr+W3PaxwFlg==
X-Received: by 2002:a05:6808:f04:: with SMTP id m4mr875352oiw.86.1629833563813;
        Tue, 24 Aug 2021 12:32:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z78sm4184557ooa.29.2021.08.24.12.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 12:32:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 24 Aug 2021 12:32:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Enver Balalic <balalic.enver@gmail.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com, jdelvare@suse.com,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH v3] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <20210824193241.GA3414880@roeck-us.net>
References: <20210823185407.i7tk5bgofedqxfxf@omen.localdomain>
 <20210824173501.GA3402937@roeck-us.net>
 <20210824191132.o2eym6rq7pjgsxqy@omen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824191132.o2eym6rq7pjgsxqy@omen.localdomain>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Aug 24, 2021 at 09:11:32PM +0200, Enver Balalic wrote:
> On Tue, Aug 24, 2021 at 10:35:01AM -0700, Guenter Roeck wrote:
> > On Mon, Aug 23, 2021 at 08:54:07PM +0200, Enver Balalic wrote:
> > > This patch adds support for HP Omen laptops.
> > > It adds support for most things that can be controlled via the
> > > Windows Omen Command Center application.
> > > 
> > >  - Fan speed monitoring through hwmon
> > >  - Platform Profile support (cool, balanced, performance)
> > >  - Max fan speed function toggle
> > > 
> > > Also exposes the existing HDD temperature through hwmon since
> > > this driver didn't use hwmon before this patch.
> > > 
> > > This patch has been tested on a 2020 HP Omen 15 (AMD) 15-en0023dx.
> > > 
> > >  - V1
> > >    Initial Patch
> > >  - V2
> > >    Use standard hwmon ABI attributes
> > >    Add existing non-standard "hddtemp" to hwmon
> > >  - V3
> > >    Fix overflow issue in "hp_wmi_get_fan_speed"
> > >    Map max fan speed value back to hwmon values on read
> > >    Code style fixes
> > >    Fix issue with returning values from "hp_wmi_hwmon_read",
> > >    the value to return should be written to val and not just
> > >    returned from the function
> > > 
> > > Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
> > > ---
> > >  drivers/platform/x86/Kconfig  |   1 +
> > >  drivers/platform/x86/hp-wmi.c | 320 ++++++++++++++++++++++++++++++++--
> > >  2 files changed, 310 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > > index d12db6c316ea..f0b3d94e182b 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -431,6 +431,7 @@ config HP_WMI
> > >  	tristate "HP WMI extras"
> > >  	depends on ACPI_WMI
> > >  	depends on INPUT
> > > +	depends on HWMON
> > >  	depends on RFKILL || RFKILL = n
> > >  	select INPUT_SPARSEKMAP
> > >  	select ACPI_PLATFORM_PROFILE
> > > diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> > > index 027a1467d009..8c1fe1df6462 100644
> > > --- a/drivers/platform/x86/hp-wmi.c
> > > +++ b/drivers/platform/x86/hp-wmi.c
> > > @@ -22,6 +22,7 @@
> > >  #include <linux/input/sparse-keymap.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/platform_profile.h>
> > > +#include <linux/hwmon.h>
> > >  #include <linux/acpi.h>
> > >  #include <linux/rfkill.h>
> > >  #include <linux/string.h>
> > > @@ -39,6 +40,7 @@ MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=aut
> > >  
> > >  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
> > >  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> > > +#define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> > >  
> > >  enum hp_wmi_radio {
> > >  	HPWMI_WIFI	= 0x0,
> > > @@ -89,10 +91,18 @@ enum hp_wmi_commandtype {
> > >  	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
> > >  };
> > >  
> > > +enum hp_wmi_gm_commandtype {
> > > +	HPWMI_FAN_SPEED_GET_QUERY = 0x11,
> > > +	HPWMI_SET_PERFORMANCE_MODE = 0x1A,
> > > +	HPWMI_FAN_SPEED_MAX_GET_QUERY = 0x26,
> > > +	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
> > > +};
> > > +
> > >  enum hp_wmi_command {
> > >  	HPWMI_READ	= 0x01,
> > >  	HPWMI_WRITE	= 0x02,
> > >  	HPWMI_ODM	= 0x03,
> > > +	HPWMI_GM	= 0x20008,
> > >  };
> > >  
> > >  enum hp_wmi_hardware_mask {
> > > @@ -120,12 +130,23 @@ enum hp_wireless2_bits {
> > >  	HPWMI_POWER_FW_OR_HW	= HPWMI_POWER_BIOS | HPWMI_POWER_HARD,
> > >  };
> > >  
> > > +
> > > +enum hp_thermal_profile_omen {
> > > +	HP_OMEN_THERMAL_PROFILE_DEFAULT     = 0x00,
> > > +	HP_OMEN_THERMAL_PROFILE_PERFORMANCE = 0x01,
> > > +	HP_OMEN_THERMAL_PROFILE_COOL        = 0x02,
> > > +};
> > > +
> > >  enum hp_thermal_profile {
> > >  	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
> > >  	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> > >  	HP_THERMAL_PROFILE_COOL			= 0x02
> > >  };
> > >  
> > > +static const char *const hp_wmi_temp_label[] = {
> > > +	"HDD",
> > > +};
> > > +
> > >  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
> > >  #define IS_SWBLOCKED(x) !(x & HPWMI_POWER_SOFT)
> > >  
> > > @@ -279,6 +300,24 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
> > >  	return ret;
> > >  }
> > >  
> > > +static int hp_wmi_get_fan_speed(int fan)
> > > +{
> > > +	u8 fsh, fsl;
> > > +	char fan_data[4] = { fan, 0, 0, 0 };
> > > +
> > > +	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
> > > +				       &fan_data, sizeof(fan_data),
> > > +				       sizeof(fan_data));
> > > +
> > > +	if (ret != 0)
> > > +		return -EINVAL;
> > > +
> > > +	fsh = fan_data[2];
> > > +	fsl = fan_data[3];
> > > +
> > > +	return (fsh << 8) | fsl;
> > > +}
> > > +
> > >  static int hp_wmi_read_int(int query)
> > >  {
> > >  	int val = 0, ret;
> > > @@ -302,6 +341,61 @@ static int hp_wmi_hw_state(int mask)
> > >  	return !!(state & mask);
> > >  }
> > >  
> > > +static int omen_thermal_profile_set(int mode)
> > > +{
> > > +	char buffer[2] = {0, mode};
> > > +	int ret;
> > > +
> > > +	if (mode < 0 || mode > 2)
> > > +		return -EINVAL;
> > > +
> > > +	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
> > > +				   &buffer, sizeof(buffer), sizeof(buffer));
> > > +
> > > +	if (ret)
> > > +		return ret < 0 ? ret : -EINVAL;
> > > +
> > > +	return mode;
> > > +}
> > > +
> > > +static int omen_thermal_profile_get(void)
> > > +{
> > > +	u8 data;
> > > +
> > > +	int ret = ec_read(HP_OMEN_EC_THERMAL_PROFILE_OFFSET, &data);
> > > +
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return data;
> > > +}
> > > +
> > > +static int hp_wmi_fan_speed_max_set(int enabled)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
> > > +				   &enabled, sizeof(enabled), sizeof(enabled));
> > > +
> > > +	if (ret)
> > > +		return ret < 0 ? ret : -EINVAL;
> > > +
> > > +	return enabled;
> > > +}
> > > +
> > > +static int hp_wmi_fan_speed_max_get(void)
> > > +{
> > > +	int val = 0, ret;
> > > +
> > > +	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> > > +				   &val, sizeof(val), sizeof(val));
> > > +
> > > +	if (ret)
> > > +		return ret < 0 ? ret : -EINVAL;
> > > +
> > > +	return val;
> > > +}
> > > +
> > >  static int __init hp_wmi_bios_2008_later(void)
> > >  {
> > >  	int state = 0;
> > > @@ -878,6 +972,58 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
> > >  	return err;
> > >  }
> > >  
> > > +static int platform_profile_omen_get(struct platform_profile_handler *pprof,
> > > +				enum platform_profile_option *profile)
> > > +{
> > > +	int tp;
> > > +
> > > +	tp = omen_thermal_profile_get();
> > > +	if (tp < 0)
> > > +		return tp;
> > > +
> > > +	switch (tp) {
> > > +	case HP_OMEN_THERMAL_PROFILE_PERFORMANCE:
> > > +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> > > +		break;
> > > +	case HP_OMEN_THERMAL_PROFILE_DEFAULT:
> > > +		*profile = PLATFORM_PROFILE_BALANCED;
> > > +		break;
> > > +	case HP_OMEN_THERMAL_PROFILE_COOL:
> > > +		*profile = PLATFORM_PROFILE_COOL;
> > > +		break;
> > > +	default:
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int platform_profile_omen_set(struct platform_profile_handler *pprof,
> > > +				enum platform_profile_option profile)
> > > +{
> > > +	int err, tp;
> > > +
> > > +	switch (profile) {
> > > +	case PLATFORM_PROFILE_PERFORMANCE:
> > > +		tp = HP_OMEN_THERMAL_PROFILE_PERFORMANCE;
> > > +		break;
> > > +	case PLATFORM_PROFILE_BALANCED:
> > > +		tp = HP_OMEN_THERMAL_PROFILE_DEFAULT;
> > > +		break;
> > > +	case PLATFORM_PROFILE_COOL:
> > > +		tp = HP_OMEN_THERMAL_PROFILE_COOL;
> > > +		break;
> > > +	default:
> > > +		return -EOPNOTSUPP;
> > > +	}
> > > +
> > > +	err = omen_thermal_profile_set(tp);
> > > +	if (err < 0)
> > > +		return err;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int thermal_profile_get(void)
> > >  {
> > >  	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> > > @@ -946,19 +1092,34 @@ static int thermal_profile_setup(void)
> > >  	int err, tp;
> > >  
> > >  	tp = thermal_profile_get();
> > > -	if (tp < 0)
> > > -		return tp;
> > > +	if (tp >= 0) {
> > > +		/*
> > > +		* call thermal profile write command to ensure that the firmware correctly
> > > +		* sets the OEM variables for the DPTF
> > > +		*/
> > > +		err = thermal_profile_set(tp);
> > > +		if (err)
> > > +			return err;
> > >  
> > > -	/*
> > > -	 * call thermal profile write command to ensure that the firmware correctly
> > > -	 * sets the OEM variables for the DPTF
> > > -	 */
> > > -	err = thermal_profile_set(tp);
> > > -	if (err)
> > > -		return err;
> > > +		platform_profile_handler.profile_get = platform_profile_get;
> > > +		platform_profile_handler.profile_set = platform_profile_set;
> > > +	}
> > 
> > I don't really understand the above logic change. Why is
> > the error from thermal_profile_get() now ignored ?
> > 
> > >  
> > > -	platform_profile_handler.profile_get = platform_profile_get,
> > > -	platform_profile_handler.profile_set = platform_profile_set,
> > > +	tp = omen_thermal_profile_get();
> > > +	if (tp >= 0) {
> > > +		/*
> > > +		* call thermal profile write command to ensure that the firmware correctly
> > > +		* sets the OEM variables
> > > +		*/
> > > +		err = omen_thermal_profile_set(tp);
> > > +		if (err < 0)
> > > +			return err;
> > > +
> > > +		platform_profile_handler.profile_get = platform_profile_omen_get;
> > > +		platform_profile_handler.profile_set = platform_profile_omen_set;
> > 
> > It looks like omen_thermal_profile_get() has priority over
> > thermal_profile_get(). If so, it might make more sense to execute it first
> > and only call thermal_profile_get() if omen_thermal_profile_get() returned
> > an error. If ignoring the result from thermal_profile_get() is on purpose,
> > it might make sense to drop that code entirely.
> > 
> > I am not entirely sure I understand what this code is supposed to be doing,
> > though. Some comments might be useful.
> Looking at it again, as it stands this is wrong, the omen code should only
> run if the regular thermal_profile_get() returns an error, and not how it
> is now.
> 
> Background to this is that the thermal_profile_get() code doesn't work on
> the Omen, so the omen specific path is needed, but only in the case that
> the regular, non-omen code fails.
> 
> As for ignoring the errors, I guess that in the case that both the regular
> thermal_profile_get, and omen_thermal_profile_get fail, this function
> should just return -EOPNOTSUPP instead of returning the error code of the
> last function that ran (omen one) like it does now ?

I can't really say since I am not that involved in the driver.
All I noticed is that the code is odd and difficult to understand.
There should be a better means to determine if the system is an
"Omen" than trial and error, possibly from its DMI data or maybe
from its WMI GUIDs.

> > 
> > > +	} else {
> > > +		return tp;
> > > +	}
> > 
> > 	if (tp < 0)
> > 		return tp;
> > 
> > followed by non-error code would be more common.
> > 
> > >  
> > >  	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
> > >  	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
> > > @@ -973,6 +1134,8 @@ static int thermal_profile_setup(void)
> > >  	return 0;
> > >  }
> > >  
> > > +static int hp_wmi_hwmon_init(void);
> > > +
> > >  static int __init hp_wmi_bios_setup(struct platform_device *device)
> > >  {
> > >  	/* clear detected rfkill devices */
> > > @@ -984,6 +1147,8 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
> > >  	if (hp_wmi_rfkill_setup(device))
> > >  		hp_wmi_rfkill2_setup(device);
> > >  
> > > +	hp_wmi_hwmon_init();
> > > +
> > This doesn't really make sense. If it is critical, it should abort here.
> > If it isn't, the function should not return an error only for it to be
> > ignored.
> > 
> > Also, if hwmon functionality isn't critical, the driver should not depend
> > on HWMON since it performs perfectly fine without it.
> Here if it's running on an omen and HWMON isn't there, there is no reporting
> of fan speeds and the max/auto toggle won't work. So I don't know if that is
> considered `critical`. I would guess not ?

The point I am trying to make is

1) If the return value from hp_wmi_hwmon_init() is ignored,
   hp_wmi_hwmon_init() should not return a value.

2) If the return value from hp_wmi_hwmon_init() is ignored, the hwmon
   functionality is not critical, and the driver should not depend on HWMON.

"critical", in the sense I meant, means critical to system operation.
The meaning depends on the driver author, of course. I can not really say
if the driver should depend on HWMON or not. All I can say is that it is
inconsistent to make the driver depend on HWMON and then to ignore that
hwmon device instantiation failed.

> > 
> > >  	thermal_profile_setup();
> > >  
> > >  	return 0;
> > > @@ -1068,6 +1233,139 @@ static struct platform_driver hp_wmi_driver = {
> > >  	.remove = __exit_p(hp_wmi_bios_remove),
> > >  };
> > >  
> > > +static umode_t hp_wmi_hwmon_is_visible(const void *data,
> > > +					enum hwmon_sensor_types type,
> > > +					u32 attr, int channel)
> > > +{
> > > +	switch (type) {
> > > +	case hwmon_temp:
> > > +		if (hp_wmi_read_int(HPWMI_HDDTEMP_QUERY) >= 0)
> > > +			return 0444;
> > > +		else
> > 
> > else after return is unnecessary (static analyzers will complain).
> > 
> > > +			return 0;
> > > +	case hwmon_pwm:
> > > +		return 0644;
> > > +	case hwmon_fan:
> > > +		if (hp_wmi_get_fan_speed(channel) >= 0)
> > > +			return 0444;
> > > +		else
> > 
> > Same as above.
> > 
> > > +			return 0;
> > > +	default:
> > > +		return 0;
> > > +	}
> > > +}
> > > +
> > > +static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > > +			u32 attr, int channel, long *val)
> > > +{
> > > +	int ret;
> > > +
> > > +	switch (type) {
> > > +	case hwmon_temp:
> > > +		ret = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
> > > +
> > > +		if (ret < 0)
> > > +			return ret;
> > > +		*val = ret;
> > 
> > hddtemp is not documented, so the reported units are unknown.
> > Is this in milli-degrees C ? If yes, a comment might be useful.
> > If not, please adjust.
> The previous version of this patch added hwmon to this driver,
> before this value was exposed via a non-standard hddtemp param.
> That param didn't have a specified unit, so that's an unknown to
> me. It isn't documented anywhere in the driver.
> The old hddtemp param just printed out the integer value.
> Should this be removed then since it's an unknown ?

Question is what that integer value reflects. Presumably you have the
system, so you should be able to see the value. From there it should be
possible to determine the scale and if it is reported in degrees C or
in Kelvin.

Guenter
