Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9C2C48BE6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 18:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16CA2613B9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 18:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhFPSQR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 14:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21704 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230055AbhFPSQR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 14:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623867250;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/2ZgS+GCY+zeGtNmbikEY7JDq0qDESkYvLCgyzZHxds=;
        b=FR5mW8LOXsGtbbm2ZtV6w32vbZgdoUUymckMZPiVskpcICDNv+pXrlHJm15s3+wp1bNb4q
        Q6VxFAs+EicHsjW9Njz4YGixmgY+pN35pHf/CgRyKanIiBBQjqqZlQN8bCax8dIl0XiFPk
        B01YQVJYjX+Z4Az2rIJQanwD/jDu9LQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-B_WrRUzQNkWdUYRhx3eBGA-1; Wed, 16 Jun 2021 14:13:37 -0400
X-MC-Unique: B_WrRUzQNkWdUYRhx3eBGA-1
Received: by mail-ed1-f71.google.com with SMTP id q7-20020aa7cc070000b029038f59dab1c5so109490edt.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 11:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/2ZgS+GCY+zeGtNmbikEY7JDq0qDESkYvLCgyzZHxds=;
        b=qIWgqBXpM35qIj3BvxQ9GE3U84/0aL0h7EMWTITmOjpEGMjdBZ7les/QDOVogu0b97
         CrlQzPbCDUuCqwrHb9D4DeLymEeMwWwQWKmGQKc5yQSuHEQL3RN/CX05LXyMxXtRX9R4
         tlw6XEeRuNucsmJPRYIYGqkZLrCVLDGP9FUbWfemtxu3gHuY9qDwlbmERJeT9qV+5Yrp
         8QxcvigSI2XQaYQ1vDcr6pwm2DdPO073J+otUVhOb/tAmPrzxsrvfumPoqPq6OejJbB/
         lJXtvp6SpVcrtZgZMCMg1FguKBnY0ItKwIafM3OuUUz0fobIzr28BBl4pyAR0GnorjSh
         bZdA==
X-Gm-Message-State: AOAM532TCdE1xyTnE3eRBF3hSOXtDP/09n0rwBODdtrqlRXw7hCn373n
        ENQuh/wNlFPSSBXeJ1Ku57bemg82hQK22FCs1vuvVn/rbRVHIII0Rr0MyqDvin0FOKXCqsm2B+L
        T+0i+pUj7o+BqYFCd7gwofVszkcuoS3OhtQ==
X-Received: by 2002:a05:6402:781:: with SMTP id d1mr1297298edy.32.1623867216488;
        Wed, 16 Jun 2021 11:13:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9vMHLTBq5mDNxgautgv3pvtkh5NJQutUbOxh1CWqXkx9hBbr+BTgHCyzxPgjYIs3J1MTEVA==
X-Received: by 2002:a05:6402:781:: with SMTP id d1mr1297274edy.32.1623867216371;
        Wed, 16 Jun 2021 11:13:36 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id l26sm2498581edt.40.2021.06.16.11.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 11:13:36 -0700 (PDT)
Subject: Re: [PATCH v5 5/6] platform/x86: Add intel_skl_int3472 driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Scally <djrscally@gmail.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:ACPI COMPONENT ARCHITECTURE (ACPICA)" <devel@acpica.org>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kieran.bingham@ideasonboard.com
References: <20210603224007.120560-1-djrscally@gmail.com>
 <20210603224007.120560-6-djrscally@gmail.com>
 <ea322abe-fa78-bbc3-b4c5-b372a4f28235@redhat.com>
 <CAHp75VccZbv8+u-jO8wYSsyQrw+Bd_zeDa==aiTvkh=fteuT3w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0991caf2-1b7b-c8b5-8558-03b8f0dbb604@redhat.com>
Date:   Wed, 16 Jun 2021 20:13:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VccZbv8+u-jO8wYSsyQrw+Bd_zeDa==aiTvkh=fteuT3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/16/21 8:08 PM, Andy Shevchenko wrote:
> On Wed, Jun 16, 2021 at 8:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 6/4/21 12:40 AM, Daniel Scally wrote:
>>> ACPI devices with _HID INT3472 are currently matched to the tps68470
>>> driver, however this does not cover all situations in which that _HID
>>> occurs. We've encountered three possibilities:
>>>
>>> 1. On Chrome OS devices, an ACPI device with _HID INT3472 (representing
>>> a physical TPS68470 device) that requires a GPIO and OpRegion driver
>>> 2. On devices designed for Windows, an ACPI device with _HID INT3472
>>> (again representing a physical TPS68470 device) which requires GPIO,
>>> Clock and Regulator drivers.
>>> 3. On other devices designed for Windows, an ACPI device with _HID
>>> INT3472 which does **not** represent a physical TPS68470, and is instead
>>> used as a dummy device to group some system GPIO lines which are meant
>>> to be consumed by the sensor that is dependent on this entry.
>>>
>>> This commit adds a new module, registering a platform driver to deal
>>> with the 3rd scenario plus an i2c driver to deal with #1 and #2, by
>>> querying the CLDB buffer found against INT3472 entries to determine
>>> which is most appropriate.
>>>
>>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>>
>> Thank you for your patch, I've applied this patch to my review-hans
>> branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> I've fixed up the missing static marking of skl_int3472_tps68470_calc_type()
>> spotted by lkp@intel.com while applying the patch to my tree.
> 
> Are you going to apply patch 6 as well?
> IIRC it's acked by Lee.

Ah you are right, it is Acked, but I'm not sure if that ack was for
Lee being ok with it being merged through the pdx86 tree. I'll coordinate
this with Lee off list.

Regards,

Hans

