Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED5AC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:11:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7D5F6144D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 09:11:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhF1JN3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 05:13:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55743 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232284AbhF1JN2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 05:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624871463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QSxhGXuFgaYCNORG2oStQmV2YGot2W2Jd3yRE953jX0=;
        b=KlRcN8kG6tkBK3tbDXtEc7YBc/sB+zEGb4ZWXwM5Vg6Oss81jLSbSLrrDCUCf1AO2/yxcb
        pNwHzk9rIuCC9M8uKqs8RoRTU/qGsPwVvN2pRk83PXd7G0P9g5rKQXxYHpd1AE/YmnJH8m
        guMNBWQQvUr7V8cp/Xtiff0Bwh8vo64=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-xGYclPMvMXWzFNBwwHcj5A-1; Mon, 28 Jun 2021 05:11:01 -0400
X-MC-Unique: xGYclPMvMXWzFNBwwHcj5A-1
Received: by mail-ej1-f69.google.com with SMTP id c13-20020a17090603cdb029049617c6be8eso4082371eja.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 02:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QSxhGXuFgaYCNORG2oStQmV2YGot2W2Jd3yRE953jX0=;
        b=eTZQ5cqQ2xmr/6iOeMgnw2feyiqrwW5Vgt0B5uZAFPEmVX617OrT+RA4LxkuRhdlBw
         YR+nWgy7z/g4LPRdyobFh+wCc7grTF4HNnsxKW2CI1TNApLFdCKNrde7Ze9kf9wug5d7
         W2rIgF65uKZ1VdqyPqUOVCW1e1Ezv0heNPCnyGuTJh/lUDzYjN9uC2heiNe6PWSrqwkb
         kjruBhArT3ufYacQnb9HK4MyNgYO3elMFGaOb3CVL0uJhpsKAJ3BEExBfWV+tGNL5t13
         cagj7jlFmX/uA2ZD0dwsonS6AVxjs50+bSG94YXIEMgeob/2pF+XFN8CPR9zy6rM5Uyl
         yDZw==
X-Gm-Message-State: AOAM531SGO6E4FfPzKiGq5DmmexiuoKsFi/IbGNVqZG1uognO/SSYjYl
        6OvHtr4jqX3Dka1qfNpKhvDvo1f6RkeVLp9d5DSVkvorlaoQmfOETVZZl+Qi0SiC3IvNwcasycw
        6uereEUOetEkZgqYEievevjGvq5yFwlvEFA==
X-Received: by 2002:a05:6402:4393:: with SMTP id o19mr31242091edc.263.1624871460289;
        Mon, 28 Jun 2021 02:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGR/FU7pazREhgZ04ZbgY8SEPAalO+nTG+TzkpoW3CvUMZHZ6oahaVTtEjMIrWmXhsRQBTtg==
X-Received: by 2002:a05:6402:4393:: with SMTP id o19mr31242077edc.263.1624871460138;
        Mon, 28 Jun 2021 02:11:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bx28sm6610654ejc.39.2021.06.28.02.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 02:10:59 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_skl_int3472: Uninitialized variable
 in skl_int3472_handle_gpio_resources()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Scally <djrscally@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YNXTkLNtiTDlFlZa@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0739ff92-3f9a-45d1-3953-d9daeb9cfa7e@redhat.com>
Date:   Mon, 28 Jun 2021 11:10:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YNXTkLNtiTDlFlZa@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/25/21 3:01 PM, Dan Carpenter wrote:
> This function returns negative error codes, zero (to indicate that
> everything has been completed successfully) and one (to indicate that
> more resources need to be handled still).
> 
> This code prints an uninitialized error message when the function
> returns one which potentially leads to an Oops.
> 
> Fixes: 5de691bffe57 ("platform/x86: Add intel_skl_int3472 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
>  .../platform/x86/intel/int3472/intel_skl_int3472_discrete.c   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> index 17c6fe830765..9fe0a2527e1c 100644
> --- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> +++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> @@ -286,10 +286,10 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	int3472->ngpios++;
>  	ACPI_FREE(obj);
>  
> -	if (ret)
> +	if (ret < 0)
>  		return dev_err_probe(int3472->dev, ret, err_msg);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
> 

