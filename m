Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792893818;
	b=SlbDC4Q7Zim6uKcQLR84ANdNw7JdJjzJIfnkl2jdUk8tKgA9o+Rw78ny14or9XBA+0lJ
	 HVtlXjIXDBIXNDrv6Vy6Fh2nrJCCT2/ZlLCarvMRlH33BNW8LmnLL16ZG7O5weQwSIaav
	 IekRKvPCMuAx90Lcfc88dZ8s9rFDGCN2vvwNfO3253qRkJtyPx/E/1zjheroFMTSEo0/l
	 rzVA9lqmnHYIrr75N4gX6e1UKsM3iViCmDWeWenD2DlYf5PxDsNhYMich4r99zZQV50YH
	 p/22qdq9RxPQmXYLEHY7/w7nEvWOzyPw3jrWjGdTFaUYFnS3I0mYgbrBwaSr4th3cxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792893818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nKU06tvEDhiEH3FF5h5I6jbuWJouTBUnSsYOyx81+iY=;
	b=LlUcOcAyDefon1Bgtu70pe7rMZ1b8sHnRDZzD1CT2ZcHVL5ID7PG6f1JfosNU13JzC3/
	 cw8cXM+QUXyYkAiD7K3UPWnieLy1gfXywcvgUnaALadcjZ8CI3lldcNvm4DelNqI/Fx3T
	 JbWBThre7s5997m7LC4jZMwd9jqqYd75lqg1X7zwojjTjSNssvIuD0umyQn7/wgG/NwSX
	 qZbEQKyVYRnSPqwLxLneX5dTpIq2oKrB6Pd+gJOMKdiHE1zsmhftr6iWr0LaXR+HRfNHI
	 zxVROefqde1dBxycy1Qxlu2B4sTssdee5z63iV1iAKSiXobyh2rHRxqEbO7pP+stYTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="RucVvXW/";
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40ED606A31D
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D40ED606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=RucVvXW/
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EA9B13F2CD
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1792893809;
	bh=nKU06tvEDhiEH3FF5h5I6jbuWJouTBUnSsYOyx81+iY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=RucVvXW/RB1ZbtUcn7Y4nL1U4guLmw/ENPcMBzk/rSXDQdWoQQ8cgpDKzqY6FNqJa
	 JnpY+dNCgz5ChvFjaeYM7i3g6ILkQvKlSjSqzVD0z40PY6xUq5GBmkqBhFKVlk4YQJ
	 Y+XHN0SSzhMOfOb0TGJG6TG6Bt2jOLy2fMrt83zOwA9ZK+OucldOJGIDhFaSSds0KT
	 dcnV7uJS+x0O29TROVc2ikq9fGd2TFiBTcH1pQYduJeXfbxzUBae1magZNsYlcwP0f
	 t6ScMvutjXPf5krQIRtYr5wOxwWbSdqzwSPF0lHB1QTgJHRjuonuKFObSbnsFa1xeY
	 sZfY55oboXC+9uPdTWpIX3WIntuGtQ+NnzQcNb4vqL8g33YMPM8Ux3VxE8mu6RefzD
	 LJBOzRLrTWLUhFYUzJKEhL1Pw/9oHe2VNp11/lVKLNoKcJG8g16grB4u7k6+2RK12F
	 +wH/BIJtdvKopZf4j5ttrCtctpcMzzbSxl1EjlplUQh6bkjaYqsktX/C1GKbS9fpcP
	 KMJcIGRXf6/XJdpJBOecfCpGFkP+2htJsPKCVm+yIlMZwZNXLKRVY37C1peRU/NnVy
	 Jff2p9159BeFA5yfL4jWFUyiiBnpTRa1EL59OTV+5190gp3yW3Bu5JMtHJ6eCR0NKe
	 EFHbl+xcTf8EsLXfjRkPl6WU=
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab27c28489so689433a91.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792893808; x=1793498608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKU06tvEDhiEH3FF5h5I6jbuWJouTBUnSsYOyx81+iY=;
        b=i5vFtyKs1JZk+2dgU7DTTvTO8mjpr0f8HAmwmFkSanIaRBhzWl8683iE89j3ksYRMp
         qaoO8cAnDZasCa6PA8U36oBPT5OzN0zBpnOtNxvNuhoIco23v4EF3zfJenKbvPexnL9q
         aaJTWLprR4ElXwzeBuXzQk+hINH5OyUmeFoj98KDDwiAsUkCTSJWWek/aY3kdyW8pi+a
         6K1ijOQ/m70a3lyr8nRE4CaOC5iCKhlqK8yW8P4s1jP7LHL/TBpU/9QxiDA4OV6XG441
         oAlbHweH0IfWIKoPKFTHaLrE7u6vBkRaIiOYvGjADtOQy+jJ1UT9zHyOGbl25qNjmFtY
         IDjw==
