From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH v2] platform/x86/pcengines-apuv2: use KEY_RESTART for
 front button
Date: Mon, 5 Aug 2019 14:06:32 +0200
Message-ID: <0b2802f8-5732-52e9-0a95-b28d23239ecd@metux.net>
References: <1564081563-28322-1-git-send-email-info@metux.net>
 <CAHp75Vem8QZVGx6x0p3JgxA6kH3pG+1_zU=cgiDUDSC5p2ODDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vem8QZVGx6x0p3JgxA6kH3pG+1_zU=cgiDUDSC5p2ODDQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 01.08.19 17:00, Andy Shevchenko wrote:

Hi,

> On Thu, Jul 25, 2019 at 10:06 PM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
>>
>> From: Enrico Weigelt <info@metux.net>
>>
>> The keycode KEY_RESTART is more appropriate for the front button,
>> as most people use it for things like restart or factory reset.
>>
> 
> Applied, thanks!

thx.

> 
>> Signed-off-by: Enrico Weigelt <info@metux.net>
>> Fixes: f8eb0235f65989fc5521c40c78d1261e7f25cdbe ("x86: pcengines apuv2 gpio/leds/keys platform driver")
> 
> Please, use allowed minimum (12 nowadays) characters of hash.

hmm, do you happen to know how to configure tig to show the short hash ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
