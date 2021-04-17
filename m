Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F075DC433ED
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Apr 2021 17:03:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFEA7610C7
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Apr 2021 17:03:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236761AbhDQREE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Apr 2021 13:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37021 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236739AbhDQREE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Apr 2021 13:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618679017;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HA86vN1KB54EUxxAJpGGsDBsNSUUGfGfsoLbGMz+0+4=;
        b=MYxH9wpIVgwcU2FW3oTKBnBID+506no2PxGdyB8sWZo7EL07J4c71SSq00HHtg2L6nY9YN
        /U2/GSxtr/hgWGSE421JiBOLl2kPwqIOHR35JyfxxbVE0AlxJZH/aVvAoXZlnQ4wiFxlZb
        1hWfzS/zvPpLn/YE+cO1TP9Q0t8zw9g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-mA5jX0ZbMxahOy1APpBf-g-1; Sat, 17 Apr 2021 13:03:33 -0400
X-MC-Unique: mA5jX0ZbMxahOy1APpBf-g-1
Received: by mail-ed1-f72.google.com with SMTP id y10-20020a50f1ca0000b0290382d654f75eso8848078edl.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Apr 2021 10:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HA86vN1KB54EUxxAJpGGsDBsNSUUGfGfsoLbGMz+0+4=;
        b=JL71j+6QsRgDrBMgJaJCnyBYNQraHXu3yYN4RpXv3bIhU+KR+2BoNqb0dAsIGJ0qHd
         INbXg9vY7Ax/WbvNMRGz9xRuPIPv45nAxoHyrU22IuYRn3jg8XF0pvgwUHW8hsqT8iFb
         uK0NefvmfTsd6ZxsjObPDt6FleVMiQ29tqyS57BroDjI7lSl2KOjP6Y2E6xe90Ld1gLz
         Dbi2OeAIZBCSTgoiq882ft2nRIaI4Mji6FQsEUfT2ajTOg80WiDPLypgwpeQ9lYyCsu/
         g33AxQ7v3qL8NA7dSqhD2tdI8/cq6aFlV1iMK4LYjzh/EluvaFu+4V4EVL13iwH3tJQR
         22lA==
X-Gm-Message-State: AOAM532nT9eqEaS5nnCKkbeDc1qfc4IARI/vV3ClENkWHdja09qd1TCz
        GrGIJvheaa/we2ky+uCHBjVYrYTtiTH7+XylCbun3q4QCJjFNiHQ2LfPMqCQnG9hOujlfzc4BZp
        vLRk4RQoPGDozxMEdVeM7Q7+ahv1dNGjgHA==
X-Received: by 2002:a05:6402:408:: with SMTP id q8mr16218528edv.201.1618679012590;
        Sat, 17 Apr 2021 10:03:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnbKQ1jO3IY9shTsVGbE+jgHOp2Yxgc8K/YNGU6ZZU+HbN5HYIOQ9Q2uQjUYfAYBAH45IsRg==
X-Received: by 2002:a05:6402:408:: with SMTP id q8mr16218515edv.201.1618679012421;
        Sat, 17 Apr 2021 10:03:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bw14sm6620963ejb.89.2021.04.17.10.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Apr 2021 10:03:32 -0700 (PDT)
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Thomas Koch <linrunner@gmx.net>, Sebastian Reichel <sre@kernel.org>
Cc:     Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8255aa89-fe3b-1de2-0195-a818795b7d32@redhat.com>
Date:   Sat, 17 Apr 2021 19:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a2d850e9-789d-54e8-e098-1a0829504031@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Thomas,

On 4/17/21 1:49 PM, Thomas Koch wrote:
> Hi Hans,
> 
> from a userspace perspective, I don't think it's optimal to combine the
> two features and the status. For example, how do I find out which one is
> available?
> 
> I have to test the writability of status and then still don't know which
> one is available. Seeing if force_discharge or inhibit_charge are there
> is much simpler.
> 
> And then enabling that: triggering force_discharge by writing
> "Discharging" is ok. But for inhibit_charge we would need a new status,
> something like "Charging inhibited". This then causes problems for the
> existing userspace, says: upowerd could not handle it. You remember the
> "Not charging" patch from Ognen?

I think you have valid points both wrt the discoverability of the
feature availability, as well as about a "Charging inhibited" status
value possibly (likely) causing problems for userspace.

With that said, you really need to discuss this with Sebastian. I'm fine
with the thinkpad_acpi patches, but as I already said I want to avoid
in essence defining new power_supply class userspace API inside
drivers/platform/x86 .  Last time we did that it ended poorly and more
in general it is a bad idea.

So you first need to agree on a set of power_supply class sysfs attributes
for this and document those in the power_supply class docs, before I can
merge the thinkpad_acpi patches.

And the agreeing on and documenting is something which you need to discuss
with Sebastian (the power_supply maintainer).

Regards,

Hans



> -- 
> 
> Freundliche Grüße / Kind regards,
> 
> Thomas Koch
> 
> 
> 
> Mail : linrunner@gmx.net
> 
> Web  : https://linrunner.de/tlp
> 
> 
> On 13.04.21 10:05, Hans de Goede wrote:
>> Hi,
>>
>> On 4/9/21 8:33 PM, Thomas Koch wrote:
>>> Hi,
>>>
>>> On 08.04.21 15:51, Sebastian Reichel wrote:
>>>
>>>> IIUIC you have 'force_discharge', which basically means the system
>>>> is running from battery power despite an AC adapter being connected
>>>> and 'inhibit_discharge', which inhibits charging, so system does not
>>>> charge battery when AC is connected, but uses AC to supply itself
>>>> (so battery is idle)?
>>>>
>>>> We already have this kind of features on embedded systems (which
>>>> often provide all kind of charger details). Those drivers solve
>>>> this by having a writable 'status' property in the charger device:
>>>>
>>>> What:           /sys/class/power_supply/<supply_name>/status
>>>> Date:           May 2007
>>>> Contact:        linux-pm@vger.kernel.org
>>>> Description:
>>>>                   Represents the charging status of the battery. Normally this
>>>>                   is read-only reporting although for some supplies this can be
>>>>                   used to enable/disable charging to the battery.
>>>>
>>>>                   Access: Read, Write
>>>>
>>>>                   Valid values:
>>>>                                 "Unknown", "Charging", "Discharging",
>>>>                                 "Not charging", "Full"
>>>>
>>>> If I do not miss anything writing "Discharging" is the same as forced
>>>> discharge and "Not Charging" (AKA Idle) is the same as your inhibit feature.
>>>
>>> There are ThinkPads with two batteries (BAT0, BAT1) and the hardware
>>> allows to select which one to discharge. An approach through
>>> /sys/class/power_supply/AC/status won't cover this.
>>
>> The mentioned status strings come from /sys/class/power_supply/VAT#/status,
>> rather then from /sys/class/power_supply/AC/status.
>>
>> There is one problem though, which is that the status attribute is being
>> managed by drivers/acpi/battery.c. There is infra for a driver like
>> the thinkpad_apci driver to add new attributes to a power_supply but
>> AFAIK there is no infra to say intercept writes to an attribute where
>> the reading is handled by another driver.
>>
>> I guess we could add some special hook to allow another driver to
>> intercept status writes.
>>
>> Sebastian, what is your take on this ?
>>
>> Regards,
>>
>> Hans
>>
> 

