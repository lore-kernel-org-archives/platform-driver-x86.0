Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ADC2C3251
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760378762; cv=none; b=VoCcmegTIocPZH2OQh6i+qatBHXgkqdd+6ZpaXif3sbBLCgk9hWdfgN/LkJmLCMLj21Z/fcZcVs+I27bwbMTo0Byi9/rwA8WbPO3gFVMLqcOCPJlOKrHzPhofJz/rZxLKAfkawAIXkA/iI86oLHqViPqfUYhNuYuDHhNfBOKhYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760378762; c=relaxed/simple;
	bh=a7wh3cG3ABz4K86eIMdVOwmrskW3f+fcgjkb3c+cVHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aCmc/cNLvD0sYaJ06eCAxjLb3wXXehVV7OFpsgOrS1AjBz99SEjH6nQJxgZD4fNP2oZROGiqH3yPSNCS7//x0JbX38qVtD+lar1HcMRS1bMzCtATH+celuek+pnVtPkQXRoEARVD/AkSzKbfe4CJJ4KQGJ/lBXCf0133Gin4mD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vhmy5Mf4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vhmy5Mf4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so27355455e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 11:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760378759; x=1760983559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VP3Kg7Vk+ujyiE4qWbtPv+BhTHjgeglyner7LNCR7w=;
        b=Vhmy5Mf4IGJrGw9Lpt0+B8t/hF3VIAuiQp8UedJQBMrepVdl6De8vnPnYROLw529HI
         HaKcpaCmD95+rmZBR2kxjPxdDGJ9UMoLYuWFGhR86f6uz6K977e0EECHTiGpKoimzabD
         5GxhfZaSDns4wJEcObKWyePgi9abAAeezTdFo2jKch8Pwybl3F0uuFSkc8UdwO6HSayz
         XIWMukmMb1WPgNZ+at7P72J6+6oqxaXVgXx6xttwFGiUcAbahGVMZhofMEv6qJWkO4Ye
         E3SA+CfBw6kooy03E/qlLKvEP3I0kyKMQWe8anb3a+AclMQhFtusRKCwXpuYs72XrmeL
         YO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760378759; x=1760983559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VP3Kg7Vk+ujyiE4qWbtPv+BhTHjgeglyner7LNCR7w=;
        b=ODzfgITtM42PcXiLEqqBQTBFXKdesK3gcfp+MhtAXgsZRLm9TZVdQYiuLTV0QP0HXi
         KAhctN33b5vmtJBmZ1bAQyEd7vCWKkVEwUYvSBWo36sVM1nGVTUfJWueRYkfM7bhPcx5
         phMM2AEkFJVrEElwlquK1FgOHna+pLW6wJxtq1n1yW/jeGThE0dTZamTnMbRQn8cNpBE
         ZInYWMDdv9eSZylcCs6HAR9ES5VK58yoSei5SXMukp9C86azJmf+aJs6m/jV9ASN+oKu
         dh15yCjCrhEQEJ4SekSJluFpBPhHvZAvm0dD8Pe7Ld2VmFv/wUUGug//wP52/Nc1EY77
         NFWQ==
X-Gm-Message-State: AOJu0YzcpRBw7xE9PTE7JSQsMJbdwPOSnpRFPT5nVN0GDuXAPM9k14ce
	oW4P5LNruUtYgSpLzSMBowrt0Nq1dxW8eTIE/V4vc4KXmFJP6OR2TQUa
X-Gm-Gg: ASbGncuOBwDrPmkKfQ6XWiReAaECE0x51N1zXiu1YTZbcc36dDXZT8nswhqWV+UhGGe
	X5t6KSs/9hNEPno+e4cjIXbNYbBomInyA0qOKn9JtbhORwZ1Nz+/Y8MUrQzSygRvW+8RPR7Q4RF
	0vetrLx7piRRV4+vZeN65eHvmW2fNTCypRpjzYTe0k0lIzgoSuyvUvytB5wK+LiBNYvLYkdJI3B
	2U8TOi2VHu7KMtC576DlhjikRGaZrX7hcs+EQHvXugIuIo1MylPBj3h41oA2dRNtFDw1qCkWb22
	8NuvpHgKFsKCnxwLl1sJowPQmg4HIqGBFC+3PTuUQ6Hh3vGh8ec1xaO4TwRRg3t+9qdeKOiQUYk
	o4qojEbSorlWDaxNchi19R6i6/Q6ZY/7H02/DKMLrgrIHsN9mk7IvuuBX
