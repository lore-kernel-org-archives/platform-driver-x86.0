Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793076529;
	b=R1Ue3iWahwD+s8jDqTUYcL35DTZB6giLRu7sfT0zu/JR5bun+6US0J6YZSuUAhC+U4RD
	 MprThzIs4DRiQ7dF0l7rrlUsg+6XlhEeINKkoTFs6jnDjygDjDLVjvEi59eLe7iYTDSWb
	 eP8Lu6oxV9htIBcDQpwz0L7o8OFGoQDj6lsbCTCqUvSFVHsdaOcSc9/b8XLaylDVG2BAd
	 GhDblOJliG/oeVM90KVcvsqamKfqwrAS5Bn6ZilGzzVEDCilNpEvOGmwDLuBTiBsdPUpr
	 Mo4j/LdLOttbqBADuIbEXSnQk2e3X/9Wo4QfJsQeaUqI6DbMmv+OtDmBB35Go1Q8TWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793076529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8nNac71k806PRByKbpE3u7jP68UWqjas3/Ce4QU52ks=;
	b=P8x9IlOmZ/N/BliAKOG4aAAsfMJhVZm9TDEczCdQd+f7b8pWYIs/85dFeGEsuveoJOx1
	 0KY1D4wU/fql4yF+xYKEvzs0MSbamjZem12FmRQqVw7YmPK8R9w8lhR9TYE9Ok0zUeSBi
	 7GaMmxSUUSSeECgZMoq9nQTvr37Pq0M5yBYLiTFS7gQnn87xhQSKwBE1gTt083m/D7GJ4
	 HryMm34mpFiyZXPi0hIoYFaPo/gXkDwKNiC6UNCe8Crx+0mzXhheiVEIFq38Xo0TDhClj
	 TPR6TAKBbM72Pgh61L40mTHqU+hsVm3px8vGG9QRBDvMnasK6CFRmBocVkQoD4WVfdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="h8o2RV/2";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D31606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2026 04:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D31606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=h8o2RV/2
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a18fc7a38so8307eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 21:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793076528; x=1793681328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nNac71k806PRByKbpE3u7jP68UWqjas3/Ce4QU52ks=;
        b=h8o2RV/2sYe53gexNI2Si0Z5yxPSGWY++KAOL1mrgPIbLEYpHp5RsU3VvFnpklPE6u
         dO+G7mMcIVag9eMvNv/5ZuILFUH+xb7W8fMMvQRM623dyJoDUqxzCAAQosHWtHa/oPgR
         B4hUEQ1h760ZMuWxZHb5RXprFxM2Ax9gzxGbyW2ttI6D77gdzSIYBqiU5tw/l+5Kd5iu
         l0qg6pLOBFwendHQLujqu7m7yPbt4wqoE5woEwtwSFSVbJJtHPizwighEUB9Ke8D8PEX
         RmFwUgd5McV90SzwE/kGgeJ+slQ0FrD9ScCJqSD3cGYbL8TnDogGxN9dvXCAB8samSEZ
         PnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793076528; x=1793681328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nNac71k806PRByKbpE3u7jP68UWqjas3/Ce4QU52ks=;
        b=bzA6mlNrcGJRDgLG/0sspG8oB5lKEw8ln+w6LFvWyQD7HZvTsJZdJqAeQicCu5E6kz
         XLBf8bBs3NGFVM+sWTn4Ean/PuxZ53Tr4T9v78BKlLXEztQBz/ecwWNtl9oNSd/ZfCO6
         Hry/+qB5X6os4f4UolD54chyE7eAiJuaKzG8S0kqfYN3kWTAQeYuY/mQAmTWHw1q4FOw
         qSRgHKqwCmzGoPOKic+LNJwu1TsdnVZvY/bYwdLO3KjjGMvJ4ESFn3lLwXtwduOxEpjt
         SDE5F/N00sz0N4WNgxjRfmKSXB2F5S3fnc4B8bX1SYsv6yZKnhDK+NFe7HnajF7jl99g
         1SNQ==
