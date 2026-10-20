Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461048;
	b=DVdFly0GeAw2o4nJHOhYKoZSkE/lHl1AzsMsktn4I088Q1RBglJCScaiV0wKOQmofv35
	 GZ9U7pn7cPEFEydhnCPbkENReCeZriikR6VM51Efyf4DicjbBoRp0SVJPMgZAUE8ANTKB
	 GHwDOusUrj4jKtkjPqf1E2WCwVBXeExOYhO5nTJV1bMwSrQiKMzwnC1Jr7NE+CH1kw1Vy
	 rbMxIURceGgVonzw38fxviJr8IPWNTpW9hghehxvQkcjANMbQ8AhEVI6uOXG88KbcubkE
	 Exv2U53+AF3sgAewHH3ZCnx/EZ7EpbkfuwQi/97UVdkm83NGy9vDwuAtKnOUuC0c4pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3lfY+o1OBadHsWe3VMCpcuef7XGMN+U6VqfmlmEcxRs=;
	b=WfDIP3hbcEjNLP47VHr24es59Cs8Y5/k3rl1I4oHtDags+5TrXpyUWtar4FVMkJ+xoX8
	 wKa+7C6kG9LcXWTSF/COhiPoUAueNa41GzfKLTZ+CbqG/GTiGC49UC981o62jt4QPHdCv
	 4aQ2H+ao2XTjwDn0ulUuac1khHSx5NiIZoUxVhupeXpDAyqZAO+iDHIsbJUATNrqUX5Dq
	 glh2Z+Gz0OYXrB45z7FjVSHnPkt944N7ZTpPtV5Bm8KqWU9GDkF6j2YalY+HhFZMPWpf0
	 b18806MZNjnh7TZrJ+7wRvXTHrnluadVtvNlI9FOLrr/Y5oaGgnvqPm7KsXHITbz4fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RyWKyHV2;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F251606A327
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 01:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F251606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RyWKyHV2
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35c76e9614aso5173794eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 18:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461047; x=1793065847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lfY+o1OBadHsWe3VMCpcuef7XGMN+U6VqfmlmEcxRs=;
        b=RyWKyHV2ZBys68j125r1pIPPZm8v+gibOch5r6fu+UbvdXQYkC8CYLvuHkYBno5B6U
         2YdecQnuE/jFjG5Naz2okf7WMrCOSv2fNYnKg3QHndDBjGfmrR859Xq6VY7dCjD89Pak
         dlww8du4nc3nRc7EcfS0vOrqHGL+MXikrQtfRR4Y6noB4WtduFvXAWt4LwHcRrP7RrPt
         2TGV+aPQeEyPHgOZaMuqhmtrNbV0hZ57lsA1SKsIVMJRMukPrci/kt664C3sJhx6rLkU
         afhLLzHVxq/7F0T9y4ia7asDV2cqKr9TNXGt5fPAatEkcvcUg8EaakZSZvY58rkSL8Ko
         dctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461047; x=1793065847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lfY+o1OBadHsWe3VMCpcuef7XGMN+U6VqfmlmEcxRs=;
        b=s5rj2AniIsck/4QiVhfxVSOo91NJJMaKEGB0kPvGykXCdClRSrWW1HfBvXLmHxBwQY
         cxIoS/n7HXAtVYt5ItrGU9F+SB51k/vII/6kKlalOJqt4FO75I9Z42c+OonGXGV35AZk
         LZE5sOR7wiXgJuYUgVbAQCBvCmW61SPvPDveshSLbya7drmsRT6VPFk8HMQOrmTIQMoq
         4YTpM16ntonSyTKGL6A2hlGczl7Mi2vU+1NI8NYXRC6ShcnIW/1rpA4d0XGlRHtRc1NO
         XaiPWMwygFIp7rqDlUvhKDLSyPHLPhv4Zy3QiNBxiun3hOB5oglmy+rtByjFpi1JjZLL
         8YZg==
