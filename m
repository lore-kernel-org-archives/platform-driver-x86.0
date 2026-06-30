Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982C543CEFC
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831211; cv=none; b=rOXOZu+Vhk95ySIk7qD/GmyHcZ49q4fP4QH4aP0A3tuiCKLBnnNt0aMJmSRuPgwCAPVJwdWdCvi2IXaCvzr2+9wGg5EGsehmGvfizv1ehsgM55DO/hY8mXUOsIPpHDOMSLauFS+rGhJ57vLJrkIbN3c5jWYT8EZdEFqYhLaqbMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831211; c=relaxed/simple;
	bh=1Q1Xitm/BqGT7JSfwCpKK+MdBYH7XUEoYH8AR342OtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D+gJhHDL31oDrUaMR0VPu1wVxOd4hD/VnwKEDqjTl5XbPk3C9pM7JNZ2eDIJxjLvWahxvtBUgHgWoYVrc3/XW55Ol83A+1xI0DtSOm1rJylsNlgfyYcKZ//lSPtMoBV7ukNfLTG1tDIpjqRO3KLkPiOMXotMVM/Hief13T+53os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqHxwc+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOWuWaVx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqHxwc+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOWuWaVx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDJX02214549
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 14:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rPpd66k4pbqs/wZxixhFckKv13OwjDsXuyO
	HV9Tkl50=; b=OqHxwc+tGH8iXXh3rjk3vM9/Ijbh+Cvivq+7wlOxq5AnjJV8Rgo
	Gx7IWZ4k9kRCNgbhXNq3nsod3WqbPuQBlRzvRMMHLtTcJ//DIe+PwKHQn2XeiIWN
	ri8iIwy0SeqbJYuaOdyIHw2BEbahKYFDUJ9p5Ci0W5K4/VIg2kdkyVwnKjnolilP
	oq2kQ9m63zF1r1NT2Thh819BumIS9UAVi2cVDX3swSH2i8An10DuuXV7YozJh1/U
	6DGZvn+Yb1Gs9ExG5aFsvLzqdqcTcoNISop3RjkqTqXjt3DDTOtMkuAwLzeZtbeU
	+wFdn/Jtws0R02CcWb0UKqzN9Kbk+UjTxAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5txtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 14:53:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91ed0e140c5so812852485a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831207; x=1783436007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPpd66k4pbqs/wZxixhFckKv13OwjDsXuyOHV9Tkl50=;
        b=LOWuWaVxC65yrUFHBCL/cVAnbj/mQFXFKzo9+VA9m9bAGFNJZIVLfKgseWKUzi8rZa
         xj4AnCWY0fVv5ItgIWls8HEMdxwCTr+I3gfsWLmTKs1cbDoMkL9C/OaJe/dghNuQepPQ
         KBuhMKChYAb+LN8fhpxhnGFF8pdFFiWPOynLnfW3gBXYNjzkld17rTUYHbRw0l01OucT
         AoutUL9geC/WLLSGPtCavv+JldHD31Ocu1BC679wbdPQTmB7t2/07gqZEBeaFk7wXkHe
         ehTeTXq8ZxuSDGUY6Z4AL9jiJX1ibowvtuhWQYTngLfUvfyZBKYJHvlEwFGS9Vhrj+Gq
         AkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831207; x=1783436007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPpd66k4pbqs/wZxixhFckKv13OwjDsXuyOHV9Tkl50=;
        b=Z/kWHISa7C5el9y+qL8OgPbEvsVtEKhIDCXZImafyuRHr9ew3XJuyCtJGOlrVjYmV6
         NCjiFIxkaOcjBKk45S5hiXAwTM3laVH/Y2XpGEJMl7sF2UyQQlDoaIIKWfVQJM9Tp4sO
         VQrNU2ETV1BDpAhyFjvt8CJcrf+aKVYiquMn9xnQ8Uy3J9J623HhH49OSA8LEufdTzt4
         w2HsIyfKSaPb8ToYEcqpRfq7tIaiIyojKM7O+87UQokgaJEsmE1D4yKMVxjYmGt2fjOa
         KZJ8SsPHYPIrnjee3ppDdaTyOo+QxEUGjm/SnejRnS7A3fqfBNhjDd0EgwRK/nD3xyaG
         vLBg==
X-Forwarded-Encrypted: i=1; AFNElJ+C25vy+AXAeY9xj3FqXFcdhWPYnJcYU36VBFOht3feSNxJeTVW2H0Tt/EvywhwwCDbni4Py4RaYoe6fCQ482UGnxSP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy7sLC005bTFd0s3upkrNzNANxcTCDVHE6gyca2DcbtvY6iqI/
	KMkz7rswkJcLY1uQSROHp8gNz8cV95jor2g0chMwOxunqrFZOSZv2m5Tt6XjHy1s2TTAglfyhzW
	XLvkDc2pD2ACP7hd/IJNDw12qwa/ssVC36bmoSR4dDpPcpHYcygRizS6GbDgx/wEAcTsIJn8sHV
	HYRrvUsIBms9I=
