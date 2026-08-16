Received: from s1.inspiredexperts.com (s1.inspiredexperts.com [162.243.156.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917529C327;
	Sun, 16 Aug 2026 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.156.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786912969; cv=none; b=rloGKx4fyEeQTmp5p1JOjFmqqEYvExgYowzu0NfMcpK4MXIreC/gdcrNATO7Z1E7/97eNuacNam+pgii4XdXxCM5pxhm7+LN1ojx38rVBm2KBWarqaD8V+oOpnt2DBRyZ6orGfbqMnGcxaVsehGM3Vv4DXMoRFbejnfKsZbROyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786912969; c=relaxed/simple;
	bh=cmCHsrvf+dkDOaAwfuTj1vnDNBWVYZ9+mu0cffhrapk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uv6HnoPwYRJMJV5ifxuAhs8fPgthuzGPGxVd5cJ3ezW8B5ZYEo6qJ5bq+fLKmvQArVo7l6P0V7AaOVHZqXk7fTZj7izAv9wskY5xx4X3Yy8ggUaoR8b4+Y1XVG55pyLgvn+kWHNvN71c7Yzg+VRFQYw4PNTsWBByGZoMrIYaKnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inspiredexperts.com; spf=pass smtp.mailfrom=inspiredexperts.com; dkim=pass (1024-bit key) header.d=inspiredexperts.com header.i=@inspiredexperts.com header.b=bL4Cz3rz; arc=none smtp.client-ip=162.243.156.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inspiredexperts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspiredexperts.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inspiredexperts.com header.i=@inspiredexperts.com header.b="bL4Cz3rz"
Received: from localhost (s1.inspiredexperts.com [127.0.0.1])
	by s1.inspiredexperts.com (Postfix) with ESMTP id 3C957D2D68A;
	Sun, 16 Aug 2026 14:42:47 -0600 (MDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inspiredexperts.com;
	s=default; t=1786912967;
	bh=oYNBNgxOoDNDtHBbI4o5d7Wr9nWrieuHj+3iC5uCw5c=;
	h=From:To:Cc:Subject:Date:From;
	b=bL4Cz3rzK2omvhfoqjBO5cC5ybO+Jy+Bo0DwcNWJs0AGSwF+Qwt4zvH6j715mpn4W
	 0UO3NBy9jODeH9muu0syiL7a4QHrAq/hjVLokHBkesP+ipYcct4IVo9ViqPI13FoO1
	 PPLAPOYjyvG0x795GH1OlHOw2YJQm0QWxgRbI098=
From: James Alexander <opensource@inspiredexperts.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: int3472: add HP Spectre handshake delay
Date: Sun, 16 Aug 2026 14:42:47 -0600
Message-ID: <20260816204247.2844986-1-opensource@inspiredexperts.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OVTI08F4 sensor on an HP Spectre x360 14-eu0xxx failed to read its
chip ID with error -121 when the existing 45 ms handshake delay was used.
Increasing the delay to 150 ms allowed the sensor to probe.

Keep the existing delay for other OVTI08F4 systems. Add a reusable
handshake-delay field to the discrete-device quirks and set it only for the
affected HP Spectre family through DMI matching.

Compile-tested against Linux base fd923b32d761. Hardware-tested with the
full patch set across 25 consecutive reboots on the affected laptop running
Ubuntu 7.0.0-29-generic; the sensor probed successfully on every boot.

Signed-off-by: James Alexander <opensource@inspiredexperts.com>
---
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 115bb3757..80efeb452 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -193,6 +193,9 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 			      GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
 		*con_id = int3472_gpio_map[i].con_id;
 		*enable_time_us = int3472_gpio_map[i].enable_time_us;
+		if (int3472_gpio_map[i].type_to == INT3472_GPIO_TYPE_HANDSHAKE &&
+		    int3472->quirks.handshake_enable_time_us)
+			*enable_time_us = int3472->quirks.handshake_enable_time_us;
 		return;
 	}
 
diff --git a/drivers/platform/x86/intel/int3472/discrete_quirks.c b/drivers/platform/x86/intel/int3472/discrete_quirks.c
index 552869ef9..d31f7c764 100644
--- a/drivers/platform/x86/intel/int3472/discrete_quirks.c
+++ b/drivers/platform/x86/intel/int3472/discrete_quirks.c
@@ -8,6 +8,10 @@ static const struct int3472_discrete_quirks lenovo_miix_510_quirks = {
 	.avdd_second_sensor = "i2c-OVTI2680:00",
 };
 
+static const struct int3472_discrete_quirks hp_spectre_14_eu0xxx_quirks = {
+	.handshake_enable_time_us = 150 * USEC_PER_MSEC,
+};
+
 const struct dmi_system_id skl_int3472_discrete_quirks[] = {
 	{
 		/* Lenovo Miix 510-12IKB */
@@ -17,5 +21,14 @@ const struct dmi_system_id skl_int3472_discrete_quirks[] = {
 		},
 		.driver_data = (void *)&lenovo_miix_510_quirks,
 	},
+	{
+		/* HP Spectre x360 2-in-1 Laptop 14-eu0xxx */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
+					"HP Spectre x360 2-in-1 Laptop 14-eu0xxx"),
+		},
+		.driver_data = (void *)&hp_spectre_14_eu0xxx_quirks,
+	},
 	{ }
 };
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index a73841dfa..797694aa8 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -96,6 +96,8 @@ struct int3472_cldb {
 struct int3472_discrete_quirks {
 	/* For models where AVDD GPIO is shared between sensors */
 	const char *avdd_second_sensor;
+	/* Override the default delay for handshake GPIO regulators */
+	unsigned int handshake_enable_time_us;
 };
 
 struct int3472_gpio_regulator {
-- 
2.46.0
