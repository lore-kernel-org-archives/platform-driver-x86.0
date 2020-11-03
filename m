Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A26DC2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 22:50:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3718320735
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 22:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YowSrbER"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730690AbgKCWuA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 17:50:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730639AbgKCWuA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 17:50:00 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E336C0613D1
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2020 14:49:59 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 133so15615059pfx.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 14:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QYMXX8Mv9+Hh13Oa3p3q+eHnSYsEgEDKETeBqpeIz2g=;
        b=YowSrbERTIhawaQviw8I7K4G2C3MeAh6zHoIMR7uqO16sqyJgB2pjbyvD5Z07yR+KQ
         b2unRlxcD08sKKPvV8gZJvDgiDM00iSOVJYzzu0I7mEc8otyWHvUEjhVuDHXQlbZyI+6
         9XqdBrVFpaGm/yLNuVp4I7OUhLoXRNgzD+ufozMe/Mh8A351GoRGcJJnOVgOilxUwKgn
         SsTUo7Wt/yRVhToGXX7nkMxZgpw9pBzeARRSRYFwyEQJDGEcaDMGtG6ySIsd5+7vAyF9
         oyAGRDcnb24J7sk9kEzXpkgM02xsN1CLmhWp3zMMLrmXQRV1rsF2Ks8rL2DRqjh4T7JW
         8b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QYMXX8Mv9+Hh13Oa3p3q+eHnSYsEgEDKETeBqpeIz2g=;
        b=MzweclP0m5hkoWvMfbrEkPdYUUiU6NxMPOdJ8t/dY5VPx8BX5kX/it4ebQt7gNse5j
         TpSFsCA/JJi40DpfYKQwaip72S47geWBG680HiaJQSHMRvL3VPwd5/5P+z9CuW60rDd4
         SWaUgSs5M6AW5UlRV/yuQwzowJu1c05m9Z3KjO3R3Qtizu8RCAzoXZ+mS2rJJZaxqI5x
         9r1iag5vdPzY1icB2JZiKrLDEDPmQWY+1qEVkcIF6sIsevqDEWld6nfrxvY1YAAqjtQM
         Ur2f/r6494EHPojA+8SiD9AHrUaPj8zwobbE5QBBwCnIWjcoO9C+NOypLFZTiFyFzkrd
         ssiA==
X-Gm-Message-State: AOAM533PFZ/nPDwBA+ZENoNI2VNeDTIjJnVi0wQeNokUGDJfB9J8ezv9
        mVyaFk+QZ32gzchtZVRVyRVDfvcqs7kqX96Y4Gk=
X-Google-Smtp-Source: ABdhPJzo05Bl33weywraRFYtXPHTD0obWhwYnfocvfGUauSo6ivKZ5KVEY5j8hWo489DmutV86AsgO2fnMVgcu1VJMQ=
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr1395972pjs.181.1604443798614;
 Tue, 03 Nov 2020 14:49:58 -0800 (PST)
MIME-Version: 1.0
References: <20201028185654.2692118-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20201028185654.2692118-1-Shyam-sundar.S-k@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 Nov 2020 00:49:42 +0200
Message-ID: <CAHp75VdzK_Uu5hrjSHbX_aRA9xOvcDhh91WNMx+3Ova6Y3jFig@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Add AMD platform support for S2Idle
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Alex Deucher <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Oct 29, 2020 at 10:57 AM Shyam Sundar S K
<Shyam-sundar.S-k@amd.com> wrote:
>
> AMD Power Management Controller driver aka. amd-pmc driver is the

aka. -> a.k.a. or AKA

> controller which is meant for final S2Idle transaction that goes to the

for the final

> PMFW running on the AMD SMU (System Management Unit) responsible for
> tuning of the VDD.
>
> Once all the monitored list or the idle constraints are met, this driver
> would go and set the OS_HINT (meaning all the devices have reached to
> their lowest state possible) via the SMU mailboxes.
>
> This driver would also provide some debug capabilities via debugfs.

...

> +F:     drivers/platform/x86/amd-pmc.c
> +F:     drivers/platform/x86/amd-pmc.h

Can be one entry.

...

> +       help
> +         The driver provides support for AMD Power Management Controller
> +         primarily responsible for S2Idle transactions that are driven from
> +         a platform firmware running on SMU. This driver also provides debug

a debug

> +         mechanism to investigate the S2Idle transactions and failures.

How will the module be called?

...

> +static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> +{
> +       struct dentry *dir;

What is the point of having the temporary variable?

> +       dir = debugfs_create_dir("amd_pmc", NULL);
> +       dev->dbgfs_dir = dir;
> +       debugfs_create_file("smu_fw_info", 0644, dir, dev, &smu_fw_info_fops);
> +}

