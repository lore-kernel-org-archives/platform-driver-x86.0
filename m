Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8577E376A00;
	Wed,  2 Sep 2026 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382038; cv=none; b=bO5gIJXx2mxsYeLePRTUgxfjXtbeBob58IUExTqr9wo8LU5YACKBCZ2akcfOZ591dvcArQ7TTWhmz5mUB0ANCnqkDX97XzVFcvQlAGpriT3Ou8OXYkMrxRDjsjG39ardXYuvQ9YbPz1AkxMy5+BTGkw/dioK96AchKB7PvObETs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382038; c=relaxed/simple;
	bh=1cT6br/BNQddG6ik1CFG7KGJmaPly1FDaV9f4cjfFSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psXYko4JlpvEJ/H1fVyUuoBg5CiuPQlEeuV4Xz6CJgrq1SYO6VsZdC8tvkqHC8tRH+v9q0dIo1J4CvQMoykAA96PZ94NK1pKmdQkY9yUEJfizAUWUCl+DPaqBQKQNJ2j0K4jWO6jeXj8Xff1FlWvXh2tsE+Yq2y/xrfxUQKoTtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=UQ0yJlJm; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="UQ0yJlJm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1788381989;
	bh=1cT6br/BNQddG6ik1CFG7KGJmaPly1FDaV9f4cjfFSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UQ0yJlJmyEg394V8vTYezslkygE4uIKQh3KbrIMsJRQKKMBxemRVRmuT50d48diHQ
	 xOhNCjqpiLzXYsp0KW3VN+yRkbYQ3uz3okwm9VH53FPL0SGePwzgEKbUVSRvSXObXu
	 s6WXRy6SdrjsSlIR687Xgz5Zf3E9X/DqmNrxhyfP0bjc5dMSmZSf9Xjl/jhWmIYTx/
	 4CjkSo8eiJmFUpuKrIMV+5/oDxWd6qWqZToHQRVfuA1AkQ/ycpLmeWnAm63M+LvWhy
	 fhBzJMtxNotz0a6yQf1sckxc2GbAbpzvC+9iGJ4GBff3JevfKc6FPddcuPt068jtJo
	 01K7xnuWDodMg==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id D2219223B2;
	Wed, 02 Sep 2026 20:46:28 +0000 (UTC)
From: Peter Marshall <pm@petermarshall.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 2/7] dt-bindings: media: i2c: st,vd55g: rename and add VD55G0 variant
Date: Wed,  2 Sep 2026 16:45:41 -0400
Message-ID: <20260902204549.657228-3-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204549.657228-1-pm@petermarshall.ca>
References: <20260902204549.657228-1-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the STMicroelectronics VD55G0 camera sensor. Rename the device
tree bindings to represent a generic VD55G family sensor.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 .../i2c/{st,vd55g1.yaml => st,vd55g.yaml}     | 30 +++++++++++++++----
 1 file changed, 24 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{st,vd55g1.yaml => st,vd55g.yaml} (76%)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g.yaml
similarity index 76%
rename from Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
rename to Documentation/devicetree/bindings/media/i2c/st,vd55g.yaml
index 060ac6829..bd6feeb6c 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g.yaml
@@ -2,19 +2,21 @@
 # Copyright (c) 2025 STMicroelectronics SA.
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/i2c/st,vd55g1.yaml#
+$id: http://devicetree.org/schemas/media/i2c/st,vd55g.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: STMicroelectronics VD55G1 Global Shutter Image Sensor
+title: STMicroelectronics VD55G Family Global Shutter Image Sensors
 
 maintainers:
   - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
   - Sylvain Petinot <sylvain.petinot@foss.st.com>
+  - Peter Marshall <pm@petermarshall.ca>
 
 description: |-
- The STMicroelectronics VD55G1 is a global shutter image sensor with an active
- array size of 804H x 704V. It is programmable through I2C interface. The I2C
- address is fixed to 0x10.
+ The STMicroelectronics VD55G family (VD55G0, VD55G1, and VD65G4) consists of
+ global shutter image sensors. The VD55G0 has an array size of 644H x 604V.
+ The VD55G1 and VD65G4 have an array size of 804H x 704V. They are programmable
+ through I2C interface. The I2C address is fixed to 0x10.
 
  Image data is sent through MIPI CSI-2, which is configured as only 1 data
  lane. The sensor provides 4 GPIOS that can be used for external LED signal
@@ -23,13 +25,29 @@ description: |-
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
 
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
 properties:
   compatible:
     enum:
+      - st,vd55g0
       - st,vd55g1
       - st,vd65g4
     description:
-      VD55G1 is the monochrome variant, while VD65G4 is the color one.
+      VD55G0 and VD55G1 are monochrome variants, while VD65G4 is the color variant.
 
   reg:
     maxItems: 1
-- 
2.55.0

