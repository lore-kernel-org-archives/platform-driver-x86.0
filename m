Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2720351C30
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028286; cv=none; b=N4bDsV8s5w1FXxSCpsbR4a76FoaYfx1I0cgRQdLB6YJBALo61KLbuBDmdWFgjHHnwodnY84GsrjlAMurCaNXsJCCozJl9FVOjrwDVGkbYDyqzJtVWvGUX00HqQvtSPerTdFAcnbDlwStSW73kJUcok0vlOi2paUs2IdVA3WwU/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028286; c=relaxed/simple;
	bh=koGTKVqD8+zMdSJtWYeFbbzV5ugq00/sUjphVjMkmdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n6LRHV7k0cGNgEV00GyWXAHhLyG3KPufdHrWvVYgJT78ohlvQCvITa62XzPWsAj4CmORo9m2Nze9Zrt8h6IpN57q5aTtCylmkT92DMHfhnSykaRy2zHqy1SJTzQ0K1iNIQzyu8DfHz/fm2lnE7pcTxVfV1YU6tDQhAhu6y9l8Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tva8pcns; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tva8pcns"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b6b0500e06so6750741eec.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028284; x=1776633084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JyN7dSpRF1gNB+eSbZFmL0apa8pKVm1KmRJfawpaCDU=;
        b=Tva8pcns4YGx7lVPyxU9FOw+ntACX70avgFPTveJAg+VEh9/eo5lX6p/r2yLIM9wSA
         fJWyaUCMDSaqFrr4dGivYNncvjIOpYZ9Dlgemx05NpI8hE6YQfofhWU4uC9je9f0zUuA
         OjhbYylbkKrwNc79F+TnS/X+d8IYo+UvS8DQFI0M86Wa+LY2RwjeXzLvOKOVq3YJagbY
         OQZNabKE5cyPcKs0ovphqj+LM13sfmnrHelaR/2ig4Ousrs2OW8VNr0B91JvYvlLi0xw
         oAl1xnfR9gkJ+FxW5gGxbqyc3VJRbARGncOsYi/RUFKzkA3cyfuo43ECmnTtvAfEGXN/
         M1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028284; x=1776633084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyN7dSpRF1gNB+eSbZFmL0apa8pKVm1KmRJfawpaCDU=;
        b=NVFo9+S/AJkm2LFor/evu1XuzYk5qwQG7VJsDxO8t1Jz31T2mhOj9ZHPCAC9ig5rDm
         RrjF00Q9IuDWCFPLiGALCkcbf9WZltEePdGJBFr3i8A0A5SoWDdKPAoMZ9dyxlxmQiVr
         Rsqad7GheBLNkv/KDrFFetgK6w0KS4j0BmKfzYTA1uYXeugP7VZ/gy9utd9+FNfazzA3
         +MFCA25LWtDvPg7m/nfVbluDQDzqw152w9csygaPvSyvK0SIzWlrpMGVKWrQoNdM+KsZ
         WbklocO0KPaF+oSxEJq85xesZSUvcgWx4NsxRGA+PNkyWIU7yBJ3piCSc/9RD7XCLkcr
         M7/A==
X-Forwarded-Encrypted: i=1; AJvYcCXSB0duXkfRfqsHE5g7D4Cg+cv2wHUWUcJPQJKASJ1Gy7fYXLzuck4rKg81sv3VuQLd4pIK2InfJdFmn2NwPv4oSAPk@vger.kernel.org
X-Gm-Message-State: AOJu0YzcDeVWnVE7miZMyzPTqDq9ExxEbC1WMm7/E7CyxPweayvhNqf3
	I+eiPOGCulL9v4mP4ZZ7RhtsS7qFrdy2jIBWj+pwoRO/hgEgtJKQAwvh
X-Gm-Gg: AeBDiev+bXQQ3Br9TARTBVMzS86LM0oWIWkxys5AXjIOGEnYWVL0pHoppRo5R9uc7I/
	VEGM6gOey/4lX91iGRFA0ZFHEXBDpbr6/YWLbq7ap528374Zuqou02qfgxjz7FVMoK3EeVcdpR0
	2rXEkXAaW92kWLMNp3/q8cnnrKpvHFULyXrnZUD0OW0ZLKu67vRIdqhHFxmXLiss4EFsNurRmSN
	E4k2A2qOyBjgdugcEuGC+/Hrg/p7DzmO1N9ZRFoVqIEwbE0n98vbwTdEYMXgaBLwq1qeAnebFrO
	rmp+PmvHOJg0C0bYG+Fn1FN2W5D/Vl7EbPFHTUh91ScG37RS6ACUb29eL64EtEN2Y8P2FhjJRAh
	4bV8n6MEOM7DGG9XevfFw939IH9cz6jZE4O0vwEXPHJKuVJgaaVoiKSJMtHRjzW8LTihJB2FnYR
	WU8Sz5RQZwtoiWCky11kViQnqee1grauOyO4prdN2GLVA8v7blahmK8tpSHBu0Qq4Ba5zFpu79v
	73HRqbkvkBqMU4=
