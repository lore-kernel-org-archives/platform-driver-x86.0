Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DE4C433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 08:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 720F9613A9
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Apr 2021 08:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhDMIFk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Apr 2021 04:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36730 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231156AbhDMIFj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Apr 2021 04:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618301119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KglXJ2s3CjM9H+7jc+UvO06PYoReXEKcM3rEGVXGoCc=;
        b=LvEiZtwtF46m9SOLFw8BAaM+xkKHnfMKCzPZihiFUPjY1O2OZ4SyS0vZWKYYaGsunuZzG3
        G4r1n4mG4BAAyLtZqqNN1ir/8s9pkixIjdQjw+J7myIp8LidvRPnBMvJOTCYXisCPcZMm4
        sPCuC2oFI3AJQtLko5BcVzwKny/J2Cg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-nDhOUHHNML6YI5BLilg8BQ-1; Tue, 13 Apr 2021 04:05:15 -0400
X-MC-Unique: nDhOUHHNML6YI5BLilg8BQ-1
Received: by mail-ed1-f70.google.com with SMTP id k20-20020aa7d2d40000b0290382b9d237d6so848126edr.17
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Apr 2021 01:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KglXJ2s3CjM9H+7jc+UvO06PYoReXEKcM3rEGVXGoCc=;
        b=N8+vRqAH6uofYxJJ71/KDeBIJqRW6Aa2LFHPGC7lHG+FFetfhrjj9OMpYsi2iPZ1Lz
         P6HmnibBsJ5+7xDKEuPbpdm5SEkjuvGBNuDIM52BUdWuwfl3ZhDxqGt+BP8ji55gJBDe
         cZRARcbjILVFbQsr9SvPUTKNF6xwtH3/YTCKC54CdId2mqPkLo+Ab6hRtaH1TeTlt+Zm
         eztSJ4GzkRAh1XY5WJmQO9FtHV8aJlbHaf9exS4Lil8CbsD3iY8vorbQiY5IlnbEBVib
         s0RDv8AG/OUFm05GLn2llXIcxb+FWqu+g9zFdWrKNEXCvNkjs2vWzP3qqFMOGcUB6GUl
         uIuw==
X-Gm-Message-State: AOAM533FzI5y2ctuIb2q/3XLewCQaiE58hEWAeDaHnW3qRGIXXdsKJTx
        bfbD1uILYwguq4jpX/OMqUvqyp2hz/S3uPH0VjC+Mlh2CZrUiW1q+VARroNu7Gg2PXHYcfzuKZV
        NlKe+sJuEtjROyEPokQA6+zMUM7QwgcRN5w==
X-Received: by 2002:a05:6402:882:: with SMTP id e2mr33473194edy.358.1618301114401;
        Tue, 13 Apr 2021 01:05:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+xuVfiw77VA/asAV//nx+CBs0JJ7n2jnGasCbf9+L6Q/GoSAxcIuWiCYgDh/R0XeFvzCcCQ==
X-Received: by 2002:a05:6402:882:: with SMTP id e2mr33473175edy.358.1618301114151;
        Tue, 13 Apr 2021 01:05:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p19sm8784537edx.44.2021.04.13.01.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 01:05:13 -0700 (PDT)
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     Thomas Koch <linrunner@gmx.net>,
        Sebastian Reichel <sre@kernel.org>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Nicolo' Piazzalunga <nicolopiazzalunga@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        "jwrdegoede@fedoraproject.org" <jwrdegoede@fedoraproject.org>,
        "smclt30p@gmail.com" <smclt30p@gmail.com>
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <3anWBvkrPqTNQyfx2ZwDaLZKXtw5PMwTTdcgGNt0FaACUSsrkb5PaoqVKxLpxXU-4NcVZ9AqDQLs2VMOmvS-KfxHRmOSQiZlMjyvH282mdQ=@protonmail.com>
 <20210408135102.6r2przibgngaavkp@earth.universe>
 <39c3436a-a08d-9530-3215-854148215312@gmx.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6f58903f-5219-9aff-78ca-33687e2e4147@redhat.com>
Date:   Tue, 13 Apr 2021 10:05:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <39c3436a-a08d-9530-3215-854148215312@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/9/21 8:33 PM, Thomas Koch wrote:
> Hi,
> 
> On 08.04.21 15:51, Sebastian Reichel wrote:
> 
>> IIUIC you have 'force_discharge', which basically means the system
>> is running from battery power despite an AC adapter being connected
>> and 'inhibit_discharge', which inhibits charging, so system does not
>> charge battery when AC is connected, but uses AC to supply itself
>> (so battery is idle)?
>>
>> We already have this kind of features on embedded systems (which
>> often provide all kind of charger details). Those drivers solve
>> this by having a writable 'status' property in the charger device:
>>
>> What:           /sys/class/power_supply/<supply_name>/status
>> Date:           May 2007
>> Contact:        linux-pm@vger.kernel.org
>> Description:
>>                  Represents the charging status of the battery. Normally this
>>                  is read-only reporting although for some supplies this can be
>>                  used to enable/disable charging to the battery.
>>
>>                  Access: Read, Write
>>
>>                  Valid values:
>>                                "Unknown", "Charging", "Discharging",
>>                                "Not charging", "Full"
>>
>> If I do not miss anything writing "Discharging" is the same as forced
>> discharge and "Not Charging" (AKA Idle) is the same as your inhibit feature.
> 
> There are ThinkPads with two batteries (BAT0, BAT1) and the hardware
> allows to select which one to discharge. An approach through
> /sys/class/power_supply/AC/status won't cover this.

The mentioned status strings come from /sys/class/power_supply/VAT#/status,
rather then from /sys/class/power_supply/AC/status.

There is one problem though, which is that the status attribute is being
managed by drivers/acpi/battery.c. There is infra for a driver like
the thinkpad_apci driver to add new attributes to a power_supply but
AFAIK there is no infra to say intercept writes to an attribute where
the reading is handled by another driver.

I guess we could add some special hook to allow another driver to
intercept status writes.

Sebastian, what is your take on this ?

Regards,

Hans

