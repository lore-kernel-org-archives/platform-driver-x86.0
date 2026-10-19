Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9D8494268
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 07:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395611; cv=none; b=KU9GXeUNSQ7/yehvdAyEfLLSux5WY89aSMz5Z5V+p8ZyhzTppTzRNB4wOXFkM2lN9wqky8pfSbSZN/eR1HU8T13SQ8N2ZZzrLrlk0+fHmdwXHubfNy9YUItQsAv8Kq9IlcxygewJkSu1sEUbX/io58PIT9anOz4ORsSRjmZFVVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395611; c=relaxed/simple;
	bh=UAKxb2sO19EjjUuXra2lzxhVdgml7sw5ft9FMCzbe1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/39FzsMKsdhOVU09wTwRUI73URT6zITOjwK4mXmtHT3gL7/OL4LtErEnWsDn2sPwHEKgaAB603uEAsWrb3a067H4IfMFrTaWqSw4NuTtCXZ1NwnXAgApDgZTzFyljHQihNNDLc5sKcaFtT7Hzf44IWhvl9V6y2qYrOza60kDOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0RKcATq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1NAoQHU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0RKcATq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1NAoQHU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jKJa241248
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 07:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/6zJMYsjAxH
	JLinn/mQnZ7v0Rd1A8UU3vQ1u2rl25ww=; b=a0RKcATqF2EChomZWgY1lOK6Z9h
	EEkuT9nCDSTZ8eYMh47J/ja+L5HULtAUZM7+WOcquRc3udvadcf6C3J/hbxUQ8gJ
	nQiANiYMEhYn5b5Ye7p87vt+F7ZY940q3AaBaf9yRvE6hh+LnTikb/WgrFaAQveb
	3ka2tPjFhSI+xTZJ3ztWEf7wyPiqHHUPSMrU4uo8nIXz06SfwgPkv2XI/h2mOFTH
	RLzUOcA64puAqhQoDlxVHXTsya77r0h7DShQ+20UPX2LLlkG+/yqCTEuj1NzXROz
	M2Dn0snaoqgx0Ltasl9RPklFPERDAJDNgiH6MsmkvkePmNdt4O2FJ8ig7Jw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k5cnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 07:40:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9197553d398so41778386d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 00:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792395603; x=1793000403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/6zJMYsjAxHJLinn/mQnZ7v0Rd1A8UU3vQ1u2rl25ww=;
        b=C1NAoQHUAYvpXL0au+3jB9vnX/eFDYoslVPtaFXaMRZKtYqWGRhLu4vKHx42Z+EkVI
         p3TOFXVjtj1/51Ug7X76d8RFnFranHDAmIO65Y+xbI7KlwN98b6W+Q5ddc41ZNNurpQI
         8lYSYMoDJ4QBymAL3a4lpwsY4nHz5Fyv6V62NM3dab5/qs5A9OMU48ZTI85YngRAnUaA
         sasOaIEuhg/nljKbkG/eCvejL5IieIL8ApmdzEXGPnLTdk9D386upAqGr6Uj/2pybCec
         Pf8rPWpcZF5S2OKhIetMgDcaGc81s3Y6houtpmbyEdZeknUd8GOMTGYeHZ1M68aNhCK0
         ZUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395603; x=1793000403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/6zJMYsjAxHJLinn/mQnZ7v0Rd1A8UU3vQ1u2rl25ww=;
        b=A37APTPHWI0ItjeHf1sO7iudaZnsbIPtwvbxSk0eomh5ytc/vm29qqBDm0EsI0QLzf
         9DhAd1sU72OcXEue+FvQ8LV0KucPcRuvM0AuMB8iCos4BuKwlWEJtvx1Y8Rjfz9i8vdY
         NVzhDrGMdiBbD9V3wAmzkcavGr+yHtz8VPfMRPp6JfrDoseCkibPiAFOODRWn2lYaB0n
         HZKSLlPdXWwtoV9ZzgVmTZCuayIcD8k5LqKhQyPCDqZg7sw9As7cHYtinniCy2T3VGYQ
         W0s/TrP7BTWiLboGgRIeirgolMSQRq2fjtNt2WYkRuSWXy2u8ZJmhVawielji76czEfU
         S3PQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0KiN6g3CQI3VMIB1rmhjFxqwI8OHenwXjducicqGWrPgAFIUdz2+kBhZhTT2fj5ftLT3AtE89QlpOnqWF5+3JVhIK@vger.kernel.org
