Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D7CC43334
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Jun 2022 13:35:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244790AbiFGNfW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 09:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244771AbiFGNfV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 09:35:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9C12CC2EE6
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654608919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qCpstTUjofZHgsV10yVsCC+WPBDiTvwKEbWBkWwDtuc=;
        b=LeBP2+AgogVHsQxKMYVqr1cvfyHKka9p3KRY7UCGS9uh1Ib/UsBl9oVEwTEuUY1E9RezaH
        LPEEwfEPvHfIV7qv2zgq9ll5/ju7i/A6fdQ+fq5HhIEft36UY0Tafys6kuboPYFduM7Ysx
        KB9Iv3b5yOxxF41CapgbKR1ap8FSzbQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-H1RMmrwSOU2lhADiDjG7rw-1; Tue, 07 Jun 2022 09:35:18 -0400
X-MC-Unique: H1RMmrwSOU2lhADiDjG7rw-1
Received: by mail-ej1-f70.google.com with SMTP id hy20-20020a1709068a7400b00703779e6f2fso7834542ejc.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 06:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qCpstTUjofZHgsV10yVsCC+WPBDiTvwKEbWBkWwDtuc=;
        b=eytYuBprBpIs+1RjKyrL84fGLQT07QGGkEvprq4xQfo7lOxdnE2AS9n4W3ur+FYYF2
         MSUMAwCuZqZjl5jSPAg65HkIqIrkyA02qWq3HPuzs0JOkL1+dR9rgt0JmBVuTr/Y2SJU
         oeamhxrI5fZmxMtoy2qYbPsO5kMJVy4dkXdjNYLHeeolNIVz6oefmcp0X6d8ZGUKjt2X
         CnE2uMvhde14C1QLoR4DbnoJkF+d5zuLgeQ6w9dRJ35Y5MhzlHmMIqyUKjms4jDqaOKs
         tU/HomBTYwHobS0V455Wg6Nq1C56OvA7m4cV8pezyN9ncliYFsSeNS3m0VuGh8L7hHid
         13KQ==
X-Gm-Message-State: AOAM531kPJJRAtR9XwirJkkGj7JNDF17H5mNEClkgi5kKUawmpFZGza+
        GtE5ZlmEHbHTakhCB9YN8eVYNiULfjdvCJKqbM0I08vZriZSPch4NRT5EVCkGsqzOOOX9BllWkN
        V8Ohw5YcVD9q1kWADocRfwbm41c760Ekjgg==
X-Received: by 2002:a05:6402:e85:b0:41d:121b:f436 with SMTP id h5-20020a0564020e8500b0041d121bf436mr33779296eda.121.1654608916752;
        Tue, 07 Jun 2022 06:35:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaTa5oYeN+fRllcw3u+xPfG2WsXzto9gHLqaFdkKPltmYFCPbpMUwPl5ShZUyFP97eFEd9mA==
X-Received: by 2002:a05:6402:e85:b0:41d:121b:f436 with SMTP id h5-20020a0564020e8500b0041d121bf436mr33779262eda.121.1654608916484;
        Tue, 07 Jun 2022 06:35:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k6-20020a1709067ac600b006febce7081bsm7702768ejo.163.2022.06.07.06.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 06:35:15 -0700 (PDT)
Message-ID: <094f73b7-f618-aa12-762b-3b1a1f4556d2@redhat.com>
Date:   Tue, 7 Jun 2022 15:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work with
 certain devices
Content-Language: en-US
To:     Bedant Patnaik <bedant.patnaik@gmail.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <20220607132428.7221-1-bedant.patnaik@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220607132428.7221-1-bedant.patnaik@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Hi Bedant,

Adding Jorge from HP to the To: list.

On 6/7/22 15:24, Bedant Patnaik wrote:
> 4b4967cbd2685f313411e6facf915fb2ae01d796 ("platform/x86: hp-wmi: Changing bios_args.data to be dynamically...")
> broke WMI queries on some devices where the ACPI method HWMC unconditionally attempts to create Fields beyond the buffer
> if the buffer is too small, this breaks essential features such as power profiles:
>         CreateByteField (Arg1, 0x10, D008)
>         CreateByteField (Arg1, 0x11, D009)
>         CreateByteField (Arg1, 0x12, D010)
>         CreateDWordField (Arg1, 0x10, D032)
>         CreateField (Arg1, 0x80, 0x0400, D128)
> In cases where args->data had zero length, ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D008] at bit 
> offset/length 128/8 exceeds size of target Buffer (128 bits) (20211217/dsopcode-198) was obtained.
> Fix: allocate at least 128 bytes for args->data
> 
> be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-wmi: Fix 0x05 error code reported by several WMI calls")
> and 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86: hp-wmi: Fix hp_wmi_read_int() reporting error (0x05)")
> caused ACPI BIOS Error (bug): Attempt to CreateField of length zero (20211217/dsopcode-133) because of the ACPI
> method HWMC, which unconditionally creates a Field of size (insize*8) bits:
> 	CreateField (Arg1, 0x80, (Local5 * 0x08), DAIN)
> In cases where args->insize = 0, the Field size is 0, resulting in an error.
> Fix: use zero insize only if 0x5 error code is returned
> 
> Tested on Omen 15 AMD (2020) board ID: 8786.

