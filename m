From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Expose conservation mode switch
Date: Tue, 30 May 2017 16:22:10 +0300
Message-ID: <CAHp75Vf3+1HPqeNbN3UEyhraA0FvrCHhNGaKwfsrtQauEdOGTw@mail.gmail.com>
References: <b667a2be-8021-93a0-d87a-e6fa6b2aa633@angelsl.xyz> <264a8ced-4336-06b9-d760-babc08ccde5c@angelsl.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:33255 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751037AbdE3NWM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 May 2017 09:22:12 -0400
In-Reply-To: <264a8ced-4336-06b9-d760-babc08ccde5c@angelsl.xyz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hao Wei Tee <angelsl@angelsl.xyz>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On Sun, May 28, 2017 at 4:47 PM, Hao Wei Tee <angelsl@angelsl.xyz> wrote:
> On 5/27/17 3:31 PM, Hao Wei Tee wrote:
>> This exposes the battery conservation mode present on some (?) IdeaPads.
>> The mode is set by calling ACPI method SBMC with argument 3 (on) or
>> 5 (off). Status is reported in bit 5 of the return value of ACPI method
>> GBMD.
>>
>> This patch was written based on an IdeaPad U430p. I'm not sure if the ACPI
>> methods are the same across all IdeaPads, so it would be great if this got more
>> testing across other models before it's merged.
>
> I got someone to test on an IdeaPad Y510p. It works on that too.

Do we have any other option that expose something via sysfs?

-- 
With Best Regards,
Andy Shevchenko
