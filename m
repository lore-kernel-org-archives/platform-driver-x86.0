Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792882620;
	b=Ef264KIU5MGNgc5FXBeOKLJm2AmTbkAbZJjXVa6HYmQgIh6WT4FQSOw6M86NVDuOcRD3
	 TZGUZMaY7JESHnDBa+TyFUxJ3+6AydBUTTeczcJKeekv+IVmvLstj/fVoQicf94jQS26M
	 AetS7COKYrQljoJ+CWwreg/HkstB6/hSrPgmyyvt4W7zb2IVepTgi/tKinPyaZG+tSjxB
	 phb+ENEU6cgCB/jWQuAy1Y+ymGncL0WAnuMmBrl/S42sHQ4A3FVHnJ7nfbRwvkA5AGwIW
	 F22bboe2HKB79xgnGHpWVs7OcrwHJE0eK6/wrfGO5Dh9WDvHRjyizD/0FeEBnp+BRKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792882620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HpbYb8eRqOeaJi8iytaCoDJ7Hh78oub5X6mnHB74uWE=;
	b=d9G6HElPqcYxjedwyrJlM0S1D+XOmOXrOpv0DoUucCGpSHsBQF3yEFjQ5Il2zndB8Fze
	 JPR51IED6xlTP87XZDMSTzdn5ptXZ41Nl+/OccM1jXK/skc6KwqQV69Z78B6sIeXOkP56
	 kVg0xPGFoSdbjz8msYOi/5AyMJ8kzzjRY7JCR5+m3y15MLsztNsxEEx2++I2GnaMWrGoR
	 av7D8my4K3VL3cuPQYwk5QFcDMz+Gypo474rrH2ChYadlLaWq4L6tReXzokNcY7FoLY+M
	 sW7SXDQ3DhKoj7oMt/jjNJCfU+A0wVv1YdgrW5/JLzVZrd0krLxEVC4wfuFK+9xmfYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVxV+J7o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOq9kM1V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A82606A31D
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 22:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18A82606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVxV+J7o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOq9kM1V
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OLd9S21639680
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 22:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HpbYb8eRqOe
	aJi8iytaCoDJ7Hh78oub5X6mnHB74uWE=; b=WVxV+J7oyyuHJOHkPnGWXycQI7Y
	IGIwrrnrnWZ+lQZfWJBeRTiipyuOmBEetgXlgwdUgr+82w11EYGVb8+1xogIVGnu
	PrEjNgieOuXdgZnOXxTWoe2rHLUKqn3YYVxbtG1apaw9wdhHLSBgWhrj7Gbo+iUs
	xiZ81JwH3JyoH/wbafaMl81q5wi8EFeGJAWFR1yQkWMMqcvSqcqo9pyqW6nKSdUM
	sM6gJ6cxNRmjdghBP7ThPMFRVg9dPGNmW8vjV7dpsDd/Zx+PmreSTX3FzGEQ7rbm
	edxPjx6UUZcMyraSMCZrRGY9Be/Pe5W5saaHtjb3TNNzxhLv4tdjbijZSMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27sy33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 22:56:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so107306085a.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 15:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792882618; x=1793487418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpbYb8eRqOeaJi8iytaCoDJ7Hh78oub5X6mnHB74uWE=;
        b=HOq9kM1VUyxj1rOz341+hqKZ624czo/Etpppo187Y5lcDui5UsVq0UuSgeVC+j4OqE
         cXwsJD0W2GL+WmntSaIRIm3MtWRZZO62B/uYXV0Xp2JAgrL18lmAmH601qpmrWt/oMP1
         xbdKwQz1HoKzk3EGDfNd0WtyStrsbqkxYm9vPz8lA4jvMzJSbwoDmI9cLhYg3ErDwmy0
         Vbr0psE463YtV/eBDzzCYKuFs928iKUpPwSY4+wi5M12m9JgWnMAoPbPomZNN6heHp53
         VRvAe4XlGZhhjtvp8s+uTfN/b3nfAd/BV2LJFejtqMm8SQe9dsJgFvSgqa6gqV/7PPsJ
         NWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792882618; x=1793487418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpbYb8eRqOeaJi8iytaCoDJ7Hh78oub5X6mnHB74uWE=;
        b=i4GAM+Fijkeiy1E3y9jw0fecH/FPKZWq6+AtFFfxAIjuv+yahMO1VmwBvCQgomccgM
         ycdT6KbmRAwlxndgRDQNHRhJzMcwnooujNACM/Kp7tCfjmkGQLCwzKH/in2gc+vC7MI3
         1WopyXvxr2iGDWZfkjPZXUdIISAs5m7g2yxTwADktvVKUPlao6k6KCj/UvbcnKK8dD0x
         v/CT5/4dpuG1KX2Wo92x8nJOT0P4FZGMvE9znaBNGUpI6wqHxhkqG/x8HRjnhl1AELzP
         fqdK7V4ueNOydPOV6JzVXtCY4T8K9Le00b9qjZyh0T5cYwINZM7brZ7Gy6K2FOqbQ7Qp
         D7dQ==
