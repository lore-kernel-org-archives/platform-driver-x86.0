Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05455846C
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Mar 2025 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603923; cv=none; b=L7U946mtaYu/mXEDpRL37YKRe3269ZVzF2TvAY1rCQVraaUqyXF74qTyLpLjGJ+oul43lgVFml6x1GoEaBO/luDncl8PIzeg6U0vRfzZOLn24313MbjF8/8luJ7utk+FKAFWliRN9Td7pXzyfVEyf4Er/PKj+aaAvhupZASHpqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603923; c=relaxed/simple;
	bh=8pFmW2yF7XeBHwGWpBOIVO3bVuCA2uTCoDSKVDixUQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EALnCc6Qo1oLc0fPxElLt+TeXZOzvEoma32OzPVK3yNLmGkjlxoUt5x6I6CqxE3pOpVBeWoROkj1tQPqr9bPtGNYq5Kf9yiQYpoe1cmegCA+SSjwrRf3xFT4ktMgO4kEYSjUKpA5vsuHcnYt9XJuEbmEe3FaNPLemYXyDuG4DAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJhUanvB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJhUanvB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a823036so34145855e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Mar 2025 03:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603920; x=1742208720; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRaYsvVFrqrTjWbVoLzSGid2k7c2/yuWbrvy6P2VIxo=;
        b=yJhUanvBwPoRt/h2J7vQjHB4pn0Y8MkOwza7TUr08zWjsZSGX51/pXwgo4wxqVp+iw
         0YrjbJeVENhg3FuMpVSFBENnWeq4/eKkL2EKY6V6FQZtzGyxciZISKizq267RQzuCBUZ
         6J0Q949WXQxDxhayMaCxWgH+5JbIvdLFvratTq3H7ZtaA6qGnjy8Uejr5nUypboH6ryk
         Y9MqoASeMZiavmeX53rBJ6FfJP185C+fw/x9qqPINjsy79IIzd1AdmqhzaXDseIjXHe0
         bTto9+tziiSCw0IlGvt1mLkxyATSRBCK0CzpDDTOZp7DPEdqF4qCCyt0g3GWA9oqeD1p
         L5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603920; x=1742208720;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRaYsvVFrqrTjWbVoLzSGid2k7c2/yuWbrvy6P2VIxo=;
        b=sKaYlr+xgc2+CgB54J9aCrmyWWRLQ+9RSZ95CNJO7CVUt3ny2tBunU/jTcpqklKkam
         /k6ijCW5HemDmsPi3ch2hERtdCz4nbZJfAKerPuQyarVjFoc7pGVzfCawjxLeplrTV/n
         C4uVAnf+cF7Lgsk0rYD94U5NzsUXmSqOdsH0A3OxDrgyjFYiLkWghJi5At3ezJpisl+Q
         rmlK4hLg28Y68rPAqfWR+QEf8/FGB0FQhx7vxWHULoyg87tFOUTQHyPRrx+BvLfIgIu4
         oLeq7mrc9fPW6maDpKKEa/FOR47EwB8WCM1ypGx4ziJHz27YMwc1fKly0GwV8H4Zdl/N
         QCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUanCXElbcfru8Sj71UP7/oJbv5sENfUHiDxaqWzhYJZE8iknjFz3c7t/+8mtG8s/L9Mhl1hYTobna6mTtxkBCNDUd9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo9LAq03vXObEeIflqTellRbgrEmcoMNjUbQ0kaN1VC2HnSy+O
	e3h7DadZjyyJwc/sX7bO00OeBfTjNbaR1zjnViPNBnGGix5tnjbmYZS7Vpuq8WY=
