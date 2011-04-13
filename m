From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Commit 7751ab8e600f26e10c2ba12a92d48a4852a51da8
Date: Wed, 13 Apr 2011 17:53:44 +0100
Message-ID: <20110413165344.GA739@srcf.ucam.org>
References: <4D9B4094.4010609@absence.it>
 <20110412152009.GA32032@srcf.ucam.org>
 <4DA5D45A.9070901@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:52814 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757069Ab1DMQx4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 Apr 2011 12:53:56 -0400
Content-Disposition: inline
In-Reply-To: <4DA5D45A.9070901@absence.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Chiappero <marco@absence.it>
Cc: platform-driver-x86@vger.kernel.org, Javier Achirica <achirica@gmail.com>, Mattia Dongili <malattia@linux.it>

On Wed, Apr 13, 2011 at 06:50:34PM +0200, Marco Chiappero wrote:

> I agree. The DSDT of any ALS equipped Vaio provides us 9 backlight
> levels (that are LCD/model specific), so the first and the last ones
> define our useful operating range, which is always different from
> 0-255 (eg. 13-255 for the Vaio S, 52-255 for the Vaio F, 7-182 for
> the Vaio Z, 7-213 for the Vaio TT and so on). However the code to
> retrieve and use those lower and upper bounds is still lacking
> upstream (I, Javier Achirica and many other people are testing a
> heavily modified sony-laptop.c written by us which includes lots of
> features that we might include soon, but there is no patchset yet).
> Moreover it is questionable whether to expose this "wire-range"/fine
> grain backlight device, which is intended to be used for an ambient
> light based regulation (that requires smooth transitions and
> sometimes minimal changes), while for normal backlight operations
> the 9 levels already mentioned should suffice.

Can this code be merged within the next week? If not I agree that it'd 
be better to drop this patch for now. I think exposing the full range of 
(usable) brightness values makes sense, since ALS policy is likely to be 
determined in userspace - we'll need some way to expose the appropriate 
mapping, but that's something that needs to be handled generically in 
the long run.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
