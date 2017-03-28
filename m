From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/8] fujitsu-laptop: use sparse keymaps for input event
 handling
Date: Tue, 28 Mar 2017 08:16:18 +0200
Message-ID: <20170328061618.GA3694@ozzy.nask.waw.pl>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170324104959.GA31520@marvin.atrad.com.au>
 <20170327235719.GE23486@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170327235719.GE23486@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> On Fri, Mar 24, 2017 at 09:19:59PM +1030, Jonathan Woithe wrote:
> > On Mon, Mar 20, 2017 at 10:32:16AM +0100, Micha?? K??pie?? wrote:
> > > This series simplifies handling of both brightness key and hotkey input
> > > events on Fujitsu laptops by making use of sparse keymaps.  This not
> > > only makes the driver shorter and, hopefully, cleaner, but also enables
> > > us to get rid of the keycodeX fields inside struct fujitsu_bl, which
> > > facilitates further cleanups.  Also, to simplify error handling, input
> > > devices registered by fujitsu-laptop are migrated to the devres API
> > > along the way.
> > > 
> > > This series was tested on a Lifebook S7020 and a Lifebook E744.
> > > 
> > > This series depends on the platform cleanup series I posted last week.
> > > While that series has not yet been merged into testing, Jonathan has
> > > reviewed it and Darren also seemed to be okay with it, so I just assumed
> > > it will get merged soon.  I wanted to post this one as soon as possible
> > > as it requires a bit more thorough review and testing compared to the
> > > previous series I posted for fujitsu-laptop.
> > 
> > Thanks for posting this.  I have started going through this and hope to
> > complete my review by the end of this weekend.
> 
> I have completed my initial review of this patch series.  Aside from the
> single recommendation about patch 7/8 (posted separately) it looks good.
> I await your thoughts regarding patch 7/8 so we can finalise and sign off on
> this series.

Thanks for the review, Jonathan.  I agree with your remark regarding the
potentially confusing name of the variable holding the S64x0 keymap.

As in the past, we have at least two options: I can either post v2 of
all eight patches with three characters changed or you can provide your
Reviewed-by for v1, in which case I will kindly ask the maintainers to
run:

    sed -i 's|s6400|s64x0|;' drivers/platform/x86/fujitsu-laptop.c

after applying patch 7/8.  Given that this series does a bit more than
the cleanup series I posted previously, I sense it might be a good idea
to defer submitting v2 until after subsystem maintainers review v1, just
in case they find more issues.  If that happens, I will post v2 to avoid
confusion.  If not, then v1 can be applied with the one-liner above
taken into account (or I can post v2 anyway if that would be preferred
by Darren and Andy).

In other words, I am happy to follow whatever route you and the
subsystem maintainers suggest and I just want to avoid spamming the
mailing list.

-- 
Best regards,
Michał Kępień
