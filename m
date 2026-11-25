Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648304;
	b=EHb9s63h7D59lXbl8yOUbXywtF99kD3hJpCk0YdfPt52A9yzfHN1FtHVmXd5aTn+S9Yz
	 /w9qAqTI1cHzWmkz0cLwEK7AvCYgTbEme0D8XgCVQ9AP8ZGGAnZjVtXKeVErI+FURvgE9
	 QBU1QCNT49MBHcjaqN/LA/ovCzJQlJc7kLkmtccBZkfOcgVjUQKD96JlIWMzowNBSjJhF
	 A04kVRuybtxBbBeiAuJw1dSxe80xwGKRsAXziGkStG7cYAheYWk0K+uUhrwDUuz6clg0N
	 7h9Y2ANbvnYUsrdQlF5PCGlj2gW4dOtPJ5mqFEheOwgULOqqLrl+2yZcTajIYB70AIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=5cvJQBj+32mQZzgEXnbDdMDSsWCUD3HIOJOPFMiDUiU=;
	b=P1GBVjqlANF0UfwUSoP1kaQd8e+iH5m19Y2nGM3CxHRAOLFlbSVezv0gaz5CVcyLcB/h
	 Eo+aXykXaqnHzHPHeaaMeOj3fYhoIx1908TyfARUMy1ouI/mfl2HoD8Jb00aO/ChkCwfX
	 y71kf26cc4xZe8ZpWh7/UaWuQSecPRwmzY/pkQ11XWx4o85FEu2Bo8SaYygYm4of/CGZb
	 Ar5GE7AklqwHJYqLheDGev079kEBKBpxYdD/Baf2y4bzLzpJQqwrGRpQr+LShT6rdQPae
	 0iH8/mzAfSCnZRAbZOe7EYnkPZ4bgmNdL6Z6vMuGpmDX73uIamkBmXJh/phyYsLzlKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAgSZC+x;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED11606A33F
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED11606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAgSZC+x
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38431138772so8309647eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648303; x=1796253103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cvJQBj+32mQZzgEXnbDdMDSsWCUD3HIOJOPFMiDUiU=;
        b=mAgSZC+xTuk4z1UhEt5BTSsX0Q7NKWl/LXnAdM0qwzrMkb6yn1cKB0eS6eIRTgNh46
         +Z0WI/xAWXvpY4OY9SLOWc0aHzLN79LcgUn9gLJ32yPk8zRv7dhTPCeLs0KIbFMvA5bB
         wAfITjLG8gr2isUZcVDrXOUCtgKfOz6GYbdpVZ00JISF+/I9shG3Rb8uawMoAQRzdeGq
         WooCD9z4pku/5/nVSXmn/M54j+ShgEJkfNxwFF1jCZYsvLtrgYSqYy3UDV3X0+hxcD9U
         1QMrgTdugTKEVBV41rMRVlbZF8/f96o6ENe5UuoV3r85Ek3GpzvOmqbaxWON4ie91fPM
         Hw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648303; x=1796253103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cvJQBj+32mQZzgEXnbDdMDSsWCUD3HIOJOPFMiDUiU=;
        b=0yCqOSy3QVIWoRrE/fATcpBwsTzG70YEiKQCcSqZAELio3eq6ImNS0tAKlxpcTWkRn
         uldlBCEymHs7U738O3iPJn2RoCmutqTOPIEi4Ggq4HsCk3q3CSRGQi+1c5YQUFYntolq
         bE4eqDtn8vockYSSYJUsPMwwswGfJ7qTAf/NmoE0UBtfw8+4olpk8r2wVayqhPZkxkoK
         zfJn3f2pwMhpwxDp8RdchQjaFl+79+xF5B59NyKVY5B3cFvRT9rn1hiUCMan67oOY8kR
         iJPSrv5e9mwxDEFkoUsgals0PCg6He/e+AO0JmplfAncMhAfyDaYKFUojWsb/WunBU2j
         +n5Q==
X-Gm-Message-State: APuU4Z+N7IvSmILE1IWAHuYRLzD6JrAR+tLk+CW09RFH9kX9JuX0uveV
	YDU2X657hGwTM41OqZUZxNsnsAjKrDAX3dIGoaG5B6RZ0mm3cZlk835i
