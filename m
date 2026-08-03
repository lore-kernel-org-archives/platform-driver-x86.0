Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982784052DC
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767470; cv=none; b=fACDPekatqRSTVx/pmD7NK+JpuTKjy0gFqarAx7uiY4K35rtWfI9MjaOPjD8dY92hBNwmExYgmpGfQR2iOTG0EL/etoSC2mFi0x1NMDWq0w3vHasGPbgdozc78T/QgMqxowfXaDPaOOFUwkyMNkfrhCQkYix+diSxtr36mWxX9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767470; c=relaxed/simple;
	bh=rhV+qOT/cedymAeQ3DQaL+LQcUHG8piPrtIkVunzAvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V19TagNBNBorUcv2AZuWHuVR+Wr8brjyu2e92pN1WtfTXq1nvZMEMJBmUWpGWewiwPj9Rnt6ROTi6x+Bx0qTQsR09yCliA9Y3EDRjiGSi5wayQigCycdhZAuKjYYyfmikp5R6tK4cY0n2lKhObmQ6hzOcVXyMZda1uI6MRC/8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ocRj+FK3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ocRj+FK3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b966dd74so11944685e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767466; x=1786372266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNoDrCXm49lLgm2lL6InxDz3MAxyPtaZVFbbdYtrWx4=;
        b=ocRj+FK3AEnX5Nld63RlI6N4AAoJhPXAfs9T8hZzjcSB4Pg+8YvHdN3TlCqC81jakX
         t3K6esULZ6+xtHsvrj8pVijO08HSBDe4bypRRFAFw3zH9BP2uVR7suvdkbpEHEujmt+n
         fwYGlNrpwG0UMHd6rUSAW1VnIWXYHVO4/GM8S+xGtQKvDJ56VPTRB1jyQuDZFZoJf3DO
         5AoOoFZAndWSDH5bpGeAkGKeF2jYHUGRYOXcWISc3eD9I58uTTiKXBa28cfENLd1HWkU
         OJ4nUmC4zrqNDaNdWQ4GX6f7nkRcgkhJrnyWUnMoyHht+0dMhcN9uj5PuRJdAH91LZCK
         0h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767466; x=1786372266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNoDrCXm49lLgm2lL6InxDz3MAxyPtaZVFbbdYtrWx4=;
        b=fkDuBReqbUkP/NPZjh4xBs7yPfozCo+Vg9Wut28E0KUH3x2t1yat9qTvzicMVZJqW/
         sFSjmKXeBEco6M911bTfQIjJUaKLvT8dzkbH/Z3zB8teXwm48iDBI4Wbdb04xpHWq3VY
         6YzryEnlW6pCGt1C/ZZZZqLiZYG/8Q66040g1P564YZa8iyROJTav9Rb1RI3UqMGc5G8
         4bTioKizXZFvQoLCyV435qiX0o3F56QtSfC6YGG2Ov6wMK56I64V3S+INEiHWzHOjEgl
         lB0n2x5znVMzMRVg6h9u4yNiLj0ZoLwhHSTZh98xUblpbx/KLsx2lnrIC9LrP8rF1LOk
         vY5w==
X-Gm-Message-State: AOJu0YzEAqE3kAsFNBi7ljVho+8ejf2jp5ajCxJq1JCyJ3QGNJSu5vEB
	38zVa18P2Nbi+hCQihK4WrQLh/KJMH1QclTexxNcvrV6Qeean76RUDm+QPxYrdxFWbA=
X-Gm-Gg: AR+sD11re+WOpnGbk/ymNNHYlXovRyiNiAPTEncFlRlkf3xsqsPHJOtsDXRZnlipvcf
	+NiAB1vjEc8sx0qOvDCdOe1mSj74K7pVFgVb/LkJH5ZD/vaED8lM3/tpBZAhxYoGKWLYkrBgO0m
	NyWXet6pStfVlAOp8dzB2w8hJFi+kHtK9BCg3RYMWvY+CLu51ctppsmffEVRX+BrBHOel7ZiTQL
	S9LRrtV1RRKPcIQkKWuk96GOvKTHAcxEsS+3RCkyFEMBMcZFTY61azyOFCShDqpaAHyq6E1XwHh
	rzoQ+hBhSAdYhkOkWpATva4dHB3msMlTl/HGA9D9QWOwEkzwKqCSZEb8ItLg0OsSEOVQC1gbl9i
	+MQkwkB03IMVvZ9HUJ2/S4nTUtDuLjw8NGh0ghtg9wRqTKg7pn2WUMRDAIdFVn69TXSXp7djxSK
	60PVDuWwMca4ZH2+Y3rERsLKebsvnd4s+jfCOmfO+IDjqL844yQcenKSI169RspsEy81sCSDcI/
	7O5/Ieg2a/bchHKOjEKNbidc9fni5ViB0QZIMJL4w==
X-Received: by 2002:a05:600d:8443:20b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4980c6562c5mr183910265e9.16.1785767466371;
        Mon, 03 Aug 2026 07:31:06 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:31:05 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 06/13] platform/x86: hp-bioscfg: add missing bounds check in PSWD_ENCODINGS loop
Date: Mon,  3 Aug 2026 19:30:29 +0500
Message-ID: <20260803143037.93105-7-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803143037.93105-1-meatuni001@gmail.com>
References: <20260803143037.93105-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PREREQUISITES loop earlier in the same function checks
"elem + reqs" against password_obj_count before indexing the ACPI
package element array:

	if (elem + reqs >= password_obj_count) {
		pr_err("Error elem-objects package is too small\n");
		return -EINVAL;
	}

The PSWD_ENCODINGS loop performs the identical indexing pattern,
password_obj[elem + pos_values], with no equivalent check, causing an
out-of-bounds read of the package element array whenever
encodings_size is larger than the number of elements actually present.

Fix by adding the same bounds check, matching PREREQUISITES.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 86fa03a5ee9a..acb123985ede 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -351,6 +351,11 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 		case PSWD_ENCODINGS:
 			size = min_t(u32, password_data->encodings_size, MAX_ENCODINGS_SIZE);
 			for (pos_values = 0; pos_values < size; pos_values++) {
+				if (elem + pos_values >= password_obj_count) {
+					pr_err("Error elem-objects package is too small\n");
+					return -EINVAL;
+				}
+
 				ret = hp_convert_hexstr_to_str(password_obj[elem + pos_values].string.pointer,
 							       password_obj[elem + pos_values].string.length,
 							       &str_value, &value_len);
-- 
2.55.0

