Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016B8517BC6
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 15:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904539; cv=none; b=pBk/UsTVEWq/+hV5zBzMwCMxwwRg11hvHm3OROOzOLZisazho/V32WSkesD/0ZJOJmxv9ZD0/YSimHmRlhT5c6LEPUfkvO7veZjyWT72c/bqU14SFi162Icz/SYmxPOPuELg63Kx1lM2Z19tqgAj/Dd2CEvaTIHJWVH2mtoHVr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904539; c=relaxed/simple;
	bh=wOidxVLM17lR1bDj1xmePaeabjfnEZRB6ayeFW+JFtY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eAMXn7G2zyrLVT3LDw3YCydn42SgiXLijEVayjs0Kxibv33tRNJLo03CT0KU5K8d2EKSUvnJr7ZXWreFsmF5FGWq1tp+hhOcUBzJV8sGyaIXsLrXOVZIxa41tRYHO/kOVsvaOHXS9n4ir2hxP7GNMp3nEaTNzGFwfGWdjx3MD4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=LOsdMM9W; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="LOsdMM9W"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1006578eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 08:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791904537; x=1792509337; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6cn15OBuDdPhmTCMVKwa2oTSO6nmWiZTOYVWRAj9v6k=;
        b=LOsdMM9WDVxo+YTeNoAm3SHypoObv2uIlBY03iWhNDn1zUPToW1kMqc1Y/8/SC3hyx
         45g2NP2ivguOvy2mST+B2uqcgY43BNMQQLy81PjwqE3nSlAO4ULkgJthEFVLwDUDbPJT
         xqHEANIrQ8wkJsPcbDIFQ2C9gQAntDgfByHMVX2BnTjCp4bp/m/7uEtPnHeqKWeyV/gp
         wyuBpL2bZh6xXzMJ0YAVdvmnTiYdpUo2gnNPqakTABfCjGPy12SbcECh5hB9ETgvww0p
         wqVZWhPn1TJ0cnEVHWoWDw5qeEQGZZS2wEUW9o7ycPEJe9KoLLM2EWrWH2yl/Ug83pYV
         sUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904537; x=1792509337;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6cn15OBuDdPhmTCMVKwa2oTSO6nmWiZTOYVWRAj9v6k=;
        b=uYUQBh8cgCAWcO6E6PCC26vGkZY6z9LUkuoj3Plca1kP5+iQc6Tf0fbwxj4xcllabx
         isie5SoEDY8QxYNfbCqV2J9rTysg6rtlt/VDjLTLJUD8QbbsMpC8i+Olr/JywIFl22lw
         Kfl5H07mNq8UJiXNyDhlQWSJroK7Kt51sfVB289p1zr2UgF5zExLnQtOAibWA24yX9sY
         a+lswnWasgOpkNXeuj+m8pgQpLNvQcuL6pKuL9aa0qWziQ99rtb5KokGSyq9SoAhOE83
         O5/EEFL1wyXh/Q9UcV0lLmNyYoP0CPBnT2KIh+r8LogTEg5AL2zKd8YdSf3DhAs09USk
         ze4A==
X-Forwarded-Encrypted: i=1; AKwUvBxeSAtpAn1/f6Ca+HPuUpQmPLTw7oW2Ef/lrZ843ZAKt/p6/58/t18dXVOefy0v9lWca44tQENzEcoLbLa95tqf5kKN@vger.kernel.org
X-Gm-Message-State: AFq9FYKKmM48U63/InIjxha+ddS4O4/iAJN7hIBBc1ivofM+8EHgfZB1
	IRnbUu/RQHC3GvY6twg1jqSNDUsJxbnrtiCUKo8wU+xtgk4dbMWgzb0aYb5tjugVk9NS/5m6kRy
	mZYA6Lz0=
