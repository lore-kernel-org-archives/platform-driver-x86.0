Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA62370ACD
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 06:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779257270; cv=none; b=P/ip8ZH0FlK6dHXD5gQLZUJcCBY+iFTYitex1r9FAO+30wOF7xl48L9KlDsWzE1CqWRpMvGN3+kx+rrzIG/TpLs7idA6Sxmld1CdygZcfKYa+wl9IsZXrOnebUZfYwwctivz8/og5m5L0lRGqdXtbAwGsBsXt0rKLOc725IJ8Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779257270; c=relaxed/simple;
	bh=SBViPiRUmhkdNzWa5VczX1quNP5nmjWucy5Pgexeu3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TU/xvpRvLNpjTv9JjzvIqO42GJ1eoPplDda4hKzuoLwG7Kd8DTjjTooWcrdQfbpq9MengqMPaOSeigNUWJvBAYVCMTlxc1ADI1tWdqL80yJGmh78AqVneaDt1RfDPBvxOQY/2XCWlhJ+P4IgPjhKxWiQkS8+gAt6ocCuEExKCUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJJpgTNF; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJJpgTNF"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1357c851a48so4573786c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 23:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779257268; x=1779862068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wRTeD7dSyNFLzvhp1EB+mb3CycYaPY6lD8eO4/RobI=;
        b=YJJpgTNFxHnAduscznrTUkMGcT2J7nESUARzh4VD2J5WudJJ056+K6hgHozNqPfQq+
         GSok4Lvn2vNOWackVaSpvf8oV3cqGCw6NOAyl71C/rXAlh1snFQkOZ+FWWbhLpFx1n9R
         kEIsPjq49r0Ow0j0kq4rRNH8zUK3ffx85bX81efL9kwb6fqTGH3KfoJORhDfUjCWBXBW
         N9ls2MrVJUDTrqmwW7iVOzx4KZBAYQCzz/axqtOL7GMf2RaUuPU5LEIItV+dewdu+sI2
         9w1ZZq2ItCKk2f6QX2xabolp82TcI87XF7xd27sM+tImWwV0f+lD3RK/eXPQlr2foUZi
         HvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779257268; x=1779862068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3wRTeD7dSyNFLzvhp1EB+mb3CycYaPY6lD8eO4/RobI=;
        b=jQOeeMRfh5odvXAs+uv9ESHSTyYhHbYj9saAY56yGSI6R75ENAW0tWJkyCf8OGYqvf
         vS609mylma1UuwoqI+lZZMtB3F/fUhv+E4fh/dLJqvGx1DY+p82IrKBsEwHpf3oOIqRY
         SNgaSfP4sFp8I2s+SBi2Hj2bmtO4ktz+gzvRYwwQknn8CDh3zH9oC4mGFZMsTuqWY5QX
         dC3DdSM5tJqu2NG9ikw4SnKnyZznLmJ6QahlTmOIQTZcAmmlM9RqMheAae+73BWC9o/R
         x/Kn0jLAvCptjVRHm3BxDBkZWr3uAJSOUHLwif5vUkhb+5hFE/BI3WU+F7IVwdHhG3i4
         rYpw==
X-Forwarded-Encrypted: i=1; AFNElJ8OLRxq09ej/lo65MywRhxB/AnQ3vA02IZf5zDkUOd1b4O9Uq7oX+0jGQSz4vR06eV8jhCknkOGbIW/Lctg8ttDyshG@vger.kernel.org
X-Gm-Message-State: AOJu0YwdcwBZBkRGC7a0ENhP0yaBUSKir9Ja7opRwGCEWhy5xmfQyG1D
	JKGrTLPECw3oXavPW1E2yTMZrk5kgXke0zZ5gZl9M2NCS0oEBvfCwMhM
X-Gm-Gg: Acq92OHZWpBoqK32fhDNX/JAUSryIcXLKXnDNb2i603LzwefxNkriDH5UFN/k2plwkM
	gCQR2gq+xpfVohwDd5eCbJ1VBmspQaTapmw0sMOEAsMWZEGOJIBbjkv43o/mLbqO/9OlxmGultQ
	qVwZutMcE/7uei0HIaPlMaXl574jfWY7OPiO31FLAVBQ5Zji0cws1QwJVT4H3sBFP0q49F9TzIq
	XdqhVv7vbG18Yrjqf5Mr09payjojEGRnR26XR2rqURqSlaSHeuIrvhSnC6jcMX+3n+xLI9P4zkv
	yI1+/XSibP5rJW1xvjfbOzaA7QzFYR1oN/xDcVbL7qvMcOJNCjwVPdsCzbCMZOlUK8qJc/C/45q
	6n4JkrKXmx30PSZjMs/q0g1IVWLjjdCltVVAeJBDTypPcp/8S1FBUZU7uDi8rgQiAfJ1wdK6VVP
	tJ9711TL9tX4hETeEhAVxpkUwy0QkD3+lxVAqwQlKHGrOmKsnKEH1/o7Q7g/vxhrxy8ZHg1SE6o
	VW6cwmr+w4TZ3U=
X-Received: by 2002:a05:7022:e984:b0:134:fea9:f106 with SMTP id a92af1059eb24-135049487bemr8900758c88.34.1779257267597;
        Tue, 19 May 2026 23:07:47 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm27906026c88.11.2026.05.19.23.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:07:47 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 3/7] platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
Date: Wed, 20 May 2026 06:07:36 +0000
Message-ID: <20260520060740.119554-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520060740.119554-1-derekjohn.clark@gmail.com>
References: <20260520060740.119554-1-derekjohn.clark@gmail.com>
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
index 9a6183bbcc920..beb92c7cff257 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -92,7 +92,7 @@ enum lwmi_feature_id_gpu {
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
+#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
 static DEFINE_IDA(lwmi_om_ida);
@@ -1138,8 +1138,7 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
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

