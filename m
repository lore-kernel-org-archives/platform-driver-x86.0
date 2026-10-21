Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586123;
	b=cjoBcHRduCjogVrzcFOccYXqWOwi+N8JrAtYMMXvmOpvlwxX5KxXnEq26cc+T4Qd5CLh
	 IaDTSd1Ot6XjRzM2HIe3pvn93i3FiEiKcGyRPAzL6nChKgGFM1XKSJTfL7ewWHJTbGisC
	 0e0REzH1KKilZLdaKrmH07iKVzYfvwZQLdNZ+0/CQUz8JukfKKsmd7gXfLREpcluU6/Th
	 LaY1h1Vriwppu9yQguikraFRdvfuMwgA1KJUzJWG9CSo/IeZ68uN3vkgitLH38SoZq92d
	 7yzlfGAuVljDJDg75DfEeVHgM3sT3g+v1reWjYaxFcQG3lvVZOP0nwdcZVb503N9BEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uVtw8U6rcnazFJXWapfAKo/5JBSTjKE2HoWBd7UBtGo=;
	b=NT8jCkE508QPXiStk+iaPY724UMWDgB6MrC+kAK2YyaZNmza4YzffcUPzB/uhtiKK8lP
	 NulzXmU6Y7+mZpIAVqLWEdpNvfSFAPt74uQ2jADM4eASbiswEOk98TLz74yUpjOWc8t6D
	 gQdgcC50kcthrWwNZq8tKbr7ZKTB2p0TvBbnLedjFsVeD3w+buPXYIZyTfvVHK/2fyw1M
	 5lPHh0sBJcAiNnUpXybTMBNcW3UNEu6OfELeGofVVdC+K/aIyrMUhWj4xK4+7/JzS13vW
	 vj8WHUFXShRhmUQiDorCgvKct9pmcAkDumgXfVbjw+Y5RXrNCMlOfCd8tJhrSyTBpqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q2X0HcmN;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18A560A2639
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 12:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A18A560A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q2X0HcmN
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso411473a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586122; x=1793190922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVtw8U6rcnazFJXWapfAKo/5JBSTjKE2HoWBd7UBtGo=;
        b=q2X0HcmNYB4LJEBMLYmKcYD5f7vBKgYYqCdDPMP1NmbE4mUp0nc23ZbES5Yztwgozn
         Tb5aiXWxWtFEaCBf89pakmottmBXCak3vbPC3Rw4WdixUdnMSx2qvC+dOmLKpFbirzMz
         /KrKQs4WJreTIPYPsgzWrSlapJDjnCQbROFqa3e7I9OjhVBn0yeQOb5tSQ49qwDKIN4L
         0Y31CaMQCPAJ879ufkwJOPcYrQpV3ZJEY5UyuJaFVas4B83AOKT5d05RnwD6xqROfg0k
         2qy9DXKNoG3OEaR548/lscZ/cvB1peyDZO09LimDtfRBMgPeL7JVYQMNVI9Id1IkVRBH
         rf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586122; x=1793190922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uVtw8U6rcnazFJXWapfAKo/5JBSTjKE2HoWBd7UBtGo=;
        b=q4PwV1fXm5PN9O32YYmdIUDHWY6RPpJh2XObD9KdzWhaeO8DplrVdaRwUF+ITNrF+A
         bhzMF4+ZZc8lQ7vNSgtwOgDNOc4vYRHyMIgSsNjdzvXmtaUmS8aVK1rlnesHKiq0PGx7
         R71TjHWuejIq3sS6OVsUjb+90vOyVhgef9zN2bYllHmNKSSbxuE83nAxdxBzBTuLBq1z
         ou5VEg5PY9bVUqFOAED/d7Cj6eCmu9Fl6OumlBwp7Nrq+6V4j1xsCdFpEquCHiAyNIx+
         NR5ojKnxUCgIvlJRWLFFwSj6erulIwRU5FoKrOMpPpJUBKQ2U03HVQqzBjJDYCl28d/R
         sN4Q==
