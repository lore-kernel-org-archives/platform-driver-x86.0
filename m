Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F23927E1DC
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 06:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770618879; cv=none; b=BLjenr+qupQqavbRIwKHyBeiZ2GY3Qero4McvAbkX38KqOoZbNqSjV0xanKP+nBIdyOuqj4jIJGr2TItDPzezTQI7RSWpo4iiB8klyH0VsJUwrhVMzL48Cz552oowCzQmtAu49df7HUeFL3M96775B/yLMc8rVv70iV/NuwK3cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770618879; c=relaxed/simple;
	bh=DWif77Ano7kpJBBh5wh4HFaGwnwScHY3xJyOq4XoBj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Criy/Ncc56+6/vjQVuFDE4ieMKsZpzUJcg043+0+FflpSQQ4V54pGN1oplxUvNSttUVRm9cjxGsOqkVQvR9ldu4fHwh6BIhGiIWZV1stdy1GZyWr4oBUmWV2KOVay9pM+yoojtfQe8mw1DrS2RaQpQa9uShdMvw3Q5YtTehopWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nc5Kqi0C; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nc5Kqi0C"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so969404a12.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Feb 2026 22:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770618879; x=1771223679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NY4eK16EbJpbVZRu/k6DFIXaDmDtR8rLx4eN0dTlAKE=;
        b=nc5Kqi0C3+v3kgzbbUXtLkBDhNhdaTCVhbnAiZKqaXbufQeBqPiENf4o2fgOcm/vQy
         exT900/6WhTPg6tKuNr4mKxPivn+dWxT6Ossi5L32Fl416VP5TiEBBt8p4ZJ185HHjkO
         GHwQL2jdwsD0mHlWqZjECiREJ83VdH1H+rWHCME8Yq/8BwF7TngbljLpBU33n1G8/w3b
         y8i3AAfHfqbDz/lU22ad0S0sjHVjf50V3c/v0QvNALMYaNG+jFtRNw1/Ah/3+fnRTKcG
         Q/8XHlCAUla5oS1LxnqMGEvJgK51+UtDoXep2nhZ39xUYapD3xlqqa3BJBq6bZIQN3Dk
         f+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770618879; x=1771223679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NY4eK16EbJpbVZRu/k6DFIXaDmDtR8rLx4eN0dTlAKE=;
        b=FP3crd77faY/SHT97VAq2HTyVLaBKdfcNNbnSb8lrVUe5o+65YK/XARpZJ6J5AQu4O
         GnLqPU0z3OxqMGwlGnEPgbEgwGOTubW+8ORudynmJoAdPdyAdGSYWrlHcWHRaMByAuhQ
         CvJNg0ejvU4A1r1n8sETpmst/9kGtTLyAzcOZtAqKAuRL7Q4Zt5uugr/LYigAfuZ0+1L
         MrzIWpcrnBpOa3PqtXyqpvwSctCbGdI3Q7h0s8BiNZbyPHXNdy7DbPg2dSxn63ILHqAd
         v6QBAAUbVVVaP+fddY0ph+FaJjN/B0tsqUiGRhj9GiXlGFL6p4vzy6sZUSLhiG5HNNK2
         Le2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfDaMMeXpiRF5hjQyTptrScU1UL/XOv7ckJG2MYOpXiqy7xmguR6bpOvgf8dVSERhXyd8knpLnS+OaPCpIIGZiLeH3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbu5vszqaB73ULWKkItsHMwOBbb9IFPGoQDsIHN6X+UrLECfHP
	jguTB4bobWsHS87csVT4cLzgIbSINTum063vt/dBTuQzSDg3CH+Oduvu
