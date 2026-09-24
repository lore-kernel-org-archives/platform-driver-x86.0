Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA0C40F749
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 17:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270383; cv=none; b=rm3IPX5aOzhFHdIE82WFnQHTtHkTGTtGEK7rfgQ2CflGsKDGxMlnhOuKp4+Btnh8L9Ue9kutZSEwwLsJ/JsRJ5K3P8kgP/oZLmxsHxaQqMqTWQWD3mvDgaUKjIXKm7dqtE2ek31dCItmPvlseldG48HSMhumOL9ZNj9aD2Ov5gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270383; c=relaxed/simple;
	bh=450tFLg7EnOAPR2yDMHJYBlANAdWJqaRzrSNWvypPRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBgyBLfgo/EQlQSa/tP6ppv2M/eyM5yQN7uxEpzDhvjQZEbAeR3yY/U6LDQN+vFVv+RJjgz2pfcwV/gYYMVYbS6xKY4JKYYuwqV4EaX+D+jZAK97fskHTDrQ7mYLcfTV/rtI6qL6zPPYOV/+2t8SOxJjPxPS3JZegu4zjO5fKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMejTjHW; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMejTjHW"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6124046f0so21563131fa.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270379; x=1790875179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdnRArbPWf99f27wgWWClhvY6JdJmK7JETplDExRxWg=;
        b=aMejTjHW8oOq/UnY2pD6qAL+vM/0nT0CxS6Ov7iOSBok9G9EqggD3VFljlfAilvsG8
         a3yntY8cahIE8urV0FN1gjnn5zJCzX2ZDt9JAZoB54wVA6xcxLQ43n9QSXI9hCOLLeaq
         QWNmov9Vb6oZUeH5eYZIGGdLjDoKGvBSQA39kzFxWpWk83Wvrnoxe4W+dDUQbZBfTvan
         Y3eTwNO4FF6obcgk180YyXHY8DdoqfVl8Yp01r/MKrVPhJOrCiy4sqw1AyjD79/u1eV7
         uYPsVEIA9yh7M/QOmzKFgJtZC/iY6rlqxNrGCIqkcvDemAhdOGdAQMMsyJSSwFwpSCTY
         iVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270379; x=1790875179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdnRArbPWf99f27wgWWClhvY6JdJmK7JETplDExRxWg=;
        b=G+tyQ7Cik1qHWOs71N7IEOtXK4zndj1Wr1Txj4vl+9CIdngchRUilYE6LjRyjELXeN
         cgDEa4Zgjb44oGaWEp2KkhT8rAg/X6NLbMFw/YpUbQGa+bqFn2NtdRdOEz8HyrOE/RbM
         2sBJEHOT+Q4MRrDk/UMfjtQVXGcBLm0stbi26at/EiDOiucauLDvXRay+PpctlN0Miw1
         vLLH0eFJsETGCm+QlGldecrELHecBswTmDGgxL7mJb/e+kHeSizO0YD0nHOvMfSSqB+Q
         Ea2k/hkfuuwgX0iL4fHzQfnqZ/S8yZ47CFAvw/icl0nyh/bAb+AW7zwCJy+W9XMsGo+G
         GSvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxksN5o5Ft0sawwmisBFpMyKu9X2EtdrtL7bx8Rnu/SF/EC9gxEIcShjirp8SMiFIETFVpugwm+lagJrZiHUlnKto4s@vger.kernel.org
X-Gm-Message-State: AFuF++ngG6tt7bhTtobqtKnZw9f1ZRewE7pQ5Kq3hj78AxbkbIznqvB7
	IOPair6v+kaxHEP5JItdntLe5DKmsUpHHjtsWD8XPMVheeupZDzUtjp7
