From: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: platform/x86: thinkpad_acpi: unhandled HKEY 0x60b0 and 0x60b1
Date: Fri, 12 Jan 2018 12:11:55 +0100
Message-ID: <CANq1E4T1_+qFD4pC9CUbBf6NJQmt1ju0iHwK7K0WC+Ejb-R=gA@mail.gmail.com>
References: <CANq1E4Q55Z9WZ1qPhpmbtXGLb2oPcVst2Xo3YLnxtbt6d6WK_Q@mail.gmail.com>
 <CAHp75VfPR2Aj3ucmsoNtiJ96UBRzg+y6nCfU3d3ZuJZE5pUehg@mail.gmail.com>
 <20180109202448.zd63xjr3hth4tzru@mthode.org> <CAHp75Vf_iSR-xTfOdoMab81OCHnWd2vRxdTZon_q=7+E+MzOKw@mail.gmail.com>
 <CANq1E4T8-j0kXGMGhwvyg93bKxAG8QnEOP84E+tq7UndC=cSMQ@mail.gmail.com> <20180111105026.t6zhi5sadpkzb7sm@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:39559 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933182AbeALLL4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Jan 2018 06:11:56 -0500
Received: by mail-io0-f172.google.com with SMTP id b198so2781076iof.6
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jan 2018 03:11:56 -0800 (PST)
In-Reply-To: <20180111105026.t6zhi5sadpkzb7sm@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Matthew Thode <mthode@mthode.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

Hi

On Thu, Jan 11, 2018 at 11:50 AM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Thu, 11 Jan 2018, David Herrmann wrote:
>> Indeed. I can reliably trigger it by moving my hand on top of the
>> arrow-keys. 0x60b0 is signaled when hovered. It has a latency of
>> roughly 1s. Once I remove my hand, 0x60b1 is signalled, with a latency
>> of roughly 3s. Overall, the sensor is quite unreliable when I actually
>> use the laptop. Sometimes to a degree that it does not react to
>> anything at all. It might really be some ambient light sensor, which
>> then gets confused by some unexpected lighting.
>
> Please someone test this on Win10+Lenovo drivers to check for intended
> behavior...

I cannot see Windows reacting to this at all. I tried different
combinations of the ambient-light sensor and the keyboard sensor.
There seems to be no automatic handling regarding keyboard or screen
brightness, nor any palm detection. Neither did I see any user-options
referring to these sensors.

>             otherwise we will get crazyness once the underlying
> implementation improves/changes to better fit whatever its intended
> behavior.

I cannot follow. The HKEY is currently reported via acpi-netlink. My
patch does not change that, it simply silences the kernel-log output,
so it does not spam the kernel log to a degree that it is unusable for
other work.

I see that it would be beneficial knowing exactly what this key
reports. However, I think spamming the kernel log is not the right way
to motivate people to investigate this. I'd be fine with printing a
one-time hint for those keys, or some other option. But the current
state makes kernel development a hassle with all the warnings printed
by the thinkpad-acpi driver.

> It could be to "turn keyboard lighting on" helper or something like that
> (coupled to other sensor), for all we know.  It is a bit strange for a
> palm-detection sensor to be over the arrow keys, and it certainly
> doesn't look like it is a cat-on-keyboard detector...

Palm-detection underneath the arrow keys sounds like the right place
to me. Especially as most people are right-handed, you want to detect
movement of the right hand. The left hand might just be resting on the
keyboard the entire time. Inspecting my own usage, I'd say the lower
right hand side of they keyboard is the perfect place for that. What
makes you sceptical of that?

I checked with the input developers, and there is currently no hookup
of any similar interfaces in libinput / xf86-input-*. So no similar
prior art that might be of help here.

> Another good place to ask around for such information are the thinkpad
> forums, they are far more windows-centric, but there is a *lot* of
> thinkpad experts lurking there...

Which forums are you referring to here? I am not used to debugging
thinkpad acpi drivers, so any hints are welcome.

Thanks
David
