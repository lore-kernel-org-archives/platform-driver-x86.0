From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] IPC driver for Intel Mobile Internet Device (MID)
	platforms
Date: Mon, 26 Apr 2010 17:22:02 +0100
Message-ID: <20100426162202.GA11755@srcf.ucam.org>
References: <20100423143037.6744.87450.stgit@localhost.localdomain> <20100426150934.GA9422@srcf.ucam.org> <20100426155534.6dcaca0c@linux.intel.com> <20100426154300.GA10782@srcf.ucam.org> <20100426163958.2b5f16b7@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:49553 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751914Ab0DZQWJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Apr 2010 12:22:09 -0400
Content-Disposition: inline
In-Reply-To: <20100426163958.2b5f16b7@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org, sreedhara.ds@intel.com, mingo@elte.hu

On Mon, Apr 26, 2010 at 04:39:58PM +0100, Alan Cox wrote:
> > The case I'm worried about is where the graphics driver never gets
> > into a mergable state and we end up with a pile of mainline code that
> > can't sanely run on the hardware. As long as the plan is to get it to
> > avoid duplicating the entire Intel modesetting code and including its
> > own TTM then that seems fair enough, but Intel's track record on this
> > side of things hasn't been great.
> 
> I don't track the public DRM lists but the last I saw on that on the
> archives was Keith Packard blocking patches to enable such a merge.
> You'd have to ask him about it. On the acceleration side mrst/psb
> graphics are not i9xx style.

I'm really not terribly comfortable merging enabling code for an 
architecture if there's no clear plan for merging critical parts of that 
architecture.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
