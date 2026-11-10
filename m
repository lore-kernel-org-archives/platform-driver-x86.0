Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340539;
	b=4VB40da958ZOdcd30V2xsuyPaI/ThIFOZCbjXBua5m6dmbWuEXSGsbPMjLW5u8kc4ahg
	 aad1nj9YL1NWo+K4NZib8S8B3InKzzDLD5OSmCNa5c8blyg6tCy3ljTpwaZ0LH4Xz0D+C
	 m2YrYpUEoh110q6tJH4HbYEpylDpsiP4YvPHo6gk9qkIM6mNQmlEDcfYW21qreSRf74gV
	 g18dwVKZE8Fz1gg6pjFHiXJiN/Pk74X0Z/K89OqvQ3sAe1U4i1yP7coR4sH1T9SjusV0a
	 LfDxN7iOgH1+HrgkjIXQ3M9iV4x7jr/IzKtX/Q+g335CbgYYIjxzGO8RBP28WJ1QX0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340539;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=mh8xxQxLI1386Z2affx51MJuVqSIzJ5Xz7MXSE9mxjk=;
	b=Q2KicaPydv63nsK8P4z8GdbHyhkn1XZGQLq6FYp2v9pF6jF6o1MAp8h1ML/E31SFdHK2
	 iKuTI8VkWbSTO3IC7S9z2QBl8DY3OMu8YkmY3YHOKmGbZmQ47w9uPKYn/ImI3jgpeqLqO
	 GjFDEYbapJem37Z8iPEeCr6t54mBEO0xtnmcueev3VEY/cCThcjjU3F/wtnZs7ACUa3+N
	 FkqhuJ/L9lshyDX34pDoRjRqHScnvQuHZ5YWkClmEI4Sjb7PHq55fjUzcfh+gMWQCiwBi
	 KVoOppedTobSO9p2u1OfdI+VKjo/jrClJuriNslj2w6TlbEG/7xrvpawIqoOs9sMSQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ZpfSN+26;
	arc=none smtp.remote-ip=185.70.43.22
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9F860A2612
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 19:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C9F860A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ZpfSN+26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794340536; x=1794599736;
	bh=mh8xxQxLI1386Z2affx51MJuVqSIzJ5Xz7MXSE9mxjk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZpfSN+26LxLbQzJYLxJ4oqk52+9L73rm5SwKws9sV23dblac17LR75mWR7Qq3J0zt
	 jfMkEy1vKOegS3kOD00RJT8KTgxIOmqKKnOzE8nhPZxqov8IL9k5+rtUkjEh5mcjPZ
	 ST6GkoUDe8to14Oy69RHhANXb8L5x+5OT4MZKiyWgwGKwIobADemznMmE/0PGvSqfU
	 vK8DKnrwy2Sffr6Ep28VvrjbH4BY5RmqSxsJSeGbqUQK2OT2OvnV7a4vfwI81GJZqX
	 h6uZ0mlkEA21rhfVHwdjUsdYg63pnnnEnZ9VOXjPtPU1F6Y7n93N36tizMdqjiQWml
	 YweD77nZ5eajg==
Date: Tue, 10 Nov 2026 19:55:31 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] media: ipu-bridge: Add ST VD55G0
Message-ID: <20261110195454.48176-5-lsa.uz@pm.me>
In-Reply-To: <20261110195454.48176-1-lsa.uz@pm.me>
References: <20261110195454.48176-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 5272035d8f1a0cd28cef0ccb76250390f5e3e7fd
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

The infrared camera of the Surface Pro 11 with Intel is an ST VD55G0,
enumerated by ACPI as SMO55F0 and wired to the IPU7 over one CSI-2 data
lane.

The vd55g0 driver takes only a link frequency whose MIPI rate, twice it,
is an integer multiple of the input clock. 396 MHz gives 792 Mbps, 33
times the 24 MHz the sensor's SSDB lists on the Surface Pro 8, 9, 10 and
11, and within the sensor's 750 to 1200 Mbps. Peter Marshall's earlier
patch for the Surface Pro 9 used 380 MHz, 760 Mbps, which is not a
multiple of 24 MHz, so the driver would refuse it:
https://lore.kernel.org/all/20260918221705.323510-4-pm@petermarshall.ca/

Tested-by: Fernando Rimoli <fernandorimoli11@gmail.com> # Surface Pro 9, IP=
U6
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v4: no change.
v3: moved before VD55G1, for vendor order. imx681 v10 3/3 adds SONY0681
at the same place, so whichever lands second needs a trivial fixup.

 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 3739c4a2a8c..c99c85b7e6f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -124,6 +124,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 =09/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
+=09/* STMicroelectronics VD55G0 */
+=09IPU_SENSOR_CONFIG("SMO55F0", 1, 396000000),
 =09/* STMicroelectronics VD55G1 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A1", 1, 402000000),
 =09/* Toshiba T4KA3 */
--=20
2.54.0


