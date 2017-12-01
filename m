From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Actually use mask parameter in
 hp_wmi_hw_state
Date: Fri, 1 Dec 2017 12:13:00 -0800
Message-ID: <20171201201300.GC18881@fury>
References: <20171128151758.9234-1-michel@daenzer.net>
 <20171128165724.GA16349@fury>
 <e8ff5280-537e-bb60-f0ba-791117abb4a4@daenzer.net>
 <CAHp75VdSiR=X-Dq2dto2osc3UiTid7h=T764cZkNgXEyTpEJcg@mail.gmail.com>
 <f60a192f-c83e-9a27-4d4a-64cecaeb9378@daenzer.net>
 <CAHp75VfniFEi1aKpTuKAbMYKojy9a+bBrBRRTAvLFs9g=dA8iA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfniFEi1aKpTuKAbMYKojy9a+bBrBRRTAvLFs9g=dA8iA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Dec 01, 2017 at 09:52:27PM +0200, Andy Shevchenko wrote:
> On Tue, Nov 28, 2017 at 9:41 PM, Michel Dänzer <michel@daenzer.net> wrote:
> > On 2017-11-28 08:30 PM, Andy Shevchenko wrote:
> >> On Tue, Nov 28, 2017 at 8:06 PM, Michel Dänzer <michel@daenzer.net> wrote:
> >>> On 2017-11-28 05:57 PM, Darren Hart wrote:
> 
> >>>> Merged in 4.15-rc1
> >>>
> >>> AFAIK commits without
> >>>
> >>>  Cc: stable@vger.kernel.org
> >>>
> >>> don't get automatically picked up for stable branches. Can you manually
> >>> nominate 9968e12 for stable?
> >>
> >> AFAIK Greg picks up patches based on Fixes tag as well.
> >> Feel free to ping us or just forward that one yourself if Greg will
> >> not pick up in reasonable (month?) time.
> >
> > Both 4.14.1 and 4.14.2 were released after Linus merged the fix, but
> > neither has it. Given that, and that a fair number of people seem to be
> > running into this, seems like a good idea to do it ASAP.
> 
> JFYI:
> 
> Thu, 30 Nov 2017 14:34:39 +0000 (11/30/2017 04:34:39 PM)
> 
> This is a note to let you know that I've just added the patch titled
> to the 4.14-stable tree which can be found at:
>     http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

Ah well, too little too late on my part I guess.

-- 
Darren Hart
VMware Open Source Technology Center
