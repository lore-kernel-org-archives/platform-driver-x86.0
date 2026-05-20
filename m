Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC6E35B645
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 06:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779257266; cv=none; b=WXldmbfobhjxnxxvoF2hpPUfjiDj5JclSM0yPonmTyF8GcQ8CyUVH7Sp2TUuLon7rzx3fOj5HbbekAgWa0W48DH+QXCb9fhVxfIkAhoHqHXWXXZLfBKi766RWOIs4SzdgJ62m2QU4LI1a61+yKb6u7Oot71SRsC1OKlQLNVjdZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779257266; c=relaxed/simple;
	bh=MbQblLqyoLUuMolclqfdr7YHnURB8919NSENYR7kzls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Haf3oR4oGTt9pyeoIF+HK4zsqIEy8VAnoy+VwKdD+54ccdZ8irWs8vNp9b2naEYJ9tufusqnrqU6xi1EGkieOYQmL+tpASZkRkGVB6oncSmIxjgsMRsa1+z6iYrpufA+gOW/VGekYphqaQwcuCddhRdT5Wh95AnYndGiugoQF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROWOEAnL; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROWOEAnL"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-135e88b8e55so2026764c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 23:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779257264; x=1779862064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nx6XU+xRLvrYq1SSpcMKF1EExYoYD5t+Ot3W5K+uvxI=;
        b=ROWOEAnL42uv96SMlA2s7x2BJPsiKuMQlXznhfs3mprNlMDmcsmk2+tbJjNv+STrdY
         BvmBppDTkj5xcKOcMlgWFZgViLGro2qBg5IRXjkQPLdSIEohCXSnjsf93HTSxpahLS7g
         KL77yHWmDcDx+TAEUo5yEZuRsToN58fszaCgnDD6VRw7LOR+ZNI+YbEOgfrnO8OJn0So
         bza+Y7g+cImPnKbq7+OOx+jMhxbjmuca8kaLjBlQYItOS7l7PIfHYV0UFrlP9kniKKF3
         ibs36KtMYtCk3+9urY9j9v12KSNgnvcX9Hk+lbfDF/q7m8MubvqS9Qv5inBlLUtyn9/R
         /32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779257264; x=1779862064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nx6XU+xRLvrYq1SSpcMKF1EExYoYD5t+Ot3W5K+uvxI=;
        b=Ca5AaAG+9xI3uf8mf5zrejrhEEfa4bWonZlWmfJ3kOWzdJK3EAC53hk6mNQsRes2GJ
         VDbAIqgaRWW5bZW4zMLFMPXFBSNUBq9lrPQ8AQW3Rfa1rDZWiZPCalVRzDL0AEmH3DeW
         5ZPYgUAmkVjkWtGNFZVo2ljKdOPkde6mfzzHzNUEB7pfGmC29KsDS/EcYMxA3MHK0PJO
         izpJ/jverkm0XXSMPIdmoUnT7YemAJTxcmnZLsybDN3QyimoCQ8qV0XZUo3toY2TEoLV
         xDCntQlXQdj4wElhdAb76vrcp/t7HTSy2kkQOfDwPpX5Zs+XZSU8kbrW7UAKjdOjTUU+
         2P0A==
X-Forwarded-Encrypted: i=1; AFNElJ+PTQCv+i+1ehrhyX8eWSaapgY2C/vrAWSKjHeRH+LNCu7lU5UFKf/Hxg7zpriRmOkxfCz6q7bIgAG5/Ahj6GyyKPst@vger.kernel.org
X-Gm-Message-State: AOJu0YzUe4jWgdy+z+L7V33NSOOFNd2FoAuQvi090vuJkSIvb0ZdzbkF
	W41kwkojsc1kPVXwUFVESmozq2b25UC1+xwVgoTI5aHqmT/UHA/WtbB5
