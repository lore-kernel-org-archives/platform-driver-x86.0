From: Andy Ritger <aritger@nvidia.com>
Subject: Re: [PATCH] Revert "apple-gmux: lock iGP IO to protect from vgaarb
 changes"
Date: Wed, 31 Jan 2018 17:31:08 -0800
Message-ID: <20180201013108.GL2933@prokofiev.nvidia.com>
References: <3671c3081a0ea3226dbb4c04e780ad7b6be0f201.1516793407.git.lukas@wunner.de>
 <20180125223800.GG24122@fury> <20180131183925.GA8676@fury>
 <20180131194420.GA5409@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:7209 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755903AbeBABbK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 31 Jan 2018 20:31:10 -0500
Content-Disposition: inline
In-Reply-To: <20180131194420.GA5409@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Petri Hodju <petrihodju@yahoo.com>, Bjorn Helgaas <bhelgaas@google.com>, Bruno Premont <bonbons@linux-vserver.org>, Andy Ritger <aritger@nvidia.com>, Ronald Tschalaer <ronald@innovation.ch>, Wilfried Klaebe <linux-kernel@lebenslange-mailadresse.de>

On Wed, Jan 31, 2018 at 08:44:20PM +0100, Lukas Wunner wrote:
> On Wed, Jan 31, 2018 at 10:39:25AM -0800, Darren Hart wrote:
> > On Thu, Jan 25, 2018 at 02:38:00PM -0800, Darren Hart wrote:
> > > On Wed, Jan 24, 2018 at 07:35:45PM +0100, Lukas Wunner wrote:
> > > > Commit 4eebd5a4e726 ("apple-gmux: lock iGP IO to protect from vgaarb
> > > > changes") amended this driver's ->probe hook to lock decoding of normal
> > > > (non-legacy) I/O space accesses to the integrated GPU on dual-GPU
> > > > MacBook Pros.  The lock stays in place until the driver is unbound.
> > > > 
> > > ...
> > > > 
> > > > So let's revert commit 4eebd5a4e726 please.  Users experiencing the
> > > > issue with the proprietary nvidia driver can comment out the above-
> > > > quoted problematic code as a workaround (or try updating the BIOS).
> > > > 
> > > > Cc: Petri Hodju <petrihodju@yahoo.com>
> > > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > > Cc: Bruno Prémont <bonbons@linux-vserver.org>
> > > > Cc: Andy Ritger <aritger@nvidia.com>
> > > > Cc: Ronald Tschalär <ronald@innovation.ch>
> > > 
> > > I presume we'd like to see this applied to linux-stable as well?
> > 
> > I haven't heard back
> 
> I did reply to your e-mail on Jan 26, quote:
> "Fine by me.  Can you add the stable designation when applying or
>  would you prefer me to respin?"
> 
> https://www.spinics.net/lists/platform-driver-x86/msg14690.html
> 
> 
> > but from what I've seen in this thread, this appears to me
> > to be in need of porting back to stable releases.
> > I'm pushing this to testing, and then shortly to for-next, and then to Linus.
> > Please let me know if this isn't what everyone is expecting.
> 
> WFM, thanks!
> 
> Lukas

Sorry for responding slowly to the thread.  Yes, if this reintroduces
interaction problems for users of the nvidia proprietary driver, then
commenting out the code you noted may be the best workaround for them
in the short term.

Anyway, the patch, for whichever kernel trees, is Acked-by: Andy Ritger <aritger@nvidia.com>
