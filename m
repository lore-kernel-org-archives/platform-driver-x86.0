Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729282;
	b=daiHjNt1h32N3RSUaZdG7C1UoUV+8nTG7srGkwolv3Df4ZHZgAzmkxDPvMQ/COnXILYE
	 KDjOgA3enIVG6bwxQo58Cocmt7lgDb7CCPNpFh1Z+EEMMzjnHD+8zaKqmZqpu2gL1x7Zo
	 ILci+zUMT9XUrviyLu5pKlsAZUCSM3tGLKuLDBUrAzz+pG/bWnLhTuy3hh+mYMAqW1kiC
	 NIgHrz/FZPX3IVvrFxtwWTUERKW3CtKKSM98Wo7uOdD8x1+eTgQiozztFCdG4XS9VJYHN
	 52mVn/4AWPCVKIVOhStsH+/76NuX3qeQ2dL4e51M6Kj9cYCZmm4KLLY3qj3sd/Nr/kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729282;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=qBrrOZDdELpBa7w9GceU9M6SpXqpv/zbBRpjFArF7Kw=;
	b=mvG3EHJguPdeGNNRsLUF7hb5n8AnZdwghd2xZnBOMqQRy0473jkDYzhIuoOb8pAT97cs
	 EzlEqoq36Tw310d4FrP+CWNSQEAQmzeMgat7Gm5Z4Qjj2VXO98w9qJ18NSqaAq4JvGJ5o
	 Qgx1AdZ6oLOHi21W0EbtFA4R3ZI2OFQkPW6oElh/EP2H1dTEbglJKDGDv9dlzrQuIwpq4
	 exPZaQwdmDO/UO0AT6mpKra4vvfjx6B4M3y7cVRNwyyijtKW7MrI45UEOXadl3jUheh81
	 WH5XtsvWQwDNcVZYXUmbA5oAABCYkH1OU+IcnWNKQpK/+H4zWKpqKZTUfDgrD7m0RqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="Adx/jgdc";
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0109606A31B;
	Tue,  3 Nov 2026 18:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0109606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Adx/jgdc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793729275; x=1794334075; i=w_armin@gmx.de;
	bh=qBrrOZDdELpBa7w9GceU9M6SpXqpv/zbBRpjFArF7Kw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Adx/jgdcScLNkj1DsJGIAkS1l8bekVUsze6yQowBpvsJ753rueytuE/2wdmQ4Q8X
	 MQ9D9t8ZBuPZ8sYL5riAY4hmggRoN+rmyWxzrQo9xiJ0b5qfzesmJbLmk9tHyqvdU
	 6CJFmNIr3uA4AfVQUkYQaUigns7Ihe7XR1hWaNpIJHn4WFWPQvG7sVDzCFbUIV0i1
	 571WGXBZmLzsBbO/QO3F+9yXbwRka5SXT1Kn0cvWthNa++UgiUKaQ5+vtmx45OtM1
	 AtkoEUurhzJtzN6Fpj1PmB97AZbpnnQq3uJE0WTwb5jCRQsSyK04O7hsgeZ2J2PPT
	 FITE95blVaE3Ac65EQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zFZ-1wT1IH3a67-00uPzW; Tue, 03
 Nov 2026 19:07:54 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	helian.caumeil@clever.cloud
Subject: [PATCH] platform/x86: lg-laptop: Fix input of super key
Date: Tue,  3 Nov 2026 19:07:14 +0100
Message-ID: <20261103180750.228116-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iOA0OcU2PjlOsqhGEDnEVsIt0TpKkdw9qU1XHqxbHrP/SaAtIQ9
 ladv22I4FG6YXMwSLHzL2w2g7QmQQC6CJA64WsjGvOtw1AOR8B41N1MXmyKSHf0X1AMsz/j
 mr9bZgoXLocaCQQ2zhFjB5WCqHzH5oW2I4Pepxk8Hk4eHJdtGzzFDyxzAST9VskShNaGgWs
 748eQCinvG1xEnydMgsBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OshHa9tOHK8=;B/+IIk+WZ/tCffNXx9Dqq9gLxsI
 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
 I6NqhK/nqFuswtkaWadlf2+RYorl0dCTAwtRg==

From: Helian Caumeil <helian.caumeil@clever.cloud>

Some devices emit special event codes when the super key is pressed.
Mapping those events onto KEY_UNKNOWN by the sparse keymap seems to
confuse userspace, causing duplicated super key input events.

Prevent this by ignoring those event codes.

Signed-off-by: Helian Caumeil <helian.caumeil@clever.cloud>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D222161
Co-developed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/lg-laptop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-la=
ptop.c
index 36ad1e269443..49e3029d4b95 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -138,6 +138,10 @@ static const struct key_entry wmi_keymap[] =3D {
 	{ KE_IGNORE,	0x30010001,	{ KEY_UNKNOWN }},
 	/* Change fan mode */
 	{ KE_KEY,	0x30010051,	{ KEY_PERFORMANCE }},
+	/* Super key pressed */
+	{ KE_IGNORE,    0x30020000,     { KEY_LEFTMETA }},
+	/* Super key released */
+	{ KE_IGNORE,    0x30020001,     { KEY_LEFTMETA }},
 	/* Disable camera */
 	{ KE_KEY,	0x40020000,	{ KEY_CAMERA_ACCESS_TOGGLE }},
 	/* Mute microphone */
=2D-=20
2.56.0

