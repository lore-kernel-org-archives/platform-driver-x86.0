Received: from sonic312-26.consmr.mail.ne1.yahoo.com (sonic312-26.consmr.mail.ne1.yahoo.com [66.163.191.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093AE29A0
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Jan 2025 14:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736088354; cv=none; b=S54WInkkXHjGzASnW2Ppvx/cOL9PCga1nUBah6DESzvdPUMbjw/EnMWzovn5ivpEEHYXEbvtGdrun1pcdXzRDPVvprSEtg9pfzX4uP7sHdTOmumUk5+r2vw2G6A7DMMsJKsWz5Iv6BGxGC4Ltgjaob/Pg8JK5G+Y02bV8vyiTj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736088354; c=relaxed/simple;
	bh=EjZ6Gtou3V2Pj9xAYS4s0a7wvTgwZfsJZtDs1Z4/ES4=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=f6/PPv7SI1vQfNjuvs2tiQP/5GDar9m4AIQ0tKjryfbtGB0h7EEtj4br1mPo6UEcCsAEpCP/KkM2gSs26l+rmlQ8BfJejCHwUvd+U/+qhhD9MgqMoRlU1VLggw7xIPli/EXk43jY59TTRSxRFAimDzl6jh2UxkJN9X4vWqH7bY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net; spf=none smtp.mailfrom=att.net; dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b=GaCdcGv/; arc=none smtp.client-ip=66.163.191.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=att.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b="GaCdcGv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1736088350; bh=EjZ6Gtou3V2Pj9xAYS4s0a7wvTgwZfsJZtDs1Z4/ES4=; h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To; b=GaCdcGv/7wdLBg4N1NDw4ssKqQieBOHAEQC9nrBC15Ksv8FVygKi3gSYnPkHD2WZKa5WBp2USCbBJeymNTDQ08N/O2eRBcSrF+GIpIFXInaxqrsg4wnDjYtXp9pcauLgW0vc2O/+7lmI4RJbvyDRhp1hlxQ5paILks5pOFbREJI=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1736088350; bh=jb3Hm8ykf02WWH1hTGJwINijwuVOeZAVaumr7ZT2tSU=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=Pf+0ZaEn2+Q+u3j/V6rUEnCk98lrgZ5iI06Genf9H9j7SsoUK/55KvR2xUdWwXfcBN5kwDXIM8pN25UFHRjDgc10QxSmAtXNhOMKGgXW+y2gEHNWSrgm1ljPaT90itmW868c2jLkaV6skHlSxqaG41+pwwjOFunCvWxt3vZyNGqFd5NuAnhmHtAzPU1+2FywGRvkltOBgpYPTM+mJ0ko0rDneAtrXI+9kRYzY1aHY5BPlmuPZFe112XbeUQ3tJFsdoN6e8qSzb7DGxHst6flyWBmlWKyuOwn7sH1aYlgvLHTuSi+f3LkYwGizDSUT/5MHvqKvuw1XV4BIjQK3l/N8g==
X-YMail-OSG: IVe3fzMVM1mB6VuVc7yqYxo9z1jrJnJ0XgSqDDRU9Qkvgkv19l.11iQYiaINPdk
 ZvSnw.7svozUSJb4pEfmWnQ3LGJ9QvoHTEbpEw9reTcryHhz70c0Iz6Nyyoo9dUJiJdiTz.22J.n
 oboaatIaCKDU8phFTRcUjQc5jinmc9cAFeMy0S1cNbTze3psPFC54IJsgG3INwRGG0su9_QJwV.n
 nGVORt8KBZJyK9w09i9bnh2anRRtXaabSQveXSfILf0madzlOLw1rxLNcQcVnuQg3Djq1xIxeDvR
 fww.WevQgySk0kELAZi_yOLwrEt32ZBQ5mwvhzSyRynTTP7TaHkbMflaImf3j4398BXX_bVljlj4
 ib763eBssEtFnMamTot5N5Bd6_eMUNotOALRkdeYYkFb9R_H0sD3g2rUSxOPgHuwN4zK2lKeDovy
 Eefdljvmjq5zGPRs_JL7PXEAbs9fzhSHXns4iIYS8hZ07DQhZzEQnm_kp0AG_jYTELY0iQ1hdGfZ
 uArMDjGJGP8mUvz14lUvEKgQV9NfP7AfEYL8F2bAn48u5X048cPBrs0HzEmg68f1CzL.FDC8muMV
 zF29cNzfBL7dtznt5jgKaaqtTt0_10LHi9cVsV2hkcfhOy3crCe97_0iZEFVc3_Jc8r8XIdF2oZt
 3wfM9TvaeFTQr6vqaXWnYM93X67ei7bS84.pfJaKXAtL3z3rAcHJQkbQwHoJQmvigN6rlo7GBxGH
 Rs6vaSW_jI1xr99o9wW11yqVjk4k9DguF_6OZSp8yJ9fVP8dcHMa7Pn.z0iGnsnkj.usN1wI.sNp
 QGoNvdsy2a8Uojc8eL2B4dU2iJmuladNkkBMFPYa38C_gbdLLBYurO2Lg53Gun6BOjd8PNoWKiO.
 NH5qdyTdSBCgfGQoNedJOxaHxilqTwo67dlI0Nd.Y1nXFx3IiFnWwxbcuVVc_pFZqP5oIJfMNAuN
 S4gxBJb_5_rDdGj4bIIY.M591PGVP5FSjTDqfkEAiQ_bnFlDSBYxJW1Ywcd2V024d9gU6nXnWsOz
 dMcfUwstgnJ5WLNClF6pfEb1.mxh1TyHAJMBFFceuLGvwsroNo4CW6tv2FgGYolMFwn1B4cwV9ha
 BolbJiLbScMHU8lRHYi8mNlNx0SpwUNHs7cvhG8vLbN9Gpbw3lPw6zJAri6bsYRBN7WK815cC4Mg
 VtKXQ_babn2f0YU7x6CuI2Y1yhp2lZwG_FpYlQcn3y0uTfQarq_vgkIrYwEr_8Xxb75NyCurc5C_
 ZddjFnEoijkR04v5VJd1vvNHwJHlJu8O29L0HJ7GrQ9BujFiTg7i3KGQWrm9r1R3rbKbns.UloU_
 .ryn_xxCPBrUkyqQ.g9XI_lfifdaaeKHZdNhsxFC1ztoQfHm_3G.aEc7pf3YgndudC4PNFj_PHY0
 qmJ1HW77hmxuT.2TDISwYiT7nhhiRB4GsiNcBDsGdcSUkySeHAM_3_25utFnQGCx2stgW7VZ_U_.
 hm0ghSjQCFeZs3nbinycTtfdoPGAq.DF8ziHZLPLLEdO8rczMDdsHuTcXZ4xHd6HwGrUCXAEFw0y
 YFUY7KRQbjuwU8G2pih0ZM33Gy4BaJ7H6LtNPS6Qq1X9IiDWWAKvqW45fwhd81xhgKq9eYwTZKKV
 4bD9qZ91yvrRNi6HPklYQncZdTJn3D.6VC5DRxXpklPdVy22eEJLvdkMqzsytmCC0P_Q9Jknw9Uw
 bCq__8PNIPUDifpmLyy4ePae.ACxkx0KQ_nsamCX44NjOOPGJrLsBPBEhlxp0wo4PeYwwRuOLwpV
 NOIrEdNsYohh.MkzZFF6kW4kFK2d8hr1bgLPd6mrYAmjSOciJ3eLnKffg3EDFYSV.p34KBSYzSID
 nH3SvpmsPt_yels9VQTHUO7MRNwKxeC5Tf6jdp1QIsaYZgEZ3OYCqVduy3CpA9ufu4MkXJeqCo96
 YPI0bn6tHd75TqLrDyAIVgWSqnf7XBDaX.pz_uqxYRWBb7JE8dyRSRHyThGAM.vW6SUzRZZlxuOT
 2XngZmQd4ELpjO9LDN6Do_SPvhyaoo4n_SxH1.ZeGI3BzMkMEVcVgF9JblRSX2gfPzfalPvRHIPO
 2G6q9Vrjnq2GmYjvhG8BZ2mp5dFU8FZl0DBBD9HnPpzezQh5ehgL9LwmoH9d6X9h0rRdt329g3Gd
 0eUtJxTwk6H8pHwq7L387vIIvirPtjNsIb1huHN43fOzQafA-
X-Sonic-MF: <sbalfour@att.net>
X-Sonic-ID: 5e7c81f8-8af2-4a1f-8332-efa41cc872c8
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Sun, 5 Jan 2025 14:45:50 +0000
Date: Sun, 5 Jan 2025 14:31:21 +0000 (UTC)
From: Stuart Balfour <sbalfour@att.net>
To: "chiu@endlessm.com" <chiu@endlessm.com>, 
	"luca.stefani.ge1@gmail.com" <luca.stefani.ge1@gmail.com>, 
	"corentin.chary@gmail.com" <corentin.chary@gmail.com>, 
	"hdegoede@redhat.com" <hdegoede@redhat.com>, 
	"mgross@linux.intel.com" <mgross@linux.intel.com>
Cc: 
	"acpi4asus-user@lists.sourceforge.net" <acpi4asus-user@lists.sourceforge.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-ID: <814215714.9758748.1736087481257@mail.yahoo.com>
Subject: asus-wmi fnlock review
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <814215714.9758748.1736087481257.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.23040 YMailNorrin


On Asus laptops starting about 2019, a new ACPI device id 0x100023 associat=
ed
with fnlock was added. The BIOS option "Fn Lock Option [enabled/disabled]" =
under
advanced tab sets the start up value for the device. When enabled, Fn+ESC
toggles the fnlock mode; when disabled, Fn+ESC has no effect. Two ACPI Meth=
odIds,
one for device_set and one for device_status (DSTS) are defined. Device_sta=
tus
returns presence bit, external bit (device is set by hardware, not in ACPI)=
 and
status bit (bit 0).=C2=A0 Bit 0 is 0 when the option is enabled and 1 when =
disabled.
The device_set method ignores its argument, does nothing and returns 1 (put=
ative
success).

Asus specifies that fnlock state cannot be read or set directly by WMI.=C2=
=A0 Its
initial (default) setting is by the BIOS, though that does not appear in th=
e GUI.
Thereafter, its state may be toggled by Fn+ESC if enabled. That toggles a h=
ard-
ware line to the EC0 keyboard controller, and issues a WMI event 0x4E
(NOTIFY_FNLOCK_TOGGLE).

The asus-wmi driver has a local boolean which tracks the state of fnlock.=
=C2=A0 The
initial value is ostensibly set from the asus-wmi module_param boolean
fnlock_default (if present), otherwise an assigned default value.=C2=A0 The=
reafter,
whenever a toggle event is received, it toggles the tracking boolean, then =
calls
the ACPI device_set method via asus_wmi_fnlock_update() with the boolean as
argument.

There are two problems: 1) if the driver sets the initial fnlock state to o=
ther
than the true state set by the BIOS; 2) calling the ACPI device_set method =
for
device 0x100023 has nil effect. (1) implies that the asus-wmi module option
fnlock_default cannot be effectuated on at least some recent Asus platforms=
.
(2) means the asus-wmi driver has confounding dummy code associated with AC=
PI
device 0x100023.=C2=A0 The ECO flag bit XKTM that would've been overwritten=
 had the
