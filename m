Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6730DC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Jun 2021 15:00:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4130061879
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Jun 2021 15:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhFYPCa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Jun 2021 11:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhFYPC3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Jun 2021 11:02:29 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A3BC061574
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jun 2021 08:00:08 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id s6so13760619edu.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jun 2021 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H/QBEf2nrVzvD8mx3IRhBXf8yFIH5sJHK66wHPXIAPM=;
        b=O0BPJkFq6Fv2zw1WZ1ZlGdLy68aMCf4CjiwfJe2xAbKEFu98OGvWchJN4ifsS29dkm
         j2AYa07FraPIVQrh0+KdhBpx119WWrwoOmdHid3qeJ9C/ZOFtQDcJmeIaM0UFqYM55ze
         Lxi2NGGfMvQzapbZ5fzz6Up9/pKB3SBCH8lt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/QBEf2nrVzvD8mx3IRhBXf8yFIH5sJHK66wHPXIAPM=;
        b=kXJAX2npIUFTVnAnMAyHVDyCPrQnV9ha/cZWgIZMm3hUI7E4YV7ZabtM0xkVAcjppI
         39K0+Npe7dLkf1fVBGGef/ARPw6JVDnsVZxPWrXfLkdv+xfKXnHKyP0ie7TJhwxpkzC/
         Rise8N587SwXljGmjC1Ez84q+NVKD1yVYZDE14SVCY7v3CcH6c9sGj1/VmgZBFc/MqP4
         Ebr5O8P+CYWdxUPnkFUjihya8S3OFoboOych3apfQhbF/P/P8i6iUfDLha3/zndaOgXT
         M/yV6wKl9HSaidgv5CAT9ydQS/4hobgJuYQZ6crbhFsQuFRI2NFunojZ+m1qVHlyNdFB
         anDg==
X-Gm-Message-State: AOAM531+G4YvtneSL0xiKjoA+Rphlcfzshe5I15FUrHcCcUflVOLPu9+
        IjiPVtB5uZod9R8JrHeRCd0H5R5GLe5H/w==
X-Google-Smtp-Source: ABdhPJxTU5SdhOAicKa067PVVjYIVq8el6O3+pijVbYy9ZWFbEunYCKIrLxva/PcIrppcy9MH3p2DQ==
X-Received: by 2002:a05:6402:204:: with SMTP id t4mr15113142edv.34.1624633206556;
        Fri, 25 Jun 2021 08:00:06 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id e6sm2902571ejm.35.2021.06.25.08.00.05
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 08:00:06 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id n20so13786901edv.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jun 2021 08:00:05 -0700 (PDT)
X-Received: by 2002:a50:eb8c:: with SMTP id y12mr15179446edr.189.1624633205532;
 Fri, 25 Jun 2021 08:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210623200149.2518885-1-Shyam-sundar.S-k@amd.com>
 <17e342aa-fa99-c14d-d018-2b4b65d31933@redhat.com> <b56d0232-5002-ace3-f3ce-21c506c1eeac@amd.com>
 <030527ae-9e5c-c3b4-ea48-f1dc5a4ec805@redhat.com>
In-Reply-To: <030527ae-9e5c-c3b4-ea48-f1dc5a4ec805@redhat.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Fri, 25 Jun 2021 08:59:54 -0600
X-Gmail-Original-Message-ID: <CAHQZ30CXT_Vj-Kq_j-mo6ohBoJuZ2A0vSF6+m=2H9HBNzvLgLg@mail.gmail.com>
Message-ID: <CAHQZ30CXT_Vj-Kq_j-mo6ohBoJuZ2A0vSF6+m=2H9HBNzvLgLg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] updates to amd-pmc driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for clarifying my comments Hans :)

On Fri, Jun 25, 2021 at 8:25 AM Hans de Goede <hdegoede@redhat.com> wrote:
> After patch 1/7 there are 2 waits:
>
> 1. To wait for any pending previous command to complete
> 2. A new one introduced by patch 1/7 which waits for the just
> send command to complete.
>
> 1. seems redundant since we are the only one talking to the PMC,
> and we (now) wait for the command to complete before returning
> from amd_pmc_send_cmd().

I still think it's prudent to check this, just in case. It shouldn't
be expensive.

>
> 2. The command could be unknown, or fail for some reason,
> so it seems that the old wait for any response != 0
> (after we clear the register) is the right thing to do
> and then we should do a switch-case on the response
> to see if the response is ok, or some error.
>

I should have placed my comments on the second one.

> Also I see no protection against 2 amd_pmc_send_cmd()
> calls running in parallel. ATM that seems to be fine since
> this cannot happen, but it might be good to still add a
> mutex and take that so that this does not break in the
> future when some new user may show up which can run in
> parallel.
>
> So IMHO the right sequence here would be:
>
> 1. Take mutex
> 2. Clear response register (clearing response from previous command)
> 3. Write argument
> 4. Write message id
> 5. Wait for response register to become !- 0.
> 6. release mutex
> 7. do a switch-case on the read response, treating ok
> as success an anything else as an error.
>

I agree.