X-Received: by 2002:a05:7022:327:b0:12b:ee7b:51ec with SMTP id a92af1059eb24-12c34e6b527mr6479650c88.1.1776028283829;
        Sun, 12 Apr 2026 14:11:23 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:23 -0700 (PDT)
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
Subject: [PATCH v10 00/16] lenovo-wmi: Add fixes and enhancement
Date: Sun, 12 Apr 2026 14:11:05 -0700
Message-ID: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds many much needed fixes and features to the lenovo-wmi
drivers. This version has been re-ordered to ensure the simplest
application to the stable tree, with all fixes being pushed up front.
This has caused some churn in the latter half of the series where I'm
immediately changing things that were just added, but this should ensure
a better result for all kernel versions so I'm happy with it.

Patches 1-7 fix various bugs in the existing drivers and are Cc'd to
stable.

Patch 8 moves all gamezone enums from the gamezone header into the
helpers header in preparation for the rest of the series.

Patch 9 moves LWMI_FAN_DIV to be next to the rest of the fan attribute
defines in preparation for adding additional attrbiute macros. This is
so the attribute macros can all be in the same place in the file.

Patch 10 adds a function to make assigning attribute ID's for capdata
cleaner and easier.

Patch 11 adds the remaining CPU attributes that weren't previously
exposed.

Patch 12 adds GPU attributes.

Patch 13 renames a name constant in preparation for patch 6.

Patch 14 adds battery charge-type limiting when supported only by WMI, or
when a module parameter to skip compatibility checks is set. The
MODULE_PARM_DESC macro creates one check and two warnings in checkpatch.
I reviewed other examples from the kernel and I am following the same
convention, so I left it as is.

Patch 15 adds a debugfs directory.

Patch 16 adds a debugfs file for dumping capdata.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v10:
  - Fix misnamed attribute in wmi-other.
v9: https://lore.kernel.org/platform-driver-x86/20260411162334.25682-1-derekjohn.clark@gmail.com/
  - Invert ida_alloc fail logic.
  - Fix dropped mode arg in current_value_show.
  - Fix misnamed attribute in documentation.
v8: https://lore.kernel.org/platform-driver-x86/20260406201400.438221-1-derekjohn.clark@gmail.com/
  - Clean up rebase mixup with re-assinment of wmi_method_args_32 in
    patches 6 and 14 from {} to { 0x00, 0x00 } and back.
  - Combine ret_obj declaration and assignment in patch 1.
v7: https://lore.kernel.org/platform-driver-x86/20260402032424.678528-1-derekjohn.clark@gmail.com/
  - Add 3 additional bug fix patches from Rong Zhang reported by
    shashiko.dev
  - Reorder patches so the fixes are upfront in patches 1-7.
  - Fix various typos and rebase mixups from v6.
v6: https://lore.kernel.org/platform-driver-x86/20260331181208.421552-1-derekjohn.clark@gmail.com/
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
  platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
  platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
  platform/x86: lenovo-wmi-other: Limit adding attributes to supported
    devices
  platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
  platform/x86: lenovo-wmi-other: Move LWMI_FAN_DIV
  platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
  platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
  platform/x86: lenovo-wmi-other: Add GPU tunable attributes
  platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
  platform/x86: lenovo-wmi-other: Add WMI battery charge limiting

Rong Zhang (6):
  platform/x86: lenovo-wmi-helpers: Fix memory leak in
    lwmi_dev_evaluate_int()
  platform/x86: lenovo-wmi-other: Balance IDA id allocation and free
  platform/x86: lenovo-wmi-other: Balance component bind and unbind
  platform/x86: lenovo: Decouple lenovo-wmi-gamezone and
    lenovo-wmi-other
  platform/x86: lenovo-wmi-helpers: Add helper for creating per-device
    debugfs dir
  platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata

 .../wmi/devices/lenovo-wmi-other.rst          |  19 +
 drivers/platform/x86/lenovo/Kconfig           |   3 +-
 drivers/platform/x86/lenovo/wmi-capdata.c     | 128 ++-
 drivers/platform/x86/lenovo/wmi-capdata.h     |  31 +-
 drivers/platform/x86/lenovo/wmi-events.c      |   2 +-
 drivers/platform/x86/lenovo/wmi-gamezone.c    |   7 +-
 drivers/platform/x86/lenovo/wmi-gamezone.h    |  20 -
 drivers/platform/x86/lenovo/wmi-helpers.c     | 139 +++-
 drivers/platform/x86/lenovo/wmi-helpers.h     |  23 +
 drivers/platform/x86/lenovo/wmi-other.c       | 747 ++++++++++++++----
 drivers/platform/x86/lenovo/wmi-other.h       |  16 -
 11 files changed, 935 insertions(+), 200 deletions(-)
 delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h

-- 
2.53.0

