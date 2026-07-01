Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E884071CD
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jul 2026 12:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782907320; cv=none; b=RthlZUOft0nP+1zzcvOcw4/vL3+4kUEUTWBIRwjdUlG75CQWc5KuUZnzBI5wcXKraSP5FNGzcFPG1ifveAovRp+0/wIjF/aChivO2DdrUz+e2Z66lEjzTVDFRIWAGoFc9bakJjVXEtLAD9PFgWgFCMwQpkEGQxN36ZvRxWH7Hz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782907320; c=relaxed/simple;
	bh=CY7VWBRG0rall9tkknHUwoShIblwsaP6joQQ2xWnw1w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=L5a8dFGK1TQDqGNV/m89lmHOGuy/101M7eca2xE71+LQ1BSt+8bBnC4k/QnTxBRL+Vs8Gj4F3efU0FUYBI0yxZ9OKtrNqU/beO7wUMOROC7S4tZYGaE0h9CQKX2SwZMk9Pzi1XNhaRMAw/O/fEw9yPpRz/EXyhN7ED+BKxzgAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/B/yvhU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/B/yvhU"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37d46e0d246so254901a91.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2026 05:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782907318; x=1783512118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yypvnvw9usVAwqAgbkBjROJfEgx/inMBLzKZl1cxVEo=;
        b=i/B/yvhU14LzFR71QXSaQyvI1GTNGYAeUIJXPDyutHkMxFmyo/p0TxFpF/+KQxmRVn
         DAbZwp6urRuPqWVtbmQ1px/St4W9io9nOmB4PToX9s0QEqqLPd9HNhh1Y91rgLBBtXze
         k1PEUqi8lFiex1Jg0WH7/YjOkfo85HvV1WAV6qCAYsL8KgNijsuivlWep7+GsF/P+8ki
         7cMBbeMUJgn6Jx+36KAkxtpU7oXCV0EdPpoqQ3st+IuC08txN0k0oNwTVNB6ex29AUFf
         WQvMCpr9CzWdagKv/rDC/LOmY0IJanXzDmzI6+iU02NITyI0P9EquOdbprak7PJ0xXd4
         J5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907318; x=1783512118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yypvnvw9usVAwqAgbkBjROJfEgx/inMBLzKZl1cxVEo=;
        b=ZbBXc8JVH6Bq51qn6vvQcY1o5wmC3V/DagAh/MhmMAdve0CbgYKdgKtfB6QAa3xGmg
         btB7symk2FHlWKbwrRB8XEnFlxI67D9ZsKa+oJpZDhjDwxet0UJ3OUx4Hp92046+yPnp
         Dua8iKhCD8W99sYcnL8/ehuvDJk5mqm/summjyAcQBX5+wXat28npArqg3gUzjV58IJW
         Qwl8WKeFuKof35qI5wznWzLbvTHx8vhdywuiTxEwHzQU2JctlpOfCLWu34XJqpgeDF73
         eF8/Xf2LMRc0mWh08TZYklR9C+CVyQyOMZ/QRYMOkgeHsbHJHbnmbsObGPxzHNEyTVOm
         ORng==
X-Forwarded-Encrypted: i=1; AHgh+RqKaZ5hmPe6wZx2nPCouQA+jm7gpr2WbyTwpFCBKIZt1OKiXisc/l7Pj76fIBTWUOXQxYsEk7iVmtDNKhtY9KIa0W5g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2j5C9Nmrb3cpj+9jKtIbr7qZwuXk+JBKNdBY9qh0qu6RWqTQt
	11ZZzkevqTeg42sj9dnaUS1UC2dvy48O4+C8P907jDKX3dCrAakklcaW
X-Gm-Gg: AfdE7ckPTsQbIDc2GLmiCFvQw4rkRkuvoM+gAzl5Yq1Tm+MNOOK6DaUZcpa7Ps36dyP
	XXjwqP4JuVdz2H5auyVQZIS3hnUOtY2nBuMs0BMZDV5KnsU+Gl/+FWavgnzlOclJvgmyc+YcW6O
	n0zdgmF62jtG+AojH5ND0xlYiYYXWc+kFYGjYFghOXaNxPMtGmTciofHnlgWG8PViWAiOSqeWry
	ThRyyWVIkg0dAhCVuvbZ8EUr0G9i1Dv1ErPOf0Tva4fHkCwE/D8FrWRSOptD8ZL2nQ+6XieaTBq
	1vwt8qvIJAiXtmtg1DVIjtySVBjobYBovlPSqIabSZ2SrtQOvnK3sL054m+wAw1uZubc7qqR8wo
	YGYfhc7xy5vTpyi/ddqfp9ZDd6BPK3ap/PjCCwL5vQmtI61R+PPC8LF0ArV/6sc3MhebCHAF2fg
	==
X-Received: by 2002:a17:90b:4f4b:b0:37f:fb1d:63fa with SMTP id 98e67ed59e1d1-380aa1427e9mr1442378a91.15.1782907317734;
        Wed, 01 Jul 2026 05:01:57 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38096451bfdsm1794387a91.14.2026.07.01.05.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:01:57 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: bitland-mifs-wmi: Fix NULL pointer dereference during suspend/resume
Date: Wed,  1 Jul 2026 20:01:39 +0800
Message-ID: <20260701120140.430659-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver registers two distinct WMI devices: a control device
(BITLAND_WMI_CONTROL) and an event device (BITLAND_WMI_EVENT). During
the probe phase, the event device handling path returns early before
initializing the platform profile device (data->pp_dev), leaving it
NULL.

However, the PM sleep operations are registered globally for the WMI
driver
and are triggered for both devices. When entering suspend, the event
device
invokes bitland_mifs_wmi_suspend(), which passes the uninitialized
data->pp_dev (NULL) into laptop_profile_get(). This leads to a NULL
pointer
dereference inside dev_get_drvdata(), causing a kernel Oops and halting
the
suspend sequence.

Fix this by adding a validity check for data->pp_dev in both the suspend
and resume callbacks, safely skipping profile operations for the event
device.

Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
v2:
- add Fixes/Reviewed-by tags

 drivers/platform/x86/bitland-mifs-wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index b0d06a80e89e..3a373184519d 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -300,6 +300,10 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 	enum platform_profile_option profile;
 	int ret;
 
+	/* Skip event device */
+	if (!data->pp_dev)
+		return 0;
+
 	ret = laptop_profile_get(data->pp_dev, &profile);
 	if (ret == 0)
 		data->saved_profile = profile;
@@ -311,6 +315,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 
+	/* Skip event device */
+	if (!data->pp_dev)
+		return 0;
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
 	return laptop_profile_set(dev, data->saved_profile);
 }

base-commit: 1a3746ccbb0a97bed3c06ccde6b880013b1dddc1
-- 
2.54.0

