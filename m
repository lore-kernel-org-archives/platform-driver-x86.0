Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47494C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 09:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23FE460F4B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 09:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238873AbhIMJ76 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 05:59:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22407 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238850AbhIMJ75 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 05:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631527122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DYBriljzN9ev2bq2TI0okdq7L0bZlz46ZlbCpsV98A4=;
        b=CJ326HJt8UkpXAxtF4szMwTmThkq2tyeO7+CLLQ9sCs6F514Djw6RJcdUtbvqFxrvEMnhK
        +kfTiFQuTgPr1r+KcWnYaTvTvKk6WOox2izG3Yzzxv+lofco9k6aBKbZ8ui3IXlRJ4cNd3
        xwoGxA0LaJHtyQuxsbR6YqWy9QDlMuU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-9LiKNkYIPU-UruGot_vVQQ-1; Mon, 13 Sep 2021 05:58:41 -0400
X-MC-Unique: 9LiKNkYIPU-UruGot_vVQQ-1
Received: by mail-ej1-f71.google.com with SMTP id cf17-20020a170906b2d100b005d42490f86bso3446973ejb.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 02:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DYBriljzN9ev2bq2TI0okdq7L0bZlz46ZlbCpsV98A4=;
        b=R4aHNY/hwKnp7cLjRuNidqteAzn6SBs1oe59eGJQh8H9eoXgDZmOiaFPh+wJnYCRNu
         SBTN/Aw3s93mOoAjeZ3OreAzbzOkCpPMuLfEpCghn9Pju0SlA52FilEyYOYnMIIm7Gj9
         +JfxoXEO4M4CvIIXV7bkm8j7MjbYY3bgG6JB5cdFAE08LOt7rgWodwi78NNON5GUUi87
         SLm8azJOnh9Om2CW+DbD/w4XnaaZhdzWx5nahWB/SQzIqKC0loP4Xxy6/w2h1i8OgxaJ
         8yv4fdwOI+od0NC1xRw6rP4ihsSvkQ4kNgVMsptY7A5FIAmd39IDIlAW5FlLeM3XL3+m
         LsjA==
X-Gm-Message-State: AOAM531ojRG6wWZH466ZCBn9J8L0zDZGsFqfCTEwsuyC9KceoNRKq/Qi
        kKKl395koRgtHTJLyb7EurMk4PS1MoKkmRAKptrU/3Ql2dSMF/D1eDaz0gCQ2SsjwDvJm37Dtkf
        HiWgYBjhEET7En1COS+KfOU2LeNa+M0Kx7zr3ED8EZTmbm5pTVS89eFY4Qsxa3bnOjAysqsExLU
        9lbxrjsa5HGw==
X-Received: by 2002:a17:906:848f:: with SMTP id m15mr11902872ejx.11.1631527119623;
        Mon, 13 Sep 2021 02:58:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiadcmJsSlx/TYlna5KErdVfyuu32KFFyEuEzloVG4iG5a7df4z8wO+jmlxpi/8Z/JZrP4vw==
X-Received: by 2002:a17:906:848f:: with SMTP id m15mr11902860ejx.11.1631527119440;
        Mon, 13 Sep 2021 02:58:39 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id b3sm3186464ejb.7.2021.09.13.02.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 02:58:39 -0700 (PDT)
Subject: Re: [RFC PATCH v1 23/30] platform/x86: wmi: improve debug messages
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210904175450.156801-24-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6cb60e35-0b23-5b4d-694f-3e9b7991d562@redhat.com>
Date:   Mon, 13 Sep 2021 11:58:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904175450.156801-24-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/4/21 7:56 PM, Barnabás Pőcze wrote:
> Print the event identifier number in addition to
> the already printed information, and use %u for
> printing unsigned values in `wmi_notify_debug()`.
> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>
> ---
>  drivers/platform/x86/wmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index fcc867d79e91..ec5ba2970840 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -485,10 +485,10 @@ static void wmi_notify_debug(u32 value, void *context)
>  	if (!obj)
>  		return;
> 
> -	pr_info("DEBUG Event ");
> +	pr_info("DEBUG: event 0x%02X ", value);
>  	switch (obj->type) {
>  	case ACPI_TYPE_BUFFER:
> -		pr_cont("BUFFER_TYPE - length %d\n", obj->buffer.length);
> +		pr_cont("BUFFER_TYPE - length %u\n", obj->buffer.length);
>  		break;
>  	case ACPI_TYPE_STRING:
>  		pr_cont("STRING_TYPE - %s\n", obj->string.pointer);
> @@ -497,7 +497,7 @@ static void wmi_notify_debug(u32 value, void *context)
>  		pr_cont("INTEGER_TYPE - %llu\n", obj->integer.value);
>  		break;
>  	case ACPI_TYPE_PACKAGE:
> -		pr_cont("PACKAGE_TYPE - %d elements\n", obj->package.count);
> +		pr_cont("PACKAGE_TYPE - %u elements\n", obj->package.count);
>  		break;
>  	default:
>  		pr_cont("object type 0x%X\n", obj->type);

Note I've _added_ the following chunk here to compensate for the dropping of the
patch switching to dev_dbg which also added the printing of the event:

@@ -1316,7 +1316,7 @@ static void acpi_wmi_notify_handler(acpi_handle handle, u32 ev
        }

        if (debug_event)
-               pr_info("DEBUG Event GUID: %pUL\n", &wblock->gblock.guid);
+               pr_info("DEBUG: GUID %pUL event 0x%02X\n", &wblock->gblock.guid, eve

        acpi_bus_generate_netlink_event(
                wblock->acpi_device->pnp.device_class,


Regards,

Hans

