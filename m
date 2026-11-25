Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648296;
	b=W7oWAPPFj2eRp0M5lfug+jCRXq3Cio8K7mY70ROzZUQcIF2hlh9F44iDZ4AIE688Mzp/
	 y2ynP5SvTjpGE9QsY/iVvz763IUWo0Zk0Jeo8/cuDxdQ2KJrA0LCzr3BmmsRIq7H/pHLB
	 e/nGoTlN6lW80A3T75HlEnMbBNMFErEJQ+DY8h9bgshKaMuVEMwp+6ubAULfRQqHQhLI8
	 AXy71C4NWqjF0J0D1cxXQHYgHPjCGkZIWF6rvs3fQKmgoSPLUauNvOd4fFG0KGhFYSQeo
	 +60jkHtoHciNnRsC6xkwrnYnAnG0QeJ7oyrXfimJAv/ZQaffba4vv1fW0/cpO3n70Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=6fK/lhjogqUYKhE7aNUS+Ico3frDqjb3CNTeub+YoI4=;
	b=saYwWPRa1iHNnXls1IwDhQZpK+s1oyphjfrF6eJsNckafu4Ii+B+AjHFFSPIw/e2GzNQ
	 Ja1YlsSLe5zN7Hm2kGErjIfH7sNsAnDv45fQ0ycJmOjiYBs1Zejhz7XcUAbGSUEgMjDvi
	 DU3WCOv5ygm9Y4v26zZQzPrhtm2K5CLZewg5iMrIqnjNI9ciTCaMEb6Fk1YgsF9NIeFGN
	 u5bZWNGZ+vld5I12QKjc4RKLpQZaZpno68wN7PBeT9jABgjKh22XvmdZQLuIgPWMA/Vdw
	 QVk1JkXmvOg7ozQpT9woM7JQNhYrzsZj0q96r7302Zd5V6v3F0aK+WUNxwF0fOX3k7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpRZmOyN;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C99606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpRZmOyN
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-170135e43c7so9848181c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648296; x=1796253096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6fK/lhjogqUYKhE7aNUS+Ico3frDqjb3CNTeub+YoI4=;
        b=RpRZmOyNVdikLRmWT2EcoQgLc3lrynTGUfSKn+qLeyNP3Sxl/Ta4GJ/iHN/86E+mIr
         ZAkUXJhs+82qn6E5o+hNID1N1jiNeSLOudAUU4TSwhxmDEcQhA4prFnC8X8rDyzMAKGG
         7Gt5iTA30clIVZ8VBG2jIa5xP74vjFFaRkd6HD2WmkyNmAOUgZ1Vkfz5zwggQ+v+2m87
         X4SbIs6gXc5B35szxd0IYRcXvn3FmMEsgCiUOWCrzEfbakQGI42h0PpjwjSdNc6l0jTP
         /1PqzNycI9TMw6ZUmdz9e4zcaInRNsjDEnWVm5dCC7YQP52/qPuwZ3ZcclUI6nre5Pxs
         Coxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648296; x=1796253096;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6fK/lhjogqUYKhE7aNUS+Ico3frDqjb3CNTeub+YoI4=;
        b=ydqhvmyWL0z6skZwK/6iok0ym/U1rlpDIKmNTTrGMLil6WZRVjQZgKazBsWogCKI/K
         moxVQtE54IDv9GlzfO4SQjxJE4BrwXUuCu5FwA3V9gCpBXJUKJuYPNJzrjhsyYUw4KUh
         RGMotE5YQqtCLmKPpxplj88csvrQdzmY/ZAUvLKD8Kx/QAm/lxxiEwdPU07wPtxMbafs
         Fuhatyl7ierVuEKPvf1Acmy/6RkHc8CKlcqfTYneb/vn3yKVxEOGpDPNrowMcCrXRNhz
         yxxif3sR7XK2dHIXP78/kLihVvxHajS/Y+0ac/P2ItpJIsbGQVbBiWr2RFE5OedFnTZF
         o2oQ==
X-Gm-Message-State: APuU4Z/eJhRuOIVz4yT8G7Ao1ZAi9oicoQQlI6kFC7Yv1YzbW229TUDp
	eEATTIODY1RRk1aMFMWG7oikhL9nXSdCZN03zirZapXRLI4HTW1GjxdlvxaqXQ==
