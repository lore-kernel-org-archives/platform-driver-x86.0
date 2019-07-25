From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] platform/x86/pcengines-apuv2: use KEY_RESTART for front
 button
Date: Thu, 25 Jul 2019 20:50:27 +0200
Message-ID: <332c666b-1bb3-d4bb-ad1b-98b36992de71@metux.net>
References: <1563795379-7521-1-git-send-email-info@metux.net>
 <CAHp75Vch3KNCkwp69a_fBtMy3B3k=NEbAmPZE2cn5HSn577HOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vch3KNCkwp69a_fBtMy3B3k=NEbAmPZE2cn5HSn577HOw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 25.07.19 19:17, Andy Shevchenko wrote:
> On Mon, Jul 22, 2019 at 2:36 PM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
>>
>> From: Enrico Weigelt <info@metux.net>
>>
>> The keycode KEY_RESTART is more appropriate for the front button,
>> as most people use it for things like restart or factory reset.
>>
> 
> Should it go as Fixes?

I think so. Technically, the feature already worked, but the keycode
wasn't semantically fine.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
