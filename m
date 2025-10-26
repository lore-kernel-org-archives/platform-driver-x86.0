Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6ED26B777
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 08:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761466370; cv=none; b=Qs1lg2ruBFvRyszTBWYW+sGnY3izCGdaYivnap7LRU/tpvL+b5DUXa+GBMpAo5QUuhu7tdj5Cq/hFUgLOhsk3PrdvqRGir59ojVjnx3ClHWTulL7QM8ctQAMJ5jse9LYNclgqxjFymYbL+0erbS5vJtKSj5w97RvOJoFs8IQV/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761466370; c=relaxed/simple;
	bh=fAqPolmBlQfa84L7cxrTr6EjJbpJ+y92oFkNq0XgIKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbmucbmXPfGFWlcULBzGM/W/dh0n1NH0PxIoW/5R8lSzx4gioKIEfdd+CSlF5zEfDQpUGgS/gVBK6jBvlHSld5wofdSapGzg3EofoeiPwMcq2Aw8anNgfBoSaYqq6C3wEXw2TfgKxmw7MC8feqm2UkpXu8jlwugiefDuZ8r4/d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQsPYlsf; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQsPYlsf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33db8fde85cso3668016a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761466368; x=1762071168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rezh3wt9kRUzheVUy54KuCCd/gyLGw88/DiSALE/HFY=;
        b=LQsPYlsf/dMFfba13xz9l6OEYh6Zv0ysFkKuETFGJ97YBA83O4Q/NxFdnH7LOkdcLR
         AxdKOn2Y2TUMnC+c9Bid5GPQSu/yliiIExeZ4c/mah9qz6D8CvRpbi0RnWzShHYcUYGP
         vOknn36f0pZ6wcSBH2NuHWOaD8+4Os0ti/DA9MVpx+dJAgLt93IJHiE40H2LmX0HRQgX
         /lxPg03nzGzyj7Q/hL1lrtDWPfYLxzvJ2lhtogVNka20RUzNtT7NbY0WnI6PUXBAgXYH
         cHZMphwQu2UXHJFr74vWmvYsKxjdMMatWC3em0ZaPZy9fx7TSwdikmkVbJs7cSEbyg/w
         Stgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761466368; x=1762071168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rezh3wt9kRUzheVUy54KuCCd/gyLGw88/DiSALE/HFY=;
        b=rJRa5rquvRj8KOnCkfmtxMuEZ2uLAszn78we0pAT73eHvou+W7fTtYgotcigEFhQQG
         NnDPptW1sUJu8xeuSGp2ZFVe/YsXyFx/RLG0EiwZ0c18wY+Hr5mbHqo1NaaI/NxkYJ+F
         jocEAlscsI1rigmP6dQJjPZE3LgBvKvv0TlhABX4tTBHC723CXnyhc9kA59NYO387zHO
         KA49dYBSnMl1p7CIThYkx7gp4EZLZDlOH83EJGeZzY8XiAAznUJu6iUBiY/+gpV5Up+e
         eJQzvueoh3YKjKSyg4kwcDeHtO53jq0RwPppsC+6iW5m3007Jxsc9y4WJJHlauywnp7M
         gO0w==
X-Forwarded-Encrypted: i=1; AJvYcCVcvVDkRB7weK9d4/tHs1XnVRZkVwxTGwh7VrBQFPx2Ey/cJFvCKrgFVmet548xph5PEaPZxnzWBskqubYmzOCsrPV0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3oXbXUXeP4yYeGV6NvjFwP31qvl8PhBxj1wFwJYRg1+rlcBpc
	/mEEQq46fIIRCp62YAatoM5UvZ03np7e9XQpe/c7VgIR13VXgBCDAkXj
