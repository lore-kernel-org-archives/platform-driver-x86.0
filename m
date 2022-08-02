Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EF1C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 10:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236293AbiHBKIo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 06:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236477AbiHBKIn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 06:08:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9447F2FFFF
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659434920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XOJuHNGDG0PdR1B3QQoD3QNZ38KsEuPjq5CjUs2m+9M=;
        b=hidT+OQQUJGFPXeHfzIoGUmuGemOWzPuRDzPp6FWW0o6cF1SZ5n+mPREjVofrSXm2uuS6s
        W4mocXzuBvCxLT0us/lF3YvN8kb7ZqTVEmKC9yKIl9AKNvmg0Uz+Z/20Qea24G12Ywk8LO
        fyv9wU/NcDHgRLy+sSIbu/cziAX711E=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-Y85Rhy7_ONSjL-mkEyWsYg-1; Tue, 02 Aug 2022 06:08:39 -0400
X-MC-Unique: Y85Rhy7_ONSjL-mkEyWsYg-1
Received: by mail-ed1-f69.google.com with SMTP id g15-20020a056402424f00b0043bff7a68dbso8796414edb.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Aug 2022 03:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XOJuHNGDG0PdR1B3QQoD3QNZ38KsEuPjq5CjUs2m+9M=;
        b=wHyNFCbKkUy/cUvlkQvvyjhKsBsDDQlLoDskbGX5YBmdCSAFX+ZdxDuaIu8ggTS0sI
         9ZSabqv5y414caZKsERqOWv0jpMq6VImeIqi7R4ecFNddE1Cm/Jy2QetsjgYNg84Z1sB
         SLrfVWRAp/tZAR14d3cx4hgA6lIULkW2OwwiPmZnDMLq+fZ1/CIEHEOyg5pd1qyAAC9E
         B7XxIO5s/vq8BI8cHRgGC0h3XN5w/ZJhsH97STMVnOOic7NrPh1lCVKC1A30cUeWMqu5
         vjCZQGUh8amlw5lqaoMKuvPM/lPexKr4ZNDMKyuhWLWuEaGgUzAd1nWoOjXc115NDXE7
         X11A==
X-Gm-Message-State: ACgBeo2DQyXByRl1/vvzV76JxcVolCvUhlo89t/TYJq7bPzGen3HIE4e
        ekndUc1vsU/LAJq41Vr1AqWrzmbMzLw66R6Js+V2R4K6R2ZJ24NBenUJcqG6kp7SKVXP2ohrrta
        G8frC6dPTO2iqvjg6v6sZCzINMkB+aOKjSw==
X-Received: by 2002:a17:907:7618:b0:730:a550:3d2b with SMTP id jx24-20020a170907761800b00730a5503d2bmr640643ejc.25.1659434918256;
        Tue, 02 Aug 2022 03:08:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7mEUik+f4LMJkY7Jb7nOUmvYfjxkCdGXhwY+CUk6x7OK0rQ4fX2oF71LTZVRiLJxUz5mq7AA==
X-Received: by 2002:a17:907:7618:b0:730:a550:3d2b with SMTP id jx24-20020a170907761800b00730a5503d2bmr640635ejc.25.1659434918086;
        Tue, 02 Aug 2022 03:08:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id r9-20020a1709061ba900b0071cef8bafc3sm6051830ejg.1.2022.08.02.03.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 03:08:37 -0700 (PDT)
Message-ID: <b2e3b3e1-d2b2-34be-04a4-a366347882f6@redhat.com>
Date:   Tue, 2 Aug 2022 12:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] platform/x86/intel/vsec: Fix wrong type for local status
 variables
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        David E Box <david.e.box@intel.com>,
        Gayatri Kammela <gayatri.kammela@linux.intel.com>
References: <20220801145536.172410-1-hdegoede@redhat.com>
 <CAHp75VeYJENVUZD70ME-QaoT4Kp8fskiEa_w-42b=8ypJNruYQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeYJENVUZD70ME-QaoT4Kp8fskiEa_w-42b=8ypJNruYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/1/22 17:19, Andy Shevchenko wrote:
> On Mon, Aug 1, 2022 at 4:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The local status variables in intel_vsec_pci_error_detected()
>> and intel_vsec_pci_slot_reset() should have pci_ers_result_t as type
>> (and not pci_channel_state_t).
>>
>> Also fix a whitespace error as well as intel_vsec_pci_err_handlers not
>> being marked static.
>>
>> This fixes the following sparse errors:
>>
>> drivers/platform/x86/intel/vsec.c:429:38: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
>> drivers/platform/x86/intel/vsec.c:429:38: sparse:     expected restricted pci_channel_state_t [usertype] status
>> drivers/platform/x86/intel/vsec.c:429:38: sparse:     got restricted pci_ers_result_t
>> drivers/platform/x86/intel/vsec.c:434:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
> 
> Can we just instead show only a single case per type of the sparse
> errors so we reduce the noise in the commit message? Or another
> variants on compressing this text somehow?
> 
>> drivers/platform/x86/intel/vsec.c:434:24: sparse:     expected restricted pci_channel_state_t [usertype] status
>> drivers/platform/x86/intel/vsec.c:434:24: sparse:     got restricted pci_ers_result_t
>> drivers/platform/x86/intel/vsec.c:438:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted pci_ers_result_t @@     got restricted pci_channel_state_t [usertype] status @@
>> drivers/platform/x86/intel/vsec.c:438:16: sparse:     expected restricted pci_ers_result_t
>> drivers/platform/x86/intel/vsec.c:438:16: sparse:     got restricted pci_channel_state_t [usertype] status
>> drivers/platform/x86/intel/vsec.c:444:38: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
>> drivers/platform/x86/intel/vsec.c:444:38: sparse:     expected restricted pci_channel_state_t [usertype] status
>> drivers/platform/x86/intel/vsec.c:444:38: sparse:     got restricted pci_ers_result_t
>> drivers/platform/x86/intel/vsec.c:457:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted pci_channel_state_t [usertype] status @@     got restricted pci_ers_result_t @@
>> drivers/platform/x86/intel/vsec.c:457:16: sparse:     expected restricted pci_channel_state_t [usertype] status
>> drivers/platform/x86/intel/vsec.c:457:16: sparse:     got restricted pci_ers_result_t
>> drivers/platform/x86/intel/vsec.c:472:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted pci_ers_result_t @@     got restricted pci_channel_state_t [usertype] status @@
>> drivers/platform/x86/intel/vsec.c:472:16: sparse:     expected restricted pci_ers_result_t
>> drivers/platform/x86/intel/vsec.c:472:16: sparse:     got restricted pci_channel_state_t [usertype] status
>> drivers/platform/x86/intel/vsec.c:480:33: sparse: sparse: symbol 'intel_vsec_pci_err_handlers' was not declared. Should it be static?
> 
> Code looks good to me.
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you.

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


