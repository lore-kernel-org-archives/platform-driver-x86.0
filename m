Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87B2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 11:03:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237318AbiFHLDm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 07:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237628AbiFHLDk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 07:03:40 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2538A1B046D
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 04:03:35 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z7so26530983edm.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 04:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EnbYX2Vmn7yum6Y6xQtBFHo60p2E5As5b+838WdQ44o=;
        b=CE7Xi2dLCHTjZIox1xcaIZZ3BgaaUeMkM86erDK54hj5qK8VN903KoDJ9R3LRkvfl9
         HevyWoCMnWhJjVe1KSvyl66ayOGvfE5I4Y6yXvOARfSABtgwdbqx3Dy7AWC1Q9J6fUbp
         9jejTbKOgdi1shsYMX2sQzyHC18lj5eQxMaNJwpNwbghpuaGYOMTgs9eu3rQzQX+eZa7
         QaAUvHUeRopH+xQSmLaOUpXZ9/KlajNxLgN4STe/cdqjaJULgQc9X4I59KxQgT3S+oUG
         EzoPKh+WzNo9FCITb67aFdIxKdy+WX1XqGsVggArwCwJw9IKWiLbvC9dnRcrS3CCjEAD
         qe/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EnbYX2Vmn7yum6Y6xQtBFHo60p2E5As5b+838WdQ44o=;
        b=6TPkV3HftOAniV11bXYovmDB82NdfjOWDxoxVmSOp/fwphA2UE02EH70jTV7EED70K
         CWPgFMbk9wtFVavtpnAqaThmCDwGstEFhTo3aoJ6wQfjnCdysadoHNm+HdC7ynZZneEz
         oR3T0L8maSDkVWkSjQr5pnRwFKV6jI4vKylv3UpBaoixWrkvK1iu3vQmY4WtZujf/t+0
         Xrtjs6cg0GKb+8QvNeiOebO8kmsIZyMixgOck+ZED0YLmAld344Xf/RmbdnTDb/Dhu2g
         mKQEPtVv+kEU4cuKKvjcMTcpyNID/r4+oL4V628hFUGGoII6gyhUID0bsJSExwv2QE1w
         Pj1w==
X-Gm-Message-State: AOAM532yHI0a3qwUktbvcTuV2Oshu+WZ9ubHyM6nQ1iIj0nAtFQNFzkR
        ku1vf9pyNNknGCeDqdpeqHlXDtGbpWRecrKUVaq0Dr5bB2CidAXw
X-Google-Smtp-Source: ABdhPJwrBUGEOS0DBjMhRLGZ0Ph8A8137r//kHCtJIOlBqGAD0I6EZz7+bLyufwzAvqpLS1cvVz3SetwPMh/HP3sAX8=
X-Received: by 2002:a05:6402:249e:b0:42d:bb88:865b with SMTP id
 q30-20020a056402249e00b0042dbb88865bmr29290826eda.141.1654686213684; Wed, 08
 Jun 2022 04:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220607204313.5374-1-jorge.lopez2@hp.com>
In-Reply-To: <20220607204313.5374-1-jorge.lopez2@hp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jun 2022 13:02:57 +0200
Message-ID: <CAHp75VeB4vg_rHw4S_xWiUn=yhT8DyTjKt1=jOM41ceQA1JzVw@mail.gmail.com>
Subject: Re: [PATCH] Resolve WMI query failures on some devices
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 8, 2022 at 8:06 AM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
>
> WMI queries fail on some devices where the ACPI method HWMC
> unconditionally attempts to create Fields beyond the buffer
> if the buffer is too small, this breaks essential features
> such as power profiles:
>
>          CreateByteField (Arg1, 0x10, D008)
>          CreateByteField (Arg1, 0x11, D009)
>          CreateByteField (Arg1, 0x12, D010)
>          CreateDWordField (Arg1, 0x10, D032)
>          CreateField (Arg1, 0x80, 0x0400, D128)
>
> In cases where args->data had zero length, ACPI BIOS Error
> (bug): AE_AML_BUFFER_LIMIT, Field [D008] at bit
> offset/length 128/8 exceeds size of target Buffer (128 bits)
> (20211217/dsopcode-198) was obtained.
>
> ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [D009] at bit
> offset/length 136/8 exceeds size of target Buffer (136bits)
> (20211217/dsopcode-198)
>
> The original code created a buffer size of 128 bytes regardless if
> the WMI call required a smaller buffer or not.  This particular
> behavior occurs in older BIOS and reproduced in OMEN laptops.  Newer
> BIOS handles buffer sizes properly and meets the latest specification
> requirements.  This is the reason why testing with a dynamically
> allocated buffer did not uncover any failures with the test systems at
> hand.
>
> This patch was tested on several OMEN, Elite, and Zbooks.  It was
> confirmed the patch resolves HPWMI_FAN GET/SET calls in an OMEN
> Laptop 15-ek0xxx.  No problems were reported when testing on several Elite
> and Zbooks notebooks.

I am in general fine with the change, only a nit-pick below.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
>
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 0e9a25b56e0e..7bcfa07cc6ab 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -292,12 +292,14 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>         struct bios_args *args = NULL;
>         int mid, actual_outsize, ret;
>         size_t bios_args_size;
> +       int actual_insize;

We already have above similar variables, I would either put like this

         int mid, actual_inzise, actual_outsize, ret;

or this (my personal preference):

         int mid, actual_insize, actual_outsize;
         ...
         int ret;

>         mid = encode_outsize_for_pvsz(outsize);
>         if (WARN_ON(mid < 0))
>                 return mid;
>
> -       bios_args_size = struct_size(args, data, insize);
> +       actual_insize = max(insize, 128);
> +       bios_args_size = struct_size(args, data, actual_insize);
>         args = kmalloc(bios_args_size, GFP_KERNEL);
>         if (!args)
>                 return -ENOMEM;
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
