Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332BD35AC33
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100272; cv=none; b=ldhyk5ilTIoJTuLD0Gpbu+yH5s/csRjEzjYZxIuknns30mU5swyaePrbouniZU2ZUPFmGAncgBDu6GKfL9SjcEBy8KUrKTuwcPNtTpVdkvjAl/UI29CRcCr89yMJ6c8tTimOjIG8GrDNRJT2b/elPnOexW40hgRC9XF/l2BkTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100272; c=relaxed/simple;
	bh=fqoWirm15gyR2T5vILMgWW6g7wMD/2DlfAbl65EnpPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNZ+/NQP5YC6XXc5CX9H6g5fJ90M+0hA0/ufLFl/mzrNcHNtXZCX2v3zxY5ALTBvIyQdqbzh+vNoeyDRphDYy16bzeHwOi635JmVZv3tFyzb7lCwblUozNlX1FWo1RPrt6HrHe0jtC9zBQYRR2ITzu21ZeuO+CDBkXP65snwC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvB7N8yA; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvB7N8yA"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1271257ae53so522271c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100270; x=1775705070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yX9dP9ip8JwFkjEQDaOaU6XeU3b97kM6xm6qGhhPLg=;
        b=gvB7N8yAGoxM3WrpDbg2sVtW5HbAqlsLuFc2brd/PlqVWs6qBIqJBVOIZ9y+C+HrLB
         fDTdNK188Pny2zh5PYGLrD5/Bno/odfFU9dzwXBvUts4h9bafYT0i3zmsDz0F+vbaPzv
         2RHcSMjVMhWaTcMuatbvFEtDEppdQoo0LjQVeazyLHotLvxYz6HsZ/RAgctPmONIoNJj
         3xjrpNSHlm/TDhJinJBUKkALGn4b8YENqOqoOEqQcID9H4V374kaxiJqxDNf59psKHel
         hLdlEeebwT4+pwuhBy5RyD5Qc9UPV6qcOBYp16h1kzaphNkxPO5ySpMcUxClTx/Hit26
         7OGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100270; x=1775705070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3yX9dP9ip8JwFkjEQDaOaU6XeU3b97kM6xm6qGhhPLg=;
        b=ZpKTcIS4laE1bM7KySX4ZJhIuDRklnA4gbXaAKpt56msGuZtThlYDDna8NvY2TSkpL
         Z1e+UvB2kNIlIjpUFTaMJQfAEjbbYJblrTHiErkoCh6r5V16jgDvEc5Coj471P7iqu4K
         ykudsyR4IAv5zDoOUubRSzTjatzUJvwx/p4oQU+BNHoLx3b4T2p/Ux56UgAqJMtXWJBi
         z1iX11feWnHrYaSnnq/YBVCM2VPShIt5mQMRfSkEUB1EfpAWJAr3QQlmUAdywkP6eCrV
         G5SRou8MqAaBuD+SwwZfBnMn6Ha0de5TCrRz5zDohc6NES/QVVyhJKtmCLhsGcVh3vlI
         2k4w==
X-Forwarded-Encrypted: i=1; AJvYcCWORJlElm+0uRRELFZiy845NhCXnEKiZMvajB5Arb10vm+cFR49pvTvTzFQ/FDDBv9B76hg9ToBuAUvrlHfXlkEp/Kq@vger.kernel.org
X-Gm-Message-State: AOJu0YwEIfdGjBsULHBj1ptMaffQXRn/scs0EJc+4ClTY6YkR0J9Mv+d
	YtFkVQegmX/W91iHfwc93fQH5YKxdvUGZKjEYIx0c0ivbwa0NL5STu2x
X-Gm-Gg: ATEYQzyMCG4Y5SyQfWF7PBelxIZL5Z1rVTqCdvYNxCVC0dIJVOXAChEUUcizoZ42rj1
	LQD5dzX0dIN6psFPRCn+r6z4NB0UdJMj4ACkYSszDdKfzY2t4IceMb0m7M9OaXlGWNQxeP9sK7A
	21oRWfiufhN5gSm6JvBeFNBLLzO2XiI7k0KA59+wSPqe2YSe6Yt8ZW6Am/qCR4gzb39373pPVUF
	oGeSl4yVIDYpMBTpwNRmeEuCfQP+WzXgouTLhtcBsoh8qYMFuSoOiwy0G6VyYdrWD0MEQ6rwbaO
	V7IrZwXgmlJlc1dsxJfZC2HarOhGq4IN/Bhmd44+yzUa58XCN7T/h3QydolO3KRYjbS5PJ72EzK
	26GxIXcFIf0u5qaC4wAcHjms3XthXdnKup3KFOs06/hy2aC34WJeXGkeeJWeAIUorZGPtIRucsx
	22fytX5LwIBP01xn72JF3x6PtTjVGpWAQwXYOcXjBEGdsMeY7hXbCm3lxHbSH5WrGueosyndWSR
	kUY
X-Received: by 2002:a05:7301:fa0d:b0:2c1:85a:d25d with SMTP id 5a478bee46e88-2c930e6bc1emr3147985eec.1.1775100270216;
        Wed, 01 Apr 2026 20:24:30 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:29 -0700 (PDT)
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
Subject: [PATCH v7 04/16] platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
Date: Thu,  2 Apr 2026 03:24:12 +0000
Message-ID: <20260402032424.678528-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402032424.678528-1-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds explicit initialization of wmi_method_args_32 declarations with
zero values to prevent uninitialized data from being sent to the device
BIOS when passed.

No functional change intended.

Fixes: 22024ac5366f ("platform/x86: Add Lenovo Gamezone WMI Driver")
Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Reported-by: Rong Zhang <i@rong.moe>
Closes: https://lore.kernel.org/platform-driver-x86/95c7e7b539dd0af41189c754fcd35cec5b6fe182.camel@rong.moe/
Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v7:
  - Include lwmi_gz_profile_set() fix as well.
---
 drivers/platform/x86/lenovo/wmi-gamezone.c | 2 +-
 drivers/platform/x86/lenovo/wmi-other.c    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index 381836d29a96..ca559e6c031d 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -203,7 +203,7 @@ static int lwmi_gz_profile_set(struct device *dev,
 			       enum platform_profile_option profile)
 {
 	struct lwmi_gz_priv *priv = dev_get_drvdata(dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	int ret;
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 4b47b5886e33..985cb9859b44 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -166,7 +166,7 @@ MODULE_PARM_DESC(relax_fan_constraint,
  */
 static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
 {
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	u32 method_id, retval;
 	int err;
 
@@ -773,7 +773,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 					struct tunable_attr_01 *tunable_attr)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	struct capdata01 capdata;
 	enum thermal_mode mode;
 	u32 attribute_id;
@@ -836,7 +836,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 				       struct tunable_attr_01 *tunable_attr)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	u32 attribute_id;
 	int retval;
-- 
2.53.0

