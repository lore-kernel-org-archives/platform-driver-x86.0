From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH RESEND] x86,mrst: Intel Medfield over-current detection
	patch
Date: Tue, 8 Feb 2011 13:52:28 +0000
Message-ID: <20110208135228.GA11302@srcf.ucam.org>
References: <20110125143454.10480.5156.stgit@bob.linux.org.uk> <20110207195843.GA20970@srcf.ucam.org> <20110208104535.71a4bb12@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:38798 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753939Ab1BHNwd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Feb 2011 08:52:33 -0500
Content-Disposition: inline
In-Reply-To: <20110208104535.71a4bb12@lxorguk.ukuu.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: platform-driver-x86@vger.kernel.org, Guenter Roeck <guenter.roeck@ericsson.com>

On Tue, Feb 08, 2011 at 10:45:35AM +0000, Alan Cox wrote:
> On Mon, 7 Feb 2011 19:58:43 +0000
> Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> 
> > hwmon includes support for exposing the instantaneous current draw. 
> > hwmon includes support for triggering events if a parameter crosses a 
> > threshold. I still don't see why this isn't an hwmon driver, perhaps 
> > with a small platform driver for the more estoric bits of the setup.
> 
> The hwmon maintainer says its not. Explicitly so. Been there, had that
> discussion a while ago (in fact we had it as well in December if you
> remember and I pointed you at the hwmon list discussion

The hwmon maintainer says that it's not an hwmon driver, not that it 
shouldn't be an hwmon driver.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
