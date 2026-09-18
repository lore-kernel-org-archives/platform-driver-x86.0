Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D1354704D;
	Fri, 18 Sep 2026 22:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769929; cv=none; b=EvQvOjyA5UqZrjBBJDO+1CvhodO0/mtVlzBhxbgmGs4Irazu94HPpid0fy8xg5YmhZCqUnuAJFS5UuOb5KrWxBJU2i4RVJ20MWGV2GnTDwtDn+h/mPYXzpQppbMUltq9iBLk4aNV3xynYxrJwpA3HIJAOSLP2RrhtQ5iGXKyMPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769929; c=relaxed/simple;
	bh=qPHmxGTb6XkEgqCCX5laAh70UedPRMYMhhI7juFRzX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iXQADk9eRjcKFspFg77v73Av613GmopaSBS6NakJnMiqQEDzvT5jKjGI+SEC3mViBNTdDzbqfOK4ctAjjKqYJ0DNTlscqpy7UgoQDKue65An3dP0uU+k1GHtOs9qUiLPCe+QOyK/NRhxjF+RzHm5hva+yWwFhlgP3bhPJxUVON4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=T1SzMzfE; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="T1SzMzfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769885;
	bh=qPHmxGTb6XkEgqCCX5laAh70UedPRMYMhhI7juFRzX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1SzMzfE4LNDURBVjIGLBGGIj3jBEOdB09AG66fgwH4Wj+62kUi183gXL0EggcYvK
	 OqY632RInX1Dv+cCibPmQYT0X0o68hDRGxHd441fn1fTLd3VDP2LyLLcvPppb77u/6
	 DvHSgflRT+hdKF8C+VBLUgI/ROG9MwFEkYPgX7056ulYNSXQy7fOb0gGR2wfh2NHWq
	 T1c7La8CD27cy8MRv9YWM+7RulS49zXlfkIVTXJiiGJNwcOWt8xJCwFy26fOVDpioN
	 gQPaLZ/qNkEwCCH+1mV1X0ug8yoz5l2dBIsqQyFQPZJuVCQjbOlJICV0KeBhIUZaSa
	 RKeOUNND4uXNQ==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id DD7A020121;
	Fri, 18 Sep 2026 22:18:04 +0000 (UTC)
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
Subject: [PATCH 02/11] media: dt-bindings: i2c: vd55g1: Add vd55g0 compatible
Date: Fri, 18 Sep 2026 18:16:56 -0400
Message-ID: <20260918221705.323510-3-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918221705.323510-1-pm@petermarshall.ca>
References: <20260918221705.323510-1-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vd55g0 to the compatible enum and update messages to reflect
its support.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 .../bindings/media/i2c/st,vd55g1.yaml         | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
index ea0ae1ea12b9..195103ec0912 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -5,16 +5,18 @@
 $id: http://devicetree.org/schemas/media/i2c/st,vd55g1.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: STMicroelectronics VD55G1 Global Shutter Image Sensor
+title: STMicroelectronics VD55G1 Family Global Shutter Image Sensors
 
 maintainers:
   - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
   - Sylvain Petinot <sylvain.petinot@foss.st.com>
+  - Peter Marshall <pm@petermarshall.ca>
 
 description: |-
- The STMicroelectronics VD55G1 is a global shutter image sensor with an active
- array size of 804H x 704V. It is programmable through I2C interface. The I2C
- address is fixed to 0x10.
+ The STMicroelectronics VD55G1 family (VD55G0, VD55G1, and VD65G4) consists of
+ global shutter image sensors. The VD55G0 has an array size of 644H x 604V.
+ The VD55G1 and VD65G4 have an array size of 804H x 704V. They are programmable
+ through I2C interface. The I2C address is fixed to 0x10.
 
  Image data is sent through MIPI CSI-2, which is configured as only 1 data
  lane. The sensor provides 4 GPIOS that can be used for external LED signal
@@ -23,11 +25,12 @@ description: |-
 properties:
   compatible:
     enum:
+      - st,vd55g0
       - st,vd55g1
       - st,vd55g4
       - st,vd65g4
     description:
-      VD55G1 and VD55G4 are monochrome variants, while VD65G4 is a color one.
+      VD55G0 and VD55G1 are monochrome variants, while VD65G4 is a color variant.
 
   reg:
     maxItems: 1
@@ -101,6 +104,21 @@ required:
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
 unevaluatedProperties: false
 
 examples:
-- 
2.55.0

