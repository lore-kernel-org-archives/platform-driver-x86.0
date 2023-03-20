Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875C0C7618A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 12:12:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbjCTMMa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 08:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjCTMM2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 08:12:28 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EF71F92F
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 05:12:26 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id r16so12658874qtx.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679314345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrFLXZRiJrQpmhF2r8lPRpw4ungnE8PRt4rWBcslyWw=;
        b=OhVvDpvw6Ax9WMbDhZjsKN374X9POyVOGZrpEWUAXNBPcB0DbRQDeO9Tv8nQ2p7Jf7
         VCeE5JlWa1Xkdtw3Uv/yFUynPoJjDgd5z/Dg1bav+d2eDNPqFLYDNBoHmrXmggya7YR8
         vXZglWwz8UOwdROiMQ6xl+QbQGl0PxOJajT91l/WRy7+APyhBFU59Vs0iSxlf2SAiPzJ
         W8GTUjiLdGfRcbbZDvomr8iHZDWBC1Ed3fckodoz8nmAgykwNZQVJecNoYzmYK/gzfSL
         DtkzG2PX0+H8bQnFQFVHUQDQRSuZSkoaZFUosIuiBdAkxypTMiAlc6Ch+5AFB5sz7kup
         wa2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679314345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrFLXZRiJrQpmhF2r8lPRpw4ungnE8PRt4rWBcslyWw=;
        b=zc2EPbv0FN1smyjBPGeJfrtwWpR7qfeb10HIcEIOiKppVFK4PCukYG0H/dIIBhskpb
         Gc1U1reZV3KgRxIVG1+7OfoyfIoFQmTqM42mPhexNnbs84ZSazXjzIAE75h/phI2ZQFl
         7EzfkRqz0fF0ZJrIwgCfpSN1pfFI88OERON+7ICJntPw5aefZIQPKSLprDgxGlitcdjp
         FWtpm1mpaksnDlc88BzOe9uQa6k2a46wReCo4ccWCS5QXXmmuwTjWXqCsR41+P3IMjqj
         yWksZF+9nwWE+nDWZqPfpnzZr4nDClCt2JizYMaBZik4Sw6EtZ0pt7R/uw19OsfT1D/t
         fWZA==
X-Gm-Message-State: AO0yUKXLLO0NcjUfJ75jdhkYvqIiRiPAYQYeJzoyWCUcG7Btygxhl/Ss
        dTB0p8XuoXejl2+AQ3crPLEDuc67Hqq0RS+z1OIz7gSfSOM=
X-Google-Smtp-Source: AK7set8KK6ndJ9/bHm/NNdu+15EH9kBB703K6Uc8GdTuDUjUS4KLVqwYwscyVziHY2K+hrqqgENQ4s689tQMn9UEvIw=
X-Received: by 2002:ac8:5c48:0:b0:3d7:8712:a808 with SMTP id
 j8-20020ac85c48000000b003d78712a808mr4217343qtj.1.1679314345290; Mon, 20 Mar
 2023 05:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230320103815.229729-1-hdegoede@redhat.com>
In-Reply-To: <20230320103815.229729-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Mar 2023 14:11:49 +0200
Message-ID: <CAHp75VfuP+V9rx02pZVeAWzsG759YmPbUKsYiwoiFQumAYSO4Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/intel: vsec: Use intel_vsec_dev_release() to
 simplify init() error cleanup
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "David E . Box" <david.e.box@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Mar 20, 2023 at 12:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> On auxiliary_device_init(auxdev) failure we need to do the exact same
> cleanup steps as on device.release(), so use the intel_vsec_dev_release()
> callback for this.

Sounds correct to me.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel/vsec.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/int=
el/vsec.c
> index 2311c16cb975..cf2a20088f6b 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -169,11 +169,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct =
device *parent,
>
>         ret =3D auxiliary_device_init(auxdev);
>         if (ret < 0) {
> -               mutex_lock(&vsec_ida_lock);
> -               ida_free(intel_vsec_dev->ida, auxdev->id);
> -               mutex_unlock(&vsec_ida_lock);
> -               kfree(intel_vsec_dev->resource);
> -               kfree(intel_vsec_dev);
> +               intel_vsec_dev_release(&auxdev->dev);
>                 return ret;
>         }
>
> --
> 2.39.1
>


--=20
With Best Regards,
Andy Shevchenko
