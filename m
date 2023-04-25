Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5933EC77B61
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Apr 2023 09:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233187AbjDYJEr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Apr 2023 05:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233607AbjDYJEn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 05:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D76114
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 02:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682413438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nE9/4s80aUuHx/y2dgVPrrdlR9myjyz5F9f1B6uNu08=;
        b=QYwab/JOCAjLndmVA91w76TX/cOq1pTkFVoVSm0LOxqJnuxGOwcakg7ftMIekEgEZNHHXY
        nF2lzHZNpGyot40jQhTXueXbvj7j+xKENEp/gXnomsPKonYQpYAqjUIxFwhgSZCImPwAFw
        tkOrbcK3o9T+y2poR+dQPE8I14X/uSA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-SMJM8VXmNGux2MoYgRN4vA-1; Tue, 25 Apr 2023 05:03:56 -0400
X-MC-Unique: SMJM8VXmNGux2MoYgRN4vA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-506b0a2d5c4so5955053a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 02:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682413436; x=1685005436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nE9/4s80aUuHx/y2dgVPrrdlR9myjyz5F9f1B6uNu08=;
        b=Hps91f7HVVOESmlNJikKGhSQJi0gFjKqvxKXq1tqaucCoRx4+8MBZ5h9rfJzGHf1+c
         RY7SpagJ5mW6xrUCRpjnr3leDVYY9cdYs5ZyKmoz4x9n1Jzyh/wvbl85Ox15gUdO36ox
         n0OIFS2GVCPfKVZJ/o2Y9gXHqDynTS5hk9k1o0mHXS+nXjbYju1K2B/13O22J0VbMs37
         4kYc93MX0aPGAaoOS4Pkrl2GfzG/vZtUX0qmKOxGfQfId0+wTsH1W35kFVJqbddI4r7n
         eTv+vc7YFa4Kx+U5vKkSMUSi9uO45xBvHe4NIFdAQgYHnm7ZLW5F11G1sn/9c8O4PjBW
         joCw==
X-Gm-Message-State: AAQBX9dOyaKQNXoq9f7WmifROOb8qGSZe21MTW7Qy8gC1Th9NRkt7y4E
        lmLPmh/ll9HU/rq78FNYcm0WqZE0l71/jjn6jPXvVmLkFdKyD+vVhSare5QPb3HGNf1JCAFYGfG
        sVC1gZYeOAPOlIFrVD9hQmWhsd7qcAhj1uw==
X-Received: by 2002:a17:906:3805:b0:94f:7486:85a9 with SMTP id v5-20020a170906380500b0094f748685a9mr10036317ejc.39.1682413435777;
        Tue, 25 Apr 2023 02:03:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350af5iL2uCyVkloqWZ8VLkmW7AQh02QCUR23DRCdEIqGoNZboy9GV5vwqxA69Npb9U0TrhCvkQ==
X-Received: by 2002:a17:906:3805:b0:94f:7486:85a9 with SMTP id v5-20020a170906380500b0094f748685a9mr10036295ejc.39.1682413435422;
        Tue, 25 Apr 2023 02:03:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i25-20020a170906851900b0094f1b8901e1sm6508084ejx.68.2023.04.25.02.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 02:03:54 -0700 (PDT)
Message-ID: <51f19f59-b1ad-b813-afb9-cf0b58fef322@redhat.com>
Date:   Tue, 25 Apr 2023 11:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] intel_scu_pcidrv: add back PCI id for Medfield
Content-Language: en-US, nl
To:     Julian Winkler <julian.winkler1@web.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20230416154932.6579-1-julian.winkler1@web.de>
 <6a2a97d9-140c-3e4f-aa12-c98f928f7481@redhat.com>
 <CAHp75VfFptZcJn7c_a2GLnSqJDXBwvUqWmu9Wb19a3VvwXJS5A@mail.gmail.com>
 <a52ab618-97ea-04ea-01e4-ecb673f45f09@web.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a52ab618-97ea-04ea-01e4-ecb673f45f09@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/17/23 15:02, Julian Winkler wrote:
