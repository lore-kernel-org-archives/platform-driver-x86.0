Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794650335;
	b=ayjXcmRz+a4WW9+IPu/zNrKu340hkYV0ek4sRzIsBZEWqH5xzH9a3hcFcGLbhSunHJhI
	 9sGq0EQa4m6Azs4kRHLObsp8Y4tpkfxjBLrUH3YqXxOLf9v6+5Ck9KXB6v8ARQQR7x9Vu
	 IlwkZG65VIKc4uM3m6sFGUAsZJ380ODIysksnk83FwWAr8WtFeFT+QfamX+nhO2oUFufl
	 fRpgYEWqvNmyzGMyFIvlRw8h3VJycMcQTKhKw18PqIT2DywxJC0BAMMC5d5Lej7C4AG0x
	 4xfWBPxdM6R52r2VQa7iI3jbH7jl1iwwO8Vr4xJYns0/WLX6Vc56Gozzj4zDQsGS/Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794650335;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=j8fcf8VMqTyPMzlZLnvdZF+7dzCSz3PDyxZ/Ahx/VZ4=;
	b=VT1qddyc9pV7YQfljQ4K/AxAaJbwMOAIIKcZX5EFDp6M2r6FPH3Jl0/0OKiPnceNYIX+
	 +kiq/VqW5pXWCqw+ji8ku//a1hfjgGdv/Pc3lDfelrzbDCKW0o3HmB6vk+/iZnN1WGGNA
	 wIHoXWYTFa3NJuIPDLYKjLI+HZKiN6o1tubAutf9xy29+aeRsxuyfXja5NZIb+bUW08a9
	 7/omJtLLy7QayKKXgl2JFo5idnX9QCBsen1cd0l7n1LExekxjuisZRoVOee9Tso+EJrZv
	 ojaj2BqZFfra/08cey0Jp5ee7vrOuX+od+fiMTPL8Tf9NDctLzeYtZy1ZBK+p5213Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=exnbQIJi;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8868606A338
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8868606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=exnbQIJi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794650333; x=1794909533;
	bh=j8fcf8VMqTyPMzlZLnvdZF+7dzCSz3PDyxZ/Ahx/VZ4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=exnbQIJiwfb74Feh5KcbyWcUz0u/EADXbVftp1M3nArWxpPpq5+lHjTYLzmGR/RuU
	 YBBMA8PXMqdLu4mk5npCFC1Gnuz8PPax1eYSuLjb8d6bL7UqDTRLheHDUyfy6GpqH5
	 kvjDRZ7DJyd97kqRiLXwyhXNyeIRyFGbBROmFt+E3uIWkprIPbK7hD0IVFUnVXBWLR
	 upViEV6/uQZFAHx+j+RlG7JksB2eeV6NTZJKWJyNv4QMxlErvUeXOG922iYoVL+HAM
	 P45Hj2JCv7NWGQ0cO3BlFwn3LhG0NeyhqUBEq08SAMXY807USq3fVCw68q5VkOTQxC
	 aYmc+pAggEVZA==
Date: Sat, 14 Nov 2026 09:58:50 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, Emfox Zhou <emfox@debian.org>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/6] media: ipu-bridge: Add ST VD55G0
Message-ID: <20261114095815.74012-5-lsa.uz@pm.me>
In-Reply-To: <20261114095815.74012-1-lsa.uz@pm.me>
References: <20261114095815.74012-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 78c02d6eea906fb790224b00444858b264ccb64e
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
Tested-by: Emfox Zhou <emfox@debian.org>
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v5: under IMX681, which is in next now at the place v4 inserted.
Emfox's Tested-by, from the Surface Pro 8.
v4: no change.
v3: moved before VD55G1, for vendor order. imx681 v10 3/3 adds SONY0681
at the same place, so whichever lands second needs a trivial fixup.

 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 5e419c7b928..0f04395a2d7 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -132,6 +132,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
 =09/* Sony IMX681 */
 =09IPU_SENSOR_CONFIG("SONY0681", 1, 969600000),
+=09/* STMicroelectronics VD55G0 */
+=09IPU_SENSOR_CONFIG("SMO55F0", 1, 396000000),
 =09/* STMicroelectronics VD55G1 (found on Lenovo X1 Carbon G14) */
 =09IPU_SENSOR_CONFIG("TBE20A1", 1, 402000000),
 =09/* Toshiba T4KA3 */
--=20
2.54.0


