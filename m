Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F49FCD6E51
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Oct 2023 09:22:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbjJKJWQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Oct 2023 05:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234001AbjJKJWI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Oct 2023 05:22:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE3E9D
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 02:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697016078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9BZXi3cafQaZM1r+FnoQIQdzrRAZwPqZTTE72dK+CCg=;
        b=GAKILLAyFnlmY5nXV5wTe0kL9/ZKHQAe1EG6xedBrEFCo4bOdETW9EvAZSo/MP5TD8Sv8w
        pdnSywzNg2mX1Lz7KZHfJxuXwd/wCa1hyc+QgMIUl5z3ChLsNrRW9noRM25cBki8oyavDZ
        9LWKpfGt3jpigoxiNEwGMZNUx1qdckw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-xWH58dn1O_SSeLFZQNIUng-1; Wed, 11 Oct 2023 05:21:02 -0400
X-MC-Unique: xWH58dn1O_SSeLFZQNIUng-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9b65b6bcfb7so531745866b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Oct 2023 02:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697016061; x=1697620861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9BZXi3cafQaZM1r+FnoQIQdzrRAZwPqZTTE72dK+CCg=;
        b=wjKvL7P8iJG/vtIj8pL1tNKOenOKxkJE6k+ZRontGRY8wl1ucUkGs0HUN1maFBD3OH
         Qv1AoKy2qJBgfixA5lAsAFSS0WTisDatfjwQPMEgogm2t4l0rg4wi2rtC0olwFsnNl90
         4UHTs+qCQFIb0GhUFHia62p6nxtKQrmgSAIs2mOyJE6/SQtDEuScXt8w1SWL1P3dsZXw
         Nx5v/cGTo2lRcFlBflpMKg9sb1JgjbYv6hthxH7Y7KLpIXIIhFUgXAwbGc4577sO4qRn
         p+ZWvPLHV5hVY6BCAS9odYTp3xLtE3wOM0HvssH5oy++CykOmDh3sYf+YlXR7YNz1BDe
         QrPg==
X-Gm-Message-State: AOJu0Ywpk2t51iYuqGnC5lL+Kn5u9R3u5qfXgHGWbc4nmw+zSbd+eiFu
        u9XwpD1C/MAzOqHeHBura0ra92H5JAcctO6qshZ0Dbd41WZWzvuVYPbHEGKnGNGEbeEfsMkcDz+
        oQ+M4fRI99d9qdc/bQCjgrrDoFECP3FgIGkgPRlJQpg==
X-Received: by 2002:a17:906:9c2:b0:9b2:82d2:a2db with SMTP id r2-20020a17090609c200b009b282d2a2dbmr17041503eje.28.1697016060823;
        Wed, 11 Oct 2023 02:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIjE+vexgTdNocqUzGGts3lwcP8EtemggX4M6VYGYIKEYQL3MCjAYljc3FXQT/OnohfklGDw==
X-Received: by 2002:a17:906:9c2:b0:9b2:82d2:a2db with SMTP id r2-20020a17090609c200b009b282d2a2dbmr17041493eje.28.1697016060504;
        Wed, 11 Oct 2023 02:21:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n12-20020a170906378c00b0099d45ed589csm9521785ejc.125.2023.10.11.02.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 02:20:59 -0700 (PDT)
Message-ID: <b878b61f-05e4-42fa-00fa-44f5f1707030@redhat.com>
Date:   Wed, 11 Oct 2023 11:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [UPDATE][PATCH] platform/x86/intel-uncore-freq: Conditionally
 create attribute for read frequency
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
        andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231004181915.1887913-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231004181915.1887913-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/4/23 20:19, Srinivas Pandruvada wrote:
> When the current uncore frequency can't be read, don't create attribute
> "current_freq_khz" as any read will fail later. Some user space
> applications like turbostat fail to continue with the failure. So, check
> error during attribute creation.
> 
> Fixes: 414eef27283a ("platform/x86/intel/uncore-freq: Display uncore current frequency")
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
> Added fixes tag which added current_freq_khz. But after this
> tag there is reorg of code, so need manual backport for some versions.
> I will separately submit to stable trees after merge.

Thank you for your patch/series, I've applied this patch
(series) to the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in the pdx86 fixes branch once I've pushed
my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> 
>  .../x86/intel/uncore-frequency/uncore-frequency-common.c  | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> index 1152deaa0078..33ab207493e3 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> @@ -176,7 +176,7 @@ show_uncore_data(initial_max_freq_khz);
>  
>  static int create_attr_group(struct uncore_data *data, char *name)
>  {
> -	int ret, index = 0;
> +	int ret, freq, index = 0;
>  
>  	init_attribute_rw(max_freq_khz);
>  	init_attribute_rw(min_freq_khz);
> @@ -197,7 +197,11 @@ static int create_attr_group(struct uncore_data *data, char *name)
>  	data->uncore_attrs[index++] = &data->min_freq_khz_dev_attr.attr;
>  	data->uncore_attrs[index++] = &data->initial_min_freq_khz_dev_attr.attr;
>  	data->uncore_attrs[index++] = &data->initial_max_freq_khz_dev_attr.attr;
> -	data->uncore_attrs[index++] = &data->current_freq_khz_dev_attr.attr;
> +
> +	ret = uncore_read_freq(data, &freq);
> +	if (!ret)
> +		data->uncore_attrs[index++] = &data->current_freq_khz_dev_attr.attr;
> +
>  	data->uncore_attrs[index] = NULL;
>  
>  	data->uncore_attr_group.name = name;