X-Gm-Gg: ASbGnctzcJs183DeFNPblBZQZbfCXYQIQUBOwdW7j8Me8XLDN5t3kJXgbDPCCePNgrY
	sOKtpPRwZP46OlVRUOSLhKofNOgIR1Gq4HKypMQltIbxBce+HA7ROyufp88Q5+Rr+s75LAIKFjk
	14kgz07smRS1mmw8JyrmjGBYWvWd5A/2MpwjNNjIEthKZRd1/p8ks7OqDu4rZr2JQEso6m2s+qt
	4n2ySxUuJj7hsWSSTTqFrKOW5XaRWOiv4pM3MztiUTCz//4TRL6zqRhfZ97tfOqGdQAWCfOmjrg
	JQEkCskc9Fe0sf0yoLJlQqOUjGNi4Se2JN1L8uVYkPBa7ENN6bwQjMHH7XVMGAAtFvsgQ2R7PEe
	ka5/UNFPPFKZd3n0dZfn63UlM/dOXVH6XIx9mVFpC+WLetTtagJDG2CYOalv+gvCtciKtFoNcs4
	5G2TWPh/SaS0TJpPVil0liADr0mlUe5Rp5ytKgY+WHT++fpRykf4+VOYsYQKthZ+taJac=
X-Google-Smtp-Source: AGHT+IE2rbuAHnWMjBa8fygy7jKHSZwSXH4NsVuzqBqrp8tI2m5FHIVSbg3wwDG2m3oqgr2BZK8c0g==
X-Received: by 2002:a17:90b:3c0e:b0:33b:c5de:6a4e with SMTP id 98e67ed59e1d1-33bcf853711mr40477980a91.5.1761466367650;
        Sun, 26 Oct 2025 01:12:47 -0700 (PDT)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fee8014f6sm2374654a91.0.2025.10.26.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 01:12:47 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Subject: [PATCH 2/3] platform/x86: lenovo-wmi-gamezone Use Extreme vice balanced-performance
Date: Sun, 26 Oct 2025 01:12:39 -0700
Message-ID: <20251026081240.997038-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026081240.997038-1-derekjohn.clark@gmail.com>
References: <20251026081240.997038-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When upstreaming the gamezone WMI drivers the "extreme" mode was matched
to performance and performance was matched to balanced-performance, but
only when extreme mode was fully enabled. Otherwise performance was
matched to performance. This has led to quite a bit of confusion with
users not understanding why the LED color indicating the platform
profile doesn't match their expectations. To solve this, replace the
confusing convention with the new "extreme" profile.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 .../wmi/devices/lenovo-wmi-gamezone.rst        | 10 +++-------
 drivers/platform/x86/lenovo/wmi-gamezone.c     | 18 +++++-------------
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
index 997263e51a7d..6c908f44a08e 100644
--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -24,18 +24,14 @@ current platform profile when it changes.
 The following platform profiles are supported:
  - low-power
  - balanced
- - balanced-performance
  - performance
+ - extreme
  - custom
 
-Balanced-Performance
+Extreme
 ~~~~~~~~~~~~~~~~~~~~
 Some newer Lenovo "Gaming Series" laptops have an "Extreme Mode" profile
-enabled in their BIOS. For these devices, the performance platform profile
-corresponds to the BIOS Extreme Mode, while the balanced-performance
-platform profile corresponds to the BIOS Performance mode. For legacy
-devices, the performance platform profile will correspond with the BIOS
-Performance mode.
+enabled in their BIOS.
 
 For some newer devices the "Extreme Mode" profile is incomplete in the BIOS
 and setting it will cause undefined behavior. A BIOS bug quirk table is
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index 0eb7fe8222f4..faabbd4657bd 100644
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
+		*profile = PLATFORM_PROFILE_EXTREME;
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
+	case PLATFORM_PROFILE_EXTREME:
+		mode = LWMI_GZ_THERMAL_MODE_EXTREME;
+		break;
 	case PLATFORM_PROFILE_CUSTOM:
 		mode = LWMI_GZ_THERMAL_MODE_CUSTOM;
 		break;
@@ -338,7 +330,7 @@ static int lwmi_gz_platform_profile_probe(void *drvdata, unsigned long *choices)
 
 	priv->extreme_supported = lwmi_gz_extreme_supported(profile_support_ver);
 	if (priv->extreme_supported)
-		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
+		set_bit(PLATFORM_PROFILE_EXTREME, choices);
 
 	return 0;
 }
-- 
2.51.1