X-Gm-Message-State: AFq9FYI7rbj3cT6ll6jbBOArSVj+g175JknkkiJ1K0BrCjbCkpqIcUM+
	zeAoMuNEJgWiXoxt0tXLQM0pFDmRuNHdyidLmK+tY15aQz1PKWAq0huulvAIApvNvJamQqZo7sR
	86eS7+ZRTOh7zZx31E6iq+J/ovQMoU0OWtCrYzbRCg2x6HbIuTCB7FAu6nlGydHG1kvExj48nGo
	Zf
X-Gm-Gg: AYBFou0qtKISetxYVFMB22ZwavutRZ9DNiL2uvAVd7ldyTXaeQzfthP1GcfP0zEMY5D
	/+0K2Paz6wYcgdoX1lQXWGcQqRGPWfVJ0MRir4HYltSEls4ARaSHI7gFmL1mNaN1omkNF5pH18T
	BdaI95A4y5zvYUp08Bc8p0JedhrghzYxKrQM3G/e3t+LbNV+h79QuVnIsEEWovLVBk7L9sX9vQ5
	CkuZg2VqRyBtSA54hW+x8jwlaVb+eTdcyKB/LiPwXyOtN+dUA2hY9OEkigjMAf20ZHAzoS8pAD+
	Enzvpw9lxpwKk/6a0lta1VxpOg9J5Ib5CE85qe+VIBpcV4rkW8XSddOdsntgQHdbOysgSCTI1I1
	aMTToRFiepK+ey274+vqmAz3cznM=
X-Received: by 2002:a05:620a:2989:b0:937:6de8:b40 with SMTP id af79cd13be357-93f29ceec65mr1174374385a.15.1792395602461;
        Mon, 19 Oct 2026 00:40:02 -0700 (PDT)
X-Received: by 2002:a05:620a:2989:b0:937:6de8:b40 with SMTP id af79cd13be357-93f29ceec65mr1174368785a.15.1792395601887;
        Mon, 19 Oct 2026 00:40:01 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d01d:2002:4b7d:4c30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce325107sm212812955e9.3.2026.10.19.00.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:40:01 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
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
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        Jack Wu <jackbb_wu@compal.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Zhang DM <jixianqiang1540@gmail.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 4/5] platform profile: Document firmware-independent profile selection
Date: Mon, 19 Oct 2026 09:39:07 +0200
Message-ID: <20261019073930.2352283-5-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019073930.2352283-1-daniel.lezcano@oss.qualcomm.com>
References: <20261019073930.2352283-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMCBTYWx0ZWRfX+NWsoShWDPWZ
 PW20xmtHPqTzD/SLnNvEZN/hNLKcR1rM85KcVZG1tYj8H6VPeLQJqvjndIn4QOl6wHCo7mYDoQd
 U4MnbrkfZuM1ISuayJbM3KU6qV71R2Kim9ALB1r2aViRF/WZ6YEv21jDYW7Vt4aLBWdTUokEYZZ
 8uwB7RQNvoQX+WQGJskinLOcJQz31jKVWrUzwSFtL1swQ+8NBJnNsJG4ZTHMJdZbef45+vwpiU9
 eHfJdDt1SahGI8VAC6n6j/lJiivwAfwhfzheyBdARwqQuATR7OohyCNLnwSuEgJmUPcaExeSJIn
 lMp5GKSXlgnQm4kkho0DevW01arC9q7yzEFwnE++IWVquWYHgYbRT5UOCWa58NOP58+qRTSTD8N
 z14+7//uOXUpGqyYitRgmutT1MTTIRWn1GTm3a1lU3XesNqrVECRK5EtYyZJCvUu75uURVj+Ykk
 mtoaxJAsCntSrR6FIzw==
