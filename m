Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348628;
	b=Xpm0iHY+iR77h36nlbESQhOnzi8jgH9O1Tpo1Gvs7g3OJVe1s4vRwzgfGRihkEoyrBNQ
	 COOEcMKmjsqPLMbrqPv/zDt+IOAVzYAuosodB9bZnPoCXJlvvGoaql142CkIE/3iebY4f
	 7YKRWYlOkI4xz+89Hjx0f8ohOlrpKLI2DO91pJrkeIIelYkjjJ/RP4tTUFLUpH8WG7mpz
	 dCPSyqL/x5LuqIzzaLr6SB7kDmvSxGt2UXKYU0L+DetZ/HudzxXUGZcuRDsxFUeoS43Wd
	 lr4FDjAWJ78VdVJ/K9lVuUPfJFyja9uISLdmRWDX5yPn78IPRv7e8+EtPO58PCUsBHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QQYBc96PPknTkspwMAYXcF1iUzAhc9SAfvHOe/sWht0=;
	b=0pPFlXabDbvGP4nar+3xjhQEhZwcXXoRaX0BdQOQsOd88qa1hrYBTZs+w1QOdzlMHf1o
	 alr9Cks8IrHvpLwJ5n1Bk2deSwvkwM9cQ5kmFauc4L7cGUjqz7Nel2xInDrTMWnfs6gi5
	 vbrIZOVc5ZJJmIkWc4O9M/HVZwCQCZbvAWv2wIM/vnIWcWFw7GS8OW6dTjfga5L5Sd20b
	 FphRvQ4ZCCBgePTBTbPsfXo5df9nT65HJG6j0O/LdN4+09YGKYkPmWvZr3gXjpA7QwS+j
	 LQE6Fl9wbVV8sSbsTwt/+ZRsUBAZLrd8hqDoSVqVPFqvq3Phu1endscKt0u56fFDRzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kx82HvRZ;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9016606A31F
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 08:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9016606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kx82HvRZ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so1158982eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348627; x=1793953427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQYBc96PPknTkspwMAYXcF1iUzAhc9SAfvHOe/sWht0=;
        b=kx82HvRZc7JDUNM8XzN4w7ecKDROoZmWmUuXvOcSOnlqFwnncePpohyBzpZ40/v7vu
         y0F0pwCfJS8RF13XkOD2UtLcmumqOGMRHSFsg3gEH6vqVP/ZIwWl3df+NwNacEoaarHz
         CeBt1Y8hyWEl1rlCxdhxgtPfAUctFF2hMHBipQshlfzhJ7dclS9zEa36ICc2hWMo8Eez
         EEHUT4G47iXO7Ke6CZp3gvECfp6koR+D+ta9+8MQM0S1wKafF1geLu/rkTjP6nbqNm8S
         f7ZbnJowmRBsj+wpoXbVWhWYfQLePF9Qk+nOl4/68UAp4NMdJPrOwQEsFn3oSwFTpCQi
         eX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348627; x=1793953427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QQYBc96PPknTkspwMAYXcF1iUzAhc9SAfvHOe/sWht0=;
        b=MBV54xcYbDfZsYv4C9SBqAKdk+yyoRGQGlWBzVz80MNUgOuj7yZwi9tW7tmwNmwIuO
         RDh3z1Vat7EhHELl/XdcnARsX0veYoKFEy4jgYUWaV+fWzJacS8VL1q9gQr1KQajEVVf
         uM084U+I0BVa/7ZiuV24b+21JIIZKqjk4LzwCEfk4eCMFVkmGoEF/v5vw4tuiSmMyz4D
         o03oviZDaXp/6kshkM3b8075LJJfXzQBRYkCLM5cu1oceIYjVwgMt5ThuxCo0I7wFuNT
         kK6gkOckvspcY9RL9Y4hetFPyOW12OXlyQL2lf87a78mwcB+BTYMIt8aLFBZf0XTR+yw
         J/GA==
X-Gm-Message-State: AFq9FYK7ZDO6RuCemWvYugyehuBvkv4XzC4oHCfqGy9VN+KQKdeTVrKC
	u47VKpIxl/4GOseCKfHGts2yXUbXRBi25gJtRmg0G6NdyMeGijC0wz4m
