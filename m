Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F6302146
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 19:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452148; cv=none; b=MdgvP7dreYyNPCrCDvrXd6pft48fjDzG/9aRg+mihPsNk6p0J2m4HfR/3RoK6YtF/i8qpJZ6GnMz9DyzATFdsvGKrTAl2Hwm4oBuMXZ9k57O0SaoOnCsYHbs6MVDGlsngR2SRWiPlYy0Cpt61nXp2LA88buw0wrNoo/SWkRsBGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452148; c=relaxed/simple;
	bh=+Rcs9tqTLxY6uz2CPrBVs8k8aFNAm68QFL8TI+SEKms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ib265uAvj8TfKoODzA2tGLhcdj8gyZNE8dKK552zz0CHy0hQX6dxYIk4vNsysrO2lqR3Uv59+VkAdhih3ayKC04CNGgH1FuLsv48EPnlyv53qGsGIHqXwWQzRhTmgHhiNVjwL2SifSHt2Ymy6AynggOcLcGzJNVME0KTDwl81Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hipbacNZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FJE0ntUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hipbacNZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FJE0ntUY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5QOL341700
	for <platform-driver-x86@vger.kernel.org>; Tue, 7 Jul 2026 19:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mt/L0C8c6aeHx2BoFJgmqf
	geH7twNz10xR7G3mGjzkM=; b=hipbacNZIKnbOIiuL7Ija/REMd/Qsr8oDEC4x9
	Sma7nBVS6fC+E/CwoO+vJ8KyblEMZK9nY0q4c60G/n7KruCB06+qG8RlC/RgvV5c
	Qdk+3ZW6G4xSh/zsW7o7kd13nQx6+jqqEn5E8Aov+R+jHCDA5A+5Wr8azUO8Age6
	j7V7WM4CgvIWbyH3c40usP7tp3cygG911zSAV7szQ8c6clkhDOdyS199Sw6c5NK7
	WaNH0iB/YXJnSuivIdV1j2EWjMohbIkAemdcqmcLl0Eprp7ghTDPpRbMF9m+rjZZ
	7lHufJaDnW9odRFKCxInYBnyAm1MJZhwCOdI1QBE2jwHdemQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2ub3t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 19:22:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so56876201cf.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452145; x=1784056945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=FJE0ntUYBtY9PKBQ2MxZYWuWXJUs8nKIQtds2c3EEGXPyjLzSEWsH49aQ1xz5qPvjl
         7ptEWF6ZKgRR2FU+auw2yhZtLpCHss3CLcAF6J44rGbwgnOYjQCyCIYe+AVTD70GupB/
         tC8yov7hrrMPMyLJuHDagw0tpc3qbzMdDRUNaO6C30l1UWLEGgkA4ZYeR0QMJX+F+5T8
         Ghc101X3BNfRYX9UsYxJvU72j06nsRr1bd6cdutiEm9O3WCCcoyXlyX2TfFOy+pJ0Z4V
         ofj51KHApsbQN5qgecaURgy2M9QnpxSGLIuPASjAfDAI+0/wZnspVgDpXtRjCbWzIaX+
         HcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452145; x=1784056945;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mt/L0C8c6aeHx2BoFJgmqfgeH7twNz10xR7G3mGjzkM=;
        b=FEyNoO5+gP+rxDUMkvWUMheXLS2nAQLwSt/48UpNLa+LytaU0JZCXgnZLIuzwVg979
         K1y7iUXJBsfkjHElDtJAzobrW1GoZEUgbvbeW8Cb4gWEynnoWYVpIOG/wbAdAlc+wBhM
         ShiHNIb3h2XnSYXhP0P1ZAIu7JKL2tJJJklO8p1PpkI7xz0fwOMDmT7o6oyo95Lp960J
         Asb/C1N1hbrGJ8kiLMWiYpnzLZfMCoL+OVcpY6rSsn9I6WDHW8rTBAhazLGQYKavfwWX
         k4KzbpA90Rg/41E1n6NfCq/2oOzAbehID/3lsj6CweXbuX4K30rjQ99FL5jwkA5PM/Cn
         IuBg==
X-Forwarded-Encrypted: i=1; AHgh+RozFbGyZRGTIrxtTN3RVBeAanVlS0tJwtRKzu9AYgnblcDKW2VIVsxqEfvGzxPP6ARnt9/6o1WNyKTmbnzf9xJNYYHE@vger.kernel.org
X-Gm-Message-State: AOJu0YycIWrOQGZ6wx6Map639EAShPag2kE4Yy5KHvxtvZTM/TmPE19U
	9kUMZsJ3mgqktqc7MBa+x6oEnlbBkC7AOfFH8jFc4m5QmBA4eJv2qXwZ3pUakVF4s6X0yigAJYr
	AdC/mAaXL7dIEXlEymmGrCBE6DKGqbbUaUwll/mzBgRdDfi9YQCZOD5FTZnlt4IO1RI0JLjUgvI
	Hj
