From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] Remove ambiguous logging for "Unsupported brightness
 interface"
Date: Wed, 27 Jan 2016 16:43:41 -0800
Message-ID: <1453941821.10099.33.camel@perches.com>
References: <CANpvso5_jzOgRv25isy0x6HJcTgKP4dabSH-_a5fM-uihdAUYw@mail.gmail.com>
	 <1453937211.10099.31.camel@perches.com>
	 <CANpvso7UtUrRh6cZT9aNYU7J62ofMMhr7S91Wwa8GWPHc3w1NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay0191.hostedemail.com ([216.40.44.191]:47276 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S965544AbcA1Ano (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 Jan 2016 19:43:44 -0500
In-Reply-To: <CANpvso7UtUrRh6cZT9aNYU7J62ofMMhr7S91Wwa8GWPHc3w1NQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Eric Curtin <ericcurtin17@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net

On Thu, 2016-01-28 at 00:36 +0000, Eric Curtin wrote:
> On 27 January 2016 at 23:26, Joe Perches <joe@perches.com> wrote:
> > On Wed, 2016-01-27 at 22:14 +0000, Eric Curtin wrote:
> > > Message gets logged on machines that are well supported.
[]
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platfor=
m/x86/thinkpad_acpi.c
[]
> > +=A0=A0=A0=A0=A0=A0=A0pr_info("detected %u brightness levels\n", br=
ight_maxlvl + 1);
> > =A0}
> >=20
> > =A0static int __init brightness_init(struct ibm_init_struct *iibm)
>=20
> Maybe, but the other logging issues kinda mean something. There are
> many, many reports of people thinking their brightness interface is
> broken because of this logging message, when in reality the i915 driv=
er
> supports their devices just fine as previously stated.

That's why I suggest changing it to show the number
of brightness levels detected on any device.
