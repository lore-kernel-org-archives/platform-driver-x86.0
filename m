From: Mattia Dongili <malattia@linux.it>
Subject: Re: On a sony VAIO Z12C5E: sony-laptop: Unknown event: 0x100 0xa6,
 etc.
Date: Thu, 25 Nov 2010 07:30:58 +0900
Message-ID: <20101124223058.GA30035@kamineko.org>
References: <AANLkTi=kq35KAs0Wy=6PY7tZVAOaGRMH_KnSv+NC5NqC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:52660
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754641Ab0KXWkp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Nov 2010 17:40:45 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTi=kq35KAs0Wy=6PY7tZVAOaGRMH_KnSv+NC5NqC@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gyorgy Jeney <nog.lkml@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthew Garrett <mjg@redhat.com>

On Wed, Nov 24, 2010 at 07:22:55PM +0100, Gyorgy Jeney wrote:
> Hello,
> 
> On a Sony VAIO Z12C9E, I get some messages from the kernel when
> certain buttons are pressed:
> 
> "Assist" pressed: sony-laptop: Unknown event: 0x100 0xa6
> "Assist" released: sony-laptop: Unknown event: 0x100 0x26
> "VAIO" pressed: sony-laptop: Unknown event: 0x100 0xa5
> "VAIO" released: sony-laptop: Unknown event: 0x100 0x25

I wonder what keycodes we should associate these to... Maybe KEY_HELP
and KEY_SETUP?

> CDROM eject key pressed: sony-laptop: Unknown event: 0x100 0xa4
> CDROM eject key released: sony-laptop: Unknown event: 0x100 0x24
> 
> What bothers me about this is I get a bunch of messages on my console
> each time the DVD tray is opened, but I guess it shouldn't be hard to

Humm, do you mean that you get that 0xa4 event when pressing the button
_on_ the CD tray or is there an extra button somewhere that triggers
that?

> make these events "do the right thing".

yes, it's easy with the information you provided.
The attached patch should get the keys reported on the input subsystem
and show up on the event device (check with evtest) and X (check with
xev).

One last thing, to keep my DSDT list up-to-date would you mind sending
me the dump of your laptop's DSDT table?

commit fa7eab94364436a567e20792c678bc72b334a3e0
Author: Mattia Dongili <malattia@linux.it>
Date:   Thu Nov 25 07:13:21 2010 +0900

    sony-laptop: support additional hotkeys on the Z series
    
    These new events were still unmapped in sony-laptop, add them and map them to
    KEY_HELP, KEY_SETUP and KEY_EJECT respectively.
    
    "Assist" pressed: sony-laptop: Unknown event: 0x100 0xa6
    "Assist" released: sony-laptop: Unknown event: 0x100 0x26
    "VAIO" pressed: sony-laptop: Unknown event: 0x100 0xa5
    "VAIO" released: sony-laptop: Unknown event: 0x100 0x25
    CDROM eject key pressed: sony-laptop: Unknown event: 0x100 0xa4
    CDROM eject key released: sony-laptop: Unknown event: 0x100 0x24
    
    Reported-by: Gyorgy Jeney <nog.lkml@gmail.com>
    Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
    Cc: Matthew Garrett <mjg@redhat.com>
    Signed-off-by: Mattia Dongili <malattia@linux.it>

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 8eecf81..ce9b901 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -906,6 +906,12 @@ static struct sony_nc_event sony_100_events[] = {
 	{ 0x1f, SONYPI_EVENT_ANYBUTTON_RELEASED },
 	{ 0xa1, SONYPI_EVENT_MEDIA_PRESSED },
 	{ 0x21, SONYPI_EVENT_ANYBUTTON_RELEASED },
+	{ 0xa4, SONYPI_EVENT_CD_EJECT_PRESSED },
+	{ 0x24, SONYPI_EVENT_ANYBUTTON_RELEASED },
+	{ 0xa5, SONYPI_EVENT_SETTINGKEY_PRESSED },
+	{ 0x25, SONYPI_EVENT_ANYBUTTON_RELEASED },
+	{ 0xa6, SONYPI_EVENT_HELP_PRESSED },
+	{ 0x26, SONYPI_EVENT_ANYBUTTON_RELEASED },
 	{ 0, 0 },
 };
 
-- 
mattia
:wq!
