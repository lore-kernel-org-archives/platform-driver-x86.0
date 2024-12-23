Received: from sonic312-28.consmr.mail.ne1.yahoo.com (sonic312-28.consmr.mail.ne1.yahoo.com [66.163.191.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A861C1FB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 01:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.191.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734919062; cv=none; b=HhDzBg54JMacJwsKzoTuxUDQYjrmDCVRJ0xiDpXopKR0XHH7Fv565XudLNxB2TjelITRQG7Z4dYOOCINmf5Niw4KD22CkBQ803ylwfjIOKB3DivXPWwm/pbbhJwmCmVT2CTu6eHn24b/EBI/Dg5NCl4Wqw2rFogDAaJYGhLmiQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734919062; c=relaxed/simple;
	bh=rMkpOJgM1X+w2JwJpghF6n1M4pb6f9w2kVpfLU9Ewjo=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=VARZNyTJTe86Wmf6gpSIcPbaiysU2dv989OwfaH4h+l24iEmvGEhvXZ/cLWlPmuoYwXJm8wqS3WSqeAfVtNICEE4+OfODOV1CRdaniGGg1KrOi1HQHBfDmfoL03PVBfH8SMuHwy+BkadPkEAMy8gE9mX3l/v3wew+7CHj3WuIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net; spf=none smtp.mailfrom=att.net; dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b=f0dOeE1R; arc=none smtp.client-ip=66.163.191.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=att.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b="f0dOeE1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1734919060; bh=tZm19pZvs4nQ9v0ZV34Uo2h2ffhDMaQuJAFp//Jc3c8=; h=From:Subject:Date:References:Cc:In-Reply-To:To:From:Subject:Reply-To; b=f0dOeE1R5qMCfxuhLGSNkaKEofMfUl/TCtlmzNklkWmT222JhbT4Vg5+eIQoroamFykjCRzM3bW9g+vsOe+3ToNAU/uApMd4AFUfqCk5D9iGl7wpigLsfxKwTtPd0B2tzRmra9IILst3/MH2ukLZKMkHTu6Y6+6PU1goBf23n70=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1734919060; bh=C/C/fg474pAVHSN7Y8RK2yU3PoDM0W6+vf259rO8QMv=; h=X-Sonic-MF:From:Subject:Date:To:From:Subject; b=fy4nd5P+HDqgvCzJExciySgnR8O8OKWQT063fI3GOCPHTKS6pcpRXZD62PDwIHtwIUzvzdR/T6e3GNsMg3xdMJHKmtze61kBw5ZuMFh6DhiVWUlgrfBm9EFU2kyVPZ1FTalNxAemoOZJMW6VtGrdcjt1C9bGd6atuHPfRL3TJJ+Sefz/l1Rq+gIvLkEyXFWggRU7sgYKUar26mPlJPoE8sPzMflQ24GZdblVgROyHJ7a8aYq/SzmR8g0mC3A1IPtRIqn12g2A0ZpNtl4z9Hi6IOWC6E4CHZqkZJ7yQ4JagQlElqPS73IHAo2fvm24d9BjoZ7Y13funxSC68C/gOQ0Q==
X-YMail-OSG: mSX_fCAVM1nXD_Aw7jLoRCuG.e.49UlgBzxIAw0NVqZ5WTq57a5JuG7wD62KsgC
 yTLBMF9Bb0Ga1WcY9IkLmIbCD0vPePVOGeTzOXZHpdxNMcgdoQiulro1LIV1uKkQCe7R7k3sSlZl
 nwxjDob0.05_0KWyIhhAhbzt7NMgrih9Z3ilP_oQ8CPr30WdvzcRK3.RcW1rhKaY0.GOcq9CqGTS
 .qEzaB4wxM_W_u4XHVJbo07mzj0iXsUJkRcpCZZbXw2l8mlDMVZsHjpUmszJybF9.TV70kj0xK8G
 _IJHt0Xx5VPGLTtoKJBwWpkuAs_JwX9ugMpJg._SwBaVKGWRHwL49xtHfZgBQyF.hwu3nHfnWrom
 BUtinMxy3VRZnCNAcIbNgCi_kg.Ewe24mWSuFN8Y9fiEuaQxcRvtfH.6ySjXpuNFm8YjIKnywSGh
 QRkAogYKHdjguIXsbyKRyESztTYOpBk5TOjnUMIgOLiHYS3EBVXu0P73GusM9LXKXgslPK3w5.Rl
 TVKuxPdheMBGnYpivryPTK2uDDrmDQfpAMQP5HUw.d4iQcLZHIxFYB8TjKulC2tumObJPMZKq9H0
 gpIQKCL_YiijWxCAQ6tDY0nJzeAf_oZ7CW.YDkVmXQ8KtuDXJV35AWgHxMHpliZ1if4ni.lvcVe_
 8PewRFyVgDRdlAwDz3b9aOCprVWpB4KMBsuh0NBmxWAeOecJ8JIf5IbmPzxHsETfQDcnCTUC3Q_P
 cGd_mk1mW7t2MoWk_iDKzkHVq4FZuUpo3AROR6Vui46o3_t3EefeWpEkghoyAocl5V2dHOXO.Z6K
 ki5kVBtFbuiMC3SILEiJW7tIXhV_OU6VPOGEMbP6CRCxZwx4iS_hgpatmJ6dhb2TBiVq36TdhuqC
 DD7Tku.EC6tHivlA_L5TEai1qZv64C1hdxfjXbSoZSH3JddHY5_z3al4Vo5sy0m87BvTUH6AymWG
 hSCeZ8S5lYJd448_oi6Tjyhl6UFx07xq4ShF7aGwNQFERzRv3IufGql3FjKD.Y8tjkj3guyO2t10
 aFsbDOTcp1dMMg7Oep8zBEwjtC7S2_Kl..UiR3acC6WfgkxF6LTi_siWgr1lqeJk8gzq3E0NPeNK
 3gC_pzUORHRGBqmDQzQlzYY2xyyHuhXZ7VbCMfHyiiyKbxUts6FOENqcImIHpR5dJ.xygKuU9nyI
 wYEZDUuGSUPZl4mv_tdjaGDs8SWnSNsNwJsRjo2J4tfQLE4CtPAa7DZY5WoyNrWXtc.mswRbmzm8
 7uuGvDcav.0HOItMMHp_NGBrTcI7wi8ykJgt.BRSZVUcF5hsl1K3Ox_kDyK1ofwT4L_XXssvxLLQ
 UNp7bLLkYO0yrnmbveRtuEdaAkMST.okhRcpN5zzCctMhhSHtKkjIgL54zt9NtXxr4NlB.AEtnCj
 5rFwuWcKczo1BnJDODTgZbRbMOkeIjA0xSRotCAMGWGybhyrER2M1aGFwwQKqeZ59kF7Mzoo5hlO
 4QdiT8JCgmd5btmlipAlOviFoPrdi24jOrEOC0MG_wRbDiihEUIU7B8gE5BSrFbJ.8PGZOm9Z4Q7
 sNgN3JN3Ae.Y5yEF9pzAJYykd6LDGfAbz3bqjBn95TM0yRsQASVeIdPXeuvToLeFh6PNvLGXFByU
 1qOV_FdXcqMEMZAB8OMAecqFuA3OQeK1q21V.PS_X1FMiHDjJtVIL_k_u3aJHNk97APjlWOp9.vd
 fxfYr.9YXlkiLBYgrwsB5XAP5qfUVmh_3N2UKZ6K.3sNPV8F8aRwwYxoJf._RNc9xUaew4Oy_MI9
 h3FBLKnUzs.6cMQkWdxS1ZMcP01_wtk3_b3Hi0Y5BakGQlyPYvSdYPE2s_Y8fR6PgIZaiZLyOVwS
 oGXvESREYUV74GaOrZNvayd3Snrra8E7wqJfm4j4B91gOOEqsZkaxhgJd1obo.Tva8esLS3u9VUE
 nVpUdbsn.NX_1m1wvyEmrMN6AXSTmRpVZIv9t4Ji04YEO6UBEKOG61cvi30kg6tAZBdFhGoOwEct
 53rnL.TVpw4ox7OKJH3jIGIv6sKYRHRWrYkrfbx_JCJJRW9NUP59IxrkEforV1WsASnwO1fe9W4y
 KR89nv5tnWP0YQxKXkaqIPv6NY2TxqAF6xg9J4BckWyheOrSTGUVpmu4OH0e4cHnoHvu0N1NbPNr
 1YBC2R72UKUsLPLi6Lud9Uzomsfhh0eyJWChzXtsDtxgBaTYMFF4BC5Ie0yt_ytqM27luHD0lFLa
 X3.NCgwvzl6jLZlqp7dlqUk_Shs9OR38fujjoSeaHXsT2J9bLO32fkrQ6AuLg
X-Sonic-MF: <sbalfour@att.net>
X-Sonic-ID: ab18488b-fe7e-4761-9a6c-7dbcf9ba8b4f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Mon, 23 Dec 2024 01:57:40 +0000
Received: by hermes--production-gq1-5dd4b47f46-bwg5p (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 46ac1782d95e70f4e9ce5f83321ba22a;
          Mon, 23 Dec 2024 01:37:21 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Stuart Balfour <sbalfour@att.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Hotkeys disabled on Asus H7606 platform in hardware on bootup
Date: Sun, 22 Dec 2024 17:37:10 -0800
Message-Id: <D215090D-C185-4AAA-8BB7-31566F6D9C82@att.net>
References: <bc3db910-419d-48f9-ae8a-f29c81e066fb@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <bc3db910-419d-48f9-ae8a-f29c81e066fb@gmx.de>
To: Armin Wolf <W_Armin@gmx.de>
X-Mailer: iPhone Mail (20H350)

I am on kernel 6.12.1, though I downloaded asus-wmi.c  from top of tree at g=
it. If you are referring to the patch in Sept. 2024 re OOBE near the bottom o=
f asus_wmi_led_init, yes I rebuilt and tested the driver on the Asus H7606 p=
latform, and it did not enable the backlight. That=E2=80=99s a related probl=
em. Can you provide a URL to the patch submittal you refer to? Specifics rea=
lly help here.=20
Thanks.=20

> On Dec 22, 2024, at 1:20 PM, Armin Wolf <W_Armin@gmx.de> wrote:
>=20
> =EF=BB=BFAm 20.12.24 um 20:28 schrieb Stuart Balfour:
>=20
>> I have an Asus Proart P16 model H7606WV Ryzen laptop. On Mint 22, kernel 6=
.12.1 (but later kernels are similarly afflicted), on bootup the hotkey func=
tions of keys F1-F12 are inaccessible. Evtest for event7 (hotkeys) shows no e=
vents generated for key press and release F1-F12. Fnlock toggle Fn+ESC is in=
operative. Fn+Fxx is similarly inoperative. The problem is that the hotkeys a=
re disabled in the hardware. They work on Windows 11 24H2. The relevant driv=
ers there are contained in the Asus proprietary crapware. If you don=E2=80=99=
t install the crapware, or uninstall it, you may not have working hotkeys. O=
n Linux, an undefined (asus-wmi.h) ACPI device id is associated with hotkeys=
 and that device is undetectible to the software - querying it returns a pre=
sence bit of =E2=80=9C0=E2=80=9D.  It does in fact exist - it took me weeks t=
o find it in the DSDT. Even experts could stump their toes on this one. The p=
utative device id is 0x100013. Asus released this platform mid-Aug. 2024. It=
=E2=80=99s likely other newer platforms are similarly afflicted.
>>=20
>> I=E2=80=99m close to a patch in asus-wmi.c, adjacent to the recent patch f=
or toggling the OOBE device during driver initialization. But the device thi=
s time cannot be detected. A =E2=80=9Csecret=E2=80=9D device. I think this f=
ix is going to require a change to the ACPI. Poking an unknown device is a r=
ecipe for unpredictable effects. First I need to get this reported as a bug.=
 Where would that be? Then how do we fix something that actually requires a c=
ustom platform-specific ACPI?
>>=20
>> Thanks for your attention. It=E2=80=99s been a long haul to get here.
>=20
> Hi,
>=20
> the latest 6.12 stable kernel contains an important fix for asus-wmi. Did y=
ou test it?
>=20
> Thanks,
> Armin Wolf
>=20

