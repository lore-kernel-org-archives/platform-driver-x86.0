From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: linux-next: Tree for December 8
 (drivers/platform/x86/Kconfig:422:error: recursive dependency detected!)
Date: Wed, 8 Dec 2010 15:52:14 -0800
Message-ID: <20101208235214.GC15294@core.coreip.homeip.net>
References: <AANLkTim3FJjVpbjM10kJJhXbONpvGSGQFE+mfGX9pAS6@mail.gmail.com>
 <AANLkTimjVY-6OwRfFUzUbmyacM81M35wf5qDWqAouUYb@mail.gmail.com>
 <1291801990.5992.105.camel@i7.infradead.org>
 <20101208174603.GA7107@core.coreip.homeip.net>
 <20101208135105.a8482d46.randy.dunlap@oracle.com>
 <1291849721.5992.145.camel@i7.infradead.org>
 <20101208153428.93c95c54.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:53864 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752266Ab0LHXwZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Dec 2010 18:52:25 -0500
Content-Disposition: inline
In-Reply-To: <20101208153428.93c95c54.randy.dunlap@oracle.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, sedat.dilek@gmail.com, Matthew Garrett <mjg@redhat.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Dec 08, 2010 at 03:34:28PM -0800, Randy Dunlap wrote:
> On Wed, 08 Dec 2010 23:08:39 +0000 David Woodhouse wrote:
> 
> > On Wed, 2010-12-08 at 13:51 -0800, Randy Dunlap wrote:
> > > 
> > > I dislike select, but reality is that modules do need to select/enable
> > > library code and minor features sometimes.
> > > 
> > > OTOH, where drivers/platform/x86/Kconfig:ACPI_CMPC does "select INPUT"
> > > to enable an entire subsystem is wrong and bad IMO. 
> > 
> > This is just a deficiency in the tools. The correct answer is to fix the
> > damn tools, not invent this silly 'select' facility which means much the
> > same thing as 'depends on' but is implemented differently.
> > 
> > As long ago as the mid-1990s, the Nemesis research OS was using a tcl
> > xconfig tool based on the Linux one, but which would show you the
> > dependencies for an option that was disabled, so you could enable them
> > where you needed to. Rather than just hiding the option completely.
> 
> 
> xconfig has options that show all symbols.  I use that most of the time,
> but I bet that most people do not.
> 

GUI tools have means of presenting this, menuconfig and oldconfig have
harder time...

-- 
Dmitry
