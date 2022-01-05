Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295E0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 Jan 2022 11:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbiAELHD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 Jan 2022 06:07:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57452 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231725AbiAELHD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Jan 2022 06:07:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641380821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9YQn42TK/PmXXnEbi2UfHKtXWP1KuYWsDvofDtI4J44=;
        b=V794u6cv32xV3lakGL8epfsmd1sMAAj3Nb5jfELp44V7L5ERXmkpyC+ClltiKIOjIpA9D+
        3F8vo62P0lEU0S+n0+AcyO6MLM6z2G6ppBJ7mcodNKmUWD2xD7XX1FR+YKnXpqnwYqNtEC
        a6iA6Es1V1Fxa7aLVS6V+cyvo6gJhM4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-dB_PGwiQNT2nEQW0umbCDQ-1; Wed, 05 Jan 2022 06:07:00 -0500
X-MC-Unique: dB_PGwiQNT2nEQW0umbCDQ-1
Received: by mail-ed1-f71.google.com with SMTP id z3-20020a05640240c300b003f9154816ffso18499120edb.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Jan 2022 03:06:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9YQn42TK/PmXXnEbi2UfHKtXWP1KuYWsDvofDtI4J44=;
        b=ca4/TwtqESW6hSBwEdzAKuT49Cn21FXYG9TghqVILgB+MwnyBj+PLzyrTkKIBJyN9E
         JEUp5D9jE4FVL2Ccz0edSTMzEoQpAFZ8qMC0UHQN4LG6i48oIVImWSo3dqO4CdZVQq58
         DMir5bpTjo1M+bkQuv2rp1Wv9fNLTY7DgAXzPDjEJmY0+UTV2MisUNr8wz1pUeRG7gF+
         8NSvGRZAptZWmTm/ZMUC3A6VRwTSIJ42jGU34PsMdn+ayCyeGlzkiWHpcpWpamhi1kOV
         fB475pROQgpNk4ze4hmRUZVxH7H1khvPV/KKsd8gqd9CSybLQr983vzvvKEXvk+y47cd
         URxg==
X-Gm-Message-State: AOAM530BoB45JGgoJPnCJ3Jyi6G3rPHt73FRHHuu3rtnOfEoFO4vf773
        81cwFjFkLwcr0YCB9CSepmD42V3ezEUT3U6xlM7OS1mfIYUnnnvKO14KE4zFMDwaq2bLnGjD32A
        UGE21yrXoPX+QygGN1i+njj2JefC9yqR2ow==
X-Received: by 2002:a17:906:c788:: with SMTP id cw8mr43081701ejb.528.1641380818745;
        Wed, 05 Jan 2022 03:06:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHPmKIJ9v8ubO2ZmGo7ZJORVAr1oc0e64dBH2lrHZX6dQ+3ZA/Wvo9Flu0Nj8FMM8F7Hm4+Q==
X-Received: by 2002:a17:906:c788:: with SMTP id cw8mr43081682ejb.528.1641380818521;
        Wed, 05 Jan 2022 03:06:58 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id i13sm15621747eds.72.2022.01.05.03.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jan 2022 03:06:58 -0800 (PST)
Message-ID: <3504b30f-a63d-c0cd-00ce-38ab0089c5be@redhat.com>
Date:   Wed, 5 Jan 2022 12:06:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: Add Asus TF103C dock driver
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
References: <20211226141849.156407-1-hdegoede@redhat.com>
 <YdRokPBoYYnF+D3D@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YdRokPBoYYnF+D3D@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Thank you for the review.

On 1/4/22 16:32, Andy Shevchenko wrote:
> On Sun, Dec 26, 2021 at 03:18:49PM +0100, Hans de Goede wrote:
>> Add a driver for the keyboard, touchpad and USB port of
>> the keyboard dock for the Asus TF103C 2-in-1 tablet.
>>
>> This keyboard dock has its own I2C attached embedded controller
>> and the keyboard and touchpad are also connected over I2C,
>> instead of using the usual USB connection. This means that the
>> keyboard dock requires this special driver to function.
> 
> ...
> 
>> +MODULE_PARM_DESC(fnlock,
>> +		 "By default the kbd toprow sends multimedia key presses. AltGr "
>> +		 "can be pressed to change this to F1-F12. Set this to 1 to "
>> +		 "change the default. Press AltGr + Esc to toggle at runtime.");
> 
> I would still use long line instead of splitting.

Well the normal grepping for log messages argument does not really apply
here and making this one long line would be pretty unreadable IMHO, so I'm
going to keep this as is.

> 
> ...
> 
>> +/* Byte 0 is the length of the rest of the packet */
>> +static const u8 tf103c_dock_enable_cmd[9] = { 8, 0x20, 0, 0, 0, 0, 0x20, 0, 0 };
>> +static const u8 tf103c_dock_usb_enable_cmd[9] = { 8, 0, 0, 0, 0, 0, 0, 0x40, 0 };
>> +static const u8 tf103c_dock_suspend_cmd[9] = { 8, 0, 0x20, 0, 0, 0x22, 0, 0, 0 };
> 
> This seems to me rather
> 
> struct {
> 	u8 cmd;
> 	DECLARE_BITMAP(payload, 64);
> };
> 
> And those 2s and 4s are actually some bits in payload with some meaning.
> 
> Would it be the case?

Something like that yes, there are some hints that this is a bitfield in
the Android driver code, but then in other places it seems to be more of
a command structure then just individual bits having a meaning.

All in all we really don't know, so I'm going to keep this as just
an opaque array of bytes, because that is really what it is / what we know
about it.


> 
> ...
> 
>> +/*** keyboard related code ***/
> 
> Not sure why you have all those fancy tri-stars comments. Probably it's
> feliz año nuevo style -)

hehe, the driver is somewhat large, I've tried to group various
sub bits, like keyboard handling, touchpad handling, etc. together.

These are dividers for the different groups, which is why I gave them
a different style then normal comments.


> 
> ...
> 
>> +	ret = i2c_transfer(client->adapter, msgs, 2);
>> +	if (ret != 2) {
> 
> 2 --> ARRAY_SIZE() ?

Fixed in my review-hans branch (where this already landed).

> 
>> +		dev_err(dev, "error %d reading kbd data\n", ret);
>> +		return -EIO;
>> +	}
> 
> ...
> 
>> +	buf[0] = TF103C_DOCK_KBD_CMD_REG & 0xff;
>> +	buf[1] = TF103C_DOCK_KBD_CMD_REG >> 8;
>> +	buf[2] = cmd & 0xff;
>> +	buf[3] = cmd >> 8;
> 
> Seems to me like put_unaligned_le16() in both cases,

Fixed in my review-hans branch.

> 
> ...
> 
>> +	ret = i2c_master_send(dock->kbd_client, buf, 4);
>> +	if (ret != 4)
> 
> sizeof() / ARRAY_SIZE() ?

Fixed in my review-hans branch.


> 
>> +		dev_err(dev, "error %d writing kbd cmd\n", ret);
> 
> ...
> 
>> +static const struct acpi_device_id tf103c_dock_acpi_match[] = {
>> +	{"NPCE69A"},
> 
>> +	{ },
> 
> No comma is needed.

Fixed in my review-hans branch.

Regards,

Hans

