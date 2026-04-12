Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC08E38422A
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028293; cv=none; b=epH1DspMbsTZb4s0YW+mIbAzgPPhDvgFLMRYK0ThERYX9x2a794h9tAVdXOmdJbGQfGPXgmKTfum7mR2KW9V9KegkeV2TcPZ5vUoSAYm6pzUtUzWuXMoKQH9WAtV41lKKAExh5VSToWSPIj79c6qmraOdSjR2eMFmtsg4gjQ9Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028293; c=relaxed/simple;
	bh=0AbQz3lWFcbXHNL+cEsqvTqOl1uqt4LYgRKMjWx1LGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIKwCntNaWCl1eYtDMA0Q5/UitJYB8x8RlXDrLsnU5zp/nHbrpVJx51M5KwE00zqYD6SGOMcTV09j33wCr+WpyXuSNK9tLT8v4WkEKOGhsYYMyQ2t4VHlFt9EVBALUAQaxOQ5bwpF4i0MidYP+iDGODXx/sYzniKypID8mZJDRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4IfYW/E; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4IfYW/E"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b6b0500e06so6750827eec.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028290; x=1776633090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9c2ZJ+MOfT+s7jsvqHxpUvMKxkora6YPxRww/bSijW4=;
        b=e4IfYW/EZy6tIGc3Hc1ZxzDZHEKg6isAKy5nLXQ0vIx8jNYB/Ldk7fAuZ+ub3dcJ6Z
         5hL87w3pjVsBCynH2dPvfizTTkLCo+5NaH2n9HGKy2A6H1yyAlm62uqzFzMSyanMw6HM
         d4hhP2WQU2XXUSGxQGcNB3owQMq2vuGQeYvPrIeNCJuTugydhMujWqML+RESJQ9CnawX
         BGP8WT3vb2jMbIpcNR69DEseP4yzTrlqU6QU7AocGMFBeYy6C2Tvl7djR5UWm0oL4w9Q
         LbCdUs2hkbT1X6qTeYpdpyeqSaH/9NrVzb1S750JjHrIGgvdqpv9xEDfV/AhcxEWU8ss
         G9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028290; x=1776633090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9c2ZJ+MOfT+s7jsvqHxpUvMKxkora6YPxRww/bSijW4=;
        b=pWkxHn4GsIYGV/89l9aqV/nqYXllM1avHEKx9CiE0jW9FMflkYezVg3IrYzM3uC9MB
         DcDMrj4cnEwwLRTX4tI6E1FZDRwSUGpPvZprSzhFki+87rjMdY2JhsCZ2QsocE6nPz+D
         zD0H8DClehnz8M2Kp4eqJJNsI493dkug7wVcfRF+RoWsfjDz7q8BXDHtbxAvbre0eAOo
         aJ81p7Uv0tleiYlrY9P5CmKehYIE7ko5/MD2+E4cdsRQ3VdXwFeh5TzN+dubRFiasHgI
         5BdVD7Z40Xc6sd1S4gdBqiyL+0Mm2T4MlCWYPdT8Ropx2prY2H+Hb57+iVDK87KjpK+P
         jDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Vi3v26/zqL71ae/aTSxvTva5TgdP++lYr6ogrwX2k0akPHIiTgIjEPvg+OFlWS8d9TmfyjylvBbDmDrT7WC7x5ay@vger.kernel.org
X-Gm-Message-State: AOJu0YzZFmhaJSZcMcI2Pmi+kCAsfr00IEfWK97ipaJ1ahj+v45xUndj
	pVnzvatZzkhRglqyh25QAyXrCHXw+EqTSLQDMzAzCJlkzfzN3IxsyNcq
X-Gm-Gg: AeBDiev9qwoldhgcg7W2vqgKo1zevvpz9bVkG2aer31lIvUeWXsYTn9jPpQNFhHxt9N
	Hk6PDzugzuhYcJmF4QqNuEvOIaUCdPZCgZn5vCo1zLxJOB4P/7IlTiTn2IdF3vd7g1gFOaXZlv/
	CozAI11pXl4oo6dMVVZadfezyTUPa6zjlpvs50ITQwVupDcW/YLN/1VVduatS8Csyo0lZmlN6kV
	x0lszbI6GORsYljv4uyu83EMPqt6F49FUDue5mHVmW2q4e+Cn8+Ld+EBYgnLmZlu0CB+zCatPkI
	K6UQ3JA1ucj7ZAqqQevhrjuLqeO75ez9UjstaPzHhMsa9V3rPebDxCkQ7Uy3f45Yk4FHFBNw5ZO
	272om7xnaHTgDqRmeMFblwCfPsKYvPsWXVwq1+DUUqV7Ry3sBa4wXmPNiupaRRccyifjRv2WOdN
	cofCm5pZWtDSwBfS4gDPKc9NP1X+N/gdknw7CaNzQJ3SbkUXlBMY+OJKSK9mH8NNT0xcN0rQd11
	EUa
X-Received: by 2002:a05:7022:662a:b0:128:e0dc:6428 with SMTP id a92af1059eb24-12c34ede980mr6491751c88.17.1776028289858;
        Sun, 12 Apr 2026 14:11:29 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:29 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 09/16] platform/x86: lenovo-wmi-other: Move LWMI_FAN_DIV
Date: Sun, 12 Apr 2026 14:11:14 -0700
Message-ID: <20260412211121.2220556-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
References: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Later patches in this series will add additional attribute ID macros.
Keep the fan defines together and permit attribute ID macros to stay
together as well by moving LWMI_FAN_DIV.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 960d2e0f0227..df197b22e1f0 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -68,13 +68,13 @@
 #define LWMI_FAN_NR 4
 #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
 
+#define LWMI_FAN_DIV 100
+
 #define LWMI_ATTR_ID_FAN_RPM(x)						\
 	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
 	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
 	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
 
-#define LWMI_FAN_DIV 100
-
 #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
-- 
2.53.0

