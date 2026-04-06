Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F039EF25
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506455; cv=none; b=O4+r2eG71YquvV8NH0ya3xGAdlBI7yeGnMOwc+8Dd99xmE0W8TKk2/oHCb9W6/nfRMzahOYphDMVO4hgQp3m6rFKfaKqOURu+jx+dMFrNo2aeWuJYjKTXLWIzQ7BpJY4bbIqzGC9D+dILK8mVZu+Om/SBsRGXqGfK4p5xsXQUIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506455; c=relaxed/simple;
	bh=iFh0kepAp7+CUCWbukOagQfE8oUi6Sg9g6FZBrgbTWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/+TgbaiLI5SSX/CmS4RTzbLg1RTHf2H8CINBkG57VObXaJVK4kyroYyIwD4e/0CVfKYd3AWXP3xoJnwwtWjLLQlWwx2A77UuNQ+AzhtMFb3OCNzWcoakDxquisKS242DT0+dR7pdU26rZoef/q+ZsfRoSWPwm6/+Gqr6LtqysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBJuVUdS; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBJuVUdS"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1271195d2a7so9286457c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506452; x=1776111252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOFchhR6XmnD1NBAnpmpLdo/GO9fnq04FOmJKxWkKNQ=;
        b=FBJuVUdSP1VwDuYvaskVmnwmKNj8eJG43r5JCV/eSZPfNh4b2DelBogMIdkfTnPEXu
         URaYlSEcOTgEdX2HSIUpbvA/06/EH62cXaOmBn2p439jTzurCFCwqCW9kEkJEOSlQgck
         Qjvp7ayJKzF1WKzGFThIy/EQFPxOS9cqLSepl6vctHDTkB7mN28cy6+wGw85FD7JYvOr
         TTssRiJuapoygNP8BVu3quJnjs+Kcwc1Gc/jIa5GPraI0U1YYRFZd03a8kNsjrf3CYVK
         zthk9AqBZqwAVVDly/huXYzBhwBWi2np+frBxHaYP4nogCBUfuvUAk2V4BmCHanLFbIi
         SVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506452; x=1776111252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qOFchhR6XmnD1NBAnpmpLdo/GO9fnq04FOmJKxWkKNQ=;
        b=OCVjxdI7dmFJIKvD1CxjyF1rgSAbb0Y4tYXdrhDVwhzDHAC9XbkrU+FImqJ72qV/CD
         r9mdVUHqM6GpOwBC04T7j5y5e3Bu0kovtGqFyEv5Q9TlKPylVPQ/+6+ZdLl3XNvQY5J8
         +F/lHbKVnThW7egjlz3Dp49U8q06vxr8VzntDx3G2vSDDsnQHlmv7o92YihB968umLTA
         tuXDYj30jhccLlcoCwK9xhyCs8/TpXWUWF3EuT55BESm/byFlfkOrWKOwelY7lDDxRid
         GXehwv8dm6u7Xs1inC2k9IgEvp9X4e0t8eaHKbefGay4c64IUdOO+SOhui8tmPVZBpyB
         YGQg==
X-Forwarded-Encrypted: i=1; AJvYcCXKXTwZDU+B9/X8E8THYz7QjDFtKdUErLP9/94+7o1NNBNpbd9AuXqIlwKGXXtbmsPGsdchDu2GSuX31R+K/NgtEupc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8cL5u6eQiDQWyfvKXBTgTzproXYrPS/kA8S4bjVk5Q880euC2
	qD1DjFLzlW1y0IvV+zYdyNfAomoOJSL056HHrDprhh1+Djor0fr8Q5rT
X-Gm-Gg: AeBDietin4ee4IYUl3V5hHso9R1H9cqUvGjPydiI5w+9yBpTIxUBgRtboT5mQohigFP
	UeaefxlVNCNWEPWWY9JLEdgbasxTR3DZEgMj60j8fShaz8JVo2s+UHDzk4DIw+4ROKe3Gidv5L6
	YBmt3dcvE2rAZWUCPCQy5/6TqjRsSWduc7zJm92QD+jrseFsJXnYGQDYcvn2h/Ee0j2mSj34bxp
	Y3VvJ7CdFRpQip3zHeZ8DRkJUTPtnPP8LADgKXoyewM3HnxrN+eOn3kcFG6nx+TwkyAVGTijyzo
	Tg9XYzeWluRuebAwjwgvnBq/OEAhB2L/5pGdQXtiaVDaTng7sZg5qoSI3IPs6EY/ewljVP7Wrcg
	YTVlaDN/P2oOvv1saDRz1Xinruqxt/sZHTfrMeo3hUd0bMCW8tqT0QRKY6eZvxb+uapJqLE1VWC
	+u1Xv70FNjwLcwvgb6OKYr8bjdfPrBMTylMS13iuPjyL0ajGyz1YbmNlQZJXVivpHMrvsnCA0np
	DSN
X-Received: by 2002:a05:7022:207:b0:11b:f056:a19b with SMTP id a92af1059eb24-12bfb745a32mr8011160c88.18.1775506452150;
        Mon, 06 Apr 2026 13:14:12 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:11 -0700 (PDT)
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
Subject: [PATCH v8 13/16] platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Mon,  6 Apr 2026 20:13:57 +0000
Message-ID: <20260406201400.438221-14-derekjohn.clark@gmail.com>
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
index 57b6b6f17f33..3ff7b9680f3a 100644
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

