Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648305;
	b=MJnwGGFNBRYZSfY5tfiA3jOF45cKNaL3BqbgBr2/ZmGTyxSSNt9oyY4CrY/eanOa1yk/
	 rfVRC0MT0AJChF9HuyPGBFsQT7iVhZcpJBsVJBSzTxqUehsBQHwlZhnqF9l17R1pnbPS2
	 QmiIx4OCKVY4aeET9qsQGsRGzgYIBjLG30yt1tbhLdpGodE4xaPAaaW0TtdpgVPCb9FCm
	 EggKEEWmmlxMQcUdiuKWrMm1njferOzCZZ9Q7ESzMJJcdPEQuZt49lriHFI82MtkBIOKh
	 jm3w5uSQF5oSwHBaSoTGGFIMMtKin37RzjsMMGUEeWMPF08EAQJ2n7z+vHhO8yJFLmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Q7ZUsp1hrrDcICCRItI94bCSWyJZ5L3LzBKk541X1yQ=;
	b=Nwt5LMGZi6UysckeUxFVy0ziQ0/wP6DXedKIRTV0DuWVODYHw11foYy/9bcohBx1bPYP
	 QasMLMG0O1NqCf1Q9NI6LMbmeYjWQUzo41L0e3GpqKYUJ5XZQaY2jL1HeGMY27UdXnZuN
	 5t8bvEI8o7I0tP7QS219RwS7pcTqH2BqVE3rC0hUpIfel78vIu92hW7YGiPCJuhUk0iDy
	 fKhXgLT7D919Q6jxrhuOklqyd6LYQKSb9Pthq54nnNob4wt8XRIy0SyQxgnFqrfAobpoL
	 H8WANs7xcVyhYLOVbQn2PdIghnBd9fpxpCiohbvyyb8QUigEjjygk/bT05RuH46fOFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTtYghzT;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D07606A339
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57D07606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTtYghzT
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-386c71feeeaso2729820eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648304; x=1796253104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7ZUsp1hrrDcICCRItI94bCSWyJZ5L3LzBKk541X1yQ=;
        b=KTtYghzT5mD1SNNLheKYtMCBcZ9F+4cg4AlpMsZuvxZjhLoDcqfvwhfZnkR0KG2VJz
         xbANemyEFx54MG5qekl7tP8XUD7lPYxPHzZ8bmLa9XSoh301JX8zVIMEl7IEQ1lz+2Gr
         ABKnvBQCvG8ynmwzHkQb22YF6AgY1RZTJgmKg27OXUGTrqHPSC7qjzpkl2qqzq0yzupw
         0atTLu4a5cB5w9KtXooLQEh7AyEwlNCijlnYnl3Q/82UNdHo4o2wFNIZ/VQ3xjkI2jlo
         529PSrkJOT2vrk9Za9nC67bG5ikMt61RejYjRQZot4GKbuuAGPQlb7mYUHN9AAnUjFuD
         y19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648304; x=1796253104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q7ZUsp1hrrDcICCRItI94bCSWyJZ5L3LzBKk541X1yQ=;
        b=2wf5ozSfVepTKjdyLzfgxUSPqo+hnBXZ8vpJvG7+2dCNvCcD3E2IltQFi7RZNvzSI3
         VAv7JcuNsaLrbJrXTgb8SF5f8BuS3GG5RKhS7T2jh2M7LQlq+sk9EjOTkcHFYGoyWTMD
         AUIb/kpSUSoKh0U9uVkF9OB9KqFMLHIcJR7vfqGjqlFpeS9mJnDBzNCzy8cg3KIZUv7M
         ZLDRIdEc1ax3SzqYB2fqyOaKW1pXxaZWb9s1ANM1SLypTYzd6eYX2MI7s/PArS1WtreN
         HRI/rlIzAsEhxrKaoWnra7QkasCtrS11I2wRZK1sXgMY2kjbvJ3DnSa6XZYDVlUfKPaz
         ElZg==
X-Gm-Message-State: APuU4Z9B5bg2znd0TyJ7sNBD8t0cwXnLuYKTxok239O1glp8jK1tSls5
	98VC5xTEDUpeEK2hA9t8JdfV90JMJRWUI0vafQfURIlXNpk3QAx8KiKzc0aY/Q==
