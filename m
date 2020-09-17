Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9033AC433E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 429A0206C3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 13:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HQaKUutC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgIQNz0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 09:55:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52248 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727137AbgIQNzX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600350904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=87BXXrp5D3CIt13tVuI0V/qQIhJ0GUUKvK/SqWe1lIo=;
        b=HQaKUutCrD134aqWT1pqPj9i5/aEQBwlUv9Qacrg/EqnVQcCqWCb0RwgPZEwZoxr5gKYLs
        9w4CIZjFJA3ujxdxNPkrkFh2IzEznAX8M6Shol/ShtsShVgIMfgFOnWwzstNkyyLFjOUXU
        NtukmXloEiSuI9KpM0sC/qK0GTfYvxU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-XDCIBXxGOcG9Cmox22Fg7Q-1; Thu, 17 Sep 2020 09:46:50 -0400
X-MC-Unique: XDCIBXxGOcG9Cmox22Fg7Q-1
Received: by mail-ej1-f69.google.com with SMTP id f17so914075ejq.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 06:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=87BXXrp5D3CIt13tVuI0V/qQIhJ0GUUKvK/SqWe1lIo=;
        b=KeGkklrnxe6CkwyAmjH4HvGblyhfz465KI9+8RmGJn3pU2m+NV7YqCYynw9EaiuB4M
         bnePdVPSApjY8Pt/3vDpXHIi/B2g6/223wgr9nR8D5kcTQDx7cdyuMhlxqoTaUgGLHX/
         ZfhKXETLZb3q4FLafVZCFhtStPoUrdwEjdPB+lFuqFqtodaQfPWb67Ck1hpT5fMhfK1J
         H7d5e/6J7GeTXQ+doqc4in6V8dokwVxvuWdD4XIShpq8LEG8fIGlO4ya6u3Sf+EFzBOl
         HzIGneHWbZxMKBK6PbuAxJTVy0azIY5Ki4F4aijFGeTz8vn017lu5jyOuHEdfAuN7QKA
         /Y6A==
X-Gm-Message-State: AOAM533N6DWiRhkqDs+iOrqBoXWlhAUKv0WvJA3AoUaXnBAMatcR1CEB
        dNkl2kHbQzycPkA7kNhFQCBuSAbKtFxS1ql2LbtGTZHlIRfyRKz3k4SD92ZizAe+MHEyn2dpxpk
        BA/GLWqTDGfqbKpWoIAoCBA6KPhtZ/NdJIQ==
X-Received: by 2002:a17:907:2141:: with SMTP id rk1mr30561357ejb.256.1600350408970;
        Thu, 17 Sep 2020 06:46:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX3dmJ1nButBIpGm15x9ksSlrDWusG2GRFXK9tvL3gO6oZOEU4Rzn/BWd1Wm9AVkPXTwkS8w==
X-Received: by 2002:a17:907:2141:: with SMTP id rk1mr30561330ejb.256.1600350408684;
        Thu, 17 Sep 2020 06:46:48 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id m10sm16760601edf.11.2020.09.17.06.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 06:46:48 -0700 (PDT)
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
To:     Bastien Nocera <hadess@hadess.net>,
        Benjamin Berg <bberg@redhat.com>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <b62caf7d0d7c78bfb7487cda969f55de30253a5c.camel@redhat.com>
 <35c8dd96-2e68-ac34-d1a5-78262a573287@redhat.com>
 <9d8037b5151886fd39a9eaf0a5c39b9bd56a56b8.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8d02bb96-709e-fa9c-58cd-87368afa2f50@redhat.com>
