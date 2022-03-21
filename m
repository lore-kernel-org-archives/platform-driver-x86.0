Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92C8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Mar 2022 22:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiCUWHc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Mar 2022 18:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiCUWHc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Mar 2022 18:07:32 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D396C33F211
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Mar 2022 14:58:37 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id p5so10524326pfo.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Mar 2022 14:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tirotech-co-nz.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qgGWcNzqf70V0zDA4Yv68hUMtmMVuVXrVYT6D0ldnSA=;
        b=NqQMU+RlRXEyvXplZj/GcJHynyho2mNoYHvXPnMq5jPk+by0W9euAldjHQVyZpeOxR
         8OuwENpf1xs5DP9cRhz2QKcl5TmsbW0oHOxfKZNtr2LBI79sCYwq8Q8RbXhucxhUEzBh
         XHZQPekoPQ1JcsZXwiUxWg3yjdmfz58Rt6VoWPlDMlRL8Asia7nQ8Gn7p0e/pF4nD0PR
         e6W/BR+vtNeKG9CXEai7G5HnxaJ5uFlPncO7lkxg15oIYFJ2OR/AbXkL73RFOF0Nllzh
         meFXWN4o6gH+CdjR6qirvzzo8W6aylJcQcalbbCup4XclXbK1QnxknAhV3q4qWzbB1Lc
         KGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qgGWcNzqf70V0zDA4Yv68hUMtmMVuVXrVYT6D0ldnSA=;
        b=pkJH1wS+XSJ5uc6oZ6IxFhFoNeZbxDFdNhAoniKVCR11PNviraLJUcJS0+OLAhN8CV
         2ntU3L1eR37Qm+dMzZayTyMHCxnjIomUFh3Y4wxipbayjNe+1/lvswRsb5a8BabedYKY
         tPKkAGXDC5m6lLmI0kCRrciCamI3RqttfRDfeU6S1YY9qM4oyFj1uBI5s5AanfaawPsw
         16riQFDAEvj3cNolB3AhapsZltBSGzCbGaQ+mgDW8dx5QZyCg69OJWa+HC5OVzz5kecX
         4Op9Rv6fTyBFpMvtIMXIDm2w5ZoWJPE42awOxNXHaCHJdPe4e42LrPJNkKWwhrcoIIR+
         kGJA==
X-Gm-Message-State: AOAM530Du3WqZFDZmpaVLTd9jHQmEK37AFiL4Pmi0IS3n+t6GabzwRa3
        RObVRcNzwpzAoo5/9LHjJgEORQ==
X-Google-Smtp-Source: ABdhPJx2x+qXILIuvhr2vGrCamrFMyqXjFh4dqr8xaKUcPYjivCIvhoyXz3FtzK6/pd07AQHZeSj/Q==
X-Received: by 2002:a05:6a00:2402:b0:4e1:3df2:5373 with SMTP id z2-20020a056a00240200b004e13df25373mr26150714pfh.40.1647899620364;
        Mon, 21 Mar 2022 14:53:40 -0700 (PDT)
Received: from localhost ([121.99.145.49])
        by smtp.gmail.com with ESMTPSA id i9-20020a17090a2a0900b001c6e540fb6asm380469pjd.13.2022.03.21.14.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 14:53:39 -0700 (PDT)
Date:   Tue, 22 Mar 2022 10:53:36 +1300
From:   Daniel Beer <daniel.beer@tirotech.co.nz>
To:     =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] winmate-fm07-keys: Winmate FM07/FM07P buttons
Message-ID: <20220321215336.GA1005@nyquist.nev>
References: <6237f057.1c69fb81.1689.fec7@mx.google.com>
 <XgTKv1bHGoFONS2zlwhJAM-CvIm8ZgwA0Nf2UTl0_P38ubTg9hPzJOEP14Kddal_Lxk91kvQuHhi4P0gOAht_c_P847QCqMPeN81xv6mEhY=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <XgTKv1bHGoFONS2zlwhJAM-CvIm8ZgwA0Nf2UTl0_P38ubTg9hPzJOEP14Kddal_Lxk91kvQuHhi4P0gOAht_c_P847QCqMPeN81xv6mEhY=@protonmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Mar 21, 2022 at 08:13:15PM +0000, Barnabás Pőcze wrote:
> > +#define PORT_CMD	0x6c
> > +#define PORT_DATA	0x68
> > +
> > +#define EC_ADDR_KEYS	0x3b
> > +#define EC_CMD_READ	0x80
> 
> It seems you are reading from the embedded controller, have you checked if the
> ACPI EC driver works? Then you could probably just use the `ec_{read,write}()` functions.

Hi Barnabás,

There is already an ACPI EC driver working on this system, but it's
using ports 0x66 and 0x62. I guess this one is something unrelated,
although it does appear to use the same protocol.

I might be missing something, but it doesn't look like I can use the ec_
functions in this case as they will direct everything towards the EC at
0x66/0x62. Is there anything else you'd suggest?

If it helps to know, the hardware vendor shipped an Ubuntu distribution
with a kernel module that just exposed the ability to read/write ports
0x6c/0x68 via chardev ioctls, and then a proprietary userspace program
polled for button states.

I'll address your other comments in v2.

Cheers,
Daniel

-- 
Daniel Beer
Software Development Manager
Tirotech Ltd
