Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7C5381C4
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727095; cv=none; b=RwrzoniiNdJAb2ZvFKb8k2LxMvy/7yPkSlt1eTHne9Q/pjy4Y5pjBF7W6hkI0YaZzxE9xfdxnNGq1eWvVB2jO1rc5KlpenKxA/mtp+MpxfeRm3EMQwtsTtdFwxRz5EMnFgRp9jPFv1WYsxlPzQr4K9tLyQazNWfs4ppoEUgKObU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727095; c=relaxed/simple;
	bh=mD6dZoP3ZagEhLT8en6JZ2TEnxmI/QAwfBdTaspPZtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NTP8ESNB4AIMnpsq7ezUWiSlL9qTjB4G+fP8K2uqD9DwKius84ePVRzYiYbUxXD2HVNj7OtZsDvYKlIBxfANp+OzrwoUB3i0xQjM1tQanZrdGc/igwfkE0yUaxRSVTNtHspfJjjlv4YAhId053eCPW+5qSmFOaHS3z2sJ3zyHYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNyGxobr; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNyGxobr"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so785003a12.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Oct 2026 06:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727093; x=1792331893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=KNyGxobrICBU7Vvtk1Wa1IqWTLHaJzUiQg5QRnzOK1eC8WMXu8m5/fSH3naUUuc5pw
         5Ifbml9zvmHY4BDSM9D09MonxzfEmPZy8uYXQJGjrUqwTM2ltvKjsVbgA8gvOcSKoZUe
         l0sEk3C5Q4lpYgT6FbBj6jebxaC5dbeWtNQIT8s4kPp2qNVUxD9oltJswwIF5bEC+cjs
         ZyKEUqn1i9Kw3zf8GyMwagUMXMWD4PI/0vE6HnRR2BKodBWiK480I8viq07i8c+RViek
         GWk97y12ZThWJP4JcUbvwarKtnht5J5R6gF+qbuCrMFmnIiz6dlQH9x02LVz9Mr9TkA3
         urNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727093; x=1792331893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=cWv0gbsvlXsqD1yBdaTzTwVL/tiBIGgWarf1krYCyBdCYiEX2B0Ac4Z1SBF7gW8QaR
         Ob0XgYfyGrCNK2T9J+f17zXG1hNJSQKFRwRI6c68HhAC/zqImbEkEXOczByvgZtDfHtD
         NSKL4PzI+jcyNZYjjgLSALL44CP86yYMgx8ZM4ro9uCh2doByoFz9gXoRMrGZgMNLycF
         MSpN88oO+EH+neW3qtVpHExvtet4wSIl9LybmGreH/ykFc5b8YpCu2mTJZ3UFflpxF2h
         S6uXXZZ8doHxc7glkkuftgjiL7k2t5rwOlgUrvQlEdvGV9hILrbwPqlX1MJgLFfRncuk
         EdWg==
X-Forwarded-Encrypted: i=1; AKwUvBzKZMNaPzjMyjd6JMxyV0ehrHxMeY0J+4RdwqXd6TrSSDbN5m4toIU9lCeuPL09KpWt7qTUCceRqefKYAkZy5dz1Fyz@vger.kernel.org
X-Gm-Message-State: AFq9FYL4YmFW8gqmy4g3wldLb2U2IRhjffaa0/8alruiPHnq5tACOIJV
	ntzALytafK/G+rYJTy/utD2miDlhFZ4VmthWGKSYUTkPGu/PXfRWkw23
X-Gm-Gg: AYBFou1M05xb7DI7rZ7xbV5sioR8BqxKuc1ZGTrCD1/b2Ib4MHyZWpxFZBBSGaUbNW7
	ySGGy9tsJ+wB96eHsPyCsK3KsMrlTgUpCPWkUv4RD4ZyXZriYL4DUzMAdgxlbS3pNiGtxyBzX2c
	Ud5K7YEj8PuUxc2The4qu2V6qef3a1dyxcvMF+4WI8Qjy278SEA38QjhRtQ3iQGkILz2wzR/40p
	QmgrP4zYDtkGfE23bQ7SxYeigpGqRuS5i+WrJ8ijCm/UF/ycJ5cK6S3TDKra7cyoYmrtojzUXgo
	z2pDAoqnpZZnaYV9QSa5z/U+jcsv/WmRQYFFC6BVOEVmlkTEsumedfiGQFiitqxqWV8ckTu1LbU
	/aLGbX4FwiXl9LMuXA9Nlz1qjoizet5oBkRCUgoVwMIT6z0/OKpKHkv9N3w6IUxM1ijp7P/86aX
	VVOOvNtxb/HMmbSSQWExztdGDlGK44M5u4d62vTC9RarNymaVgdHTjICEGW0F/sDyvyvz9HKOa
X-Received: by 2002:a17:90b:2e08:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3ab3a979396mr6672820a91.60.1791727093298;
        Sun, 11 Oct 2026 06:58:13 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm11831648a91.16.2026.10.11.06.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:58:12 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
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
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v10 1/5] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Sun, 11 Oct 2026 21:57:44 +0800
Message-ID: <20261011135748.11792-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011135748.11792-1-qby140326@gmail.com>
References: <20261011135748.11792-1-qby140326@gmail.com>
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
index fa0571a5e479..0874713f262b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23042,6 +23042,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.55.0

