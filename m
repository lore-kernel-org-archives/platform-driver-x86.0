Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DD6322DBB
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 21:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069204; cv=none; b=FUdYjMNBhzSDie/NGnjtDrw0tTGWV9/AODLYfZ/p5jZ361k8lQf3v6bGTMgh/lmhwt0fQW8N0X5YowbxHjGMyGUBmETk0i0zz9OwowLkcjdsngEdYENKKR8xE1KOYZEMFQ4/Uw1dNsRVOVw0HhIIBqGAwNebthQZuXCtzIA6Jd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069204; c=relaxed/simple;
	bh=75BuXIjGpZny9CJyYZ3+cDjv4Td/7jryzbg1I2bUBp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sNW8HXq9/lHo6kTnjFRY5GCIsrxXv5oZUWT9Uju0wHXJSW1cSdo3qFODriMZOXYK+se3vVNU98/Jgxqqekm88epIKSgGi88gImIayNp2LtK9tYYSF2Vzs6fGQf7arQzlS8gWdQjxOAMf+xN6IjaCrGVXj0zaZqgBbC4PQ0hhV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmkL1HZc; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmkL1HZc"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ba488b064cbso999401a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Nov 2025 13:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763069203; x=1763674003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xm8LcnZyr//0nT7mWq+F1YEGC3NfbcijTCKWk6nFZu0=;
        b=BmkL1HZcTfHeiGfgLY8doTDPzVBx6ymCS/gRBaYt0Nf9adnjVfYTchjtfi0Zhrio2I
         qt7fsxhCNwypHkWT6CdaY78iCSSFVGHzB8cOhyauEWSkAd9UXHYpET6Ms0CVFvUFs2HC
         7e7HFwKSDb9qaTuFczTcvd+tf3bsfP0GWXH5xcmTDF2MXMFmCjB9wrQb4s5qcpQQPbOV
         28HoOeonsmF4m0pPxMV9vMJtOYzlyHgXCTkPHaBuZ91DxXDV73bgFCR2z9e/7S5JtnKS
         edL59PnoWjI7cp30tI/pUIsq4k5y1ADXWQjt2yB7K+6joSSgvBNxm0X5k0njK+CxMyTp
         oD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763069203; x=1763674003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm8LcnZyr//0nT7mWq+F1YEGC3NfbcijTCKWk6nFZu0=;
        b=kUBwZq2H7alILDQoGzAuLZCGnDq5QPb7g1sC63N42WAklA4XPDGoQe2pF4R2KR+0tH
         JCM3xL7ddo/fyfKDwq8bGuhdmmVBAGt0oimCrLAO88ccxLsNDx5gn1TmKbd91jMFjDN7
         /+tOSMQaoa3wLxSReaIfi1vY5ekdeIF1ik+IrJQLsk1vTBpjwS7vvTghQclqme3371t1
         Pii46AJUhsem8L82mqXlPlPUSk+/9EbpMYiKgZytOZuomkVEqrctHNuDhr+PGDVPSz5p
         brE/2AnIHVg3hF5RxPY7Cxj1l/fZYbmzvlFfmc7KuMLuhtIU7qQXWbXBM2y2Mrbs4w8o
         t04w==
X-Forwarded-Encrypted: i=1; AJvYcCVGAh0dm4JlKjU2Thw6rM3wgVHnSzzkPxNAZ/bKnbN3JQJZbhGO4EQgzInb7P1FnD6lUYbODrmyW0X4ooUmStoVeEV+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6+UGdnR1YtayZmZXhh8Bv5U/xDdeAKXh13VnX03VLMtGXfJ3k
	lXOF/KbHC2j51RlBsic1h51cseqhsDnyIOd3Xl4oKzmGm3bJhjjLXBXi
