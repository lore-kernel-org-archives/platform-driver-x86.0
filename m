Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864CB1684BE
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 18:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785953177; cv=none; b=iAd3TT+Mal3uOcYTL530ftpFcvCI308ajFesa1M4V4c2uegydEvq1mPMiMft2+lGZQmzGkROda5MN7LrAud/gO4uKVF1jglUtkjJwM529XJRVp8tmParhe96wK0UOt0R3bkYxteNmLOG6zQ52EufxiJL+535w6aHsUJXxEesxC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785953177; c=relaxed/simple;
	bh=aPGxXx6p6cZSwx4Rfq9MqTesKIQ9jY39WOTaHzs3+M0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSTCft72gZswp9hZvY44/QQkzjkLysGIgKJQNrPz1mhd7rOqzqeu1aegORs9h6Yk90De/lF8M9h3iD4JtEf5JeHY+QG/yhHGxYqnyVTXOYFJrkLvlBawFB5J8HSFWGwwSi0witQmrS/R4bE8i0632wIq+qaiMON1zHtpF4kkJH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/rEUhn3; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/rEUhn3"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1130616a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Aug 2026 11:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785953176; x=1786557976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GK6vID6V8XbOUhrwHEAz5Ca1KT6fvP6lvb078p4aWHs=;
        b=G/rEUhn3EkekdcuclnayuAJ273Ajc2uOplnRAXiI3XSQ7VgVahttIJE+on5Go3Tjs/
         gZrVpbClks3x5YlYi+z48FeypqJ8smLBuGeCoepn1JX6Yzs7gSWj+D+vaxaCp9lOK5Y/
         /9SOWKX9lZD1NPn0nb7tu3LfdNf/6X2drN4gIkst1cqGKOeFVZFuknv55g/ABe6CnUxF
         jtNTj24pqRcKJPKdjdFNHlpJ68c+dKPs4U2TDvnbokCPFaGz9ftE4Ybq3B/s2WCTqiCs
         0PQB0pD43evaODZNWDd4h43pkm0Fz1hCJjCYo0cH9DkZmGU69o3YqfjoFOMU2h2FwrUO
         0LsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785953176; x=1786557976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GK6vID6V8XbOUhrwHEAz5Ca1KT6fvP6lvb078p4aWHs=;
        b=pQ/OQ6ulMvazf5NeDv/Wd15Re3Dpv6b5Z0zC0kL5yw5/9DoHsGb1d4Zyj9VDG5mQl6
         rHUV6eM+XPPIpT/G2so1vkBlj5DQ/q+SMdyxvGOHmr8f36mOi07s7cFOIm+pnOps3+r9
         /tmVTosG2VVah6X2Xl1m/Im+LowHBTI+Y9PxYMQQ5HDIjnwCuKcO567ZB2KlsFIxXaiE
         ak4K8MOnf37sZV9K/XYxS5xm8P1UPzVly+GW4vsod5GQ309clyrN7a2PTGysuyrFiFHX
         GHdWN6X+m0Zq33ry61z+Vpd79Nau0ktnB8At0h6xmmNgnkfPwdyqq/JgS8Nrv8seeees
         CxWg==
X-Gm-Message-State: AOJu0YzXar9QQnQJXLIBw9zbHmUZnK+HfKWrQKVRX4YT3dVCMih5cbIa
	m0bwa/31JmvxbwRngkR5at+y7STE1x7dQw4ad0scdQgNY9SvmkIFb08lYr9B4kB0B34=
X-Gm-Gg: AR+sD12T/sAqXLer+TBkEfd9kMAqelE9e6ekze0kTAmKOaQ1qUJbYUuASqphayRKVCn
	n/kmmKIFYUIaN3eH64KEaTspuqKgrwQYsxer2vIxjtD8DihVty3GSeR8J6xBX5u7CG4NUYKKYcT
	S83GIeWKY8z6z4UlBeXL2Yq9E0yRU4lILMYTu6Ofe0F0+3JT2uJo9Gdrh3CyogtYPk4z7coddx5
	uD2SxRy1NNK5F1hm2IwFR9reUPnZjRIrwveAg1fOzG9yWxTHPYSPut0yeKsjaOyneH9ECBf317/
	TLV51wvaaEHaX8Jxb9yHd9CLSz4fxwizuS1IpXyC4+891OCQOx6spl7C8FugjnmIzX099yJWmx4
	UfQQi+ake3WNuQ5RnnC7rMTTFmANpH2zxMfwCOmATYfOii1T/ua2RssGWd++aUJMOX8hoO28+/O
	uv8+K5VlrJV1yg7LtUclfdEyujLNo0j7jtfsdVlrWWIGa8LE+pRdXhIG1HUqyd22kz3qmVwXdKL
	lmOdI1CRj6u6k79pmzl
X-Received: by 2002:a17:90b:3806:b0:38e:7080:b4c0 with SMTP id 98e67ed59e1d1-3903c5cfbccmr8014619a91.10.1785953175724;
        Wed, 05 Aug 2026 11:06:15 -0700 (PDT)
