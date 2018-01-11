From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: platform/x86: thinkpad_acpi: unhandled HKEY 0x60b0 and 0x60b1
Date: Thu, 11 Jan 2018 08:50:26 -0200
Message-ID: <20180111105026.t6zhi5sadpkzb7sm@khazad-dum.debian.net>
References: <CANq1E4Q55Z9WZ1qPhpmbtXGLb2oPcVst2Xo3YLnxtbt6d6WK_Q@mail.gmail.com>
 <CAHp75VfPR2Aj3ucmsoNtiJ96UBRzg+y6nCfU3d3ZuJZE5pUehg@mail.gmail.com>
 <20180109202448.zd63xjr3hth4tzru@mthode.org>
 <CAHp75Vf_iSR-xTfOdoMab81OCHnWd2vRxdTZon_q=7+E+MzOKw@mail.gmail.com>
 <CANq1E4T8-j0kXGMGhwvyg93bKxAG8QnEOP84E+tq7UndC=cSMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:50179 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754793AbeAKKuh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Jan 2018 05:50:37 -0500
Content-Disposition: inline
In-Reply-To: <CANq1E4T8-j0kXGMGhwvyg93bKxAG8QnEOP84E+tq7UndC=cSMQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Herrmann <dh.herrmann@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Matthew Thode <mthode@mthode.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Thu, 11 Jan 2018, David Herrmann wrote:
> On Wed, Jan 10, 2018 at 4:03 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Tue, Jan 9, 2018 at 10:24 PM, Matthew Thode <mthode@mthode.org> wrote:
> >> On 18-01-09 22:16:10, Andy Shevchenko wrote:
> >>> On Tue, Jan 9, 2018 at 3:19 PM, David Herrmann <dh.herrmann@gmail.com> wrote:
> >
> >> I've been able to trigger it 'at will' on the X1C5.  If I hover my hand
> >> just below the arrow keys I'll get the first signal, after I take it
> >> away I get the second one.  There seems to be a delay in when I put (or
> >> take away) my hand to prevent spamming the logs even more.  It could be
> >> to sense lid close, but there's already another sensors for that I
> >> thought.  The only remaining thing I can guess it that it's to detect
> >> your hands to turn on the keyboard backlight or something.
> >>
> >> I don't think it's related at all to the fingerprint sensor as I hover
> >> my hand to the right of it.
> >
> > Just realized that it might be an ambient sensor. Your hand makes
> > light goes differently to the sensor -> hardware sends an event.
> >
> > Whatever guys, feel free to submit a patch when you will be sure what
> > is the source of the event.
> >
> > It also makes sense to discuss somewhere near to thinkwiki.org I suppose.
> 
> Indeed. I can reliably trigger it by moving my hand on top of the
> arrow-keys. 0x60b0 is signaled when hovered. It has a latency of
> roughly 1s. Once I remove my hand, 0x60b1 is signalled, with a latency
> of roughly 3s. Overall, the sensor is quite unreliable when I actually
> use the laptop. Sometimes to a degree that it does not react to
> anything at all. It might really be some ambient light sensor, which
> then gets confused by some unexpected lighting.

Please someone test this on Win10+Lenovo drivers to check for intended
behavior... otherwise we will get crazyness once the underlying
implementation improves/changes to better fit whatever its intended
behavior.

It could be to "turn keyboard lighting on" helper or something like that
(coupled to other sensor), for all we know.  It is a bit strange for a
palm-detection sensor to be over the arrow keys, and it certainly
doesn't look like it is a cat-on-keyboard detector...

Another good place to ask around for such information are the thinkpad
forums, they are far more windows-centric, but there is a *lot* of
thinkpad experts lurking there...

-- 
  Henrique Holschuh
