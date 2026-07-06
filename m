Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793F2231835
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 18:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363635; cv=none; b=s11tJPvREi9hPFFoH1bCa9wr37ZYpV3Uqmqsn34JuWP/0bVBaQl141IBpasuy/RjeVbw1Dsos11laoEny2u+F2NxKObmVEaFJRRQ/fvTHKLdtYkuaUaRPePbSuFi+MVkj7KQlzpUcabn/xtiYTz0ihv0pmMcaOSO/QngFDPcQzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363635; c=relaxed/simple;
	bh=OON3yrBUBI5i3rZM45extf8vRKEwdthVDb37mRNgaew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hyu/D+sOmBNoiTHtqFP/3v5wTZbKrM+ssVVwhMnplZhMkPfJtFy8gdJLe4Cgrhij8nd630zy0EHOYWzLYJeZxhZiRQWQRr1IPPOkV7OQRnZs7181l4mmYa1mIcYQJTtzETk9BTdL6Xik96u512nrHaaB/kgEK6M9slx2BPmIMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoxLhzZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/K3k9MC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoxLhzZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/K3k9MC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FsYKM1050171
	for <platform-driver-x86@vger.kernel.org>; Mon, 6 Jul 2026 18:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m/XFmTzGyIFMHErJ6/N1l2
	U6wTYZjIQ2iUo/yEmDvQo=; b=NoxLhzZWpOQbgzSzi72hUJg4e1d+Tfa84aaw9D
	Mw2+dD0GWhxf+gHO6JrmHZocJLJG7tDHogeBouSiBReb+vb+u6KsNw45H53UtLl8
	H2DQnBbUngXLBTJVdTMkMajYgTQW7CErmO4vX5wvkqqE7H/4t+VfTT+1SdRUGX+Y
	XZ/eoacZdOEwQ1RRHaC7qy4uYkwg35Hr81z0KeMCov28IeTgS8/gLKtwP+Tcg9Qf
	e4kT7BNhIJ34Y/2Bb7tzYkXyLQGFaoAjVMCewMLj4FLXxpNqavLmlk4ujZSNn7cC
	8AgGIr6iBg1BgnMy4rrwhhwH7tsT3nAHZ9x+6iDObdC1aHtg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw0sag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 18:47:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso288603585a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 11:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363629; x=1783968429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/XFmTzGyIFMHErJ6/N1l2U6wTYZjIQ2iUo/yEmDvQo=;
        b=H/K3k9MCT1v88h1C41WCsT6kjoDU7y35/syoOgHDXzVrNNtmtWgYOFtkeobKzLlA1t
         nA55hHXIc0rqnWYCg27mnoRIXAolh8NJhT9y08BV+K4tkUkowXNWCzwMOh2ouhQrzDZX
         IhtJbmu5Bi06vS2BcE6Zah/FX9EilVoi6zQY1N+qHBi5pROpDFy/A6Qu6uYfIEnuDeUr
         rgzCo9NUYQ9VvNgv6uayCS93WV3uOcLDADY0mvIXvU5dIsABtJMHjoHv5HpWhDUQx0WH
         Z79mhJKL2OB3KwzSyAn3GbjxhRrGXvAB5zPKleObnl4Gi3WSYB+rPZ42ptGRCUsKlu2L
         UZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363629; x=1783968429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/XFmTzGyIFMHErJ6/N1l2U6wTYZjIQ2iUo/yEmDvQo=;
        b=gMJ4IdoBUiOWnAmy8fyHi05VOXaaPcz5K+nDsN6eY59YAR1Qd12zs4HlPIZhBb3rTU
         bWAgLniibHngXeGo2KXtd6SCBQid+rOtYZU/AnJ0JzzRXwaNErHLwGi40W6ps1l3AN1G
         FhLUC8SMiy8h8Yqf7xdKfIwmg0gFRCX4AsSycS6+akmFwg9FphgZDn0scQgFwIzPqChy
         H4rt29lQx4oYsDSapT4h9Yfdu3kB88wiII1kn/ILGEGbaGK8bLSlks3JauX1HPyIspn+
         uNhMZUj4Wxa1XbyjLlHB7Qt+cGjOXLvOsGnhaU5UIoGBihr9t5t8/KHDm3OUnVMXNBWL
         XUcg==
