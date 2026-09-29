Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D5B4F405C
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674117; cv=none; b=tYFRsTuQFcVjkdL2R9ipstlGc/O+o5tVKa+40ZQOY3apZ4yVI0Bl7RDzClBt6+qPYOIGu2kfLCPXFk0cBUsUM/mJfkFHcWulb4R4InH2XcQjWTqrNgmIgAXD6VfGOMsep3KCyIUwqmRisH+FwcNhIx9Im7uHL8dQB8ZKPyZbJzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674117; c=relaxed/simple;
	bh=GGKmCLiVvtDvmlz0XzH+SIxoxbsri4p6O5niGHjqVvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njNZly/L3xSNiSlHx4O9y3JDUJ28RULw+K2uZeaLjC+VzMc5iHzhjhkt2yqZ2wyorTLnvEKijC/8uGEZjE0kvueQMoacuUUgQfa6gGpzR/RoUNBxofAYTBI3kTLvLO5eLV9vF1htn01VF3ZTz4wHdwRdQWJUzQXksfw/O7PKvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TupxW+Cv; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TupxW+Cv"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8ef09e288so2721875e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 02:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674111; x=1791278911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUcudjbNeMYMO4iQc1KVeIMhr0bUMacxk1kl609+CK8=;
        b=TupxW+Cv0fWO2GSrILruXo7jMsq1efBBhH1qgxFWkmnTAyv4rjyVPWfCzPpFlcV4Je
         lwJe9oQ2gdNqPNi/qvoY2bzF0iCnmOcxa63vLpLFzerKoPv8YNqb7f+hfwemu6sVgQor
         qWn3aqx7ObHv/juUrbIPG6dX9qgvVk17oN2xfJ4bKMkv21ZiSxX+vKbPeVmW6q13/x3T
         w0Y1ZCUq2gbpVAVmUls+aqYu/bXwvRUZLO8tIG8Gt4RcWKjUxMB/gDy2vnSQxGO4ElTi
         3ewvhwXgtNoj+Hea67vqc5G+5pt/KOs/1tutaoEVGbjLuCVQgr/o29JwGa+TUZ4z/i3g
         QAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674111; x=1791278911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUcudjbNeMYMO4iQc1KVeIMhr0bUMacxk1kl609+CK8=;
        b=YgWdNn1fWqR50V1FytouBgId86Q9LQaWL82fp0M/cZGBufM0k2UOpM0j12dXbRu5Kh
         Fo9vXqVMCVY2mHqXIqu6gwJKQefJbVl6j6/d5H+KTsT/IAMWcb9nScp0TA/ZMC8UQgIR
         tPuaeZHiGdNrCpkBrHyJV5RntFSk6rI5C/Nfb9F5g5asv24Sn2Gp9/Soyrxgd/LqTEj4
         wz8kKj/0KEwwolvqOPMKilyMtsNnPuNQAQlOPFfSd4XoOPre3mFe/vmyA8WWDFEe5sOa
         9kSQKgAXSXrNF6VlC6wkkrOJylZXTlqYz0rGEmdG2F5i2w6wIP0vgL2ua2UdH84n59DC
         Cj+A==
X-Forwarded-Encrypted: i=1; AKwUvBx80WlWWCB1lp+u+MHU1m7Ab19bMJYj4JdviyogoiZaFTtzrRGN8cBi4uesW3ubFetDqcrcGdukX5Dn0AqU4Pdw+dyB@vger.kernel.org
X-Gm-Message-State: AFq9FYIPVvksuVxs6y/KpZ3ziz6D1NXsYBT2KVpDFBY1vyWKhu0VoqGh
	Y3NMNN9TxsXlucFQbvhyVwl7zR0Xb9p7YbmHRF3muHi4ldD/vb7lYzrD
X-Gm-Gg: AYBFou33RM0fnOt+y8RuFpw6zFFvNaoCnTvzd8d9+txGraeFG9lX3eSza4gARkAzaWl
	jEjtOM0wUJrCAFBi+C9L1t93G6VXVqCtqqQPJZvsQ+kHVBdAxGEKr2+7Fgj1TjRlw4FshWHv0Ci
	Lt389Gjy4djfE67DG6dyh1XEUVMZ+WDcJ0EW7rx1GF/o6AJ9tOPx3ML/Ys4i1xaTbsn/APC7MMk
	j5eUwW/A3I7QDDVCpxBR99jNOGoDYpXTWy8hHyKYowvjjMLSv8pdHs5qwt4OPmey4f4q5VByBXn
	7/bIc8n0gDgV+khJsbQQ9Oc4SwMMVU7Mi1IQ/o7atwD6bKRmDLp5dczqkqjzGibSYc3RE4eM3Xv
	BtAyFRnATSc3d8SvjdQMcBjcE6IVZNvhig1pvWn4Q4dMxqqjtehVrvTwoxlgTYXMNk/cJq4R0Sv
	vR9uTFoNEZI2IYqW17XnH9jjCWjYPnJScMUhsYbScWrCYd1m962hL3V166cRKU/w+fsYcZV6H6g
	ZiBR1rphzE=
X-Received: by 2002:a05:6512:15aa:b0:5b8:e83d:6c13 with SMTP id 2adb3069b0e04-5b8e83d6c86mr4110653e87.56.1790674110672;
        Tue, 29 Sep 2026 02:28:30 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:28:30 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 1/4] platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
Date: Tue, 29 Sep 2026 12:26:58 +0300
Message-ID: <20260929092700.1776966-3-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ST VD55G1 IR camera of the Lenovo ThinkPad X1 Carbon Gen 14 (ACPI
HID TBE20A1) gets its analog supply from the power enable GPIO of an
INT3472 discrete device. Map that GPIO to "vana", the supply name the
vd55g1 driver uses, as is already done for the imx471 on the same
laptop.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index b48cf1b7f..b19ea6ee3 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -131,6 +131,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 static const char * const power_enable_hids_vana[] = {
 	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
 	"TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
+	"TBE20A1", /* vd55g1 on Lenovo X1 Carbon G14 */
 	NULL
 };
 
-- 
2.55.0

