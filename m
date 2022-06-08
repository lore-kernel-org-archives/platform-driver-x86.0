Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4A0C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 11:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236969AbiFHLAv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 07:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236955AbiFHLAt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 07:00:49 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95826132A04
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 04:00:48 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id y19so40692449ejq.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 04:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tQKyU1IbrJ43/LX2VkA4iiDXXiGbhQOg3dutHKk0J3U=;
        b=P63XLBHXpc70f/IzEqr7kTLXKwoAHW9yMO1AVXtBW61VrfK4JMLRdh8f5LMr4MsEzA
         xqMpN38E3/BJThM21WQhXJb3Hv9wC+J6/b4e7cBcD69pqTQbo8fxqMB5xSJiW+XXcsE9
         o+SRg38mTTKpdQ7V83/ADRd/HfLXiRzzV7cfJFw74gF9BEQCGh9zkdnIAuXE0zDmB6LT
         zsjUXnajV6OeoERFzXtqHahNRxiyR1lWsGsfiSyNYdNsVahiklfUIcb5Q9gOzpiDvoPG
         bU5aEGbKCDmcN7+RWRfkOguzetKL61sP78J0s3Re8GTHagl2eL+i8+wfgHOkMYuaxQ9g
         wdag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQKyU1IbrJ43/LX2VkA4iiDXXiGbhQOg3dutHKk0J3U=;
        b=dExvgOo1ecxDdvHhC+6DLpyCVB73C1y6Fl508Yb5DguWc2PVtatTLofhB/CzMin3+E
         z3Na5aB54SUT7ymtll2x7EY8yzLqRT2Nms7XJfgLWrNZZl6UgcASz5zjvd6JuY4IReoK
         MxHaJBz5/7TsJCENB/wSqCmmrnYxdypkvMZplRUKHKqAbLS7zi8OdgP7DqnvQobrfDLX
         jPtSdhlJFSFpJJ5fB76XLgMXvz0bsfAB4FU3nYcjxOSginYJaVbn5xIdbgUrSs4vmigq
         meUR1+8K2T8O3XffB/bN8fFMfOwGUHyeDsE48gjmCQNCaVFHQKBZCf3tSt07ct6wmLGU
         8Nuw==
X-Gm-Message-State: AOAM531PvAp8gYu1d1i5x0ipZnDQzr2EYF7p5/m3PIIxOtEJAGkgKb04
        +TpPPQ3vCsI64UfgukH+ZzK3Ui0YRM4vZw2kRPZhcmAiqSS4kQ==
X-Google-Smtp-Source: ABdhPJxsPZEtGt1w4qc14gsNzpPBPcviaL+wcdjzxrtJqSPgq4651LlPMqTu9MZ02dZoFth29nOVZXT+NNXQv+8U/OY=
X-Received: by 2002:a17:906:c7c1:b0:711:d2e9:99d0 with SMTP id
 dc1-20020a170906c7c100b00711d2e999d0mr12834989ejb.639.1654686048038; Wed, 08
 Jun 2022 04:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220608061703.2664926-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20220608061703.2664926-1-Shyam-sundar.S-k@amd.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jun 2022 13:00:11 +0200
Message-ID: <CAHp75VdRsK9dVJgDkzJnzfDPJR7xgvK2=UdAg4zr6Uf8pHPc2g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Move AMD platform drivers to separate directory
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>,
        Suma Hegde <suma.hegde@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 8, 2022 at 10:38 AM Shyam Sundar S K
<Shyam-sundar.S-k@amd.com> wrote:
>
> Currently, AMD supported platform drivers are grouped under generic "x86"
> folder structure. Move the current drivers (amd-pmc and amd_hsmp) to a
> separate directory. This would also mean the newer driver submissions to
> pdx86 subsystem in the future will also land in AMD specific directory.

Can you use the trick that allows you to drop the "amd" prefix from
the file names?

-- 
With Best Regards,
Andy Shevchenko
