Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3627A3033D6
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Aug 2026 04:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786249623; cv=none; b=DHoKZKsEu1s1QZwTJzk5/q5cs0MM5+GvQIsQ318odiAj+rBwPn957/px704tCwYSudLZaiKwp1I7//cqnD83f6kt26kNG/SpcAYm9rQ8Mh/i7xM4YXOH2dD1+d5c87Df0kLVHpkAL4QIeLLxVGcwkkZ4ssH9N93/UnI/6P7FY/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786249623; c=relaxed/simple;
	bh=cEHlWZML2ga4aWj1RY2I55GP/wsvqEDgh9jmkMn/Q34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgvW3GKFpiqvp0OQPPEZOQUVu49WixPTJo+PU+E9lUTj92HN3YVps27/upFtXIun4fE6W1eDVz//xS1nz8Yo0v4DCAi2AZXuqGHTeCN1n4W/hhx5CLJngxS78GlazbrRNF0Y4F6iNpOup16WhwTNmFjPzzjSM8pQhNyiNRC7us0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sN5zvBQ4; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sN5zvBQ4"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cab973140bso11451165ad.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 Aug 2026 21:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786249621; x=1786854421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hq8Gl8becy/WF/DMiRZlVep4ksVkXKkaPmZC8U6R6nM=;
        b=sN5zvBQ4TKB1JLgmbBzzG96z44kOPKrjOXI7JOlHWb8X2wZAvvMLn7jnrjVEwaJnO6
         QTaiOgIMUUXq+OLdUgRUAi/Be6clY9forJiC2aN7v9UlOoM4Fyg1V0/ouwdY1PLMvaOO
         R4ZC9U9fGSmjaMuT5KjgOnfu/jE4nox4BOcwzA7dbytO9T1KCi/VhrAi80X/3lX2O8KX
         tWsQzCB+HIDqFR4mrZclj+uMJBYaXjxeSTK2/gUmkeyUEfsrP8fZqsq7dc6bGRcsYPxY
         rGtW5PMtJUgPPeEMB5Y602FGL8X3tnGB8PmT5QoJOJff7xI743izvE5qO7TMDHKw9ag8
         GhDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786249621; x=1786854421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hq8Gl8becy/WF/DMiRZlVep4ksVkXKkaPmZC8U6R6nM=;
        b=db+qlPJz4x8Wlz7ObksgrVzABAGaOaymgGhdBnuGfvSE10YgGgAy7IKEch74ITABbJ
         v/ZdOwkm31nZ5aCZQVq5MYg9glwL/XjzSb8YllrrsG3MNOR0uvASui2ERYD7jWniTlY9
         MYVEkcyw8UZbHB6lq4orZnAWauWNNcXOpjF+Sqh2fN2zGDClDb5E0Jue0Wjv3STPzuWS
         A5Oc1eNRvf9vGm2UguLk5NNexu8dh/BLBDce5xcq6n4W07WDZ/bXj1TdwfvWnXIIEy5o
         WP/lB2PA4Bawcd+LmaYg8p4os6gv5cnkeofjmk4+qjF6epcP9+TxIHdqKb6ySwuItcTw
         Jmkg==
X-Gm-Message-State: AOJu0Yxumfw0XrWBEmLozm7IYgAnTMGvOuTiPbth0j1LRUtUtqXyOnEA
	4YNgl1QkQpuwSAUffTjfVmQI6J5/C9esPTtIT2V3WMN4BBhxOumFhKXS8Rzj86mK
X-Gm-Gg: AR+sD11D5XhfOMS5Cb9qVTMVr2k+JrfS48JsoxnEqcJPFuQKrzvkpYRGi6UXV+BzF+Z
	MzJ/di8E8SUL4gKCRkpsTa/W+piAfbC9EiagrEKEeH3wNgd3K9rsxB2syAt47HcqwIHCtlrtgAh
	sNpSjIA2QuK074HLc08qT5HzZGB1Vp20iOf0Qhshj1T01w//0eOLSGKImEesTuWn6oR7dFhSSHJ
	0rb3bszkX8+W93NTg33h5kXZPd9Gm3zMFJdGQmdeX9KSWHQ9YWOvk+AA2r1l2EpHBoMTHpd52hm
	xUZOONfY+qamdpp6ukvQrg1eRtyxKPuL2PiPU036RAq95Zd9tAG42mKfltUuKPHVqY26T67c7D7
	lc90g2cEzH6XzxmZQ+8iZJ/LVv7Eociltnb24Y4jU2tve4qjnMBptN4EtTFr9BX1uxxx4JACNe+
	8a5t9WMTzD6lV9JhsP9Bpg94rhYRRc/uqGNu/f56nx6IpBUo3JROP5T5fR1HlRBjV8N4omcx+BD
	XXgw0TqZHoYABQimC8V0an9Zze55bDbgOWBnDL6iue8MgxyWPZq
