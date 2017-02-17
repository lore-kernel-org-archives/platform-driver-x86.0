From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Thu, 16 Feb 2017 19:53:19 -0800
Message-ID: <20170217035319.GC25241@wisp>
References: <20170208134633.5152-1-kernel@kempniu.pl>
 <20170210001616.GH1950@marvin.atrad.com.au>
 <CAHp75VeedmO7yyFjfp3VwrqZa6BmE06Xq1oxdugaYn=YEP2Aww@mail.gmail.com>
 <20170217025708.GH6814@wisp>
 <20170217030804.GT30026@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170217030804.GT30026@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 17, 2017 at 01:38:04PM +1030, Jonathan Woithe wrote:
> On Thu, Feb 16, 2017 at 06:57:08PM -0800, Darren Hart wrote:
> > On Fri, Feb 10, 2017 at 02:42:00AM +0200, Andy Shevchenko wrote:
> > > On Fri, Feb 10, 2017 at 2:16 AM, Jonathan Woithe <jwoithe@just42.net> wrote:
> > > > On Wed, Feb 08, 2017 at 02:46:23PM +0100, Micha?? K??pie?? wrote:
> > > 
> > > > In summary, I see no issues with this patch series which provides a much
> > > > needed clean up of the code and naming conventions within the fujitsu-laptop
> > > > driver.  I'm happy for this series (patches 1-10/10) to be applied.
> > > >
> > > > Signed-off-by: Jonathan Woithe <jwoithe@just42.net>
> > > 
> > > I have noticed people start using SoB for the code they are
> > > maintaining w/o sending any pull requests.
> > > It is okay, but there is, as Wolfram pointed, a downside for patchwork
> > > users. Patchwork is tracking tags (A/R/T) which by a glance allows to
> > > see what patches are acked/reviewed/tested.
> > 
> > Signed-off-by tracks the path the code takes from author to mainline. If you are
> > not the author or committing it to a tree followed by a pull-request, the
> > correct tag is "Reviewed-by".
> 
> Yes, of course - I clearly had a brain fade back there.  Having said that, 
> in the past I've used "Acked-by" intead of "Reviewed-by".

:-)

> Do you want me to continue to use Acked-by, or should I switch to
> Reviewed-by?

These tags do have different meanings, and have come up at Kernel Summit the
last couple of years. My interpretation of those discussions is:

Acked-by: I have no objection to this patch, but I didn't really give it a
thorough review. I trust your judgement. e.g. minor change to your driver to
support a subsystem API change. These are of very little value.

Reviewed-by: I have carefully reviewed this patch and would like it to be
applied. This should usually come with some sort of commentary describing the
level of review or an area you focused on. This is what we would like to see
from all of our driver maintainers. These are high value.

Linus *really* dislikes one line acked by's, and only *slightly* more so than
one line reviewed by's. :-)

Thanks!

-- 
Darren Hart
Intel Open Source Technology Center
