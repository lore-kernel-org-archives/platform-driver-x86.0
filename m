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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082FAC4338F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Aug 2021 18:10:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D766160E93
	for <platform-driver-x86@archiver.kernel.org>; Sun, 22 Aug 2021 18:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhHVSLi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 22 Aug 2021 14:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbhHVSLh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Aug 2021 14:11:37 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BF1C061575
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Aug 2021 11:10:56 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k8so22653340wrn.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Aug 2021 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7B08nTdS/Adje9GCw7z+6XzE0SETq4qrj2G9sUIYe2A=;
        b=mPRno1LnFcjUNoiAMSvXJxosmBto2LcZrhvMlY6Dh3GDNQAOZnyat5B4S+adcYcabF
         ZnMPS2INi0ndAAiapO5QIJlsSMecKL7jj5tjmh7ZWZexxMvg2s7u9ZfZweGQgY3TfOvu
         XoYXiIA4A15q/e8mxKAlkHIdFU2um2CdMLrZ5Qhqhg8/AwSyfBDniBy8v7hkWy8wZ2MV
         vV3V5X5ppi+4vLLSCUHxgVZB2OKOkwYe7bCjsF3FHgZWJee7asQIkhfDK38jCZ8jDPHK
         biSp7ZCsQlIdJ3k53Q8zLJ8tMmEW+Hpju7drMrRJP2FYrd6MJT11o0/udjOVeWwzCm6q
         A8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7B08nTdS/Adje9GCw7z+6XzE0SETq4qrj2G9sUIYe2A=;
        b=Id/CVEfaC/wgbi3TwuE5xhT3QaUDHyM/rWlDb1zKbXZud3wkCGJ+40hEDrdMN9oIvs
         ioQa+n6kL+Ez92MVcjCKwI8n6fLqQvpLga7KuXlGyQxtFfY/2TriTA0m3/hd/jSETSFl
         +PtoLW7wJ+KORoW3my5znciznurONDRXEPLnEgC4CrshYhW8Cb7FIMEKbvxSopMNYXN7
         aX+u2+5z+xQtrdbZk9dBRUO1BIgh0lKuBCJVHluG2VyREU0OSnp5LpA2yC7I5WdjZ+X4
         ij/XzJ0l2k7KLZ/kcSdyLJnvq9eTsQVCkOREGY5W2rh54LDefOjKhewyHdt+FJc17P/b
         bglw==
X-Gm-Message-State: AOAM533Co535VPF8Vf2jR980n/lXKpm4IbWN2zpBXFHBHgd3P7HsqGyR
        Pj9fqkBcW1eEUWPuwbbmzUQ=
X-Google-Smtp-Source: ABdhPJwuw0+5h1Js5u5+nO6TdHpngQuIwkpL+8elf9IxQjnWcOkyHIb4QBLvCQch7uQ5ZI1d7+ZuAw==
X-Received: by 2002:a5d:4745:: with SMTP id o5mr9883438wrs.307.1629655854753;
        Sun, 22 Aug 2021 11:10:54 -0700 (PDT)
Received: from omen.localdomain ([188.127.120.115])
        by smtp.gmail.com with ESMTPSA id x11sm5166669wro.83.2021.08.22.11.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 11:10:54 -0700 (PDT)
Date:   Sun, 22 Aug 2021 20:10:51 +0200
From:   Enver Balalic <balalic.enver@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: add support for omen laptops
Message-ID: <20210822181051.jefthtoelu5kujcg@omen.localdomain>
References: <20210822163143.jutjs7un5d547ehr@omen.localdomain>
 <dmlqFeCj95CYJBSHp58FRsLPWQqI-Kh_O82mUrhHsBbnCNKSwlWd9ynWz2JQAdWwaGMvagH5LOQlz0r5_5yerwCZRXIJLbU4lmTOu03ZQnU=@protonmail.com>
 <f79cf69c-e050-5008-f01f-344257d66c45@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f79cf69c-e050-5008-f01f-344257d66c45@roeck-us.net>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Aug 22, 2021 at 10:21:15AM -0700, Guenter Roeck wrote:
