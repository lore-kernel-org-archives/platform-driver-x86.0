Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F937E0F8
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709212304; cv=none; b=MgVnKVXqXIl9ZVvOiBcCmuws427Ny/klDMZaKTWoILpIu500ikzqXhgWY+UKfLMjgQgTe9IQ1U12j4TaZ+m6pNHcAIlLb7czTkN1FQLKEDNjzEy7YB9m+2ORk59LY/XAee5TFHTqbJHsjd4W4j3wfQE4HBH0s75DygF18jfy9Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709212304; c=relaxed/simple;
	bh=lQEzSztbGwuMcXFF6UoVbrUM+PR6UEuexVzSDmGCcRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=raooECKl8+nvesxUBUnSAt4Kd1jeUoEhZmnuv15m3bNeZFemCzGWuUCCJswPqTrsbB8QJEsDIdb5QPwB/OczSFcJgG/g2OULt2spQI8trr1OYUdl9jvM383VI73M1OHraIisVvh+XWnGiJU5q6hDYHiKhF+/61S4vmR45FBUnl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DcMO1HHt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DcMO1HHt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-412a9ea61adso6488555e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 05:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709212301; x=1709817101; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lg2hnToVZ/EBQAxgZOoEwHDmIEWKGQv1sU1Wb9UKAB0=;
        b=DcMO1HHtRTX6QJOoTLOMlxgbshExarEF6zmAzlNZGW6Ffw38fZMv4hBvFm2heWxTex
         ZNz/Y5/703WBmemRR4ODRgRIiXn5ruW+KkqY72++NnNAaLw+ioexydWpGR16diwu0rBH
         XaDeJdL1cmWr/6uJLudpP5gjbt7OWWI4ufPrbfmMMb67IcJwILxPG08OLsWEL+bS7VQK
         vg/ZKg7dK12DrmpDLSXEnUuGtJUcePyubOGU4IDsWVe5aqa0cNZF+kadi5A/u3zLGwYy
         SI6/Hy4AJ/Hxq0Cn1V5v/n0a8GnQ+j4dalvUTtYCYpwF8vtPDlDp4Wb8aMfbMEp9mq02
         tWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709212301; x=1709817101;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg2hnToVZ/EBQAxgZOoEwHDmIEWKGQv1sU1Wb9UKAB0=;
        b=Loll9pTBMJuDnzxwibQAAAP2UpStm9Pmmh7+tZfTYcEEsCwhIhq0OB5clvOdosAn9R
         G77E4Cw/oOjFA6SH2gF39YooL4gikIdFkxbfzjwDNQaLSNNq/IeXNDYkGDjc7GqizKiC
         a5Cr7lIEMwTdZG92ze8YwT4HXNGdIo6sUQPtdwJOvZL/iRS3uAvhpINkPWAb0ld45QIY
         xWHGV/IUUeyQ94ZVyWWPPfE1FO6rhQlKRB6n5vLq/tNjdmdKR8/geMr5E1HIIPjGpPrO
         vcS6iNq5F99diEcffOfz4zo5JN5kiVanAyAQa+ozpN9GQNnMFmDUbg1IzTB0G39EZke3
         Z7tQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2i1+qiSguPFGeKJ9eo+Guks3Rl44EWV2ME2TU1BSKV0HQV5C8LXnDnsXT//Ao6rSnBezhXn9nvIq3txkiDJ+Sl9HRzANl1sTJiGbQcMWprMuE3w==
X-Gm-Message-State: AOJu0YxIt98XtXqBw49cW6RG5lxnqFsantnj9MAWRmDCWrMgfBih1vcv
	8j/ljyr8wnuTNgcCOMSKLhizaEqPmURRbHrImd7Sgnhx/a53VSlJ7mZLSSwNgiM=
X-Google-Smtp-Source: AGHT+IHo6JyA2wmSz5Sf2SkJPUbSX5WC3VJIKq8+L2nyxU86/uGcghVzDXPtXTd9UjeiMZU/E3gBug==
X-Received: by 2002:a05:600c:4587:b0:412:bdc1:d0f9 with SMTP id r7-20020a05600c458700b00412bdc1d0f9mr1300832wmo.38.1709212301127;
        Thu, 29 Feb 2024 05:11:41 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id jp21-20020a05600c559500b004126101915esm5165227wmb.4.2024.02.29.05.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 05:11:40 -0800 (PST)
Date: Thu, 29 Feb 2024 16:11:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shravan Kumar Ramani <shravankr@nvidia.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/mellanox: mlxbf-pmc: fix signedness bugs
Message-ID: <a4af764e-990b-4ebd-b342-852844374032@moroto.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These need to be signed for the error handling to work.  The
mlxbf_pmc_get_event_num() function returns int so int type is correct.

Fixes: 1ae9ffd303c2 ("platform/mellanox: mlxbf-pmc: Cleanup signed/unsigned mix-up")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
The code in mlxbf_pmc_valid_range() has a check for negatives but that
has a signedness bug too.  Fortunately "(u32)-EINVAL + 8" will not
result in an integer overflow so the offset is treated as invalid.

 drivers/platform/mellanox/mlxbf-pmc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
index 250405bb59a7..bc91423c96b9 100644
--- a/drivers/platform/mellanox/mlxbf-pmc.c
+++ b/drivers/platform/mellanox/mlxbf-pmc.c
@@ -1496,8 +1496,9 @@ static ssize_t mlxbf_pmc_counter_show(struct device *dev,
 {
 	struct mlxbf_pmc_attribute *attr_counter = container_of(
 		attr, struct mlxbf_pmc_attribute, dev_attr);
-	unsigned int blk_num, cnt_num, offset;
+	unsigned int blk_num, cnt_num;
 	bool is_l3 = false;
+	int offset;
 	u64 value;
 
 	blk_num = attr_counter->nr;
@@ -1530,9 +1531,10 @@ static ssize_t mlxbf_pmc_counter_store(struct device *dev,
 {
 	struct mlxbf_pmc_attribute *attr_counter = container_of(
 		attr, struct mlxbf_pmc_attribute, dev_attr);
-	unsigned int blk_num, cnt_num, offset, data;
+	unsigned int blk_num, cnt_num, data;
 	bool is_l3 = false;
 	u64 evt_num;
+	int offset;
 	int err;
 
 	blk_num = attr_counter->nr;
@@ -1612,8 +1614,9 @@ static ssize_t mlxbf_pmc_event_store(struct device *dev,
 {
 	struct mlxbf_pmc_attribute *attr_event = container_of(
 		attr, struct mlxbf_pmc_attribute, dev_attr);
-	unsigned int blk_num, cnt_num, evt_num;
+	unsigned int blk_num, cnt_num;
 	bool is_l3 = false;
+	int evt_num;
 	int err;
 
 	blk_num = attr_event->nr;
-- 
2.43.0

