From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH RESEND] x86,mrst: Intel Medfield over-current detection
 patch
Date: Tue, 8 Feb 2011 14:08:00 +0000
Message-ID: <20110208140800.5001fb0a@lxorguk.ukuu.org.uk>
References: <20110125143454.10480.5156.stgit@bob.linux.org.uk>
	<20110207195843.GA20970@srcf.ucam.org>
	<20110208104535.71a4bb12@lxorguk.ukuu.org.uk>
	<20110208135228.GA11302@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:46940 "EHLO
	localhost.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754510Ab1BHOEx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Feb 2011 09:04:53 -0500
In-Reply-To: <20110208135228.GA11302@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Guenter Roeck <guenter.roeck@ericsson.com>

On Tue, 8 Feb 2011 13:52:28 +0000
Matthew Garrett <mjg59@srcf.ucam.org> wrote:

> On Tue, Feb 08, 2011 at 10:45:35AM +0000, Alan Cox wrote:
> > On Mon, 7 Feb 2011 19:58:43 +0000
> > Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> > 
> > > hwmon includes support for exposing the instantaneous current draw. 
> > > hwmon includes support for triggering events if a parameter crosses a 
> > > threshold. I still don't see why this isn't an hwmon driver, perhaps 
> > > with a small platform driver for the more estoric bits of the setup.
> > 
> > The hwmon maintainer says its not. Explicitly so. Been there, had that
> > discussion a while ago (in fact we had it as well in December if you
> > remember and I pointed you at the hwmon list discussion
> 
> The hwmon maintainer says that it's not an hwmon driver, not that it 
> shouldn't be an hwmon driver.

That's not how I interpret it, but he's Cc'd so I'll let him speak for
himself, failing that I'll stuff it in arch/x86/platform/mrst I guess
