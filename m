Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC533AC0EC
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978748; cv=none; b=bl/KG6Rxt0dA3cdN+DPaUEREjULD4AjncJc236giqXJM5PCE7FSapQjfQOtEqaXD5Aiexu3ep7nb+iAWL7QQpFhK2YBcWqWE1bQBq7xo+dHr6OW+zfVWpXhUN+9moV69E9MRgMyAZ5aCSGVj+8Rpzp1UQm/8S+yrx5FTUE74wus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978748; c=relaxed/simple;
	bh=01XW4uC/sGdUHWiw99Nd7VE9u7bEzoXNo4QNFV8NZy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNAEW+x7USH4OvEqT34nKxf4oLv2Utoh0T02FbSkoGPy8tcqIShYf62MuPrIddy9bMIPruNP6viFNgD40c1BifAYMnZ6KeAKmgLO2cqC593/rvRotWomCMXviSFX+Mb0q9h98OvqEq+B0qR94UbyhdKWCbjYjC4+iGNbjqJjNhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+vyULPE; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+vyULPE"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2d9fdf798so275845ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 15:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790978746; x=1791583546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j8/HFUWluZhijz+URCNd+7IiH1oTyp6nTgJbUzgXg/4=;
        b=c+vyULPEsPxrvz8hR4E+VQD/8I0rPSXCXN4LKlUxvkqvkFSAk0DvwC8mmkMHnQUZVy
         2v9FjRbeS5vmn0SAc51K+IilUvF/B5jBfinZl0DReiWiqUW/vHfSZXeWUhcqC3eqTkZB
         h0/CBOKpdRrc1lDZt+4yHbKiT757G1W39NF/BNkGqB62FkAgzJAvQcgtx4tikO5yced7
         B6Psxcuo7W3uzlPEyxNMdeDLeBNoxslMitR7g1vFHSDsySkd58W5ns5XNZeF004vfjW5
         QMmyPu9nLI7aGnv8mlhWSh3PL4yosVvxSmgJRWPUstD215BPBQ3SIXL3XsxNj6BPS/81
         JSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978746; x=1791583546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j8/HFUWluZhijz+URCNd+7IiH1oTyp6nTgJbUzgXg/4=;
        b=acowbCamqmyRjNfwKu6qj1sA0sQw4dgFJfU4G5NbCX6MNZ7murjDMBnMu4d1oJ6KLw
         fEsUthYRGUQe27/PHt6xx/e+FYpC2/JDfsb8W3BaY6RrsyXd08cWjn0qMRJcNlrAUH4S
         Owy0tUjmBPFOBw4tkZAjpaYGsZAnTqOE1aDe378hyxFzVLkfyOtFChsvD2R5hqd9tmZ3
         eVbB0NOHgz26GCMmvimYSRIrGaonnBPyLcFyqfwEF4UAuCYu75FZr8kpWKMQREFjBjyi
         1nrBPW6Bfb0n8o8MG0FrS84JxOlc1b6Kiit89ruKlHRbgu9IcL7LfztgYxzCcfQKyO/2
         CmJQ==
X-Gm-Message-State: AFq9FYJImwZu5o0Tl3/XdaoeONskOdZXM6V1no+2fiECsgzlpGPvRLrt
	MSO49QvxPKi6bEZkC8Rbgt8a8SSkA5ZPUuPQoNbjsgTwh6cj/VFBLx64
X-Gm-Gg: AYBFou2fMhfiAKciq0PnBZu5GklyyLomC0+qlij8GS4OSeA3DxC5XEhSdPGRbq4vKe0
	qjIkC7RV+FBjS0ATgYcqbTOEXPDSlQf3N8LS6F9ToTLg/91wzRGvRCTtCWZpNXzbeG0+bcF5aR5
	7amx6Iy9fVWll3NUIgTg8a1irT0A5nSUGQfeMm0bfXqObflxujqxUyquqdosDIsEWSCtbbgXQhS
	d/AmL8c1dR7j12t7DFrDeD+NKe50/32g8b4m9/gv05u1rOTOqhlNlwd6rN/POjztzirQZSCypyh
	FCv6Nu4Y8bFlW64O9db1cM7EVfZC5fXe4rEgIhtGcIs15SmPaNMccDd3L5h4rq+7EpzQPRDCZuE
	GzD/PL4AVdFftjY/2vFQ/pfhfJO2qtZ8oTEbkb6uOQHF6HMdfra+WLCPIRRdTDzN+ft7GBovP59
	n2b7s7ZAtG0CYkcNZ+HsSuOC3ohBmJ0tjOuZn3M6CmiF1y2NJcUrIe2gENVPmFaIZHT7U=
X-Received: by 2002:a17:902:f607:b0:2df:9556:6847 with SMTP id d9443c01a7336-2e49b7ff04emr31434085ad.70.1790978745585;
        Fri, 02 Oct 2026 15:05:45 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ad1a9sm12324835ad.43.2026.10.02.15.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 15:05:45 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 9/9] media: ov8858: add ACPI device ID INT3477
Date: Fri,  2 Oct 2026 15:05:40 -0700
Message-ID: <20261002220540.1271601-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Assisted-by: LLM
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..d106cad6f 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -7,6 +7,7 @@
 
 #include <linux/unaligned.h>
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -1981,11 +1982,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] __maybe_unused = {
+	{ .id = "INT3477" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_ids),
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

