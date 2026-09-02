Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B157C378839;
	Wed,  2 Sep 2026 20:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382174; cv=none; b=Lna6pdneVPWj2FsrZlQ0dZ+vsVyN2ds+J5mRuRVxnDEF8wUEdb+etJADMPHVTrKGLLWhp+mSXh7YS9lrlTsJu0xKYegDdP6ZajrMf8nu/b+V1a82P5BsWhDYoBwjJHoG0xH1RZQmLqbuUQuWmauvapDkk/rHbp+095tzfgSFbFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382174; c=relaxed/simple;
	bh=l3faHyrs+3FI9khlUj47eBiqzUPIJOre83jcCbDW3pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QE9/nqV89hgyP1r+jM32WY7/T7xC5VGGNpwAMTsn/UAvZ2jRGRgvjDOgDvh6EbHS7+cZDrg661gi4MsPmgAI/mKLOWZYkJZpV0Zs2+x2pTdGUllYPR7GZ+DNyjB0PFIW6N8AqO0lo7FXGahnu6F+y9RbM/AAB6Xdm8dm4y4SJZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=HlRHNgbG; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="HlRHNgbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1788381994;
	bh=l3faHyrs+3FI9khlUj47eBiqzUPIJOre83jcCbDW3pY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HlRHNgbGmIqJcdCxrtFmxwuNoc3Jft+E6aK14qGtDVzDB/fBu3at2HTwVdTwTlKJ/
	 W6GnEu5flPwEdIvRJOh0Vg6Ww6qN5Qym/K5aUuYghqEEpeNCE1o1rN3Lrsg7fr39Nm
	 4uLyjp/KVYd42F/jOswYrdDbbYy1y8Ve4rCBRRrS6n7lIXGuMe0+LzgcH+MHri7WOr
	 eCNfXE0w4BESyn6sq9XZxb235EjNn5I2hj82puXjmztcFL+SPjXbDeiwmMY50T3e5a
	 9Oe/KmtPe423200NM4LbEXD4bu/BdA4amoMyBVFy2y15VCr/jJYeVXZ9xnwvdUvEt5
	 O+vmRv4S9RmrA==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id B258E223F1;
	Wed, 02 Sep 2026 20:46:33 +0000 (UTC)
From: Peter Marshall <pm@petermarshall.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>
Subject: [PATCH 7/7] MAINTAINERS: Update ST VD55G camera driver entry
Date: Wed,  2 Sep 2026 16:45:46 -0400
Message-ID: <20260902204549.657228-8-pm@petermarshall.ca>
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

Point to the updated vd55g sources and documentation, and add myself as
a maintainer.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 MAINTAINERS | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7..b090e6318 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25649,13 +25649,14 @@ F:	Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
 F:	Documentation/hwmon/tsc1641.rst
 F:	drivers/hwmon/tsc1641.c
 
-ST VD55G1 DRIVER
+ST VD55G DRIVER
 M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
 M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
+M:	Peter Marshall <pm@petermarshall.ca>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
-F:	drivers/media/i2c/vd55g1.c
+F:	Documentation/devicetree/bindings/media/i2c/st,vd55g.yaml
+F:	drivers/media/i2c/vd55g.c
 
 ST VD56G3 IMAGE SENSOR DRIVER
 M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
-- 
2.55.0

