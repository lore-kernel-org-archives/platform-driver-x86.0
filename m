Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEA53B895E
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924623; cv=none; b=GPQA+mj2kX+v4FZ+bNRVDQoPZ9O2rW1cx3t0ekdpi611PUYjM0o35FPuS+lbLJU0KvePT0GNYbD+jKu2tBI9rS9//5ayA/B/+HfoDOVTViS/bLyzthSWdU4Lof9i+LhRy8BWpY/zCQfxaFu+TWvZgbLrQ4/NZtQkMd0xYb+4ONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924623; c=relaxed/simple;
	bh=Pw+ssuLutbx3g6u/jM5PMxxasbxx9jVlsAJtmVGQOkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qg9Lx3bPZLB60fYrUf3MTMliGPkQfepaS6W2sc2RsAO4H0tdoE7qO4Gdp5haUrn7lX7x5pMRdkv3IPd0PLfez7aevWJyvm82tNqBtmEYVMeGBPIicknST9wCbReb9ZzGb/eupNRqkEvw+2vwoJtJpNuEytUCqTF+Vi7QFVslEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRS+yS5N; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRS+yS5N"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c42a23c8eso375910c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924621; x=1776529421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtTcFBJ7InscTxETiiZ7Szcd4eyMEX33KwP3VapF0JQ=;
        b=FRS+yS5Noj9viJTBLP7ou/JlZtvxKpHBVIdcBJVoYFLGjGLknGjAlVxaQQiOQ1P6oZ
         dPmUqMqHGTDl5onAIFv8zZFysK/0w0zUSJ9gzRyadKn1U+kzzp4tGDlNwsapyMCFhBBe
         vPOB/KtxZj7JSVPnageol0iPRgOvB4gKFEan+kl5lLk3s4kFUeVA5P27smjrGv5gR0qA
         sZnauBv+V5+ccwwcvB7EmCFoSGgJ0C02wXIH0ZNupkRQbt9WvcidBjiP9/lo/OqUNlNp
         6zvhySzI0eBNqNUB2lIXPbLDrIzAj0rC5zVP801CRV1D7Fw5iwc4PBapimGCXK09575t
         ilag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924621; x=1776529421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VtTcFBJ7InscTxETiiZ7Szcd4eyMEX33KwP3VapF0JQ=;
        b=V4wBy+dIq+UVubkvklRwmFgDOODmrNQ/1xITLQYFLyXMjeuw3gDySZGdF+aByGwJu4
         zUqpWMyMZDHKz0WQL0omEhq0G5hiUnUOdXhNKendjPx0Lyp0UgIyBgYboFGnbsCnw5vc
         bz9mYJyjVf2hgMa8yTnAkSVpXkr0OG66k4/HaIxFdnEjSnSS97AHqqDxikKDnqxhIdI3
         ZVoVf2Sx0TrcEfoIcsbm8blIePqvLuHJi2enBYmOTEJAagRtdHj1ENMd5fpvbO9zGq8N
         BZFBTddoMM2oUVxdBm933rys/6NXBYW3VGq1sf8gSZ5SUYXl+GMlM30Y7nGnlOh3nI7N
         uxRg==
X-Forwarded-Encrypted: i=1; AJvYcCUM93dHnVnPO3leqNYf+8QsvUS7vNZ4/I5H9ib7PXlY9VLh37lItb74W/5l3gM6kybD4zZklnFe7LYKhhFUoVX7Dnhx@vger.kernel.org
X-Gm-Message-State: AOJu0YwpafZwmZi1gWCBcGcXQHrWU9Jp1okJceoq3pOl2uh1kHCISZcX
	OuurMQeVCyHeTM9BwG//CDmK82u2BPkSOkSLVKEuld0geampLrKF6IXD
X-Gm-Gg: AeBDieu7LAhGeM4InPYL9sTwhzSSjsXQJMLGPNeQmidJu7+lllTQrxckIqmcXfV96zZ
	LwTuBLDuov8QsBxsCPEnC7uqA209+k6RCTwXgv+JpOatAgMTFpmV6eJSe6191wlZAaH5nT38hjb
	RdIAaRHharvkIGaHeQA5qZy34oYHMYCnuwZfAXaJoBbSWvAdN1BNrnOXpp5083KT/+FWV/8JmRF
	IryQcDwLoDsd9C4HHDbaztxb6Nn/2fdmlec9F/NfYyEkYDpRFXMdmbk7HSbamiAqpZCmqLBFWXs
	inHWDAyGSnYoAxU7IFCoIGV+reJ8MPKL5h1urWWizJcbrcqGbIj1WwfSMZpYn6assFY5418eQeP
	2OoLm1hWJ9lPK82HmFro7llnUbeLM1Ig1EPU3Oi/15S4MxK0PNx3dwgLEcp0iyW6Fj9VmGvrCf1
	k5UQE6eI+F5Q3abssIgpVSRDSF1+DBoHhWo278czRAqg82A3zQxJTxKaEdurkgnMzy4nl1rZya1
	CKks6h2F8Pifw0=
X-Received: by 2002:a05:7022:eac4:b0:128:d967:4673 with SMTP id a92af1059eb24-12c34eb6a86mr4884060c88.16.1775924620861;
        Sat, 11 Apr 2026 09:23:40 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:40 -0700 (PDT)
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
Subject: [PATCH v9 04/16] platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
Date: Sat, 11 Apr 2026 16:23:22 +0000
Message-ID: <20260411162334.25682-5-derekjohn.clark@gmail.com>
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

Adds explicit initialization of wmi_method_args_32 declarations with
zero values to prevent uninitialized data from being sent to the device
BIOS when passed.

No functional change intended.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
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
index a6be3463341c..1e06b894cfcc 100644
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

