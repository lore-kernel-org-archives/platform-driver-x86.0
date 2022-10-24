Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0901DEB6461
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Oct 2022 11:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiJXLXz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Oct 2022 07:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiJXLXy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 07:23:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0132D1DC
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666610633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wozvULmdSXz546DNYoIbnS9co9xsHpdWlCc/6uycbJs=;
        b=DnYSgxRiKMQ8MYTY/JMN605dn7LVuLblE8+Da8PEnLF6dBhbivDxPXCyUFkz/Z7766ZKpg
        /BltGIHbKfMeRj3B+LFKEEwXubhKkR+cWlRsDfdE5z2OP0qNT3mfNiazkfLXmkXtf1eKYy
        Wl7SGJX3hC4UIWUdkWzwp5SVpUqcMS4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-uEvcvI3pN_6P3nlP-RuLsg-1; Mon, 24 Oct 2022 07:23:51 -0400
X-MC-Unique: uEvcvI3pN_6P3nlP-RuLsg-1
Received: by mail-ed1-f72.google.com with SMTP id v13-20020a056402348d00b0045d36615696so9269564edc.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wozvULmdSXz546DNYoIbnS9co9xsHpdWlCc/6uycbJs=;
        b=k9sTzW5fEwpT1ghWi60fkQtN7Ei1VuZbDAnuu8ipbtUNBOo14ngLdlDy6VEeKUd+Nu
         ooyjjkHh1CgAo9ex6UetKj6odUFneZoVewoez1K7zgqunCeFgOc8ELYD+ys9vXpPaeeT
         0KdrOWXbpq0KX8PYN/hUeN/Pt0VF2umd9Bc+bXFtCYMsHRHlcORl4hb/NnCtC9+nKmwp
         WM0c8dnDc9hik8m0ryxdnTiu9xIedPSDpVutp9iqbzEKok/a0PdZygoiLbil+r4MqdXh
         hdfsG8EwIlI80xMIq245Ea5y7zLsquiGqUJr34U/brHcjGDhq0k1yTRkKIiLav8MbOUp
         TjJw==
X-Gm-Message-State: ACrzQf204C+Hk+UGPs1nqYsWS6JglEiBbuT6a3TxghQyx7nhlUfDStQL
        GtuKAG+QaMcod6i25R+Dskt1o40gmdOoQxThEmKq4srJO8j+NLEGpm8/Ii1MVnYlk4LwdI1NXY2
        OK+eeOMCaeA8Y3AZ8bvy/AJ5Zax5cKTC5fg==
X-Received: by 2002:a17:906:a4a:b0:782:686d:a1b6 with SMTP id x10-20020a1709060a4a00b00782686da1b6mr26864289ejf.232.1666610629830;
        Mon, 24 Oct 2022 04:23:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6kdba56HxSDGiSkWpiKhve/0gtdRBQKcUo18jeC/rHNoWMZr551Xs8WImepNRw8+TwUTsWZg==
X-Received: by 2002:a17:906:a4a:b0:782:686d:a1b6 with SMTP id x10-20020a1709060a4a00b00782686da1b6mr26864269ejf.232.1666610629527;
        Mon, 24 Oct 2022 04:23:49 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id de13-20020a1709069bcd00b0078d957e65b6sm15347665ejc.23.2022.10.24.04.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 04:23:48 -0700 (PDT)
Message-ID: <97e9cbdf-6b9b-fdce-6c97-aa1c41e604cd@redhat.com>
Date:   Mon, 24 Oct 2022 13:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: Issue with toshiba fan sensors & missing feedback on patch
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <5c917c78-610b-96fa-8cf3-81f8d3dc505f@vorpal.se>
 <cbc43ef7-66b6-5b78-581f-d5e63e565f24@redhat.com>
 <65546ad2-4019-5f40-3fbe-81b853e3c180@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <65546ad2-4019-5f40-3fbe-81b853e3c180@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Arvid,