X-Google-Smtp-Source: AGHT+IHaeaDMYXDWX1MCuH0krkFw9bqA4mRJHZqfaeRyiVnl6hk486hXnDMHp0Z32s6CwpGP9YyukA==
X-Received: by 2002:a05:600c:6383:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-46fa9a8c425mr143818775e9.1.1760378758624;
        Mon, 13 Oct 2025 11:05:58 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce589b3dsm19933428f8f.24.2025.10.13.11.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:05:58 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v13 0/8] platform/x86: Add asus-armoury driver
Date: Mon, 13 Oct 2025 20:05:26 +0200
Message-ID: <20251013180534.1222432-1-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

the TL;DR:
1. Introduce new module to contain bios attributes, using fw_attributes_class
2. Deprecate all possible attributes from asus-wmi that were added ad-hoc
3. Remove those in the next LTS cycle

The idea for this originates from a conversation with Mario Limonciello
https://lore.kernel.org/platform-driver-x86/371d4109-a3bb-4c3b-802f-4ec27a945c99@amd.com/

It is without a doubt much cleaner to use, easier to discover, and the
API is well defined as opposed to the random clutter of attributes I had
been placing in the platform sysfs. Given that Derek is also working on a
similar approach to Lenovo in part based on my initial work I'd like to think
that the overall approach is good and may become standardised for these types
of things.

Regarding PPT: it is intended to add support for "custom" platform profile
soon. If it's a blocker for this patch series being accepted I will drop the 
platform-x86-asus-armoury-add-ppt_-and-nv_-tuning.patch and get that done
separately to avoid holding the bulk of the series up. Ideally I would like
to get the safe limits in so users don't fully lose functionality or continue
to be exposed to potential instability from setting too low, or be mislead
in to thinking they can set limits higher than actual limit.

The bulk of the PPT patch is data, the actual functional part is relatively
small and similar to the last version.

Unfortunately I've been rather busy over the months and may not cover
everything in the v7 changelog but I've tried to be as comprehensive as I can.

Regards,
Luke

Changelog:
- v1
  - Initial submission
- v2
  - Too many changes to list, but all concerns raised in previous submission addressed.
  - History: https://lore.kernel.org/platform-driver-x86/20240716051612.64842-1-luke@ljones.dev/
- v3
  - All concerns addressed.
  - History: https://lore.kernel.org/platform-driver-x86/20240806020747.365042-1-luke@ljones.dev/
- v4
  - Use EXPORT_SYMBOL_NS_GPL() for the symbols required in this patch series
  - Add patch for hid-asus due to the use of EXPORT_SYMBOL_NS_GPL()
  - Split the PPT knobs out to a separate patch
  - Split the hd_panel setting out to a new patch
  - Clarify some of APU MEM configuration and convert int to hex
  - Rename deprecated Kconfig option to ASUS_WMI_DEPRECATED_ATTRS
  - Fixup cyclic dependency in Kconfig
- v5
  - deprecate patch: cleanup ``#if`, ``#endif` statements, edit kconfig detail, edit commit msg
  - cleanup ppt* tuning patch
  - proper error handling in module init, plus pr_err()
  - ppt tunables have a notice if there is no match to get defaults
  - better error handling in cpu core handling
    - don't continue if failure
  - use the mutex to gate WMI writes
- V6
  - correctly cleanup/unwind if module init fails
- V7
  - Remove review tags where the code changed significantly
  - Add auto_screen_brightness WMI attribute support
  - Move PPT patch to end
  - Add support min/max PPT values for 36 laptops (and two handhelds)
  - reword commit for "asus-wmi: export symbols used for read/write WMI"
  - asus-armoury: move existing tunings to asus-armoury
    - Correction to license header
    - Remove the (initial) mutex use (added for core count only in that patch)
    - Clarify some doc comments (attr_int_store)
    - Cleanup pr_warn in dgpu/egpu/mux functions
    - Restructure logic in asus_fw_attr_add()
    - Check gpu_mux_dev_id and mini_led_dev_id before remove attrs
  - asus-armoury: add core count control:
    - add mutex to prevent possible concurrent write to the core
      count WMI due to separated bit/little attributes
  - asus-armoury: add ppt_* and nv_* tuning knobs:
    - Move to end of series
    - Refactor to use a table of allowed min/max values to
      ensure safe settings
    - General code cleanup
  - Ensure checkpatch.pl returns clean for all
