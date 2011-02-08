From: Guenter Roeck <guenter.roeck@ericsson.com>
Subject: Re: [PATCH RESEND] x86,mrst: Intel Medfield over-current detection
 patch
Date: Tue, 8 Feb 2011 07:49:16 -0800
Message-ID: <20110208154916.GB13436@ericsson.com>
References: <20110125143454.10480.5156.stgit@bob.linux.org.uk>
 <20110207195843.GA20970@srcf.ucam.org>
 <20110208104535.71a4bb12@lxorguk.ukuu.org.uk>
 <20110208135228.GA11302@srcf.ucam.org>
 <20110208140800.5001fb0a@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from imr4.ericy.com ([198.24.6.8]:60043 "EHLO imr4.ericy.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754493Ab1BHPti (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Feb 2011 10:49:38 -0500
Content-Disposition: inline
In-Reply-To: <20110208140800.5001fb0a@lxorguk.ukuu.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Tue, Feb 08, 2011 at 09:08:00AM -0500, Alan Cox wrote:
> On Tue, 8 Feb 2011 13:52:28 +0000
> Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> 
> > On Tue, Feb 08, 2011 at 10:45:35AM +0000, Alan Cox wrote:
> > > On Mon, 7 Feb 2011 19:58:43 +0000
> > > Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> > > 
> > > > hwmon includes support for exposing the instantaneous current draw. 
> > > > hwmon includes support for triggering events if a parameter crosses a 

Not explicitly, really. Sure, one can write a driver which triggers such an event,
but afaik there is only one hwmon driver doing that right now, and doing so
is not part of the hwmon infrastructure.

> > > > threshold. I still don't see why this isn't an hwmon driver, perhaps 
> > > > with a small platform driver for the more estoric bits of the setup.
> > > 
> > > The hwmon maintainer says its not. Explicitly so. Been there, had that
> > > discussion a while ago (in fact we had it as well in December if you
> > > remember and I pointed you at the hwmon list discussion
> > 
> > The hwmon maintainer says that it's not an hwmon driver, not that it 
> > shouldn't be an hwmon driver.
> 
> That's not how I interpret it, but he's Cc'd so I'll let him speak for
> himself, failing that I'll stuff it in arch/x86/platform/mrst I guess

Seems to me there is some hair splitting going on here. Core element of
hwmon drivers is that there are reported temperatures, voltages, current,
power, humidity, etc. I don't see any of those here. All I see is various
current limits. Those are secondary attributes from hwmon perspective.
So I don't really see how this can be made a hwmon driver.

Anyway, didn't you have this discussion before ? Does this all have to be
repeated over and over again ? I agree with everything Alan has said
in the previous exchange last December. Repeating it won't change anything.

Guenter
