From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1 0/9] platform/x86: hp-wmi: Driver refactoring and
 cleanups
Date: Thu, 20 Apr 2017 13:19:43 -0700
Message-ID: <20170420201943.GA3209@fury>
References: <cover.1492654448.git.dvhart@infradead.org>
 <CAHp75VfrOxBA6hbEds-dQaAtGcMaRhNo=tSZT+gnMeAASEasmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:49148 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033124AbdDTUTq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Apr 2017 16:19:46 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VfrOxBA6hbEds-dQaAtGcMaRhNo=tSZT+gnMeAASEasmA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlo Caione <carlo@caione.org>

On Thu, Apr 20, 2017 at 10:38:56AM +0300, Andy Shevchenko wrote:
> On Thu, Apr 20, 2017 at 5:25 AM, Darren Hart <dvhart@infradead.org> wrote:
> > From: "Darren Hart (VMware)" <dvhart@infradead.org>
> >
> > This series factors out some redundant code, cleans up a number of style issues,
> > modernizes the sysfs usage, and cleans up the return paths. All told, the driver
> > is reduced in size by 37 lines (3.6%).
> >
> > I do not have an HP laptop, so I'm hoping Carlo can help out with some testing.
> > In particular we need to verify that hotkeys and sysfs continue to work as
> > before.
> >
> 
> Series looks good to me except patch 2. So,
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> with above exception.

I was on the fence with this one, which is why I separated it out. I'll drop it.
Thanks for the review.

-- 
Darren Hart
VMware Open Source Technology Center
