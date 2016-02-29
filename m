From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 3/5] dell-wmi: enable receiving WMI events on Dell
 Vostro V131
Date: Mon, 29 Feb 2016 13:57:02 +0100
Message-ID: <20160229125702.GH21814@pali>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-4-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:33643 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979AbcB2M5F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 07:57:05 -0500
Content-Disposition: inline
In-Reply-To: <1456298416-29683-4-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 24 February 2016 08:20:13 Micha=C5=82 K=C4=99pie=C5=84 wro=
te:
> On some laptop models (e.g. Dell Vostro V131), WMI events are not
> generated until a specific SMBIOS request is issued to register an ev=
ent
> listener [1].  As there seems to be no ACPI method or SMBIOS request =
to
> determine without possible side effects whether a given machine needs=
 to
> issue this SMBIOS request in order to receive WMI events, DMI matchin=
g
> is used to whitelist the models which need it.
>=20
> [1] https://lists.us.dell.com/pipermail/libsmbios-devel/2015-July/000=
612.html
>=20
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>

Reviewed-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
