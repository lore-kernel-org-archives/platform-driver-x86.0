From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: Delete unused function
 ipc_data_readb()
Date: Thu, 25 May 2017 14:26:34 +0100
Message-ID: <20170525142634.5eb899d6@alans-desktop>
References: <20170523205539.71450-1-mka@chromium.org>
        <20170524143932.11593845@alans-desktop>
        <CAD=FV=WojgDOFZ0AMbe18-B55XtJHbkXiPJyy=KE=ZzLBaci6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from www.llwyncelyn.cymru ([82.70.14.225]:34272 "EHLO fuzix.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965907AbdEYN1D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2017 09:27:03 -0400
In-Reply-To: <CAD=FV=WojgDOFZ0AMbe18-B55XtJHbkXiPJyy=KE=ZzLBaci6g@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Wed, 24 May 2017 08:39:29 -0700
Doug Anderson <dianders@chromium.org> wrote:

> Hi,
> 
> On Wed, May 24, 2017 at 6:39 AM, Alan Cox <gnomes@lxorguk.ukuu.org.uk> wrote:
> > On Tue, 23 May 2017 13:55:39 -0700
> > Matthias Kaehlcke <mka@chromium.org> wrote:
> >  
> >> The function was added by commit 0a8b83530b6f ("intel_pmc_ipc: Add Intel
> >> Apollo Lake PMC IPC driver") in 2015 and hasn't been used since then.
> >> Removing it fixes the following warning when building with clang:
> >>
> >>     drivers/platform/x86/intel_pmc_ipc.c:189:18: error: unused function
> >>         'ipc_data_readb' [-Werror,-Wunused-function]  
> >
> > It is however also part of the API and a consistent sensible function to
> > have present should it be needed. As it's static it's eliminated
> > correctly by gcc.
> >
> > I'm all for eliminating unused functions but in this case I have to wonder  
> 
> If it's a useful function to have present, it seems like adding
> "__maybe_unused" makes sense, as Matthias did in
> <https://patchwork.kernel.org/patch/9732009/>.  Would that work for
> you?
> 

Yep

Alan
