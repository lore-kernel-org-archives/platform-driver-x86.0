From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: platform/x86/thinkpad_acpi: Adjustments for four function implementations
Date: Tue, 19 Dec 2017 19:28:05 +0200
Message-ID: <CAHp75VekFcmPJKAhc7oBNHa8k2GYGAskhVDteUymZCqdB=HOGw@mail.gmail.com>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
 <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com> <ea910da9-ca59-b895-b071-35d9c5cbd112@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:46637 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750769AbdLSR2H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 12:28:07 -0500
In-Reply-To: <ea910da9-ca59-b895-b071-35d9c5cbd112@users.sourceforge.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Dec 19, 2017 at 6:23 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>>>   Delete an error message for a failed memory allocation in three funct=
ions
>>
>> This one is questionable since it prints error messages at ->init() stag=
e.
>> I would rather not touch this.
>
> Do you find the Linux allocation failure report insufficient in this case=
?

It is up to the current driver maintainer. For me it sounds better to
have than not to.

>>>   Improve a size determination in tpacpi_new_rfkill()
>>
>> Doesn't make any sense right now. One style over the other.
>> Nothing gets better or worth at this point.
>
> Would you like to care for a bit more compliance with information
> from the section =E2=80=9C14) Allocating memory=E2=80=9D in the document =
=E2=80=9Ccoding-style.rst=E2=80=9D?

You know, in Russian we have an adverb: =D0=97=D0=B0=D1=81=D1=82=D0=B0=D0=
=B2=D1=8C =D0=B4=D1=83=D1=80=D0=B0=D0=BA=D0=B0 =D0=B1-=D0=B3=D1=83 =D0=BC=
=D0=BE=D0=BB=D0=B8=D1=82=D1=8C=D1=81=D1=8F,
=D0=BE=D0=BD =D0=B8 =D0=BB=D0=BE=D0=B1 =D1=80=D0=B0=D1=81=D1=88=D0=B8=D0=B1=
=D1=91=D1=82.
Which has English equivalent: Give a man enough rope and he=E2=80=99ll hang=
 himself.

--=20
With Best Regards,
Andy Shevchenko
