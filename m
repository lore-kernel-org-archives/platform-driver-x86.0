Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2B8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 13:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236946AbiCJNwP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 08:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242583AbiCJNwO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 08:52:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 19DF314FBF3
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 05:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646920272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GiQABXRAm0cy+gJcDFdLgXcgTLU56NCEfNsuWSo5h1I=;
        b=KYC3RNUoktNya6QILdDowwZDBSfDGQdjrO9wGN6Wo1PVGYFJlzSweJFwe3CL7IhPFWSG7q
        VmQ+K8dSDbgwUi188zgjyCh0reI7NRaAf1V6jRNw8+k8vIMzpp2E4F1P5IqJtFUq8Wqpar
        huUeBNqX/x1Il+YMe426LNDVI1vYzpg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-fIOupNE9PtKf9zG7B2H41w-1; Thu, 10 Mar 2022 08:51:10 -0500
X-MC-Unique: fIOupNE9PtKf9zG7B2H41w-1
Received: by mail-ed1-f72.google.com with SMTP id l8-20020a056402028800b0041636072ef0so3105098edv.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 05:51:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GiQABXRAm0cy+gJcDFdLgXcgTLU56NCEfNsuWSo5h1I=;
        b=wJAYwz9pMqQa9NBWhKJYzYsZsSzlMfYAGcFWMirelo3u6E0Fe7eftXtwO+0tHopFHO
         BbOMgaBSrRvHbmp/IHMkVcOWXhtITDyzb3/DbeSEBsq1UL+dlSAkyzo3q/Unx2PS+HyX
         OMplF6TzytQjywa0xSNm4yUUIw/LSq9aK8GeoMukmRrF2h93irgQ1iA7JW0Lk+8ngZ/v
         xBUlPXmgKRKeGCIuY2eIRJSBL2uqoLIt3mMlMkxmIs8UxMg1baj2owqNZ1pAcyVoQYjp
         7zdiqqb35ZatkDtnJFp+Kj6eclM53Ic3j2zMiZZFOKWrF+fahfI2DgP5ofpk0S6gW+Tk
         O+AA==
X-Gm-Message-State: AOAM5305mu5S/0GSfBgVvM9LplyE7mnTHqVkEMtywOuhSqBw/MU3bs8k
        RbpOoZFpK6h7s4mJqk0XeWQTg1yEIRMlHUCwr7haC5QD2vU6p/qLdtvagIQdcZW8w8DhDkAGayZ
        c8SgADzimNoLPWmO/jZcsDZGqA/yPAcHHqA==
X-Received: by 2002:a05:6402:8c9:b0:415:a145:9482 with SMTP id d9-20020a05640208c900b00415a1459482mr4559336edz.415.1646920269208;
        Thu, 10 Mar 2022 05:51:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwezhcM86YS8wERzCUfJe1RrtPMu77otXb0lpEs7DiwLwW7Ek00SBoFr9WAGsCmJQBDlq8NGQ==
X-Received: by 2002:a05:6402:8c9:b0:415:a145:9482 with SMTP id d9-20020a05640208c900b00415a1459482mr4559310edz.415.1646920268957;
        Thu, 10 Mar 2022 05:51:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id z10-20020aa7cf8a000000b004160af67840sm1993119edx.66.2022.03.10.05.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 05:51:08 -0800 (PST)
Message-ID: <3cc6b081-ac09-018c-f5d2-0c19d43a4635@redhat.com>
Date:   Thu, 10 Mar 2022 14:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 1/3] Fix SW_TABLET_MODE detection method
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220307220932.23607-1-jorge.lopez2@hp.com>
 <20220307220932.23607-2-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220307220932.23607-2-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 3/7/22 23:09, Jorge Lopez wrote:
> The purpose of this patch is to introduce a fix and removal
> of the current hack when determining tablet mode status.
> 
> Determining the tablet mode status requires reading Byte 0 bit 2
> as reported by HPWMI_HARDWARE_QUERY.  The investigation identified the
> failure was rooted in two areas: HPWMI_HARDWARE_QUERY failure (0x05)
> and reading Byte 0, bit 2 only to determine the table mode status.
> HPWMI_HARDWARE_QUERY WMI failure also rendered the dock state value invalid.
> 
> The latest changes use SMBIOS Type 3 (chassis type) and WMI Command 0x40
> (device_mode_status) information to determine if the device is in tablet
> mode or not.
> 
> hp_wmi_hw_state function was split into two functions; hp_wmi_get_dock_state
> and hp_wmi_get_tablet_mode.  The new functions separate how dock_state and
> tablet_mode is handled in a cleaner manner.
> 
> All changes were validated on a HP ZBook Workstation notebook,
> HP EliteBook x360, and HP EliteBook 850 G8.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

This is mostly looking good, some small remarks / request for tweaks
below. After those I believe that this patch will be ready for merging.



> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 80 ++++++++++++++++++++++++++---------
>  1 file changed, 60 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 48a46466f086..e142e9a0d317 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -35,10 +35,6 @@ MODULE_LICENSE("GPL");
>  MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
>  MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
>  
> -static int enable_tablet_mode_sw = -1;
> -module_param(enable_tablet_mode_sw, int, 0444);
> -MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=auto, 0=no, 1=yes)");
> -
>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> @@ -107,6 +103,7 @@ enum hp_wmi_commandtype {
>  	HPWMI_FEATURE2_QUERY		= 0x0d,
>  	HPWMI_WIRELESS2_QUERY		= 0x1b,
>  	HPWMI_POSTCODEERROR_QUERY	= 0x2a,
> +	HPWMI_SYSTEM_DEVICE_MODE       = 0x40,
>  	HPWMI_THERMAL_PROFILE_QUERY	= 0x4c,
>  };
>  
> @@ -217,6 +214,18 @@ struct rfkill2_device {
>  static int rfkill2_count;
>  static struct rfkill2_device rfkill2[HPWMI_MAX_RFKILL2_DEVICES];
>  
> +/* Chassis Types values were obtained from SMBIOS reference
> + * specification version 3.00. A complete list of system enclosures
> + * and chassis types is available on Table 17. 
> + */
> +static const char * const tablet_chassis_types[] = {
> +	"30", /* Tablet*/
> +	"31", /* Convertible */
> +	"32"  /* Detachable */
> +};
> +
> +#define DEVICE_MODE_TABLET	0x06
> +
>  /* map output size to the corresponding WMI method id */
>  static inline int encode_outsize_for_pvsz(int outsize)
>  {
> @@ -337,7 +346,7 @@ static int hp_wmi_read_int(int query)
>  	int val = 0, ret;
>  
>  	ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
> -				   sizeof(val), sizeof(val));
> +				   0, sizeof(val));
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;

This change impacts all callers of hp_wmi_read_int(),
please put this in a new 1/4 patch with its own
commit message giving more details about this change.

> @@ -345,14 +354,47 @@ static int hp_wmi_read_int(int query)
>  	return val;
>  }
>  
> -static int hp_wmi_hw_state(int mask)
> +static int hp_wmi_get_dock_state(void)
>  {
>  	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
>  
>  	if (state < 0)
>  		return state;
>  
> -	return !!(state & mask);
> +	if (!(state & HPWMI_DOCK_MASK))
> +		return 0;
> +
> +	return 1;

please use:

	return !!(state & HPWMI_DOCK_MASK);

Here so that there only is a single return statement
for the success path.

> +}
> +
> +static int hp_wmi_get_tablet_mode(void)
> +{
> +	char system_device_mode[4] = { 0 };
> +	int ret;
> +	bool tablet_found = false;
> +
> +	const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
> +
> +	if (!chassis_type)
> +		return 0;

return -ENODEV here so that hp_wmi_input_setup() does not
register a SW_TABLET_MODE capability in this case.

Userspace *always* will behave as if the device is not a tablet
(e.g. NOT show on screen keyboard when focussing text fields)
if the driver advertises SW_TABLET_MODE capability which
always reports 0. So it is important to not advertise
SW_TABLET_MODE at all when it is not available.

> +
> +	tablet_found = match_string(tablet_chassis_types,
> +			    ARRAY_SIZE(tablet_chassis_types),
> +			    chassis_type) >= 0;
> +	
> +	if (!tablet_found)
> +		return 0;

Again return -ENODEV.

> +
> +	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
> +				       system_device_mode, 0, sizeof(system_device_mode));
> +
> +	if (ret < 0)
> +		return 0;

If this fails once it will likely fail always, so please do
"return ret" here, so that hp_wmi_input_setup() does not
register a SW_TABLET_MODE capability in this case.

> +
> +	if (system_device_mode[0] == DEVICE_MODE_TABLET) 
> +		return 1;
> +	
> +	return 0;

Please do:

	return system_device_mode[0] == DEVICE_MODE_TABLET;

here instead.


>  }
>  
>  static int omen_thermal_profile_set(int mode)
> @@ -568,7 +610,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
>  static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf)
>  {
> -	int value = hp_wmi_hw_state(HPWMI_DOCK_MASK);
> +	int value = hp_wmi_get_dock_state();
>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -577,7 +619,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
>  static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
>  {
> -	int value = hp_wmi_hw_state(HPWMI_TABLET_MASK);
> +	int value = hp_wmi_get_tablet_mode();
>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -699,10 +741,10 @@ static void hp_wmi_notify(u32 value, void *context)
>  	case HPWMI_DOCK_EVENT:
>  		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
>  			input_report_switch(hp_wmi_input_dev, SW_DOCK,
> -					    hp_wmi_hw_state(HPWMI_DOCK_MASK));
> +					    hp_wmi_get_dock_state());
>  		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
>  			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
> -					    hp_wmi_hw_state(HPWMI_TABLET_MASK));
> +					    hp_wmi_get_tablet_mode());
>  		input_sync(hp_wmi_input_dev);
>  		break;
>  	case HPWMI_PARK_HDD:
> @@ -780,19 +822,17 @@ static int __init hp_wmi_input_setup(void)
>  	__set_bit(EV_SW, hp_wmi_input_dev->evbit);
>  
>  	/* Dock */
> -	val = hp_wmi_hw_state(HPWMI_DOCK_MASK);
> +	val = hp_wmi_get_dock_state();
>  	if (!(val < 0)) {
>  		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
>  		input_report_switch(hp_wmi_input_dev, SW_DOCK, val);
>  	}
>  
>  	/* Tablet mode */
> -	if (enable_tablet_mode_sw > 0) {
> -		val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
> -		if (val >= 0) {
> -			__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
> -			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
> -		}
> +	val = hp_wmi_get_tablet_mode();
> +	if (!(val < 0)) {
> +		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
> +		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
>  	}
>  
>  	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
> @@ -1227,10 +1267,10 @@ static int hp_wmi_resume_handler(struct device *device)
>  	if (hp_wmi_input_dev) {
>  		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
>  			input_report_switch(hp_wmi_input_dev, SW_DOCK,
> -					    hp_wmi_hw_state(HPWMI_DOCK_MASK));
> +					    hp_wmi_get_dock_state());
>  		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
>  			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
> -					    hp_wmi_hw_state(HPWMI_TABLET_MASK));
> +					    hp_wmi_get_tablet_mode());
>  		input_sync(hp_wmi_input_dev);
>  	}
>  


Regards,

Hans

