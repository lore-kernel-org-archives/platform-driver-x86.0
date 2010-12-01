From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Looking for some pointers on WMI/EC access
Date: Wed, 1 Dec 2010 01:31:25 +0000
Message-ID: <20101201013125.GA21225@srcf.ucam.org>
References: <AANLkTimfj1QEqXWOp-Rc2KJZ6XdstkB_ct+P0zuQxVCa@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54287 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753464Ab0LABba (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Nov 2010 20:31:30 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTimfj1QEqXWOp-Rc2KJZ6XdstkB_ct+P0zuQxVCa@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Javier S. Pedro" <maemo@javispedro.com>
Cc: platform-driver-x86@vger.kernel.org, floe@butterbrot.org

On Wed, Dec 01, 2010 at 01:16:15AM +0100, Javier S. Pedro wrote:
> (Rescuing old discussion about some IdeaPad S10-3t firmware weirdness,
> where the front keys fire an EC event that is quietly consumed by
> DSDT)
> 
> Florian Echtler (Thu, 22 Apr 2010 10:21:28 +0200):
> > So it would be all joy and happiness if it weren't for the fact that
> > ERQ0 is initialized to zero and is never changed anywhere else..
> 
> Just realized that a few lines below ERQ0 some bit fields are defined
> (AP[0-7]) that are actually on the same address as the ERQ0 byte. This
> makes
> a lot of sense as AP[0-7] are written by WSIO (aka what wmi_set_block
> calls here).
> 
> Just tried setting a random bit of AP* and events started flowing in. Thank you!

Excellent! Send a driver and I'll get it merged.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
