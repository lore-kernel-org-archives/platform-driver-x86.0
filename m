Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDFD381E95
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354121; cv=none; b=XtIuPj8DSGRu8PmMxVgJHNE2zR1f8eNUOu9Q0/Ae15QpmDdBih3MtnNUacIG1hwXW+NjfTnnRx6dpMjUUa6/mjhRxILkzWx3RqJcqgSWviHizG4/eLbQj/pbzYAxYUjHS4vrdNFuuFjkxrzm96rcO4zDn1kDkphfGF/DBJ09Xds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354121; c=relaxed/simple;
	bh=csBCDgH3M6DZ4OQcPp6xjLvnA/f4U6oeBWnobJdNGXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=myjErIXzTRsQTCliWFvliZLsXkdp4DR1WAAeOO0ervvACwQbNZi5UnDuGjGkjNkTB+uo3B+DGdK9NNcN/2cV9ZHZoij5G2TjK2eef03zSMNGneduv9N9juN2qOWWnzL5kjz7eSyXJFGRqbwKQWcAl3hFEErQJ50hklrUpf2Arh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTtGgCGv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dU5b1OnI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTtGgCGv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dU5b1OnI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFEG2809701
	for <platform-driver-x86@vger.kernel.org>; Mon, 6 Jul 2026 16:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pf9tIRdfDyri9p8ozQjkuW
	mmRnclsJ800KP5REMMFqI=; b=XTtGgCGvGdLie3cMoJt2TWHkM60JPxucgH2NKQ
	m3eOHlToTMrTqcRPG31j2BvMX/MAJ/BjralgXjuEkxaaZPRCcD9oLcqpHShg6eui
	AvJ7rLhVB/k9L/pOGHZCn2AQygYlVc8ek0C+byEVtHxJObWkb2EvNzWpIq2VQH5k
	F1/+ALVQnnEb7+VsWpe+e2IpcyNCGJaw7V98tVBzwAs3d7cxH02mc4dK/KqCN6o2
	hZH33woLbRo8cT67vkba1ATPeo/zDukD/m/2jnwxeKsZBwc4wD60/YOYMKqQhkYp
	bWD3HhZAqhdqa2RJrt1PjxN2TYlfLuMlLuHXX3Vzjh3GBOZg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsa6gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 16:08:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5be0cfa2ebbso364740e0c.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 09:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354118; x=1783958918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pf9tIRdfDyri9p8ozQjkuWmmRnclsJ800KP5REMMFqI=;
        b=dU5b1OnINFzA0L2L9K8Kkp5c946mtYMl+tN7rdVUGZQ1tHfb1skI5wcADZyLbLLuHf
         C6RUvbZXVW3C6OKcUoREdyfNzTm2B8zUT7V+uTzu2tmASQ79gJoC8DYPMDKq4fSfb5bp
         5JRUjm7wzNyW+UPso+9nhxdcur5Z/HZgmruA/KkKLlqrn0sBgpNgjOwj7SbOoibNaSC6
         pAhiu7mBAiCxjhLuOqJuF86916Gr1hslQzr7tZo0T6ybt5xY4KV9vmo/Xv3jHXGO4I5I
         IZYwMXyTqD8tXfPnTNKWn/WDj+R8LdFY4fGlIJfnb4Fgw00NV+VXoWk7kphEp6Qb90gl
         qlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354118; x=1783958918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pf9tIRdfDyri9p8ozQjkuWmmRnclsJ800KP5REMMFqI=;
        b=pEFgoxzU5JlROGojCVdd8gF8XrXaaOSWSKe0x9h36S2cqZYloIjGblEAwVBIpNUacw
         4XScR1bhRX1DqFvFlyo6eIm+cP9nnrInpQhKkk99DpERu769TnxI9c5QN1sNjps1FOjK
         u/WH8PjHiAqjlJ53Y9H4Vk+EKjsdOTV+1zQSWNsUxKEwfmHRVjdIqsNCv9pAZEtQYu+j
         V9TgeEO/owXeh9SdwfU2UCQcOwsWegHDUYTeX3dsJXa9Ip3ChKTAfs9pTvHotoyOJ06U
         XNfwnTOwv+4GdQutsTvXzygF9Ltyrmgl565gwgPWvoCN/x0xxt5MgHL7gDymcwrSOlqo
         Fbjg==
