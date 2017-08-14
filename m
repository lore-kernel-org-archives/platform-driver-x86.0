From: Hao Wei Tee <angelsl@in04.sg>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Expose conservation mode
 switch
Date: Mon, 14 Aug 2017 23:51:24 +0800
Message-ID: <c7e7481b-a96d-2ac4-145b-f2128252591c@in04.sg>
References: <cd64f959-5fa0-50e2-183a-70c28aa121d9@in04.sg>
 <CAHp75Vc8r0YWUZ77+nFmwn5_Yz7XqhJ5C+qRcjemmtmK+=YXXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc8r0YWUZ77+nFmwn5_Yz7XqhJ5C+qRcjemmtmK+=YXXA@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

On 14/8/2017 23:32, Andy Shevchenko wrote:
> On Mon, Aug 14, 2017 at 5:17 PM, Hao Wei Tee <angelsl@in04.sg> wrote:
>> This exposes the battery conservation mode present on some (?) IdeaPads.
>> The mode is set by calling ACPI method SBMC with argument 3 (on) or
>> 5 (off). Status is reported in bit 5 of the return value of ACPI method
>> GBMD.
> 
> Thanks for an update, this looks pretty much good!
> 
> Still some kind of nitpicks below.
> 
>> +#define GBMD_CONSERVATION_BIT (5)
> 
>> +enum {
>> +       SBMC_CONSERVATION_ON = 3,
>> +       SBMC_CONSERVATION_OFF = 5,
> 
> Looks to me like
> GBMD = Get BM Data
> SBMC = Send BM Command
> 
> Thus, I would leave BM only in the above (do you know by the way what
> BM stands for?

Now that you mention it, it might stand for battery management.

-- 
Hao Wei
