Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED3EC43219
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Nov 2022 17:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbiKRRcM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Nov 2022 12:32:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241877AbiKRRbr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Nov 2022 12:31:47 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A4C920BA
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Nov 2022 09:31:45 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id n21so14676607ejb.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Nov 2022 09:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bus9+8uJnT/HLJE3AXsoa8LpTS0X5s602gJKkls9pCA=;
        b=PdK2vrzElmYj1Nm8K0jfUm9dxmNK/UUjnDR04M/ExvvxtAzCIT2XiJPJZsEo156kts
         Jp/MWkYGMsLIX/Qtk4nDjq3FvG0rwpR4lRmxcZN69r7WABEbNJRptfAc6mw6XoJUuNKq
         M/FO7NjCuGO009Spk4TNNJtBP/rBtKPqVs5ooEh+zFkCb2S0Ssi82ixj2/nJHxIh4CPn
         ReQKcbZfaXBXBs66INtFcz/gFiWmbv8qcB++x54b79/L2VFQ2w77qkrRmmnS/VJw9suu
         lnVD3jmghN/tVIMTPkeNcNU0YXOksG3U/io+kwU24GIE4sMCixkPcBKkkXm3sOY1fN7f
         ND/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bus9+8uJnT/HLJE3AXsoa8LpTS0X5s602gJKkls9pCA=;
        b=kW2EOhhqe0X3e+Xiaf98uB0V2oZ4OA/yC0I6SQNd0AFUl6S8tt6l/ua6mZt1ayGXCp
         L1RKsCsXAndkZC5R2Zevr0K7b7fPOLenObvq/fXvFkBrJiN1VVXe3TvEdHm0JxE7q5fh
         BwGP95D9rrxL9kE0MZwLXNM+5PpuTfMotjz/3BGCkAr50eFEitqL9ZdlGTQlbf5Ka/4V
         pCJZ0CEyMhy5p1SrQCT3iYDdzWveuvWXJOfhr5VbTV59fMckPJs/XdZbpqZeKmuxjSYl
         Z8mjfL5Ib3iutZEego572zMSoR3HI1blM8wS5JSE8cPbQz/+wlZ0Uq0o1uYLJbEWChBV
         Sl8g==
X-Gm-Message-State: ANoB5pmtPatwazlCykhIYmZ9/bdjDLIuOOQoCK4Xll/a+PKx9j7kNHfX
        2mDTq7tM/93lW2XtebI+szPQ23s7+FLxiiVCkTM=
X-Google-Smtp-Source: AA0mqf743tvqRCRTgss4532LsIMrFdVS3RKFPJG3ZePXl8g4hEqpPpTUAxbfJIJizF2c3g83UbnQcuT1F9+UJr4bwOo=
X-Received: by 2002:a17:906:80da:b0:7ae:5473:3c76 with SMTP id
 a26-20020a17090680da00b007ae54733c76mr6866247ejx.752.1668792704288; Fri, 18
 Nov 2022 09:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20221117110244.67811-1-hdegoede@redhat.com>
In-Reply-To: <20221117110244.67811-1-hdegoede@redhat.com>
From:   =?UTF-8?B?0JzQsNC60YHQuNC8?= <maxtram95@gmail.com>
Date:   Fri, 18 Nov 2022 19:31:17 +0200
Message-ID: <CAKErNvrfbkgmwe_S96rinLRyLY+Kq5y+P0Bz-2TWJicAA3+pgg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] platform/x86: ideapad-laptop: Rework touchpad
 control code
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        GOESSEL Guillaume <g_goessel@outlook.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Manyi Li <limanyi@uniontech.com>,
        =?UTF-8?Q?Eray_Or=C3=A7unus?= <erayorcunus@gmail.com>,
        Philipp Jungkamp <p.jungkamp@gmx.net>,
        Arnav Rawat <arnavr3@illinois.edu>,
        Kelly Anderson <kelly@xilka.com>, Meng Dong <whenov@gmail.com>,
        Felix Eckhofer <felix@eckhofer.com>,
        Ike Panhc <ike.pan@canonical.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 17 Nov 2022 at 13:02, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> Here is v2 of my series to rework the ideapad-laptop touchpad control code.
>
> New in v2:
> - Split patch 3/3 in to 3 patches (3-5/6) since it was doing to much at once
>   - Update r_touchpad_val on sysfs read/writes
>   - Drop the write(VPCCMD_W_TOUCHPAD, 1) call at probe in a separate patch
>     and document why this is done in the commit msg
> - Add a new patch (6/6) to hide the touchpad sysfs attribute behind a
>   module-parameter which is disabled by default, see the commit message
>   for why this is done.

I'll try to take a look at this series and test it on Z570 over the
weekend (I've had major issues with electricity supply for the last
few days...)

>
> Note this applies on top of my review-hans branch which has seen a bunch
> of other ideapad-laptop changes land recently:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>
> Regards,
>
> Hans
>
>
> Hans de Goede (6):
>   platform/x86: ideapad-laptop: Refactor ideapad_sync_touchpad_state()
>   platform/x86: ideapad-laptop: Do not send KEY_TOUCHPAD* events on
>     probe / resume
>   platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on
>     select models
>   platform/x86: ideapad-laptop: Send KEY_TOUCHPAD_TOGGLE on some models
>   platform/x86: ideapad-laptop: Stop writing VPCCMD_W_TOUCHPAD at probe
>     time

IIRC, the touchpad gets enabled on boot on Z570 if it was disabled
before rebooting. I'll test if it's still the case after this patch
(given that VPCCMD_W_TOUCHPAD seems to be a no-op).

>   platform/x86: ideapad-laptop: Make touchpad_ctrl_via_ec a module
>     option
>
>  drivers/platform/x86/ideapad-laptop.c | 98 +++++++++++++++++----------
>  1 file changed, 61 insertions(+), 37 deletions(-)
>
> --
> 2.38.1
>
