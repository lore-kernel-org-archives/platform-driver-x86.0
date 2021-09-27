Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B392DC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 15:12:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98F926101A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Sep 2021 15:12:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234997AbhI0PN4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Sep 2021 11:13:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23351 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234976AbhI0PN4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Sep 2021 11:13:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632755538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XhD1/p4BaUM3pdJv3O8HVKoKcLV48TiuP+XNRGL7jNk=;
        b=C5HYhUPrWp7afPm0x8loBn1qvcCjwkfft7ff9aSFPr5qMmFlkDXkGj3UYFWnTBypF0R/R6
        CgHdV/xebMwuElOWR/fYWG7/NOy/uP+yuJ6rxbdqU8VMfaKZEAfqGsuqPliZY95774cl19
        3X0zqI9XKKGMEKkgwJnnhzMJiDw9F5Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-K0a_vQ9IMoiy7WCUMf32yQ-1; Mon, 27 Sep 2021 11:12:16 -0400
X-MC-Unique: K0a_vQ9IMoiy7WCUMf32yQ-1
Received: by mail-ed1-f71.google.com with SMTP id h15-20020aa7de0f000000b003d02f9592d6so18090795edv.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Sep 2021 08:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XhD1/p4BaUM3pdJv3O8HVKoKcLV48TiuP+XNRGL7jNk=;
        b=E8Rs+uHYXhD1IytQP/nV+4z1DSgSRDpY26rvwHRUtW6I8ppmJluXqc2vexq2E+tOPH
         yoVuPS+mAbCLiSouK8EEtVf7U5lioekbckdBInJN8EBK4YuHYSJFNGzFPI3S16pxo5Do
         x0qq0dSl1YvS7w5eWAuluQRQvO288hvG2CYXj7i2e5jmFif0bVoXQL87fYFmCL4DhMal
         9e75R4iuXdbcAFjkgkkEvxlCm99tqOH+BA5uPzOsWj9kvh6zAUrnRSTTj5gNsjWd0Px8
         edBlZDAZlOq8yqPF8M0VePE9/Qpjg/b72JfH6dIk/0h+rvBYwrP3XKCWtjFXrKRD5Vos
         n8RA==
X-Gm-Message-State: AOAM533lofWCfAHNHg3jAdLuAw0NvbJyqfvY8XYHhmPpwfa+LNl/T1bW
        xmY6m0kFaWcIJa7CY9f6E3QEQVhJf54ai3ZAYdCrQkjVZeoIyp7xdWGnQ43WWHNqVWXMtxib8ZF
        iBJY5G5YsdBvPAe/b8C+V/B0MkZKx1wEWoA==
X-Received: by 2002:a50:e043:: with SMTP id g3mr465567edl.196.1632755535626;
        Mon, 27 Sep 2021 08:12:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxafCc1gvCPfwyqgKxa7R5IP3OpTT2izMK7FAe+4iT05O/UO+RUs9tdTFAgFqgPh311NeMnw==
X-Received: by 2002:a50:e043:: with SMTP id g3mr465547edl.196.1632755535495;
        Mon, 27 Sep 2021 08:12:15 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id d15sm8829754ejo.4.2021.09.27.08.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 08:12:15 -0700 (PDT)
Subject: Re: [PATCH 1/3] thinkpad_acpi: add support for force_discharge
To:     =?UTF-8?Q?Nicol=c3=b2_Piazzalunga?= <nicolopiazzalunga@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Sebastian Reichel <sre@kernel.org>
Cc:     jwrdegoede@fedoraproject.org, smclt30p@gmail.com, linrunner@gmx.net
References: <c2504700-06e9-e7d8-80f7-de90b0b6dfb5@gmail.com>
 <06f65bb5-eca4-c1ba-a8c2-b44f8a94c699@redhat.com>
 <2ea2d9b7-4a15-6aea-1aff-4e1cb80a026f@lenovo.com>
 <ac508b49-7958-3afa-25cf-416d701034e3@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ba6698de-1700-fce9-6bca-12ee577ac09b@redhat.com>
Date:   Mon, 27 Sep 2021 17:12:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ac508b49-7958-3afa-25cf-416d701034e3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Nicolò,

On 9/27/21 5:00 PM, Nicolò Piazzalunga wrote:
> Hi,
> 
> On 9/27/21 3:59 PM, Mark Pearson wrote:
>> Do let me know if there are some important use cases for these so I can go back to the FW team and discuss supporting them properly.
> 
> The important use cases are force discharge and inhibit charge.
> These at present are dealt with using tpacpi-bat, which relies on (out of tree) acpi_call.
> See also your previous reply.

I can see how those can be useful in certain circumstances.

I can also understand how Lenovo does not want these to be
available by default everywhere.

I think a good compromise would be to add a bool module option
which defaults to false to enable these.

Assuming Mark is ok with that, this is still blocked on agreeing
on standard power_supply class property names for these 2 features.

Can you perhaps write a (RFC) patch adding proposed standardized
attributes for this to:

Documentation/ABI/testing/sysfs-class-power

As well as to the enum power_supply_property {}
enum in: include/linux/power_supply.h

And to the power_supply_attrs[] array in
drivers/power/supply/power_supply_sysfs.c

?

And then send that the Sebastian Reichel with the linux-pm
and platform-driver-x86 lists in the Cc? 

Regards,

Hans

