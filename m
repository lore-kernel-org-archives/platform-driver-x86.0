Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A8937AA7D
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 00:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814770; cv=none; b=R1LsfYn4QI9R9StsZmHYozaSaDU6dlXDApHk4wzpaC/cLdK5wDeSbPKbi7h6lSk2+MACEuQWUR8XXC2fLCAWboWQhmtiuzHgCqkK/449CZhb2S4D+SBcdB+yTrjLNeStYLDjc44GbI7TvO/Rqi7a4B3YfpD8yuz3jPyZQFhclqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814770; c=relaxed/simple;
	bh=q3qWhoHCW0OCxysSDjAVLOk4TgRNoDkbod4CsnVmnts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTjiq+NsihA8oRouiVk7iOMLgaV2lryts4oqFui032mm/bc1DQgkEN+ZBTAoC0jAtOVZY1iiBn4mfF60cJUPkwnrEBJESjeXRAS+6BLdn+IqQcUSWPX4/YvYz3Itis6pkQaGCFxEEOibROucsuNW90XIKvR1IBzPF14EfHY/20c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2ePpMq9; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2ePpMq9"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f9bso28555965ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 17:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814757; x=1791419557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEIZHla1irZwv8AHiBhcKBWg0BZcEIZ5uU1rHiSqS7U=;
        b=V2ePpMq96+7LfMb6HIe3N0byqXHnxV4I5wvcLqyNvkpvfCxTDudpYHQe+bAxF2rbop
         9vS+L69Fyd46Zmk+LHg6Y1bs9MbfHcYEZT0BpcqMnhxt1QeQ5xpbiyPbB52Enms4Eh2W
         G+jVxEmu0dqBtKfr5dPiM7NwNX4u2cBdZb+2LKMgeB4x4QGRjqyBJvv++35Cw/8yk8v0
         CA6dd/O9o3wzYHiMS2jsvsWwqD1gEuM+YOzeI01wLOphP8SD5Ke5onHbgRXhRw2GIUhh
         vtJ77LtMromwT22WR8Rpt4JyVUIFp6Mo/VkCqxO3RQVPYrA14FGbSjWNOQvVJnAveLzv
         XsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814757; x=1791419557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEIZHla1irZwv8AHiBhcKBWg0BZcEIZ5uU1rHiSqS7U=;
        b=sMpLTnZqybkCSuErGhByVAPCkkN4CrNXASaydhRHlIn+EAyccj8gLyL9EarMd4iISd
         9mq0cyiQphl3h3+nXgXlGtatgR866aheXadS+YWHvKI4nSAeCGhU6OgdXytcHMpXI+Ym
         3ijrRBidRT452hA665dvgzdGv7KZayH6o0PjuJxKBtg0VvU1znRk3p0I/81l7y/t3F6i
         /5qFzzopYrpKOD93GJNCK4hUJHxOOFWCW36+0NQXiwTRtUxrDtfXJBPx4Zxvo5yo32KI
         QDgckRPQGYwjreRwcx1PxiI5MtH6BcIG8slSyp+5dwEXv8uIpRU6hN7/YHssVjEEKxD8
         PIHQ==
X-Forwarded-Encrypted: i=1; AKwUvByWwzHpJKAwZohXFqfCGxrM4V8bUHtmxOcCEX6xpFQaFio2wVi9oBhhMwcs63NQpDqlY8qBcVJKYXJjVF8lDOOPNZYA@vger.kernel.org
X-Gm-Message-State: AFq9FYLMkNrl2fzHosDZaX08hRwecr7JHrSdVqbecb6hkUI4UxLG2D+k
	9rud1Z2mRcSkQrkdJQWydCGNqVKV1SPbSMg4XGVRM69PeeKl2p1dcN8d
X-Gm-Gg: AYBFou3TZ4zTq5b6TP7eZaC6hS+syWf7DsjAHlooZBdgpU2y8wF8erazPfPnESlp1EX
	JgZn341o8RzSqeCDum7dZCv+VTFUi+mTyvQa/AN+wHH+dgcdJLGR6Bt3y7P2aPB+c9nwemzD8jW
	vbrGHkhPJwlY+cMn1sCWmpzuzikGMm5myzfos4Xqo0liN/PCDlsR5KxigSJTf92dO3l7wgK4aJj
	6Ib4xPGr92PnDwWEHrCsrA4xGjU8GbKjP4jFnJk9qQzJ2KbcrJUF4xzuySirN6IWgDuPtSzzZWL
	jqjTUxVJPWJjHHPD0uhM1bVoMAXnIJDQkplMvvdzBqnIoiyZzImQdb89vv3RhnY62I0Y2kwYo9D
	B1uFUr18Ju1gbwzcxOJ9w6ams56woPd9PW8EFAlHnKxVsKoTYUbH/5oa/u/cN9RITCysuibzmf5
	YXETRQt2xC+ZOuQAYfOxV+HvH1mu6jmSZpoFkzMwyPJgen/0JeW/Ns
X-Received: by 2002:a17:902:ec8a:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2e2e499dff8mr23868575ad.24.1790814757114;
        Wed, 30 Sep 2026 17:32:37 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b58345sm3161615ad.66.2026.09.30.17.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:32:36 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v8 1/5] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Thu,  1 Oct 2026 00:32:14 +0000
Message-ID: <20261001003218.39421-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001003218.39421-1-qby140326@gmail.com>
References: <20261001003218.39421-1-qby140326@gmail.com>
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
index d55b637c32e1..7592bfa24062 100644
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

