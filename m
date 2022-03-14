Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F67DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Mar 2022 10:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238586AbiCNKpn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 06:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238660AbiCNKpm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 06:45:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE8B2B7CC
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 03:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647254671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3bbstzOp/5bMn+0aWKNOSqX7CE9nCZfJUmENC/rVBcY=;
        b=ZdIFYXU8RKSfxsm9uoC5HpwgN+zfMornLGFtJpGMD/S/EDXHzNznRaOvfRJRyI5fa2W5qC
        wmxe9cHlUi5X2teBqjvVQzCuUMLLlBA6FSGP+ojBRxzSY8ZlhLHL/bToiyTodk90hxQsr5
        EzjoskU+b3lCSSdkfo/l+CJXIbIjic8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-hZuXAvR7OJ-zzQZFN3Ms4A-1; Mon, 14 Mar 2022 06:44:30 -0400
X-MC-Unique: hZuXAvR7OJ-zzQZFN3Ms4A-1
Received: by mail-ed1-f70.google.com with SMTP id 11-20020a50874b000000b004186b7c1252so2667369edv.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 03:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3bbstzOp/5bMn+0aWKNOSqX7CE9nCZfJUmENC/rVBcY=;
        b=UtYsCS8xwClRGS3HTlC1UoPVT2WWusK+ZTE1LjVJGwfjd0b9tdhqgsT7BWAPlma5Fr
         JyPNeRWXymO67dVbcajvsKdMr5vVss1yIdj0QKF6xLq8IAqKwlUaBhKx+c7yWTSHRomd
         RBiCfnjt820F6m+NZYOhxZYzCa9oG758JW1q2Ourk2saixfDhsSrmhUrdwZaSC9CvWpH
         l0WZ+cUpwLmqSysxD5cE4RF4Dnqdq5NNHIq+51Pk9QVPaqlbopCNDyOZo5sq9kjdxGB9
         hvy1opGZKyiwZ0MN/rhAwdv4xLArhIknHIWwZbP57HLKG9NKVfXKzEBkWNeNNnRC4Bi9
         CHvg==
X-Gm-Message-State: AOAM533GyAV61Qn1m8k9cVOvFHAeqQd60hZzOSsEHHcmyM4u5djeCg6n
        5BASh2Wxsa2VsIfhr8A5UWdglMZJWaGp/Acxlm2wpBfkeAvCilQ6pegAon3O+V2vQxSngdBFrD/
        YO78QpcfXRxcEKzGn6htMtZnT0FfeRcXSHg==
X-Received: by 2002:aa7:da93:0:b0:416:4aca:bef7 with SMTP id q19-20020aa7da93000000b004164acabef7mr20208761eds.296.1647254669318;
        Mon, 14 Mar 2022 03:44:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNWoz409usXnrCfCmszPAGRLigp6grZkXpix1yDIrNTih0va+jRGywBiGs38YDIqo/Fd/BCg==
X-Received: by 2002:aa7:da93:0:b0:416:4aca:bef7 with SMTP id q19-20020aa7da93000000b004164acabef7mr20208744eds.296.1647254669011;
        Mon, 14 Mar 2022 03:44:29 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id h17-20020a05640250d100b004185745f856sm4474710edb.74.2022.03.14.03.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 03:44:28 -0700 (PDT)
Message-ID: <9daae6ca-e567-7267-6550-bb6589c0ddad@redhat.com>
Date:   Mon, 14 Mar 2022 11:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 2/4] Fix SW_TABLET_MODE detection method
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220310210853.28367-1-jorge.lopez2@hp.com>
 <20220310210853.28367-3-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220310210853.28367-3-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/10/22 22:08, Jorge Lopez wrote:
> The purpose of this patch is to introduce a fix and removal of the
> current hack when determining tablet mode status.
> 
> Determining the tablet mode status requires reading Byte 0 bit 2 as
> reported by HPWMI_HARDWARE_QUERY.  The investigation identified the
> failure was rooted in two areas: HPWMI_HARDWARE_QUERY failure (0x05)
> and reading Byte 0, bit 2 only to determine the table mode status.
> HPWMI_HARDWARE_QUERY WMI failure also rendered the dock state value
> invalid.
> 
> The latest changes use SMBIOS Type 3 (chassis type) and WMI Command
> 0x40 (device_mode_status) information to determine if the device is
> in tablet mode or not.
> 
> hp_wmi_hw_state function was split into two functions;
> hp_wmi_get_dock_state and hp_wmi_get_tablet_mode.  The new functions
> separate how dock_state and tablet_mode is handled in a cleaner
> manner.
> 
> All changes were validated on a HP ZBook Workstation notebook,
> HP EliteBook x360, and HP EliteBook 850 G8.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> 
> This patch requires  patch "Fix hp_wmi_read_int() reporting
> error (0x05)" in order to work correctly.
> ---
>  drivers/platform/x86/hp-wmi.c | 71 +++++++++++++++++++++++++----------
>  1 file changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 103f56399ed0..e9aa05c26a40 100644
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
> +	HPWMI_SYSTEM_DEVICE_MODE	= 0x40,
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
> @@ -345,14 +354,40 @@ static int hp_wmi_read_int(int query)
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
> +	return !!(state & HPWMI_DOCK_MASK);
> +}
> +
> +static int hp_wmi_get_tablet_mode(void)
> +{
> +	char system_device_mode[4] = { 0 };
> +	int ret;
> +	bool tablet_found = false;
> +
> +	const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);

This new-line in the mids of the variable declaration block looks 
weird. Also we usually put variable declarations at the top of
a function in reverse-christmas tree order (longest variable
declarations first).

I've fixed this up to look like this:

	char system_device_mode[4] = { 0 };
	const char *chassis_type;
	bool tablet_found;
	int ret;

	chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
	if (!chassis_type)
		return -ENODEV;

(no functional changes).

> +	tablet_found = match_string(tablet_chassis_types,
> +			    ARRAY_SIZE(tablet_chassis_types),
> +			    chassis_type) >= 0;
> +	if (!tablet_found)
> +		return -ENODEV;
> +
> +	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
> +				       system_device_mode, 0, sizeof(system_device_mode));
> +

The newline here between the call + check looks weird, I've dropped this while
merging the patch:

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> +	if (ret < 0)
> +		return ret;
> +
> +	return system_device_mode[0] == DEVICE_MODE_TABLET;
>  }
>  
>  static int omen_thermal_profile_set(int mode)
> @@ -568,7 +603,7 @@ static ssize_t als_show(struct device *dev, struct device_attribute *attr,
>  static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
>  			 char *buf)
>  {
> -	int value = hp_wmi_hw_state(HPWMI_DOCK_MASK);
> +	int value = hp_wmi_get_dock_state();
>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -577,7 +612,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
>  static ssize_t tablet_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
>  {
> -	int value = hp_wmi_hw_state(HPWMI_TABLET_MASK);
> +	int value = hp_wmi_get_tablet_mode();
>  	if (value < 0)
>  		return value;
>  	return sprintf(buf, "%d\n", value);
> @@ -699,10 +734,10 @@ static void hp_wmi_notify(u32 value, void *context)
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
> @@ -780,19 +815,17 @@ static int __init hp_wmi_input_setup(void)
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
> @@ -1227,10 +1260,10 @@ static int hp_wmi_resume_handler(struct device *device)
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

