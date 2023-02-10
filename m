Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A19C636CD
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Feb 2023 10:51:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbjBJKvw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Feb 2023 05:51:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbjBJKvv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 05:51:51 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCE183DE
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 02:51:50 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso9389140pjj.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 02:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAe6FMbvvgCZ9LFy/itKsYUmSI1WNnMDPVCSVx+rDow=;
        b=Tvxd4zxoZyfpdlowYgF35Gh/x92a8dVJG7H2Vhaf/t0SUxAGX+0fe1qwtPnX2TuHCn
         4c5LMj4TXx7wUkMoMSKKTgDrvNxqYLPHzLJfIUOMg+LvjwwYmoMftAZ/OmMdNFqQxLN2
         z8+WdFTuFBVSOIRkPiky/tM7TXXiXsuhFTJ+ck0+vB4GdXnYA7ssxP8TMWOxV+UtJDl2
         fGu7VYvpqJIC8W+yTptgC16lw/Pxc3Zp4n+OiKSSh3AgiyEtaIBgMyLy5rtLOZI3clOM
         Z0dpD5xq1wCFtUk1Ly0xYLXuMGZRAAfM/SDaT4pIVpe+aLazFcfLNCCU8+wrdZZu+zDk
         ADzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAe6FMbvvgCZ9LFy/itKsYUmSI1WNnMDPVCSVx+rDow=;
        b=xQ6b4o5hJVXoi6pyrqICJpkkGJ8ps0ZBd8APR2OQBt7CqjuluGmvlnLYkTmoPOGFoW
         QljNqExWlf/3Kfnax2wo9oxz4iwWnJChxmiXmaL70oDMmltFJMFqJ9mcMzrO0nIEVsPq
         2DQXbXLzFqsLlq3CvVLOuVHKfnerQaEZ7jIGyMF5HqJ4QoINXNY3QXb4cF8NJY0/HwPq
         mzaEZBwGG3aJbigcCywjwEo8b3Nl/tHFLbc6Ub0QgQdnLYzIV3ivWUk/9ILy76KGz/M4
         olg6VWg99rzytaZ8b+fvG5oF6iQ4HDXrBsgzcDSsATWm/d+jZUtWMNw49n6isv5cpGhs
         jMBw==
X-Gm-Message-State: AO0yUKVBNAB0UXSDTDcCp0S09LgbanAu4yC4i1VMB5vcXQ7LFU+MjhG7
        OyMEK3NX7uTHPDprnaMW1o510//7WHoe/ASOZ4aSkQ==
X-Google-Smtp-Source: AK7set8bewvYWPQfIW2SF+/Phcqe1GJBmCNY6jecikuEuhNmaDsr403UhuJvHNT2SGYDPF6o/rGevKcjXLcdcbtk0iU=
X-Received: by 2002:a17:90a:16d6:b0:230:8005:5c05 with SMTP id
 y22-20020a17090a16d600b0023080055c05mr2487473pje.33.1676026309439; Fri, 10
 Feb 2023 02:51:49 -0800 (PST)
MIME-Version: 1.0
References: <20230209152123.3186930-1-jaz@semihalf.com> <20230209152123.3186930-2-jaz@semihalf.com>
 <87ttzu1zqi.ffs@tglx>
In-Reply-To: <87ttzu1zqi.ffs@tglx>
From:   Grzegorz Jaszczyk <jaz@semihalf.com>
Date:   Fri, 10 Feb 2023 11:51:38 +0100
Message-ID: <CAH76GKMFd+kdca39nVtZG4xKqp6kL5RDZ24-NHqufZAXDzdhoA@mail.gmail.com>
Subject: Re: [RESEND RFCv2 1/1] platform/x86: Add virtual PMC driver used for S2Idle
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, rafael@kernel.org, dmy@semihalf.com,
        tn@semihalf.com, dbehr@google.com,
        zide.chen@intel.corp-partner.google.com, seanjc@google.com,
        upstream@semihalf.com, hdegoede@redhat.com, markgross@kernel.org,
        dtor@google.com, mario.limonciello@amd.com,
        linux-pm@vger.kernel.org, x86@kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

czw., 9 lut 2023 o 19:05 Thomas Gleixner <tglx@linutronix.de> napisa=C5=82(=
a):
>
> On Thu, Feb 09 2023 at 15:21, Grzegorz Jaszczyk wrote:
> > +
> > +static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops =3D {
>
> What is AMD specific about this?

Nothing, my bad - I will remove the 'amd' prefix.

>
> > +     .check =3D virt_pmc_s2idle_notify,
> > +};
>
> ...
>
> > +
> > +MODULE_DESCRIPTION("Virtual PMC Driver");
>
> Lacks MODULE_LICENSE("GPL")

Sure,
Thank you

>
> Thanks,
>
>         tglx
