Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00B53E4C94
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335328; cv=none; b=QVChXn8hLE/ACWbGsr+c0nuOLUpLPYBLIRuS0hF+i6nnfiGg4bLAoQoeFMVJtgAAXu/hAju5IxpoKO2foNFBtzWuJQwZ2l8mNhwqgkKo5CA9JfBJodz7I1x+HLf9T0Sl2k8YjLz8WzfX+1ndbvR0wy69KM6vjSiW5P14eR772Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335328; c=relaxed/simple;
	bh=Pjwum7Mu37SGUsunaTWf37R6DFsb2jzx4XAajClW+OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i5WI8660ECp0dQJ2E6PPa2fyTG6sZ3/LlUr/dgjnkJzhYrvKzounPk7T2oX845Ce9l6LYSyu2VseKMelPxbeTbkYAIolikyFFHYzRwnWxcPzTlzLxt+j5jfmjYx9X164HrqDSlyL97PdTTx3xjYlJ+PxhE5fDVSzmKqjPjas62g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0sSUk6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xt/+3sIA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0sSUk6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xt/+3sIA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJjEmL3746377
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU
	9SMM1MoA=; b=S0sSUk6ZPVpbTTVHkgCEqN6NrMf86QEsRvckN6CEFqZGTWSY7bE
	SatDPG1P2jUm4JortNy62OspvSrafgfp3ojHAVsdS3yrf1YHhlNg/37a/J6FVkBW
	ald8d97dEZg02qXft2Z0Aw+qoCAOSFP23TEndFxtQhCd5AZbPTVcZtbcmVM/+/5l
	ailHfBe35IQfwLf/KL/JU0kx8iHGfp9oSQ1uUFsJ/7n4QZ2ebanJ3sXwgO29RzlE
	kDZs8sxRjBYCMXd/HGtJk+WmlujnXxhrvKQswQrIKUXi2GiJZjGnBKe2WetBNmcp
	nDOoD3d7FPbycoelp7536s7jStneujENitA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d452mtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91e59716176so181861285a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335324; x=1782940124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU9SMM1MoA=;
        b=Xt/+3sIADniznDJADTMCIyylipdPmXItDJA0ivWXmTM709Rz2OZipDKJHoMTSu9vj1
         v5di1pbaVraQQaWaYzBPV3fjjhlyf9YoghcoP+QVo8RefRQ9jNDf91KGwyQ8ZteJY+BB
         Ydzvzz7lMtzN228Y8OEQrO3x7iEVKojgIvup2xEOFrz4GwXbZEnuHoQnUBqCS/t82nFG
         SyTXeLcPvkWL6hC4GWTZnQBEoJvPp+06H2H5PVcX9tFqJEyte7tnoOJmEkj5vtjA9/gV
         SH77Ehgk4ub3UdJ9F6UyqkWeivugDFu2nC8zaVK65GEnn1ZdVLr9Ts7WF3KAHXul2yhm
         a3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335324; x=1782940124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NF98u5m0GQQqjMpcochC97YunhtCfm5cQBU9SMM1MoA=;
        b=EC1gW4u3U5dabgcKRFcmOJIO+Z9vI2Vhb/JLboY6z+WEWaHhNoFPT4StXC2aNnT5dF
         WOE9cMwONZ/6Tl0xYCv67t7zLeiKgJItpXeT8HwwHnI/v32tA93iibFQzO1lb819IdiT
         H6dACJ4bKkYbl8Gj4cgmWls6skD9o85MlFPBT0SwatDFNCEM26cdlIj1iyXBeDwbLwKf
         yb05YECTET5o6JgqGrE0jMYuZMrsw3RES3Sr/cALDVD9f8taxIOWGMhKKa3YR8PKuM6B
         D9CBA1dRuDL5Z+KCpRi9181b/CfE09ulMqVJbP0u2BPw0xMJgTr3g9ZkRCYwBKXoKWLN
         DeJg==
X-Forwarded-Encrypted: i=1; AFNElJ//Ur+B83fmusqBB4LbgcwHA6qsf+mcq+2lc45c7IzUWicb6/BMRbVoO+6H4B7EIVHy46ZGBFnVa4l8hm6tJNEm0/Xq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/olOWcr6WnxDo525XyWw/cs4PPcAqVJ9Nln2de862fVMI/eh
	ZOD+PuG4J5G9AXNhaBUaHEv6wIvHViv43+ZrFonIDYZIKw5yJ/Xe6PB6+D3xgJb4HGAS6GLzLI3
	ueshaJVTyH8ak9CL9djqgfwYf+sEAfD3CE28vH3Pnlq3MQaHjawYAIrFAwMXkT/U3POg2smhOCb
	Ji
