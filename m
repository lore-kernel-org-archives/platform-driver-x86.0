Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D333EA963
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265404; cv=none; b=i88JGdNnBmU/M1MmaZURJ89mz3mrNlN9EBvzTLAEZ6zg2zPEomU3c3ZnzrXXmxcqvUePkMsRdZ6fZM3qPVGOmowtkiQWYUMjVuwfeZrQo0jVUc9m9lW5hQNn2D4KKY8W7usRc7NjHWwQEA1MlMbDmtTIss4K0QQwGOd/EMeroGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265404; c=relaxed/simple;
	bh=xiival7uhdbaGiPJI0zULwu+M3Fe9RI8H0YYOPSb9gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QzUzlyLI7KWu1Dp8Ej8Z2NyuWopOaftHL0QAvr3qMFW3Ru1tYRzSfuD63+mPo1uEXo3MMhw9jaSwBWXhJ9vdT8r5woRPOYL3g+UlLFo5NcL4kJMHUL7gsLhwXvnQDmRSrC/J5shGLuL7v+r35iUxWQ6XwSSkmfdzNh3/IES3DdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NRYZUTDY; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NRYZUTDY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781265398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKysJoAO23DeyckwwNnzhIfQDe8Fqj2abpdf4RWyHKs=;
	b=NRYZUTDYsMFr207BY1rxl7BFi5f14Byt1y0Ss6qi1LyHkMLdVQR7bqy+rwRyZSMNmpmE0h
	9+0CYKLZ1wBdvKJWFSvptltnsxAhA/HA9FfwrX4byID56+MpnwOD1oWRitZMA52vszLBlV
	StbZLWraUBiVM97l5q6wtlIhw7vtJhw=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Denis Benato" <denis.benato@linux.dev>,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH] platform/x86: asus-armoury: fix mini-LED mode get/set on MODE2 devices
Date: Fri, 12 Jun 2026 11:56:28 +0000
Message-ID: <20260517182957.11069-1-yaseen@ghoul.dev> (raw)
In-Reply-To: <20260612115628.964152-1-denis.benato@linux.dev>
References: <20260612115628.964152-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Message-ID: <20260612115628.c--jv-S8NsMMI9quu3EIZK09J0XkZtTNsRIltpRCYFg@z>

From: Ahmed Yaseen <yaseen@ghoul.dev>

The mini-LED current_value attribute does not work on devices that use
ASUS_WMI_DEVID_MINI_LED_MODE2 (2024 and newer models).

Reading is broken: mini_led_mode_current_value_show() fetches the mode
from the device but then decodes a literal 0 instead of the value it
just read:

    mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);

So mode is always 0, and the attribute always reports the same thing
regardless of the real hardware state.

Writing is broken too. The number a user writes is an index; the value
the firmware actually wants is looked up from that index in
mini_led_mode_map[]. mini_led_mode_current_value_store() skips that
lookup and passes the raw index straight to armoury_attr_uint_store().
On 2024 devices the firmware numbers its modes differently from the
index, so some writes are rejected with -EINVAL and the rest send the
wrong mode to the hardware.

Fix both paths: decode the value actually read from the device when
reading, and look up the firmware value before sending it when
writing. Older (MODE1) devices were unaffected because there the index
and the firmware value are the same.

Fixes: f99eb098090e ("platform/x86: asus-armoury: move existing tunings to asus-armoury module")
Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
---
 drivers/platform/x86/asus-armoury.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 5b0987ccc270..495dc1e31d40 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -370,7 +370,7 @@ static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
 	if (err)
 		return err;
 
-	mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, 0);
+	mode = FIELD_GET(ASUS_MINI_LED_MODE_MASK, mode);
 
 	for (i = 0; i < mini_led_mode_map_size; i++)
 		if (mode == mini_led_mode_map[i])
@@ -386,6 +386,7 @@ static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
 {
 	u32 *mini_led_mode_map;
 	size_t mini_led_mode_map_size;
+	char mapped_value[12];
 	u32 mode;
 	int err;
 
@@ -414,9 +415,16 @@ static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
 		return -ENODEV;
 	}
 
-	return armoury_attr_uint_store(kobj, attr, buf, count,
-				       0, mini_led_mode_map[mode],
-				       NULL, asus_armoury.mini_led_dev_id);
+	/*
+	 * armoury_attr_uint_store() parses and sends the value from the
+	 * passed buffer; hand it the mapped firmware value so the device
+	 * receives the translated mode instead of the raw index.
+	 */
+	snprintf(mapped_value, sizeof(mapped_value), "%u", mini_led_mode_map[mode]);
+
+	return armoury_attr_uint_store(kobj, attr, mapped_value, count, 0,
+				       mini_led_mode_map[mode], NULL,
+				       asus_armoury.mini_led_dev_id);
 }
 
 static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
-- 
2.54.0

