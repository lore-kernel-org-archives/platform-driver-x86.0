Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21C7B654
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Mar 2024 03:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711078735; cv=none; b=EzSZqaUH6PLtVvgVWhvVi1tVYeTdACewb/fyl53BD7AphZ5636Gv7Zrb0+JO7vGBr6cu70406kbYH5xA3LA6YeQ2SP7EozL+Ce2pwyQ6Ibvj8wh+6KaiiLlkSi+uZh69ogYoW0VYQTBSRhOIHqnFCQqFswpobAhLH9e0aLzI5/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711078735; c=relaxed/simple;
	bh=f5/bJ67Sv0EFeJIOjhY7goPpZbgR8OLgYaO4aKMajrg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9mrcJcT4meC3ZnbwyVV3yviYk9YSblJbs0EMHXCEAylaz858qUSIK+AFh5FynmibBIB9f3nG2n89lwGCpPNmTy7AdZr+SWInu+sOmvFnWvsI8HEndkYxFLFUGxv8b+d/9R1uNvfQ4NXQ233xj9GSz8irpeMCLDx1KrtktwGn0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EyWG01Bz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EyWG01Bz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711078732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aaThFgoqCnVkRdxTondZNkroyy7Kv7fQbcUMkGLhXZA=;
	b=EyWG01Bzqrf7c1nkZTIf/9IC4kKhwiy1LExEkWV6ikjd0Z2nPsdZwEwyampXrOr+ohP/RQ
	LVw4e4ku0uT34aFbs0c0vgsxxf3cvdaBHFw1YlyxtGd0T6x2dsaGpUeQWJRnwEbZaDLhgE
	mbrKQdJPcr4yEY1Qq3AqATQCUPMnso0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-418-1cFmZtnjPRiM48klTFqeBw-1; Thu,
 21 Mar 2024 23:38:49 -0400
X-MC-Unique: 1cFmZtnjPRiM48klTFqeBw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C8A03C0275F;
	Fri, 22 Mar 2024 03:38:49 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CBBC2022C23;
	Fri, 22 Mar 2024 03:38:44 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Subject: [PATCH v5 4/6] leds: trigger: Add led_mc_trigger_event() function
Date: Fri, 22 Mar 2024 11:37:34 +0800
Message-ID: <20240322033736.9344-5-hpa@redhat.com>
In-Reply-To: <20240322033736.9344-1-hpa@redhat.com>
References: <20240322033736.9344-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

From: Hans de Goede <hdegoede@redhat.com>

Add a new led_mc_trigger_event() function for triggers which want to
change the color of a multi-color LED based on their trigger conditions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/led-triggers.c | 20 ++++++++++++++++++++
 include/linux/leds.h        |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index bd59a14a4a90..fcc4e7a7b12b 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -380,6 +380,26 @@ void led_trigger_event(struct led_trigger *trig,
 }
 EXPORT_SYMBOL_GPL(led_trigger_event);
 
+void led_mc_trigger_event(struct led_trigger *trig,
+			  unsigned int *intensity_value, unsigned int num_colors,
+			  enum led_brightness brightness)
+{
+	struct led_classdev *led_cdev;
+
+	if (!trig)
+		return;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
+		if (!(led_cdev->flags & LED_MULTI_COLOR))
+			continue;
+
+		led_mc_set_brightness(led_cdev, intensity_value, num_colors, brightness);
+	}
+	rcu_read_unlock();
+}
+EXPORT_SYMBOL_GPL(led_mc_trigger_event);
+
 static void led_trigger_blink_setup(struct led_trigger *trig,
 			     unsigned long delay_on,
 			     unsigned long delay_off,
diff --git a/include/linux/leds.h b/include/linux/leds.h
index fed88eb9e170..5378e4cd03ff 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -526,6 +526,9 @@ void led_trigger_register_simple(const char *name,
 				struct led_trigger **trigger);
 void led_trigger_unregister_simple(struct led_trigger *trigger);
 void led_trigger_event(struct led_trigger *trigger,  enum led_brightness event);
+void led_mc_trigger_event(struct led_trigger *trig,
+			  unsigned int *intensity_value, unsigned int num_colors,
+			  enum led_brightness brightness);
 void led_trigger_blink(struct led_trigger *trigger, unsigned long delay_on,
 		       unsigned long delay_off);
 void led_trigger_blink_oneshot(struct led_trigger *trigger,
@@ -562,6 +565,9 @@ static inline void led_trigger_register_simple(const char *name,
 static inline void led_trigger_unregister_simple(struct led_trigger *trigger) {}
 static inline void led_trigger_event(struct led_trigger *trigger,
 				enum led_brightness event) {}
+static inline void led_mc_trigger_event(struct led_trigger *trig,
+				unsigned int *intensity_value, unsigned int num_colors,
+				enum led_brightness brightness) {}
 static inline void led_trigger_blink(struct led_trigger *trigger,
 				      unsigned long delay_on,
 				      unsigned long delay_off) {}
-- 
2.44.0

