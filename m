Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA54FA3740
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 16:17:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbiJXQR5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 12:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbiJXQPz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 12:15:55 -0400
Received: from vorpal.se (vorpal.se [151.236.221.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ADE3491DD
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 08:04:01 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id F207D14016;
        Mon, 24 Oct 2022 14:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1666622195; bh=JqLXTlYXJFFVHmypBCcYmpH9hX/gZqw6s65ABk5AYu4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=NJz1lZ/DGO0fLPFkhWx79UQrHwMRv3Py0gY/4Kfhw7aWTV7sKNP7k44inRcPzDptK
         pBeSMelhuTOsmE7XQlrAhOqQL9FKuU36+uYAbnO8NOso1e5ZuJeCaSX90uIKmEz33B
         mIEeotSp96DdxQOpnBuMEDXLn8Rmz1EshCzHMQN4B/uprGeiJhKtXqHZSfGihaKArX
         +eFbQslWn+KOqJrqfPt1kj7kAllxMqypbaamzZhs4PV58jcep/bdliquSJo0IYk44g
         c+cE8IfKHThDUl7LVK8a5EJFlbmEebY8tC2bUPlsHoz2rKXXZNWv4eRaNKLVg9ObRl
         cbQ01AIPJOBVw==
Message-ID: <bf1b7f4c-4142-cc31-4271-dbddc1ca0565@vorpal.se>
Date:   Mon, 24 Oct 2022 16:36:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Issue with toshiba fan sensors & missing feedback on patch
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <5c917c78-610b-96fa-8cf3-81f8d3dc505f@vorpal.se>
 <cbc43ef7-66b6-5b78-581f-d5e63e565f24@redhat.com>
 <65546ad2-4019-5f40-3fbe-81b853e3c180@vorpal.se>
 <97e9cbdf-6b9b-fdce-6c97-aa1c41e604cd@redhat.com>
From:   Arvid Norlander <lkml@vorpal.se>
In-Reply-To: <97e9cbdf-6b9b-fdce-6c97-aa1c41e604cd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

I have been unable to work on this for the past few weeks, first I got
sick, then I had lots of other things I was behind on because of the
sickness, then my main computer that I develop on (not the toshiba) broke,
and got a motherboard replacement (under warranty), but then the
refurbished replacement was faulty in a different way, and I'm currently
waiting for replacement of that one. Plus I now have a lot of deadlines
that I'm behind on because of that.

In summary: I have no idea when I will have time to look at the Toshiba
again. I *do* want to get back to it eventually, but don't hold your breath.

I do agree with your letter below though, once I get to that stuff. I have
added some comments.

On 2022-10-24 13:23, Hans de Goede wrote:
> Hi Arvid,
> 
> On 10/7/22 14:51, Arvid Norlander wrote:
>> On 2022-10-07 13:22, Hans de Goede wrote:
>>> Hi Arvid,
>>>
>>> On 10/6/22 23:12, Arvid Norlander wrote:
>>>> Hi Hans,
>>>>
>>>> Two things:
>>>> * I have discovered that reading the fan RPM in toshiba_acpi is slow,
>>>>   around 50 ms. I didn't notice it at first, but after adding some more
>>>>   sensors I found (current and voltage for AC and battery) it started to
>>>>   make running "sensors" visibly slow.
>>>>   
>>>>   I don't know what proper fix to this would be. Feel free to revert the
>>>>   fan RPM for now if it is not acceptable for reading sensors to block for
>>>>   ~50 ms (as opposed to the 100s of micro-seconds that other sensors such
>>>>   as coretemp and acpitz take to read on that laptop).
>>>
>>> Hmm, so apparently the single ACPI call this ends up making takes along time.
>>>
>>> I wonder what happens with the CPU load if you cat the file from
>>> a "while true; do cat /sys/class/hwmon/...; done" loop in the shell.
>>>
>>> With some luck most of that 50 ms is sleeping, so we won't see say
>>> 25% load on a quad core CPU (so 100% load on 1 core) in "top".
>>
>> After testing, thankfully it seems to be the case that it is mostly
>> sleeping!
> 
> That is good, still unfortunate that it takes so long though.
> 
>>
>>>
>>> Regardless we also want any desktop-environment sensor applets which
>>> poll more then once/second to block on this all the time. What most hwmon
>>> drivers with slow HW access do is update the readings once per second
>>> and then return cached values for a second see e.g. :
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/f71882fg.c
>>>
>>> and then specifically the "bool valid;" and "unsigned long last_updated;	/* In jiffies */"
>>> members of "struct f71882fg_data" and how those are used.
>>>
>>> I believe that keeping the fan rpm reading, which IMHO is the most
>>> useful one is fine when adding the caching; or alternatively you
>>> can submit a revert.
>>
>> I will try to look into this, hopefully this weekend, though I'm currently
>> down with a nasty cold, so I can't promise anything.
>>
>>> As for the AC + bat voltage/current can those be / are those retreived
>>> with the same tci_raw() call or do those require separate calls ?
>>> And if they require separate calls do those calls also all take 50 ms?
>>
>> These are separate: A shared one for AC current and AC voltage, and two
>> separate ones for battery current and battery voltage. There is also
>> more data in the AC reply one that I can't quite decode, but it seems to
>> be thermally related (but I have not managed to decode it as a temperature
>> that matches anything else). Annoyingly the windows software displays
>> almost everything in percentages on dial gauges without any units or even
>> scales, making actually figuring out the interpretations rather difficult
>> at times.
>>
>> For reading the power a call is can be issued to set the time resolution,
>> in powers of two between 1 and 16 (i.e. 1, 2, 4, 8 and 16 are valid values),
>> where 1 is slightly more than one new reading per second, while 16 is about
>> one reading every 20ish seconds.
>>
>> This suggests that the EC would be updating some periodic registers
>> internally and we are just querying them, however, these are still just as
>> slow to read as the fan.
> 
> Hmm, I'm not sure what is the best thing to do here, if we end up making
> 4 calls of each 50 ms here, then that is going to block the caller for
> 200 ms which I guess might be just acceptable if we do it only once
> per x seconds, for some value of x...
> 
> I guess you could use power_supply_is_system_supplied() to skip
> the AC readings when not charging, but that ends up calling _PSR
> on the ACPI AC device, which might also be slow.

Is that what provides the value to /sys/class/power_supply/ADP1/online ?
Because that appears to be quite fast.

I have since discovered that there seems to be another way to read these
(and some other) values that the Windows software uses sometimes, which I
*believe* to be basically a an async request and poll for completion
approach. However these calls do not appear to be that much faster when I
try them, so I'm having trouble seeing the point of it (maybe it makes more
difference on some other model?). Finally it doesn't fit the Linux HWMON
API, which is a blocking read API.

The traces basically look like:
1. Please load value -> OK
2. Is it done yet? -> No
3. Is it done yet? -> Yes, here is the value.

Though usually it is done by point 2 already.

The API itself for this is rather strange, my best guess is:

{HCI_GET, async_register_id, normal_param1, normal_param2,
 normal_register_id, flag for load/check for completion}

There are several such async register IDs (0xa1, 0xa7, 0xa8, ...), but each
async register only accepts a (sometimes overlapping) subset of normal
registers.

In summary it seems quite painful to use, for very little gain given that
the userspace API is blocking anyway. Thus I did not spend a large amount
of time on figuring out or documenting the details of this feature. I know
enough now to figure out how to do the equivilent non-async call when I see
async calls in the traces.

> 
> 
>>
>>>
>>> The battery values should already be available in some form under
>>> /sys/class/power_supply/BAT*  although you may only have the
>>> multiplied value of the 2 there in the form of energy_now.
>>
>> I do seem to have voltage_now and power_now. So current could be computed
>> by measuring the delta of energy_now over time and then using the voltage
>> to compute the current.
>>
>> However, the voltage as reported in /sys/class/power_supply/BAT1 does not
>> quite match the voltage I get from the HCI calls. The HCI call consistently
>> reads higher, but how much higher depends on if the AC is connected or not.
>> Also voltage_now seems to update rather more slowly than the HCI calls.
>>
>>>
>>> And the AC values are nice to have but not super interesting,
>>> so if they require another slow tci_raw() call then I'm not sure
>>> if they are worth adding.
>>
>> Yes they are slow, but they might be interesting in order to compute
>> system power usage while on AC (AC power - battery power) as it reports
>> the battery charging current while charging and the discharging current
>> while discharging.
>>
>> At the very least I will be documenting them when I get time.
> 
> Yes that sounds like a good idea. I guess you could also add support
> for them in the driver, but then maybe activated with some "extended_hwmon"
> kernel-module option. Which then should default to off I guess?

That seems like a good idea.

> 
> Regards,
> 
> Hans
> 

Best regards,
Arvid Norlander
