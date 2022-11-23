Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F025EC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Nov 2022 17:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238968AbiKWRrm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Nov 2022 12:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239144AbiKWRrl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Nov 2022 12:47:41 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DA72CE03
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Nov 2022 09:47:38 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id l8so22184316ljh.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Nov 2022 09:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9nz9iEcY2kdM43iSCySU+3LqfVVEhngM0To5eDK7hgY=;
        b=UUHKkbK6uQco9NM+AqOONI3WNrPyE0Yr1XzCwOEODPgoPGwx+Vig7iVCLBwNiZHLDo
         ir6ISsc/BuhvKmkj3e1wOurKH/RJ+Ej27fjYPAq++SHiLYQ3TKsxe2N/twlxywySmx2o
         z/So/hLQpoIc9YOhNIqL6V2/pgzumHnREHPTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nz9iEcY2kdM43iSCySU+3LqfVVEhngM0To5eDK7hgY=;
        b=gXeZ4LJ4a8PkmUu1B6NzlDpE65V1lOnEUppXFALM3y2l4IdcBwT6Dp65k7PN7Zg+Oi
         1Rv0xeqMojZBPI1InM13oyy9M5ih+FPh7pgIs3FnrrRkIJEXs0E5QuYYGqRu6kZpik7C
         PoAPcMAioZwpPTe8r+hhqrUqkZrSdgwhKkqOpAg3J3X8Wt4weajoJK481D87BfGSr6Bl
         GbGDHIGHnjVZDHGzdC3CvzU88+PFHFqJ83R2XPl0z2hlnP5p1uPvNwFMz+Z7gbGTNVz4
         fnU3i+2bpnMY3tR2boAarQRqxXVW7jNdrOCT/OYKNTEOm2kgl+3LVV/tdmoIJrL2+c3X
         aGMg==
X-Gm-Message-State: ANoB5pl67D0o0UrzS01syv5FEeAZGdl100HjWxevN/k598RT3JJmvHCl
        zPydGOUDj5ks7q7ngZCQ7Xce3ArKKNYNoQ==
X-Google-Smtp-Source: AA0mqf5B/zBGbV3pU4IOo52V2QxZ3kOP2JL1DgtHklYr2BiVl3XTIDWuUXyuwb24XxEgPeBkYdJaGw==
X-Received: by 2002:a2e:940f:0:b0:277:5df:9728 with SMTP id i15-20020a2e940f000000b0027705df9728mr3186003ljh.337.1669225656157;
        Wed, 23 Nov 2022 09:47:36 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id z9-20020a0565120c0900b004a25468d86asm2977211lfu.68.2022.11.23.09.47.35
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 09:47:35 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id f13so7698253lfa.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Nov 2022 09:47:35 -0800 (PST)
X-Received: by 2002:ac2:47ec:0:b0:4a7:8b6b:2320 with SMTP id
 b12-20020ac247ec000000b004a78b6b2320mr3309100lfp.267.1669225654599; Wed, 23
 Nov 2022 09:47:34 -0800 (PST)
MIME-Version: 1.0
References: <20221117225822.16154-1-mario.limonciello@amd.com> <20221117225822.16154-4-mario.limonciello@amd.com>
In-Reply-To: <20221117225822.16154-4-mario.limonciello@amd.com>
From:   Sven van Ashbrook <svenva@chromium.org>
Date:   Wed, 23 Nov 2022 12:47:23 -0500
X-Gmail-Original-Message-ID: <CAM7w-FW8fGPxv0djzkzt4B88xcsMhjXJZ4i6n2ueaC81h4giaw@mail.gmail.com>
Message-ID: <CAM7w-FW8fGPxv0djzkzt4B88xcsMhjXJZ4i6n2ueaC81h4giaw@mail.gmail.com>
Subject: Re: [RFC v4 3/5] platform/x86/intel/pmc: core: Drop check_counters
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Raul Rangel <rrangel@chromium.org>, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Len Brown <len.brown@intel.com>,
        John Stultz <jstultz@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        S-k Shyam-sundar <Shyam-sundar.S-k@amd.com>,
        Rajat Jain <rajatja@google.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-kernel@vger.kernel.org, Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario, comments below.

On Thu, Nov 17, 2022 at 5:58 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> `check_counters` is a stateful variable for indicating whether or
> not to be checking if counters incremented on resume from s2idle.
>
> As the module already has code to gate whether to check the counters
> that will fail the suspend when this is enabled, use that instead.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> RFC v3->v4:
>  * No changes
> ---
>  drivers/platform/x86/intel/pmc/core.c | 7 ++-----
>  drivers/platform/x86/intel/pmc/core.h | 1 -
>  2 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 17ec5825d13d..adc2cae4db28 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -2059,8 +2059,6 @@ static __maybe_unused int pmc_core_suspend(struct device *dev)
>  {
>         struct pmc_dev *pmcdev = dev_get_drvdata(dev);
>
> -       pmcdev->check_counters = false;
> -
>         /* No warnings on S0ix failures */
>         if (!warn_on_s0ix_failures)
>                 return 0;
> @@ -2077,7 +2075,6 @@ static __maybe_unused int pmc_core_suspend(struct device *dev)
>         if (pmc_core_dev_state_get(pmcdev, &pmcdev->s0ix_counter))
>                 return -EIO;
>
> -       pmcdev->check_counters = true;
>         return 0;
>  }
>
> @@ -2113,10 +2110,10 @@ static __maybe_unused int pmc_core_resume(struct device *dev)
>         const struct pmc_bit_map **maps = pmcdev->map->lpm_sts;
>         int offset = pmcdev->map->lpm_status_offset;
>
> -       if (!pmcdev->check_counters)
> +       if (!pmc_core_is_s0ix_failed(pmcdev))

Will this break the "CPU did not enter SLP_S0!!!" warning?

As far as I can tell,
If an Intel system uses S3 instead of S0ix, pmcdev->s0ix_counter will
not get updated in the
suspend callback. In the resume callback, the counter check in
pmc_core_is_s0ix_failed()
no longer makes any sense. It either fails all the time (if
pmcdev->s0ix_counter was inited with a non-
zero value) or succeeds all the time (if pmcdev->s0ix_counter was zero-inited).

>                 return 0;
>
> -       if (!pmc_core_is_s0ix_failed(pmcdev))
> +       if (!warn_on_s0ix_failures)
>                 return 0;
>
>         if (pmc_core_is_pc10_failed(pmcdev)) {
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index 7a059e02c265..5687e91e884c 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -316,7 +316,6 @@ struct pmc_reg_map {
>   * @pmc_xram_read_bit: flag to indicate whether PMC XRAM shadow registers
>   *                     used to read MPHY PG and PLL status are available
>   * @mutex_lock:                mutex to complete one transcation
> - * @check_counters:    On resume, check if counters are getting incremented
>   * @pc10_counter:      PC10 residency counter
>   * @s0ix_counter:      S0ix residency (step adjusted)
>   * @num_lpm_modes:     Count of enabled modes
> --
> 2.34.1
>
