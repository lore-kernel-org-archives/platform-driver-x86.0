From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch 1/2] thinkpad_acpi: signedness bugs getting current_mode
Date: Wed, 18 Mar 2015 20:42:03 -0700
Message-ID: <20150319034203.GA22993@fury.dvhart.com>
References: <20150311093450.GA3564@mwanda>
 <20150314210612.GA26465@fury.dvhart.com>
 <20150315134612.46ca70c5@canb.auug.org.au>
 <20150315134813.1b0a5685@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48297 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753819AbbCSDmT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 18 Mar 2015 23:42:19 -0400
Content-Disposition: inline
In-Reply-To: <20150315134813.1b0a5685@canb.auug.org.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Bastien Nocera <hadess@hadess.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org, Rafael Wysocki <rjw@rjwysocki.net>, "H. Peter Anvin" <hpa@zytor.com>

On Sun, Mar 15, 2015 at 01:48:13PM +1100, Stephen Rothwell wrote:
> Hi Darren,
> 
> On Sun, 15 Mar 2015 13:46:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > The people you will inconvenience more by rebasing are the developers
> > who write patches that are based on your tree.  If you rebase under
> > them, they may have to rebase and fix up the patches they have already
> > tested and had reviewed before they can then submit them to you
> > (hopefully before you rebase again).
> 
> This, of course, only applied to published trees (which includes
> anything in linux-next) - what you do in your own (logically private)
> development tree is your own business.

Thanks for the guidance Stephen. Unless a more compelling argument comes up,
I'll stick to this going forward.


-- 
Darren Hart
Intel Open Source Technology Center
