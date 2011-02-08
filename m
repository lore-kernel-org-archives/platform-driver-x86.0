From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH RESEND] x86,mrst: Intel Medfield over-current detection
	patch
Date: Tue, 8 Feb 2011 15:56:29 +0000
Message-ID: <20110208155629.GA14523@srcf.ucam.org>
References: <20110125143454.10480.5156.stgit@bob.linux.org.uk> <20110207195843.GA20970@srcf.ucam.org> <20110208104535.71a4bb12@lxorguk.ukuu.org.uk> <20110208135228.GA11302@srcf.ucam.org> <20110208140800.5001fb0a@lxorguk.ukuu.org.uk> <20110208154916.GB13436@ericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:41895 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752519Ab1BHP4g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Feb 2011 10:56:36 -0500
Content-Disposition: inline
In-Reply-To: <20110208154916.GB13436@ericsson.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Guenter Roeck <guenter.roeck@ericsson.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Tue, Feb 08, 2011 at 07:49:16AM -0800, Guenter Roeck wrote:

> Seems to me there is some hair splitting going on here. Core element of
> hwmon drivers is that there are reported temperatures, voltages, current,
> power, humidity, etc. I don't see any of those here. All I see is various
> current limits. Those are secondary attributes from hwmon perspective.
> So I don't really see how this can be made a hwmon driver.

Ok, if the hardware has no mechanism for reporting the instantaneous 
draw then I can see it not working well in an hwmon sense. But I'd 
really prefer to see this look far more generic than it does - surely 
other hardware has similar functionality?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