On 10/7/22 14:51, Arvid Norlander wrote:
> On 2022-10-07 13:22, Hans de Goede wrote:
>> Hi Arvid,
>>
>> On 10/6/22 23:12, Arvid Norlander wrote:
>>> Hi Hans,
>>>
>>> Two things:
>>> * I have discovered that reading the fan RPM in toshiba_acpi is slow,
>>>   around 50 ms. I didn't notice it at first, but after adding some more
>>>   sensors I found (current and voltage for AC and battery) it started to
>>>   make running "sensors" visibly slow.
>>>   
>>>   I don't know what proper fix to this would be. Feel free to revert the
>>>   fan RPM for now if it is not acceptable for reading sensors to block for
>>>   ~50 ms (as opposed to the 100s of micro-seconds that other sensors such
>>>   as coretemp and acpitz take to read on that laptop).
>>
>> Hmm, so apparently the single ACPI call this ends up making takes along time.
>>
>> I wonder what happens with the CPU load if you cat the file from
>> a "while true; do cat /sys/class/hwmon/...; done" loop in the shell.
>>
>> With some luck most of that 50 ms is sleeping, so we won't see say
>> 25% load on a quad core CPU (so 100% load on 1 core) in "top".
> 
> After testing, thankfully it seems to be the case that it is mostly
> sleeping!

That is good, still unfortunate that it takes so long though.

> 
>>
>> Regardless we also want any desktop-environment sensor applets which
>> poll more then once/second to block on this all the time. What most hwmon
>> drivers with slow HW access do is update the readings once per second
>> and then return cached values for a second see e.g. :
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hwmon/f71882fg.c
>>
>> and then specifically the "bool valid;" and "unsigned long last_updated;	/* In jiffies */"
>> members of "struct f71882fg_data" and how those are used.
>>
>> I believe that keeping the fan rpm reading, which IMHO is the most
>> useful one is fine when adding the caching; or alternatively you
>> can submit a revert.
> 
> I will try to look into this, hopefully this weekend, though I'm currently
> down with a nasty cold, so I can't promise anything.
> 
>> As for the AC + bat voltage/current can those be / are those retreived
>> with the same tci_raw() call or do those require separate calls ?
>> And if they require separate calls do those calls also all take 50 ms?
> 
> These are separate: A shared one for AC current and AC voltage, and two
> separate ones for battery current and battery voltage. There is also
> more data in the AC reply one that I can't quite decode, but it seems to
> be thermally related (but I have not managed to decode it as a temperature
> that matches anything else). Annoyingly the windows software displays
> almost everything in percentages on dial gauges without any units or even
> scales, making actually figuring out the interpretations rather difficult
> at times.
> 
> For reading the power a call is can be issued to set the time resolution,
> in powers of two between 1 and 16 (i.e. 1, 2, 4, 8 and 16 are valid values),
> where 1 is slightly more than one new reading per second, while 16 is about
> one reading every 20ish seconds.
> 
> This suggests that the EC would be updating some periodic registers
> internally and we are just querying them, however, these are still just as
> slow to read as the fan.

Hmm, I'm not sure what is the best thing to do here, if we end up making
4 calls of each 50 ms here, then that is going to block the caller for
200 ms which I guess might be just acceptable if we do it only once
per x seconds, for some value of x...

I guess you could use power_supply_is_system_supplied() to skip
the AC readings when not charging, but that ends up calling _PSR
on the ACPI AC device, which might also be slow.


> 
>>
>> The battery values should already be available in some form under
>> /sys/class/power_supply/BAT*  although you may only have the
>> multiplied value of the 2 there in the form of energy_now.
> 
> I do seem to have voltage_now and power_now. So current could be computed
> by measuring the delta of energy_now over time and then using the voltage
> to compute the current.
> 
> However, the voltage as reported in /sys/class/power_supply/BAT1 does not
> quite match the voltage I get from the HCI calls. The HCI call consistently
> reads higher, but how much higher depends on if the AC is connected or not.
> Also voltage_now seems to update rather more slowly than the HCI calls.
> 
>>
>> And the AC values are nice to have but not super interesting,
>> so if they require another slow tci_raw() call then I'm not sure
>> if they are worth adding.
> 
> Yes they are slow, but they might be interesting in order to compute
> system power usage while on AC (AC power - battery power) as it reports
> the battery charging current while charging and the discharging current
> while discharging.
> 
> At the very least I will be documenting them when I get time.

Yes that sounds like a good idea. I guess you could also add support
for them in the driver, but then maybe activated with some "extended_hwmon"
kernel-module option. Which then should default to off I guess?

Regards,

Hans

