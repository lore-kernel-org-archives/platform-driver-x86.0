Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7902DF66
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clUa/AGF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e37524fafso7779735e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Jan 2024 05:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704462478; x=1705067278; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7scXJfb8MpiekK69yzw2lN/iDE5LBn7Yp5Zuvf3udM=;
        b=clUa/AGFNlZ/QHvPZ6clLbGk6C7reNyAc70KJev9NiVfp/cMRUhU0sQb05osr7QSpH
         lratOl0cobqIeaPBBk1OA00BMhSacig52R9IPYAHVcSgZO1KSedlc3sDdMQObueU1Fr2
         5Z4h47ycVQaL1awGfzkzYwNyG3JeM0Bt8u00350pI9Zb/YN3Mw7qN5F3cZjBNmznThHb
         TwNctx9VwF063hAMC0DMovh3YcIOoBu37nKbA24iVwTyDT+HXdzdYXs3RAhx7glNdLuu
         8Q5FASUV6/OG5xvjPI5M1Be37TLa1g3OwIFMUs9V9djgzhSt148WZ2cQuk+g3KUXgwxH
         QaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704462478; x=1705067278;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7scXJfb8MpiekK69yzw2lN/iDE5LBn7Yp5Zuvf3udM=;
        b=Z4M9MUY6CoAkqHYIRMYhSE57Pyrx1P9dPA8RRpZdsB8oUhhyseeLUQnbdCfxstDi5g
         3cxKQNYoZEnznSAKtLAFlpcNASldQeeiZWd5jOLKS/LZAo5wJRA57n5DnKo1MqStKTzZ
         Lw4h8X1xIKMiEJw8BcY46V9uBsfjZt+QcbMd6+PcNQwP1rNJe6/nK4DtHXQ6cq1MpQ2l
         VG7GNfg/zyq8uBhY0GVaFDp9PEcJuWVor4FNJxiTTZsLUSLp0vAokEDZyCeamuLLLdk+
         +60ZwEU3oDBQL5bx1jonpTAYG4t3MJE2Vquv/wBIVHmG0PI3kNSnG2k9ImmP9uX7eKvX
         SxWQ==
X-Gm-Message-State: AOJu0YxF0q8r+bjVpSCgNJV69If+vAlYoJmqCEUK88bFbQ7pNMIqcqNg
	CFdN098wIsZ9A8oqG7mxq6KMQZbNTtZgNw==
X-Google-Smtp-Source: AGHT+IHUBJMtUA4V6WC+sNyeJ5Zc5b9FXevLeRPP8Jfb8EVe7sp13SUAwUFU+afaysyE0Q/N7ksdug==
X-Received: by 2002:a05:600c:3b8a:b0:40c:6d5f:e88b with SMTP id n10-20020a05600c3b8a00b0040c6d5fe88bmr1212246wms.112.1704462478113;
        Fri, 05 Jan 2024 05:47:58 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0040d3276ba19sm1631292wmq.25.2024.01.05.05.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 05:47:57 -0800 (PST)
Date: Fri, 5 Jan 2024 16:47:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: wmi: Fix wmi_dev_probe()
Message-ID: <9c81251b-bc87-4ca3-bb86-843dc85e5145@moroto.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This has a reversed if statement so it accidentally disables the wmi
method before returning.

Fixes: 704af3a40747 ("platform/x86: wmi: Remove chardev interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 157f1ce8ac0a..e6f6fa2fd080 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -868,7 +868,7 @@ static int wmi_dev_probe(struct device *dev)
 	if (wdriver->probe) {
 		ret = wdriver->probe(dev_to_wdev(dev),
 				find_guid_context(wblock, wdriver));
-		if (!ret) {
+		if (ret) {
 			if (ACPI_FAILURE(wmi_method_enable(wblock, false)))
 				dev_warn(dev, "Failed to disable device\n");
 
-- 
2.42.0