X-Forwarded-Encrypted: i=1; AKwUvBw34nuITSGRtSTFdXvxSaeCfvYgeFDvdYtMUCGrsMr8cjXxmWwNfzbHR9ulUsHNRdgi+oAj4EBwiyfwoWtFQUInXnk+@vger.kernel.org
X-Gm-Message-State: AFq9FYK2pEvJR0eDCjNbQNoTxnS3Oynhh2ZxChevrsXXPVmmpzo3mpIy
	WngspnvyWYZUsnd09DxMMfgb4+BILVxj6g95OyHX4Pe+wy0CNlV9lxSvhvnzw6evM4k/2XIlAJi
	IxGZzhlTWe6cwat0pY2Z1UoMJcIMDkjg4dYNqw+a/odnnGjb0atQFosrxIOmOeazSZDeV9TccCI
	or
X-Gm-Gg: AYBFou1HGhGBPVcFjtKr5McOdSBk+pPAIwsz+ViHcXN4zfClMba8ZXJ7RUPVATLPQ3y
	a6FmYF4kv+jvaFeBlnpJVJBeT/mlar3DlFvAuZm0elJ0xmfFvtoo3uTk+gQjrNTVCOMXGjuKuOX
	11IsAZKw2e0EXJCfxMkN04CQRQscXrNdN3VZxHXSkYgbCb/Tas8LqxZTsx04qco2j33fd5eGk31
	FahGEhbJCL6aN7O4sLTPq4QXQ0kF+dnkYoIMkwFQbn+1fBHh3LfPE7p4PSx51bXzSHCfjO8g5t/
	a3YB5rzm5w9brkC0/5YHsCbozMSRTEIjXukPL/M5DGbvXMxyfPod8xErDMJSBL28mEw0LpjGti6
	XEyNXgKl2Vpg6XpN2s0OfGlWCqJU=
X-Received: by 2002:a05:620a:1a05:b0:93e:6620:bde7 with SMTP id af79cd13be357-940ef8ae2bdmr471176285a.20.1792882618126;
        Sat, 24 Oct 2026 15:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:93e:6620:bde7 with SMTP id af79cd13be357-940ef8ae2bdmr471173685a.20.1792882617573;
        Sat, 24 Oct 2026 15:56:57 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm98564145e9.1.2026.10.24.15.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:56:56 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jack Wu <jackbb_wu@compal.com>,
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 4/4] platform profile: Make legacy ACPI aggregate interface optional
Date: Sun, 25 Oct 2026 00:34:29 +0200
Message-ID: <20261024223501.1420953-5-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6add37ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8
 a=B7gyEwpuI2iDi5sUgSMA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tvpx-HHB2WcT8vdABcH63DVASF2sWIcJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfX8mgaKTL7cLp5
 zg6+Cp7BlJkVAfl8wZeLNapuvDrg6Az8pjvh13u8DJmnKFIgERMH+fE1V+iTubXTVq3vbyWn8B5
 Lh2w3UufIawq62PFwJQQzj+4ni72tyI=
