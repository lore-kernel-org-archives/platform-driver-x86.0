Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4E0448B9B
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753791; cv=none; b=bZI34HNbMeubeoZuh3b+1rzNKyVJUIOZ5JOGQwcJZGeTKPPXbzVQEq1zDez2KJb8ifsjsF7vJpz+RYihw4BH/vEPgsi4FHLBq7RozAU/MmJ+/ZNWl1LXuB1266ACAcAZCVbkw63ZzhIgqPJK5z9s0E4MgyM+OaDoLbTOKXhkdiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753791; c=relaxed/simple;
	bh=ZBofP36J7JzFXh6ydHqvGErLUl1QN3O1mSZZFjUfVaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q6evtEUwfzdlDlGi1X58tAijrYJMIIrgd+bSKZHlNx3hkjBaWJAdbb+M1Rg4uh64vXDnKgjuR+2Zlg0Mls0q+rkBBZLE6DzJQoAz1mtaKGfpFVSZxa3B22/USzmJ/1vrGxWu8jRPsLxbdAI9SWEGfmWkF2Owic2PO+wwogS51zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYiFknvM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYiFknvM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so5948255e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 10:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753783; x=1790358583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElMdFDi2NONXJb5bv3y4m1vT42e9NSOKKUzun9eTuWQ=;
        b=eYiFknvMWayePJas52zRW2j2UkO1YN3erLlQE7wsfzwsPDuR+r+ouUMk7N5CUf8r7m
         XSV/IjcE58iiQ/Bn12cJChPvVBJ9EHdZzWDCI1H5NlYZUErIxq+uBm6glpKraJ2SCXXC
         +RLondrZV5HLIwdTa72YtGN8Hdbu0fiJcTysl1cMbqIdS+mU0elyJbwFxedErnXetcwU
         3mQ3WwZVafFKLXlwcjlU+ggEjkwSy+9FJi+7KOPrgpuczLOv/MVqGba03iJwdfUGsrVc
         iq8zsPXPBATMGtQxw9bfe/gcVSPcZb2qAgczuKctrDlhVcHuVKHZoS+PGz6mF8GEQTns
         chXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753783; x=1790358583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElMdFDi2NONXJb5bv3y4m1vT42e9NSOKKUzun9eTuWQ=;
        b=A1bD4UwL89JOXic7PdSxL83NTPhSHZxNjGbz2EYLig1pbVHDiYtu0RXAtYV5IVJNH+
         nv22ymMFqmU0W3xd44mQHUUyBrVE33+CpFYedBXlMzirNtCIrOUzWAupxiJahXfy55PI
         HeT2ZoooqMurPN1It5j6Uks1MsJmUupZY7cbiO35nCPkzJgKAm90cJ9M0nRFV/Bikxlc
         2RezWg/VDVNSn25IVc684czLfh4vNN4ZwnXnzQ7KUrSyXZIjf7B/yM0SBfywwLBt6E7q
         Tcxcigqy6vRF7+zKKIkNt8QbRKYMRJTTbatCwWrN8YzMXCWbcs+9Plygo/XV1xlPC4is
         KTlg==
X-Gm-Message-State: AFuF++nM/PrzQep5b47hYXEUCVXr6u2/wmLu23yKJkyeFweXduyXB1kH
	30Mi5r687+sxN7lHVOI/O9kBNrZfEaeZ9jpso0ZyObdwCKgp1ZJKISqC
X-Gm-Gg: AYBFou1VZ9VnB02TaH3l/8HDFUX/XGJ4DtHUQF9k6Iz8wvv3nGskpn85kJZW4/8KLH0
	l/M0SOndfKfqO4MrK7QFuNRMkeu7aSUJ3nO94FlGlDU7kU7nmXS2s42HJr23WL4QmjE8IDscn+c
	QgiTPSDI1oT5Lqr6qFWtXNNZQjdJGiTCfme816qKJDnPw0MxNwG/P4LynhHv23OckWuLLRGl6S/
	BUYSZNPa/IPdWQGf4l+jrwrZ4GklOzmg3IrbxVZ4+FbQzrKGbYM2XJR5ZSgPKcQnkSvNqIJipEy
	UQYQv7V5J1rXdtE3rOM23rghSupwKZbmhi4YiRFGFr8gZIST2tqfs6SFPN/Hi51VToUszj6GqI3
	ZUBLCEOSS19h8k4bqnXd7eogqyt9dQnTfvCa3hB4dYtiBhnl0eZQUAjE4DBuWTtmdTDSgNK01Ye
	ZvntI/46rPDWN8Ahf0n/uXQTI/Tf7kd7UdBXwzviJgpj7GBP03l3NJFwV1uiTv2nxQMIUXJICng
	uMjGFOqjQYE9jZwAS5d0K3W622Vl/dT3zQEDLk=
X-Received: by 2002:a05:600c:6995:b0:49c:dadb:18a7 with SMTP id 5b1f17b1804b1-49fc56873a2mr41408465e9.10.1789753783231;
        Fri, 18 Sep 2026 10:49:43 -0700 (PDT)
Received: from [192.168.1.7] ([185.69.144.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm9867425e9.9.2026.09.18.10.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:49:42 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Fri, 18 Sep 2026 18:49:30 +0100
Subject: [PATCH v2 2/3] platform/surface: aggregator_registry: Fix
 tablet-mode detection on Surface Pro 11
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-surface-pro-11-aggregator-registry-fixes-v2-2-c4ed9335814a@gmail.com>
References: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
In-Reply-To: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789753778; l=1322;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=ZBofP36J7JzFXh6ydHqvGErLUl1QN3O1mSZZFjUfVaQ=;
 b=TUcm1kD2BXosfEyJdlHYx4eFuXQ8I0KdTLHsxcbfOXRzsJqgJqgy+UWBE3vn2ALBo+VeSd6Y2
 d/DbsLOmN7jCccaAZ3qIrd1uNdTTwr5V57DPJLuNFPXQqCiAP8tkOgL
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Replace ssam_node_kip_tablet_switch with ssam_node_pos_tablet_switch, as
Surface Pro 11 reports tablet-mode via the POS ('posture') subsystem and
not the KIP subsystem.

The KIP-based driver would remain stuck in a 'folded-back' state after
suspend/resume, whereas the POS-based device reports its state correctly
even after suspend/resume.

This fixes the type cover keyboard/mouse being ignored by desktop
environments after resume from sleep due to the erroneous 'folded-back'
state.

Fixes: c4a069095395 ("platform/surface: aggregator_registry: Add Surface Pro 11 (QCOM)")
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 82c2144e10ec..2cb8278d98ea 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -415,7 +415,7 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	&ssam_node_hid_kip_penstash,
 	&ssam_node_hid_kip_touchpad,
 	&ssam_node_hid_kip_fwupd,
-	&ssam_node_kip_tablet_switch,
+	&ssam_node_pos_tablet_switch,
 	NULL,
 };
 

-- 
2.55.0

