From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 2.6.35] sony-laptop.c: Adding buttons for Sony Vaio P
Date: Thu, 6 Jan 2011 00:26:47 +0900
Message-ID: <20110105152612.GA28171@kamineko.org>
References: <20110104154024.1DC7C3E65C9@picard.linux.it>
 <20110104221335.GA20562@kamineko.org>
 <20110105131903.AB5543E65E3@picard.linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:59485
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699Ab1AEP0t (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Jan 2011 10:26:49 -0500
Content-Disposition: inline
In-Reply-To: <20110105131903.AB5543E65E3@picard.linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stephan Mueller <smueller@chronox.de>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org

On Wed, Jan 05, 2011 at 02:18:00PM +0100, Stephan Mueller wrote:
> Am Mittwoch, 5. Januar 2011, um 07:13:35 schrieb Mattia Dongili:
> > On Tue, Jan 04, 2011 at 04:40:02PM +0100, Stephan Mueller wrote:
...
> > > - none of the keys mapped to zoom seem to have any effect on my system -
> > > xev does not report the keys when they are pressed - but dmesg does not
> > > list omitted keys either - how are the zoom keys supposed to work?
> > 
> > use /lib/udev/keymap to find out what is being emitted by the kernel
> > (you should know it actually by looking at the number associated to
> > SONYPI_EVENT_ZOOM_PRESSED). If the number is >255 you need remapping
> > that to a lower number, see here for a longer explanation:
> > http://www.linux.it/~malattia/wiki/index.php/Sony-laptop#Fn_keys_in_X
> > If the number is <255 it's just your system is not configured to handle
> > the key.
> 
> Again, before considering that, I think I should see events in xev. As I do 

not really, sony-laptop emits input events via the input layer, Xorg
reads them with the evdev driver and pushes them over to graphical apps.

> not see them, I am scratching my head where the events are lost.

try /lib/udev/keymap, if that sees the events (with your patch applied)
then Xorg is eating your key presses.

> Note, that issue with the zoom keys apply also to the zoom-in and zoom-out 
> keys that are already present in the driver. None of them end up visible in 
> xev. 

Wait, I'm confused. What zoom keys have you got and what should they do?
do you really have zoom-in, zoom-out and a generic zoom?

Thanks
-- 
mattia
:wq!
