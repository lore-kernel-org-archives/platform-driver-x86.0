From: Hao Wei Tee <angelsl@angelsl.xyz>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Expose conservation mode
 switch
Date: Tue, 30 May 2017 22:05:01 +0800
Message-ID: <7ba76865-7fb2-615a-8bcd-35e14b862a8e@angelsl.xyz>
References: <b667a2be-8021-93a0-d87a-e6fa6b2aa633@angelsl.xyz>
 <264a8ced-4336-06b9-d760-babc08ccde5c@angelsl.xyz>
 <CAHp75Vf3+1HPqeNbN3UEyhraA0FvrCHhNGaKwfsrtQauEdOGTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vf3+1HPqeNbN3UEyhraA0FvrCHhNGaKwfsrtQauEdOGTw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

On 5/30/17 9:22 PM, Andy Shevchenko wrote:
> On Sun, May 28, 2017 at 4:47 PM, Hao Wei Tee <angelsl@angelsl.xyz> wrote:
>> On 5/27/17 3:31 PM, Hao Wei Tee wrote:
>>> This exposes the battery conservation mode present on some (?) IdeaPads.
>>> The mode is set by calling ACPI method SBMC with argument 3 (on) or
>>> 5 (off). Status is reported in bit 5 of the return value of ACPI method
>>> GBMD.
>>>
>>> This patch was written based on an IdeaPad U430p. I'm not sure if the ACPI
>>> methods are the same across all IdeaPads, so it would be great if this got more
>>> testing across other models before it's merged.
>>
>> I got someone to test on an IdeaPad Y510p. It works on that too.
> 
> Do we have any other option that expose something via sysfs?
> 

Sorry, not sure what you meant.

If you meant

> Do we have any other options than expose something via sysfs?

I'm not sure, maybe an ioctl? That wouldn't be very convenient though.

The tp_smapi module (not in mainline) that exposes the battery threshold
functionality for ThinkPads also uses sysfs.

If you meant

> Do we have any other options that expose something via sysfs?

yes, camera_power, fan_mode, touchpad and conservation_mode.

Hao Wei
