From: Arjan van de Ven <arjan@linux.intel.com>
Subject: Re: [PATCH] platform/x86: intel_turbo_max_3: Remove restriction for
 HWP platforms
Date: Wed, 14 Feb 2018 11:29:48 -0800
Message-ID: <7791d2f2-3a74-6dee-7055-feeaa6bbe2d8@linux.intel.com>
References: <20180212195047.23671-1-srinivas.pandruvada@linux.intel.com>
 <CAHp75VdUnw0NjcNDKzFp-hZWho4A8RV=9Xthz-foZ6wTaT+Ftg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdUnw0NjcNDKzFp-hZWho4A8RV=9Xthz-foZ6wTaT+Ftg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 2/14/2018 11:29 AM, Andy Shevchenko wrote:
> On Mon, Feb 12, 2018 at 9:50 PM, Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com> wrote:
>> On systems supporting HWP (Hardware P-States) mode, we expected to
>> enumerate core priority via ACPI-CPPC tables. Unfortunately deployment of
>> TURBO 3.0 didn't use this method to show core priority. So users are not
>> able to utilize this feature in HWP mode.
>>
>> So remove the loading restriction of this driver for HWP enabled systems.
>> Even if there are some systems, which are providing the core priority via
>> ACPI CPPC, this shouldn't cause any conflict as the source of priority
>> definition is same.
>>
> 
> Pushed to my review and testing queue, thanks!
> 
> P.S. Should it go to stable?

older stable at least did not have the problem