driver been enabled to set the device state belongs to the BIOS 'Fn Lock Op=
tion',
not fnlock. fnlock is not an ACPI device.

There is an overarching conceptual problem: the semantics of device 0x10002=
3,
which is not settable by the WMI, are to communicate the state of the Fn Lo=
ck
Option in the BIOS, not the state of fnlock itself, to user space. When we =
query
the device, we are asking: "does Fn+ESC toggle fnlock mode?"=C2=A0 The inef=
fectual
attempts by the driver to set the device to the actual fnlock state usurp t=
he
defined semantics.=C2=A0 Further, this reverse feed to the ACPI is not some=
thing
I see for other devices, except in cases where the device state is actually
set synchronously by the ACPI.

In case you don't have access to a relevant platform, here's the ACPI Metho=
dIDs
for device 0x100023 on Asus Proart P16 model H7606WV (BIOS version H7606WV.=
312,
the latest and only version listed on Asus support site as of 12/20/24):

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* device_status (DSTS) */
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 If ((IIA0 =3D=3D 0x00100023))
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If ((^^PCI0.SBRG.EC0.XKTM =3D=3D Ze=
ro))
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Return (0x0=
0010002)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Else
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Return (0x0=
0010003)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 /* device_set */
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 If ((IIA0 =3D=3D 0x00100023))
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Return (One)
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }

