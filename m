Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4393F12C4
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 19:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968519; cv=none; b=TbFVehvd+PB0l6+ViAHn2jxH0KVbj/W+OyUPkwqoH255sslc5uYCgoH5q8dooAxMkfazo+YlCqJ0zVDsZPzck0ZdwdpcxzVqYPCboLWY7a4zt31clrKh1yN1sNvG/3arEH8zw0pZlbOtCF9ztWtkkBfxIRJMXV+K3C7SJKjrOnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968519; c=relaxed/simple;
	bh=uzuTwXk8WkiER0K96nRtdmtlQc4RXbfFoRo/1xUc2P4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2SrdUcg3THW1K+a1G2LE4lHYhbhgf0cz7j3pUh2AI0qbhITzjx05ItpPqEfI0q7ZX6GR4C4LP6NmbP1UjxF0yTk+NwodHDQVzDNZVAbJ0YTsiwMIv+unKAWUgpWmn1gocJMEeiioZPpIddI+pfMHwAhBwRk3xlhXXYYyqHdbWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6gzlLzK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6gzlLzK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so1284055e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 12:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968516; x=1791573316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5Abc9lhmWr9w80vEfggZt06aTIBY7WIzDl4UzYH0h8=;
        b=C6gzlLzKSW4zBzA8p4XKkZOXmDYUjrY2vE1WacYFXqv0DsME0Eibg3UzJJEyn5cMVK
         VZx7fnLP0NQ895SCmUzsdHTRpsHuVFR0dfyV7l3SLMufncE0kNBpkgNNZllKNL0WvtQI
         SgB6fMryvLzqGqCpEhsZHLgmktfef9EJpxD5R01nn7HZJ0DdVLVlLBaNtQ0HE20ZVMBq
         IaewlffuSBMjk6YYVnNCCJYFUN0cdninKNm+FIpktU51w29cbvg2Zw9Fpqm88TYLi7+G
         kG7dlHM3/hrr9LCQdKV11C1eSafU3NVUgQmAKe2AVQExMqHCok8bHlvWs7nQ8P9tvwi5
         bGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968516; x=1791573316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G5Abc9lhmWr9w80vEfggZt06aTIBY7WIzDl4UzYH0h8=;
        b=TEwkdh3wd1ApT018lhoqSVTySWlXvkc14Y5F/hd2ck/+nwB6IEmZf6V0HZTMDXjf8r
         DLzITGG8l06qtium5tPqbe2Pf5tnq+kGB3HHbIEGEryKRgjWwZ5TfOUO9ZjXeTXDxf5Y
         mjdf/AKZJU0JSna+Dv6KIp6wlqtVN1KI11HNKPML2VYKymuE0+keHmUIDpmncHF4yKuK
         65/cNf1HLcpjwL+4HZy4UGj8hSaYzdA9P+b6Z6XtuyILFYv9PTYn6Cgs7zpaDtkweDiv
         LJTyBIhtCmtf6wepDKP667crEQSKT67yFBbFmJWvcug48gUflbVJ7Fiwa9dDY0CjAnMb
         wI4w==
X-Forwarded-Encrypted: i=1; AKwUvBx1oNC0rfEJbfSQqHQj0dmWqEnF/pWbZlxFqyDoDH3nLklItzFA8nY2V203l7Z0B6DJaDdw5ivU1wlK5KIGrkxlDrzN@vger.kernel.org
X-Gm-Message-State: AFuF++nvJkscRsrlnR+zkL0YQ6GXe2zA40yNUg3ayyxBsTBkmCMgx4qI
	O6JiAxalju/A9WQN4xGJYZeWGbMJl/++oQK/Dl3Sdl0mkBFDxbPF8e4E
X-Gm-Gg: AYBFou2GruesIp5m7BK/ATT0Ky/ZA9mAC2DR5L0KSt677UvnJEZpDAHivDgkOaHCsE1
	Z7R2+EYJTX0VM5q2cG0A3dSrTInCFUI4yv1oHNWHbxDOZYA7JdHZDxX1ZJlo/VEQONYh732nltI
	rV+3KVYdJMuSpv4jPlzALa4pu3QlrUselUW1YlWdV3JSBWYVdp9C/3SuaOaDLvCek1ofjOvlUYi
	QTQj9HRyrFMJhkjM9jMlpxqZlBwUSOka2DKpltSFcOhhiLomgd4ESRPgl3BXiVOMvbCwh7PKHgS
	iV6tQ9/PgCe/iligU1rgU8ilDl80J8EGMXbCJlfMQ5cOe4WjjX8qBR++WlbZVWN5ZzIT1WUq3bG
	2oVEgYW7SnLLqo7MsUIMnTO1Vluo9873fX05tRFENKrAoKp4JY24eJucXm+Rq/BZA2H6xOsxLQz
	bfeP09YTY+piGB2Xvyg4VPQHPA2wduBB4VFCAOSyOIsbrPXe/ETLM9pOsC6uCdlMkNLyguoH+tR
	VT7weCSBierZEPHlVRc8DrmIFWHYbh9A2QU5P+U3cdyMHV1Gc0C
X-Received: by 2002:a05:600c:858a:b0:49e:7d74:7b7a with SMTP id 5b1f17b1804b1-4a02756f0d0mr44522405e9.6.1790968516532;
        Fri, 02 Oct 2026 12:15:16 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:15:16 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 7/9] platform/x86: hp-bioscfg: validate SPM state returned by firmware
Date: Sat,  3 Oct 2026 00:14:32 +0500
Message-ID: <20261002191434.58529-8-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
References: <20261002191434.58529-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

status_show() and update_spm_state() use the state byte from firmware
to index 3-entry string arrays without a range check. A value above 2
indexes past the arrays, and the result is printed with %s by the
world-readable status and key_mechanism files.

For example, a state of 3 makes status treat whatever follows
spm_state_types[] as a string pointer.

Return -EIO for an out of range state.

Compile tested only.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 4d94e48c1..f0eb5c445 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -118,6 +118,9 @@ static ssize_t update_spm_state(void)
 	if (ret < 0)
 		return ret;
 
+	if (data.state >= ARRAY_SIZE(spm_mechanism_types))
+		return -EIO;
+
 	bioscfg_drv.spm_data.mechanism = data.state;
 	if (bioscfg_drv.spm_data.mechanism)
 		bioscfg_drv.spm_data.is_enabled = 1;
@@ -153,6 +156,9 @@ static ssize_t status_show(struct kobject *kobj, struct kobj_attribute
 	if (ret < 0)
 		return ret;
 
+	if (data.state >= ARRAY_SIZE(spm_state_types))
+		return -EIO;
+
 	/*
 	 * 'status' is a read-only file that returns ASCII text in
 	 * JSON format reporting the status information.
-- 
2.43.0

