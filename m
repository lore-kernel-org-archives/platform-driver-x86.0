Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340521;
	b=tH/aYvDc1+vlGrUepwqPeCb3y92E93oxzGscrQlz96m+YDNHQhoaT5IjbwWmpYNh+O6N
	 6GJJBeBV4QPvAH8MXbHaP/JGAe56m9iwjaU0wbVjYZVrQAnpnCYP793ZgrENxH3JjZtsf
	 UpeOaZl30HoW94tqJjwL6v2Axus/nRfXTwdDyv8z1+uYgo5sWdNm/cNIU1a7Q06TpAXQO
	 HGfo0S22G7L2oDDX6mysdInwd94K5on1robD5Zt+B9bey6aDfcNaTcBjrudO3JcDOC6UQ
	 PixDL4nksndm9BZaQurkmAKtnNo4UUpadtilZxlU87dd4O7lXJgPWnjTnqx3cofQtCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340521;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=yVkNG1PTzTQKZlpak61kasG8vOUOw5z3BtbexeiQsok=;
	b=pZAGRhdkedT2j/e8dU60zAjFHWuPy5kkeoQohywzkOdBaplT5MihCRYH7+RDELLZAj0p
	 APoUyBxt/N2e0dBlXx56KiK/EOOn8Kpq+nYvmHscavqQKOXkuj590/JpGYtNK0ZwalEEL
	 ZaZOksi2YLMOmgOwzii0WpC8aAuetKYdDBKYfkk9bCwa26Ga5XczOlU9Xl0TMYdwLJDsi
	 bfsaG1Jqq0+TReVvIRcaW4cCwG9+LLwfg5ghrE5XoV87BciXQuMJkgnUHluhzR0PWs7UT
	 tRQh/LE7PusxUALRtpyK3npAeXzTnp48VkogWffH0HjFMefPPuKZtdOKvHUAEdDTLpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=aLf42TAA;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E45606A327;
	Tue, 10 Nov 2026 19:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24E45606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=aLf42TAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794340518; x=1794599718;
	bh=yVkNG1PTzTQKZlpak61kasG8vOUOw5z3BtbexeiQsok=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=aLf42TAA2+a7nHlBhsu9/blGl76fxiLwOFvAMPxTixKUfZvmgmT1d0KtwNAzrxMMc
	 8tYp0xtxFN2RRXtAxNKxu5QzuEGWH72WAWXmfLAsj5TpE95qHilK8Ro5qNAbaewhdW
	 0ajqUByDXHkAXhjjR70PXgPUA//RzfPzeJ3DPB1X9mDDB31fklZ+kuKC93E5pGP86m
	 fuubCAxfbNhPsJIamDJBSXoyTk/+jkGx8uVveyThgsdRxMGaH57pfHNvSBEWnHVHTG
	 Bk2ruf4EJrriw3U3LGpEpu6bK3vhb3zDo7yPhXOMKftVPtj3455GyhQk5a5m1IhyNP
	 c3z4TAt3pDsrA==
Date: Tue, 10 Nov 2026 19:55:11 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/6] dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
Message-ID: <20261110195454.48176-2-lsa.uz@pm.me>
In-Reply-To: <20261110195454.48176-1-lsa.uz@pm.me>
References: <20261110195454.48176-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: b04a1a86ea771cab38fe6384f8e1574039aacfed
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

The VD55G0 is a monochrome global shutter sensor with a 644x604 active
array, sending over a single MIPI CSI-2 lane, with the same supplies,
reset and strobe GPIOs as the VD55G1. Its MIPI rate runs from 750 to
1200 Mbps (UM2829, 13.1), so its link frequency starts at 375 MHz, and
its I2C address is set in its NVM rather than fixed.

allOf moves below required to carry the if/then for that minimum.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v4: no change; Krzysztof's Reviewed-by from v3. One file stays, as he
answered Benjamin on v3:
https://lore.kernel.org/all/20261110-normal-ingenious-kakapo-f8c479@quoll/
v2: the VD55G0 joins this file instead of a st,vd55g0.yaml of its own,
with allOf below required for the if/then, as Krzysztof asked of Peter
Marshall's vd55g1 v2, whose 01/11 and 02/11 took this approach:
https://lore.kernel.org/all/20260918221705.323510-3-pm@petermarshall.ca/

 .../bindings/media/i2c/st,vd55g1.yaml         | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/D=
ocumentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
index dfd87beba06..0245673d105 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -16,21 +16,23 @@ description: |-
  array size of 804H x 704V. It is programmable through I2C interface. The =
I2C
  address is fixed to 0x10.
=20
+ The VD55G0 is a monochrome global shutter image sensor with an active arr=
ay
+ size of 644H x 604V, programmable through I2C at an address set in its NV=
M.
+
  Image data is sent through MIPI CSI-2, which is configured as only 1 data
  lane. The sensor provides 4 GPIOS that can be used for external LED signa=
l
  (synchronized with sensor integration periods).
=20
-allOf:
-  - $ref: /schemas/media/video-interface-devices.yaml#
-
 properties:
   compatible:
     enum:
+      - st,vd55g0
       - st,vd55g1
       - st,vd55g4
       - st,vd65g4
     description:
-      VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a color o=
ne.
+      VD55G0, VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a
+      color one.
=20
   reg:
     maxItems: 1
@@ -101,6 +103,23 @@ required:
   - reset-gpios
   - port
=20
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: st,vd55g0
+    then:
+      properties:
+        port:
+          properties:
+            endpoint:
+              properties:
+                link-frequencies:
+                  items:
+                    minimum: 375000000
+
 unevaluatedProperties: false
=20
 examples:
--=20
2.54.0


