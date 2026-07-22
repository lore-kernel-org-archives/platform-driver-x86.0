Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A6841F7EA
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 20:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750655; cv=pass; b=ihO2qefWZy8Z7sXtupF5LmrFOZiOPhtJcemW7QFt/vWQUowLF0mvdByOrpDqJpzexYuad8YiKYFwdwbQxseSas1/3ibY62ATb4TMiMux+PpLoWT3e+M4XagWXZOnCpJyR9ssIdje5KU1/woIhoNtv75asMkUKKAErcfR+Tiy35Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750655; c=relaxed/simple;
	bh=VUoh6Zej1p/NgfTCKZAF7lVFg7MFBi7bdeaONLT2MU0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tCJzZ9FCGR8kzZ3OT+StOD+vOCBfP4s5w51OXyHpx69J2tusfiQDUfkStn3w4shLganpXOVKQM3q7jB54oX+gPkfXax0h6Gza0DFmi5R9Us0zUjK9J6vVvAaiWH3wb6GkBInxzjBoXW7QTvoyZN4GlknMMCooO/+hom0bpzf2a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=eRtJKKTr; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="eRtJKKTr"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6626b5ace23so6186246d50.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2026 13:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784750652; cv=none;
        d=google.com; s=arc-20260327;
        b=dsdg5VAveMw0E3nD+XNLuLz2MCiGjW6eCm/BX0TMPEtRB3vBbwBQmTVK5C9fNGEvhh
         cJoRuYTb15fg6VbCpea3jAHIyvvoURV7ZN6h9izKxenSF1VRmFEXHU0FVtLsImPq04iL
         C3w9UkTKVzQ4aUikF5WsfvoDSPRpeFoTrbnsDZf+ezGZRW2/K8qEz1bwm0BzLdPGI3CX
         9fBCQ3hC38fXBn50VnNq5Rd+HeMbAE582XwtCQBt4supH5TT3vY06K/poDfvz6kEuZd4
         hDy7gd2VWroA7krElgt/NUTplz0q3KYAEEdJya51IXEoWJV2mJwA9lnD0cbKYK4ZI9Jb
         y+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=K3rg68Z7dZugwFf430EjqcxzoIsDG5+smUFg2Tob6vI=;
        fh=b/TQIWd+u1Dk/l0spdyLRVvjiSHLX5wv3vFecVuiZMw=;
        b=ezAVACGHpSqCa0JXV9xKd124lqEfaBJJW2JKPZ7ul+zJvnnSEdJEzpamYtsSHfyJum
         JkUSd9z5dj7ffRhu2jDEEH5bGcSO4tZoDRXG+sF1jhSVxxSCO9q/0V9sshZtCwb2JCH0
         84UMtHekS2K61Qd4dPbWY9gBaY0z0clSRGBoos/wQF+aMWxqjBmz+Gi1h9G3Cvf7BxdT
         hj9+/UQCtHFNa47fl7q9cRgDn2R7yUzqxpbqIU33zHsChRtVLTC3uDVNbrOVTscXsS0X
         PdWInVXaltFo2ETs7fYLR/c3NMBY5u6ChLcuPsy+aMRjfaIyp5TpHAnAQ7Ey7Eai5ovP
         X4TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1784750652; x=1785355452; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3rg68Z7dZugwFf430EjqcxzoIsDG5+smUFg2Tob6vI=;
        b=eRtJKKTrkWdbiqf35ILrYMd7oanMHqF091ZEr/GiIPSXRSeDJxwaonxU640+5A5GD8
         DBolAaX8AmUD6/rX3Fark0s+REtpD+AlnILS7+JXJtSc+lj9Gsf7xwAtklZx6NSsNaUQ
         FpQcGQMa/huoUu/zWviBl8r9VQnovCv8dD3z5GZOxOnwgq0/MbNC7Yb9xrj8lfJ/niDP
         l8jzrtbFdZ/yUxxTwu2vTMooavXzRUorFC41lY+5zmd3MSCWFP13VC/cJT+qoT4VO252
         Kd0wB/09sfRp1c9eWwDSgKAiQbXz1VjGDV5LusvRfWPKQOelB9jsHcHrpiH+7XqKb09/
         Os2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750652; x=1785355452;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K3rg68Z7dZugwFf430EjqcxzoIsDG5+smUFg2Tob6vI=;
        b=HBbC7jHrN03IbbjMm7w2weC8q6m85oemgo9mMDhzcIibzRU3rLzoSCob+lZMmi3n4I
         cBeowpnKWzIu0Q/kODePFHgp0dxXXz/j9sdaL63GydM7k0NY+iySTyuaNMeBv1D06Lpt
         HbEndEYrrPu3vWAy3aCOyW96wGkSK6oOQW6t9Cv1b1/mfA+jJY2u7U1YcR9v11j9pl3v
         NPRrXmkwvbvKTNETCu91Xpj62umsPFheYMBov+yUVFoR0TaVWFL55f3Owdz7Mkg2ALH9
         pHYrsSmkvJ7qRsPwuGANww0Ry5TT8mq7/XZ7lewwKsiktDOnLCe0Nqy9+Ash/6TT3gQP
         ssBA==