X-Gm-Gg: AYBFou3ul8eFxzI15hoAcOaLxzyRWAps2Ua/J/8d25iJYK5JkTUYED6ld8g/Q1R7dCz
	0BNX6OzVbpZem68poLRoiCfzjup4R4fJWAitw6pSXFu1xYXGhtSv8G1gOmRs07dc6G5urFdagWe
	zazAO6d9uu3ggOT8KfhGAygHxDHIq0GobUXqWdelfJ4b1/Ep0xCC5nX2RxiBlb5TGDrNZr3Wi93
	wkj8UR+ypDSjyiUmHns5G2vaEKvZMn6uuX0rv5Plqm/Lo0Y9G6lEw1SdD4lCi/z3TXYr+yGeYno
	D+lkNVtt6XiwImKFuo1f7DV9aR6HNT6Nar87R6Q6pxrdYfcqZWPoUZejIkFsF+sb2ZQHsMEMawm
	LFqDQPeze9Jca0IJihorDCyUpZT7l9QbW2g7NX71fec/fbGI/cHdVwIdnZBA+pI9VEhnzMpxEM1
	2R1NmEaUhs7xupt2pWoP/MkP+M1qENKrGYEzAUKSg02PcGhbt7gGTVsDNJfBdD55HsyIs6dA1P1
	FjH9TEukOtEds4=
X-Received: by 2002:a05:651c:554:b0:3a5:e792:2dc7 with SMTP id 38308e7fff4ca-3a63c0e07demr8418331fa.15.1790270379301;
        Thu, 24 Sep 2026 10:19:39 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:19:38 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 3/4] media: i2c: vd55g1: Add ACPI support for the Lenovo TBE20A1 HID
Date: Thu, 24 Sep 2026 20:18:19 +0300
Message-ID: <20260924171820.1179823-4-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924171820.1179823-1-koreev.r@gmail.com>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IR camera of the Lenovo ThinkPad X1 Carbon Gen 14 is an ST VD55G1
enumerated by ACPI as TBE20A1, connected to the Intel IPU7 with one
CSI-2 lane and powered through an INT3472 discrete device. Match the
HID and take the sensor version from the match data, as for OF. Only
the analog supply is switchable on this platform; vcore and vddio are
always on and fall back to dummy regulators.

On these platforms the CSI-2 endpoint is a software node that
ipu-bridge attaches to the sensor device when the IPU driver probes,
which can happen after the sensor driver has been bound. Defer probing
instead of failing when there is no endpoint yet, as the other sensor
drivers used with the IPU bridge do and as v4l2_fwnode_endpoint_parse()
itself does for a missing endpoint.

Tested on a ThinkPad X1 Carbon Gen 14 (Core Ultra X7 358H, IPU7),
streaming 804x704 through libcamera.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 6f458f611..64889c35d 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1903,10 +1903,9 @@ static int vd55g1_parse_dt(struct vd55g1 *sensor)
 
 	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(sensor->dev),
 						   0, 0, 0);
-	if (!endpoint) {
-		dev_err(sensor->dev, "Endpoint node not found\n");
-		return -EINVAL;
-	}
+	if (!endpoint)
+		return dev_err_probe(sensor->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = vd55g1_check_csi_conf(sensor, endpoint);
 	fwnode_handle_put(endpoint);
@@ -2084,6 +2083,13 @@ static const struct of_device_id vd55g1_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
 
+static const struct acpi_device_id vd55g1_acpi_ids[] = {
+	/* Lenovo ThinkPad X1 Carbon Gen 14 IR camera, Intel IPU7 */
+	{ "TBE20A1", (kernel_ulong_t)&vd55g1_versions[0] },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, vd55g1_acpi_ids);
+
 static const struct dev_pm_ops vd55g1_pm_ops = {
 	SET_RUNTIME_PM_OPS(vd55g1_power_off, vd55g1_power_on, NULL)
 };
@@ -2092,6 +2098,7 @@ static struct i2c_driver vd55g1_i2c_driver = {
 	.driver = {
 		.name  = "vd55g1",
 		.of_match_table = vd55g1_dt_ids,
+		.acpi_match_table = vd55g1_acpi_ids,
 		.pm = &vd55g1_pm_ops,
 	},
 	.probe = vd55g1_probe,
-- 
2.55.0

