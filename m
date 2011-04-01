From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [Meego-kernel] [PATCH] platform-x86: intel_mid_thermal: Fix
 coding style
Date: Fri, 1 Apr 2011 16:53:30 +0100
Message-ID: <20110401155330.GA24654@srcf.ucam.org>
References: <1301666051-27021-1-git-send-email-ameya.palande@nokia.com>
 <4D95F3BE.2010601@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:46238 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754561Ab1DAPxl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Apr 2011 11:53:41 -0400
Content-Disposition: inline
In-Reply-To: <4D95F3BE.2010601@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: Ameya Palande <ameya.palande@nokia.com>, platform-driver-x86@vger.kernel.org, meego-kernel@lists.meego.com, durgadoss.r@intel.com

On Fri, Apr 01, 2011 at 08:48:14AM -0700, Arjan van de Ven wrote:
> On 4/1/2011 6:54 AM, Ameya Palande wrote:
> >Before fixing checkpatch.pl reported 74 errors and 234 warnings
> >
> >Signed-off-by: Ameya Palande<ameya.palande@nokia.com>
> >---
> >  drivers/platform/x86/intel_mid_thermal.c |  606 +++++++++++++++---------------
> >  1 files changed, 300 insertions(+), 306 deletions(-)
> >
> 
> 
> where is this? this thing does not seem to be in mainline or the
> meego kernel...
> (but you put both meego and upstream on the mail)

It's in mainline.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