Date:   Thu, 17 Sep 2020 15:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9d8037b5151886fd39a9eaf0a5c39b9bd56a56b8.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 3:07 PM, Bastien Nocera wrote:
> On Thu, 2020-09-17 at 14:45 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9/17/20 2:22 PM, Benjamin Berg wrote:
>>> Hi,
>>>
>>> On Thu, 2020-09-17 at 13:22 +0200, Hans de Goede wrote:
>>>> The big question is what do we do if there are more then 3
>>>> profiles?
>>>
>>> The Intel p-state driver has the 4 modes:
>>>    * performance
>>>    * balance_performance
>>>    * balance_power
>>>    * power
>>>
>>> This seems to also match what windows does with their power slider,
>>> there the modes are mapped to integer values:
>>>    * power: 25
>>>    * balance_power: 50
>>>    * balance_performance: 75
>>>    * performance: 100
>>>
>>> Which appears to be the same as what newer DPTF versions use. For
>>> older
>>> DPTF versions this is done through OEM variables, which also appear
>>> to
>>> have 4 separate states usually. The MS power slider seems to define
>>> the
>>> four possible modes:
>>>    * Battery Saver
>>>    * Better Battery
>>>    * Better Performance
>>>    * Best Performance
>>>
>>> https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/customize-power-slider#set-default-power-slider-mode
>>>
>>>> One option would be something like the following:
>>>>
>>>> cat
>>>> /sys/class/system_performance_profile/thinkpad_acpi/performance_p
>>>> rofile
>>>>
>>>> low-power [balanced] performance
>>>
>>> I guess userspace is responsible for setting all drivers to the
>>> correct
>>> state when the user changes a global system setting?
>>
>> Yes.
>>
>>>> cat
>>>> /sys/class/system_performance_profile/thinkpad_acpi/extra_perform
>>>> ance_profiles
>>>>
>>>> extra-low-power balanced-performance-mix
>>>>
>>>> So we add an optional extra_performance_profiles sysfs attribute
>>>> and we ask all
>>>> drivers implemeting this class to implement at least the 3
>>>> standard profiles
>>>> (by mapping 3 of their options to these) and optional they can
>>>> offer extra
>>>> profiles (with free form names) in the extra_performance_profiles
>>>> sysfs attribute under the class-device.
>>>
>>> I think it would be good if userspace can figure out where such
>>> these
>>> extra profiles would be sorted in on the "power save --
>>> performance"
>>> scale. Assigning an integer in the range of 0-100 might be a
>>> solution
>>> for that.
>>
>> Interesting, maybe the primary interface should even be an integer in
>> that range, so for each system_performance_profile class-device we
>> would then have the following attributes:
>>
>> mappings (ro) - This attribute gives a list of valid performance-
>> profile-values
>>                In the form of "<integer-value> <description-
>> string>\n", e.g.:
>>
>>                25 Low Power
>>                50 Balanced
>>                100 Performance
> 
> The "description strings" need to come from a list. We're not going to
> use those anywhere but in debug messages, so we need a way to figure
> out what they would correspond to.

The whole idea behind the 101 possible profiles setup is to make the
API flexible/extensible. We don't know how much other profiles other
implementations will offer, nor what the naming used by that vendor
will be. So offering a fixed list in advance is sort of impossible.

For p-p-d the descriptions are probably not interesting at all,
but I think it would still be good for the driver to list the
Windows names of the various profiles in the mappings file.


> 
>> value (rw) - Integer in the range 0 (lowest performance setting) -
>> 100
>>                (highest performance setting). Note most drivers will
>> only
>>                support a number of specific discrete values, see the
>> mappings
>>                attribute. Userspace may write an arbitrary value
>> between 0
>>                and 100, this will be rounded to the closest supported
>> discrete
>>                value.
>>
>> value_string (ro) - String representation of the currently active
>> value,
>>                this is a shortcut for looking up the string in the
>> mappings
>>                attribute yourself.
>>
>> lap_mode (ro) - <lap_mode text here>
>>
>> Something like p-p-daemon would then just interact with the value and
>> lap_mode
>> fields, ignoring the mappings. It would then also need to do some
>> rounding of
>> its own when reading value to map things back to its own internal
>> levels.
>> One issue for p-p-d here might be that it writes its internal integer
>> value
>> corresponding to say "Low power", then reads back a value and when
>> rounding
>> that to its own discrete steps ends up at a different level then "Low
>> power".
>> This can be avoid by using the mappings file to get the supported
>> discrete values
>> and then only generate mappings for the discrete values to its own
>> internal
>> discrete steps once and always use those mappings, thus always
>> writing a
>> supported discrete value, avoiding rounding issues.
>>
>> I think that this will give us a nice and flexible interface. Note if
>> anyone disagrees, or has a better idea please speak up. Once we have
>> decided on what the interface is going to be, we are effectively
>> stuck
>> with it.
> 
> That sounds slightly more complicated than I'd have expected it to be,
> but I can work with that API.

Well Benjamin made a very valid point that we need to be able to
sort the various profiles along the low-power <-> performance axis
and maybe even also show some relative distance if some options
are closer together then others.  Which lead to (Bejamin's) 0-100
idea. I think this makes a lot of sense as it should give us
enough flexibility to cover other x86 vendor's implementations
and hopefully also similar functionality on other architectures.

I agree that this is slightly more complicated then I initially
expected too, but that is the price of building in some much
needed flexibility.  If you have options to simplify the interface
though I'm all ears.

Regards,

Hans

