Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD2031E85D
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397893; cv=none; b=RFFc3T65EGyIJiYZKJTaTMwh4WTPFBYo9On4Ra+KHy82+7WrCpzzmSe7YDyVjQ5TBGYwknuOWkHhY/iTY5+9BZMFJnsm1CZxisRjeMmc4RWl4ATxbnSDu19gSBMs2oKTwRibxUPnICRlp9w0i5MUlPAzs1zk+UIQ5tsVqbGoGmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397893; c=relaxed/simple;
	bh=mwRLj/BKYwOEvh5PR9zpP22AzgPNvM36YSHIopdRKAM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uRAaTN/pxwPISbNTLUrT62IwC8tEClkaJ1c25ZlVAQ6oisdFfJ9dRUQneygr1SWtlHQmADT/OsmsiJNOx2jX/IaNntHDOgk9BTT22WnYeTHA3HUael73ZtCJRTxFNI9cu1LgUNTTVYmpZ5Tj3thH59ZqoMs6YPPF6p6zc70kjQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8I2UAya; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDYQujFR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8I2UAya";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDYQujFR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tmiA3342992
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oP5NnId0MPcK24/x5K4oKt
	sR98OLMOcse7pcFjN77PM=; b=f8I2UAyavasDDOFj6bU1vnhm7f696dzeVf/P7n
	lm7ZJESn/SbPQ9EoPFDKY2TwtJraxsdcacduZ3m9XO9PoLKzckD+DsBYLFxhHiac
	P81qn0dO4vd6n58edWKdLDCjOvaaBD03AdRd5gKHjYKVvddzEmsIVDjEEUEV/1dd
	YziK61aiBB1NmoXaJGT8rQnyW6sbAgu+QjYJ0cV6avkzEQErtsoy/8ji8lD/ypBY
	cgnThSdbqQ+Cl2RMMEaXqBxAR4V6/+C+Avl+DFxxniY0n+rt5uFuDYQRc9LFC6Yy
	OpZ4rziJA021v3AS53Lp2cje6b3u0Viu052GP3oeOC8m6mNA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4d5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a0337930eso1454509a91.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 03:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397890; x=1774002690; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oP5NnId0MPcK24/x5K4oKtsR98OLMOcse7pcFjN77PM=;
        b=MDYQujFRJd3Shqb7x9KemLFz88IqoRaRL7TYK42wfiWE6g7XfkP2bdGt9OxVv+G2sT
         WjYbK8L0j6aVdeP8ZaSRIbN8oXCuBXUkVxK4lRUXGFTeb0bqFC3dGgYW+h1JrfIzGkIM
         OhwASIJ9T800wqBzhdQfYxGA3HuKv+AGfmD0z0YhCe0Nd2HMZm7agzRvRyYGDKWcnqns
         4aw5C9bcHFZJuQwrppshWVfdJHA1prWUboJHtcjiERYBs7dFf8FuXTGmKQezd0Dm1oG1
         gnLKDVH01884Ue9uR2HHRBPYXYO5A1qgJCDuOlPk9+4i1SzTIAizCge2SpKYCwNjHVGn
         HObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397890; x=1774002690;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP5NnId0MPcK24/x5K4oKtsR98OLMOcse7pcFjN77PM=;
        b=QtgGDIs0ymw5dIpb5ZA674yqCCnhKY7GcGnrNpVlUzUQKH9/2+e9PTOwEndzhtWacQ
         y+Qaiprj1uoB+yd5dL16vvPpzaKdxao6RD5VUy2wRSDXj+wjxZn1itmy89fPLv2LAaYU
         v8u7/7XRMDR8H60p1OxGJThN+9SYesgw3iaHaeGfkvczVTPEj5t2Qx081Wa12x8peuws
         ChUM/yTTLc6E9HIBdXuLKLlzumwKAoT2azrMXPf1s/l0RZb8mTW2JmYGmtmpnxcN8ckr
         Bap1n5m7eaIYR8wzOUM/t81LBBDn8dphlClT9+yGyJgfXhiiLYYaJjr493Rr+pBOyvoO
         cr6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfWlQi5osqd5uB+wQUrSdY0Bwrz47Wfj84oosvFWtg+2+qgKqyTctM+7CRzxsCDRMDGm8CPoHkcJDglW3Hn8bFidCY@vger.kernel.org
X-Gm-Message-State: AOJu0YxyaRR33XQ2jLK14KkJIyojZilEOylj7eIu0tP5QAlzs9mqiZq8
	XkbghMMniSxjFRvGPBNpS8MCj5VZj7ZCxk1tGB7jor+immooPqCCafOXF/K5H9FlDl8PQ96aJRG
	G9mofoS5HOklrnhr5A2s8reN16KLrGH/SYTzIW0fS6OMlLB21GyikYScMdyTBjOQzDGeNrgGo8W
	7U
