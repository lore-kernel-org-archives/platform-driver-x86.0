Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCCCC43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 12:47:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 125FB2087D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 12:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GvAkGIJp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgIQMr1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 08:47:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40432 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727047AbgIQMrG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 08:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600346821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bP4mroISdrGSf4J7sLESreWN2o+sTglYYIqyWlpAFQs=;
        b=GvAkGIJpGuo9QMQCfBf+33ZeZoUrJ1Fgaa3wNRHpgdrdKoGjF1lbsFEBjfprAxSHhTx3ii
        zn/vwM47tfg4YSUvtlmjBEa8lh4DPSmgFA4dgqxFHLtDeSQ2jOpHRVOm1pg/WMQJwNHtLk
        O8E+8eaWGkGMM8/MJ8ZSYqOXkLD/ouM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-obL-oHynPUGnidB16gLgtA-1; Thu, 17 Sep 2020 08:45:47 -0400
X-MC-Unique: obL-oHynPUGnidB16gLgtA-1
Received: by mail-ed1-f69.google.com with SMTP id n25so849462edr.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 05:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bP4mroISdrGSf4J7sLESreWN2o+sTglYYIqyWlpAFQs=;
        b=kAzrWofO8ovAHZunweyhH7fOGn2r0Tx2Ofc8KTTdInUuAsO9rBF3IbPlk7z3v/cZN5
         kEHD+fvUfxYx0gtMs7MmIF4n/iuQLQDVToaXPpqYUD8GJi7awaPGwLoZvkuCi2J5klBl
         ulLl9ct6bqsS0i+vUnS/fSkuP1INYHhy5FuaF3HQgNHft4EMpXYVfZAqrJWWHHqSoeCn
         PNtxnuN5QI8MOax1SJ2ooARir/1HyYp1Mw5+NxudyAeZ85s6UoM/eoIAQPOqdVLf81EL
         3HdNQqX2Bzczd0CLCrqJGrZuinhZemnKHYDssRFeJV4d/zCYhSu9nB5asVddedtVasVl
         NPjQ==
X-Gm-Message-State: AOAM533tUBPJlNKbXLiJCMCzq5LchNTFg0FPHg2LUZOT3Xh8yem0fkiQ
        ij1/yenq9o1tBarpQmYlGHELzY/rsro/AWTpkeyasoAuc5oHmzzsY7m5tZzzbNnt1FWa0D+UdL3
        XyjBA7jEDWCtrXid+kZjh8/oApcwQM1r2Qg==
X-Received: by 2002:a17:906:7695:: with SMTP id o21mr27442174ejm.176.1600346746033;
        Thu, 17 Sep 2020 05:45:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGNl8Yji/J2YJWKLsit4Hinn0EzlQJ1LaqvwhoOITjNF1kT52okt1SEfgkxLXl52VgIc2H+Q==
X-Received: by 2002:a17:906:7695:: with SMTP id o21mr27442137ejm.176.1600346745361;
        Thu, 17 Sep 2020 05:45:45 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id o6sm16565174edh.40.2020.09.17.05.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 05:45:44 -0700 (PDT)
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
To:     Benjamin Berg <bberg@redhat.com>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <b62caf7d0d7c78bfb7487cda969f55de30253a5c.camel@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <35c8dd96-2e68-ac34-d1a5-78262a573287@redhat.com>
Date:   Thu, 17 Sep 2020 14:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b62caf7d0d7c78bfb7487cda969f55de30253a5c.camel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 2:22 PM, Benjamin Berg wrote:
> Hi,
> 
> On Thu, 2020-09-17 at 13:22 +0200, Hans de Goede wrote:
>> The big question is what do we do if there are more then 3 profiles?
> 
> The Intel p-state driver has the 4 modes:
>   * performance
>   * balance_performance
>   * balance_power
>   * power
> 
> This seems to also match what windows does with their power slider,
> there the modes are mapped to integer values:
>   * power: 25
>   * balance_power: 50
>   * balance_performance: 75
>   * performance: 100
> 
> Which appears to be the same as what newer DPTF versions use. For older
> DPTF versions this is done through OEM variables, which also appear to
> have 4 separate states usually. The MS power slider seems to define the
> four possible modes:
>   * Battery Saver
>   * Better Battery
>   * Better Performance
>   * Best Performance
> 
> https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/customize-power-slider#set-default-power-slider-mode
> 
>> One option would be something like the following:
>>
>> cat /sys/class/system_performance_profile/thinkpad_acpi/performance_profile
>>
>> low-power [balanced] performance
> 
> I guess userspace is responsible for setting all drivers to the correct
> state when the user changes a global system setting?