X-Proofpoint-GUID: rsU0tGDW7mvWutew3auruG7_4qFfarAv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMCBTYWx0ZWRfX5bYso3eps11I
 rzu10fTSZI4VT9zdMX7Xc6baYSKL6ilKIXjiuIIm6lJ1kJu6D9q8+2kbYnpY5PImXUydjk63tww
 AyIkxqKmKgPzk25ZQNPcCWCzqpVMA28=
X-Proofpoint-ORIG-GUID: rsU0tGDW7mvWutew3auruG7_4qFfarAv
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad5c953 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uEqVyaLVsi9FIuCuvY4A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190030

Describe the existing per-provider class devices as the firmware-neutral
userspace interface. Explain that providers can use any firmware transport
or implement profiles in software, without an ACPI companion or firmware
node on their parent device.

Retain the ACPI paths as compatibility interfaces for aggregate selection.
Clarify that non-ACPI userspace selects individual providers and document
the sequential application of aggregate writes and their partial-failure
behavior. No new userspace ABI is introduced.

Correct the per-provider choices attribute reference and extend existing
ACPI maintainer coverage to the extracted core and its interfaces.

Assisted-by: OpenCode:gpt-6.1-sol
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-class-platform-profile  |  2 +-
 .../userspace-api/sysfs-platform_profile.rst  | 46 ++++++++++++++-----
 MAINTAINERS                                   |  5 ++
 include/linux/platform_profile.h              |  3 ++
 4 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-platform-profile b/Documentation/ABI/testing/sysfs-class-platform-profile
index fcab26894ec3..75e0f6e2c128 100644
--- a/Documentation/ABI/testing/sysfs-class-platform-profile
+++ b/Documentation/ABI/testing/sysfs-class-platform-profile
@@ -35,7 +35,7 @@ Date:		March 2025
 KernelVersion:	6.14
 Description:	Reading this file gives the current selected profile for this
 		device. Writing this file with one of the strings from
-		platform_profile_choices changes the profile to the new value.
+		choices changes the profile to the new value.
 
 		This file can be monitored for changes by polling for POLLPRI,
 		POLLPRI will be signaled on any changes, independent of those
diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst b/Documentation/userspace-api/sysfs-platform_profile.rst
index 6613e188242a..a85ede3fb8e5 100644
--- a/Documentation/userspace-api/sysfs-platform_profile.rst
+++ b/Documentation/userspace-api/sysfs-platform_profile.rst
@@ -1,6 +1,8 @@
-=====================================================================
-Platform Profile Selection (e.g. /sys/firmware/acpi/platform_profile)
-=====================================================================
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================
+Platform Profile Selection
+==========================
 
 On modern systems the platform performance, temperature, fan and other
 hardware related characteristics are often dynamically configurable. The
@@ -15,6 +17,21 @@ operation or towards performance.
 The purpose of the platform_profile attribute is to offer a generic sysfs
 API for selecting the platform profile of these automatic mechanisms.
 
+The framework is independent of the firmware interface used by a provider.
+Drivers can implement profile selection using ACPI, an embedded controller,
+or another platform-specific mechanism. The core does not discover providers
+or interpret firmware descriptions.
+
+The firmware-independent userspace interface is available under
+``/sys/class/platform-profile/platform-profile-X/``, with ``name``,
+``choices`` and ``profile`` attributes for each registered provider.
+
+On ACPI systems, ``/sys/firmware/acpi/platform_profile_choices`` and
+``/sys/firmware/acpi/platform_profile`` remain available as compatibility
+interfaces for aggregate profile selection across registered providers.
+On non-ACPI systems, userspace selects profiles through the individual
+provider class devices.
+
 Note that this API is only for selecting the platform profile, it is
 NOT a goal of this API to allow monitoring the resulting performance
 characteristics. Monitoring performance is best done with device/vendor
