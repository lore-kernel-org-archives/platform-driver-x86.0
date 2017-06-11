From: Hao Wei Tee <angelsl@angelsl.xyz>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Expose conservation mode
 switch
Date: Sun, 11 Jun 2017 13:07:07 +0800
Message-ID: <47e2af96-1b97-6654-e65c-eea570383abb@angelsl.xyz>
References: <b667a2be-8021-93a0-d87a-e6fa6b2aa633@angelsl.xyz>
 <264a8ced-4336-06b9-d760-babc08ccde5c@angelsl.xyz>
 <CAHp75Vf3+1HPqeNbN3UEyhraA0FvrCHhNGaKwfsrtQauEdOGTw@mail.gmail.com>
 <7ba76865-7fb2-615a-8bcd-35e14b862a8e@angelsl.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f173.google.com ([209.85.192.173]:36780 "EHLO
        mail-pf0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751683AbdFKFHM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Jun 2017 01:07:12 -0400
Received: by mail-pf0-f173.google.com with SMTP id x63so40859868pff.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Jun 2017 22:07:11 -0700 (PDT)
In-Reply-To: <7ba76865-7fb2-615a-8bcd-35e14b862a8e@angelsl.xyz>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On 5/30/17 10:05 PM, Hao Wei Tee wrote:
> On 5/30/17 9:22 PM, Andy Shevchenko wrote:
>> On Sun, May 28, 2017 at 4:47 PM, Hao Wei Tee <angelsl@angelsl.xyz> wrote:
>>> On 5/27/17 3:31 PM, Hao Wei Tee wrote:
>>>> This exposes the battery conservation mode present on some (?) IdeaPads.
>>>> The mode is set by calling ACPI method SBMC with argument 3 (on) or
>>>> 5 (off). Status is reported in bit 5 of the return value of ACPI method
>>>> GBMD.
>>>>
>>>> This patch was written based on an IdeaPad U430p. I'm not sure if the ACPI
>>>> methods are the same across all IdeaPads, so it would be great if this got more
>>>> testing across other models before it's merged.
>>>
>>> I got someone to test on an IdeaPad Y510p. It works on that too.
>>
>> Do we have any other option that expose something via sysfs?
>>
> 
> Sorry, not sure what you meant.
> 
> If you meant
> 
>> Do we have any other options than expose something via sysfs?
> 
> I'm not sure, maybe an ioctl? That wouldn't be very convenient though.
> 
> The tp_smapi module (not in mainline) that exposes the battery threshold
> functionality for ThinkPads also uses sysfs.
> 
> If you meant
> 
>> Do we have any other options that expose something via sysfs?
> 
> yes, camera_power, fan_mode, touchpad and conservation_mode.

Any thoughts on this?

-- 
Hao Wei