X-Gm-Gg: AZuq6aLeJ1J6OVCACcsFcd2MaWCMzWrOnUoCXs7bicHwkllYwwXcUQY4+xp4UMW4Kzc
	pwMCsndRoPd3RlmEWOnGPZdgPb/xLfJpqtoWHIo6dB1v+fSVSuccLu8fZa51wRM27ctKad9aJJm
	Zfrvkg2yp19q5eEcCW+hmr3FYvI23ZnEPQosFTOdzER0fTZ+9AzORWhduSSpukcfKyGrtW1yEal
	UJcYj0zB+CAUfzKcpJTeCnKNjGVSGOLnYW6Z9AgjvYa2YRIZR0kxwudXWTWPJ0HuJQuu3KAh3g7
	3zB/A/HU9KZ0NjUwCm2sFN9qU4FaUqMbs0TLvJLl+RoB4DJ43/SnRvkADMoQn/lCcPzTprgP8fN
	1RZXF2a/UQ4NowY93bijW12HFDn/lBCQubpOWfJZ0a+EpEdpmOnX8X0EU4PfPjgZh0x1RKjxl3l
	nd0um2GM6lTQbrZ+wilQVlYkv9qhMzCp1aKemyCA==
X-Received: by 2002:a17:903:234d:b0:2aa:ea3d:a37b with SMTP id d9443c01a7336-2aaea3db331mr21479775ad.2.1770618878498;
        Sun, 08 Feb 2026 22:34:38 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:e705:6ccd:6241:6a0a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aa3ec42e2asm83440455ad.53.2026.02.08.22.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 22:34:37 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v7 0/3] TrackPoint doubletap enablement and user control
Date: Mon,  9 Feb 2026 15:33:52 +0900
Message-ID: <20260209063355.491189-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for TrackPoint doubletap with a clear and
simple separation of responsibilities between drivers:

1. Firmware enablement (trackpoint.c):
   Automatically enables doubletap on capable hardware during device
   detection.

2. User control (thinkpad_acpi.c):
   Provides a sysfs interface to enable or disable delivery of doubletap
   events to userspace.

The approach follows the KISS principle:
- The TrackPoint driver enables hardware functionality by default.
- The thinkpad_acpi driver controls whether ACPI doubletap events are
  delivered, using existing hotkey filtering infrastructure.
- No cross-driver APIs or dual filtering paths are introduced.

Changes in v7:
- Removed unwanted comments and logs

Changes in v6:
- Documentation: fix formatting of the doubletap_enable sysfs attribute
  description (separate "Values" list)

Changes in v5:
- Rename sysfs attribute from doubletap_filter to doubletap_enable to
  reflect actual behavior.
- Fix inverted logic so events are delivered only when doubletap is
  enabled.
- Suppress ACPI hotkey delivery instead of injecting or filtering input
  events.
- Register the sysfs attribute via hotkey_attributes[] instead of
  device_create_file().
- Drop unnecessary helper wrappers and debug logging.
- Update Documentation to reflect the new naming and semantics.

Changes in v4:
- Complete redesign based on reviewer feedback.
- trackpoint.c: Simplified to only enable doubletap by default.
- trackpoint.c: Removed all sysfs attributes and global variables.
- trackpoint.c: Uses firmware ID detection with deny list.
- thinkpad_acpi.c: Added sysfs interface for kernel-level event control.
- thinkpad_acpi.c: No cross-driver dependencies.
- Documentation: Updated to reflect simplified sysfs approach.

Changes in v3:
- No changes.

Changes in v2:
- Improved commit messages.
- Removed unnecessary comments and debug messages.
- Switched to strstarts() usage.
- Simplified firmware capability detection logic.

This version addresses the remaining review feedback by correcting the
naming and logic inversion, aligning sysfs semantics with behavior, and
fully integrating with existing thinkpad_acpi hotkey handling.

Vishnu Sankar (3):
  input: trackpoint - Enable doubletap by default on capable devices
  platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint
    double-tap
  Documentation: thinkpad-acpi - Document doubletap_enable attribute

 .../admin-guide/laptops/thinkpad-acpi.rst     | 21 +++++++++
 drivers/input/mouse/trackpoint.c              | 45 +++++++++++++++++++
 drivers/input/mouse/trackpoint.h              |  5 +++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 42 ++++++++++++++---
 4 files changed, 106 insertions(+), 7 deletions(-)

-- 
2.51.0

