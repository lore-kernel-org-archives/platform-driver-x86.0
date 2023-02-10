Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B09C636CD
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 14:25:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbjBJOZs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 09:25:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232442AbjBJOZq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 09:25:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009D271F1B
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 06:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676039098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=odE0ulKx/K2tP8WDUPs0emv0tzyNVjbbkK3x7rqNiF0=;
        b=Hlp/0HFUAB1ZvNeQ4zhMDwOMBW4i9LnsL1ncGEolLCyvkt6prKAsxWrbzg4CRcKwwpdC6+
        DXy+N9bkHC+h85dzr8Vft2eXUpYXITEaLBX3S/+zY/t9wunVWicFsTnEKPuABh1Kfmfncy
        xGSmwwzdVuDaa3ON3BgFizaaF8gEBSw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-RaoyOPrHPwSJuPXeyoY7gw-1; Fri, 10 Feb 2023 09:24:57 -0500
X-MC-Unique: RaoyOPrHPwSJuPXeyoY7gw-1
Received: by mail-ed1-f70.google.com with SMTP id ev18-20020a056402541200b004a621e993a8so3648122edb.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 06:24:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odE0ulKx/K2tP8WDUPs0emv0tzyNVjbbkK3x7rqNiF0=;
        b=KJ/bWJeBEQ3Ce8h7cX8dZM9ygDQyTbmoOxPvP82lbmXbGzPU1YXLElrXYrmDbYHNPp
         rgrwBVGG170XVGsDn8sXGWrNNFLMzVmGo6fVzAuGqLYG79hXqFgzjqfkzYULeDHeoWL0
         S5ljZJMrLbMm0l0P8alB9+Xw/dWA43rovoeHv5vFNuRsJ+Esqe4pfKB5vVbIefW0W5dg
         NXMydQXFTZsEJ4D67RmlbZkL5xnaKiP4FQsey7m8Ym6cXU5xrLIt1Jq12WvbEhevHl36
         okqgMUJ5gg3OojUwAiVwMvuojnMz8l1+L1kTHaiHQ2xx1bsYy6w/R8OnstSBuIes20ke
         SZHw==
X-Gm-Message-State: AO0yUKXRbeZ5M7uXTwalAafWUy21rWiV6vEthxS2KrszSDMkb81F9slx
        B2G6SPGUEMxW0BOdwA0B1F3E3kFdUd8yMiRaT/o1PnsC3xVDQu0xZ3HTgqrh9yLoTsgPnXaS6TI
        4iTG8qBr06/KC0jg9r7xRrgFkD2lSbRrJYA==
X-Received: by 2002:a17:906:ecb0:b0:84d:4325:7f7a with SMTP id qh16-20020a170906ecb000b0084d43257f7amr15326646ejb.65.1676039095919;
        Fri, 10 Feb 2023 06:24:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+zswQt13cn5YUp6iD0g7CxsUnSmZHstm6R8s9QSMmuUng9vCJInctZAL+ONFhUkP6+Wxq/Tg==
X-Received: by 2002:a17:906:ecb0:b0:84d:4325:7f7a with SMTP id qh16-20020a170906ecb000b0084d43257f7amr15326632ejb.65.1676039095692;
        Fri, 10 Feb 2023 06:24:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c10-20020a170906694a00b00856ad9108e7sm2436134ejs.70.2023.02.10.06.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 06:24:55 -0800 (PST)
Message-ID: <5f413b79-cc1a-0479-6d15-3f89cc2ea514@redhat.com>
Date:   Fri, 10 Feb 2023 15:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/7] Add TPMI support
Content-Language: en-US, nl
To:     srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202010738.2186174-1-srinivas.pandruvada@linux.intel.com>
 <918ac0c5-9f35-0099-5be8-6dbc72aa88e9@redhat.com>
 <6f51fcb89d0f1aad5d4f4e2cacb407a620454886.camel@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6f51fcb89d0f1aad5d4f4e2cacb407a620454886.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/10/23 09:04, srinivas pandruvada wrote:
> Hi Hans,
> 
> On Mon, 2023-02-06 at 13:49 +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 2/2/23 02:07, Srinivas Pandruvada wrote:
>>
>>
> [...]
> 
>> Thank you for your patch-series, I've applied the series to my
>> review-hans branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>>
> Thanks for the help here.

You're welcome.

>> Note it will show up in my review-hans branch once I've pushed my
>> local branch there, which might take a while.
>>
>> Once I've run some tests on this branch the patches there will be
>> added to the platform-drivers-x86/for-next branch and eventually
>> will be included in the pdx86 pull-request to Linus for the next
>> merge-window.
> I guess this will appear in 6.3 merge window.

Yes I plan to push my review-hans branch to for-next shortly.

> Can I post next set of patches (targeted for 6.4)?

Yes please, I'm not sure if I can review them next week,
but that will also give other people a chance to take
a look and comment so getting them out there would be good.

Regards,

Hans




>>> Srinivas Pandruvada (7):
>>>   platform/x86/intel/vsec: Add TPMI ID
>>>   platform/x86/intel/vsec: Enhance and Export intel_vsec_add_aux()
>>>   platform/x86/intel/vsec: Support private data
>>>   platform/x86/intel: Intel TPMI enumeration driver
>>>   platform/x86/intel/tpmi: Process CPU package mapping
>>>   platform/x86/intel/tpmi: ADD tpmi external interface for tpmi
>>> feature
>>>     drivers
>>>   MAINTAINERS: Add entry for TPMI driver
>>>
>>>  MAINTAINERS                         |   6 +
>>>  drivers/platform/x86/intel/Kconfig  |  13 +
>>>  drivers/platform/x86/intel/Makefile |   4 +
>>>  drivers/platform/x86/intel/tpmi.c   | 415
>>> ++++++++++++++++++++++++++++
>>>  drivers/platform/x86/intel/vsec.c   |  21 +-
>>>  drivers/platform/x86/intel/vsec.h   |   6 +
>>>  include/linux/intel_tpmi.h          |  30 ++
>>>  7 files changed, 490 insertions(+), 5 deletions(-)
>>>  create mode 100644 drivers/platform/x86/intel/tpmi.c
>>>  create mode 100644 include/linux/intel_tpmi.h
>>>
>>
> 

