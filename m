Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E963C5536
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743574; cv=none; b=QDvpBCaR9iSFx54O8vALavh6LYAX1xAf5WPp9FxbgKqVm2NMPhzCF/gp6MtJtfFNrVaEPfKc5gDdfFMvUnO/H9hYbLC0xzMG48KjoixqXCVnsWQl1BLxTkLpfH3/nr+F/9MewQb+tT9cX/DsI+ZskGgqGH4ImdVRLmhYiZCHufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743574; c=relaxed/simple;
	bh=R0aukX/zIQ2bEID3vNXnke9so/nvJk7DHA7cnmMxUGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJkaE4l56GjFbtRArKysmjARpTiEJ4+tiZfgK5oCsMDAHK0sj68MJAmHshY+ZD9No94VK3bNB2GSgvLjgkstsDC9mcgP52N2yCIEgG1k/h+aWid1YKM9ritHKW/zmo9iNPJiGnvUz5e5ty+W8TaqmGstDMAVf20GWtzEOq/Vrr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvuG5iDI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvuG5iDI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482ddbc11aaso632569f8f.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 04:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743570; x=1788348370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vggLaey4qEZ0y/Rj4gMOUvoOiUc7EX9K2/SF4mvODwc=;
        b=KvuG5iDI/OJ/mQEl2OP2/meX4tclRBiXeaMMxgFWHCrJVfptQmdce3VtI3kV7ptA7r
         hewHDnsVYHZJs22zdmo3HCUtIsyG6qTAGeBE5HkV8hKwVHahaDne12HxjpnGBA+ZdAWe
         bIS6JLQtaa8rbROxeg8Ih+76Rgezu0IUZgyH6AQapOz7BSoeP1UC2LndN8clDCZ1MxOj
         jy4h1eheK2cR3HR3FLNHXSASqU+Gu4007hcXJw8SWqlwfgS333c9g9XJPPhNx+fXHQdQ
         2GMF5h6KNa/zRiGDA4QIWaLZFywrn/5SYjg4u7nHeCpZyGii2cmEtnKAGYgg8QKkKg4o
         bj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743570; x=1788348370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vggLaey4qEZ0y/Rj4gMOUvoOiUc7EX9K2/SF4mvODwc=;
        b=Y8dYhHKRCEujuu2PATY7546CKTtgnKrI2xzSBTwG85F8pGLDukxBRAQDlD044VXKWX
         vKh6kNFYQRihoA33aqShdnUV5+MTY1SBdZWBffBLZNLezxsOjM2Hbpe/cFeAxkrcn3xx
         Hfag4368EnIvgJAnzb/7ASkyw/Tp6PspSDFFEnyYjJV6/t9o1vAh/OmPwo/N97TrHlPS
         aoPG7LA18Xxn/QBxpVI6Xi6XJ0VAKro1g0wbUHMnpXSDzbDPcUePv7ICFXjeKPuy8vix
         7uJokJ7ihF4pBRPHGxxk7Ec3gb/QruC61o5x4J/Z8RM9z209JWXMVxf7WxbyEFBnimV2
         SApw==
X-Forwarded-Encrypted: i=1; AHgh+RqRE3yLU+C3sJhYnBi9kGoB7TvQVgzVj9HURlbA8lIF2fvlZc5QsiODDWlP/QI9WFRZBXm4Iw3/pf9qUEV6TPLob9Ar@vger.kernel.org
X-Gm-Message-State: AFuF++ke4QbaZ3SlBAjKobwwctB4sNeUpjfgao19Uti1aRi58BxyIzcx
	pxx/MIUGxxbbBvFZW3Cv+1HLaRjhnwtmSE17K7KCySNpg/cgm7ENrWaT
X-Gm-Gg: AR+sD130rSqpfK2MGcQ+it/MOYZG2fCFgbKsrVNPV/kpZdj6R2yTRaI0DDp1ptPTuMz
	xBms8EOkG/JW94vOk+qRFI+peI++41etwEDDT/I4LBRBo+zwO36onc5PU/ibG2QYZ6TzyXRAvem
	Y0AMFu0EKPLi1iq/PrbY/t7rgy98Hdk2hbjnOYdFVapBammpfOFgUDIVfvCixOOVVu8UvOoHAzR
	DVgKi3Fk/mzuSK5TSGogosj1i+WhhkPKtQqlBuG/f2jdyF8qfBCdb1CPIfg+UuWqtuNRZCuAvrL
	SZKNajk0hgYZW2pp/HHCL0QxFXSwrKgrmZXwQXofF+kv6u6lI/y5kZqXObDguVJ1/W6Jqp57lzb
	9odMlCZRsEq2I4WkMB2gdyhwNyOhWmsPdHB61XJEoinm0D38IbQOySb4sIj88eakiNAdZX6tO0p
	u1kBgn5QAP1vYcUjovxRxY2B+bSJC/t1TrUJHRCcBSy++UwOOzwwK6ayLo4Q==
X-Received: by 2002:a5d:5e01:0:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-482e26ed76dmr6833931f8f.16.1787743569734;
        Wed, 26 Aug 2026 04:26:09 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:6b23:b1a3:f913:3d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6119sm2442098f8f.34.2026.08.26.04.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:26:09 -0700 (PDT)
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
Subject: [PATCH v8 5/6] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Wed, 26 Aug 2026 13:24:50 +0200
Message-ID: <20260826112452.13539-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826112452.13539-1-tchatard@gmail.com>
References: <20260826112452.13539-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..f51749d0f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.53.0

