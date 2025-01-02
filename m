Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14EEC0;
	Thu,  2 Jan 2025 00:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735778948; cv=none; b=aIt/oTLhRUtEuj56vqi16jnqI7WlkGr5goa/kyYQuoG2W0sJVE1VqFFpz591UPaTDLHusOSfaYD654i79QEtM3oHmwlpRSPGv2vOM0cbfc7rT4sDBUZnD87ie8/pvvRq2ur8F5GLcw2Svm0Gl+TpQPiLlEirk7Tmsfkv0ET7cXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735778948; c=relaxed/simple;
	bh=Fm8umMG1j2xGrV+1jdi95x1bQHup8Am9TCudsCMhPmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ui53Es9zd1lQqVqgk+8xguudBnnWTEBN38B1Xj8Dr99mcV5AIRFLwdGVW33ZC/hLGaCRM5f1oJmQyhHGhu28h29njQbC6leuSVOZAVFHD9CoBV+EZtZ0xF+4F96K7rMkf/l7cwI2Amu5jZ1vkSjbhNITLCdqxD958h2fbJZpwiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wnkg7rB4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wnkg7rB4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2162c0f6a39so155296845ad.0;
        Wed, 01 Jan 2025 16:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735778946; x=1736383746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9SaF2LkjqbaLIv6FhYd2/XFxjdaP39aNDBiwfIJ0Q8=;
        b=Wnkg7rB4MVaCKWq445qbByJ82tLPpYtSnt02ahFEpTkN7k1E307zlK5ke8tAc4WXpH
         EXkjDB1/gczgatCBzFORdQO7+2uY8iDV6KDAi46+nLJh6h36q4SAUFkMXBB2fLuzelkm
         H4K5F3vUsCUlSKUNyg2zfyk3MkHomCk+4YGo/G7rWV98b5wYkTJJLHeXsZtZrDp/KEHv
         EGlhwBVguJiZVDY2VOyWz+7E4YpaitlTG3HtsPENEousQUC2ZhrHdk/zcJWQy0FzaGTV
         hrrZI8h9IBaiOhpbSO/MYUDseihg6CFNxokJn0FtUHFS9ytZ6KHfwpTGQgV56vxftYPI
         7x/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735778946; x=1736383746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9SaF2LkjqbaLIv6FhYd2/XFxjdaP39aNDBiwfIJ0Q8=;
        b=DcmnLT+tqCDtj2ZENmrJpDlOzxSaP0K7VCU9/wbvDmMczyUawcCq4WPz/u0C4mytRG
         ZxGHjBu7kK1zOEJmcEt29eEs2pb+9zgMsce5ILDYkcNuDs21d90kFNU20NxJHKgpCZyA
         y7xG9aM6FNnAPwO7cnbZX/EfGfNz7A6bDOcJiQctUa7sZlFMBt3ZJWX3xQY3mU+UwUOm
         LwVd5Qoabo6yQflqE7IZ/IuyQkyZiRBsxwmiwZ/pPJlKrNLuLvIeZXmvtLf6Mdo1bL3N
         SO2nhmfUWci7xG7ziFwBWPg5kSpOq3s8OpI4F6u5Efke22Ggl6QCM1peTDloWJedNEmv
         +tzA==
X-Forwarded-Encrypted: i=1; AJvYcCWEvFL3SsO5EQV4tKvu4VBaayYgTMCxYfjHLc9/mwlpKGYSw7ktCmC+93RBWuMLK9qIh1+89JO/dpQ=@vger.kernel.org, AJvYcCX4qJ3kG6Vxem+O8BMScnHq9dEYIz7EmNcR5BHKHwUqWx8iqS+Dbq/kNKf6QHA49ETy4YQoSvZF34Br4xN0@vger.kernel.org, AJvYcCXTz3JI0o73tyoGBdWYl4yXaBP4dfc2xx6Az2U4VGJ5XectNAwnuDVSeyKXn+cvJ52DSkk0TDexo1QxmtkM0/Eq2XlcgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0jb/ZjFSrI9zYKJgSgmydExrjlOTAupZoF67ZjdlgfPj8ZpX
	F1y7Uyn6ovDt9wuuXo4M7BmU/FsRo5KOj+hbyrlJpEe24FrEt5VC
X-Gm-Gg: ASbGncvrfkMOZuqrsIjOaGJ4b2uOXErim3Zf7tuQ8Oke9w22tDZosZBGKPRUdw2qNDw
	AaxtYZTsDm3Kw/UtAcOiOJgKtn3kJNdYAZKX9nMUy/uHG6BHOXgyGN4kNi7Mfyyx4XPuZ1i37Mc
	mmNbMh7ojCLVbjn0jVX0VFM0H4frtBOb4qYzrKIJWmZNpJMv55lDvJ/UjnDpz/8Mc6lN2OLYxEC
	Vw9o5mVE7w4JFEPLa0BK5mE6YXCmVZfaS9SxLPHgYjBXY7OpKwu7tsGxEtA26aJgUolvvz8ynDR
	SLSEoGLsUKHhbYcY+28FQeQgltpbFBDLNb6hTQC+CQoCkwUgL8hOrS4=
