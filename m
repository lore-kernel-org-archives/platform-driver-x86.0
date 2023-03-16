Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BE1C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 09:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjCPJC5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 05:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjCPJCz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 05:02:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE9AA9DC7
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 02:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678957334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ixFXstzXdxkWrltKcq9IFVcaBVmD6GYRLHVIA/LrDT0=;
        b=GmcuQgJeSpel90dx5/8lSVoHiiHvP2KpbqpPTh2iczE2KxAyTyXK9oeKqGJjyuPm7I59Sl
        KBerInCgoTRWHyCfyReZ35+3jv3+On3m1dRTk6ayP7Sf+6K9VyJwhhb9G7GxN+M8cpxug9
        nayoW/Lyyeh2fg4gyjymAJSaQJCVhns=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-o8Hv-Ct9MfGz8w_wXWNUbg-1; Thu, 16 Mar 2023 05:02:12 -0400
X-MC-Unique: o8Hv-Ct9MfGz8w_wXWNUbg-1
Received: by mail-ed1-f69.google.com with SMTP id b7-20020a056402350700b004d2a3d5cd3fso2049499edd.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 02:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678957331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixFXstzXdxkWrltKcq9IFVcaBVmD6GYRLHVIA/LrDT0=;
        b=fJxx8MubkWXl/T0vpMxeKjZAht5KyQ7CQeJxPT/LG9mRA/p8svm0XfoUYH7tsqMwp5
         Nad5U8FH0hBuKbW9/ZEE/pz4+d4cwwACkBMIxLy7kOhEFPIve1aujHO+XKA2KtuCkXRh
         t+yNM5Fds1/AnIPXD7zZwYShELAFBD3fV9iiKB4rogfkZam0TKQm+kWlzgz5DCRHA1UX
         fPNPhWCTuTeP40eNzKPH3IroYVFX67DWEqJ8yLLkKE9IGD7W8mppf8kuLwldwRr/vmbL
         BHE6LRMPqMjBkE8Vnbd3WRrzBeB8MMno/gIi6g/gh6Lc8tAVn3Z2Rq9hOr8ZIj4f1INX
         9sCw==
X-Gm-Message-State: AO0yUKUpseletIse8zJ+wZszkonXKueDXft81r11cmxKr72vjS+11/sb
        aQFC3G60VkyyFbAhenUGNHFLTn/h+hNapGePpIsfVi6hMxSgp3N3XLnvKRGWPGMZwhsg8nqBXyi
        pkp9cLppdRsv9gPBLz1m6Mij06djvZ+1BQA==
X-Received: by 2002:aa7:da52:0:b0:4fe:961d:cab0 with SMTP id w18-20020aa7da52000000b004fe961dcab0mr6013395eds.5.1678957331429;
        Thu, 16 Mar 2023 02:02:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set8ZvRurl0Gzn5iUTBpgSNNf35pRWYsbJ5XVkRCDdUUOjLg/ojV8vKNIE5tWvtzyM4h108OoXw==
X-Received: by 2002:aa7:da52:0:b0:4fe:961d:cab0 with SMTP id w18-20020aa7da52000000b004fe961dcab0mr6013375eds.5.1678957331190;
        Thu, 16 Mar 2023 02:02:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y97-20020a50bb6a000000b004c19f1891fasm3531697ede.59.2023.03.16.02.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 02:02:10 -0700 (PDT)
Message-ID: <2ab9674c-b7e6-a794-f302-2724f038da97@redhat.com>
Date:   Thu, 16 Mar 2023 10:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>,
        Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, soyer@irl.hu
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
 <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
 <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de>
 <ac9eb4b8-e4b8-c648-c322-c143631102ba@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ac9eb4b8-e4b8-c648-c322-c143631102ba@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi

On 3/15/23 23:39, Armin Wolf wrote:

<snip>

>> As a site note, i recommend to use the get_maintainer.pl scripts under
>> scripts/ to find
>> any additional maintainers which should be CC-ed. Since your patch
>> series touches the
>> ideapad-laptop driver, its maintainer (Ike Panhc
>> <ike.pan@canonical.com>) should also be
>> notified about this patch series.
>>
> I forgot to mention that your patches have to title, please add one for the next revision.

Armin, I'm not sure what you mean with this ?

For me the patches have a good $subject / first line of the commit message ?

Regards,

Hans





> 
> Armin Wolf
> 
>>> Also have I correctly set Gergo as the commit author for this PATCH
>>> 2/2 email like Hans said to? I wasn't sure if I had it right and I
>>> could fix it in the v2 series.
>>>
>> You are still the author of the second patch. Also you should not send
>> a patch series as
>> a reply to any previous emails.
>>
>>>> acpi_dev_put() is missing.
>>> Thanks! Not sure why I thought it was okay to delete lenovo_ymc_remove
>>> but I have added that back in with the input_unregister_device call.
>>>
>>>> Maybe it would be beneficial to allow userspace to get the current
>>>> usage mode without having
>>>> to wait for an WMI event. This way, userspace could still react to
>>>> situations like the device
>>>> already being in tablet mode when this driver is loaded.
>>> I'm not following how to implement this, not familiar enough with WMI.
>>> Could you explain more?
>>
>> I meant that your driver should, after (!) setting up the input device
>> and event handling, call
>> sparse_keymap_report_event() with the code obtained from
>> wmidev_evaluate_method() so that userspace knows about the initial state
>> of the input device. You might also CC linux-input@vger.kernel.org for
>> the next patch series, so that the input driver maintainers can also
>> review your patch series.
>>
>>>> If the drivers handling the event and data GUIDs are fine with being
>>>> instantiated multiple
>>>> times, then adding the WMI GUIDs to the allow_duplicates[] list in
>>>> drivers/platform/x86/wmi.c
>>>> will allow the WMI driver core to handle duplicated event and data
>>>> GUIDs.
>>> Is there an easy way to test if it's fine to run multiple copies?
>>> Currently testing by compiling the module with an inlined
>>> ideapad-laptop.h out of the kernel tree and using the insmod command
>>> to load it.
>>
>> Drivers can be instantiated multiple times, and each time their probe
>> callback is invoked,
>> and many older WMI drivers cannot do this, so the allowlist exists.
>> The section "State Container" in
>> Documentation/driver-api/driver-model/design-patterns.rst
>> explains how to write drivers which can be instantiated multiple times.
>>
>> If your driver is not a singleton, i.e. it can safely be instantiated
>> multiple times, then
>> you can add its WMI GUID to the allowlist.
>>
> 

