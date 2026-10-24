Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792882604;
	b=ztZNGSaqJB1UGRVccksnIhS3ukkIs71B2dUlPv0VPMrbF4HlTF2Aa8NxZrcL9U27YXjO
	 opsuMWkUG8EevuqFSVQTmKNOF4sI9a9Yk6IAqK1UPDM3yCqtC9F0slZ8GIjH2YqEkQCIb
	 vNuZvq4CtRq/Wp+zwB6xis0G8LcaYfIZG3jSA2TdJ35T/CUaF2ydytVIJEihTJls48WWO
	 geadbQKYEHbjl133Dk5yDh3fwTQ1Iwz2yD2IcS8yQqSzR7+Y5ublcjZDBQmQMj+pLNtI9
	 216iLBo8AIESQQaMr3nPHCDHPldifpfQq3iAP2q0VCODEFBTfi0pqLjkdlLz5NTkseA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792882604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KZkTpDbUwC0fq2vu8+gU0Jyh9+/zPfcLoyDt0p9UsAM=;
	b=vZwK6g5jh+nGlM11v3Y+XlS37shudoduGJr0MVajLYhScDrBvA6NSqLJ3zuTsAgu/FkG
	 kUg20OuiQt3XHrEjgmwrTw0PqWr8YtgkT1SLvy1NmxQHbwUzTjFw65MY5kFpQOPLZBGmm
	 1osYKj1UXZhi7yqdhjeKl4BmeX9wHKPlosjA0TG4NIaBNt/ntjw9e0gFRs1Wj+qcqNQKj
	 1VVY8ss5aYoct1dm7Nebz0lGimteSigTG3CdZAGQQe2SRKn6u1JlSHX9cssvXBR/ScGvr
	 kYcJaTSPj/w8bAPATdFz/Bof37HRjuUovPTO2TorvcPIsQnYwSmh6DWxezUDMw2d/Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OXQK9vDo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESDqtqLb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E25606A31D
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 22:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E25606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OXQK9vDo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESDqtqLb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OLbVRD1795231
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 22:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KZkTpDbUwC0
	fq2vu8+gU0Jyh9+/zPfcLoyDt0p9UsAM=; b=OXQK9vDok0Pd2zTnDDYPnwVhRNM
	rb6IymPRqMdqH9PZaM8eGQU5nHcEwWPsSRIlEbrqiFOk+FeNUlnpAeAu7BgJ6qCs
	x1Q2pg4ARFeAAAmCKH0o+XXOTR3g/8bPLtGhAEUuWOZl5ofRnDu/pOtOB81HxWAY
	J+Au4v1CAIbadmDanQFpTqSfhR8B8qE6AQ/u3BwLzFRt1BZmtCAirp0x4UcStOf0
	5vW5/EXdQzTkaJK6i/FOF05da2/o4EFomOSQlCz/IZFoHRvBIV6JB4nJqou5wuqU
	LdMSsg7G3G/Rp8eN0DizluCgnZafQlCxG7d2GygbsgISlJQ6lAYqshwqf1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9sttg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 22:56:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so356190185a.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 15:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792882602; x=1793487402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZkTpDbUwC0fq2vu8+gU0Jyh9+/zPfcLoyDt0p9UsAM=;
        b=ESDqtqLbejAC85WsQ5ky2Qy47VtT168us8dQyGXebe0vSlEwYWYcM9Km/M/C09loww
         fVzTA4kopAboMiR9jXnwHBAMLSR0M1vzRwTKVsuP1xM85ZTGgP9nIOOIaG9f6I1kr9xH
         gQ4V/bNKI8HUaErVqukwzDZNMYwvZQOhHPwO/1Rz+Yd14dYQtqynR8xvG2oVxIVbQp3p
         uvXPwy9xrqqEagMHU1ml9HcdA1bHCm8d6C43hJf9JlNqtkBwRnZhTsmnvVsoVTAuMTgg
         2y3q8JPJfh3HYf8q1Z5u84/ii9H43WGF7XAzhY/uuDcnYawrW5GI7Fu4ZHKExGNRycfB
         wxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792882602; x=1793487402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZkTpDbUwC0fq2vu8+gU0Jyh9+/zPfcLoyDt0p9UsAM=;
        b=W5ETfb7bd29+AoEVQILjGMmaW4uJDj58qTcHQ5ITxf4mq3q7sozicOlLfCz7IU7Wj/
         Rv5Nt0XaaopuO9T5xqe6GincunfegyDkGrGpzHJJaahDlvVL4twY+9frMHzS0NArHhDv
         TaIaHFpKnQuIzq0znsXoISDgnknyOQeT3ElJEOCvVdefdzhUtQkt8zVtkf/nyy3SqhbX
         lb2qRx+90vd6a9dO7A7WJRkxpbWoCIL0n79DQIf51aO4FwmAHT4tzB2YqP9PgKfr98pc
         RlpGKJicf/bhSuoWL8LLklxEEzgPvY5ZVX6vqZn0gU2hR2nRe9Tbf3QaKtv+Yydy+ZzJ
         m/HQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVlcCLuJL7SoZaIGpQHlutLRz+cGQ87K6+8RWwZXOoAPPnQKJ47HNll4cdV/TOqPZ/7HX4Zzcct6yhj5V/hToWPvpj@vger.kernel.org
