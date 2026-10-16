Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766EE4E50C4
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160246; cv=none; b=QNb6BSs54Xl77K+rx6Cx3N6YAKKMP14hbROpv07MBLN8nU3ZZKMOuXD16IZGNyXXKYbcCOVHceUFsI5B9nNDm2ZShBs+FE+SsE2MPQ/aVGSRJLaQdPecHcnuBf3YQMYa1lkZu5rSLHzM9Hj6zjk7b/1dSa7tAim9fdcIA4yU214=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160246; c=relaxed/simple;
	bh=BTAi3fbJSRwJQk5klyMMAeNzipYn8jLNqlUNA1g/E4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAXfzKcq+nl2UEpwcnCXGO5ODE6dKZ79Ht0xczlHzY0MLcol4MUyHBQ/OZOMTLwtYgX2sIjjo9yCHfZoOKnU9fuCk1hfsWhe2brj0brajKpNF96EDbyfmIxXgpXDhJNkr+dmDu1JsNLH/pNis1Gd+rd/p4El3/3CfiFH73HqUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFyF3oUr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cK/KoT0M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFyF3oUr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cK/KoT0M"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5qZ23577664
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lq1fyb46CPH
	Gh446aXhfkskJVnPuzZFSJm7kdyKB/2s=; b=SFyF3oUrwB+QVvj7zXdJ72pkOFZ
	ZwR40Y0/ytsmDt2fKeOEYVJ0ET5soHNbHW1kviADPRPbrOCXsh3OubkZCkZZ2UVt
	5tYWUibwx+VwYTaOfhmuxXVl5DL/KisaPEM3Q1lTBpr3sKL4htJoYPCqNW2qKnp+
	u7UcBm/xy/6Zv5tljxBEdfLK3KxtBLx/zvaP8e62hdN4mPRntRodtzrnlKj4+Ckh
	jS4Njfu4mvj7JWwpOdLAmc5YXI1il6alWoDcoMDEF3IWOblt5frl+nZoNNdbjb2T
	Tv3fJH8Hl+3qaXwF9e0jELzztgYvICvKX8YuLHCKcOdLpxOcO5OdKW2Q+LQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262p4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso197158185a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160244; x=1792765044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq1fyb46CPHGh446aXhfkskJVnPuzZFSJm7kdyKB/2s=;
        b=cK/KoT0MNhpwfRcT23DRy/AsntEN1+6fTqTeytrIhKlgjQBwFOPZ9u5k5TDeZPYNYl
         EewwPgKE2qBscwYjnoXhOBdysm3RQ5XCwj409jBPciD2X29TP08UpnHUJ3pWtDueL9ee
         4qIYJGUxAkpLoTbNzVt5NdD9CeqKOoOWgkMlrrYY2oB2C8RsbbrIHQzngTmdvOJI1QO3
         o+XpJ7/YjjsV07egoTzEdxDToxIbgMc5d8VYOjEJdijRXTH1wsd3wlZW4111dHZJ+Y0r
         319zbFe8HSVQqLGYiFhEzsrSZEflXDaU6hsX4z8xbcbfcGFAYqUzT0QmMMi9jOjjCxlA
         eXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160244; x=1792765044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq1fyb46CPHGh446aXhfkskJVnPuzZFSJm7kdyKB/2s=;
        b=zKxh2+TtE9wtI74s+VrtPxhnhqRYYqZrdP8xTO8Gk24uYALscEyDtZ/ebmLxRvyzQh
         tueMKDpYaMB9Mo7ytoeD4twG31rm1oP3mSBuXspZg8gNtZfpIyPz/Gnt0OmxwC+RUlUO
         qxmc3uNq8qrzMJuqnbRfLadTSQYm5OSHeQ7q4L/8Btch2cTRX29yebRQ4Knzw/jACyJg
         Oxwm8x8nuvo8mKhbTn1p8kJg0qh26NWc8JBh7KhNF5lMp5DvbPaMLg5L3L7Y4nz9+v6B
         vBpGriXyLmVxiIbtNbZchzH4BNqyG7ijFn5sRm4MqFhGAIV+kwuaxHOSFbHprJjJSKJB
         8CHg==
X-Forwarded-Encrypted: i=1; AKwUvBzpCK/hvffgJjcNzfR74DHSO2Cg2y4gQHFU0mmrg3ebrPaxo1SHlomLld41gMVGxKDTz8LorNTvSJPGpgpf7O7tzwmf@vger.kernel.org
X-Gm-Message-State: AFq9FYKwB3tlN3pxpEssG/+FXj+eYe7Lnk6QNrr04mDife0XFCixXpdW
	c9dO/gW/5noYlR+87dnxml5YC2k7ZioC438gMxClMyQ76IvToLqFh853enOy9vz15zrrdNvOwK+
	DvCuI7bnW4nyXhY35NJKwqzrYvVKzFcicW5C7MSbcFnKRAIFJfDIDQ5woKRNk3/mtrZ1D+SbZB1
	3j
