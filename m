Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37590C433E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 12:51:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA84321582
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 12:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J8NrbwDk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgIQMvW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 08:51:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28627 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727055AbgIQMvS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 08:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600347072;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+ZbvxWExLcgmkILoAJHVzVnMk+KZPTIswHPoVmnFXtA=;
        b=J8NrbwDkKmGEuGKzXMvF8y2xypB6pEgi20qaY5qIGdr8wAFyu5guEFP195xlW/oVLX19u1
        /fElUZMIH6n/nC/4QabeSMvw2Rh1VDg6nJsaO3gKz1GJXxNVOycNjW1LK3Rdm9YVnmJ/ei
        kvYCkINdrnlL8OiAmk8YIbv5B8ZhOvU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-LUS13Bh9POKATGYkl9cGWA-1; Thu, 17 Sep 2020 08:51:08 -0400
X-MC-Unique: LUS13Bh9POKATGYkl9cGWA-1
Received: by mail-ej1-f71.google.com with SMTP id lx11so829897ejb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 05:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+ZbvxWExLcgmkILoAJHVzVnMk+KZPTIswHPoVmnFXtA=;
        b=XoJ3rBpsuJzBnGwbq4WqiJaeDODBfnz48wZ8o70OMr+5OLXG4ugd5Intg4B9O1s0om
         x25+UVkMsi5aU8JSGEtSJZm/wkx47Mn7sAFLGw7FWY3KIicdgi/NwF3C+mrwXD9w0SLU
         Z+aFtxizgdZF2aBgVethEcuOLnx6UeMpXuBbq9Ckhu7gci4+vxydIjmO3ZtNG/OfeJCc
         J/Yp4AAF4tYrdpip2PLa8TAvambzFxENGZLdjs+4Wb4pJ7Sp6DTIk9rDGye+89DhmXfM
         +PrM1wyB8R++efrtLKyQpvA49jfDaDdBlbeZmG0LRXVhyJvDvK2uOCbg3AbokxHD90VB
         hbhA==
X-Gm-Message-State: AOAM532KGeIg5+ccSJgdwM3nj9BCVknqttq3Zjh/xFO3xKu3fGtRPdka
        Bc3Gu0vRx1QTVF/+ZTLR8CRbiwMsjm3WkyPmHMzr+W/uZvLgQSIc9nbIyVNHcx+cJcNhjCGhDjX
        0dMqgQowdnT/JsR6ytKl/VS7EvytKkh9/VA==
X-Received: by 2002:a17:906:7c82:: with SMTP id w2mr29977769ejo.87.1600347067045;
        Thu, 17 Sep 2020 05:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhqjc1gsXVDI/Hj9r8tFdDHlcNN8bOPIMsLpJgInwJAjOM/u9gHEg4+yNB0InC9k/JjFU62Q==
X-Received: by 2002:a17:906:7c82:: with SMTP id w2mr29977741ejo.87.1600347066706;
        Thu, 17 Sep 2020 05:51:06 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id a15sm15010875ejy.118.2020.09.17.05.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 05:51:06 -0700 (PDT)
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
To:     Bastien Nocera <hadess@hadess.net>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
Date:   Thu, 17 Sep 2020 14:51:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/17/20 1:50 PM, Bastien Nocera wrote:
> Hey,
> 
> On Thu, 2020-09-17 at 13:22 +0200, Hans de Goede wrote:
>> Hi Elia, Mark, et al.
>>
>> Elia, Mark I'm mailing you both because both of you have pdx86
>> patches pending to add a vendor
>> specific sysfs-attribute for selecting performance-profiles for resp.
>> HP and Lenovo Thinkpad laptops.
>>
>> I think that this shows that we might need to start thinking
>> about a generic kernel API for this, otherwise we will
>> end up with slight different options per vendor ...
> 
> Some comments below based on possible use in power-profiles-daemon:
> https://www.hadess.net/2020/09/power-profiles-daemon-new-project.html
> 
> 
>> So it seems we may need something like:
>>
>> /sys/class/system_performance_profile
>>
>> Where we would then get e.g.:
>>
>> /sys/class/system_performance_profile/thinkpad_acpi/performance_profi
>> le
>>
>> And then we need to standardize on the names/values which
>> performance_profile can show / accept when written too.
>>
>> The big question is what do we do if there are more then 3 profiles?
> 
> The Intel P-State driver in the kernel supports 4 separate ones (plus
> default):
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/cpufreq/intel_pstate.c#n591
> which we crammed into 3 profiles:
> https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/blob/master/src/ppd-driver-intel-pstate.c#L209-226
> 
>> One option would be something like the following:
>>
>> cat
>> /sys/class/system_performance_profile/thinkpad_acpi/performance_profi
>> le
>>
>> low-power [balanced] performance
> 
> Are the square brackets to show the currently selected profile? I'd
> rather it was a separate sysfs attribute. I would expect to only ever
> read the list of supported profiles once, and then monitor an "active
> profile" attribute.

See my new proposal in reaction to Benjamin's email.

> 
> (a bit like the intel_pstate kernel driver does, but then all the
> devices that support Intel P-State support all the profiles, so it's
> not a good example ;)
> 
>> cat
>> /sys/class/system_performance_profile/thinkpad_acpi/extra_performance
>> _profiles
>>
>> extra-low-power balanced-performance-mix
>>
>> So we add an optional extra_performance_profiles sysfs attribute and
>> we ask all
>> drivers implemeting this class to implement at least the 3 standard
>> profiles
>> (by mapping 3 of their options to these) and optional they can offer
>> extra
>> profiles (with free form names) in the extra_performance_profiles
>> sysfs attribute under the class-device.
>>
>> The idea behind putting the extra profiles in a separate sysfs-
>> attribute
>> is that reading the main performance_profile attribute will always
>> show
>> one selected, even if one of the extra profiles is actually in use,
>> then the driver should also show the closest standardized profile as
>> being active.
> 
> I think it's fine having more than 3 profiles. Something like power-
> profiles-daemon would likely trying to match them all to one of the 3
> profiles it uses as an interface, or forcing the use of those 3
> profiles, depending on what that profile behaves.
> 
>> This will allow userspace code to always rely on the standard
>> interface
>> both for getting a representation of the currently active profile as
>> well
>> as for setting the active profile.
>>
>> Elia, Mark, I assume that both of you want to get your patches for
>> this
>> upstream sooner, rather then later. But I think we should put them on
>> hold until we have an agreement on a shared userspace API for this.
> 
> Compared to the WIP lenovo-dytc "perfmode" driver, we're missing
> something to advertise the unavailability of a profile, and the reason
> for that unavailability.

UGh, do we really need to export this though. We have the lap_mode thing
already; and that is something which we will need for other reasons in
the future too. Any UI for selecting performance modes can display a
warning when lap_mode is true saying that: "The laptop has detected that it
is sitting on someone's lap and that performance may be limited
because of this." (feel free to improve the text).

I guess we could split the "value" attribute from my reply to Benjamin's
email into "configured_value" (rw) and "actual_value" (rw) attributes.
If we have the info we might as well export it I guess,.

Regards,

Hans

