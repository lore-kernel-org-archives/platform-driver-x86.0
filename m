Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41648C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 14:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbjCTOmV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 10:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbjCTOmU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 10:42:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB36BB3
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679323293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ecyNzkMzbRIFgKgFvtlNZuQ4Kzx4vUikQh1AEkqlhaY=;
        b=JIOBmdgiWJ1T52qa6uUrVEtq0+h8G79nLSAyMy3lkK8/w5/klS1wvT+tIda0l6WqENzr1M
        YY9XH4h7/TPUtLWZEa8vpns4zvY7nmpjrFcSAVXxxMoDsBd2PO2CNIykAW8bSVFbECVBAO
        mzhN7RWZtPMWABf6Agbu4r3SlaiODk8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-6lFRD1RLMV6VN7KGeX8STQ-1; Mon, 20 Mar 2023 10:41:32 -0400
X-MC-Unique: 6lFRD1RLMV6VN7KGeX8STQ-1
Received: by mail-ed1-f72.google.com with SMTP id t26-20020a50d71a000000b005003c5087caso16335543edi.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 07:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679323291;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ecyNzkMzbRIFgKgFvtlNZuQ4Kzx4vUikQh1AEkqlhaY=;
        b=od07XbOLpAonbifMpXTy2CDE4IO3eSkGo6BU0Y6S1zg4q7/EBK1QjBkBVb4atMfaUR
         zVTqhBJIhTw66uDc6S5eM0eBd/ivo5pNKaI33VmesX90uXFaqIMgoUzjsSYT837+7UGG
         l9B50iVd+S7M3MPNS+hKip41PO7NfB9/UlwOn7tHsvzp/iL5bISFfhUkq1uZZYRiXVtB
         Uwbxt3467M09d4DI9A25vnh17zJpWDjk9Kxbkm9LgI87ebG16a4QTnxGHv+oxDIdQnQw
         Z0uU+im5dTw+mkLiUhkC720cgnQ8yiIePpn1YQ0aOCQPsBa8a1JS0KNEVBYzOyyklBSU
         HpAQ==
X-Gm-Message-State: AO0yUKU5VgzEfzgtqKcjwXGjVRCAaEIRDgXkSZnfrcxFsU1N9NgWVkpi
        Ej8U0oZAnKYLW+dheaTVm3QdBJOwvr8WOe62TB0q00qPRPfWGI+ALvLOHiC3mO5glOttZXQbFAM
        RgFKYtfVzS7UvdzANouaT1KpJ+WIY+pcfiQ==
X-Received: by 2002:a17:906:2dd3:b0:931:52d4:1b7c with SMTP id h19-20020a1709062dd300b0093152d41b7cmr9609991eji.62.1679323290696;
        Mon, 20 Mar 2023 07:41:30 -0700 (PDT)
X-Google-Smtp-Source: AK7set90Vtb/6sAY/5p5ew3GWsot9YbdGeexnxuJ0If0j0OffQyZ/bhCCyGwNdHwZtxY/uD4JYb9Ig==
X-Received: by 2002:a17:906:2dd3:b0:931:52d4:1b7c with SMTP id h19-20020a1709062dd300b0093152d41b7cmr9609976eji.62.1679323290453;
        Mon, 20 Mar 2023 07:41:30 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id w1-20020a05640234c100b004f1e91c9f87sm4924851edc.3.2023.03.20.07.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 07:41:29 -0700 (PDT)
Message-ID: <9e54517c-d8e8-841b-e04f-8673cc0891d3@redhat.com>
Date:   Mon, 20 Mar 2023 15:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
Content-Language: en-US
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        Armin Wolf <W_Armin@gmx.de>
Cc:     platform-driver-x86@vger.kernel.org, soyer@irl.hu
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
 <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
 <6592fd8f-f5fa-6144-e8eb-a9e701246ad7@gmx.de>
 <d00fbe99-6c82-ddfc-4e12-3dcb01eda0a6@redhat.com>
 <9b51d06c-d7b4-3886-4476-1c37f9400c62@gmx.de>
 <CAG4kvq-P=t08+=sjTNcLLgFrvhiyrdjpNyxEhMcV5rDOt3EtZw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAG4kvq-P=t08+=sjTNcLLgFrvhiyrdjpNyxEhMcV5rDOt3EtZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andrew,

