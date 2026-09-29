Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F652CCFA
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689543; cv=none; b=aMFM7c/uFWzSQ5NVbPk3WU3xry0hojOSRwJeK4BAOirwN5rG/3S/Nx1oRQp6P4HudGeF88RF628az6ErW0W4a2sc5+tCeAkOoNhEKH1qaYMv151xWVLiYipA6jBngjassUOiJ2Wh7lN7sBFAEKB/x1Gj7lpoxpNM/3dbXeYDqsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689543; c=relaxed/simple;
	bh=d7V63ETqS5KwO2JLJJ4phi9OeaE1qr5eUbFXnwkj0e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNOcQ0BN+1XdSy/eJ/olQ4e+G6RCArk8fYtg8W1/a8rNNBUAZMjvlki+eKftNN6c/LudcWhv1HfHiA7BxQFIQcX+4DxVcw/j6HevCoRlsztX6LDJ/h0IUDhdBd4d/9JiYnJnkK3dpQ0cwl51qY8F1VE/Bybb59suJw/Jw9xRxV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljqkyG4S; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljqkyG4S"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469b355ffso1802456b3a.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689541; x=1791294341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H73SBua2th6nVmJcdyFkXeo+q0gSIw9BBCqcFccuS6E=;
        b=ljqkyG4SYBFUAyuIOkrcI+6lHI9cuYiA9abwJIdppHH4H30bDq7d4YJS1NvjiHg1qY
         MgeKivLQYiG04vRsFdgGmccGhLHwtiyVJUmorapvZB9nVYxNii4+PoUz/01YcWn37ij1
         GVmeFMrKNuoyF7bvyWAeVlFSXWaTXvvns6ykx/dleKVzl+3MIafQ6MryuqdPe7PDOK/f
         MgM4o0V8vOX1LSDnXj1KyRt3loDtqdCbIaon1hAiHLeNHtkAfba4eKPxAmvUceCNghvU
         RO1rwy6sT47GxnTKPCCFAG7fMKTaKO6kw2YWPYaa8N8/q0DF1yteqdT0Du1xaDD1fGLk
         62qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689541; x=1791294341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H73SBua2th6nVmJcdyFkXeo+q0gSIw9BBCqcFccuS6E=;
        b=rJhv9Fv678PT/XbgJ68J0JJAJllUExSQnGqHSMZlb+itiRhAwO/pLOoSDiUa8QdbGA
         yrS74C72724uAD9zdTr8OtrQWRsdTacsx3h5u+DBGXyF+zWYGYzGsCoSmsq7B0KiJt8y
         vDQPDmgD/CkB5LaRhzGAMOV9T4d6ae6MHAejnUiBBnXhqIgPZZJRsY51ooom/cvVpQ2o
         wgS5f56E+8XXIN9k4PP5m23tkm08uv8C0mZljXl7JOEd5kLfzdmL+1otGnFWhIBpJmsM
         CZxfI1CLgksRgaOPUEgLyKGBwscNFBWmClKxeH2mEPYzgkP7jGMaXa8lLcVeQLFE6Bea
         AYFg==
X-Forwarded-Encrypted: i=1; AKwUvBwp+A67QbKEnbgRSo3yCpqqvF+vF6F9S0hihCeAUQQukfcqAg0do4j8O8Heieq3mXqW55fkfAFFpS7GmD91n/jM0K/0@vger.kernel.org
X-Gm-Message-State: AFuF++nes8kL7qG+Hj1PHj3/fBmDq0pLk1RTg8jKzEkRuXmGEvBdfuGV
	2W8JWIxS019ndvRYgWBY5wnDqFbnzsMQOYUTmcPtE4t95y1MPkRLJjXM
X-Gm-Gg: AYBFou19fH6HDM3dosWVpp++yxbgNeNyWcEg9dyHzt+0poWMncQzlO2oSIhtuC6ygnc
	2gLbOc3NUJ8Ko/11ZK2DWlZvOXe4GiY60/WY/DGBITZtqtb/3Oq5P0/z+IyHlW++JLenbuvzYqy
	l+6nTRWJVHxQoLcdpmvPdIBuMDIfdC+PF0kaFZjbJyLTQOV+wzx/zm7BDzQjgXR2pxj3zqL9BSj
	FyO05WOJ0d7wXnNZbXGs9NOQ+huR59CR1pe5wH1BsTb9ffGyD1uxZvvvwhxqLZOeFzFrsQEZPlr
	T3TB9K36kEVjK5S5ITIR127kN5kOZ3jQWfXclpKaAIhp2sX0IgW2Ga84EDn1BjD99Z7ZcmrvKIb
	J2D091L5/vQv+OJVS/HX66G62TMolBg1kqoX3R8lnL0tJxKMMh2nB02QpHJZhaMRV/4uiZVW8S/
	3bLlBFZ1pivcAidZJ6pKEKqczXPln1f18hVh1OO2evsz0TLy/9NDUK
X-Received: by 2002:a05:6a00:a90f:b0:87b:6b3:2cc4 with SMTP id d2e1a72fcca58-87e9acf09dbmr13282245b3a.29.1790689541243;
        Tue, 29 Sep 2026 06:45:41 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd736csm919555b3a.8.2026.09.29.06.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:45:40 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v6 1/5] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Tue, 29 Sep 2026 13:44:59 +0000
Message-ID: <20260929134503.17249-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929134503.17249-1-qby140326@gmail.com>
References: <20260929134503.17249-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d55b637c32e1..c0b657dfe11f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23042,6 +23042,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Gladyshev Ilya <foxido@foxido.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.55.0

