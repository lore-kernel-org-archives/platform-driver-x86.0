Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46185C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Dec 2020 15:57:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1175F221FA
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Dec 2020 15:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgLVP55 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Dec 2020 10:57:57 -0500
Received: from mail.ispras.ru ([83.149.199.84]:53634 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726973AbgLVP55 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Dec 2020 10:57:57 -0500
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
        by mail.ispras.ru (Postfix) with ESMTPS id 6C92040D4004;
        Tue, 22 Dec 2020 15:57:15 +0000 (UTC)
Date:   Tue, 22 Dec 2020 18:57:15 +0300 (MSK)
From:   Alexander Monakov <amonakov@ispras.ru>
To:     "Deucher, Alexander" <Alexander.Deucher@amd.com>
cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: amd-pmc s2idle driver issues
In-Reply-To:  <MN2PR12MB4488CC1657EAEAB16886A200F7DF0@MN2PR12MB4488.namprd12.prod.outlook.com>
Message-ID: <alpine.LNX.2.20.13.2012221834180.10565@monopod.intra.ispras.ru>
References: <alpine.LNX.2.20.13.2012202341520.6949@monopod.intra.ispras.ru>  <MN2PR12MB448821DBD2DAA296FAE29A7AF7DF0@MN2PR12MB4488.namprd12.prod.outlook.com> <alpine.LNX.2.20.13.2012221720290.10565@monopod.intra.ispras.ru> 
 <MN2PR12MB4488CC1657EAEAB16886A200F7DF0@MN2PR12MB4488.namprd12.prod.outlook.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 22 Dec 2020, Deucher, Alexander wrote:

> > Yes. Out-of-the-box it's a "modern standby" laptop. There's a "hidden"
> > bios menu with extra settings that apparently allows to select legacy S3.
> > I did not change it, so I'm testing the "modern" mode.
> > 
> > Note that this driver fetches SMU version from MMIO, which looks odd to
> > me:
> > elsewhere (i.e. in the amdgpu driver) SMU version is retrieved by issuing the
> > corresponding SMU command, as far as I can tell.
> 
> There are multiple interfaces to the SMU. It's shared by the entire SoC on
> APUs.

Just pointing that out because evidently this interface does not work on this
laptop, producing all-ones instead of something resembling a version number.

Which APU generations does this driver support? If it does not support Renoir
(yet?) it should be documented in the Kconfig text. Is Renoir support related
to missing AMD0005 ACPI id binding, and borked version number info?

Alexander
