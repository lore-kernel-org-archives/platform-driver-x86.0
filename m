Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1739BFE8
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506445; cv=none; b=uDAcqA3GhvoeYcWhpnrqdV8kF7jjIzwyMKXH3IvEs7KpMTfS+/EMqdN1w+KtJYILQXHYoHirBDFJF4mum9ec+w0cBpFAB23bsufS7nr6A9KG7LaLkBB+S/i+szJ+NJix8+87CZbJEuXjfoi25EpuMmmbyL9rt8Y3+cA1mKLel+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506445; c=relaxed/simple;
	bh=MoadVnU8JCSueQpki9/KYskTj/4tTwEVm3vsZQgzXxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TEUItF3I9JqdONnhfiI4sf7uo4m9VL61qWVO/8z0yxk9lIZLKN2LjDm5BrvWr5DEyJ3BaXwUE1qEexiJ3PQePySFy8jc2KhHEDq4Xfl8a24b9aNlE4lZBCFx5P25uSx2OyuPom6m8UjxmL6zwpP83E1PSeqmGeZ2BAPEJn9/rtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wb2SFfl3; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wb2SFfl3"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4704781eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506443; x=1776111243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQkihaPMpyu3T7K9nehhISvHPCChQ3LVYoxWApYtavI=;
        b=Wb2SFfl3PIIHfuYtsw3ViXkR89iM9Gz4UHXZw4fWHyZIKjG/o+Sgp1KZ9T9uxuq7qy
         DYTgRak22nJPYSX8TGG5ztYM/+6OFdSLdRr7ue431Q+EoD4EymLzSi6vdrjR8Z7TN0dP
         ty1FkbrgHyRGQPZbuNezN2iY5tFcgF2teUNQmJ0xWfX3j2Vic4T8IdwzJWrFdv7Ct3GK
         1FIm02v2JPJ2eMgFZVgtuZQ+WhjQPTfOtozi81f7oWnQdK5vyM1Y4g6NW1IqMUu5CXip
         +ahzuQtLhCJHZgow4+0mmF4Hx9SLGzuQJf8ST8rFtiTAGoPyuSXSc3BHjFcgiA39HMs6
         oV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506443; x=1776111243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQkihaPMpyu3T7K9nehhISvHPCChQ3LVYoxWApYtavI=;
        b=VI62zyBViEAD7Ew4CTQpSdFWIurAtly+0GT7l1QQ0OGaLCQr6OaL4EbOxXMEk7WE3l
         oIw+x5OCq2zmfWPrFd+XfYlUn21yuVukKpHcI3voyp7HmYy40wgu1TWFPasYRGys1gAB
         74OIXd4aEYpvWjgjx3Krn/HutgJod2u5jEjgT47mZ/hXFbTUjrQXoqp8bCLf3QBDsvHI
         jVSdObrrRAr53NAfrjpt/FC9NDvBEkG0xDnGPZK5ox1kxuMxtL8+acUBZX24/MICQgcr
         oDTR8dmWD0I7djYSKVmgOgqRr40TONxtrO9V7wyTKJsZ/pPE41fZejYh8f/ZZdTsg0BX
         9Nyw==
X-Forwarded-Encrypted: i=1; AJvYcCVpHG6BX2GbpCweqkvO9yJqTx+IV7/pxafAUhyaAQ+YeDpmn/qpXVsME3NdW6Pw/O50hFfIz0RQ5y93Juqp9Gn9up0h@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1WinDgNeqBWsa8DxDZgfSgDy6iC6YKJk0+52ERVcTj/xXV6Il
	K+deEn1S4E6H2zWvG01Rdxmy7i80+EUZRVCB/y8A0jgVtQVj7oRLlahc
X-Gm-Gg: AeBDietbMsKT+zY0wTVeaGuLf3ELyAaSXk7gpWaQeF/Y347AUN51OS+RPUVuWvlc7/d
	EttuGgZYsX0umPjD0dU42Jy6DkTLSeoofxk3FzuUMMyjapp8+UkyEuL9j3EFRRhWjGvI1L6hhYv
	Fh0NDi7nbpYZlwVMHu5tvh5Z9/n6+WMzu8haMuIExL6lKOjVDNdExhxCQwTDAS48XWwwMG1xRvW
	xXhwO/V8TE6BCLftwyThF/MA4LaRcpMhj+d8DX5D5Z+ZAyd2iM+1JEc7S1L9sFHwT2RKbRK/kbx
	WSV3lKZwxYMFogzmzMM1Cw5jYgGe4AUQdLKyxoUXhl+cBxqX0IoaoBUnDjPMSu2TVjfXTlUFoaU
	9IbaJ3ytfMSkpKMG0eR/5r0cFuLi2/Ys+ztgrGexKqH7B379f1DPBt6D1flXdF3l8WDgQx1ceKU
	+MIWRFrnR+zn63D5dVEQdPC2dW5dDdzY9MIfDZuTiLDsEpUsU9LKSIilIN9t1cjuzN3eOGFMKJz
	CA/
X-Received: by 2002:a05:7022:b81:b0:12a:7f25:44fc with SMTP id a92af1059eb24-12bfb776c2cmr5464958c88.35.1775506442944;
        Mon, 06 Apr 2026 13:14:02 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:02 -0700 (PDT)
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
Subject: [PATCH v8 00/16] platform-x86: lenovo-wmi: Add fixes and enhancement
Date: Mon,  6 Apr 2026 20:13:44 +0000
Message-ID: <20260406201400.438221-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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
v8:
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
 drivers/platform/x86/lenovo/wmi-helpers.c     | 138 +++-
 drivers/platform/x86/lenovo/wmi-helpers.h     |  23 +
 drivers/platform/x86/lenovo/wmi-other.c       | 745 ++++++++++++++----
 drivers/platform/x86/lenovo/wmi-other.h       |  16 -
 11 files changed, 934 insertions(+), 198 deletions(-)
 delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h

-- 
2.53.0

