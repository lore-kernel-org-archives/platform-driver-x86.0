Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2F3C43334
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 20:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347432AbiFJU26 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 16:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350971AbiFJU2j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 16:28:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 11C1B30222A
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 13:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654892892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xFJFel16t+evvNsRGLs7AYIMAVBtttUqOw5BCsnDdMA=;
        b=S0R81c6uZ6LWciNG04i8+P8USDUKeUcJQ5m9gaJVrSRbGfOJlevLlHX8k7wN545mPv4+2G
        BhpUJsQ9wWMUzeXIS2P//maYowaFq0Fe2PHJc0YUy6yUEnwbmfMkyG/Vq5haDfmGMIoF+H
        W2eTNr5fSE80CLq2SRftB8+q/Axj8y0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-k5r5mmhlOTWSMBisC82LrQ-1; Fri, 10 Jun 2022 16:28:10 -0400
X-MC-Unique: k5r5mmhlOTWSMBisC82LrQ-1
Received: by mail-ed1-f72.google.com with SMTP id k7-20020aa7d8c7000000b0042dd4a5a393so162807eds.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 13:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xFJFel16t+evvNsRGLs7AYIMAVBtttUqOw5BCsnDdMA=;
        b=5nZOKlFQI3KuzG4GVd2caDKW6U7TbUdLqleOj0hnqjsHcZ2dMDur7qMhGtX6wGXNMM
         LEFZrsVl93W6qAaKqpDLVmet8gBmyZonATDK7gIHv9yS8+tPiJKW5k3nu8e6aoXpyLQx
         +iohbX2x1Duul1/PbCjZku9CV33Q/yq/93TlO0s693alR0VxTaJxH9CRcXwIa9HAVUKm
         YT07MrE7grH6SkQ/4LYONxdtSGYqOnF5O+jyhYriZlxy/V6Jm8K79Uj0/gJYD1lkf2WN
         HWCNx4iENRPzqXW/uiZQT2USIlj3CQ4XaxN9JyoQ16fAoxbYH6z0BqAgNAX/iP5hwg44
         /Owg==
X-Gm-Message-State: AOAM532NfXK8pROwd0vMSMDEiVCY2Pk8PiJqV+n2hqydEa62YO/N6GYV
        ayFK4NPDFgkfB/iD3JSUBM2oiDyiUe3efT2Qun1oqREVyD8RUyNUqANR+vdDniibWZfjlRUzZPj
        TjbgL+pujqlNuBZnK/R14LA5io9RRLnG9hA==
X-Received: by 2002:a17:906:5197:b0:712:2223:d3d0 with SMTP id y23-20020a170906519700b007122223d3d0mr4241570ejk.74.1654892889865;
        Fri, 10 Jun 2022 13:28:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0whWREqwm7oLcgTTSBlSj3Ldcl719ALJ3BZPSg093xu1zeFFG4dGLpWcqNYsN1jAs42xV0Q==
X-Received: by 2002:a17:906:5197:b0:712:2223:d3d0 with SMTP id y23-20020a170906519700b007122223d3d0mr4241563ejk.74.1654892889744;
        Fri, 10 Jun 2022 13:28:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id r21-20020a1709067fd500b006fec5cef701sm10079ejs.197.2022.06.10.13.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 13:27:30 -0700 (PDT)
Message-ID: <cd49e779-b99a-a81d-d0dc-078d287b5bc6@redhat.com>
Date:   Fri, 10 Jun 2022 22:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work with
 certain devices
