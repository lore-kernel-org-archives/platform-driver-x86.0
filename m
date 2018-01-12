From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: platform/x86: thinkpad_acpi: unhandled HKEY 0x60b0 and 0x60b1
Date: Fri, 12 Jan 2018 10:16:04 -0200
Message-ID: <20180112121603.4k45pbp5l3677jk7@khazad-dum.debian.net>
References: <CANq1E4Q55Z9WZ1qPhpmbtXGLb2oPcVst2Xo3YLnxtbt6d6WK_Q@mail.gmail.com>
 <CAHp75VfPR2Aj3ucmsoNtiJ96UBRzg+y6nCfU3d3ZuJZE5pUehg@mail.gmail.com>
 <20180109202448.zd63xjr3hth4tzru@mthode.org>
 <CAHp75Vf_iSR-xTfOdoMab81OCHnWd2vRxdTZon_q=7+E+MzOKw@mail.gmail.com>
 <CANq1E4T8-j0kXGMGhwvyg93bKxAG8QnEOP84E+tq7UndC=cSMQ@mail.gmail.com>
 <20180111105026.t6zhi5sadpkzb7sm@khazad-dum.debian.net>
 <CANq1E4T1_+qFD4pC9CUbBf6NJQmt1ju0iHwK7K0WC+Ejb-R=gA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58125 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932705AbeALMQJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Jan 2018 07:16:09 -0500
Content-Disposition: inline
In-Reply-To: <CANq1E4T1_+qFD4pC9CUbBf6NJQmt1ju0iHwK7K0WC+Ejb-R=gA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Matthew Thode <mthode@mthode.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Fri, 12 Jan 2018, David Herrmann wrote:
> > Please someone test this on Win10+Lenovo drivers to check for intended
> > behavior...
> 
> I cannot see Windows reacting to this at all. I tried different
> combinations of the ambient-light sensor and the keyboard sensor.

Hmm, so future functionality.  Neat!

I *heard* someone mentioning somewhere that a laptop was lighting up the
keyboard when the hand was over it, and turning it off when it wasn't,
and I though that might be one possible use...

> There seems to be no automatic handling regarding keyboard or screen
> brightness, nor any palm detection. Neither did I see any user-options
> referring to these sensors.

I see.

> >             otherwise we will get crazyness once the underlying
> > implementation improves/changes to better fit whatever its intended
> > behavior.
> 
> I cannot follow. The HKEY is currently reported via acpi-netlink. My

Ah, not the userspace report over netlink, but if we did anything
in-kernel with the information.

> I see that it would be beneficial knowing exactly what this key
> reports. However, I think spamming the kernel log is not the right way
> to motivate people to investigate this. I'd be fine with printing a
> one-time hint for those keys, or some other option. But the current
> state makes kernel development a hassle with all the warnings printed
> by the thinkpad-acpi driver.

Agreed.

In fact, I will accept a patch that changes that warning to a pr_info,
and rewords it to a far less scary "unknown general purpose or
thermal-related event".  The warning was added a long time ago, there
were only thermal alarms in the 0x6000 event range at that time, I
think.

> > It could be to "turn keyboard lighting on" helper or something like that
> > (coupled to other sensor), for all we know.  It is a bit strange for a
> > palm-detection sensor to be over the arrow keys, and it certainly
> > doesn't look like it is a cat-on-keyboard detector...
> 
> Palm-detection underneath the arrow keys sounds like the right place
> to me. Especially as most people are right-handed, you want to detect
> movement of the right hand. The left hand might just be resting on the
> keyboard the entire time. Inspecting my own usage, I'd say the lower
> right hand side of they keyboard is the perfect place for that. What
> makes you sceptical of that?

Because for some reason I thought this was about disabling the touchpad
automatically.  Running on little sleep, here, due to Spectre.

> I checked with the input developers, and there is currently no hookup
> of any similar interfaces in libinput / xf86-input-*. So no similar
> prior art that might be of help here.
> 
> > Another good place to ask around for such information are the thinkpad
> > forums, they are far more windows-centric, but there is a *lot* of
> > thinkpad experts lurking there...
> 
> Which forums are you referring to here? I am not used to debugging
> thinkpad acpi drivers, so any hints are welcome.

Here:
https://forum.thinkpads.com/

-- 
  Henrique Holschuh
