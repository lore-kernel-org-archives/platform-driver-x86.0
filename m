Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAEBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 14:24:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CF116109D
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 14:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhKBO0r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 10:26:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41134 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231558AbhKBO0l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 10:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635863046;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1YjJj9IqpDhJ07HE33uojzp5DuJdOMzvHOGPrvOy2QU=;
        b=b9AsSj6i1AcGLKQ2t8BdJ0vCpxnWC0HdlpYBh5pxxWKgBWDtFzzLMvO4Xxp3Dn5ZSfEEa0
        NpSZPzESE3IJ+sQv6LxmfUj0jjFUyuBy8xnLGnXkX0Av9fDqW/FUQPJMp1pdBedcjTHJuU
        3pxZ/bH7AS9W6DoBxOXHSbbsMeZtiQ0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-ZesNl95FMIuKpkifAjClXQ-1; Tue, 02 Nov 2021 10:24:05 -0400
X-MC-Unique: ZesNl95FMIuKpkifAjClXQ-1
Received: by mail-ed1-f70.google.com with SMTP id u10-20020a50d94a000000b003dc51565894so18943277edj.21
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Nov 2021 07:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1YjJj9IqpDhJ07HE33uojzp5DuJdOMzvHOGPrvOy2QU=;
        b=5wOT2r0BwzP3YZm58E7CDiib5PWJNrFX1dNrfzSV6ID/nUQUyraCohcqrzy4PwGJb9
         K5hNmoJzENCKFroehRd3FVifYh3nZnFsP2+gcnd63fLG1hRu9zpBh8kS+3LxzrltrEx9
         FIp+chIe9XF2yI3tVWsvWin7FwVAjBRcCjtsPXU9nhan6zV9lPfK3m0RDWmFMDwrjaz6
         9TtACWg85s++4FhVRMiIgEqcRTvyB2yMhz5+H1sHjuD1MtGLgWfO0b1wP3rBVexxtbWg
         ixGpMz/CBdzna94BatjGRPXvCJK94jvOLVPeSzoQ7VfZR8qbwBvkRJKwnp1+HMT/kZqv
         7lGQ==
X-Gm-Message-State: AOAM530oNXBu6cmi6Uball8cmu0i9BteIDD8dVd8tD0sMJ+NBVNzqDGu
        Y+92lNNQtvj9EgBtMWOprDe23ylONatbo9oGMLujsrc2lxfZnzYp051qdUy/S4Ii2MABMJCn4aS
        KXc5/Djse5+cNG9Nd+0+RBFsOgs9C50gJ1A==
X-Received: by 2002:a17:907:7f8b:: with SMTP id qk11mr46491568ejc.313.1635863043786;
        Tue, 02 Nov 2021 07:24:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkmvL1HIl9M3KIUQMmw+yeeX/QNnPDpALyKPCkIFoHEdHZkwzBVyQbxiHQ+ACffR2u+1RHkA==
X-Received: by 2002:a17:907:7f8b:: with SMTP id qk11mr46491524ejc.313.1635863043578;
        Tue, 02 Nov 2021 07:24:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id sg17sm3448785ejc.72.2021.11.02.07.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 07:24:02 -0700 (PDT)
Message-ID: <8eaeca66-f719-6b5d-bd7c-ccbd15a0b91c@redhat.com>
Date:   Tue, 2 Nov 2021 15:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 07/11] platform/x86: int3472: Split into 2 drivers
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211102094907.31271-1-hdegoede@redhat.com>
 <20211102094907.31271-8-hdegoede@redhat.com>
 <CAHp75VePSv8b=oTJXJCL_go9Lody+8JQJyMC6exO-Zw8cPk9og@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VePSv8b=oTJXJCL_go9Lody+8JQJyMC6exO-Zw8cPk9og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/2/21 15:16, Andy Shevchenko wrote:
> On Tue, Nov 2, 2021 at 11:49 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The intel_skl_int3472.ko module contains 2 separate drivers,
>> the int3472_discrete platform driver and the int3472_tps68470
>> I2C-driver.
>>
>> These 2 drivers contain very little shared code, only
>> skl_int3472_get_acpi_buffer() and skl_int3472_fill_cldb() are
>> shared.
>>
>> Split the module into 2 drivers, linking the little shared code
>> directly into both.
>>
>> This will allow us to add soft-module dependencies for the
>> tps68470 clk, gpio and regulator drivers to the new
>> intel_skl_int3472_tps68470.ko to help with probe ordering issues
>> without causing these modules to get loaded on boards which only
>> use the int3472_discrete platform driver.
>>
>> While at it also rename the .c and .h files to remove the
>> cumbersome intel_skl_int3472_ prefix.
> 
> ...
> 
>> +union acpi_object *skl_int3472_get_acpi_buffer(struct acpi_device *adev, char *id)
>> +{
>> +       struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
>> +       acpi_handle handle = adev->handle;
>> +       union acpi_object *obj;
>> +       acpi_status status;
>> +
>> +       status = acpi_evaluate_object(handle, id, NULL, &buffer);
>> +       if (ACPI_FAILURE(status))
>> +               return ERR_PTR(-ENODEV);
>> +
>> +       obj = buffer.pointer;
>> +       if (!obj)
>> +               return ERR_PTR(-ENODEV);
>> +
>> +       if (obj->type != ACPI_TYPE_BUFFER) {
>> +               acpi_handle_err(handle, "%s object is not an ACPI buffer\n", id);
> 
>> +               kfree(obj);
> 
> I'm wondering if we should use more of the ACPI_FREE() calls as
> opposed to ACPI_ALLOCATE_BUFFER. Ditto for all such cases.

Basically the situation surrounding this is a mess, most code seems to
simply use plain kfree() which I find much more readable, but some
code indeed is using ACPI_FREE(), which I believe is really mostly
meant for internal use by the acpica code.

Eitherway until one of the ACPI maintainers clearly states
that we really should use ACPI_FREE() here I plan to stick with kfree()
because:

1. I find it much more readable.
2. AFAICT ACPI_FREE() is meant for acpica internal use
   (basically it is part of the OS abstraction bits of acpica)

Regards,

Hans

