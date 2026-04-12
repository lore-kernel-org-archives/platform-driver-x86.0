Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4838642A
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028296; cv=none; b=jNn+PxBJME7jMkS46h1TRKGIzMtu/XMJso0J4r+Ywbfjdb9inW3Y5nvETJgbdi0nIreEn6AuKcvEBMePzTH8DUSLzuoe4fS9qx5gY5GevIgY1Q0oz/Kv7pXMuoWuGY1Km16JKFWnqGdF+4lCWGhAnmrABI5gczK0j72NPmyjxjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028296; c=relaxed/simple;
	bh=NaAktuywsVP8xVPWdr5Bfl6Gk6ztbpjWY6fnVSe/yx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmWi8zwmLfJCt3ftfDFhL6dLCVnebtyrk6MRudfnLTwVie55jYhyV19rStvsSIIA1prUgeRG+C/1rVuuJMZ3bilCInlZkp/0jorwB6ApuOCWQO/siku52+pYMY4ugw0Z9Fn0RYXzmFVZ1cmlCUt1QiiOgy5n/xNMQ0trvuVDBR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce5LczvQ; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce5LczvQ"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c45281a06so1167879c88.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028293; x=1776633093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+KtPnYD4kSOm8bUxA0Hr5Fh/9ElWR0RWD/pn4KfFXg=;
        b=ce5LczvQnKK26dNYwcmhu4N6ODjhokLiAML0xi/h/+RkhbYJRaqlLFgzkGmxNKkX1m
         A8A0YCnttXwgWu3ZvXXY20TeoIGe4Wqdqxqp8u+MKboD3+P/9v12cDXfkKdxMZ1880Yj
         YPjkd8XRIhrMqDtWnV0VwWu0hlDydQDdNFAMVXLmfNfFFRA33aYoJjUmhC0FQ1xTmgD5
         0yw3td8W9eo3EgirmYxbfUYcIcnzfYdIDYmb0bqrYV9EcTkRzRotDo5ZrmNaX7njDvOq
         XB9Rlh2Jp8qWTESd9ZwU4tZLY43Tglmu7eVEIZ6Fre4Y3Bx4atbMykCnYkBKuhdEmVbM
         e4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028293; x=1776633093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W+KtPnYD4kSOm8bUxA0Hr5Fh/9ElWR0RWD/pn4KfFXg=;
        b=UA2kbf+BvosPtglnPBc5ykOprGOsLSs08DuE8FcFfv1+nn61GFlM7JerGCCVajH9dt
         oBa96IgENBGWyTl5C+RoJQmUc7QvKLnJV4xtkwd8u7JX1zwrsJ/WbLmjepu+PsmEG1gl
         9pimq86Z3k4mivmpnKZKZu+tgyUD6NGG981I/69l08mn94cc2TEXq4t5+9VA5oaPfyCf
         mEwCZrXXtW8K1aMgO0ebwE7GWsV/QHNDNDZqJqvw8xliZ4VeebnXOGl0CjyWZdqTTtYl
         e9jjUkeOvEjFvOy7hs7kRiW1iUtsVz+UcAOcztYZV12W/qONeebtC39WXX3yvIU+Xp3M
         PVJA==
X-Forwarded-Encrypted: i=1; AJvYcCXLSBlxlvOnGGcxh3XAiiHGMjF5o5CcNGwOrK5CnA20F52Yj3/bSnL2Q4pDpPwH2FUjQqTX56F1DCTfJ1NwkO3gMcB/@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0X3ml50W0DmNHsOU0UpUWR5UeY1THV+NLCLz4USPb/W8XGww
	3prLhldMuxP1Q/fm+SlCbqmqcScEYXpBFXHguACB58ueqFjm3xD2Wr2v
X-Gm-Gg: AeBDieuvdcp7qG/rEVpTVY42iCb/XP4aTRzGUAjLG4tep5PunBOHdHnCPQg25Rpt4oo
	86Oc4bGcWVOPN+vIcCaJAVW0SzA6f6trzGpH6iDOZjol88qzpViqG/q5fqpu42zMj0gkrXr3ISt
	KfOONUevgKYDxAPri3cZhuVK10+CWmCWxav9CjDy+lINXl6bugojONjQUK6mZVoRb3pCdMxTF8D
	XVIqGecebr80DD9WxS0JYiS12CUf2drVsxON5Gjd4e3VfIu/BdD8h3bwy31/ctk8dTUv45/7u4/
	Mm0X9d1RtgD8xVCclB4x/PJZVrryHbDDJepN6Ds9UQi5S532wTPyOS0wm1Nm8ujhxH3tR0Gn5pS
	hrU+ZVsqZx+hdw4sc4VlrNn7qTLKGq+zGHGl8EdhGp83wYKkBLR7qV86JbzBprYLToF9TzOq6LG
	xuA/IqB9bNvnnY6lH3NmMQqzpm1ryynWVjdr+owsfLDsikOuu7G3w5MajGh8IeWXJ9Sqh1jScZY
	cKQ
X-Received: by 2002:a05:7022:439f:b0:128:d715:b717 with SMTP id a92af1059eb24-12c34e92e3emr5467551c88.13.1776028292616;
        Sun, 12 Apr 2026 14:11:32 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:32 -0700 (PDT)
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
Subject: [PATCH v10 13/16] platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Sun, 12 Apr 2026 14:11:18 -0700
Message-ID: <20260412211121.2220556-14-derekjohn.clark@gmail.com>
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

In the next patch a power supply extension is added which requires
a name attribute. Instead of creating another const macro with the
same information, rename LWMI_OM_FW_ATTR_BASE_PATH to
LWMI_OM_SYSFS_NAME.

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 47554a20d36b..9636a3dc0788 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -91,7 +91,7 @@ enum lwmi_feature_id_gpu {
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static DEFINE_IDA(lwmi_om_ida);
@@ -1123,8 +1123,7 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
 	priv->fw_attr_dev = device_create(&firmware_attributes_class, NULL,
 					  MKDEV(0, 0), NULL, "%s-%u",
-					  LWMI_OM_FW_ATTR_BASE_PATH,
-					  priv->ida_id);
+					  LWMI_OM_SYSFS_NAME, priv->ida_id);
 	if (IS_ERR(priv->fw_attr_dev)) {
 		err = PTR_ERR(priv->fw_attr_dev);
 		goto err_free_ida;
-- 
2.53.0

