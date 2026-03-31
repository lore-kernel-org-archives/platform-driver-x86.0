Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9219A3E3D9D
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980738; cv=none; b=t5JovHc/qLlgG3PIqDTabDXk/vlI7h5rVy6MzEi684ReNB82bC8/aQoRdc43Jw8D82pM+6JqgXzx7oISOcoll+KOk0EQC1V6t+43Z6hx8KwEIay82WLUGwrJv7zmUah2C37tIou93FTbWggEP0WxFDTGsoQrrzHaXyPM0t1fjPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980738; c=relaxed/simple;
	bh=aS2VEndl1x5GX4YU4whjJrEJslje4VSUOQm9skgbG7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VfP+2z0NZWqSi0Avxr9BLKfo04mAtrPe7VXhOt7RGqYlRoruySlqbVnNak9OacfWZyPoppvQm1T2pv1TZn95FVmRClHxkttTXG+qkcACy1/mOUELUMKd2TuoQLPoylKnp6Tcv0ZOkzOtGVbhQg4vlI6lUTjMlpNVmJEWe3/ZB2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBWuKc5/; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBWuKc5/"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1274204434bso134865c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980733; x=1775585533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXqFGfnZOohFZ5jCvUgU9upCsANV+IaiAMn5ggVt+Zk=;
        b=LBWuKc5/AELHIaYE0hoR0guhSEH4wJMmRk9INtG6D0uzinaXXnUNsPyzH1YgHdbPcM
         gayXeUV0hkEOhD17FH7uhggqoSOuzqgk8pUkO+ahsuXJk3KjPkMMj170dSZwZTXFCSSS
         /1SjzilE7IZuK3DNt7RJ5MDS3mQtb6Un6GMtMfjQCklEVepeQ+ihkd0q+VmIJjJABk0A
         zdi2E0HGJlCB8zePQ2Y2tqeacR20e6XEahne1yGTZ9IwZ9EE+n56lYnhli3eSvRk+eBR
         O8HzV0wrvg1qvdGB2kHaWlzBiB8L0eKwATXJ+GdpXRt+xoclcuzsvvfR7AHu1InZX3MY
         Zs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980733; x=1775585533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXqFGfnZOohFZ5jCvUgU9upCsANV+IaiAMn5ggVt+Zk=;
        b=A3ASfa6e+OzAQYGCpDMEiurJw1UxLcakdGo+vohN6IkSei3ZBx45D/Dh6cae5B5Osg
         8K/JapWdX7t0Ga5MLTrskLmL+lcYfoU4PJkSOscLi+anKXQDkm/W+WkV8ebaYEmlGUBv
         sXk7zRyJXOoCa43irO5PKctevtRImYXlydY7XwUwxcmwTwZl9zowqsHI4ijEaAe/Mjci
         LWp/sBQmZaRY+mQx45M882wjmhlOppFGG2x04kiKqFebT2qh6pT2z6AZDFGrU14S9G7F
         rdkqOgw7B16JMpGoMGs2do91G3/aLmZv7ueyG0+JQoiSxst+SV00nh7nXupsVlGZjctA
         HzKA==
X-Forwarded-Encrypted: i=1; AJvYcCVG2qna+5hO2JoFGT2EN6BN/j5nV75HScq8G8gfkJE3eCbOVXJFoH+tFOngGIhJzf0ts8kuwr7zEisrSc/PUlaQdvPV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywegt37Z5fPSjmQ7rFfjBtt8ZZk/D4Xt1cDAcTKWZ6PT0dT2jHQ
	JXW3P6f5EmFJ6UX86Cg5kh0fuev0Mw714ZRFGnkSIJvg9+RANzckw1dv
X-Gm-Gg: ATEYQzwXKCmgJuOxLfPqr4k47lmJJS2q8BLVbmwmfq894AqjBIAUYf5OV1yNb/5jD9K
	4F9F04pqTffyilNlIZd/35ar/jq+BcydmWe0zYACKsCK1b6ap09/Scv1M4ex9Ds+xw3MQ5Kldyv
	+q43yjXMI29/vi5mv3lqFIuK87RFkR8kKZUnwG/Pk3secN9O/2Z6+6kitP1pQeL+AXhKHRqSX3w
	Bwg28LyZ78ybFH0K623Fz7nNlsZ4YI9rsvxTqcnqL2ZJvRx9k9BdHe0mzvdWcCEFUmUjrFLo3rX
	K74uDpUg/ZtU1X0glunKD+864kr8mlBNM3ssVhkW2i1iKWOeqfwvXJgTnMCZ4lwP1c56SApKnAj
	+C044QiatGl1XXRIknwRpfZ2Xnkkk5jajmHtqKdFO87YeVKq4McfD6WrrD5gQZIyY1tvrU7JvhW
	vPG6sxUEMygbyRgaNKtgRxzrgQ+MYMS9cgYVq3ngNRTwQR5aWTKVLH7dbIe5NgavlTRGacsRj+r
	cKL
X-Received: by 2002:a05:7022:eac1:b0:12a:68cc:3ee4 with SMTP id a92af1059eb24-12bddcb3df1mr2133979c88.0.1774980732498;
        Tue, 31 Mar 2026 11:12:12 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:12 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/13] platform-x86: lenovo-wmi: Add fixes and enhancement
Date: Tue, 31 Mar 2026 18:11:55 +0000
Message-ID: <20260331181208.421552-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds many much needed features and fixes to the lenovo-wmi
drivers.

Patch 1 moves LWMI_FAN_DIV to be next to the rest of the fan attribute
defines in preparation for adding additional attrbiute macros. This is
so the attribute macros can all be in the same place in the file.

