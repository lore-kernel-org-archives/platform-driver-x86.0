Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227AF3C6A2C
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 22:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390242; cv=none; b=Jev8tEvAUKMcrsoxsmUgF/zDSjEcHumInrTOZMr71nXvjkhR/8MykzW5lobd8+gcLZkKSy5ZLga0N8xH9i+GsWOjdVMv0AOUNF560+KZFpgvHZHEz8biAbDvowkg9uIhHmq8n9mRzyqMImEhcvgSbiXmDoJ/uwaM8KFVUCHh4b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390242; c=relaxed/simple;
	bh=AQUeaXXHGbiRndMECPqoU/Ior8Gvc/r9qSAFlGar4zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enUptyF/1TSGoQ/viF+BhOk86XJMB1XnziY1cAkXWmjdbTBzwizOwD7wGtPfV1hv6qIWh+aAmw5aC/Li+VmdZAZKvlNOpF6BwoUzXFjDBTVF3avx75SejDXf0BSKwx2TmhySURJgUMqp5BrVQMK+5N2yM+iYbzH5XXfStF2eEmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+UdVxZi; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+UdVxZi"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c15849aa2cso948105eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 15:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774390240; x=1774995040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg/R8SNUkbuKmOj4guhipOUp/eufIeneu/lMA/V0xQQ=;
        b=i+UdVxZiKHVkrvkUy6QugwiaTWecG6C3MSxisEjwa0pNI7IAnwiX58CWKcr/D6qgAw
         Bmd54rlrgOgnvINxz3yHOzuaMSBBIXvSijSFvHxqWrxwlW2qy+H5FadnUAvnbPriTAMb
         xw9WVPPsNH7KCGa344w1ZpIq71ArY8XeGf1+NtiB7JznXZPNmo6QHLRD4qbtLVdkoZQZ
         jXVlej4TRZkHr8ADRyDgnH6IplJkgJihVahsC+LDDD5R2/jYp9/TJBv4fS+xtfDryNap
         Oq2gSuqD7cj5bDlVniIfiNWNQF5O2jF40PwbU23pCU3F+PsAIdpprih/6QwAfazqZdJx
         FXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390240; x=1774995040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lg/R8SNUkbuKmOj4guhipOUp/eufIeneu/lMA/V0xQQ=;
        b=Y3TUt0nPpbMAeu1E5UjV2j6nqH6RKMRQeM4oIjI/6SQSYQjzEl5BAYFRDuEu0QQjV0
         iBQ+01VGlYP8Orao238jJE0Oc+NxORIjeWlgav/Uk9zbEhnuEHCzxcJLNJwEtBpItp2t
         2ypP6vYFn3cp+l5t2tWkgFFQEC/A8pnLN9gqJg1WeUT91+PlzUVSnbc4y+S16MnXd0fU
         NFI49/Z9jsjK2F2FwLKjEGHy/wPPGhF6UUnxsFeBkFLGQ7Pb5L9o7rx2zZ+hQavF30OQ
         IMn9yiRYShM2kiQHRNe7VK+1dFvqw2v02djRkJ5GYfHt1wLbf/VOF6OP3qDNkWp3qHVK
         40CA==
X-Forwarded-Encrypted: i=1; AJvYcCU+32ii9XKXwRcUWaDVDplnw1oPLBInA0YC1iJoK5T38pdiaUyUmTd9/fyGe4xsrDIHboAOQ6/BfChxBhYZQJEe52JU@vger.kernel.org
X-Gm-Message-State: AOJu0YxFD9i0zFXjq8LPYZ+zXhpha2KEzv7d3fZ7JNJ2qQHx3SlZSaBT
	G6CzA2KjQbHXkcVpnMgA1RxYZ78XXtQuzKL1y7mWq3DOVWouXHik+EA5
X-Gm-Gg: ATEYQzw5SmKwwReNETlfobfIEGD721QuPuxHyAG7MJvAz+G6ovgl0sNLrYP8nP3l0Cm
	9JuN4gQiDuZ0JJ02w7AQZFaTt0xgRYDWcZ2gNNlJhUEOvG6CvalmA4ZhFxv+z1duwU1IUqw87ZX
	YWN8hMZHo0c+FjxlJQKTUH8C5UW8kGft+OmQS5jvcuzu78wBe3im1yHGi2jH0Bu2z2VTZd1c6Pv
	d9VfY66ycZIKGrQbUUIJ3U8n2RDjj0LgWrY4o6LLIGW1atAfOl+eACePik6a7/ip+TTqmWGqTgx
	nAEkDBkjvILg9rJM/o67hv5rWRauMPUgYZQs2RqySUh8DGnCF3C5fIxc4hsfXhgFsUhMrJU01Zr
	WjLkA/6Bcff20At2WejaejxJo7yt+d8rDcqtFB51E6uwZE6eunv17b06S8VosEZgOBSCuZgEBoT
	i2vAQW/JMrGrty0tKLLRfGETmUMBoelboWeRPvhsAaQREyPtf/uBQLDhMwaK2r5J++etqxXUQej
	Mb5
X-Received: by 2002:a05:7301:1e91:b0:2b7:1d38:3596 with SMTP id 5a478bee46e88-2c15d32adfamr436483eec.4.1774390240229;
        Tue, 24 Mar 2026 15:10:40 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm16282832eec.6.2026.03.24.15.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:10:40 -0700 (PDT)
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
Subject: [PATCH v5 7/8] platform-x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Tue, 24 Mar 2026 22:10:31 +0000
Message-ID: <20260324221032.1333636-8-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
References: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
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
index 6ce7877ce032..11c16857ef97 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -96,7 +96,7 @@ enum lwmi_feature_id_gpu {
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static BLOCKING_NOTIFIER_HEAD(om_chain_head);
@@ -1226,8 +1226,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
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

