Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2114C248F51
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764227059; cv=none; b=ZMCUCgqMRa6zpOx1+m38TrkvwbWPQP4HYVFShxN1Ccfjo7dnPodYq52sSm/BLJLrcTAYQKcu61zTNIhG3ccR5UBzMS3py37v7bauyXkZyNmAvSx5auahzWgKnn+Y4zKPYSo9To3hgDCnzoo1LXoxI0eAyXlWTk5rZM3ptgcPNYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764227059; c=relaxed/simple;
	bh=N1efc10EOHLWGixBPIiAqpcHEkD2vemhSNPai7tnGeo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=EMca6nTdJ3jZ8Y+XeSDuxhu5sgVIl6E6iYXGiWPOfayqK5/KZWoDiQBML/mU2124WVHpKOEYzBarw7oWBUFKl9R8z0S8InKVKYBL5Cpy1VOa3FJx4qpwaBImOnMHwfYaC76f2CjAfHxBe9SrLWRIn8LMb+JxY1zWv977FRxu13Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5yftRa2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5yftRa2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2984dfae043so4709895ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 23:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764227057; x=1764831857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QBR/AheFm3tKat06cP5NedrfvtvOTlhKN1ydYNsbaV8=;
        b=V5yftRa2iTeJgYnMs4oim6qkA4P7oYeimFpPw6BY6DGPylOJ1/qoRa3HCt5O7DDcHM
         0D3y3JJ8scbgW89HpMDy/oFmmKWEft2rSd9XUYdSyBiTnBNLhsK+u4RYgl5ZJS4BDNP0
         ptGSbDfVFkhLzQteUhYFaNku65c7agFp47UqhWh6OGOYjkXIJtamvgtURmkTNIH3B/3G
         Q0soBIJ/w/ixLBDU1meADhii0ONjim8ztHcg4LXbW7VI0TNeXPYnXYRDdE2iiyJYbZtk
         lH/4gYgD/s+OInbMw+vMp8QaoEZmUQPyBVeDC9PmV829TInii2Q7NHQ/YqL3M0Y1gdqg
         cFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764227057; x=1764831857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBR/AheFm3tKat06cP5NedrfvtvOTlhKN1ydYNsbaV8=;
        b=JKgsAo2CbV4KPqN8HgcMKMUu+uT8aHZhWY6MmlUACumYsyudL6Gu1HdMiM3ymYIldc
         oEFUyRU//RnNB8uC0tgU7kU0Iy8sOKC7eTMJQ/OCqK5ZUmafTl3t8JKa9aRXE3RxucCi
         INditb0EGfN5QX6ACsGDeEVJ1iJyXId0Ixe+bQT9Qz6a7ot4KjiCNq7JvShr2/VYSByy
         eGdDfgjz2gkMBu+s+jjxpeZqUyTTeKmMT9IhQExmeqSmXtZeol0FKwoJ4qa5KnpPosee
         HPn2SlxdLT9vPa+aZNnQ5Vw1s+6jhh2qCSMTxh3cXfb09EZYsmsglP3mP6fSVgg6RuxV
         jmaA==
X-Forwarded-Encrypted: i=1; AJvYcCWrCdP0aGHfGOtnwOXH1CWIL0eEGlOJrgD05Ysa5NiusVvU02GElO2FcYTIp/XsghKoI2U5/s+zNEtotJIfnFdbaNAT@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb4hqvo0HojrwNGQMDK+FNdODeBFA8Hv9o2y2Fcfo1wFSJdUfN
	ucpqFLd5dFbn8ZmgIRhCMfv43XyWfD9hlnwolGyQSNIhK12ONK11+jVs
X-Gm-Gg: ASbGncsb7MAGu0VdSJje6WPnK2B9J2xkznjatxaXpqi0XuH630WLIfg/a3cORljIhSw
	1CQ0t6fNJNXcg0BpZtDS0lJvvTORHXITZtDRdDz07tSoAuMdtXsFJfDyv1M1MEvLJO4rIKiSvox
	/XulnxIdRYhzD9XHZnkXLlKhTyUb+q1P2Rh6dxC+oJAW75rN3WJmDU6dUbX9CQXyTmIUYUIga2t
	qNuwyIqPmkrdJGQRP4ZXiz1K7kg1Jz/3wEjhtAseEBPphqy8on7pC8d51Vay96sciVAD02n8uOh
	CeYvLN7PwiOAOUTNnoLor1S0TFmWkMK9oJl0pXq/M+Q1YpyVxNR1kC7EtyV3nnp/SUIUdOBW7Nq
	tIkdeswbFlSsd896hV45GQ9xJPM6jDhDJwuwZ/F31zEes1Utbsyrkzh9onoaQJ35vmiMrJA==
X-Google-Smtp-Source: AGHT+IEhYoBW8JrPyEqqtjUkAziGdRG3TVUK/F66fcIUyqpf5N1TN2UAhMfDGX54jOk4lBv3UmiZqA==
X-Received: by 2002:a17:903:2ec4:b0:290:b53b:7455 with SMTP id d9443c01a7336-29b6c3c2ac4mr225288675ad.10.1764227057291;
        Wed, 26 Nov 2025 23:04:17 -0800 (PST)
Received: from localhost ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ab81sm7276575ad.3.2025.11.26.23.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:04:16 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Alex Hung <alexhung@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/intel/hid: Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks
Date: Thu, 27 Nov 2025 15:04:07 +0800
Message-ID: <20251127070407.656463-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dell Pro Rugged 10/12 tablets has a reliable VGBS method.
If VGBS is not called on boot, the on-screen keyboard won't appear if the
device is booted without a keyboard.

Call VGBS on boot on thess devices to get the initial state of
SW_TABLET_MODE in a reliable way.

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/platform/x86/intel/hid.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index 9c07a7faf18f..560cc063198e 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -177,6 +177,18 @@ static const struct dmi_system_id dmi_vgbs_allow_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP Elite Dragonfly G2 Notebook PC"),
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Rugged 10 Tablet RA00260"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Dell Pro Rugged 12 Tablet RA02260"),
+		},
+	},
 	{ }
 };
 
-- 
2.43.0

