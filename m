From: Johannes Stezenbach <js@sig21.net>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Tue, 12 Jan 2016 17:35:14 +0100
Message-ID: <20160112163514.GA24900@sig21.net>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <20160111190411.GE10643@malice.jf.intel.com>
 <1452540480.2848000.489039714.26068C20@webmail.messagingengine.com>
 <201601112103.01145@pali>
 <20160111211228.GA4171@sig21.net>
 <1452614830.376787.489968026.5FAEDB86@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.sig21.net ([80.244.240.74]:47210 "EHLO mail.sig21.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752043AbcALQfc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jan 2016 11:35:32 -0500
Content-Disposition: inline
In-Reply-To: <1452614830.376787.489968026.5FAEDB86@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Pavel Machek <pavel@ucw.cz>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Tue, Jan 12, 2016 at 02:07:10PM -0200, Henrique de Moraes Holschuh wrote:
> On Mon, Jan 11, 2016, at 19:12, Johannes Stezenbach wrote:
> > 
> > I can confirm this, my x230 has both.  FWIW, BIOS hotkey
> > Fn+Space cycles through off, dim backlight, full backlight
> > and full thinklight. /sys/class/leds/tpacpi::thinklight/brightness
> > can be read (showing either 0 or 255) but writes are ignored.
> > Dito for /proc/acpi/ibm/light.
> 
> We likely need to integrate better (future work) the new backlight
> control with the thinklight control and the firmware interface in the
> x230.
> 
> Is the ACPI AML for fn+space readable enough, or is it trapping directly
> into SMM?  Because if it interacts with the traditional higher-level
> ACPI AML we already use to talk to the thinklight (and now to the
> backlight), it should be relatively easy to fix the driver to better
> support the x230.

I have no clue about ACPI, do you have some hints
how to get the info you want?  I found this:

  sudo acpidump > acpidata.dat
  acpixtract -sSSDT acpidata.dat
  acpixtract -sDSDT acpidata.dat
  iasl -d DSDT.dat SSDT*.dat

  ..and then look at the .dsl files that contain the AML assembler. 

But what to look out for?

PS: failed to mention my x230 kernel was still 4.2.x in case it matters

Thanks,
Johannes