X-Gm-Gg: AZFdTZdntphLsXGpecTidXUPzZJEtZLYBXQUOI5V4YtK76Yt3iHReJmhrhOiUSdEgCI
	3y4Phn0+PZ5aZuOR5UC+BFkai8zlyK677b9mm2Eo8CMejjqsV6kw1ELNJzVEARwvWBtVU669Otp
	al8Jy7Ma5Ao9ec6GASEskw6S71gD3Pasvoz03n3fYyd69lQUqFyiuCt78xBGLWkkeCcYM7XxTFA
	gP5eP11+vgXrNtIEDsAw+D8VyMoFWDEgXCSeMvKfkqfmiLwc4xBcR1ZVpBmEViuLfAEX5wwc7VX
	pbVMMi/+dtTdr7eRkothkj06HXNqkNxyq/7E9Rr6MFRI0tuflkPAlQZGSURYO9+qijXIjZ4dHzK
	Lo/23Pgmu94nTRM/BiBq4DwGpQxJLsijYYXGCyL7a9evBJHNyWGIQz23Nqf4/YM5l0c2ImacbxD
	VnCLq2HWobdPr5pd7PFbXz81wWMknrFHCL5FV6pw68Wj8HZ7XGcK/Uc3jDinUNN+W/6Q/MESFmK
	YTu7xQwDRbBtudU1HuskfQ5yKgNw1jV4YzWop9FyMqHocOsXFdm16e4T87kG7hXc/uQIIAYj36Q
	qniMdpO/TPAnNhkefKZUb0+lJ4VxQoGbfBOn57YGbwFU24U+ZorRUwxqDSdBYOtEHd5bNGgYRic
	2nYvJsKKX7MF5TJjtPFc=
X-Received: by 2002:a05:7300:cc9c:b0:386:a217:aade with SMTP id 5a478bee46e88-386a217e7cemr14225508eec.29.1795648304307;
        Wed, 25 Nov 2026 15:11:44 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:43 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:19 -0800
Subject: [PATCH 6/8] platform/x86: thinkpad_acpi: convert
 hotkey_thread_data_mutex to a spinlock
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-6-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

hotkey_thread_data_mutex only protects a few in-memory integer reads
and updates across hotkey_kthread(), tpacpi_hotkey_driver_mask_set(),
and hotkey_source_mask_store(), with no sleeping calls inside any of
its critical sections.

Convert it to a statically initialized spinlock_t
(hotkey_thread_data_lock), which also allows dropping the conditional
mutex_init() call from hotkey_init().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 58500b72d9d2..0ebaea0ab96b 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -67,6 +67,7 @@
 #include <linux/sched/signal.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/string_choices.h>
 #include <linux/string_helpers.h>
@@ -1814,19 +1815,19 @@ struct tp_nvram_state {
 static struct task_struct *tpacpi_hotkey_task;
 
 /*
- * Acquire mutex to write poller control variables as an
+ * Acquire spinlock to write poller control variables as an
  * atomic block.
  *
  * Increment hotkey_config_change when changing them if you
  * want the kthread to forget old state.
  */
-static struct mutex hotkey_thread_data_mutex;
+static DEFINE_SPINLOCK(hotkey_thread_data_lock);
 static unsigned int hotkey_config_change;
 
 /*
  * hotkey poller control variables
  *
- * Must be atomic or readers will also need to acquire mutex.
+ * Must be atomic or readers will also need to acquire spinlock.
  */
 static u32 hotkey_source_mask;		/* bit mask 0=ACPI,1=NVRAM */
 static unsigned int hotkey_poll_freq = 10; /* Hz */
@@ -2143,7 +2144,7 @@ static int tpacpi_hotkey_driver_mask_set(const u32 mask)
 	guard(mutex)(&hotkey_mutex);
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-	scoped_guard(mutex, &hotkey_thread_data_mutex) {
+	scoped_guard(spinlock, &hotkey_thread_data_lock) {
 		hotkey_driver_mask = mask;
 		hotkey_source_mask |= (mask & ~hotkey_all_mask);
 		hotkey_config_change++;
@@ -2446,7 +2447,7 @@ static int hotkey_kthread(void *data)
 	t = 0;
 
 	/* Initial state for compares */
-	scoped_guard(mutex, &hotkey_thread_data_mutex) {
+	scoped_guard(spinlock, &hotkey_thread_data_lock) {
 		change_detector = hotkey_config_change;
 		poll_mask = hotkey_source_mask;
 		event_mask = hotkey_source_mask &
@@ -2469,7 +2470,7 @@ static int hotkey_kthread(void *data)
 		if (t > 0 && !was_frozen)
 			continue;
 
-		scoped_guard(mutex, &hotkey_thread_data_mutex) {
+		scoped_guard(spinlock, &hotkey_thread_data_lock) {
 			if (was_frozen ||
 			    hotkey_config_change != change_detector) {
 				/* forget old state on thaw or config change */
@@ -2726,7 +2727,7 @@ static ssize_t hotkey_source_mask_store(struct device *dev,
 	if (rc)
 		return rc;
 
-	scoped_guard(mutex, &hotkey_thread_data_mutex) {
+	scoped_guard(spinlock, &hotkey_thread_data_lock) {
 		hotkey_source_mask = t;
 		hotkey_config_change++;
 	}
@@ -3329,10 +3330,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	TPACPI_ACPIHANDLE_INIT(hkey);
 	mutex_init(&hotkey_mutex);
 
-#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-	mutex_init(&hotkey_thread_data_mutex);
-#endif
-
 	/* hotkey not supported on 570 */
 	tp_features.hotkey = hkey_handle != NULL;
 

-- 
2.56.1.839.g22a8290db9-goog

