Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975609;
	b=JgtosejUvGJl8b3Y8JGGpDttuNWc5yZ0QPlksBP7LDhpOruhuzh0wKK1426j37AspBJZ
	 /0WmhxLq/iPVR2qK7AbS4Kdz+tS3QsYq8+epoOR5oH9i2Rj5ikm6+mWu4SbJUx3wPwHEd
	 eY8EOfokacNvOxT+k7cMjOWB+GE32D2OFlvEMG/zoZU7YFETlsww+pIlvUXxef1XMU/Hi
	 VAAu4WYwsdd7ulRtTtdCJL1dUy0mHPfbcx0E5/QL4Lv92k2EjSKjvEWbOlBas0A/suikO
	 H7JfnXvLjJjDcdhOdnXiTKh37zySxIqE20DhaGxRHXu1d/pqSdAO5mh6QMv98IKBKHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975609;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/eAhhOve+UaRgXRGweA394kXwzaPcnWOPVCBN849Nb0=;
	b=u1A+i+CreNTckJxPc1PnCJYIWt065KMSzviLFVujDwVg3nha7+5nViKhafbFWVBQ8CCk
	 CU3mbW4ZlvKoyfpPj5/d3I4vKrrTzOsOytBMr8CUPi3KTfuV2WW2zKnso3zI3g/rFzqXi
	 toHaJPayHEl2f/ViTRloEON+GyBnCyfqThh7K0oqcDMKBJop7AUMnX59Kn76nOsJBoOC0
	 J/FutNLmW1GSS7zUg6psUov01Ai22KzSI8vv5qj5uH7sPlQDcuvhnG2YENvGo2b6qJmLg
	 1XB2MGKb2O3vr6ETIuReVMxTMAK6/thHmoQAM7S7uyLWgQh9PO3+jm2IkDAw1NvV4sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=IUJgd8rt;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833A2606A326;
	Fri,  6 Nov 2026 14:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833A2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=IUJgd8rt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793975605; x=1794234805;
	bh=/eAhhOve+UaRgXRGweA394kXwzaPcnWOPVCBN849Nb0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IUJgd8rtV09L/PpUNdx5Lf+uDwImmskIZKG3FntEQcznMhDhaLHHKZ5ol4hyKAjKW
	 Yq2zEg8tOAx3sPy4lCFBHvbwlkeObePdbDJV3+iS8qsC/YXKLCw4TClmb9gafQeNBB
	 73J3MO2wSxPeiRKnfg35Lkc4OFkztYVXIwtk9Vyg7aCKiinhG9+7whIp36dnxF9uQj
	 0plHUImfBBerIelL2Nj/jPp/NvX1XZGtxHhY58ockAN2mxXOVl2pndmsB3oSi5hblZ
	 0d1ov909pSsw8frJNChjc0gRnUYZkY+rqj1yDRzlepdMgZURk2NXVy2s0PQd7Yrv8F
	 NnWT0MB/sbR7g==
Date: Fri, 06 Nov 2026 14:33:17 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Yun Wang <7z0423arsenova@proton.me>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mingyou Chen <qby140326@gmail.com>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, Chris Taraszka <chris@miget.com>
Subject: [PATCH] platform/x86: bitland-mifs-wmi: Add Redmi G 2022 (TM2135) quirk
Message-ID: <20261106143114.95008-1-7z0423arsenova@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: 896d83f527b801804ebbfd88a4f151f0b8facdbc
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Redmi G 2022 (board TM2135, BIOS RMGAD6T0P1313) implements only
three modes: 0x02 for quiet, 0x01 for balanced and 0x03 for performance.
The default profile table maps balanced to 0x00, but this firmware
recognizes it as the performance mode. Because the firmware does not
implement the AC adapter type query, setting balanced-performance or
performance fails with -ENODATA.

Add a DMI entry with a three-entry profile table for this model and
enable skip_ac_type_check. 0x04 is not used for performance: writing it
succeeds and the value reads back as 0x04, but in three test runs on
7.2.11 the firmware did not emit WMI event 0x16, which it emits after
every other mode change. The Fn+K hotkey also cycles only through the
three modes above.

Tested on this machine with this patch and the series it depends on,
built as an out-of-tree module and loaded on a 7.2.14 kernel. Writing
low-power, balanced, and performance succeeds, the profile reads back
correctly, and the firmware emits one 0x16 event for each (values 2, 1,
and 3). Writing balanced-performance is rejected, and Fn+K cycles
through low-power, balanced, and performance.

Claude Code (claude-opus-5-5) analyzed the ACPI tables, wrote the test
scripts, specified the change and corrected this changelog. I wrote the
code and the changelog and ran the tests on this machine.

Link: https://lore.kernel.org/platform-driver-x86/OT2JfRLDi6yHShYvywRZoFBYd=
W-TUgdKqKtahRM5b0cZxNo6eGZHnO5dKf4oYFaEtZhEsqU-Q-2OFe0D-qToJMVUrS5_d2aa2Q5L=
D50ISIc=3D@proton.me/
Link: https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-a=
KyZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=3D@proto=
n.me/
Suggested-by: Mingyou Chen <qby140326@gmail.com>
Signed-off-by: Yun Wang <7z0423arsenova@proton.me>
---
This patch applies on top of all patches of Mingyou Chen's v15 series:
https://lore.kernel.org/all/20261028112742.674847-1-qby140326@gmail.com/

It adds to the same two places as Chris Taraszka's TM2424 series, so
whichever is applied second needs a small conflict resolution that keeps
both entries:
https://lore.kernel.org/all/20261106114300.936782-1-chris@miget.com/

 drivers/platform/x86/bitland-mifs-wmi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86=
/bitland-mifs-wmi.c
index a431d3fef7..48a81e0655 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -113,7 +113,26 @@ static const struct bitland_mifs_quirks default_quirks=
 =3D {
 =09.num_profile_entries =3D ARRAY_SIZE(default_profile_entries),
 };
=20
+static const struct bitland_profile_entry tm2135_profile_entries[] =3D {
+=09{ PLATFORM_PROFILE_LOW_POWER,=09=090x02 },
+=09{ PLATFORM_PROFILE_BALANCED,=09=090x01 },
+=09{ PLATFORM_PROFILE_PERFORMANCE,=09=090x03 },
+};
+
+static const struct bitland_mifs_quirks tm2135_quirks =3D {
+=09.profile_entries =3D tm2135_profile_entries,
+=09.num_profile_entries =3D ARRAY_SIZE(tm2135_profile_entries),
+=09.skip_ac_type_check =3D true,
+};
+
 static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
+=09{
+=09=09.matches =3D {
+=09=09=09DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
+=09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2135"),
+=09=09},
+=09=09.driver_data =3D (void *)&tm2135_quirks,
+=09},
 =09{}
 };
=20

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
prerequisite-patch-id: 254b8455d8a7f56b730e842207d91bd6904a50ce
prerequisite-patch-id: 9708c81da6b4ed6c2d47eb927efcd64ce4ed2ecf
prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
--=20
2.56.0


