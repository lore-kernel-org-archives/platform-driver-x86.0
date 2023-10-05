Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A35E9270D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 15:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236335AbjJEP6b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 11:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbjJEP5g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 11:57:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BF057EC3
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Oct 2023 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696514762;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H+dL1KNRLmzSbL5JPUc0aKfIeaA78X3WrQS6IGVzbKs=;
        b=E8dEfBpxl0qhLBZX3LLR0IY7bek8WgGA3fDVfcmdCd6k1emXNuodWfFyTKLpp+yvr2T0Ee
        7Ragxa4J/MuRxZLQDQ1/ga3sbvtDAvgBsttdTvaFKbTsWhpl1qWtjvkm2WvpgyNTQjDWFa
        dcSFmu9QgNJB5SYDkMw3oNHnopDmoig=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-cMcnZu9-MWSCZ34xaYruvg-1; Thu, 05 Oct 2023 03:03:24 -0400
X-MC-Unique: cMcnZu9-MWSCZ34xaYruvg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae686dafedso56469066b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Oct 2023 00:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696489402; x=1697094202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+dL1KNRLmzSbL5JPUc0aKfIeaA78X3WrQS6IGVzbKs=;
        b=Xof8Z7OL04BjuFAcZqii24Z0mCn+OHFm7OMflxfqbQQRna7yI7Q3BgL5vDXyKnmSiB
         9NpijoNBb9AxNboRhF6iT0HYFQIyNtUIjqNkhmySFPgPVs19Tlyk4vTLpneh+w69h7cz
         YqXe7GFAd9Bhm0rfRByLJzLPec0Mvp5VCeotZU3fnYFG8ibBPtNBKonREell45QMiRm6
         WK/6pSh92c10GiHB8JLgaTvDvsVEJeIrNx+shhGHTZxD2ZYQDX2OaYChFoW/huiZzjGW
         8ToZygv4fqT8ytXmPafFRsE8pkG96LaI7UyGHetCCfS8qW39QFo3to5cxxl9+L73JCkv
         erSg==
X-Gm-Message-State: AOJu0YyCMFjw3lvGnZPmLVL9nxZ9nIeyzrPLjsbBVw2chH4DDfFvNdSJ
        uVNl6wwxLI3nJJcett4eUft3dago0M9MTUan5iIMhIbfVMbIydWJPc9tCX1iu2aNYXcVY1Uz6AB
        1KL18StZp3CoW8MPbyATst4MCDhDuXLcbZj01A/TbRw==
X-Received: by 2002:a17:907:760f:b0:9ad:78b7:29ea with SMTP id jx15-20020a170907760f00b009ad78b729eamr4046562ejc.44.1696489402707;
        Thu, 05 Oct 2023 00:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1Rc1hKtAv9AbyjDBdjArCvg7E8aI+Ubhssmr7NRq4YBr1jS0x6lbR/m9GaK/OyCzetgeJbg==
X-Received: by 2002:a17:907:760f:b0:9ad:78b7:29ea with SMTP id jx15-20020a170907760f00b009ad78b729eamr4046544ejc.44.1696489402388;
        Thu, 05 Oct 2023 00:03:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o6-20020a17090611c600b009ad875d12d7sm644357eja.210.2023.10.05.00.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 00:03:21 -0700 (PDT)
Message-ID: <e84bc80e-1fd9-f07b-526a-b4eb4780ea9b@redhat.com>
Date:   Thu, 5 Oct 2023 09:03:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [UPDATE][PATCH] platform/x86/intel-uncore-freq: Conditionally
 create attribute for read frequency
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
        andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231004181915.1887913-1-srinivas.pandruvada@linux.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231004181915.1887913-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Srinivas,

On 10/4/23 20:19, Srinivas Pandruvada wrote:
> When the current uncore frequency can't be read, don't create attribute
> "current_freq_khz" as any read will fail later. Some user space
> applications like turbostat fail to continue with the failure. So, check
> error during attribute creation.
> 
> Fixes: 414eef27283a ("platform/x86/intel/uncore-freq: Display uncore current frequency")
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> Added fixes tag which added current_freq_khz. But after this
> tag there is reorg of code, so need manual backport for some versions.
> I will separately submit to stable trees after merge.

Can you for future updated patches please use the ususal [PATCH v2],
[PATCH v3], etc. prefix ?

Also please document the changes per version after the cutline, e.g. :

```
---
Changes in v2:
- Added fixes tag which added current_freq_khz. Note after this
  tag there is reorg of code, so need manual backport for some versions.
  I will separately submit to stable trees after merge.
```

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

