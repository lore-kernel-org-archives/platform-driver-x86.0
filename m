Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5362AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 18:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiFHSnw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 14:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbiFHSnZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 14:43:25 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AEB812AF9
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 11:43:24 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id v1so32495204ejg.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dO2ya9dOaZC5mCRsagfwSkpjaGo3mR+E3ANpgaG2uMI=;
        b=LFK/RSMjpM7SQaEt3ElB2KVnuYvMyOFtuM1aekF3lPyEyOUCWiZXrfWpNtOxXjCpIE
         X5O2nd6JObY8kXKdOUl38OV1YgdOyobyAKub65YQMLkm+lpLNoEM4oa1yuZ3lJ5sHUah
         fi9Yp8lxVD8y2/CJaiX1kVZE+J1ShgkTSXkk2WRteAHTYnJImbgSLIUzp44rOWWE0vwD
         uEEIjCwRMvfkpo63oHgvSyw8tLtWsPVgYXlsp+CxWRdnpv5z+LdBfEEstnmj6nXadshi
         3sd1wC6GiROSDMColLtYULjHmC+/1eLXn/vZJ9M9CRad0MueSYaMbC19SMb+3hTycEiC
         knyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dO2ya9dOaZC5mCRsagfwSkpjaGo3mR+E3ANpgaG2uMI=;
        b=v6B/ECnsAVMUccjr6YgCKT4pyFIAvcOwHYK7CKM7h9GML6Tx7XBn1eaPfuE076gZt8
         RzFsFt22lUBbOIWeMu81feK5Yg1B+JqQmxuoFg7gu8KZ5MJuiV9ByALwEL730FI0Xc0l
         +bw3kmNt5A0r3YGGInkB4g/UGUrclEsfOZ1Ws4rcY6QVI1IBIuXP6KOkRSdaAgQHPt0E
         OBgIpzTAEiRniA/0UoTaOxnvEcYVnaODah3dBVN1TtFAWxoW9iy69VT9IitPF/4H3fMq
         6DfDPvKPRtr25KQWdPH+yZI0B7zHAB4LbL3bUjaTjiRcNI513IPE/TyedMOul2rdttBb
         3ZGQ==
X-Gm-Message-State: AOAM531m4Uqw+2fSJlT5J23tdz4zTnNBVgCLCeV3W4AG2P4vESG83CUR
        w1fX97/O73FTMKsyJrfeRJj5Jb6rq1iScF7uAYfjl/+36zwBdg==
X-Google-Smtp-Source: ABdhPJwh8FalH0cq9ZMm2cI3f04hFO/8u1dDpFi4TM1pkBvIPzBA3+PrXQXloacqVHfu9/DOlAIrWdv7BLYki8NW3yo=
X-Received: by 2002:a17:906:c7c1:b0:711:d2e9:99d0 with SMTP id
 dc1-20020a170906c7c100b00711d2e999d0mr14636902ejb.639.1654713802985; Wed, 08
 Jun 2022 11:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220608170220.5751-1-jorge.lopez2@hp.com>
In-Reply-To: <20220608170220.5751-1-jorge.lopez2@hp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jun 2022 20:42:46 +0200
Message-ID: <CAHp75VfG5aanMFz+F_JE1oTF8B-nxc=LaH=T-R=RAC3S+VguLg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Resolve-WMI-query-failures-on-some-devices
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 8, 2022 at 7:21 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
>
> The intention for this patch is resolve WMI query failures reported
> in several HP OMEN notebooks.  WMI queries fail on some devices where
> the ACPI method HWMC unconditionally attempts to create Fields beyond
> the buffer if the buffer is too small, this breaks essential features
> such as power profiles.

Maintainers are still missed. Try first to send patches to yourself
(another address or so) and check.

> Description of changes between version 1 and version 2
> ------------------------------------------------------
> v2 patch 1: Resolve-WMI-query-failures-on-some-devices
>             - No new changes to the logic.
>
> v2 patch 2: Organize-declaration-variables
>             - Organize declared variables in hp_wmi_perform_query method
>
> Jorge Lopez (2):
>   Resolve WMI query failures on some devices
>   Organize declaration variables
>
>  drivers/platform/x86/hp-wmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
