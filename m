Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219A0C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 09:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjCPJBm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 05:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjCPJBh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 05:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10548A7A8D
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 02:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678957245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dCS1hkCTb8ImiyK1dyALJTqnxuMD4oKfMlGnyc2ZEbU=;
        b=WOwxD0GLCLAE41lTisb1bWiHZEIc+BFI/rpui0mTl9Dv8gVsoUo8KfXmy5/aF9SkaSZylW
        KLpIGqWs0Thadc2SE9m0IuD3x4eMlf46Y7MzcPXSTjuRHSyKa6nXQTQV+logHugkgqi2W4
        c/bCoWbbGRFjouVJ/KPmour8sqz6k0U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-GEKTZ788MAmxo4ItHfDgRA-1; Thu, 16 Mar 2023 05:00:43 -0400
X-MC-Unique: GEKTZ788MAmxo4ItHfDgRA-1
Received: by mail-ed1-f69.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso2011673edu.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 02:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678957242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCS1hkCTb8ImiyK1dyALJTqnxuMD4oKfMlGnyc2ZEbU=;
        b=noFKlbcd1fIJksY7vEw/7xKDEKIcqCZe/xE0YONdnt9VDTHcEycrYFlI1A8oHefsPP
         Mj6qU1hrI9alemcOEQZfsdQTwopVg9oTqJTLWuGfUcHIKjTe/dLpYK9CprDmkT4EXo3T
         oUtKvfkF7FWrYBDTR5LOeoVFzMeWeOG8C8ARzCgd2hNPg2nNhq2cNn3C0V+VKi6OtpQj
         pmc3YCWQimRNI0LuwWyxPmewZX5DAsmuvUi8Mp1K11mXKq0Ifx2Q0R+NwOfHgExoO/Fs
         7Io9/11N+SrOmiVa5z4T2NIMxQmYF79nPcFAA4MaEFNkWFdn1vC1MS4v3HaC05eAH/gN
         f1WA==
X-Gm-Message-State: AO0yUKXjdOEhZLWpKZsDOqK8rdlODmc1FjmjYfq/OH55ssUVzQwrnqGy
        taMsWE3pXgqyhLHJ5mT52p2Y5xSaFtHgEY1G4tza/7QjSW5P2KLY8D6sz9QXHzQGeKBEMa0oR23
        WxLgXJ9IcWW/OISQ8oLDdbIs1/WyhzQnhLHyb0qLmnw==
X-Received: by 2002:a17:907:2ceb:b0:8b1:75a5:4a92 with SMTP id hz11-20020a1709072ceb00b008b175a54a92mr9099620ejc.72.1678957241975;
        Thu, 16 Mar 2023 02:00:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set+tA4wGPFfwPdYR20OG5cuAIKw5uMtSMyGjhS9ZEaDOprq40N0jW2n7nD8CjkIypcl17O9Gow==
X-Received: by 2002:a17:907:2ceb:b0:8b1:75a5:4a92 with SMTP id hz11-20020a1709072ceb00b008b175a54a92mr9099601ejc.72.1678957241681;
        Thu, 16 Mar 2023 02:00:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u14-20020a50a40e000000b004bbb691a334sm3576882edb.2.2023.03.16.02.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 02:00:41 -0700 (PDT)
Message-ID: <d00fbe99-6c82-ddfc-4e12-3dcb01eda0a6@redhat.com>
Date:   Thu, 16 Mar 2023 10:00:40 +0100
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
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Sorry for being a bit late with replying.

Andrew, thank you for your work on this, at a quick glance it looks great.

Armin, thank you for your help / input on this.

On 3/15/23 23:33, Armin Wolf wrote:
> Am 15.03.23 um 04:37 schrieb Andrew Kallmeyer:
> 
>> On Fri, Mar 10, 2023 at 2:28 AM Armin Wolf <W_Armin@gmx.de> wrote:
>>> Hi,
>>>
>>> according to the embedded MOF data, the method id for retrieving the mode data
>>> is 0x1, not 0xAB.
>> Thanks! I can see from your earlier email in the other thread that
>> this is right. Strangely, when I tested 0xAB had almost exactly the
>> same behavior as 0x01. I think you're right though, I have updated my
>> local copy to 0x01.
> 
> Hi,
> 
> the reason for this is that most hardware vendors will omit any input checks
> if they think they are unnecessary. The WMI interface on my Dell notebook
> does the same, sadly.