- V8
  - asus-armoury: move existing tunings to asus-armoury module
    - Further cleanup: https://lore.kernel.org/platform-driver-x86/20250316230724.100165-2-luke@ljones.dev/T/#m72e203f64a5a28c9c21672406b2e9f554a8a8e38
  - asus-armoury: add ppt_* and nv_* tuning knobs
    - Address concerns in https://lore.kernel.org/platform-driver-x86/20250316230724.100165-2-luke@ljones.dev/T/#m77971b5c1e7f018954c16354e623fc06522c5e41
    - Refactor struct asus_armoury_priv to record both AC and DC settings
    - Tidy macros and functions affected by the above to be clearer as a result
    - Move repeated strings such as "ppt_pl1_spl" to #defines
    - Split should_create_tunable_attr() in to two functions to better clarify:
      - is_power_tunable_attr()
      - has_valid_limit()
    - Restructure init_rog_tunables() to initialise AC and DC in a
      way that makes more sense.
    - Ensure that if DC setting table is not available then attributes
      return -ENODEV only if on DC mode.
- V9
  - asus-armoury: move existing tunings to asus-armoury module
    - return -EBUSY when eGPU/dGPU cannot be deactivated
  - asus-armoury: add apu-mem control support
    - discard the WMI presence bit fixing the functionality
  - asus-armoury: add core count control
    - replace mutex lock/unlock with guard
    - move core count alloc for initialization in init_max_cpu_cores()
- v10
  - platform/x86: asus-wmi: export symbols used for read/write WMI
    - fix error with redefinition of asus_wmi_set_devstate
  - asus-armoury: move existing tunings to asus-armoury module
    - hwmon or other -> hwmon or others
    - fix wrong function name in documentation (attr_uint_store)
    - use kstrtouint where appropriate
    - (*) fix unreachable code warning: the fix turned out to be partial
    - improve return values in case of error in egpu_enable_current_value_store
  - asus-armoury: asus-armoury: add screen auto-brightness toggle
    - actually register screen_auto_brightness attribute
- v11
  - cover-letter:
    - reorganize the changelog of v10
  - asus-armoury: move existing tunings to asus-armoury module
    - move the DMIs list in its own include, fixing (*) for good
  - asus-armoury: add ppt_* and nv_* tuning knobs
    - fix warning about redefinition of ppt_pl2_sppt_def for GV601R
- v12
  - asus-armoury: add ppt_* and nv_* tuning knobs
    - add min/max values for FA608WI and FX507VI
- v13
  - asus-armoury: add ppt_* and nv_* tuning knobs
    - fix a typo in a comment about _def attributes
    - add min/max values for GU605CW and G713PV
  - asus-armoury: add apu-mem control support
    - fix a possible out-of-bounds read in apu_mem_current_value_store

Luke D. Jones (8):
  platform/x86: asus-wmi: export symbols used for read/write WMI
  platform/x86: asus-armoury: move existing tunings to asus-armoury
    module
  platform/x86: asus-armoury: add panel_hd_mode attribute
  platform/x86: asus-armoury: add apu-mem control support
  platform/x86: asus-armoury: add core count control
  platform/x86: asus-armoury: add screen auto-brightness toggle
  platform/x86: asus-wmi: deprecate bios features
  platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs

 .../ABI/testing/sysfs-platform-asus-wmi       |   17 +
 drivers/hid/hid-asus.c                        |    1 +
 drivers/platform/x86/Kconfig                  |   23 +
 drivers/platform/x86/Makefile                 |    1 +
 drivers/platform/x86/asus-armoury.c           | 1174 +++++++++++++++
 drivers/platform/x86/asus-armoury.h           | 1340 +++++++++++++++++
 drivers/platform/x86/asus-wmi.c               |  166 +-
 .../platform_data/x86/asus-wmi-leds-ids.h     |   50 +
 include/linux/platform_data/x86/asus-wmi.h    |   60 +-
 9 files changed, 2760 insertions(+), 72 deletions(-)
 create mode 100644 drivers/platform/x86/asus-armoury.c
 create mode 100644 drivers/platform/x86/asus-armoury.h
 create mode 100644 include/linux/platform_data/x86/asus-wmi-leds-ids.h

-- 
2.51.0

