Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5C24F3ED8
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674127; cv=none; b=d8no1BhjqLXou2iYrDU7i9zF7HeHhU24p0Jid0qkqgMFWQjctQY0WVsrQjpbQqqibQ06DwBjo9fmQTsoKkJo5ba+vaSVI+MSLtRuazXL0DqRo1+PVAegJTqgmqzxOrAeBsPbaX86iCNDVwztCnIn0hkmEisHpziWfu8awwXnkVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674127; c=relaxed/simple;
	bh=d2AdCcLoSMXGArgXKV93LIaXtFwYO2qc3OCZ1tm9oko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRtdrzGzqqKNbZAnBVRuB2TilDHOt8ClHio+JHaggBDu5zUQFTdrW0FqmdGL9THYORBYdLIZEV385XhBsWtO8yPUrEMbM/E9BH46XHn5Dgt9fQOtdNc9IDe+OI4LdluE0CXR55hu3w/X3iUVDEP55B6Ezcf+F1lTa3bihU4rCW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlbwRYLH; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlbwRYLH"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a652e2149aso32634161fa.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 02:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674118; x=1791278918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8OhnNj1c8wkM0rfJ75w5XkRFhHnimGOE3ImwOPsJtt8=;
        b=QlbwRYLHejAv7TOSjIBEoaHbLEEbpoCEGzLk2En62hYfCSwI4km6Oku+2QJk3M/vyb
         cxpgMsUFOYb1ME70Ft19g23se85Ml65nE1ljLrebPtM/Ij01UB312+RHbmx9D+2XfjCm
         9TAs8Gq7shYvPUTl2eLOz3MDDgWIzOKmDGX10FWUTw3O8FOUiWNcvwxM0ITT1nWuTPHa
         Gm5sxYrHU5vSXelc5FphdFzkq0VfnbO8WDPL76++5o8+nZGiN3A64L2BT96M2zADFGnr
         1KKCP08W59FhYDBi5QgvMsEPzXqxa/Fy36CHD+ncJVcKuZ0a6aZrNDx9VwHte35h0cWw
         f0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674118; x=1791278918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8OhnNj1c8wkM0rfJ75w5XkRFhHnimGOE3ImwOPsJtt8=;
        b=KY2bgdksZJEXaZgiMJHcIl8ChF8vwp5w88SKcswQnuJ87Igg2n/NDk54LpJ9AJrFkY
         g+UoaY4JxSkrWtjS16NT40atmz8XNJ3hliEGmrzuFhHDlXOnDBxHHPnb/aBgOppEwoaS
         Mcbw38av7EytV8QQN71+nAdPMIM9cYE4ssS5MQpREn87+O8Dfm7vHouDWwOfLgjR5P0r
         hLopawEfHdq0qgNTSf7aDf/dYVJAJCAMQ6Upjkhk72449xy8PJbQRFWSJfd98yWoD8/e
         Ys0GvgrKDe28t7RBJ2Mk8RMQgBUcnisU3Y8EzvxsPVeDl9kL8/axnn1wpoXdDvJwG9CV
         EzyA==
X-Forwarded-Encrypted: i=1; AKwUvBzWF0lJz4rQ7jhNs9jVgyI8HKLwzMqG4NfXhAoMbwz+Vq/VFBkt6NFjYmO7WPFrWbuMM/wVuxNoDi8EbWA8BQ+Z69z/@vger.kernel.org
X-Gm-Message-State: AFq9FYILsidtlLfirQYHxZPv3Rs9VBH36h9kjSogknOQgFSWDUoI7cj8
	jesM88mdhkkaQ9GbkGAaB9i8s+G3Fp7AAdjB0PXBBZprS7fTqtQgMnbJ
X-Gm-Gg: AYBFou3mXiRAc8Z/zb0GMPfomXG+7DCMl1SSNBSeI3ngH8S0dsu9GSMLPZXhy4NM2vx
	uhZ4sL3pzOWOAj4aqvZqW37umwvRdhGlDx1gkOJBx1usvguJIFu/MZSG3NPPn9BsK86chf8wxI2
	nT4OTuahxKyzBxa/Lw7gIWAVFjdEVmBj6bFirqQCWR7M5nJ6wdhHLikUS0gB/0iYVeGYGeLt3wM
	QLp3Ql8AeuLESavAYcBcnC9NhIUCv7U4xUDLZaaUnTFmlj14qfurLbICphIfOvBHaKwZjr1Sv91
	UaOB/sefONMJzB3uCCs3fKsaANy1khO5/p3HWNEbrb2I9UONHSGWBbMxULhZsJTM51NizLMypK2
	wAfP5kgE7I6H7Zmp+hBK4Iex6DGGjhRKyKNBz08sEXPm0YFdu8hL5cB9/0Rafi1ljvbGWTRlKtp
	1PD0sDdODg1/ElbVSROzVoD4UbuWuvel7TmsJ18PgBwQGy1uJ0drF5UXmQeLZ49em571FrnyUqG
	EbC+fmZ+Is=
X-Received: by 2002:a05:6512:398e:b0:5b6:1a7c:fd92 with SMTP id 2adb3069b0e04-5b8df0e4a6emr6242302e87.56.1790674118381;
        Tue, 29 Sep 2026 02:28:38 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:28:38 -0700 (PDT)
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
Subject: [PATCH v2 2/4] media: ipu-bridge: Add the ST VD55G1 (TBE20A1)
Date: Tue, 29 Sep 2026 12:26:59 +0300
Message-ID: <20260929092700.1776966-4-koreev.r@gmail.com>
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

Add the ACPI HID Lenovo uses for the ST VD55G1 IR camera of the ThinkPad
X1 Carbon Gen 14. The firmware describes one CSI-2 data lane and, as
usual, no link frequency, so the value has to come from this table; the
vd55g1 driver requires exactly one.

Use 402 MHz (804 Mbps). The sensor derives its MIPI rate and clock tree
from this value and the IPU7 CSI-2 receiver reads the same value back
through V4L2_CID_LINK_FREQ, so both ends agree by construction. At
804 Mbps a full-width 10-bit line takes about 11 us on the link, which
allows well over 100 fps at full resolution; lower rates lengthen every
line proportionally. The rate is in the lower half of the 250 to
1200 Mbps range the sensor supports and is the one validated on the
hardware, where 804x704 streams at 58 fps.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
Acked-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index e476e269a..8bd200896 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -122,6 +122,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
 	IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
+	/* STMicroelectronics VD55G1 (found on Lenovo X1 Carbon G14) */
+	IPU_SENSOR_CONFIG("TBE20A1", 1, 402000000),
 	/* Toshiba T4KA3 */
 	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
 };
-- 
2.55.0