> On 17.04.23 12:16, Andy Shevchenko wrote:
>> On Mon, Apr 17, 2023 at 1:11 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>> +Cc Andy, Mika,
>>
>> Thanks for Cc'ing me.
>>
>>> On 4/16/23 17:49, Julian Winkler wrote:
>>>> This id was removed in b47018a778c1a18cbc98b4a11936dec4f8c4bb7b, saying it
>>>> is only used on Moorestown, but apparently the same id is also used on
>>>> Medfield.
>>>>
>>>> Tested on the Medfield based Motorola RAZR i smartphone.
>>
>> Wow! This is surprising.
>> Can you tell more about your test environment? What is the Linux
>> kernel version in use and what is the userspace (AOSP, Buildroot,
>> Yocto, custom)? If custom, more details would be nice to hear.
> 
> The test enviroment is postmarketOS. You can find more details on the
> Wiki page
> https://wiki.postmarketos.org/wiki/Motorola_RAZR_i_(XT890)_(motorola-smi)
> 
>>>> Signed-off-by: Julian Winkler <julian.winkler1@web.de>
>>>
>>> Hmm, so this is a former SFI platform, from your:
>>> https://lore.kernel.org/all/20230223060107.23029-1-julian.winkler1@web.de/
>>>
>>> patch I guess the plan is to use some custom bootloader
>>> and then use x86 with devicetree support to replace SFI ?
>>
>> That would also be nice to hear in detail. With other Intel MID
>> platforms the decision was made to pursue ACPI (and U-Boot, as an
>> example) supports that for Intel Merrifield platform.
> 
> I boot a 5.10 kernel, which still has SFI support, and from there I can
> boot latest mainline kernel with petitboot, kexec and devicetree.

Nice, so AFAICT the old 5.10 kernel is hidden/abstracted away in pettit
boot and the user just sees a bootloader-binary + mainline kernels.

Interesting approach :)


>>> Do you already have this working ?
>>>
>>> Sorry for all the questions for what is just a simple PCI-id
>>> addition. I guess I'm worried this is just the tip of
>>> the iceberg for getting medfield support back into
>>> the kernel and I'm a bit worried about how much maintenance
>>> work this will cause.
>>>
>>> E.g. also see commit e1da811218d2dc ("drm/gma500: Remove Medfield support")
>>> which I guess you will want to see reverted too ?
>>>
>>> That is an example of a lot more code to bring back
>>> then just a single PCI-id addition.
>>>
>>> Don't get me wrong I'm all for supporting older hw
>>> if there are users who are interested in actively
>>> maintaining support for it. I just want to get a feel
>>> of the amount of work this is going to involve.
>>>
>>> Andy, Mika, any remarks ?
>>
>> I'm not against a patch if it helps existing users, but we need to
>> understand first if it will be really helpful for upstream (taking
>> into account 32-bit Intel MID support removal).
> 
> My downstream kernel tree can be seen here:
> https://gitlab.com/julianwi/linux-intel-medfield.

Ok, the amount of patches there does not look to bad. Although there
are some patches which will need some work before they can be mainlined
(e.g. the IRQ handling patches).

So what is the long term end goal here. Do you want to get everything
supported in mainline (sounds feasible to me), or are you just trying
to reduce your delta to mainline so rebasing is easier ?

I guess that for either goal you will want this patch merged and
it is just a single line, so I'll go and merge this patch now.

If you want to get as much in mainline as possible, I think it would
be good to try and get the gma500 changes merged. That seems to be
the biggest change when talking about lines of code. So if you get
that in place then for discussions surrounding further patches you
can say that your branch for this is just a couple of 100-s of lines
code away from mainline and you would like to get those last 100-s
of lines in mainline :)

Regards,

Hans