X-Gm-Gg: AYBFou1SvX5cOJWuCDzNlm9kM6C5ywcQGr7r9kikM1/AyxQjqaKCvu+TlJ9weSrcCsu
	/HqFz4Z9LC+jfe/NqyQEBNMkPHIRU3+oz/KEhfZevSZdlXbJk3QtKnrT6RZPEimNJdjiWQHvyee
	VFJgGm5b0bHUVATRiZm7Qi1LG1a+8+8zOcnV6OXwVDP7IEbn6MzIAw1nIl3narSgBPnpXg8PinP
	/T4AXAJX46l1kZAp3HvlTNGi22s/ZEQh8pN3qb6BEWfb68X0/toMtoZuy5BDpPkGsjozRThyIXB
	RToC+68P2VarpmNVTr5nW7fjq31OsYydiLtuD4ZMoV3HYVjM/69doHEtLeF0e7JrWUC6D4CQiIx
	BHVkXR1ub82RXzvAFlS8RfyCNPG4lCrmpCEic5dILX2c5eVMfUg6fLktZNSKK+oIJVIO6QM9yiN
	epwJhePGTVyFZ4JjNG3eOHHJXaSG2DQKDgfAuAVTi5x4nH0quuEgO4F4Emd0h8Sbgog8qs9wV6q
	gKX6cQQQ4EWAoRnQrX5XoEbAhwnQJgUj/7xOEE2MgeQiqN7TigcRFSaueSRmZxW8E7HGp9Vw+Ib
	0iLCvHYh/u7W7saMVQc7mw31emp6lbFHTrMs21ghMs/IVb3QKPpJBl0FtOjod6ZRXFVZmrOpCbm
	QOm0UW9fOiT4=
X-Received: by 2002:a05:7301:7d06:b0:36a:1870:2240 with SMTP id 5a478bee46e88-36a423f12e7mr3068838eec.29.1793348626993;
        Fri, 30 Oct 2026 01:23:46 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:23:46 -0700 (PDT)
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
Subject: [PATCH 2/8] platform/x86: isst_if_mbox_pci: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:56 +0530
Message-ID: <20261030082303.284271-3-chitranshmandhaniya@gmail.com>
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

Replace mutex_init() with devm_mutex_init() so the mutex lifecycle is
managed by devres.  This removes the need for manual mutex_destroy()
calls in both the error path and the remove callback.

Since the only action on cdev_register failure was mutex_destroy(),
simplify the tail of the probe function to return the registration
result directly.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../x86/intel/speed_select_if/isst_if_mbox_pci.c     | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c b/drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c
index df1fc6c719f3..ea0b396d35cf 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_mbox_pci.c
@@ -180,7 +180,9 @@ static int isst_if_mbox_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	mutex_init(&punit_dev->mutex);
+	ret = devm_mutex_init(&pdev->dev, &punit_dev->mutex);
+	if (ret)
+		return ret;
 	pci_set_drvdata(pdev, punit_dev);
 
 	memset(&cb, 0, sizeof(cb));
@@ -188,12 +190,7 @@ static int isst_if_mbox_probe(struct pci_dev *pdev,
 	cb.offset = offsetof(struct isst_if_mbox_cmds, mbox_cmd);
 	cb.cmd_callback = isst_if_mbox_proc_cmd;
 	cb.owner = THIS_MODULE;
-	ret = isst_if_cdev_register(ISST_IF_DEV_MBOX, &cb);
-
-	if (ret)
-		mutex_destroy(&punit_dev->mutex);
-
-	return ret;
+	return isst_if_cdev_register(ISST_IF_DEV_MBOX, &cb);
 }
 
 static void isst_if_mbox_remove(struct pci_dev *pdev)
@@ -202,7 +199,6 @@ static void isst_if_mbox_remove(struct pci_dev *pdev)
 
 	punit_dev = pci_get_drvdata(pdev);
 	isst_if_cdev_unregister(ISST_IF_DEV_MBOX);
-	mutex_destroy(&punit_dev->mutex);
 }
 
 static int __maybe_unused isst_if_resume(struct device *device)
-- 
2.43.0

