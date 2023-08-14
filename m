Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7738AC04E69
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 08:42:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234858AbjHNImY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 04:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234864AbjHNImV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 04:42:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC8910F
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692002491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xM5TcdGqAZTIxIDTi8jCL3j4zWIJ0PMbEonLxDzztkY=;
        b=b5lTlj8/F2yherX6YuI9JaXNC+cf7He8/UniCKuIUodPQwXU8lJJiVxSEdj8ynhKx1+6Jf
        V9dMQZ1QKu3Sv8OA17N0DUUu59IxbufRASK6sNHIPofNFimXgTwiWu15tj6UL5AwUltVXa
        AwMSAAy7U+1p/4BtAxV4FqoW6JtUfyo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-LCyiVBzHMmGpXeRDJq8SdA-1; Mon, 14 Aug 2023 04:41:30 -0400
X-MC-Unique: LCyiVBzHMmGpXeRDJq8SdA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-978a991c3f5so270916366b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 01:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692002489; x=1692607289;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xM5TcdGqAZTIxIDTi8jCL3j4zWIJ0PMbEonLxDzztkY=;
        b=h3Gor+XlTpkGeub70C15MUwtg2nryydAXZbRtzsbHhgBoRHcnwM2sfhytij/MnRc8k
         jRPCWiANFzX6d3DPUAJNXlwTkczv3M3GRgc0C6hcsxKgRWFHG98iSf888ldoPvuVLd/2
         P2YjDDs4VHxmG/1rxK2TpzATkf3XG0wNCgLuiOejEHgbXbsR6Fw9tunEaKKJxM8epcAi
         nUROWDqm+DRGHfiWx8rU4n6RjQUtVcZ9XFiiTlb22a+5jEJzIFIWWhe98oHZlHLZ3gbT
         zyG8JW+8GnueKr+RCZ426Zm9+NUo9ciF20f9pJdqxnpjp8SjDYcdxyfUvcrKwkpQXPcJ
         AfHw==
X-Gm-Message-State: AOJu0YxOg0lD0L47NPcoC616bFhcgME6otin5VVGmT8mZYpox5LhKpXU
        QLMlPlPVh99jf89tOLJL0FZbTQ0U0P5RW13M/YvssjYOl4lFnw4bjv3z4gN4d+BeTJPUk46fBsj
        VCOjEt1iYoVmT0iW0amQJrZl1cjchqT2Kkw==
X-Received: by 2002:a17:907:78d3:b0:99d:6b3c:3d40 with SMTP id kv19-20020a17090778d300b0099d6b3c3d40mr7910579ejc.6.1692002489144;
        Mon, 14 Aug 2023 01:41:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRq/dhKOfnSYvY9aYKaMAIiDw1ImqjsybQ94lcw+hZP3oPogp8hFYWlbE4FXIg8mmI3yY6Kw==
X-Received: by 2002:a17:907:78d3:b0:99d:6b3c:3d40 with SMTP id kv19-20020a17090778d300b0099d6b3c3d40mr7910574ejc.6.1692002488868;
        Mon, 14 Aug 2023 01:41:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cw13-20020a170906c78d00b00992e265495csm5377312ejb.212.2023.08.14.01.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:41:28 -0700 (PDT)
Message-ID: <10276e15-8528-41a9-4b90-7fdf6b890206@redhat.com>
Date:   Mon, 14 Aug 2023 10:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hp-bioscfg: Update steps how order list elements are
 evaluated
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        thomas@t-8ch.de, ilpo.jarvinen@linux.intel.com,
        dan.carpenter@linaro.org
References: <20230809210740.18392-1-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230809210740.18392-1-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 8/9/23 23:07, Jorge Lopez wrote:
> Update steps how order list elements data and elements size are
> evaluated
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  .../x86/hp/hp-bioscfg/order-list-attributes.c    | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
> index b19644ed12e0..d2b61ab950d4 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
> @@ -152,7 +152,7 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
>  
>  		switch (order_obj[elem].type) {
>  		case ACPI_TYPE_STRING:
> -			if (elem != PREREQUISITES && elem != ORD_LIST_ELEMENTS) {
> +			if (elem != PREREQUISITES) {
>  				ret = hp_convert_hexstr_to_str(order_obj[elem].string.pointer,
>  							       order_obj[elem].string.length,
>  							       &str_value, &value_len);
> @@ -266,6 +266,15 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
>  			if (ret)
>  				goto exit_list;
>  
> +			/*
> +			 * It is expected for the element size value
> +			 * to be 1 and not to represent the actual
> +			 * number of elements stored in comma
> +			 * separated format. element size value is
> +			 * recalculated to report the correct number
> +			 * of data elements found.
> +			 */
> +
>  			part_tmp = tmpstr;
>  			part = strsep(&part_tmp, COMMA_SEP);
>  			if (!part)
> @@ -273,11 +282,14 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
>  					tmpstr,
>  					sizeof(ordered_list_data->elements[0]));
>  
> -			for (olist_elem = 1; olist_elem < MAX_ELEMENTS_SIZE && part; olist_elem++) {
> +			for (olist_elem = 0; olist_elem < MAX_ELEMENTS_SIZE && part; olist_elem++) {
>  				strscpy(ordered_list_data->elements[olist_elem],
>  					part,
>  					sizeof(ordered_list_data->elements[olist_elem]));
> +
>  				part = strsep(&part_tmp, COMMA_SEP);
> +				if (part && ordered_list_data->elements_size < MAX_ELEMENTS_SIZE)
> +					ordered_list_data->elements_size++;
>  			}

I believe that you can replace the:

				if (part && ordered_list_data->elements_size < MAX_ELEMENTS_SIZE)
					ordered_list_data->elements_size++;
			}

Lines with simply (after the loop has finished) doing:

			}
			ordered_list_data->elements_size = olist_elem'

Or am I missing something ?

Regards,

Hans