...

> +static int amd_pmc_poll_smu_response(struct amd_pmc_dev *dev)
> +{
> +       int rc = 0, index;

Redundant assignment.

> +       for (index = 0; index < RESPONSE_REGISTER_LOOP_MAX; index++) {
> +               rc = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);

> +               if (rc != 0)
> +                       break;

if (rc)
  return rc;

> +
> +               usleep_range(PMC_MSG_DELAY_MIN, PMC_MSG_DELAY_MAX);
> +       }
> +
> +       return rc;
> +}

Seems like home grown readx_poll_timeout().

...

> +       int rc = 0;

Redundant assignment.

...

> +       /* Wait until the response register is non-zero */

This comment is confusing.

I guess you rather need to return an error code from the called function...

> +       rc = amd_pmc_poll_smu_response(dev);
> +       if (!rc) {
> +               dev_err(dev->dev, "failed to talk to SMU\n");

> +               return -EIO;

...and propagate it here.

> +       }

...

> +       if (arg) {
> +               /* Wait until the response register is non-zero */
> +               rc = amd_pmc_poll_smu_response(dev);

> +               if (!rc) {

As above. This is an unusual pattern in the kernel.

> +                       dev_err(dev->dev, "failed to talk to SMU\n");
> +                       return -EIO;
> +               }

> +               /* If message register is OK, then SMU has finished processing
> +                * the message, and then read back from AMD_PMC_REGISTER_ARGUMENT
> +                */

Comment style!

> +               rc = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);

And where is rc going?

> +       }
> +
> +       return 0;

...

> +#ifdef CONFIG_PM_SLEEP

__maybe_unused is slightly better.

...

> +static int amd_pmc_suspend(struct device *dev)
> +{
> +       struct amd_pmc_dev *pdev = dev_get_drvdata(dev);

> +       int rc = 0;

What is the point?

> +       rc = amd_pmc_send_cmd(pdev, 1, 0);
> +       if (rc)
> +               dev_err(pdev->dev, "suspend failed\n");
> +
> +       amd_pmc_dump_registers(pdev);
> +
> +       return 0;
> +}
> +
> +static int amd_pmc_resume(struct device *dev)
> +{
> +       struct amd_pmc_dev *pdev = dev_get_drvdata(dev);

> +       int rc = 0;

Ditto.

> +       rc = amd_pmc_send_cmd(pdev, 0, 0);
> +       if (rc)
> +               dev_err(pdev->dev, "resume failed\n");
> +
> +       amd_pmc_dump_registers(pdev);
> +
> +       return 0;
> +}
> +#endif

...

> +       rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> +       if (!rdev || (!(rdev->vendor == PCI_VENDOR_ID_AMD) &&
> +                     (rdev->device == AMD_CPU_ID_PCO ||
> +                       rdev->device == AMD_CPU_ID_RN))) {
> +               return -ENODEV;
> +       }

Can you rather create an additional PCI ID table and simple use pci_match_id()?

> +       err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
> +       if (err) {
> +               dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> +               return err;
> +       }

Returning positive error codes?!

...

> +       dev->smu_base = ioremap(base_addr, AMD_PMC_MAPPING_SIZE);

devm_ioremap()?

> +       if (!dev->smu_base)
> +               return -ENOMEM;
> +
> +       dev->regbase = ioremap(base_addr + AMD_PMC_BASE_ADDR_OFFSET, AMD_PMC_MAPPING_SIZE);

Ditto.

> +       if (!dev->regbase) {
> +               iounmap(dev->smu_base);
> +               return -ENOMEM;
> +       }

...

> +               .acpi_match_table = ACPI_PTR(amd_pmc_acpi_ids),

It depends on ACPI. What is the point of ACPI_PTR?

...

> +

Redundant blank line

> +module_platform_driver(amd_pmc_driver);

...

> +++ b/drivers/platform/x86/amd-pmc.h

Who is going to use this file?

...

> +#define AMD_PMC_BASE_ADDR_HI_MASK      0xFFF00000L
> +#define AMD_PMC_BASE_ADDR_LO_MASK      0x0000FFFFL

You included bits.h and not using it, why?

...

> +#define PMC_MSG_DELAY_MIN              100
> +#define PMC_MSG_DELAY_MAX              200

Units?

...

> +enum amd_pmc_def {
> +       msg_test = 0x01,
> +       msg_os_hint_pco,
> +       msg_os_hint_rn,
> +};

Hmm... Perhaps capital letters?

-- 
With Best Regards,
Andy Shevchenko