X-Gm-Gg: AYBFou1sp0n3vqg9qAIlnl0P9FKc2WxnP+Sfu/A2H+m/yglcjyc/ho5dY2wYavwdCWi
	ePzdQiax70nXkmT0rAOdDoGzhP3yYE9KN3DZCps3b0Ly6yr+zsvKgR686hcPJdCBsylKCfGSArW
	G0xlIRVwiqvGs0UOEoEGbLORijJQOW2j5gKQKuxpKcKuEPxRwi6d73U6B2G5Si/+mbdYkZSKvct
	VfCgkFVVxYnTK/mSgke3HFnIJRKcO5qn8f8x6BK1DObKCMB76C4qqxcYSnXtydinhqr3acrI1SC
	RIeQ2bH2saP6F4NOV5XeBQtktakrqIs1PAFhEyRDRHO/bq0Wwru6n7hZkk0lvmcr2GqEaP4s5iw
	xv/N8LI+cCcOq2peNtNelrf/oCAWBxar8gYoX4bzIx/47JajnQ1npK0dVcmKur/b2pPZ7o3I3Dx
	RdtUlF8v2dlJpKfg==
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id af79cd13be357-93f17f9f371mr555834185a.37.1792160243596;
        Fri, 16 Oct 2026 07:17:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id af79cd13be357-93f17f9f371mr555825485a.37.1792160242972;
        Fri, 16 Oct 2026 07:17:22 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:22 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Alexander Patrakov <patrakov@gmail.com>,
        Leif Skunberg <diamondback@cohunt.app>,
        Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/5] platform/x86: int3472: Add support for DOVDD and DVDD GPIO types
Date: Fri, 16 Oct 2026 16:17:14 +0200
Message-ID: <20261016141716.130220-4-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad231f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=1kVSyC6lAo2a8Bx00SMA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX+MVi7APWkc7l
 dtCAOTHqk6Rdp2sB0KSsRY5vWx3b4XmoL4sJ57Fmd61VWKNXyzZXCIbgWjhd7vZTXnAGJCEyNTo
 Gw/WyEd1vN+fn3hFI/RIWCtZxcMj+k2SUlgTX+BUpwGVOCg5UfC8j8C26f4kPuefj4ywtdXfvXt
 stnH0NuWW8wq1EMpMHdf+k2/yL8rfuoTAIYFIYdIjCWKIIFn+f/hdK4ypq0jysxHni1vm8vYHdg
 08oA6a8e9ZtUvlbvoB5qIl6kHCkRXSiIvEZqP3IXxlMlhcwlsg34D3BVk5Z6sA5JHD3SvhkUj+k
 x53PX8q+7Ru93QkHjPWdjBqtl0Ii0Dw8oqyEW8k2gD53EXXPJYrhKKorpmE47x1EGXppyzEU+hc
 vSmdoAFaIih4D8Q/6WaE31bOnm2otAgrVkNIdDrI/PIb2Y+TQXFrQgqymUyqRbINvNWIllYOsO6
 935XB/9CxbMXzjKycUQ==
X-Proofpoint-ORIG-GUID: 5q7nTjhChoGHm7fs-j0cwlmd94kCBWnN
X-Proofpoint-GUID: 5q7nTjhChoGHm7fs-j0cwlmd94kCBWnN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX/WqTXN5fdaR8
 +7aLDn1IeP+EEF2kkAs+r0ydskm3Fob8xHXi/FtDOhQE2yoYtHpPYdKmT5I2jMIxD8HZ0nvCyOS
 4td/AoLv81yLzmD2v/jA1RGaylfUPqw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

Add defines for INT3472_GPIO_TYPE_DOVDD (type 0x0f) and
INT3472_GPIO_TYPE_DVDD (type 0x11) and map them to regulators with
matching names.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 12 ++++++++++++
 include/linux/platform_data/x86/int3472.h     |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index f3d6c6ccad0d..046f93ed1c9f 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -277,11 +277,19 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_DOVDD:
+		*con_id = "dovdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_AVDD:
 		/* Should be avdd kept as dovdd for now to avoid regressions */
 		*con_id = "dovdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
 		break;
+	case INT3472_GPIO_TYPE_DVDD:
+		*con_id = "dvdd";
+		*gpio_flags = GPIO_ACTIVE_HIGH;
+		break;
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
@@ -403,7 +411,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	case INT3472_GPIO_TYPE_STROBE:
 	case INT3472_GPIO_TYPE_POWER_ENABLE:
 	case INT3472_GPIO_TYPE_POWER1:
+	case INT3472_GPIO_TYPE_DOVDD:
 	case INT3472_GPIO_TYPE_AVDD:
+	case INT3472_GPIO_TYPE_DVDD:
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
 		if (IS_ERR(gpio))
@@ -430,7 +440,9 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 			second_sensor = int3472->quirks.avdd_second_sensor;
 			fallthrough;
 		case INT3472_GPIO_TYPE_POWER1:
+		case INT3472_GPIO_TYPE_DOVDD:
 		case INT3472_GPIO_TYPE_AVDD:
+		case INT3472_GPIO_TYPE_DVDD:
 		case INT3472_GPIO_TYPE_HANDSHAKE:
 			ret = skl_int3472_register_regulator(int3472, gpio, enable_time_us,
 							     con_id, second_sensor);
diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index e1d5c4915ef7..f0ec2e7c68fa 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -30,7 +30,9 @@
 #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
 #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
 #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
+#define INT3472_GPIO_TYPE_DOVDD					0x0f
 #define INT3472_GPIO_TYPE_AVDD					0x10
+#define INT3472_GPIO_TYPE_DVDD					0x11
 #define INT3472_GPIO_TYPE_HANDSHAKE				0x12
 #define INT3472_GPIO_TYPE_HOTPLUG_DETECT			0x13
 
-- 
2.55.0