X-Forwarded-Encrypted: i=1; AHgh+RpRhF+vwsqg1aJlPxCqfUbMKdCdlYdse6RhOMIt4igecJihHuLXgCBwnq5j7UC2Pot6TVZDtHBehhEvUHBI4xWx/BNI@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa9x+2nhBMAV60WjDAxKhEsCFM/ljNFlR6BuPmHw4VY/4nj2vd
	9DsQHjxtMTTK90pbyCS+FR6mvuxdCnOs6gPSbNMYyC9D1/njsIYt2ZpEjKy0foS5FjagGTpenhz
	5V3/RA51xpGZhtYdK46kbBmhTlcxN76pyU8poDJsc
X-Gm-Gg: AR+sD13CiR5usyhq7cMIbCyCgyZiW0HlIHj5Gbyy2YIMT6wxHJmXPOYfQaKlXZpF+Sy
	4/NoYeQX7Z2tAb+/5CXOysVeam5kCO0wh1qnGWOSZiqsz4zNl+eFhN6QT3GvujTsrtEGJBj5S7R
	uvy5Lkq3r5JdV+Uakxwiv6vRsF1103kIu5CHs3NVbvPYQWf5UGWB84OLNafgW/KqjjQc/EZ5EoQ
	hlLro6pBc8bhYub0OC8B8IMKXyQyxm5WMdC0XNylpAPa7j/4DI1dHO6YtGCBZ3DIPNYw81lDTyF
	+q2GaXwnfTHw5fM=
X-Received: by 2002:a05:690e:2510:10b0:667:f213:bbc3 with SMTP id
 956f58d0204a3-6688e8b4edbmr1297593d50.36.1784750652448; Wed, 22 Jul 2026
 13:04:12 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 13:04:12 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 22 Jul 2026 13:04:11 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 22 Jul 2026 13:04:11 -0700
X-Gm-Features: AUfX_mxa4hqNsQNkqzfOIleXD9b6qvQy1FeR-OxSlkdigDwk68DoxXnuujytnxI
Message-ID: <CABtds-0wxc+f2H5YNHx16GA=23YqNwwyt=fpJ89T07JdN6WT+A@mail.gmail.com>
Subject: [PATCH v8 0/4] firmware: Add coreboot CFR firmware attributes driver
To: tzungbi@kernel.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com, 
	luke@ljones.dev, denis.benato@linux.dev, prasanth.ksr@dell.com, 
	jorge.lopez2@hp.com, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	josh@joshuagrisham.com, briannorris@chromium.org, jwerner@chromium.org, 
	tzimmermann@suse.de, javierm@redhat.com, kees@kernel.org, 
	u.kleine-koenig@baylibre.com, mst@redhat.com, chenhuacai@kernel.org, 
	wenst@chromium.org, florian.fainelli@broadcom.com, titouan.ameline@gmail.com, 
	oliver@liuxiaozhen.dev, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	chrome-platform@lists.linux.dev, sean@starlabs.systems