X-Proofpoint-GUID: tvpx-HHB2WcT8vdABcH63DVASF2sWIcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfXyWQuWnITToKl
 VM6iXGTW1sVKmG0t25qwL5vwz2C8rNS0atYK2wKGyX92ijPU/s77dHLQbNM6zIQIV9Lo34JLEaI
 9zuMkayQLmjvMtug/i9BYuREh+O9w7aANH/L2KwEZlQTxkq1NUhK7G+31ZL1xgqiZheogh38JkW
 ssBtkkXZ4dncMDqchWsVQNvTg8M5pDHLMer6Jo+L/6h20Nqtrk5VPBl1tIgFil9+6a/o6as3yoY
 +c7UxZN+saF2TutkB+eq4Ink+3KcQYdJIIKwH1N7qIPuE6CJ15JR6i4OlVKlwNeD87xZpOF9z36
 DaWCr36idMA8Ug/T9v4l6HzXxjkqfMROlFKUQPctVl7GTQUB3prl8RWCdDI51ZwktCnDcI1Ma7k
 WdiB86efzZtpZbr32V1Q1QmSu6AxITQh8LXVH0pNB4fYVBuVIPQcdEKtFG+5yZq1TBy4gI3tadx
 wBDUZrGhy0ZJlwexL0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240091

The aggregate attributes under /sys/firmware/acpi/ are retained
for backwards compatibility. Firmware-independent userspace can already
discover providers through /sys/class/platform-profile/ and control each
provider using its choices and profile attributes.

Add PLATFORM_PROFILE_LEGACY, a boolean depending on PLATFORM_PROFILE and
ACPI, to control the legacy aggregate sysfs interface. Default it to y so
existing userspace continues to work when updating its configuration.

Compile the ACPI adapter and legacy sysfs callbacks only when the option
is enabled. Keep common aggregation helpers in the core because kernel
hotkey users still need platform_profile_cycle(). Class devices and their
notifications remain available regardless of the legacy option.

Document the compatibility option and recommend individual class devices
for new userspace. No daemon changes are included in this kernel series.
Move the legacy ABI documentation to obsolete/, retain its original
creation dates and attribute descriptions, identify the replacement class
attributes, and update its MAINTAINERS entry.

Mark the legacy ABI deprecated and document removal after the 2028 LTS
kernel, conditional on userspace migration. Keep the enabled default
until class-device support has been released and deployed in userspace.
Emit one shared pr_notice_once() when either legacy attribute is read or
the profile is written, identifying actual legacy use rather than warning
merely because the compatibility code was loaded.

Validate ARM64 without ACPI and x86 module builds with the option enabled
and disabled. With ACPI active and the option disabled, QEMU tests confirm
that the legacy attributes are absent while class controls, notifications,
kernel cycling and concurrent registration/removal continue to work.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../sysfs-platform_profile                    | 12 ++++
 .../userspace-api/sysfs-platform_profile.rst  | 17 +++--
 MAINTAINERS                                   |  2 +-
 drivers/platform/Kconfig                      | 23 +++++-
 drivers/platform/profile/Makefile             |  2 +-
 drivers/platform/profile/core.c               | 72 +++++++++++++++----
 drivers/platform/profile/profile.h            |  2 +-
 7 files changed, 109 insertions(+), 21 deletions(-)
 rename Documentation/ABI/{testing => obsolete}/sysfs-platform_profile (70%)

diff --git a/Documentation/ABI/testing/sysfs-platform_profile b/Documentation/ABI/obsolete/sysfs-platform_profile
similarity index 70%
rename from Documentation/ABI/testing/sysfs-platform_profile
rename to Documentation/ABI/obsolete/sysfs-platform_profile
index 125324ab53a9..c001c8641a3a 100644
--- a/Documentation/ABI/testing/sysfs-platform_profile
+++ b/Documentation/ABI/obsolete/sysfs-platform_profile
@@ -2,6 +2,12 @@ What:		/sys/firmware/acpi/platform_profile_choices
 Date:		October 2020
 Contact:	Hans de Goede <hdegoede@redhat.com>
 Description:	This file contains a space-separated list of profiles supported for this device.
