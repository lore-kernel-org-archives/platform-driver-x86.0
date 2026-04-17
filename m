Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD8035AC1C
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443594; cv=none; b=fHU9IVhPlKeNN4qGlpfzjvYVjjcYXaScDlK2zPBTonSHhK0xe6AxD2V7J2EsTFFS/P8Oqh8DoHUOeqsCkbHMWto2HThAGWEpwAXQQ6cED1xWGFnq2KAF64a3/+n0tmirIzvTMR+Gucwycg/e5ho8apdYgfYvR6c+xHoANysHbfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443594; c=relaxed/simple;
	bh=kn4gRyG2CWdohr2zODJVwJLXxsAV9GOcDFXCGFJSgyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wn/IZ9pmUm15xFnXYZPMbVc3f+3vfd7EA0027cbkVs/wigWNfL3SgQrVzER4dXM8DQNjdkLbkq5zOuTx+T8UKph/rqK+QLGcHSwRV4vI39auw+vFDzlN3tX4kYlZuUu5XCY4P/AsGR8PeW8htaORBK3Ro8vAp38sYq0FCv1YxLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI4ZnqQv; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI4ZnqQv"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c726f46baso1213065c88.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2026 09:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776443591; x=1777048391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=OI4ZnqQvk4HqR2AESBItxpSrJ/YpEMInHIvh3+chhzF8KH5mrlg0y8Ry1XhxHOQh0v
         htFB7gIy7nZJ3B8v4hcLlqMv5wfw+GWtg/x2pL2Wx4YlSDpRCR0zRZ9xc5G0RdrF0aLu
         RYctWM0n4P2H42vevycnOVnCQqVujaVWstwBkoqpupE3QSZucOIxbqMhkwTA4pn/+wRK
         TC9RyaGPTsfzhHgc5pcwALibvgKDmPUMY/hjyNJ3XVdv6OmzD/BvtuO6f6wXqWbJx7Mn
         kSOQepstaEbE6t1biJXjFD1XKSZ33w76wc+bzQpmd+lgFIjrFLrZgWyUWyBKtVyauA17
         s79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776443591; x=1777048391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=OMfELKTB7sW3Co+iOThsUsQmKaXwkdsKrbJjINXswWnFUqcEJaKz8s8xhEdJ0dy+e/
         FZIO74NCSX9LKevDkfR6wOak+tJ+sy3I4H8htyI+E9+oPl/hzLFu2kcIdpsRwPuAyUrK
         Y8ihKWiPmj7CpGSOP4Dfx+OpEr6WDZMXdqo1iw9V3NrJBpJHDW7jIi72jKPgjAMtN0TQ
         +7OHKCROVqwbV39K7y33UF6TXWUjVNXBEg1mUBll5pyXlGNBE6/p8Z1O7z5TEqnPKwGi
         4SqVaPGUgHJuJKFTubLLQh6O8jdIeyY6Te3qof0yGnJTJNQ18epDzf6tKvUPHMatKaCv
         zv/g==
X-Forwarded-Encrypted: i=1; AFNElJ8NpnBIorfJG5GI7zIvNkRqST5I1YZNGRxeOo4Jq0VbphKF1Eiaq9ZghUHz8HrNU6yLPW8MndbrSTJfa6jq84inCGg2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw5CRf6lAy4F9MWz25Ro/pZSMdwXTuepYrOvS2BZUILJ3mMScc
	umWQAHbKaQzb3DGTVpyJVv5cHzWijLgHtWQNgloiGduWaWIDW5S141OI
X-Gm-Gg: AeBDievDnw8MTPKONZU8zHUncgswgoJzIroOYM8lSy1O9BuLlNOgq0Z8Q2rbjU8QUwq
	znPQzBFvVIk32RlYcfPgf8GnPISpbucUIeS9ds080WM0Z1L+MZIWN/rVVPmSC28B/pTfVn0yk+a
	sp9OhCfzgfcjsF1OcG6tzad6/PjXPwFXmL5+431w6TK++yNFEUpnzFw664TWTm6iHZ820ErbVbD
	koxR3oRVsKsFKbR0Lstl6wm40BQXb67+irCTV6OhSOyPV718WK2XO/XqenrrPc2cp9ReuCGNHA+
	vMrQbL/ANQ7XjNQXtAIjLJL4XrS7oMAwoHhx5tHZpmJdBVNqlKjtRPYdeA0/WZD9C511H6Wju5U
	MjR79qxCUEdzlzWunTfIC+2ESGmcXJN96BPuqYCN+eOrw1mmlP2gqpJFT9N56kn0UGCMwJdZtTI
	OR+J9ClrCtT0GK4tdlWPzihHbvUEk50aOjmiZ30t9IfLq1bKgpeTvqYNhaUaRsk4QVbeEnnA==
X-Received: by 2002:a05:7022:3d87:b0:124:9fd8:4ba9 with SMTP id a92af1059eb24-12c73f6cd01mr1749321c88.12.1776443590684;
        Fri, 17 Apr 2026 09:33:10 -0700 (PDT)
Received: from TC-LAPTOP (23-93-157-142.fiber.dynamic.sonic.net. [23.93.157.142])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749dc86bsm3603777c88.8.2026.04.17.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 09:33:10 -0700 (PDT)
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
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v3 5/5] media: ov8858: add ACPI device ID INT3477 and vsio power supply
Date: Fri, 17 Apr 2026 09:32:52 -0700
Message-ID: <20260417163252.15603-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417163252.15603-1-tchatard@gmail.com>
References: <4ef5f305-0234-4193-a190-edbfe770ea04@kernel.org>
 <20260417163252.15603-1-tchatard@gmail.com>
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

On the Dell Latitude 5285 the OV8858 is powered through a TPS68470 PMIC.
The TPS68470 VSIO regulator controls the S_I2C_CTL register (0x43) which
enables I2C passthrough to the sensor. The board data for this machine
maps VSIO to the supply name "vsio" for INT3477. Add "vsio" to
ov8858_supply_names[] so the driver requests this regulator at probe time.

The existing supply array had a duplicate "dvdd" entry; replace it with
the new "vsio" entry and reorder to: avdd, dvdd, dovdd, vsio.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..5bfea237b 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -79,8 +79,9 @@
 
 static const char * const ov8858_supply_names[] = {
 	"avdd",		/* Analog power */
-	"dovdd",	/* Digital I/O power */
 	"dvdd",		/* Digital core power */
+	"dovdd",	/* Digital I/O power */
+	"vsio",		/* Secondary I2C / S_I2C_CTL enable */
 };
 
 struct regval {
@@ -1981,11 +1982,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
+	{ "INT3477" },
+	{ /* sentinel */ },
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
2.51.0