X-Gm-Message-State: AFq9FYKG4Y/r7af31d6cCsg9XyRlV7WL4DhSNERnGYogUow90gkj5uD2
	0OOwchdu3OagL4udWrncSmVg3kZOt5ZnqcooNDW+MAKAge1omcGFKUrm
X-Gm-Gg: AYBFou0BboaA8p6TMxp+TUCQstUm6mL/atQMt0W8BDCyQeCmPWlHntOs8vSke9FcgUK
	HrDNj3sHWn0pX3JV81X4MVz7qWWKQ8LOSwREwg6Pe1HXCVbytU2KybkNvW99IoXqGc2/wpvxcLj
	YDEpndKLvFv9WXONqxVWmWlFk/Zy8MOWx4IvJyJLbBgeB6gWiktrJ6wm+ZW8+6e9Or+kXcQ7EpS
	3aMXC6wCnKJeLJSSFRJC/HpdngRWcmZuaWZqiZRAQpKMSh4+UK1dZ7vG7192SFKWd2umF/6qZi/
	FQSNA3nDUa6gbLY67JPp4ZgiiawuuuoP8cL1GDDGUl/nBcPRje0nk5RK03E2ZiT+bzT6J0/skBZ
	tA4CSaCRh3/QV6dZzmm6B8W4MVMShkjyUX2aJ4O7n3EfuwaofMKtfgOe388/j0NITsplmbxblwq
	oXxN7eKDD8qUsC1vCfJc5tvJgIKS62usSXhtsbmN1rVedvRGnVRXjrGMbA+P2hlZGt97oAWS4wM
	DhqDHhFO33qZbx8yLSLG2HVetuyLendURUh+5R6hQdqdEDXK1LVZw6edgSXvYRJEWoJcjwOoPMB
	f8hWeokahbmLuWcSNstI1QWfo18YKrYXsg==
X-Received: by 2002:a05:693c:821a:b0:36a:30b:5dce with SMTP id 5a478bee46e88-36a030b74dbmr7205493eec.19.1793076528157;
        Mon, 26 Oct 2026 21:48:48 -0700 (PDT)
Received: from chitransh.. ([27.61.39.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm41283776eec.19.2026.10.26.21.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:48:47 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	W_Armin@gmx.de
Subject: [PATCH] platform/x86: dell-wmi-ddv: switch sensor mutex to devm_mutex_init()
Date: Tue, 27 Oct 2026 10:18:19 +0530
Message-ID: <20261027044819.75761-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Replace mutex_init() with devm_mutex_init() for the sensor caching
mutex so the mutex lifecycle is managed by devres. This allows
removing the manual mutex_destroy() call from the
dell_wmi_ddv_hwmon_cache_destroy() cleanup callback.

The translation_cache_lock in the same driver already uses
devm_mutex_init(); this brings the sensor lock in line.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/dell/dell-wmi-ddv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
index f8903ced461b..c7f3d07abbc7 100644
--- a/drivers/platform/x86/dell/dell-wmi-ddv.c
+++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
@@ -548,7 +548,6 @@ static void dell_wmi_ddv_hwmon_cache_destroy(void *data)
 	struct dell_wmi_ddv_sensors *sensors = data;
 
 	sensors->active = false;
-	mutex_destroy(&sensors->lock);
 	kfree(sensors->buffer);
 }
 
@@ -566,7 +565,9 @@ static struct hwmon_channel_info *dell_wmi_ddv_channel_init(struct wmi_device *w
 	if (ret < 0)
 		return ERR_PTR(ret);
 
-	mutex_init(&sensors->lock);
+	ret = devm_mutex_init(&wdev->dev, &sensors->lock);
+	if (ret < 0)
+		return ERR_PTR(ret);
 	sensors->active = true;
 
 	ret = devm_add_action_or_reset(&wdev->dev, dell_wmi_ddv_hwmon_cache_destroy, sensors);
-- 
2.43.0

