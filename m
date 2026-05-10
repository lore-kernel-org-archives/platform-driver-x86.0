Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D32836F
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387153; cv=none; b=NV0Z82SyymY4nf2RNMN973OXO6cISu/X2HLb1eIL7UCDU4iieuK6HNJ8Ict+3argusHw/CrJznY6yUBCQxdWIia9VV11TRu3nAVbJZ3Vk/JvQNXrQftd9Zc0tc/69Es1A3eJZyWzcilJ/8tW0a5GRdwVYR+UyAs6aOJwaWWZ2bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387153; c=relaxed/simple;
	bh=zVjY5PAgoayu8ZUPVlDc5nMa0/jIRUm5NO0Aq3735TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rktLBtduBhV1ya+psh0ZtrDBw4HOng40KkrBd7miJ5hGxwYfEBcJZeqZ0Vbtc4o+/x3W+rH11uhZAwdOxCiwv34BXdGbCDF8i5VGokGk6FXyRnFQrxMXFj/8Rp58+8XAgK+NIMSN3Xa98a6xmLL6aRgbdGlv0ivTjyFvtEBRNO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+vNtnIS; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+vNtnIS"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso3935633eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387150; x=1778991950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PqtVhEaVWnp1lRm3AkInJ91h/Wuun/IaD7ZjeoG5PHg=;
        b=P+vNtnISBlQNcwGCM/eiUJcprJlKQcg8fGaGxpL5L1iFN4Fm6mwd5OW4O6pk59hffc
         WFzeTKNaF65w9afmllWob3Iuxe9TolBkUOqSVgnMKvIBIi6xKEc+NVfsRg75A+qJQ1bA
         BOzVgwfMPckAB8OkTJ8UFnBc/IUoBsmp49K4m5dR6aetCIDWmR6sXVTocutShdDNMIcx
         p5X/Yztu7HrskOPOH0coVBCXyqmeIG9B8plgd72zfX9EmK+Mn9TyABDuTGMy3tsWILsv
         i0nAMUt+R1JO2lV+O+RzGPFNg7XExfCp+LBnBWRF6mA0ptODgUYvNJFRXuGPXUsqbxcD
         T45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387150; x=1778991950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqtVhEaVWnp1lRm3AkInJ91h/Wuun/IaD7ZjeoG5PHg=;
        b=f2OBfm1emskTce7SN0CeEZSYTKbZhMwzFCfEmzpuThIGcQxzuW9DDEBWamngUb/KTs
         UK4+XuNPdao5uTOjmNDwRLGnvoF2Ny4Wm0kIdwpNFD5XKY/f0fxG0vRAAotuWgY9QuQU
         ucvgCv/wlcZnpzaxcWzN3z2uFnUv+ZJ//6n+Jynyn3W2sOKosDUO8aMFMlJdt7r6uxgp
         wpjCgy9ARLZ0GlSq3uqq5Ood4hjj56XmIPRYIZ0vkCRS/L5I94IhP2jTZ8dtQ7d50iyS
         a8vZk/tM/5XxtuChrUUFo8TrJZmgf74eQBbAXWmNQ1c6mJe4chXr5oUr8aVItYZR7DGa
         OO9A==
X-Forwarded-Encrypted: i=1; AFNElJ9mYFrct55CKdCNGBCCSpHxiT8DCyYLM/Y/XOZbM4+WFaSPnarABWIuxaUDyuGv7CcvGYLpiIcfv1LlOc1bJoXdrpOd@vger.kernel.org
X-Gm-Message-State: AOJu0YwFCMix8zBaN/UJxBEUt+Tf+jEpUxY2299V/61YtymR+7ij2EzQ
	buqv0t3X9oBSorUHLn7UjYCJFeoklW+EvaZp2nQDsoSMsgkFJ+TmbkUZ
X-Gm-Gg: Acq92OFIE7zGDUuJzQS/skYlqY4rnJyxTwumBevqkXAVspyjxnU58ERNT6ENjS0dr8G
	uZlwu8DB3eH1+ooyxPgdd8mYW1YvTC1sG0FfLsUoMoXY/Np23chP8T6BzwidKKDvQOKqobU4LXQ
	sJQtYSIdnea4dvD+XlYNlTDGJeW8QeZsD1uSA4Vw6gKhnQpW43MHrJqDLyhgFtfi/E8evAcBdlr
	nGCOt0iuIn8bvLRXVa31MV1aQV59ucU3k1OH7OfOBeufTos/qqgr9S6wkcFOvsVQIpSEXczatTw
	XjU17sVsNVmxOHcXucYj3z+MOYRCGWgrTOv1mBejD+0lCVdnX/noSheIvfKXEjaf7R0fDb8A977
	fvFpp+4JVrKKidwkZVGmiEne7CsUKGvViL4hnREYg8jpQ07va0Jy1sLSc/QORv23R2hFuz73DSK
	NocYYIC2vy8yWqxgGnVATaHEQZXJHXkmfmAsRfoPtlT4gQS0TF25j8AJZ2y+r7zeK/ugIKFeF5V
	/Wu
