Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE433515FD
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861798; cv=none; b=q4We6itN1JR2VyGmzpKEzPU/TQgHDTGXpU6O7PxdJ/ZDJUBu2r6NaBU17185LrRF/rIFoILGLFUphCNq917xtFroH8leiIfN+Q2bWmcj2D8qYU9ofnAC94/v6RGhBDtMZAlKmsRYTVlg01VnDtY6U8jnylNB0YDu4tJSu1B+0sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861798; c=relaxed/simple;
	bh=ot5s3z0y3WkGd23yN8si0am4L6kSSGA+LkIE6cUufHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KP/xmq/ke+6A5Bf6V7tUMzYgnxUx9CSTSdC4WA2Ll9LvdQjXg5o4ptsWtpOwogSePKqtAUs31fp7SIPAplmn8PcTd1VH85AhHXG9BMF5siPpvirY0PMi0aTrTZ2pH8Hytf6RAiztQNc5r+arWSHyPa6kIIMcKc+NDnEHGdWNC78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJUZwU2r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJUZwU2r"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b9320423cso81375e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861790; x=1788466590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+YYaj9hB2BEbjd6/AK9OJyefsLzkvfj7sSU25cg5Eo=;
        b=bJUZwU2rDJFnl8s3+d5K7JXhpl7Rz8mlCo+N+ONlPsz4N+dUHFnOPDrHRXOMhoZ3Ku
         shu0tGRol+sQ/hnauYN/dO31fnAB8O/PBdwu9bVZuWsETT9gkQDXrHAnIr5bTHk+l+6E
         5JZI61nkeloNejkd3Diz7Lf9AZf1NFCJ3JuOqDEaOjrkzL9YZcephkrteVgRlfoFNUeo
         qc/7o1WYIFLtIDTHGiQ9/9X1m7UJGAZDVD0iNyK1sjmblJtRKLTyyQGCJoqVwXjtmrxu
         ctu6eOS7psYfRv89pR64l9TTPnoAui+C8Zu0EtSgMg/4IinZ0zS2h5kpTdOD6PZXeUah
         flqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861790; x=1788466590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+YYaj9hB2BEbjd6/AK9OJyefsLzkvfj7sSU25cg5Eo=;
        b=Qf7sUQW+kJeqo3GJscSiJFRTeU+oD5YV2vQHT4ncjFv4nFQR2ILEMOG7zTmTprLGyd
         9C4zc1tptyhq0v/mC4Nelgyabhg0Us1l2TpyAtsoVaHagRJlwnOhG9TLFNULvs82fn8V
         D+fpoT9K6zQsqdRqGk+uKp4bna4FKvK5IVyxBtXx0UAGIx3oT/N3FOrAZsANQSjSQ7ya
         etPuDDChgGEl2t2uAtVn74uWPzyyKG9BsMd89mG3oJ2If7otfyTin8hirKi/goh1rOGZ
         4V6sZ8bP2/fAOknd3hYRSErb6srtKez8ikp8rgmQkPsdOJ+fVqMmBdp41GVxsNFLoBl2
         xcjw==
X-Forwarded-Encrypted: i=1; AHgh+Rod354vg8J5WMR5D7FHXHo39vNjdPFKh0w2K4lqCzfpEvQjDLevwMjWFBSEMTlTDkl0hmUA5CcajUIVrEBmMcxlWgqi@vger.kernel.org
X-Gm-Message-State: AFuF++lZ0oIfdOvJsXcn5Ql79+WWkxHBpsQmNk6CwCKnsTeTP9I4RXor
	PpQ4W/CYTlzoBcY5Q+r6iWP2b5E4VZ08WDjXLLgdihD2CZ+PwRqqqgkL
X-Gm-Gg: AR+sD10MOLeq2PgICUMHVS3lJJnNveW4RqnS2+yUTcMWtC6U4hMypYtol2gdKmuIgwq
	5TNuNSNgtZ1v9voAgeIrM9UGdLkpNprHKqeHOEoKlVfe/V7O/BGN1SNTWWDS03V32hNXA0v6Ujw
	qDEKk4b+6oEY/6MrjnRIE33lrs7ZR7NyALy+Ci8GSb94ouzGIbchlFAnftCCwiP0Aj5jv1IpWmh
	/177J3tY6ZRirAeO9vHeGvGALqT4p35ZrUt5uxrbZorn/g2NoCxJ6xxXfrCkvqdO5m2aavWVM/z
	pQuc4s+aNRv3uUAxeBYTnnn7/jzk/S5aBztB1NmqjXZDfwCpRDkbofDO9HWOQPMDp2C+Gdw3QfO
	EFkIUEuJVZkJjo9zPbqTGj5vufi8nVv6Jybuysd4ciWKlURXmlYp5GxrcLXEw7sXmm8uCRrm7e9
	Y/oPc8tvhu1UOxi5F9CMCFgalgV8S1Ubqan0qU8VafNmbac3ELvdI9RZUtnLG6C/tqhDZ9
X-Received: by 2002:a05:600c:6215:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-49b91c1d5f4mr21884975e9.3.1787861790049;
        Thu, 27 Aug 2026 13:16:30 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:29 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v9 6/6] media: ov8858: add ACPI device ID INT3477
Date: Thu, 27 Aug 2026 22:16:11 +0200
Message-ID: <20260827201611.99825-7-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827201611.99825-1-tchatard@gmail.com>
References: <20260827201611.99825-1-tchatard@gmail.com>
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

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..f0148c1f2 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
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
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

