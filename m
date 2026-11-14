Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678988;
	b=MdcBgGxe+fPh57u3yniWOk+jI4Fm8mvcMPqBCdBeRXPNQzxE/1Y7XTigtA0npPnK+sZq
	 /zyI7QZUkNj+4R8xA2uvuqz0AopKBxtyANBvumA68dpibADVZAH+A5mI1qCHuMgdyB1+Q
	 5/1C8qKBlWUzJDm1qfND3hDJtw1AoKuyL1xVJNqJNrfuGXI+d17XNQIYyfDDfbLxidnjz
	 ZnwpkO38+Q/Gd65Oblg7JuxhGNa3tD+/BlYA8fgjpnRxWI1PZ2kQSKCo+RKgtlXf+fTTi
	 PV63pRaRmzWjWgd7LmGlCcOI13xcTd972xCAGPPMOY+Gznx0s4MjMyX4Lvjkk4GGSew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i710EDxhs1HHbZwQVt63v1uAh/hL+lpRmvt+Vbo8iM8=;
	b=EKgpsDjnzbAnuTcLwW6pBj5nTvJVRhkgwAkFKO5WMbQKgLpH8uV4F+ziD26XpsRHEMrQ
	 4kVYPEj8omwLUTYsnxa7iDjAHmLbnv4p4dqhNnq6qdMaYA1fwb8faZCZaPw2/Uxapt7pV
	 AMQJWkGXUoJGTNlrWVfwP+Kz951TrOJp2P0KuctqVIFxsrkUB/bWzHbTcjKcPBI5LaX0w
	 hblE1OGj0MgRxS7u1CptEe+jj2dNP3oyBFN+HqhofWncWDlFqQgTKnkJ+Xw6twrjhQQeW
	 2GcJDAZCdtHdF6Ab/m+SNY5ZE+NtjA6JZJTqITn17PNcjvVHzJNzK5rB1jVp91fr3rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWETsPea;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22037606A329
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 17:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22037606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWETsPea
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso541649a91.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678988; x=1795283788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i710EDxhs1HHbZwQVt63v1uAh/hL+lpRmvt+Vbo8iM8=;
        b=HWETsPeag+bFtE+dRjzmPX4oXUDvXcr1yPp6iuiC2K9aRI90hNzOpKjddkBhlmGFU5
         IfW3DrJ3cMFK+1y4ggpGyIyyk6xDe7id+7rgJ0YMcchbzOSL+GGQ2E653jcFq7oMLpTP
         BPMZ/yTMr60Q1mY0x2oKj5i8cmpm8mFaSozBSsdr2BRosfeLuw+NqrvbJSu75HKngLyA
         X4w2NbMkx63qiAteY+gaY0QwxJ1QAfQnzO79DPaSpJ948IOpAMjOv1M50AumrisJQuTN
         MJGiQPy5t8ns7SuIIVyZC5ed2I9+b0aA2KkxnoyeSTEGNwmkp3esqZszJg+faGLFp5zs
         Vq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678988; x=1795283788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i710EDxhs1HHbZwQVt63v1uAh/hL+lpRmvt+Vbo8iM8=;
        b=n8a0EH4ODvD0oXjUI+wg82WxtM/ZyVuaVeBvYzpj0UtdKtMZ1xeTw3sM8pWFHI5hIP
         aFCjLDgCLiViZDOMdJqYhVwEdniVCVeob+GRcN0dn7Hl6scz6gb6R+DWbPI4uplnppv5
         s6HqmlCTwFz7uFcOgOrG5S8xptrZiFzHKgryNYBqVE5MWxEDb+6CHCZ1CM0KWinObQOy
         m+Ikr4aAS08LZENcrkf88ukTnui4BtKLr7osa5WAavdimzEhGoQfbbh+N4xKdYPKBLK4
         4uEmMMeD7Py0ETOBQq0NBM5ioZdMteNXKwBHGylwp3bhANMAV52u6hjMOM63u5QadxkG
         j2qQ==
X-Forwarded-Encrypted: i=1; AL+hErGKAzBRZsCXeGQ2s0h0yPzBgiinQCKUqw424+bPxBQaYL8qQCpZJMeRDAGr6Rp9I6/ckxCJxBSL+UkSY4yFlTnrxOw2@vger.kernel.org
X-Gm-Message-State: APuU4Z8xU6S60JtS2f2ecbQGyYxVyCJKL5XvbGde/lQ3GK1E9+UMEZ57
	20n++Fa7oNYZp5ky9B54lXn4T23vGoIrI+PHHXSCwtrSUi7ZuA6qKH/m
