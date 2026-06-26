Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57733BED61
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507001; cv=none; b=EucK7WUNn0eV3yQY6q3QmebV+PiMtb4Qc8fuPAncwJoTayib2EssxvykUaHi4dFbd4qakAMpi/80D5x+LdhkKjkYAVZQU6Pu0lwh2D+c1g+UQ8yqd4gAt92NKR34a4k0xeaDQiKG8jpSbggtglFUCkoMgmwac/QO+by4b3EKxvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507001; c=relaxed/simple;
	bh=lqmOcWqI0FMeiKH4DVNZK8U1G2Kv6utppj1Q/a7Qx/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJMlPIMEhVaXVVYpwM63HmFHnyQYGLEDCRbe1k+oxJM7WuXsAbeG4xGwi2mzE/O1Cjs1WVgjoHZT/rvaCMNsCaADEP97P/dOPN7RbDg+8KB081d2SN+tbumWycx+sGnmMP6pyMeOP+z9wCcSpRcJY78EdNYtUBYi/fVM5dj7XEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emGv4cKn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emGv4cKn"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bebb72b845aso232195866b.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 13:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782506998; x=1783111798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJ5pE+48i146L2Ym2Up31rAyIZfjYbmUnquanO7bZu4=;
        b=emGv4cKnofN7c9rO4jfnUS2rmyJq4OOfs32xeBq7aHaR6dVcpkF1I+6BoFllMpmLDZ
         rN4sWkgnu2WZWtHS2ohhDg/MvOIaZhcCVYMOaTYkC/IduwTKUubIbg3wlp43tEiC2SJe
         cosIoTC42Sin2Wd0b+epqISh3AyJBZGeSoFCStDQwEwUCTiRPnskiOU73s1El0niTCaF
         wIBHdsnUBEQEZUwMFi2w/RM55rrCACa5CSZbbD9G2UbC+7iQDRVi45UQC5/qkA1wtV+D
         fHk/iiQmFEerJtemQjhntMR0meHv7d/74KBcihw2GvMPnwOlK7knxy8/wOd0UoXu7Ncf
         35Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782506998; x=1783111798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pJ5pE+48i146L2Ym2Up31rAyIZfjYbmUnquanO7bZu4=;
        b=fDr7fIULLLaE3eSKW21h7YJiPv/yVLYldiK+r/7p42RL7L0YVcDB+wBX5+0Zdvcoqu
         5ffZ5HoAaQKBFi8bCiVaLd0lUkmVPgP5x2kimKPyTFg44fyU28ZkgZogEZeVUT2h1Izf
         6JjzXKyfQGVN9Ng3Er8w4ri81mMEZFboYiNKoO6Nz9+hAgxz3nqTzEuNjKlQgtDGGKBs
         sWRhqpmSqMgr32z+zdM5Gdi3f8fBSQQfuMG/EKCLAG3inyMNxoQdDThf7eFxbrzH75Tv
         8S2O8gz4PsOuylZbgiWYXANiEy680ID3U2/qGnxywyvcMCr/NlUkIDDn+7FIiOrS/ddA
         Wveg==
X-Forwarded-Encrypted: i=1; AHgh+RpTl6gCKhKeL/oW4PvmTgD81I+aeAtAxN9LKGwxP0Ze15XLLBRqggp4CRYzVEJjJQl3dpX7wSooNwe6EbHC0Xx8F7sd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu+nIisP7XuR9Ppk6EDUGdtoTlJmHwWqGwaCIfg2alc15vnke7
	0LXar7uuP03yL2n8niIlc23m1CWfhTa5ztL/Ro6kKjiVPByacGGkD76e
X-Gm-Gg: AfdE7clZP+G6gf87EdtopUkLgojl6focSgFVic5zPXtem9VmeuDt14eSCxQblisao80
	KX4HTVLaPkphf1XWt0mPZ0jAWbcg5suMBMUMRDSislnwM+RejZ2+su26m8xd8LehPum85ixcpvS
	3FUhviVXevxBmp0ADLgnhVHyoB+4XQXlJFwQXhzfbo8/9SOrMDFB7zFndNRFLs11/QBZ13sj+Ju
	5Lm0DW/kIcnQ+AdwvU9BfR04YkvGNKyU9Zx+Hp0my87Fjqf6/cKD517bs1Ii9B7DbBDxbY61cay
	hDmT+F+Gx9Ngfns1XbUXKuZs+V+0QYAYLUvYPI/f3/FE+J8rQKzHVdE+GMQOjnFH9lOUqKJ6+4T
	yg6NKBz6h1wuWDyX37aBOvoBVKqzZsgH2Q1ota+IN8myvK240mmR0sX1D5rArYGzGpDe5Le4sem
	oLmRQLs43w9Ea+Eib2LtU1xomZNinw/blMv60W9e3C9dKrDVEvZMxDEyyzxX8BS1A=
X-Received: by 2002:a17:907:c0d:b0:c12:3597:2cd3 with SMTP id a640c23a62f3a-c1235973654mr75629366b.29.1782506998009;
        Fri, 26 Jun 2026 13:49:58 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe8118sm387907866b.24.2026.06.26.13.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:49:57 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 2/2] platform/x86: hp-bioscfg: warn on element type mismatch instead of failing
Date: Sat, 27 Jun 2026 01:49:45 +0500
Message-ID: <20260626204945.18868-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626204945.18868-1-meatuni001@gmail.com>
References: <20260626204945.18868-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_populate_enumeration_elements_from_package() returns -EIO and aborts
enumeration of the entire attribute when any single element has an
unexpected ACPI type. This is observed on HP EliteBook 840 G2 when the
BIOS returns malformed ACPI data following a failed WMI query:

  ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x000000032)
    is beyond end of object (length 0x32)
  ACPI Error: Aborting method \_SB.WMID.WQBE due to previous error
  Error expected type 2 for elem 13, but got type 1 instead
  hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not supported"

A type mismatch on one element does not necessarily corrupt the attribute
being built, especially for non-critical type-specific elements such as
possible values or bounds. Failing fatally here discards attributes that
could otherwise be partially useful.

Change the type mismatch handling from a fatal pr_err + return -EIO to
a pr_warn + continue, freeing the accumulated string value and skipping
the affected element. The attribute is still registered with whatever
valid elements the BIOS did supply.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index af4d1920d4880..78729354c04f2 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -163,10 +163,11 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 
 		/* Check that both expected and read object type match */
 		if (expected_enum_types[eloc] != enum_obj[elem].type) {
-			pr_err("Error expected type %d for elem %d, but got type %d instead\n",
-			       expected_enum_types[eloc], elem, enum_obj[elem].type);
+			pr_warn("Unexpected element type at elem %d: expected %d, got %d, skipping\n",
+				elem, expected_enum_types[eloc], enum_obj[elem].type);
 			kfree(str_value);
-			return -EIO;
+			str_value = NULL;
+			continue;
 		}
 
 		/* Assign appropriate element value to corresponding field */
-- 
2.54.0

