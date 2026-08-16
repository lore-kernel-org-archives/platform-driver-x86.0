Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610FF37AA83
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 00:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786839139; cv=none; b=jBMNU6jgikckxg56IrQncc79pjmjn2TMSNVFia8hXTPXdnhNBIwd6wkgGyuqRI0kxuM3QK8qj5xTOXF9NQ4OLXkcMGt0RnlNLwh5xBC/cPGKEFBi6t3hHuWexxGZWcwcACIEQNgcZ/QZguzgC2979LJXX2ztAKjGZZMCcI5ecA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786839139; c=relaxed/simple;
	bh=QY5aebFr1evE8tRE7OmTPb6tag7jx6XNKxf+rMRmOXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RqUUhuh9dTrvHXUSWufNfAPL+RyR20NWsqG8zR7ZlMNw1/Cuo4b5T33e1PAz7ixPeeJUbxA5Iqw6Fkzs5X9NP0e+C7kCFxOgy0Dwd9F8/UkQpGvXqSmn5Fo3v5yvIQpCJhhKFrBqemRJSeic8hlBCp85t/eIYSg/8hQ8O37Rkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4/PKcnr; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4/PKcnr"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1636078a91.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 17:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786839135; x=1787443935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3guaqxr7NyyvixOm12MKeegXbSzy/kPgiJ95xUExEc=;
        b=I4/PKcnr6YgWig2Cl38H0q6AtM/MGxBGQgq699cH8jB0zcLzUCWw93lYEVkjeREEV8
         xNanjNq1gPl96bI8PHiFFYzRBqfaEnWN115lho6KqWj1xxpJvjhmcoaa+t48PWOt8gpg
         DrjoWZdBCGztxPdjMi6FDAh5EgC5i5PdYc+ihdKNcbDKcLl24k2sKsfGZ5Ndv78vlLo7
         Cga+ouUhU8cHpDolRzXIzhSbnTRoSFh0a0LmMzOooGu0TDEBL+Ci2Nk0mRRbMHaenaQP
         2yrpzWys7euZKiumg079gxpjLoi7pJCTCM2Id3llgu1LeNde3ce3ORpcLFH9l/85yzks
         M+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786839135; x=1787443935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3guaqxr7NyyvixOm12MKeegXbSzy/kPgiJ95xUExEc=;
        b=nVQKrvE1kobSf8HLzF4HwDPWo7oexbct6YBRVx9N7DKF5aWMeXNdjNN6ige+ehc0Dr
         ZrGADJe4JHq/oTbj+5bfofiAFI6digDhpk/dEgMgfJokAbxD4CBnGFO4oIVrQChKAqpH
         2M+xlYeWo1FhU3wTomRv84VSOSZwWaVwRlzQRhDgfS9ZtACaMUCQHM23I/S2AEKPh0sZ
         06m5ddEOtdxtP8LSqmuRiKR7Q/2hp527dj/thzeLf+q77XFDvWE7At4GWLHHdl+dSU/H
         jPeqoqtvkvF4+GSm2Nc/pnFNw0NpAIzfpgAnfgxwnkc/7UeZaH8DeC9PMaImWnPmGoE+
         steQ==
X-Forwarded-Encrypted: i=1; AHgh+Rph2yGjHZZIK2HW8g+EjEeXTufQuXxPsac6Cl4aFZqd0ZpTIyk3ELPThhiRIvtFMJaexet66dZS1q/FVt+d+O5EbNQR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy05cQ0TyXARqz1BjSbiYG4ol9d+F6qPgxxW0lJATh8UmhHxLcP
	qQ/q6hqCuTeS2u1hK5l9Wsg1sKoVEM89LfUcOSKMVq5bLWPKuzHyQ3P1eeRO9Kt2
X-Gm-Gg: AR+sD13b5t2mxeJI+tZhv8H9icLihbKuL9vLuwJr9nkmIVM6Ug8oR0PSE8ms0farz8g
	X+tRXkw3Q1fOWIkLSilrG+/MBIM6pG4y+YEWn6vVqJ+DHESAvvQAUmhQHbw9TYDVcWtZBGNhpkf
	sc8SN8A0z3pgWp70+fn5zYx2fwg7dXmj7+iaPDZdWtNziQ+fkFCrkLiHdZqktRu8By8tx9ROzDP
	OrGt2P7c2AcqAzwX+eyyGC5e6Q6gNOh2IIOlRary+Lf2vjaIak86Gy2mMTElrI4aOmcwba1FyVX
	nWZ0B04wEKcnq/QqZqfU/jWgGiCCejRVdws82O0wxnPbX0gX4G0PSvdpOuKOkk5g+JWYfZSIad0
	oafRu6yVxpQ0mQveCpKmyN01+GT1PALooQaKTwah1iVuLiMgjVUK9TTktGELGnIr26WFxbuLoBs
	iWO5sVMeReGGq4Nv5iO6AHVtexjLM0Rp8tF3Y=
X-Received: by 2002:a17:90b:1d44:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-3933b4fa051mr16661547a91.0.1786839134719;
        Sat, 15 Aug 2026 17:12:14 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea96c87bsm7409320a91.4.2026.08.15.17.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:12:13 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com
Subject: [PATCH v4 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Sun, 16 Aug 2026 08:11:24 +0800
Message-ID: <20260816001129.16998-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816001129.16998-1-qby140326@gmail.com>
References: <20260816001129.16998-1-qby140326@gmail.com>
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
index f37a81950e25..af86b1df1a94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22774,6 +22774,13 @@ L:	platform-driver-x86@vger.kernel.org
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

