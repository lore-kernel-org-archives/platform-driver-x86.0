Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D773C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 23:27:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B52961075
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 23:27:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhJ2XaS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Oct 2021 19:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2XaS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Oct 2021 19:30:18 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA30C061570
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Oct 2021 16:27:48 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id j21so20751197edt.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Oct 2021 16:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PzNNNayUTq57d+/mA8dEyM2Ww8tldNlFNrt6TaTV1ks=;
        b=XJZ2q1goqETMj50ZgOEyVNDaNTn5hzzhJk+NtjxXH37LTmqJB2VeHrTwoOwbCTsEZP
         ezThDbKkqI82sPp8Nvdlt/FDK7pz+QYr0eFuifH0XFKZiEE7hnkAeVJRuKQ2UKq9CydW
         Nap6rS7xOSguP55ZnpG6M00rwxznEoYaTy2BHvgVvm3wQlgR1B1GOQiKehnp8jmXHtbF
         H9EDsq32mA647Vz5u2eKWKxJD29sZbbEEHKBHGuLJwPaa7kW6PhJf4geGXlzz9dgurMM
         8Uv5Alr0RtJpaG6dwWDOy5wRTnqH/X3p01V76Mq8FaP3o2ohnHYSa4wAem9U421GRMx1
         FSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PzNNNayUTq57d+/mA8dEyM2Ww8tldNlFNrt6TaTV1ks=;
        b=DpbtjF2UdnlpuGdPwhUkMvukPYujV8NqLkJOlJ8KHMN5RgIMcOUn5JHdqVAmbakgHD
         P+IfwEBHKU996T1T6VEtmkEGggOMjkUpLZrmb+Hj4Elsb/ckE5iY/o0GOtsE9Bc/2aIt
         +dwjEukRMCU0SvkVEFWOc8mRoimKOOcl8AG0SNWZ9ebuR7HJze7B9NYnoAf9HxANUQ/9
         scyRMGc5SNi3LPByjsd9uicvAcUQIUxsXUxrKykM6fEZftkHeTk7EUcCJzqBQmxqpugF
         c+8klo6508AzFQCejENIyTXYW/1JnM9rpQDTqZrGSuDOfS+wOBE9PK7PytXv7lIEZaCk
         re1A==
X-Gm-Message-State: AOAM5325wZff+JFJ5eeY/6FaxK8zVrxELU5bvWTZ+yu7mRcleER6Ga1D
        9d+0btVVnTCHrKlKCn1s8+8zMvNiAPm2sBu4A18=
X-Google-Smtp-Source: ABdhPJz51a5EBiu6h9gzN3J0cZjOC7Avitt9Xp3ZfszA+9kyybJ0kQxhAkOsyVuWYYWwF1sO/gr9/5DYIFLMYKSsBy8=
X-Received: by 2002:aa7:d2d6:: with SMTP id k22mr1708612edr.14.1635550067449;
 Fri, 29 Oct 2021 16:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211029172304.2998-1-Sanket.Goswami@amd.com> <20211029172304.2998-2-Sanket.Goswami@amd.com>
In-Reply-To: <20211029172304.2998-2-Sanket.Goswami@amd.com>
From:   Scott Bruce <smbruce@gmail.com>
Date:   Fri, 29 Oct 2021 16:27:36 -0700
Message-ID: <CAPOoXdHjR5u_Rw1OuVdU8+NapPMFT43AtitPV2oxmj1feLczAA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] platform/x86: amd-pmc: Simplify error handling path
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Tested-by: Scott Bruce <smbruce@gmail.com>

On Fri, Oct 29, 2021 at 10:25 AM Sanket Goswami <Sanket.Goswami@amd.com> wrote:
>
> Handle error-exits in the amd_pmc_probe() so that the code duplication
> is reduced.
>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v5:
> - Use goto label incase of error-exit path.
>
> Changes in v4:
> - No change.
>
> Changes in v3:
> - No change.
>
> Changes in v2:
> - No change.
>
>  drivers/platform/x86/amd-pmc.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index b7e50ed050a8..9af02860ed59 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -533,22 +533,22 @@ static int amd_pmc_probe(struct platform_device *pdev)
>
>         rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
>         if (!rdev || !pci_match_id(pmc_pci_ids, rdev)) {
> -               pci_dev_put(rdev);
> -               return -ENODEV;
> +               err = -ENODEV;
> +               goto err_pci_dev_put;
>         }
>
>         dev->cpu_id = rdev->device;
>         err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
>         if (err) {
>                 dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> -               pci_dev_put(rdev);
> -               return pcibios_err_to_errno(err);
> +               err = pcibios_err_to_errno(err);
> +               goto err_pci_dev_put;
>         }
>
>         err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
>         if (err) {
> -               pci_dev_put(rdev);
> -               return pcibios_err_to_errno(err);
> +               err = pcibios_err_to_errno(err);
> +               goto err_pci_dev_put;
>         }
>
>         base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
> @@ -556,14 +556,14 @@ static int amd_pmc_probe(struct platform_device *pdev)
>         err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_HI);
>         if (err) {
>                 dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> -               pci_dev_put(rdev);
> -               return pcibios_err_to_errno(err);
> +               err = pcibios_err_to_errno(err);
> +               goto err_pci_dev_put;
>         }
>
>         err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
>         if (err) {
> -               pci_dev_put(rdev);
> -               return pcibios_err_to_errno(err);
> +               err = pcibios_err_to_errno(err);
> +               goto err_pci_dev_put;
>         }
>
>         base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
> @@ -594,6 +594,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, dev);
>         amd_pmc_dbgfs_register(dev);
>         return 0;
> +
> +err_pci_dev_put:
> +       pci_dev_put(rdev);
> +       return err;
>  }
>
>  static int amd_pmc_remove(struct platform_device *pdev)
> --
> 2.25.1
>
