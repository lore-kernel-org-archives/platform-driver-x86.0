From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: support synaptics touchpad led
Date: Thu, 2 Jun 2011 03:23:07 +0100
Message-ID: <20110602022307.GA21657@srcf.ucam.org>
References: <1306917288-8531-1-git-send-email-acelan.kao@canonical.com>
 <20110601133155.GA5215@srcf.ucam.org>
 <BANLkTi=LByUkAL6WKCMYtY2dDJ8xi0xk7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:49981 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758966Ab1FBCXK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jun 2011 22:23:10 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTi=LByUkAL6WKCMYtY2dDJ8xi0xk7g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Jun 02, 2011 at 09:30:56AM +0800, AceLan Kao wrote:
> Mattew,
> 
> Dell tells us that they will use the same touchpad chip for their products,
> with the same touchpad LED layout, so I place the code in the dell-laptop.

Forever? I don't believe it's possible for Dell to guarantee that. The 
command sequenece is sent to the touchpad, so it needs to go in the 
touchpad driver.

> And F22 already map to enable/disable touchpad in X, BIOS and synaptics driver
> do nothing for this event, and my code only turns on/off the touchpad LED,
> not enable/disable the touchpad.

If this were to be done in kernel then it should be via a notifier chain 
to the touchpad driver, but I suspect that you'd still get pushback on 
that. It's better to leave this kind of thing to userland.

> BIOS should manage this kind of action to enable/disable touchpad and 
> the LED, but Dell doesn't want to modify their BIOS to do that, since 
> the touchpad driver of MS Windows manages to enable/disable touchpad 
> and the LED by themselves, so Linux should do the same thing as 
> Windows does.
>
> That's why we need those code and why I think dell-laptop is a good
> place for them.

I'm afraid not. dell-laptop only contains code that speaks to 
dell-specific hardware. It seems likely that this command sequence 
performs LED control via the touchpad rather than via any dell-specific 
mechanism, so the code needs to go in the touchpad driver.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
