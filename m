Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B305741C2FB
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800378; cv=none; b=FGvfefp/PRRO1cj25HyuNhsbFnRuahSipgrqhulRIwX2K9IRGMvAvJPBRo5IQDpMeukHeSq1IfZArqJtXGu37+AqkxLRicBsIz8kqMsXz/mc5uK0Ki61wO/BcLlTiewu2b8nFsAfLnCr/3obJUDQXjj9BOi0W/nwV4JDR9r/DY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800378; c=relaxed/simple;
	bh=QY5aebFr1evE8tRE7OmTPb6tag7jx6XNKxf+rMRmOXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQHkr2AfbqKD/9nV61Q648qqcnnmudqujmzosAaz1n50thIW0ded4ISLHhul2PtANU3Bb3V12/zutTPMo3G9Tb4Q+wY5g0clCiOIfHokJQnU745TCG26C1QUuWXIE6WCwe+AgUGVgGnPwYSxB67Qu0upd8TgmD1lBg7xY626BDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxTOGfqa; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxTOGfqa"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caea3f742bso33470775ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 06:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786800376; x=1787405176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3guaqxr7NyyvixOm12MKeegXbSzy/kPgiJ95xUExEc=;
        b=jxTOGfqa7YPkgGNk9fL+yWewh56gjq0ffZwRsXT/1EoNj5Sfnu6NPEM8WgmaB7cCyI
         dhvCbTGjE8v9i5bQSZY3EQ5NFH7YG7dK4LwW5rIY8ofIisHWiX/DW7uBJ6Ew9l8tT+BD
         lxuKKNxAySlQkXvyxe7kcINUOS+61WC6RApdNl7Qv4BZcr4Gj5dkFsBWnOCKi14Q8BGx
         xshQyJs2bm5/0i+L8TzNHwSs3y7qPpH6sDsugoXA9GzAM1CRthXlexTjmqEhl8C45YnX
         U4gHzk58/N2Elhd08FFLGNOWVwkFkLILrsAH3dCO6KA8AoK05kVsCrnK2yJAXnlOSP0l
         MrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800376; x=1787405176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3guaqxr7NyyvixOm12MKeegXbSzy/kPgiJ95xUExEc=;
        b=IFRm9zEMh7te9/QmHmCdjReW3N4gc2Ysx99vFPpztDdBLGm867GPn0j9lo2JNCmz6+
         0HmFrxAKejDQKXk0+417VdvHVSJCz5434Ai1IqmK6dmUkXJNB+i2ldYgT1CuYZN2zSkW
         BOpH26wktzjnst6fj6DDzRDlMHgLS2T6PEC35ZlInbWO79Gf3jFvvMnoOf+YutAU+nbl
         zRJSoEBt1kWlhf/HbC2Ipk1njrGTvxuH58zl4wPMWWLATzmk0PIn+ISNxxLgC174nU06
         0I7XClBmcHk1slxcctyy2GMNWu/LeKkENuR6C7C6oFgKMKj3ZORIjVSvomqnMsoBjbTf
         CsMA==
X-Forwarded-Encrypted: i=1; AHgh+Rph6E87i3TZtoAslUbxUPZWlit47asEJPvSis6xYVijK0++SGafRGwwlx29T6aTdVBd9sQcUFCF0xtHRr/p06NvhkLP@vger.kernel.org
X-Gm-Message-State: AOJu0Yytdg5mZh5vpqQNaGR1bHZPR5jKnuazmZS6EDAPs4VViVH5vbK+
	n/36BCms+W1s0dAOFqModID32Due0oLMJ7eoKhy+wokMSCYb9AHyu9U6
X-Gm-Gg: AR+sD120nZsxWA0bIFRzA93bEDUpWXoMQRNTZBtcnSgOJXYwkjiWU45ypXB2/BHbXXo
	bxXX532JXdHTl5Pwn2mZ1znK+6hjTeRvcRvooagKMKKGOzdzx7Y9SQ7PN4CFYBOtuHS9nuxLo9j
	IAaurlElIlBzFFSMwCvyasuMNcPihZGd22k0Iai+cGy3K7oM1iao48jeA40277x7I1rYLI/sEcu
	moBjzU8qMnyvD9m6JLOG+QG4hjwCQMa68FR44trIB6syFJz33J0NVw535BcpiO6nYDMq5IITleP
	J+HPUqVTgxsReKaQcxwDSOmnprOFH/EoDgApQXFV8GojZWGzQNb9mR2T3QxIElKCKII4JiwMsej
	/3G8/wPBpIZ1XQoscRUumWyFvPFB8pwYc2jGXOtTy4yiQhkd2QvvQ/PnfidhrOgvGpnTiBtyhRQ
	7PlITl2hB8peqgPcL0EYHHF5aq1lMyH4s+MFg=
X-Received: by 2002:a17:902:f64d:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2d3b0c88987mr170712065ad.17.1786800376008;
        Sat, 15 Aug 2026 06:26:16 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc81a6sm19433245ad.72.2026.08.15.06.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:15 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com
Subject: [PATCH v3 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Sat, 15 Aug 2026 21:25:42 +0800
Message-ID: <20260815132547.29022-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815132547.29022-1-qby140326@gmail.com>
References: <20260815132547.29022-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950e25..af86b1df1a94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22774,6 +22774,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Gladyshev Ilya <foxido@foxido.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.55.0

