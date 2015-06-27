From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH 1/1] platform: x86: Deletion of checks before
 backlight_device_unregister()
Date: Sat, 27 Jun 2015 09:07:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1506270906490.2016@localhost6.localdomain6>
References: <5307CAA2.8060406@users.sourceforge.net> <5317A59D.4@users.sourceforge.net> <547389A6.9090106@users.sourceforge.net> <3842367.ojrMxTW2rH@path> <5473AD39.9010309@users.sourceforge.net> <alpine.DEB.2.10.1411271908590.2571@hadrien>
 <20150626230655.GB57818@vmdeb7>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:34448
	"EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752677AbbF0HIL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 27 Jun 2015 03:08:11 -0400
In-Reply-To: <20150626230655.GB57818@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, SF Markus Elfring <elfring@users.sourceforge.net>, Anisse Astier <anisse@astier.eu>, Corentin Chary <corentin.chary@gmail.com>, Ike Panhc <ike.pan@canonical.com>, Jonathan Woithe <jwoithe@just42.net>, Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On Fri, 26 Jun 2015, Darren Hart wrote:

> On Thu, Nov 27, 2014 at 07:13:10PM +0100, Julia Lawall wrote:
> > 
> > 
> > On Mon, 24 Nov 2014, SF Markus Elfring wrote:
> > 
> > > >> This issue was detected by using the Coccinelle software.
> > > >
> > > > What script was used ?
> > >
> > > A semantic patch approach which I published on the mailing lists in March
> > > is in action on my software development system for a while.
> > >
> > >
> > > > Is it in scripts/coccinelle ?
> > >
> > > Not yet.
> > >
> > > I hope that the involved update suggestions got sufficient positive feedback
> > > to integrate five scripts there.
> > 
> > The current scripts are very complicated, involving the interaction
> > between multiple scripts and a database, and I think they are not very
> > suitable for make coccicheck.  Also, the idea of removing the null checks
> > is not appropriate in all contexts.  Perhaps it could be possible to add
> > a script to the Linux kernel that handles a number of common cases for
> > which removing the null test is widely considered to be desirable.
> > 
> > julia
> > 
> 
> Julia, do you have any particular objection to this specific patch? I didn't see
> a reason to prevent it going in.

Sorry if I was unclear.  If there is no problem with the current patch, I 
have no objection to it.  I don't think that the semantic patch that 
caused this patch to be generated is suitable for inclusion in the Linux 
kernel.

julia
