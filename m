Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE0AB67A
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 04:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907530; cv=none; b=UBatYx8v1uxWPEXO1FeY4yxYz3BE+5husfQShw3+AvmHJSIL+Fxcz+tME8mdWBcTazYEgIhF2yQJkSyDf4ImWBE9gifBD/RgP0/Mj46QL9HZ21RoD0inAtgqdB4v5L1cLKe3yE/lLkfFtqdXGQ6ay9EcpkBprq/Rede9ew3sbMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907530; c=relaxed/simple;
	bh=pzGDAPbkZDJv1rp0Tbv0QQWjzaIKnf+WLO0uDPkRTVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LEnB2Q9inXFw10w0GJO4CxHfXfv91Z+1z/pJ7OQGpZSWU8fRuB75TqgOf0gP9P0TP4Yd88chn1CnCrdK8RNhfjd4V2oOKSzCdonOeFJKLb0xwKx+FoZgNlNCZIhGRasp7nzI47d0bsVVGtq8iHbuc49p24byfYnsZDd9qC+KLyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA/vb2Eu; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA/vb2Eu"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-126ea4e9694so51511c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 20:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907527; x=1772512327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=96FEkbxKyA0xiM5RUxBniGIhI9mGW5et9LNYlToTuvI=;
        b=UA/vb2EuYv41+hW9AHL7Wl/M0lQiuLMmffnIsCeYyybJurtfhNry8tGxIbEDYSOrOL
         ef4daQ6vC/UtbEbo01I4tQuKFYwuZOOMCksdfqPxkx5nXv2NZfIFE9gNTSlLmiOsUrTz
         K6AiSmnRXphhrY/rRA2/CrmJpCfY700aEVZzwYMzvOiWb7d5TxI2AldclpUo+2cWyKt8
         AbA+7D/ouYE40UCP8YS31YWrP9MtgjLlW2AD7w3V2a/PHY7tFsRuS3f+SVFDD9AH9Fu9
         lXVUvs1UJ6eZL7DSo623eGc24FVo7iHJ/99x9GKF9anlHzhequEbzUhbv8wlgmq7cQ6b
         oMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907527; x=1772512327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96FEkbxKyA0xiM5RUxBniGIhI9mGW5et9LNYlToTuvI=;
        b=StWUGMBfKFosS+ppw07kZqaMRH+6/zpbJfanSL+yJ1hatbwPrgkNr325fx7OKs+7rV
         6rnhTSHTg0vaUmLxy1Hs68Hg3jia9n9E+ILIysOKqOUf7CD0iePipDSdCj2AtxzWwkFp
         HBNgX41JNuhI/ORU+95cxJaDIWfay6GxyOi4HDLrVCfaCSM9RwKobt0vP++LeUGBX/s9
         H1GowdEn3RfFyGmUWsw4cPq9zEy5+/VvKhW9nrfXxkDLdAQ9T9HuPc6cIUFtNUzBDMV1
         l5EzG3faPM8gl+ErXQ7Z3JECbwWZtOSBXC/bH1aZbuLnsFShGZJKPFO0N6S+UtHZMDhW
         E5Og==
X-Forwarded-Encrypted: i=1; AJvYcCUg8eQ2gk91oJN4nLUURYC1+zXSUMUA+wx/H7ynW2o+IHcX3Wl4DYjhKwvA1lL3ULgbuGDuZGJrtC6gbV5+G1ogfa4m@vger.kernel.org
X-Gm-Message-State: AOJu0YySbA5rJB+DYClpkyvI8lm/gInlz5pRYWiAa7rIln0dyR63ChQs
	okHyE0ZtEsuKx4cxOIU7GpdKWgP4/0F4EdyaSl1dbZVw5N8ZWzKvMUzc
