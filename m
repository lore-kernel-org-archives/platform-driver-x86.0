Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662C51F19A
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Oct 2025 18:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517738; cv=none; b=sYrCVSU1duWIBRPaO95X2xmNx4hwaYu3Sm7g2yups82DlyyJyjHCaLGJZJdjJqbHu18fX7gWWUgfnBEJX4VII0f2fO7chGDHTFl1rrq2nXheCnunNUqifQj8+kQ0NYk0/8XFTP/QjpjAAUWM+GkMt0yO/9XAxQ7atyPgqpOOKiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517738; c=relaxed/simple;
	bh=lRcUa7cnfGo2tiA74SjgOQAf5dlOro+mNuAd7jli82M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OmIC7Smp1yYyr/4zZbcWzuozUhb3/PXX5qXbVo2xj3wXGEZ9KKm94zc6UhG5ULjjtlhRxf/N+sNf6gdNY9BpMz+ZixHOXTpASGhuW5Qusa7kHGz4kO3rOX7HostaGTMbljAB8HIv6iuVRrxPBOjqoZIH36QFOgXGdnA2zJnpA38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iR0CRT2U; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iR0CRT2U"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4060b4b1200so2218977f8f.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Oct 2025 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759517735; x=1760122535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8e8g4VxpMcelz/fVFpGL84xgKQ1+EQ7lsBZrW9KHzjQ=;
        b=iR0CRT2UK26sT3xH4qr5WM/39M9yJhA7l24PID8lHd02loR9YPIztdgyHFJJyXu6tC
         EeDo+1eEObjnBncQB7QmQ5qsh256zVWGGgtlxH+aDzjZGWCc24poVvRHqpTHYEmUL4U/
         wUaNEzYKWvlQew3hpp+epuw3WU5UqueDeWo6pZHumEqASXMCbg8pv8X6b7/6APjNXbey
         hC//iBAfGzwxGuHrbCFrxFXRCisayt90cq5gs6SviVx4wbVryUigTTuVP38h0XBi2qqK
         Jnh/GGsp8rbuiqpAMsw90EKeY6utagM4V41ufahXITBuJ+I6jNGszw/8GT1rbIzNwcio
         1HEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759517735; x=1760122535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8e8g4VxpMcelz/fVFpGL84xgKQ1+EQ7lsBZrW9KHzjQ=;
        b=v25hMNgDD+BtO+Nj9kUd6pLzZSqy+63zRN6X+CcCVUHNSSXRkINrbptHxXz/cu725/
         QpB8OOSFIJwAkJAs7242+2stK7+TZJEaE3GlihlB1KcwjnnNsEf6LmOyZ2dniLYfU2FD
         m1QzNtyDsEgGyAi5UiHIjtqBuOxzoKL/1x84et3M9DUW/OiYsOK5hCTR6sdDAt5I7tHK
         HqPX/putGcYu7uvv3UbPeChrsbm45rJPgb6Pap+L2Mbslumskct2rvRLAMwSIh7BQc/m
         UjCbI0FnBHol9ssZbPwwEHPpj1hyJW2tZmZS9HYLGOcHhPIx5ctlQckxyQ/HWoHOs3zg
         gvkg==
X-Gm-Message-State: AOJu0Yy8T8LLu+2m503ZeOa62y/5vhr+w+lFQWU/JIIU815mWB8ldCJk
	rrIyJQxQXFim9wj7eTurFb9AHTAEFqMvZvoTnwxWMxN+wI2R3xMHvnvN
X-Gm-Gg: ASbGncs3NCS7o05OKEUWxbiLo5u9KDJOg0C1kktPspzH/TxnRCcwaj15BPaavH/RrwG
	MrjYe6HBs5m/5IFnWNIaaPQOhNxBbLw7bGz9R1A3XK9gXmEUu6lb5fYogL6gVeK2pzYesfIEcBO
	LXhWZc+JplelQ37ZBDiR0GHsUSwBE+rC2m3qJT0DX1KepZugkQiM015OvZs95jbZur5zz3n1j/a
	N+frC7R48QvzdRfiKyRUEZgnTeIkQlEmRj/BFcuclebKuy8qzrlb8WIaEUeyJwUkCTD31jrQxis
	mvnW8+YYUHNLelS0g1NloREWt95XVTbdckdbVcMoQ+ASH7aoV24kUaKfghPcMUfTU1wchR5CIAW
	EQGYZyI6V1tDFf4YIDI9MTppMIrXeTVP5x2VFNq6OToojrkCdgns=
X-Google-Smtp-Source: AGHT+IEoAMRZzX4Ki9YDhT+xvOdEomjcN1k+Rlok9jEHe6pPWgq4gyEOz5b9rmtLGoEDn1SMKgNfmQ==
X-Received: by 2002:a05:6000:1866:b0:3ec:e226:c580 with SMTP id ffacd0b85a97d-425671c1b86mr2594722f8f.60.1759517734485;
        Fri, 03 Oct 2025 11:55:34 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9762sm8946927f8f.38.2025.10.03.11.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 11:55:32 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>
Subject: [PATCH v12 0/8] platform/x86: Add asus-armoury driver
Date: Fri,  3 Oct 2025 20:55:12 +0200
Message-ID: <20251003185520.1083875-1-benato.denis96@gmail.com>
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

