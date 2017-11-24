From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v5 01/11] intel_sgx: updated MAINTAINERS
Date: Fri, 24 Nov 2017 21:18:15 +0200
Message-ID: <20171124191815.77bbcf6vvhpzd6rg@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
 <20171113194528.28557-2-jarkko.sakkinen@linux.intel.com>
 <20171117215422.GD25974@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:31731 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751024AbdKXTSS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Nov 2017 14:18:18 -0500
Content-Disposition: inline
In-Reply-To: <20171117215422.GD25974@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 17, 2017 at 01:54:22PM -0800, Darren Hart wrote:
> On Mon, Nov 13, 2017 at 09:45:18PM +0200, Jarkko Sakkinen wrote:
> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > ---
> >  MAINTAINERS | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2d3d750b19c0..30a4b7f97a93 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14932,6 +14932,11 @@ L:	linux-mm@kvack.org
> >  S:	Maintained
> >  F:	mm/zswap.c
> >  
> > +INTEL SGX
> > +M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> 
> It is clear from the review thus far that this is going to need
> additional entries here. Likely from the x86 folks at the very least. If
> not maintainers then at least reviewers (R:).

Point taken. I think I can cope with maintaining SGX tree once it is in
the mainline but additional R-entries would make sense. Who do you
suggest? I'm thinking of Dave Hansen at least.

/Jarkko
