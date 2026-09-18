Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720923806CD;
	Fri, 18 Sep 2026 22:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769906; cv=none; b=nG2yGBiQDomS1FtGucEHjRJOcCOzeLJEx0SJhCm/b6lA/YtIvCtHq8ctlq7z0DjhyM9LCw69aDM9iojhouh/Py1F0FNJkDkwbjDdxoqkfZcqWTXLhNeQjvcKM3MkA7Vj2SDkORVp7B9fekKqMdWEHzSoY9UEuBBDzwxUZxTGX3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769906; c=relaxed/simple;
	bh=AwdLLEnxnQpXvouH676zRMrFZE/ChGFbChQWkkApIkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxEk3EOzISvhKAayv7j51nEKut6qSH0RERglaB7P3dga18UkEw6tZ8FdHjrBOK2wpvQUodpaI8lSqZx0nvrgzsPtws3u8YuF/SeoSEYG229HwQ8Z3Pw8cfj7nOiwVFzsFVy8YGdAPoQcB35WczZsHCM7kMM1oU/BrYG5RNCecqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=a3HkpJRY; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="a3HkpJRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769882;
	bh=AwdLLEnxnQpXvouH676zRMrFZE/ChGFbChQWkkApIkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a3HkpJRYTrsfz2rWdDeaIiCSKT6icS2F08M9Xk4ZIpXVeAo+WvtTsH87XJVMCkisX
	 FxtAm+LbDMeCIqXFbHYAhbZjvL4xqxEqb57hFrhzT3kZVMdOGQYd8andzEr8vpl4ty
	 Kvlt8DoqXtsc4/pdfe43ccGRCfBhLyBrQZXnUuGNv7cdJW6QSN7lnGgTMgNCW+E6PO
	 xkyw+UDHzAKdKrN6yD5OjEK6g0YpgPKoUVuNzVA7+rc23YyGcZ0YCRySrQcGtjzpJk
	 Y/xkgs8YB7VyPcIUhZXPQU549Ww99hRcNKhtmXCv7J5G5H7I2/6qHUO23tamfo+hXB
	 raOFfIhlDmt5A==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id 502EB20120;
	Fri, 18 Sep 2026 22:18:02 +0000 (UTC)
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
Subject: [PATCH 01/11] dt-bindings: media: i2c: st,vd55g1: Move allOf: after required:
Date: Fri, 18 Sep 2026 18:16:55 -0400
Message-ID: <20260918221705.323510-2-pm@petermarshall.ca>
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

Update this binding to follow the ordering convention of
example-schema.yaml which places allOf: after required:. No functional
change.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
index dfd87beba065..ea0ae1ea12b9 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
@@ -20,9 +20,6 @@ description: |-
  lane. The sensor provides 4 GPIOS that can be used for external LED signal
  (synchronized with sensor integration periods).
 
-allOf:
-  - $ref: /schemas/media/video-interface-devices.yaml#
-
 properties:
   compatible:
     enum:
@@ -101,6 +98,9 @@ required:
   - reset-gpios
   - port
 
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 unevaluatedProperties: false
 
 examples:
-- 
2.55.0

