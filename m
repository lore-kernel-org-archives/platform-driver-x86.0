Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAEDC77B6D
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Apr 2023 10:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbjDCKEY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Apr 2023 06:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231730AbjDCKEY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Apr 2023 06:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9D39526E
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Apr 2023 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680516213;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wA8QAb0BytdfB1jw9T76UqPrNQns0erlp298xSbCHJo=;
        b=Dpe/Qmsrscm3KJoNPCaLCCW8ifUJ8GOVlL8fpi57SMBc4dXOUHWuAAAhaM53SWGYSdnpMU
        d/1fnHmTyK4n6AtXzYswTOHzwR0vuHaiyabg3MxeW+MkDa6G40bLl4Qo4YFatYuGPK21pn
        fA6N7RDy0cNGdxBenpP/Il5RDU8sq3w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-gWtQr7d8MxCR1GWGnbYkdg-1; Mon, 03 Apr 2023 06:03:32 -0400
X-MC-Unique: gWtQr7d8MxCR1GWGnbYkdg-1
Received: by mail-ed1-f72.google.com with SMTP id t26-20020a50d71a000000b005003c5087caso40057555edi.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Apr 2023 03:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680516211;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wA8QAb0BytdfB1jw9T76UqPrNQns0erlp298xSbCHJo=;
        b=Mk7LwHiRC41alMvYF6xioWG2Gye7qrSHesIsMxmB/abhiZwzduoLLjLQ5ubDHvG6PB
         IsthrKqHohgBt7nAKjGthbcgH4pAulGKsI/bFunQ9xNkRVxC/sQPQh6hgWfS+iiQy4Wi
         UG5Timiv4+j+RGMAuEy+QHwgU45hmEB23gilBO74taeSgTaiiDrD0Y8NvM/ABc/E3Uj+
         FAfb8FghfSjv6W0yPK2ZY9/Vq7tlYS5KTiv7PZyxyvHoeEeZAGZ9iOImBx85AQ6vMxvp
         ioDT/MhLFbW55Q+cBuLzfi6TfBszJUsff+G64XEIslPshc1GzGCK9Y5/WXUCafFGafz5
         EZmA==
X-Gm-Message-State: AAQBX9fhgUcj2nHfKP3Vgltlz05AzS8G54qABvR6HTj6BW6vGo3O4ST1
        CedHrkfbaAgHxFjJC1v120ibF4QmSdJYmkTVt1akFs1tIYwClN4vFt3L1Jygm06dWFIWMK/a19q
        QFwyoxjmXqBQwbZzNYiouQfvygeQhCgsoyQ==
X-Received: by 2002:aa7:d49a:0:b0:502:7d3f:1f04 with SMTP id b26-20020aa7d49a000000b005027d3f1f04mr10062089edr.19.1680516211102;
        Mon, 03 Apr 2023 03:03:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350a0nPW43YqlMdcDjiYd0jFbBqM/6O0e3gYnr0BMt9FfSlb1Dm3DExUKfArY9LumLUt0EDLCnw==
X-Received: by 2002:aa7:d49a:0:b0:502:7d3f:1f04 with SMTP id b26-20020aa7d49a000000b005027d3f1f04mr10062074edr.19.1680516210787;
        Mon, 03 Apr 2023 03:03:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f24-20020a50a6d8000000b004acbda55f6bsm4381529edc.27.2023.04.03.03.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 03:03:30 -0700 (PDT)
Message-ID: <a192e386-5385-d18a-9816-273e433eb833@redhat.com>
Date:   Mon, 3 Apr 2023 12:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add missing T14s Gen1 type
 to s2idle quirk list
Content-Language: en-US, nl
To:     Benjamin Asbach <asbachb.kernel@impl.it>
Cc:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenvo.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230331232447.37204-1-asbachb.kernel@impl.it>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230331232447.37204-1-asbachb.kernel@impl.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/23 01:24, Benjamin Asbach wrote:
>> Lenovo laptops that contain NVME SSDs across a variety of generations have
>> trouble resuming from suspend to idle when the IOMMU translation layer is
>> active for the NVME storage device.
>>
>> This generally manifests as a large resume delay or page faults. These
>> delays and page faults occur as a result of a Lenovo BIOS specific SMI
>> that runs during the D3->D0 transition on NVME devices.
> 
> Link: https://lore.kernel.org/all/20220503183420.348-1-mario.limonciello@amd.com/
> 
> As Lenovo distributes T14s Gen1 laptops with different product names
> a missing one is added by this patch.
> 
> Note: Based on lenovo support page there might be some more variants which
> are not represented in s2idle quirk list.

Can you provide some more in info on this? Then Mark can maybe check
if we need to add more models ?

Mark, generally speaking it may help to do a DMI_EXACT_MATCH on
DMI_PRODUCT_VERSION with ThinkPads ? That contains the human
readable model string instead of things like "20UJ", and I guess
that we want to e.g. apply the s2idle quirk to all "T14s Gen1 AMD"
ThinkPads.

> 
> Signed-off-by: Benjamin Asbach <asbachb.kernel@impl.it>
> Tested-by: Benjamin Asbach <asbachb.kernel@impl.it>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans





> 
> Link: https://bbs.archlinux.org/viewtopic.php?pid=2084655#p2084655
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 32c10457399e..57428d7a392d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4478,6 +4478,15 @@ static const struct dmi_system_id fwbug_list[] __initconst = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "20UH"),
>  		}
>  	},
> +	{
> +		.ident = "T14s Gen1 AMD",
> +		.driver_data = &quirk_s2idle_bug,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "20UJ"),
> +		}
> +	},
> +
>  	{
>  		.ident = "P14s Gen1 AMD",
>  		.driver_data = &quirk_s2idle_bug,

