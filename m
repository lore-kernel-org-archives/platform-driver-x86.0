Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461052;
	b=4k0J8LzHgGm68q4u3LXxbQezxIBVIF801ZnPRoSbjnFddn9ksbT073j+IU4HMOJruBSM
	 U9Ygz1elLly8Y+OpX0yDuZFw+vchjr7ooq6GwhiYWlEctaeEqxvjSbBVKE5iXgtrZNnd5
	 wjAJ2iBVBlJcM29K7Ax3LoQiXz8nHtKybA7tKOPnr3LVNFTzMC9+9wnXlvFZ+4L+R/XtF
	 4UOJ5NYRKzp/pow4Sb2lNzvVdEDoZY7j0EXWlTu6YqBeUI9jkZSH/2gm/JbjHl94TCNn+
	 i0pFd4nR+zqdz/78XaXXqIt/o+vJl743I2VnwASMYQIo3nL/ZgSfqRIwstxPBa6vRkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i9aUqDIrjTg11FxtvMxwLtqkPo8X0vvuUAjHwNJSvjA=;
	b=lHsJrChFpcTpisVF+htYJ9zzT1mVxsaQJM2Ex1ITWrPklwUrEUQu4LhKdd7ygfb9WCS8
	 bfkksqBTF3r4ooZa8Hxq/ONaHobfqLDzV1RhHYUqQYl1Wx7v4taOTnfzHNTVN++S78kRQ
	 UCFnRvwyBXns93ZlxlF20+sGxVSuvuYQM+K77GQtGlcELfna2VkeI3UDD/2Gwu4MKe5yH
	 79MQV9S9ubSurUq3rRxMQfVvyProUX2ocCOqetVi6tUhOZc3EMUqCSRMpY7cjKcVtppaX
	 dhnlKE2gaTqxI2PJCRIic8TXdk1Sd3u/9+T9g77HbaOspIKl+XCZtkyMDn8SPr9CBOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AdYzHh01;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E517606A319
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 01:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E517606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AdYzHh01
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35829219da8so354276eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 18:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461051; x=1793065851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9aUqDIrjTg11FxtvMxwLtqkPo8X0vvuUAjHwNJSvjA=;
        b=AdYzHh01iwEZTKTCiaHd7BEu8gwsPjXx+Nxxo1JWko+Itn8IDPOWk3XiFhlQCdhYZI
         q2diG58qoHBtwS1jzoxx+w4PnB+AP0OyK0uDULw0PzMzeMd6e3iiqOEOnQHIeFz1KFsE
         YGGUR6r8vlFky+5OQDSn2sONxbF9yOSZhavq5pDMsf+QqbN4Ntcx80Zut34DatuH1fqd
         NBKxz+1ReTirFCz1SF3vU5xDRUo8S+bdjIbzwTss+upaHqPlWRP1T+4LNp+s5l14lrE/
         opWIN85XDtdhqZz5UCJf2Gp06x0qBksA7joPd9WxHmZh/qLc1H/k5zm9ouxGG7DS9EJe
         wbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461051; x=1793065851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9aUqDIrjTg11FxtvMxwLtqkPo8X0vvuUAjHwNJSvjA=;
        b=F/Q+N6vzR3mgRZX6a5xe78a3GkBioSgWRiGfFSy7z31kxRQkOnEnjRwql9BgIrWRIg
         fNijZ3DzHUgsbe8h1moXT/Dtpmo3v6L1onFi2KOtRRZFC4eQ6dNRT1Mb/JNTruspSccE
         FMZ87Rybt2Gvdjl9a9gs0Ch6hebWzNIb4WcSoU/2vuNnD8VG98DILy9tRT3oAdAlNi6X
         GeRexHJImn9YpiCqr5OPQiHbH8HvGLw+KnErBb5Dl1J3gFIvoI/4QXbGNce9eCd3lc2t
         gmx/We6OUDLSLHhZ2RBQimyN3sAVV/abgbl8FtCAK5iKa/rSJhPWGRSJqczVnbZG4QZ6
         kmUw==
