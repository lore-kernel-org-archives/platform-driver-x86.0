Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965389;
	b=GEE/9lz5aRlNWWVhrh/gpDDb5rd2vLN8oSzO7e/Cm3cxhBaGp19uIYbn4cO0AA22WR7+
	 iwHhZNTCmHU5QH1n0koZi7Q06LGWt8FHjxnYlVCtc/A9Q9VOkj8kmQo1lI6qyVcr3vVgO
	 AHsJ4WcgqUl9DVDsh7ipLPik5L7Y6b5YT2DCqp1x5Hw6S4DtzUEYGJg13rfTtv7jxkx9A
	 Fd/ClkjiebVYiCKkS5BvapUpjMj3Qm6a6pKc6h7g4pUj2eGxaBfjjKVzCejWvtHAClegc
	 aRWgz1iXgf/+3YpD/P7tLKxiADFjuXKzxAumKNmAJIFAN++irjuFdyjuF1XgUCrYVvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jmeqz7ThXoYjgNQNs/BH69z8JNkAj1VbRCWi7gnmfKU=;
	b=qdWFcyHmHKJwamh8TXl587cfiUm6J9W9eQa1opmU0SUZoUdm2fS+AMPfHEvLnkmfFtAT
	 vSgi6mqLxtfnC+GRDRuWcQnU9628wb+FwwCd+8qwoMmwAKAMtxGaTcCkfeUGvtSiw+mJW
	 0QA6iIuqrRl3znEMVVera2v3E8aJNo+2vYLZ+UPfAq964ZGSj5SSe8LMy4VfFam1WBwTw
	 z7f1jm5OhmX6Eui8nqCZotRFhFJMEnlXv//ATAgBtpnrrM8YXbgypf0QLEKKelxndTEzY
	 1/HqllC/7MT2a48NOLzP6XBKgmjCMh0INsptSrbPSMuEvYVKu81oYMGgK2TiBipTRpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=L72Qd1f8;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C62606BD43
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 11:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97C62606BD43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=L72Qd1f8
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso85471266b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 03:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793965387; x=1794570187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jmeqz7ThXoYjgNQNs/BH69z8JNkAj1VbRCWi7gnmfKU=;
        b=L72Qd1f8s8gEBjZGCDBGGLvrag5LZMvHh/SASFvbSA1Nob80vfanySWiYM8sfoYBb2
         KWd2PBYiVYPIT8KQlq/U7emnRK6E3voeig60taWTHuGC8mJoBA9ssPwSz2NaXYuxU2XE
         KlBucOXx2yj2qHRWW6jsnQ0ypVVfVX2tGHaWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965387; x=1794570187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jmeqz7ThXoYjgNQNs/BH69z8JNkAj1VbRCWi7gnmfKU=;
        b=jBD0N7bq46UzwW91T9ChZui/m5XRueKeWuBq7luMZtgERf93mn+aCjH0G7A71ih8xQ
         MKeOEybSl4YUMD2eyhNxHbOeUzNgUANZicA9vXHNyQ1sgjuRDSG1O0Wz2qAyEskRMSk1
         +hKFwFZ8plQcSjWRul0j9rI9C7yt/H0Bvi2QavSZZCYPYXDzZz+Qjkh7NLrazHMZGEeo
         1KmwFzbEoCVkQpAbiSIUIBfG9TV5byTJzf6SxQJ/0BxTJCWfdr+Vxwlcop0k3Kc5TOJz
         wIFxsnnnaevUtW20g4/9itFd61H+WDEwAVicLUiPBP99w+tlub1BFsvDTLYE+ZQVEeSJ
         sn3g==
X-Gm-Message-State: APuU4Z/uUvjUeJGyBqQqCAFxq8waolpO4Cp2QwN++xD1L92eYF0wQJT/
	Q/uJN8hp/IEtOL2C8yIQ2Q7lj6ppcDrnpKZzjsH8ZMwc3ns1QyFOQVZk3sJ3MgZgCa8=
X-Gm-Gg: AYBFou352UzWQ4XMGgVTOwf+1nA2NzZwjLZFVMpTokMF6znfB2HacJflr+rpE8uL4qI
	UXfHtXLjxGeqXV/9oeM1hVr6wnnggKUrIDFmDmuwBZrUoADEbEJay70deu51SN5HrJaIsJYVQbx
	Wp/UacJvNuGXbWdYbXlJs3FwgEQbp7GKhem441i9w6DebH1UeUyMXoA8pLvarEfOEKrmC53wAFd
	VXh7zUyWoEJFGyuuXiCerDcPzV58SdLJ2/77VfPK7sUCTm9/RV4GsrnZYrr7+hYd7K4rYW7IikA
	u9CgCjytsf5A3/J80ALY8HIKUUQBfemy173PaTlfPMxlb/gjF9nOF8NMI0S5ueBeq+7R5ZU52yd
	gT6glG6G3FgwArX1khir8HnExqPbmEQzbMdBpZpTjmnijq4WEuPCr8O51weYcMziiLERbiEuDlj
	bMNoMGAi60mpSm62140/Yif7REvEQ/bm/zMI4ikl0zvMiD35rLUAm03wYVHrA5Dz13VgSfa14JO
	MJV/yCz/QrQXQD5YVIV2WC2WN5xyOr1ooJi+qTem+FipK1UCc5rn7V9PYFUD4/No0OrEkAAhns3
	nxWPp1/RdIeD3kSX+WUzr7zZIkhHIn7XErfIwaWXbw6OAiM=
X-Received: by 2002:a17:907:97c3:b0:c46:5973:2a1c with SMTP id a640c23a62f3a-c4d354f2af0mr203412466b.37.1793965386960;
        Fri, 06 Nov 2026 03:43:06 -0800 (PST)
Received: from xia ([83.142.187.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm71377866b.80.2026.11.06.03.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:43:06 -0800 (PST)
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
	Arsenova <7z0423arsenova@proton.me>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v4 1/4] platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on profile errors
Date: Fri,  6 Nov 2026 12:42:57 +0100
Message-ID: <20261106114300.936782-2-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106114300.936782-1-chris@miget.com>
References: <20261106114300.936782-1-chris@miget.com>
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
    Unchanged since v3. Moved to the front, as it does not depend on the
    other patches.

 drivers/platform/x86/bitland-mifs-wmi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a431d3fef774..d092dc696293 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -213,6 +213,7 @@ struct bitland_mifs_wmi_data {
 	struct device *pp_dev;
 	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
+	bool profile_saved;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -383,10 +384,15 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
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
@@ -394,8 +400,8 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	/* Skip event device */
-	if (!data->pp_dev)
+	/* Skip event device, or nothing was saved on suspend */
+	if (!data->pp_dev || !data->profile_saved)
 		return 0;
 
 	ret = laptop_profile_set(dev, data->saved_profile);
@@ -411,8 +417,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
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

