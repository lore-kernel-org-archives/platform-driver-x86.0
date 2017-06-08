From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Thu, 8 Jun 2017 08:16:18 -0700
Message-ID: <20170608151618.GE32509@fury>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
 <201705271517.30111@pali>
 <CAHp75VfkudDRNTh9dR=y4G5HD+OaPoxjxVZgw6=9-YpOn4sJSA@mail.gmail.com>
 <201705272248.13257@pali>
 <CAHp75VdmMwEvho-2tRoYz3CGz2QvLr40G6Nf7wQ76LCtxFjT4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:50871 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751509AbdFHPQU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Jun 2017 11:16:20 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VdmMwEvho-2tRoYz3CGz2QvLr40G6Nf7wQ76LCtxFjT4g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, May 27, 2017 at 11:49:22PM +0300, Andy Shevchenko wrote:
> On Sat, May 27, 2017 at 11:48 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > On Saturday 27 May 2017 15:33:14 Andy Shevchenko wrote:
> >> On Sat, May 27, 2017 at 4:17 PM, Pali Rohár <pali.rohar@gmail.com>
> >> wrote:
> 
> >> Okay, got it. But on your opinion does it make sense to do
> >>
> >> pr_info("\tobject_id: %2pE\n", g->object_id);
> >>
> >> instead?
> >>
> >> For ASCII it will go as is previously, otherwise escaping would be
> >> done.
> >
> > Both is OK for me. Do you want to send a new patch with %2pE?
> 
> To me it looks slightly cleaner.

I don't want to let this one fall through the cracks. Pali, is a new one coming?

-- 
Darren Hart
VMware Open Source Technology Center
