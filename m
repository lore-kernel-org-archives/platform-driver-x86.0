Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C980A244694
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 22:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777589609; cv=none; b=jKRGW6p0v0rcakcvOfdxCryH/hNvHKTCQMIM0sDbnp0BPO8/Z2YSwvq8BGuhpeIBOfPwYV2imNnsBn7jEMZBmSeLieki6G3uyuRtyfAO3643hyacMuJKNIZLALsMVj2uPSyT6D5eQl/2rYl9rMPQNHiCTL+rUnTdnOJCQJrVBqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777589609; c=relaxed/simple;
	bh=skGTGrLVcifH8lHYXyJ1EySzxhgSJcO8bcxVlpJNh7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cw0tzXUt6qgwm+9l/3u9R+Z50eu5jxP9O85dBX2XUyp3hTsNzMTAwgrsPWTTd/VTCyZCeHi+oTJfTvmUUKRUbvq0m8IjObfN5LQ9x/YJYGXxGAmsfHoOspqOv2/iVtjWgaj0Gk47KKgigOFR+vh9XwLSiVBIF3a6xywKoasZBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NF44lAF2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NF44lAF2"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f1f6103afso661317b3a.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 15:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777589608; x=1778194408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3sFxgw4Clv/Aqa9OTsN2Ya0IWvB3CZpXJ32lJDy2rEw=;
        b=NF44lAF2cAM6Tj/PSLsyHTnqn9ik/quFEGK3nLK/eRXubMHFXq1xjnG5hdDr1sLbLW
         LUu7FltY/8mO7N/pkgrN4yKksiTYyYZwRqBb50Ch5NJePbwtwXleH8RtApw9qKlbu9Np
         6Q5RIivI9n1vL0RYU6crLDeFkgoBv6eZzhopz3U2xA5g+fTe/XM7pvq5/RPIxukbX9cI
         p9ykMfR3wap64xSO3gq1Tl6SMNylQKCmx8awYJB5fI+UfoVqk4+LSvGmslCGleYP4WmF
         U/tvLuNjK+wv13vb0A+cvCoXfEKEb/bNjKagdItLHm2aMyPdlTuO0g+zu1GK3lWF/hnv
         iOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777589608; x=1778194408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sFxgw4Clv/Aqa9OTsN2Ya0IWvB3CZpXJ32lJDy2rEw=;
        b=oH2DV8Qq3eU+so1CFBRu5GZ4KbVy7ZeSVQ5ZVpFf223ll6YOuRkLCU+VWedULYuQzV
         BO+9cRaczvcyrNwvMy2gRiIe/+2+nCAUtqCDVf1vGAKZ+UxjGRIxm/HRJnYl9hg0HLhL
         Pi+kRrLpvgLY2UJ0Hw6+SxUIEumMgRs+smK447kmj//KW/+wwz3xxZ3XvfE5uvgFMfl+
         5fh6A4kjKf4IQVhvdWPYgC/YPCJhCa01kvIo1GR7xX75fIG180ZTdC8IsZEXu1fu0Tfg
         te2CKx3WGd30HUNpI+Gr1VECNHXnnnhviUX3g74LVLQYyOyAZblauQbtGf05EwSHYV0o
         LWmw==
X-Gm-Message-State: AOJu0YzOYJy0WVN+WSEFhZb1P25/DSx21U4/ZesIEZwHf+BCDzvsFl70
	DEhN08nu1G8a7dNzkwpvfwPr9TbsG8fttaKDpni4m5hUVsM7opy9n+9ile0Rc+y0
X-Gm-Gg: AeBDievrOI/ou6JfG1F5VeIHCIQOSdHj+ss+kS65AXMtbOqqhsS6v0oKiltzpNBazsp
	wxuGZ56Wz3fGWyzfJjD+/mhhoSQimNlxZ5UhSVSsq6OmhkVJ6cowp52taCrCZ4TD2IDfzLrvqM/
	z0zPvT9x6QUOjN6c+2F0DzTKVCIEYNx+lI5lRns5y53GfmTNkP2XLSq1DDAIeqywou42G0ni6tb
	Bsw6mUvZ6igyH87/72027/W969h2cocMeVN8A5TnDh65gxtgcMrcjvusaqu/dylPpWPJnfOEhhG
	y+5R0tbqiL6Ai15MESBQrZkb1cxOzCbqu6YwkId8qJrJ0zLkgSw8eugNK8OyqxnIY6XXdUugryt
	1SEE87JogCs6wFazZiAVX695BYa1AO1f5NGcsAxDBplCi81zi3tCizkZMNHXbRqA2KU6nFf7ey3
	EtBSllAaGoCG+vzqVitlOircgqXNL6VTuniSVocw5f3aTop3F9AUFufSkntxXLURDFd6/Lhi+s7
	TGN2xXrgG9SxzYNRl+gUHQ1mgDzsSyiMJvr65ohj0ISaA==
X-Received: by 2002:a05:6a00:9a7:b0:82c:7876:a027 with SMTP id d2e1a72fcca58-834fdb4947fmr5496414b3a.18.1777589607741;
        Thu, 30 Apr 2026 15:53:27 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158322f6sm757564b3a.10.2026.04.30.15.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:53:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] platform/x86/intel/tpmi/plr: allocate die_info with plr
Date: Thu, 30 Apr 2026 15:53:09 -0700
Message-ID: <20260430225309.117557-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplifies allocations slightly.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/intel/plr_tpmi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel/plr_tpmi.c b/drivers/platform/x86/intel/plr_tpmi.c
index 05727169f49c..2fd27e80bc1f 100644
--- a/drivers/platform/x86/intel/plr_tpmi.c
+++ b/drivers/platform/x86/intel/plr_tpmi.c
@@ -57,9 +57,9 @@ struct tpmi_plr_die {
 
 struct tpmi_plr {
 	struct dentry *dbgfs_dir;
-	struct tpmi_plr_die *die_info;
 	int num_dies;
 	struct auxiliary_device *auxdev;
+	struct tpmi_plr_die die_info[] __counted_by(num_dies);
 };
 
 static const char * const plr_coarse_reasons[] = {
@@ -278,15 +278,10 @@ static int intel_plr_probe(struct auxiliary_device *auxdev, const struct auxilia
 	if (!num_resources)
 		return -EINVAL;
 
-	plr = devm_kzalloc(&auxdev->dev, sizeof(*plr), GFP_KERNEL);
+	plr = devm_kzalloc(&auxdev->dev, struct_size(plr, die_info, num_resources), GFP_KERNEL);
 	if (!plr)
 		return -ENOMEM;
 
-	plr->die_info = devm_kcalloc(&auxdev->dev, num_resources, sizeof(*plr->die_info),
-				     GFP_KERNEL);
-	if (!plr->die_info)
-		return -ENOMEM;
-
 	plr->num_dies = num_resources;
 	plr->dbgfs_dir = debugfs_create_dir("plr", dentry);
 	plr->auxdev = auxdev;
-- 
2.54.0

