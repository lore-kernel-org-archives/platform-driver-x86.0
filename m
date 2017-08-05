From: Hao Wei Tee <angelsl@in04.sg>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Expose conservation mode
 switch
Date: Sat, 5 Aug 2017 23:18:26 +0800
Message-ID: <ed147557-0431-34b4-e877-14647a3be479@in04.sg>
References: <b667a2be-8021-93a0-d87a-e6fa6b2aa633@angelsl.xyz>
 <264a8ced-4336-06b9-d760-babc08ccde5c@angelsl.xyz>
 <CAHp75Vf3+1HPqeNbN3UEyhraA0FvrCHhNGaKwfsrtQauEdOGTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f175.google.com ([209.85.192.175]:35732 "EHLO
        mail-pf0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751392AbdHEPSa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Aug 2017 11:18:30 -0400
Received: by mail-pf0-f175.google.com with SMTP id t86so18450333pfe.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Aug 2017 08:18:30 -0700 (PDT)
In-Reply-To: <CAHp75Vf3+1HPqeNbN3UEyhraA0FvrCHhNGaKwfsrtQauEdOGTw@mail.gmail.com>
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On 30/5/2017 21:22, Andy Shevchenko wrote:
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

It's been 2 months, what can I do to get this patch merged, or alternatively some other
way of exposing this switch?

-- 
Hao Wei
