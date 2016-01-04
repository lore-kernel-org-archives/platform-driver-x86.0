From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 4 Jan 2016 12:04:25 -0800
Message-ID: <20160104200425.GC26072@malice.jf.intel.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <1451514461-31999-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55858 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569AbcADUEf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 15:04:35 -0500
Content-Disposition: inline
In-Reply-To: <1451514461-31999-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Wed, Dec 30, 2015 at 11:27:41PM +0100, Pali Roh=E1r wrote:
> This patch adds support for controlling keyboard backlight via standa=
rd
> linux led class interface (::kbd_backlight). It uses ACPI HKEY device=
 with
> MLCG and MLCS methods.
>=20

Which laptops is this intended to support?

Henrique, I'm holding off a bit more to give you time to respond given =
the
holiday season.

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
