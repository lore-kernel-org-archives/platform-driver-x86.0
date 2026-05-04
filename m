Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCB42DBF76
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 May 2026 07:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777879686; cv=none; b=Fiyg+BTrKoXQTU9gKFh+Jzlml9qpCsWKht5odeGrLlqYRcZl2BjBGU2MXF90ptNUW5uKnUExEBS35B3mccKOtbiGn9QR4JG1D2TtBfzfa+i5olUiDLTsgT3UREv+IxZJcmu+zigPGr9UFebSKVgG5ROFaIHYPSEpzLP03sZ0MME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777879686; c=relaxed/simple;
	bh=wkjj1V129cGua7qPuaIuG3XH1E+OdCYhnBDLtLITRfY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gG6ZFt1rT/HjJkxjBC3nGBJCIh6EUqmbs52gaU5QtzabW2Y9f57Uq9bbcv65whwKYL1nHaMMdoiMQ482ZXwSZ7uFgCmD84VpCBod6kLJgGZEqf4E0K3i8VE8aaxgPYx5IN/LU1vysvJeJwbrTG2UAsFmQC1IkKKs3T1pwa7OEG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4E5NS6l; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4E5NS6l"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so25777875e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 May 2026 00:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777879683; x=1778484483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6xXJiy2WR+dWUhoCMEz7yjTpbIooGO1VAMiYqfrY89Q=;
        b=W4E5NS6lPjY2grxqPzwDOz4Qto/QyvXEKJScUs0Y7XIV084O7kEHyxjY8cWabfD+oc
         SY57SZ4ULOoOmLoHh1zzzunGQ9MGGJ89qTyG0yzJHIwIrEgOyT/e0bVcbjgGc/GkYQgT
         1FK2592/FnNBS4n434jDT7psBDOtXOLoe6/zSylFz1MY8uRyHNtHgUKTXFGDpeHMW2yV
         CqT81pH3Z2KSiKnnxZu7Q5+C6KrQl9zPK99ze0zSLFtxF1UFkPtGQy4pqLS7Ha0CZKZe
         KvTyUNfkKeNB78ojB35NIjzjHwsgdxUJeF0wQdLB60Yg3A3EfECpj2XSun4aFpYQFyrJ
         A9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777879683; x=1778484483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xXJiy2WR+dWUhoCMEz7yjTpbIooGO1VAMiYqfrY89Q=;
        b=BLxK9FYY/UgzSCFlyF1sK3k05lK6j5G+WWJnodz45EsGB7U4i3iI3mOJL2n2UGBfCd
         RhPQ0wAMuCuyzm5lzIH8RJVBJsJxX9nPf8fR4B2rg3IIwxgUyq0MfeSlU2E6VjLhuHsa
         fK5vrepl79QNsU/Qh2S38p7foosCkpz+OXl7vuQBEiR0f7u+PH5c+v03E/rEa3oV5QUW
         Pl1vl1BbA3tYjf9pr2X3S7EjqnDXb18nLwZu/BaR40MbyfwYZcr8td5DxdeCD88SZQk1
         1vYGb9y5uLxuxYs63ouQfmMpEpFgH766ptpwlN61cRpuFW0e5yJ3gDgaMLJ7FTVtmtF+
         l5kw==
X-Forwarded-Encrypted: i=1; AFNElJ8LiQKn5wqj3PEbxgYamGCwkhr901ksC3d7fuR7pd0V95qqxj/5zyVTfLykCYDySsUvN99Hszz302/ABqKW5zji9ywX@vger.kernel.org
X-Gm-Message-State: AOJu0YxOFLVprOmPehMkACx6f1OhEXKn9d0QKT6rR1A/WuDl6WvoLWE2
	Xa7XylqTMJD8zLDYG2AWuVoiR7cZONKhngqTJH7oCAIjtOBTopm/rBKdY5ey58wIMc/f5g==
X-Gm-Gg: AeBDieuakXaDXsr5MjRc3th7EwzTQroDoyHX0p+mzqePnB3FX8vAABBmZD3w/dCnyrJ
	XW9ehjSDeb+ybqR1R8soU6cjUNq3TLsyn9w7S6Z1k6IE0oPQANPvv2ETyFNs5KwNJi5ouYxdM5y
	3Gc1iKxmqM4UmE7YLhpGrawx1QiZqhjB8NCG1AC5LrVMy06NTBR0tiBUC2iosZe+UxEkafZ/Q6w
	45aUhw/OZoLcHJ31MrtH/dxJWbHl3wuRxV3S3UOBxy5MJ5OJTdBb1+S2izNyprW6YGEZWjAALsd
	/OuAX8zYBndhHx9Q//DbNKYZ0UVcUcfqTLCROi3eMn7uXJsn682QUXQOGgmDVf3J7/XsoaEvxGJ
	QfR0R9rR44pTkQCFl9+87w73XO5C2b4h2tGDPD37k7CimOP1PDRU7ZQ/3kOOGIbJ2xTeEmhBexz
	TjkH6lfQVZ8PwtQiwhcMAbWW7qdPq5zoc=
X-Received: by 2002:a05:600c:620a:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48a970171bamr128988425e9.0.1777879683150;
        Mon, 04 May 2026 00:28:03 -0700 (PDT)
Received: from xyz-asus ([78.211.66.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8ebb2fa5sm215265775e9.12.2026.05.04.00.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 00:28:02 -0700 (PDT)
From: Armandas Kvietkus <armundunelis@gmail.com>
To: luke@ljones.dev,
	denis.benato@linux.dev
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Armandas Kvietkus <armundunelis@gmail.com>,
	fxzxaxon@outlook.com
Subject: [PATCH 2/2] platform/x86: asus-armoury: downgrade missing power limits warning to info
Date: Mon,  4 May 2026 09:27:34 +0200
Message-ID: <20260504072734.17113-1-armundunelis@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a system is not found in the power_limits DMI table,
init_rog_tunables() emits a pr_warn() and returns. This is
expected behaviour for hardware that does not support ROG
power limit tunables, not an error condition.

Downgrade to pr_info() to avoid spurious boot noise on
unsupported systems while keeping the message visible in
default distro configurations.

v2: use pr_info() instead of pr_debug() to ensure the message
    remains visible without dynamic debug (Denis Benato)

Reported-by: fxzxaxon@outlook.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221441
Signed-off-by: Armandas Kvietkus <armundunelis@gmail.com>
---
 drivers/platform/x86/asus-armoury.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 5b0987ccc..b87e0b601 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -991,7 +991,7 @@ static void init_rog_tunables(void)
 	/* Match the system against the power_limits table */
 	dmi_id = dmi_first_match(power_limits);
 	if (!dmi_id) {
-		pr_warn("No matching power limits found for this system\n");
+		pr_info("No matching power limits found for this system\n");
 		return;
 	}
 
-- 
2.54.0