X-Gm-Gg: AZFdTZd93CaHDq8CsA8dMd+piCXk+xZ6xNaXEUBxe06rGactpy7cHpEMyB0/iRC34Iy
	5EthstOWzAxnLpOsUZ4N19dnyqoYSx9GBd2VoJ9JT4xVBeVlHehQOZkNDC6hyCLXpWMQiqCLRRs
	U+A2GxHlHtKs3d6MnO/78rVNc3Y6JMl3J+mCcWez80l3UpF8haJqNDe7gRPSkTzwgVoslMJwurN
	GEzesyqR8U287ZHa9o7lMDSxhetCr4R1dwSJTQb5BcY8INiMFQcJ/PwIaKFdkMuIby6J6TOK126
	mU9ZiifvSTNWkyaq+IyCzLHuSJdouL7LCBo8rSRFR2lWgnn7OvP2Dn5SVq6AlmQPYstjSpCpFZS
	wugxZnGFCv/JMdV55U1lYOwg7Nf3oTO4qIA6RHpn0xvP9dSVlB2lBaic1zWQt+Q2Myy1l+/agcf
	Kr+XK2iHgygyvZ9OlKDTibVroom46E1hTfWacTB2IG4qFhqqWPncUbcypdOql2Dimer82VlmN8M
	fm7ETzTGMrD7xAZ8wZCK5jrutmocq7JJ7IrpOlLM4LsaFpN4V5khgixotc4xdFx2MaNbEHcwTc+
	MwpE2/OgQiiCQSaJ0r950PSRW6zevG+7N3vYOhcSgxR7lnNWCCW2iXRDIIhLARaw9XzLEkc6q6x
	l72XulPWxEghob8G9A8L6dJD13ZzQ+A3cU+H9p8A=
X-Received: by 2002:a05:7301:160c:b0:382:c1cf:163b with SMTP id 5a478bee46e88-38571419d38mr18816138eec.32.1795648303039;
        Wed, 25 Nov 2026 15:11:43 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:42 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:18 -0800
Subject: [PATCH 5/8] platform/x86: thinkpad_acpi: use scoped_guard() for
 hotkey config locking
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
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-5-6dee57519c2e@gmail.com>
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

Replace the HOTKEY_CONFIG_CRITICAL_START and HOTKEY_CONFIG_CRITICAL_END
macros and manual hotkey_thread_data_mutex lock/unlock calls with
scoped_guard(mutex, &hotkey_thread_data_mutex).

Keep the hotkey_driver_mask assignment inside the guard in
tpacpi_hotkey_driver_mask_set() when polling is enabled so updates to
hotkey_driver_mask, hotkey_source_mask, and hotkey_config_change remain
atomic with respect to hotkey_kthread().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 74 ++++++++++++-----------------
 1 file changed, 31 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 7a82a9014a3e..58500b72d9d2 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -1819,8 +1819,6 @@ static struct task_struct *tpacpi_hotkey_task;
  *
  * Increment hotkey_config_change when changing them if you
  * want the kthread to forget old state.
- *
- * See HOTKEY_CONFIG_CRITICAL_START/HOTKEY_CONFIG_CRITICAL_END
  */
 static struct mutex hotkey_thread_data_mutex;
 static unsigned int hotkey_config_change;
@@ -1828,29 +1826,14 @@ static unsigned int hotkey_config_change;
 /*
  * hotkey poller control variables
  *
- * Must be atomic or readers will also need to acquire mutex
- *
- * HOTKEY_CONFIG_CRITICAL_START/HOTKEY_CONFIG_CRITICAL_END
- * should be used only when the changes need to be taken as
- * a block, OR when one needs to force the kthread to forget
- * old state.
+ * Must be atomic or readers will also need to acquire mutex.
  */
 static u32 hotkey_source_mask;		/* bit mask 0=ACPI,1=NVRAM */
 static unsigned int hotkey_poll_freq = 10; /* Hz */
 
-#define HOTKEY_CONFIG_CRITICAL_START \
-	do { \
-		mutex_lock(&hotkey_thread_data_mutex); \
-		hotkey_config_change++; \
-	} while (0);
-#define HOTKEY_CONFIG_CRITICAL_END \
-	mutex_unlock(&hotkey_thread_data_mutex);
-
 #else /* CONFIG_THINKPAD_ACPI_HOTKEY_POLL */
 
 #define hotkey_source_mask 0U
