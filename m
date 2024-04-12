Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D2824A3
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Apr 2024 13:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712928749; cv=none; b=F+wBAahXNlcJ5YvKGDotTGcaPm+GjZ3DcD6HN7yang9PLUXNmwFRqf/AVjLssEr08Hf8aIjKmON7KpE5p5Wi3H2g7ldTp8RicxenLJZnbMGywK9aXvTRMYOQFhNBV2MO00X4vVRjtyOkfk87eQr4TGQzSnhF/pEoLJXLO2iG9D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712928749; c=relaxed/simple;
	bh=AQvz3pntucVa7EGnMTaOPPgIQlaGaehsyPNr+XhARbw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lwbgtnl35v54suWXJ8nL/9Lv9UGFvs5XSUuiUKxPV4QX8+oLQE4njsW1jMfB4aVh7SK02n3Nd/9jsZWxoiHz6M8aI8dabCM8sFV59ia9wsEENdwHk7LTokkp7reNTzvWWS1lidiKvlxi14aSeqkPAxYQr5SOlYMPGWRsorL088s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqX+wIN4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqX+wIN4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE2A6C113CC
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Apr 2024 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712928748;
	bh=AQvz3pntucVa7EGnMTaOPPgIQlaGaehsyPNr+XhARbw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VqX+wIN4Tnq9o7uEjniu/kqDVEhE3igJLbQU2jQw8VQY+JowhcXtDlOpurVgEua5S
	 tSMt57hLIkFIpUdca17sTLUVwOIcQuxdO8nrGWJ5mfVK35DmGwOtQzgRoZkOwHahlg
	 bvXSNyKma/BO7wStvCbyig7l2un4iAooZZ2F/YvQcWmx9dcC7cxcEWMRQuX88rD/vT
	 N46clRFr+DyQqFurb//Q9S0JwnhsBzQtBps31zHVHQecpdAGqQ4Cwl8jRyLV00jCMP
	 XJkUTHSVUXQ/wTdFwNKstNCTlCgquuEhujg6Ks6yBGCwpSyuv0eCePDJbcAw13d5gP
	 dM/QrmshbCXLA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A9E6BC433DE; Fri, 12 Apr 2024 13:32:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Fri, 12 Apr 2024 13:32:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: al0uette@outlook.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-MTQadeh5Fh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #41 from al0uette@outlook.com ---
(In reply to Mario Limonciello (AMD) from comment #39)
> Just to be crystal clear you mean 6.9-rc1 + ghY patch series right?

To be accurate, it's 6.9.0-rc1 from tiwai's
branch(https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git, com=
mit
f17dcc83a813d62cc249ade09167acdbb0c3d5e3), plus your patch series and a pat=
ch
to fix volume control for cirrus amps. The content of that patch is as foll=
ows:

From 28668199b2a6f7df30d9192fe23de48859a988e7 Mon Sep 17 00:00:00 2001
From: "Luke D. Jones" <luke@ljones.dev>
Date: Wed, 3 Apr 2024 12:05:16 +1300
Subject: [PATCH] Test patch for GA403U series

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cdcb28aa9d7b..1c08bf26b15e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7467,6 +7467,8 @@ enum {
        ALC285_FIXUP_CS35L56_I2C_2,
        ALC285_FIXUP_CS35L56_I2C_4,
        ALC285_FIXUP_ASUS_GA403U,
+       ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC,
+       ALC285_FIXUP_ASUS_GA403U_I2C_SPEAKER2_TO_DAC1,
 };

 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9690,6 +9692,22 @@ static const struct hda_fixup alc269_fixups[] =3D {
                .type =3D HDA_FIXUP_FUNC,
                .v.func =3D alc285_fixup_asus_ga403u,
        },
+       [ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC] =3D {
+               .type =3D HDA_FIXUP_PINS,
+               .v.pins =3D (const struct hda_pintbl[]) {
+                       { 0x19, 0x03a11050 },
+                       { 0x1b, 0x03a11c30 },
+                       { }
+               },
+               .chained =3D true,
+               .chain_id =3D ALC285_FIXUP_ASUS_GA403U_I2C_SPEAKER2_TO_DAC1
+       },
+       [ALC285_FIXUP_ASUS_GA403U_I2C_SPEAKER2_TO_DAC1] =3D {
+               .type =3D HDA_FIXUP_FUNC,
+               .v.func =3D alc285_fixup_speaker2_to_dac1,
+               .chained =3D true,
+               .chain_id =3D ALC285_FIXUP_ASUS_GA403U,
+       },
 };

 static const struct snd_pci_quirk alc269_fixup_tbl[] =3D {
@@ -10143,7 +10161,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[=
] =3D
{
        SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA",
ALC294_FIXUP_CS35L41_I2C_2),
        SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS",
ALC245_FIXUP_CS35L41_SPI_2),
        SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA",
ALC294_FIXUP_ASUS_COEF_1B),
-       SND_PCI_QUIRK(0x1043, 0x1b13, "ASUS U41SV/GA403U",
ALC285_FIXUP_ASUS_GA403U),
+       SND_PCI_QUIRK(0x1043, 0x1b13, "ASUS U41SV/GA403U",
ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
        SND_PCI_QUIRK(0x1043, 0x1b93, "ASUS G614JVR/JIR",
ALC245_FIXUP_CS35L41_SPI_2),
        SND_PCI_QUIRK(0x1043, 0x1bbd, "ASUS Z550MA",
ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
        SND_PCI_QUIRK(0x1043, 0x1c03, "ASUS UM3406HA",
ALC287_FIXUP_CS35L41_I2C_2),
--=20
2.44.0

I guess other parts doesn't really matters, since the major differences are=
 in
audio part.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
