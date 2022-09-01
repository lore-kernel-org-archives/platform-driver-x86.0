Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6C1C64991
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 15:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbiIAPrx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 11:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233493AbiIAPrp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 11:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E828D3E6
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662047263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Md/EFxH02CSlIIsOFEuaDgKD4tP3/B9dpxGxZa1Xwmc=;
        b=az3eM7IxTfgBxavufyNtXv89fTry4cHBbegq+2rvp+atxK3R1irliKTW1AdoKA8RwOcLlD
        8M55RZnrFYMxpkb/v/nw/3enIWr3ucacM+xoz+yeo/zwm602zyqJLAdg9+xSKCYd3+hV3r
        KjIwTqd9NjbMZ/bYRo2RTbyuxqVyHWA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-189-Zrypx5uyPZSHTeKWOzC-IA-1; Thu, 01 Sep 2022 11:47:42 -0400
X-MC-Unique: Zrypx5uyPZSHTeKWOzC-IA-1
Received: by mail-ej1-f70.google.com with SMTP id ds17-20020a170907725100b007419bfb5fd4so5701635ejc.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 08:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Md/EFxH02CSlIIsOFEuaDgKD4tP3/B9dpxGxZa1Xwmc=;
        b=I7Z771YVKek3f8hIk+qr8DfsdqqcyswwOzY2Gtk5YEx5x91awhR/aoPJCVs29iRtiI
         uE8IoMu4i3dH3ULTSwxAnaq6U0E6jJZx4idHtJLb+MAczz6zQE0NzICCDQUeyVVK9h3J
         GFE36LgHLSyzfjrP5LKQD+KVS0YW2Bqbp5Lzp5LQLMShau2PWmkAlids4h/3kkZ/4cdB
         bIItKe2NDCjMRXNbqNeOP00VJELfOmZXBonTBUa4ilM4ufaAj0pn9/6uM9/X+qaceyGR
         Ku2EnLxmHt+DsCrlBCU347CrckzhrVPfehO0kVrI/0nDvYuK3zEtIrrkiE1VYbkVqUOf
         FhzA==
X-Gm-Message-State: ACgBeo2Wlp2l8UjCi/Je24V/RzBXN7mtTQJqBKDU1qOURcBLstfBKNj8
        3Ly8zxWm6ysn5QiAqkgNQWCevDdyfP/ALFC5OQlaSdYZjBp7j2c2oCpN1hwpdU6711msM93tdAR
        xa3hliMKYS3ODaQIG+MrHJqgdqjqH7jF1Ag==
X-Received: by 2002:a17:907:a064:b0:73d:d6bd:65fb with SMTP id ia4-20020a170907a06400b0073dd6bd65fbmr22793280ejc.716.1662047261442;
        Thu, 01 Sep 2022 08:47:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5FIWKF+q/A0Pw7/mHbETdAmKqwoRWze9oaTN5QmEkZnLM2Gq9bjNtc+5Pn/TEDlcU8HTy2wg==
X-Received: by 2002:a17:907:a064:b0:73d:d6bd:65fb with SMTP id ia4-20020a170907a06400b0073dd6bd65fbmr22793272ejc.716.1662047261204;
        Thu, 01 Sep 2022 08:47:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ck7-20020a0564021c0700b00445c0ab272fsm1496608edb.29.2022.09.01.08.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:47:40 -0700 (PDT)
Message-ID: <e14b3264-7e60-9cfe-34f8-f79815878d50@redhat.com>
Date:   Thu, 1 Sep 2022 17:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1] platform/x86/intel: pmc/core: Add Raptor Lake support
 to pmc core driver
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Gayatri Kammela <gayatri.kammela@linux.intel.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, irenic.rajneesh@gmail.com,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
References: <20220830182001.3693030-1-gayatri.kammela@linux.intel.com>
 <b8a5038b-3d3a-4a2c-8fca-32b47f11e85c@redhat.com>
In-Reply-To: <b8a5038b-3d3a-4a2c-8fca-32b47f11e85c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/1/22 17:43, Hans de Goede wrote:
> Hi,
> 
> On 8/30/22 20:20, Gayatri Kammela wrote:
>> Add Raptor Lake client parts (both RPL and RPL_S) support to pmc core
>> driver. Raptor Lake client parts reuse all the Alder Lake PCH IPs.
>>
>> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: David Box <david.e.box@intel.com>
>> Signed-off-by: Gayatri Kammela <gayatri.kammela@linux.intel.com>
> 
> Thank you for your patch, I've applied this patch to my review-hans 
> branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

In file included from drivers/platform/x86/intel/pmc/core.c:29:
./arch/x86/include/asm/cpu_device_id.h:161:46: error: ‘INTEL_FAM6_RAPTORLAKE_S’ undeclared here (not in a function); did you mean ‘INTEL_FAM6_RAPTORLAKE_P’?
  161 |         X86_MATCH_VENDOR_FAM_MODEL(INTEL, 6, INTEL_FAM6_##model, data)
      |                                              ^~~~~~~~~~~
./arch/x86/include/asm/cpu_device_id.h:46:27: note: in definition of macro ‘X86_MATCH_VENDOR_FAM_MODEL_STEPPINGS_FEATURE’
   46 |         .model          = _model,                                       \
      |                           ^~~~~~
./arch/x86/include/asm/cpu_device_id.h:129:9: note: in expansion of macro ‘X86_MATCH_VENDOR_FAM_MODEL_FEATURE’
  129 |         X86_MATCH_VENDOR_FAM_MODEL_FEATURE(vendor, family, model,       \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./arch/x86/include/asm/cpu_device_id.h:161:9: note: in expansion of macro ‘X86_MATCH_VENDOR_FAM_MODEL’
  161 |         X86_MATCH_VENDOR_FAM_MODEL(INTEL, 6, INTEL_FAM6_##model, data)
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/platform/x86/intel/pmc/core.c:1918:9: note: in expansion of macro ‘X86_MATCH_INTEL_FAM6_MODEL’
 1918 |         X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S,        &adl_reg_map),
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:249: drivers/platform/x86/intel/pmc/core.o] Error 1

And dropped again, please upstream this through the tree which also has the new
INTEL_FAM6_RAPTORLAKE* macros.

Here is my Acked-by for merging this through another tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



>> ---
>>  drivers/platform/x86/intel/pmc/core.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
>> index a1fe1e0dcf4a..17ec5825d13d 100644
>> --- a/drivers/platform/x86/intel/pmc/core.c
>> +++ b/drivers/platform/x86/intel/pmc/core.c
>> @@ -1914,6 +1914,8 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
>>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_N,		&tgl_reg_map),
>>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE,		&adl_reg_map),
>>  	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P,        &tgl_reg_map),
>> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE,		&adl_reg_map),
>> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S,	&adl_reg_map),
>>  	{}
>>  };
>>  
>>
>> base-commit: b90cb1053190353cc30f0fef0ef1f378ccc063c5

