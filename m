Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35245672
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jan 2024 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="IzGvbPi1"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78336bfc489so498885085a.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jan 2024 10:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1705170791; x=1705775591; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnP28VcYD/21XzdJbx62O5g05BDoOAcvEfgwp7lTOBc=;
        b=IzGvbPi1utn5Zy9w3LfEQ3RZShgZW3ssGrGG6bjjGsdGO8SFcPgBqssB/NXomO9Gd0
         NMsJEBUbUY/r7mO7X79QiTrgB5nFXxIF25WNlXxgwpgM4GXkhYa2PNzZHe18Lm8nGmW3
         3xEGhFmFrK4BtuD+gqmxh8pK3L1qBtNXWZZao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705170791; x=1705775591;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnP28VcYD/21XzdJbx62O5g05BDoOAcvEfgwp7lTOBc=;
        b=WKr7ku5is5Op3oZwmzU1etXuwtoLZDkZeQWbpu+t3p7rz84htgMCd5mj7LRVabyxTO
         VCsl83gV9fd/A/JFu6Oom4MGqT6B0JEron+nRI3qJiSwJqvRc0mfqn0XlsPOthNnJg1B
         ytaQ5riSIrYl6fOxsjNmYdT+Z9SlghHSmK9CLUU9eX95zNYgKY4VjDjFUZCLHwSlNoB1
         wzgqDTp+jtPsTxem3vgdVRMiM9GFUEdCQl20W8MWyfssrzVtMUSNCzcVB1TeerqkEV8s
         QiUKOUnBBqfsU6Cf1btf2EODVfI1lul7g+a70HCAg+JgK8wfa0BN9OZ8fJXNo+Nayox/
         kB9A==
X-Gm-Message-State: AOJu0YwREuRRFbDu+zZ3xtEtsQnZ8kZlyMXcHQWIW/w947haWVZy2BWf
	jVsTH8/3IK+vkgI6kSRHFgV/HUf/p6SCOw==
X-Google-Smtp-Source: AGHT+IGDIrUbMYSBIjbUHBWwUv7c9ei09luPbXHQLYP4DbBAiGgie9mpkenb7Ddg3RqcCURbhzRNIQ==
X-Received: by 2002:a05:620a:136f:b0:783:54b4:7763 with SMTP id d15-20020a05620a136f00b0078354b47763mr923327qkl.87.1705170791562;
        Sat, 13 Jan 2024 10:33:11 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id z4-20020ae9e604000000b0078162695b73sm1855853qkf.104.2024.01.13.10.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 10:33:11 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/2] Surface fan monitoring driver
Date: Sat, 13 Jan 2024 13:33:04 -0500
Message-Id: <20240113183306.9566-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Third version of a hwmon driver to monitor the fan's rpm on Microsoft 
Surface devices, originally submitted in [1], v2 at [2]. All changes since
v2 are incorporating feedback, cleaning up and simplifying the module.

Changes in v3:
  - Removed type and attr checks in read and is_visible.
  - Removed assigning sdev to ssam_device drvdata.
  - Propagate return from __ssam_fan_rpm_get.
  - Renamed hwmon chip name from 'fan' to 'surface_fan'.
  - Removed unnecessary platform_device header.
Changes in v2:
  - Removed all unsupported sysfs attributes from the hwmon driver, leaving
    the fan input as the only supported attribute.

[1] https://lore.kernel.org/linux-hwmon/20231220234415.5219-1-ivor@iwanders.net/T/
[2] https://lore.kernel.org/linux-hwmon/20231228003444.5580-1-ivor@iwanders.net/T/

Ivor Wanders (2):
  platform/surface: aggregator_registry: add entry for fan speed
  hwmon: add fan speed monitoring driver for Surface devices

 Documentation/hwmon/index.rst                 |  1 +
 Documentation/hwmon/surface_fan.rst           | 25 +++++
 MAINTAINERS                                   |  8 ++
 drivers/hwmon/Kconfig                         | 13 +++
 drivers/hwmon/Makefile                        |  1 +
 drivers/hwmon/surface_fan.c                   | 93 +++++++++++++++++++
 .../surface/surface_aggregator_registry.c     |  7 ++
 7 files changed, 148 insertions(+)
 create mode 100644 Documentation/hwmon/surface_fan.rst
 create mode 100644 drivers/hwmon/surface_fan.c

-- 
2.17.1

