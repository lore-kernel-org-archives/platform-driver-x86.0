From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC v2 6/6] platform/x86: intel_pmc_ipc: Use generic Intel IPC
 device calls
Date: Wed, 6 Sep 2017 12:00:43 +0300
Message-ID: <CAHp75Vc8N612-uxLJQw6mJDMkjgN_AAaXBeuOKU07Kzzxo8hUQ@mail.gmail.com>
References: <1504401889-113524-7-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170905073849.eeeo3kbncozzer46@dell> <7d0dbcce-0863-cfb0-6012-2c3ac0fc3c27@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7d0dbcce-0863-cfb0-6012-2c3ac0fc3c27@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Kuppuswamy, Sathyanarayanan" <sathyaosid@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Sep 6, 2017 at 8:27 AM, Kuppuswamy, Sathyanarayanan
<sathyaosid@gmail.com> wrote:
> On 9/5/2017 12:38 AM, Lee Jones wrote:
>> On Sat, 02 Sep 2017, sathyanarayanan.kuppuswamy@linux.intel.com wrote:

>> I'm a bit concerned by the API.
>
> This is not a new change. Even before refactoring this driver, we have been
> using u32 bit variable to pass the DPTR and SPTR address.
>>
>>    Any reason why you're not using
>> pointers for addresses?
>
> I think the main reason is,  this is the expected format defined by SCU/PMC
> spec. According to the spec document, SPTR and DPTR registers are used to
> program the 32 bit SRAM address from which the PMC/SCU firmware can
> read/write the data of an IPC command. if we are not using SPTR or DPTR, we
> need to leave the value at zero.

It's an effect, the cause is that the system controllers which are
used in Intel SoCs are 32-bit microprocessors and they can't address
more. That's why SRAM is placed in 32-bit address space.
And thus, the SCU protocol defines fixed width parameters for
addresses. So, it means we can't use any address outside of 4G space,
iow 32-bit wide.

>> pointers, you should be using NULL, instead of 0.


-- 
With Best Regards,
Andy Shevchenko