X-Received: by 2002:a05:6a21:4d8c:b0:3b4:75c0:3ec0 with SMTP id adf61e73a8af0-3cbce94fef7mr12969462637.30.1786249621385;
        Sat, 08 Aug 2026 21:27:01 -0700 (PDT)
Received: from prof-g-y-land-Latitude-7320-Detachable (121-45-161-118.tpgi.com.au. [121.45.161.118])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199cf49sm21659516c88.3.2026.08.08.21.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 21:27:00 -0700 (PDT)
From: Sahan Nissanka <adee.sahan@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: ov5675: Add OVTI5678 ACPI id
Date: Sun,  9 Aug 2026 14:25:18 +1000
Message-ID: <20260809042540.15849-3-adee.sahan@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809042540.15849-1-adee.sahan@gmail.com>
References: <20260809042540.15849-1-adee.sahan@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The front camera of the Dell Latitude 7320 Detachable is described in
ACPI as OVTI5678, and no driver has ever claimed that id. It reports
chip id 0x005675 at register 0x300a, which is what
ov5675_identify_module() expects, and it streams with this driver
unmodified:

  ov5675 i2c-OVTI5678:00: chip id at 0x300a reads 0x005675
    reg 0x300a = 0x00  reg 0x300b = 0x56  reg 0x300c = 0x75

The two other values this driver is sensitive to were read from the
machine's ACPI SSDB before the sensor was ever powered, and both agree:
L0NL = 2 data lanes (OV5675_DATA_LANES) and L0CK = 19200000 Hz
(OV5675_XVCLK_19_2). Native resolution matches at 2592x1944.

With this id added the sensor binds and streams: libcamera lists it and
capture runs at 2584x1944, 29.95 fps.

This part is not a plain Bayer sensor, however, and the format this
driver declares for it is inaccurate. It carries a 4x4 RGB-IR colour
filter array, one pixel in four being infrared:

    G I G I
    R G B G
    G I G I
    B G R G

Confirmed three ways. Intel's Windows IPU6 configuration for this exact
module - matched by ACPI _DDN, so not a near relative - declares
bayer_order="GIGI_RGBG_GIGI_BGRG" and sensor_type="RGB_IR". Measured on
the sensor at full resolution, positions a 2x2 model treats as a single
channel differ by 18% while the four infrared positions agree to 0.4%.
And the module's Intel tuning data carries a 4x4 channel index map that
agrees with both.

Read as the SGRBG10 declared here, the "blue" channel is pure infrared
and the "red" channel interleaves real red with real blue, so colour is
wrong in a way no white balance can correct.

This cannot be fixed in this driver: there is no RGB-IR media bus code
in the V4L2 ABI. Nor is it unique to this part - ox05b1s declares
SGRBG10 for an RGB-IR sensor of the same class and resolution. I intend
to propose RGB-IR media bus codes separately. Until such support
exists, this patch makes otherwise unusable hardware work, carrying the
same known inaccuracy as the existing RGB-IR sensor support.

One further note for anyone building on this: the sensor's binned
1296x972 mode averages infrared pixels together with colour ones, which
destroys the mosaic. Only the full resolution mode is meaningful for an
RGB-IR aware pipeline.

Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
---
 drivers/media/i2c/ov5675.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index ea26df3..99dbf53 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1355,6 +1355,17 @@ static const struct dev_pm_ops ov5675_pm_ops = {
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov5675_acpi_ids[] = {
 	{"OVTI5675"},
+	/*
+	 * The front sensor of the Dell Latitude 7320 Detachable is described
+	 * as OVTI5678 in ACPI, but the part reports chip id 0x005675 and its
+	 * SSDB agrees with this driver on both other values that matter:
+	 * 2 CSI-2 data lanes and a 19.2 MHz external clock.
+	 *
+	 * Note this variant carries a 4x4 RGB-IR colour filter array, not the
+	 * 2x2 Bayer declared here, so colour is incorrect. There is currently
+	 * no RGB-IR media bus code to declare instead.
+	 */
+	{"OVTI5678"},
 	{}
 };
 
-- 
2.53.0

