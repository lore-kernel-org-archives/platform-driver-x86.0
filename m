Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E2F3C13FF
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 22:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390237; cv=none; b=H6i+1CZmN1xCk+ss06G2B9sy7KLGET/QUZHvp5e+4nT3enJlxZu8UKUarGIG/jrHg2TMTbIEsfyEEcZxAS5AXZUqQgG6B9Yssd7cAIHhtD/cyXRXoU3pSknakH60rSJxqBqVrndaEC7e62ZhtnZYvUfE5tD00IOC7YdYXbxqxdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390237; c=relaxed/simple;
	bh=QMY6gHucV9xQ1Dn4DHBczb5SeL5R9FLSv8kzGBDGfKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tb3nOwGQnZmSVSit4Eb/wOZ3pBWO7hZUm5s2ytIUcmbjwLY3zPN8vd8TfJwhSe39y2FLw4wFUDIWFjwLxOif/xeW/x8TmcquvQYj3Cq0g834fyRNYRVG0IzZkUExu2+57Iq7AUVhMlMhiN/HSeveQOXhhIAnWZIY6V0XJFsDS3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzS6w4V9; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzS6w4V9"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c1092cc08cso1831930eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 15:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774390236; x=1774995036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lefx+UjiL7omcZxAkUVAQ4xP9a5W45EMqBI8YR1p4xk=;
        b=UzS6w4V9qx1gTE+JieEC5/AN0+6aOWBOjFbXBmrBp53yICpevKphT3uN2GEYd4AN7a
         ouCUyAW3KmBEyS4bknJ68GKnPT+m23Jl6f5L4CgKdrpmY7vlO/c/5DgO6/QC2+lvrfUx
         3XKq27hrgxlWEF0XkdCtlW2RdRsoHt9F8nyz8nBOclJ5TpS8Cm7WL8EGJs9pgoVVuKBt
         k4ioARM1MAMk6ln0DralCAkyK9tR5Ci0MpPrWZ3t82UkvET6VbDhRyt1X2XBpJnOMDx3
         kVAfYi8l95I3NDd3NWdPlWyipQ3TPM3wQDLMN+Pwg9Wk0R1/7LID1xpNRzC7kvGS0mHR
         L+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390236; x=1774995036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lefx+UjiL7omcZxAkUVAQ4xP9a5W45EMqBI8YR1p4xk=;
        b=SybO2pJu2DcZ6VEkS8bF8uSryDbN2s2xlPW8BDWl7AVpZDWq/tHyCw4VHOkbdyPEYC
         dLKg/H+t4iAsj+QxDu/QmruyRmiFmGyncoDvtuL+enLHc+6y8eo6xjOjJ4qL+Nj9eHpO
         FSCNZPrqHcRggZX++Kmg6CslZKVdIYSCqIvMCFwra9KopO6hT1OGl6wBbGxKyX/RRYzC
         E3ZkQv7yvG3dZQ0i8cN42JMEdv4vcr2EYqv8xoIOJF168HyGgYHSudvExFw19yUiOqyD
         e6lrSy+Xg//lj0S7gPBBXbIPT418gcYpamhkg1p7KB58+mGzr2k2cz5c+2NCVwpXpDJM
         DJHw==
X-Forwarded-Encrypted: i=1; AJvYcCVa/xWHbVJAbKWhWn89rfAFa53vQ3IgJxkZPx06q7vPxe1Pa3zvL+yG/9mSeMcPayyi6RGHv/FY8HKPKzOzbi1a95T0@vger.kernel.org
X-Gm-Message-State: AOJu0YzwmWJ2chHcTMdduruO/kbXFTJ+9O7vCZAVhZQVemDugqKJ/Lxx
	wvm+j8ev1RW+yN8swBc+6oKmMAqRrzmwgqV+rM51tS1K0uDrz0TXzI0g
X-Gm-Gg: ATEYQzz+DSuFjbZicACL9Gl0I4m/i4uZbtIp4aEsCteT7jdHy1UTQuIftUEeM4woa4x
	wmFdV47Kbc6Ucdsmq011rjwcJrUTqaLxE3E2hxMesHLupfCwqdS6PKPWOF3fISJVZojnMi0sS90
	/WQGj8UhdhTgg1yxj192N438xLXIoEYEoMJbZwrJTHp5lrdsH/sTluEgeQ10fR6QlUEQYDvtJuA
	tHURHzDXV+W8Kf4xsddlFTb5bKhefwzX5JgBLCFbSc76mNYzVsfhALsiNy3tkdju9+XxQGDi9fj
	i9qJTrMqLBnNZ7NVR1tU44mtOC4SxER54ahttfACuv3LSfsJBCqCSKXeHhGfqRyVpc5Z/RrigZm
	L3SA5JQdceONJ7k/J6Cr335dH7Uwr19+wOYpFJigy/9qabNuGLelLVStx2waQcHiyBWbQrg7ZR/
	rZsuM75Z7i0oySKATJislaefg57jUcf+HFRsZ9NEVjcq9M+OUYxQVCeXHnoGs1v+nDoOkyv1TeF
	2vWzlHMPvM8ET4=
X-Received: by 2002:a05:7301:1e91:b0:2ae:55ac:3ff6 with SMTP id 5a478bee46e88-2c15d31d8d2mr498868eec.1.1774390235468;
        Tue, 24 Mar 2026 15:10:35 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm16282832eec.6.2026.03.24.15.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:10:34 -0700 (PDT)
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
Subject: [PATCH v5 0/8] platform-x86: lenovo-wmi: Add fixes and enhancement
Date: Tue, 24 Mar 2026 22:10:24 +0000
Message-ID: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
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

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v5:
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
 drivers/platform/x86/lenovo/Kconfig           |   1 +
 drivers/platform/x86/lenovo/wmi-capdata.c     |  25 +-
 drivers/platform/x86/lenovo/wmi-capdata.h     |  10 +-
 drivers/platform/x86/lenovo/wmi-gamezone.h    |   1 +
 drivers/platform/x86/lenovo/wmi-other.c       | 586 ++++++++++++++++--
 6 files changed, 596 insertions(+), 46 deletions(-)

-- 
2.53.0

