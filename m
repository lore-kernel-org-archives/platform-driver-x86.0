From: Lukas Wunner <lukas@wunner.de>
Subject: Re: Backlight control does not work on an Apple dual-GPU
 (intel/nvidia) system using nouveau
Date: Sun, 14 Feb 2016 14:40:45 +0100
Message-ID: <20160214134045.GA16892@wunner.de>
References: <56BF996F.3030503@guruburu.com>
 <20160213233912.GA16687@wunner.de>
 <20160214053827.GA25439@srcf.ucam.org>
 <CAHW-aUd7j+iQSTw551g0oucHS6kFmWjyLURuJX0zK_S_UBMV2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:57145 "EHLO
	mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751452AbcBNNkR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 14 Feb 2016 08:40:17 -0500
Content-Disposition: inline
In-Reply-To: <CAHW-aUd7j+iQSTw551g0oucHS6kFmWjyLURuJX0zK_S_UBMV2g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Michael Marineau <mike@marineau.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>, Gaele Strootman <gaele@guruburu.com>, Bjorn Helgaas <bhelgaas@google.com>, Bruno Bierbaumer <bruno@bierbaumer.net>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>

Hi Michael,

On Sat, Feb 13, 2016 at 10:36:47PM -0800, Michael Marineau wrote:
> On Feb 13, 2016 9:38 PM, "Matthew Garrett" <mjg59@srcf.ucam.org> wrote:
> >
> > On Sun, Feb 14, 2016 at 12:39:12AM +0100, Lukas Wunner wrote:
> > > @Bjorn Helgaas: Do you think this masquerade patch would be eligible
> > > for inclusion in the kernel or is this not in your department?
> > > https://www.marc.info/?l=grub-deavel&m=141586614924917&w=2
> >
> > I think this is an entirely appropriate piece of code to add to the EFI
> > boot code in the kernel.
> 
> One note on that code: making the Intel card visible exposes a number of
> other bugs such as power management with nouveau not working any more and
> despite vga switcheroo becoming available it isn't possible to switch to
> the Intel gpu because, at least on my machine, neither the Intel nor
> nouveau drivers can figure out how to bring up the eDP link or some such.

That is correct. GPU switching for pre-retinas was finally queued for
4.6 this week, retinas are my next target. To overcome the link training
issues I had experimented with AUX proxying last year until I realized in
December that the DP spec has a link training exemption for eDP. Basically
what we need to do is wait until the active GPU has set up its eDP output,
then communicate voltage swing, pre-emphasis, lane count etc to the
inactive GPU's driver (via vga_switcheroo) and use these pre-calibrated
values to set up the output. I've hacked together an initial implementation
of the i915 and vga_switcheroo side of things in early January, then got
side-tracked while working on the nouveau part. However I'll get back to
this pretty soon.

Best regards,

Lukas
