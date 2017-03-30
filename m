From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 1/8] platform/x86: fujitsu-laptop: move backlight input
 device setup to a separate function
Date: Thu, 30 Mar 2017 14:34:06 +1030
Message-ID: <20170330040406.GL19787@marvin.atrad.com.au>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170320093224.18541-2-kernel@kempniu.pl>
 <20170329195415.GC15472@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:57772 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754417AbdC3EEl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Mar 2017 00:04:41 -0400
Content-Disposition: inline
In-Reply-To: <20170329195415.GC15472@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 29, 2017 at 12:54:15PM -0700, Darren Hart wrote:
> On Mon, Mar 20, 2017 at 10:32:17AM +0100, Micha?? K??pie?? wrote:
> > +
> > +	return error;
> 
> This return path could be cleaned up a bit:
> 
> 	error = input_register_device(input);
> 	if (error)
> 		input_free_device(input);
> 
> 	return error;
> 
> But, this driver uses this "error/return 0" pattern pretty consistently, whereas
> most of the kernel uses ret instead of error, and will return ret on success and
> failure, relying on it being 0 in the successful case. Over the whole driver,
> we'd save several lines with the conversion and be more consistent with the rest
> of the kernel. But, local consistency is important too. Jonathan, do you have a
> preference for this driver?

I have no strong preferences, except to say that clarity is important.  As I
eluded to a few minutes ago, I agree that there's scope to address error
handling and there is a case to be made for bringing it into line with the
rest of the kernel.  I think this can be addressed in a separate patch
series though.  The present series under consideration doesn't make the
situation any worse (it actually improves it in some places) and introduces
worthwhile changes.  As such I don't see that we gain anything by delaying
it in order to address what is, at the end of the day, a separate concern.

Regards
  jonathan
