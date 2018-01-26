From: Wilfried Klaebe <linux-kernel@lebenslange-mailadresse.de>
Subject: Re: [PATCH] Revert "apple-gmux: lock iGP IO to protect from vgaarb
 changes"
Date: Fri, 26 Jan 2018 19:53:26 +0100
Message-ID: <20180126185326.toxdeggkdru4zywg@chaos.in-kiel.de>
References: <3671c3081a0ea3226dbb4c04e780ad7b6be0f201.1516793407.git.lukas@wunner.de>
 <20180125201048.x3tr3xpovo5tzduz@chaos.in-kiel.de>
 <20180125202530.GA7175@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx01.toppoint.de ([217.70.197.24]:42851 "EHLO mx01.toppoint.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751861AbeAZS7i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Jan 2018 13:59:38 -0500
Content-Disposition: inline
In-Reply-To: <20180125202530.GA7175@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Petri Hodju <petrihodju@yahoo.com>, Bjorn Helgaas <bhelgaas@google.com>, Bruno Premont <bonbons@linux-vserver.org>, Andy Ritger <aritger@nvidia.com>, Ronald Tschalaer <ronald@innovation.ch>

Am Thu, Jan 25, 2018 at 09:25:30PM +0100 schrieb Lukas Wunner:
> On Thu, Jan 25, 2018 at 09:10:48PM +0100, Wilfried Klaebe wrote:
> > On Wed, Jan 24, 2018 at 07:35:45PM +0100, Lukas Wunner wrote:
> > > * Wilfried Klaebe reports a deadlock when launching Xorg because it
> > >   opens /dev/vga_arbiter and calls vga_get(), but apple-gmux is holding
> > >   a lock on I/O space indefinitely.  It looks like apple-gmux' current
> > >   behavior is an abuse of the vgaarb API as locks are not meant to be
> > >   held for longer periods:
> > >   https://bugzilla.kernel.org/show_bug.cgi?id=88861#c11
> > >   https://bugzilla.kernel.org/attachment.cgi?id=217541
> [...]
> > I see warnings about possible circular locking regarding vgasr_mutex,
> > but haven't had a deadlock yet. I'd be happy to provide more information
> > as timely as job and family allow.
> 
> Could you attach dmesg output with that lockdep splat to the
> above-quoted bugzilla entry?

Done.

Regards,
Wilfried
