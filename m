Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E4633556A
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 15:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256578; cv=none; b=Hnh3rGnZamBUxWq0B475FtIJ2a7NV0aOOjplmqcROJL3P1+Tgaa6iG+ViWsI8YgBt494QqDzzYHT/sY9iwQWUN6+mh2J1Jv3obWqI/O3Y4V6vKivT0BsqS7xOLR36H94AG1cWMV8YPYb/twUFLK1lgpU3uGGE/ggUEwQOXnPtDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256578; c=relaxed/simple;
	bh=bINqTcYBnpMiA8eKDMIKE2dhokiXwzdMKmoocGJBxvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2SyKCpY91Q1RQ7s69KoyKFpZ0QjJGb9KO+8e3fXfoPTF7aF9laNPawMKlVIsfFFNLdEodsChydCEmXHYX7RzUd0/L8eXPXj2Rke2qijuL2vlS/Oeg/lSqkAkjpqcm1yfXpRvRLVR5BhHv5FPc7T4n9Wx7yF1vpyXCDKaK+iRU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRaokIn7; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRaokIn7"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-11b6bc976d6so2442751c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Nov 2025 07:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764256574; x=1764861374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETZ2FAyy2v+yzymxyjsZFHVgNltj1Cngjn3GryQ+ajM=;
        b=NRaokIn7ngDIF/Wq3uU5gX7ZGkhdP4fKPoY5KUPMrGq2ekYvdAipM4EkKy2GGJXoOc
         ENH0l4UIxN+JW2h9EKY2KA97FbaTslYFtyxT54c0oRua8lTNbkhfyap0IFMwGchgQq5Q
         7nniLWnbSUGvpWIPs12LGsxPjcbFn2XhR2/KSmBjBHDlZi34SDGdENunj+7oGUtvngi6
         aLsIm6/yQ2MxM9hF1TgQMYw6Ye/lrwRvMnN0m51nhJsO0Lodr9BY5mzyAyhfxoGIShqn
         f6pDQdBZzkU19Pd95cODQL/9COtoLbyOzqayujt3qfo/otTij1lJVwm0zxhsyXVYwSn2
         QLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764256574; x=1764861374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ETZ2FAyy2v+yzymxyjsZFHVgNltj1Cngjn3GryQ+ajM=;
        b=VXAFw2vi3F/1osf1+ZNW9ym9rnuJHNmvigUFycPnlUj2jC2cR/xNpPtg7t/erXyY9l
         2vXh3py6zUhFPX8qqYQD7ST4oSyikmo9n3iJtLkodDyhafp3F+AUKPa+8vbS0m+Lu6sr
         Psxf/nBMx7S+SBwebp9l0JQolBwJSuykHSPd7nfA9itcn0iFXGn/SWPxLXfgaRVXYvSp
         OtZW5sr9t1s/pzheAVMG29o1ha13kzH8KKc0Xstl4sjRDNka20iGrpiIlO2mdZQVrOUa
         DBuhzU+8bVgAlyHdM/2SDb2HKgb41yt792EX2YZPHYrKX6RPvr9eTZ9St0c+08mbM994
         0dpw==
X-Forwarded-Encrypted: i=1; AJvYcCXHYsJ5XNU6l0Q4hto5+mAcs2AloyR3XjSiJbtFDNMF5k8Nlk5XcF4UNArNoYjl+c/Q/u8KlgF+TBraTQ98HtsrNpss@vger.kernel.org
X-Gm-Message-State: AOJu0YxnFMRaqCHqvIAs474Rnmlg1tuzzyzD2oV8clAqdvZZgIftQpRN
	cfmsGBo6MR9NVIl/5aE1md03HYK0pafdzlTJc2akPbBoUcsR0inpYbqp
X-Gm-Gg: ASbGncvrEB+nx61r92RJmHWamwzb4HJXRJjSxp/RXzFC25AzhM5btexWDMeLsTq1Qa5
	5JXJJ5Stj2wXU/Du79NmPF14ZjkynkgyFNkK+aAC8FEI/9+0hiSHolliRWPxsivjhD3WmA8L7FX
	OCVbuWhtdnZvofQYb00rqGacGjirKgH6l2Oaa91fe1VcHEAAkQRW1EqgtcxZDU+T0tYoYUymMyt
	XhWmeJbE61xvk7ZaPLgnSKDX3upfJyvW37wl+X2xrvMhyW4IWY3J16vYQoNewdYqrOxwePw6hap
	Iys27UYmjA1k26973eqCjBkFa9whnWT5C76QOLzInlfhvDU3hY5yc5dXqW+Gd1I6e7X7rJ/9zxc
	evWiHuFZoZcGulg27MH2yZgxGb3KE9h/lJyIRn7ty5oiRYGw/fv8q67FjAZ+/aZFNJzVi84cwln
	kwRm29el2nY8gbSgNWB5lLh3Th/xn59qLt1gqsHc1Ilahnl+U2to3wSXH3RRGjP+saAGoMyi7Xu
	dyNIw==
