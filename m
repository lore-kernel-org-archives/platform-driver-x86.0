From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 03/14] platform/x86: dell-wmi: Don't match on
 descriptor GUID modalias
Date: Wed, 27 Sep 2017 10:44:18 -0700
Message-ID: <20170927174418.GK23572@fury>
References: <cover.1506451187.git.mario.limonciello@dell.com>
 <b6153ced6dc75c057429a69f2d8994d784f9768e.1506451187.git.mario.limonciello@dell.com>
 <20170927172150.GH23572@fury>
 <342b1e384a8f4d26b236fe2ac8c25a18@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:50739 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751408AbdI0RoV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 13:44:21 -0400
Content-Disposition: inline
In-Reply-To: <342b1e384a8f4d26b236fe2ac8c25a18@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com

On Wed, Sep 27, 2017 at 05:30:40PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Wednesday, September 27, 2017 1:22 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> > kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> > quasisec@google.com; pali.rohar@gmail.com
> > Subject: Re: [PATCH v2 03/14] platform/x86: dell-wmi: Don't match on descriptor
> > GUID modalias
> > 
> > On Tue, Sep 26, 2017 at 01:50:01PM -0500, Mario Limonciello wrote:
> > > The descriptor GUID is not used to indicate that WMI notifications
> > > in the dell-wmi driver work properly.  As such a modalias should
> > > not be present that causes this driver to load on systems with this
> > > GUID.
> > >
> > > Reviewed-by: Pali Pohar <pali.rohar@gmail.com>
> > > Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> > 
> > I can do this manually, but for future reference:
> > 
> > Nit, in general, the author's sign off should be first, followed by
> > reviewers and testers. The maintainer will add their sign off at the end
> > - this keeps things clear regarding the development and delivery path.
> > In general, assume chronological order and you'll have the right idea.
> > 
> > Informational tags, like Reported, Suggested, Tested, and Fixes can come
> > before the Author sign off, which is consistent with the chronological
> > order.
> > 
> 
> Operationally is there is a flag I'm missing in git-format-patch that does
> this?  git format-patch -s puts my sign off at the very bottom, so this is a
> manual action to re-order if I'm adding in Reviewed-by: in the patch
> description.

Yes, this is a manual step. Git will add your sign off for you, but it doesn't
do it contextually, always at the end. Works for the first writing, after that
you have to manage the tags manually. (or at least that is what I do)

-- 
Darren Hart
VMware Open Source Technology Center
