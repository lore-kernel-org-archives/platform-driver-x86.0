From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: intel-vbtn: Simplify autorelease logic
Date: Mon, 11 Dec 2017 16:31:26 -0800
Message-ID: <20171212003126.GD27831@fury>
References: <eb2e1de12dad4c11454b009075f916c63de8a2a6.1512774279.git.dvhart@infradead.org>
 <3452614.9kDG2CtB8P@pebbles>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:51183 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751379AbdLLAb3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Dec 2017 19:31:29 -0500
Content-Disposition: inline
In-Reply-To: <3452614.9kDG2CtB8P@pebbles>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens@rwth-aachen.de>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, AceLan Kao <acelan.kao@canonical.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Mon, Dec 11, 2017 at 02:48:23AM +0100, Stefan Brüns wrote:
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
> > 
> >  drivers/platform/x86/intel-vbtn.c | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> Reviewed-by: Stefan Brüns <stefan.bruens@rwth-aachen.de>
> Tested-by: Stefan Brüns <stefan.bruens@rwth-aachen.de>

Appreciate you taking the time to review and test, thank you!

-- 
Darren Hart
VMware Open Source Technology Center
