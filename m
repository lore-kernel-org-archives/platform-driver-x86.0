From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] Keyboard backlight control for some Vaio Fit models
Date: Wed, 16 Dec 2015 07:04:26 -0800
Message-ID: <20151216150425.GA14156@taihen.jp>
References: <1450156352-16240-1-git-send-email-malattia@linux.it>
 <20151215180128.GQ11972@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:35760 "EHLO
	mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751195AbbLPPM1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Dec 2015 10:12:27 -0500
Received: by mail-pf0-f171.google.com with SMTP id v86so13445207pfa.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Dec 2015 07:12:27 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151215180128.GQ11972@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Dominik Matta <dominik@matta.sk>

On Tue, Dec 15, 2015 at 10:01:28AM -0800, Darren Hart wrote:
> On Mon, Dec 14, 2015 at 09:12:32PM -0800, Mattia Dongili wrote:
> > SVF1521P6EW, SVF1521DCXW, SVF13N1L2ES and likely most SVF*.
> > do not expose separate timeout controls in auto mode.
> > 
> > Signed-off-by: Dominik Matta <dominik@matta.sk>
> > Signed-off-by: Mattia Dongili <malattia@linux.it>
> > ---
> >  drivers/platform/x86/sony-laptop.c | 65 ++++++++++++++++++++++++++------------
> >  1 file changed, 45 insertions(+), 20 deletions(-)
> > 
> 
> Thanks Mattia,
> 
> The changes look fine.
> 
> At some point we should address some of the style inconsistencies with this
> driver, but to nitpic on them for this patch wouldn't be productive. I've merged
> this patch - please consider the following for future work with the goal toward
> making the kernel code as consistent as possible to aid in legibility and
> maintainability.

Thanks Darren.

This driver needs many things, but yes, I'll keep in mind
these other guidelines for any future change.

Best,
-- 
mattia
:wq!
