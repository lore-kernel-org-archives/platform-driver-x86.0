Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB163C5DC0
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390238; cv=none; b=Oks+XGIE8aH8vcW3Lx8a8aVpBPLET3vDepEF7G4YLPl7at7m++uaRtCpt2MYCJZdSquwR/Od6bS91jdvs795Pxj8roh7r+ubFQGas9i1xkI31P+pXXYtF0suY7yihVf+r5tOI/XodvA0fXeuBKKquoly6SW48RtR5gnTq/iKGxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390238; c=relaxed/simple;
	bh=9hrTM3BxY52r/i83ciCo+2/+wCJlHZeKSOLwSgXFeFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEk4cXpJBn93R5buZZ4XlChK63up79ASspJ4yOi0bc87MtZ5yZvdiBEglAD3u6ghZZVkbfx2ikJZzzdSRwRfj979s63TRiLd4kp1rWwePXROGwNG8o4hViAxer2bjdGvlxGtQ9Hk819uxOQmQD/5Vnyi2hrtJtYoUmIYM2+P5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qs0qPxd6; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qs0qPxd6"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0c482e069so3681773eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774390237; x=1774995037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2voJFRWYe3/IRDOJSsRfVKzuFslhb/kU1EVyyj6gX0=;
        b=qs0qPxd6MJEkooxDgpahaOks8g0hG5lpnkyaw8fgsiBNZeAkiSbOji8ME26cOS4Dcf
         AYSdDhuEQpGb42h/pwiLhdQoW7cIPSiHgR6dtSdqE3UCZup4yTjnfZKwt987iE1AryMf
         vCtevlZN+xwmvILevtNaKk9LbVHVSmIyuHQlBKz8hF3gF3gMDeKdW9iYa2JwRJR0he/N
         RfU40mQv2YeBBscVElrD8rjIqoHZrExF+VMBMDEButreMuPOkqCRk7GdRFPGFoKqmQdP
         UjYO8Y/iMjG6JNprgkyyS4muIFNFKJBDp1x0jsZUz1MImDV96zZkMfsHTAQExcvAzFNf
         CASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390237; x=1774995037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U2voJFRWYe3/IRDOJSsRfVKzuFslhb/kU1EVyyj6gX0=;
        b=ce4v2aCEKP+7S+OcecQk88mz61oKfqlvJan3y7ZhvTAXjhSw+ccA56e7w2jlJs8WPf
         1+BbLSA2Eic+GJwi3Hc73t0NLPe89TFaki8Rm8N247qTeXjB9CIXBBy4muL0LUdsokZZ
         6FNebgXkezgyxuTZsP4ndEUsCl6ORl5NySSGfqWKXUUAUy82/mw3QiFdIajG+4nJg6S7
         bpnataNuNkQwDXQMx+BBlEDmjKYhBIhWwCDnoaTbo7FbfUkCl5Gn339UAjFixs8CivLU
         L2/KwLp7QA1thXa85W1l9dIiiQ57GANPHknZMCnyzPX9iGaKaLvP23fCCYDmFtcU20Hz
         noaw==
X-Forwarded-Encrypted: i=1; AJvYcCXmoHGvZMXkXsnnz48jTgvFu2Cmb2UMeg1Mk6EbHS7UkKVi7GC/z0UgvjTXs5qMkQeUnmJyVcU7ZJeESePvjdc3apWF@vger.kernel.org
X-Gm-Message-State: AOJu0YyO0764kgOchWfKEjb4c+7DTskmERKz6A+Y1voPjMw3xhQW5qLi
	G9unVvZxX5PSCk7wQhNPVXTdLodd3YvOo6bmuIQOThGbrWZMzljYD3Jm
X-Gm-Gg: ATEYQzycz8zSk2iUb9Xh4pGCF1/9Bc6gjNRJiQjULc73ZBwSyUCoMvguXTfmDcwWQXm
	sG1xdQyiuN8iVdGk9csMYEviRH/XX0PFr81CBW39erlOqU+nJGPo59E6iQxTaIeRDdueGC6520o
	x2UrKeUBLnrnCJc2jsftuIjamhOWYicVm87O5lKpwwG8tgDjaLYJGC1qnpHr2YBR1qa9JUK76xe
	jLrxxCmV6yQUw433M8SPyhH+8e0TBMIcA6JMSLSNWTuxpOBoHfRhudN+hUlQVDZ6Z/OSDV+5VH1
	rVEAfeKvOKSnvQrI9/3kqMcNfg6rsteR548mnrvFdxIXwBz+LErM/fX9z0HnKYisxrr9qhIvaZI
	frChb9H+Y1ZxCYJRv5l/Stt6QxLKCvCZ1v/KRqd5cn2zGFnwVI+dY+YQdW0faOwrVNlTGoLUhro
	/ZEfN0Y6pHdB5pypJM48Ofe/6qf9Czh99bqIqiDLnt/eTW8ksKtknIlqwvOCZzw0gnXPsHvOv5S
	Bsa
X-Received: by 2002:a05:7300:bc8a:b0:2c0:bfe3:b95c with SMTP id 5a478bee46e88-2c15d252487mr532131eec.4.1774390236835;
        Tue, 24 Mar 2026 15:10:36 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm16282832eec.6.2026.03.24.15.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:10:36 -0700 (PDT)
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
Subject: [PATCH v5 2/8] platform-x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
Date: Tue, 24 Mar 2026 22:10:26 +0000
Message-ID: <20260324221032.1333636-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
References: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In struct tunable_attr_01 the capdata pointer is unused and the size of
the id members is u32 when it should be u8. Fix these prior to adding
additional members.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index caf360b76fc5..c1728c7c2957 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -546,11 +546,10 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
-	struct capdata01 *capdata;
 	struct device *dev;
-	u32 feature_id;
-	u32 device_id;
-	u32 type_id;
+	u8 feature_id;
+	u8 device_id;
+	u8 type_id;
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
-- 
2.53.0

