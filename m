Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958115;
	b=P60I+sVqeMoRpeGLakQPfk0xr+Ri1JUDsJUR464MCs8ByBf4ntYYkgX9AgooWNq7F7Ua
	 KjCh8YR8Oqq8H4IS5Am9y0vmUQTnIAFRbik+FBRI9MXezPSvcDIbJBg/Ecfe+FtWXYypN
	 imlmHl94G6OFhhPXCy6kt9LIJ+DnAuNIz4HszkjarnW+kvvxqqtIvpdVRdx57fNXGmD2X
	 QFpcsShtvvntdL6Wht4RCYjfigJPZnuz71eWS9oPcw6QAxYP9qohJQIGdgAsX0v/xaG3X
	 n2pV41LG78awtLl0NQmrnvWWzOKfgL97tLoql9tp90es8279Ymh5LcQiKgDMPBWYCnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+1WmRUKl2XC7tOZfUGnVuLNn3O22106gnqmUD98+IBU=;
	b=U0neo0oSsqsxbhAXeafqrlhev4YK8FEMI4cUUSYduGGhZEbApns2ItLGVOME1E3EYAhF
	 TlF5JfsD7R4hUoHSxG+AeZX20eX0uktB1id3wj1lzElIsoVNIXLax9jE89In8xu6sQOV1
	 1k8q5pF+cEwwYFMToI1uwK1iHdllpwRoHt/iZ+8q1eAaBE26oVbehOnCAwu1u3mhELjhZ
	 PUVg8W7Ha2yDAX1Xb7/dPAZCwJPCLG/T2r7husbETUP+Y8M/BTvO1AF+QZ7gYuHY/AJEG
	 fqSKIGYHxqLabe0mHCCErghNYHVYfvVIiZfcIfwKMjPFAwW5w3NJN2QaDeAIb6fP4pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=cw7na4hB;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F089606A31E
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 19:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F089606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=cw7na4hB
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so3671959a12.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 12:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792958113; x=1793562913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1WmRUKl2XC7tOZfUGnVuLNn3O22106gnqmUD98+IBU=;
        b=cw7na4hBtndxzjyie97/5plvVxYOkNZk/kzxN3ZSxnOMusbnWGQCAd+L7bwMGrbJHG
         tP2F/I0n6/Bf/6uhWpK9Nuu9TodSMu2AGn19DEN1JMj3tEIYZQ32ZZnpzXCO/aTQcnZJ
         1wLVWCol+g7MqdQjCwervvd5poPDfeNlbppNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792958113; x=1793562913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1WmRUKl2XC7tOZfUGnVuLNn3O22106gnqmUD98+IBU=;
        b=TiTGQnFDjAugm4o6bMUzi4fS6p0XCv+j+bAMhaMC43hTlyx8ZV9uSrRuKaQQ3Kj0+I
         Fvwf4+Vg7AYHaULcJCSxUEzlUNs8bB6aBE21nDW+8WvPx5dNstmRGjD90Acnjag6me63
         k4APy0bu+pKzmIQOOfAYSO2CDCtzq1nSJM3Ersr/nQy0mwSFJSJchgUh5Dt+UHg8JYrI
         Fm4EEadZmlsBkhuBtW+BaG+EmLnN4evZXFu9XX00RT6Mpz06yr6h2GMWVLF+yje4xJO4
         Mwk62b9hJWWTZN+gtgHlV0i/3DSenE86xhDvqlHPtXIkCUYfz2q6coochN2SBY2RvH2k
         xb5g==
X-Gm-Message-State: AFq9FYKDcKHqnbwQJ13G0fFEYO0xCbPQdu2cB+9L+kvxcau3WDahpX5L
	rT185kNnLfwyWxwV+P+K+se+PvisCzpLOT26VQP7cN6Ey/2zBYQULgP0JxKD8ikLnVo=
