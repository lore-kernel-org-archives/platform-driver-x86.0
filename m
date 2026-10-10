Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E19926656D
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 00:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791591936; cv=none; b=sx5mGyff5ldzTToyjNcfrNwYIc7PP/mH8GC7mcN/o/9pz9UdjB4GhJhZEkqieZQZSwqxjgs1V2QvhjM5p+n1XgjYEjbaOtPc+GiYhHWEGRlpwnl7TiPKkK9kIbGgfCM0Px1xvPUJYSOCDjEVwAQVyQJQrkOI7T08jmZmvOmiIZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791591936; c=relaxed/simple;
	bh=6E5xMLHAlQrYW0maMIibM2Q8a3PJVgHh0nCBXuCXQQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GL1Ca9TMIb3CPnlLkiB3kbSWNWTEcS6F8xF+8Il0z+UohyFHnAJsSFALn4M9Ei227fDsz4LSup8yW2MqYXNCytGWq8jYAmHVbQlZl5tQcGNxZi/UUINpCSLN7B4BW/nD4FBMrkr+wfE1EhT270rztYTajETDN5ortgDbu1szjms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDh6JoJv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDh6JoJv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so2410865e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Oct 2026 17:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791591932; x=1792196732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovl0E8wRHRIqinvA+kiX8Yz9BHb5WrBi5TGPjnLTzBY=;
        b=SDh6JoJvppQLF+VGh6wWp/5BffwNz3BMkP2wZsU+K+LKIxvLQglsBqAwiValDxVSMP
         /WTac/647XpMjdnCOSfFmizyo+zXQURMtoZTUc8ZeVXTrtQrc5JEoXTmrcqT865OnTuV
         cVXH+0tXwc+cyReTVsVvx8lg2arQQ5rc+G9Nko9QMTipmiDKPD4a0gQDYO2MIDrEuO9V
         g100JI0QqO1VM4qn0b1GdqvVBwVUCHNlQEHrXl7dxpdNGbATL2CJiqeYnVB9Hj+h91T8
         wQfHPkPzNg3x7NAcVS0DnYJq5hfIIYnxMi3+RNP8cfbOrqbbo86uxiOp7q6aUx8yU08q
         RqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791591932; x=1792196732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovl0E8wRHRIqinvA+kiX8Yz9BHb5WrBi5TGPjnLTzBY=;
        b=Q9Yj5AeVBw3pA9Dg+BzveEQ/2UgaVy9NxPUNEDa4A1LI8i+XhkC+igUlnD7Plh1JfL
         ac8vgNP0zY+Sn4tAW6EVT0T7Kt3KxI/mkJWkoF1SMmKQeqkKzMKWjQLArJ+vCuaTWPea
         4sjIaYpSrF5IQf1IccRWkHdg8DKBuQpA+yFdBkVLeMSxHf1DzqQ4LKh7HMps4ojfTub7
         FzaGgFiIiv4JJ6eoWOZN84XZpCz9NeVl6htmjpmDpDfUesesbVY1MME7vjiHa6rcpfcI
         wuB2itKhTU5njVtjfr0m70ii2BZPm4bWZykVFmp6Hozv+yiByO5E2IVFpFd+j5qoW9cv
         93Yg==
X-Forwarded-Encrypted: i=1; AKwUvBzKlUIpEDdOgGSu6hfFcJc4HaGVxBKlNGErNYiqFHRETCs7WPZ254GDtAmalpJZw0TRqPpQSnTNsdXIaQZH7jbnrZ41@vger.kernel.org
X-Gm-Message-State: AFq9FYJFxHEQlO3bR2viNFv1n2/38HSqWoXINbf8UsL5h76PRM1mmJF7
	1cuZ+3MXmXGYqeAc6jkcewe7BqLpwgXUqReD21Da52J9M7XFmjX3NRpD
