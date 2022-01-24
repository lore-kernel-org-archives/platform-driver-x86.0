Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785D4C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Jan 2022 10:41:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233316AbiAXKlk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Jan 2022 05:41:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33135 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231843AbiAXKlk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Jan 2022 05:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643020899;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+ALfEol9gNQirZfiKYK/HHFGRP6JTQP0U7Ub1EsZoZo=;
        b=HPN3eIkQVwyTJ+COIVw9JayNHWYOsCGA5nCpw4o4MD8zRe0g1GJFr1wnj35Wb+8J7C2Zoy
        YcpinpECv/jLr3rre1SgeKQXcCqNtVZ+UY2SCk/KV2XnPm6ty6NhxNzrleRJi3GIe7o5qD
        Hjih4xNH1jWuRkgSkfeGu0H63G+0smA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-nRdPfr-9PbqQOwi4bV5twg-1; Mon, 24 Jan 2022 05:41:38 -0500
X-MC-Unique: nRdPfr-9PbqQOwi4bV5twg-1
Received: by mail-ed1-f72.google.com with SMTP id i22-20020a0564020f1600b00407b56326a2so2807012eda.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Jan 2022 02:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+ALfEol9gNQirZfiKYK/HHFGRP6JTQP0U7Ub1EsZoZo=;
        b=XzNyjwxgoV1J8gpDmhJIIfTQ5fnU/80B/noqp9x1rWfcVqMlOClhPllsO0UkT1n5K2
         6o63wQ/sbvXQDKme3Xj3Kk+S+300rRBGChdxLvLH+jVWVMSgY1U5sA0oifRAhW0XizID
         0cyUbnA0TzOIia69jRUA2Pq4OmBylMXjfyeyaXEsefQjLomS/OhiQYyahItydfW1FZUP
         nfteYz1DoR6P2yc8ThGD2xxLdgHUgsfhyK9CQXPotI/6NS4079RT+plVQx6dB/3IK7ey
         8rDzCe/KPsYlsGtMxWI+eOHj18/h/D9ZpJRBwISo3yeg+FDZ6X/Jj673rT5dBgF5H0jV
         u+mg==
X-Gm-Message-State: AOAM532eT0JKRW0NhiyqF975eEhHR7LvRZCXh/uy+IUhnVbBTzQu0R47
        BF2GJGTVoO/6h/ak5SuQ8reKK+TR/tlTzzB79FWCuXiZKoOxp6xHLtCXiQTjMJ0uDT5vK8JsBdo
        a4WtNIeA8aM242f4LErAddvIDMPkYwOQE1w==
X-Received: by 2002:a17:907:a412:: with SMTP id sg18mr12190853ejc.383.1643020896545;
        Mon, 24 Jan 2022 02:41:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpgZBup7efcoCaRXXjfXhZ/ZBsiIGDtU7d1K1EEAGW07NtPcDuyk3DschI3QhaRnEnspMxXg==
X-Received: by 2002:a17:907:a412:: with SMTP id sg18mr12190847ejc.383.1643020896372;
        Mon, 24 Jan 2022 02:41:36 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id d2sm4724424ejw.70.2022.01.24.02.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 02:41:35 -0800 (PST)
Message-ID: <bf21fbfc-fa90-44e9-c025-aa371e30c69d@redhat.com>
Date:   Mon, 24 Jan 2022 11:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: amd-pmc: Correct usage of SMU version
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>
References: <20220120174439.12770-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120174439.12770-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/20/22 18:44, Mario Limonciello wrote:
> Yellow carp has been outputting versions like `1093.24.0`, but this
> is supposed to be 69.24.0. That is the MSB is being interpreted
> incorrectly.
> 
> The MSB is not part of the major version, but has generally been
> treated that way thus far.  It's actually the program, and used to
> distinguish between two programs from a similar family but different
> codebase.
> 
> Link: https://patchwork.freedesktop.org/patch/469993/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
> This change also has been submitted to GPU driver.
> 
>  drivers/platform/x86/amd-pmc.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 06b73d5c928f..c9c4db39ca62 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -124,9 +124,10 @@ struct amd_pmc_dev {
>  	u32 cpu_id;
>  	u32 active_ips;
>  /* SMU version information */
> -	u16 major;
> -	u16 minor;
> -	u16 rev;
> +	u8 smu_program;
> +	u8 major;
> +	u8 minor;
> +	u8 rev;
>  	struct device *dev;
>  	struct pci_dev *rdev;
>  	struct mutex lock; /* generic mutex lock */
> @@ -180,11 +181,13 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>  	if (rc)
>  		return rc;
>  
> -	dev->major = (val >> 16) & GENMASK(15, 0);
> +	dev->smu_program = (val >> 24) & GENMASK(7, 0);
> +	dev->major = (val >> 16) & GENMASK(7, 0);
>  	dev->minor = (val >> 8) & GENMASK(7, 0);
>  	dev->rev = (val >> 0) & GENMASK(7, 0);
>  
> -	dev_dbg(dev->dev, "SMU version is %u.%u.%u\n", dev->major, dev->minor, dev->rev);
> +	dev_dbg(dev->dev, "SMU program %u version is %u.%u.%u\n",
> +		dev->smu_program, dev->major, dev->minor, dev->rev);
>  
>  	return 0;
>  }
> 

