Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB56535F16A
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 03:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285037; cv=none; b=EkfHI6dKocErznN5LOxsOf+h3blt6SJ2gZ0LBdViDIBX9+/1oSFCk92LM9z46XufNiPqd3UWup1en+RDVoCUu6AXVNnoEmc6DPpp8A1fEiAIW3Yc4tBgaiIsMTiGMCUPEMzYhgPiRokj0/D2bK+O8dCj5FPisM+SL5NN0lgVSQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285037; c=relaxed/simple;
	bh=qqWzkRLXexyACYfoPu91Z2Zg4QrtfEree/Xfmn4eCzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bsC0Om+zugUksWZM6Z++7Q+UPobmsVqCUeNwEHVdKf/OKtb/14JbxIhAXz4YuUAsDSXW3ULnEywkJLex895AzVvAA9gOoEzcasUBSeM2JzO/SEPfik6cBtX52e43sRCHlLMMJX+R5QbZJ0ZZE7O1ov281yxOxxh/uvrIHkBdg+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+vbYJvK; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+vbYJvK"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2be1ab1fa7dso1032276eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 20:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773285036; x=1773889836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7frXpjkjCejQVH5HN0YDV6bknAYxJzfjcY78d3zLEg=;
        b=X+vbYJvKNq/eYCVrGp4IALtgnk5K3jHRez/6TZoawOiS6D0+D6G3NfUXn/t8fkRQL3
         gDNouiOPOWiHCzGsBg9Ge3zsSl+LLkWmIQVXP2dDbKDseZASOLvNiQyB5+sdiOopbiLm
         kvSQ8fAWu/V4JdVDZdrYje/Q+2KCn56F04DfkRL7yWUrUjoKkrgeAe/eIwCJmeePqXwB
         5UzxNf5Vn5JdPFIukP2PpSRGoF2psyltBELPhMGBhGptdaho2GsxxB7d97xELkaFJGe0
         61pXsJisVmFtKbPXnuGTp4CkmzoPgulC6jwROgLXiBHNhNZxQerPHZOYG4TUAKiLvB57
         Lmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773285036; x=1773889836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7frXpjkjCejQVH5HN0YDV6bknAYxJzfjcY78d3zLEg=;
        b=AetzNhf7Nqgyhlxl6DrtZ6haBZbfW8i0apDr0v3vmwlwnnlzd4hNP/eknZQtEXH31O
         I2SFIa5gYNysAgH3HBgFliTb917ZmOWsgEwjxz7xdoUJOnqQyhmCMebeTbn/mk7iv3qR
         Y6xBkF2J1+YHTMR0GnwutKdaB0yeW8qP/KR4OSUglP6+DAIv6V3DMD8/G0IAyOqP4HVj
         aXyYxb6Clt9ZcaBBPkRavq+VN3+BH9ygFw0b3EXXrKhHb8KBkeMqyS9533ao2nObKR2S
         Zjh/vl0FM4mfJHrOPfMubbQeWcA8Wnel7DglB37SeKvP7gSiDs03txlHfIAGRPUuMh7O
         OeIw==
X-Forwarded-Encrypted: i=1; AJvYcCVTFyhOMzhHBNUDwYqumSss/A2Vu4jhytDq8t+47ncKIe5Bq25tlMkLYIY6O/JqexXPtdS+Sltv9JrgGZXk62vrlKFQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6bp9rBirczwEHe8co+FrnqCX/z8MKFJfkay2Zh8fFMxXy86vW
	Jm6/lJ5A/98enCilug8fQOEn11A+hEiYDO8l/+pXHdvAZWOTO1gQ+Tyt
X-Gm-Gg: ATEYQzzpO77nq2u4y+aYA0UcXFGFwIkhOpsV98EobDntiFqj31GMAV8dAg2ZQxo0Xqx
	sDB+rxPkowP+9fqHsUchHIkO0MAiflAFYntEMlNVFuIhImvEMgYe7ttO/AIJKS/qGC8kxkYIV+Q
	7/KdbbO0VLsoqX9wzA3rWYcmzFv7JcYA0bI26sizSEtEzW7XM6cPRzBrkzX5bVmlk0BDzR3HSlS
	U2K/Q/6fWZRZlzxR5PcMB1e264XZFOFn8RdGtRd1LWbif4APWA+NCXbOy6c7KpKSFEfm4tApzdZ
	MTHuE5W7w22xYEjGOBpBjx+leqPWsInPQc573e2PQ9r7pu7tY3ckzIuc62lmWOrO7ibDtzw5g+J
	4chOv4UaJ81Q9j9K9oVBTDwA2dAT+YhAWDIVouWCFTXwRMmNmQjBaBM3vHEJwonKJDemnGJDDOi
	gMGG7DfDKIRf56fwg+QHT3r8BJ7gMUpG98vuNJAOEkpG+9U7ebUzblwePfbha2IDwSDDe3eiJun
	HHc
X-Received: by 2002:a05:7300:bc0b:b0:2b8:6b32:1cf1 with SMTP id 5a478bee46e88-2be8a3330cbmr2117411eec.29.1773285035923;
        Wed, 11 Mar 2026 20:10:35 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa97dcfsm4802495eec.33.2026.03.11.20.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:10:35 -0700 (PDT)
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
Subject: [PATCH v4 1/8] platform-x86: lenovo-wmi-other: Move LWMI_FAN_DIV
Date: Thu, 12 Mar 2026 03:10:25 +0000
Message-ID: <20260312031032.3467565-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
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

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 6040f45aa2b0..caf360b76fc5 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -71,13 +71,13 @@
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

