Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241713F8EB7
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816684; cv=none; b=HQIianxM2ub6eF9QErvlDvQ7/G3a/9m8wvp+b99q0ooGvA3fGeNoKRF8MAMtMQ73ILnoGuy7RH9zTpTOQsRhMA4qxBhGXUBshVXrIE62v93S51R3Gvi8QFnKR1TQO3vEbuKivY7p93neJ8tCsFMWNXyIc+8Oqkya0XlRW36o1co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816684; c=relaxed/simple;
	bh=09R+mm/0CdcT7kZPmNOJtHynQNQmEUx9OVmcwuEdXCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BjXDfCZYZ8ZcqQkUlIay99p1TD3u55uDdddPvD3Yd60i11FW0NdidGmyZJlOOBamv+PjCeBXIxLgg/Yw4ALA9vozAYsbcwR5PQpETa2fpI2JpwC5SHiLMgHPriKL4mKoUo7eiLteOnqgRl/JiVMH6SZR4+j8JSj9D/Fq9/aizvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHNIWsKO; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHNIWsKO"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-80e4455b9a3so21166957b3.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816679; x=1783421479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e6Ee/zs7JiO+phBDDCmBDKyqLSYwNIESmp5ijBqC0iY=;
        b=gHNIWsKOOdjJfWShgsAAXRFIgaE/kM8OwoJBXwrGR7XV2zMoVwV0fzDYamLsxa17DR
         VRHE86qYggiM4uKpNwQG5QHzo3T4/4NCg+dEqJxTAMYDZuSuX57wuQU9ml+lJ60QAL4m
         2uCQpE0/cLzfH0BDlF7jEbs2zRNCb+n0U3aEnDgVeFQOWqEnTSsYyCfSZdGeIckyWhW0
         774M/+Jy4shpqkEHOkqYbaWB7NsQiKjTfnrRZN+G/wEE5HF/gGkr6iHE0lUwz2QWWyD/
         rlh9o2NSudyQAz1XeKtkdmx2ZeOw9rVZQ6nvHjwMCDwsDFZLePd72azlZkyYiv3kci7c
         oMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816679; x=1783421479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6Ee/zs7JiO+phBDDCmBDKyqLSYwNIESmp5ijBqC0iY=;
        b=QgXNf6BeBM+uD3TYITRC85F+y1heht0hKdm8EYnTCCWwJW94QzBEG91p+jN6x/7GT4
         qDMhx9x+K/kWwMNqyKwrzcSxweOf11neLKVecFSQHkQO0ajVR2MHdRQbE3S+vAmaWSxY
         GUDjq5lDiP5DwxhsaaLHqfqcOf4BjK8zEoiTjWHMfQAQXF1whYwfHCtDel6SVb8IzSLw
         M+CoEvJa3vAeW1AlalMVrmEA1ZTknZsHL6H/NnooI+DyomYwvcXCR5YN+i1bUZixw+5y
         wTD7Koc94NpG4iK4+S2w8jLtM4sDsKg1FXWis6tL6GQWY+Y4Ug290f6fzp4oBO7YVVG5
         hEKA==
X-Forwarded-Encrypted: i=1; AHgh+RodTNCtsgtD2WUyOAh5X6woCtD8WAk9bd97kI32uebDTgIwpJul5vKQ1WGk2t7bwpguaHvCbSSMTEhlUwnrhEe/po/U@vger.kernel.org
X-Gm-Message-State: AOJu0Yys6Td6E36y4wlgdVSt0ShyODF9vBN0cFo5uL6Q1KWwNdHxVqOc
	C8H/Lxut7FBSiX8HT5ajr7mWaOrqy3SOpPobg9ZTo0zMJEc2n0XsPxE4
X-Gm-Gg: AfdE7ckd3/6+HM/9Jn7+J4ASFCY/0pq91+T82Tma5HHC7zKnsAXH+zfevuKGQsi/lu+
	pGizM85/w76mLv9PnkGg2vOiFqvc1N7ifxSOBIRF78x8WFd/SalX21QOjijLkPXDyK1L7haXJ4u
	I9DXUPHSw2KTJ/hxEsSaxvYwTP62/GMwDEj6oJJATGeDwy3z3R1WcSHqYmSqFFOd9Z6n1K1LqBS
	gOdPO2UJS2vaN/Cdr8upcZ91agl+GG6NriWcddzgg18cp+PvEp9beGr5gcBQaLNSdNRBFoVRsmY
	44/P5YE1HEb3RMGN4eQT3JwU47NqNuAW/XsT6EbLkFbla7dEBOef1Y/MxJCFtB5FTDP8jf3NR98
	FWbtpCNd/dQq9ezJv1P9ensqwxBwMys+QutS9fuvCc3BLw2X68u+WJTkTxzo+AyVB625eZKRA72
	7wFKC+G55aW0Ee2BQxSfR0YSfE9Q==
X-Received: by 2002:a05:690c:4b89:b0:80c:85c6:8988 with SMTP id 00721157ae682-810dae0eb95mr32240877b3.71.1782816678738;
        Tue, 30 Jun 2026 03:51:18 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-810e7a722ddsm9143357b3.18.2026.06.30.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:51:18 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	"David E . Box" <david.e.box@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] platform/x86/intel/pmc: initialize empty PMT read result
Date: Tue, 30 Jun 2026 12:51:01 +0200
Message-ID: <20260630105101.54016-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmc_core_pmt_get_lpm_req() returns the last telemetry read status. When
firmware exposes no enabled low-power modes, the loop does not run
and the function returns an uninitialized stack value.

Initialize the status to success so an empty mode set is handled
deterministically.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/platform/x86/intel/pmc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index 825ba5fa0bcb..9f77c0716e59 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -1583,7 +1583,7 @@ int pmc_core_pmt_get_lpm_req(struct pmc_dev *pmcdev, struct pmc *pmc, struct tel
 {
 	const u8 *lpm_indices;
 	int num_maps, mode_offset = 0;
-	int ret, lpm_size;
+	int ret = 0, lpm_size;
 	u8 mode;
 
 	lpm_indices = pmc->map->lpm_reg_index;
-- 
2.54.0

