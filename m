From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH RESEND] platform/x86: Add support for Dollar Cove TI power button
Date: Tue, 28 Nov 2017 19:21:22 +0200
Message-ID: <CAHp75VdAT1KxJ6cb3JYKkDC1bAi0v63ow5F5YuAnW8GPjjSL+Q@mail.gmail.com>
References: <20171116192402.22905-1-tiwai@suse.de> <CAHp75VdW6E+NRTwrqQvgHtLJwRvROw1Tt4L2og+dVFcSg84KSA@mail.gmail.com>
 <s5hfu8ypbx2.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:44657 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751842AbdK1RVX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Nov 2017 12:21:23 -0500
Received: by mail-qt0-f182.google.com with SMTP id j5so751113qth.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Nov 2017 09:21:23 -0800 (PST)
In-Reply-To: <s5hfu8ypbx2.wl-tiwai@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>

On Tue, Nov 28, 2017 at 7:10 PM, Takashi Iwai <tiwai@suse.de> wrote:
> On Fri, 17 Nov 2017 16:16:28 +0100,
> Andy Shevchenko wrote:
>>
>> On Thu, Nov 16, 2017 at 9:24 PM, Takashi Iwai <tiwai@suse.de> wrote:
>> > This provides a new input driver for supporting the power button on
>> > Dollar Cove TI PMIC, found on Cherrytrail-based devices.
>> > The patch is based on the original work by Intel, found at:
>> >   https://github.com/01org/ProductionKernelQuilts
>> >
>>
>> Pushed to my reviewing and testing queue, thanks.
>
> Did the patch pass the review / test?
> If you found anything, just let me know.

Yes, it's pending for promotion to published branch.
Don't worry it just takes a bit of time.

-- 
With Best Regards,
Andy Shevchenko
