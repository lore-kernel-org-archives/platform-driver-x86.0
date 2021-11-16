Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D93E2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 13:31:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B658561B49
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 13:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhKPNeb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 08:34:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34360 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234290AbhKPNea (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 08:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637069493;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DdX7vbzTDeZ45wDkWnHFI2sFyFpZgfNzSbHInhd7M/k=;
        b=X6s9hZMSjlcUinStVar4xpSNuWiGKQWKGdRmMHn5ZvqKeShrs8iyuF91jQJ9Cc94fIAvVI
        xlI0oUJ1DGpQMAgJd/ld4e9YNThADOizQN5fitG4mMjCnsEJRh3eKlmVORDyvefAgEkU8s
        Yw4V3txqwgMf8DQ2ehRfzagKaqHGAF0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-CMd0NKk6PQOiGMi275fbaQ-1; Tue, 16 Nov 2021 08:31:32 -0500
X-MC-Unique: CMd0NKk6PQOiGMi275fbaQ-1
Received: by mail-ed1-f69.google.com with SMTP id m8-20020a056402510800b003e29de5badbso17162066edd.18
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Nov 2021 05:31:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DdX7vbzTDeZ45wDkWnHFI2sFyFpZgfNzSbHInhd7M/k=;
        b=Xhhsp53F8kqyCf3vvaexvgiAZx8PzSt2P9a5iyZaZ+MvkMa4aUYbepogQCLL/5eaK6
         ihf6VAu9isPA/SCSUvQfYn5ZFgObBnYX1tgemxes7v9kCq0edQMkoV4DWcBKahTcUU1o
         X8FCKrCTKzoQbUeHLY3+R0CYpKMZg+jGQkV0XlRA/SvKVLBXRajpEHjnd/bWP9HGUml8
         V+zzN7ZKeF7PVueM63ecIyY1mjEgE0VnEOQWLFGjWA2b9nUhVlcrHaDZnTL3c1oMvEtf
         cnagaUi+NzUYn2XN0WY9emyeW8rlAifeTbZ6KdRJT8/TyCuRbztj8Ia+try5l1QUDsBw
         O3tw==
X-Gm-Message-State: AOAM533EI1KwicHZ/LMTXMkew8x25oQQNi+6PV7H5u+u9Oli8d92wBy1
        Oya0vC6hfqEju8DAjsGRocmWWXBpfg1XbBJKVWa/utQGJPo/ZHdOR4Ldbel7h7z9iNcEunBU0hH
        yX8mWtIpGN3F+rOFWGqgl5eEyOS5hWoFDgQ==
X-Received: by 2002:a05:6402:845:: with SMTP id b5mr10393785edz.392.1637069490876;
        Tue, 16 Nov 2021 05:31:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGZ2AfLtShAgMXFNDdX/543QS3dbvXyJ7v8CUlOZ7TtWXula/g8K9YrrivdXKX86FSeTLZUQ==
X-Received: by 2002:a05:6402:845:: with SMTP id b5mr10393760edz.392.1637069490663;
        Tue, 16 Nov 2021 05:31:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t20sm3153331edv.81.2021.11.16.05.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 05:31:30 -0800 (PST)
Message-ID: <94fff162-0c75-496e-37bd-fd7dab980153@redhat.com>
Date:   Tue, 16 Nov 2021 14:31:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 2/3] platform/x86: amd-pmc: Store the pci_dev instance
 inside struct amd_pmc_dev
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        mgross@linux.intel.com,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20211029172304.2998-1-Sanket.Goswami@amd.com>
 <20211029172304.2998-3-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211029172304.2998-3-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/29/21 19:23, Sanket Goswami wrote:
> Store the root port information in amd_pmc_probe() so that the
> information can be used across multiple routines.
> 
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v5:
> - Remove pci_dev_put() from amd_pmc_remove() as its no longer required.
> 
> Changes in v4:
> - No change.
> 
> Changes in v3:
> - Add pci_dev_put() in amd_pmc_remove().
> 
> Changes in v2:
> - Store the rdev info in amd_pmc_probe() as suggested by Hans.
> 
>  drivers/platform/x86/amd-pmc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 9af02860ed59..ea099f7759f2 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -121,6 +121,7 @@ struct amd_pmc_dev {
>  	u16 minor;
>  	u16 rev;
>  	struct device *dev;
> +	struct pci_dev *rdev;
>  	struct mutex lock; /* generic mutex lock */
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>  	struct dentry *dbgfs_dir;
> @@ -538,6 +539,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	dev->cpu_id = rdev->device;
> +	dev->rdev = rdev;
>  	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
>  	if (err) {
>  		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> 


I'm afraid this is still not correct:

1. The pci_dev_put() at line 570 is still there, so after that line
   you no longer have a reference to the pci_dev and the pointer may
   end up pointing to free-ed memory

2. Once you drop the pci_dev_put() at line 570, all the error-exit
   paths from probe after that, like this one :

        dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
                                    AMD_PMC_MAPPING_SIZE);
        if (!dev->regbase)
                return -ENOMEM;

   need to be changed to now, put the rdev (since that is now no longer
   done on line 570), so this needs to be changed to:

        dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
                                    AMD_PMC_MAPPING_SIZE);
        if (!dev->regbase) {
                err = -ENOMEM;
                goto err_pci_dev_put;
        }

   and the same for:

        dev->fch_virt_addr = devm_ioremap(dev->dev, fch_phys_addr, FCH_SSC_MAPPING_SIZE);
        if (!dev->fch_virt_addr)
                return -ENOMEM;

3. Since you now keep the reference on a succesfull probe, you need to add a

        pci_dev_put(dev->rdev);

   call to amd_pmc_remove()


Note that the changelog says you already did 3. in v3 but for some reason you
have completely dropped that and related changes now again :|

I've already asked for these changes and explained what you needed to do
several times now; and to be honest this is growing quite tiresome.

You should have noticed that somehow the changes from v3 disappeared here
yourself.

Please be more thorough and check your own work before posting for v6.

Regards,

Hans

