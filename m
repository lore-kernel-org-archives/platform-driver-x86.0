Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87864C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 19:16:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AAD361053
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 19:16:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbhKATTP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Nov 2021 15:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52165 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232469AbhKATTO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 15:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635794200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vPxF4UHOaFrwq4ubL6S9n5LY4w6t78aRQ2QSJla2WzE=;
        b=iHQc0ylCsYQHM/YZ7Inan+C4Pk4Fnbh5MG1f3xQEYDQvhBsF4lSefP5cyYx0KPI4IOyyR2
        XK7eQXFkfEjjFgldYSav7JiocdeWItKBlookSjnmvotZENYOKIhpLZ8iaoTc59Er3ZQGoy
        KGLL3G4i6nrTqS7GF2daqNeccs23gY4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-HRMHFV9HMcimybSG_V9_gw-1; Mon, 01 Nov 2021 15:16:39 -0400
X-MC-Unique: HRMHFV9HMcimybSG_V9_gw-1
Received: by mail-ed1-f70.google.com with SMTP id w11-20020a05640234cb00b003e0cd525777so11803158edc.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Nov 2021 12:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vPxF4UHOaFrwq4ubL6S9n5LY4w6t78aRQ2QSJla2WzE=;
        b=NfiYUHXO6hd4oTk3vt3uOgXurF3+EWC6VAY68z3+ll/nTnf20cXxr5vBIe6sskNYUi
         dpbZ8GcRlc2v3xulxQODwTcwn2DulgThSGTyZuYezj5EIF4YD7TrrvVlRrw6lOe/5eXi
         +9Kpc8WQVlKLhUTbip5NCZDTawTK4f5JRO5NAqtd5c6cFp8mAhu4ws6L97gNxj148NrC
         5WNGE+ME6yVBPkrlBp4ZC3/LSgzGbbgGr2Z+3RsYcjWx1yf/ElnIfrE19HVLjiGWOvAq
         CgriUa+5RF/PU3N1F4ixgNcIdtxouG69MGkZ3dcHEs1Rjfdyl+Ua0hKe5wlBMhrrymkw
         2wSA==
X-Gm-Message-State: AOAM533CPLCJA8ujWk5bodpvZOxkuSs/oV8XOAHr6wl2ijaF9tHxnNUC
        0DnWYcgVnl6VPywq7TcqvCRcS1eC2q9X26RP26vNqfs/T5i5iJIUjrViroVheopTkzqsv8i1lY0
        8P8tgFDBccH4U3vnt2bQlbtBTuoDMJ59UHA==
X-Received: by 2002:a17:906:9acb:: with SMTP id ah11mr31873289ejc.305.1635794198470;
        Mon, 01 Nov 2021 12:16:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqRGooy6XZA1Y8t1ql0dlnn+gjO+gI4KXUs5ozQ5VUAaxbAmo9oSU5aRgIi+dcO44lXRA7hQ==
X-Received: by 2002:a17:906:9acb:: with SMTP id ah11mr31873261ejc.305.1635794198319;
        Mon, 01 Nov 2021 12:16:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id h10sm9331056edf.85.2021.11.01.12.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 12:16:37 -0700 (PDT)
Message-ID: <b3f0d3fe-8038-626e-a68c-b818e6de69da@redhat.com>
Date:   Mon, 1 Nov 2021 20:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC 3/5] gpiolib: acpi: Add a new "ignore" module option
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>
References: <20211031162428.22368-1-hdegoede@redhat.com>
 <20211031162428.22368-4-hdegoede@redhat.com>
 <CAHp75Vf-EOfF_XfqfWFQZNLp3B03o79xHf4bUrf9x9D9pTrvgw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf-EOfF_XfqfWFQZNLp3B03o79xHf4bUrf9x9D9pTrvgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/31/21 20:59, Andy Shevchenko wrote:
> On Sun, Oct 31, 2021 at 6:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add a new "ignore" module option to completely ignore controller@pin combos
>> from _AEI lists.
>>
>> And add a DMI quirk to ignore the interrupt of the BQ27520 fuel-gauge IC
>> on the Xiaomi Mi Pad 2. On this device we use native charger + fuel-gauge
>> drivers because of issues with the ACPI battery implementation. The _AEI
>> listing of the fuel-gauge IRQ is intended for use with the unused ACPI
>> battery implementation and is blocking the bq27xxx fuel-gauge driver
>> from binding.
> 
> I'm wondering if the idea behind this is something relative to
> https://elixir.bootlin.com/linux/latest/source/drivers/acpi/sysfs.c

The idea indeed is similar, but there is only one set of GPEs and
the GPIO pin-namespace is per GPIO controller, hence the
controller-name@pin format used, which is also used for the
already existing ignore_wake gpiolib-acpi.c module option and
the patches re-use the existing parsing code.

But since there seems to be agreement that using a board-file to
work around the DSDT deficiencies is the best option this patch
will no longer be needed. It is probably still good to keep it
archived somewhere in case the functionality turns out to be
useful on some other device(s).

Regards,

Hans

