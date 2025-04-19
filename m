Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BF343AB7
	for <platform-driver-x86@vger.kernel.org>; Sat, 19 Apr 2025 02:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745031032; cv=none; b=K924EuD2seus9GZNE87rV0PXCRscAKphQgw5DwnVxi5j58aMX8fI7WIJ5bRt0YBQ2y664Kz0F4ESaQS7AnqZphUNJ3NWGfgcbdQNLycw6FBCf056RjU9vCtdo8AJ5whwDyl9SQebxYwkLQXxFaPO2fDOlF5LshYTI+4rw2YiIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745031032; c=relaxed/simple;
	bh=QwCKBsyKbk7oiabFLpJZ6jzsLzhuP13gDicjNFIjbvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9GezJU2CE7FPVSbbBpbh7r0dd1rVNrVtHYnFvAGpkjZ88fvttSYLXtQgSadvnrb7OlfjaWOUc1ty2Me445E24ZQGNn8vB+Npn3pHS2WnKIcvNzlcliYf4L0Gn7J3Gyg/hwqhwmC40Ke9R/4aUx3lFNRiSeu9F6+ox3353vEGKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lhoLAPsw; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lhoLAPsw"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c560c55bc1so238758085a.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Apr 2025 19:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745031029; x=1745635829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGln0a48jaf9DRVm8+XmoNEcb7k76T6oai1+Kf48TEY=;
        b=lhoLAPswo6dA3lJtXj1ta/Xf1YaRQw3ckyZK0PDW6LOPtN60WtZVygbridkZCaL3n3
         bsiCkCeWxLR2AV1FLi8g3JWcHmY2nZKVYJ2pgoHtxR7ez34tz7cVseiFi5BHBFBLxCXa
         zAg1uyqjPZVZt8pc9OcEccOlPesBbxhdTd1LztUtSLSYVylCkc73bMy+//DNmxG/LPge
         MNOG03FRHExnGTUHPhuZDm+briQMh5X63uL61pirW4a5P5Cc0R1rC6jmoOOjFNv+OenL
         fwK+nXqosyQjpsGvybEgw3hTm7XNQGahKTYuEfwMvYHQJuNAKHfhxrVlxf0Jz5dl1leH
         /odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745031029; x=1745635829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGln0a48jaf9DRVm8+XmoNEcb7k76T6oai1+Kf48TEY=;
        b=h2ZfA8nBmOAgbucP5Nicfsabs6qA5059oA7+KzF0VF21CeyWaSSoV2Z+ko7Qus+h+r
         nBt7shbS0SVBnKVSe7eo1YquwIQEw6HJvd3WArDSRf4BzclAN9y7SLAVD3GmiCTQtKG8
         KRcasLgAHnOX0XANLraPnFl+fi6JwBcqEIN28aK5FpkoGJqGekV3VyyO057lk8XPQRJ8
         2QkyYMqX1NDGuIGr7OrLY7/RwD90nGVtqas+IOuzAWCuz/pC6dsk/ykWqQ0iq+keGYzU
         sCHwOzwTrS/I74XWm0RP9hbWqk1yuqhGDZ9FqMI4f8uUJFEg9XQPL6ywDoC+TY1caga8
         03tg==
X-Gm-Message-State: AOJu0YzsTLgv3mkj4akRhBHcbJuM94DoWTV88/zGuovyer55ED6LXqFt
	aYn1Kxlk3epW6nDNJnJ1dwK4amd880di/AcDbgTreA1lNpVCmgC0RrtHUWNGfoS7R/mTgx+PRZ8
	Q
X-Gm-Gg: ASbGncsQgpy/ucjauh9+A7JGGf5pTLo60L1+o5V+mZGFjK00PCIOn31can946idiayF
	ObKrtEvWtpb6t2gf+Kf0ncBuTnRq568k/GRbukTkjOVtrYlzvXsXXlay2gGSvrxVnOgN5DFrhnD
	xQzYufx3XTh/CzygmHsIwdoFYIrv9i/Dnz5MqM/YbSjhbjHGAy5+8k1jp+DfM6OUxZsnCmlZMJk
	KkZz8wB15cTFPVqPEEKNN9U+FOnkReyVpOm46bYQKZG0iZB7ItjhhFluSjmFpQxeH3gMqOIOZzc
	fqG1KeoSBDWB867utwudI/Y+31ut4Q/OOeieuZsSaT1i3ABPMObFx/FrVY9zL6eYs+fUNQmQ63F
	QmXEwWUua4+tJM0xCwvihrYWSOmGt
X-Google-Smtp-Source: AGHT+IH2lcoFJnmcKqHMHMuViyeQtAANiMR2GCkNYZS2Tc0UyGe6pfEvfe5k7CjqMK8sR0uQ3r12sw==
X-Received: by 2002:a05:6214:2602:b0:6f2:a735:574f with SMTP id 6a1803df08f44-6f2c4675729mr64023376d6.40.1745031029301;
        Fri, 18 Apr 2025 19:50:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfd86csm17008116d6.88.2025.04.18.19.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 19:50:28 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: platform-driver-x86@vger.kernel.org
Cc: naveenkrishna.chatradhi@amd.com,
	carlos.bilbao@kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	suma.hegde@amd.com,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] platform/x86/amd/hsmp: change driver name from amd_hsmp to hsmp_acpi
Date: Fri, 18 Apr 2025 22:50:26 -0400
Message-ID: <20250419025026.1555230-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amd_hsmp and hsmp_acpi drivers fail to load together (whichever
is loaded second, fails) because they have the same DRIVER_NAME.

Change hsmp_acpi DRIVER_NAME from amd_hsmp to hsmp_acpi.

Link: https://lore.kernel.org/all/20241021111428.2676884-8-suma.hegde@amd.com/
Fixes: 7d3135d16356f ("platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers")
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/platform/x86/amd/hsmp/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
index 444b43be35a2..a9c24502d3d2 100644
--- a/drivers/platform/x86/amd/hsmp/acpi.c
+++ b/drivers/platform/x86/amd/hsmp/acpi.c
@@ -26,7 +26,7 @@
 
 #include "hsmp.h"
 
-#define DRIVER_NAME		"amd_hsmp"
+#define DRIVER_NAME		"hsmp_acpi"
 #define DRIVER_VERSION		"2.3"
 #define ACPI_HSMP_DEVICE_HID	"AMDI0097"
 
-- 
2.49.0

