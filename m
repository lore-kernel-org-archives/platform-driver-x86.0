Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6AA180A96
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 May 2024 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714684480; cv=none; b=SqiG69jdoQxH5uRJs4Zfd/viFjZXQ3t5Mf6GZLmJ1t3796Fg3qcwWfmQ178FkCJANKTp7hVJ6gPDJw6a2Xr4D4EGAm7Htz2Bg0TjI/uhhglQqilVU9Tpp5J9mJRPrgXjM+THf52HPmcr24FD81Jgq+Md2VcLkJ+mzgwaRboFbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714684480; c=relaxed/simple;
	bh=1S+4GNAUpKXds7LcVmMe/jrs2SUyekeWRn931fwnhR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RpnihcxwPnHtdUDDO4XX8jtWNUJ1PpPI52+IwaaLRmut6dfQFIo3EbWg4xQitnMhxs88lvk7oeHyGMkQreUF+FiX+w+BTBRUmgGRi7EDUK2CFCGMqDiMvKtlQ9IAAwWdztXgfqkXYvzLuHrxQ4OB7ZmA2lV+d8EV3v/Ak7MF05w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eW2ljsKW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eW2ljsKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714684477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ckF8SmGaQ0kzJOrgoMLDkNyaWhgKpKt8VrEVFWryMwc=;
	b=eW2ljsKWVpvkr66wOOJSdvaxiWscXZB3ocf+q7E08Gv92a4NveSpLZGfVAVWnLish900Kc
	YjTC8ZAbMkIFzoXlsDTl1K0omppILqROxy/lcUcG15RsTbFX2Rcyt2/ACGaIYgvHJPsiD2
	PJRraMYTQvk5YiT/HzkRu7i4DRQ7IS4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258-sda8g02mNUSwXxz-Kbw2bg-1; Thu,
 02 May 2024 17:14:32 -0400
X-MC-Unique: sda8g02mNUSwXxz-Kbw2bg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AE313C0256A;
	Thu,  2 May 2024 21:14:32 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDDD340BAA2;
	Thu,  2 May 2024 21:14:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v8 3/7] leds: rgb: leds-ktd202x: Initialize mutex earlier
Date: Thu,  2 May 2024 23:14:21 +0200
Message-ID: <20240502211425.8678-4-hdegoede@redhat.com>
In-Reply-To: <20240502211425.8678-1-hdegoede@redhat.com>
References: <20240502211425.8678-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

The mutex must be initialized before the LED class device is registered
otherwise there is a race where it may get used before it is initialized:

 DEBUG_LOCKS_WARN_ON(lock->magic != lock)
 WARNING: CPU: 2 PID: 2045 at kernel/locking/mutex.c:587 __mutex_lock
 ...
 RIP: 0010:__mutex_lock+0x7db/0xc10
 ...
 set_brightness_delayed_set_brightness.part.0+0x17/0x60
 set_brightness_delayed+0xf1/0x100
 process_one_work+0x222/0x5a0

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/rgb/leds-ktd202x.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 60ca6ec34336..77247a98fe66 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -572,21 +572,25 @@ static int ktd202x_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	mutex_init(&chip->mutex);
+
 	ret = ktd202x_probe_fw(chip);
 	if (ret < 0) {
 		regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
-		return ret;
+		goto destroy_mutex;
 	}
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to disable regulators.\n");
-		return ret;
+		goto destroy_mutex;
 	}
 
-	mutex_init(&chip->mutex);
-
 	return 0;
+
+destroy_mutex:
+	mutex_destroy(&chip->mutex);
+	return ret;
 }
 
 static void ktd202x_remove(struct i2c_client *client)
-- 
2.44.0

