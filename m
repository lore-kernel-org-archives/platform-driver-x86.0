Return-Path: <SRS0=FuY/=EL=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7637C00A89
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 12:39:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E47320936
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Nov 2020 12:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sY3fQpRJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKEMjm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Nov 2020 07:39:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgKEMjm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Nov 2020 07:39:42 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7950EC0613CF
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2020 04:39:38 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 72so1407470pfv.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2020 04:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=doBfdtf39N3Nc9HZx/DyCwVxZXi0vUSXLPKn9GMCE8E=;
        b=sY3fQpRJqlj9ZThEPc5bbY5E6ga2YHn/lljoZXvAkhNvMKIEDdZqrq5edit7/wfhsq
         fgPdtNHHRKiVn1QDkVYfP3SjVoJdXCDhu2V3EHHq4iFN8E2iCcGmrlXKVJKePexWaXHA
         GOt6kavaiHVFnnsPgLjV6q9MUcl01pR4c4mPUPT2/Jb+53/gYZ0+rcNQEbwKP+NPLA2u
         jqSoU8yXDVN/wyhDUlv/EhJECLXYah7IHh/hDGGMGUAjXOPLcYWZ6vL7WUbsv9iGYhj3
         Ir5Pa4YAxCXTbNhtNVxU7kwswrOdYuNpCED1yAaJ5cvSyOo3UgvfHjjBvybg9v43Ult+
         l2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=doBfdtf39N3Nc9HZx/DyCwVxZXi0vUSXLPKn9GMCE8E=;
        b=Uk8q9xebVjDOFqvUxEXDp9Va6Lf3biIb+TKIvVrKmZIGVSBsg+wCmwZpMQ9e9XtlLp
         GL+1OCx7ihewMptqMAtPDaAba2JQHsZlCg/jyu5tlGYlPDDFY1nZk8lz5AlViF2EWLCm
         Bh8qlpk6iygmVCLN1eUEnFqrwUD5ibsq1pkkR2z/xufqUWVBq8kES50WRZU0FK8mZu//
         yU0Qzod+WG8aCY5IG/EDEzXHyQHkpZxUsKqr8pEXvAekCYGlFwxRT/SMB9O5GZn+r6wZ
         rc9+aoiCJ3RhORrnbYdqMhoMJnDjnwf+Oa0d2XKSwuQAx3aJ/5IQfXZIeEUlaOK1TzSo
         x4ag==
X-Gm-Message-State: AOAM530lI/42G0oXCRv7B6x1isVofxsCzIzsBpXkhmgsybNdACehhniN
        01AEa92H8r3MS0diLvgKFBbQ2WcOxup7gBcydgc=
X-Google-Smtp-Source: ABdhPJyxBQDN4F/NEuK9EdLjhWPIwI+xUkRWTSqgpiDoWdA/6trZtKejIUqc8mRh8Ti4dtsAyjuCX9YyJiQYriB+tBE=
X-Received: by 2002:a63:d54e:: with SMTP id v14mr2271154pgi.203.1604579977967;
 Thu, 05 Nov 2020 04:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20201105121759.2954548-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20201105121759.2954548-1-Shyam-sundar.S-k@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 14:40:26 +0200
Message-ID: <CAHp75Vfur2v1DCxrPMf5aAuWuMtQ9iehE-K1uz7041fNqT8uCA@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: amd-pmc: Add AMD platform support for S2Idle
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Alex Deucher <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Nov 5, 2020 at 2:18 PM Shyam Sundar S K
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
>
> This driver would also provide some debug capabilities via debugfs.

The rule of thumb when a reviewer gives you a comment against one
place, you have to look for the similar cases in your entire
submission!

...

> +/* SMU Response Codes */
> +#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
> +#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
> +#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
> +#define AMD_PMC_RESULT_FAILED                0xFF
> +#define AMD_PMC_RESULT_OK                    0x01

I meant sorted by value.

...

> +static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> +{

> +}
> +

Extra blank line.

> +#else
> +static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> +{
> +}
> +
> +static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
> +{
> +}
> +#endif /* CONFIG_DEBUG_FS */

...

> +       err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
> +       if (err) {
> +               dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);

> +               return pcibios_err_to_errno(err);

Bingo!
But... (see also remark at the beginning of this message)

> +       }
> +
> +       err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
> +       if (err)

> +               return err;

..?!

...

> +static struct platform_driver amd_pmc_driver = {

> +};

> +

Extra blank line.

> +module_platform_driver(amd_pmc_driver);

-- 
With Best Regards,
Andy Shevchenko