Content-Language: en-US
To:     Bedant Patnaik <bedant.patnaik@gmail.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20220607132428.7221-1-bedant.patnaik@gmail.com>
 <094f73b7-f618-aa12-762b-3b1a1f4556d2@redhat.com>
 <CAOOmCE8QYEwh6TrgA=_sTcm4spkuk3rjMS4g78nbBbWXWUB2aQ@mail.gmail.com>
 <fd1b71fe-d9a7-65bb-314c-f11b7d550fe8@redhat.com>
 <CAOOmCE-NN6cQ-hcG5Tyd8P8AjounN5aVZTD=AouX-isWNqe4dA@mail.gmail.com>
 <ca2bb15600cd7d101153eb4ee4a62ef5d8f0df72.camel@gmail.com>
 <CAOOmCE8LO5ns8pf4fhXWrDiBwYUHsvEtmqcSfEiw5nsKYKhSNw@mail.gmail.com>
 <41be46743d21c78741232a47bbb5f1cdbcc3d21e.camel@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <41be46743d21c78741232a47bbb5f1cdbcc3d21e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/8/22 21:28, Bedant Patnaik wrote:
> From 26f84d835819fa38872c673f49f1b77774927568 Mon Sep 17 00:00:00 2001
> From: Bedant Patnaik <bedant.patnaik@gmail.com>
> Date: Thu, 9 Jun 2022 00:50:53 +0530
> Subject: [PATCH] Use zero insize parameter only when supported
> 
> be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-wmi: Fix 0x05 error code reported by several WMI calls")
> and 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86: hp-wmi: Fix hp_wmi_read_int() reporting error (0x05)")
> cause ACPI BIOS Error (bug): Attempt to CreateField of length zero (20211217/dsopcode-133) because of the ACPI
> method HWMC, which unconditionally creates a Field of size (insize*8) bits:
> 	CreateField (Arg1, 0x80, (Local5 * 0x08), DAIN)
> In cases where args->insize = 0, the Field size is 0, resulting in an error.
> Fix: use zero insize only if 0x5 error code is returned
> 
> Tested on Omen 15 AMD (2020) board ID: 8786.
> 
> Signed-off-by: Bedant Patnaik <bedant.patnaik@gmail.com>

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



> ---
>  drivers/platform/x86/hp-wmi.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 277397de5..0e07581b8 100644
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
> @@ -220,6 +221,7 @@ static struct input_dev *hp_wmi_input_dev;
>  static struct platform_device *hp_wmi_platform_dev;
>  static struct platform_profile_handler platform_profile_handler;
>  static bool platform_profile_support;
> +static bool zero_insize_support;
>  
>  static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
> @@ -376,7 +378,7 @@ static int hp_wmi_read_int(int query)
>  	int val = 0, ret;
>  
>  	ret = hp_wmi_perform_query(query, HPWMI_READ, &val,
> -				   0, sizeof(val));
> +				   zero_if_sup(val), sizeof(val));
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
> @@ -412,7 +414,8 @@ static int hp_wmi_get_tablet_mode(void)
>  		return -ENODEV;
>  
>  	ret = hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
> -				   system_device_mode, 0, sizeof(system_device_mode));
> +				   system_device_mode, zero_if_sup(system_device_mode),
> +				   sizeof(system_device_mode));
>  	if (ret < 0)
>  		return ret;
>  
> @@ -499,7 +502,7 @@ static int hp_wmi_fan_speed_max_get(void)
>  	int val = 0, ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> -				   &val, 0, sizeof(val));
> +				   &val, zero_if_sup(val), sizeof(val));
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
> @@ -511,7 +514,7 @@ static int __init hp_wmi_bios_2008_later(void)
>  {
>  	int state = 0;
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
> -				       0, sizeof(state));
> +				       zero_if_sup(state), sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -522,7 +525,7 @@ static int __init hp_wmi_bios_2009_later(void)
>  {
>  	u8 state[128];
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
> -				       0, sizeof(state));
> +				       zero_if_sup(state), sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -600,7 +603,7 @@ static int hp_wmi_rfkill2_refresh(void)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   0, sizeof(state));
> +				   zero_if_sup(state), sizeof(state));
>  	if (err)
>  		return err;
>  
> @@ -1009,7 +1012,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   0, sizeof(state));
> +				   zero_if_sup(state), sizeof(state));
>  	if (err)
>  		return err < 0 ? err : -EINVAL;
>  
> @@ -1485,11 +1488,15 @@ static int __init hp_wmi_init(void)
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

