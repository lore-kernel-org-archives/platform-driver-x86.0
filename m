Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792843496;
	b=x7oQ9f5weBqaEDmDLTHlSn9DbXvq6kbOQJNUb0DjvP0TwVVLiZUrE1535uKdYVrAmnZJ
	 HLdz63VI8eiwCXl8X1VQ11rXLQkor6BHX7fp8Aa4H8fUZ36+Z0B9hnpwRg8o8gJiyCMK1
	 KrPqmxa7tuJ1wXoyNZCQuUgIUgW+WmB5i1Dxf+P1jL5Xi1qafVS1FZmEgJJHFn0FqbCXu
	 /jmgEENc9MdT60CEQTla81iBycxJ/YasSSsHGvb+Fr+HOcLJEWEocggmpYe7Um8OwN/y9
	 HU3JsQ2Kbos5CSmz4ob12zsNH02uvPqtmy5x/LgEMAG2xoR5vWiS9Dev1UuqoSWHlzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792843496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/yYlcVbWauKdzvWIvsccZxgFQkxdIfYL+H0J9xQ3krg=;
	b=dIhLuewsuV6oB6ns7uF8jre7KOJXRn8kGWpx3pmFaudgm6/RLszjsMStgYXc8RCWZeq0
	 4O3OO6YLbkjKAym/Wy8iv8VSP3vrFUBwkeJI7tGnlLiBIdvmt7Lwr8rv8zqXPWsDasMPk
	 E529eWwd/98mclk2IZ6c+9W6krfchLsdA3Y9SW0tXasQCKOI1Ut0dT46Tww4G37LXtmHN
	 HlOYJMswokSOIs3QG0N6aq3lfWTwM8FflJ6XpirEdFoGrFxwzQtSRCBUCnilXmVSxnR+7
	 rxA8nLn9pId49GLterjVHRkpVG890j/isa0jNdcGRG+4BGR9h32t62+hj6zNYsS7aCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=QGdq+id4;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558A606A31E
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 12:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B558A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=QGdq+id4
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E458A3F175
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792843492;
	bh=/yYlcVbWauKdzvWIvsccZxgFQkxdIfYL+H0J9xQ3krg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=QGdq+id4/9uQs4eJUb8AL6vI+zVsmPg22WctBuSbaYvx9ChZcU7x9I7j4/FFjXuM1
	 lFL3uf0NOQZB/W8U2vrmAMAzdLa8PzQqyLhLIishEXAf0LFWIXtK6spTPrtNKJsaaO
	 /O3Z4tIXy65DuSdXHPkjppaJhcoR5oll8JZ5TWRC0PXa76FCK+QgIdmy8U3QglJziq
	 xw7jF9B7nTD+dUv6x4UtA32N5kR/fPdjrfGzxJfXh5Y+oGXlEOLXBb+792algTDpWi
	 XaBzkwzpuaUvzHHk6pjGIXF4cyhfThC26/yKdiuWzM2o6QZLdUrArB2VVKacXghu61
	 NTQ26qLp+6OWC3mchn+jyXhWd8EWpdSIW0HUBV3NKDwHjKoThYRR0izjZ9pvazWbhy
	 Aa4iKYxJE/PI+KoTjbz4XqNmwcEx+9+KEkcsmJIwT8/JrnuqjgSFbuu5nQ0jA+wIvW
	 o8epwdrnTC9vH7jhFqdHDap8XELpfRN11pc/eDe2Y4muvI5CE5FnlzRVvAdIp6ScK5
	 zxlbRilNmLV5zp8NTuclw323BF5U8LjIKzShebpOTIIsEgWiZxKCm6Ks9xJ9PKRAoM
	 kCYUZ+xKffuKdNpnV2IHA9o7/dgyE6FsEI1NitsFdwNzXEbAw3Rpxqs3Q/yR9w27sf
	 ot055gwA+5ips0OvkzRndfZA=
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac94f8df66so447314a91.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 05:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792843491; x=1793448291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yYlcVbWauKdzvWIvsccZxgFQkxdIfYL+H0J9xQ3krg=;
        b=2TyE7d05sYeRzmUlSpbkSM8QZOu9McPbyaJbcqTGeCUanqEi3a6TxdSzgaMUUOrGJH
         DLL0TUCqoh6QzwPVy2rEjZB1sqT84w1ZJGIgE6l373iyL/uBI9HchoaEKNfLs8SqDGel
         5EZG1SbuBxH1bXRzrCx8bepeVYWTzBD6reWkirjb1jCHs4w51ltU1h7oJzVlByU3oODc
         sD0Z5cFeESNv3XWDvITaH8Rrg8neX2osDJACIJc5l24scPByGjymaq5dDHQ92IWtuDxC
         YIZ2DLiJskxupqigo+FtPkcuCCOo03mS/5mEGdChEOyjn0IEf3gvGOvEFXUFT3sdDequ
         0WQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNTJb+NC+xeHLsB45GrLACQTkeOBWjJGTXBsgkaa29MXLDnGFrY5E5wNtloRyDAeZ3JL1HdbTTyWozyRKT+VI/5sBj@vger.kernel.org