On 3/18/23 18:50, Andrew Kallmeyer wrote:
> On Fri, Mar 17, 2023 at 5:39 AM Armin Wolf <W_Armin@gmx.de> wrote:
>>
>> Am 16.03.23 um 10:00 schrieb Hans de Goede:
>>>
>>> So I really so no need to make the code needlessly complicated with 2 sub-drivers which then notify each other. Let keep things KISS and keep this as is, so for the next version only change
>>> the method_id from 0xab to 0x01.
>>
>> I think that using wmi_evaluate_method() is deprecated and we should try to minimize its usage whenever possible. As for the handling of the WMI GUIDs, i believe that
>> just using the first matching WMI device is not a stable solution. We simply do not know if Lenovo considers both WMI GUIDs singletons or not. This means they could
>> for example decide to have multiple independent data sources for tablet mode events. The chances for this are indeed small, but it will still create a problem for users
>> using such machines. By having two drivers and maybe a global notifier call chain, we would enable the driver to handle such "unlikely situations" correctly.
>>
>> This would also allow the driver to work on machines missing the WMI event GUID. In such a case, userspace could then just poll the data WMI GUID for input, but
>> this is just an idea.
> 
> Hi Armin, would it work to add the second GUID to the existing
> wmi_driver wmi_device_id array? Then I could save the wmi_device in
> the driver data on probe. Later when I get the notification on the
> other GUID I would just call wmidev_evaluate_method on the saved
> pointer out of the private data.
> 
> I would just need a way to distinguish the two wmi_device structs.
> Seems like the notifier setup wouldn't be needed and it could stay as
> one module for one feature.
> 
> I have the code ready to mail a v2 patch series with the remove
> function added and the fixed method id and the input triggering on
> probe, but still using wmi_evaluate_method. Without having much kernel
> experience, I sort of agree with Hans that it would be best to be
> simpler and not have two modules for one feature, the notifier setup
> looks somewhat involved.

Yes the notifier setup is somewhat involved. I believe posting
the v2 which you have ready to post as is is fine.

> However if we can do something like the above
> idea, that doesn't seem to make it much more complicated to avoid the
> deprecated API and I can mail that out instead.
> 
> So let me know what you think.
> 
>>>> Drivers can be instantiated multiple times, and each time their probe callback is invoked,
>>>> and many older WMI drivers cannot do this, so the allowlist exists.
>>>> The section "State Container" in Documentation/driver-api/driver-model/design-patterns.rst
>>>> explains how to write drivers which can be instantiated multiple times.
>>>>
>>>> If your driver is not a singleton, i.e. it can safely be instantiated multiple times, then
>>>> you can add its WMI GUID to the allowlist.
>>> I'm not sure about adding this to the allowlist, using the new API is good (and nice and clean) but this is still expected to be a singleton.
>>
>> The allowlist is dealing with drivers not jet converted to the WMI bus model. The allowlist should ideally disappear once the conversion has been
>> completed, something which would become difficult if WMI drivers would continue to rely on the older GUID singleton behavior which is not compliant
>> with the ACPI WMI spec AFAIK. If we know that our WMI GUID is a singleton (which we do not), then we should handle this inside our driver, not inside
>> the WMI probing code.
> 
> Would it not work to convert this driver to the WMI bus model now? I
> wasn't able to find anything about this bus model code.

Assuming that with "this driver" you mean the Yoga Tablet Mode switch
driver you are working on that already is a WMI BUS driver since
it is a wmi_driver which attached itself to a wmi_device.

The old way of doing things was with drivers which instantiated
their own platform_device-s and then attached to those. These
used the old specify a WMI object to operate on through GUID only
methods like wmi_evaluate_method() everywhere.

Regards,

Hans