X-Google-Smtp-Source: AGHT+IGK7a5ZGvU13YLSZ+73XHxv0quTwggdFT/Y5fNNqQCIY9l7UbqVUcqb/gHT7b+pOWVKQ1Tjyg==
X-Received: by 2002:a05:6a21:3989:b0:1d9:a94:feec with SMTP id adf61e73a8af0-1e5e1e0460bmr74569802637.2.1735778946447;
        Wed, 01 Jan 2025 16:49:06 -0800 (PST)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8351fasm23793594b3a.62.2025.01.01.16.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 16:49:05 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] platform/x86: Add lenovo-wmi drivers Documentation
Date: Wed,  1 Jan 2025 16:47:19 -0800
Message-ID: <20250102004854.14874-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250102004854.14874-1-derekjohn.clark@gmail.com>
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds documentation for all lenovo-wmi* drivers.

v2:
- Update description of Custom Profile to include the need to manually
  set it.
- Remove all references to Legion hardware.
- Add section for lemovo-wmi-camera.c driver as it follows the same
  naming convention.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi.rst | 104 +++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi.rst

diff --git a/Documentation/wmi/devices/lenovo-wmi.rst b/Documentation/wmi/devices/lenovo-wmi.rst
new file mode 100644
index 000000000000..62c2ec9505bd
--- /dev/null
+++ b/Documentation/wmi/devices/lenovo-wmi.rst
@@ -0,0 +1,104 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+======================================================
+Lenovo WMI Interface Drivers (lenovo-wmi)
+======================================================
+
+Introduction
+============
+Lenovo WMI interfaces are broken up into multiple GUIDs, some of which
+require cross-references between GUIDs for some functionality. The "Custom
+Mode" interface is a legacy interface for managing and displaying CPU & GPU
+power and hwmon settings and readings. The "Other Method" interface is a
+modern interface that replaces most "Custom Mode" interface methods. The
+"GameZone" interface adds advanced features such as fan profiles and
+overclocking. The "Lighting" interface adds control of various status
+lights related to different hardware components.
+
+Each interface has a different data structure associated with it that
+provides detailed information about each attribute provided by the
+interface. These data structs are retrieved from additional WMI device
+data block GUIDs:
+ - "Custom Mode" uses LENOVO_FAN_TABLE_DATA, LENOVO_FAN_TEST_DATA,
+   LENOVO_CPU_OVERCLOCKING_DATA, LENOVO_DISCRETE_DATA, and
+   LENOVO_GPU_OVERCLOCKING_DATA depending on the feature.
+ - "Other Method" uses LENOVO_CAPABILITY_DATA_00,
+   LENOVO_CAPABILITY_DATA_01, and LENOVO_CAPABILITY_DATA_02 depending on
+   the feature.
+ - "GameZone" uses LENOVO_GAMEZONE_CPU_OC_DATA and
+   LENOVO_GAMEZONE_GPU_OC_DATA depending on the feature.
+ - The "Lighting" interface uses LENOVO_LIGHTING_DATA.
+
+.. note::
+   Currently only the "GameZone", "Other Method", and
+   LENOVO_CAPABILITY_DATA_01 interfaces are implemented by these drivers.
+
+GameZone
+--------
+WMI GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
+
+The GameZone WMI interface provides platform-profile and fan curve settings
+for devices that fall under the "Gaming Series" of Lenovo devices.
+
+The following platform profiles are supported:
+ - quiet
+ - balanced
+ - performance
+ - custom
+
+Custom Profile
+~~~~~~~~~~~~~~
+The custom profile represents a hardware mode on Lenovo devices that enables
+user modifications to Package Power Tracking (PPT) settings. When an
+attribute exposed by the "Other Method" WMI interface is to be modified,
+the GameZone driver must first be switched to the "custom" profile manually
+or the setting will have no effect. If another profile is set from the list
+of supported profiles, the BIOS will override any user PPT settings when
+switching to that profile.
+
+
+Other Method
+----------
+WMI GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
+
+The Other Method WMI interface uses the fw_attributes class to expose
+various WMI attributes provided by the interface in the sysfs. This enables
+CPU and GPU power limit tuning as well as various other attributes for
+devices that fall under the "Gaming Series" of Lenovo devices. Each
+attribute exposed by the Other Method interface has corresponding
+capability data blocks which allow the driver to probe details about the
+attribute. Each attibute has multiple pages, one for each of the platform
+profiles managed by the "GameZone" interface. For all properties only the
+"Custom" profile values are reported by this driver to ensure any userspace
+applications reading them have accurate tunable value ranges. Attributes
+are exposed in sysfs under the following path:
+/sys/class/firmware-attributes/lenovo-wmi-other/attributes
+
+LENOVO_CAPABILITY_DATA_01
+~~~~~~~~~~~~~~~~~~~~~~~~~
+WMI GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
+
+The LENOVO_CAPABILITY_DATA_01 interface provides information on various
+power limits of integrated CPU and GPU components.
+
+The following attributes are supported:
+ - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
+ - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
+ - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
+
+Each attribute has the following properties:
+ - current_value
+ - default_value
+ - display_name
+ - max_value
+ - min_value
+ - scalar_increment
+ - type
+
+
+ Camera
+ ______
+ WMI GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
+
+ The Camera driver provides WMI event notifications for camera button
+ toggling.
+
-- 
2.47.0

