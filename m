Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348641;
	b=GscVvauWoDYsiu4LhR9Gt71gu7Go0Plxr6QQfmnq9XoqXjw+1Squ9bQo6RXFiZ1g5igu
	 sHAxlnFsPIpB9qhuHJeQHaxz7JbWshiwZTzBlHC11KWHCFB0IZ6TfmO67vV15cKBlV+Dg
	 EqJHf8jlbCPbaq4i/py7De3sY+YE0Y4NmOzlaq4YJAtKaST0Vuj2thWGxq/EcEGROA4hk
	 ZcSyTWe3kxIPTW8h3tYzFU2v1fEeApUVEbhCZKM0iha/IzrvT0DPJZZY+oFuy1071hLAN
	 esJGpm/zioBvSYUJzpSn2NFE+WXs5D0C2hBKGiyI9aCDedTNgFw5PgdtrUMU/kywBAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rJl0p8S3DutgTGRmx6NitpapyW521dA7vOSDUqq2e/g=;
	b=h+iK+7Fd8WTg1T3O4Jl3rADbxK/zNoQhHr+QdOn01QbaQhf9hR1JtzBgTlno/jmm0hnI
	 Vrov3uOnbYGEJBi7jVTnZIN+Eo59PH0i0mn3chf8T9xu4yUqdZuULsJqA4E1KPtWLw1KU
	 iPjz2+aDvUp8z7vMfdG+czZ6I5tM3H7WieBxiEAKbPJ1Gs8lIBWQ3oBcEbepiEAug9eTw
	 2zrSE1hOqOwyknT59CsjDUt6+i71o2X7PH13Clkpf5IIGcz4g2FH1jXZub5LzbskftO8i
	 yTpNuIRGoozEHwHfxhzaYFUX5Mluvl7ZRwDvzNACFBVaUZu0ZfWCfK/BUed1w//Afaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnXgiBs8;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E16606A31A
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 08:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03E16606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnXgiBs8
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35b2c599f43so1091019eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348640; x=1793953440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJl0p8S3DutgTGRmx6NitpapyW521dA7vOSDUqq2e/g=;
        b=rnXgiBs8F5aUgu6xtvv7qnYYqN8bF2hyTC4vXJju+7CajSG0Gf4w0pMKRnMqn+y2t+
         3ZwRpyie7brIqQaoL0m8rK4ii+iBbLnNgJVECErG8zftbFLJRyBC0GO+6Po3INGVT5sx
         3Ar0w8sNfIY69feN5wV5ueF1q2pgS0xYmJN+Hj+SlThZsRq9YVg4ihM0nZSdhTGG3YQC
         NE8FEHkPxkSRP16RglHqnkVPB3AybTwQiO2gaIVbYxVfdGjJr7jlmSgYhjBl1Ga0bmcm
         1iV66f5OzUjLMnuCZruw9jHXzUx0GjLvw5Wvo42Qozc0BDCJbWc31qE2fJdAuxefrqDN
         Ic4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348640; x=1793953440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJl0p8S3DutgTGRmx6NitpapyW521dA7vOSDUqq2e/g=;
        b=eK9tXsCKpevZ6Q5iXImBHrOmDAxLyG53W57+aXZXKI6Z0jWKcyMqiolZ3QZejtamyH
         TP8hwJeHpaBJiu3B98BiaF1aGOLDhBNDnD7QcyB6cqJmvibLrEIcLFtoS5D/SXzguFit
         XCzP3sCObliCxlyyQ+7jStO1s8/WwAvwuh0wOWGR1/ji+GW70VoNDFB9zHR16KJhwJBl
         jTwMfmgvKp/TyNLK8X26riVDooEgwCbznY2fP2SIFzpBAt621w7CLkom3WwhU7G4jV7v
         mCStdhI+6E9A7AlpexH84J/WW8bKgy5rnfsERER/3nvadI95cK+6kvlZmt7V0rPitFCS
         7VrA==
X-Gm-Message-State: AFq9FYK73B/lLH+2CCbNcLCr9UDXRtVVM6v+mEDdjxxwIz5Mkk81Vm56
	zCCu0e0tmpy8AwoKwD4r2A9NysJEQj1b6lo569qgt7VkiM9HlsRD81ES
X-Gm-Gg: AYBFou3yFggXJ3fynuRuG8bdyr7dkcE0395ALNDsj630Kl2YC/Hkrinuw80UGzu2nJf
	5i8ulQldYGE7PeFsbuBumtScYYJK6hdyRhhAy9o5VzxW/+K2upFEy9CkRFVUeOF49Bp6SCWZ/U2
	x8pM5mazCVlNs6DCODA1s3wbiTRXmfxwa6xs5eeHW1or3A3uCatbtZZMLZfZZGPRgZ0Ly+AIEnK
	13CDojuPy/xucbu79S+L4wWi2L7Ih/MKaAxpxTP5kawuS9iPj1+sUxPIMP6X4bAhv39MjbLI1YG
	f19A2DXwT84hgr9m1R+qFNYwPjuB1+cnxGPcA5mdzbGjwpU674rOz7ya36yCC8F21ZnaB1rYUUO
	7NCDovajGlpgyKshcl25NOgRjlUbjWypph9n/J1LAzU7MuGKKdQNtvxEsylr8tdTwY4byWOUhXw
	L65QDNevq8QHh1rZYPiXRxrYi/d/iialka0qIoeb6mOhEJrUZH8J8mWEjKq/mYUJbM9W3Mgp//K
	Z7pa8ixVBKOfnSYZrVgjTS6p91nQTZUV64ObZ3L01kwxYlDVQ7B3Xe7IpchX263DDM+ZeJhF/Qm
	Or53EtpjyIMLaB0M78lmQYlbTlk7lclPVAueON+REYETvjczUr6hzNADaStcm2GlQw==
X-Received: by 2002:a05:7301:7306:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-36a4235f4a1mr2488003eec.9.1793348639867;
        Fri, 30 Oct 2026 01:23:59 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:23:59 -0700 (PDT)
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
Subject: [PATCH 4/8] platform/x86: crystal_cove_charger: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:58 +0530
Message-ID: <20261030082303.284271-5-chitranshmandhaniya@gmail.com>
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

Replace mutex_init() with devm_mutex_init() so the mutex is
automatically destroyed on driver removal via devres.  The driver was
missing a mutex_destroy() call on the teardown path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/crystal_cove_charger.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/crystal_cove_charger.c b/drivers/platform/x86/intel/crystal_cove_charger.c
index 425c7eb32442..8ecfec2c8369 100644
--- a/drivers/platform/x86/intel/crystal_cove_charger.c
+++ b/drivers/platform/x86/intel/crystal_cove_charger.c
@@ -94,7 +94,9 @@ static int crystal_cove_charger_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	charger->regmap = pmic->regmap;
-	mutex_init(&charger->buslock);
+	ret = devm_mutex_init(&pdev->dev, &charger->buslock);
+	if (ret)
+		return ret;
 
 	charger->irq = platform_get_irq(pdev, 0);
 	if (charger->irq < 0)
-- 
2.43.0