X-Gm-Gg: AfdE7ckLlJajdpF4BCVB68oPz0yMvMajCNT0245JuTOsmDXED8lf9hlNIKixHXK3F80
	RuEZ4KuAxz+pzJxrPI6hA4RsdP/d5DBMzqiY9UGb8+hLV38v9BrjMMKfAjOjnvJtEk9R8cDIVyo
	GLYyfY/4smuDQjNZpXVA8CRajqJUG0sJaTZwo/HpncWD0j2f3fdzwQvXHcU1HFN/gxmcUV9v+5s
	V08ti/IeboD0Ok8oqzMAonnETVMTKfla+WtT1lKGnGV8KYZTsuxRVwLo06Zznl0e48bLcxehj4R
	xSbccsEguMt19yhfmtt2mxgGoGf04HfRfIbCFB/WPcWXOxQITgl1TlA44w/vYybYOb16w2Kwf3c
	rCK6+EMcWmiLjHklKDDeZmLm8f4WkAxeZUgIJy0harietdw==
X-Received: by 2002:a05:620a:170e:b0:8cf:c106:faca with SMTP id af79cd13be357-921d29f8690mr3323306785a.36.1782335324241;
        Wed, 24 Jun 2026 14:08:44 -0700 (PDT)
X-Received: by 2002:a05:620a:170e:b0:8cf:c106:faca with SMTP id af79cd13be357-921d29f8690mr3323299885a.36.1782335323714;
        Wed, 24 Jun 2026 14:08:43 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:43 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Wed, 24 Jun 2026 23:08:22 +0200
Message-ID: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfXzOk/j4jg9CvI
 cyU21wTfVQW6aNVcd5OvBLGnjQ2NqJ4zLln8CERNMctKW9szpxB7VBQEles3sAuJGycrR8mCkJZ
 S1IyzfkX3LJE+YBmra02wA7gMbm9t23VtS1W8O5P5Po/DuyAOmCrbYaq/meShXeGT58Za+1vGs1
 yhB4mt6Z7aE+c+19o+oAW5RiwPZPn9VDKRz/4oqvb0ebGu1EHWsep0hAabRdnsBQi3aw8Khme5L
 kwGD3jTabMtTfuVFnmSFFbF1zmdf5CDdluQPDFP8wgKo5MtOGuREbBq9lrjpfHOuf/RWxXXa0zA
 nIK9Pda0q9+HLdHUCzXAZpAx2hBuQkxLRolLEm/ruOIzNGcZpjgJKoiBuDZRO6/YkKJz1kU8jbf
 cC1BJQlPUTksCwB787Nk4wkdG9W4HNvNOiUU6nWG495OKy3rj7ndLJ5s392hcv3Rut2s3aRfNZh
 QA8vSWNhAXsfF/nm5Ww==
X-Proofpoint-GUID: wgTo9NPAKyLXI-UkM6K_4ZiY9VvMzJDR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfXxEXBkx89vkQR
 Hq6FYp/VduG6m+pQb6rnenUew9VywjuxPHY3fzI2rFJKPqERQ4HG75+jT5yz286qq7SCsg9tdFR
 Zjx/R2zDlLaajPAKooVE1A2xXc5EDsY=
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3c475d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=kbYhDkqKViOJv1L1JOIA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: wgTo9NPAKyLXI-UkM6K_4ZiY9VvMzJDR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240177

Hi,

This series extends the Lenovo ThinkPad T14s embedded controller driver
with environmental monitoring capabilities and integrates the exposed
sensors into the Linux thermal framework.

The EC provides access to several platform temperature sensors covering
the SoC, keyboard area, bottom cover, charging circuitry, QTM module and
SSD, as well as fan speed information. These sensors are currently used
by the firmware for thermal management but are not exposed to Linux.

The first patch adds hwmon support for the EC temperature sensors and fan
RPM reporting.

The second patch wires EC thermal notifications into the hwmon event
framework, allowing userspace to receive alarm notifications when the EC
reports thermal zone state changes.

The last patch exposes the EC as a thermal sensor provider in the device
tree and defines thermal zones for the keyboard skin temperature and the
charging circuitry temperature. This allows the generic thermal
framework to react to EC-reported temperatures and apply standard Linux
thermal mitigation policies.

With the latest patch, this series fixes thermal issues happening on
this platform where a kernel compilation leads to a system reboot.

Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).

Thanks,

Daniel

Daniel Lezcano (3):
  drivers/platform: lenovo-t14s-ec: Add hwmon support for temperatures
    and fan speed
  platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 +++++-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 193 +++++++++++++++++-
 2 files changed, 255 insertions(+), 6 deletions(-)

-- 
2.53.0

