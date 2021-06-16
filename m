Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3E5C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 14:41:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34E756115C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 14:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234092AbhFPOnN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 10:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21691 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234083AbhFPOnM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 10:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623854465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/KmdDtuxC4DPMkm/dYQuBivCzYIDXejkNuC0LvGZbxU=;
        b=Y0Vze6X8OtKKMG073i+KGKiox/M7Qi96XHWivqXno2AIcJDGiDgAHxsdOxZAE2aKFrUHrp
        oDBxMqmChNukuiSpmd/etboKrAZsvdEORsR1wQjpejQKWIvu+CsjravTYPAgNYi2hbtVQ3
        mBT6+iIP+Cm3pEf4abfND/nmTuv8koo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-epx4VY5-Oai7R5ncEW6zgA-1; Wed, 16 Jun 2021 10:41:04 -0400
X-MC-Unique: epx4VY5-Oai7R5ncEW6zgA-1
Received: by mail-ed1-f70.google.com with SMTP id t11-20020a056402524bb029038ffacf1cafso1172579edd.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 07:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/KmdDtuxC4DPMkm/dYQuBivCzYIDXejkNuC0LvGZbxU=;
        b=NcsaBiAQm7NNE/JGjf4h7S1sYvDFS3xTeuiqOHr6M2ppibwBn9mjj6CEuanU5WRHrE
         ecYt8iljMQJO9idpq8P3Y9SlyzefHXDaAPopOc/1uJGiqiAfzfb9rCLE1twnmyBpIX7A
         lfnPg4ZBgZv2wu1L5yR0ovdNt3R3QopzZoEpblZt0HLm83ujXD0HQHJlARqRk1zq0yXR
         tHIzulJqqGbiMFKRFDLb5JU3xNNaApX9tZ+8fRzSwvquPGZbWHU/ttXum2zvtocmT6zM
         EDQ/wxtx+VIkEqHsbr/AxvqCXMwclK5srl5VsHWzmnq3DYbY3Trvxh6P2YpafqsgYxol
         7+zQ==
X-Gm-Message-State: AOAM533LafNz5E31w6S8b9awg1RE7PSwzTiPAMX+BdxPPgD7YrsPbYFw
        beFUi/lQV+fQ3kkHIzQia0vYXkQoIYjch5+xcSEOGJptormmDOdRGDjIeSeAmPfmxVTZoez+sJ/
        KepjorxCEakByxqeaSKk+KvaxDTFNGHMrAA==
X-Received: by 2002:a05:6402:520b:: with SMTP id s11mr4598058edd.111.1623854463232;
        Wed, 16 Jun 2021 07:41:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyczHmLu6t+yCUzUAbMlYbY+WyHHr7hOEQVqmOEk9e7Vkgp3nCAYDNB5ni47dvk6qm1OkL03A==
X-Received: by 2002:a05:6402:520b:: with SMTP id s11mr4598044edd.111.1623854463136;
        Wed, 16 Jun 2021 07:41:03 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j22sm1817090ejt.11.2021.06.16.07.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 07:41:02 -0700 (PDT)
Subject: Re: [GIT PULL] intel-gpio for 5.14-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Daniel Scally <djrscally@gmail.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
References: <YL43SrZ8N8H+ZHE9@black.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <66fee594-8e13-5200-f8d9-c71caeb863a7@redhat.com>
Date:   Wed, 16 Jun 2021 16:41:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YL43SrZ8N8H+ZHE9@black.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/7/21 5:12 PM, Andy Shevchenko wrote:
> Hi Linux GPIO and TWIMC maintainers,
> 
> This is GPIO material for v5.14 cycle. It contains some stuff that other
> subsystems may take due to dependencies. Consider this tag immutable.
> 
> Thanks,
> 
> With Best Regards,
> Andy Shevchenko

Thank you, I've merged this into the review-hans branch of
platform-drivers-x86 now, because this is a dependency for:
https://patchwork.kernel.org/project/platform-driver-x86/patch/20210603224007.120560-6-djrscally@gmail.com/

After I've run some tests I will push the review-hans branch
to the for-next branch.

Regards,

Hans





> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.14-1
> 
> for you to fetch changes up to 043d7f09bf614809c10c4acbf0695ef731958300:
> 
>   gpiolib: acpi: Add acpi_gpio_get_io_resource() (2021-06-04 16:24:19 +0300)
> 
> ----------------------------------------------------------------
> intel-gpio for v5.14-1
> 
> * Export two functions from GPIO ACPI for wider use
> * Clean up Whiskey Cove and Crystal Cove GPIO drivers
> 
> The following is an automated git shortlog grouped by driver:
> 
> crystalcove:
>  -  remove platform_set_drvdata() + cleanup probe
> 
> gpiolib:
>  -  acpi: Add acpi_gpio_get_io_resource()
>  -  acpi: Introduce acpi_get_and_request_gpiod() helper
> 
> wcove:
>  -  Split error handling for CTRL and IRQ registers
>  -  Unify style of to_reg() with to_ireg()
>  -  Use IRQ hardware number getter instead of direct access
> 
> ----------------------------------------------------------------
> Alexandru Ardelean (1):
>       gpio: crystalcove: remove platform_set_drvdata() + cleanup probe
> 
> Andy Shevchenko (3):
>       gpio: wcove: Use IRQ hardware number getter instead of direct access
>       gpio: wcove: Unify style of to_reg() with to_ireg()
>       gpio: wcove: Split error handling for CTRL and IRQ registers
> 
> Daniel Scally (2):
>       gpiolib: acpi: Introduce acpi_get_and_request_gpiod() helper
>       gpiolib: acpi: Add acpi_gpio_get_io_resource()
> 
>  drivers/gpio/gpio-crystalcove.c | 10 +-------
>  drivers/gpio/gpio-wcove.c       | 39 +++++++++++++++----------------
>  drivers/gpio/gpiolib-acpi.c     | 51 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h            |  7 ++++++
>  include/linux/gpio/consumer.h   |  2 ++
>  5 files changed, 80 insertions(+), 29 deletions(-)
> 

