From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/8] fujitsu-laptop: use sparse keymaps for input event
 handling
Date: Thu, 30 Mar 2017 08:41:15 +0200
Message-ID: <20170330064115.GA1068@ozzy.nask.waw.pl>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170324104959.GA31520@marvin.atrad.com.au>
 <20170327235719.GE23486@marvin.atrad.com.au>
 <20170328061618.GA3694@ozzy.nask.waw.pl>
 <20170328230029.GA29146@marvin.atrad.com.au>
 <20170329071926.GA1070@ozzy.nask.waw.pl>
 <CAHp75Ve2ToZW+Mp=HexjzhV82ZS38QkfK2bMxeRwuX3vu1bCsw@mail.gmail.com>
 <20170330033650.GF15472@localhost.localdomain>
 <20170330035626.GK19787@marvin.atrad.com.au>
 <20170330050430.GA3179@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170330050430.GA3179@localhost.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> On Thu, Mar 30, 2017 at 02:26:26PM +1030, Jonathan Woithe wrote:
> > On Wed, Mar 29, 2017 at 08:36:50PM -0700, Darren Hart wrote:
> > > On Wed, Mar 29, 2017 at 07:35:50PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Mar 29, 2017 at 10:19 AM, Micha?? K??pie?? <kernel@kempniu.pl> wrote:
> > > > 
> > > > > Darren, Andy, in light of the above I will be awaiting your review of
> > > > > this series.  I will submit v2 afterwards, with all remarks from both
> > > > > you and Jonathan taken into account.
> > > > 
> > > > Darren marked this series under his name to review, so, I let him to
> > > > speak for us.
> > > 
> > > The series looks good to me. Nice work Micha??. They are logically divided and
> > > address issues in a procedural way (so I stopped commenting until I read the
> > > full series through as a couple of times you addressed a concern from a move in
> > > a cleanup to follow).
> > > 
> > > I've applied the noted change to 7/8 and will run this through my tests, but
> > > don't anticipate any problems. Jonathan, if you don't have any additional
> > > concerns, let me know if I can add your Reviewed-by.
> > 
> > With the noted change to 7/8 applied I'm happy with the resulting series. 
> > As you noted, there is still some scope for making things more consistent,
> > especially with regard to error handling.  However, that is really a
> > separate task which can be addressed in a later series.  This present series
> > doesn't impact on this issue in any significant way so it makes sense that
> > be applied.
> > 
> > Reviewed-by: Jonathan Woithe <jwoithe@just42.net>
> 
> Merged, thanks!

Thanks to everyone involved.  I noted your concerns about error handling
in the driver, rest assured that I share them.  I have a local git
branch with miscellaneous fixes that I plan to submit (as one or more
series) in the future.  I think error handling improvements fall right
into that "miscellaneous" category of fixes.  For the time being I would
rather concentrate on the issues I personally consider more pressing as
I will most likely lose access to modern Fujitsu hardware in about six
weeks and I would really like to be able to test my patches on hardware
on which the code touched by these patches actually runs (LEDs come to
mind, specifically).

-- 
Best regards,
Michał Kępień
