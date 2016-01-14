From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Thu, 14 Jan 2016 11:29:20 +0100
Message-ID: <20160114102920.GB5473@eudyptula.hq.kempniu.pl>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35703 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753621AbcANK3X (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Jan 2016 05:29:23 -0500
Received: by mail-wm0-f54.google.com with SMTP id f206so336040911wmf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jan 2016 02:29:22 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

> The dmi_walk function maps the DMI table, walks it, and unmaps it.
> This means that the dell_bios_hotkey_table that find_hk_type stores
> points to unmapped memory by the time it gets read.
>=20
> I've been able to trigger crashes caused by the stale pointer a
> couple of times, but never on a stock kernel.
>=20
> Fix it by generating the keymap in the dmi_walk callback instead of
> storing a pointer.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>=20
> This seems to work on my laptop.  It applies to platform-drivers-x86/=
for-next.
>=20
> drivers/platform/x86/dell-wmi.c | 69 +++++++++++++++++++++++++-------=
---------
>  1 file changed, 42 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index 57402c4c394e..52db2721d7e3 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -116,7 +116,10 @@ struct dell_bios_hotkey_table {
> =20
>  };
> =20
> -static const struct dell_bios_hotkey_table *dell_bios_hotkey_table;
> +struct dell_dmi_results {
> +	int err;
> +	struct key_entry *keymap;

Nit: keymap can be a const struct key_entry *.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