X-Gm-Gg: AfdE7ckGZlU2MIyZ6eHoIgFNrUdkHkqZkfY+V76FaMkwS45/IkNBPLmtXl/7wNNRAkL
	y9NxHHLbZof0CpGWi0rRJoZL3s9h2tAsy8gCriv2f6mF4V9sbg2TFGCIRSo3pbYQrRgZPeRl0Al
	Ep/nbBrCtc3vJ7Qdc4xVob3CRYuPzX+RAdWs1Zs2thS3pRDnI7SAwXrP22ODcDwUS2AjMS3Aizo
	l5IFQ0pYOa3dW65vy6n+EiKSoi+LErr/JQEzQeqNF1nf8E86NcYgFALh4YcglYjZc81mjB6NkT1
	y2vVrumNyfSZUR6oVs24NqFudZDwtJXeF5FBWrfIq7MBm3E6vmmPHngOv+83TOfnWvWXP7sYPzq
	xAhfXdTtgCcOWNJrE3eVbwu1aIkTb/NA9RmQwfqZ9aMs=
X-Received: by 2002:a05:622a:53c6:b0:51c:1e69:bcc8 with SMTP id d75a77b69052e-51c7479f5ecmr70651221cf.10.1783452144731;
        Tue, 07 Jul 2026 12:22:24 -0700 (PDT)
X-Received: by 2002:a05:622a:53c6:b0:51c:1e69:bcc8 with SMTP id d75a77b69052e-51c7479f5ecmr70650781cf.10.1783452144006;
        Tue, 07 Jul 2026 12:22:24 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae4fsm37218836f8f.18.2026.07.07.12.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:23 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Tue,  7 Jul 2026 21:22:16 +0200
Message-ID: <20260707192219.14605-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfXwnmlMpC8xFTD
 aJf8MdsSZtetbqA4lAoEZWYDl4+VvK04RGyI2Op3555MZ2UQQm3KoKHkh3+a2LKQEomnGK14MDy
 6+TbwF9eGqEUZT6l8ho8FWALfzzvSTc=
X-Proofpoint-GUID: fM4VFrXKo9hYHjB6tq_QE-fHm3WxCipF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX2s8tW0N8RUdr
 6rAON+l7H6k40yzTqAVKzUzFXdDiIY3LbY8OEKihntcK+r0grM5jiD3gVh8qtuLbqDYLrt19sGw
 Fwt/rP4ZNNx5KSS5IUX9C7sMdboNuJ5uUFF2Ka8jfdIRAFEQOEcmx136rEOIzVqGfUE6jx3LEXh
 sClAB/zVeCInIebF9KsLxd7MeI8Yf6RAmSY4E8xs0Cz3y6gUVG9NBhP8MnuXGwE/e1d3BSH0Szc
 jvAxjiFNmTTyAWa6OEXEJwvlbtZNTsgKdXJhxIojz8mrD8dK8xwyW6nitoM6VeDLjqtwZoVEpGF
 QHYuXlIWMDuXs7iCwAL0HH7LB9net+dSOza39C/ua6fb5E6E+4i02EM1Nd8/Dk+5JQ70eNyf5Ly
 +GUeDkhbP6tOmF08iyjRIuIu8BAi4ehwQ9Kbby8x58D4A7URRsUZa94wnLa57oEbIudP/IY5s3m
 sK5m4sra1VM9HX6d3Xw==
X-Proofpoint-ORIG-GUID: fM4VFrXKo9hYHjB6tq_QE-fHm3WxCipF
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4d51f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors
covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
module and SSD. These sensors are currently used by the firmware for
thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors.

The second patch exposes the EC as a thermal sensor provider in the
device tree and defines thermal zones for the keyboard skin
temperature and the charging circuitry temperature. This allows the
generic thermal framework to react to EC-reported temperatures and
apply standard Linux thermal mitigation policies.

As the EC protocol is not fully decoded, the passive trip points
get/set actions are missing, so it is not possible to program a
threshold and receive an interrupt when crossed the way up or
down. Consequently, the thermal zone related to the charging circuitry
is polled every two seconds until we can set the trip points in the
EC.

This series fixes critical thermal issues happening on this platform
where a kernel compilation, or heavy workloads, lead to a system
reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Please make sure scmi-cpufreq.ko is loaded before testing

Thanks,

Daniel

---
 Changelog:
	v6:
	 - Added Reviewed-by tag (Dmitry Baryshkov)
	 - Removed required property for #thermal-sensor-cells (Krzysztof Kozlowski)
	v5:
	 - Added Reviewed-by tag (Ilpo Järvinen)
	 - Added the '#thermal-sensor-cells' property DT binding (Sashiko)
	v4:
 	 - Added the missing HWMON_C_REGISTER_TZ attribute (Sashiko)
	 - Fixed dependency with HWMON (Sashiko)
	 - Added Tested-by tag (Neil Armstrong)
	v3:
	 - Removed event based because trip point are not yet well supported
	 - Added an empty line after variable declaration (Ilpo Järvinen)
	 - Used MILLIDEGREE_PER_DEGREE from units.h (Ilpo Järvinen)
	 - Made switch consistent (Ilpo Järvinen)
	v2:
	 - Fixed patch 1 subject prefix
	 - Removed the fan information part
	 - Added HWMON_T_ALARM
	 - Fixed DT change description to reflect what it does really

Daniel Lezcano (3):
  dt-bindings: embedded-controller: Add Lenovo ThinkPad T14s thermal
    sensor provider support
  platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
    temperatures
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../lenovo,thinkpad-t14s-ec.yaml              |   4 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  67 ++++++++-
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 4 files changed, 202 insertions(+), 1 deletion(-)

-- 
2.53.0

