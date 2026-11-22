Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795347198;
	b=A0hLihXNeOp6SwhlN4sFiJ02croPpq5squQZAvn3RaZ87Y3o4Di5igkaoO1zmmayiTn4
	 b5zbI0IaROARUenkC1kALJtseSX49OgnlxApUjqW8mRJ40RZrMY4v9goxulNvhNDMthzJ
	 /7mQ7pH72R3N5Kd+I1POVwlMVBWmGp6pnoELkX3Nu0rz1Fucn1m7s0himhGq0mZnUBxcq
	 R8EPirKeOd4gA15oo1uspFcFmZQhMiQCR5YK3oSOqJKaj/rcBlhewj/G/IaxKR55OJLez
	 1+Dq/RDxRawUfSDUFnCNmW0xQ0T/YFUuY298FYO2ne5McDMkDfgk96kne3uA6nGztyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347198;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=OWJZvJF97PyJJA9qKFe3vk9WBlv8TeagHe/2VChyqYU=;
	b=OGss0CwbSfQhEny+00m5l8e4xepYe4TXEsf5DiCaup0vSyFHS5Da5QNnzwp+x/5UQrlE
	 5DP8OYglrfD14X0n1AKQpcTGAYBblxITIc9Ja1xDHNkRPZ95hGDTsCSZTMQEb7Ac95f0h
	 HS0I+vAae9gLbeRArhasL+AI+lryi9OtXi9I3HciSPv4omFaliJQslfHXUIVSZuGCh1sF
	 oxCx3McDOtkd41evSdptPCH5VcbZ6liLRPpu3N0eEyoZYrlZLjMPX1j8Giy65AqtmPs1t
	 NS5dZbMPGg+6+C6pD0ivaPRfepqT+GCXQCO8/sK96Bs6//jkeP/AxpHYXiZnXxJKQaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b="UwMCfVB/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E87B606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 11:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E87B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=UwMCfVB/
ARC-Seal: i=1; a=rsa-sha256; t=1795347194; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kYLwjDdBQTUcEEUO4SGOzcH3YGA7/u+WNvafJlQhcGJ3IXpDhaOO0xNZ8F53aHb57f3j/LUcpiww650KP9a5jrwQak2EKY2pCDQ5CCAK1lkR8QZ38+AWj8uEiNCnjvF57QjKhhU95FDi9ap31KgCbDAaJDIdCNYExXJuyeaVWo4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795347194; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=OWJZvJF97PyJJA9qKFe3vk9WBlv8TeagHe/2VChyqYU=; 
	b=MWECixQmVjo3hJL87IOs+qqCWT03mVE8IaMQ7M7jkuF2V5aL4AMMraEAx8TYRgTC1VYXqDtw86xZFhp84rrLz/Dwc2RLgWvReCYOfTCXF1dbWrL2wH9lUS4EZl9o2Gxou1eDQNkjoG/Woetj3yCUPsF4DXwD9anzxuNrDJxNAbs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=UwMCfVB/dsu5+LvyMuwWYRtmQK4RUHBAG0nW2pSMU+/ZHG6MXojiuLnoCIo13t8t5kpjMHTclpfyX+Lka5ELhQLMfsIZJWyjLStDysNnffK5PgUZX6XClgUkqwFlwi69XbcMG43RWbbFZKT+Ch+XPL3bwu8UYAcw8lgqijvixe/js5cwC/MGWpYNKJguiL5CtgGSpgVXNyC5pnkenlhPQd3IrR53tTb0D0b0mU8Nfl+lne6JzeBzYHF60mi48KbFJiUtfxrjaPWc/ct6O3u5ETUG9aMJKD5noR3FpLMZoXVoDqhC6EsRsaVVG/dxcykPijhHfxoH3XxVCzBQ+7jzZQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=OWJZvJF97PyJJA9qKFe3vk9WBlv8TeagHe/2VChyqYU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795347191522171.95950337813008;
	Sun, 22 Nov 2026 03:33:11 -0800 (PST)
