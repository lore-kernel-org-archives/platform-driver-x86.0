From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: platform/x86: thinkpad_acpi: unhandled HKEY 0x60b0 and 0x60b1
Date: Thu, 11 Jan 2018 15:27:07 +0200
Message-ID: <CAHp75VeKDvahHSgPVgwVFDRn5C9fi0cr01S_yvqctN4TjOKfNw@mail.gmail.com>
References: <CANq1E4Q55Z9WZ1qPhpmbtXGLb2oPcVst2Xo3YLnxtbt6d6WK_Q@mail.gmail.com>
 <CAHp75VfPR2Aj3ucmsoNtiJ96UBRzg+y6nCfU3d3ZuJZE5pUehg@mail.gmail.com>
 <20180109202448.zd63xjr3hth4tzru@mthode.org> <CAHp75Vf_iSR-xTfOdoMab81OCHnWd2vRxdTZon_q=7+E+MzOKw@mail.gmail.com>
 <CANq1E4T8-j0kXGMGhwvyg93bKxAG8QnEOP84E+tq7UndC=cSMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:44952 "EHLO
        mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752735AbeAKN1I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Jan 2018 08:27:08 -0500
Received: by mail-qt0-f173.google.com with SMTP id m59so1745318qte.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jan 2018 05:27:08 -0800 (PST)
In-Reply-To: <CANq1E4T8-j0kXGMGhwvyg93bKxAG8QnEOP84E+tq7UndC=cSMQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: Matthew Thode <mthode@mthode.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Thu, Jan 11, 2018 at 10:38 AM, David Herrmann <dh.herrmann@gmail.com> wrote:
> On Wed, Jan 10, 2018 at 4:03 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Tue, Jan 9, 2018 at 10:24 PM, Matthew Thode <mthode@mthode.org> wrote:

>> Just realized that it might be an ambient sensor. Your hand makes
>> light goes differently to the sensor -> hardware sends an event.
>>
>> Whatever guys, feel free to submit a patch when you will be sure what
>> is the source of the event.
>>
>> It also makes sense to discuss somewhere near to thinkwiki.org I suppose.
>
> Indeed. I can reliably trigger it by moving my hand on top of the
> arrow-keys. 0x60b0 is signaled when hovered. It has a latency of
> roughly 1s. Once I remove my hand, 0x60b1 is signalled, with a latency
> of roughly 3s. Overall, the sensor is quite unreliable when I actually
> use the laptop. Sometimes to a degree that it does not react to
> anything at all. It might really be some ambient light sensor, which
> then gets confused by some unexpected lighting.
>
> Whatever it is, I think this is really meant as "palm-detection" so
> input drivers can disable trackpads, etc.

I would listen to what Henrique said, he has a good point.

> I'd be fine with the patch Matthew proposed (makes the sensor a no-op):
>     https://www.snip2code.com/Snippet/3291964/0001-Add-Thinkpad-palm-detection-acpi-co/
>
> Andy, is there any reason not to merge it? Do you want this key to be
> exposed in some way? If the patch is ok, I can test it locally and
> resend with tested-by.

I can't just crawl through internet and merge odd patches. This is one
reason why I added the author to Cc list.

Another one we have an established process, so, please follow it:
1) submit to mailing list (like you did your initial message);
2) get time to be reviewed.

We also use patchwork to keep history of what has been done. This
patch missed our patchwork queue.

Another important point I have no hardware to test myself, so, I need
to be crystal clear on the change. I can't for this particular one.

So, and at the end we have alive maintainer for that code. W/o his ACK
I would not proceed.

Sorry for inconvenience, this is how it's supposed to work.

-- 
With Best Regards,
Andy Shevchenko