X-Google-Smtp-Source: AGHT+IGlpWqE7oPwKq75vqcftF4x8/6mDQeigZg3ZJsYLEPNDxvoQXhlWwCU0z4N+O8Cg3rUkKIDyg==
X-Received: by 2002:a05:7022:ba1:b0:11b:9386:a38e with SMTP id a92af1059eb24-11c94b908a4mr18238628c88.21.1764256573509;
        Thu, 27 Nov 2025 07:16:13 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb067088sm5099656c88.10.2025.11.27.07.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 07:16:13 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 2/3] platform/x86: lenovo-wmi-gamezone Use max-power rather than balanced-performance
Date: Thu, 27 Nov 2025 07:16:04 -0800
Message-ID: <20251127151605.1018026-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251127151605.1018026-1-derekjohn.clark@gmail.com>
References: <20251127151605.1018026-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When developing the gamezone WMI drivers, "extreme mode" was matched to
the performance platform profile and "performance" was matched to the
balanced-performance platform profile, but only if extreme mode was
fully supported; otherwise performance was matched to the "performance"
platform profile. This has led to quite a bit of confusion with users
not understanding why the LED color indicating the platform profile
doesn't match their expectations.

To solve this, replace the confusing convention by using the new
max-power profile to represent "extreme mode". While add it, update the
documentation to reflect the expected LED colors in each operating mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

driver
---
 .../wmi/devices/lenovo-wmi-gamezone.rst       | 31 +++++++++----------
 drivers/platform/x86/lenovo/wmi-gamezone.c    | 18 +++--------
 2 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
index 997263e51a7d..1769ad3d57b9 100644
--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -19,27 +19,26 @@ WMI GUID ``887B54E3-DDDC-4B2C-8B88-68A26A8835D0``
 The Gamezone Data WMI interface provides platform-profile and fan curve
 settings for devices that fall under the "Gaming Series" of Lenovo devices.
 It uses a notifier chain to inform other Lenovo WMI interface drivers of the
-current platform profile when it changes.
+current platform profile when it changes. The currently set profile can be
+determined by the user on the hardware by looking at the color of the power
+or profile LED, depending on the model.
 
 The following platform profiles are supported:
- - low-power
- - balanced
- - balanced-performance
- - performance
- - custom
+ - low-power, blue LED
+ - balanced, white LED
+ - performance, red LED
+ - max-power, purple LED
+ - custom, purple LED
 
-Balanced-Performance
+Extreme Mode
 ~~~~~~~~~~~~~~~~~~~~
 Some newer Lenovo "Gaming Series" laptops have an "Extreme Mode" profile
-enabled in their BIOS. For these devices, the performance platform profile
-corresponds to the BIOS Extreme Mode, while the balanced-performance
-platform profile corresponds to the BIOS Performance mode. For legacy
-devices, the performance platform profile will correspond with the BIOS
-Performance mode.
-
-For some newer devices the "Extreme Mode" profile is incomplete in the BIOS
-and setting it will cause undefined behavior. A BIOS bug quirk table is
-provided to ensure these devices cannot set "Extreme Mode" from the driver.
+enabled in their BIOS. When available, this mode will be represented by the
+max-power platform profile.
+
+For a subset of these devices the "Extreme Mode" profile is incomplete in
+the BIOS and setting it will cause undefined behavior. A BIOS bug quirk table
+is provided to ensure these devices cannot set "Extreme Mode" from the driver.
 
 Custom Profile
 ~~~~~~~~~~~~~~
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index 0eb7fe8222f4..df475e52f79d 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -171,14 +171,10 @@ static int lwmi_gz_profile_get(struct device *dev,
 		*profile = PLATFORM_PROFILE_BALANCED;
 		break;
 	case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
-		if (priv->extreme_supported) {
-			*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
-			break;
-		}
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
 		break;
 	case LWMI_GZ_THERMAL_MODE_EXTREME:
-		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		*profile = PLATFORM_PROFILE_MAX_POWER;
 		break;
 	case LWMI_GZ_THERMAL_MODE_CUSTOM:
 		*profile = PLATFORM_PROFILE_CUSTOM;
@@ -218,16 +214,12 @@ static int lwmi_gz_profile_set(struct device *dev,
 	case PLATFORM_PROFILE_BALANCED:
 		mode = LWMI_GZ_THERMAL_MODE_BALANCED;
 		break;
-	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
-		mode = LWMI_GZ_THERMAL_MODE_PERFORMANCE;
-		break;
 	case PLATFORM_PROFILE_PERFORMANCE:
-		if (priv->extreme_supported) {
-			mode = LWMI_GZ_THERMAL_MODE_EXTREME;
-			break;
-		}
 		mode = LWMI_GZ_THERMAL_MODE_PERFORMANCE;
 		break;
+	case PLATFORM_PROFILE_MAX_POWER:
+		mode = LWMI_GZ_THERMAL_MODE_EXTREME;
+		break;
 	case PLATFORM_PROFILE_CUSTOM:
 		mode = LWMI_GZ_THERMAL_MODE_CUSTOM;
 		break;
@@ -338,7 +330,7 @@ static int lwmi_gz_platform_profile_probe(void *drvdata, unsigned long *choices)
 
 	priv->extreme_supported = lwmi_gz_extreme_supported(profile_support_ver);
 	if (priv->extreme_supported)
-		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
+		set_bit(PLATFORM_PROFILE_MAX_POWER, choices);
 
 	return 0;
 }
-- 
2.51.2

