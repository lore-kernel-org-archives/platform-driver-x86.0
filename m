Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4B3C43460
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 14:45:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FC0361355
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 14:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354634AbhESOrM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 10:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354744AbhESOrB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 10:47:01 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC74C06175F
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 07:45:39 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x19so19492583lfa.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LFmxs9dnf4XhGoU54Fx5p9cPrO+jIKT2MaHInoVXFRQ=;
        b=ByR8chr8acbEgppiVUxgG9DGQoMguewYzV+M0FDk5k56NRTVGMnH5TtEH4B2dsKo5w
         i/eXQ87YtQwWnUEXKf4g96Xy92ROuCC6r/F/nwrjyZKJJfrLjY4Mm6KDGkiJoSU5VYsj
         cr9sHUNhP3kXkywf2Cgz0j8I6vnatgmteS6YWJT+cZiQSJJ13ThKGz/VFwGEjchHpFPT
         XWaTe5b2XqmB5v/FZWSijpLCYgAlmka0xgXF515ApIMiQOLeVeAET68NmTp2zcJO+bB7
         aiDOlYiOWbbw+2BSksnQXUtQ+hGDtvbj7PteNFwx178xlhynGSHR1UrAauhzSQAjEJpH
         iOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LFmxs9dnf4XhGoU54Fx5p9cPrO+jIKT2MaHInoVXFRQ=;
        b=hOcmY7UsfTEyunptsDCGVzVL34QZdRkztj9Tijyj5T7dcciSzx1B5Gg5blRiZRsQ/W
         LS7XnzFdW+35N3Ub7exdsdpMoO/BGVp/1HC84Gss3V83+rdJ4cwQiVqEzkjqxeE7IvTa
         SRHYnBuDkUs+X7hYE8JHIFbiGpPmQA4aJNo6hLr79bsZdez4gAN80UMxr/Zghe5PBvgL
         E04LvOhkgMxtikfi+Uw5pdAJoU9ikTHs2Kb6BkT51YuvNPL3aTQPSh3U4eWP9InBsHKo
         r2/VCZ74lnbjEebBCkaAMTrDolzRaZqQ+D0cSCsSV4beq+YNzEkji+aPqQf2DZJXuooY
         LkbQ==
X-Gm-Message-State: AOAM533Zjy6OFpGoVq43tCFC1Vyh5eQ9IqCd8otuQnoOYQ4d+7Ohzb1c
        caLOXPlHfs9U0fc77C3oztY=
X-Google-Smtp-Source: ABdhPJwlS2byVj7JrPF7nH9qi/SYp/BuwPG3NDlt3pAc4qsOWa5WfvXhRQ4UYwEXKcqLUU2d3inuCg==
X-Received: by 2002:a19:f707:: with SMTP id z7mr8628914lfe.526.1621435537891;
        Wed, 19 May 2021 07:45:37 -0700 (PDT)
Received: from [130.238.235.175] (emp-235-175.eduroam.uu.se. [130.238.235.175])
        by smtp.gmail.com with ESMTPSA id f36sm2623273lfv.248.2021.05.19.07.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 07:45:37 -0700 (PDT)
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Hans de Goede <hdegoede@redhat.com>,
        Thomas Koch <linrunner@gmx.net>,
        Sebastian Reichel <sre@kernel.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "jwrdegoede@fedoraproject.org" <jwrdegoede@fedoraproject.org>,
        "smclt30p@gmail.com" <smclt30p@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <3anWBvkrPqTNQyfx2ZwDaLZKXtw5PMwTTdcgGNt0FaACUSsrkb5PaoqVKxLpxXU-4NcVZ9AqDQLs2VMOmvS-KfxHRmOSQiZlMjyvH282mdQ=@protonmail.com>
 <20210408135102.6r2przibgngaavkp@earth.universe>
 <39c3436a-a08d-9530-3215-854148215312@gmx.net>
 <6f58903f-5219-9aff-78ca-33687e2e4147@redhat.com>
 <a2d850e9-789d-54e8-e098-1a0829504031@gmx.net>
 <8255aa89-fe3b-1de2-0195-a818795b7d32@redhat.com>
From:   Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>
Message-ID: <c024f687-a246-8dd2-2e9a-32c8f37aa89d@gmail.com>
Date:   Wed, 19 May 2021 16:45:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8255aa89-fe3b-1de2-0195-a818795b7d32@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Sebastian,

