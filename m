Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A4935AC33
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100277; cv=none; b=o+If7CIUvZwDoPBEd2Xz9R3/e1zfKL6gxVltC1PoE5H7tWl3u/nUNKFw0fk4A9q1Mt4ykutmzrVBnbQ/oBvojlSSlWJ5pAaTSk/9KiZqpVvlXhDR1EdgSwkoWmf2lGZ1O1U3b0n+BlIHThJTe9oHeZ1dP6LdqNypT2131b/fP4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100277; c=relaxed/simple;
	bh=xxnFlZyVLrmrwp1Xx7rKUBbi8dKXcSeqhsmT2hnuuMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=piJvKLC30fMogLqrAU+vxir/r2GxIrjGKgNY+maMUL8GEZZgDJXmN8gqaKIUwE+Ug/xF99ozjJgfIzINH0k885xh+0KFkCmSgakot4Tx8Q8ssqL+DYpzg3S5jRPuBJ95PXxfmVAV2nexNdvOtPW0CFEiMPFI+rKPeU5EgAA2ARI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LtzlPt07; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LtzlPt07"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c7e5f38b37so675453eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100273; x=1775705073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrqXPLDhLUafZCa8zUH8XiTLuTTy/7459nn79wC3d+c=;
        b=LtzlPt07PV67PUkM/z9OshHZCVTnYM7LaQIa6a34l8eTIx3slAIvyAJigCVAwF6oLU
         wbrxkiu33LzaPkIPPWyGxXUjFN/chj2QKG/AvS7btXfI1t4aJFT3CkNDCLVbJdz+CCgg
         YdfcEuPZH9SCGBVf9+C6d/5LRUALk3Nhx5NsHgLcDIkRUbiU+aizzWbrj7K5SoKbx3TQ
         yI3S16/V6bAbMxyg5D7koGzty3AuCPkeVIwOb2CixD6WaQgtkKsa5Csmwyi5/ocArRgW
         6jEDXrIHkW8lyWg2unSRq2ypc+WUlFQFIVtdtHwlcpO6kLPvv2WtJn/K1MhWPUAv+ado
         QDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100273; x=1775705073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrqXPLDhLUafZCa8zUH8XiTLuTTy/7459nn79wC3d+c=;
        b=Bnr2vBtJeEtTFSEVcWLboQf3nlUrObTITcZoGcP1sXurX01KL56q3GOK2PeToi3rmw
         AME3/4+L94a7U1m/pWtpH2qdDBD/YL7O1AmeGUQTynPhAuDYSZKJHAuacNeDXXphrs+r
         Fe9FoL7g8OREaT7WldFeWkAs2d5KylNSWsgd1kbXBqBIaVBnp3Ek+Y0UwKUtKyqKpJ12
         HZo1uwYxyb+YUJ1HV/5MMjitzmoHt0dB5ewXU4oOC1as2xZFxiN5HcqLW7p6if0bxHGb
         URb18dz9+ePgJRW0oUVIMfVe3Pi8/WedUTSZV9XEU1UfGhfuriHGe7cXsEUnZDGnKlTG
         toLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy9JDkg5mZ80103nzXVhQd4yQt+4ypuz1jA4YBNfJhIBnWGq3eFvePNPugJl/QDzSBzoX42fowuB5EyCrnzQum7Grx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1kOYoKgVOPzo56RA1mJCI+t90EH18+UhZFaBoF7np4r9n9Uzz
	aZ7wKHUbjDHqyPNJR8Q00VvrJAIIzP9bABof3/eYyHB5qElL4ieSsPTR
X-Gm-Gg: ATEYQzxREAd0fmll75qEpZFanmT3ovASXeBHanAyLD4yyfSuWqufJX2zIUmMuemfh8o
	HdiqMKtIWHbUS37ogUsYbuxD+FIFFUB078s2tlTtYe1o1I3MmM1a6o2oBGVpTqO72loWqb2bjJ1
	jcyTN9HVh7fRGAIjDO4zONcItCiyY02otspNUZWbWFGzpRFHJBQWGiCUB/cvMvfxaP3q5OUGMXQ
	St6Y0stLx1PotIWAmlIyBoTnaGxoqizyXHUv/SnuWKFUm9niMmazH2lHj1ZaGXnkMJcR46YMbD0
	WD68QcNPIocAxqU0mf40CDMuiEU9H10lWEI70YcNCmqeuQzxXC6UQtYm7D4Kyp/NGA4x61sRXD7
	cVEvXONDmBsNlEx5mG7C0LNvH6knCgz0gzvMplnE9DIz70ZV409R76SKY/4mvUV+y8+MI9dU+fI
	he/4kfWwi+W6ydK843iCX9SE1WpB4m2Xw0wkDVtMpfW6orr1J66r5IIQv0qIltGIoATvMpAOn9d
	lie
X-Received: by 2002:a05:7300:da13:b0:2c9:ee15:a0f2 with SMTP id 5a478bee46e88-2c9ee15e7d2mr1520928eec.33.1775100273482;
        Wed, 01 Apr 2026 20:24:33 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:33 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 09/16] platform/x86: lenovo-wmi-other: Move LWMI_FAN_DIV
Date: Thu,  2 Apr 2026 03:24:17 +0000
Message-ID: <20260402032424.678528-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402032424.678528-1-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Later patches in this series will add additional attribute ID macros.
Keep the fan defines together and permit attribute ID macros to stay
together as well by moving LWMI_FAN_DIV.

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index e475d1d8a5a7..25ddfd54f692 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -68,13 +68,13 @@
 #define LWMI_FAN_NR 4
 #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
 
+#define LWMI_FAN_DIV 100
+
 #define LWMI_ATTR_ID_FAN_RPM(x)						\
 	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
 	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
 	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
 
-#define LWMI_FAN_DIV 100
-
 #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
-- 
2.53.0

