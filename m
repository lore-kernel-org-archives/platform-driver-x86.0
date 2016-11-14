From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch v3 1/1] platform/x86: move module mlx-platform from
 arch/x86 to drivers/platform/x86
Date: Mon, 14 Nov 2016 09:16:38 +0200
Message-ID: <CAHp75Vfstb1k_kgzLO0NQKJT_Eibo-Az_Bh+M1YFR5ONoVufuw@mail.gmail.com>
References: <1477898553-61392-1-git-send-email-vadimp@mellanox.com>
 <alpine.DEB.2.20.1610310930430.5481@nanos> <AM5PR0501MB20971C6FB6089705CC130C8FA2A60@AM5PR0501MB2097.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM5PR0501MB20971C6FB6089705CC130C8FA2A60@AM5PR0501MB2097.eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, "dvhart@infradead.org" <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 8, 2016 at 8:19 AM, Vadim Pasternak <vadimp@mellanox.com> wrote:
> Hi,
>
> Could this patch be merged to for-next for 4.10?
> When it's merged I'd like to submit another small patch on top of it.

First of all, please avoid top posting.
I will process the pdx86 mailing list and queue this week.

P.S. Are you sure that is the right fix "Remove "select MLX_PLATFORM"
from Kconfig, since it has unmet direct dependencies (X86 &&
X86_PLATFORM_DEVICES && X86_64)"?

>> On Mon, 31 Oct 2016, Vadim Pasternak wrote:
>>
>> > Since mlx-platform is not an architectural driver, it is moved out of
>> > arch/x86/platform to drivers/platform/x86.
>> > Relevant Makefile and Kconfig are updated.
>> >
>> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>>
>> Acked-by: Thomas Gleixner <tglx@linutronix.de>

-- 
With Best Regards,
Andy Shevchenko
