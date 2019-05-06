From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 0/1] Add several Beckhoff Automation boards to
 critclk_systems DMI table
Date: Mon, 6 May 2019 16:50:59 +0200
Message-ID: <21677236-b7fc-c51b-958a-269b5e65af54@redhat.com>
References: <20190502130351.5341-1-linux-kernel-dev@beckhoff.com>
 <CAHp75Vc4xWbnGoaS8tRDV4_F-Qifh7K1hoFn0V-OObun2Sd0DA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc4xWbnGoaS8tRDV4_F-Qifh7K1hoFn0V-OObun2Sd0DA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel-dev@beckhoff.com, Stephen Boyd <sboyd@kernel.org>
Cc: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 06-05-19 14:40, Andy Shevchenko wrote:
> On Thu, May 2, 2019 at 4:04 PM <linux-kernel-dev@beckhoff.com> wrote:
>>
>> From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
>>
>> There are several Beckhoff Automation industrial PC boards which use
>> pmc_plt_clk* clocks for ethernet controllers. The patch adds affected boards
>> to critclk_systems DMI table so the clocks are marked as CLK_CRITICAL and
>> not turned off.
>> This should be applied on top of another patch as both change
>> the same table:
>> [PATCH] platform/x86: pmc_atom: Add Lex 3I380D industrial PC to critclk_systems DMI table
> 
> Yes, that's why it either should go via CLK tree, or I need an
> immutable tag or branch from them.
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

As I just mentioned in your reply to the "[PATCH] platform/x86: pmc_atom:
Add Lex 3I380D industrial PC to critclk_systems DMI table":

"Stephen added the patches this depends on to his fixes branch, so they
are in the 5.1 / Torvald's master branch, since we are now in the 5.2 merge
window, you should be able to cleanly apply this directly."

So both that patch and this patch should be able to go through the d-p-x86 tree
unless I'm missing something?

Regards,

Hans

> 
>>
>> Steffen Dirkwinkel (1):
>>    platform/x86: pmc_atom: Add several Beckhoff Automation boards to
>>      critclk_systems DMI table
>>
>>   drivers/platform/x86/pmc_atom.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> --
>> 2.21.0
> 
> 
> 
