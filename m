From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: Tree for December 8
 (drivers/platform/x86/Kconfig:422:error: recursive dependency detected!)
Date: Wed, 08 Dec 2010 23:08:39 +0000
Message-ID: <1291849721.5992.145.camel@i7.infradead.org>
References: <AANLkTim3FJjVpbjM10kJJhXbONpvGSGQFE+mfGX9pAS6@mail.gmail.com>
	 <AANLkTimjVY-6OwRfFUzUbmyacM81M35wf5qDWqAouUYb@mail.gmail.com>
	 <1291801990.5992.105.camel@i7.infradead.org>
	 <20101208174603.GA7107@core.coreip.homeip.net>
	 <20101208135105.a8482d46.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:37019 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756353Ab0LHXIq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Dec 2010 18:08:46 -0500
In-Reply-To: <20101208135105.a8482d46.randy.dunlap@oracle.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, sedat.dilek@gmail.com, Matthew Garrett <mjg@redhat.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, 2010-12-08 at 13:51 -0800, Randy Dunlap wrote:
> 
> I dislike select, but reality is that modules do need to select/enable
> library code and minor features sometimes.
> 
> OTOH, where drivers/platform/x86/Kconfig:ACPI_CMPC does "select INPUT"
> to enable an entire subsystem is wrong and bad IMO. 

This is just a deficiency in the tools. The correct answer is to fix the
damn tools, not invent this silly 'select' facility which means much the
same thing as 'depends on' but is implemented differently.

As long ago as the mid-1990s, the Nemesis research OS was using a tcl
xconfig tool based on the Linux one, but which would show you the
dependencies for an option that was disabled, so you could enable them
where you needed to. Rather than just hiding the option completely.

-- 
dwmw2
