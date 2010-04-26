From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] IPC driver for Intel Mobile Internet Device (MID)
	platforms
Date: Mon, 26 Apr 2010 18:06:16 +0100
Message-ID: <20100426170616.GA12769@srcf.ucam.org>
References: <20100423143037.6744.87450.stgit@localhost.localdomain> <20100426150934.GA9422@srcf.ucam.org> <20100426155534.6dcaca0c@linux.intel.com> <20100426154300.GA10782@srcf.ucam.org> <20100426163958.2b5f16b7@linux.intel.com> <20100426162202.GA11755@srcf.ucam.org> <20100426172800.5405f352@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:49411 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751125Ab0DZRGX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Apr 2010 13:06:23 -0400
Content-Disposition: inline
In-Reply-To: <20100426172800.5405f352@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org, sreedhara.ds@intel.com, mingo@elte.hu

On Mon, Apr 26, 2010 at 05:28:00PM +0100, Alan Cox wrote:
> > I'm really not terribly comfortable merging enabling code for an 
> > architecture if there's no clear plan for merging critical parts of
> > that architecture.
> 
> I'm not interested in playing graphics driver politics. If I could do
> something short term about the graphics situation I would. Furthermore
> there isn't anything I can do about it (even if it does involve its
> own *clean* mode setting to keep KeithP from exploding) until the
> core merges are done.

It's been pointed out to me that there are non-graphical targets for 
this platform as well, so in that case there's no real argument on my 
side. I'll queue this for .35.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
