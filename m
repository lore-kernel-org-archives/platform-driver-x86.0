From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] Vibrator Driver for Intel MID Platforms
Date: Tue, 1 Jun 2010 13:35:13 +0100
Message-ID: <20100601133513.118825bb@linux.intel.com>
References: <20100601115558.23256.16674.stgit@localhost.localdomain>
	<20100601130643.GA6849@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga12.intel.com ([143.182.124.36]:8766 "EHLO
	azsmga102.ch.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756301Ab0FANVZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 Jun 2010 09:21:25 -0400
In-Reply-To: <20100601130643.GA6849@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

> approaches to vibrator control - sysfs with a "speed" attribute, an 
> input device using the force feedback ioctls or something that's
> plumbed through the sound codec. While the absence of any consistency
> here is obviously a problem, I'd prefer not to add a fourth - can you

I'll have a look - I hadn't seen one using the force feedback but that
makes an awful lot of sense.

> > + *	If the PMIC hasn't been discovered or one is not found
> > then
> > + *	the calls will error for us.
> 
> Can't you do this at probe time?

We have to check for errors anyway. We could also check at probe time
but that would add ordering issues or mean we needed the scu_ipc driver
to create the platform device for the vibrator - which given it's not
current discoverable is a bit ugly.


> > +		if (intel_scu_ipc_iowrite8(0x49, 0xAD))
> > +			return -EINVAL;
> > +	} else  {
> > +		if (intel_scu_ipc_iowrite8(0x49, 0x14))
> > +			return -EINVAL;
> 
> Is there any significance to 0xAD and 0x14? Is this register specific
> to the vibrator?

As I understand it yes.
