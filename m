From: Mattia Dongili <malattia@linux.it>
Subject: Re: [patch] sony-laptop: fix a couple signedness bugs
Date: Fri, 8 Jun 2012 06:42:02 +0900
Message-ID: <20120607214200.GA10985@kamineko.org>
References: <20120607082221.GA7582@elgon.mountain>
 <4FD078B2.3060909@bfs.de>
 <20120607095959.GB13539@mwanda>
 <4FD07FC1.5030306@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:52644 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757541Ab2FGVmF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jun 2012 17:42:05 -0400
Content-Disposition: inline
In-Reply-To: <4FD07FC1.5030306@bfs.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: walter harms <wharms@bfs.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 07, 2012 at 12:17:37PM +0200, walter harms wrote:
> 
> 
> Am 07.06.2012 11:59, schrieb Dan Carpenter:
> > On Thu, Jun 07, 2012 at 11:47:30AM +0200, walter harms wrote:
> >>
> >>
> >> Am 07.06.2012 10:22, schrieb Dan Carpenter:
> >>> These need to be signed to handle negative error codes.
> >>>
> >>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, I'll take this and the other patch you sent earlier and
submit to Matthew together with other patches I have pending here.
See below for a quick comment.

...
> >> sony_find_snc_handle() should return an int, did something change ?
> > 
> > offset is a u64.  It has to be 64 bit.  I thought about changing it
> > to s64, but decided to just cast it here instead.
> > 
> > regards,
> > dan carpenter
> > 
> 
> If it this function
>  http://lxr.free-electrons.com/source/drivers/platform/x86/sony-laptop.c?a=powerpc#L817
> it just returns an index expected to be <0x10.
> also offset was an int
>  http://lxr.free-electrons.com/source/drivers/platform/x86/sony-laptop.c?a=powerpc#L1563
> 
> it make we wonder why somebody made the change ...

it was changed to call into sony_nc_buffer_call which is a new function
(ebcef1b0e41f2ff972e5c5487a30e8f4ee2b6f13).

...
> >>> -	if (offset < 0)
> >>> +	if ((int)offset < 0)
> >>>  		return;

This check is actually redundant in a way as
sony_nc_backlight_ng_read_limits is only called with a valid handle.
Might as well remove the if statement altogether. sony_nc_rfkill_setup
has similar code without the check for a valid offset.

Thanks
-- 
mattia
:wq!
