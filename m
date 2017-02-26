From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Sun, 26 Feb 2017 17:03:13 +0200
Message-ID: <CAHp75Vcevq9AiMN44yVijEVqYXaD8oBEE1HusQk2pStRdMG-cg@mail.gmail.com>
References: <20170208134633.5152-1-kernel@kempniu.pl> <20170210001616.GH1950@marvin.atrad.com.au>
 <CAHp75VeedmO7yyFjfp3VwrqZa6BmE06Xq1oxdugaYn=YEP2Aww@mail.gmail.com>
 <20170217025708.GH6814@wisp> <20170217030804.GT30026@marvin.atrad.com.au>
 <20170217035319.GC25241@wisp> <20170217041756.GW30026@marvin.atrad.com.au>
 <CAHp75Vd1ghHKuh6KJPpuzZjKCuGFfrLsXn8XkRCA+H88J4k+yg@mail.gmail.com> <20170226113006.GA1249@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170226113006.GA1249@kmp-mobile.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Feb 26, 2017 at 1:30 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempn=
iu.pl> wrote:
>> On Fri, Feb 17, 2017 at 6:17 AM, Jonathan Woithe <jwoithe@just42.net> wr=
ote:
>> > On Thu, Feb 16, 2017 at 07:53:19PM -0800, Darren Hart wrote:
>> >> On Fri, Feb 17, 2017 at 01:38:04PM +1030, Jonathan Woithe wrote:
>> >> > Do you want me to continue to use Acked-by, or should I switch to
>> >> > Reviewed-by?
>> >>
>> >> These tags do have different meanings, and have come up at Kernel Sum=
mit the
>> >> last couple of years. My interpretation of those discussions is:
>> >>
>> >> Acked-by: I have no objection to this patch, but I didn't really give=
 it a
>> >> thorough review. I trust your judgement. e.g. minor change to your dr=
iver to
>> >> support a subsystem API change. These are of very little value.
>> >>
>> >> Reviewed-by: I have carefully reviewed this patch and would like it t=
o be
>> >> applied. This should usually come with some sort of commentary descri=
bing the
>> >> level of review or an area you focused on. This is what we would like=
 to see
>> >> from all of our driver maintainers. These are high value.
>> >>
>> >> Linus *really* dislikes one line acked by's, and only *slightly* more=
 so than
>> >> one line reviewed by's. :-)
>> >
>> > Got it, thanks, this is very helpful.
>> >
>> > In light of this I give you the following.
>> >
>> > Reviewed-by: Jonathan Woithe <jwoithe@just42.net>
>>
>> Thanks, applied for testing with above tag.
>
> Andy,
>
> It looks like you missed this part of Jonathan's message:

Indeed.

>
>> As per subsequent discussion we have agreed to drop patch 8/10 from the
>> series: it creates problems on newer hardware and the issue it is addres=
sing
>> will be more completely dealt with in a subsequent patch series.
>
> I see that patch 8/10 was applied to testing as well.  Could you please
> drop that single patch?

Good we have testing branch and thank you for pointing out. Should be fixed=
 now.

--=20
With Best Regards,
Andy Shevchenko