X-Gm-Gg: AZFdTZcd5tKs2eCKRSRTyBjvlZ1G6ni44QRw8Cu5T1aEnD0taPQ5S64mUbGEp/twBwq
	rdy9KzqZjcd4JPP63VR/aXDtBtGgYRzMx8DRTBtlJufNES9r6+P2nf8Mh/i/Bp4va+0R7RasW8I
	Cu9aZuIdmuTrtGuGBqfRik6St/0oHPt+vVYMnTnjDXSgl8vBtIJ1eR6gyvdEDBxKxP3zAPjGJLT
	9PlNWvUOgONLK9y5Rm07lU1hKtpEHuj6+iFEisNyzVI1G29sUuHvyE0aniHkbqkkeaVC0SqaVec
	wyPkqCfUL8EMcPyt/iaxQ5gUdh+L6GPjf0CSmBAsSNXj8vSmqraNbaExLxcay4uaPtit9+ipyCF
	UxFk1ovCXc5XQx0709e/NYvlqUqxUag/qHy4aJuR/YjgVQQwtowALXzw+Hm4dSzl73zsDIqJWYX
	e4kUHYVAtw5Dr+HxJbhkST7HG9Bh65gNx2Bsguah1qqpxgHgLG46uYPre05yMBINXojjOqpWSbW
	VzpjSNf99xljyGy9a7BIGLHuKerFXNR9hE8a/N0vpTpJxe6nmbRjFubgS1l6qi0ZOHCb2kmHDwY
	I8ug9X4pzI+q2lW4HTrCL6ULEHoh0KAEqVkOGafrK/bfrzREItPv5YC5soY/jwBWwUUIC7iU9O/
	NBx4TQtlAxKN/EToiXg==
X-Received: by 2002:a05:7301:152f:b0:381:c532:3d88 with SMTP id 5a478bee46e88-3857093c38bmr21737527eec.23.1795648295459;
        Wed, 25 Nov 2026 15:11:35 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:34 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/8] platform/x86: thinkpad_acpi: clean up hotkey polling
 and locking
Date: Wed, 25 Nov 2026 15:11:13 -0800
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIABFrB2sC/yXMQQ6CMBBA0auQWTtJpQGiVzEuyjDQAdI2bTUaw
 t2psnyL/zdIHIUT3KsNIr8liXcF10sFZI2bGGUohlrVrbpphdmKW4IZ0FAQtD4v/MXg1xVbalj
 pjvpRE5Q+RB7l838/nqfTq5+Z8m8I+34A4dgW0H0AAAA=
X-Change-ID: 20260930-thinkpad-acpi-hotkey-poll-6c5e037cbf3c
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

This series fixes a kthread lifecycle bug and cleans up hotkey NVRAM
polling setup and locking in thinkpad_acpi:

- Remove the unsafe early return on TPACPI_LIFE_EXITING in
  hotkey_kthread() so kthread_stop() never races with kthread exit.
- Drop the dead -ENXIO check on hotkey_mask_set() in hotkey_init().
- Drop obsolete tpacpi_lifecycle checks from hotkey_inputdev_open() and
  hotkey_inputdev_close(), fold hotkey_poll_setup() calls into existing
  hotkey_mutex critical sections, and remove hotkey_poll_setup_safe().
- Call hotkey_poll_setup() in hotkey_user_mask_set() so that runtime
  hotkey mask updates via /proc/acpi/ibm/hotkey also start or stop the
  NVRAM polling thread.
- Replace the HOTKEY_CONFIG_CRITICAL_START/END macros and manual
  hotkey_thread_data_mutex lock/unlock calls with scoped_guard().
- Convert hotkey_thread_data_mutex to a spinlock.
- Remove the unused hotkey_poll_active bitfield from tp_features.
- Drop the redundant tpacpi_inputdev->dev.parent assignment in
  tpacpi_pdriver_probe().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (8):
      platform/x86: thinkpad_acpi: remove early exit in hotkey_kthread()
      platform/x86: thinkpad_acpi: drop dead -ENXIO check in hotkey_init()
      platform/x86: thinkpad_acpi: simplify hotkey open/close and poll setup
      platform/x86: thinkpad_acpi: update polling state in hotkey_user_mask_set()
      platform/x86: thinkpad_acpi: use scoped_guard() for hotkey config locking
      platform/x86: thinkpad_acpi: convert hotkey_thread_data_mutex to a spinlock
      platform/x86: thinkpad_acpi: remove unused hotkey_poll_active flag
      platform/x86: thinkpad_acpi: drop redundant input device parent assignment

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 148 ++++++++++------------------
 1 file changed, 52 insertions(+), 96 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20260930-thinkpad-acpi-hotkey-poll-6c5e037cbf3c

Thanks.

-- 
Dmitry

