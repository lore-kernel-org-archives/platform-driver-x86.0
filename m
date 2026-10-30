Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348646;
	b=0EQPF2tFumJ5zJRkztQq7oueCYSs0DDLb1RBY3Nhu3DYP44UOAZcqkpmebFyoub+qwgi
	 vqT1E8j6wpLFVyW2rtWKkAqoE0SyX/ZXjWrK2NZlXi59sUpMcM+Phe5FL7cBGVUeorjeJ
	 bzVjDeUvn3VKJTNvoq9yVQbwwNK8NJ44KlgZg5GEJTsAYwRLLmfLv0ylFsujYvRZMk0X2
	 mGaMnEzPn1/d3VVwNKtFPkTswM8SeXp8pDO0gm6b7oijNyuYAH2I6e/lRs0GOK9a37aKk
	 ZqhQGDHWdynFc2RGWU6huO0Ka0rcQVs32vL2ok8KWwyeDl+eg0Xzzs0rssoyt/O0a3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D1AR8fDl91tJDx1vwvkWBduRKTWQCgJOTBIPuh9pgE4=;
	b=oyNgD2SKIUephVF1TmxeN+iI9B3Y98R61100/ntgSOaqhqWhEAb06idBDPE89vrA4rpZ
	 Mva0Y4BHKhMFe1qDAzl8vl6SA3a/gblgsrema6XQwO/zWy8Fyvp9GL5EzjP6tBARtJn+P
	 zuy0bh433ZIFNY7khnPZVyKsVXq4gIu/+ejdb/z075c7boRXg8SzSsAaqsUABUMFkcDdT
	 b2IaonWV0K2uA+gHknZzaHPbK0iTpKrruNjaKkwFZMyVPfvWukQ5JgI3rOw/u/c3s/7tl
	 cYGieCfCcud9Jfe7M/vPlJ7mINEx/PemZXwQfjo8hy3AzAOtJ6KWSytyx40uwecq7mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7ZmaE3R;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C163606A321
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 08:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C163606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7ZmaE3R
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso976102eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 01:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348646; x=1793953446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1AR8fDl91tJDx1vwvkWBduRKTWQCgJOTBIPuh9pgE4=;
        b=A7ZmaE3RfG0LPE8kBGaSVieC0gs5b5nK+UtzcJJygdQUTTPiuXqStsbOV2QsgJOXxb
         XPKt16AJVaSN0z6d/tw78l+n9vvhYmsj3lLeBSMjhcFJ6Dt87JNyKLx2bI5T98spLccu
         D0bMqTVq/6LM20SspWi5+Q8JbcC4RMMKMYOZ2kYGWs5RfhWO9WneXY9ZrUfA2YHgObtH
         9/TnMsps9b8CF4JBJYc8F7dRlu46WuBsvNz+XITGbk5zER/nT2Rm+DuZh6mRd+el/zTB
         cNRiFkO1CNEW4Oki+b4YHiTzmVmGSR7cKUTQCfoTOWXbK/nenCGc9NClAapUHcNWJnqV
         b3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348646; x=1793953446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1AR8fDl91tJDx1vwvkWBduRKTWQCgJOTBIPuh9pgE4=;
        b=17GK1KOw9GGqP7apO3aGon45RztIxkLSTSnCX1LwoKmncVeyYqqiOOJl2uVGPiUwvC
         1n4gU0HL4M8s/ZCZdip5R7hDrlHbJBEyKPwutL9m6O859spUJKbeSDa0M1H3DMha5hx9
         1xhfhTZD8AO1iVb71ZtUknwbLvplhgFdcKGfrbZJ0bsntfihwA9wwJi70DJxbUbyS146
         AzdYwdcstAgZoSAFZJUm37zW0CNbTPFqUGjdu0P3GPTvZXnCOqp0ttHBBN3u1cg55NVu
         Z6fPKWjewKcH/DYTs5bY05ndX1OzIfOnQzG3HM5UC+7xT4mKDIXSWF+VwjMuDsZfd1Vz
         qRrQ==
X-Gm-Message-State: AFq9FYKMFR6pGe+dryY0vqpXID7ZiE7GBtXs6m9bhO4bipcXx8LmVIaI
	caofvurBDMnowUlNWrRE6FmkjwpEvq2ehz7blEFi00muYoyM8fMgrqI7
X-Gm-Gg: AYBFou31Yq+jT6M23LxFQSyzFld243BWg3JNjpfuI+yGDeXp7yEsXhAW59KnWVKKluf
	SG5dliTMy9GGkRqWK/PJMkmTnU2zKMOIHMMdwdbeBnl5Jj4UNp8Mcc5MDrzuhh/t7DaW489Df81
	YNduT9jb+FmIeCXQs34+RpZfek2+T5j6lx1v3B73pKbuoTN/0Gmcz/auuirurMSd22CDkGAxr1l
	8Gw2mAFq/Vqu58FyKNX/SWTVBW3DkfJ25LSHi13/ytR91ItXCBIS1/1uMEgDi5VfPTtJAGCgZNP
	ApBOeQ37N8XdKZRVnt6KFksDOLTecKmP7DrEM8//ysCMAD75yrVbagpcdBvF6SUVGzZBemEW4tn
	eaIR/xpp2NdLBTVB3n7QkM8aonYiHgk9j7qlMrjMrY7FEval58CSCqohiI9DVIUrj8VDCw6hJdl
	w1xs1VDWcKm9MVmsOF5yWyJIJGziSr470l0AMSdOu48lSukcV3/IQIvvabvSRR6zfbqUpuE7NOz
	AibLEi07blBeTr3XclZUea9i6klv6E9mBIGEFCUs6WC6PRkH6qc5WRzehN8Xp+bFkOQXYtpl4WV
	fG93K4c8f1FIzOW8YJynu0kVH8HLqrkNMW4kWFv0qcQTFsf3WO0T6Sx+n01V4JZvZQ==
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr3542769eec.32.1793348645614;
        Fri, 30 Oct 2026 01:24:05 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:24:05 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 5/8] platform/x86: telemetry/pltdrv: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:59 +0530
Message-ID: <20261030082303.284271-6-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() for both telem_lock and
telem_trace_lock so the mutex lifecycle is managed by devres.  The
driver was missing mutex_destroy() calls on the teardown path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/telemetry/pltdrv.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/telemetry/pltdrv.c b/drivers/platform/x86/intel/telemetry/pltdrv.c
index d9aa349f81e4..70b74a7c6c71 100644
--- a/drivers/platform/x86/intel/telemetry/pltdrv.c
+++ b/drivers/platform/x86/intel/telemetry/pltdrv.c
@@ -904,8 +904,12 @@ static int telemetry_pltdrv_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	mutex_init(&telm_conf->telem_lock);
-	mutex_init(&telm_conf->telem_trace_lock);
+	ret = devm_mutex_init(&pdev->dev, &telm_conf->telem_lock);
+	if (ret)
+		goto out;
+	ret = devm_mutex_init(&pdev->dev, &telm_conf->telem_trace_lock);
+	if (ret)
+		goto out;
 
 	ret = telemetry_setup(pdev);
 	if (ret)
-- 
2.43.0

