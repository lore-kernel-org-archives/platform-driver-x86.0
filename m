Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4E4C0015E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 13:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbjGYN3u (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 09:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjGYN3t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 09:29:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A00AE6D
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 06:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690291747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1ug17HCPyYXgIfirXBr+hlqgJSFu4HDkRRhm0FIONRA=;
        b=JDcAwDRj/JHJAxCXEwsYqp5qzBtOAInywC18rh6SriKPtOPtEpw9etqyHToF8tEd3/JEjb
        1gWbM6SRYU3Z9Bp24yQqKTnaQWrOSn590jJNEMTkTiXPnie8FhlqNPXLF6LNG0FzRwOiYE
        d5KftfN103RlsoF+YZJLIh8Vu7VSXv8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-89vvBjt8MZqyR4aSWeb7VA-1; Tue, 25 Jul 2023 09:29:05 -0400
X-MC-Unique: 89vvBjt8MZqyR4aSWeb7VA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-993d631393fso457639266b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 06:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690291744; x=1690896544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ug17HCPyYXgIfirXBr+hlqgJSFu4HDkRRhm0FIONRA=;
        b=dzAVzXPUcUa8jIdP4ZeTOYPyZ9pRK49xtE6e8VMwg6MsMZa0Hmy9Zew+xGl9HB+DHt
         LDg85SV8DasBM7ANaOAIYsUk8KI8D8+C9SHU3Eqyop2yywQqP6J1zv1l7DPgBrx6uR5t
         22Jat60J8s6LgyfaMtDGp/6bhaeW5ZYjmc0b0vpJSQXtHH6l/KAIPtUsBsSP99KLu9PH
         5uwarKG8eZFb0Iqt1vLmSmND/H6bYSY5X75DElVkgmrmMLW+7RcBrHO9cPJ30mmmJeWA
         Zfbd5izwNRo0sGUYPyDpR6rSPy+C/lOr2ZP5QIxAhtWf1/mWqEDLvQ3YL5f63ftGQIDH
         u4uw==
X-Gm-Message-State: ABy/qLbwRAPpEzzmQnDORMOYPqCJmPsy56HuNrdreCzU5uVSau7KH6eQ
        0S9z+s62M8Ff+QT5/SrRx817hOm7mKDaKmIu9pmExlFs9Qvotx0Bz0qLYAJmpi7VsJ6Vgr0OgXn
        uBmTjeStvdS9o4yMHPw0rPtFueb6TVFijSw==
X-Received: by 2002:a17:907:75d5:b0:994:34a2:8724 with SMTP id jl21-20020a17090775d500b0099434a28724mr12367215ejc.52.1690291744433;
        Tue, 25 Jul 2023 06:29:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEnsJKulanRAGbekw+sjjwoWdFvJGP+rywhpS9pzsSO2vEEFcPtvAKQuNKCCA0ROgLwR7sHzA==
X-Received: by 2002:a17:907:75d5:b0:994:34a2:8724 with SMTP id jl21-20020a17090775d500b0099434a28724mr12367204ejc.52.1690291744161;
        Tue, 25 Jul 2023 06:29:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kg8-20020a17090776e800b0099329b3ab67sm8184337ejc.71.2023.07.25.06.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 06:29:03 -0700 (PDT)
Message-ID: <5374b550-16b3-b8b9-d322-d9895861b70e@redhat.com>
Date:   Tue, 25 Jul 2023 15:29:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/x86: intel: hid: Always call BTNL ACPI method
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
References: <20230715181516.5173-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230715181516.5173-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/15/23 20:15, Hans de Goede wrote:
> On a HP Elite Dragonfly G2 the 0xcc and 0xcd events for SW_TABLET_MODE
> are only send after the BTNL ACPI method has been called.
> 
> Likely more devices need this, so make the BTNL ACPI method unconditional
> instead of only doing it on devices with a 5 button array.
> 
> Note this also makes the intel_button_array_enable() call in probe()
> unconditional, that function does its own priv->array check. This makes
> the intel_button_array_enable() call in probe() consistent with the calls
> done on suspend/resume which also rely on the priv->array check inside
> the function.
> 
> Reported-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> Closes: https://lore.kernel.org/platform-driver-x86/20230712175023.31651-1-maxtram95@gmail.com/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to the pdx86/fixes branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/intel/hid.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index 5632bd3c534a..641f2797406e 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -620,7 +620,7 @@ static bool button_array_present(struct platform_device *device)
>  static int intel_hid_probe(struct platform_device *device)
>  {
>  	acpi_handle handle = ACPI_HANDLE(&device->dev);
> -	unsigned long long mode;
> +	unsigned long long mode, dummy;
>  	struct intel_hid_priv *priv;
>  	acpi_status status;
>  	int err;
> @@ -692,18 +692,15 @@ static int intel_hid_probe(struct platform_device *device)
>  	if (err)
>  		goto err_remove_notify;
>  
> -	if (priv->array) {
> -		unsigned long long dummy;
> +	intel_button_array_enable(&device->dev, true);
>  
> -		intel_button_array_enable(&device->dev, true);
> -
> -		/* Call button load method to enable HID power button */
> -		if (!intel_hid_evaluate_method(handle, INTEL_HID_DSM_BTNL_FN,
> -					       &dummy)) {
> -			dev_warn(&device->dev,
> -				 "failed to enable HID power button\n");
> -		}
> -	}
> +	/*
> +	 * Call button load method to enable HID power button
> +	 * Always do this since it activates events on some devices without
> +	 * a button array too.
> +	 */
> +	if (!intel_hid_evaluate_method(handle, INTEL_HID_DSM_BTNL_FN, &dummy))
> +		dev_warn(&device->dev, "failed to enable HID power button\n");
>  
>  	device_init_wakeup(&device->dev, true);
>  	/*