Yes.

>> cat /sys/class/system_performance_profile/thinkpad_acpi/extra_performance_profiles
>>
>> extra-low-power balanced-performance-mix
>>
>> So we add an optional extra_performance_profiles sysfs attribute and we ask all
>> drivers implemeting this class to implement at least the 3 standard profiles
>> (by mapping 3 of their options to these) and optional they can offer extra
>> profiles (with free form names) in the extra_performance_profiles
>> sysfs attribute under the class-device.
> 
> I think it would be good if userspace can figure out where such these
> extra profiles would be sorted in on the "power save -- performance"
> scale. Assigning an integer in the range of 0-100 might be a solution
> for that.

Interesting, maybe the primary interface should even be an integer in
that range, so for each system_performance_profile class-device we
would then have the following attributes:

mappings (ro) - This attribute gives a list of valid performance-profile-values
              In the form of "<integer-value> <description-string>\n", e.g.:

              25 Low Power
              50 Balanced
              100 Performance

value (rw) - Integer in the range 0 (lowest performance setting) - 100
              (highest performance setting). Note most drivers will only
              support a number of specific discrete values, see the mappings
              attribute. Userspace may write an arbitrary value between 0
              and 100, this will be rounded to the closest supported discrete
              value.

value_string (ro) - String representation of the currently active value,
              this is a shortcut for looking up the string in the mappings
              attribute yourself.

lap_mode (ro) - <lap_mode text here>

Something like p-p-daemon would then just interact with the value and lap_mode
fields, ignoring the mappings. It would then also need to do some rounding of
its own when reading value to map things back to its own internal levels.
One issue for p-p-d here might be that it writes its internal integer value
corresponding to say "Low power", then reads back a value and when rounding
that to its own discrete steps ends up at a different level then "Low power".
This can be avoid by using the mappings file to get the supported discrete values
and then only generate mappings for the discrete values to its own internal
discrete steps once and always use those mappings, thus always writing a
supported discrete value, avoiding rounding issues.

I think that this will give us a nice and flexible interface. Note if
anyone disagrees, or has a better idea please speak up. Once we have
decided on what the interface is going to be, we are effectively stuck
with it.

Regards,

Hans








> 
> Benjamin
> 
>> The idea behind putting the extra profiles in a separate sysfs-attribute
>> is that reading the main performance_profile attribute will always show
>> one selected, even if one of the extra profiles is actually in use,
>> then the driver should also show the closest standardized profile as
>> being active.
>>
>> This will allow userspace code to always rely on the standard interface
>> both for getting a representation of the currently active profile as well
>> as for setting the active profile.
>>
>> Elia, Mark, I assume that both of you want to get your patches for this
>> upstream sooner, rather then later. But I think we should put them on
>> hold until we have an agreement on a shared userspace API for this.
>>
>> I would like to think that the above proposal is a good start,
>> if we can quickly (*) decide on an userspace API here
>>
>> Regards,
>>
>> Hans
>>
>> p.s.
>>
>> I guess we should also add an optional lap_mode sysfs attribute
>> to the class-device, to have all the info for the Thinkpads in
>> one place.
>>
>>
>> *) but not too quickly, it is important we get this right
>>