X-Gm-Message-State: AFq9FYLi4F5/fe5u+d/+B1BuS9LRSxsp1aZ3PCHoTOy+ul5gx9JIDX/5
	YKhIIJh7xzx2s+aP7PVnhObAjcR6VMPTgQ1wLOR6DeSfaiAYeU5uyn7iQEZOLjQtNQXyY3j8zkw
	rdr3wXK/AsAeZwQErv4Pbt9vP+RXXyqO93YeomBXQc+wTC09rd+mmEArpIhuGVMS8hqPR0pFsqo
	7zYGV16LEZuAybi7o=
X-Gm-Gg: AYBFou2+aUPPFmVCcqLdhRlBOgRIWuPr+U4bRizXJTVqChVNFJ3v0HrhgaIW60Lp/dL
	zBGHQBj9cUdEjJrHK8Wv4/WxrOLU9IDaWbtlqPzrTmldcNSQQNtgfuN72n09mqXk8h9k3O9+VwM
	6HEfn+kWbXhm/s5cc1PPIaCKbGvKLcGDWFVgQoop1+vYUapXAz0jn2B3sxGesYmqK6rxdNXUhgu
	0XK32O0UqLUH2E3l9E5fpwesUXuqIs6pjui7CTNkg6xPy5d2eJZDmi2DEt5RIDXCXSH6FJLloAD
	ws024GgI9ISW2XAxoNCYI8KSUfEBbz6sCD93UWR1iAiL7xvBbdTsimS+taf9uWWt16PnF+sorUk
	DbFuI1u5VvUxULoIwwy8YOeLuLYA7HeQ672HS7+0ag9lNhDHFwiQQvkAHZCOiua3HPnDjue1SxE
	dLn0eVojgkjV2iEwOR5yqWsSSvIcIrOSmCIHx7hEy0251diZ9NQPiXhdPKa+3oK0l5I9BfKrL3s
	aamlT4gpa7i19j8sLk+tpGbP21iB5fofRKioNafRA==
X-Received: by 2002:a17:90b:2645:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ade9b2ce6bmr2893150a91.1.1792843491094;
        Sat, 24 Oct 2026 05:04:51 -0700 (PDT)
X-Received: by 2002:a17:90b:2645:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3ade9b2ce6bmr2893103a91.1.1792843490725;
        Sat, 24 Oct 2026 05:04:50 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb24a04sm2893409a91.16.2026.10.24.05.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:04:50 -0700 (PDT)
From: ChunAn Wu <an.wu@canonical.com>
To: linux-serial@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	markus.probst@posteo.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Subject: [PATCH v5 0/3] serdev: handle devices without an ACPI or device tree node
Date: Sat, 24 Oct 2026 20:04:37 +0800
Message-Id: <cover.1792831564.git.an.wu@canonical.com>
X-Mailer: git-send-email 2.34.1
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

