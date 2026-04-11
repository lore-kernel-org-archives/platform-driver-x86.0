Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A993B9608
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924626; cv=none; b=Nx5SfTAp3AcWuMDw2ALNjqBGe4byAYFuFMNAFFSzpVEH9Em+BnIahSYUggYoCilBfKyA706pogOP3p9fE5Omcvr98nYvYO46Y6hu8I/IoHruTMQ3WjXlNvsgI9qlPH/I/eu56ANg9cK1bUkbodEs6HcGLupu4kriYfh/tadprN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924626; c=relaxed/simple;
	bh=0AbQz3lWFcbXHNL+cEsqvTqOl1uqt4LYgRKMjWx1LGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WssXXhJDpu94uFKUaIoqxV31OPYFmKA+M9y9aiVb4i0ukBl9J7EKqCtqLDPyMMIljmuC+/CYpkfo5XhNGy+MeiEl5NAmm4qz+d1JmcDtVSzkvOPTohW8/XbsPbOZEs0UYloZ9egHg3UWI6I2+bPye0sL4DD/o8hP2EkP2t52/TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+p1ZPfl; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+p1ZPfl"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c287eb77fso1150756c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924624; x=1776529424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9c2ZJ+MOfT+s7jsvqHxpUvMKxkora6YPxRww/bSijW4=;
        b=g+p1ZPflgCZfGBYwFtUNaHe8ofyhiWXMoKMhcrYsXZiRjxWqsxDo1OL6m8hQif8ghq
         l3BKJMGqU6LSqsKdls2PgvDXi7cx/6PD82LOv7yg/qBIoXENymnMV1KOTE9+o8V4F52D
         bAWsC0XrmTqCBYxnLYjW5fWyI1TXj0aLAbxn76ge+OG/L7mK0bRXPBR2J5ItEArBwqo1
         1U0GwQZd+9RggWRtojR7ZxThhU+v7feVAfuRT/vrfXQP0gEHEPV9YHEGtGgpY/+3q8Q1
         P7Rk8DtfG8kdfrX6ghY6/1n7lVoGsAwR2lFvMgteyv94sM/hbpJEPvpKdBbAhncayQiy
         U6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924624; x=1776529424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9c2ZJ+MOfT+s7jsvqHxpUvMKxkora6YPxRww/bSijW4=;
        b=IK64eSsehPs6Ev4wx1dBlTmaprXkVXTdHKW9iVGfG5jG79KtRkGqA2k5aBhV2xcmwR
         ugdAU0UrVYqn2X4Isio4fHg2cfui37WJPimp8aTmTOOkXCASShtAczdQ+5i1JCQWgvJX
         NXwG/73/9OD6+nLxLP8RWwwoP9YTMc6flU8vE+Z7lbzUdUa9fwbUWIO6zQ8Tj6KQzonK
         zIfGpkjFUWSxNTGhXM4rUmvG7uOkFE3IT2lZrlZvghSOdgyFuBWfgCyaK2sqk+1PpWLC
         tesoOMnWAgLCUggxpEijP0nId47qAfZWPpplcrwiXQrP1h8VCcuMZr8V7CNbSjuHVEcc
         3BLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxHeHh8/+Rm0qiBFxs+MREEEJwCZ/OlDIrqgi1Skt75pyGmAu5CuvOspkbwWRQ8L0+Tn1oQfmU9xIxXc9xJNhteFeT@vger.kernel.org
X-Gm-Message-State: AOJu0YwxYLawkGDN+0/2W+UwJxnfoK0MbfdXXO2sPRdQUTPvL2hq8pT/
	rrf8FwXi2+PbHdSLJOiLLdXb0xCAxgnGjaUw0pm9u0BoZlief2Ix0Mo9
X-Gm-Gg: AeBDieve+XeEWfa76sgohZhmCffl0CYgNvoOOfSYY+KdfzRlaWsSEQfAwpMcAJD7qnm
	ULGVK8McAmf+y6v1YcegQoGE5K0FD7UHCYEKU4NUuaSoQfrIs+FNePhZvPnYk0fQzYSnsHpCLng
	20AoeMrNZw5hFenqwlB/EVXc9EImNncToPYmf1Yy5tWqvRKGIJvf7W71/1q33UnE+njBd8zKeAE
	Wkl2kTWTHWTKeAiu6z05p0hb6f7c/FsKZ/VWxUN6Ql6eCBiFYj2mcHr0CyW5O4yJMguhOfGh2Wn
	xziqU6h7JNAD6/uBDDCAvxZr4GEri48bUpe/z216YJYD33X4uM1rIH+urT3JFuvorsQV9c+wyFb
	lqisPZGyKgYFbdPPoj4McSHdEVv8ZOwyZcVW9+YgMg+VY4eI8mcqKBuo1YHhB+Ty7OrrNTudgXz
	xH1d2wWjMlPQnHjFRcbEG89Vy7GObTQd3lbRxje+7DZwFKk+auovnUu1nl/pjfgTFRm2UWr7Ajn
	k6X
X-Received: by 2002:a05:7022:41a9:b0:128:d7a7:5261 with SMTP id a92af1059eb24-12c34f0cc5bmr4703957c88.30.1775924624177;
        Sat, 11 Apr 2026 09:23:44 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:43 -0700 (PDT)
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
Subject: [PATCH v9 09/16] platform/x86: lenovo-wmi-other: Move LWMI_FAN_DIV
Date: Sat, 11 Apr 2026 16:23:27 +0000
Message-ID: <20260411162334.25682-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411162334.25682-1-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
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

