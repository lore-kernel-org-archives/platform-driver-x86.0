Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9B2C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:23:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B2DB60FDA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353621AbhESNZB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:25:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24246 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353607AbhESNZB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621430621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+HpP/FnN1JCXOy2xoSPlJKjZc1AhpDvbFoQ/D41RklY=;
        b=gXppbVJ7QZbie7j2dRTt+2vZ0hR3qkoe/xozC+0MK8LxzgYsIpocR6L4Y6ut1/wC7erjQw
        ckW+SLtEDJ1lNcuNYXwlq8E9BBUvMMG+GdtTOvtPweZR8IGNCytqA2YZMfp7JmiimHeUP0
        u+A5tAZ9Q4lmHe0SIcdRQzEQBA6w5Uw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-t6fpDVpgPciO0nhmr-ffHA-1; Wed, 19 May 2021 09:23:39 -0400
X-MC-Unique: t6fpDVpgPciO0nhmr-ffHA-1
Received: by mail-ej1-f70.google.com with SMTP id e1-20020a170906c001b02903d958aadd4fso2180191ejz.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+HpP/FnN1JCXOy2xoSPlJKjZc1AhpDvbFoQ/D41RklY=;
        b=QrxaFxGcUdqB2OEVQ+vaCSlrcs6OmWPwJNW4d9Bn1Obr7HjSb9ysQnCX9SQs8HAr1G
         08Pf/02IKXr8V0lSsWDYdcNazVpVO+XsYxnhZmk/a7tRl9I4puNI76K7rq8PFf1n+xHp
         LO92nMZQAIWPjMVddiBCtp0VE37rndoAvUBH+y2cm09HtIBZm5cls/Txq8aPyv1D1ZAY
         1A6rVHgo65vJCjQSM8HnoYf3ozieoeneKaIJO3jdFFK4g0LZTtSmqwc5XAU3OgC2j1U2
         oh657q+CV93zQ4Py6DiIYaLipPcRXjxRJfnMZmYgDcMosM6dhamw3qmw/Aeez/6SRF8x
         +XYA==
X-Gm-Message-State: AOAM532A/S+IZduwTpeTyqvzk4vIHJ5TaEBtusJvGv+zFa1iAJUgGFY2
        2b+XIji5xONIkibEdCrTZFauplFcgJJFxDUiO+SB3jzXai0zI7Xp5uDiAVEXMz+lc05BrghAU0l
        apbjYhclt/0tjwv7KLAf5CEaigOoXq07BQKCrFvG8x1O1ivyLpHNBAomFRKgziqInG0uJCg/YZA
        T2/dUqbIqulQ==
X-Received: by 2002:a17:907:9720:: with SMTP id jg32mr12866809ejc.548.1621430618630;
        Wed, 19 May 2021 06:23:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxevm+9IixjI5HIFDNUDfxZ5FnJNLdLRPqrK5KvQLUSbbRoKS4HjjcJ7612e6FckCMKPH1YXA==
X-Received: by 2002:a17:907:9720:: with SMTP id jg32mr12866777ejc.548.1621430618395;
        Wed, 19 May 2021 06:23:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u21sm2075018ejg.50.2021.05.19.06.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:23:38 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: hp-wireless: add AMD's hardware id to the
 supported list
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20210514180047.1697543-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f40055fa-7638-bff1-16df-64b6d59be447@redhat.com>
Date:   Wed, 19 May 2021 15:23:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210514180047.1697543-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/14/21 8:00 PM, Shyam Sundar S K wrote:
> Newer AMD based laptops uses AMDI0051 as the hardware id to support the
> airplane mode button. Adding this to the supported list.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also include this in the next pdx86-fixes pull-req for 5.13.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/hp-wireless.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
> index 12c31fd5d5ae..0753ef18e721 100644
> --- a/drivers/platform/x86/hp-wireless.c
> +++ b/drivers/platform/x86/hp-wireless.c
> @@ -17,12 +17,14 @@ MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Alex Hung");
>  MODULE_ALIAS("acpi*:HPQ6001:*");
>  MODULE_ALIAS("acpi*:WSTADEF:*");
> +MODULE_ALIAS("acpi*:AMDI0051:*");
>  
>  static struct input_dev *hpwl_input_dev;
>  
>  static const struct acpi_device_id hpwl_ids[] = {
>  	{"HPQ6001", 0},
>  	{"WSTADEF", 0},
> +	{"AMDI0051", 0},
>  	{"", 0},
>  };
>  
> 