X-Received: by 2002:a05:7301:5f02:b0:2f5:6dfc:cb6d with SMTP id 5a478bee46e88-2fb3e2cf016mr2210769eec.11.1778387149413;
        Sat, 09 May 2026 21:25:49 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:49 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 00/16] lenovo-wmi: Add fixes and enhancement
Date: Sun, 10 May 2026 04:25:30 +0000
Message-ID: <20260510042546.436874-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds many much needed fixes and features to the lenovo-wmi*
drivers. This version has been re-ordered to ensure the least amount of
churn in each patch. This has resulted in two formatting patches being
added to the stable Cc list as prerequisites for some of the fixes.

Patches 1-9 fix various bugs and formatting, and are Cc'd to stable.
for the formatting only ones, patch 7 moves all gamezone enums from the
gamezone header into the helpers header and patch 8 adds two functions
to make assigning attribute ID's for capdata0X and tunable_attr_01
cleaner.

Patch 10 adds the remaining CPU attributes that weren't previously
exposed.

Patch 11 adds GPU attributes.

Patch 12 renames a name constant in preparation for patch 6.

Patch 13 adds battery charge-type limiting when supported only by WMI, or
when a module parameter to skip compatibility checks is set. The
MODULE_PARM_DESC macro creates one check and two warnings in checkpatch.
I reviewed other examples from the kernel and I am following the same
convention, so I left it as is.

Patch 14 adds a module parameter, force_load_psy_ext, to bypass ACPI and
BIOS compatibility checks for the power supply extension.

Patch 15 adds a debugfs directory.

Patch 16 adds a debugfs file for dumping capdata.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12:
  - Break out force_load_psy_ext into its own patch.
  - Drop fixes tags for formatting only prerequisite patches Cc'd to
    stable.
  - Fix formatting in various places.
  - Use correct type when passing args in new functions. I will revisit
    & fix older functions in a new series.
v11: https://lore.kernel.org/platform-driver-x86/20260507180507.912966-1-derekjohn.clark@gmail.com/
  - Reorganize patches in a way that cleans up the churn with
    assignment of attribute IDs. This also allowed dropping the
    patch that moved the LWMI_FAN_DIV patch as it is now effectively
    moved when declaring the updated LWMI_ATTR_ID_FAN_DIV macro. As a
    result, some formatting only patches were added to the Cc list for
    stable since as they are now prerequisites to some of the fixes.
  - Refactor charge control patch to use charge_behavior and
    charge_control_end_threshold instead of charge_types to be in
    accordance with the power supply class documentation.
  - Minor additional formatting fixes.
v10: https://lore.kernel.org/platform-driver-x86/20260411162334.25682-1-derekjohn.clark@gmail.com/
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
  platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
  platform/x86: lenovo-wmi-other: Add Attribute ID helper functions
  platform/x86: lenovo-wmi-other: Limit adding attributes to supported
    devices
  platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
  platform/x86: lenovo-wmi-other: Add GPU tunable attributes
  platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
  platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
  platform/x86: lenovo-wmi-other: Add force_load_psy_ext module
    parameter

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
 drivers/platform/x86/lenovo/wmi-capdata.h     |  34 +-
 drivers/platform/x86/lenovo/wmi-events.c      |   2 +-
 drivers/platform/x86/lenovo/wmi-gamezone.c    |   7 +-
 drivers/platform/x86/lenovo/wmi-gamezone.h    |  20 -
 drivers/platform/x86/lenovo/wmi-helpers.c     | 139 ++-
 drivers/platform/x86/lenovo/wmi-helpers.h     |  23 +
 drivers/platform/x86/lenovo/wmi-other.c       | 867 +++++++++++++++---
 drivers/platform/x86/lenovo/wmi-other.h       |  16 -
 11 files changed, 1061 insertions(+), 197 deletions(-)
 delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h

-- 
2.53.0

