Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7664C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Jan 2022 09:43:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235933AbiAQJnJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Jan 2022 04:43:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32276 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235817AbiAQJnJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jan 2022 04:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642412588;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gkk+aQW7hdkOUH4ic9YrmZAbb9U8daAOM9F5XSsqWV8=;
        b=eeY9anbql+VmyhXX/+9bjWiDnAiulQHGXcWHLY069z6yROu1dCXXYK9fb9t+YkKST6RenN
        TQQqGF3Z4jXY3INoltL4JG5eZ+mceGg/ww0XMidI+empoWBU0nHLKciPPQayieY7f9jEkb
        ZBUuwjn5p1kJHNoTfqSVDhWF6wBpizM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-wxNm-P6VNXicEF3h63xvPA-1; Mon, 17 Jan 2022 04:43:07 -0500
X-MC-Unique: wxNm-P6VNXicEF3h63xvPA-1
Received: by mail-ed1-f71.google.com with SMTP id j10-20020a05640211ca00b003ff0e234fdfso13767663edw.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jan 2022 01:43:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gkk+aQW7hdkOUH4ic9YrmZAbb9U8daAOM9F5XSsqWV8=;
        b=qX/rd3BO3lG/dlX64DCxYP1sNFs6EiM6JCxqssq/z5WZbCt+010R66eYzRp580hZCA
         3aQeGENYPwurCF0lpBx7TTCD8hyY2K9z2y2yOXCZ3BuToOwXE37HbXM+ONUxMvy84Aec
         OGSiuG3HnQZQBW56cu2uVcf9FBTtTkORpdkqsK3e+vbZ9oRWxXMZ9HaXWQ+Fw3jClVVx
         DWzNeUo+bSBsr+4sXW0bvxmGXwQhZy8udrfcu2ghSsMGwzxilr9tJ5ds6e/x1Cv2xAXK
         A+a0eLttRs36BgFYf2pW2vUrPKjz7vIa8pspPKS9BexE6maAVC9NzoSUAiURy4acTlzf
         Tlyg==
X-Gm-Message-State: AOAM5309Zz7YPJ/sy/r+8/FCraALVm2GkgC90pkFF0/dz8HTSX4WxBAx
        dAorPOlNaNLyggNQFeOcISyFQ0FBdXX0g2gyElnB++sOrgLPSwJMIGPjuSfbPjpGIJditNoPz0p
        sWJEgYvGsxNNOX7UXVprpLkJlTjtdRtct1g==
X-Received: by 2002:a17:906:a893:: with SMTP id ha19mr15621494ejb.144.1642412585789;
        Mon, 17 Jan 2022 01:43:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNWTnlyw4GmzQ269K3uX9KT6l4v8Te4VmlikybOeacqUkTs4siKGUeXq98Ny8pupWluQhpnA==
X-Received: by 2002:a17:906:a893:: with SMTP id ha19mr15621480ejb.144.1642412585569;
        Mon, 17 Jan 2022 01:43:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id w22sm2474064eji.87.2022.01.17.01.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 01:43:05 -0800 (PST)
Message-ID: <6ba63954-aa17-bee7-82fb-0a5708f98d9a@redhat.com>
Date:   Mon, 17 Jan 2022 10:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the RWC
 NANOTE P8 AY07J 2-in-1
Content-Language: en-US
To:     yuk7 <yukx00@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220104081920.1794275-1-yukx00@gmail.com>
 <20220111154019.4599-1-yukx00@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220111154019.4599-1-yukx00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/11/22 16:40, yuk7 wrote:
> Add touchscreen info for RWC NANOTE P8 (AY07J) 2-in-1.
> 
> Signed-off-by: Yuka Kawajiri <yukx00@gmail.com>

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
>  drivers/platform/x86/touchscreen_dmi.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 17dd54d4b..e318b4094 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -773,6 +773,21 @@ static const struct ts_dmi_data predia_basic_data = {
>  	.properties	= predia_basic_props,
>  };
>  
> +static const struct property_entry rwc_nanote_p8_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 46),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-rwc-nanote-p8.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data rwc_nanote_p8_data = {
> +	.acpi_name = "MSSL1680:00",
> +	.properties = rwc_nanote_p8_props,
> +};
> +
>  static const struct property_entry schneider_sct101ctm_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> @@ -1406,6 +1421,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
>  		},
>  	},
> +	{
> +		/* RWC NANOTE P8 */
> +		.driver_data = (void *)&rwc_nanote_p8_data,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Default string"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "AY07J"),
> +			DMI_MATCH(DMI_PRODUCT_SKU, "0001")
> +		},
> +	},
>  	{
>  		/* Schneider SCT101CTM */
>  		.driver_data = (void *)&schneider_sct101ctm_data,
> 

