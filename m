From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: platform/x86: thinkpad_acpi: unhandled HKEY 0x60b0 and 0x60b1
Date: Thu, 11 Jan 2018 09:38:23 +0100
Message-ID: <CANq1E4T8-j0kXGMGhwvyg93bKxAG8QnEOP84E+tq7UndC=cSMQ@mail.gmail.com>
References: <CANq1E4Q55Z9WZ1qPhpmbtXGLb2oPcVst2Xo3YLnxtbt6d6WK_Q@mail.gmail.com>
 <CAHp75VfPR2Aj3ucmsoNtiJ96UBRzg+y6nCfU3d3ZuJZE5pUehg@mail.gmail.com>
 <20180109202448.zd63xjr3hth4tzru@mthode.org> <CAHp75Vf_iSR-xTfOdoMab81OCHnWd2vRxdTZon_q=7+E+MzOKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-it0-f46.google.com ([209.85.214.46]:33824 "EHLO
        mail-it0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932107AbeAKIiZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Jan 2018 03:38:25 -0500
Received: by mail-it0-f46.google.com with SMTP id m11so19099188iti.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jan 2018 00:38:25 -0800 (PST)
In-Reply-To: <CAHp75Vf_iSR-xTfOdoMab81OCHnWd2vRxdTZon_q=7+E+MzOKw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Matthew Thode <mthode@mthode.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

Hey

On Wed, Jan 10, 2018 at 4:03 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Jan 9, 2018 at 10:24 PM, Matthew Thode <mthode@mthode.org> wrote:
>> On 18-01-09 22:16:10, Andy Shevchenko wrote:
>>> On Tue, Jan 9, 2018 at 3:19 PM, David Herrmann <dh.herrmann@gmail.com> wrote:
>
>> I've been able to trigger it 'at will' on the X1C5.  If I hover my hand
>> just below the arrow keys I'll get the first signal, after I take it
>> away I get the second one.  There seems to be a delay in when I put (or
>> take away) my hand to prevent spamming the logs even more.  It could be
>> to sense lid close, but there's already another sensors for that I
>> thought.  The only remaining thing I can guess it that it's to detect
>> your hands to turn on the keyboard backlight or something.
>>
>> I don't think it's related at all to the fingerprint sensor as I hover
>> my hand to the right of it.
>
> Just realized that it might be an ambient sensor. Your hand makes
> light goes differently to the sensor -> hardware sends an event.
>
> Whatever guys, feel free to submit a patch when you will be sure what
> is the source of the event.
>
> It also makes sense to discuss somewhere near to thinkwiki.org I suppose.

Indeed. I can reliably trigger it by moving my hand on top of the
arrow-keys. 0x60b0 is signaled when hovered. It has a latency of
roughly 1s. Once I remove my hand, 0x60b1 is signalled, with a latency
of roughly 3s. Overall, the sensor is quite unreliable when I actually
use the laptop. Sometimes to a degree that it does not react to
anything at all. It might really be some ambient light sensor, which
then gets confused by some unexpected lighting.

Whatever it is, I think this is really meant as "palm-detection" so
input drivers can disable trackpads, etc.

I'd be fine with the patch Matthew proposed (makes the sensor a no-op):
    https://www.snip2code.com/Snippet/3291964/0001-Add-Thinkpad-palm-detection-acpi-co/

Andy, is there any reason not to merge it? Do you want this key to be
exposed in some way? If the patch is ok, I can test it locally and
resend with tested-by.

Thanks
David
