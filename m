Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040DBC19F2B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 14:40:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232837AbiHAOkw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 10:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232781AbiHAOkp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 10:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A0733AB19
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659364842;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dPYiXDhaESDDlUqMSp8278u1iB29EOZV/3YaR/+rAG0=;
        b=QGbmR0BI8abIAUAdNrDWoBqtHXebcf/B7FRX+u29CkCsLI6XNxgKasgA6NQhtQUSk9UnVC
        E+QhycYuPrxjT+mOd1Gc8h5NPP/ryJAFf0nwldHRvW6BWWIirbswL+OIhZDGPh6mltkZM7
        3PPo1gJfb1Ks9a1P/aFWBOt/8ptxoKo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-ZYzk8foaMleRCg5EciWqMQ-1; Mon, 01 Aug 2022 10:40:41 -0400
X-MC-Unique: ZYzk8foaMleRCg5EciWqMQ-1
Received: by mail-ej1-f70.google.com with SMTP id nb10-20020a1709071c8a00b006e8f89863ceso3072051ejc.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 07:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dPYiXDhaESDDlUqMSp8278u1iB29EOZV/3YaR/+rAG0=;
        b=KB7MxYIgFwsHJ3IiUn5X2wWWxc1dycBvHJoYMeKk8JmucqP0Da+dHK9750q0JP+Qw5
         8dPYmPJOhT6pphreUfAGx9hDXVbgPCDzubAPLBMuM3gW8JtPb6e2uy7Qm/Pbr8HVWSrn
         XQMOvD7eSqMetCZQ+mkvIO+GXvptoHYs7P428IDp2B0tq78CTF9YRtj2x4CBuJjhjr5g
         mdvpkKFTtUMd3MkvxxxqOZV+NwWhPr5SrxDnYj0KarQOHGegz7FOLeQfWP+Oh/Slsvkb
         pL9PMiyi+WKsrAjTjb5qtHZDd+9N9nKRnVEmCs/gtjIrQeiBsKaqBsT3ln59MGnvjN+L
         MvbA==
X-Gm-Message-State: AJIora/AmV5lq0ncOQfp7DvR67uFivODVdsJ8Gi+e3uRAMtcnocVVhyC
        izYdT8OH/cecj5NO+08n5gW3QEQfi4+E5wwL4Eopmz+4+mh/ii4bsejF6KoY0kf8DlaFTlk1R5D
        +cKOYoJiAH0LvCGQ/iM7kUghXaqd0ibfmQg==
X-Received: by 2002:a17:906:c781:b0:726:c967:8d1b with SMTP id cw1-20020a170906c78100b00726c9678d1bmr13057557ejb.54.1659364840721;
        Mon, 01 Aug 2022 07:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uFazZco81Jdd7IQiFo4yx8dEY6I5Zc8J1NnmkMxgFaFH+Cla1eGtIocR5HBAEQZxXka6+QIg==
X-Received: by 2002:a17:906:c781:b0:726:c967:8d1b with SMTP id cw1-20020a170906c78100b00726c9678d1bmr13057547ejb.54.1659364840578;
        Mon, 01 Aug 2022 07:40:40 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ku26-20020a170907789a00b00730979f568fsm401575ejc.150.2022.08.01.07.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 07:40:39 -0700 (PDT)
Message-ID: <a2c40124-4b7c-0f71-1153-2bc03802724a@redhat.com>
Date:   Mon, 1 Aug 2022 16:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/1] platform/x86: p2sb: Move out of
 X86_PLATFORM_DEVICES dependency
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee@kernel.org>
References: <20220718145328.14374-1-andriy.shevchenko@linux.intel.com>
 <2b1b4cd1-faec-85a1-5ad2-e2b29290e0c1@redhat.com>
 <YufTmwg/A94XjrQ8@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YufTmwg/A94XjrQ8@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/1/22 15:22, Lee Jones wrote:
> On Thu, 28 Jul 2022, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 7/18/22 16:53, Andy Shevchenko wrote:
>>> The P2SB library is used for various drivers, including server
>>> platforms. That's why the dependency on X86_PLATFORM_DEVICES
>>> seems superfluous.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>> v2: added X86 to the dependencies of P2SB (Hans), added Rb tag (Hans)
>>
>> Lee I presume that since you've merged the original series
>> (in your ib-mfd-edac-i2c-leds-pinctrl-platform-watchdog-5.20
>> branch) that you will take this fix on top ?
> 
> The point of supplying an immutable branch is that whoever maintains
> this subsystem can pull from it and apply this patch on-top.

I've added the fix to pdx86/for-next now.

Regards,

Hans


> 
>> This fix is necessary to fix a bunch of randconfig build
>> failures in the current linux-next.
>>
>>>  drivers/platform/x86/Kconfig            | 12 ++++++++++++
>>>  drivers/platform/x86/Makefile           |  4 ++++
>>>  drivers/platform/x86/intel/Kconfig      | 12 ------------
>>>  drivers/platform/x86/intel/Makefile     |  2 --
>>>  drivers/platform/x86/{intel => }/p2sb.c |  0
>>>  5 files changed, 16 insertions(+), 14 deletions(-)
>>>  rename drivers/platform/x86/{intel => }/p2sb.c (100%)
> 