X-Gm-Message-State: AFq9FYLk6JNARDgqHoB+X1knIt0p8pKwQ6NKQTtiZ82z5sM763KWnqAS
	okPQCTwvqispSF1x3JRBowog6vbIXp33WmWyYL6ZYqJm6LYrQBIYZ7JYZYPpi+yeHH/KUSpyU0z
	kGb+EJeOM0YSiOND8SXStrIasef2MiJLSiHRWM7JvG80ZFre0yZxHMvP5LciGUYr9hNGDGnlmDT
	m4
X-Gm-Gg: AYBFou3bll19UHRTyIsS5bawx3FmKmSRq8XsjKnTVIzfz/5hdjiQjN4Mtch3nCGWJXJ
	lQTzS0cwaja7vlLPQE/o19Vo6hzHRrDIXcs5KJ5TyNTxEj5tO8N820mJIz2OsGToEMxvms4jw5v
	gULUACgSpWPXVfeFdq8hCQSTKoHmR4b3zhEFJGIRb2FpZAVAWFrLTnOYPzf/YnVhIvY6pp8CBxW
	feYIXQlZ7sytoBX8dgCBNzQKRhvQRyzv20z9wVU6k+N91w/5mXvHDIlxdtPTyl5OpXL6TUJVEMC
	MG/UIjCJUVrGdXFHVTsbKkcfKOfbnsCAVNSpvmCPtt/4r38+bVwRzquLWe8pUCVPK61hbuf4Zi9
	zuma0wRmHz6FgzZJVWd9jXynKOAo=
X-Received: by 2002:a05:620a:4414:b0:93c:aff9:52c with SMTP id af79cd13be357-940ef99b527mr438932585a.60.1792882601850;
        Sat, 24 Oct 2026 15:56:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4414:b0:93c:aff9:52c with SMTP id af79cd13be357-940ef99b527mr438928385a.60.1792882601319;
        Sat, 24 Oct 2026 15:56:41 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm98564145e9.1.2026.10.24.15.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 15:56:40 -0700 (PDT)
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
Subject: [PATCH v3 3/4] platform profile: Document firmware-independent profile selection
Date: Sun, 25 Oct 2026 00:34:28 +0200
Message-ID: <20261024223501.1420953-4-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: Ql4ADO6E4fr63J8h5cxm5Vf9iDxiDx4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfX92I9l6JA9hjy
 D7fP+A8AROl7MryQW08NutWiWdRIPb49RYCIixmNjuNMS31togPCHWNieHng3V1D4QyMtr+MU+B
 QwVe1QvbI1rtrszQM/INS4g/SZK28uyUsC+lPZbIw+D2uutawCY6sRLLJ/Xh3F3s/pORwJD3KCn
 RESWnIWRK1sKw9NjyZneErrCLCGBXIzYtsa5XxyCdgNlU2CJCFfRBOnUSFmG4sN5MmvEF6EciPY
 ostOeRNtJ0OP1i5JwmDb0k4o2IvKjSi/WE73MdwQWrbQv2ozkpCfCdAIoW5jjVyThBM/2yDT6y6
 hU/z3C/XaI9gusrnDfrq+iJWabv/GBUr96e09znxx9KWPMnbSzoGH78BgRGs6eV9wULP73IfNlW
 9LpicvZzGWO/+e05xF6Tsd28yfIpOO0/IHFFN+P1SGVCVv66HMQeUYg3L/t1cWPZ46wlAkLPVCS
 4u4pwnlA8rOyCp3yHPw==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6add37aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uEqVyaLVsi9FIuCuvY4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Ql4ADO6E4fr63J8h5cxm5Vf9iDxiDx4m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA5MSBTYWx0ZWRfX2dQ84BzgmQUH
 Fi6v58sKMJ+8RE2wGx0xwarRKB6hEHyhc7HpeXcWhSeDw0JE5H2DJN4FcVUl9nssFgUFYal2Iov
 m4kgsPxZM52eOgjZejJDFrxoklCPv1g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240091

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
index 0e9fe9c2a39b..ecb3bf5fdafc 100644
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
 F:	rust/kernel/acpi.rs
 F:	tools/power/acpi/
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
