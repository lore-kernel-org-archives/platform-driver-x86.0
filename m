Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372D5366548
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 23:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630295; cv=none; b=VmTYaUkzyS18lee/XNxPBTybNTdLoV/QOTfbB5GKIpjt5VRT90/NPPxyZ+g1rscaBGqA3gZtqHPEcsU3oOe7yLWjggbOMmoQgu2jZKxjcMtw0bWTW66UZJpc3GELPIhoaYPUNoV3kDoP4v42SObk0+049vMhfavrG2hOxOIUAT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630295; c=relaxed/simple;
	bh=wyFJ06Hrst95M8Tm5mwLKszQ2+Da/sfLpRhAMqp0bCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSy9YI0jJu/dNN70uc2Pso5on2rWAZasQfUdlutLxc4oZobYYFnUWoB3RRk1x7787NP3CZ7pvYjfTuRPa4MxVZMJwrgkaPuQtChCsUttiFA62Bhzvpzi4LgFnxM5bzqNk6YIhYhyezq+I91D+F1gdMYe5dVt/zim++UXmNKjBtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vv+ET+dX; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vv+ET+dX"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f0ad52830cso9028419eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 16:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778630291; x=1779235091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WNBkpORDTYepcaCZoKz0aaYdu/QY8JizzQp5w+n4WOE=;
        b=Vv+ET+dXgKYijAXXdhxYL6krwiqtk24VScSG9u8HRBO1v+mMzudU7zr2iEWrdmFbTS
         3vcym9MlhQRI/7R6ANWYtOI8k8+yAYjyiJ9iMTszcD4o/9HQgLvaFEaLHH0wN3MtlTF+
         TjyvA7uJmwlriB7Vzts4UMhWzRpg+khIe/P7v7KTKXExBgc0UsRixJ4i5b2kMvnWkQJc
         tQfvz/Cvn3A1XNA9cVY9FJxpf/lOZwYmeOTjXJLDSMG+EZNZYaOUopIylGkVQcZ8Urd1
         80H4sJeJb089lohPFjblMP3ih/vt5/UjIbLdhk/zRJovLlumNThI4zAz+AxMtXdsBzNd
         0ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630291; x=1779235091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNBkpORDTYepcaCZoKz0aaYdu/QY8JizzQp5w+n4WOE=;
        b=m3rC6VKx9fdqYAraM3NtAmwCBZhZl6df/yiair1CBw2YLlNDl99scYsSJqBNANkn44
         lj3kfYqg4kuDAUsJ0GWFeF5EHJ3014Z/F7JRmD7bpI8b8wcOCtM3cyJatKGr3A3qzC4e
         y7w94W1Bz5qvZUVeRIku5LyuGCWQHj800shUDPEza3M/C3rMzxsfahpQC3guCri+bZ/C
         9jr7Rcx9ctqBZO3pN2eGLSuTt21h8mLpWi1WrpkyWIRso4kPvjnfWX5iB/MUHe/6mbss
         6pJRhsgcBRLy1na4IJxcmvoaHtR3O1qv/PpuhKOfWalj3eFnjRZvfTQSv/9wwNTL1rX/
         IfPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8A6D7VR/ar8wslS/fXJmBU4Kb+lb1P6etE3P/xDHnwop/KY0vdkMBw6HRuwD/zqawWWZpTOrUcoJSUzxrN/u6wllcB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9SEcafMfCtA1TKw2CrwYgue4HkMbF4OXVMBrni12EuHMGU8rL
	PZBhBmCavvy9+b9RO9qFEhX8s6PdIFNYWwSgSYDzsPkX0fdGTC2Lj+PZ
X-Gm-Gg: Acq92OEj3c2J/fiwNFS1vnc6eOWXwFXb2sWuEdxNcpbMsH96lN5OPkPSSvDsJwgrudK
	rsZ5nKj847avt+DSdZ98EC1HeTRadli5RpKY3LnnPuHk9//F1V34tlrXf8385jRYPk11oTJZFTl
	tGfdPGRiJ/u4Tph8/eKy/0hpOp7s6eeq/TmdJv3ORKO8GRiNu69JYKxkQtytYftyh7eWGnd5uRJ
	6l4ZJiVlSJ2qF/OQY4WbUvB7z6/dR9CiIsB41o/0/wHnnuk0OR0s7BlR24gBzMGrgsZXDAmVamc
	Kp9tLFQk5Mjf5/q7Od5QLs0OB5b5OOpDWE67+EptVaYyKsVERT5DUpIGn6TrQdKXw+y/v2SmJKg
	hACCrmDuW5ZKqOAW6Eh3eqHMedIM2Rg5oLYgQynyx1DflvVftWmPa4CpYk8WG6u4VjhED310arY
	VFjVZ6K7j2o8WeHHswDmvn/1BYuVzpBipbhwQ4a69WL4l9o919sRSsaMtdE5sW3V8mKIFAUW6Z3
	Y7z
X-Received: by 2002:a05:7301:2907:b0:2e2:d94d:6188 with SMTP id 5a478bee46e88-30117c7ed0dmr643242eec.7.1778630291099;
        Tue, 12 May 2026 16:58:11 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm23625851eec.27.2026.05.12.16.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:58:10 -0700 (PDT)
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
Subject: [PATCH v13 0/7] lenovo-wmi: Add fixes and enhancement
Date: Tue, 12 May 2026 23:58:01 +0000
Message-ID: <20260512235808.691046-1-derekjohn.clark@gmail.com>
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
v13:
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

