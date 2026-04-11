Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBE233B6F8
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924620; cv=none; b=SELaZ6CbSkDerrcu+5zVSZkb03hnYqgqP4FqruVkGnfIjvGbWxP6QWAlMI5nu640oDYxNPzQohPwkJu/oIPu2oR5qx+W/Dhf23rFo//5ZyKUnlUe6S+Gevsd9pISHeLVmu0iCEgGPFkI0MlWxfSHFHlLmrMc0s8DzFoBob3W0X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924620; c=relaxed/simple;
	bh=VoJf0Ow/ZO1SpLbRLCmkOYyokf4NswZmhDv8CzmIAnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n2oWREhH1D9+JfiCh1DJFtM/pW4GQqXxfJr4HNIFTasDGKQfp5zzoJoCUDtq/WBIfPLcsq8WaEolDizIsW0YUOx/I0Cgsb+wKY+nEK8zDxNfLUZQ2C0fHQzSz3q9pB+0N4UbLQkmPklxP9wxSAJc+fOaTeR5BSM9MxbQUi0y4YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc2EeOFS; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc2EeOFS"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c1fcce8f8so3989454c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924618; x=1776529418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ErbI6s80ggnwe90FQyxoll7CZ+dFQeGjE3pVrT6j40E=;
        b=kc2EeOFSKySOcQ7n8zOR63hLVQXGflzvuGjZ7rt9Kg3kg3YiXwZDhGMHIhfrLPdg6O
         CTkY5A9eRpD4agDLUe70HiB8GdOOyycKvjPMsCmyYcIeJ8dNcALgQAnZP0umSO7zbOkN
         AVFLX2RWco7ouv1RyyztdmkijSM+s+kdQRyQnelBSDQBZGWBWDGGNc8s4E893isDlBK6
         qZ6z3q+ls9rSvmZbdnw/nG78VC9XNFOHA6kT55sV2wLO9M57d3pnInHFsqTJ5ec8kEXB
         vAz66hZgsotkbdLMIwYmB8sMjMwnuvyOy19+VIR24KhHeU1Y3lATq97ttRBLK98ArhMx
         0ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924618; x=1776529418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErbI6s80ggnwe90FQyxoll7CZ+dFQeGjE3pVrT6j40E=;
        b=fvTg+1zgFCFFQm/l5Ek46HOFS+ZRC7KH4d8u/hq7WsoKUvlwEqIrtZoGJIl0F3ghE7
         DTB2feOs4zwE6FBDxomhEZHVprx5yQCaJ+5swyuXQLciKNa/Oj5N1lfa5B+WZGPr2NFa
         feWB7/xvxZU1PgcWB4HiR3nZbYh3QqCtEQ4UZ0izAuoWY/Wz6BmtWEM6K7MoppHR1m5D
         Z1chkm/AmN2aRRgpahXmyu/sbRigkSWf4J+AOJ131jefKa5p4dWhTfWF/36J0gt2GUqN
         1dLcqjFvE4qdSE+L4LIrSKekqEYYWL70rTXisjgTflsFz7AcCQcENNhmnhoxBU7PAWar
         ZB9g==
X-Forwarded-Encrypted: i=1; AJvYcCVJHVc6IH54Gdbyv5RsuhwW29LArHJgsWqE05lWT6eJIz2q+dwn767SHf+97VLQPQvE+CVRVmFPa3SHg9PFT4fBxPNw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrezo5HsLjf0YalONX1qCapvGKg06ejhbkRRL05rARHvd0TaxZ
	+EE6l4W1Qa9pbKe7qRSp4xh8POmGeAZ9f0IW0dn9qdYUEVAydLIINDBG
X-Gm-Gg: AeBDievoDKQy8n5iwJ8hjcHBLWIGwwizLhi1Ye4GgEYUeN++OFfY2ZPcdB1uYQemPK9
	Sd8Eh8T7ijPwRxPK6t/bNB0791Qsu6cXuJEvUrGf8r3jdCFGSE4Fwz2B27Elkm3zNYvNUEvEy5c
	qeEO6i87ei0l8lw1VbskAS7kL9yaB4c5cixgNrC3yNblXJhZmwajsJkXpeNuibYS/GpA5HHnnlt
	Dfg7GX1lvH2ZS1qdW9EJirmeVbqId3OsbwDaoCXjenbfBu1JGoYRa26HM7PIlQ0k1WnG1NVm316
	M790DL1vxjoxLjlQ180llLk7Cd0GXLQokHxQfH6ejs95YghwDZqp5wPhnZGeyrxyZziYgMGiibV
	JchD5n7UmZGBi+vvVgPmLtddpRu/Vlo6yMMIV9XpEHirh/CGwuCmODafg/Tvx9NoHQGaDmJjVYH
	XZoEO6dUpO4I4AsBnEkQuWgqFW/yrKsCH29MFYLO95Ym+KH5w8cqnRfQfbC4eCVbKaSUa49GHUW
	LEb
X-Received: by 2002:a05:7300:7495:b0:2ca:e4f2:31ff with SMTP id 5a478bee46e88-2d5873adf3emr5060656eec.6.1775924618216;
        Sat, 11 Apr 2026 09:23:38 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:37 -0700 (PDT)
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
Subject: [PATCH v9 00/16] platform-x86: lenovo-wmi: Add fixes and enhancement
Date: Sat, 11 Apr 2026 16:23:18 +0000
Message-ID: <20260411162334.25682-1-derekjohn.clark@gmail.com>
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
v9:
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