Driver-created serdev clients without an ACPI companion or device tree
node currently have no modalias and cannot be matched to a driver:
their modalias sysfs read returns -ENODEV and their creators force a
bind with device_driver_attach().

Backlight function on dell-uart-backlight is not affected: that class
device is registered independently and gets its own add uevent. The
user-visible breakage is the failing modalias read on an existing
serdev child -- Checkbox dkms_info_attachment aborts with
"OSError: [Errno 19] No such device".

Resolve the two long-standing serdev-core TODOs by letting the creator
pass a modalias to serdev_device_add() and giving the serdev driver an
id_table, modelled on the SPI bus. ACPI and OF match first and are
unchanged. Convert dell-uart-backlight and the Lenovo Yoga Tab 2 Pro
fastcharger to this path and drop their force-attach workarounds.

Changes in v5:
- Patch 1: restore is_serdev_device() guard at the top of
  serdev_device_match(). Dropping it was correct when match only
  called acpi/of helpers, but Patch 1 also adds
  serdev_match_id(sdrv->id_table, serdev->modalias), which
  dereferences serdev_device-only memory. Since serdev_controller
  shares serdev_bus_type, the driver core calls .match on controllers
  too; without the guard, serdev->modalias on a controller reads bytes
  from inside host/nr/serdev/ops, and strcmp() can walk past the end of
  the controller struct. Reported by sashiko-bot on 2/3 and 3/3.

Changes in v4:
- Patch 1: drop the dead is_serdev_device() guard from the match
  callback, and dereference serdev once at the top
- Patch 1: drop the "large enough" comment on SERDEV_NAME_SIZE
- Patch 1: in struct serdev_device_driver, place id_table right under
  driver, next to driver->of_match_table and driver->acpi_match_table
- Patch 1: merge serdev_device_set_modalias() into serdev_device_add()
  so the modalias is set at the only point where forgetting it would
  matter; internal firmware callers pass NULL
- All three patches: tightened commit messages and moved the v2/v3
  changelog narrative out of Patch 1 into this cover letter

Changes in v3:
- Rename struct serdev_device::name to ::modalias; dev_name() is
  unchanged
- Model matching on the SPI bus: add struct serdev_device_id and
  id_table; drop driver->name matching
- Add serdev_device_set_modalias() helper and SERDEV_MODULE_PREFIX
- No MODULE_DEVICE_TABLE(serdev, ...) support: both in-tree
  firmware-less clients are created by the same module that provides
  their driver, so udev has nothing to autoload

Changes in v2:
- Instead of silently returning success with no modalias, use a
  creator-supplied name as a "serial:<name>" modalias fallback and as
  the matching key, so clients can bind through normal serdev matching

v4: https://lore.kernel.org/lkml/20261024022930.2704030-1-an.wu@canonical.com/
v3: https://lore.kernel.org/lkml/20261023052717.2577234-1-an.wu@canonical.com/
v2: https://lore.kernel.org/lkml/20261022032842.2492572-1-an.wu@canonical.com/
v1: https://lore.kernel.org/lkml/20261021092124.2306053-1-an.wu@canonical.com/

ChunAn Wu (3):
  serdev: handle devices without an ACPI or device tree node
  platform/x86: dell-uart-backlight: Bind through normal serdev matching
  platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger: Bind through
    normal serdev matching

 MAINTAINERS                                   |  1 +
 .../platform/x86/dell/dell-uart-backlight.c   | 18 +++---
 .../lenovo/yoga-tab2-pro-1380-fastcharger.c   | 25 +++-----
 .../platform/x86/x86-android-tablets/core.c   |  2 +-
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  2 +-
 drivers/tty/serdev/core.c                     | 62 ++++++++++++++++---
 include/linux/device-id/serdev.h              | 19 ++++++
 include/linux/serdev.h                        | 12 +++-
 8 files changed, 102 insertions(+), 39 deletions(-)
 create mode 100644 include/linux/device-id/serdev.h


base-commit: 9e947d96915af63e28896caae85a81b74855621b
--
2.34.1

