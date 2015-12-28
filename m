From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 2/2] dell-wmi: Process only one event on devices with
 interface version 0
Date: Mon, 28 Dec 2015 14:40:56 +0100
Message-ID: <20151228134056.GC7540@eudyptula.hq.kempniu.pl>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <1450991926-20937-3-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:36626 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752298AbbL1NlC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Dec 2015 08:41:02 -0500
Received: by mail-lf0-f54.google.com with SMTP id z124so193540715lfa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Dec 2015 05:41:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1450991926-20937-3-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> BIOS/ACPI on devices with WMI interface version 0 does not clear buff=
er
> before filling it. So next time when BIOS/ACPI send WMI event which i=
s
> smaller as previous then it contains garbage in buffer from previous =
event.
>=20
> BIOS/ACPI on devices with WMI interface version 1 clears buffer and
> sometimes send more events in buffer at one call.

Are the explanations above based on your observations or perhaps some
documentation?

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