> On 8/22/21 10:04 AM, Barnabás Pőcze wrote:
> > Hi
> > 
> > 
> > +CC Guenter Roeck and Jean Delvare for hwmon parts
> > 
> > 
> > 2021. augusztus 22., vasárnap 18:31 keltezéssel, Enver Balalic írta:
> > > This patch adds support for HP Omen laptops.
> > > It adds support for most things that can be controlled via the
> > > Windows Omen Command Center application.
> > > 
> > >   - Fan speed monitoring through hwmon
> > >   - Platform Profile support (cool, balanced, performance)
> > >   - Max fan speed function toggle
> > > 
> > > This patch has been tested on a 2020 HP Omen 15 (AMD) 15-en0023dx.
> > > 
> > > Signed-off-by: Enver Balalic <balalic.enver@gmail.com>
> > > ---
> > >   drivers/platform/x86/Kconfig  |   1 +
> > >   drivers/platform/x86/hp-wmi.c | 292 ++++++++++++++++++++++++++++++++--
> > >   2 files changed, 282 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > > index d12db6c316ea..f0b3d94e182b 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -431,6 +431,7 @@ config HP_WMI
> > >   	tristate "HP WMI extras"
> > >   	depends on ACPI_WMI
> > >   	depends on INPUT
> > > +	depends on HWMON
> > >   	depends on RFKILL || RFKILL = n
> > >   	select INPUT_SPARSEKMAP
> > >   	select ACPI_PLATFORM_PROFILE
> > > diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> > > index 027a1467d009..39d26602376d 100644
> > > --- a/drivers/platform/x86/hp-wmi.c
> > > +++ b/drivers/platform/x86/hp-wmi.c
> > > @@ -22,6 +22,7 @@
> > >   #include <linux/input/sparse-keymap.h>
> > >   #include <linux/platform_device.h>
> > >   #include <linux/platform_profile.h>
> > > +#include <linux/hwmon.h>
> > >   #include <linux/acpi.h>
> > >   #include <linux/rfkill.h>
> > >   #include <linux/string.h>
> > > @@ -39,6 +40,7 @@ MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=aut
> > > 
> > >   #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
> > >   #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
> > > +#define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> > > 
> > >   enum hp_wmi_radio {
> > >   	HPWMI_WIFI	= 0x0,
> > > @@ -89,10 +91,18 @@ enum hp_wmi_commandtype {
> > >   	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
> > >   };
> > > 
> > > +enum hp_wmi_gm_commandtype {
> > > +	HPWMI_FAN_SPEED_GET_QUERY = 0x11,
> > > +	HPWMI_SET_PERFORMANCE_MODE = 0x1A,
> > > +	HPWMI_FAN_SPEED_MAX_GET_QUERY = 0x26,
> > > +	HPWMI_FAN_SPEED_MAX_SET_QUERY = 0x27,
> > > +};
> > > +
> > >   enum hp_wmi_command {
> > >   	HPWMI_READ	= 0x01,
> > >   	HPWMI_WRITE	= 0x02,
> > >   	HPWMI_ODM	= 0x03,
> > > +	HPWMI_GM    = 0x20008,
> > >   };
> > > 
> > >   enum hp_wmi_hardware_mask {
> > > @@ -120,6 +130,13 @@ enum hp_wireless2_bits {
> > >   	HPWMI_POWER_FW_OR_HW	= HPWMI_POWER_BIOS | HPWMI_POWER_HARD,
> > >   };
> > > 
> > > +
> > > +enum hp_thermal_profile_omen {
> > > +	HP_OMEN_THERMAL_PROFILE_DEFAULT     = 0x00,
> > > +	HP_OMEN_THERMAL_PROFILE_PERFORMANCE = 0x01,
> > > +	HP_OMEN_THERMAL_PROFILE_COOL        = 0x02,
> > > +};
> > > +
> > >   enum hp_thermal_profile {
> > >   	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
> > >   	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> > > @@ -279,6 +296,27 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
> > >   	return ret;
> > >   }
> > > 
> > > +static int hp_wmi_get_fan_speed(int fan, int *data)
> > > +{
> > > +	int fsh, fsl;
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
> > > +	// sometimes one of these can be negative
> > > +	*data = ((fsh > 0 ? fsh : 0) << 8) | (fsl > 0 ? fsl : 0);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static int hp_wmi_read_int(int query)
> > >   {
> > >   	int val = 0, ret;
> > > @@ -302,6 +340,61 @@ static int hp_wmi_hw_state(int mask)
> > >   	return !!(state & mask);
> > >   }
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
> > >   static int __init hp_wmi_bios_2008_later(void)
> > >   {
> > >   	int state = 0;
> > > @@ -473,6 +566,42 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
> > >   	return sprintf(buf, "0x%x\n", value);
> > >   }
> > > 
> > > +static ssize_t max_fan_show(struct device *dev, struct device_attribute *attr,
> > > +			    char *buf)
> > > +{
> > > +	int value = hp_wmi_fan_speed_max_get();
> > > +
> > > +	if (value < 0)
> > > +		return value;
> > > +	return sprintf(buf, "%d\n", value);
> > > +}
> > > +
> > > +static ssize_t fan1_show(struct device *dev, struct device_attribute *attr,
> > > +			char *buf)
> > > +{
> > > +	int fan_speed;
> > > +
> > > +	int ret = hp_wmi_get_fan_speed(0, &fan_speed);
> > > +
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return sprintf(buf, "%d\n", fan_speed);
> > > +}
> > > +
> > > +static ssize_t fan2_show(struct device *dev, struct device_attribute *attr,
> > > +			char *buf)
> > > +{
> > > +	int fan_speed;
> > > +
> > > +	int ret = hp_wmi_get_fan_speed(1, &fan_speed);
> > > +
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return sprintf(buf, "%d\n", fan_speed);
> > > +}
> > > +
> > >   static ssize_t als_store(struct device *dev, struct device_attribute *attr,
> > >   			 const char *buf, size_t count)
> > >   {
> > > @@ -514,12 +643,33 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
> > >   	return count;
> > >   }
> > > 
> > > +static ssize_t max_fan_store(struct device *dev, struct device_attribute *attr,
> > > +			     const char *buf, size_t count)
> > > +{
> > > +	u32 tmp;
> > > +	int ret;
> > > +
> > > +	ret = kstrtou32(buf, 10, &tmp);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = hp_wmi_fan_speed_max_set(tmp);
> > > +
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return count;
> > > +}
> > > +
> > >   static DEVICE_ATTR_RO(display);
> > >   static DEVICE_ATTR_RO(hddtemp);
> > >   static DEVICE_ATTR_RW(als);
> > >   static DEVICE_ATTR_RO(dock);
> > >   static DEVICE_ATTR_RO(tablet);
> > >   static DEVICE_ATTR_RW(postcode);
> > > +static DEVICE_ATTR_RW(max_fan);
> > > +static DEVICE_ATTR_RO(fan1);
> > > +static DEVICE_ATTR_RO(fan2);
> > > 
> > >   static struct attribute *hp_wmi_attrs[] = {
> > >   	&dev_attr_display.attr,
> > > @@ -528,6 +678,7 @@ static struct attribute *hp_wmi_attrs[] = {
> > >   	&dev_attr_dock.attr,
> > >   	&dev_attr_tablet.attr,
> > >   	&dev_attr_postcode.attr,
> > > +	&dev_attr_max_fan.attr,
> > >   	NULL,
> > >   };
> > >   ATTRIBUTE_GROUPS(hp_wmi);
> > > @@ -878,6 +1029,58 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
> > >   	return err;
> > >   }
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
> > >   static int thermal_profile_get(void)
> > >   {
> > >   	return hp_wmi_read_int(HPWMI_THERMAL_PROFILE_QUERY);
> > > @@ -946,19 +1149,34 @@ static int thermal_profile_setup(void)
> > >   	int err, tp;
> > > 
> > >   	tp = thermal_profile_get();
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
> > > +
> > > +	tp = omen_thermal_profile_get();
> > > +	if (tp >= 0) {
> > > +		/*
> > > +		* call thermal profile write command to ensure that the firmware correctly
> > > +		* sets the OEM variables for the DPTF
> > > +		*/
> > > +		err = omen_thermal_profile_set(tp);
> > > +		if (err < 0)
> > > +			return err;
> > > 
> > > -	platform_profile_handler.profile_get = platform_profile_get,
> > > -	platform_profile_handler.profile_set = platform_profile_set,
> > > +		platform_profile_handler.profile_get = platform_profile_omen_get;
> > > +		platform_profile_handler.profile_set = platform_profile_omen_set;
> > > +	} else {
> > > +		return tp;
> > > +	}
> > > 
> > >   	set_bit(PLATFORM_PROFILE_COOL, platform_profile_handler.choices);
> > >   	set_bit(PLATFORM_PROFILE_BALANCED, platform_profile_handler.choices);
> > > @@ -973,6 +1191,8 @@ static int thermal_profile_setup(void)
> > >   	return 0;
> > >   }
> > > 
> > > +static int hp_wmi_hwmon_init(void);
> > > +
> > >   static int __init hp_wmi_bios_setup(struct platform_device *device)
> > >   {
> > >   	/* clear detected rfkill devices */
> > > @@ -984,6 +1204,8 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
> > >   	if (hp_wmi_rfkill_setup(device))
> > >   		hp_wmi_rfkill2_setup(device);
> > > 
> > > +	hp_wmi_hwmon_init();
> > > +
> > >   	thermal_profile_setup();
> > > 
> > >   	return 0;
> > > @@ -1068,6 +1290,54 @@ static struct platform_driver hp_wmi_driver = {
> > >   	.remove = __exit_p(hp_wmi_bios_remove),
> > >   };
> > > 
> > > +static struct attribute *hwmon_attributes[] = {
> > > +	&dev_attr_fan1.attr,
> > > +	&dev_attr_fan2.attr,
> > > +	NULL
> > > +};
> > > +
> > > +static umode_t hp_wmi_hwmon_sysfs_is_visible(struct kobject *kobj,
> > > +					  struct attribute *attr, int idx)
> > > +{
> > > +	int fan_speed;
> > > +
> > > +	if (attr == &dev_attr_fan1.attr) {
> > > +		int ret = hp_wmi_get_fan_speed(0, &fan_speed);
> > > +
> > > +		if (ret < 0)
> > > +			return 0;
> > > +	} else if (attr == &dev_attr_fan2.attr) {
> > > +		int ret = hp_wmi_get_fan_speed(1, &fan_speed);
> > > +
> > > +		if (ret < 0)
> > > +			return 0;
> > > +	}
> > > +
> > > +	return attr->mode;
> > > +}
> > > +
> > > +static const struct attribute_group hwmon_attribute_group = {
> > > +	.is_visible = hp_wmi_hwmon_sysfs_is_visible,
> > > +	.attrs = hwmon_attributes
> > > +};
> > > +__ATTRIBUTE_GROUPS(hwmon_attribute);
> > > +
> > > +static int hp_wmi_hwmon_init(void)
> > > +{
> > > +	struct device *dev = &hp_wmi_platform_dev->dev;
> > > +	struct device *hwmon;
> > > +
> > > +	hwmon = devm_hwmon_device_register_with_groups(dev, "hp", &hp_wmi_driver,
> > > +			hwmon_attribute_groups);
> > 
> > I think you should use
> > 
> >    [devm_]hwmon_device_register_with_info()
> > 
> > as it creates sysfs attributes for you, etc. You wouldn't need to manually
> > create device attributes, and you wouldn't need fan{1,2}_show() at all.
> > 
> 
> Correct. Also, the code as written doesn't really make sense as hwmon driver
> because all its attributes are non-standard. The "sensors" command will show
> nothing.
> 

I failed to take a look at the documentation instead i just looked at a
different laptop's WMI driver as a reference. My bad.

> If you don't want to use standard hwmon ABI attributes, please don't register
> a hwmon driver. The non-standard attributes can reside in the platform
> sysfs directory. There is already the non-standard "hddtemp", so that would
> not make much of a difference anyway. On top of that, "max_fan" is added as
> non-hwmon attribute, making the hwmon registration even more pointless.
> 
> Guenter

I would like to expose these fan speeds properly, and hwmon seemed like
the way to do it. I'll redo this part to match how it should be done in the
documentation. 

The questions I have are:

The only value I have is the current fan speed in RPM, I don't have
the rest of the values like min,max,pulses,target. Is it ok to implement this
in hwmon if I don't have those values? Can I use default values in place of
the ones I don't have, or should i omit those fields entirely.
I can assume min speed to be 0 since it does turn off the fans at light load
but in the case of the max speed property, I don't know what it is. Do I omit 
that field entirely or ?

The "max_fan" that I added is not a RPM value, it's a simple toggle in WMI
that either sets the fans to blow at their max speed (1), or it sets them 
to auto (0), this matches what the windows omen command center does. 
I don't know of a way to expose this "properly" so i just added a simple 
attribute. Is there a proper way to expose this behaviour ?

Thanks,
Enver

> 
> > 
> > > +
> > > +	if (IS_ERR(hwmon)) {
> > > +		pr_err("Could not register hp hwmon device\n");
> > > +		return PTR_ERR(hwmon);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static int __init hp_wmi_init(void)
> > >   {
> > >   	int event_capable = wmi_has_guid(HPWMI_EVENT_GUID);
> > > --
> > > 2.33.0
> > 
> > 
> > Best regards,
> > Barnabás Pőcze
> > 
> 
