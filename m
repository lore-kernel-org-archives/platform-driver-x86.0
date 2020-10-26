Return-Path: <SRS0=KVMw=EB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C1CC2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Oct 2020 15:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA93F2222C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 26 Oct 2020 15:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kluEBCtU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783502AbgJZPO6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 26 Oct 2020 11:14:58 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33208 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1783148AbgJZPO6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Oct 2020 11:14:58 -0400
Received: by mail-pg1-f195.google.com with SMTP id l18so6260937pgg.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2020 08:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8j38Iju7n+T751hoL1D6EB4bwi/dc7imtRdkYa5mvDk=;
        b=kluEBCtUcBFI7/Q+U+d4Wnsvjtp8iX8yQaelAlcvfG833VFCR2PSYPH6yjMysHaOEq
         lVfo3wizC+3gLSlMqhSqBPdGAOQem/fQ6Dv4Xt8CAKiN+QUXWAIQCSjJ/OHgZTdOXiLB
         XVRGqjTqYyqkgKkhDhaRBzPzNkVQPCvAA8HXNA85yW5vqvdhKbvTvdWxEMyRosaayxD1
         s0nRFOjg9zvpsCg5rKX0GnxE1rYvf9rcWSmA41JLCfzK5xn20mOT6pKVOlaD8ir0I98z
         USFcFNfz9MwTx1/JinGThMBJKFOsr0WZM2m/co82KV6YvuY9PosuZD8sw8+do7MltzE9
         AtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8j38Iju7n+T751hoL1D6EB4bwi/dc7imtRdkYa5mvDk=;
        b=JO/ziaLqScoMAFKN1qyBVpqbHkdmEtKlIoMZVAsf9pXlr8nbsQvrJxZb5CCARz2TOz
         8T7v0eKzhFZzBvXuoFAgUAT7aY0nnTbZIeqpRH4mg56dRijEcfi26tH7kJ4F28pCnMHe
         V8O7++w3a0dzpn0O4DuX7h2xeI3UC0ponYgga6UXb5Rl4uMCdx3sWn8dGrtrTYNm2G8y
         kROtPQ5WTOZc5o84QYQR4M5yL9KLTpKjeHMzeHmtmSxrrpQ9nLiXPU08A73p1p5b9z3L
         iPUFUWkPmKqJjGpc6ZfHrUKnm5xbsd2aOH1Zt9dnH2kmC2oS9tKapESkGWjFBOR/J4/T
         FADg==
X-Gm-Message-State: AOAM5318zxkhvSt4F7PkFhXoORDK6rJi/e4PUs/YBcv14Z96GdJhFc1G
        doKoDEu4YlS8wnDJycHNg9BtuflqV1O+66dkqVXzMJlhR1k=
X-Google-Smtp-Source: ABdhPJy3ho48vSZjIm0IGE68q68wtd5XHzUyiqNTWerr/1szxi30KGpxywTGfJUcuEuIvvLBgfD49TcNXAqXUGkvOhA=
X-Received: by 2002:a63:d54e:: with SMTP id v14mr16330095pgi.203.1603725297465;
 Mon, 26 Oct 2020 08:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201019185628.264473-1-hdegoede@redhat.com>
In-Reply-To: <20201019185628.264473-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 17:15:46 +0200
Message-ID: <CAHp75Vcrghf330j_6P5iSxcxJYa_LvDvN3OGBBJWFpUXBPMRJQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: acer-wmi: Drop no-op set_quirks call
 from find_quirks
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Oct 19, 2020 at 9:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> set_quirks has a "if (!interface) return;" check at its beginning and
> interface always is NULL when set_quirks is called from find_quirks,
> so it is a no-op and we can drop it.
>
> This also allows dropping the "if (!interface) return;" from set_quirks
> since set_quirks now always is called with interface != NULL.

Is there any cover letter for this?

In any case, LGTM, you may use my tag
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

I'm not sure about ACPI_EXCEPTION() use, though.

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 49f4b73be513..db6167a10981 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -302,9 +302,6 @@ static struct quirk_entry *quirks;
>
>  static void __init set_quirks(void)
>  {
> -       if (!interface)
> -               return;
> -
>         if (quirks->mailled)
>                 interface->capability |= ACER_CAP_MAILLED;
>
> @@ -648,8 +645,6 @@ static void __init find_quirks(void)
>
>         if (quirks == NULL)
>                 quirks = &quirk_unknown;
> -
> -       set_quirks();
>  }
>
>  /*
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