X-Gm-Gg: ASbGncvoioJPrTNOVY62J/R/Aug1+RceBsaB8WBTEfXLeoGj4EbZFZgCk0P+oY2A+XK
	xBlS9ffGP2yqx6Sk4TwRM98/aA0nePcOW/U0xTrKTs4tvNiRhr0P/Gp+D3ws6ymO05jE4HYoUDH
	sOwYkR1L2/gfUTLAedTVWbv7K+K98rUsvVzISk+UIeO6BafZ0IKcOKzb1xEMptBiZR8SSL3vCSM
	ZUO4ZtDazs6mqYMCBtjlu3ZMqf1rHJJwd4ZX/dE6kRlD22KzR9M2J+peuI9vIh0RkoiEk1NXdCk
	uYFU/GXFtW7Zzjf283W3mHa7RlHcbrmwLm9MxMT+UEP7HOjCYjo6oEgjyfkctvfWz7sPoaE3oBD
	iZH+qbXbaSPzMnxj+BEYJMRGPwnnwvFP9N5KPF9uaxg2jha9JkFt2uZsKtr5Idh0woS4U6QxAPK
	nzLQDdg3IFTCMKGESAAOr5ZB8xo66GAvrNZPRP/v4flBXl1sLklFZWN9wT
X-Google-Smtp-Source: AGHT+IH2ppKVKaegleIFYp2CPh1L2DqmyfOwakV0r/xJMX47RxpUdSR1jy5Z+Tosq9kSQTZd5Y8Tew==
X-Received: by 2002:a05:7022:69a0:b0:119:e569:f622 with SMTP id a92af1059eb24-11b4150c6aamr292336c88.27.1763069202522;
        Thu, 13 Nov 2025 13:26:42 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm1811414c88.1.2025.11.13.13.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:26:41 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 0/3] Add max-power platform profile
Date: Thu, 13 Nov 2025 13:26:14 -0800
Message-ID: <20251113212639.459896-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new "max-power" platform profile mode and uses it for
the lenovo-wmi-gamezone driver. It also adds the Lenovo Legion Go 2 to
the extreme mode quirks table.

On some Lenovo Legion devices there is a thermal mode called extreme
that corresponds to setting ppt/spl vlaues to the maximum achievable by
the cooling solution. This correlates strongly with an overall power draw
that exceeds the DC power draw capability of the internal battery. This
mode being mapped to performance when extreme mode is detected as
supported, with the actual performance mode being set to
balanced-performance, has led to some misinformation being promulgated
that performance is always a bad setting in Linux for these devices.
There is also some confusion that the mode labeled performance in
userspace, which corresponds to a red LED in Windows, shows as purple
when set using the hardware extreme mode.

I'll also note that as the hard TDP limits are refreshed when on AC or DC
by the ACPI notifier of lenovo-wmi-other method driver, no special handling
of the battery is needed for safety limiting extreme mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

---
v3:
 - Rename the vendor specific "extreme" to a vendor agnositic "max-power"
   to better allign with the "low-power" platform profile.
v2:
 - Drop patch 3/3, keep extreme mode quirks table
 - Add Legion Go 2 to quirks table
 - Fix nits from Mario
v1:
https://lore.kernel.org/platform-driver-x86/20251026081240.997038-1-derekjohn.clark@gmail.com/


*** BLURB HERE ***

Derek J. Clark (3):
  acpi: platform_profile - Add max-power profile option
  platform/x86: lenovo-wmi-gamezone Use max-power rather than
    balanced-performance
  platform/x86: wmi-gamezone: Add Legion Go 2 Quirks

 .../ABI/testing/sysfs-class-platform-profile  |  2 ++
 .../wmi/devices/lenovo-wmi-gamezone.rst       | 31 ++++++++--------
 drivers/acpi/platform_profile.c               |  1 +
 drivers/platform/x86/lenovo/wmi-gamezone.c    | 35 +++++++++++--------
 include/linux/platform_profile.h              |  1 +
 5 files changed, 40 insertions(+), 30 deletions(-)

-- 
2.51.2

