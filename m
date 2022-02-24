Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FD7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 16:57:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbiBXQ5s (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 11:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiBXQ5r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 11:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DBD82BC2E
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 08:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645721835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TncsG7YXX5+yOaoX96UNZNhSvIR4PPKBKgvHMZmiEE8=;
        b=eVQ0NZfCyYBjgXw3AI4uN7Tfu5edGN9VQyG6uegeD8BqHVa3VeBXnpELLaVi8YaOSGzJ5r
        XyJAhG8GbfXyTY1vaHWj/nPghH8ft+YMFTyD75AVc7HO82VhlQgKU2Opt+6E9bhm500ba1
        Pz7iplbhAy7gvW+pkOtlWT6+fOXHwZA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-FfSSk5J_OMuRilARETrB0w-1; Thu, 24 Feb 2022 11:57:13 -0500
X-MC-Unique: FfSSk5J_OMuRilARETrB0w-1
Received: by mail-ej1-f71.google.com with SMTP id r18-20020a17090609d200b006a6e943d09eso1481437eje.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 08:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TncsG7YXX5+yOaoX96UNZNhSvIR4PPKBKgvHMZmiEE8=;
        b=jMNOd3pnCq0WPi8UA9lgU+zBQnVw2FqWoQhSv2u+efrMWp2vtGl2P1k8hgH/FU0NZ0
         ECmGViajDT2vdenVNSKFsD4zy0/FKlYw3kCb4ujn1sExR1xN0k54oLKnkrjGVQlWmQaP
         rAc293qQ4PuYhPxX9nVwUJyegRkPQYAsTvS/4RDUMfOdITH1JZIJe2RWkNGFkcxOQMNE
         DeKLSU8oHN6+5tM5d0nLTuLh2N4TOavEgM+ga+efzRqLxjZK7vohRyzq79kExR5Y60Lt
         XzAxJotMhcrl+3sYzm2jdtgTSwi1YvgmISOLTrFcI2Jpw65Ifr8getmQP4chIj6125z/
         /bzQ==
X-Gm-Message-State: AOAM531l2szd/o7t1dd04PKqe8U/sbAtS60i63ktZ7qQkSpY1erzTcY6
        YM+CRhPrJj9Vf82uJm8skvKxK3mfbecPoRn18OI8K87z5qJwEm5Lv0pIsN6QxcHQO0WEJRIB2Fn
        /xCt2eAeui7urVR58gYqy/HtZbVRS6huz1w==
X-Received: by 2002:a05:6402:440b:b0:410:5fb4:7225 with SMTP id y11-20020a056402440b00b004105fb47225mr3107439eda.216.1645721832362;
        Thu, 24 Feb 2022 08:57:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkrMWqFPTudWVMfc/YBNuuU+WF5pQlz2tw8rgREzx5hKsdbogu3/XpRlu2sJBuVaHggsaszg==
X-Received: by 2002:a05:6402:440b:b0:410:5fb4:7225 with SMTP id y11-20020a056402440b00b004105fb47225mr3107432eda.216.1645721832181;
        Thu, 24 Feb 2022 08:57:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id r22sm1653717ejo.48.2022.02.24.08.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 08:57:11 -0800 (PST)
Message-ID: <0568e484-4ab2-5641-53ae-29ff48e952e6@redhat.com>
Date:   Thu, 24 Feb 2022 17:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/5] platform/x86: x86-android-tablets: Workaround Lenovo
 Yoga Tablet 2 830/1050 poweroff hang
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-5-hdegoede@redhat.com>
 <YhZLpmhobBjrOHDU@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YhZLpmhobBjrOHDU@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/23/22 15:58, Andy Shevchenko wrote:
> On Wed, Feb 23, 2022 at 02:31:52PM +0100, Hans de Goede wrote:
>> These tablets' DSDT does not set acpi_gbl_reduced_hardware, so
>> acpi_power_off gets used as pm_power_off handler. This causes "poweroff"
>> on these tablets to hang hard. Requiring pressing the powerbutton for
>> 30 seconds *twice* followed by a normal 3 second press to recover.
>>
>> Avoid this by overriding the global pm_power_off handler to do
>> an EFI poweroff instead.
> 
> Oh, you eventually found the root cause (reduced HW bit)?

I'm not sure, it is possible that not setting the reduced HW bit
is actually correct for this hw, but that does lead to using
acpi_power_off which seems broken on this system.

I've updated the commit message while merging this to reflect
that using acpi_power_off is the problem, rather then not setting
the reduced HW bit.

Also note that the issue of reboot being the same as poweroff once
the system has been rebooted at least once is still unresolved.

Regards,

Hans