X-Forwarded-Encrypted: i=1; AKwUvBzc+DEPlWr6q7x+hdxqW7saIgkJF2I5HijV0QO7dolguMVk1JRa+DZhNwXnqfENgjzWMqLE3PWUVLLqGXrR7W+0Vdof@vger.kernel.org
X-Gm-Message-State: AFq9FYKfJQrxawgj9zrbwnmZqXbM4OimJ3eXdwUwNnCSW3HOTKiUFlYh
	nx6WfdIY+J3jwIPRSJGZhfOm0aKYE/vCEnf9JVZ7Tv6Sj5GU72eDd+oCKCiWJFmIs0Ar/wtZkxb
	KMSR9XkrHJy+mq7QNNMWXFMDxoPCBtTl/pmr5nrvW4XjrdKY5ktgMx1prnRkK4XA4xK0j5ikL7s
	HaUeO2t7yrMzu7Rms=
X-Gm-Gg: AYBFou0PD3S6Z4wgU60ArEd0wf0yUQf/C1akVBtpT6TqtQv3jRmwMqTdo1wmOaWyWk3
	7xhlGuf1JwyvgEHR4d/cIHeC0Xiv3kKcccSX0B3K86St8X7OPzHYS2xj8zkxvgzVaGLGZ6n4NUA
	+ydvov1wat1sX1MSojZ36qsUET3jrBPXY0aIGz4LHBT76RY/XGyhHWgJFtrw2r67F2Z0ud6DTfo
	/rqCjA25YhIeLb6kAHWP80oLGCm8byYTws9TNoFIkb0extbvDmTiuflDIRZQ2P8G7fDjkhPORXX
	ukn5L/1gCfRmVtwurMIspRzBGIsXMMnnZ3GXvZvYuzRJsFAO/lRZteBm53l7ByaXb9fBxGdpO3q
	K9RoYrGaGlW4uCk+RWZEz0vHR6izM79/3l2ONuup3mN2ncaCU4yBre/Vu2T7bDC7UHpDjyvRP8R
	KrNZ8X54mTRThyJ8fq9xod1FBZWGlPbmEuCHmGf1TgKr6D6dM00bLpKIWdyjXis0vwo5P31iwn4
	zKzZi7V9N8/G/OU78b4/BzF6mt8M3s0jYqOHFn7/w==
X-Received: by 2002:a17:90b:2244:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3adea06d536mr5191398a91.2.1792893807886;
        Sat, 24 Oct 2026 19:03:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2244:b0:3ab:a188:b898 with SMTP id 98e67ed59e1d1-3adea06d536mr5191366a91.2.1792893807472;
        Sat, 24 Oct 2026 19:03:27 -0700 (PDT)
Received: from an-XPS-15-9520.buildd (2001-b011-2008-445c-0e25-4b6d-1924-440d.dynamic-ip6.hinet.net. [2001:b011:2008:445c:e25:4b6d:1924:440d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebacbf5fsm4226044a91.6.2026.10.24.19.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:03:27 -0700 (PDT)
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
Subject: [PATCH v6 0/3] serdev: handle devices without an ACPI or device tree node
Date: Sun, 25 Oct 2026 10:03:14 +0800
Message-Id: <cover.1792856688.git.an.wu@canonical.com>
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

Changes in v6:
- Patch 1: switch dell-uart-backlight and yoga-tab2-pro-1380
  fastcharger over to the new serdev_device_add() signature with
  modalias=NULL so the tree keeps building through patch 1; patches
  2/3 then switch them to a real modalias. Fixes the bisect break
  that sashiko-bot flagged (true positive, Markus Probst confirmed).
- Patch 1: wire up struct serdev_device_id in modpost, modelled on
  the SPI bus: new DEVID() + DEVID_FIELD() entries in
  scripts/mod/devicetable-offsets.c, do_serdev_entry() and devtable[]
  entry in scripts/mod/file2alias.c, and the device-id/serdev.h
  include in include/linux/mod_devicetable.h. Also add
  serdev_device_id to scripts/coccinelle/misc/of_table.cocci.
  Reported by sashiko-bot; the two in-tree firmware-less clients do
  not need MODULE_DEVICE_TABLE(serdev, ...) because the same module
  creates and drives their serdev child, but the plumbing matches
  the other buses in case out-of-tree users want it. Markus Probst
  confirmed as true positive.
- Patch 1: drop the unused `#include <linux/string.h>` from
  include/linux/serdev.h. strscpy() is used only in core.c, which
  already pulls string.h transitively. Reported by Markus Probst.
- Patch 1: drop Markus's v5 Reviewed-by. The modpost wiring and the
  dell/yoga NULL-stub bisect fix are new code he has not seen; the
  tag belongs on code that was actually reviewed.
- Patch 3: drop the "serdev driver MUST be registered first" comment
  in yt2_1380_fc_module_init(). With id_table matching the order of
  driver_register vs device_add no longer matters. Reported by
  Markus Probst.

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

v5: https://lore.kernel.org/lkml/cover.1792831564.git.an.wu@canonical.com/
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
 include/linux/mod_devicetable.h               |  1 +
 include/linux/serdev.h                        | 11 +++-
 scripts/coccinelle/misc/of_table.cocci        | 16 ++---
 scripts/mod/devicetable-offsets.c             |  3 +
 scripts/mod/file2alias.c                      |  9 +++
 12 files changed, 120 insertions(+), 49 deletions(-)
 create mode 100644 include/linux/device-id/serdev.h


base-commit: 9e947d96915af63e28896caae85a81b74855621b
-- 
2.34.1

