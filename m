Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC11F382F04
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028289; cv=none; b=KGIr7GPz9DNmQIbQ3JTIA1TL5dZwtU9Sue1BptGXcvIjaLUCmz2Gvn1iSQLOb6pmNhZGSxRYfiVN47PDxaJSMo4IPUTZOQV2XkgzqR0Uikn7qwUIQjZxFjHqz2acs+m9L/iLgJAgTDt1tvwOdl+ESQklNf96XDtm9xAycncWz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028289; c=relaxed/simple;
	bh=NlwwelYA8uSHgqW88Xvl+l0Vc3NtEotDqvYvC1ZDl1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P3feq5w7QSEW+3B6hliFxKAJcMBxyJuDqrLDSw6FoXRYkHeU7Q9Vp3sg7acpdtSvCjxQ3w4vyOe7CPK2FEGbdFh8pLTQo2f0/Xi/UQKSd1kXI0Iux1ia5LmODraii869D1L2zzwqy4vy44pBZuG9qAbCehWjsnOhBsz1QGoMdcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5QnWk08; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5QnWk08"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c287eb77fso3223299c88.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028287; x=1776633087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LD0U2JI3+b32qBu6y4JGUu0pIw+boTDqwL9bnMsDgY=;
        b=q5QnWk08pxUh8RrwESnSPYaFeJLQO4wnd5PENxDPbRSSyaccQXe/NO+M79pp4ZnwSf
         VnKueaY52ChdMz6klUNk5ZdZSDlAzejMUqbUMPWOweNx7s0Oj4XMwon6ZuXOEzChT4w9
         Pa3ubqmrxkCXxTVkfNaZbN8+BGj+DRkKv73BwiPXETGqL3MP33NdSWs7xM0TjBLVLXSk
         +/RM/epXOa/Tr+c5iDXnxeCoLdqr8IHgfiMMiuc+hIcleUY/nuRdmJKf9cO0SSvF4XBN
         LH2/yBHeUSa7v7pIE/JuRdN0cJf/WhoH3T83uzadwMa7CzUROAwYyapSyu/pVHcM0Vsy
         SPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028287; x=1776633087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2LD0U2JI3+b32qBu6y4JGUu0pIw+boTDqwL9bnMsDgY=;
        b=UyOsqaus/TzXGmuxFYdvji4wm8Yw8Fec8L135ts/smfm2IwU9Zr2e+ksXYerdMBWYO
         jgfjXCTgbRo+AZTlL5qV0e3Hq9xRLw5u0DUR3jmkZLJPqncsZnrPdfj/IZ/aYtsQc2+b
         dfEAU2Jg78c/vp3zXzyuuYx6tG7OAwC26bW5uYbt/KDv6t7DVJ49WyvLUO4QLOPeWAKl
         s9jMoobr5+mmQl4E9OfF5IREYGGSF6/aw8iR2apuckNL2HBZ3oQ9jSd0+mmCc1UAIZgB
         uUVqNhsmDjUGW6m6mWVpZ1FDaf5gpfe37XNUNXtp9SL/G5mCAiLYb+nYnYpdFUVTk3Y2
         3zow==
X-Forwarded-Encrypted: i=1; AJvYcCXwJrLcPGy7sRZ5otlYoEr88x6M0tVh0ZckQl6Nw4cueIePRqmv/4Jo81e8dW+2W++y8F76DM0dBp//srvTCarye0iL@vger.kernel.org
X-Gm-Message-State: AOJu0YykmE3oTmw/OIeP62He7fM8UFT0b9cyc3jKT0EMlXP5gvb0nYNk
	bYWzE4HH/6f9sWqIJOZSQ0U/lFAycEvPapG/bNn6d0jA13RRuqdRcVgi
X-Gm-Gg: AeBDievBMii8jay6mzEvwMFOF70vYF8n5xvRKbwDQO/zFy5rhqrsEEGFxTyTb1MKZBH
	8SBlZhHC86yllh0D/uwe1WWLYLLvBJFO4hT6Mx21BNys/Rm3aLOqPm1Xt4jMUIjAbtY0+u3qB3B
	dRXrLbRmye3Me0RtH4A0EWG8s0g3vqJxGau4gy1xEBCjpOspjvvcpIomLnkMjKunMY+EtfFG+4J
	0U9HCZuV4zvRT+50crJMrm57P10bdNyaGVUutRWqmmXP3hhnngTKgnP/2El0+kWRfe5JiZisl+2
	XKhY5I+OKLj0DpUahnVkAIB0XNKUmJbw0HZMSGzmPGul+AxaWdKwReuVVB2fDxbvBWLggbkkqOM
	PiW2mw6Se8cDAonqph6Hy2NoOuZQhqNDEPytfocAUx1yqqNt/uUTGphcYyst5g2OrJAqdzeHQZr
	aCGJT48j2074dSXAWlZ7elyzXNaB45RAiQmGM8eSkNdaT65TJb3FE34SfTuepIGmZKvOPfSmOjR
	twq
X-Received: by 2002:a05:7022:6629:b0:12a:713b:896a with SMTP id a92af1059eb24-12c34eedc16mr6821236c88.17.1776028287219;
        Sun, 12 Apr 2026 14:11:27 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:27 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v10 05/16] platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
Date: Sun, 12 Apr 2026 14:11:10 -0700
Message-ID: <20260412211121.2220556-6-derekjohn.clark@gmail.com>
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

In struct tunable_attr_01 the capdata pointer is unused and the size of
the id members is u32 when it should be u8. Fix these prior to adding
additional members.

No functional change intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Fixes: e1a5fe662b59 ("platform/x86: Add Lenovo Capability Data 01 WMI Driver")
Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 1e06b894cfcc..50a03f5fd6ab 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -546,11 +546,10 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
-	struct capdata01 *capdata;
 	struct device *dev;
-	u32 feature_id;
-	u32 device_id;
-	u32 type_id;
+	u8 feature_id;
+	u8 device_id;
+	u8 type_id;
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
-- 
2.53.0

