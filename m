Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60074C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 14:31:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 460C8610C7
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Oct 2021 14:31:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhJSOeI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Oct 2021 10:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46924 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229524AbhJSOeH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Oct 2021 10:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634653914;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wt+AF51i2+AJVxld7tcZLoOVm5AIIylXEqaWNzO88vc=;
        b=TRjMgPhCEr/0qftjEXlwXSbfpeaOw9gLhqMMsgZnltQ+9ZNgvAkpGIK7T3vUS/wnuQfiYF
        XqZrLtcKKl/P9TtoYcQWnZn1+d6CJDN8zGXD5ecEX9aLAwkpapFny5YfIhzZhfK4SNCTi1
        Ix1e0JCIfMrFiKnohhmTHJOkC1USBCY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-k9BYwbnqOTG30vOYqPVpEQ-1; Tue, 19 Oct 2021 10:31:53 -0400
X-MC-Unique: k9BYwbnqOTG30vOYqPVpEQ-1
Received: by mail-ed1-f70.google.com with SMTP id d3-20020a056402516300b003db863a248eso17754206ede.16
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Oct 2021 07:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wt+AF51i2+AJVxld7tcZLoOVm5AIIylXEqaWNzO88vc=;
        b=d0sHtY0PJkCjCcEHMwt+nmTpMPcnZRh4RAtOVkY9O7GP2H3w1OwP4fgeF9bkE1gU9D
         HRZ3cy3dz6lXQjSgfV9AJn+vMEEikC1CgWMJcfqspVL/L/AV7vqz/CEO3AgDINwk/ehU
         XEOu06mdFC6o6m7R6+QLw3juGz1wyhkQ8mwwjcvH/UH7wsBQRLeWeEdxv5eqZRuIuqxv
         hD2h7a/joofQLxq+6uTgzKm/6Z4rFK3aiZiMhxSsURFbEoBZfeRXqCDjkj/P0qKhFu4o
         gZL0s5lM9sn109BoXoezil3RibjjxyN2YijpWWuifg2VrMhFahbdagOB1Jw+sTjC9oaS
         1wEw==
X-Gm-Message-State: AOAM531567odMb9lDWdgvJ8pOg8UA01+DBognq1Aq9WbZxlKSwMbUgAb
        HOekF0+AHfD0XvjnRFjYwRc/4FvNmf8y0/n0h8Baw3D/glMrQVRu5wT0FCpMFnkrFS/iQQpKa9p
        w8d1rm9VF0bpDKT8yADDoQGuCMIWeF3PvrA==
X-Received: by 2002:a05:6402:1e8c:: with SMTP id f12mr52510566edf.71.1634653911962;
        Tue, 19 Oct 2021 07:31:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyZvImrBHaOgYibJo+1/BQgQPzduq87OaLUExNDuFuzn4pLcOpaFPZ1rMlYMxaX/eGnAsuug==
X-Received: by 2002:a05:6402:1e8c:: with SMTP id f12mr52510555edf.71.1634653911763;
        Tue, 19 Oct 2021 07:31:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e23sm11032155edq.88.2021.10.19.07.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 07:31:51 -0700 (PDT)
Message-ID: <dc0bd744-28a2-7888-2a1e-9ccf5339d422@redhat.com>
Date:   Tue, 19 Oct 2021 16:31:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4 0/4] platform/x86: system76_acpi: Sync DKMS module
 changes
Content-Language: en-US
To:     Tim Crawford <tcrawford@system76.com>,
        platform-driver-x86@vger.kernel.org
Cc:     productdev@system76.com
References: <20211006202202.7479-1-tcrawford@system76.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211006202202.7479-1-tcrawford@system76.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/6/21 22:21, Tim Crawford wrote:
> Sync the in-tree system76_acpi module with changes made to the DKMS
> module [1]. This introduces/exposes new functionality implemented in the
> open source BIOS and EC firmware for System76 laptops.
> 
> v4:
> - Reverted DEV_ATTR macro change to keep custom `name`
> - Added attribute groups for kb_led_color
> - Set kd_led.groups instead of manually creating/removing the sysfs file
> v3:
> - Made use of DEV_ATTR macro for kb_led_color
> - Used sysfs_emit() instead of sprintf() for kb_led_color
> v2:
> - Used input_set_capability() instead of setting bits directly in patch 2/3
> - Used sysfs_emit() instead of sprintf() in patch 3/3
> - Made use of device_{add,remove}_groups() in patch 3/3
> 
> [1]: https://github.com/pop-os/system76-acpi-dkms
> 
> 
> Jeremy Soller (2):
>   platform/x86: system76_acpi: Report temperature and fan speed
>   platform/x86: system76_acpi: Replace Fn+F2 function for OLED models
> 
> Tim Crawford (2):
>   platform/x86: system76_acpi: Add battery charging thresholds
>   platform/x86: system76_acpi: Add attribute group for kb_led_color
> 
>  drivers/platform/x86/system76_acpi.c | 428 ++++++++++++++++++++++++++-
>  1 file changed, 412 insertions(+), 16 deletions(-)

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

