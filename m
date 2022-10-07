Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B156C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 Oct 2022 12:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiJGMvi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 7 Oct 2022 08:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiJGMvh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Oct 2022 08:51:37 -0400
Received: from vorpal.se (vorpal.se [151.236.221.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C823BBE3B
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 Oct 2022 05:51:36 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 6C35814018;
        Fri,  7 Oct 2022 12:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1665147093; bh=kNkFTp/Q8aVtVCEeHWR+NUTsqUMmd+0rV2PZ+ySgMZc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=WxIAwpk8/YwAK+fEnzB2Z6uVLBOhjHgKHE+JSd3JXifv7FHbO525LkqH63MTBDbHn
         4Fuk67iIIeeUcGsCdOgDnPfQYPQUVeI2RF8e+OlAFL4HQE+fSCaZGCUfgPXjt3+biW
         /6fgoC0gDviyVFwfzWmEHY9CvnLa5iRPEp1FbFs+iKGV6+OqxJNq+yJmENwMOCK1XX
         tWPi6WSLfOqwxZShjxkJh/UA1t/fqOsksjF/m/njkv9E5MVMdWbkUheGc0M8lh6jyw
         8Rg1Fd63wDF4y/sRqcVtQORVmnwumraNNXpmbSKsr48tkuojvWKuf5SFU7riD5BOgb
         YjYE9US2g0Z1Q==
Message-ID: <65546ad2-4019-5f40-3fbe-81b853e3c180@vorpal.se>
Date:   Fri, 7 Oct 2022 14:51:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Issue with toshiba fan sensors & missing feedback on patch
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <5c917c78-610b-96fa-8cf3-81f8d3dc505f@vorpal.se>
 <cbc43ef7-66b6-5b78-581f-d5e63e565f24@redhat.com>
From:   Arvid Norlander <lkml@vorpal.se>
In-Reply-To: <cbc43ef7-66b6-5b78-581f-d5e63e565f24@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2022-10-07 13:22, Hans de Goede wrote:
> Hi Arvid,
> 
> On 10/6/22 23:12, Arvid Norlander wrote:
>> Hi Hans,
>>
>> Two things:
>> * I have discovered that reading the fan RPM in toshiba_acpi is slow,
>>   around 50 ms. I didn't notice it at first, but after adding some more
>>   sensors I found (current and voltage for AC and battery) it started to
>>   make running "sensors" visibly slow.
>>   
>>   I don't know what proper fix to this would be. Feel free to revert the
>>   fan RPM for now if it is not acceptable for reading sensors to block for
>>   ~50 ms (as opposed to the 100s of micro-seconds that other sensors such
>>   as coretemp and acpitz take to read on that laptop).
> 
> Hmm, so apparently the single ACPI call this ends up making takes along time.
> 
> I wonder what happens with the CPU load if you cat the file from
> a "while true; do cat /sys/class/hwmon/...; done" loop in the shell.
> 
> With some luck most of that 50 ms is sleeping, so we won't see say
> 25% load on a quad core CPU (so 100% load on 1 core) in "top".

After testing, thankfully it seems to be the case that it is mostly
sleeping!

> 
> Regardless we also want any desktop-environment sensor applets which
> poll more then once/second to block on this all the time. What most hwmon
> drivers with slow HW access do is update the readings once per second
> and then return cached values for a second see e.g. :
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/f71882fg.c
> 
> and then specifically the "bool valid;" and "unsigned long last_updated;	/* In jiffies */"
> members of "struct f71882fg_data" and how those are used.
> 
> I believe that keeping the fan rpm reading, which IMHO is the most
> useful one is fine when adding the caching; or alternatively you
> can submit a revert.

I will try to look into this, hopefully this weekend, though I'm currently
down with a nasty cold, so I can't promise anything.

> As for the AC + bat voltage/current can those be / are those retreived
> with the same tci_raw() call or do those require separate calls ?
> And if they require separate calls do those calls also all take 50 ms?

These are separate: A shared one for AC current and AC voltage, and two
separate ones for battery current and battery voltage. There is also
more data in the AC reply one that I can't quite decode, but it seems to
be thermally related (but I have not managed to decode it as a temperature
that matches anything else). Annoyingly the windows software displays
almost everything in percentages on dial gauges without any units or even
scales, making actually figuring out the interpretations rather difficult
at times.

For reading the power a call is can be issued to set the time resolution,
in powers of two between 1 and 16 (i.e. 1, 2, 4, 8 and 16 are valid values),
where 1 is slightly more than one new reading per second, while 16 is about
one reading every 20ish seconds.

This suggests that the EC would be updating some periodic registers
internally and we are just querying them, however, these are still just as
slow to read as the fan.

> 
> The battery values should already be available in some form under
> /sys/class/power_supply/BAT*  although you may only have the
> multiplied value of the 2 there in the form of energy_now.

I do seem to have voltage_now and power_now. So current could be computed
by measuring the delta of energy_now over time and then using the voltage
to compute the current.

However, the voltage as reported in /sys/class/power_supply/BAT1 does not
quite match the voltage I get from the HCI calls. The HCI call consistently
reads higher, but how much higher depends on if the AC is connected or not.
Also voltage_now seems to update rather more slowly than the HCI calls.

> 
> And the AC values are nice to have but not super interesting,
> so if they require another slow tci_raw() call then I'm not sure
> if they are worth adding.

Yes they are slow, but they might be interesting in order to compute
system power usage while on AC (AC power - battery power) as it reports
the battery charging current while charging and the discharging current
while discharging.

At the very least I will be documenting them when I get time.

> 
>> * I never got any feedback from you on the cover letter of this patch
>>   series: https://www.spinics.net/lists/platform-driver-x86/msg34818.html
>>
>>   In a reply to the one of the patches in the series you alluded to that
>>   you would write a reply to the cover letter as well. Instead you sent
>>   the response to patch 1/2 twice.
> 
> Sorry besides the double reply to 1/2 I did send another reply to 1/2:
> 
> https://lore.kernel.org/platform-driver-x86/36cc9c55-bc8c-ed9e-3467-8be0aa450167@redhat.com/
> 
> Where I ended up answering the userspace API question (or at least I intended
> to answer it there, that may not have been clear). Which is why I ended
> up not reply-ing to the cover-letter. I will take another look at the
> cover-letter and answer any other questions you may have asked there.
> 
> As for the userspace API question, see my linked reply above. To
> summarize / clarify:
> 
> - I'm fine with the suggested wakeup_cause + button_id sysfs-attributes.
> - For the wakeup_cause I would like to see the format be a standard
>   kernel bool fmt as also used by module options. This mostly means
>   using kstrtobool() in the store function
> - As mentioned in my reply please add a Documentation file documenting
>   both sysfs attributes

Right, I saw those, I was just waiting for the reply to the cover letter
before submitting the next version.

> 
>>  We are already halfway through the merge
>>   window soon, so I would appreciate getting that feedback soon.
> 
> Generally speaking patches must be ready no later then around rc6 to
> get merged into the next release. So to get this merged you have
> about 7 weeks until 6.1-rc6 is released to get this ready and then
> I'll merge it into my pdx86/for-next branch for the 6.2 cycle.

Ah, good to know. This should be fine, it is not exactly urgent, given
that the computer is from 2011.

> 
> Anything feature work which is not ready around rc6 of the
> previous cycle will not make the current cycle (instead it
> gets delayed to the next cycle).
> 
> I will go and answer the cover-letter now, for real this time...
> 
> Regards,
> 
> Hans
>

Best regards,
Arvid Norlander