Message-ID: <d0ea78f359fb06fcf1e7b57d6062c4c67dd70dcf.camel@rong.moe>
Subject: Re: ideapad_laptop / lenovo_ymc: keyboard backlight stays on in
 tablet mode on Lenovo Yoga 7 14ARP8 (82YM)
From: Rong Zhang <i@rong.moe>
To: Eduard Aliman <edialiman20@gmail.com>, 
	platform-driver-x86@vger.kernel.org
In-Reply-To: <CAA4HgYKab7_GMCNdHF9+E=9ECVBHRs_axefeCOnZbUNUoyVSoQ@mail.gmail.com>
References: 
	<CAA4HgYKab7_GMCNdHF9+E=9ECVBHRs_axefeCOnZbUNUoyVSoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 19:28:05 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Eduard,

On Fri, 2026-11-20 at 03:58 -0800, Eduard Aliman wrote:
> Hello,
>=20
> I am reporting an issue / missing behavior on a Lenovo Yoga 7 14ARP8 (82Y=
M)
> running Linux 7.3.4-300.fc45.x86_64 (Fedora):
>=20
> System details:
> - Product: Lenovo Yoga 7 14ARP8 (DMI product_name: 82YM)
> - BIOS: LCCN26WW (06/25/2025), EC firmware: 1.26
> - Kernel: 7.3.4-300.fc45.x86_64
> - Relevant modules: ideapad_laptop, lenovo_ymc, amd_sfh, amd_sfh_tabletmo=
de
>=20
> Symptom:
> On Windows 11, folding the laptop past 180 degrees into tablet mode disab=
les
> the keyboard and touchpad AND automatically turns off the keyboard backli=
ght.
>=20
> On Linux, SW_TABLET_MODE is reported properly and GNOME/libinput disables=
 the
> keyboard and touchpad as intended, but the keyboard backlight
> (/sys/class/leds/platform::kbd_backlight) stays physically ON.
>=20
> Crucially, even a userspace daemon listening for SW_TABLET_MODE cannot tu=
rn
> the backlight off once tablet mode is entered: writing "0" to
> /sys/class/leds/platform::kbd_backlight/brightness immediately after
> SW_TABLET_MODE=3D1 changes the sysfs readback to 0, yet the physical keyb=
oard
> LEDs remain ON.
>=20
> Test log (listening on both SW_TABLET_MODE input devices while folding an=
d
> unfolding):
>   [ 2.681s] Lenovo Yoga Tablet Mode Control switch -> 1 | cur=3D1
>            wrote 0 -> readback=3D0   (physical LED stayed ON)
>   [ 2.763s] AMD SFH tablet mode switch -> 1 | cur=3D0
>   [ 3.748s] Lenovo Yoga Tablet Mode Control switch -> 0 | cur=3D0
>            restored 1 -> readback=3D1
>   [ 3.803s] AMD SFH tablet mode switch -> 0 | cur=3D1
>=20
> Note that "Lenovo Yoga Tablet Mode Control switch" (lenovo_ymc) fires ~80=
 ms
> before "AMD SFH tablet mode switch", and by that point the EC appears to
> already ignore physical backlight changes via VPC0.KBLC (KBLM/KBLS).
>=20
> ACPI DSDT notes for this machine:
> - VPC2004:00 exposes Method (KBLC, 1, Serialized) which writes EC fields
>   KBLM and KBLS.
> - EC0 has Device (CYMC) with _HID "YMC2017" and \_SB.WMIY (_UID "YMC")
>   exposes WMAB returning EC0.PCMD.
>=20
> Is there an ACPI/WMI call or EC command that should be issued before or u=
pon
> entering tablet mode (or a quirk in ideapad_laptop / lenovo_ymc) to turn =
off
> the keyboard backlight like Windows does? I can provide the full acpidump=
 or
> test patches if needed.

Please test
https://msgid.link/20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe with
ideapad-laptop's module parameter "ymc_ec_trigger" set.

Thanks,
Rong

>=20
> Thanks,
> Aliman Eduard