X-Gm-Gg: Acq92OFWhmkl9p7Fk4gcvPYJbNY/zlXkcSnJkYrpW3kFDGGnhDVFCLwJ/RlJCpP/2/m
	R+xJfWVZjK9MUVDVfZKFGOQSymnSFHbWlBCn/rSegRPZBQcBFkBFvkYH8vkuzZJYpZgb0I9wDPH
	YMH3RVH03pqqgJ6aQ1dukYj5gZU7NBtwgbQVVNR0lQ4Bscx44M3O/mrqIDcJHoORt5ohM0kuZBO
	Fet0LA6lWwSAKZlkc+vv/c3or1kl1SX5jw+Wno2TcOVtJVzOBTpwqY6r18sZblpVE70vgnxS9UI
	/7sJvDX83BF4tI7DFjmt15DWKKWTqgrnq3QiHYBctN5ZHksxcNyUCUbard7+juXUVNAlQnSONqn
	nSEPIYmzjkYjfl03784y2i6gxzgR5SAZ2x4MAalcK5TvdXufrcUzXf4woxagAGGhs+tULzszv+u
	C1LYi8FJx8MKjidnVKDnFqLx6APoJUTjMsgzPKE4zHy5gSYf0p3d11l/fJtwFlddmz9YD7ED/Z/
	PTIBJxqRGtITPE=
X-Received: by 2002:a05:7022:ec88:b0:134:a731:e778 with SMTP id a92af1059eb24-1350563c2aemr9393265c88.39.1779257263958;
        Tue, 19 May 2026 23:07:43 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm27906026c88.11.2026.05.19.23.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:07:43 -0700 (PDT)
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
Subject: [PATCH v14 0/7] lenovo-wmi: Add fixes and enhancement
Date: Wed, 20 May 2026 06:07:33 +0000
Message-ID: <20260520060740.119554-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds many much needed features to the lenovo-wmi* drivers.
This version is based off platform-driver-x86/review-ilpo-fixes branch,
so patches 1-9 from v12 have been dropped.

Patch 1 adds the remaining CPU attributes that weren't previously
exposed.

Patch 2 adds GPU attributes.

Patch 3 renames a name constant in preparation for patch 6.

Patch 4 adds battery charge-types limiting when supported only by WMI, or
when a module parameter to skip compatibility checks is set. The
MODULE_PARM_DESC macro creates one check and two warnings in checkpatch.
I reviewed other examples from the kernel and I am following the same
convention, so I left it as is.

Patch 5 adds a module parameter, force_load_psy_ext, to bypass ACPI and
BIOS compatibility checks for the power supply extension.

Patch 6 adds a debugfs directory.

Patch 7 adds a debugfs file for dumping capdata.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v14:
  - Change charge limit -> charge types in dev_dbg.
  - Stop casting u32 to int in lwmi_psy_prop_get_supported.
v13: https://lore.kernel.org/platform-driver-x86/20260512235808.691046-1-derekjohn.clark@gmail.com/
  - Rebase off review-ilpo-fixes and drop merged patches 1-9.
  - Switch back to charge_types based on feedback from Hans.
  - Ensure force_load_psy_ext also makes is_writable and is_supported
    checks for lwmi_psy_ext_prop* functions always return true.
  - Add helper function for is_writable and is_supported to reduce
    duplicated code.
  - Move bugged attribute description to the correct paragraph in patch
    4.
v12: https://lore.kernel.org/platform-driver-x86/20260411162334.25682-1-derekjohn.clark@gmail.com/
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

Derek J. Clark (5):
  platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
  platform/x86: lenovo-wmi-other: Add GPU tunable attributes
  platform/x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
  platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
  platform/x86: lenovo-wmi-other: Add force_load_psy_ext module
    parameter

Rong Zhang (2):
  platform/x86: lenovo-wmi-helpers: Add helper for creating per-device
    debugfs dir
  platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata

 .../wmi/devices/lenovo-wmi-other.rst          |  19 +
 drivers/platform/x86/lenovo/Kconfig           |   2 +
 drivers/platform/x86/lenovo/wmi-capdata.c     | 120 ++++
 drivers/platform/x86/lenovo/wmi-capdata.h     |  14 +-
 drivers/platform/x86/lenovo/wmi-helpers.c     |  34 +
 drivers/platform/x86/lenovo/wmi-helpers.h     |   2 +
 drivers/platform/x86/lenovo/wmi-other.c       | 617 +++++++++++++++++-
 7 files changed, 797 insertions(+), 11 deletions(-)


base-commit: 2997606dd17729404cef9821ce66dd037b6019eb
-- 
2.53.0