X-Gm-Gg: AYBFou2ItMZXaCi9hcInKiTIzToPusOzQX0hbaIztBIOTi9HPM7AjxFtcveV1XkXPXC
	ESKTpTisH3MLOI3CQ/1bt7ZRlIU6etAxRW8oEhL6dvCdrbhDME6I2jOi8OcLtsWVORQRZUEP59q
	YmTsHFc03f+ahyrmJMrn0XK5UxbEmcH2Cm8bFtnI1dL3wDVxwtb8onPpHdZOnHq11/s/TfQ5KAa
	Ktn6k3kVihhCh+STYUOzhtVLWIaFgDvivdoeKlP+WcCuQSFvCxycGhhZpFpxpTwuhzxiHortyS7
	Yd73ihoayCNZC7DZuQ837FPLhf6m6ZXFT6QaHwEJMMkgY0gcpL2MEXojfhln4oK3+PmiQ4TcFei
	ySAgsPkQoFUcnqJ3H6ecLswrnTe7KftTK+hAJx94jttwvC4IXnHel/QW5No/hSaeVSlqKQMO7hG
	bD45Q+fvrcIrKm7AEnGRmylV9RIeY2il2ihscq9//bj4qclllasophvuG+r5seybUWKgtKU32uE
	fpPG6KquOtFnuCzQhhzrPpoBqukOH325tqqdHWu/YPZ/tagxwIqN4mqBi+HF9UPm6zQogmwvzWX
	idSB9VuZ2KPHVcG7Lc7l
X-Received: by 2002:a17:906:d553:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c46bd906647mr609742066b.0.1792958113579;
        Sun, 25 Oct 2026 12:55:13 -0700 (PDT)
Received: from xia (user-46-112-84-81.play-internet.pl. [46.112.84.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea620sm238279666b.23.2026.10.25.12.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:55:12 -0700 (PDT)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v2 2/2] platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on profile errors
Date: Sun, 25 Oct 2026 20:54:56 +0100
Message-ID: <20261025195456.43414-3-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025195456.43414-1-chris@miget.com>
References: <20261025195456.43414-1-chris@miget.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bitland_mifs_wmi_suspend() returns the laptop_profile_get() error to
the PM core, which aborts the whole system suspend. This happens on any
machine whose firmware reports a SystemPerMode value that is missing
from its profile table, and on such a laptop with the lid closed logind
keeps retrying the suspend, so the machine stays awake and drains its
battery.

bitland_mifs_wmi_resume() likewise returns any error other than
-EOPNOTSUPP from restoring the profile, so the resume is reported as
failed although the machine is fully usable.

Saving and restoring the platform profile is best effort. Warn and
continue instead of failing the system transition, and skip the restore
when nothing was saved, so resume does not write a stale or default
profile.

Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Tested on the same machine with v13 and this patch, without patch 1,
    and the firmware in 0x04. v13 alone aborts a pm_test=devices suspend:
    
      bitland_mifs_wmi_suspend [bitland_mifs_wmi] returns -22
      PM: failed to suspend: error -22
    
    With this patch the suspend completes, "Failed to save platform
    profile: -22" is logged and the firmware is still in 0x04 after resume.
    
    This supersedes "platform/x86: bitland-mifs-wmi: Don't abort suspend
    when platform profile access fails" [1], reworked on top of v13 6/7.
    
    [1] https://lore.kernel.org/all/20260911182131.461415-1-chris@miget.com/

 drivers/platform/x86/bitland-mifs-wmi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 73be63146fd5..df9a931fa939 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -237,6 +237,7 @@ struct bitland_mifs_wmi_data {
 	struct device *pp_dev;
 	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
+	bool profile_saved;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -408,10 +409,15 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 		return 0;
 
 	ret = laptop_profile_get(data->pp_dev, &profile);
-	if (ret == 0)
-		data->saved_profile = profile;
+	data->profile_saved = !ret;
+	if (ret) {
+		dev_warn(dev, "Failed to save platform profile: %d\n", ret);
+		return 0;
+	}
 
-	return ret;
+	data->saved_profile = profile;
+
+	return 0;
 }
 
 static int bitland_mifs_wmi_resume(struct device *dev)
@@ -419,8 +425,8 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	/* Skip event device */
-	if (!data->pp_dev)
+	/* Skip event device, or nothing was saved on suspend */
+	if (!data->pp_dev || !data->profile_saved)
 		return 0;
 
 	ret = laptop_profile_set(dev, data->saved_profile);
@@ -436,8 +442,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 		}
 	}
 
-	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return ret;
+	if (ret)
+		dev_warn(dev, "Failed to restore platform profile: %d\n", ret);
+
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

