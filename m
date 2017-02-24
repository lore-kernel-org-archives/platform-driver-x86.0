From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Fri, 24 Feb 2017 22:34:43 +0200
Message-ID: <CAHp75Vd1ghHKuh6KJPpuzZjKCuGFfrLsXn8XkRCA+H88J4k+yg@mail.gmail.com>
References: <20170208134633.5152-1-kernel@kempniu.pl> <20170210001616.GH1950@marvin.atrad.com.au>
 <CAHp75VeedmO7yyFjfp3VwrqZa6BmE06Xq1oxdugaYn=YEP2Aww@mail.gmail.com>
 <20170217025708.GH6814@wisp> <20170217030804.GT30026@marvin.atrad.com.au>
 <20170217035319.GC25241@wisp> <20170217041756.GW30026@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170217041756.GW30026@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 17, 2017 at 6:17 AM, Jonathan Woithe <jwoithe@just42.net> wrote:
> On Thu, Feb 16, 2017 at 07:53:19PM -0800, Darren Hart wrote:
>> On Fri, Feb 17, 2017 at 01:38:04PM +1030, Jonathan Woithe wrote:
>> > Do you want me to continue to use Acked-by, or should I switch to
>> > Reviewed-by?
>>
>> These tags do have different meanings, and have come up at Kernel Summit the
>> last couple of years. My interpretation of those discussions is:
>>
>> Acked-by: I have no objection to this patch, but I didn't really give it a
>> thorough review. I trust your judgement. e.g. minor change to your driver to
>> support a subsystem API change. These are of very little value.
>>
>> Reviewed-by: I have carefully reviewed this patch and would like it to be
>> applied. This should usually come with some sort of commentary describing the
>> level of review or an area you focused on. This is what we would like to see
>> from all of our driver maintainers. These are high value.
>>
>> Linus *really* dislikes one line acked by's, and only *slightly* more so than
>> one line reviewed by's. :-)
>
> Got it, thanks, this is very helpful.
>
> In light of this I give you the following.
>
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Thanks, applied for testing with above tag.

>
> This patch series applies a much delayed patch series which implements a
> very useful clean up to the fujitsu-laptop driver.  Among other things it
> tidies up naming conventions within the driver to better reflect the
> functionality and to be more consistent with the rest of the kernel.  This
> will make future maintenance and feature additions much easier for all
> concerned.
>
> As per subsequent discussion we have agreed to drop patch 8/10 from the
> series: it creates problems on newer hardware and the issue it is addressing
> will be more completely dealt with in a subsequent patch series.
>
> Regards
>   jonathan



-- 
With Best Regards,
Andy Shevchenko