-#define HOTKEY_CONFIG_CRITICAL_START
-#define HOTKEY_CONFIG_CRITICAL_END
 
 #endif /* CONFIG_THINKPAD_ACPI_HOTKEY_POLL */
 
@@ -2159,12 +2142,15 @@ static int tpacpi_hotkey_driver_mask_set(const u32 mask)
 
 	guard(mutex)(&hotkey_mutex);
 
-	HOTKEY_CONFIG_CRITICAL_START
-	hotkey_driver_mask = mask;
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-	hotkey_source_mask |= (mask & ~hotkey_all_mask);
+	scoped_guard(mutex, &hotkey_thread_data_mutex) {
+		hotkey_driver_mask = mask;
+		hotkey_source_mask |= (mask & ~hotkey_all_mask);
+		hotkey_config_change++;
+	}
+#else
+	hotkey_driver_mask = mask;
 #endif
-	HOTKEY_CONFIG_CRITICAL_END
 
 	rc = hotkey_mask_set((hotkey_acpi_mask | hotkey_driver_mask) &
 							~hotkey_source_mask);
@@ -2460,13 +2446,13 @@ static int hotkey_kthread(void *data)
 	t = 0;
 
 	/* Initial state for compares */
-	mutex_lock(&hotkey_thread_data_mutex);
-	change_detector = hotkey_config_change;
-	poll_mask = hotkey_source_mask;
-	event_mask = hotkey_source_mask &
-			(hotkey_driver_mask | hotkey_user_mask);
-	poll_freq = hotkey_poll_freq;
-	mutex_unlock(&hotkey_thread_data_mutex);
+	scoped_guard(mutex, &hotkey_thread_data_mutex) {
+		change_detector = hotkey_config_change;
+		poll_mask = hotkey_source_mask;
+		event_mask = hotkey_source_mask &
+				(hotkey_driver_mask | hotkey_user_mask);
+		poll_freq = hotkey_poll_freq;
+	}
 	hotkey_read_nvram(&s[so], poll_mask);
 
 	while (!kthread_should_stop()) {
@@ -2483,18 +2469,19 @@ static int hotkey_kthread(void *data)
 		if (t > 0 && !was_frozen)
 			continue;
 
-		mutex_lock(&hotkey_thread_data_mutex);
-		if (was_frozen || hotkey_config_change != change_detector) {
-			/* forget old state on thaw or config change */
-			si = so;
-			t = 0;
-			change_detector = hotkey_config_change;
+		scoped_guard(mutex, &hotkey_thread_data_mutex) {
+			if (was_frozen ||
+			    hotkey_config_change != change_detector) {
+				/* forget old state on thaw or config change */
+				si = so;
+				t = 0;
+				change_detector = hotkey_config_change;
+			}
+			poll_mask = hotkey_source_mask;
+			event_mask = hotkey_source_mask &
+					(hotkey_driver_mask | hotkey_user_mask);
+			poll_freq = hotkey_poll_freq;
 		}
-		poll_mask = hotkey_source_mask;
-		event_mask = hotkey_source_mask &
-				(hotkey_driver_mask | hotkey_user_mask);
-		poll_freq = hotkey_poll_freq;
-		mutex_unlock(&hotkey_thread_data_mutex);
 
 		if (likely(poll_mask)) {
 			hotkey_read_nvram(&s[si], poll_mask);
@@ -2739,9 +2726,10 @@ static ssize_t hotkey_source_mask_store(struct device *dev,
 	if (rc)
 		return rc;
 
-	HOTKEY_CONFIG_CRITICAL_START
-	hotkey_source_mask = t;
-	HOTKEY_CONFIG_CRITICAL_END
+	scoped_guard(mutex, &hotkey_thread_data_mutex) {
+		hotkey_source_mask = t;
+		hotkey_config_change++;
+	}
 
 	rc = hotkey_mask_set((hotkey_user_mask | hotkey_driver_mask) &
 			~hotkey_source_mask);

-- 
2.56.1.839.g22a8290db9-goog

