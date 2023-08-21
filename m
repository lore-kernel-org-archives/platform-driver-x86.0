Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D73EE4993
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 10:19:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234597AbjHUKTF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 06:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234607AbjHUKTE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 06:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B9DCF
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 03:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692613102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JuWYmlrr5hMPaiP8wsfDHQ4DesEtMHLgNalV/fRwpXo=;
        b=PBI7dmhMBOFQKZTsfNnuLzmk0JPo7ogT9c8nMQjtN/IMTaXbnZ70p3dEnwarIp6Lh7qY0x
        Svwa7/u0yF3kTPm0ZTvXZ18KEPS98bY+Gm1p89xMAA2TKnzfLIgyiFIuK0SneOygYe8KVt
        yJPImZLVZcwDqI0su7qMHpo+Kgo47D8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-nyfu1eFIMqKfaqIZ-XkOOg-1; Mon, 21 Aug 2023 06:18:21 -0400
X-MC-Unique: nyfu1eFIMqKfaqIZ-XkOOg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99df53612d2so524166366b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 03:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692613100; x=1693217900;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuWYmlrr5hMPaiP8wsfDHQ4DesEtMHLgNalV/fRwpXo=;
        b=V3+GWDeVL3fA+h6MuYPhU4RpMeHoNRRCOSYmzQn9TWI04ayJQeqhuBPBH/BRgypM8Y
         7iqN8O90f8wFqc+SgkzoBwyNgTl6hLfA4S2cwxBqb5zGFuOA2agXZzN70bR7+KFgXz2R
         Jb9WcsAzPYHEyMBLtKLWU7DEtxQBcNTUjZpI643ohmMoIRsxKeGck59f68hDQWbTugk3
         SXCwJt4w7ana/MxfcVIcB04kIxxr0wpbntc9JIhncpnp7rCQ4z4T7DTg6d4gjcATkZ2k
         4evcMbaTKiq3nDkER6pQVFjNhvTy23aOUDP5ufQ/af7ssfyPSct0KDrYy0EXQYJlobTG
         jAOQ==
X-Gm-Message-State: AOJu0YzD1AT6U6ScfbC4Plcb6hOI17MO0NIxKOSUedOnwjwCkUCLJTJo
        IXo0tbdrSQNGFB/hVJmVwBio0XJVLTBUMrL+uOD7DUwY5JBCKyB8OkqKd2+/QVOVa3VD5aTGN40
        g4wTC5bjsyub0i1IYs3E7iadMgUpgJkb+1w==
X-Received: by 2002:a17:906:d4:b0:9a1:8ce6:620e with SMTP id 20-20020a17090600d400b009a18ce6620emr3830813eji.17.1692613100510;
        Mon, 21 Aug 2023 03:18:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBw0Ad0gEf09Mz8/BbZOQ+T5zxE40KhcItulUaJsMuDlgB1QHthrHIVMZadvZw+mrQ2cSipQ==
X-Received: by 2002:a17:906:d4:b0:9a1:8ce6:620e with SMTP id 20-20020a17090600d400b009a18ce6620emr3830798eji.17.1692613100247;
        Mon, 21 Aug 2023 03:18:20 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f15-20020a170906084f00b0099cf9bf4c98sm6279077ejd.8.2023.08.21.03.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 03:18:19 -0700 (PDT)
Message-ID: <87ddaa85-b3ea-7dcd-64e6-bbca6bf1de19@redhat.com>
Date:   Mon, 21 Aug 2023 12:18:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86: intel: int1092: intel_sar: fix _DSM
 argument4 type mismatch issue
Content-Language: en-US
To:     Ivan Hu <ivan.hu@canonical.com>, s.shravan@intel.com,
        linuxwwan@intel.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230815102445.7101-1-ivan.hu@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230815102445.7101-1-ivan.hu@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ivan,

On 8/15/23 12:24, Ivan Hu wrote:
> Encountered a type mismatch as described below:
> \_SB.WCCD._DSM: Argument #4 type mismatch - Found [Integer], ACPI requires
> [Package]
> This is because the argument#4(arg3) is integer.
> According to the ACPI specification, the arg3 should be a package.
> _DSM (Device Specific Method)
> This optional object is a control method that enables devices to provide device
> specific control functions that are consumed by the device driver.
> Arguments: (4)
> Arg0 - A Buffer containing a UUID
> Arg1 - An Integer containing the Revision ID
> Arg2 - An Integer containing the Function Index
> Arg3 - A Package that contains function-specific arguments
> 
> The solution involves rectifying arg3 to be a package for the _DSM method.
> Furthermore, the firmware needs to ensure that ACPI table arg3 is a package as
> well. The suggested amendment is as follows:
> If ((Arg3 == Zero))
> {
>     WDMC [0x02] = WCS0
> }
> should modify as,
> If (((ToInteger(Derefof (Arg3 [Zero]))) == Zero))
> {
>     WDMC [0x02] = WCS0
> }
> 
> Signed-off-by: Ivan Hu <ivan.hu@canonical.com>

Thank you for your patch.

As you have mentioned in your commit message in order for this to
NOT break things the ACPI tables on *all* laptops using the
intel_sar driver would need to be updated to match.

Which is never going to happen, so merging this patch would
break intel_sar functionality on all existing laptop models
and likely also on future models since presumably Windows
will keep passing an Integer and this is what the ACPI tables
will keep expecting.

The "Argument #4 type mismatch - Found [Integer], ACPI requires [Package]"
messages is just warning and it is not that unusual for devices
to have a _DSM which goes against the ACPI specification
and instead e.g. directly expects an Integer as Arg3.

In this case we MUST always pass what the ACPI tables expect,
so that things *actually* work and we will just have to
live with the warning thrown by ACPICA.

NACK for this patch because we don't break working things
on purpose. We never ever break things on purpose but especially
not just to silence a warning in dmesg.

If you really want to get rid of these warnings then I suggest
you write a patch lowering the ACPI log message to a debug level.

Regards,

Hans





> ---
>  drivers/platform/x86/intel/int1092/intel_sar.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int1092/intel_sar.c b/drivers/platform/x86/intel/int1092/intel_sar.c
> index 6246c066ade2..8fffdce994aa 100644
> --- a/drivers/platform/x86/intel/int1092/intel_sar.c
> +++ b/drivers/platform/x86/intel/int1092/intel_sar.c
> @@ -215,13 +215,17 @@ static void sar_notify(acpi_handle handle, u32 event, void *data)
>  
>  static void sar_get_data(int reg, struct wwan_sar_context *context)
>  {
> -	union acpi_object *out, req;
> +	union acpi_object *out, req, argv4;
>  	u32 rev = 0;
>  
> -	req.type = ACPI_TYPE_INTEGER;
> +	argv4.type = ACPI_TYPE_PACKAGE;
> +	argv4.package.count = 1;
> +	argv4.package.elements = &req;
> +	req.integer.type = ACPI_TYPE_INTEGER;
>  	req.integer.value = reg;
> +
>  	out = acpi_evaluate_dsm_typed(context->handle, &context->guid, rev,
> -				      COMMAND_ID_CONFIG_TABLE, &req, ACPI_TYPE_PACKAGE);
> +				      COMMAND_ID_CONFIG_TABLE, &argv4, ACPI_TYPE_PACKAGE);
>  	if (!out)
>  		return;
>  	if (out->package.count >= 3 &&