Patch 2 cleans up tunable_attr_01 by removing an unused pointer and
correctly assigning the members as u8 isntead of u32.

Patch 3 fixes a bug when sending 32 bit arguments via WMI where the
second value in the args struct was uninitialized.

Patch 4 moves all gamezone enums from the gamezone header into the
helpers header in preparation for the rest of the series.

Patch 5 adds a function to make assigning attribute ID's for capdata
cleaner and easier.

Patch 6 addresses bugs where devices that don't support exposed
attributes would still create the attribute, and also attempts to
identify the correct capdata and set/get methods since some legacy
interfaces don't use the custom mode in the method or capdata ID.

Patch 7 adds the remaining CPU attributes that weren't previously
exposed.

Patch 8 adds GPU attributes.

Patch 9 renames a name constant in preparation for patch 6.

Patch 10 adds battery charge-type limiting when supported only by WMI, or
when a module parameter to skip compatibility checks is set. The
MODULE_PARM_DESC macro creates one check and two warnings in checkpatch.
I reviewed other examples from the kernel and I am following the same
convention, so I left it as is.

Patch 11 fixes a bug where the 'gamezone' and the 'other' drivers were
incorrectly coupled in the Kconfig, leading to side effects under
certain kernel configurations.

Patch 12 adds a debugfs directory.

Patch 13 adds a debugfs file for dumping capdata.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v6:
  - Incorporate Rong Zhang's debugfs and decoupling patches into the
    series.
  - Add a patch to clean up too many cross-references to wmi-gamezone.h
  - Make lwmi_attr_id a static inline in wmi-capdata.h
  - Added a patch  to fix a bug where ares.arg1 is uninitialized when it
    is sent to the firmware.
  - Add supported checks before adding battery extenstion, and ensure
    both the new checks and the is_writable checks are not casting u32
    to i32.
  - Misc formating changes.
v5: https://lore.kernel.org/platform-driver-x86/20260324221032.1333636-1-derekjohn.clark@gmail.com/
  - Remove cv/cd_mode_id references that occured before patch 4.
  - Move lwmi_attr_id to capdata.c with a namespace export.
  - Fix mixing include.
  - Make lwmi_attr_is_supported return bool.
  - Use switch instead of if for setting/getting charge type state.
  - Various formatting fixes.
v4: https://lore.kernel.org/platform-driver-x86/20260312031032.3467565-1-derekjohn.clark@gmail.com/
  - Use loop instead of back gotos for identifying the working attribute
    ID.
  - Use function instead of macro to assign attribute_id, preserving
    types.
  - Removed unused defines and enum values.
  - Rename charging defines to clarify thier purpose.
  - Fixed various formatting issues from v3.
  - Added module param to skip ACPI check when loading the driver for
    the power supply extension.
  - Don't abort adding power supply extension if the ACPI handle from
    ideapad is not present.
  - Don't worry about symmetric cleanup when cleaning up attributes in
    an error state.
  - Reword Patch 8 commit message to be more concise.
  - Fix wording in Patch 7 to match the changes.
v3: https://lore.kernel.org/platform-driver-x86/20260224043200.2680384-1-derekjohn.clark@gmail.com/
  - Re-add HWMON name const and just rename LWMI_OM_FW_ATTR_BASE_PATH
  - Fix linker warnings by moving acpi/battery include to the end of the
    list.
  - Remove CPU/GPU OC features. These attributes are BOOL type and will
    need a new constructor that I'll add later.
v2: https://lore.kernel.org/platform-driver-x86/20260215061339.2842486-1-derekjohn.clark@gmail.com/
  - Fix gpu_mode misisng from attributes list.
  - Fix prototypes for power suppy patch.
  - Reorganize CPU and GPU attributes alphabetically.
  - Break out the patch consolidating the driver name cost.
  - Move some of the refactoring of attribute_id back to into patch 1
    where it belongs.
  - Fix some additional typos in function prototypes.
v1: https://lore.kernel.org/platform-driver-x86/20260213081243.794288-1-derekjohn.clark@gmail.com/


Derek J. Clark (10):
  platform/x86: lenovo-wmi-other: Move LWMI_FAN_DIV
  platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
  platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
  platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
  platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
  platform/x86: lenovo-wmi-other: Limit adding attributes to supported
    devices
  platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
  platform/x86: lenovo-wmi-other: Add GPU tunable attributes
  platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
  platform/x86: lenovo-wmi-other: Add WMI battery charge limiting

Rong Zhang (3):
  platform/x86: lenovo: Decouple lenovo-wmi-gamezone and
    lenovo-wmi-other
  platform/x86: lenovo-wmi-helpers: Add helper for creating per-device
    debugfs dir
  platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata

 .../wmi/devices/lenovo-wmi-other.rst          |  19 +
 drivers/platform/x86/lenovo/Kconfig           |   3 +-
 drivers/platform/x86/lenovo/wmi-capdata.c     | 128 +++-
 drivers/platform/x86/lenovo/wmi-capdata.h     |  31 +-
 drivers/platform/x86/lenovo/wmi-events.c      |   2 +-
 drivers/platform/x86/lenovo/wmi-gamezone.c    |   5 +-
 drivers/platform/x86/lenovo/wmi-gamezone.h    |  20 -
 drivers/platform/x86/lenovo/wmi-helpers.c     | 136 ++++
 drivers/platform/x86/lenovo/wmi-helpers.h     |  23 +
 drivers/platform/x86/lenovo/wmi-other.c       | 689 ++++++++++++++----
 drivers/platform/x86/lenovo/wmi-other.h       |  16 -
 11 files changed, 891 insertions(+), 181 deletions(-)
 delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h

-- 
2.53.0