X-Gm-Gg: AZuq6aIAg6Q+Uul6DIy9uqoWw5BeGFERB8Zc0dFgySuVgknJnTov6jfqljVKgkspGIW
	P0uxbnJjjwnLIyr67B9XtGTyIVq150TfARxSvH5ubP1S2JX/5sX8rYvXoTo/xEz7c8SRDBAXojX
	MEqPGlSAWDGvaSi+eBHJiB+t+pQdvk3AvxJnZKLvL1JzvOnB3hyrIJWRywLaIcaMl5KLlLJbO5D
	qU31jSdDKb42+dMXt7UCenQwjSqufbKF2339rZ1S2HLKGHAlhooyQG2CY+K+cOTpx0XYjyh7HFf
	oI77TF2mZE4KWcgUARHlOBuLdNw2tBsoU/SDe0zEnzMWYDA3jPz92KCgsQmLpae8fOUpHCnPOmm
	69mEloUZpWp6AvhHKYxaoqAXjb7pBgQFefLBIXGGfmmflNbAC4L8MuN5BJZqu+uCsnaab5YlTwb
	GP4cny9dARFg9C+34BDWlK9TyBlNNSKawA5hw2azHhLU1zrwdOtb71awTnJfmWRsL/CoBOXqJv0
	YA=
X-Received: by 2002:a05:7022:403:b0:119:e56b:9590 with SMTP id a92af1059eb24-1276ad11b1bmr5122346c88.21.1771907527256;
        Mon, 23 Feb 2026 20:32:07 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7b4c7sm9607887c88.9.2026.02.23.20.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:32:07 -0800 (PST)
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
Subject: [PATCH v3 0/6] platform-x86: lenovo-wmi: Add fixes and enhancement
Date: Tue, 24 Feb 2026 04:31:54 +0000
Message-ID: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds many much needed features and fixes to the lenovo-wmi
drivers.

Patch 1 adds a macro to make assigning attribute ID's for capdata
cleaner and easier.
Patch 2 addresses bugs where devices that don't support exposed
attributes would still create the attribute, and also attempts to
identify the correct capdata and set/get methods as some legacy
interfaces don't use the custom mode in the method or capdata ID.
Patch 3 adds the remaining CPU attributes that weren't previously
exposed.
Patch 4 adds the GPU attributes that weren't previously exposed.
Patch 5 consolidates name constants in preparation for patch 6.
Patch 6 adds battery charge-type limiting when supported only by WMI.

After applying Rong's series from
https://lore.kernel.org/platform-driver-x86/20260210191938.137234-1-i@rong.moe/
I found that there weren't any conflicts, so rather than combine
the series we can just review each separately.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v3:
  - Re-add HWMON name const and jsut rename LWMI_OM_FW_ATTR_BASE_PATH
  - Fix linker warnings by moving acpi/battery include to the end of the
    list.
  - Remove CPU/GPU OC features. These attributes are BOOL type and will
    need a new constructor that I'll add later.
v2:
  - Fix gpu_mode misisng from attributes list.
  - Fix prototypes for power suppy patch.
  - Reorganize CPU and GPU attributes alphabetically.
  - Break out the patch consolidating the driver name cost.
  - Move some of the refactoring of attribute_id back to into patch 1
    where it belongs.
  - Fix some additional typos in function prototypes.
v1: https://lore.kernel.org/platform-driver-x86/20260213081243.794288-1-derekjohn.clark@gmail.com/

Derek J. Clark (6):
  platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID Macro
  platform/x86: lenovo-wmi-other: Limit adding attributes to supported
    devices
  platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
  platform/x86: lenovo-wmi-other: Add GPU tunable attributes
  platform-x86: lenovo-wmi-other: Rename LWMI_OM_FW_ATTR_BASE_PATH
  platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.

 .../wmi/devices/lenovo-wmi-other.rst          |  21 +
 drivers/platform/x86/lenovo/wmi-capdata.h     |  13 +-
 drivers/platform/x86/lenovo/wmi-gamezone.h    |   1 +
 drivers/platform/x86/lenovo/wmi-other.c       | 605 ++++++++++++++++--
 4 files changed, 593 insertions(+), 47 deletions(-)

-- 
2.52.0

