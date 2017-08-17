From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/4] platform/x86: Fix check for method instance number
Date: Thu, 17 Aug 2017 08:25:25 -0700
Message-ID: <20170817152525.GB19276@fury>
References: <1502523858-25716-1-git-send-email-pali.rohar@gmail.com>
 <CAHp75Ve-umOB8U2HZ7iVf-0HfQX=A3-7KanEa0AY=iEhWpFuaA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:55698 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750857AbdHQPZ2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Aug 2017 11:25:28 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Ve-umOB8U2HZ7iVf-0HfQX=A3-7KanEa0AY=iEhWpFuaA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Aug 13, 2017 at 03:54:26PM +0300, Andy Shevchenko wrote:
> On Sat, Aug 12, 2017 at 10:44 AM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > This patch series fixes remaining mxm-wmi and asus-wmi drivers to evaluate
> > WMI methods with correct and available instance number. Now all WMI drivers
> > should call WMI functions with correct instance number and last patch fixes
> > WMI check for invalid instances. Patch for paeq-wmi is optional as machine
> > has 10 instances but instance number is ignored at all. But for consistency
> > with other drivers first instance would be used (instead of second).
> >
> 
> I pushed first 3 to testing, which seems to me right thing to do, and
> left the last one to be ACK by Darren and/or others (I'm not familiar
> so far with that code).

Reviewed with one question to Pali. Since you merged 1-3, I'll leave 4 to you
unless you prefer I merge it.

> Thanks!
> 
> > Pali Rohár (4):
> >   platform/x86: mxm-wmi: Evaluate wmi method with instance number 0x0
> >   platform/x86: asus-wmi: Evaluate wmi method with instance number 0x0
> >   platform/x86: peaq-wmi: Evaluate wmi method with instance number 0x0
> >   platform/x86: wmi: Fix check for method instance number
> >
> >  drivers/platform/x86/asus-wmi.c |    4 ++--
> >  drivers/platform/x86/mxm-wmi.c  |    4 ++--
> >  drivers/platform/x86/peaq-wmi.c |    2 +-
> >  drivers/platform/x86/wmi.c      |    6 +++---
> >  4 files changed, 8 insertions(+), 8 deletions(-)
> >
> > --
> > 1.7.9.5
> >
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 

-- 
Darren Hart
VMware Open Source Technology Center
