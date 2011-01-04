From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 2.6.35] sony-laptop.c: Adding buttons for Sony Vaio P
Date: Wed, 5 Jan 2011 07:13:35 +0900
Message-ID: <20110104221335.GA20562@kamineko.org>
References: <20110104154024.1DC7C3E65C9@picard.linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:56329
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751010Ab1ADWNi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 4 Jan 2011 17:13:38 -0500
Content-Disposition: inline
In-Reply-To: <20110104154024.1DC7C3E65C9@picard.linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stephan Mueller <smueller@chronox.de>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org

On Tue, Jan 04, 2011 at 04:40:02PM +0100, Stephan Mueller wrote:
> Hi,
> 
> The following patch covers two special buttons on Sony Vaio VPCP111KX.

Hi!

> It maps a button labeled "ASSIST" to the help key.
> 
> Then it maps a button which is used as a zoom key in Win (switch between 
> screen resolutions). I tried to map that to the zoom key.

the way buttons work in linux is that the kernel emits some kind of
button event and some userspace application (i.e. a desktop manager
like Gnome or KDE) intercept that via Xorg and reacts according to how
they are configured. Any key can do anything, having the ZOOM button
emit the ZOOM keypress helps with defaults settings.

> This is not yet intended to be an official patch, but a question:
> 
> - is the assist key usually mapped to help?

yes.

> - shall the zoom key be mapped to zoom?

yes

> - none of the keys mapped to zoom seem to have any effect on my system - xev 
> does not report the keys when they are pressed - but dmesg does not list 
> omitted keys either - how are the zoom keys supposed to work? 

use /lib/udev/keymap to find out what is being emitted by the kernel
(you should know it actually by looking at the number associated to
SONYPI_EVENT_ZOOM_PRESSED). If the number is >255 you need remapping
that to a lower number, see here for a longer explanation:
http://www.linux.it/~malattia/wiki/index.php/Sony-laptop#Fn_keys_in_X
If the number is <255 it's just your system is not configured to handle
the key.

> --- sony-laptop.c.orig	2010-11-10 21:53:50.000000000 +0100
> +++ sony-laptop.c	2010-11-10 22:52:02.633367015 +0100
> @@ -899,6 +899,10 @@
>  	{ 0x1f, SONYPI_EVENT_ANYBUTTON_RELEASED },
>  	{ 0xa1, SONYPI_EVENT_MEDIA_PRESSED },
>  	{ 0x21, SONYPI_EVENT_ANYBUTTON_RELEASED },
> +	{ 0xa6, SONYPI_EVENT_HELP_PRESSED },
> +	{ 0x1d, SONYPI_EVENT_ANYBUTTON_RELEASED },
> +	{ 0x9d, SONYPI_EVENT_ZOOM_PRESSED },
> +	{ 0x26, SONYPI_EVENT_ANYBUTTON_RELEASED },

So ZOOM sends 0x9d when pressed and 0x1d when released? Could you please
load sony-laptop with debug=1 and send me the output of dmesg after
pressing the ZOOM button?
I already have a pending patch that adds a number of buttons (including
ASSIST), I'll fold yours into it and send it for inclusion.

Thanks
-- 
mattia
:wq!
