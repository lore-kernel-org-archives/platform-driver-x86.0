Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CF2C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 10:55:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiBXKzr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 05:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiBXKzq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 05:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 657AD27AA07
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 02:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645700116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jnSYMiPEyZNQ5mdL4eFQe/z6N6x7WpOsAPfzqdslTJA=;
        b=Z4h+VTQ/5K74elJ4H0u7Qd/CBofyjuWejR557uPM5yjwSZTRekFvVatFJEvkJLpc/uZ4Ze
        WAa7LYDS0OfHcm9YCuD7Y2UuUu31XuyCiB084X1VeI5U8Z9cuLme+cBYK45ahMa7R14h2x
        ySUQ2MilwR2AXMdC4Er+9kYgxmTMDxI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-hU93-jNpNDiKiDx_M0Ql-w-1; Thu, 24 Feb 2022 05:55:14 -0500
X-MC-Unique: hU93-jNpNDiKiDx_M0Ql-w-1
Received: by mail-pf1-f199.google.com with SMTP id n135-20020a628f8d000000b004e16d5bdcdbso1125170pfd.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 02:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jnSYMiPEyZNQ5mdL4eFQe/z6N6x7WpOsAPfzqdslTJA=;
        b=3j0qTu5IKdFuTMj9UIG9FxwLLZwsfmCUr5ee5jJlYWfj1r4zziatMn6mg2DtgtHFlX
         hPLs3k+3zD2CFqDprxFlknQSDpMVEOa+OZ6Vw3jJVAUiR56ltlgD9nT3RnX97coO9grJ
         mWxWXo9ugBIAb9J+kDlni0d+M/0wl+S5EdDQUETC5LIBFjfffZJ2UfZb6/Rqy2UObue4
         hyjdLPmGgMqVRxhJaEKIZLrB/ZfaCUBICcBnxA+/I5HultIOkX9YXCmVjN307vKVDPzu
         xap3JcWXSXWFLZ1SMwoqyKJVbDnPhi/guDXlLOyMlnq9IRX7OEnTAgptVx4qVRayUU9+
         R10A==
X-Gm-Message-State: AOAM533QsR829xZrUOad9SpbsgME+6kujzmN9pvxKZzsqc42UDzfa1pV
        /Mk2HHN72Q+sD6Ig4kcokkCHfCTqph+XBp5mxzm5oppXrwhadwjbvVubjV36Myq6zIYQDPglMXg
        VVFaw7mMu+KihV+iQRnF4KSMacT9HUuCkYGJ1Klar6XMLiocmew==
X-Received: by 2002:a63:1456:0:b0:373:c08c:124d with SMTP id 22-20020a631456000000b00373c08c124dmr1841860pgu.363.1645700113732;
        Thu, 24 Feb 2022 02:55:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyt07m2KK3XCAS/cuPd1lKmD03vOk9HuxjM6hA5r2y9pX5RQyRcrSCdmxs/ScGNmQbiQQG1KMi+uKs8304K8cA=
X-Received: by 2002:a63:1456:0:b0:373:c08c:124d with SMTP id
 22-20020a631456000000b00373c08c124dmr1841850pgu.363.1645700113487; Thu, 24
 Feb 2022 02:55:13 -0800 (PST)
MIME-Version: 1.0
References: <20220224101848.7219-1-hdegoede@redhat.com>
In-Reply-To: <20220224101848.7219-1-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 24 Feb 2022 11:55:02 +0100
Message-ID: <CAO-hwJ+MAjqnBXOWruEoEduxMwoTkJtDFoBc9FRsmZoG+WZfiQ@mail.gmail.com>
Subject: Re: [PATCH] surface: surface3_power: Fix battery readings on
 batteries with a serial no
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 24, 2022 at 11:19 AM Hans de Goede <hdegoede@redhat.com> wrote:
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
>
> Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

LGTM, (and scratching this off my list):
Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

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

