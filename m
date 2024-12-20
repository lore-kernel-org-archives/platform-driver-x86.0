Received: from sonic316-23.consmr.mail.ne1.yahoo.com (sonic316-23.consmr.mail.ne1.yahoo.com [66.163.187.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD6B19ADBA
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.187.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734724161; cv=none; b=plEK/EuPD4JLMMIW52qdfYPCqKNqc5YMIBJRAVT/QP+r+7kJyHkWR6bT22f9CWhw0L6Zs2w6xicnIKJbZ4rG9iAk9toeeP1zrhKnign/Ywaj7QdsbpbotDuRxkpHGkeu7pYTwDl3hM/vUZDlzKhdDyNH49R2Iw7sJd1smavUhW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734724161; c=relaxed/simple;
	bh=noo06dvbMC4K5ltv8mj8T/Y6obvf1QE7qDw0FKeDAqo=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To:
	 References; b=TrsmryCUf9U+fZjkxea4prYojA29tIYJ+pF+GQlSHVm4U0b7O1ZKdRcywTASj/NN2zDkZm/vCYXUtA3VU2z/U2F4qdj8/3jaO3asR24nawa0GIExY4cuAPmkeJNs4MQvBHoa8eVeS6iQU97iZ6Gw8yERXL2VE0spOmYpDA9cwzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net; spf=none smtp.mailfrom=att.net; dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b=SQ+MjntZ; arc=none smtp.client-ip=66.163.187.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=att.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=att.net header.i=@att.net header.b="SQ+MjntZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1734724159; bh=dytPMyhlLKy9/If1cnHvWOxmQ2sgAfUVZ4JjXRdF3vc=; h=From:Date:Subject:To:References:From:Subject:Reply-To; b=SQ+MjntZRH/NU/i3fekJImGDu1Ky46uBegPpEATUcjACvwdgC3rpBOf8f/BL+sbE/bq29uTz+elerlEgGHotNf+1QREV+I0JPBoBdFPMrviDy7Tit6zSyJX0PUvLI4zNKb2+UOVxmXEc2gyWkK6NOb4lYpxqQ/GN3nq0rMighUQ=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1734724159; bh=XNzvxvYqvJDyfWqtynf6tYnoT1ZBMCoiKhaktbFS7M6=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=P2rJ/KZkYdEtA9ngl+g3EdU2v+remF/UXFSV5z/6YKG2VLQyFliA1CJJVsYtBtkP6AFIvbZn7IHATjJsZ1wi6v5KJqYYxvA49uodmKPzRqwJizfB4bztPG6ktT947Vrpu4cxy53VTPfO5F8Sop1NiquYBv3Dyb2W9Tb2tucXzki1yPjhX608yGV24TAMUX6nzg0vTS/BVQomofth3DhAJwJgAT+DwBPB1CL4ozXxoWNw/p7d54Kp6V1vFkaJ4Fs7mopg0l0Z2TsvEp35pJ7cjSLFQau8Iyh3DiLHjcMWHnt2TUENssc5d0F6kL8y2SdvN6Z9A2j8lrqQF6M6IyDTAg==
X-YMail-OSG: xTiVSVkVM1mY6RnfTb68ntk66J.6HTAVTMDpNyVqbA1ybBXXgrlLh9VcGbYzX9Z
 OowG5RPBWTzu3vKg6aP5uM0DPdv15lt5vhVTk6t0vRnyCLWoDrW8r43f0pKUZir5ri2hKcqiJL00
 QfzTqzRfurF5nxNSYair86e69j1m3R9rIycWfMjK7Ee0BK6JZka_dRTgTUUBBB0mnD8YCnDRuDNx
 CXVbCIYcba7vgdfOiYT_WXYs_49kDDF76hq44ph3gwzU0r2GHx2kqoHnjltPQX5bnex15Yq51iOx
 1N0shTsSEJYXVAb.2YgqUtbYTgVHCa0fKbojsIo3jJmlJi1Yt0gMbiaz4ynIL1BDWEbKde3VZDBR
 mk1lHEd7M5PO5_zc3D.a8wAxcEfxPzXrct2Tr3ra_VBwIqkXrAE9aYTfht7DSJ8rrz_CkInRB3YQ
 hZ6_ZU8HsxjCl9n1OMKuqE776DWBErd7mEX5C6xlE_MD18p8tmrNwwRUU6hVC65nNhMPC3lfC8iN
 74WeEjzxvPjsSUnMRWhFLFDDOQOqZZYD7UG_FE6zFKGN3enINbyn7_AdCaOmrA4VDEQ_.cxt3qt8
 UFMMBDXD1CA3FBOXLnaBYrUDCFHCsNkaQMY0gln1od5IV4YPzSpCHwHOOy256QtGergQRNnG07wP
 u4tEBOm9GUTSS9f6aPi2HjL8hvjd0C3sh8.6zUHc1ZRuWlmw42SsHCsg2jKFKD9LMihcDAvN2eTv
 2dNc5jskWxl27YyuBZjIyjzWiKo6l.IoCoJxpmLq7AvfVfAabc90JwsR.bBJRTzL2ZdJcdeMQSgL
 g16Uoe7qT0iAe40eWZqhO3KJZ1hbXoCilPgocXxf3P4FyyyMxotjVj5C1Pz_z3uYzz8yi2fFf1Nn
 2_4YHASQE7cU7eeGQG8bad1lLsRvo_aJEr2ORZBNZbFnW1MqOiu4vvjBDByWioWl9CEe3o8qUWGK
 S._dDOnp71.9MrrmforoTs5vGOdO0qEhrCEpePhB54IU3t_PhhZ7gdO6qNQiR1wRgmuKEGrSPC9U
 IX.b7KS.8Zbm6OnlrDtqP7ATKPoR4YdU5nGEqgPMQ.kcvbAEmlHmGT.6FX7nXkVPWH5RY4bMCuuu
 Rxe36QIC7VTuo4GM6CSrcw_zbLJLPUxFVkPP_OWN7SSvtixQviQ4JeJx6g68jQAN4JaORKVhoOt6
 X1guw4G2hV.lUEcPH7_SRx6jt4lAVP9SKEibaF470jlBONCRfEK8wKgfP0zyi0LhDTsfxTMapJuR
 RKx73PM8F14FmqXk82weXqfvS7CfkEVAVTEQj7J6JGzTXR4_KMnBr1O_X6YHbFjCz7uFaAG_HF3P
 yfECld9W4RHkNvzRLBLsUNyR4qS8FohUWCLawasf50VVRM4BB0BRS0NVufUtS19qx8qcKZfg7YtI
 U2UG8Wa.2hvtpSiCVYXYmjiHbUVa_qj0oetxM.CKTf1DqABPlhmictDUCo3GFys6zUdrnIOrYhs_
 N.uoAXS5IxWfj3YYiu5SSMkcSgyNGkwe53kgIfMhZqGYazYE3nj7PNu57k16wNxLcpcx2Nklf9JL
 XVACIRx5GKdgMSsHSz9xDsv.k0Pp7c2LXglSSgraziY4NeLOPBFDR1PBfvUJz9vbco9l98t7DC8H
 Co4ONPophUrlIeIWWWF1cgvYXKTCoSuQUfjkV5.7GRcKG7m_fZYm84BFwoRGLqNPEwSSg651ve_s
 km32j.a5eTLJeH32O2ExCpVZAKrXjSGfSgle__qI9ZDI36SwuDm1E0ZKdCMJDdcIzC4RbtxXbU1I
 lF1Xm6rDxH7RB3aaxMxXqWqXkXdAw8REyWOdNtW_apgQxe6pZbRjOOufO3A9Fkc90ZcSIS9X4W9p
 .JGNSne.4h2LSc9fhOCGZYDRw3NX7R9mXPi5L6n1RwZinWOCLnB8E2zIj1CWIcgvflECuseUa1o6
 MnvB.LkQ8iG9hpOSyWnHbNLRuk.KS0X5Ml90H1WeU_ZKclChjE3xeYX.okwrkobfd41FFnPZwxhe
 XhYznV20pdKm_9fssNO_qy4LigGW1YwOJJXh5PXZ8IYvCQRb7ebFraUQ.qqsBX5u.LO5wIZ3EVtQ
 4ivt8miP8ME6jvxyH.KLthtqP79pGLG9V2qvLuNBD7_XqV07BHTCOJKKpoVYM3EZkjAHMTUFfxrg
 LiErFHx_PPwW0PDRQ20nYERlZ3V3LYYMMXg3wUm9irFBkpgJHgxGa2qfyjnh6ACyD_MzXEMW5nMn
 Sw4xX3VmKspQTWfmNgA8GAaXGuv61ouE-
X-Sonic-MF: <sbalfour@att.net>
X-Sonic-ID: 699ab338-20b8-42f9-b4ca-0e5decf14644
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Fri, 20 Dec 2024 19:49:19 +0000
Received: by hermes--production-gq1-5dd4b47f46-wrqn7 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2b800f48596afa6792716279379f47a8;
          Fri, 20 Dec 2024 19:29:02 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Stuart Balfour <sbalfour@att.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Fri, 20 Dec 2024 11:28:51 -0800
Subject: Hotkeys disabled on Asus H7606 platform in hardware on bootup
Message-Id: <17FA8854-F3C7-473E-B8FA-E0C818531552@att.net>
To: platform-driver-x86@vger.kernel.org
X-Mailer: iPhone Mail (20H350)
References: <17FA8854-F3C7-473E-B8FA-E0C818531552.ref@att.net>

I have an Asus Proart P16 model H7606WV Ryzen laptop. On Mint 22, kernel 6.1=
2.1 (but later kernels are similarly afflicted), on bootup the hotkey functi=
ons of keys F1-F12 are inaccessible. Evtest for event7 (hotkeys) shows no ev=
ents generated for key press and release F1-F12. Fnlock toggle Fn+ESC is ino=
perative. Fn+Fxx is similarly inoperative. The problem is that the hotkeys a=
re disabled in the hardware. They work on Windows 11 24H2. The relevant driv=
ers there are contained in the Asus proprietary crapware. If you don=E2=80=99=
t install the crapware, or uninstall it, you may not have working hotkeys. O=
n Linux, an undefined (asus-wmi.h) ACPI device id is associated with hotkeys=
 and that device is undetectible to the software - querying it returns a pre=
sence bit of =E2=80=9C0=E2=80=9D.  It does in fact exist - it took me weeks t=
o find it in the DSDT. Even experts could stump their toes on this one. The p=
utative device id is 0x100013. Asus released this platform mid-Aug. 2024. It=
=E2=80=99s likely other newer platforms are similarly afflicted.=20

I=E2=80=99m close to a patch in asus-wmi.c, adjacent to the recent patch for=
 toggling the OOBE device during driver initialization. But the device this t=
ime cannot be detected. A =E2=80=9Csecret=E2=80=9D device. I think this fix i=
s going to require a change to the ACPI. Poking an unknown device is a recip=
e for unpredictable effects. First I need to get this reported as a bug. Whe=
re would that be? Then how do we fix something that actually requires a cust=
om platform-specific ACPI?

Thanks for your attention. It=E2=80=99s been a long haul to get here.=20=

