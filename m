Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC293BED2A
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924632; cv=none; b=JWeXM++9gk8MyxVN3D+E+MNlh30ZDPjrPWo1ijJMHOKvAHX21oaX0vHJhvyEPfatxOwbdSG82NF2uF3zc1izmu+/Mtei1NePQJ4cFDmU12lgk+j1JcYBOR1jpsKFeC/uQykDPJO/b69tZWOS7jHFWM8su/U4qzMXB7viMXRUUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924632; c=relaxed/simple;
	bh=KZbMws+RPhqWUp4VZ4fS/BumWh7r1gSCSaOAWThv/5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJ/hx3q6l0MtEhKRkEmMHMfavimpiVuGRHKsDBBU2lbbiqQPNLbYJUH0LWrbmsWbYHVZpqHiNDoKgqrj5Fqoi/zYD80EUocDF+6EB0joKu0/z0n9yLuV92TtmrzoQ7YgfEGS5kfHTxLPj9z+YmjGm3vq3rZBO9VgLAgikmyH1W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKeGjJSR; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKeGjJSR"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3346276eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924627; x=1776529427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrbdI59tuRDPJF2wdYJHVTWAgIdn3RqYy9PDRQEvy5c=;
        b=RKeGjJSR7NQll1mzZyyB8F0rGKIro3JG6rqeVIPt1hGRzQa0ask09BGRWerGNtgX5Q
         h7e/7aRe5Cgq0QxhYTzYV57RLjaL+9FgCYhmlN/peGYceghj00oAkRRvdhGDdZtazsU3
         JiPhKFFyqqOi0MxAmN3ugpOksEIPFfpQ63CWOeFKmDA2Sr6J2FXHs6qdz6ZMsU/3ffx2
         IetkzKSwB/NUvm9N+pYibchadKMKYRDuSHimxo/oQZMUd8DXWUMmpILErVwhzuSNpcHl
         H4HG/Bs4Gq9y4Cie0RbuuyHRPZbzgkKpbTaXxSuVACfbU30kPrf0cDKimiIhCI/+34kO
         pXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924627; x=1776529427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QrbdI59tuRDPJF2wdYJHVTWAgIdn3RqYy9PDRQEvy5c=;
        b=oya0JHViPIWbHoTj4y5qCiCAuwYa39roEBvf0I+HuuHipICjGGG+twktYrqI+J3OHf
         zNI0LTGBgSQZdsSaHsAQPQcekNj9sgILeU/5ChqTZ2my8ThRb2URIrK/IEZjFcCN0dO5
         AuhsDbwvurdDDOIw1xftrRSvkDfNbTKgGNU56yFwzSXJqvpHZMxNWwf2IqP9nIf53GQV
         NzeX3lpMmK7pMriGVvipGFqWjlvY34MH4tq+GgNfiwl6nnsQAdx522W9XTrRKYhgBuNy
         IhCS9mrDspBJR/7FsgCrvZ1f2232qPtRE0uZQ7o1wC4I+KlCh7AjDkidOQWVd4mDIBBJ
         kAiw==
X-Forwarded-Encrypted: i=1; AJvYcCVEzCpVfhFcHdQorlXA4ABwO8XPAG36ePDqei/fZa4UKSaMS61fr/5jkqw4ZxQdgI5vL1rTg3BNg78qngZYqXjjuKca@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpt5gpkovyHtRIKNSOZHviBj87orL1148mwy5HP9ra7M+6j2DG
	0tWlhtyt23GDz263L0hv7uxKxXtJrk73W0wkOFIjIVYtxBWFm6B1w3PK
X-Gm-Gg: AeBDieszqqG2DHbHnKFCmh5X6ICGIYGZ0Z0qZ/ga+CWZM9z4wC06tMxytMSZMhGQDjd
	AkoIW8JqwqmNNx/QFzhawwwRvx8HuTlPSAtS3wq9OjPGUC/9dgbmz1GP3yNx5uIikU9iJdYfafE
	SJICAYUylYfJ3h6CCYEg+0Oh+UVxnRS+msVB4ZL479rMlHPWTMa3ROuFCe3ZI9pGuBRQNuvXVqg
	cYzx1op6DWEZHS7VU2J/gecbU/uFUDVcIWU3o6CnMN34XyjPHVa0ibur/nLQRIWbKNbqK17tx79
	b05jEozvSdSbekykkxfTUs8B7tEjBPk+WbCntBrWxzF8tOcO+DPsrEQj1vzIHsxgEkWvlD+1CPV
	YiZ6jsYKXEEPV0h8p0rs4rAvlJFEH4PbEwHkzU5Vynt0RJJfE54YaDMGn1zvDT9L3GhqOaPMqpj
	PwNZWgp2fNObmNIa8zj/RsM63IxCzlEaHKxbNXqX1xojbk7Kd9GBzeGYISMa0xzs7dQQP+PhNA6
	oFBk8sONizwkGw=
X-Received: by 2002:a05:7300:e82c:b0:2cb:990a:b5e with SMTP id 5a478bee46e88-2d5881acd8dmr4127723eec.15.1775924626769;
        Sat, 11 Apr 2026 09:23:46 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:46 -0700 (PDT)
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
Subject: [PATCH v9 13/16] platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Sat, 11 Apr 2026 16:23:31 +0000
Message-ID: <20260411162334.25682-14-derekjohn.clark@gmail.com>
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
index 8abfea8c308a..0bc9122ee4c9 100644
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