X-Forwarded-Encrypted: i=1; AKwUvBwNVWNn/Ymxvvbi4Ny/TXQi3Agn3YiEFNqg+1GmBw5qgJsxxY/l3w7sdE5yz3YhsIkUyvaviYXioJq22XakmImhOjYD@vger.kernel.org
X-Gm-Message-State: AFq9FYIO54wUXKHE5CzsMYMspjokKo5lQXzMDn7IDAnGotJDAe21Loh7
	gLb1FEteg2eJUKnjwYzoY7y1QYt/9qW0ApV1djKeAq3PbDGNMVNdCAn3
X-Gm-Gg: AYBFou3cn0y+y3e+ovucNrkQ00M1yR8Z93e9Zmvos95XH9CHbXv/BTLQcTHuXhRkoYH
	IWZOw6TbHqEsYM6337P/HERq6uAME3DFs9E+tc6nUrtjZL2jt2U1Qv3AwiaQUEG56b1mermUfKQ
	nUd2wgLjcFqd46Lws4Cal8vU26GPDo72KFnMA+r3mKDyZDr/11yeOXZplR3JGBLQbTBnVpB7bon
	QHdrD0aTm/pHBDFjzCpcDHlu8mv7Y2Ki3TivjgaI2Mi6JWXV/38IuOE/hVvHmd3HbJeXA8bbjzS
	vb6+G54jNAK6hwlxi/FhthstCEWlaj0fvpFLUfXFUN8ZeGm4gXmCgJyZ8hyAFfUxjvA+VGlpZp7
	re0kmtSFvZA4ybqu08VI2aCwrRnULxpW9LUvkMvpZ2F4wzCdCeThpBHLoGq+E71hSHKhTPoSzUt
	DBBqVbacj2Rf8Kz+XOPxXhFDcUkkJrc6Dszs94ud5LGnSUVB3TF69ESvaRz2Awwd+yFceJE76E9
	I7JBvUzzFbrO7iP5ew3V4i4hbcRzFzoA28H70WxwhFAb59jZQ941KK9
X-Received: by 2002:a05:701b:454b:20b0:144:f096:4dda with SMTP id a92af1059eb24-1851434bc5cmr12888966c88.43.1792461047064;
        Mon, 19 Oct 2026 18:50:47 -0700 (PDT)
Received: from duo.lan ([2001:fd8:f0db:3ee7:799b:69c2:e95b:f04e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm32684879c88.7.2026.10.19.18.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:50:44 -0700 (PDT)
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
Subject: [PATCH 1/3] media: ipu-bridge: Add sensor configuration for OV5675 (OVTI5678)
Date: Tue, 20 Oct 2026 09:49:59 +0800
Message-ID: <20261020015001.15672-1-patrakov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
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

From: Sahan Nissanka <adee.sahan@gmail.com>

The front camera of the Dell Latitude 7320 Detachable is an OV5675
described in ACPI as OVTI5678. Without an entry here ipu-bridge creates
no software node for it, so no fwnode endpoint exists and the sensor
cannot be connected to the IPU6 even once a driver binds it:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
  intel-ipu6 0000:00:05.0: Connected 1 cameras

450 MHz is OV5675_LINK_FREQ_450MHZ, the only link frequency ov5675.c
supports, and matches the two data lanes the machine's SSDB reports.

With this entry both cameras are found and the front sensor appears in
the media graph:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI5678:00
  intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
  intel-ipu6 0000:00:05.0: Connected 2 cameras

[Rebased onto next-20261016 and adjusted the comment]

Signed-off-by: Sahan Nissanka <adee.sahan@gmail.com>
Signed-off-by: Alexander Patrakov <patrakov@gmail.com>
Link: https://lore.kernel.org/linux-media/20260809042540.15849-4-adee.sahan@gmail.com/
---
 drivers/media/pci/intel/ipu-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a8c4..0b6272c4d826 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -111,8 +111,9 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
-	/* Omnivision OV5675 */
+	/* Omnivision OV5675 and its RGB-IR variant OV5678 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
+	IPU_SENSOR_CONFIG("OVTI5678", 1, 450000000),
 	/* Omnivision OV5693 */
 	IPU_SENSOR_CONFIG_MATCH_FL("OVTI5693", ipu6_ov5693_ncont_clk,
 				   IPU_BR_FL_CSI2_CLK_NONCONTINUOUS,
-- 
2.56.0

