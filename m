Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBA2175A85
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 03:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285037; cv=none; b=Pfu8u9ZKGpnu3Pkf0ClZiRYf4O9oByHvX/Es5YqzhzS1a/LFXnzpYWDXBs/iqvVY0L9cHijz0M3XwFfA/FyvxjBM2bds+syUGQg4UnEBYXWzMTpHekrkeeM4XkuweehUVPrQ1TAOsiCpbGm0lCzUnxRXbmjgkkBfzcr/D+SpZ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285037; c=relaxed/simple;
	bh=I49KIs639gqGRHuHNOi5ZXwBTSTG/d4xi9BptLedaFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HkNM7qukNGwC71H/OLg2bbylqYiJ1jrzSoI3OiU3zL8n6MVuGLLScRXlc/Ht8PW+sX3LNIWHWp5pXs6Q8k6H5P+VnhKaEsmLPnzy2w91d5nYX10J4uAKl8nGW/e+IatEluK3BnLzB9FgUBbpM4owrDTr2RLJyccEUcoc69f9Pjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIHGV++U; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIHGV++U"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2be9c886a0fso59123eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 20:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773285035; x=1773889835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9m6zzzD1mVPwTCXkwlIHIMLXIxx6ddp/xGH09GQ/Vfw=;
        b=VIHGV++UlLfpApmZ+j2KTaL/A3rYVnwghjZlP8vj+zymi37P4jbHhIPK1G/GGePXid
         4UbmeXWx2/sI/sfKRka3A/Ct3Wo/7sXURhOPNBqrFPX3XuPPu7j136eyzmePbWF0T+j0
         o8PE1pjmKiGd1QcpvIjGwo816m03YOu3E/hV8wt3i4fcAEnVJyKbFWOTVvVhG0nF+b+k
         xkHSnbbPGu6s0ILAc86YPuwWkwAHArZsKyQp80CjupwimOWGxc+FEziJvO2Wm3aNzV7R
         W7X76W325YD1NVc1krysZSprFPLL40uuSH4mPrqUvTA/cafPS7drW8U6CjDuIz1tLFAB
         o8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773285035; x=1773889835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9m6zzzD1mVPwTCXkwlIHIMLXIxx6ddp/xGH09GQ/Vfw=;
        b=HnhxI3weSfeJhazLiX0yWdtvmoTfp1YcQt9tCRE+HujOKGu+DpGws3B0zTyzbYDRna
         B0rsMO4trCvPm+e/lEdZ72VZXT/nyakP8kN/9WRpxiDTRLPOkS59+3r112hEnLCqXCe1
         +JJwf6eNSUFvscn7TMR5no4igCXNKcw48OhA+lqrQem27X2nkr987b+XZsqgFIMQZJs2
         tKoCCOTm60QktfIykEName5UGUWUgqb8LU5REcdiBqaNT6OaGhUA4PjPZn5ePx50fex9
         EwOfUSLWSWvWLJ+Euw5y58c+O+IZK3KyAgE+3rHIu6PGHarf0855pY75Cb5gMS6UzJKE
         +gzg==
X-Forwarded-Encrypted: i=1; AJvYcCUvhKxOodbND++H/N4ndcBGJW2KQ3HEtQWUPmflUA66bJLu/L5YvD8vyeFbLgrQ4LhnZ9QtDS1/OeBg/iNWtJAJck2Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwPNwGpzd4BnmC/rzWkJeXnVeK1oSiE1EWtZh962zXyoZuf5TWb
	c8eWvYF5v5V7wcG7BwsIDF75kF9be/9l+FPDyufv1piCHpZUkvh70Z4L
X-Gm-Gg: ATEYQzxl/3zNibt95paERz1+zSJCmKl7j126dlajh7Nle/vq+JsNB2gc83Fo1CvkbQm
	K8wFjPPBDLm+c9qLLXEC2sbffl7JnTVE8bBpRJQ5ITngLYXo5iYYzQgF0Fy4Yh4n+Z1BNy0Tbrb
	6MmEnLaPWobEpLNhWtWGScBOMCjmfGi7njL1loQNWpQWyD1B2U8u1A4j3gjjHTyIhGD+b7JCbWt
	dJmjr0tQkS9TUQGRg+P6BZqHz1JrPE5REv0JxgfE8NNdP8TNIJrbbVxuRRd4pFKZ5AXZjYySCb7
	26N4nlgoK6F2n3jPCV2VflCsfdNtEmng/mBPaRy7BsmITw81jsxHZbBXvzG9kk3jteFoo3CBqU+
	22rdRSCPAF+yS3OdFZ58QmslZ7O+I4C98PrM6OC32tngjRmZnDvneiDMCINudyv+ibOj4kLAAj7
	5xCa67M0tIcRczcOEh2RmzCMgZgmXZ8rOVuPl9IRj8XBy60mF3iD0xZ8J07aG1MdDFFqTU6CKPb
	2TI
X-Received: by 2002:a05:7300:a59a:b0:2b7:24fc:f638 with SMTP id 5a478bee46e88-2be8a0f188fmr2790928eec.0.1773285035217;
        Wed, 11 Mar 2026 20:10:35 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa97dcfsm4802495eec.33.2026.03.11.20.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:10:34 -0700 (PDT)
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
Subject: [PATCH v4 0/8] platform-x86: lenovo-wmi: Add fixes and enhancement
Date: Thu, 12 Mar 2026 03:10:24 +0000
Message-ID: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
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

Patch 3 adds a function to make assigning attribute ID's for capdata
cleaner and easier.

Patch 4 addresses bugs where devices that don't support exposed
attributes would still create the attribute, and also attempts to
identify the correct capdata and set/get methods as some legacy
interfaces don't use the custom mode in the method or capdata ID.

Patch 5 adds the remaining CPU attributes that weren't previously
exposed.

Patch 6 adds GPU attributes.

Patch 7 renames a name constant in preparation for patch 6.

Patch 8 adds battery charge-type limiting when supported only by WMI, or
when a module parameter to skip this check is set. The MODULE_PARM_DESC
macro creates one check and two warnings in checkpatch. I reviewed other
examples from the kernel and I am following the same convention, so I
left it as is.

Due to the large number of changes since v3 I decided to not carry over
any new Reviewed-by tags.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v4:
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
Derek J. Clark (8):
  platform-x86: lenovo-wmi-other: Move LWMI_FAN_DIV
  platform-x86: lenovo-wmi-other: Fix tunable_attr_01 struct members
  platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
  platform/x86: lenovo-wmi-other: Limit adding attributes to supported
    devices
  platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
  platform/x86: lenovo-wmi-other: Add GPU tunable attributes
  platform-x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
  platform/x86: lenovo-wmi-other: Add WMI battery charge limiting

 .../wmi/devices/lenovo-wmi-other.rst          |  19 +
 drivers/platform/x86/lenovo/wmi-capdata.h     |   7 +-
 drivers/platform/x86/lenovo/wmi-gamezone.h    |   1 +
 drivers/platform/x86/lenovo/wmi-other.c       | 586 ++++++++++++++++--
 4 files changed, 571 insertions(+), 42 deletions(-)

-- 
2.53.0