Received: from localhost ([112.204.123.220])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3903f5d9b91sm2178422a91.3.2026.08.05.11.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:06:14 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 0/1] platform/x86: panasonic-laptop: add platform_profile support
Date: Thu,  6 Aug 2026 02:05:42 +0800
Message-ID: <20260805180544.1134916-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC patch adds support for mapping firmware thermal and CPU power
operating policy to platform_profile for Panasonic Let's Note laptops.
This originally started as a hwmon and thermal patch, but further
analysis had revealed that these are firmware power and thermal
policies as opposed to fan control.

Panasonic firmware exposes firmware operating policy through two
methods:
 - Fan cooling policy (active/passive)
 - Processor TDP limit (capped/uncapped)

At boot, firmware defaults to an active cooling policy with the
CPU TDP capped. Vendor drivers / DPTF normally unlocks this on
Windows.

These 2 methods map to 4 possible distinct states. Only states that
correspond to the platform_profile ABI are mapped and exposed as
choices. Unmapped states will be returned as "custom" by the driver.

I have tested the following models:
 - CF-RZ6 (2016)
 - CF-SV8 (2019)
 - CF-QV9 (2020)
 - CF-SR4 (2024)

State to platform_profile mapping:

 Profile                         | Fan Mode  | TDP
+--------------------------------+-----------+------------+
 PLATFORM_PROFILE_COOL (SR4 only)| Active    | Locked
 PLATFORM_PROFILE_BALANCED       | Active    | Locked
 PLATFORM_PROFILE_QUIET          | Passive   | Locked
 PLATFORM_PROFILE_PERFORMANCE    | Active    | Unlocked
 CUSTOM (unmapped on all)        | Passive   | Unlocked

Across all of them, the fan and TDP modes are toggled by the same ACPI
methods. However, there is a slight variation in its interpretation based
on testing results.

These methods are normally called by the DPTF/IPF _OSC handshake.
Depending on the capability bits, the firmware will alter its thermal
and power policy.

\_SB.IETM Implementation A:
 - CF-RZ6 (2016)
 - CF-SV8 (2019)

\_SB.IETM Implementation B:
 - CF-QV9 (2020)
 - CF-SR4 (2024)

Models belonging to the same group share what appears to be identical
AML code for the _OSC.

This patch only exposes the ability to read and set these firmware
toggles. The get() callback queries current firmware state and returns
the mapped platform_profile. The set() callback sets the target state
regardless of current state.

Proposed mappings in this patch are defined in the quirks struct.
Activation of platform_profile is gated by DMI checks.

For every model except the SR4, only balanced and performance profiles
are defined. This is because the aggressive fan paired with the locked
TDP on the SR4 more appropriately correspond to the cool profile.

Test results for the proposed mappings are below.

Test results:
================
(CPU PkgWatt: peak / sustained)
(Sysbench CPU: all available threads)

CF-RZ6: (i5-7Y57, Startup default: Balanced)

 Platform Profile |  CPU PkgWatt    |  Sysbench CPU  | Stress Temp (CPU)
+-----------------+-----------------+----------------+-------------------+
 BALANCED         |  10.0W / 9.0W   |    19712       |   57C
 PERFORMANCE      |  18.9W / 14.9W  |    29132       |   72C

CF-SV8: (i5-8365U, Startup default: Balanced)

 Platform Profile |  CPU PkgWatt     |  Sysbench CPU  | Stress Temp (CPU)
+-----------------+------------------+----------------+-------------------+
 BALANCED         |  9.9W  / 9.9W    |    44695       |   58C
 PERFORMANCE      |  29.0W / 19.9W   |    71747       |   81C

CF-QV9: (i5-10310U, Startup default: Balanced)

 Platform Profile |  CPU PkgWatt     |  Sysbench CPU  | Stress Temp (CPU)
+-----------------+------------------+----------------+-------------------+
 BALANCED         |  10.0W / 9.9W    |    46545       |   59C
 PERFORMANCE      |  18.9W / 14.9W   |    57416       |   70C

CF-SR4: (i5-1345U, Startup default: Cool)

 Platform Profile |  CPU PkgWatt     |  Sysbench CPU  | Stress Temp (CPU)
+-----------------+------------------+----------------+-------------------+
 COOL             |  12.0W / 12.0W   |    177139      |   66C
 QUIET            |  12.0W / 12.0W   |    176315      |   73C-75C
 PERFORMANCE      |  29.6W / 21.3W   |    247602      |   98C-100C

CF-SR4 Notes:
 - QUIET: downclock/throttle at 75C, no increase in package_throttle_count
 - PERFORMANCE: stable boost clock, package_throttle_count increase


Other notes:
===============

Additional notes about thermald:
During testing, I have observed that running thermald for the first time
since boot will trigger an _OSC negotiation that will unlock CPU TDP for
new models (IETM Implementation B). Once thermald is running, exits or
runs again, these bits were not observed to change again during testing.

Running thermald on older models (IETM Implementation A) does not touch
the fan curve or TDP mode setting.

Suspend: observed to not alter the values set prior to suspend

Thank you,
Alex

Alex Yeo (1):
  platform/x86: panasonic-laptop: add platform_profile support

 drivers/platform/x86/panasonic-laptop.c | 380 ++++++++++++++++++++++++
 1 file changed, 380 insertions(+)

-- 
2.55.0

