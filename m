From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: platform/x86: thinkpad_acpi: unhandled HKEY 0x60b0 and 0x60b1
Date: Fri, 12 Jan 2018 11:23:41 +0100
Message-ID: <CANq1E4SdDsA98kmzFuORkpVYWPSr9TxP-y_RXW+XjuSqPAeGgA@mail.gmail.com>
References: <CANq1E4Q55Z9WZ1qPhpmbtXGLb2oPcVst2Xo3YLnxtbt6d6WK_Q@mail.gmail.com>
 <CAHp75VfPR2Aj3ucmsoNtiJ96UBRzg+y6nCfU3d3ZuJZE5pUehg@mail.gmail.com>
 <20180109202448.zd63xjr3hth4tzru@mthode.org> <CAHp75Vf_iSR-xTfOdoMab81OCHnWd2vRxdTZon_q=7+E+MzOKw@mail.gmail.com>
 <CANq1E4T8-j0kXGMGhwvyg93bKxAG8QnEOP84E+tq7UndC=cSMQ@mail.gmail.com> <CAHp75VeKDvahHSgPVgwVFDRn5C9fi0cr01S_yvqctN4TjOKfNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:33047 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932976AbeALKXn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Jan 2018 05:23:43 -0500
Received: by mail-io0-f182.google.com with SMTP id t63so5349891iod.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jan 2018 02:23:43 -0800 (PST)
In-Reply-To: <CAHp75VeKDvahHSgPVgwVFDRn5C9fi0cr01S_yvqctN4TjOKfNw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Matthew Thode <mthode@mthode.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

Hi

On Thu, Jan 11, 2018 at 2:27 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jan 11, 2018 at 10:38 AM, David Herrmann <dh.herrmann@gmail.com> wrote:
>> I'd be fine with the patch Matthew proposed (makes the sensor a no-op):
>>     https://www.snip2code.com/Snippet/3291964/0001-Add-Thinkpad-palm-detection-acpi-co/
>>
>> Andy, is there any reason not to merge it? Do you want this key to be
>> exposed in some way? If the patch is ok, I can test it locally and
>> resend with tested-by.
>
> I can't just crawl through internet and merge odd patches. This is one
> reason why I added the author to Cc list.
>
> Another one we have an established process, so, please follow it:
> 1) submit to mailing list (like you did your initial message);
> 2) get time to be reviewed.
>
> We also use patchwork to keep history of what has been done. This
> patch missed our patchwork queue.
>
> Another important point I have no hardware to test myself, so, I need
> to be crystal clear on the change. I can't for this particular one.
>
> So, and at the end we have alive maintainer for that code. W/o his ACK
> I would not proceed.
>
> Sorry for inconvenience, this is how it's supposed to work.

Ugh, sorry, I just wanted to know whether I should just resend the
patch or rework it. Maybe that was not clear from my question.

Will resend. Lets continue discussion there.

Thanks
David