Content-Type: text/plain; charset="UTF-8"

Move the firmware attributes class helper out of platform/x86, rename
the coreboot-table firmware driver directory from google to coreboot, and
add a coreboot CFR firmware attributes driver.

Changes in v8:
- Add a preparatory include-order cleanup before moving the firmware
  attributes class helper.
- Add direct includes for __packed and container_of(), use scoped cleanup
  for EFI names and the driver mutex, and document the efivar lock
  requirement on private helpers.
- Replace the duplicated CFR record walkers with one checked iterator that
  distinguishes malformed input from the end of a record list.
- Validate enum entries before accessing them and propagate malformed child
  records instead of treating them as absent.
- Restore the EFI variable after a failed runtime apply without retrying
  the failed firmware operation, and only emit a change event when the new
  EFI value remains stored.
- Document the possible-values size limit and why CFR entries without a
  usable runtime EFI variable are skipped.

Changes in v7:
- Restore the existing include order in converted platform/x86 drivers
  and add Oliver's Tested-by to the helper move.
- Use for loops for CFR record walks, document pointer-based value
  validation and intentionally ignored record types, and remove a
  redundant PAGE_SIZE check.
- Validate the CFR payload checksum before parsing it.
- Make EFI writes transactional, lock EFI reads, and expose settings
  read-only when EFI writes are unavailable.
- Skip settings beneath suppressed or dependency-gated forms, propagate
  enclosing read-only or inactive state, and bound CFR form nesting.
- Propagate transient probe failures, preserve APM token zero, and reject
  enumeration values that cannot fit in the sysfs output buffer.

Testing:
- x86_64 defconfig W=1 build of coreboot-cfr.o on upstream master.
- v7 x86_64 and UML allmodconfig W=1 builds of the driver and helper.
- Runtime APM_CNT apply and reboot-needed behavior on a Star Labs Byte with
  firmware 26.07 and Linux 6.17.

Sean Rhodes (4):
  platform/x86: Sort firmware attributes class includes
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                   |   18 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   20 +-
 .../firmware/{google => coreboot}/Makefile    |    1 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1185 +++++++++++++++++
 .../{google => coreboot}/coreboot_table.c     |    0
 .../{google => coreboot}/coreboot_table.h     |    0
 .../framebuffer-coreboot.c                    |    0
 drivers/firmware/{google => coreboot}/gsmi.c  |    0
 .../memconsole-coreboot.c                     |    0
 .../memconsole-x86-legacy.c                   |    0
 .../{google => coreboot}/memconsole.c         |    0
 .../{google => coreboot}/memconsole.h         |    6 +-
 drivers/firmware/{google => coreboot}/vpd.c   |    0
 .../{google => coreboot}/vpd_decode.c         |    0
 .../{google => coreboot}/vpd_decode.h         |    0
 .../firmware_attributes_class.c               |    2 +-
 drivers/platform/x86/Kconfig                  |    3 -
 drivers/platform/x86/Makefile                 |    2 -
 drivers/platform/x86/asus-armoury.c           |    2 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         |    9 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    9 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    5 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    3 +-
 .../linux/firmware_attributes.h               |    6 +-
 28 files changed, 1249 insertions(+), 32 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (82%)
 rename drivers/firmware/{google => coreboot}/Makefile (92%)
 rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
 create mode 100644 drivers/firmware/coreboot/coreboot-cfr.c
 rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => coreboot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
 rename drivers/{platform/x86 => firmware}/firmware_attributes_class.c (94%)
 rename drivers/platform/x86/firmware_attributes_class.h =>
include/linux/firmware_attributes.h (60%)

-- 
2.53.0
