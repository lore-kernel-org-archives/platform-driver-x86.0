From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: pmc_atom: Add Lex 3I380D industrial PC to
 critclk_systems DMI table
Date: Wed, 8 May 2019 09:48:37 +0200
Message-ID: <10c8864c-6ee7-4dfd-6274-b1996e767653@redhat.com>
References: <20190429150135.15070-1-hdegoede@redhat.com>
 <CAHp75VeE=88mCcgVx3Y3PQJPQ819Z7=3s=jRGz1y=t09phk=rA@mail.gmail.com>
 <085c5b6e-d220-ebd1-38d2-def7efca24b8@redhat.com>
 <CAHp75Vfe9uK_b_V+uG29wb1L6J7u1hpbU+P4beXso9KNPM+8Rg@mail.gmail.com>
 <568ba27d-a6a5-b158-bab1-f22cd8ccb34e@redhat.com>
 <155726027056.14659.1724431433952718602@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <155726027056.14659.1724431433952718602@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Kai Heng Feng <kai.heng.feng@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Semyon Verchenko <semverchenko@factor-ts.ru>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 07-05-19 22:17, Stephen Boyd wrote:
> Quoting Hans de Goede (2019-05-06 08:05:42)
>> Hi,
>>
>> On 06-05-19 16:59, Andy Shevchenko wrote:
>>> On Mon, May 6, 2019 at 5:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 06-05-19 14:38, Andy Shevchenko wrote:
>>>>> On Mon, Apr 29, 2019 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> The Lex 3I380D industrial PC has 4 ethernet controllers on board
>>>>>> which need pmc_plt_clk0 - 3 to function, add it to the critclk_systems
>>>>>> DMI table, so that drivers/clk/x86/clk-pmc-atom.c will mark the clocks
>>>>>> as CLK_CRITICAL and they will not get turned off.
>>>>>>
>>>>>
>>>>> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>>>>> supposedly to go via CLK tree.
>>>>>
>>>>> P.S. If you want it through PDx86, I need immutable branch / tag from CLK.
>>>>
>>>> Stephen added the patches this depends on to his fixes branch, so they
>>>> are in the 5.1 / Torvald's master branch, since we are now in the 5.2 merge
>>>> window, you should be able to cleanly apply this directly.
>>>
>>> We don't do back merges, so, our base is v5.1-rc1. Does it mean the
>>> commit in question is in v5.1-rc1?
>>> AFAICS it was appeared in v5.1-rc5.
>>
>> Ah, I see, my bad.
>>
>> Stephen can you pick up this patch and the
>> "[PATCH 1/1] Add several Beckhoff Automation boards to critclk_systems DMI table"
>> patch then?
>>
> 
> I guess this is urgent?

Somewhat, getting this into e.g. rc2 would be fine too, waiting till 5.3
would be bad.

Regards,

Hans
