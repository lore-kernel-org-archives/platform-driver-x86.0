From: Jens Taprogge <jens.taprogge@taprogge.org>
Subject: Re: [PATCH] [thinkpad-acpi] Add T410s and T420s LED support
Date: Fri, 23 Mar 2012 21:07:38 +0100
Message-ID: <20120323200738.GA3840@endeavour.taprogge.org>
References: <20120322234934.GA8338@endeavour.taprogge.org>
 <20120323193951.GA24054@khazad-dum.debian.net>
 <20120323194355.GA27877@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from shamrock.taprogge.org ([213.146.117.139]:35202 "EHLO
	shamrock.taprogge.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752579Ab2CWUHr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Mar 2012 16:07:47 -0400
Content-Disposition: inline
In-Reply-To: <20120323194355.GA27877@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, platform-driver-x86@vger.kernel.org

On Fri, Mar 23, 2012 at 07:43:55PM +0000, Matthew Garrett wrote:
> I'm a little unenthusiastic about just pulling this in without working 
> out how userspace is going to consume it. It's a problem we may hit on 
> other devices as well, so we potentially need some sort of consistent 
> naming to indicate that it's a built-in mute LED.

Would a name like "laptop_mute_mic" be more descriptive?  Please note
that with the patch the LED only exposed if
CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is set.  (And so are other like for
example the battery LEDs.)

If possible, I think it would be good to generally handle the LED in
kernel space.  Otherwise, the risk of the LED getting out of sync with
the actually muting is just to big.  I am not sure how that could be
achieved though.  Basically ALSA would have to expose some kind of hook
that thinkpad_acpi (or other users) could connect to.

Best Regards
-Jens
