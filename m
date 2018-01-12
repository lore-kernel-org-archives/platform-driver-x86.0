From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: platform/x86: thinkpad_acpi: unhandled HKEY 0x60b0 and 0x60b1
Date: Fri, 12 Jan 2018 13:33:12 +0100
Message-ID: <CANq1E4QR-55W0bn5nj6cJypJ+vndE4=x8xGAYMDUBbeD+7FM8w@mail.gmail.com>
References: <CANq1E4Q55Z9WZ1qPhpmbtXGLb2oPcVst2Xo3YLnxtbt6d6WK_Q@mail.gmail.com>
 <CAHp75VfPR2Aj3ucmsoNtiJ96UBRzg+y6nCfU3d3ZuJZE5pUehg@mail.gmail.com>
 <20180109202448.zd63xjr3hth4tzru@mthode.org> <CAHp75Vf_iSR-xTfOdoMab81OCHnWd2vRxdTZon_q=7+E+MzOKw@mail.gmail.com>
 <CANq1E4T8-j0kXGMGhwvyg93bKxAG8QnEOP84E+tq7UndC=cSMQ@mail.gmail.com>
 <20180111105026.t6zhi5sadpkzb7sm@khazad-dum.debian.net> <CANq1E4T1_+qFD4pC9CUbBf6NJQmt1ju0iHwK7K0WC+Ejb-R=gA@mail.gmail.com>
 <20180112121603.4k45pbp5l3677jk7@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-it0-f45.google.com ([209.85.214.45]:33576 "EHLO
        mail-it0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932797AbeALMdO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Jan 2018 07:33:14 -0500
Received: by mail-it0-f45.google.com with SMTP id c102so1606917itd.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jan 2018 04:33:13 -0800 (PST)
In-Reply-To: <20180112121603.4k45pbp5l3677jk7@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Matthew Thode <mthode@mthode.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

Hi

On Fri, Jan 12, 2018 at 1:16 PM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Fri, 12 Jan 2018, David Herrmann wrote:
>> I see that it would be beneficial knowing exactly what this key
>> reports. However, I think spamming the kernel log is not the right way
>> to motivate people to investigate this. I'd be fine with printing a
>> one-time hint for those keys, or some other option. But the current
>> state makes kernel development a hassle with all the warnings printed
>> by the thinkpad-acpi driver.
>
> Agreed.
>
> In fact, I will accept a patch that changes that warning to a pr_info,
> and rewords it to a far less scary "unknown general purpose or
> thermal-related event".  The warning was added a long time ago, there
> were only thermal alarms in the 0x6000 event range at that time, I
> think.

Right. I will have a look.

>> > It could be to "turn keyboard lighting on" helper or something like that
>> > (coupled to other sensor), for all we know.  It is a bit strange for a
>> > palm-detection sensor to be over the arrow keys, and it certainly
>> > doesn't look like it is a cat-on-keyboard detector...
>>
>> Palm-detection underneath the arrow keys sounds like the right place
>> to me. Especially as most people are right-handed, you want to detect
>> movement of the right hand. The left hand might just be resting on the
>> keyboard the entire time. Inspecting my own usage, I'd say the lower
>> right hand side of they keyboard is the perfect place for that. What
>> makes you sceptical of that?
>
> Because for some reason I thought this was about disabling the touchpad
> automatically.  Running on little sleep, here, due to Spectre.

No worries.

>> I checked with the input developers, and there is currently no hookup
>> of any similar interfaces in libinput / xf86-input-*. So no similar
>> prior art that might be of help here.
>>
>> > Another good place to ask around for such information are the thinkpad
>> > forums, they are far more windows-centric, but there is a *lot* of
>> > thinkpad experts lurking there...
>>
>> Which forums are you referring to here? I am not used to debugging
>> thinkpad acpi drivers, so any hints are welcome.
>
> Here:
> https://forum.thinkpads.com/

Thanks! The search seems limited to 1 request per minute. Meh. I will
see whether I can get some information out of it.

Thanks
David