Here's the enigmatic code in asus-wmi.c from kernel version 6.12.6:

#define ASUS_WMI_DEVID_FNLOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x00100023

struct asus_wmi {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool fnlock_locked;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
}

static bool fnlock_default =3D true;
module_param(fnlock_default, bool, 0444);

static bool asus_wmi_has_fnlock_key(struct asus_wmi *asus)
{
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 result;

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asus_wmi_get_devstate(asus, ASUS=
_WMI_DEVID_FNLOCK, &result);

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (result & ASUS_WMI_DSTS_P=
RESENCE_BIT) &&
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 !(result & ASUS_WMI_FNLOCK_BIOS_DISABLED);
}

static void asus_wmi_fnlock_update(struct asus_wmi *asus)
{
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int mode =3D asus->fnlock_locked=
;

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asus_wmi_set_devstate(ASUS_WMI_D=
EVID_FNLOCK, mode, NULL);
}

static int asus_wmi_add(struct platform_device *pdev)
{
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (asus_wmi_has_fnlock_key(asus=
)) {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 asus->fnlock_locked =3D fnlock_default;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 asus_wmi_fnlock_update(asus);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
}

static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
{
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (code =3D=3D NOTIFY_FNLOCK_TO=
GGLE) {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 asus->fnlock_locked =3D !asus->fnlock_locked;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 asus_wmi_fnlock_update(asus);
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
}

Here's a link to the original patch:
https://lore.kernel.org/lkml/20190418064648.25706-1-chiu@endlessm.com/

A later patch added the module_param fnlock_default:
https://lore.kernel.org/lkml/20210323202505.141496-1-luca.stefani.ge1@gmail=
.com/T/

I'll be addressing this issue as part of a larger update for recent (24H2 a=
nd
later) Asus laptop platforms. But I'd prefer the original authors and revie=
wers,
if they are available, review the situation before we decide what to do.

"If it ain't broke, don't fix it".
