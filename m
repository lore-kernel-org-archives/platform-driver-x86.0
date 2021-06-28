Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13158C11F64
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE8A661C89
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:46:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbhF1Ss3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:48:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232350AbhF1Ss1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 14:48:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202FAC061574
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 11:46:01 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id hq39so31617363ejc.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 11:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4YN1HlcpGva7x+bpND2EnMoeDvVaHBU+ucmSR+3U5UQ=;
        b=BTDgV1UParrZs7SmrKBC5Q4ADeHFJkHs3EtDS8mk2aSkGKCKEOhHKfyHrclbLwZpa+
         FvG3hyP3REcEXYwcRi1UOMs2b/i5dKrCfDBhjrGJooppGAwRKtapLx8dBh46Fx2i3XEA
         NtXvTsKppy5DW3FnLLEm7DkbxWKNYLS4grI7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4YN1HlcpGva7x+bpND2EnMoeDvVaHBU+ucmSR+3U5UQ=;
        b=GMQ8D4bBhJhmJfzzD6dsp0pnS/N+QLQiULtMSNi8yw5zMozPxQ7SAS19WFfds1s6pb
         zfkWe6C1FaWp+6OHPGsBwPJQuc8zx6Mn2jEnYb69mhygC9bLvfUvrNkRGpXmkyGKEQWO
         nP2zC2GABaEPOAB5giI/hfPS7p7Ef3Y7ZCga1sJs01BSO9wV3kmv+TI/heR5kP0y6VWv
         S36/MZ/r6qeUeCjd/M9y+aKc8GAdrWdsJrIqTLs/oNRBJFXzzP0pUhqUrxclm6y6vHlA
         ow4tWbgWCNdHGyU2dihmoo5Xg5E5XH6W1hdlamId+/C/rUAzyEGv4eM7hDHbagw92bmp
         UhfA==
X-Gm-Message-State: AOAM530v6UMRv8jO3L0qhOn0HHyVMFWsuthT98qneBRkJzhCCrrnlrad
        r/wBedeZdlMk7SJO7YtxAxCz7pXfcQFP4w==
X-Google-Smtp-Source: ABdhPJyI87JbGRhYlEGsimi4YehfcumAuuiw8cM9zd4MtKSg52crt3PFVjVKf7N5CGRtFX8/4WoeIA==
X-Received: by 2002:a17:906:4a55:: with SMTP id a21mr25927983ejv.209.1624905959269;
        Mon, 28 Jun 2021 11:45:59 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id e16sm736284edr.86.2021.06.28.11.45.58
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 11:45:58 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id h17so27355399edw.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 11:45:58 -0700 (PDT)
X-Received: by 2002:a05:6402:2913:: with SMTP id ee19mr34418102edb.361.1624905958072;
 Mon, 28 Jun 2021 11:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210628180403.236553-1-Shyam-sundar.S-k@amd.com> <20210628180403.236553-2-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20210628180403.236553-2-Shyam-sundar.S-k@amd.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Mon, 28 Jun 2021 12:45:47 -0600
X-Gmail-Original-Message-ID: <CAHQZ30COfU8PdxHMFspudWYxoJ_aqqNGicjgni3L1=J_z+amLg@mail.gmail.com>
Message-ID: <CAHQZ30COfU8PdxHMFspudWYxoJ_aqqNGicjgni3L1=J_z+amLg@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] platform/x86: amd-pmc: Fix command completion code
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, mgross@linux.intel.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 28, 2021 at 12:04 PM Shyam Sundar S K
<Shyam-sundar.S-k@amd.com> wrote:
>
> The protocol to submit a job request to SMU is to wait for
> AMD_PMC_REGISTER_RESPONSE to return 1,meaning SMU is ready to take
> requests. PMC driver has to make sure that the response code is always
> AMD_PMC_RESULT_OK before making any command submissions.
>
> When we submit a message to SMU, we have to wait until it processes
> the request. Adding a read_poll_timeout() check as this was missing in
> the existing code.
>
> Also, add a mutex to protect amd_pmc_send_cmd() calls to SMU.
>
> Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2: no change
> v3:
>  - use mutex to protect multiple calls to SMU
>  - add a switch-case to handle smu responses.
> v4:
>  - Handle different error codes based on smu responses.
>
>  drivers/platform/x86/amd-pmc.c | 39 ++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index b9da58ee9b1e..e3262ed967d9 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -68,6 +68,7 @@ struct amd_pmc_dev {
>         u32 base_addr;
>         u32 cpu_id;
>         struct device *dev;
> +       struct mutex lock; /* generic mutex lock */
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>         struct dentry *dbgfs_dir;
>  #endif /* CONFIG_DEBUG_FS */
> @@ -138,9 +139,10 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>         u8 msg;
>         u32 val;
>
> +       mutex_lock(&dev->lock);
>         /* Wait until we get a valid response */
>         rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> -                               val, val > 0, PMC_MSG_DELAY_MIN_US,
> +                               val, val != 0, PMC_MSG_DELAY_MIN_US,
>                                 PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>         if (rc) {
>                 dev_err(dev->dev, "failed to talk to SMU\n");
> @@ -156,7 +158,38 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>         /* Write message ID to message ID register */
>         msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
>         amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
> -       return 0;
> +       /* Wait until we get a valid response */
> +       rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +                               val, val != 0, PMC_MSG_DELAY_MIN_US,
> +                               PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
> +       if (rc) {
> +               dev_err(dev->dev, "SMU response timed out\n");
> +               rc = -ETIMEDOUT;
readx_poll_timeout will return `-ETIMEDOUT`, so no need to override the rc.

> +               goto out_unlock;
> +       }
> +
> +       switch (val) {
> +       case AMD_PMC_RESULT_OK:
> +               break;
> +       case AMD_PMC_RESULT_CMD_REJECT_BUSY:
> +               dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
> +               rc = -EBUSY;
> +               goto out_unlock;
> +       case AMD_PMC_RESULT_CMD_UNKNOWN:
> +               dev_err(dev->dev, "SMU cmd unknown. err: 0x%x\n", val);
> +               rc = -EINVAL;
> +               goto out_unlock;
> +       case AMD_PMC_RESULT_CMD_REJECT_PREREQ:
> +       case AMD_PMC_RESULT_FAILED:
> +       default:
> +               dev_err(dev->dev, "SMU cmd failed. err: 0x%x\n", val);
> +               rc = -EIO;
> +               goto out_unlock;
> +       }
> +
> +out_unlock:
> +       mutex_unlock(&dev->lock);
> +       return rc;
>  }
>
>  static int __maybe_unused amd_pmc_suspend(struct device *dev)
> @@ -259,6 +292,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>
>         amd_pmc_dump_registers(dev);
>
> +       mutex_init(&dev->lock);
>         platform_set_drvdata(pdev, dev);
>         amd_pmc_dbgfs_register(dev);
>         return 0;
> @@ -269,6 +303,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
>         struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
>
>         amd_pmc_dbgfs_unregister(dev);
> +       mutex_destroy(&dev->lock);
>         return 0;
>  }
>
> --
> 2.25.1
>

With that minor change,
Acked-by: Raul E Rangel <rrangel@chromium.org>
