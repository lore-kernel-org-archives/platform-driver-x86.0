From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] [thinkpad-acpi] Add T410s and T420s LED support
Date: Fri, 23 Mar 2012 20:38:07 -0300
Message-ID: <20120323233807.GA12072@khazad-dum.debian.net>
References: <20120322234934.GA8338@endeavour.taprogge.org>
 <20120323193951.GA24054@khazad-dum.debian.net>
 <20120323194355.GA27877@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59004 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756280Ab2CWXiR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Mar 2012 19:38:17 -0400
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1795220BD3
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Mar 2012 19:38:17 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20120323194355.GA27877@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Jens Taprogge <jens.taprogge@taprogge.org>, platform-driver-x86@vger.kernel.org

On Fri, 23 Mar 2012, Matthew Garrett wrote:
> I'm a little unenthusiastic about just pulling this in without working 
> out how userspace is going to consume it. It's a problem we may hit on 
> other devices as well, so we potentially need some sort of consistent 
> naming to indicate that it's a built-in mute LED.

Hmm, I am not enthusiastic about exposing MIC leds for userspace to screw up
at all.  I'd rather expose an alsa mixer control that lets one mute/unmute
the platform MIC, and have the kernel (if the platform doesn't do it
already) enforce the LED to always be in the correct state.

In my book, MICs getting enabled "stealthly" is something to be avoided on
the design.

However, I am not sure this platform interface exists on thinkpads (I do
think there is something, though.  Tracking the HKEY event on several DSDTs
and looking at what it touches in the EC, plus some experiments should be
able to give us a better picture).

Exposing the LED for anyone who wants to play with it looked like a good
compromise for the time being.  Since it is not considered a "safe" led, it
is not something that will be made generally available (requires a kconfig
option to be set, which distros are not supposed to enable).

I don't have anything against using a standard name, if such a thing exists
though.  But it would make a LOT more sense to have alsa provide a
standard-named *trigger* that could be hooked to any LED and follows the MIC
mute state of a mixer...

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
