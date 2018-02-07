From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add 2-in-1 devices to the DMI whitelist
Date: Wed, 7 Feb 2018 16:18:30 +0200
Message-ID: <CAHp75VeQtJKVWMtLtThqshjV5mZXGJEnzt1z-EAt7PmM6jdnRw@mail.gmail.com>
References: <20180125224857.3622-1-alexander.n.abrosimov@gmail.com>
 <20180125230239.GA3736@fury> <20180125230615.akr2nvmmrqzfo53q@pali>
 <d72f1065c98d4073b3f112cf8538f508@ausx13mpc120.AMER.DELL.COM> <CACKjtf6eiFXeBzzfO=cjkBru4j0M3YLtAJ1b7e_nv13k1e0A8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:44690 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753876AbeBGOSb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Feb 2018 09:18:31 -0500
In-Reply-To: <CACKjtf6eiFXeBzzfO=cjkBru4j0M3YLtAJ1b7e_nv13k1e0A8Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alexander Abrosimov <alexander.n.abrosimov@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Mario Limonciello <Mario.Limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 7, 2018 at 3:47 PM, Alexander Abrosimov
<alexander.n.abrosimov@gmail.com> wrote:
> Darren, I have checked change on git.kernel.org and it seems to be merged twice:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/x86/dell-laptop.c?id=fe486138788ba435ffa918c8d7aba05a77b6289a
>
> How it can be fixed?

First of all, please, do not top post!

WRT the report, as I can see it's not fatal or anyhow affecting the
normal workflow.
Thus, just sent a regular patch to remove duplicate entries.

I don't see necessity to send that fix to stable@ because it wouldn't
fix any bugs or regressions.

-- 
With Best Regards,
Andy Shevchenko
