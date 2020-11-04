Return-Path: <SRS0=p7YD=EK=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8C7C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Nov 2020 20:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7570F207BB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Nov 2020 20:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VA3NIxNY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgKDUvz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Nov 2020 15:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbgKDUvz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Nov 2020 15:51:55 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59D0C0613D3
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2020 12:51:54 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id c20so18302723pfr.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Nov 2020 12:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vNG/ONemWaB+92k+MsCQrykc272/mR6KazlnXmI4Mwo=;
        b=VA3NIxNYVptGqzGY4xIlZa4+5blqXPQ7M/NGVhfIO7mkPXtQpmB9hHBkJtXY/dB1US
         B+YVmC6wU4AtvRwpqFxMkRefp8b7e4BvyJE59yE7zZZsoso6MAEXGCKz6YeMWkN5axXg
         dbjTe046A3FxBQe8WO9iGGA8O9eMuSrFPgvtsDjDXcv7FDGQrXMXuj5fQBSnn75W/QAv
         aqINVRujAUPJNnU05VawbJ7SoD3WF9naOQ3YyLM6KkDNqpAs661QqMJBt8ChE5x20whU
         qZH8K+8kBsoWQxC5BvUq/WCPkZvnHveTn4JgDLP4QwAkO34DtT+1mUlEIST9R+HMCpwL
         ReQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vNG/ONemWaB+92k+MsCQrykc272/mR6KazlnXmI4Mwo=;
        b=ryrdT61MGTkFEQzchocUCzi4Y5Jy5yS+9A+vU4Pr4eviBKhY0bH867RXiEeEbV+oqH
         52obWYuXSFyjisL7TC3SrbDtbdv0REiCiDqam+9r8NxRSASFNwtm3R2659WEOtFakspu
         s5tAs8uvh1kCTjryYWel5/HwHcNo2L0LqGiVj9WNvPxvAKxIhFQuO3Ebcpx6bioZbkRN
         uia4SkIkRSzH0sa5q6DrypcX9rH5V3g/Lzoq4NDBoN4Bdt505/Qh9PjukEe0kyxte5J9
         kiiQFXGR5NfacDbGBMFdzovelQn7qT6fKQEdauOIark1tum29IuxVAtG+pZLxrvqVGSN
         GgTg==
X-Gm-Message-State: AOAM5312slGgxrfEjVQ7IW876IaeXY91O3WtAPMJrMTpNlyWXKDYMuoN
        oIT5XP5bfnuGX7LhSCK+XPr6Sj6qCcJH3on5mIs=
X-Google-Smtp-Source: ABdhPJw2AkyVclkLG4C1KQsykW7dklopS5WuZ4vxCD23QYcBhl32491B+ojEUaT6VSoeclZM1OwfbXnOMDIXrN15e2c=
X-Received: by 2002:a63:4511:: with SMTP id s17mr15408023pga.4.1604523114496;
 Wed, 04 Nov 2020 12:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20201104153017.1916621-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20201104153017.1916621-1-Shyam-sundar.S-k@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Nov 2020 22:52:43 +0200
Message-ID: <CAHp75VdwJgf0eHi=B7dpnn_sz9WbsuANSgEyZCcf7-WWQ=YYtQ@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: amd-pmc: Add AMD platform support for S2Idle
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Alex Deucher <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Nov 4, 2020 at 5:31 PM Shyam Sundar S K
<Shyam-sundar.S-k@amd.com> wrote:
>
> AMD Power Management Controller driver a.k.a. amd-pmc driver is the
> controller which is meant for the final S2Idle transaction that goes to
> the PMFW running on the AMD SMU (System Management Unit) responsible for
> tuning of the VDD.
>
> Once all the monitored list or the idle constraints are met, this driver
> would go and set the OS_HINT (meaning all the devices have reached to
> their lowest state possible) via the SMU mailboxes.

...

> +AMD PMC DRIVER
> +M:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +L:     platform-driver-x86@vger.kernel.org
> +S:     Maintained
> +F:     drivers/platform/x86/amd-pmc*

Better to leave dot: amd-pmc.*

...

> +/* SMU communcation registers */

communication.

...

> +#define AMD_PMC_BASE_ADDR_HI_MASK      0xFFF00000L
> +#define AMD_PMC_BASE_ADDR_LO_MASK      0x0000FFFFL

This is the same, however I have commented on it.
Use proper macro from  bits.h.

...

> +/* SMU Response Codes */
> +#define AMD_PMC_RESULT_OK                    0x1

0x01

> +#define AMD_PMC_RESULT_FAILED                0xFF
> +#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
> +#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
> +#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC

Keep them sorted.

...

> +#define PMC_MSG_DELAY_MIN_USECS                100

_US is enough.

...

> +static struct amd_pmc_dev {
> +       u32 base_addr;
> +       u32 cpu_id;

> +       void __iomem *regbase;

If you make this a first member the below IO accessor will be
optimized by the compiler better.

> +       void __iomem *smu_base;

This probably will be second for the sake of consistency.

> +       struct device *dev;
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +       struct dentry *dbgfs_dir;
> +#endif /* CONFIG_DEBUG_FS */
> +} pmc;

Can you split structure declaration and a variable of the new type?

...

> +       /* Wait until we get a valid response */
> +       rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +                               val, val > 0, PMC_MSG_DELAY_MIN_USECS,
> +                               PMC_MSG_DELAY_MIN_USECS * RESPONSE_REGISTER_LOOP_MAX);
> +       if (rc) {
> +               dev_err(dev->dev, "failed to talk to SMU\n");

> +               return -ETIMEDOUT;

Why not
  return rc;
?

> +       }

...

> +       dev->cpu_id = rdev->device;
> +       err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
> +       if (err) {
> +               dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);

> +               return -err;

What are you doing?
The PCI API can return all possible error codes: Linux native
(negative values), 0 as success, positive as special PCI error codes.
Look at the pci.h and find a way how to handle this properly.

> +       }

...

> +       dev->smu_base = ioremap(base_addr, AMD_PMC_MAPPING_SIZE);

devm_ioremap() ?

Why ignored this comment?

> +       if (!dev->smu_base)
> +               return -ENOMEM;
> +
> +       dev->regbase = ioremap(base_addr + AMD_PMC_BASE_ADDR_OFFSET, AMD_PMC_MAPPING_SIZE);

Ditto.

> +       if (!dev->regbase) {
> +               iounmap(dev->smu_base);
> +               return -ENOMEM;
> +       }

-- 
With Best Regards,
Andy Shevchenko
