Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95AB3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 23:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7499F6101E
	for <platform-driver-x86@archiver.kernel.org>; Fri, 29 Oct 2021 23:28:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhJ2Xai (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 29 Oct 2021 19:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2Xai (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Oct 2021 19:30:38 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55397C061570
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Oct 2021 16:28:09 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g10so43362783edj.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Oct 2021 16:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LPS0v9qOy+VTcd5d1O1sy5KZkF6HOdBOrgNA8aGdNeM=;
        b=N6vyQ3CdGIbW+lS8xk+UVbOlZw2NOnmeaap92uHm7UHwpCCPyNAFDgrnv332t+O1xu
         N68hlDjQXOOdBDLBu0MKBzmhYfklDzJLC0H767C9qBf4EZmmMHkZUM/mssRRB1K5XfQ2
         SjI8QpNKVXX8x4wMn3er6plYWL5Jrj02v/sQjhTx5fCIA/zhfu4LE7sH0hWBN7Qe9VO/
         dMDJ0OeZ9T7hD4/fVR2SR56DTnoM/3yEdH+LOVrl9BhIptYhO746x3DUhvi+xoz2mpVB
         YUuB8uqHu49CMp1YSCP8UCZipaI73eT4irMeJ2XWnhd6y+QZxcHjFGGkRNB3tPlVsrUi
         xoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LPS0v9qOy+VTcd5d1O1sy5KZkF6HOdBOrgNA8aGdNeM=;
        b=kjZYSU5U/yCPbYcVgWQaysQ6Y7L/RjoMUzAB3xewzclT5WhYCrD13ZQfl0YHlaJSr8
         lrXD/vTU5nwlpdnUNruEtVdHoWiX+wsiYMQqVh+5cwdOvUFirePgbXVx6R2r0Hp3mnGo
         GOEz/cqONlZKxupr/4/GY9Dw8BiErZg0q8oTN+z3rzkavikZoZz2ZEgO9JbiS9493dQv
         uagiO844/UZvAznslCDI6Qs9ZKjl5gKsTppDfqLUHB3tzh+ZFKPTO71R2H/ADSVedfrb
         ih1By+JU7Cmoqtv3NN8J+ziSEtkdaMI9COyIZHyyTdaKay5R4LdttIGpEwv3l9ouE0c/
         1khQ==
X-Gm-Message-State: AOAM531hZ1CYWpfYCLzbVfN4bPyw0+jtsKOoagoeXlvJ2Jb0pfp+M/DG
        zWAX57cZiwNWcuGS6kDG6r1jXCPoqRvVWpvv4MM=
X-Google-Smtp-Source: ABdhPJyCUzWbLulHjnweVof5tWWm49KdLzLkHAEhu4IpUIvwsxEQQw+bP4WrvX+j7oO0CXb97LT/PrI/FciGVR47/WQ=
X-Received: by 2002:a17:906:a382:: with SMTP id k2mr16802984ejz.454.1635550087946;
 Fri, 29 Oct 2021 16:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211029172304.2998-1-Sanket.Goswami@amd.com> <20211029172304.2998-3-Sanket.Goswami@amd.com>
In-Reply-To: <20211029172304.2998-3-Sanket.Goswami@amd.com>
From:   Scott Bruce <smbruce@gmail.com>
Date:   Fri, 29 Oct 2021 16:27:56 -0700
Message-ID: <CAPOoXdGt7vnbM9_gEiz84_M3wsYEADLs9hGdT0ch4kVKPauo8g@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] platform/x86: amd-pmc: Store the pci_dev instance
 inside struct amd_pmc_dev
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
>         u16 minor;
>         u16 rev;
>         struct device *dev;
> +       struct pci_dev *rdev;
>         struct mutex lock; /* generic mutex lock */
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>         struct dentry *dbgfs_dir;
> @@ -538,6 +539,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>         }
>
>         dev->cpu_id = rdev->device;
> +       dev->rdev = rdev;
>         err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
>         if (err) {
>                 dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> --
> 2.25.1
>
