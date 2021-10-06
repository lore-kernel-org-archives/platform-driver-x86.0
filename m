Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D18C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 17:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B38F6113A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 17:48:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhJFRuC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Oct 2021 13:50:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37110 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231175AbhJFRuB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Oct 2021 13:50:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633542481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6j4+Xt6RpIbX4FowUUGkrRWBkKZagwkWSmArQSXoKdA=;
        b=CTwVAOxhuDwowoUuBDiITBAknUmKoBLQt/zSxn6pw11roM/QCtJ9ZBtucwvZkyccreHXNJ
        LOHrmmCL5dEFfA+PwSPNk/XVFhCHtzVbClxNnPsRMt8N+YCmOcUT85m2E8C+ayFuoT4E7m
        aYcJEjWKDTbArBi6WRTgm2Ed9yPptuk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-bODpqOIFPEWmm2kkEmPzNg-1; Wed, 06 Oct 2021 13:48:00 -0400
X-MC-Unique: bODpqOIFPEWmm2kkEmPzNg-1
Received: by mail-ed1-f70.google.com with SMTP id x5-20020a50f185000000b003db0f796903so3327221edl.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Oct 2021 10:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6j4+Xt6RpIbX4FowUUGkrRWBkKZagwkWSmArQSXoKdA=;
        b=lpqk7mFx+oDQEG75R5xYjGxMuRA5K2d0F0w3TuUADURMyb8c6fZBldFrTMNykklEYL
         nh/VCtg/j5P3iXkArTI9OHUQ4FcjLrRl74VDNXXT07hpIT7QmXWo9c8I5dwEEm4kuyu4
         PjHciriPnhQCXPxVvh+PWxVJXiVzof/0xcX7d4JgZKq0UFW0Z6ntx/v5s856r8m3UGbP
         oWAxrR0bTZuOpxjN6AHgFRKYBVThbV4rLDTy/4s8GV2n9KPX16o1lKvsIDpSi57W0V6a
         5MLRLlnJQwN5L/QWBZLq23aiyzSev6Srah3w+xLgMwTTyLMXTNSN6+rQe7ADEuYwQ8Bj
         L4yw==
X-Gm-Message-State: AOAM532f4zYbRzqWOHd4PsyB37gh8dVPBxW5O13G1vkAJFCMTieU6ZXa
        2kaNisY+E3p8c8QtoFx6MPBdPy0KUMVYn7v++st1MsovXksVv+Sp7EhP+Sg+HZ4lyB4tjl7C6l8
        3/7tmbPfaW8XI3glBuamKd0nFKYDqmHbFxQ==
X-Received: by 2002:a50:9d85:: with SMTP id w5mr36624323ede.268.1633542478948;
        Wed, 06 Oct 2021 10:47:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwATAdTz3nytwMI5gTjXzrrWW+VAEE83Mq4iiRAF2QQu2kZs8Tzpe+h4aHhKNu9r1mVDpWyXg==
X-Received: by 2002:a50:9d85:: with SMTP id w5mr36624294ede.268.1633542478755;
        Wed, 06 Oct 2021 10:47:58 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p10sm4750427ejf.45.2021.10.06.10.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 10:47:43 -0700 (PDT)
Subject: Re: [RFC] add standardized attributes for force_discharge and
 inhibit_charge
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@weissschuh.net>,
        =?UTF-8?Q?Nicol=c3=b2_Piazzalunga?= <nicolopiazzalunga@gmail.com>,
        linux-pm@vger.kernel.org,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Thomas Koch <linrunner@gmx.net>,
        "smclt30p@gmail.com" <smclt30p@gmail.com>
