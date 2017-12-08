From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Simplify autorelease logic
Date: Fri, 8 Dec 2017 15:48:03 -0800
Message-ID: <20171208234803.GC14187@fury>
References: <eb2e1de12dad4c11454b009075f916c63de8a2a6.1512774279.git.dvhart@infradead.org>
 <7546133.vVTS3nG8Ku@pebbles>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:55300 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753562AbdLHXsH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Dec 2017 18:48:07 -0500
Content-Disposition: inline
In-Reply-To: <7546133.vVTS3nG8Ku@pebbles>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens@rwth-aachen.de>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, AceLan Kao <acelan.kao@canonical.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Sat, Dec 09, 2017 at 12:28:18AM +0100, Stefan Brüns wrote:
> On Saturday, December 9, 2017 12:07:08 AM CET Darren Hart (VMware) wrote:
> > The new notify_handler logic determining if autorelease should be used or
> > not is a bit awkward, and can result in more than one call to
> > sparse_keymap_report_event for the same event (scancode). The nesting
> > and long lines also made it difficult to read.
> > 
> > Simplify the logic by eliminating a level of nesting with a goto and
> > always calculate autorelease and val so we can make a single call to
> > sparse_keymap_report_event.
> > 
> > Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> > Cc: Stefan Brüns <stefan.bruens@rwth-aachen.de>
> > Cc: AceLan Kao <acelan.kao@canonical.com>
> > ---
> > Note: This is based on top of Stefan's v2 patch series for intel-vbtn,
> > currently in my review-dvhart branch.
> 
> Hi Darren,
> 
> is this tree publically available?

Yes, in the tree listed in MAINTAINERS:
git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git

which is actually an alias I should now update to:

git://git.infradead.org/linux-platform-drivers-x86.git

Note that the review-* branches exist for CI/CD tooling and will rebase often.
testing, fixes, and for-next are the only branches considered to be "published".

-- 
Darren Hart
VMware Open Source Technology Center
