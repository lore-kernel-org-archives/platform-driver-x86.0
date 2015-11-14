From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 2/3] dell_wmi: Use a C99-style array for
 bios_to_linux_keycode
Date: Sat, 14 Nov 2015 10:30:57 +0100
Message-ID: <20151114093057.GB25957@pali>
References: <cover.1447479930.git.luto@kernel.org>
 <c97f6a3b8c48eef0312db51e06a266e3ffeca620.1447479930.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:33925 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001AbbKNJa7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Nov 2015 04:30:59 -0500
Received: by wmvv187 with SMTP id v187so113167742wmv.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2015 01:30:58 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <c97f6a3b8c48eef0312db51e06a266e3ffeca620.1447479930.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Friday 13 November 2015 21:49:31 Andy Lutomirski wrote:
> It's currently hard to follow what maps to what, and it's hard to edi=
t
> the array.  Redo it as a C99-style array.
>=20
> I generated this using emacs regexes and a python one-liner.
>=20
> Signed-off-by: Andy Lutomirski <luto@kernel.org>

There are no function changes in this patch, so

Acked-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