X-Gm-Gg: AfdE7cmEYxjEPI0kxpWhF70SWWBu+GZxSxEdcQYunJMkrLxGNu0FsoRN4bdUTmBuOhH
	MzP6727PcTk8IMzp+CouqYZ7dVvsX/Xpgv1PzqN4AAj2SwSXuBj213ufIIDszZJj+GkVdCWuoAO
	5woY7CetgrI8hiQlCXEZn289twaSQJ6WpttfMKR2s+HqMyrtL0aDq2oT5p5KtBLC53Az0uiJCjU
	FMNH+BvCSuyD0Z5LGqgGc6Cj6O6JAWN1UB7pLLQbuwWGK+pWJxjihr7+XIIcuYQjBz58m9gvbCf
	hiKJVUNw1gA2CVBa4Lll0DhiRP6szqcIl2XEjpWtAv5dPwHJozWie7+v5sdPN0UtGZFpJ8ZOWYk
	wHwmu032SzLAJoEWfDXTKKKit2tISC0uTSkSL1Kei40iBOg==
X-Received: by 2002:a05:620a:262a:b0:92e:5cf4:9f1d with SMTP id af79cd13be357-92e6d813bc4mr167233285a.23.1782831206652;
        Tue, 30 Jun 2026 07:53:26 -0700 (PDT)
X-Received: by 2002:a05:620a:262a:b0:92e:5cf4:9f1d with SMTP id af79cd13be357-92e6d813bc4mr167228885a.23.1782831206202;
        Tue, 30 Jun 2026 07:53:26 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:5c75:21f9:a642:c358])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm720295e9.6.2026.06.30.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:53:24 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Tue, 30 Jun 2026 16:53:04 +0200
Message-ID: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43d867 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=BPc3F_TA1yA0jLc9_u4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: FtfMWljWjJ3r899fV3P-c3jkCvAwrMQ0
X-Proofpoint-ORIG-GUID: FtfMWljWjJ3r899fV3P-c3jkCvAwrMQ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX1l6FUd5MFDc0
 B8SgLo5HXiDTJZsu2Ip7E0HhzUpshXITarmmFzgQsk9fsqUBeoHbfjqgCE3Rf2zlDtVAMfCGvn3
 LlyMlQy/F57Vri73xOt8Y1sru68vZppGZLVmTGtHe2lS8EfNoXhopIt0dagRMwbGW0vwXjD1Wu9
 D9iqQlhSep+NBNxSxPZ5ynX1oeF2Dpz9hujJj66c69goz169qMnX1R4T7/tuNkHP/JOf7cRF/QV
 jySIWzuIdppxnWuYxl8iXRxRGtz2bQXzBScj4s9ch4WMcn1NUv+DzGV/ZSy7DetzMSc0+9l6vL+
 meCEFr2sauW5Z7g0mqLhga+TjKOi/zs7u6Id6rKeqIp+bDk0hSkKggsjraxJ4TjW3JlfVTeeCJS
 ZB8inB/DJPVLGP7y8th1GmPsbQk8d4ymrdW50CNU6BaECb97EBF5m+2/3H19tGdEmrh5RysM0IU
 L/6EPNVpPbGcqUGQKPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX4QJAB6nlpviY
 xL3xR6q357wvF1zmskn6nPxe16aa45hKsXpE7FeViZ/XDVOYWTPtyZAn2ZgOebqXr7v9GruASj2
 hbJGNur99flh7fjgkU/Em3f6QjN/Y+Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors
covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
module and SSD. These sensors are currently used by the firmware for
thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors.

The second patch wires EC thermal notifications into the hwmon event
framework, allowing userspace to receive alarm notifications when the EC
reports thermal zone state changes.

The last patch exposes the EC as a thermal sensor provider in the device
tree and defines thermal zones for the keyboard skin temperature and the
charging circuitry temperature. This allows the generic thermal
framework to react to EC-reported temperatures and apply standard Linux
thermal mitigation policies.

This series fixes critical thermal issues happening on this platform
where a kernel compilation, or heavy workloads, lead to a system
reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Thanks,

Daniel

---
 Changelog:
	v2:
	 - Fixed patch 1 subject prefix
	 - Removed the fan information part
	 - Added HWMON_T_ALARM
	 - Fixed DT change description to reflect what it does really


Daniel Lezcano (3):
  platform: arm64:: lenovo-t14s-ec: Add hwmon support for temperatures
  platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 174 +++++++++++++++++-
 2 files changed, 236 insertions(+), 6 deletions(-)

-- 
2.53.0