+		Available with CONFIG_PLATFORM_PROFILE_LEGACY on active ACPI
+		systems for backwards compatibility. New userspace should use
+		/sys/class/platform-profile/platform-profile-X/choices instead.
+		This interface is deprecated, with removal intended after the
+		2028 LTS kernel once userspace migration is complete. Accessing
+		either legacy attribute emits a one-time deprecation notice.
 
 		Drivers must use the following standard profile-names:
 
@@ -27,6 +33,12 @@ Description:	Reading this file gives the current selected profile for this
 		device. Writing this file with one of the strings from
 		platform_profile_choices changes the profile to the new value.
 
+		This legacy interface requires CONFIG_PLATFORM_PROFILE_LEGACY.
+		Individual class devices remain available without that option.
+		Use /sys/class/platform-profile/platform-profile-X/profile
+		instead. This interface is deprecated, with removal intended
+		after the 2028 LTS kernel once userspace migration is complete.
+
 		This file can be monitored for changes by polling for POLLPRI,
 		POLLPRI will be signalled on any changes, independent of those
 		changes coming from a userspace write; or coming from another
diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst b/Documentation/userspace-api/sysfs-platform_profile.rst
index a85ede3fb8e5..a3fc1ee20832 100644
--- a/Documentation/userspace-api/sysfs-platform_profile.rst
+++ b/Documentation/userspace-api/sysfs-platform_profile.rst
@@ -26,11 +26,20 @@ The firmware-independent userspace interface is available under
 ``/sys/class/platform-profile/platform-profile-X/``, with ``name``,
 ``choices`` and ``profile`` attributes for each registered provider.
 
-On ACPI systems, ``/sys/firmware/acpi/platform_profile_choices`` and
+On ACPI systems with ``CONFIG_PLATFORM_PROFILE_LEGACY`` enabled,
+``/sys/firmware/acpi/platform_profile_choices`` and
 ``/sys/firmware/acpi/platform_profile`` remain available as compatibility
 interfaces for aggregate profile selection across registered providers.
-On non-ACPI systems, userspace selects profiles through the individual
-provider class devices.
+New userspace should select profiles through the individual provider class
+devices. These remain available when the legacy interface is disabled and
+on non-ACPI systems. Kernel profile cycling also remains available without
+the legacy interface.
+
+The legacy aggregate interface is deprecated. Removal is intended after the
+2028 LTS kernel, once userspace has migrated to released software using the
+class devices. Compatibility remains enabled by default during the migration;
+the date alone does not trigger removal. Accessing either legacy attribute
+emits a one-time kernel notice directing userspace to the class interface.
 
 Note that this API is only for selecting the platform profile, it is
 NOT a goal of this API to allow monitoring the resulting performance
@@ -70,7 +79,7 @@ Multiple driver support
 When multiple drivers on a system advertise a platform profile handler, the
 platform profile handler core will only advertise the profiles that are
 common between all drivers to the ``/sys/firmware/acpi`` interfaces, when
-ACPI is active.
+ACPI is active and ``CONFIG_PLATFORM_PROFILE_LEGACY`` is enabled.
 
 This is to ensure there is no ambiguity on what the profile names mean when
 all handlers don't support a profile.
diff --git a/MAINTAINERS b/MAINTAINERS
index ecb3bf5fdafc..33fafd213a31 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -283,10 +283,10 @@ S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-acpi/list/
 B:	https://bugzilla.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
+F:	Documentation/ABI/obsolete/sysfs-platform_profile
 F:	Documentation/ABI/testing/configfs-acpi
 F:	Documentation/ABI/testing/sysfs-bus-acpi
 F:	Documentation/ABI/testing/sysfs-class-platform-profile
