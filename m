From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Add support for keyboard backlight
Date: Sun, 27 Dec 2015 21:14:17 -0200
Message-ID: <20151227231417.GB8731@khazad-dum.debian.net>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:58416 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753960AbbL0XOW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Dec 2015 18:14:22 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2129D202EE
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Dec 2015 18:14:22 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Thu, 24 Dec 2015, Pali Roh=E1r wrote:
> This patch adds support for controlling keyboard backlight via standa=
rd
> linux led class interface (::kbd_backlight). It uses ACPI HKEY device=
 with
> MLCG and MLCS methods.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> Tested-by: Fabio D'Urso <fabiodurso@hotmail.it>

It looks good at a first glance.  But at init you might need to take st=
eps
so that the current state is not changed.  Did you test this?

Also, is it working properly across suspend+resume?

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
