From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/5] Update and move Dell drivers dell_rbu and dcdbas
Date: Wed, 26 Sep 2018 19:55:34 +0300
Message-ID: <CAHp75VfbdTxywsamjM=z-3kC__4_2_6i4LD9nD0yOSJayitS5A@mail.gmail.com>
References: <20180925193418.28493-1-stuart.hayes@dell.com> <CAHp75Ve=ZnkBbdG3Myu1qzubr6+q74Q0u9pR7+nHXG=yAO-0rA@mail.gmail.com>
 <2c21dba5f4074bc0861277ec5701d2ff@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2c21dba5f4074bc0861277ec5701d2ff@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 26, 2018 at 5:50 PM <Mario.Limonciello@dell.com> wrote:
>
> > On Tue, Sep 25, 2018 at 10:34 PM Stuart Hayes <stuart.w.hayes@gmail.com>
> > wrote:
> > >
> > > From: Stuart Hayes <stuart.w.hayes@gmail.com>
> > >
> > > The dell_rbu and dcdbas drivers need some changes, and should be moved to
> > > drivers/platform/x86.  Additionally, dell_rbu needs a maintainer, and the
> > > listed maintainer for dcdbas is inactive and needs to be changed.
> >
> > I pushed this series to my review and testing queue to allow bots play with.
> >
> > But.
> > Please, add commit messages to patches 4 and 5 (I can't take w/o them).
> > Collect Doug's tag that proves he is okay with the change (I remember
> > he answered something to the old thread, though I don't remember the
> > details except annoying footer which should not be up in open source
> > mailing lists).
> >
> > So, while bots are playing with the code I'm waiting for v2 of this
> > with above addressed.
> > Thanks!
> >
>
> Just so it's extra clear, you want an "Acked-by" tag from Doug W in a public
> forum?  Or he should be CC to that patch and needs to give the acked-by
> tag in the V2?
>
> He already did respond in a public forum indicating this although he didn't
> "generate a tag" for that:
> https://www.spinics.net/lists/platform-driver-x86/msg16336.html

Thanks, that is what I need.

> Can Stuart just add the "Acked-by" tag himself to the commit in V2 at this
> point considering that?

Yes.

>  Or do you need patchwork to pick it up and apply it?

No need. Manual update would work to me.

-- 
With Best Regards,
Andy Shevchenko