X-Forwarded-Encrypted: i=1; AHgh+RrXJlJ7ITt5deeSkKjDaP9UkpT7wDAry8EvpRMQPO5BmZA4rMumFJHTkj48KayY8l86oD/b3Dgh5NUgxdRBeNPW7x2I@vger.kernel.org
X-Gm-Message-State: AOJu0YwVWG8gxUKZpHNduoV6D2n5E6DxSHHMbIJrTxnSgKrhhd7QP1jo
	7OGtbvHCyRy5fH2DrkwUKkMU7fm69eS+rtZAviLww6p83NOe21lZIPzsly9KXdgFz+qN34Wm7Be
	Zc/Xu6JwrbtBxUW2L63EI6ybptRMFSfZA8hj6Q4lzyUg+dbiAXcRaU3fIyLinJYzCZQg9Z+7NqK
	5Y
X-Gm-Gg: AfdE7ckBXli4CJ8+irnTgqVtlJKGqpVUV3wT0lS3398xUN28UlS+Rzmxol57n5zEkLb
	cHb3EzEwIC49bGm5jlftZ97AeMbOd6weZ7aJ+h4cliWjwn/0KPR3r2jTzDpejPrMjV6zsAmIslM
	1LxOyWSlsWeDJhhsZlUlH9kCbl+Kb5Qld60VXILS5ZaSv++eN8lIkxjZWbhHb2qe+kQmrZozVXL
	sI50Ky4ueu7YfadUjZJeRXbfYbPc3rGqZdtTsxRFH911BQHy8WFeWbrTy6esqurySvVA5Tj1vL/
	kVjaYgRJq4bGqI4e6VQM+bLeGGIpCHOe2S+QQXdHMxl170+LYW4zJ4aA18+PJ4yx65sv7HQ3gn3
	h7S3y7dsLXGZLUDuJt0vRTmJzaFgPMy01GdYCitzUOQzT6g==
X-Received: by 2002:a05:6122:8288:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-5be907a7cd9mr685202e0c.7.1783354118302;
        Mon, 06 Jul 2026 09:08:38 -0700 (PDT)
X-Received: by 2002:a05:6122:8288:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-5be907a7cd9mr685142e0c.7.1783354117748;
        Mon, 06 Jul 2026 09:08:37 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8405:4a9c:95fc:4b8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm26071966f8f.9.2026.07.06.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:08:36 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v4 0/2] Lenovo ThinkPad T14s EC thermal monitoring and thermal zone integration
Date: Mon,  6 Jul 2026 18:08:27 +0200
Message-ID: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WSGLhpa9ia08fL9SWDDCWHl15j3vuG8l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX2xb24ERTNCIo
 d4LAooUcXHGNKdvhjCAF3oEjsZusJSoImz9vIVUNtQH0INCXu3WGoHyd1rjglK3mKEkMcmd4KaT
 C3WLxcfwep846dc44/it8HpOdGzz2Kcp8VdumlI5P6waQsbXI5+vid0xL7oTDF255/SZDp/o75G
 RMt3utWS3RpCAkEVTOFyNpSC0YnxJifaa3UElSGyKoQqKxOAXAQhDWeUchjHx1KVI55XpL4FpwM
 0OgZJSOFDyNtt739Pu84LUEPVk41gpZKgPErby5naLj76ggAkj1qg1r9lFN8e/yULHj+reFTc89
 6HArGOCkUkXmEvtCF7g6B0gbcMzSWWmKU31LJvDxmvViX0yyWShqpYePTZEzCAi5Ya1jn1W6aHN
 UKgAWTS0V+cl+ZBJafXT2lWXxLDot0km07pYdLIQzobcdkfRRJhxa9fQqI9kZtEOQ0EO7DuJnea
 hrsSjDXFMWGzvHgT0IA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX1U36IGTIJ/an
 +cUltfhxgx9waQqwT1onI6P+Zt0CouSud8fopXTnhuI+rQXZYeP3fDqtSHtZF1NSYHudhLse0s4
 Cz62lrX0hTknpOyFcEM2ZzYjKZkzvaI=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4bd307 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=Jz99LMs1rTwwAPREzXgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: WSGLhpa9ia08fL9SWDDCWHl15j3vuG8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060164

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

Daniel Lezcano (2):
  platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
    temperatures
  arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
    and charging sensors

 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  67 ++++++++-
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 3 files changed, 198 insertions(+), 1 deletion(-)

-- 
2.53.0

