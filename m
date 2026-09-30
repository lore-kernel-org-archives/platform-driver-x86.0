Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B0530DE0
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 21:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804639; cv=none; b=e+gzFQ1cA4cCOql1sGj7YT8l0MIe+8sIOh8T1TnoDl7LRTOVNbORjbCvcd76lpEhYrOLSq2GS/EfjWd6W02FAwhpCS+lUD2jYjNgWjz2YffmOb4AI9Dxt/06yjrkYPer4ESqr3nO5SQLXwqSrm+E6qpZUtwtJZ9Rnlmb1Usymuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804639; c=relaxed/simple;
	bh=zgdwX0TIMKK91epseI7rcjjeGGouedZrHpXeiMjSxVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cwsfzpsLCUyxwrKIZ4q7/LKJauMPGFzZDu9uME1H+O+DUrEgeBjRguenPVJI2PAi+Bx9Ms0alQS/r1O7bsJEwuwmyvxsO1foUu8F3cf2WVE5QRBLszZB5Ac5fSSUzcDu9+2uoZBbBxOnd3esXXnN2VorJTfhTI19L9NWCzragHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpR3VHvD; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpR3VHvD"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccc02279so3369629a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 14:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804637; x=1791409437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngaE6v3nlI6k6bFrkuZv4otYMxnOuZHTH+fgJ02VtrI=;
        b=dpR3VHvDbiw0wTpzLbFuuy2FfkHfvG0liL/OFdino4YLATwzi0OyZjP3HnuHdlB+cg
         hhHsVDBbwEtfdKGhl1YAkcUJMJSZnirbUBjktkRi1Hc/gGq34AduYqXjRYraMjimYrFf
         3ImD4V0RLJSpQEC2kxdtOVz16Ny3VXiqv3we3SwpG33pREkOAkZ1ibDOfKHs6cBamvgq
         +tc2yH6e4hJTKVRrTEv1ltBpdqaqTiJPVp8VYSJBvy7sFYNJQoDJ1o9NsxTDkGSxxsOu
         fU9UwjcXk0fUzT8vDTiFw0tirJ3qZQSIzPzpsETtWIEH0XzawJO+/MJmxd3wov6oHYHq
         Wpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804637; x=1791409437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ngaE6v3nlI6k6bFrkuZv4otYMxnOuZHTH+fgJ02VtrI=;
        b=YYYAHCFl40VjlqRb2MLl8Mu4DwIFDPnCW6qyp3ccN83DepiOWPwXs3ygPFNHMJef/r
         U7ODmIYeq/RxCNfRTzFimOCjyOQyWqub3gIMgdiTSumArf7+5dN6yW2HPbv/WXW6ZgZB
         I1S4fIfalv9tUdKSfQgl9qJR4Y+h+1ncDF6PxSYsQPSNmEDmjb9nXYuQQIo61/D4QRPK
         5ItRVqlx+3e/jTUzZFLVJY0HpxkDvRszayfqbgfuCDdpJ6ZJhsD5wHv0rDiqywUZRLn6
         dhEX3Rp1x+xpyKdN4VV8GWbXhQ6S1G3u6ZZktNCw+5mhhGk3XlNW7Y0ZZ35+GtGuygRD
         lfTA==
X-Forwarded-Encrypted: i=1; AKwUvBzDY4pklUk5Jaeh1A2hS2cSHnL8STVhVdOXWgLJEnM7hcKOGagu2Qiuf3A5QOFXJJ9bbNMA/bB/ndS6EFr9Lg82Avus@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2WKyVg/kb42ZHDZc+ukAruNaqG6fCArrhrprr3ZxMETMFFzyJ
	SCUnUGsF0ZeyKqlK+gFVA/gEzCL2zeLzY2qOgJ8wOMB4lGAGEI/w29n3
X-Gm-Gg: AYBFou3+5jUuqJUZ0F+MUdFnl9noQKtJmqwnGfBugsTu4U3PEdQzedFaYnFVLpSj4yB
	ZWnS6U2eZk3tNCXmg8Myh/Ad5F4dwSFovDydNEpXTdlGtvhNhs1A5stQkJ0MFquldi9dcink1wD
	Rb5aiqAzCnTunA3zOuswUWAAoU5fmKIbKW5W1wjkb+ARqyPtn+UFD2JH5UdAQq0ccGU9OArAs9X
	c6YrH6cMkOW5J3MYJKMwFJNiOmO7eHsDYs/uE6JB8Xh3IF2poay5HalHACl6f09iIpco9FGnWGC
	nDLcvoiuKywLKJ/dBTMChQB6MVSJcIaZk1y5dqOJiEOeCqcGT+CPiukRPlCXd6cJyOzBJ1FDCo1
	/RnGel/aWdnrLOgrzWHk/1LDY5p6c9eJdEzkGa0YaCnN8whOWD+s7NHR9LfVLimxkXCJ8TKjtqy
	AKTrzx/5JwfEkxG+CR2VWaVol/tNJcNQFZN1EnYVjknc+/gEMBtt29l/gTacQxDsOsa3Y=
X-Received: by 2002:a17:90b:51:b0:3a2:a98e:7a2b with SMTP id 98e67ed59e1d1-3a4d1914382mr2194523a91.57.1790804637185;
        Wed, 30 Sep 2026 14:43:57 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:56 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 8/9] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Wed, 30 Sep 2026 14:43:20 -0700
Message-ID: <20260930214321.600863-9-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Assisted-by: Claude Code:claude-opus-4-8
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..15fe4d057 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.53.0

