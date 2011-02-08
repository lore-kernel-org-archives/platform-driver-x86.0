From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH RESEND] x86,mrst: Intel Medfield over-current detection
 patch
Date: Tue, 8 Feb 2011 10:45:35 +0000
Message-ID: <20110208104535.71a4bb12@lxorguk.ukuu.org.uk>
References: <20110125143454.10480.5156.stgit@bob.linux.org.uk>
	<20110207195843.GA20970@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:44908 "EHLO
	localhost.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752681Ab1BHKm2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Feb 2011 05:42:28 -0500
In-Reply-To: <20110207195843.GA20970@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Guenter Roeck <guenter.roeck@ericsson.com>

On Mon, 7 Feb 2011 19:58:43 +0000
Matthew Garrett <mjg59@srcf.ucam.org> wrote:

> hwmon includes support for exposing the instantaneous current draw. 
> hwmon includes support for triggering events if a parameter crosses a 
> threshold. I still don't see why this isn't an hwmon driver, perhaps 
> with a small platform driver for the more estoric bits of the setup.

The hwmon maintainer says its not. Explicitly so. Been there, had that
discussion a while ago (in fact we had it as well in December if you
remember and I pointed you at the hwmon list discussion

Cc'd Guenter and quoting this time

------------------------------

Seems to be a lot of chip specific stuff. Actually, you don't define a
single hwmon ABI attribute right now. So moving it to the x86 platform
code might be a better option.

One possibility might be to move the driver to the x86 platform code,
but add/use hwmon ABI attributes as much as possible, and register those
attributes as hwmon device if CONFIG_HWMON is defined. Several other
platform specific drivers already do the same.

------------------------------

Hence trying to move it to drivers/platform/x86


Alan
