Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B1AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jul 2022 21:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbiGNVBE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Jul 2022 17:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbiGNVBD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jul 2022 17:01:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 893796C109
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 14:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657832461;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vDtseAhZF5jLIcfhZbyM9YolPGerzGy+on9SFErU3dE=;
        b=ZzZUN5sYKAuOU0XU6kO07jQO2h8EMwp+f1eIIdZ3tjQbTZnhvduruQMTcs7Fz0BsApS5KV
        MsoI/ZCl+VkOtPVgSNklnZanj/atA59wtPVHvSCAxuRuRJHGYIe+jVQrIRHp3Sd0fAGXYE
        ob++W83GDv77Sy4cfdsKr/nkLFEKW/g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-dk75XAqdMqmqyG41MR3Vmw-1; Thu, 14 Jul 2022 17:01:00 -0400
X-MC-Unique: dk75XAqdMqmqyG41MR3Vmw-1
Received: by mail-ed1-f70.google.com with SMTP id w13-20020a05640234cd00b0043a991fb3f3so2186391edc.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 14:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vDtseAhZF5jLIcfhZbyM9YolPGerzGy+on9SFErU3dE=;
        b=kk1k2Bly9/MZpD6iCbz/ED1dUPXER+sfP9JieeFhCjdebtRaBxEgiMlXjU6yyOoVvu
         7IK31igIcOQ0q0R8bxJ0eZvoIcuosbHn8cl/U3lxA40uCX2WMdkXVXIwhpiQ4L2NzB9/
         +b20CyKF/iynQIgpzKkT/F0ZxMHxyDLfRBV3zVZOKuFYA6mCB+eE+LT1ih26MNx2dvUh
         En3FqIKESCrlVxVGKaWQfqBfpiy1W4dwBkmkWSlyLMGIiPW+AqMPHA/n5K37Z8NE5v2P
         SVpFqKZptlVqk5kpqaLKhfSISdBZbtcOOFyp0kMi6TJjAhdsCaC5DcmiqrWBtaF68tLF
         wACA==
X-Gm-Message-State: AJIora919Cx5qyqtXQcXPC01fXpMJVY7WgeGoKA2ipSMSGj1NkcmPKu/
        RImFL08zPaKuEVevxuM7wh132TLusbtBVx28P9hPuVSAnwPzI3u//ltMqHXmtdHdP9NG4+UdKRB
        LHiqaTfcXCrYuNq6y30qyDpDCWrapVU1cgw==
X-Received: by 2002:a05:6402:42d5:b0:433:1727:b31c with SMTP id i21-20020a05640242d500b004331727b31cmr14696274edc.9.1657832458893;
        Thu, 14 Jul 2022 14:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9DQW9L5bfVbdeO+kmuM2GymWbjT00n3Tcyf9cexzWu4iFYy/1LER8cD+JI5PtKwxF3ZSfYg==
X-Received: by 2002:a05:6402:42d5:b0:433:1727:b31c with SMTP id i21-20020a05640242d500b004331727b31cmr14696263edc.9.1657832458716;
        Thu, 14 Jul 2022 14:00:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090636c800b0072a815f569bsm1093706ejc.185.2022.07.14.14.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 14:00:58 -0700 (PDT)
Message-ID: <63dd593a-818f-d360-c053-a26b469f8c31@redhat.com>
Date:   Thu, 14 Jul 2022 23:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH platform-next 0/9] platform/x86: mlx-platform: Extend to
 support new systems and additional user interfaces
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220711084559.62447-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220711084559.62447-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/11/22 10:45, Vadim Pasternak wrote:
> The patch set adds:
> - Support for new systems:
>   - COMe NVSwitch management module for Vulcan chassis containing
>     Nvidia's Hopper dGPU (GH100), NVswitch (LS10) based HGX
>     baseboard.
>   - XH3000 system, which is a water-cooling Ethernet switch blade
>     equipped with 32x200G Ethernet ports.
> - Support for systems equipped with two ASICc.
> - Logic for selective activation of some drivers.
> - Documentation fixes and introduction of new attributes.
> - Locking protection for IO operations over register space.
> 
> The patch set contains:
> Patch #1 - extends logic for selective activation of some drivers,
> 	   depending on system type.
> Patch #2 - contains cosmetic changes.
> Patch #3 - adds support for systems with two ASICs.
> Patches #4-#5 - introduce new systems.
> Patch #6 - adds new feature for system minor revision changes.
> Patch #7 - adds locking for IO operations.
> Patches #8-#9 - documentation changes.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note I've fixed up a type in patch 9/9: s/AISCs/ASICs/

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> 
> Vadim Pasternak (9):
>   platform/x86: mlx-platform: Make activation of some drivers
>     conditional
>   platform/x86: mlx-platform: Add cosmetic changes for alignment
>   platform/x86: mlx-platform: Add support for systems equipped with two
>     ASICs
>   platform/x86: mlx-platform: Introduce support for COMe NVSwitch
>     management module for Vulcan chassis
>   platform/x86: mlx-platform: Add support for new system XH3000
>   platform/x86: mlx-platform: Add COME board revision register
>   platform/mellanox: mlxreg-io: Add locking for io operations
>   Documentation/ABI: mlxreg-io: Fix contact info
>   Documentation/ABI: Add new attributes for mlxreg-io sysfs interfaces
> 
>  .../ABI/stable/sysfs-driver-mlxreg-io         |  81 ++-
>  drivers/platform/mellanox/mlxreg-io.c         |  23 +
>  drivers/platform/x86/mlx-platform.c           | 491 ++++++++++++++++--
>  3 files changed, 526 insertions(+), 69 deletions(-)
> 

