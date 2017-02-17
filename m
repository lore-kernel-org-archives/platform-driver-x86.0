From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Fri, 17 Feb 2017 08:14:51 +0100
Message-ID: <20170217071451.GA1369@ozzy.nask.waw.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
 <20170210001616.GH1950@marvin.atrad.com.au>
 <CAHp75VeedmO7yyFjfp3VwrqZa6BmE06Xq1oxdugaYn=YEP2Aww@mail.gmail.com>
 <20170217025708.GH6814@wisp>
 <20170217030804.GT30026@marvin.atrad.com.au>
 <20170217035319.GC25241@wisp>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170217035319.GC25241@wisp>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> On Fri, Feb 17, 2017 at 01:38:04PM +1030, Jonathan Woithe wrote:
> > On Thu, Feb 16, 2017 at 06:57:08PM -0800, Darren Hart wrote:
> > > On Fri, Feb 10, 2017 at 02:42:00AM +0200, Andy Shevchenko wrote:
> > > > On Fri, Feb 10, 2017 at 2:16 AM, Jonathan Woithe <jwoithe@just42.net> wrote:
> > > > > On Wed, Feb 08, 2017 at 02:46:23PM +0100, Micha?? K??pie?? wrote:
> > > > 
> > > > > In summary, I see no issues with this patch series which provides a much
> > > > > needed clean up of the code and naming conventions within the fujitsu-laptop
> > > > > driver.  I'm happy for this series (patches 1-10/10) to be applied.
> > > > >
> > > > > Signed-off-by: Jonathan Woithe <jwoithe@just42.net>
> > > > 
> > > > I have noticed people start using SoB for the code they are
> > > > maintaining w/o sending any pull requests.
> > > > It is okay, but there is, as Wolfram pointed, a downside for patchwork
> > > > users. Patchwork is tracking tags (A/R/T) which by a glance allows to
> > > > see what patches are acked/reviewed/tested.
> > > 
> > > Signed-off-by tracks the path the code takes from author to mainline. If you are
> > > not the author or committing it to a tree followed by a pull-request, the
> > > correct tag is "Reviewed-by".
> > 
> > Yes, of course - I clearly had a brain fade back there.  Having said that, 
> > in the past I've used "Acked-by" intead of "Reviewed-by".
> 
> :-)
> 
> > Do you want me to continue to use Acked-by, or should I switch to
> > Reviewed-by?
> 
> These tags do have different meanings, and have come up at Kernel Summit the
> last couple of years. My interpretation of those discussions is:
> 
> Acked-by: I have no objection to this patch, but I didn't really give it a
> thorough review. I trust your judgement. e.g. minor change to your driver to
> support a subsystem API change. These are of very little value.
> 
> Reviewed-by: I have carefully reviewed this patch and would like it to be
> applied. This should usually come with some sort of commentary describing the
> level of review or an area you focused on. This is what we would like to see
> from all of our driver maintainers. These are high value.
> 
> Linus *really* dislikes one line acked by's, and only *slightly* more so than
> one line reviewed by's. :-)

This is really useful information and I think it does not deserve to be
forgotten in a mailing list archive.  If this is indeed the status quo,
Documentation/process/submitting-patches.rst could use some love.  Here
is what it currently says:

> Acked-by: is often used by the maintainer of the affected code when that
> maintainer neither contributed to nor forwarded the patch.

My short experience with the x86 platform driver subsystem is consistent
with that.  The informal rule I inferred from mailing list discussions
is that Acked-by: means the maintainer has reviewed the patch and sees
no objections to it being applied.

Granted, Documentation/process/submitting-patches.rst also states that:

> Acked-by: does not necessarily indicate acknowledgement of the entire patch.
> For example, if a patch affects multiple subsystems and has an Acked-by: from
> one subsystem maintainer then this usually indicates acknowledgement of just
> the part which affects that maintainer's code.  Judgement should be used here.
> When in doubt people should refer to the original discussion in the mailing
> list archives.

And indeed, that is also true, especially for patch series affecting
multiple subsystems.

However, while the meaning of Reviewed-by: is described very thoroughly
in that same document, I cannot recall a single case of a patch series
affecting a single driver that would get a Reviewed-by: _from the
maintainer_.  Let alone a Reviewed-by: with a description of review
depth.  Perhaps I have read too little threads (or the wrong ones) :)

With time, I have also grown to believe that one of the differences
between Acked-by: and Reviewed-by: is that anyone interested can offer
their Reviewed-by: while Acked-by: is reserved for driver maintainers.

Perhaps this is all material for a "falsehoods kernel developers believe
about commit tags"-type article ;)

-- 
Best regards,
Michał Kępień