X-Gm-Gg: AYBFou1HE9u6TVMSmUZD+MHjCumIc554yeWG63foy0lWq6qSymVxi0pzYEwUBol9H4M
	pw1ewoDFUc4xcjD7bNnkc1I/7WRBBymbPhCEb6LwbudcXEH2LVi7zJT32HIk1qyKzzjzH/VHHAD
	w02934Ln2ZwGr56Nfkh3oXjOz8M3YEZ2FfhDvFmkeSGeis5ZAzUaOmw8uZzVhmq4v371Rd1ydUX
	Mcvvz2C0y5FhLhY+qJLkxBXkb3PnesKJRAMc4Xt0NMpCuLh+7Q9WKgnXF/4smrb8ipnesAH612b
	LYOkl2KI+g5AD/+UWIw4ePceAS+LXpj41cKRn39uxU/WX8f452BTSP3T+Hys8zb0epX2zXTIKMo
	ehjlfDNx4JJeakaqZga8CgHXBBMAtbdH1n6taN4tTp7oPCnzreYigTNYxKUe3rsD6zP1S8msE/B
	T2nzEjJzoPSM2PodluKtMBwncfJGuf/rf6HVPBlhN8WuyTi8Up1jgvPDuM5SH2isq0fPiBfa2fz
	D+OylSueBEHlpk=
X-Received: by 2002:a05:693c:4159:20b0:34c:8c69:529d with SMTP id 5a478bee46e88-3537e0a9695mr19398687eec.26.1791904536420;
        Tue, 13 Oct 2026 08:15:36 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:49b8:4c98:b3d1:72aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm30691751eec.31.2026.10.13.08.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:15:34 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/4] Input: use designated initializers for acpi_device_id
Date: Tue, 13 Oct 2026 16:15:21 +0100
Message-Id: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqAIBBA4avErBPUJKKrRIvSqaaFiT8RSHfPa
 vkt3ssQ0BMG6KsMHk8KdNgCUVegt8muyMgUg+SyFVw0bNKOGFmXIpNopDJdq5TgUALncaHrmw3
 j75DmHXV8D3DfD3ssq+ZuAAAA
X-Change-ID: 20261013-acpi-input-2ed24d864410
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791904532; l=3150;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=wOidxVLM17lR1bDj1xmePaeabjfnEZRB6ayeFW+JFtY=;
 b=3nBJ7LuFCwN0BxizqOoBp4bXcaIg1JOxRLLNOjgImEEFpTUGRJj9GgEbTgxtJDNlq8bnneSjj
 d99NFSj62JuCotFSi+uU6I3ZgrlwgwKTTqUE5MdgnHyI2NX9zANx80j
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc7.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (4):
      Input: keyboard: use named initializers for acpi_device_id
      Input: misc: use named initializers for acpi_device_id
      Input: mouse: cyapa: use named initializers for acpi_device_id
      Input: touchscreen: use named initializers for acpi_device_id

 drivers/input/keyboard/applespi.c           |  2 +-
 drivers/input/keyboard/cros_ec_keyb.c       |  2 +-
 drivers/input/keyboard/goldfish_events.c    |  4 ++--
 drivers/input/misc/atlas_btns.c             |  4 ++--
 drivers/input/misc/drv260x.c                |  2 +-
 drivers/input/misc/soc_button_array.c       | 12 ++++++------
 drivers/input/mouse/cyapa.c                 |  6 +++---
 drivers/input/touchscreen/atmel_mxt_ts.c    |  4 ++--
 drivers/input/touchscreen/chipone_icn8505.c |  2 +-
 drivers/input/touchscreen/elants_i2c.c      |  8 ++++----
 drivers/input/touchscreen/exc3000.c         |  2 +-
 drivers/input/touchscreen/goodix.c          |  8 ++++----
 drivers/input/touchscreen/hideep.c          |  2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c   |  4 ++--
 drivers/input/touchscreen/melfas_mip4.c     |  4 ++--
 drivers/input/touchscreen/raydium_i2c_ts.c  |  4 ++--
 drivers/input/touchscreen/silead.c          | 18 +++++++++---------
 drivers/input/touchscreen/surface3_spi.c    |  2 +-
 drivers/input/touchscreen/wdt87xx_i2c.c     |  2 +-
 19 files changed, 46 insertions(+), 46 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261013-acpi-input-2ed24d864410

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