X-Gm-Gg: ATEYQzxaKtHr+sv+d8ST6gOR28LNGGqxCu+wtC0mPbTkOoCYu+u3PdzPdSVYOLQBFUi
	WvlGFMG2twvmT54uYKd2IxYHcbosMhCde/SgPtZt89FlrLSoHzDU3x1xVfpbyC+jvEN8covVecQ
	PzJKon3kFtCZ7+H7H31LsX5XaBY6o6/Un9ZDt3JJ4pcVYC9ivcmMFE8pP5NF/46QFsrXzAoX6cV
	ZZjBgKlb6msk3rtie+05FTgiEVEA/WbQ8UscU6eAjfKFDkN/188q2/314lnDWknYOxp2j9tgasV
	HgJ99hd83W1zoNjYgbpuNsjYkdV+BYfaSpKQ/mw4ZHrmfaqsHCfioLRFEDzrvyz66SD6fDHRNy0
	HB6z9Ws8mORi6kRiTWAjfab6FVOY1/ondzYN2IJLUB20WYThpEoPgYFEJy+4O9yYdPoDV4EVj2R
	OfE1Yg+jr3FM9JtV6i6rNswauS9lYcNLaYtg==
X-Received: by 2002:a17:90b:4c4d:b0:359:f4de:8084 with SMTP id 98e67ed59e1d1-35a22055496mr2304310a91.23.1773397890416;
        Fri, 13 Mar 2026 03:31:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4d:b0:359:f4de:8084 with SMTP id 98e67ed59e1d1-35a22055496mr2304287a91.23.1773397889934;
        Fri, 13 Mar 2026 03:31:29 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc9454sm8604577a91.12.2026.03.13.03.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:31:29 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Add driver for EC found on Qualcomm reference
 devices
Date: Fri, 13 Mar 2026 15:59:50 +0530
Message-Id: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB7ns2kC/x3MPQqAMAxA4atIZgOlFv+uIg7FpJqllRSKIL27x
 fEb3nshswpnWLsXlItkSbHB9R0cl48no1AzWGNHM5gFi3HoiZBUCiuGpMgHDsG7aQ52dLRAa2/
 lIM//3fZaP1XmnpJnAAAA
X-Change-ID: 20260309-v04-add-driver-for-ec-3fa478f264d9
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773397885; l=2305;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=TTPfE74ynPJN9b0OOnOsT+rSVtyz9eUegjhUH7fvCBo=;
 b=3ZA4rgLhqraUUDW9rwTy5mi2UvBaO29qgScvpkuuazpoP3Bs4x4KM4mzdsOrUThZmUcDkZCpx
 Nvva5Dc47DQAxlLtZIdP4QRxL6sUJrUDicIiGD96BuFa+q5EKIdAKEr
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: IWI9ArDHMcQ2SEpnQ1NLizIXLX6N5Lwf
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3e783 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=TKT8svA-RhVekAZBPK0A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX9QfQ8+hdJoSl
 6RZxJbVRHZXIqW8Y5HepiSQsnXQ9puKMUEZme2P5y/iIF3B+GzOoNrE2ts3NGxzw8iFdZa6UaqO
 NS4/GDV7wCGhliq8UfQ74fVg/Q2oJDJM8+YKQjmCFw7CF8imhAuqs3rJjdsPq59ozbdAKSgwBgh
 /tOVjooA3SUiQAzCiuiY+VrSeZ6SCKWBAyfNlq74KzgtDRF/jSNsqgLVVj9vvEsY2Kppvfkywc9
 ymHh96z+OM3C/Qh2FsB/c0sfZF9sjCOF4mEQ7gpVwk81ys7GYl3jGC4GGb9zSWnnGUy5wevY5sC
 Cgkc1Fx37qhkna96p5qDjUmJ/roi2NoOjxjhySB59sauDCeYV06ZOgvXvV3sfvee5aWSuQIuZYr
 d8zE6Wxj+hyJN3qzA7FWXCDTlNuoyaeePmWo1hx0AeZZXl4z17zmdMzmRaQ+Ix7mm8rH93RBznA
 IlX1gbQLlfZ1BNOElRg==
X-Proofpoint-ORIG-GUID: IWI9ArDHMcQ2SEpnQ1NLizIXLX6N5Lwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1011 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082

From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the EC.

---
Changes in v4:
  - Fix fan count calculation to use min() instead of max() to correctly
    cap fan_cnt at EC_MAX_FAN_CNT.
  - Remove unnecessary mutex lock/unlock.
  - Disable fan debug mode on ec module removal.
  - Fix issue reported by kernel test robot.
  - Consolidate hamoa-iot-evk specific changes into hamoa-iot-evk.dts.
  - Add board-specific compatible strings as per review comments.
  - Link to v3: https://lore.kernel.org/all/20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
  - Revamp the bindings and driver to support generic ec specification
    that works across Qualcomm Hamoa/Purwa and Glymur reference devices.
  - Add ec nodes to Hamoa/Purwa CRDs and IOT-EVKs.
  - Add ec node to Glymur CRDs.
  - Link to v2: https://lore.kernel.org/lkml/20241219200821.8328-1-maccraft123mc@gmail.com/
  - Link to v1: https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/

---
Maya Matuszczyk (1):
      dt-bindings: embedded-controller: Add EC bindings for Qualcomm reference devices

Sibi Sankar (4):
      platform: arm64: Add driver for EC found on Qualcomm reference devices
      arm64: dts: qcom: glymur-crd: Add Embedded controller node
      arm64: dts: qcom: x1-crd: Add Embedded controller node
      arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node

 .../embedded-controller/qcom,hamoa-ec.yaml         |  56 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  22 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  16 +
 drivers/platform/arm64/Kconfig                     |  12 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c             | 468 +++++++++++++++++++++
 8 files changed, 599 insertions(+)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-v04-add-driver-for-ec-3fa478f264d9

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

