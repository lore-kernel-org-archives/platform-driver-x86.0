From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Expose conservation mode switch
Date: Sun, 6 Aug 2017 21:35:47 +0300
Message-ID: <CAHp75Vcvak-FtXyKFZ2NE0g8cRzCb1oUxJaHgPx8q_sL13y_Og@mail.gmail.com>
References: <b667a2be-8021-93a0-d87a-e6fa6b2aa633@angelsl.xyz>
 <264a8ced-4336-06b9-d760-babc08ccde5c@angelsl.xyz> <CAHp75Vf3+1HPqeNbN3UEyhraA0FvrCHhNGaKwfsrtQauEdOGTw@mail.gmail.com>
 <ed147557-0431-34b4-e877-14647a3be479@in04.sg>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:33725 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751341AbdHFSfs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Aug 2017 14:35:48 -0400
In-Reply-To: <ed147557-0431-34b4-e877-14647a3be479@in04.sg>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hao Wei Tee <angelsl@in04.sg>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On Sat, Aug 5, 2017 at 6:18 PM, Hao Wei Tee <angelsl@in04.sg> wrote:
> On 30/5/2017 21:22, Andy Shevchenko wrote:
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
>
> It's been 2 months, what can I do to get this patch merged, or alternatively some other
> way of exposing this switch?

Oh, sorry, I was pretty sure I have done something regarding to this
patch, but apparently not.

I'm fine with the change as long as we have no other option than sysfs here.
I'm on vacation for few more days, I will return to this after (ping
me let's say next Friday if you want to).

-- 
With Best Regards,
Andy Shevchenko
