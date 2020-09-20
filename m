Return-Path: <SRS0=ABgw=C5=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8621C43463
	for <platform-driver-x86@archiver.kernel.org>; Sun, 20 Sep 2020 18:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A16542078D
	for <platform-driver-x86@archiver.kernel.org>; Sun, 20 Sep 2020 18:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qfquR5NM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgITSEZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 20 Sep 2020 14:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgITSEZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 20 Sep 2020 14:04:25 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C439C061755
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2020 11:04:25 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id q12so5700967plr.12
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2020 11:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b0vEODKx+8M7lOgVoSNWUvUIlrStSnAO0G4P1whubkc=;
        b=qfquR5NMxBnMluk9IAP/DNtmiLodMTLR1Kj1iZHxUHDLxiHgdLe+03JRQFfcsJN62O
         hKxYL1WPVbaLoYrnph3Yxt5SQPef1suCmHywDWQqTq41UuKrkCKyDgG71C0PjL4/qC2w
         QdX85CgNNJ0CZG2axW5emIABXQhtjFRIh+9gTZ0hdoSn7ynoBslUOyON1gAQmd65tFDR
         R7UK7m0qs7zbVdSPJksu+tRHufIwFG3Ww39V0MuTPe09KIsBIYaHp72rH9xQ8yCyneW7
         LRy88fy9QMVddyqRiaO246vNx+9RjNR9U3S3nwmCVkfUrtKVjfel0DSOtnhxEuSV25Au
         lbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b0vEODKx+8M7lOgVoSNWUvUIlrStSnAO0G4P1whubkc=;
        b=AbaO8L720EuVoawaiL5Nq1FuDD9dy8CR8WAXNLgJAg1xy4zExg4WaJGOyEYpXT/ePz
         e3XhW4o8yrUDfGCaCTXDiaJOx2au+f0NVDliy3aipDAPDy/nULcZfLSfpEpiIuec/Xzm
         qTMG/WEBancVn45JXRCPMCFmANwrM5qu9IVvkeYKxfB5aosRQasO3bBmD5zB8zz6Sk49
         EAl/h2paoZDsNyz+nHaA4FarPcb1X21meP3IrI/WcpAODp4pbxdCViy2yaa4zBdGpDnP
         AFJAcaakj/Y7mYamOnMnKMPp2E1uSZ1xpdjkuYuzSrqw/zNlhaBExs6IZmca8TWxfx1b
         WxHA==
X-Gm-Message-State: AOAM533vBHjMRzIRWavnoqnZmpCTnpFfSNA4T3pqxMa4fA7MEyOPyEGZ
        ikJGK6bzXfnGkfE4sFfaAw1eYDqxAD14gBhal/Q=
X-Google-Smtp-Source: ABdhPJwBj1W8zN68v4kygKZjDwQAeX/LS01M/yWWBdORG9/aK0Wcq/qN49haT5C6sHzphoFRtwCR+Og3vVQUNgZn6a4=
X-Received: by 2002:a17:902:9e08:b029:d0:8a6a:d5e8 with SMTP id
 d8-20020a1709029e08b02900d08a6ad5e8mr41517659plq.0.1600625064606; Sun, 20 Sep
 2020 11:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAJubAmEg_uXsWRqHXA2_L8i2AVU_ZLH19txYqgVpP5s+AwNzfA@mail.gmail.com>
In-Reply-To: <CAJubAmEg_uXsWRqHXA2_L8i2AVU_ZLH19txYqgVpP5s+AwNzfA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 20 Sep 2020 21:04:08 +0300
Message-ID: <CAHp75VdKkZ0Ra3FMvbfq2hJH7_KZ5S_XLCxmrgFOAMiGDe6AKQ@mail.gmail.com>
Subject: Re: LG laptop driver not working on recent models
To:     Alessandro Zarrilli <alessandro@zarrilli.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc: PDx86 mailing list and co-maintainers

On Sat, Sep 19, 2020 at 2:44 PM Alessandro Zarrilli
<alessandro@zarrilli.net> wrote:
>
> Note: I'm adding Andy in CC because I see he was the committer of the driver I'm going to talk about.
>
> Hi Matan,
>
> I see you are the maintainer of the Linux kernel LG Gram laptop driver (linux/drivers/platform/x86/lg-laptop.c).
>
> I've just bought the LG Gram 2020 version (product code 17Z990). I'm running Kernel 5.4.0, but unfortunately it seems your driver is not working correctly on this laptop model.
>
> Take for example "battery care limit", the feature I'm interested the most:
>
> # cat /sys/devices/platform/lg-laptop/battery_care_limit
> 0
> # echo 80 > /sys/devices/platform/lg-laptop/battery_care_limit
> # cat /sys/devices/platform/lg-laptop/battery_care_limit
> 0
> # echo 100 > /sys/devices/platform/lg-laptop/battery_care_limit
> # cat /sys/devices/platform/lg-laptop/battery_care_limit
> 0
>
> Is there any chance you could fix this? Can I help in any way? I'm not skilled in C programming (just used it a long time ago), but I'm an old time developer and Linux system administrator: if you give me some hints, maybe I could sort it out myself.
>
> Thanks and regards
> Alessandro



-- 
With Best Regards,
Andy Shevchenko
