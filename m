From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Fri, 9 Jun 2017 10:29:02 +0200
Message-ID: <20170609082902.GR4690@pali>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
 <201705271517.30111@pali>
 <CAHp75VfkudDRNTh9dR=y4G5HD+OaPoxjxVZgw6=9-YpOn4sJSA@mail.gmail.com>
 <201705272248.13257@pali>
 <CAHp75VdmMwEvho-2tRoYz3CGz2QvLr40G6Nf7wQ76LCtxFjT4g@mail.gmail.com>
 <20170608151618.GE32509@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:38046 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751535AbdFII3F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2017 04:29:05 -0400
Content-Disposition: inline
In-Reply-To: <20170608151618.GE32509@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thursday 08 June 2017 08:16:18 Darren Hart wrote:
> On Sat, May 27, 2017 at 11:49:22PM +0300, Andy Shevchenko wrote:
> > On Sat, May 27, 2017 at 11:48 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > > On Saturday 27 May 2017 15:33:14 Andy Shevchenko wrote:
> > >> On Sat, May 27, 2017 at 4:17 PM, Pali Rohár <pali.rohar@gmail.com>
> > >> wrote:
> > 
> > >> Okay, got it. But on your opinion does it make sense to do
> > >>
> > >> pr_info("\tobject_id: %2pE\n", g->object_id);
> > >>
> > >> instead?
> > >>
> > >> For ASCII it will go as is previously, otherwise escaping would be
> > >> done.
> > >
> > > Both is OK for me. Do you want to send a new patch with %2pE?
> > 
> > To me it looks slightly cleaner.
> 
> I don't want to let this one fall through the cracks. Pali, is a new one coming?

So.. which modifier to use? Andy already proposed two alternatives and
basically I'm fine all 3 which are in this thread.

-- 
Pali Rohár
pali.rohar@gmail.com
