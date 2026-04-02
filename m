Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412913328FA
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100269; cv=none; b=mXZRSuHdDohmLyRT0Os41oWVBcvQ7GMj+r40SH3U//66BAq8YkUs7uTVOvwCBdzAHNTRyNtViP3PYZzasDFb2a4gmZVJVBCFzlvOOreLIrGc3E7R9AUYTZYxMBbNOKL4FDujz50wjvnJB9krwp901QMGWbOAX9PGzHWmgGwZZtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100269; c=relaxed/simple;
	bh=jUBx9WFH4l/1KsFlcIOApjFOkW7qDFsMYBbk/P8Ss0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y0dvBa5LJknULxi/md0aly2DebqrdG801LQYRlPfYFzisMrm3Rm68Opfo703fvr97SuLCDZpG7bqHS4E452xTMFF86ZRr8mnVzV24y/l1Ny8YutIx5ZCp7/in0KPmlB3XDi1aor7NpfEU/OuscvCJl9mo4IqkT6nkyP+4r5OZRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlCQpofN; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlCQpofN"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c7e5f38b37so675347eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100267; x=1775705067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xtAOSGFFTi/RXzeRnn9TydvvZ+hDH7aqaUUU7ONJ7eg=;
        b=LlCQpofNulIQewBiDhs3+OYgetk07N9Py0D3ejUZleZooGNK5jSvuo0hgeMACg36bn
         ugyRYYw02/P0KEFdghhcH9B2BmnM4Xzo/5nhvKrZz415Z3y7ziA9nmC7vwDehyokidLX
         3WUoo/okMRu6Bw0FYy3hDiINAtPhn2sB++Qvf3lDlRMY5UN8votcDT+M+SC30TaSPJim
         IbLoDCWTLlxOvuVNXaWbE0LFznZ6l7OxuSrCVP0DNEkZ9ODUfuUmZZQhp7UEwHFKJ/Ov
         hplwyfnUMeY6eXZKJJlyTmvlC6mol2H01P/TZ1gy9hu4he2Y3wggqjKTfgxHNBwBbu8Y
         yaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100267; x=1775705067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtAOSGFFTi/RXzeRnn9TydvvZ+hDH7aqaUUU7ONJ7eg=;
        b=c6XJxMOcehnDwu6DPpyBr9K91CvN/bTgnD2ceQKQ9wNkW8Ybwxbq4xrqR7v34HbPjL
         ohgygzKcWqpeVdUhZYx+Wzq4vPrtkGk4CIkzj/bdFaUiPhdYKsDCgWMh4FwQocpdQ+av
         hjDTGXB/Dq9cn26NtOB3hR6Fa/YVB+/GYaWbbfPLPOkDd4/1zQ+fmrPVVWvoVDx4mg6V
         pImwdgMEf3KD5EmbYxv3ECRJGEEX3NsmkoNIsa/kRAa0cHSd2akBwsK8Q/nea5mbY6ZM
         OVegSFCZ4o6jMKMnowHsyQb/fFf8Fjj4BqBawmfSSGiAtDiZ7xuzeri6UkJXsoYHEboN
         AMag==
X-Forwarded-Encrypted: i=1; AJvYcCVtWvKAI81J9UdNeGsWmNlvI0VHmNiagynduMe3+++6YjW7khJ7QL0x9wuU8hxn5OwK/aUiA0OXwkPwuxfFYpHQiBnZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyT5dLWCi55S4YL/69ZKqiJxzHM75qPRt8nJ0ahzezmGiNANQ+/
	FrfvcVhX58fYH0v6oRmqvHWY+7QM142gRPR4kkpyA9Oi3Fgvt1KNnKjj
X-Gm-Gg: ATEYQzw4/1Quq0lZg4vAgtaRoIvClscryLcKD1cNdCYy+Id8Qy7hcXvUMiyXNaHfanj
	4TKx9L3UcEgsRw/69EZQS+UaHBwilY/oxDrUon9QlK5BZMUGP4wmXS6HdMwHwSONTGRuqZfcRF8
	nq0gruxvTylL4vTLQG7EKZhEkmuE4ydjY/rKbe/r/g47C8qUATDMuxsCry4V1mVZhybB7fyPghf
	hiEY6K6Mp1oQYmPcwzHRW/LxRYUgr1OO714TYazqqbIWBnSJSUJMXgI78mLVE8r5DH1XnuncdOo
	TAfaSdo7YTDqhhpUkBfE2M183QtnzHb3FHPK6rvjh8ZLRQfveqWwS1ELFAVTC+inS590Cpxb/wK
	GcIU78N5+x16ZRgsmdTVomqvA3Pj8Gyj+c2DiLxW19AC5KoJ1ZMUrV2V5JJtkBsOBRg6VvXJDBA
	FLDvi93xwcOVgq10HVGbBEQ0+nYVj2ex7WqobFMhDVEFA0ynItaZjQcX9ktCzZWxi/8A3xi1lhf
	DPz
X-Received: by 2002:a05:7300:4309:b0:2c5:d833:a4fe with SMTP id 5a478bee46e88-2c931164080mr2835205eec.10.1775100267220;
        Wed, 01 Apr 2026 20:24:27 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:26 -0700 (PDT)
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
Subject: [PATCH v7 00/16] platform-x86: lenovo-wmi: Add fixes and enhancement
Date: Thu,  2 Apr 2026 03:24:08 +0000
Message-ID: <20260402032424.678528-1-derekjohn.clark@gmail.com>
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
v7:
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
 drivers/platform/x86/lenovo/wmi-other.c       | 746 ++++++++++++++----
 drivers/platform/x86/lenovo/wmi-other.h       |  16 -
 11 files changed, 935 insertions(+), 198 deletions(-)
 delete mode 100644 drivers/platform/x86/lenovo/wmi-gamezone.h
 delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h

-- 
2.53.0