-F:	Documentation/ABI/testing/sysfs-platform_profile
 F:	Documentation/firmware-guide/acpi/
 F:	Documentation/userspace-api/sysfs-platform_profile.rst
 F:	arch/x86/kernel/acpi/
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 395b75f2edf0..7270f24a3b6e 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -9,12 +9,31 @@ config PLATFORM_PROFILE
 
 	  The core exposes per-provider controls under /sys/class/platform-profile/.
 	  A provider driver must register before profile attributes become
-	  available. ACPI is not required; on ACPI systems the legacy system-wide
-	  interface under /sys/firmware/acpi/ is also provided.
+	  available. ACPI is not required. The legacy system-wide interface under
+	  /sys/firmware/acpi/ can be enabled separately for existing userspace.
 
 	  To compile this as a module, choose M here: the module will be called
 	  platform_profile.
 
+config PLATFORM_PROFILE_LEGACY
+	bool "Legacy ACPI platform profile sysfs interface (DEPRECATED)"
+	depends on PLATFORM_PROFILE && ACPI
+	default y
+	help
+	  Expose platform_profile and platform_profile_choices under
+	  /sys/firmware/acpi/ for compatibility with existing userspace. These
+	  attributes aggregate the profiles of all registered providers.
+
+	  This interface is deprecated and is intended for removal after the
+	  2028 LTS kernel, once userspace has migrated to the class interface.
+	  It remains enabled by default until replacement userspace releases
+	  are available and have had time to reach users.
+
+	  New userspace should use the individual devices under
+	  /sys/class/platform-profile/ instead. Disabling this option removes
+	  the legacy sysfs interface but retains class devices and kernel
+	  profile cycling. If unsure, say Y to preserve compatibility.
+
 source "drivers/platform/mips/Kconfig"
 
 source "drivers/platform/loongarch/Kconfig"
diff --git a/drivers/platform/profile/Makefile b/drivers/platform/profile/Makefile
index ae95ba09383c..787fc9bc961a 100644
--- a/drivers/platform/profile/Makefile
+++ b/drivers/platform/profile/Makefile
@@ -2,4 +2,4 @@
 obj-$(CONFIG_PLATFORM_PROFILE) += platform_profile.o
 
 platform_profile-y := core.o
-platform_profile-$(CONFIG_ACPI) += acpi.o
+platform_profile-$(CONFIG_PLATFORM_PROFILE_LEGACY) += acpi.o
diff --git a/drivers/platform/profile/core.c b/drivers/platform/profile/core.c
index a850942131cd..148f14a5fbe8 100644
--- a/drivers/platform/profile/core.c
+++ b/drivers/platform/profile/core.c
@@ -30,12 +30,16 @@ static DEFINE_MUTEX(profile_lock);
 /* Serialize registration and sysfs updates without blocking sysfs callbacks. */
 static DEFINE_MUTEX(profile_registration_lock);
 static LIST_HEAD(profile_handlers);
+#ifdef CONFIG_PLATFORM_PROFILE_LEGACY
 static struct kobject *compat_kobj;
+#endif
 
 static void profile_notify(void)
 {
+#ifdef CONFIG_PLATFORM_PROFILE_LEGACY
 	if (compat_kobj)
 		sysfs_notify(compat_kobj, NULL, "platform_profile");
+#endif
 }
 
 static int profile_update(void);
@@ -310,6 +314,12 @@ static int _aggregate_choices(struct device *dev, void *arg)
 	return 0;
 }
 
