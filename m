Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8419E41C30F
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jul 2026 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902244; cv=none; b=bNyXVi6WLn3sQncPpbS6khrE9o4G4GJt2TaGt0sAEw8iaDID+u/eHRY/dZbV6CtR/9KnmklbBDydJ2KxRMXgTJDZRHz+Q0HZcqr3e1UKePph44S8xW5mR8KQVEiy5922eIPIAZXwmNZm1DCLtM/TzHMukVtefigxMys5n/uC1OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902244; c=relaxed/simple;
	bh=3eTtRbYeYc2Ucl4oM9OL99IuKEACdQbDk9OneYUz3hM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tJ688+hb3tfK2TgZXJuhwSu1HlGOAP5P+1fNnKCDHPWNhrovAvDXAm2YhNef+7EsGOJwx2a92e4rjibc9iz6KsrzVi2sbc07WWR1bw0lmcW4JSDWR4qGCqDW/JSfIvym+O/KDnRSoI8kHPJch1oEWdk2khndrDr/8A5Ct+fp2tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AzAmDLpl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cX5ugZ+5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AzAmDLpl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cX5ugZ+5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8wrD753593
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Jul 2026 10:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HBLQidyajdO9oG1GsqnmdD
	1EP+Zn0eFu7AAq13az6os=; b=AzAmDLplePkHG2aHzBiQkXwaXpsA4fHSoEcQyt
	Xcp8NdJew09OhYrjHM1Fk1dtn23RKC7B1e9ZHerhq6+Qcm0wtfceEGHnN8Fel8ec
	tILh15t2g1n+vMBrtNyQtrbzyubyS9UvY2zW2/3I72Z3pwPls227p3sd8qt/62zz
	XQtzjnK2PgREh3+o8e5PNj/0F01wt0sjIuEUB0YK1w7jSu4kbx47fqbI+Mkl+AwW
	KxDEErpIDDCQI7qucaBRX+FaUSBthQUHjs8022Scpo/vKXceN5AK85otNYR/C7eL
	CkBz0MiPDUVhrIo/UQfoTtxUXgI/5sdvzmB9Sh/Hy8RyAf1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy27md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2026 10:37:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92b4b575561so63655985a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2026 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902238; x=1783507038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HBLQidyajdO9oG1GsqnmdD1EP+Zn0eFu7AAq13az6os=;
        b=cX5ugZ+5ZqJBZzADFzlO415Snhe44xSZvtLNYweoDDQjrQxbP6GmuWvijZ2n48d8nD
         MIBAyByyo+g3ppLhiVm9HxRstDF80FfL8G0sIFpXm41nBmYUa50kQPkelYvZ/MLxXZMn
         uy49e4RSOJqAYpmYzYy5x1/3ZuLEfVrbviiU0KR/UfDqhf8axFCHVZAGq1Y8wCZf7M/s
         uzb+0m4FQOG938dXgHBsuhDtv3nWGCO4HXTKsc+htDvDkGSO4VGFNgcHAogowflTIzxC
         3JV0wfPmsEpHSRL2fJ0if/glvDaqlLVnVpolyli5BxHiyi+OafcDX5/GQW5CF8zEyXkk
         nZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902238; x=1783507038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBLQidyajdO9oG1GsqnmdD1EP+Zn0eFu7AAq13az6os=;
        b=XzOATsmDZ8mdZLSJLwAAT1+xUxG5SjZdckBoJKFcpTbSIjP1xdZW7xLzr5bGWITI34
         pSivQ9sfFlq7xpVCBH+Rx06ILk++loQV0Telhn/iOjWImuvT2fbM9ZVuZD0jKMblUxtq
         0IklpJ5PMv9UfChE5A8moemynr0lJfIDkp2wN3/FeXLJlEra15pmrQ+m+DqeFB5WeSqm
         kzHC0sGV/elzyTU9+ZTeT9C9c88BgX7OfMAmIfguwAOvy6hLhUFvaSlTteinntvsQqNP
         tPMz+8bl0q7ZzdjyW5ymt0UmZJsE9Wb/RCj4t7mjAt3muliJCZ7sTDqrcSR87bc5GbBm
         Puww==