X-Forwarded-Encrypted: i=1; AKwUvByGxII9KdtqXl17hqABacQ3t6KxcELYLXvR2FjqP9WFU/8OA34xo7FYLoUry+npxB58p0FNK9S8Lp0B2MwwADiBxNFy@vger.kernel.org
X-Gm-Message-State: AFq9FYIiZ0s9POWhV7+FQ7iBJpd/XKg3WzGVt7p23guCbp3Vw87jG0nM
	jX1qHcoHBnN7302B89EcTP7fKoG1jL5n9KFKJIcbZXSX4bzrY+HUw2BT
X-Gm-Gg: AYBFou0IDoZxodVWsjRe/AHsX7WgH6KJ554pCUo+rPuZLb1LIIt2dHW2A0ifHGjcARz
	nHei10U9KK+LBXGRejUnQkpFrc9thCFPD+48V0JoUGWPxTvFMWKzfBeJKiKH8ShKn1ASRDK8JVE
	uLso2BrBVM95A/YqG753tA7J72wLpCx9yy5FGSFQQLqDfzO0ZiH3N7Sug/H9fDBC23GH0jyAMzA
	NXdJLA+iw3eRAf9JnGyQh3w2ygZQl1ePMhgbt0hhyMr7/BL9W9Sud4xlE+GiQeYbH44+YQEbtGU
	hn0boPgCkuW5XwaCj2+Iu063TqWQnAXbeO6vP2J2LNwP6Z+2qmmfyvXO/BHG/dzhcu+/cPvcell
	AHifEzU6r3TpQNaHPI3vpRFF6h98IC63/kI3CoKo3MOTqx8ZgI5fXabwoTZ6H3FymO5FVXnP18I
	4xOsqKDSQuAK7n+JaNQaas2mcmsCp4ZxUyZlbD6ZMhK7qEAZt6mJAZK0bAnr84MaWNG6xqSaMBt
	liQQBKvjysIguobfbekLqkKPMuky3erNA5/jHIO7Fl6WNBGYFUzAVSO
X-Received: by 2002:a05:701b:4244:10b0:181:6b8:31f1 with SMTP id a92af1059eb24-18dbf218557mr993067c88.10.1792461051185;
        Mon, 19 Oct 2026 18:50:51 -0700 (PDT)
Received: from duo.lan ([2001:fd8:f0db:3ee7:799b:69c2:e95b:f04e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm32684879c88.7.2026.10.19.18.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:50:50 -0700 (PDT)
From: Alexander Patrakov <patrakov@gmail.com>
To: johannes.goede@oss.qualcomm.com
Cc: adee.sahan@gmail.com,
	andy@kernel.org,
	antti.laakso@linux.intel.com,
	dan.scally@ideasonboard.com,
	diamondback@cohunt.app,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	Alexander Patrakov <patrakov@gmail.com>
Subject: [PATCH 2/3] media: i2c: ov5675: Defer the probe until the endpoint exists
Date: Tue, 20 Oct 2026 09:50:00 +0800
Message-ID: <20261020015001.15672-2-patrakov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020015001.15672-1-patrakov@gmail.com>
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ACPI systems the sensor's endpoint is a software node which ipu-bridge
creates when the IPU probes. Nothing orders that before the probe of the
sensor. If the sensor is first, there is no endpoint yet, parsing it
fails, and the probe fails for good: the camera is missing until the
next boot.

Return -EPROBE_DEFER when there is no endpoint, as ov2740, ov13b10 and,
since commit 437e1f6a9600 ("media: mt9m114: Return -EPROBE_DEFER if no
endpoint is found"), mt9m114 do.

This failure mode was seen once on a Lenovo Yoga Duet 7 13ITL6.
Reproduction efforts did not succeed.

Signed-off-by: Alexander Patrakov <patrakov@gmail.com>
---
 drivers/media/i2c/ov5675.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index c5eb07576129..9cf600c9c94a 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1182,8 +1182,16 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
 	if (!fwnode)
 		return -ENXIO;
 
+	/*
+	 * On ACPI systems the endpoint is a software node which ipu-bridge
+	 * creates when the IPU probes, which may be after this probe.
+	 */
 	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
+
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret)
-- 
2.56.0