X-Gm-Gg: AYBFou0lriOmlEo/AZ+FOjwE/PCif1kYoDNioyASzqbLTM5zc67JQMcoMTysmSu0plP
	e2c8Ej4XvdZueS8kbwoCo1o7j+NW2koJs3f8tVAX1KVmc6ZfgyWU4M6spoc/ocGBxE+6+sNpXH7
	1arT/NQy5r+F79QCzMtcaWqdk+JW/zj67pp8FGflKkxMoeL4YBISJmw/IjDh5A2c4oTFlEcEn2h
	ELkyQ5mpfRk1y2sVDSy+UdxZpURjCNExZkQhNd0aWXX8JpND1Sa7lh8ysntG27lXaO072GZjF4C
	8zyLcnp5O9YXOk+HyGU2vtf4fgPqrIi1Z5Z7jU5kZw/ht5S9QOuwNfA6zkW6HvDHGGRCV384npd
	6Mo2yH3WSaRBZqdKFZPBnVb+y6DyftnjcmDDhKaH5TeymhbgxFQMT7tcHCGo/w9x5FOc2idWoXu
	CKvJxi3RDkmonsCyB/CxP4gMrx0hEN7C+n8kmh3vHgJ3+/pfLxHfwGNYPMlJySOCQtqY1JqR/sD
	sBMiG9RFKvXhPyCGrH/T4Duc+XO+eKFSAajvjEqbQ==
X-Received: by 2002:a05:600c:3111:b0:4a1:811c:8069 with SMTP id 5b1f17b1804b1-4a18e49d640mr66951605e9.8.1791591932497;
        Fri, 09 Oct 2026 17:25:32 -0700 (PDT)
Received: from localhost.localdomain (diver-ua.la.net.ua. [176.36.105.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18ca4621fsm67003075e9.3.2026.10.09.17.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 17:25:32 -0700 (PDT)
From: Oleksii Kryvenko <diver.ua@gmail.com>
X-Google-Original-From: Oleksii Kryvenko <krivenko@itstep.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Oleksii Kryvenko <diver.ua@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	platform-driver-x86@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] thinkpad_acpi: probe deadlocks in hotkey_poll_setup() (next-20261008)
Date: Sat, 10 Oct 2026 03:20:24 +0300
Message-ID: <20261010002413.30007-1-krivenko@itstep.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksii Kryvenko <diver.ua@gmail.com>

Hi,

On next-20261008, thinkpad_acpi hangs in probe on my ThinkPad
X9-15 Gen 1 (CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y):

  INFO: task (udev-worker):537 blocked for more than 120 seconds.
   __mutex_lock.constprop.0+0x569/0xa30
   hotkey_poll_setup+0x50/0x110 [thinkpad_acpi]
   hotkey_inputdev_open+0x36/0x50 [thinkpad_acpi]
   input_open_device+0xa7/0x170
   kbd_connect+0x73/0x90
   input_attach_handler.isra.0+0x6f/0x90
   input_register_device.cold+0xd5/0x16f
   tpacpi_pdriver_probe+0x442/0x4a0 [thinkpad_acpi]
  INFO: task (udev-worker):537 is blocked on a mutex likely owned by task (udev-worker):537.

The input core calls ->open() with dev->mutex held, and since
d6479c25ecef ("platform/x86: thinkpad_acpi: Use
input_device_enabled()") hotkey_poll_setup() takes that same mutex
again.

input_mutex stays held too, so later input devices block. The
machine hangs on shutdown, and the sound card fails to register:

  sof_sdw sof_sdw: ASoC: failed to register soundcard -4

Going back to the lockless check fixes it for me:

--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2542,10 +2542,9 @@

 	lockdep_assert_held(&hotkey_mutex);

-	guard(mutex)(&tpacpi_inputdev->mutex);
 	if (hotkey_poll_freq > 0 &&
 	    (poll_driver_mask ||
-	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
+	     (poll_user_mask && READ_ONCE(tpacpi_inputdev->users) > 0))) {
 		if (!tpacpi_hotkey_task) {
 			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
 					NULL, TPACPI_NVRAM_KTHREAD_NAME);

Happy to test a proper fix.

#regzbot introduced: d6479c25ecef

Thanks,
Oleksii
