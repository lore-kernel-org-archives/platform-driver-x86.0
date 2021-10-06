Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360E3C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 15:27:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1589761019
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Oct 2021 15:27:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238124AbhJFP3T (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Oct 2021 11:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44811 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231671AbhJFP3S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Oct 2021 11:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633534046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CQJVG/EGfE2G57NymaxMKQIMPNI/sV59x/LAV/vdHp8=;
        b=hHSmqPHsAE/sn64u9ENUWr2DgtbnsSmckSZ+qhJDeVCeaN/kSBjUYxQyCbu2Dgsp38RUFQ
        zY3pbYMkJDwCOu7XEkQM2tDGkmZjBSZQ4mfXdeBAJPTQUmz/zjk5XA9z4E8d5JDDeUl4UI
        23k0uc0t0DD7ga1edQCUwysS2k2/GMw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-yhpqSreDPJ6dipfzGADD2w-1; Wed, 06 Oct 2021 11:27:25 -0400
X-MC-Unique: yhpqSreDPJ6dipfzGADD2w-1
Received: by mail-ed1-f70.google.com with SMTP id c8-20020a50d648000000b003daa53c7518so2928391edj.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Oct 2021 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CQJVG/EGfE2G57NymaxMKQIMPNI/sV59x/LAV/vdHp8=;
        b=Ig17AFJ2KhFQOGT331BKE6/QxJH19FQhTvMCPAjkZmtkYzXLpjIjoCJT3PD0yMWe+1
         RasKG7VZLhbXY9QxuGpbCn7HnpomEPuqq4o7HMoOB0aCGK7bns8VarTsnOZeif2ndydL
         piq/pRQvRrRMAwowPAIL5JXwLYx9FJkceY6+DFRRGtL8gp+gH7canq0Q/2nzaYkGYJ9g
         J/WjFIcOAbPgzmK81kqDlwp5LIUsTHcgbKLAdRvZsYwyIQ3JImng1mAwWrlh62pEvdx8
         771oD2ZDJlcyQpfInmOQ+KZKtHNmq2l6ZBhwJslqODP/N9a7yfXg/q7WrbkP+2pO7c9H
         KOAA==
X-Gm-Message-State: AOAM533ZHoxQ3OF/u0YcQIleEiXy6lhj/noQoJu5lYRtfeQ3UZ+2ti6x
        CEO+zBSkmF0413od0fS7+o45ZUgFWPmIFOnGH6onIXExk3l6T3YsbQIpjobuAmy7wyi9frc1RmP
        C0sm9QXfjfLypRmqpmUPf4xV9hvMTRMfAFg==
X-Received: by 2002:a17:906:154c:: with SMTP id c12mr34643353ejd.76.1633534044133;
        Wed, 06 Oct 2021 08:27:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj728KC6yVTbMjGm5m87qqw9jueUSC51MSImhgYlPs/wpf03ShkwTSo5RDuYe5L3zxqV3skA==
X-Received: by 2002:a17:906:154c:: with SMTP id c12mr34643333ejd.76.1633534043964;
        Wed, 06 Oct 2021 08:27:23 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p23sm10883249edw.94.2021.10.06.08.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 08:27:23 -0700 (PDT)
Subject: Re: [RFC] add standardized attributes for force_discharge and
 inhibit_charge
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@weissschuh.net>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
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
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <04693bb2-9fd1-59fa-4c21-99848e8aa4c4@redhat.com>
Date:   Wed, 6 Oct 2021 17:27:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f2e99c38-2e2f-4777-8318-fb4dae6e8bf1@t-8ch.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/6/21 4:49 PM, Thomas Weißschuh wrote:
> On 2021-10-06T10:10+0200, Hans de Goede wrote:
>> Hi,
>>
>> On 10/6/21 12:06 AM, Sebastian Reichel wrote:
>>> Hi,
>>>
>>> On Tue, Oct 05, 2021 at 08:01:12PM +0200, Hans de Goede wrote:
>>>> Right, force-discharge automatically implies charging is
>>>> being inhibited, so putting this in one file makes sense.
>>>>
>>>> Any suggestion for the name of the file?
>>>
>>> Maybe like this?
>>>
>>> ---------------------------------------------------------------------
>>> What: /sys/class/power_supply/<supply_name>/charge_behaviour
>>> Date: October 2021
>>> Contact: linux-pm@vger.kernel.org
>>> Description:
>>>  Configure battery behaviour when a charger is being connected.
>>>
>>>  Access: Read, Write
>>>
>>>  Valid values:
>>>
>>>  0: auto / no override
>>>     When charger is connected battery should be charged
>>>  1: force idle
>>>     When charger is connected the battery should neither be charged
>>>     nor discharged.
>>>  2: force discharge
>>>     When charger is connected the battery should be discharged
>>>     anyways.
>>> ---------------------------------------------------------------------
>>
>> That looks good to me. Although I just realized that some hw may
>> only support 1. or 2. maybe explicitly document this and that
>> EOPNOTSUPP will be reported when the value is not supported
>> (vs EINVAL for plain invalid values) ?
> 
> Would that not force a userspace applications to offer all possibilities to
> the user only to tell them that it's not supported?
> If the driver knows what is supported and what not it should make this
> discoverable without actually performing the operation.
> 
> Maybe something along the lines of /sys/power/mem_sleep.

Good point, but something like /sys/power/mem_sleep works
very differently then how all the other power_supply properties work.

In general if something is supported or not on a psy class
device is communicated by the presence / absence of attributes.

So I think we should move back to having 2 separate attributes
for this after all; and group the 2 together in the doc and
document that enabling (setting to 1) one of force_charge /
inhibit_charge automatically clears the setting of the other.

Then the availability of the features can simply be probed
by checking for the presence of the property files.

Regards,

Hans

