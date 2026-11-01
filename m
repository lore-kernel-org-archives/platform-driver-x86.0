Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549910;
	b=xMtsBTrnf1NgypKRC1jFWZAOSSrshQdhUkUAu/0sPE/2oUEmZbUoTCFSE4qLHQeOPt3t
	 6q9KKhmKeSTeOwojRkljpGQvP9ArGsZoGSycEy8+r2fcrGwk/hlxP/RiQrvdeuwJF1DoQ
	 JXg1Wng4Z6y6BfB+jQ2jyh+4B4ArjfhRaQEvk+xW2gcpFjumrGWMCKxlWDO2GfcUYaO+g
	 biEq36voITbF4G7Gn4tjGQcmVZP47OVNSpBPiXW5Fo7OH5XwyHNBZWEQqajjzv41jL0Ov
	 DEkMw6ANR3e+t+/6y6dn3hz0P0yp2350a3SoKRerowJZaD24SxBb5y++tpucuYOJ0cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ugeNmQRt7VpSYCUBFDdZwKH3j+3lNI9rXn3/uhHambQ=;
	b=ezmW8UvchkjzJ6ODoITTfH0TAV3OGNkK8EGX2RugqQiVVSV1NE5smTvCbkrpmrPLGQGA
	 jLNmQwzJ530BNh/fOMYP0BO1OCwomy8nGJRNqGHVHpIgf4IpAqYACrSFlMThIDuCDCbkc
	 sFA/UcEUi/LoadxJ/qnvQ7A/yVZ15/zKoIsM2RXxDG6zWpSCqGynV49+R/quuJPGNbGlx
	 d1dL+BC7aza9f7B0URlUCf8krVcNmesqCYrv6SV1d62t9rmlUDSYt5eqzSfFfTCz2cps6
	 TcbYTOnSMh/fFcZL4BUvu4u6qm5lwzV5Ta5xpZ07OOftM4CqiPMWzoYi6BAg2csp1aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=QY2EI6ZQ;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76797606A32E
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 16:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76797606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=QY2EI6ZQ
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b488586facso2815138a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 08:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793549909; x=1794154709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugeNmQRt7VpSYCUBFDdZwKH3j+3lNI9rXn3/uhHambQ=;
        b=QY2EI6ZQ746QcKd+4cfpIIdAI/s6ex0gkDiS6KOEzyaET+20a+zn9aDwwrw3ywC6gx
         8Vh1bNlRkTBXJ8ft7aCEiWTVNbVUHWFYE18vmIBk60sPDF5kAWLC9fTAwBYdMVhg7T26
         G//8YAnGjrOMmLWZRUG5yvAHtReThl4uFhv/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549909; x=1794154709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugeNmQRt7VpSYCUBFDdZwKH3j+3lNI9rXn3/uhHambQ=;
        b=jcHmWPOyZ/JpKyzjvi1KWv7PcDfeXVjROrJPr84YPHVBN6y3iTf7qaaf7rqkarNMR7
         AeJzksNgpUszyBvepDltAVRF/ppS33aq/I+hNCJ4G9yfG2Vt/KPeoG6gZxB7FcU3WwmK
         Ih1ocYR3tIA1p/YE/P3a+2gn4Z/+namgj1bK8NHqGRLoYY2WjfTILmOYPt/YKjaly071
         ZCX5ZGhIuM3AcXddAnRp/An3xw2T9wKfr44x5Af9WnPa3cqemVN7b4lb1iyR9jEBoiSw
         /8jyM3s9Soc2MS6EonUUedYO0ogKa9a1p+Y8ytsk4kAtZ0Uy9qNdiSNx62Oy/fxzWvuc
         lrIg==
X-Gm-Message-State: APuU4Z9YEa+UZCLakjSs2NaVEucEBGC2tTG5bGVls/bs6xkYbqkwsxBd
	3rJssXwUV5RPhtbg6UYweArOI0+zz54uHEGsDpzYUxSzU2LB0ZFBYrsGavXLnJMQIQg=
X-Gm-Gg: AYBFou21Cqtu2XjhvoHzuSQDpv32brPIE3bHHBpRxrZqdeexK1fjF6lpm+tOHz9mRjp
	oV3hSzBT50wWbA9rPW0RSLl/q58UjbvjKS6dP1JGoy8W5axDPW2KO779n++5WtiFOW+SSUl+kIr
	l6s+Mjw/Hozd8zh0F0tOv4/RQw423dYde2zUd7E3SvNTQ+uq9sP1xUzow1uss+85K9AT0LYmOZe
	5Z2k05qkP3/jAs7qoK/5b0IWEgvtffNyCJ8lXCPvxwmRgy+a65irZngYk21OmXJ0msV4hhqTyMZ
	H2qlgWk3XfijJrI0PpZRN0hga5KMa20L5TZcL2r5IF+XJsFA3T8FKsni7BDSAcZvbPqlGmVVgSQ
	ROTyEW6RyRWTpoyM7zK3b3DUAsWRTyJPq2Z2VjanpfV5IU8ECO83J85kblNAjqIBlznMXa2ED7H
	EIFJc9YaRylw7/lMcgncf5u/LWTLgXLww6xE+nfLBqoztcHZYSIDXzYtDttpb4HY7dRWImGKkt7
	netsa++1+mG7aigXiTsPSMFwZIjP5iLOz9qUeuMHjuTcqGERwEICnXYwJ14K+cWSskEEZa9OopI
	LeQYlEMM3HCSvEG1HG0g6ImUPyfK2FaTpsT6We67kMTnSw3KcHLY5djnhL0F12vt1Z2TxRpBpHL
	Rk1takwuCZUYZfFSkKF1zz1OLqZ3b
X-Received: by 2002:a05:6402:a30c:b0:6b3:d0a0:1358 with SMTP id 4fb4d7f45d1cf-6b4d64b1342mr3791738a12.41.1793549908869;
        Sun, 01 Nov 2026 08:18:28 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcac9sm2200155a12.18.2026.11.01.08.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:18:28 -0800 (PST)
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
Subject: [PATCH v3 2/4] platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on profile errors
Date: Sun,  1 Nov 2026 17:18:12 +0100
Message-ID: <20261101161814.1325847-3-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101161814.1325847-1-chris@miget.com>
References: <20261101161814.1325847-1-chris@miget.com>
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
Reviewed-by: Mingyou Chen <qby140326@gmail.com>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Unchanged since v2.

 drivers/platform/x86/bitland-mifs-wmi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 63fae12ebd83..0891dcc1e9b4 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -234,6 +234,7 @@ struct bitland_mifs_wmi_data {
 	struct device *pp_dev;
 	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
+	bool profile_saved;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -404,10 +405,15 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
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
@@ -415,8 +421,8 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	/* Skip event device */
-	if (!data->pp_dev)
+	/* Skip event device, or nothing was saved on suspend */
+	if (!data->pp_dev || !data->profile_saved)
 		return 0;
 
 	ret = laptop_profile_set(dev, data->saved_profile);
@@ -432,8 +438,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
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

