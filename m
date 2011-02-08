From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH RESEND] x86,mrst: Intel Medfield over-current detection
 patch
Date: Tue, 8 Feb 2011 16:09:29 +0000
Message-ID: <20110208160929.4b410495@lxorguk.ukuu.org.uk>
References: <20110125143454.10480.5156.stgit@bob.linux.org.uk>
	<20110207195843.GA20970@srcf.ucam.org>
	<20110208104535.71a4bb12@lxorguk.ukuu.org.uk>
	<20110208135228.GA11302@srcf.ucam.org>
	<20110208140800.5001fb0a@lxorguk.ukuu.org.uk>
	<20110208154916.GB13436@ericsson.com>
	<20110208155629.GA14523@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:39863 "EHLO
	localhost.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754929Ab1BHQGV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Feb 2011 11:06:21 -0500
In-Reply-To: <20110208155629.GA14523@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Guenter Roeck <guenter.roeck@ericsson.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

> Ok, if the hardware has no mechanism for reporting the instantaneous 
> draw then I can see it not working well in an hwmon sense. But I'd 
> really prefer to see this look far more generic than it does - surely 
> other hardware has similar functionality?

I've not seen any - not anything genericisable anyway. I guess in theory
you could dramatically extend the regulator API to do power draw
management, bus current monitoring and overcurrent callbacks but I'm not
sure it would make any sense. What you do with such events and how you
manage it is incredibly platform specific.

In the PC world it's not so bad because overcurrent is a fault state -
you whine about it and either shut down or cross fingers and keep going.
In embedded devices it's not that simple and it is actively managed.

I'm open to bright ideas!

Alan
