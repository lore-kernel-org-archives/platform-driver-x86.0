Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861FDC6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 21:35:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbjCTVen (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 17:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjCTVel (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 17:34:41 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA571303EB
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 14:34:06 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id bz27so3198636qtb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 14:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679348010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vGqjh+X/oB8IFdC8qG3uzOC5EdI0cH2jFpAZtyXE1jY=;
        b=LgDkrNqBVC8FiZ29m/yWq08mSlNekrm1mosXeVxERSe8WxaL5K0bm1vg2evCHNAqiZ
         /xXp2ngZBuDkTAwjsCA7+8k2C01FaQkmLAS7Cs1LT4ROn2o8nk30XxtKwAG7i4ZjoiMS
         /6+aJHXdzvLCsB3bBhWb7Sn6cKScRhi/luC6/OOHxVDVIDVE0ho8ygFTydp4trLR02k4
         L+7ewbW/GNB8e/ikFHoKXC9HTLwRVyUp9WNBRUHQu5IFypoQfv5ozL3hZyIJtgfhVdkz
         DE/ndW/wQK+7w/subUYdo4K4TDDLjkV5bz+9BUnPQzAYKMf/BalEgrlE6Mpbh3NjmIym
         Cs4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679348010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGqjh+X/oB8IFdC8qG3uzOC5EdI0cH2jFpAZtyXE1jY=;
        b=vTywQyhFRb53sg72Sio6DFvLCkAJQMXli5XIw7OmVskZHPukp/Kiu9V7KtgigQuCM2
         N2PUipEn6hpeKTjopkIq/saUJ1JDrfny2U/4cMvkvT7A76zSgb4MYeq9PB6ywmPWWgks
         nMuWZqBRPPIeP94Lr1bxzjvHo7x8R0ebemEpm2B+9aVWZvqlJsMNAXqrHIPGT1FWHFhF
         2sB92BMkIzJsSRnIe8BKrY1d6vOT6ks1RlCc5E6m5pSpdC6e1wjct0kCfoH4w+H57ArE
         4J7xf3IITn0mPEUrcqSIuTHGKSSxjtTmzKzfdaLkvm9oSezI436I/IU+vWnzRB65/YBW
         3byg==
X-Gm-Message-State: AO0yUKX3EJaMEcBEShBFdSsNBoug6AaTPH/OctXyHdtQ5yqdCqG2Hv5R
        ZM+f73oefZzzCzomxR6aPDTjd7dLNsvyaW+IqMrndGEY+fU=
X-Google-Smtp-Source: AK7set+yyx6cCWQQw1bRgphGGp//Xcb78sMivkEsN1mAU5uR8FHBoa+PahUfKgFVLu6sccuMMYISKi7QMU7WxshFo4E=
X-Received: by 2002:a67:d38d:0:b0:425:f1e7:fecf with SMTP id
 b13-20020a67d38d000000b00425f1e7fecfmr290283vsj.7.1679347583464; Mon, 20 Mar
 2023 14:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230311144054.8754-1-teackot@gmail.com> <iPt1Reo37oGFvlRdQOY-3kZypWeV0pRah5oZ17K4xUOkeMqE7E43XQVyUX0A4a6oeEc1hPPzbjKcU3NznXUA3fnmp-foM3vuFSnA4YcFTDQ=@protonmail.com>
 <CAPXvF05AurS89f6bNg_5-VCS=vX=qMXbKgSdv5-wwBb8J3Xdcw@mail.gmail.com>
 <badebe08-7c9b-6f34-b938-b14c06a57985@redhat.com> <CAPXvF05Sp6jVGaMMPaSfFtaz=Ogt46E2fibu2Q_zBh=HnQzhGA@mail.gmail.com>
 <c8f12f66-829d-0222-9dde-80211d256e0b@redhat.com>
In-Reply-To: <c8f12f66-829d-0222-9dde-80211d256e0b@redhat.com>
From:   Nikita Kravets <teackot@gmail.com>
Date:   Tue, 21 Mar 2023 00:26:12 +0300
Message-ID: <CAPXvF04RO=nfq6sSwPy2deYF+RVBWfRP+pOpG0a9k_-rVR77gg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: Add new msi-ec driver
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Jose Angel Pastrana <japp0005@red.ujaen.es>,
        Aakash Singh <mail@singhaakash.dev>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

v3 is ready, but now that you've tested the driver on your devices,
should I add modaliases before sending it?

Regards,
Nikita
