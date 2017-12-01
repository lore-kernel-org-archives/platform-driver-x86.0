From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Actually use mask parameter in
 hp_wmi_hw_state
Date: Fri, 1 Dec 2017 11:39:29 -0800
Message-ID: <20171201193929.GA18881@fury>
References: <20171128151758.9234-1-michel@daenzer.net>
 <20171128165724.GA16349@fury>
 <e8ff5280-537e-bb60-f0ba-791117abb4a4@daenzer.net>
 <CAHp75VdSiR=X-Dq2dto2osc3UiTid7h=T764cZkNgXEyTpEJcg@mail.gmail.com>
 <f60a192f-c83e-9a27-4d4a-64cecaeb9378@daenzer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f60a192f-c83e-9a27-4d4a-64cecaeb9378@daenzer.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 28, 2017 at 08:41:47PM +0100, Michel Dänzer wrote:
> On 2017-11-28 08:30 PM, Andy Shevchenko wrote:
> > On Tue, Nov 28, 2017 at 8:06 PM, Michel Dänzer <michel@daenzer.net> wrote:
> >> On 2017-11-28 05:57 PM, Darren Hart wrote:
> >>> On Tue, Nov 28, 2017 at 04:17:58PM +0100, Michel Dänzer wrote:
> >>>> We were always checking bit 0 (which represents the docked state)
> >>>> regardless of the mask.
> >>>>
> >>>> Fixes the "tablet mode" state always being reported the same as the
> >>>> docked state, which with current libinput can cause the built-in input
> >>>> devices of laptops to be incorrectly disabled while docked.
> > 
> >>> Merged in 4.15-rc1
> >>
> >> AFAIK commits without
> >>
> >>  Cc: stable@vger.kernel.org
> >>
> >> don't get automatically picked up for stable branches. Can you manually
> >> nominate 9968e12 for stable?
> > 
> > AFAIK Greg picks up patches based on Fixes tag as well.
> > Feel free to ping us or just forward that one yourself if Greg will
> > not pick up in reasonable (month?) time.
> 
> Both 4.14.1 and 4.14.2 were released after Linus merged the fix, but

Based on Documentation/process/stable-kernel-rules.rst, this seems unlikely to
happen automatically.

> neither has it. Given that, and that a fair number of people seem to be
> running into this, seems like a good idea to do it ASAP.

This is our responsibility to check if patches are candidates for stable, and
the Fixes tag should be a trigger for us, the maintainers, to do that check.
Sometimes we miss things, sometimes the dependencies are more than they are
worth. In this case, we just missed it.

You can just send this in yourself using the original fix and following the
process in stable-kernel-rules.rst.

However, that means I need to pay closer attention when Greg's
auto-merge-bot-email lands in my Inbox asking if I object.

I'll send this one to stable myself, thanks for calling our attention to it.

-- 
Darren Hart
VMware Open Source Technology Center