X-Forwarded-Encrypted: i=1; AFNElJ9znIYJihYJlbpZ4z2Z2bz15E8xeEg0/l5SZLmOR3Tsy8Y6Qmu35yrpXlI1pisS5i/ZCIGm5iBb57CL1TGugc3uxk34@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92TO5o96udtT3C6eMgsi0dTXn/w6lPfOZ2sH/yxS5NqF4zXkE
	LPDjwbiVdYRwbr8fQnh8fyd5l/kXY/NMJnb7eEPbz0Srs58OHTB8I4MSyh3e/FmM+nn4Kujoz9z
	vqk7LW0V6uHbrpKIic9RYDmJ9/DVdZuGBlQnrlA2JuRkoC2pfpXtM6bDE4lASH/H6/TBAI4iNQ4
	OhiZo/CakJZ/4=
X-Gm-Gg: AfdE7cnzNqrH827A+gofEoPwkNC1ur3ybGxaMRBOwTDwiOAGe1imHXCQt+iWMpS5FlX
	rLi83Vjl28orPd61tF/D96f3xeGJlVXKUh7pheXOPyez1h4y4PGB9L/DCDtQmxeE6wLZ17HOk3A
	/MDs/GcwnVI//eW+elWgU2TwwFUVZpxwV11ggBae6kolE9DePQ7F/+9leYctjOex4FHvzij6rIa
	KdL6mAcOJDGglU16kRnFVP3ObRZf7zP3uF90wzC2AXxeg1ED4DiWw5FXQ3hp4B5cnogXc8VwXMo
	f5hAWucS88s6WdpObFNwembs9STVZhRwXdmgILPF40Rjr7laxZ9Ip9jqd7okNgnESS2s+yoUzma
	dp7yWb4aw+PJtBvwe+UcXfs5n3HdygVEuJcGM7QNQr9Y=
X-Received: by 2002:a05:620a:390a:b0:92e:68f1:db9b with SMTP id af79cd13be357-92e696e9173mr787223485a.16.1782902237880;
        Wed, 01 Jul 2026 03:37:17 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:92e:68f1:db9b with SMTP id af79cd13be357-92e696e9173mr787221185a.16.1782902237505;
        Wed, 01 Jul 2026 03:37:17 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:cab:bdb4:a76b:614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2bc5sm69130655e9.5.2026.07.01.03.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:16 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Wed,  1 Jul 2026 12:37:09 +0200
Message-ID: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DwMmPJSCk-yLi-fdMuONLgOscFw8hQ3P
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a44edde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXwfFUErdEhm9b
 gh/BIdd62ixMNpcr8a2Z/QN+MxSdlB7aKCfo/ayiI5etkIAAayACS0D+CarsaUqxW9ziX09oB85
 uXKAZanGUIIT/s/hYtePBSq26ektwu/ibLycgJedGPVbdNROqv7EKfx7XXNS13YMnCO+ZIjp3WG
 BjdHoxGabh84bxZ5vHgbbeJimGpDUIqkrkVxIA9QmgHEauaqVGnnW1WLu71sQjW5n3mGwWxo+WN
 RLrxo0+B4AReOuyoH9Gaqcs4Jq5bHgItiEeafgWB/5Wsu36gGMAyhhg0b5K6lcg+oeljSHL45la
 EbTGLghTTJC9W47pZdCVD5rju4xtrpMsn8fBZ0vtJ1vDqdwlEEixDowhqRvzR7VDoQRjDBAGAnt
 MJ92gkjyRVKabLtgifWwqyGRZMnqN5+Vu86OJ8gT3JbKyICb3y/Kcq6hRNDFVF/w5ppNIBjGgCQ
 /C+Lr36ijwsGHncMV3g==
X-Proofpoint-ORIG-GUID: DwMmPJSCk-yLi-fdMuONLgOscFw8hQ3P
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXxKAf185UTP//
 gzZYTmJ+3foLUPRpDO8tT4YXDU3XZH9VtTS1Js9KoErYxjOXDi/bL8MHktHrBRl+4UhFqxBx7Qh
 /StINpEMXO8vxPjzbQo4rTOHRI0vFdg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110

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

Thanks,

Daniel

---
 Changelog:
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

Daniel Lezcano (2):
  platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
    temperatures
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
 2 files changed, 197 insertions(+), 1 deletion(-)

-- 
2.53.0

