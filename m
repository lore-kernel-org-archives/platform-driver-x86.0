From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Wed, 1 Jul 2015 13:48:49 +0200
Message-ID: <20150701114849.GE17577@pali>
References: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
 <20150626145621.GU2890@pali>
 <CAJ=jqub8adCQBWPsmg+Wov0G4WqZbhsjxttWq6CA8Uddqmj4Cw@mail.gmail.com>
 <20150629122953.GF16230@pali>
 <CAJ=jquZr8tPOcL-vr3Q_pYaQZf73-BPvBAoaVjoMALj_sF4rfw@mail.gmail.com>
 <20150630085814.GE27720@pali>
 <CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:34219 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750798AbbGALsy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jul 2015 07:48:54 -0400
Content-Disposition: inline
In-Reply-To: <CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Wednesday 01 July 2015 00:09:41 Alex Hung wrote:
> ATK4001 is an independent ACPI device, and Method(HSWC) is its method
> to control LED (actually it has other functions but only LED is neede=
d
> so far).

If this driver is for supporting ACPI ATK4001 device (which has couple
of methods, not only LED) it is really good idea to name it asus-rbtn?

Darren, you as maintainer of platform drivers, what do you think? I
believe in future this driver will be extended to support more function=
s
and so name asus-rbtn will be confusing.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
