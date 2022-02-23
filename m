Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFA4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Feb 2022 15:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239748AbiBWPRS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Feb 2022 10:17:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237241AbiBWPRS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Feb 2022 10:17:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E66AF5F95
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 07:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645629407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wJMzfMZTbOFeZJxgtRO31BM9K4FI9BB8cDLrW2mcBXI=;
        b=R6Etx88jkl+r+i9xgIE0Yu/cD6jUlDDIFDAl8tHklGq5/XjnnXSftIyV8hMMWvLirXdM0w
        IT/nyW8BXidcQIEdEV2OK7I799peP7xrDW59yw5UB3k7rXvOaI6YERdHiHvti+dqrLvHj9
        p95AAbfWhF6KNgIMjlBRB/uc3Q8oJ+A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-1Z91NKOdNeqhLo_TInnnhg-1; Wed, 23 Feb 2022 10:16:45 -0500
X-MC-Unique: 1Z91NKOdNeqhLo_TInnnhg-1
Received: by mail-ed1-f72.google.com with SMTP id o5-20020a50c905000000b00410effbf65dso13724446edh.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 07:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wJMzfMZTbOFeZJxgtRO31BM9K4FI9BB8cDLrW2mcBXI=;
        b=ARSlUPuZm6KAYz+kPJILeLmWStN0WWinur3cPskIK+ADAZUETNe7/WbUT4r1V7IZxJ
         F3QvkTqvJHAW6tXJn6uADKGU+IecURPc0BigC7z07W0VbipWIuTKccahfFffpgQWId7R
         QKobuUrBCozjbnCKfdOdyw+o9Hli+Nwsgonp2fFEUuzQNlnMMsYyJJaoo2nsYn9602cI
         KFx4aTNhLD9Aj6V6EMTg23ZvWeAJgSyRQKh4w1alds+cnsnNbsQJDXjq3uUso26qOJIo
         M7Z6ZY0EoC7j8286k2YONQO44xGXpSP2Bxsfj9Begcppjf5WJ6DU5OzJMh7cJW1yKqDF
         18rA==
X-Gm-Message-State: AOAM5318Qzh1XJb08397+gf3jqIxwPkx07NRSdkzV1g3nhG5K0q/Lz0g
        gieVfDxjFIlKr+RCdhbxHY4CTDViikBVHbB7TFqE77OBPeLgkv7XetuSff+E70YcrgkB4kH/xNW
        o7kXkdgmRVQJDrSQiTGNayFgVos3IosesLA==
X-Received: by 2002:a05:6402:3553:b0:412:d0aa:e7b0 with SMTP id f19-20020a056402355300b00412d0aae7b0mr25149392edd.309.1645629404257;
        Wed, 23 Feb 2022 07:16:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzweXAUj12cZ6J1TzYUyKUhASrpoYGkrNOcll4D9CTEJhD37i7G97LC8viYuUsa2g0VGRd8yw==
X-Received: by 2002:a05:6402:3553:b0:412:d0aa:e7b0 with SMTP id f19-20020a056402355300b00412d0aae7b0mr25149373edd.309.1645629404116;
        Wed, 23 Feb 2022 07:16:44 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 23sm7882404ejf.175.2022.02.23.07.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 07:16:43 -0800 (PST)
Message-ID: <9cda0c14-8108-fb42-4464-36a2fde0ffda@redhat.com>
Date:   Wed, 23 Feb 2022 16:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/5] platform/x86: x86-android-tablets: Fix EBUSY error
 when requesting IOAPIC IRQs
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-3-hdegoede@redhat.com>
 <YhZLI40Vukgv+PPO@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YhZLI40Vukgv+PPO@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/23/22 15:56, Andy Shevchenko wrote:
> On Wed, Feb 23, 2022 at 02:31:50PM +0100, Hans de Goede wrote:
>> Sometimes IRQs used by GPIOs in direct-IRQ mode are already registered
>> because they are used as ACPI "Interrupt () {}" resource for one of the
>> many bogus I2C devices present in the broken DSDTs of Android x86 tablets.
>>
>> This is an issue if the existing (bogus) ACPI resource uses different
>> trigger settings then what is being requested, leading to an -EBUSY
>> error return of acpi_register_gsi().
>>
>> Fix this by calling acpi_unregister_gsi() first, so that
>> the acpi_register_gsi() is allowed to change the trigger settings.
>>
>> In cases where the GSI has not been registered yet
>> the acpi_unregister_gsi() is a no-op.
> 
> ...
> 
>>  	case X86_ACPI_IRQ_TYPE_APIC:
>> +		/*
>> +		 * The DSDT may already reference the GSI in a device skipped by
>> +		 * acpi_quirk_skip_i2c_client_enumeration(). Unregister the GSI
>> +		 * to avoid EBUSY errors in this case.
>> +		 */
>> +		acpi_unregister_gsi(data->index);
> 
> Perhaps a warning (or at least debug) message?

The function returns void, so we cannot check if it did anything or not.

Regards,

Hans

