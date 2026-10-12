Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9D36404D
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 13:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812300; cv=none; b=CjOW8qnU0b4sJVGmgT+l4YqeRX8lCmAgUcNvrXQSTTUoD4DaPlg/ojg46W9KhIK8k62en/5/3Y/Ni2L2xHfR1t37SwtgWFQ0OZVFM7Kab0j7OQputQOfdWpJ5NLU3cf8nyJgE6dmSVGy8UWWn5EknTINlpKbaVq6b8YbI0pLVuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812300; c=relaxed/simple;
	bh=mD6dZoP3ZagEhLT8en6JZ2TEnxmI/QAwfBdTaspPZtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJ6jXK0pO1uyfSHXXsi5HM1wPQu5xLXzUw9i4SzrVarUR/l7I3/myR7adufjm+iistuSK5R/CTQQaPHuQGDcEQnRi/Q7Ik83addvLQpZjQ5P+BP0ni7cLmjKUfE2X3iIn3yt4ILhALypTgfP+6wD6T3bW9UsahMLJP5pIwqp0DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0JjcHvY; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0JjcHvY"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so1483621a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 06:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812298; x=1792417098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=b0JjcHvYhCIGiefd7rVojDLDSA1A2LuiRnS/8TCYwPJzpH77GJHE/Dhdy11aFNpP4z
         1nWjkpynmOji1bCmxyDxnccslXXDyUPY7AJLG0+ys+lqWAwwuieKAw5oXe7tkJ1Tn/uM
         tdpGNRNWHTpkhPZD4sBunlJBpPl1HCbSJSXCj4/R0ORGXClPY7SHt+PWVm9ri+LaKEAG
         wA1CvHg5tNfCtLUlCbHgglUQQV7hTBsnNMTnJFJcSKJqheAdY2EMy5kPGfrikYWeUWqS
         d8Sz4ngz7+IXSWbW35mP4GplwwU4k1bgyqgX8ZkcaKHJmahhEtaFqn/BtBrXFcd1DY/Z
         aSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812298; x=1792417098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=X4X40Q1MNap93Ga6vnQX+M1ShoEUdf6PbTrq86xNofLqaL6X5U/KFGum3oTyxghY8x
         8D+m6trh9+woFKQoiZXIgo0hv9331wCEnAzA4zbh+QaL5dzFp4+ETQ2Jc60FuObCkKw0
         bblSnhvnuTxSiGfNPpVne37GI7UqERlEkqu5t9GJMbWU8/iRLbO0wxV5fqGLGcbpOOus
         9AWIRcgeRP1SwiVxyFnvcoYnvWp81sjOaOcxL1+JWY9d0j3tLs5X6sHUXmax77PjL/dD
         vYWuPzSbxKR1rR52Ct4+o9Rc8EGkav618sOs1Kqu489VR3dAKRcANz/QqtiEa702ab3i
         MKAA==
X-Forwarded-Encrypted: i=1; AKwUvBztN6XAmdmPJy0zOJxqB+MKsZf/2m2lnR3jt+d6KX11xcbSsPldOPrzKbyCEgSbcUjtw6K54hl6RuzvECaUFilJSHJB@vger.kernel.org
X-Gm-Message-State: AFq9FYIdm4klx+CWjTwiekaILSMVVJE3BZw6VjgNok5gsUYMhMeYuD+Y
	8lKp7wdNvw7P40nRwGI8wVh+zoBRWdcPJzlkKYJtTFezbywdsjinKrf2
X-Gm-Gg: AYBFou292ZdZZhKE5M5pfG4F2jn0tuun249FNrgoJlmxRQ00DytWPRY4WwVS99UAP1c
	Tv4Ads9Uh+62/MhpQjZcHdMQ7ZtOHX6/SAYn7dvI88waEinuRJreSasHv3E8yHR4Hgy0s3i4MyI
	8aCqaisLtEh26Waxa5Toy7bR10A2t3ulG7u/VeNA7t5pBMR8clV8tx1VCEjK+PVDA5rlCnVWivU
	/gpJgTdG8YE+uL9PoSHaLHWeioelF8JLepSZMGwREKCtFtfeMQlfHoxJJm0My4uIwbYWc731p1B
	zL4+zCSbOMjC4/m8tt9BCz4u2jv3ajw0rYdxlTLxk6sK5sIifrjGE63SZSxgizsFiQc1g6VUK2Q
	5CeTY12nFtKmZG+glUEY6lLL1smRf3DXw+EMCF7qTUxfjwn4k+dicWglHtO+Z5MhWPnQz9RUkrb
	554Cj5LdhBhQH3sTw/9xkTtPupdmo8XGq6ojyz+l5/KXQY31p8GHMy0kMHbvleDb89OuIcq4g=
X-Received: by 2002:a17:90b:3b90:b0:3ac:17c:6e72 with SMTP id 98e67ed59e1d1-3ac017c6fc4mr2086992a91.11.1791812297979;
        Mon, 12 Oct 2026 06:38:17 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm14534878a91.9.2026.10.12.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:38:17 -0700 (PDT)
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
Subject: [PATCH v12 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Mon, 12 Oct 2026 21:36:43 +0800
Message-ID: <20261012133648.132363-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012133648.132363-1-qby140326@gmail.com>
References: <20261012133648.132363-1-qby140326@gmail.com>
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

