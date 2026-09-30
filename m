Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F6752123F
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 21:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804621; cv=none; b=dKVgdTjNKRb5X1Cy4VN+22nIeoKVEzdh+ZvufrAknC+C3fV5l0LoyCDqbXydvLaoweur1PlY46Bi8OTHJWchHd30Ulzy5/Q9cJqihnPt7p/zzmeOJ516fmPkgHXSCeKJsTZOZ8e7L1d9znf70x069aUjGYKsCJUa4IYpfo4+i1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804621; c=relaxed/simple;
	bh=mMTTHMPR75bUOCOYBZV1Ugzu8uh7Brmqc/EPaghm+HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWXNI/pK25EJ7uqe6Wv6r8MCw8ErTQUf1QNG3Gb8CyqWqWZOMXUZIM7lkaVGY7q9c13LdlVtBtPJQ5vl9OosLp44tOUH1r7fpGuvOZTf9poKjxxnKEpInfdgdnqcx3zzTAxSvxrtgn5EQgoRP7GSi1+/9zbWILZp22X2r3SPC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljrqpNju; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljrqpNju"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49896dd9dso742495a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804619; x=1791409419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1zpZHPuVM+iqq7iFBG6v7ofF86AB0nq1tUsjQIMM3w=;
        b=ljrqpNju4S+PJSQRiUMQRuqXKtHjK6fbwt9nf5rY/o1x55avzS5ux+xTsVEXEdeDKt
         D6y/JD1hEDCv9HPywTFwjyAPFKq5ggwyPXSGXJJNjKHJ6DSSzVHzXs4v5SmaXOV38A+d
         kngNiIKPurH9b8rivuB9TsFhVW9dlkg5Yh1KYvGmklGb6/UjfNnIHn0U4Gnu7aFULSNG
         1CStJxPPcq1W2qtTrI+tmTxnQYWmAAtgtkIwo0zlX4HLmY6WHY8ZqC5vQisIxz5QfOuU
         Hi9APIuzgY8evvJ/OggE+gKaV8kO4NQ9y7gsQLZBFzdZDiXe3Y8OpDI1EVvJV1pF4JbM
         Nbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804619; x=1791409419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1zpZHPuVM+iqq7iFBG6v7ofF86AB0nq1tUsjQIMM3w=;
        b=qbvR0LeVdV1SIGkVHxnmg4DdZxMkwBLhL8gvAQg3mvjZjT6Rkh6dV38WzYtP4M8Svs
         IZ/bh1ujIXS6O1C/44ibECuLsr5vgfldsB8h0wQdV0vLDkaZ2t3Fva4fm4KKz/Jty4aP
         1A9HE3DVccxd3d/GdxAMuEqodRqZGTl5XCbg00sjTOMmOZ5i4zVH5e7wzpGRxRqVy8Yb
         x2h4fmrVC4W9RubucK/truYDbuZeD8eCxypRM0RjWJZNUoBX0se2ECGGjxE6CVGgIzwb
         lR2DXRNrvGnLPZC2uZwtFG/Nr5aaV/Z2nDsUa92+YF6RbB6SIFr3XeH4HzWfuYsaMFuM
         K5KA==
X-Forwarded-Encrypted: i=1; AKwUvBwWvNVj7LlRJvZkDllhhFQIyRhdP9hYshNJ3zm6uj8uIZt/Fen2248Iq8tr11rqVEB7JPR41DrqnLkZbxYoHonHyzg2@vger.kernel.org
X-Gm-Message-State: AFq9FYJUB2jYcAGRe8rwocZdWhzMW1rCss762Nyaaf/6wV+VzilTfXSd
	JPNculLrqKX8uA9J+h7Go/91kopsZNCZIawB1o6wvW9Lyn3TNgCGAQXo
X-Gm-Gg: AYBFou0JVZ+0y4dlr5F/hX2jODCHeVE6Rtf7es720v5cb7gZz0+ebV+GOVrqiKEhvaN
	1QaoD7gFY62sjXa3A9AFWDanq2CakyrbKcekekC+KGyfj9gibQj0e01W14oOzDf5boIHhCwQrt4
	CWKHvDNkierrZ/ZRyctDQLvJLuG2VO8ZWF/38pcuESlZCX5zDmCTrixkhKMEuWaCwecWyZn1EnF
	4KSNYb5A97Ej+WvzNmDX9ICovwEkpciitXSPFEBEdQX5lnShb8pqXkAMeJbux2H+of0/8kUYT69
	ApCeINICHiG1/HUVfCkRh/+6wkppJEOg/ld3A6+T60wff7OCHXPyTdLtbKWoUNN6ReGl1r31KkF
	B1wv6iJUuQyvDnELaeg50t1cMbZwIWbu0sAV3rGhVqrxBLSSfZqhk2sd1fYAmn8BaAKFs6tSBxu
	eJBLJ9BLmoChTuV5kdQZWEON+4XvKsBlqiL79EVXVzM5kdF7+kesIbR9JDB6VVf8r952s=
X-Received: by 2002:a17:90a:d2cb:b0:39e:6a7f:6187 with SMTP id 98e67ed59e1d1-3a4f2deabccmr468991a91.24.1790804619250;
        Wed, 30 Sep 2026 14:43:39 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:38 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 2/9] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Wed, 30 Sep 2026 14:43:14 -0700
Message-ID: <20260930214321.600863-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "D. Manresa" <dmanresa@gmail.com>

The Dell Latitude 7275 2-in-1 has the same BIOS bug as the Latitude 5285:
the ACPI GEXP device declares an OperationRegion (BAR0) on the GNVS
variable SB04 and the I2C4 controller (INT3446) builds its _CRS from that
same variable, so intel_lpss_acpi fails to bind the controller with
-EBUSY and the front camera sensor (OV5670, INT3479) is never registered
unless acpi_enforce_resources=lax is passed.

Add the machine to the DMI table so QUIRK_IGNORE_RESOURCE_CONFLICTS is
applied to INT3446 on it as well.

Assisted-by: Claude Code:claude-fable-5-1
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: D. Manresa <dmanresa@gmail.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 9d7d0ad62..f49ce3bb8 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -191,6 +191,12 @@ static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
 		},
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
+		},
+	},
 	{ }
 };
 
-- 
2.53.0

