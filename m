Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9208139C65F
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506448; cv=none; b=U4ZnKNH17ET5P37/ipHfBByVy6bpllG7rH85sBBU5rKVw444CcWzLttOoXQA4E8QuIH9ybDlMnzNAHq6hYov2C7YfOkBQTkqLNAPYCMOIz2ojvR2YXi5WDmrU/C0C/OmqgPx6OwgFHi4JVa6jDwPwt1lbEg9207EIYzH+oiU708=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506448; c=relaxed/simple;
	bh=fqoWirm15gyR2T5vILMgWW6g7wMD/2DlfAbl65EnpPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZqeYwXpjsGV9ktMRNOHyeVimByVBHOM7C5x4p1q4/hvrAQfFiLAJMXZuljwFPim1bQkr9VwieLEp42l8V64iZop6K+2WZmU0mPmWTeTL2BdEgU35qnDpxXxEzSHY02PBxeBFNDSCqxjp+9v/Pkm4OK2/6rr4yZCVBPZANSdLVMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/RcheTx; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/RcheTx"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-128e4d0cc48so4442237c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506446; x=1776111246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yX9dP9ip8JwFkjEQDaOaU6XeU3b97kM6xm6qGhhPLg=;
        b=K/RcheTx2d8O4ifahcV7hgMBGOgCHzWlxHex7CzdSB7QdR8pOgKiCB5Sv2osj5k8kQ
         BrhIgOBzZSMoAS2l3JeUtdnIX62jCuiImbZmuaxvVg0ylsFezQCw+AGS1TlkD8ZMdiHy
         /G5lJgns8NuzXgq3Qm+uWnt1SiSqo3C8EHU+rlrkFSShD4VABfNMN9p2fVyFrk7NfSqF
         2BZYI0WKnFY0X0W/etmZbKBeUE5LGaMvskFDBveDE/YZrIeKSIb1DB5yCVYgKWkR4Ep7
         xJ9F7ZzVB3pPQFQsYobvRfvUzmBj+hLLWBrL6lIyBQ1UBKX35puNw0KCjLJTGQlwvyq3
         BkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506446; x=1776111246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3yX9dP9ip8JwFkjEQDaOaU6XeU3b97kM6xm6qGhhPLg=;
        b=c7hSAJJVjx0RPGRjQlxrtiwa/Ldwzs5oZ+cD7WWEi4AkM/sDisPnc6Fxu3LDoyPeK6
         O4VjyNsGQVKFljNh6No4aDgH39IjJRUq5DTlV4JJ70JmpZhxF7OQt7w0z/DFK1ShLzEN
         SrpqMyVfhGImrBG1m9qKC0oLj5b/xQRDWYZ1DnK6wXgFZFJZWqgMXtGtVXpm0aw1EOq1
         pZIzOxcefyBr5pGnRGKOW4nl5Q8qfdd9xbdP9eZZ0wc/VIUmJ8MKOrqrbF50YfaqP7fG
         D8OiKm6Uv6g0Q2kBEd8plbnz4dgy/NkMTIP8U3aT9I1BDbYBIuoGzNx2tfVZEE8zgjDo
         AbLg==
X-Forwarded-Encrypted: i=1; AJvYcCUR+7MaCBSUvp9virGKPGQxGfK9W37rG6RlH1/W+aOTX7kfYYGPd5ZZEHk/ZAi/1iJgBiNhqCXzipzGoy1izVpWEgQm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrs23dU4Ij9Cn4NcdyOYdMJO7JHiGKE8CCjS6jx5o4zHuYWEZ9
	0L/5xVHM7BDvls7BVzRu9gj2B2i7d3iXFRl35Q3sGSt3k7juFmf2yfzL
X-Gm-Gg: AeBDiestWhv4eV8bySScFCb/bMFD3EOFJO6qGNBFFb7rA+LW/62z0DjV1nFGY/MY65U
	QCSLco3fZIT57nhDqW789jnAI8lJs8Iw0NxlBD444Mo6u3dvMtZfva104xciFrVERgb0qsJxLt2
	v3/lr1F87hLRjDiM8lbTn8mbVV8nIwdql3z/JNCidKfRiy4GT0qUgIxYe6YC3JxrzWpY/iTAfPJ
	JtK2yv9gTHJwx99hYKzSx1+9GAnpTu16SFbjWw6wrN9jdX2pyq1+X+M75bxwvtGUdsu2qR01BeG
	CNJJzgEW2pyyMiNXks5COcO9eQIVP7Np5GJphsQvhHjRvyBtdGjrX3liIduZZOpt67EX5owh8co
	fvEMtkH96w1pY1IGGRmYMn0QDXUsucWCwurL/cWfxUQVKy19oO40kep+h/ByUzvv4iSKt2ukVf7
	jRCTWWvhf5PzJVG8m4QhFPnYvDFqMIK2gIoLuAmi6NHfHAf0PBgzSPnlQ6WKBaE5OuaR9BdCj1B
	4Npr2opHPIeGtU=
X-Received: by 2002:a05:7022:43a8:b0:12a:6f8b:36a3 with SMTP id a92af1059eb24-12bfb6e7d0emr6729839c88.6.1775506445573;
        Mon, 06 Apr 2026 13:14:05 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:05 -0700 (PDT)
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
Subject: [PATCH v8 04/16] platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
Date: Mon,  6 Apr 2026 20:13:48 +0000
Message-ID: <20260406201400.438221-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
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

