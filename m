From: Greg KH <greg@kroah.com>
Subject: Re: [stable] Dell Studio 1555 eject key does not work ( small
 patch to fix included )
Date: Thu, 23 Sep 2010 11:43:29 -0700
Message-ID: <20100923184329.GV23040@kroah.com>
References: <AANLkTinG3jv6o8T00mDTEP5uxf4tKqOwSPEDIUcv4kVG@mail.gmail.com>
 <20100906191204.GL2684@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:51321 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756197Ab0IWTSd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Sep 2010 15:18:33 -0400
Content-Disposition: inline
In-Reply-To: <20100906191204.GL2684@bombadil.infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kyle McMartin <kyle@mcmartin.ca>
Cc: Islam Amer <pharon@gmail.com>, stable@kernel.org, akpm@linux-foundation.org, Matthew Garrett <mjg@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Mon, Sep 06, 2010 at 03:12:04PM -0400, Kyle McMartin wrote:
> On Thu, Jun 03, 2010 at 01:14:09AM +0400, Islam Amer wrote:
> > I had submitted this as
> > https://bugzilla.kernel.org/show_bug.cgi?id=16075 but repeating the
> > information and patch
> > here as per Andrew Morton's suggestion.
> > 
> 
> Thanks for sending this fix in, Islam. Adding stable@ to the Cc.
> 
> Greg, could you apply this to the stable tree as well? Should apply a
> few releases back. We applied it to .34 and .35 in Fedora, at least.
> 
> The upstream commit id was d5164dbf1f651d1e955b158fb70a9c844cc91cd1.

Now queued up in the .35-stable tree.

thanks,

greg k-h
