From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for keyboard backlight
Date: Mon, 4 Jan 2016 12:40:20 -0800
Message-ID: <20160104204020.GC4219@malice.jf.intel.com>
References: <1450982818-11694-1-git-send-email-pali.rohar@gmail.com>
 <1451514461-31999-1-git-send-email-pali.rohar@gmail.com>
 <20160104200425.GC26072@malice.jf.intel.com>
 <201601042126.19417@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48478 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752289AbcADUkY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 15:40:24 -0500
Content-Disposition: inline
In-Reply-To: <201601042126.19417@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Fabio D'Urso <fabiodurso@hotmail.it>

On Mon, Jan 04, 2016 at 09:26:19PM +0100, Pali Roh=E1r wrote:
> On Monday 04 January 2016 21:04:25 Darren Hart wrote:
> > On Wed, Dec 30, 2015 at 11:27:41PM +0100, Pali Roh=E1r wrote:
> > > This patch adds support for controlling keyboard backlight via
> > > standard linux led class interface (::kbd_backlight). It uses ACP=
I
> > > HKEY device with MLCG and MLCS methods.
> >=20
> > Which laptops is this intended to support?
>=20
> Thinkpad ??30 series and new which have backlight keyboard.

Thanks, we should include that in the commit message as well as the com=
ments
surrounding the driver section.

Henrique, are your concerns surrounding suspend/resume resolved?

--=20
Darren Hart
Intel Open Source Technology Center
