Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6910AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 10:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbiBXK43 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 05:56:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiBXK42 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 05:56:28 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5588D27AA07
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 02:55:59 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a23so3468559eju.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 02:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I5qbjQP8zuNDU/zfHLwCkxNNyVFIJMUPcoWUp6pMKRg=;
        b=bionIalo4nWCHY0aB4k2CL7ZeHaEnpTxLDE4Ha38aI2Lk4JGZ/d8GB7Hnuz1I22x1g
         ic4V8WsGmdug/foYArbC+TlreTzJPnZRDtcgzJhdmsdL8uqrRLy9aLe/fi4TgygeFVIh
         7A1DFUKOxvh91KLaanAnKgvrohw7O2jgw+SyyXAA4I31lgBQil5wMbZtbMpmiW6o7ioC
         ywKP/DiTocFnITmepRTG4e2v76UryjXGIKKqY9krHm30rQK8rBZ3H6upBMJXVZxSqxe2
         wHx3lkoj0dfAcRAbbwxEPL31uTb+NbGgRzyg2JcO8Ok00w/y+1vWTRrnfUrm/XiqCr5M
         gEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I5qbjQP8zuNDU/zfHLwCkxNNyVFIJMUPcoWUp6pMKRg=;
        b=mJgFjTeaU4DXhaMXDnsfGvsxO9636b0lTAfICKBgOPFMdPkGMkPikWqbFSlZfSrfZb
         YG9LCTe6/WrzHMwHLddwaQDev2AgD0Ev2DMm/XOvne2KvmUMnlXN2+CGUQK3YZ3D5KlA
         FIelANvqQ2XXv/NJaq1ZHATNRVBAwOqjVYjm3JItQVTi1wqYoVeyk1ZeBE2udLOgVYVX
         Os6QHwcpVEdTZeADIEuG3D8TbFbkm6LtSsdon/vc42AqhVxNvkGFCjDDdIFqsbrUxwCB
         6Cbco4cR6pTUbjRSqvjKFO05oChB+p2ZoLTExqVYiKXvSpG/cQJvUuJpxDu5UBUZ2t2L
         x9NQ==
X-Gm-Message-State: AOAM532nyYNtopAx2K7yxNF2pcTR1MM0GxGIXsa/Kvgt2KPuBXhfDlwi
        gUPHsYYPNYlB2zDpZDvXbQ5+Mb1UdqwshfWFEXA=
X-Google-Smtp-Source: ABdhPJzibyDWputui5EVNC/gd7YLXXGj2eqxZOtNpBalBlnxO3meYt1xay5JYxUsL51EAcPtS0rghoxFmWmlsQzIPas=
X-Received: by 2002:a17:906:4cc7:b0:6d0:7efb:49f with SMTP id
 q7-20020a1709064cc700b006d07efb049fmr1743217ejt.639.1645700157736; Thu, 24
 Feb 2022 02:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20220224101848.7219-1-hdegoede@redhat.com>
In-Reply-To: <20220224101848.7219-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 24 Feb 2022 12:55:21 +0200
Message-ID: <CAHp75VcsRd=cMK_cS0zcJTsqsi9sqiBnKH7d8c=25SjbgRvzVw@mail.gmail.com>
Subject: Re: [PATCH] surface: surface3_power: Fix battery readings on
 batteries with a serial no
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 24, 2022 at 12:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The battery on the 2nd hand Surface 3 which I recently bought appears to
> not have a serial no programmed in. This results in any I2C reads from
> the registers containing the serial no failing with an I2C NACK.
>
> This was causing mshw0011_bix() to fail causing the battery readings to
> not work at all.
>
> Ignore EREMOTEIO (I2C NACK) errors when retrieving the serial no and
> continue with an empty serial no to fix this.

Maybe in all cases

serial no --> Serial Number

? This "no" requires to re-read again.

>
> Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/surface/surface3_power.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
> index abac3eec565e..b283bc9bb5fd 100644
> --- a/drivers/platform/surface/surface3_power.c
> +++ b/drivers/platform/surface/surface3_power.c
> @@ -232,14 +232,21 @@ static int mshw0011_bix(struct mshw0011_data *cdata, struct bix *bix)
>         }
>         bix->last_full_charg_capacity = ret;
>
> -       /* get serial number */
> +       /*
> +        * get serial number, on some devices (with unofficial replacement

Get

> +        * battery?) reading any of the serial no range addresses gets nacked
> +        * in this case just leave the serial no empty.
> +        */
>         ret = i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_SERIAL_NO,
>                                             sizeof(buf), buf);
> -       if (ret != sizeof(buf)) {
> +       if (ret == -EREMOTEIO) {
> +               /* no serial number available */
> +       } else if (ret != sizeof(buf)) {
>                 dev_err(&client->dev, "Error reading serial no: %d\n", ret);
>                 return ret;
> +       } else {
> +               snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
>         }
> -       snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6pE", buf + 7, buf);
>
>         /* get cycle count */
>         ret = i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_CYCLE_CNT);
> --
> 2.35.1
>


-- 
With Best Regards,
Andy Shevchenko