X-Gm-Gg: AYBFou26gLhz7AVYzfXngjqn7IBP7BCAEQsYkrGAYgufFFFnEbeziny9kjiGcyyel2t
	S+fIp7QAdUbpVtwfACzBNEvUwSbMFmEpynhPSCPCAAavah9lO5A94DCD3cids6mNxkhv3ZHNyYO
	Y8oxjj/Me/J3ojJjZEqIedWhLk63PniZ51A+l5JdOsUTKOKWivW+OWNKH7sjYPAu+j1pYI69AG0
	PNu6riwhGLW6dziwaduUjHMxNgZ9ZlDWTpnQsGsGs+AlZblYSrgE00sgtVD5ZiF4uVm5apdaYqd
	svfiNmO1MK0vzBhucTJ6Uyb0cusRIg5twWwdpxW9GgqwyU4Herj5L2BvxeyKS6lNPO5Z//joMZx
	mvvYZmVQjBNUPZF2Ma8/tC/E36N1sfzbY9CYxqbUcthwjJBSYFKd2qfW1fzI6VzXOZGUgqrahuY
	WfmwQiiVymqup2mgHR5Dm2CG7rWgEdEm+72iyL2ksdCAnRUqrbA7w0JCEIgglmL/DBjwenwEw8F
	93uWAETKidqAMKqraLvjxyohoF9Ha2yt0bnOR13QQA1UQ+4aAnlzTwrbXK2fE//XeHksLMXdyWV
	x9t4TQRona4xg0+GdeI3YHX9YCgd
X-Received: by 2002:a17:90b:5608:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3b1b07ef0camr5928750a91.9.1794678987564;
        Sat, 14 Nov 2026 09:56:27 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:56:27 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 3/7] platform/x86: thinkpad_acpi: Sync LED core state on level writes
Date: Sun, 15 Nov 2026 01:48:10 +0800
Message-ID: <20261114174814.62153-4-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kbdlight_set_level_and_update() pokes the led_classdev brightness cache
directly after writing the new EC level, without notifying userspace and
without any locking.  Commit 06da5325d02e ("platform/x86: thinkpad_acpi:
Stop setting led_classdev brightness directly") already removed this
pattern from the sysfs path but had to keep it for the proc interface,
which has no LED core path of its own.

Move the LED core state update into kbdlight_notify_level(): stop
updating the cached level in kbdlight_set_level() and have both the
sysfs and the proc write paths go through kbdlight_set_level_and_update(),
which writes the EC level and updates the cache under kbdlight_mutex,
and reports the new level through the LED core, like commit
07f48f668fac ("platform/x86: ideapad-laptop: add FnLock LED class
device") did for the ideapad FnLock LED.

As a result, writing a level through either interface now emits a
brightness_hw_changed notification, so userspace listeners see level
changes from both of them.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 23 +++++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index c8098f317..657a19d11 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5108,17 +5108,17 @@ static struct ibm_struct video_driver_data = {
 static enum led_brightness kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
+/*
+ * Caller must hold kbdlight_mutex.
+ */
 static int kbdlight_set_level(int level)
 {
 	if (!hkey_handle)
 		return -ENXIO;
 
-	guard(mutex)(&kbdlight_mutex);
-
 	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
 		return -EIO;
 
-	kbdlight_brightness = level;
 	return 0;
 }
 
@@ -5183,10 +5183,12 @@ static bool kbdlight_is_supported(void)
 	return status & BIT(9);
 }
 
+static int kbdlight_set_level_and_update(int level);
+
 static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	return kbdlight_set_level(brightness);
+	return kbdlight_set_level_and_update(brightness);
 }
 
 static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
@@ -5245,18 +5247,21 @@ static void kbdlight_exit(void)
 	led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
 }
 
+static void kbdlight_notify_level(int level);
+
 static int kbdlight_set_level_and_update(int level)
 {
 	int ret;
-	struct led_classdev *led_cdev;
+
+	guard(mutex)(&kbdlight_mutex);
 
 	ret = kbdlight_set_level(level);
-	led_cdev = &tpacpi_led_kbdlight.led_classdev;
+	if (ret)
+		return ret;
 
-	if (ret == 0 && !(led_cdev->flags & LED_SUSPENDED))
-		led_cdev->brightness = level;
+	kbdlight_notify_level(level);
 
-	return ret;
+	return 0;
 }
 
 static int kbdlight_read(struct seq_file *m)
-- 
2.56.1

