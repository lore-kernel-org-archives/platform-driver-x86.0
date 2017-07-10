From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: add NULL check on
 devm_kzalloc() return value
Date: Mon, 10 Jul 2017 14:37:30 -0500
Message-ID: <20170710143730.Horde.NEj351PakRT3Rq0tNW6il2m@gator4166.hostgator.com>
References: <20170706221902.GA29514@embeddedgus>
 <20170707001900.GE6573@marvin.atrad.com.au> <20170707170208.GB30284@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170707170208.GB30284@fury>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren, Jonathan,

Quoting Darren Hart <dvhart@infradead.org>:

> On Fri, Jul 07, 2017 at 09:49:00AM +0930, Jonathan Woithe wrote:
>> On Thu, Jul 06, 2017 at 05:19:02PM -0500, Gustavo A. R. Silva wrote:
>> > Check return value from call to devm_kzalloc()
>> > in order to prevent a NULL pointer dereference.
>> >
>> > This issue was detected using Coccinelle and the following semantic patch:
>> >
>> > @@
>> > expression x;
>> > identifier fld;
>> > @@
>> >
>> > * x = devm_kzalloc(...);
>> >   ... when != x == NULL
>> >   x->fld
>> >
>> > Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
>>
>> These checks should be added in the interest of code correctness.
>> devm_kzalloc() can fail (even if it's extremely unlikely in practice) so we
>> should check for this.
>>
>> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>
>
> Thanks Gustavo and Jonathan,
>
> Queued to testing.
>

Glad to help. :)

Thanks
--
Gustavo A. R. Silva
