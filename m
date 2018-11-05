From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Subject: Re: [PATCH v3 3/3] platform/x86: intel_pmc_core: Decode Snoop / Non
 Snoop LTR
Date: Tue, 6 Nov 2018 02:30:41 +0530
Message-ID: <8021ed8d-6931-3ffd-6e46-630e9a2c4a66@linux.intel.com>
References: <20181102103441.21943-1-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VfCcLPc_y4ZxvkahpMxjkj_5sntamYze90p7Ki94yU5Lg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfCcLPc_y4ZxvkahpMxjkj_5sntamYze90p7Ki94yU5Lg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org



On 03-Nov-18 12:02 AM, Andy Shevchenko wrote:
> On Fri, Nov 2, 2018 at 12:37 PM Rajneesh Bhardwaj
> <rajneesh.bhardwaj@linux.intel.com> wrote:
>> The LTR values follow PCIE LTR encoding format and can be decoded as per
>> https://pcisig.com/sites/default/files/specification_documents/ECN_LatencyTolnReporting_14Aug08.pdf
>>
>> This adds support to translate the raw LTR values as read from the PMC
>> to meaningful values in nanosecond units of time.
>> +#include <linux/bits.h>
> I told you something different, i.e. put this header where you _use_
> it, i.o.w into the header file.

Oops! Will move it to the header.

>
>> +#define LTR_REQ_NONSNOOP                       BIT(31)
>> +#define LTR_REQ_SNOOP                          BIT(15)
>> +#define LTR_DECODED_VAL                                GENMASK(9, 0)
>> +#define LTR_DECODED_SCALE                      GENMASK(12, 10)
> If these are in one register, please keep ordered by start bit.

Sure, will do.

>
> The rest is fine.
>

Many thanks again for your detailed review.