X-Gm-Gg: ASbGnctCclAkf37uLMjm+m2PO3Vy48M6qm+ai65wal0YsD3UdMW4xOTikZRt2cIwBca
	KsXaAma4j8xpqCM3s/axq8kbgTuW7SVBQ+790wP0Le4KDHml8xEP1CKZrwLkq25mM8Lz6rapWUU
	aEF8/yyyBKB8MqJXVjHYF3EceXm2aDdM8Wva3EHwgfREAW/oKq/v9iNNwf8mbJ2kv79g0akYQ2F
	A9PI5wLEnV3W5/z7HqXralI9OJ/9gLbgSccD2ti9lPl5If8VbBDb9XsdQL+Z7UcSH3QsPCz4uwI
	6zvojTjn1hfSjl4aAH5hRvFxUPblmfAklHUMvbboLlFv8oqquQ==
X-Google-Smtp-Source: AGHT+IGMN8eK8zmMhyTnMEO8hcxY2G1+yaEB1GlPZwSy0jRn7v/TP69/lWg+VAd4stSNCOgX1BzcIQ==
X-Received: by 2002:a05:600c:1d08:b0:43c:f184:2e16 with SMTP id 5b1f17b1804b1-43cf184310dmr30775335e9.5.1741603920329;
        Mon, 10 Mar 2025 03:52:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ceed32e64sm59063525e9.5.2025.03.10.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:51:59 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:51:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Patil Rajesh Reddy <Patil.Reddy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()
Message-ID: <43ad5358-f5b2-4cfc-85b4-e7ab8c7cf329@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are a couple problems in this code:

First, if amd_pmf_tee_init() fails then the function returns directly
instead of cleaning up.  We cannot simply do a "goto error;" because
that would lead to a double free.  I have re-written this code to
use an unwind ladder to free the allocations.

Second, if amd_pmf_start_policy_engine() fails on every iteration though
the loop then the code calls amd_pmf_tee_deinit() twice which is also a
double free.  Call amd_pmf_tee_deinit() inside the loop for each failed
iteration.  Also on that path the error codes are not necessarily
negative kernel error codes.  Set the error code to -EINVAL.

Fixes: 376a8c2a1443 ("platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 36 +++++++++++++++++++--------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index ceaff1ebb7b9..a1e43873a07b 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -510,18 +510,18 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	ret = amd_pmf_set_dram_addr(dev, true);
 	if (ret)
-		goto error;
+		goto err_cancel_work;
 
 	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
 	if (IS_ERR(dev->policy_base)) {
 		ret = PTR_ERR(dev->policy_base);
-		goto error;
+		goto err_free_dram_buf;
 	}
 
 	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
 	if (!dev->policy_buf) {
 		ret = -ENOMEM;
-		goto error;
+		goto err_free_dram_buf;
 	}
 
 	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
@@ -531,13 +531,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
 	if (!dev->prev_data) {
 		ret = -ENOMEM;
-		goto error;
+		goto err_free_policy;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
 		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
 		if (ret)
-			return ret;
+			goto err_free_prev_data;
 
 		ret = amd_pmf_start_policy_engine(dev);
 		switch (ret) {
@@ -550,27 +550,41 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 			status = false;
 			break;
 		default:
-			goto error;
+			ret = -EINVAL;
+			amd_pmf_tee_deinit(dev);
+			goto err_free_prev_data;
 		}
 
 		if (status)
 			break;
 	}
 
-	if (!status && !pb_side_load)
-		goto error;
+	if (!status && !pb_side_load) {
+		ret = -EINVAL;
+		goto err_free_prev_data;
+	}
 
 	if (pb_side_load)
 		amd_pmf_open_pb(dev, dev->dbgfs_dir);
 
 	ret = amd_pmf_register_input_device(dev);
 	if (ret)
-		goto error;
+		goto err_pmf_remove_pb;
 
 	return 0;
 
-error:
-	amd_pmf_deinit_smart_pc(dev);
+err_pmf_remove_pb:
+	if (pb_side_load && dev->esbin)
+		amd_pmf_remove_pb(dev);
+	amd_pmf_tee_deinit(dev);
+err_free_prev_data:
+	kfree(dev->prev_data);
+err_free_policy:
+	kfree(dev->policy_buf);
+err_free_dram_buf:
+	kfree(dev->buf);
+err_cancel_work:
+	cancel_delayed_work_sync(&dev->pb_work);
 
 	return ret;
 }
-- 
2.47.2

