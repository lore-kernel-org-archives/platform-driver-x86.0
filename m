Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4842EC0A1;
	Fri, 20 Mar 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773999378; cv=none; b=UMpICaerMWAvFOI7YLPKPsBijQv4MJ8h7oeoFoR+MN9TdpMF1HhgfinfXDngx/1fhGXON2qUR21xAX8QGLJRZ6OGciSa9a87EE/QO0AYHTpQJfD+S3tXxuTgQPjUrE68Uf9bZv0FsTERFOMyVX81114n7Mz3T5ZrwCi333nVFG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773999378; c=relaxed/simple;
	bh=dZJOCTFtJZUHOSWu4g1IyyCntjRf3+ekzG1jr2dP3Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdChdMqase0iuZF+U7MWtwRxagDjnwBnV0uakN4rmM/d0dlmNqu+HK/uIo9k2Cdp9r9TDDkophzxkaHNvLAR7zcI/le6svdSMBX+mSXF7UAnePuxJ+7auG4uMc3LbQ3Bo1jCY3G0o2lSFTYqWy/B8fW45SnVdLlBbfxR/6FgBIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=Lga/W2Lo; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="Lga/W2Lo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lIp77/TP6ytXFAvgPrHJFSRHfrvMY13Xe/mGpLjDEFE=; b=Lga/W2LoJNljlC/Xwi4ZJabD8D
	dEN4aBODcakNOXKBDK1zZQEtpSd5Z4MlUfVTBYh5s9/SfFGYzG+FvYpBF+uhJu6rEZ75eQuyXPksV
	PSL2mbg1qjTY3HkqGlktNoiKLpq189tNonfSyrU3F9tDarNNQF1s0Ye5ZpxSoMxQU85k=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w3WDs-005Yt2-36;
	Fri, 20 Mar 2026 10:32:52 +0100
Date: Fri, 20 Mar 2026 10:32:52 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Cc: hao.yao@intel.com, hdegoede@redhat.com, sakari.ailus@linux.intel.com,
	andy@kernel.org
Subject: [PATCH] platform/x86: int3472: Add GPIO type 0x02 (strobe) mapping
Message-ID: <ab0URIrzZPsYjWrM@spark.kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Some ACPI tables on Intel Meteor Lake and Arrow Lake platforms define
GPIO resources with type 0x02 for INT3472 camera sensor power control.
This type is not currently handled, causing a "GPIO type 0x02 unknown;
the sensor may not work" warning and preventing proper sensor power
sequencing.

Map GPIO type 0x02 (strobe) to the privacy LED handler, matching the
approach used for similar illumination-related GPIOs. This is consistent
with the original proposal by Hao Yao [1].

Tested on a Dell Pro Max 16 Premium (Arrow Lake-H) with OmniVision
OV08F4 sensor connected via Intel IPU6 and Synaptics SVP7500 USBIO
bridge. With this patch applied, the int3472-discrete driver no longer
warns about unknown GPIO type 0x02, and the sensor probes successfully.

[1] https://lore.kernel.org/all/20231007021309.9332-1-hao.yao@intel.com/

Link: https://bugs.debian.org/1130114
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2138991
Cc: Hao Yao <hao.yao@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
 drivers/platform/x86/intel/int3472/discrete.c | 3 +++
 include/linux/platform_data/x86/int3472.h     | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 1505fc3..39ca60b 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -211,6 +211,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "clk-enable";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 		*con_id = "privacy-led";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -330,6 +331,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 
 		break;
 	case INT3472_GPIO_TYPE_CLK_ENABLE:
+	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_PRIVACY_LED:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
@@ -347,6 +349,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 				err_msg = "Failed to register clock\n";
 
 			break;
+		case INT3472_GPIO_TYPE_STROBE:
 		case INT3472_GPIO_TYPE_PRIVACY_LED:
 			ret = skl_int3472_register_pled(int3472, gpio);
 			if (ret)
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index b1b8375..85adeb0 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -23,6 +23,7 @@
 /* PMIC GPIO Types */
 #define INT3472_GPIO_TYPE_RESET					0x00
 #define INT3472_GPIO_TYPE_POWERDOWN				0x01
+#define INT3472_GPIO_TYPE_STROBE				0x02
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
-- 
2.47.3