given the discussion below, would you agree on introducing attributes

force_discharge
inhibit_charge

rather than using 'status' property?
or how should we proceed?

Regards,
Nicolo'

On 4/17/21 7:03 PM, Hans de Goede wrote:
> Hi Thomas,
> 
> On 4/17/21 1:49 PM, Thomas Koch wrote:
>> Hi Hans,
>>
>> from a userspace perspective, I don't think it's optimal to combine the
>> two features and the status. For example, how do I find out which one is
>> available?
>>
>> I have to test the writability of status and then still don't know which
>> one is available. Seeing if force_discharge or inhibit_charge are there
>> is much simpler.
>>
>> And then enabling that: triggering force_discharge by writing
>> "Discharging" is ok. But for inhibit_charge we would need a new status,
>> something like "Charging inhibited". This then causes problems for the
>> existing userspace, says: upowerd could not handle it. You remember the
>> "Not charging" patch from Ognen?
> 
> I think you have valid points both wrt the discoverability of the
> feature availability, as well as about a "Charging inhibited" status
> value possibly (likely) causing problems for userspace.
> 
> With that said, you really need to discuss this with Sebastian. I'm fine
> with the thinkpad_acpi patches, but as I already said I want to avoid
> in essence defining new power_supply class userspace API inside
> drivers/platform/x86 .  Last time we did that it ended poorly and more
> in general it is a bad idea.
> 
> So you first need to agree on a set of power_supply class sysfs attributes
> for this and document those in the power_supply class docs, before I can
> merge the thinkpad_acpi patches.
> 
> And the agreeing on and documenting is something which you need to discuss
> with Sebastian (the power_supply maintainer).
> 
> Regards,
> 
> Hans
> 
> 
> 
>> -- 
>>
>> Freundliche Grüße / Kind regards,
>>
>> Thomas Koch
>>
>>
>>
>> Mail : linrunner@gmx.net
>>
>> Web  : https://linrunner.de/tlp
>>
>>
>> On 13.04.21 10:05, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 4/9/21 8:33 PM, Thomas Koch wrote:
>>>> Hi,
>>>>
>>>> On 08.04.21 15:51, Sebastian Reichel wrote:
>>>>
>>>>> IIUIC you have 'force_discharge', which basically means the system
>>>>> is running from battery power despite an AC adapter being connected
>>>>> and 'inhibit_discharge', which inhibits charging, so system does not
>>>>> charge battery when AC is connected, but uses AC to supply itself
>>>>> (so battery is idle)?
>>>>>
>>>>> We already have this kind of features on embedded systems (which
>>>>> often provide all kind of charger details). Those drivers solve
>>>>> this by having a writable 'status' property in the charger device:
>>>>>
>>>>> What:           /sys/class/power_supply/<supply_name>/status
>>>>> Date:           May 2007
>>>>> Contact:        linux-pm@vger.kernel.org
>>>>> Description:
>>>>>                   Represents the charging status of the battery. Normally this
>>>>>                   is read-only reporting although for some supplies this can be
>>>>>                   used to enable/disable charging to the battery.
>>>>>
>>>>>                   Access: Read, Write
>>>>>
>>>>>                   Valid values:
>>>>>                                 "Unknown", "Charging", "Discharging",
>>>>>                                 "Not charging", "Full"
>>>>>
>>>>> If I do not miss anything writing "Discharging" is the same as forced
>>>>> discharge and "Not Charging" (AKA Idle) is the same as your inhibit feature.
>>>>
>>>> There are ThinkPads with two batteries (BAT0, BAT1) and the hardware
>>>> allows to select which one to discharge. An approach through
>>>> /sys/class/power_supply/AC/status won't cover this.
>>>
>>> The mentioned status strings come from /sys/class/power_supply/VAT#/status,
>>> rather then from /sys/class/power_supply/AC/status.
>>>
>>> There is one problem though, which is that the status attribute is being
>>> managed by drivers/acpi/battery.c. There is infra for a driver like
>>> the thinkpad_apci driver to add new attributes to a power_supply but
>>> AFAIK there is no infra to say intercept writes to an attribute where
>>> the reading is handled by another driver.
>>>
>>> I guess we could add some special hook to allow another driver to
>>> intercept status writes.
>>>
>>> Sebastian, what is your take on this ?
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>
> 

