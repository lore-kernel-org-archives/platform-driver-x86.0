Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5639E42DA4A
	for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 10:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786443723; cv=none; b=grow8NG5KgzClUqH6DN/vPuW1YKvbqnKgNkN74QphJObfiBcHZ1mONR1m//YfN89CeBmOo8CmawRPD1rFZvDMISHBIY3LfIZ7AV3nOC8uYcvVqJArk+prC3hd5L3fwdzpnOJNpd12OY/XZRo8Sn9DYwyVO4st+zCX7r88xteAZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786443723; c=relaxed/simple;
	bh=3w7qdREcKF013xDNyNPF3fGwxZf1uoEpkhlXnxCwLgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgKVsZ2OOFH2gNdOXMElMFTJqevzA5kicCwBZlGZEA7XW7kgjkPAWkhK48Z5PLLxXIv+90BsErvok70XObf5DTqhMfI5NGyHCN3OQjfQlXR1KUT6qjd3LD68Z+wzYiTqeRupbqn7iDvrDuHezDPl+Vwu6gjag6Tn1mbY+oJtmDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d0344e1ce9so14066885ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2026 03:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786443719; x=1787048519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTYjZBZGMPVvD7fTKHpg8PYeoZCfwS/aHmI9q8GSv60=;
        b=qGnAuowvgLvQcSWendFKYlQezniurBw8eHOcJNIqtyWZeBmsv3JflxNwsNk1IwsV+T
         0+0tFivBoQT4g4BD6IuSw3ySJz/qrPYNGljcdLr9lVphDlTLWHl/or/0/RXKliUiyF7c
         n2GK4gZqC1EjcBnGFVwtm9O6cMC3N6k4ZWvMsbY6OEKAgZU4MhbG9l5Uu5KnnTRvEYlk
         BvHt6U4/e5XKbpzuR5sfN62giJz4BYwVaFDIiEjfXtovTYcjpQaAE5HzpJgHHEEB070B
         kZOL3g5iPe0D8LLRcWoZzW1GXmbMAW/UzewcbxcK5ZLuQl73979Pp1vxSu+eDbOKyYoL
         9HSg==
X-Forwarded-Encrypted: i=1; AHgh+RqvcIwzyHCnPCniKp66eUs2SG1ZMqJwIH4AkNFWHrHZ79iTUyMNduQrnJSabW1qFN3ub75iUyTNgo02njJlD1Wqv2dD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw34m06LbSUFMy3f38a1Ml5PfoLKCGfEA1qblx9dk45mK99WF9+
	lW9DsW1zg7FDK4WfzaHDMPInxr3WfpPqJieTYal0cbp96DPUVnckeOb6
X-Gm-Gg: AR+sD11uSLEhAA2MjgVoBGxCURbgAln/MDAVhS0EEKXO8tIjNDO2p0WNix50pW6Ov1b
	zUJ2A3z4LG+DlQwi28HJvpW2xO72wtX2V1wlS+gbxX4Jc5nEeRGWtdi7k8FHqYpzSmBGRsps3or
	y3f/diRGMYSaUaYw/98F8kS10u8sEh69CStZCKUOvUvm3BRLXnmR9UtDaS9jvXQAEAICrimczQA
	7JHRbacVSyjAADYdDqN6ECM2WshVAXb63CooPA+4/m8b0jQPfG3LEVIO50fcNmbhl8rVVBJLVXr
	35uwZ24gug6sp1siLiiGfpL5wLgjrLKlMvSlDs2FfRr+k0K0VqdQs2n4eSWcS5I3Q8/6JupOADP
	gEf7AmcL6AHHHSSSgQlt7BuAAwJuVDhl4fu4akN/Ld3oG8CTCJz12SLKkRXpgekT7Ic0r8WK335
	7NNvMsRxypVBG6PVg+IZ1GTcdR+1R+xrKel5yx3LA2c+lkLRrHDcaaC01lPeD2s5TYrAp6aDtBS
	o6oUNrHlg==
X-Received: by 2002:a17:902:d488:b0:2d1:1a18:4d0a with SMTP id d9443c01a7336-2d3177a2163mr23058195ad.9.1786443718684;
        Tue, 11 Aug 2026 03:21:58 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef0a79sm5221975ad.9.2026.08.11.03.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:21:58 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: W_Armin@gmx.de
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: wmi: Add ACPI_COMPANION() NULL check in parse_wdg
Date: Tue, 11 Aug 2026 18:21:28 +0800
Message-ID: <20260811102128.1027805-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add NULL check for ACPI_COMPANION() in parse_wdg() to prevent NULL
pointer dereference when driver_override matches a device without
ACPI companion.

Same issue as CVE-2026-64227.

Fixes: 4186a47dbfbc ("platform/x86: wmi: Decouple probe deferring from wmi_block_list")
Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
Cc: stable@vger.kernel.org
---
 drivers/platform/wmi/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 529825dcfbfe..151b712d08b5 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1290,7 +1290,7 @@ static int wmi_add_device(struct platform_device *pdev, struct wmi_device *wdev)
  */
 static int parse_wdg(struct device *wmi_bus_dev, struct platform_device *pdev)
 {
-	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
+	struct acpi_device *device;
 	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
 	const struct guid_block *gblock;
 	bool event_data_available;
@@ -1300,6 +1300,10 @@ static int parse_wdg(struct device *wmi_bus_dev, struct platform_device *pdev)
 	u32 i, total;
 	int retval;
 
+	device = ACPI_COMPANION(&pdev->dev);
+	if (!device)
+		return -ENODEV;
+
 	status = acpi_evaluate_object(device->handle, "_WDG", NULL, &out);
 	if (ACPI_FAILURE(status))
 		return -ENXIO;
-- 
2.43.0

