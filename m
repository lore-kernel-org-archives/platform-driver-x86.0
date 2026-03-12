Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E9D385531
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 03:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285042; cv=none; b=hibbrmCaYmeAFfOo/jM/WAjEvPepHogS+dFoj3pIc+MmKVpfZjjmTZbvF/JdgCdkqFJfUcoJJ1VUp+8yp5VLzJeuMdx6Zvch43NEbSMUBh+PQG95nMAJkh6R3RLZJdb9rocI4Rc8UBPD2qPFS8Zm4J90luv02wy35d8WDNSC3sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285042; c=relaxed/simple;
	bh=xoJDaHeGE10tB/OgQJVbj0y4ysOzv5cGh/fEFk6Jjus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XMVsOZMJZsa6CeY/x44xcdmffMPNFYufSak5j9E1CZYFhjet5oo31qS3CTFG3PGQZFMUsaP2O0J1jnCDYNa+kgngYVnzFNMJrd7vqQFJ7Z2OFneMNXDPC0S5so0fAw35ClvkoIjMaFZBlTmzPLkH4oqHxOeDb5x0UJj7zaNu/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRyo/lnf; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRyo/lnf"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2be4781d2baso1299948eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 20:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773285040; x=1773889840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uk9Rf0W8BgjGzTpflKJXer4l/RsDMi7bflK7Q66tV0=;
        b=CRyo/lnfNJSICVsaoE+DpoJlPKPa6hw0PBMKv8Yg4/tWmgf4SQY+6lcprVP2+fPR3L
         RQZv1THsvGST7HLp34r3ox82PCM3LWGADcJDZzepaN8iQSy29Mugtbucfblzwol0hAGV
         hNrkBKCTsI0IEYJ59ptoAtErjzQiGXT8ZbmHQSRemdSYojtMP915HT7x5RCW8bm3TRat
         G0SBtdfRZzhyzfpENLlcNIBPZ24RN5BuAwSNoPnxEAFZ6ESrZ6jumiKcdU19pGHpAKMh
         BDBbD5D5bpj2WhFxdbor657B4Nkn6vGtYv8l+pTcBBHltH4wUfxeZ8sja0NaeKew9wI7
         Q9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773285040; x=1773889840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7uk9Rf0W8BgjGzTpflKJXer4l/RsDMi7bflK7Q66tV0=;
        b=WH5VgRJ2zNNMh08IhPz++Y6iH4Hz30YHElZkcS+fFL00MDWiuoNAuinf19xWuOk7uT
         LwyLXvls2vXP2CHCoNW6vHLpsFUyGKVnp9poA+Onu3wSFjWVq5oEwNbUd9+LbWoWwlsf
         txKGgYv6B0QaCZwYnIVAa2YCMLkTPkzrYbsJS59ZxeJ9NCsReE+PrkViKHeiR0Rw7dmP
         upqqKKlfnllJjw0kQAe7nV+YQYFeTAxbTSe7FhQ52HQiX4kg9Sl8NuHSGCERgOzSoMAv
         ogZiACkGjKSd/SoPx1YkO99fTzLFvHggKzxnolmfYnQ5PxKruLZ9iUosLjm72ezJFPpe
         9mow==
X-Forwarded-Encrypted: i=1; AJvYcCVumLv7JsLf1iDpXaUIXTw5B/uc+7SW02OlNaiQHwAI/btMmC1gqnuQ4uapcPY/nYMfIVuR3m8tc9vuSxvwFypF1+dN@vger.kernel.org
X-Gm-Message-State: AOJu0YyGwui3Okx3qVycMZ/j7LYkiLfEE+gXT77bAEONFO+lI9FpVGBD
	YMpKX4jDwcGSjj84nnlBUpceOZ0x9THFOz9mVaOpwX9SPfmiRHA7MmXY
X-Gm-Gg: ATEYQzxB40N2X3GXxl6b91kGSsmPM7A6U7jWFHjEHYBm+rmPue60i1ew+aH8qyRzooI
	E/rMk3/4Q0M7mnkdAjrsQiT8tW2PejGfMCOwcOmov6+H/usa0stAzV8LDIKJYU8N6dAvYe8ZkBk
	mT3yPoPJikwL6rcheenfPtyMNRyR9KsaDlAoeq2M1U9ZsxW3uCmQB0JhU1TII1jWOzP/bSdcrUO
	j24iujm88u0l6LTi8A9sA4iv4LxiuroI8zUt4pRSSoHHYmnD1xBmr39powc1WgFnpbPl66b+fQa
	P4vHN4l5chUwurMGtdU+umd2hzxU8cz1e2uSP4UREEWFu0Pe8n8KgUw5uVskNztIcK57TeUloP2
	y2aAK2wrCYRqrQMmBNGXaDaAd6ZBa8neLM5cYDJReTVhoftA4sqwjWx4VvmEXZT3f5yw4zEm98U
	HDg7NYB+Q0i6thIT1L2bm+ckzDEbqqVaXRYKeiSPtIvLfHV7O57frq9qcYVd+ZGNzAEMhzO0QpE
	PdUzCfe770Yxy4=
X-Received: by 2002:a05:7300:8ca0:b0:2be:22e9:2178 with SMTP id 5a478bee46e88-2be8a2b1290mr2287521eec.17.1773285040240;
        Wed, 11 Mar 2026 20:10:40 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa97dcfsm4802495eec.33.2026.03.11.20.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:10:39 -0700 (PDT)
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
Subject: [PATCH v4 7/8] platform-x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Thu, 12 Mar 2026 03:10:31 +0000
Message-ID: <20260312031032.3467565-8-derekjohn.clark@gmail.com>
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

In the next patch a power supply extension is added which requires
a name attribute. Instead of creating another const macro with the
same information, rename LWMI_OM_FW_ATTR_BASE_PATH to
LWMI_OM_SYSFS_NAME.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 7b98e9271eec..61ac9bee352f 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -114,7 +114,7 @@ static u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id)
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static BLOCKING_NOTIFIER_HEAD(om_chain_head);
@@ -1243,8 +1243,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
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

