Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E97C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 11 Mar 2023 22:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjCKWan (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 11 Mar 2023 17:30:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCKWan (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Mar 2023 17:30:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4899A6B5E2
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Mar 2023 14:30:41 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B51956D;
        Sat, 11 Mar 2023 23:30:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1678573838;
        bh=+tfvrNr7JJy25Uwf5MXaayTEeQXqAtvJAYF99Ushba4=;
        h=From:To:Cc:Subject:Date:From;
        b=LMKZg5lMljUu/NjzdFI1PSPjtoAlGmBUxsrWqxlogz6eALuNEm4O+THk2r8+RxM+k
         W0kJBKXhEs3FsQCqsq/Qvpp/wA3GvlG+vmZMM4VKgkV9bOEFKE4iaAtXwV1OOn5vgs
         MOGan079T3XYilyjRZBZVCQi9tytpM3dh6YsOENA=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Cc:     Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH] platform/x86: int3472: Remap reset GPIO for INT347E
Date:   Sat, 11 Mar 2023 22:30:19 +0000
Message-Id: <20230311223019.14123-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ACPI _HID INT347E represents the OmniVision 7251 camera sensor. The
driver for this sensor expects a single pin named "enable", but on
some Microsoft Surface platforms the sensor is assigned a single
GPIO who's type flag is INT3472_GPIO_TYPE_RESET.

Remap the GPIO pin's function from "reset" to "enable". This is done
outside of the existing remap table since it is a more widespread
discrepancy than that method is designed for. Additionally swap the
polarity of the pin to match the driver's expectation.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index f064da74f50a..2064b3bbe530 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -98,6 +98,9 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 {
 	const struct int3472_sensor_config *sensor_config;
 	char *path = agpio->resource_source.string_ptr;
+	const struct acpi_device_id ov7251_ids[] = {
+		{ "INT347E" },
+	};
 	struct gpiod_lookup *table_entry;
 	struct acpi_device *adev;
 	acpi_handle handle;
@@ -120,6 +123,17 @@ static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int347
 		}
 	}
 
+	/*
+	 * In addition to the function remap table we need to bulk remap the
+	 * "reset" GPIO for the OmniVision 7251 sensor, as the driver for that
+	 * expects its only GPIO pin to be called "enable" (and to have the
+	 * opposite polarity).
+	 */
+	if (!strcmp(func, "reset") && !acpi_match_device_ids(int3472->sensor, ov7251_ids)) {
+		func = "enable";
+		polarity = GPIO_ACTIVE_HIGH;
+	}
+
 	/* Functions mapped to NULL should not be mapped to the sensor */
 	if (!func)
 		return 0;
-- 
2.34.1

