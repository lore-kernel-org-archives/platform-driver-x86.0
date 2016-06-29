From: Darren Hart <dvhart@infradead.org>
Subject: Re: Whitespace cleanup proposal for fujitsu-laptop (was: Re: [PATCH]
 fujitsu-laptop: Add support for eco LED)
Date: Tue, 28 Jun 2016 22:14:11 -0700
Message-ID: <20160629051411.GL3837@f23x64.localdomain>
References: <20160628233211.GA30332@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45227 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751328AbcF2FON (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 01:14:13 -0400
Content-Disposition: inline
In-Reply-To: <20160628233211.GA30332@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Jun 29, 2016 at 09:02:11AM +0930, Jonathan Woithe wrote:
> Hi Darren
> 
> In the "Add support for eco LED" thread you noted:
> 
> > I was going to point out the checkpatch failures in codingstyle, but you
> > were probably as consistent as you could be given the state of this driver
> > and it's rather inconsistent use of whitespace.
> 
> It is true that there is inconsistency in this regard within this driver,
> which has come about for various historical reasons.  Would you take a pure
> whitespace cleanup patch if I were to go through the driver and fix these
> issues as best they can be?

Yes, I'm happy to take those. I know some maintainers prefer not to take
non-functional changes as they make git blame less immediately useful (for
example), but I prefer for existing code to be compliant with CodingStyle, or it
tends to spread through new patches such as this one for the sake of internal
consistency.

So yes, I'd gladly take a whitespace cleanup patch. Thanks for offering.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
