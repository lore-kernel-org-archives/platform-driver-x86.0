Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A107EC05027
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Feb 2023 21:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjBHVnM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Feb 2023 16:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbjBHVnM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 16:43:12 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 549442E812
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Feb 2023 13:43:11 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id y1so18302304wru.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Feb 2023 13:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DMkc6Z4Dgkv06utQgnd4K0uWr4+R7e0xnwDDCtankCw=;
        b=Ritqc3oGDgJr0mtCcO9sp2rurQj+uWc0WyjxmWqa8XZazdXfMxdJua38lcnUIn29Lf
         ODi059uumUX1WHkuK/Bw38vtfgDyQT1FwWAXjfYvpV3Nz6EAUZ8DsSqKbFRrXEUyzus4
         oD4m9uPXyNPuDqG7f6vX9cQ8n+F886HppFWt4R0q0RuN3kCY/aATu73DgSedAhisKShA
         gioqekD60vgoYBac8Yxw61Xa5p0Wr9+R/mwJUmN2+MHS5k8KsAuTcC76bjJFOlwGY4B3
         rtGegEHwwUM8TF7n91YD50qhKSA3m6QdOipQSumxnJ83U331WOVbdv6bJfm/35lNRtKY
         FOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMkc6Z4Dgkv06utQgnd4K0uWr4+R7e0xnwDDCtankCw=;
        b=pjkipiYt32AooLQuFC3dU3kVO0HOgfK+DYpP5+owVhEoDf+TiN5Kwvvtk1bD/+Hvzs
         voVvb7wCo0/iPPcL3QpZuMTZszXCANQKAH9Wnuqh6sR6h0MnO0fq1Rts2+xfGrtkPeF2
         4WJNvKO80BXc21gJwaRuITuz39SGMPQeqCo4Jmdf/9yMTNUf/NM4dCzrjiBTIn0eUTGf
         CvrU8walVHXxmSRJ5qEeMQqlb5cOKHS0rpulionltibGwvNw+yRq1B0hwvCaSBofFIKq
         42r6yKw4wvmOdBNkHFmzPjsx249UVZsCbqRD4pyQV4JDJ0nzUNdgpTIzpz5MdGtNkhWs
         82qw==
X-Gm-Message-State: AO0yUKW3MDwXo3xztw2Tj8KxfP85SEzPGiYe8eOFvvjEbkvdzag30ift
        1V4UqyKE4+hfWrmMGOnZvr0=
X-Google-Smtp-Source: AK7set/aC1pzJLIJlC/74iylhm4snZu1y7E3tEmKzeWCyB1h0bnmgN0FySZ7g40MDOlmvT1m3nlnbw==
X-Received: by 2002:a5d:6791:0:b0:2bf:963a:f266 with SMTP id v17-20020a5d6791000000b002bf963af266mr8318551wru.27.1675892589761;
        Wed, 08 Feb 2023 13:43:09 -0800 (PST)
Received: from localhost ([178.218.144.99])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b002bff574a250sm14470113wrr.2.2023.02.08.13.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 13:43:09 -0800 (PST)
Date:   Wed, 8 Feb 2023 23:43:04 +0200
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Richard Hughes <hughsient@gmail.com>
Cc:     "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>,
        Alex Hung <alexhung@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Enver Balalic <balalic.enver@gmail.com>
Subject: Re: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
Message-ID: <Y+QXXXX1u33Eyf4E@mail.gmail.com>
References: <Y+JbBiMJw+VLo2Nr@mail.gmail.com>
 <CAD2FfiGLH87H6CVbHimXUfz7ESUKwO8k1ABCgKU9L2SnfGanTA@mail.gmail.com>
 <PH0PR84MB1953825BC90B268904C6C7E5A8D89@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <CAD2FfiFUEMupUBoWj2hq9ep=R0Sk-xgBscXqMPefAipvoCg8eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD2FfiFUEMupUBoWj2hq9ep=R0Sk-xgBscXqMPefAipvoCg8eg@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Feb 08, 2023 at 08:09:16PM +0000, Richard Hughes wrote:
> On Wed, 8 Feb 2023 at 19:27, Lopez, Jorge A (Security)
> <jorge.lopez2@hp.com> wrote:
> > Please do ahead and demote the firmware for me.
> 
> Okay, now I'm double confused; the only HP Elite Dragonfly G2 firmware
> on the LVFS has never been in any stable branch.

This is the firmware on LVFS, it's marked as stable:

https://fwupd.org/lvfs/devices/com.hp.laptop.system.T90.firmware

dmidecode says:

Handle 0x0001, DMI type 0, 26 bytes
BIOS Information
	Vendor: HP
	Version: T90 Ver. 01.09.01
	Release Date: 05/05/2022

> Maxim -- are you sure
> you got the firmware from the LVFS (and not automatically through
> Windows Update)

Yes, I'm pretty sure, I don't have any Windows, and I used fwupdmgr to
upgrade (and then downgrade).

> and if so can you please send me the output of
> "fwupdmgr get-devices" off-list please.

Sure, will send in a few minutes.

> 
> Richard.