References: <21569a89-8303-8573-05fb-c2fec29983d1@gmail.com>
 <77e39b3e-fa51-54fe-1898-4f43895ac2c6@redhat.com>
 <20211005162352.emaoveimhkp5uzfw@earth.universe>
 <06fa7a23-4dec-cba9-4e00-c00cf0bf9337@redhat.com>
 <20211005220630.zurfqyva44idnplu@earth.universe>
 <8cbf7671-d9ee-6bfc-d8fd-d360ccb2c595@redhat.com>
 <f2e99c38-2e2f-4777-8318-fb4dae6e8bf1@t-8ch.de>
 <04693bb2-9fd1-59fa-4c21-99848e8aa4c4@redhat.com>
 <20211006162834.ujxfcn7jjrdl4kjx@earth.universe>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9ec694b7-48a9-5d86-0970-daefdf204712@redhat.com>
Date:   Wed, 6 Oct 2021 19:47:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211006162834.ujxfcn7jjrdl4kjx@earth.universe>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/6/21 6:28 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Oct 06, 2021 at 05:27:22PM +0200, Hans de Goede wrote:
>> On 10/6/21 4:49 PM, Thomas Weißschuh wrote:
>>> On 2021-10-06T10:10+0200, Hans de Goede wrote:
>>>> On 10/6/21 12:06 AM, Sebastian Reichel wrote:
>>>>> On Tue, Oct 05, 2021 at 08:01:12PM +0200, Hans de Goede wrote:
>>>>>> Right, force-discharge automatically implies charging is
>>>>>> being inhibited, so putting this in one file makes sense.
>>>>>>
>>>>>> Any suggestion for the name of the file?
>>>>>
>>>>> Maybe like this?
>>>>>
>>>>> ---------------------------------------------------------------------
>>>>> What: /sys/class/power_supply/<supply_name>/charge_behaviour
>>>>> Date: October 2021
>>>>> Contact: linux-pm@vger.kernel.org
>>>>> Description:
>>>>>  Configure battery behaviour when a charger is being connected.
>>>>>
>>>>>  Access: Read, Write
>>>>>
>>>>>  Valid values:
>>>>>
>>>>>  0: auto / no override
>>>>>     When charger is connected battery should be charged
>>>>>  1: force idle
>>>>>     When charger is connected the battery should neither be charged
>>>>>     nor discharged.
>>>>>  2: force discharge
>>>>>     When charger is connected the battery should be discharged
>>>>>     anyways.
>>>>> ---------------------------------------------------------------------
>>>>
>>>> That looks good to me. Although I just realized that some hw may
>>>> only support 1. or 2. maybe explicitly document this and that
>>>> EOPNOTSUPP will be reported when the value is not supported
>>>> (vs EINVAL for plain invalid values) ?
>>>
>>> Would that not force a userspace applications to offer all possibilities to
>>> the user only to tell them that it's not supported?
>>> If the driver knows what is supported and what not it should make this
>>> discoverable without actually performing the operation.
>>>
>>> Maybe something along the lines of /sys/power/mem_sleep.
>>
>> Good point, but something like /sys/power/mem_sleep works
>> very differently then how all the other power_supply properties work.
> 
> Actually we already use this format in power-supply for USB
> types, implemented in power_supply_show_usb_type().
> 
>> In general if something is supported or not on a psy class
>> device is communicated by the presence / absence of attributes.
>>
>> So I think we should move back to having 2 separate attributes
>> for this after all; and group the 2 together in the doc and
>> document that enabling (setting to 1) one of force_charge /
>> inhibit_charge automatically clears the setting of the other.
>>
>> Then the availability of the features can simply be probed
>> by checking for the presence of the property files.
> 
> If it's two files, then somebody needs to come up with proper 
> names. Things like 'force_discharge' look sensible in this context,
> but on a system with two batteries (like some Thinkpads have) it
> is easy to confuse with "I want to discharge this battery before
> the other one (while no AC is connected)".

Ah I did not realize there was already some (read-only) precedence
for this in the psy subsystem.

Since there is precedence for this using
/sys/class/power_supply/<supply_name>/charge_behaviour

with an example contents of say:

[auto] inhibit-charge force-discharge

Works for me and having 1 file instead of 2 is better then
because this clearly encapsulates that inhibit-charge and
force-discharge are mutually exclusive.

Regards,

Hans


