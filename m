Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36AD3859EC
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 14:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148089; cv=none; b=dd1SZBhXko9egYNLiqBtSs2jRxedEBwMCMKFhbaQ2GKa7Ynssyy0z4opLlYgMcSUYo1eNFXekGtwvYQOT2oykNADO4Kk65pUHkPknER/I8tQQjRLDUQnD2CULct+fVcCU0prDSu0qEZefhOby3p8SUzbA7hQrmd2iZ86YnPchZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148089; c=relaxed/simple;
	bh=86MNvmsnbWVXkw6zWONeDyMeOkiRVg8K9Hjh+fAPMKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdaPHUMnQ38AuqGpiNMnZYal3jAh8iIE5n1+AoQ6bbWDAmcYHxxFPZGdUJmvcNX/DmR+VM9Fre4wqJrwOzYy8poUVo4drIWWms3UDOkvg11g7SrufN2seByAS4v1krdeZlT9C3UnezilEpyhOHFqaIpwUt6pkgqTGtDTXwcGFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZcmANFA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZcmANFA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso5344155e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 07:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787148086; x=1787752886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmAH5ezdPVsVJaUq1RUn7vsVIqur53S8admsZ2HZb1Y=;
        b=WZcmANFAnxN+u+5B1bRRCKC1236Qqsey7G1PGfnkVqrXPNfZq6xqS5GAgfLnEWTb4X
         13VDFH7dgQUsFa/4gAuN6v+GklDhazam6LBFj4+8AxmkxJVn8O2DIVHpJa0SeFkZj2VW
         py4Ovm8T1UJz2liMBnXMnNRkSN/d2tE5AOjEvPsiVlTEqSYxYkEOC3Faeh78RkoC/7W+
         THUWjUjS2LjyQs3iRK50KehhYLBCH6bOsOiK5yoiJBFeps9s9jeY3+U1BsScVThQ6i60
         0ec80cmgOY52JyOfdPtcAwKcr5CBCo2JRVlY4/r/wlFmxA7IJWRafDioedJ7+iwt5ZAw
         /IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148086; x=1787752886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmAH5ezdPVsVJaUq1RUn7vsVIqur53S8admsZ2HZb1Y=;
        b=sl9gThk+UcJEfj56FRzTvXCZblFHDnwv0fwlVz4qngfHbr+B7HGncBOxBuGvk2PSqW
         dVLtEGL3hT95Jz2rwuqFi8nqaEffr5Fgjq4DwP69wkDEFDieUoM2Pu03/nBPCeuHBTss
         uq+BOtjTXaMGnZDmGCk4A8uXcK8S46g4EZisPnbaYLS6YJaqe2C4e4TKKuORAZYjaWnW
         FX13DsHDQ5fXjX9Qef++MkqPgRGBCm220Ln+MricMLN9+dRPU4JFntKQNxkWvuiPtjhO
         mdWeWlKpGPvSk4mD5y7zoGslSBAPRJaFOm3dCy5RDR2RdN+YYO3lMYnv7u984/DlCExs
         e50Q==
X-Forwarded-Encrypted: i=1; AHgh+RqeT3nW9pNljyKseucLrRy7qDBjh6dug2bhTaQPl+9M95e9Mu+dhaZbMBtrz8apLfwTmUAEuiNYa1FfUL5V3EJL356H@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1JpeXrjn/pmuAyret8GL/f+87Fpk3fVJMxT+T3Iw7CfbdA0jj
	bbqaiUYd5gJ6SIpZersnMDDJPD95goUjkGNIbkhkzWd6QpMLtnm6p7Lf
X-Gm-Gg: AR+sD11l1SmB60KbV9hNhQ9gpgRUkqPfiMnlFY0Wen6Akf/K9DNQnxs9wu/KCUXWApN
	15eA4uED/pp34FOExJszUAaIqToC3gv4PUtykWQ8DCMo1m365/HqmXx8G+N9nz9PPtQ2yQIsDhY
	bnDpNuEYjbCGe70Pabr/McgK9cmvahhLzPrFIOGB4vYADUVcg4b57kkh9oGsEm8dSGpgydxflBv
	KGALAA8NGWNpw/aTVzWsLejiZU5oY4TWp1+pwIj8yIDyY7O2HQrijsxAHuKDKbMNhgK+73VaSKB
	JTlZ/6Elh5syfGroy/QNHljHYj/xHFzJ6QKrH6bRybbTQ2AHHt+QC1MSn395+zIBqgMy7JFnGav
	tP2xe5giJA1bM+2chkSQvIugd0oOt1RokQi8FNlAsysk7GLUl1DXw7X+v0PG2q/DxnOQDCcIrq2
	SWahyXa5xko13xHE1a/5jHYC3/obmYKuCx2EZ0y86X+WXKd+y2maEOCqs=
X-Received: by 2002:a05:600c:a30f:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-499b01e9125mr1489005e9.2.1787148085828;
        Wed, 19 Aug 2026 07:01:25 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:d3:816e:dd0c:fe6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm92751985e9.3.2026.08.19.07.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:01:25 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v7 5/5] media: ov8858: add ACPI device ID INT3477
Date: Wed, 19 Aug 2026 16:01:07 +0200
Message-ID: <20260819140107.1329091-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819140107.1329091-1-tchatard@gmail.com>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
 <20260819140107.1329091-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..9c786c9bc 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
+	{ "INT3477" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.51.0