Thank you for looking into this. The alloc at least
128 bytes part for args->data looks good and likely is a better
fix then the revert of 4b4967cbd2685f3 which Jorge has submitted.

I'm not 100% sure about the zero_insize_support() thingie though.

Looking at the original fix and then trying to get things
to work on all models with some requiring insize==0 and
otheres requiring insize!=0 I guess this also makes sense...

Jorge, any remarks on this patch?

Regards,

Hans

> 
> Signed-off-by: Bedant Patnaik <bedant.patnaik@gmail.com>
> Cc: markgross@kernel.org
> Cc: platform-driver-x86@vger.kernel.org
> 
> ---
>  drivers/platform/x86/hp-wmi.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 667f94bba..3ef385f14 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -38,6 +38,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> +#define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
>  
>  /* DMI board names of devices that should use the omen specific path for
>   * thermal profiles.
> @@ -175,7 +176,7 @@ enum hp_thermal_profile_omen_v1 {
>  enum hp_thermal_profile {
>  	HP_THERMAL_PROFILE_PERFORMANCE	= 0x00,
>  	HP_THERMAL_PROFILE_DEFAULT		= 0x01,
> -	HP_THERMAL_PROFILE_COOL			= 0x02
> +	HP_THERMAL_PROFILE_COOL			= 0x02,
>  };
>  
>  #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) != HPWMI_POWER_FW_OR_HW)
> @@ -220,6 +221,7 @@ static struct input_dev *hp_wmi_input_dev;
>  static struct platform_device *hp_wmi_platform_dev;
>  static struct platform_profile_handler platform_profile_handler;
>  static bool platform_profile_support;
> +static bool zero_insize_support;
>  
>  static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
> @@ -297,8 +299,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  	if (WARN_ON(mid < 0))
>  		return mid;
>  
> -	bios_args_size = struct_size(args, data, insize);
> -	args = kmalloc(bios_args_size, GFP_KERNEL);
> +	bios_args_size = max(struct_size(args, data, insize), struct_size(args, data, 128));
> +	args = kzalloc(bios_args_size, GFP_KERNEL);
>  	if (!args)
>  		return -ENOMEM;
>  
> @@ -374,7 +376,7 @@ static int hp_wmi_read_int(int query)
>  	int val = 0, ret;
>  
>  	ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
> -				   0, sizeof(val));
> +				   zero_if_sup(val), sizeof(val));
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
> @@ -410,7 +412,8 @@ static int hp_wmi_get_tablet_mode(void)
>  		return -ENODEV;
>  
>  	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
> -				   system_device_mode, 0, sizeof(system_device_mode));
> +				   system_device_mode, zero_if_sup(system_device_mode),
> +				   sizeof(system_device_mode));
>  	if (ret < 0)
>  		return ret;
>  
> @@ -497,7 +500,7 @@ static int hp_wmi_fan_speed_max_get(void)
>  	int val = 0, ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> -				   &val, 0, sizeof(val));
> +				   &val, zero_if_sup(val), sizeof(val));
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
> @@ -509,7 +512,7 @@ static int __init hp_wmi_bios_2008_later(void)
>  {
>  	int state = 0;
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
> -				       0, sizeof(state));
> +				       zero_if_sup(state), sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -520,7 +523,7 @@ static int __init hp_wmi_bios_2009_later(void)
>  {
>  	u8 state[128];
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
> -				       0, sizeof(state));
> +				       zero_if_sup(state), sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -598,7 +601,7 @@ static int hp_wmi_rfkill2_refresh(void)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   0, sizeof(state));
> +				   zero_if_sup(state), sizeof(state));
>  	if (err)
>  		return err;
>  
> @@ -1007,7 +1010,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   0, sizeof(state));
> +				   zero_if_sup(state), sizeof(state));
>  	if (err)
>  		return err < 0 ? err : -EINVAL;
>  
> @@ -1483,11 +1486,15 @@ static int __init hp_wmi_init(void)
>  {
>  	int event_capable = wmi_has_guid(HPWMI_EVENT_GUID);
>  	int bios_capable = wmi_has_guid(HPWMI_BIOS_GUID);
> -	int err;
> +	int err, tmp = 0;
>  
>  	if (!bios_capable && !event_capable)
>  		return -ENODEV;
>  
> +	if (hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &tmp,
> +				 sizeof(tmp), sizeof(tmp)) == HPWMI_RET_INVALID_PARAMETERS)
> +		zero_insize_support = true;
> +
>  	if (event_capable) {
>  		err = hp_wmi_input_setup();
>  		if (err)

