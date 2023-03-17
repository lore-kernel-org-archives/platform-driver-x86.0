Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D8FC6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Mar 2023 09:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCQJpI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Mar 2023 05:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjCQJpG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Mar 2023 05:45:06 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510BE23316
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Mar 2023 02:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1679046268; i=w_armin@gmx.de;
        bh=yxSFHvriz27QOYN7m2q9c9gBrBoiIPaYY0YXL2lfiN8=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=NovAEMUMhlNFmhTIFe6+wQLUyhLs3fKTCA9UVd+8MLTtMyOrBldS3/JFmiy6NcnOm
         HnfD5ORC9Dq9lI/9tujn8nuVE+6HS67lhIJnejjGKO4WlscoZtqV+zw9eZuDtgtTbF
         BegDYOAAjsUcL/x9wTftv+fCE6uNCVn5dDN2Md1X/Fu9UyabKH+bd2pGo0bq0HWpkG
         Z4JcxF+QFUdj6FUvCxABg6X0uQj2UO4qWBBvmMkQ8UX+se48R+ljWo/EksGcX/uGF6
         tAxchhu28t+EmJj6TQT/hf1O5mH1nvPRJBk0sdaQVHqoOmQF/bXddMQlD9zlDELhyj
         7RxPZr1hsECxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.42.62] ([46.114.207.63]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N33ET-1qeFpR0gkX-013Lkb; Fri, 17
 Mar 2023 10:44:28 +0100
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Hans de Goede <hdegoede@redhat.com>,
        Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, soyer@irl.hu
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
 <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
 <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de>
 <ac9eb4b8-e4b8-c648-c322-c143631102ba@gmx.de>
 <2ab9674c-b7e6-a794-f302-2724f038da97@redhat.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <edf7e0da-eb22-b72b-ecb2-8a0579fac2b9@gmx.de>
Date:   Fri, 17 Mar 2023 10:43:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2ab9674c-b7e6-a794-f302-2724f038da97@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:Wd3Dw5gVY5q6DCcgB5x62yMINqS6uJd9Ykd+SYgIv13NZ/wVfn1
 oLjvxSse+LgVhEcJjkLhxUnAJrG+8rMdtonkHJpVy7xFuZ1yIJ/JLcZiSHr6jNI+R/BYDdX
 pzYNLY4ND6XA0Z9h1TOCUNPAxomzT7+qXyakx93DqI61jU1odEdQCQdF1VCrZYBZ/jc7em2
 YPnDXWhz3/qjZQCD4hcRg==
UI-OutboundReport: notjunk:1;M01:P0:J3JVaIy2w2k=;zGMq4m7nWuRZctrl9lLJtC+f8bX
 eFalaenpcIzOcaraDlw+lIlCH5okxoRXA8QYgccbowMe3N95pSy9XwMDQ9ljQFxkJldeBJBhc
 78/p3h5Qv+LSosGLMKau/sI+Lf5DA6KFI4ck7YPmgpQ1CWQ2T7uMyU8jvMj+RJUyA8BfOsays
 67B9Wx0vMRmYtIzjCbif2S1ni0CZV5uG5pdCtHfdGe46ak1yDTF+Bnk38pg7DI1gmlJe9Fqlb
 oPu3ZKeYElzQzOFBIBKUiiEsDO160oHvg+boD8GCtefEyKFkflFZW/Z2AYEQO3y4pc7XVRu40
 5DiOIuoCNRtRr9O7Oj3xQVA/RBBc6YG9D4m9B0nPK0JmMLKTNGteCa/vyEbjX75BNzFvdek/K
 BDtNUzoI74q3EbA9rv3JHnbth20p+qeIM1HzIf4J+KqO6Rp7kUe+aaTvKCHAweuLi97nS3KI/
 UBFYRdzKk1wCAfBu1nYlJ17bsIj2PZxBjRiO2nQM1bPrUXBIBu8JkwaJ1t+5Ty/kuxpNK+IFx
 bWY+p3kMZw1d1tgD8GSuVWPSJJ78cWIwGyEwjGYwJJGAyq7vdGYzOHk4uC9SqGbqVdAz7oYi3
 DN6Y9/4J8nDbkhEP1Y8Ixn+hgz3MK7h9tl7kYN25pyuWpstajpvdLEyMA4UpqWmEAkA0NDerq
 H6DaduQtvmaYAH9kSH/z1wT/ONiT+EUVyE834SyoGWqYLl/hqO3kVTOuJSWBec2KBSwUGjpzk
 W0qD3abwlcxLdvONsyV+OFyWzPtvTb22xY0j0NUJG1P0KdYOhzUJ9MMjxTNebTS4byJ9CVrNI
 aiuavRpayzvyC52rfdMdIfmNcl+EcIvBuUBQlnea0IRF344gNVYamrs9qM1sib3S/j2tyh7ga
 P/ORR5uUWUAM//0chkrkBB5MIfnzTfwXKuZxIm0RISk983CMU14V2n+uqgGl/tQTLDtsDGZZ5
 JIAPEbRQOcWKttvmK2HrvkxaYCI=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 16.03.23 um 10:02 schrieb Hans de Goede:

> Hi
>
> On 3/15/23 23:39, Armin Wolf wrote:
>
> <snip>
>
>>> As a site note, i recommend to use the get_maintainer.pl scripts under
>>> scripts/ to find
>>> any additional maintainers which should be CC-ed. Since your patch
>>> series touches the
>>> ideapad-laptop driver, its maintainer (Ike Panhc
>>> <ike.pan@canonical.com>) should also be
>>> notified about this patch series.
>>>
>> I forgot to mention that your patches have to title, please add one for the next revision.
> Armin, I'm not sure what you mean with this ?
>
> For me the patches have a good $subject / first line of the commit message ?
>
> Regards,
>
> Hans
>
>
My fault, i messed up. Sorry for the unnecessary noise.

Armin Wolf

>
>
>> Armin Wolf
>>
>>>> Also have I correctly set Gergo as the commit author for this PATCH
>>>> 2/2 email like Hans said to? I wasn't sure if I had it right and I
>>>> could fix it in the v2 series.
>>>>
>>> You are still the author of the second patch. Also you should not send
>>> a patch series as
>>> a reply to any previous emails.
>>>
>>>>> acpi_dev_put() is missing.
>>>> Thanks! Not sure why I thought it was okay to delete lenovo_ymc_remove
>>>> but I have added that back in with the input_unregister_device call.
>>>>
>>>>> Maybe it would be beneficial to allow userspace to get the current
>>>>> usage mode without having
>>>>> to wait for an WMI event. This way, userspace could still react to
>>>>> situations like the device
>>>>> already being in tablet mode when this driver is loaded.
>>>> I'm not following how to implement this, not familiar enough with WMI.
>>>> Could you explain more?
>>> I meant that your driver should, after (!) setting up the input device
>>> and event handling, call
>>> sparse_keymap_report_event() with the code obtained from
>>> wmidev_evaluate_method() so that userspace knows about the initial state
>>> of the input device. You might also CC linux-input@vger.kernel.org for
>>> the next patch series, so that the input driver maintainers can also
>>> review your patch series.
>>>
>>>>> If the drivers handling the event and data GUIDs are fine with being
>>>>> instantiated multiple
>>>>> times, then adding the WMI GUIDs to the allow_duplicates[] list in
>>>>> drivers/platform/x86/wmi.c
>>>>> will allow the WMI driver core to handle duplicated event and data
>>>>> GUIDs.
>>>> Is there an easy way to test if it's fine to run multiple copies?
>>>> Currently testing by compiling the module with an inlined
>>>> ideapad-laptop.h out of the kernel tree and using the insmod command
>>>> to load it.
>>> Drivers can be instantiated multiple times, and each time their probe
>>> callback is invoked,
>>> and many older WMI drivers cannot do this, so the allowlist exists.
>>> The section "State Container" in
>>> Documentation/driver-api/driver-model/design-patterns.rst
>>> explains how to write drivers which can be instantiated multiple times.
>>>
>>> If your driver is not a singleton, i.e. it can safely be instantiated
>>> multiple times, then
>>> you can add its WMI GUID to the allowlist.
>>>
