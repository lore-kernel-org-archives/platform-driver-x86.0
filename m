From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: pmc_atom: Add Lex 3I380D industrial PC to
 critclk_systems DMI table
Date: Mon, 6 May 2019 16:47:26 +0200
Message-ID: <085c5b6e-d220-ebd1-38d2-def7efca24b8@redhat.com>
References: <20190429150135.15070-1-hdegoede@redhat.com>
 <CAHp75VeE=88mCcgVx3Y3PQJPQ819Z7=3s=jRGz1y=t09phk=rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeE=88mCcgVx3Y3PQJPQ819Z7=3s=jRGz1y=t09phk=rA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Kai Heng Feng <kai.heng.feng@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Semyon Verchenko <semverchenko@factor-ts.ru>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 06-05-19 14:38, Andy Shevchenko wrote:
> On Mon, Apr 29, 2019 at 6:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Lex 3I380D industrial PC has 4 ethernet controllers on board
>> which need pmc_plt_clk0 - 3 to function, add it to the critclk_systems
>> DMI table, so that drivers/clk/x86/clk-pmc-atom.c will mark the clocks
>> as CLK_CRITICAL and they will not get turned off.
>>
> 
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> supposedly to go via CLK tree.
> 
> P.S. If you want it through PDx86, I need immutable branch / tag from CLK.

Stephen added the patches this depends on to his fixes branch, so they
are in the 5.1 / Torvald's master branch, since we are now in the 5.2 merge
window, you should be able to cleanly apply this directly.

Regards,

Hans


> 
>> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")
>> Reported-and-tested-by: Semyon Verchenko <semverchenko@factor-ts.ru>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/platform/x86/pmc_atom.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
>> index 3a635ea09b8a..2910845b7cdd 100644
>> --- a/drivers/platform/x86/pmc_atom.c
>> +++ b/drivers/platform/x86/pmc_atom.c
>> @@ -407,12 +407,21 @@ static int pmc_dbgfs_register(struct pmc_dev *pmc)
>>    */
>>   static const struct dmi_system_id critclk_systems[] = {
>>          {
>> +               /* pmc_plt_clk0 is used for an external HSIC USB HUB */
>>                  .ident = "MPL CEC1x",
>>                  .matches = {
>>                          DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
>>                          DMI_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
>>                  },
>>          },
>> +       {
>> +               /* pmc_plt_clk0 - 3 are used for the 4 ethernet controllers */
>> +               .ident = "Lex 3I380D",
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
>> +               },
>> +       },
>>          { /*sentinel*/ }
>>   };
>>
>> --
>> 2.21.0
>>
> 
> 
