Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F002C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 15:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63F1661186
	for <platform-driver-x86@archiver.kernel.org>; Mon,  8 Nov 2021 15:57:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241114AbhKHQAe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 8 Nov 2021 11:00:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33738 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241109AbhKHQAc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 11:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636387067;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8KYz763bboOxbMn20cIS2HzETWIJmR4WwhBPXCqWbVg=;
        b=AtmVuMh0zrIyoQYuerGxzyQJFJ4lBFfUkq2g6rhqHWfVzeMmu1H42avDVasQDMDnfUc5Q4
        If8yJlm/1NZqGe1A9ZGm/oA6QYAc0Ue5sJaUD1wvAr2tDu7QAqkx5licJGsFRz02miFDwG
        uRHqXJ4QaWF7bOQxtfG68keNY1PhxD8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-XaxtAtkKNlSn291ZSVf9iw-1; Mon, 08 Nov 2021 10:57:46 -0500
X-MC-Unique: XaxtAtkKNlSn291ZSVf9iw-1
Received: by mail-ed1-f70.google.com with SMTP id v9-20020a50d849000000b003dcb31eabaaso15308010edj.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Nov 2021 07:57:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8KYz763bboOxbMn20cIS2HzETWIJmR4WwhBPXCqWbVg=;
        b=sl9zrkjL+SYiPSPrdqvF19NzRPzJxbnBOKVWYHQZPxofIZNmbbWq4hH6qCr8TWn8e1
         geq54DlepTiMcchHKi1GK6gd/8tv5LH6iRofdo7zfFEfnJ/gHsXS8e3lfu5dcTbfZriR
         6FPWdshC/pRXIvp6+Vn44TktHXDSJvibcC/JWa+zr8I0kuOBFOYbJqjHNyQpq2HsO5Vu
         ANhjlyhD9wsY8xJj3h2SFxYWN9K7apbk67cCM8ls7HlH1KtXEzsrymRVmtOI5F0iupb0
         FdgjIKyDirljSCImioPKOtdgColRrYmKlykCNBUmMVXL6TeThEHPZwHmOogwMDLmbJCL
         p2Vw==
X-Gm-Message-State: AOAM530FSWDHw6+rW4xDkHqDmH1KPl6/GsaGztSi/zaI1Txc8zA+Ybsp
        PGxKvRxkzp1Hlw2JDeI7QsWIyK7HkVBC0xAEApywNR2aO6SCkBlsuEDAcwF0c0wHIpPhWaO8Iqh
        +Z+9d/DBw1dHoe/UOTMjKT1oZa+Yg7BEo4Q==
X-Received: by 2002:a17:907:8a12:: with SMTP id sc18mr430349ejc.274.1636387065481;
        Mon, 08 Nov 2021 07:57:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxf0iOhJfjaTSwaGCcG/REySSi4fRJPc4StH7NfD4KKXRYX4Nljlyh8cUTGdYWEErdHWc5rDg==
X-Received: by 2002:a17:907:8a12:: with SMTP id sc18mr430325ejc.274.1636387065338;
        Mon, 08 Nov 2021 07:57:45 -0800 (PST)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id e20sm9389142edv.64.2021.11.08.07.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 07:57:44 -0800 (PST)
Message-ID: <10c9d774-dcae-e80d-e6fa-235410658b84@redhat.com>
Date:   Mon, 8 Nov 2021 16:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 06/13] power: supply: bq25890: Add support for skipping
 initialization
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>
References: <20211030182813.116672-1-hdegoede@redhat.com>
 <20211030182813.116672-7-hdegoede@redhat.com>
 <CAHp75VeO60umiJTAbL+nR==4pP0KkKQQ71yFNdK2SAkJ0rRXug@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VeO60umiJTAbL+nR==4pP0KkKQQ71yFNdK2SAkJ0rRXug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/31/21 00:07, Andy Shevchenko wrote:
> On Sat, Oct 30, 2021 at 9:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> On most X86/ACPI devices there is no devicetree to supply the necessary
>> init-data. Instead the firmware already fully initializes the bq25890
>> charger at boot.
>>
>> At support for a new "ti,skip-init" boolean property to support this.
>> So far this new property is only used on X86/ACPI (non devicetree) devs,
>> IOW it is not used in actual devicetree files. The devicetree-bindings
>> maintainers have requested properties like these to not be added to the
>> devicetree-bindings, so the new property is deliberately not added
>> to the existing devicetree-bindings.
> 
> With 'ti,' prefix it can be a potential collision in name space, for
> internal properties I would rather use 'linux,' one.

Good point, changed for v2.

> ...
> 
>> +       init->write_cfg = !device_property_read_bool(bq->dev, "ti,skip-init");
>> +       if (!init->write_cfg)
>> +               return 0;
> 
> Why to have double negation here?
> I would rather expect that you will have direct value in the structure
> and do a respective check in the functions.

Because in all places except this one we want to know if we need to
write the cfg to the device, removing the double negation here would
mean adding negation to a init->skip_init check in many places, so this
is cleaner.

Regards,

Hans

