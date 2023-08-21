Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181C4EE4993
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 16:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236923AbjHUQ6c (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 12:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236909AbjHUQ6V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 12:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E001A109
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 09:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692637049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CXGwgpHlf7D764T66ilzjBpaazpa9epIZyJVOx09W+I=;
        b=c6QqZXm7igDORpjDZJ9lIVuagqi29vpSWBwbj5+IV/alMEY+gW7gc8daH8ugFmgPEVdw+h
        Skm2QWIi25f2AHt/kSBNvInfAUhKA4vq1juK0jzSzSuw3ZH3ou7gb9oUZzU37ZjO0uFwUD
        hykx7Pow/MpTNmfbc05e6Gs+Kcn1hzU=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-uFwmmSZEN-6USKWgn52boQ-1; Mon, 21 Aug 2023 12:57:28 -0400
X-MC-Unique: uFwmmSZEN-6USKWgn52boQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2b9e014111fso35486911fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 09:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692637041; x=1693241841;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXGwgpHlf7D764T66ilzjBpaazpa9epIZyJVOx09W+I=;
        b=Uu+uiPQ0w38K5UOK/TZudpwWYTWxTgza+azKg7AvElPkwBUCCaHg6sjOTsZ9lW2urR
         uQX3QJlvo0uFXBkjFzeCRSBPrE90A+KYzom8CSVQX7ynzvlfi5PzmfZwErvuYhoJT5MN
         B9IIwMHYzf1iNpj+Xhy8P6rN02FCy1nJSeazw8XeI1W2mBmCBAx57DxFkWxS7Zl0WW/Y
         cD0dKXhXRnGSq5iAoHimwzaTLERhb20nuWnbBn5GqNwHRqCvBViL8b+1xYtWg2Q6y9As
         gMAQLNFwM1KxFNyJoBjjo3y1k3vVIQrpoT5SqHyK+HbqxBA+S8aZX8CftimQ/ZCLgBgp
         6/0A==
X-Gm-Message-State: AOJu0Yz1goBR2PQmBTGrhe18hRaI4slScCW6j63nWut77xm7ld08dSBk
        scUGvNuakzsLbX4F7SU+2A8V2a6280jYsmKm7fD28B60WSR9xEzKrrcwL7LNfDCScGL5DWmrqhF
        i5gwhoyDcau2BqHYwSLSj7VKz87YCIsHNmQ==
X-Received: by 2002:a2e:8ec6:0:b0:2b6:e78e:1e58 with SMTP id e6-20020a2e8ec6000000b002b6e78e1e58mr5737987ljl.5.1692637041430;
        Mon, 21 Aug 2023 09:57:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXXokZi+oG0+t0TFrhKlNiKjd9bBY8JtXoMrFYUu8TiarXbXIKYyckEfoETRvAcowQEwbL1Q==
X-Received: by 2002:a2e:8ec6:0:b0:2b6:e78e:1e58 with SMTP id e6-20020a2e8ec6000000b002b6e78e1e58mr5737978ljl.5.1692637041132;
        Mon, 21 Aug 2023 09:57:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id xa13-20020a170907b9cd00b0099bd5d28dc4sm6839118ejc.195.2023.08.21.09.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 09:57:20 -0700 (PDT)
Message-ID: <fb7d2d63-972a-b056-c7ae-a9995f1bf66b@redhat.com>
Date:   Mon, 21 Aug 2023 18:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] Update steps order list elements are evaluated
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        thomas@t-8ch.de, ilpo.jarvinen@linux.intel.com,
        dan.carpenter@linaro.org
References: <20230821144205.13529-1-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230821144205.13529-1-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/21/23 16:42, Jorge Lopez wrote:
> Update steps how order list elements data and elements size are
> evaluated
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next

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
>  .../platform/x86/hp/hp-bioscfg/order-list-attributes.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
> index cffc1c9ba3e7..1ff09dfb7d7e 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
> @@ -258,7 +258,6 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
>  				eloc++;
>  			break;
>  		case ORD_LIST_ELEMENTS:
> -			size = ordered_list_data->elements_size;
>  
>  			/*
>  			 * Ordered list data is stored in hex and comma separated format
> @@ -270,17 +269,14 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
>  
>  			part_tmp = tmpstr;
>  			part = strsep(&part_tmp, COMMA_SEP);
> -			if (!part)
> -				strscpy(ordered_list_data->elements[0],
> -					tmpstr,
> -					sizeof(ordered_list_data->elements[0]));
>  
> -			for (olist_elem = 1; olist_elem < MAX_ELEMENTS_SIZE && part; olist_elem++) {
> +			for (olist_elem = 0; olist_elem < MAX_ELEMENTS_SIZE && part; olist_elem++) {
>  				strscpy(ordered_list_data->elements[olist_elem],
>  					part,
>  					sizeof(ordered_list_data->elements[olist_elem]));
> -				part = strsep(&part_tmp, SEMICOLON_SEP);
> +				part = strsep(&part_tmp, COMMA_SEP);
>  			}
> +			ordered_list_data->elements_size = olist_elem;
>  
>  			kfree(str_value);
>  			str_value = NULL;