+#ifdef CONFIG_PLATFORM_PROFILE_LEGACY
+static void profile_legacy_notice(void)
+{
+	pr_notice_once("The ACPI platform_profile sysfs interface is deprecated and planned for removal after the 2028 LTS kernel once userspace has migrated; use /sys/class/platform-profile/ instead\n");
+}
+
 /**
  * _remove_hidden_choices - Remove hidden choices from aggregate data
  * @dev: The device
@@ -348,6 +358,8 @@ static ssize_t platform_profile_choices_show(struct kobject *kobj,
 	};
 	int err;
 
+	profile_legacy_notice();
+
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
 		err = profile_for_each_handler(&data, _aggregate_choices);
 		if (err)
@@ -365,6 +377,7 @@ static ssize_t platform_profile_choices_show(struct kobject *kobj,
 
 	return _commmon_choices_show(data.aggregate, buf);
 }
+#endif
 
 /**
  * _aggregate_profiles - Aggregate the profiles across providers
@@ -409,6 +422,7 @@ static int _store_and_notify(struct device *dev, void *data)
 	return _notify_class_profile(dev, NULL);
 }
 
+#ifdef CONFIG_PLATFORM_PROFILE_LEGACY
 /**
  * platform_profile_show - Show the current aggregate profile
  * @kobj: The kobject
@@ -424,6 +438,8 @@ static ssize_t platform_profile_show(struct kobject *kobj,
 	enum platform_profile_option profile = PLATFORM_PROFILE_LAST;
 	int err;
 
+	profile_legacy_notice();
+
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
 		err = profile_for_each_handler(&profile, _aggregate_profiles);
 		if (err)
@@ -457,6 +473,8 @@ static ssize_t platform_profile_store(struct kobject *kobj,
 	int ret;
 	int i;
 
+	profile_legacy_notice();
+
 	/* Scan for a matching profile */
 	i = sysfs_match_string(profile_names, buf);
 	if (i < 0 || i == PLATFORM_PROFILE_CUSTOM)
@@ -508,6 +526,44 @@ static int profile_update(void)
 	return 0;
 }
 
+static int profile_compat_init(void)
+{
+	int err;
+
+	compat_kobj = platform_profile_compat_kobj();
+	if (!compat_kobj)
+		return 0;
+
+	err = sysfs_create_group(compat_kobj, &platform_profile_group);
+	if (err)
+		kobject_put(compat_kobj);
+
+	return err;
+}
+
+static void profile_compat_exit(void)
+{
+	if (compat_kobj) {
+		sysfs_remove_group(compat_kobj, &platform_profile_group);
+		kobject_put(compat_kobj);
+	}
+}
+#else
+static int profile_update(void)
+{
+	return 0;
+}
+
+static int profile_compat_init(void)
+{
+	return 0;
+}
+
+static void profile_compat_exit(void)
+{
+}
+#endif
+
 /**
  * platform_profile_notify - Notify the provider and aggregate sysfs interfaces
  * @dev: The class device
@@ -735,24 +791,16 @@ static int __init platform_profile_init(void)
 	if (err)
 		return err;
 
-	compat_kobj = platform_profile_compat_kobj();
-	if (compat_kobj) {
-		err = sysfs_create_group(compat_kobj, &platform_profile_group);
-		if (err) {
-			kobject_put(compat_kobj);
-			class_unregister(&platform_profile_class);
-		}
-	}
+	err = profile_compat_init();
+	if (err)
+		class_unregister(&platform_profile_class);
 
 	return err;
 }
 
 static void __exit platform_profile_exit(void)
 {
-	if (compat_kobj) {
-		sysfs_remove_group(compat_kobj, &platform_profile_group);
-		kobject_put(compat_kobj);
-	}
+	profile_compat_exit();
 	class_unregister(&platform_profile_class);
 }
 subsys_initcall_sync(platform_profile_init);
diff --git a/drivers/platform/profile/profile.h b/drivers/platform/profile/profile.h
index 910c9f7da6a0..362eb8cc4592 100644
--- a/drivers/platform/profile/profile.h
+++ b/drivers/platform/profile/profile.h
@@ -5,7 +5,7 @@
 #include <linux/kconfig.h>
 #include <linux/kobject.h>
 
-#ifdef CONFIG_ACPI
+#ifdef CONFIG_PLATFORM_PROFILE_LEGACY
 struct kobject *platform_profile_compat_kobj(void);
 #else
 static inline struct kobject *platform_profile_compat_kobj(void)
-- 
2.43.0