Ack.


>> I have also fixed the missing cleanup calls and
>>
>>> Using wmi_evaluate_method() is deprecated as WMI GUIDs are not guaranteed to be
>>> unique for a given machine. I think both WMI GUIDs should be handled by separate
>>> drivers, and the driver for the event GUID uses a notifier call chain to inform
>>> the driver for the data GUID that the usage mode changed, which then handles the
>>> input device stuff.
>>>
>>> This way the driver does not rely on deprecated WMI APIs, and everything would
>>> still work should Lenovo decide to duplicate some WMI GUIDs.

Jumping into the discussion a bit late here, but I disagree with this, using wmi_evaluate_method() here is fine. The chances of there ever being 2 instances of the LENOVO_YMC_QUERY_GUID are very small and we can deal with that if it ever happens.

So I really so no need to make the code needlessly complicated with 2 sub-drivers which then notify each other. Let keep things KISS and keep this as is, so for the next version only change
the method_id from 0xab to 0x01.

>> After reading many times, I believe I understand this and can figure
>> out the implementation. How should I attribute the commits? Should
>> this be a 3rd patch in a v2 patch series with myself as the author? Or
>> should these drivers be introduced in one commit without the
>> intermediate single driver that uses the deprecated API?
> 
> I thing the new driver(s) should be introduced in one commit. I am not sure about the
> new author of the commit. If the original driver was significantly altered, then AFAIK
> you should be the new author. Still, the original author should at least be mentioned
> with a "Co-developed by" tag. You can then omit your "Co-developed by" tag.

Ack to introducing the new driver in 1 commit. Since compared to this version only the method_id is going to make change t make it makes sense to keep Gergo as author and Andrew as Co-developed-by .

> As a site note, i recommend to use the get_maintainer.pl scripts under scripts/ to find
> any additional maintainers which should be CC-ed. Since your patch series touches the
> ideapad-laptop driver, its maintainer (Ike Panhc <ike.pan@canonical.com>) should also be
> notified about this patch series.
>
>> Also have I correctly set Gergo as the commit author for this PATCH
>> 2/2 email like Hans said to? I wasn't sure if I had it right and I
>> could fix it in the v2 series.
>>
> You are still the author of the second patch. Also you should not send a patch series as
> a reply to any previous emails.
> 
>>> acpi_dev_put() is missing.
>> Thanks! Not sure why I thought it was okay to delete lenovo_ymc_remove
>> but I have added that back in with the input_unregister_device call.
>>
>>> Maybe it would be beneficial to allow userspace to get the current usage mode without having
>>> to wait for an WMI event. This way, userspace could still react to situations like the device
>>> already being in tablet mode when this driver is loaded.
>> I'm not following how to implement this, not familiar enough with WMI.
>> Could you explain more?
> 
> I meant that your driver should, after (!) setting up the input device and event handling, call
> sparse_keymap_report_event() with the code obtained from
> wmidev_evaluate_method() so that userspace knows about the initial state
> of the input device. You might also CC linux-input@vger.kernel.org for
> the next patch series, so that the input driver maintainers can also
> review your patch series.

Ack, reporting the initial state would be a good addition. To keep the authorship clear I think this can be added as a follow-up 3/3 patch in the next version.

I realize this contradicts a bit with my previous lets introduce the driver in 1 commit thing, but in this case I think this makes the most sense.

>>> If the drivers handling the event and data GUIDs are fine with being instantiated multiple
>>> times, then adding the WMI GUIDs to the allow_duplicates[] list in drivers/platform/x86/wmi.c
>>> will allow the WMI driver core to handle duplicated event and data GUIDs.
>> Is there an easy way to test if it's fine to run multiple copies?
>> Currently testing by compiling the module with an inlined
>> ideapad-laptop.h out of the kernel tree and using the insmod command
>> to load it.
> 
> Drivers can be instantiated multiple times, and each time their probe callback is invoked,
> and many older WMI drivers cannot do this, so the allowlist exists.
> The section "State Container" in Documentation/driver-api/driver-model/design-patterns.rst
> explains how to write drivers which can be instantiated multiple times.
> 
> If your driver is not a singleton, i.e. it can safely be instantiated multiple times, then
> you can add its WMI GUID to the allowlist.

I'm not sure about adding this to the allowlist, using the new API is good (and nice and clean) but this is still expected to be a singleton.

Regards,

Hans

