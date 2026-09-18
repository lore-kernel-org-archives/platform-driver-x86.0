Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0403355F42;
	Fri, 18 Sep 2026 22:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769952; cv=none; b=hF0zFKoR+XqIX6WFDuW11oz9/YoZCa73/VpMGbQiPDfOiKpCVvP9b6II865+zkfwwfVFa2f8DX88izHdIevi9apOj7OZ086pV8VHFfRCBiXgMpZNCO0SYGJTZ/xw/1FdTlS1IyXj7rsTHZlVm6P1bgvPz0BQ4G28D8RNnvlTdn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769952; c=relaxed/simple;
	bh=HMbANU/RXharGbMBbWlcPfxUlBDSDjYxKRpQMWWOMDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdYcJy8lTZua+QRq9ByEkN3x0VwbQWM3UY14WM8orhquSJSi7GLOT/G9PULbFhw4/3BRGqLyAF2Ck/g+2sgbipVgIObnSZ1JIUl9SxLr7Rz6edQfekGWVnZuIDqftPLbbRegp1dflmBoHuB5g9oZ246tHa3Sc5xkcDHGwG0Mx9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=S5QpIHg/; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="S5QpIHg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769888;
	bh=HMbANU/RXharGbMBbWlcPfxUlBDSDjYxKRpQMWWOMDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S5QpIHg/fJSCyffvP4ITW5t3NpsCXlDg02y8OEAmW20qy4nY0C5awhdXehhVImZp2
	 Q4BNLR4SKscE1Tmp40oXZkJNVDaIjE4CNNRubl0FOmWTZ/nqSmeEbzpExJHU05LqC4
	 fwtwFjHSK9jvcYR+4O0UKdO8tq4yZCKVqiJvJcbyjHJftTLJ2GaFvhklowfkxM12kM
	 3vix2DVt6v3IRci3QvSf+dXnUD9CzkDDPPmKt2VNcEWEoie0GA9XHjDuyKafLAMsA3
	 DIaOK5UtwJD/BCweez1wF3GEVWWH+3X5d0uEUoAhAWfScdGk7gkpDcUfIn5r2a+WSU
	 8LB5vgorO6bxw==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id C7BD520122;
	Fri, 18 Sep 2026 22:18:07 +0000 (UTC)
From: Peter Marshall <pm@petermarshall.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH 03/11] media: ipu-bridge: Add VD55G0 to the list of supported sensors
Date: Fri, 18 Sep 2026 18:16:57 -0400
Message-ID: <20260918221705.323510-4-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918221705.323510-1-pm@petermarshall.ca>
References: <20260918221705.323510-1-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SMO55F0 ACPI HID for the ST VD55G0 sensor to the list of supported
sensors. The sensor is found with this HID on a Microsoft Surface Pro
9 tablet. Use the lowest supported link frequency.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 77257311d1d8..a36f53965437 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -116,6 +116,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* STMicroelectronics VD55G0 */
+	IPU_SENSOR_CONFIG("SMO55F0", 1,  380000000),
 	/* Sony IMX471 */
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
-- 
2.55.0

