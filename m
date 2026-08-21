Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5002EBB8C
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 21:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787348857; cv=none; b=CbKdZyb6BQ19xHAZlJE5MRuj+9VDUebl5vRId7r4IKkc1NQelxNVPrQ8ihnxP9hgqZIlnBC1IneY7ed3Jw76APQBal4RDGZyxUWpZ/U2Yh9/Mqdl2TQbyFgney+zNaFia7bXiqPNiWUBTxT3q8z9fpHHt5FESEox536dcKpERys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787348857; c=relaxed/simple;
	bh=5Z2Lpou+idaDjMdbBLj5870okjZ93hYD6gJizvIkOTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NQKHMDEYDz9cgB3jnZrtCxvFzqso26JLYZmBxRXKfXXS1OD/magWyCEAHbYsVPlStUOfP5/y0Ji3i/efQstPmm3Wjy5XgWRG/kNFPmEDuWP4vWYdIoIqwgfkj7x4DiFTAyuncdVlOxjzgXo0kvyG3DENy9ntjU3qlXpIJPMY+h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSoHFjH+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSoHFjH+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce7d2adef4so21108185ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 14:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787348856; x=1787953656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSjgsk8Yvs83A8c6v1zqzSAqyvIC2+XLW+Y3mp3uQzE=;
        b=dSoHFjH+UTqPqeLtzrtAgF0CDXKh3AMuXJ7+Wmc9Rnn5jF1vTkDXKHAiB19pPYh8+p
         9/9py2zqtMufVoWPRABVnr6UMxKXZrXU1OZmigB+WbYtqT3XmRTOPTTc2y3ilfUBucPy
         O2kqQec5Bd0FvdRflpZsniymUKA12W+sS8rFMwzxIrTgqyuO2LSOCtcfMnQ36yVnqWA5
         1p6phqLgV/IAkU4rtI1BOXPHpSgSsCoY5X9muU29sjNLQphzYoVHHcyLQTNKf2t0pv3F
         rZ6KiIE5byDnUFTrLwcy8P8mqmjNTtba0JRBm+1TRXk9QqqDaEWCDZ3sf+gXiE0DLDbF
         6S9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787348856; x=1787953656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSjgsk8Yvs83A8c6v1zqzSAqyvIC2+XLW+Y3mp3uQzE=;
        b=GQDO+47hrIDCfVCOt+VBZyuGTRxs7Oqcat8fDDREPsss/7uwCv07aONozawyyimjkX
         qBiGyn83lm4u1VV5dKbcsAinB1sDEYiNPzMilC7M6YvpiSf/SDSNyiHZatHtkO4atw75
         V6RpyJell7hrY7qp4VmdRYrVsf9LYrNPnB4lWSzXQYWQBci1lRSAhbxdWRB2qlJlIB2l
         n232xSgZs/8ap1efyZeLQqRdIZdqoRZ7yYluOFZUEU/E2r7yGw5vm5xD5puXOvzw8/Fw
         0qMnNmX2+ESFOGgmGR26F9GaXBryXr3zOkRpGsXvVpa8dfRvRegsHP6tzkEoI7pT0X/F
         RNaw==
X-Forwarded-Encrypted: i=1; AHgh+RqIz3ftRdHTrJV4fbK+Sz97qMB+LS1WNf0KO0wpt3vHHSeTeRpdGIFtTmdp9BH5whwJx5Miocbk3rSjYo1FLgCPoEah@vger.kernel.org
X-Gm-Message-State: AFuF++nWQEx4EqntxSXZUh4XaMm8D2DUwTKWYLmyXyOCUIC7ayUZrFNu
	JYjkTLQtInGrN5ADzFMhLuwcJuT1qSxkH7N8fvWJx2Nk9ozAhhykHOb0
X-Gm-Gg: AR+sD13hkAspYcMmocOdD3lPKHHWeyrGMbxfLo/2TJ2vphBlIh0TRfdnXOrVc+QKooP
	yRceUp0Sid0ZS9qT+cXfZ2EZA360zDIefR/vCTMnvdKzOm9UfN/whS1oW3wM1v/2Hc1HGeJk7ge
	7OkVpXjKOg0RtWYM6kcmEfXgbeNsAvquGy6B24U8kFSeyvBz8hjgMP+hZy6rJ/0jBdHNU6XohTD
	68jIzTbbQkjxij6iah/QhIVyzcdVs4Xkpkdrh1+aOtRrZlMBf8KYOiwstdMcJ7dvT3qiHGBhbw9
	Qu9aOwGyTD8ENsk4fLy3q1kdeB5rFqAHUZZBuYrn0oNMD/hmoVz/crYGIjdL8JvCaODPD32TC7W
	5Wnwkm23npYiOV9p5j6DMC9LRixOHwZIf/9bFTzF7LzqDzWdMs2zRMQ1qdLa4EhaEe1w0cxcc8m
	weGG5iwH1zxWDd0tQV/X3s/ueFaev8HGWk22oByzbzg2oBtRxPZ6Szl3XnoqNs2Y85pYPjU6g0E
	X7foDBwIRNCIciQyWE=
X-Received: by 2002:a17:902:cf43:b0:2d0:cc92:f7ae with SMTP id d9443c01a7336-2d64ade9363mr188665515ad.3.1787348855568;
        Fri, 21 Aug 2026 14:47:35 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d497sm45664198eec.14.2026.08.21.14.47.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 14:47:34 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 0/3] platform/x86: lenovo: Add Legion Go fan controls
Date: Sat, 22 Aug 2026 03:17:24 +0530
Message-ID: <20260821214728.87773-1-mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Capability Data does not cover all fan controls on the Legion Go. Full
Speed uses a separate Other Mode feature, some firmware exposes an RPM
reading that Capability Data does not advertise, and the custom fan table
uses a separate Fan Method WMI interface.

Patches 1 and 2 add Full Speed and the RPM fallback to the existing HWMON
device. Patch 3 adds a Fan Method driver and attaches the ten curve points
to that device when both WMI interfaces belong to the same provider. Other
Mode continues to work without Fan Method.

The open question is how the firmware control range should map to HWMON.
On the tested Legion Go 8APU1, values from 0 through 115 produce the
observable fan response and correspond to Lenovo's 0 through 115 percent
range. Lenovo software shows 0 through 100 percent to the user, and 115
reaches the RPM observed in Full Speed mode. Firmware accepts values
through 255, but no RPM increase was observed above 115.

This series keeps the native values unchanged and exposes the fixed
temperatures as read-only automatic points. Should the driver map the
effective 0 through 115 range to the standard HWMON 0 through 255 scale,
or keep the native firmware values unchanged?

Aditya Dash (3):
  platform/x86: lenovo-wmi-other: Add Legion Go Full Speed control
  platform/x86: lenovo-wmi-other: Add Legion Go fan RPM fallback
  platform/x86: lenovo: Add Legion Go Fan Method curve driver

 .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
 .../wmi/devices/lenovo-wmi-other.rst          |  14 +
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/lenovo/Kconfig           |  11 +
 drivers/platform/x86/lenovo/Makefile          |   1 +
 drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-other.c       | 215 +++++++++-
 7 files changed, 649 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.rst
 create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c


base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326
-- 
2.55.0

