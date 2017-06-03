From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add a comment explaining the
 0xb2 magic number
Date: Sat, 3 Jun 2017 12:15:21 -0700
Message-ID: <20170603191521.GE4854@fury>
References: <e630e25d78e60a4f1c9bf4bdc725f0693d617db2.1495862128.git.dvhart@infradead.org>
 <201705271251.37069@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35867 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbdFCTPW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Jun 2017 15:15:22 -0400
Content-Disposition: inline
In-Reply-To: <201705271251.37069@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>

On Sat, May 27, 2017 at 12:51:36PM +0200, Pali Rohár wrote:
> On Saturday 27 May 2017 07:15:28 Darren Hart wrote:
> > From: Andy Lutomirski <luto@kernel.org>
> > 
> > The hotkey table is 0xb2, add a comment for clarity.
> > 
> > Suggested-by: Darren Hart <dvhart@infradead.org>
> > Signed-off-by: Andy Lutomirski <luto@kernel.org>
> > Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> > Cc: "Pali Rohár" <pali.rohar@gmail.com>
> > Cc: Andy Shevchenko <andy@infradead.org>
> > Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> > ---
> >  drivers/platform/x86/dell-wmi.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/platform/x86/dell-wmi.c
> > b/drivers/platform/x86/dell-wmi.c index 8a64c79..24467b1 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -449,6 +449,7 @@ static void __init handle_dmi_entry(const struct
> > dmi_header *dm, if (results->err || results->keymap)
> >  		return;		/* We already found the hotkey table. */
> > 
> > +	/* The Dell hotkey table is type 0xB2.  Scan until we find it. */
> >  	if (dm->type != 0xb2)
> >  		return;
> 
> Good. Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
> 
> (Maybe in future we should add a #define name for such magic constants)

Thanks for the review.

A define is most useful, in my opinion, when the magic number is required
multiple times, as it avoids human error and avoids maintenance issues when
updated, etc. I'm not necessarily opposed, but I didn't think it was necessary
in this case.

-- 
Darren Hart
VMware Open Source Technology Center
