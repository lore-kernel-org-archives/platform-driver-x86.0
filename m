From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: platform/x86: thinkpad_acpi: unhandled HKEY 0x60b0 and 0x60b1
Date: Wed, 10 Jan 2018 17:03:34 +0200
Message-ID: <CAHp75Vf_iSR-xTfOdoMab81OCHnWd2vRxdTZon_q=7+E+MzOKw@mail.gmail.com>
References: <CANq1E4Q55Z9WZ1qPhpmbtXGLb2oPcVst2Xo3YLnxtbt6d6WK_Q@mail.gmail.com>
 <CAHp75VfPR2Aj3ucmsoNtiJ96UBRzg+y6nCfU3d3ZuJZE5pUehg@mail.gmail.com> <20180109202448.zd63xjr3hth4tzru@mthode.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f174.google.com ([209.85.216.174]:35698 "EHLO
        mail-qt0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932372AbeAJPDg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Jan 2018 10:03:36 -0500
Received: by mail-qt0-f174.google.com with SMTP id u10so22344890qtg.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jan 2018 07:03:35 -0800 (PST)
In-Reply-To: <20180109202448.zd63xjr3hth4tzru@mthode.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Thode <mthode@mthode.org>
Cc: David Herrmann <dh.herrmann@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tue, Jan 9, 2018 at 10:24 PM, Matthew Thode <mthode@mthode.org> wrote:
> On 18-01-09 22:16:10, Andy Shevchenko wrote:
>> On Tue, Jan 9, 2018 at 3:19 PM, David Herrmann <dh.herrmann@gmail.com> wrote:

> I've been able to trigger it 'at will' on the X1C5.  If I hover my hand
> just below the arrow keys I'll get the first signal, after I take it
> away I get the second one.  There seems to be a delay in when I put (or
> take away) my hand to prevent spamming the logs even more.  It could be
> to sense lid close, but there's already another sensors for that I
> thought.  The only remaining thing I can guess it that it's to detect
> your hands to turn on the keyboard backlight or something.
>
> I don't think it's related at all to the fingerprint sensor as I hover
> my hand to the right of it.

Just realized that it might be an ambient sensor. Your hand makes
light goes differently to the sensor -> hardware sends an event.

Whatever guys, feel free to submit a patch when you will be sure what
is the source of the event.

It also makes sense to discuss somewhere near to thinkwiki.org I suppose.

-- 
With Best Regards,
Andy Shevchenko
