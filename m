Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C00327BFB
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177124; cv=none; b=tFvVCBvSc/3mC3bEPDs3r1CD7vhjKSRlqzAV4+2mg1ddnGG47iWMjpN12e44QlZn5nQKMEMym6yASW+N3qRxHb4iHPdTikDp/CfZ9nJLCwxA3nCj1u8nICn0NYN812WnMzboI+RtOx6surImeIFRr/uDMZhyGSZdqCf9SjNQVho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177124; c=relaxed/simple;
	bh=R/Q7geAg1tF9b4ye0fVe80vafA0vLfUjf4l/Sccu/Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vDGFn2zvbfXtHm6eVHGI7zU2mzBatimVb9sC5DnOukd3fIrt94YVNaKJZAXPSsSGzNx9xaT0Ls9NS8RcB/oh4M5g/IKxqyE2qCAL1vtFf/yBcNaQZTGl4YJa8JV8p9Am1kRccBnND8Al/NNUHfqxlV+rOGeIti7OKo61/QLxGxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgcmTCG8; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgcmTCG8"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-130a4aae5ccso703682c88.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177121; x=1778781921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMfNYhNMHY0rPrhPlvTEdIrdpxhM0vsM/uFi549UWco=;
        b=TgcmTCG8qAwtA2HlaJ7cy1muMo7iBN0TohZlj7FOEhkxHslkjkhaNrLjO1Wv4a9GOy
         pLp7gHeUdp4W6ejmoVqFoh+Fs1wnmlzNsXK+30gy/wKXn53JnC8IRkjJR1lIeYYevizJ
         IU6aIx06sJKDgNFhjnQrtA9nDUMT28rrnLlZUAhaVIWarKT6RVVwyUlqZ5YaFGMia8FI
         FyAzlV5vq0Kh9f6d4sUeYTrCOmUlwHm5rsAC7HL9Y03k6eXEb0yieDzlDjHsFrcPynPz
         f+UpCi2kpTAy6W8v6iMWVz+2XCVi0URnBnn/rZAig+R5UVlzokk4xhNj//pAjz+QLUgY
         rGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177121; x=1778781921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMfNYhNMHY0rPrhPlvTEdIrdpxhM0vsM/uFi549UWco=;
        b=i4VZoAv/SzJCms8LlMnkakR9MpROpcWpYM7SzLNqKMFfNtsP/l285JUlIQg7rRH9pV
         Bi3v+5kDNLXNKyoDaPBreGL4jodZaMT2X8XMvGLgVJRSap5/Mrt7kaFC+zpeKXR/CAue
         StrL+5g/dcI4RXmFOAkUsj8LTfAkfHxx7hf/vn24+B3ywC2YQECeyjCZFHDvYeNBqP6P
         G1ZpZWDcmkOeW69wJBrHHpwHRYIGBrwy7S43xY0Yp90+lmEmTrzy0j/mwDVe0c8rv8XD
         HoGveUmmnv2LQxHs7cdTgYvmvu2lLw38TvtCJdkA7mV/geYTjXpMzfeKmfM9CKA/CzDK
         KfCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QlEg2OPnqqZeHwYX6UdinCB7RrLbJYHuvHBYq4rtm5T0S/ZEej/QQDAa6fVDc9g/IJgm/ZCxkCB+2Inc3dpc8w7h7@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi1/3HUZEuDRQXBjUUtUFicrwyAoNRkHoNSaURGxr3Ug7x1K3j
	+vsh4XhcVHHI5RJcipqAraUUasQcLb8GFVfdQUCggdj+L3tyqaXa/G4K
X-Gm-Gg: Acq92OGaiz40v8Vnbp2hoJP482GwnrsD0IeUfyxeTZAk/4TqlgfL/DwylCMTEZsbd4e
	T/JuoKZiYTaehzzYPg7GdIV/eZvbbtzIHm2YQEFDRVDa+BC6xddr0ypcvIHqJDJu2Y6IJ0nuEt2
	HpCbL8lrcKicXrdJND1u8ynS8CsH+mx1WLKYlY6Tr2cOk3G00U/rLVcNw4HQk7OOSVGTSSiiGL1
	HHzhLJoBgfQgFMYdv8C6x8Dzp+cCpMdHbxnh8SPQNQMG2e6tgbw+bZKfKPjegdQPhqitSWPa5Nd
	EI9rG5wzJDPIhUrqZwNQkjNg4DkXG863c8rWJONT5+vpTTHhtbgl3UpdvapmdoDtzz11wbcuNoz
	UFwhRTxynBdwoeZXAFaZSk3Hp0HRf8THPCdoUoayPlT85ER5mqRir7ikIG5dk7bXQuZH3WfPjrI
	5yrs/jwN6RvubSCn88kG/aOvM/aH/2vb0VXTUbYMfO+D7axGlwmIxKGjbjrlrW/24JlxlcTXLhU
	KalqRYxZ9EBETg=
X-Received: by 2002:a05:7300:3245:b0:2ed:e16:6b4a with SMTP id 5a478bee46e88-2f54b98f603mr5358222eec.32.1778177121154;
        Thu, 07 May 2026 11:05:21 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:20 -0700 (PDT)
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
Subject: [PATCH v11 00/15] lenovo-wmi: Add fixes and enhancement
Date: Thu,  7 May 2026 18:04:52 +0000
Message-ID: <20260507180507.912966-1-derekjohn.clark@gmail.com>
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

Patch 14 adds a debugfs directory.

Patch 15 adds a debugfs file for dumping capdata.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v11:
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

Derek J. Clark (9):
  platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
  platform/x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
  platform/x86: lenovo-wmi-helpers: Move gamezone enums to wmi-helpers
  platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
  platform/x86: lenovo-wmi-other: Limit adding attributes to supported
    devices
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
 drivers/platform/x86/lenovo/wmi-helpers.c     | 139 ++-
 drivers/platform/x86/lenovo/wmi-helpers.h     |  23 +
 drivers/platform/x86/lenovo/wmi-other.c       | 850 +++++++++++++++---
 drivers/platform/x86/lenovo/wmi-other.h       |  16 -
 11 files changed, 1041 insertions(+), 197 deletions(-)
 delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h

-- 
2.53.0

