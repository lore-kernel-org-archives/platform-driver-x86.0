From: Guenter Roeck <guenter.roeck@ericsson.com>
Subject: Re: [PATCH RESEND] x86,mrst: Intel Medfield over-current detection
 patch
Date: Tue, 8 Feb 2011 08:21:32 -0800
Message-ID: <20110208162132.GB13717@ericsson.com>
References: <20110125143454.10480.5156.stgit@bob.linux.org.uk>
 <20110207195843.GA20970@srcf.ucam.org>
 <20110208104535.71a4bb12@lxorguk.ukuu.org.uk>
 <20110208135228.GA11302@srcf.ucam.org>
 <20110208140800.5001fb0a@lxorguk.ukuu.org.uk>
 <20110208154916.GB13436@ericsson.com>
 <20110208155629.GA14523@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from imr4.ericy.com ([198.24.6.8]:48267 "EHLO imr4.ericy.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755068Ab1BHQVz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Feb 2011 11:21:55 -0500
Content-Disposition: inline
In-Reply-To: <20110208155629.GA14523@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Tue, Feb 08, 2011 at 10:56:29AM -0500, Matthew Garrett wrote:
> On Tue, Feb 08, 2011 at 07:49:16AM -0800, Guenter Roeck wrote:
> 
> > Seems to me there is some hair splitting going on here. Core element of
> > hwmon drivers is that there are reported temperatures, voltages, current,
> > power, humidity, etc. I don't see any of those here. All I see is various
> > current limits. Those are secondary attributes from hwmon perspective.
> > So I don't really see how this can be made a hwmon driver.
> 
> Ok, if the hardware has no mechanism for reporting the instantaneous 
> draw then I can see it not working well in an hwmon sense. But I'd 
> really prefer to see this look far more generic than it does - surely 
> other hardware has similar functionality?
> 
Might well be. Just like thermal subsystem drivers act on thermal information
and registers thermal drivers with the hwmon subsystem for reporting purposes,
it might well be that there could at some point be a "current" subsystem
doing something similar for currents. But that doesn't mean that it would make
sense to provide such functionality from within the hwmon subsystem.

I have no idea if your other question can be answered right now. Maybe a more generic
interface is possible, but one would need to see multiple implementations to determine
what can be generalized. I personally don't believe that it is possible to define
a useful generic interface without knowledge of multiple pieces of HW using that
interface.

If someone volunteers to create a generic API, ABI, and possibly a new subsystem
for current management, that person can go ahead and present that subsystem
to the community for consideration. I am all for it. But it would not be appropriate
to hold this driver hostage to the non-existence of such a subsystem.

Thanks,
Guenter
