Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58D5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 16:43:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiBXQnu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 11:43:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230072AbiBXQnt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 11:43:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B42A140758
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 08:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645720998;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IjkZhGzKSvbLhlEUtM24hRkXnGsRdzxiWu7wlvpAAFc=;
        b=MfKW/98oO3ijLnYg/3dU3hXx021zmloJujgssXfNY0DeGpg5MWwgqkJEt/gkk+itlG5iL4
        /n2md6D3Yax5s9OvvHpZnhd0uJk3h0pCFkLt7ClKfXBNJAJpwgOvCWkcYmWbv6r/ka0HVx
        p6CHim67fZz2u8RuWljNqxPrNxEnoW0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-bLBZ0UkWPaeHJn3LHSVFLQ-1; Thu, 24 Feb 2022 11:43:17 -0500
X-MC-Unique: bLBZ0UkWPaeHJn3LHSVFLQ-1
Received: by mail-ed1-f72.google.com with SMTP id r11-20020a508d8b000000b00410a4fa4768so964048edh.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 08:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IjkZhGzKSvbLhlEUtM24hRkXnGsRdzxiWu7wlvpAAFc=;
        b=5PmuaHUfkgWOKRNpqxRcxPBTfojcJUhp8MBINIvJFZmItOybgNCUYjGHTAoDeTmK88
         LGfP6eB/X3ZI2uABhUuSvW5XxHFJrOj0bljGp35EXQ0SUUwaELlRQvF2Uy4WVn3ANIJd
         QD55oiE+ulumEjR8Rd7IaTSnd6PdgNrvF75z/Et5+XnJGhqkXFlPfaN7HT81FqeFymYn
         TICMFSHEY3a2RL/NiMv6pPEaNALzWiPdJJzNiHYFaCKlY5jXkh7DzcBu2zxp2IHOBXoH
         qMGdR4zzzIGILTM29PDQlgfLCXsiofhBOnBn+i55IjD4+ZYFAj96M8LPwR598l7+6Q/V
         Uk7Q==
X-Gm-Message-State: AOAM5307FnCvGBWXs9jUNJjIWg10vMvBWGqMQhnAnBVh2ssvVEDBUdIz
        M5qoTbPbCjXSTZzEk93uTy6zoXpjIi9EJVCZeqsPXPSvbzgNVOW+6l6v0qtWF46GiM2JsDGNpr0
        P7Oz9d4x5PocmLpyZaLyubMbgjC+Yuj9p6Q==
X-Received: by 2002:a17:906:646:b0:6ce:a6fb:2854 with SMTP id t6-20020a170906064600b006cea6fb2854mr2855755ejb.675.1645720995997;
        Thu, 24 Feb 2022 08:43:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdKBIqpxp81Whr2YWyGGKRxrr/oCgPvaWV3pnV7BAfebmTEUVfyQQUGHR8jgmPEk00PYll2Q==
X-Received: by 2002:a17:906:646:b0:6ce:a6fb:2854 with SMTP id t6-20020a170906064600b006cea6fb2854mr2855749ejb.675.1645720995815;
        Thu, 24 Feb 2022 08:43:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id y22sm1597246ejm.225.2022.02.24.08.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 08:43:15 -0800 (PST)
Message-ID: <298ee896-9bc4-9030-c2dd-21b6d541acb7@redhat.com>
Date:   Thu, 24 Feb 2022 17:43:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/5] pinctrl/baytrail platform/x86: SUS6 mux / Lenovo Yoga
 Tablet 2 support
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <YhZK0VPc2tg6upYg@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YhZK0VPc2tg6upYg@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/23/22 15:55, Andy Shevchenko wrote:
> On Wed, Feb 23, 2022 at 02:31:48PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> This series consists of 2 parts:
>>
>> Patch 1   : pinctrl: baytrail: Add pinconf group + function for the pmu_clk
>> Patch 2-5 : platform/x86: x86-android-tablets: Add Lenovo Yoga Tab2 support
>>
>> Patch 5 has a runtime dependency on patch 1, but this is only  runtime and
>> there are some other patches in flight to other subsystems which are also
>> needed for the Lenovo Yoga Tab2 support.
>>
>> As such I believe that patch 1 can be merged independently through the
>> pinctrl-intel tree and then I'll merge patches 2-5 through the pdx86 tree.
>>
>> The only reason for sending this out as a series is because patch 5
>> uses the new pmu_clk pinconf added by patch 1.
> 
> You may route via PDx86 and provide an IB to me, thanks!

Ok, I've just created an immutable-branch + signed tag for this,
with your 2 small nitpicks fixed.

I'll send you a pull-req for this right away.

Regards,

Hans


> 
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (5):
>>   pinctrl: baytrail: Add pinconf group + function for the pmu_clk
>>   platform/x86: x86-android-tablets: Fix EBUSY error when requesting
>>     IOAPIC IRQs
>>   platform/x86: x86-android-tablets: Add Lenovo Yoga Tablet 2 830 / 1050
>>     data
>>   platform/x86: x86-android-tablets: Workaround Lenovo Yoga Tablet 2
>>     830/1050 poweroff hang
>>   platform/x86: x86-android-tablets: Lenovo Yoga Tablet 2 830/1050 sound
>>     support
>>
>>  drivers/pinctrl/intel/pinctrl-baytrail.c   |   9 +
>>  drivers/platform/x86/x86-android-tablets.c | 280 +++++++++++++++++++++
>>  2 files changed, 289 insertions(+)
>>
>> -- 
>> 2.35.1
>>
> 