@@ -52,13 +69,14 @@ Multiple driver support
 =======================
 When multiple drivers on a system advertise a platform profile handler, the
 platform profile handler core will only advertise the profiles that are
-common between all drivers to the ``/sys/firmware/acpi`` interfaces.
+common between all drivers to the ``/sys/firmware/acpi`` interfaces, when
+ACPI is active.
 
 This is to ensure there is no ambiguity on what the profile names mean when
 all handlers don't support a profile.
 
-Individual drivers will register a 'platform_profile' class device that has
-similar semantics as the ``/sys/firmware/acpi/platform_profile`` interface.
+Individual drivers register a ``platform-profile`` class device with
+``name``, ``choices`` and ``profile`` attributes.
 
 To discover which driver is associated with a platform profile handler the
 user can read the ``name`` attribute of the class device.
@@ -71,10 +89,14 @@ by writing to the ``profile`` attribute of the driver's class device.
 
 This will allow users to set different profiles for different drivers on the
 same system. If the selected profile by individual drivers differs the
-platform profile handler core will display the profile 'custom' to indicate
-that the profiles are not the same.
+ACPI aggregate interface will display the profile 'custom' to indicate that
+the profiles are not the same.
+
+While the ACPI ``platform_profile`` attribute has the value ``custom``,
+writing a common profile from ``platform_profile_choices`` to it will set
+the profile for all drivers. ``custom`` cannot be written to this aggregate
+interface.
 
-While the ``platform_profile`` attribute has the value ``custom``, writing a
-common profile from ``platform_profile_choices`` to the platform_profile
-attribute of the platform profile handler core will set the profile for all
-drivers.
+Aggregate profile changes are applied to providers sequentially. If a provider
+returns an error, providers updated earlier are not rolled back. Userspace can
+read the per-provider interfaces to determine their resulting state.
diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f8253e..929e1e095f17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -285,10 +285,14 @@ B:	https://bugzilla.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
 F:	Documentation/ABI/testing/configfs-acpi
 F:	Documentation/ABI/testing/sysfs-bus-acpi
+F:	Documentation/ABI/testing/sysfs-class-platform-profile
+F:	Documentation/ABI/testing/sysfs-platform_profile
 F:	Documentation/firmware-guide/acpi/
+F:	Documentation/userspace-api/sysfs-platform_profile.rst
 F:	arch/x86/kernel/acpi/
 F:	arch/x86/pci/acpi.c
 F:	drivers/acpi/
+F:	drivers/platform/profile/
 F:	drivers/pci/*/*acpi*
 F:	drivers/pci/*acpi*
 F:	drivers/pnp/pnpacpi/
@@ -296,6 +300,7 @@ F:	include/acpi/
 F:	include/linux/acpi.h
 F:	include/linux/fwnode.h
 F:	include/linux/fw_table.h
+F:	include/linux/platform_profile.h
 F:	lib/fw_table.c
 F:	rust/helpers/acpi.c
 F:	rust/kernel/acpi.rs
diff --git a/include/linux/platform_profile.h b/include/linux/platform_profile.h
index 855b28340e95..f23f9827eac6 100644
--- a/include/linux/platform_profile.h
+++ b/include/linux/platform_profile.h
@@ -2,6 +2,9 @@
 /*
  * Platform profile sysfs interface
  *
+ * Providers may use any firmware interface or implement profiles in software.
+ * The parent device does not need an ACPI companion or a firmware node.
+ *
  * See Documentation/userspace-api/sysfs-platform_profile.rst for more
  * information.
  */
-- 
2.43.0

