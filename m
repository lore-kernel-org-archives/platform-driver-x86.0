Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F55331EB7
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781943520; cv=none; b=enJHeR35F3bnCLgCyBPLk15SKBCJh19H17NE4NgCu0/P92utIabeY3O/ZifDDMAsMbrp77UDLxqWLePzusli4Tcq0L5tycCZAvxQUCvecz+ppgRQ3aAfA7xX3ngjb+0NBRtsGJnTnYs6ycnbaJFGcXdH++Bi/6Ho8Le/TilYGKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781943520; c=relaxed/simple;
	bh=KaLjfjfbLDSHRTKoFoH2WWe25lyGwHdfbMBSOjNwHy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2sB2+WbOSo0vaeG3UKW6q9bK5Ptp4gc4hrsuDh+WY8f4gcrKXAt99wrbAeXyKDvxcHgiSPQ2fhvbv6CMHvCgJfmfMzu7hz5nV/VNw2R33vimkM2+AlqklX1PcvV0aHJbQjfY+9DWwjO7AQiTdqIFsFEep+i/t9O1lxunOrTwek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhiqAlkQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhiqAlkQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c8584e80d59so1166635a12.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781943517; x=1782548317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e++bMBXpFk2AJ/tccOpQWH2jzKOW4DGp8RHho6XmHTg=;
        b=PhiqAlkQRxeOUj/06Vw5pQiaT+qnxe4ddV8NnO+A0lFnPMudVRNUMqUDWL0+fnEFV4
         03/2/DA8Zuwy+JPuCLkgVJJUsdEcOm6fA2Drop8o32n8Tif8aj3AESsmKjZLNCWmEc3p
         0+NPZ7Iok3xpldLIp1BrobIRepJzkM5Zqpi/LU8KNweeWJ/DSTzg6KZ9Xntajp/0TQYc
         yZ1O06CcuvtL0ZQDnzlzDrX7hIyEsfE/UTxXv4pXTae7Fe9SBCuSkoK/fXlKIVZqx6qt
         DbvLznW47XJD+YqIz4DxyGPPdWjVq91RTYzxDLxJ6bCcaVVzw4BlPbzqzbwV36fVT8j2
         2qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781943517; x=1782548317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e++bMBXpFk2AJ/tccOpQWH2jzKOW4DGp8RHho6XmHTg=;
        b=jLCknCJEuIDwLF5ZxhsHJzsrkgnLTJ/n+8HRbiIu1JQkn7K8wdNFzQNyMapk5lf1iu
         +x80suSon8ljSi47eR+/OEIUhl60gU2YPkoSUJvs8AYDt5HaidSMjcyjHW80veCtzsV1
         kWcM6UsBgmwxGbWZImVcNoaD3KfmXrvwjWMfTBstcdc/eA89i5LdH+BFz6e8fHXq6CJE
         byS2vhE7O8XoBK6jyTRSzi+5a6fbcEFEvqVzCy4mJjX20x51Ta/gQr6RUzOx+SAvykr/
         smsOp8euyxPjZmnAaBVHIOEszchsNVBKvoOa2wRGvgRnyfr2fFWPxeTbX3hKiEESysBH
         0x2g==
X-Forwarded-Encrypted: i=1; AFNElJ+NiUJtc65xLBtuyyCLrxLW46Bufr1G5FF96hkH9oO+FHXEPsnsEZvyT93nkcwbyFSbAjLv5k8fF7MLiJQm7tyN34ua@vger.kernel.org
X-Gm-Message-State: AOJu0YwpoHOA9WiTqfex5CxpiRsYkFzINMfRIYZ6gaNGPqVx1vibtIdj
	yP5708awrnBV07NpIglMi4ATSg5VshH5cDo2QGKP/RKkAY9uDwUzuOrG
X-Gm-Gg: AfdE7ck8FCr3wdzpP7iS+uCI92K+jxNfy9qnxN3pCnsrUSE54HtgEOz9yddSVxvVcRv
	1ticECjlSX9e04OK/SXW8VynA0kObA8vBoeJ+x050vnThawsVtnLqMVx5/fwmqx4n1avNnq8EnT
	eG9bkrxdrkO2SEZJeMs9fviDuqFTObSAWJRWj8jsVVqFbKLtA96/y2te7lpSc9q9GFBx5psbS4d
	UKBCKL9kMsW8xDY7Nr1jQ0AHihMiT3tV5JQdL1bUnS/CYuMQMXWjrU0yKw5zXKiyI8ruL4VlqW0
	UHG1ezVtWLvp7imMRtXEzB2AfmAoOeaSc03U2NM9bu821MqSSJgAjz1vtOCqMWVVg9eJHxfXAfD
	EnQ0TysmiZH+7mFlQnxKrt4TKoZl7ZlcHiLvNC1BsInXb2hQZaNgJcrEs8cATtAg=
X-Received: by 2002:a05:6a21:7018:b0:3b7:d9d6:9fc9 with SMTP id adf61e73a8af0-3bb69ab7504mr6681154637.2.1781943516828;
        Sat, 20 Jun 2026 01:18:36 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc374375csm1768098a12.13.2026.06.20.01.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 01:18:36 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v1] platform/x86: bitland-mifs-wmi: Fix NULL pointer dereference during suspend/resume
Date: Sat, 20 Jun 2026 16:18:04 +0800
Message-ID: <20260620081805.63773-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver registers two distinct WMI devices: a control device
(BITLAND_WMI_CONTROL) and an event device (BITLAND_WMI_EVENT). During
the probe phase, the event device handling path returns early before
initializing the platform profile device (data->pp_dev), leaving it
NULL.

However, the PM sleep operations are registered globally for the WMI
driver
and are triggered for both devices. When entering suspend, the event
device
invokes bitland_mifs_wmi_suspend(), which passes the uninitialized
data->pp_dev (NULL) into laptop_profile_get(). This leads to a NULL
pointer
dereference inside dev_get_drvdata(), causing a kernel Oops and halting
the
suspend sequence.

Fix this by adding a validity check for data->pp_dev in both the suspend
and resume callbacks, safely skipping profile operations for the event
device.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index b0d06a80e89e..3a373184519d 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -300,6 +300,10 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 	enum platform_profile_option profile;
 	int ret;
 
+	/* Skip event device */
+	if (!data->pp_dev)
+		return 0;
+
 	ret = laptop_profile_get(data->pp_dev, &profile);
 	if (ret == 0)
 		data->saved_profile = profile;
@@ -311,6 +315,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 
+	/* Skip event device */
+	if (!data->pp_dev)
+		return 0;
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
 	return laptop_profile_set(dev, data->saved_profile);
 }

base-commit: 1a3746ccbb0a97bed3c06ccde6b880013b1dddc1
-- 
2.54.0

