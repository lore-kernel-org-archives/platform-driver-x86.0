Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1B037A829;
	Wed,  2 Sep 2026 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382065; cv=none; b=dQREDBUdvPtFrQQtRBx0CK8k8/oH2+KIDsT43rUsDXv0iA0GMeUfzBB6zE8LCUfbFNzGjv9zLvRXo4ksXox7a/yJC4kNSnLAB+pGGOJIuECLAJBI9bHuN4Om+ONB5O3fEtWRzCwyAUCDgCHdU/FqcCK+TWRcJ2enjUrwhoWE4fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382065; c=relaxed/simple;
	bh=Ti5BQIQ0m+7rJBWDuHacgW7X/JWz7gQzlZwA4i/Lwtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Or106Rq1MT5d5Eqyj9a8axljUudp7zhOp4fcOw8RPXUMS3OgKZ4giSC5JFuKFNIwsYx55iCfTHFCZY9lc7EtiqbK1G4pirSFBsCRl2Eu//urOIDHLtLVUtopWqmukpnnwLoKCMdc1gjNXrE4AzBjocrwDGyBczDCbrECNNpznmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=Y+OlWeLU; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="Y+OlWeLU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1788381989;
	bh=Ti5BQIQ0m+7rJBWDuHacgW7X/JWz7gQzlZwA4i/Lwtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y+OlWeLU+yrtAvhCa8zjz6Lxmv52TcKj3WgvMnXb0NOdc/BH0HEwPFbjYzBVsYUUg
	 P2sC8xiMh0QffHwUJUZ6V3F4hVdY51lISCLW4gNH6fKxbKgxNqT0gK7Uw9HUhA6u2l
	 0ZSBz34okfmrJus7Y6HNFJ11P5dM2yjfgV2lusDgzlXba+iNBzJOkVB6lI3t6cf0dP
	 l4DpTVKM4VwEMlZrgtSpbMy9d+0yv28tzOyhlAUrk6FGCCPRKHDa/mc4SCIr6bG73n
	 Qgn++BlRSa57jBD9o523/k2x69nXDoRvjhgFTn1YCA9xI14Y1W3Mtbu+9eRjFVHPxd
	 CHy7zU67Az/uw==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id 90B14223B4;
	Wed, 02 Sep 2026 20:46:29 +0000 (UTC)
From: Peter Marshall <pm@petermarshall.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>
Subject: [PATCH 3/7] media: ipu-bridge: Add VD55G0 to the list of supported sensors
Date: Wed,  2 Sep 2026 16:45:42 -0400
Message-ID: <20260902204549.657228-4-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204549.657228-1-pm@petermarshall.ca>
References: <20260902204549.657228-1-pm@petermarshall.ca>
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
index 88581a4c0..527d1a81d 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -95,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* STMicroelectronics VD55G0 */
+	IPU_SENSOR_CONFIG("SMO55F0", 1,  380000000),
 	/* Sony IMX471 */
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Toshiba T4KA3 */
-- 
2.55.0

