From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v6 01/11] intel_sgx: updated MAINTAINERS
Date: Sun, 26 Nov 2017 17:33:52 +0200
Message-ID: <20171126153352.y33zch34nelidm7v@linux.intel.com>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
 <20171125193132.24321-2-jarkko.sakkinen@linux.intel.com>
 <1511641182.2503.14.camel@perches.com>
 <87d145iaop.fsf@miraculix.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:39076 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752209AbdKZPd7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Nov 2017 10:33:59 -0500
Content-Disposition: inline
In-Reply-To: <87d145iaop.fsf@miraculix.mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: Joe Perches <joe@perches.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>

On Sun, Nov 26, 2017 at 11:41:42AM +0100, Bjørn Mork wrote:
> Joe Perches <joe@perches.com> writes:
> > On Sat, 2017-11-25 at 21:29 +0200, Jarkko Sakkinen wrote:
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> > []
> >> @@ -14932,6 +14932,11 @@ L:	linux-mm@kvack.org
> >>  S:	Maintained
> >>  F:	mm/zswap.c
> >>  
> >> +INTEL SGX
> >> +M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> >> +L:	intel-sgx-kernel-dev@lists.01.org
> >> +Q:	https://patchwork.kernel.org/project/intel-sgx/list/
> >
> > Alphabetical order please and this should
> > have at least an "F:" pattern like:
> >
> > F:	drivers/platform/x86/intel_sgx/
> 
> FYI: Darren already requested that when reviewing v5:
> https://www.spinics.net/lists/kernel/msg2651743.html

Joe, Bjørn, thank you for your feedback. I kind of left the MAINTAINERS
update open because I wanted to get feedback who to add as reviewers and
forgot to add "F:". I'll definitely fix this for v7. I'm sorry for
ingoring it for v6.

You might have noticed that v6 was not CC'd to mailing list defined in
"M:". The reason for this is that I've lost the admin password for the
ML so I could not reconfigure it (see tglx's complains for v5). I'll get
this fixed early next week.

/Jarkko