X-Forwarded-Encrypted: i=1; AHgh+RoMXLzIGlYZwd3DBmVgkX162Hami9M4RxWnmxxK6Tj1a0zKFg7XvkUXjOf7q1d6eUQh2pxC2jR/97EA9kImhX5S1D5E@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv01UQ408nWS1wRHBtsPyIyOUep1dfI6ejP3eHNdiVjyCGWwBb
	DoIjUiHzy7WzBnKG3F4budiTs8AUvMGSAJo1nO0DHWO+br4/9jTOzQs8rMVXNlcdfdtdJJLUZlB
	p4Y9nMO8h0kex476ajX+XtjwVYaLpzqnimM+ctY0hgiebM0NYjZIjyX+Q/SD013CiCTgfn/Zw90
	gJ
X-Gm-Gg: AfdE7cnq3WuDmUvN0j3BzZP25qAoLb0+7qzCv/mQgQwxxRTOnsu8txvSfGTidUlQQQt
	jTR1Fr0vcERiGrmvkrRAkJKZRDRnxMYAaSKc2xpKRTZR4iId7YgwK9dwOufSuggBLA9gMIqp9WP
	OGlx3PoPaGs86R8/483McUGn8hgdyhynV7uIglLxuU1yShPU0NojuR+xJO2Xjh4M50zSouSD3Kb
	pg+edOK925iaBF3EryKnddotcaOgWz4hlXHpw6FGbkm2LvMzrgw5bFiXxkHVSRkNviiyBggnLvc
	lRqi86nmv8YrL4jbhxql/JY6WsvMtOtG4DteOaQLI7mB3zTiJgehrvxXxpUbbu3o1IXMZzVomr1
	o3c9vYo+Tw3FlxSqswKvYS6MTqEUx0+EFKyUau531QTNlPQ==
X-Received: by 2002:a05:620a:28cf:b0:92e:5d76:743b with SMTP id af79cd13be357-92ebb600d64mr243762085a.56.1783363629508;
        Mon, 06 Jul 2026 11:47:09 -0700 (PDT)
X-Received: by 2002:a05:620a:28cf:b0:92e:5d76:743b with SMTP id af79cd13be357-92ebb600d64mr243756685a.56.1783363629086;
        Mon, 06 Jul 2026 11:47:09 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:07 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 0/3] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Mon,  6 Jul 2026 20:46:45 +0200
Message-ID: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX21ziHaIsyfdK
 ExWtfZnh0qQswrQn8488NbOXhG/24nYYiMQ+B9eRXMl6iXeh4ngn8S6aPjMkaT3Oz7/a3VLaSYZ
 dnm3flw+N1DF7QhUn3De2CSvTi0ctK0=
X-Proofpoint-ORIG-GUID: iEqtOg3fxlueme8RoQ1fjNHUxDT015Z6
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4bf82e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfXxdA3W21wIqFz
 9Ubzi5Vf/6TfLN5bPkFgNLez02Px6VzKRsK42grV6y6COgwJOFhyNt/KvqmKN5zulFFsY5So8js
 j3wmzCbsjsIavgmz6oHb0N16GK7G7onwZdZVk1Y7M0d/y/fsBYylFL8LOraQOJLv4r7mzNjpqr1
 PSidHhA/HEnoeu/CLlQ/O78pgVXRtyWa4V1iyYVBO3hBxVox+J4g8dNJa65AGmRReXN0kSb0njP
 Sg+2DEtFy6uPoEj1qscuPKXUjrWZghF2v7mv1jr0agC6E6Nylnr7jrFH3K+QYs1fO5vqecqsNaM
 nsvChCnCQsNu1Q3eXXpnjAWUp1PfYf1+2+mN/3q2puXQr8nDffKxB/lFYh4MIY/4VW/48plr8oW
 T4cT1p8gDqEy9NxDn7VAqbNuP7WyPghMfQ8oFdFciS47wGc6mJzGV79r3q2o4iETvJoF6glHKG9
 lTw2DAFqVPM4Heu8oDA==
X-Proofpoint-GUID: iEqtOg3fxlueme8RoQ1fjNHUxDT015Z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060189

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
	v5:
	 - Added Reviewed-by tag (Ilpo Järvinen)
	 - Added the '#thermal-sensor-cells' property DT binding (Sashiko)
	v4:
 	 - Added the missing HWMON_C_REGISTER_TZ attribute (Sashiko)
	 - Fixed dependency with HWMON (Sashiko)
	 - Added tags
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

 .../lenovo,thinkpad-t14s-ec.yaml              |   5 +
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  67 ++++++++-
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 4 files changed, 203 insertions(+), 1 deletion(-)

-- 
2.53.0

