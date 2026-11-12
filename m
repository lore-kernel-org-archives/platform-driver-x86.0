Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513609;
	b=BZjw8cpZDy5BjNigbhaZZB+/+ZEu/xl8YwjgEPCijv/xEkMqE0M0cDEHLN4l7QXcEfo9
	 Q5Q46IWomMmJaz+gMFjQbwPNgLWQXrUzPR4899xfa8YnIJd6EUYbZdQLI0e9Xxplz5axe
	 U8J5Ep3bhqDu4OfWH3cQPSra3g1XXBXYnTv/b3aYP9EOg9bEqaI2RYObKVnsAkuWKZUW2
	 DlxCh19uSJ+6fcmYuknhcZeuVzIg57XOtHE370sUNzA8UvUZuSOM2WUbF2GacDsD52q65
	 9Ah/PLaUiyNDI4VL2igsIMUWpSRjQRTtQMBvMLPcuRexSzZeG6GYtMv0E3wZyDfkLEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513609;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DHRuyG9ReqiocMJ/VqKG+CT5yWVQXJORMVXHUkARiSo=;
	b=mtylIyKOQDJeyEoo+Eb0iU2e4z8E71Ti7NoA7IL2RjrKYdBjRJu6OJPHHaj0G4zx5JOx
	 ifr1FVVFQn/5IU8fEJuz3bGZBlX4h+A4nyn4t2QXBis0Dsl00hDmUpSdQaIAtbpN/7JVe
	 zWepX2wFyTKliQV6vZ8qE8Dasd3eRcN3TgwF1bhmEGTxPAhOHmL0xFnzDCAjaD4psE63H
	 6YhboU9nskIAKEOf0wCvJIKvvi2K4I8BIMxvBn6pmTFlqZrnUDmBJVoiJivQUHV9on4TR
	 cPEa96ut4lwUML6ZMvaeKkoLUwfVWhCwypnXPq7dYWRDn0cFWgCFVHg+coM1iiE/JCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=po36a2x7yrbt7bhcbekms7rm7e.protonmail2 header.b=RPOIVCps;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF69606A335
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 20:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF69606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=po36a2x7yrbt7bhcbekms7rm7e.protonmail2 header.b=RPOIVCps
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=po36a2x7yrbt7bhcbekms7rm7e.protonmail2; t=1794513604;
	x=1794772804; bh=DHRuyG9ReqiocMJ/VqKG+CT5yWVQXJORMVXHUkARiSo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RPOIVCpsJF0WjGQPlpS+oZ25Oo55ylMpfLiKMr477IilrAkyZlWjcDiUQRdl2BpVo
	 36axSLu30xJmzb9fcRxquEtAUXlZhK2FGakH1bhLEpvpvvIglHKdU9RCo5vPfUA0Jb
	 wuBc0+sDeD1i1N9CrWSZgp7VuKR0S85c5PV0+KHz3l/abMM9p/v/X56OvIuTXrAJ6l
	 PcIkMqBAAT/qeMvYba7qgLMqiYB+ah2aJsck2/HMERuAtV+GUk3waEUdnL9Pk31Z4d
	 emN4IRFct36mShGerxyRSiXmsSSHcIBv3Eq4UyBNQu7bpmE65XiO8dHf5lI0cVEMrr
	 c7wQ776Guy3Yg==
Date: Thu, 12 Nov 2026 19:59:58 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Yun Wang <7z0423arsenova@proton.me>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Mingyou Chen <qby140326@gmail.com>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, Chris Taraszka <chris@miget.com>, Yu Pan <neko205@aosc.io>
Subject: [PATCH v2] platform/x86: bitland-mifs-wmi: Add Redmi G 2022 (TM2135) quirk
Message-ID: <20261112195915.875137-1-7z0423arsenova@proton.me>
Feedback-ID: 227066774:user:proton
X-Pm-Message-ID: 464e5f091033ba32779e1d75426cc588f4912257
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
Tested-by: Yu Pan <neko205@aosc.io>
Signed-off-by: Yun Wang <7z0423arsenova@proton.me>
---
Changes in v2:
- Rebased onto review-ilpo-next, which now has Mingyou Chen's merge
  series (v16) and Chris Taraszka's Xiaomi Book Pro 14 series. The
  TM2135 entries now follow the TM2424 ones; the added lines are the
  same as in v1.
- Added Yu Pan's Tested-by.
- Retested with this patch on top of review-ilpo-next, built as an
  out-of-tree module and loaded on a 7.4-rc2 based kernel: the results
  are the same as described in the changelog.

v1: https://lore.kernel.org/all/20261106143114.95008-1-7z0423arsenova@proto=
n.me/

 drivers/platform/x86/bitland-mifs-wmi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86=
/bitland-mifs-wmi.c
index d834168381..3aac9d17ff 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -128,6 +128,18 @@ static const struct bitland_mifs_quirks tm2424_quirks =
=3D {
 =09.skip_ac_type_check =3D true,
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
 =09{
 =09=09.matches =3D {
@@ -136,6 +148,13 @@ static const struct dmi_system_id bitland_mifs_dmi_tab=
le[] =3D {
 =09=09},
 =09=09.driver_data =3D (void *)&tm2424_quirks,
 =09},
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

base-commit: 11b27ad8c8078e18b74d0d507180422bfafc962e
--=20
2.56.1