X-Forwarded-Encrypted: i=1; AKwUvByvQJIPtMZtIYoSVMzVxZjvKUVh/5EvLJ8qOdQDUL1XGSJdj7t+N24KX8qjhjs/sC205BMd5PaPekbDA7ADSSL4Mdgp@vger.kernel.org
X-Gm-Message-State: AFq9FYLeMUrVUofhQXcJi/4aO26oc2O4tBYpGQXcouH9YPZOIA7Z6iCI
	SzowPt22eM2ad94HwXc/itn1MsSuyFKEdwyWheVIwXTD4feokwHpuw3e
X-Gm-Gg: AYBFou09+00q+UKoKraqTVBmmmiKHWHkwpHYuzuYWTK29Ha9AD/ZCmJTF38dgAMYUQN
	mGE3YyYJuAOaqOpPoxc3DrhvMeqhxr2TIZA/yT5Rm6+JhOtvFmMBcojVX6xTfsDa6tPe7LXHylz
	EqvvXaKIKWR1NioBuVYjwjJUKJiez1OHNMxvGSsCQuCLR/OZKnK7C5hcoS5XzPUbI+4wNSwtLZU
	HDIBDLBK6IW1WR0b9vzjJK13dXgISR6LAaR2pDgAO9j4EwvwebXHQHRDqYZxzcumTwkNAHuY7Wn
	mFHFh+mcg4iTq/jZ491ve77qPoLFZiy2mvW9hrd7ULOJ55sKpSQhQjyIWxVC4opYsfhL0VPNhbK
	fwet4YAPVA3mTSNOEF471MFP7J7qUqzqpH4tRluIcQubs+X8onHto3Q3S4d9v9bVH8HWlqo6G1t
	RDF8hH1+w9cz+RB6lnOHk+JjuM33LdNozrFbCmVb6TbHUPyU+hmeQJhdUO7j004sFX0xUQ3x4YW
	yvW1dy6G3lIKFDo4rcMpEh/XyyDobWgMbRWFTK4DGdGWMSA3DbaOqN1
X-Received: by 2002:a17:90b:1dcf:b0:3ac:4e18:238c with SMTP id 98e67ed59e1d1-3ad86f10199mr1431595a91.49.1792586121968;
        Wed, 21 Oct 2026 05:35:21 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:35:21 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v13 6/7] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Wed, 21 Oct 2026 20:34:13 +0800
Message-ID: <20261021123414.25516-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
References: <20261021123414.25516-1-qby140326@gmail.com>
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

On Bitland laptops, performance profiles require an external power
supply. If the system enters suspend in a performance profile and the AC
adapter is unplugged while the machine is asleep, laptop_profile_set()
fails with -EOPNOTSUPP during resume when attempting to re-apply
saved_profile.

Returning an error from the resume callback simply because the power
cable was removed during sleep is undesirable, as the device is
otherwise
fully functional.

Gracefully handle this condition by falling back to
PLATFORM_PROFILE_BALANCED
whenever restoring the saved profile returns -EOPNOTSUPP. Update
saved_profile accordingly and notify user space via
platform_profile_notify() so daemons such as power-profiles-daemon stay
in sync with the actual hardware state.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a54eb5bba1e8..f4f37ae2f424 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -392,13 +392,27 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
+	ret = laptop_profile_set(dev, data->saved_profile);
+
+	if (ret == -EOPNOTSUPP && data->saved_profile != PLATFORM_PROFILE_BALANCED) {
+		dev_dbg(dev, "Cannot restore profile %d (likely on battery), falling back to balanced\n",
+			data->saved_profile);
+
+		ret = laptop_profile_set(dev, PLATFORM_PROFILE_BALANCED);
+		if (!ret) {
+			data->saved_profile = PLATFORM_PROFILE_BALANCED;
+			platform_profile_notify(data->pp_dev);
+		}
+	}
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

