Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA17A357D00
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270344; cv=none; b=LHTKArVNmS3Oaf/yE7/P0lDzNM2/0X9hPujfG9hPCS9mfSD1ENKozAW/9GhYxugUHBRyMqnukXOpNBSUvq8fWTOrqW2jElgg7sQLE8rOW8vGMzzlAChCT+Q7Sjw0nlafXMbSm7n5PM2lxarOnpQukVo9EMhLaNmHQghRMsF+65g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270344; c=relaxed/simple;
	bh=IzOSQ5PgShuwmISU178ZdszugMpsD5D2m5PTctJO2LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJrZNz1GswvG+p05+FFFULYZRxoBzppf4eL5yC62gFJTVXMPuA8tXxU8zzGq9xlOPecT/Pl6xJZOsxalqogZplrBwme6V5EXlSYOUV+SqpGkype2KCnn1muy69F53xuHCknrPeKc+Q7fDi3RT1viqCF9yKqipVRYSHC6rA5yL9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsRpgt3Y; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsRpgt3Y"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49c068e85so19147681fa.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270341; x=1790875141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEg9sPLG6R2rCCs4MQKovEl/ls6n0s+ptG5DL7CC2NY=;
        b=qsRpgt3YWee5mEfFoEQnNZFe4UJqFMFY1KyWlHPiG7YJZ9bni5KMSfHzx1QmI8aDL5
         rEa7zQwxZuUZZnqYCb8s2RzAwxHuKeULr+1BMMj92D/GhbLBEfcUazgoQdx0PLemZ+m2
         1152v5jUZvtckfwiJ/Gz0zttQZCKJkTWxGu4xHUVJuknX9uea8RRE4oKK/6cpnJlWct6
         tgdtgafhm+Ow2O6XnmN2Qj2DCPnn64Zu1wZS6DwT/sifvBfPsq586/2Ka4UyT6wfTGdS
         ZS8xRvt7TthvNbAYMxhD3Mq9qPHMzq0HYi3tf+FLG6dK+vaOrjyuTKT+1GtG3jyaBEA7
         aYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270341; x=1790875141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IEg9sPLG6R2rCCs4MQKovEl/ls6n0s+ptG5DL7CC2NY=;
        b=v+QQHeMTLmhihvklowhshM/7PQKHbgw5H+4QR6b/giFDNKndzZzMJOALlrxfgeRY+4
         +dyRbWsVFzEClkcTjqBAAQyB4LhsL2KEg8wQy/TvtF3engsTIMCdD6qnF0xGoicMDThg
         kmyDydKVb9460bQs3OoIHKS80UL/5QD1/SCpCZoapomYWhm7Ehz7K3iYOXe9Z5HjVpri
         mlo3JPb4GRpKnowTl1UfV/3RPEVQd3NXGP2GHPRp6zY7VkVbgKOUdW+3ik9Qf+/3Ov8E
         H/Bg5QcsrtYgA4QZN2CbILKcXTt3df1k/CZGvYrgO+8NZNr+Qoe3Es/kn1pqOsFn7nx/
         x/ug==
X-Forwarded-Encrypted: i=1; AKwUvBw0+r2W2EhP81CTEudrB2zdAz6RT67+c1GLR2GJ2o/IjtiWOq4KVo3XRg13mYvFgnCn5KcW/I0AbQWGbg063lNHgRDj@vger.kernel.org
X-Gm-Message-State: AFuF++mNXNXoUU7R3mnDgN6Uw1pTTcGUrg5o9O8lsMOwgQ+qz8fzE6zu
	NtrB6GC/NGn8ZxTawruyTRswbAVT9qBTNOWW25RGc21TAp3VY6feCjCg
X-Gm-Gg: AYBFou2gRBcrp4qwOZ+qeP1K6kyHlUXe0McsRj33Ziuh7H/u+8nl1Im0yn4Yq1RQMaA
	HFvQibFjO14ZmLuW1eWYk9QhVpV7oFnBfQRO5YC0Qm0OAz1xSuh00opIG9XzMx7OeQTJpXllFH5
	QSAlEw6nXpAc24rahfo6EkWi/7gOM5B37AV1Gq05/KKhLSsm/ZgUruJhqRdYUZXbiEOxTnlVJXB
	tfRXSknhF+nunKLq3/2CDZyi/aeYIYkuavYVQyyLA5J3CKe8teEiOIvNSdfKvegc0WNP21z5bD5
	2akrOR1JK3qo/yCqsbteqGOqyGToeG4USpe4x3sq5f/IjWWjAArlogyZQoL+kE13pWNrItm+2Vy
	C4oEAdDPAS4G/hQ2KCifaYlrZlFFTWe4k0gS5N1xSZ0fIZFpWai4blJBs2GAAnOoisX3cKPq0a6
	WJU0mMCUg19bHMwJSnbxEIL3gEUItAPXSu9uSalk5yH8ZCksP6L8YxbYXai9rROch6c6mJ9pfD4
	hTTRhu44vH0zK0=
X-Received: by 2002:a05:651c:b0f:b0:3a1:f4e7:a820 with SMTP id 38308e7fff4ca-3a63bf292bfmr8906191fa.4.1790270340690;
        Thu, 24 Sep 2026 10:19:00 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:19:00 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 1/4] platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
Date: Thu, 24 Sep 2026 20:18:17 +0300
Message-ID: <20260924171820.1179823-2-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924171820.1179823-1-koreev.r@gmail.com>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo ThinkPad X1 Carbon Gen 14 has an ST VD55G1 IR camera, ACPI
HID TBE20A1, behind an INT3472 discrete device that provides a power
enable GPIO, a reset GPIO and a privacy LED. The vd55g1 driver names its
analog supply "vana", so map the power enable regulator to that name, as
is already done for the imx471 on the same laptop.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 6c729fcfc..d005595ba 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -130,6 +130,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 static const char * const power_enable_hids_vana[] = {
 	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
 	"TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
+	"TBE20A1", /* vd55g1 on Lenovo X1 Carbon G14 */
 	NULL
 };
 
-- 
2.55.0

