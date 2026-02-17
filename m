Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB6D36AB5B
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 13:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771334631; cv=none; b=qIp/3XdZZqV3Gx+dYjOciGe9Qorr1Nj4bYfCD0QQ0mdZn44cL75emVGcOPra8DhN6sAcbsuToipAcjxaAYaKTmzcOi8lKcTn3oZtxrk7e3ZEK0CwIaOOjimBY0p62IdxcZf+k000XVbgs+YCAWpza0cEIG8lXTmMiWHOWs+3Rr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771334631; c=relaxed/simple;
	bh=WYGzTKyZX7OF1dwTFThtmJQ0btzsDlxiYt/zQpsf6ww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CF6YHhEPpzOmdUkv7Qwxv29LnYzkdPxKkBj7KT6JzhFczK/TryAy2NJyUCk3ezFZSlzntag48Enk42alIuTZhWHxGG3dH47DPsRcUyPYcV2PC5uSMPTHdGBXinEvku9Fzd5vKw/fFmYEXXty3kowZnApy9GVrrpcMTXgnkDGVmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HicUXTMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ybf6hZ/D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HicUXTMp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ybf6hZ/D"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8q74B048861
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 13:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M8+9ABrPVxtJB0zUlg3wGqD8JRmpNrBlJsO
	/cqLY3ZI=; b=HicUXTMptDiBjMPMWAWJypQKrU/OBe8Sz9djrTVce4PNWaCW5JI
	DIdNwVh35DKDNy0MUac+i2ui4WN9o85431A7EQCyNMrKuP7j5wdGruIHeXxV6/cp
	Z4sBHULdhUFGXMBY7ajefdpIP4yNTjhPgVwCXybDp395nWCJG5Yqga16Xm8azEbF
	IbwBHyaKRvV1fEHVINsWVrYAmaTjlqa5XlcROgmUiQK4ai9aB7Za10o3lzpJLZj6
	MAezcHoKZ15hdQLLy+kgYvMvg5LFT5Z801LhV8w8Yv4D/rUq1ls2grXgFn8e8iFj
	odWiyn0ePc5DNntMzQCIwEwGsJQQc4dj6Kw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d82gn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 13:23:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso20080585a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 05:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771334628; x=1771939428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M8+9ABrPVxtJB0zUlg3wGqD8JRmpNrBlJsO/cqLY3ZI=;
        b=Ybf6hZ/DHOZaH1aFkBFCivJ9mHs3rUXkwemIzVeIvCYFBX4mK6mVWGPkE4gSiZnuj4
         2xfYP2Nqz9TcbgyLIGMNFe1Xk4S7/cEjVmOHZ03Q/LDOyMv+sJUeqZMAFqCEvO41GDRh
         FwgLYxudcnKsvdG26LpewfpF5dnMhtkJNEAoTxFwSdKXDElTdydpvQHMDojhhtak+7b7
         XkGfOgQ8jZeoJz7LVvLt1Jf4zb/VeVQYI2nUrkRUoqH6kp3naMnegqRLvdohlkHaVF6c
         v8KwdUcZYk1LIdNzYlODGnOOB54AH4i4EaZtm3pDWR3T+OrNDmgUIGNhnjp53tf37cqZ
         +z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771334628; x=1771939428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8+9ABrPVxtJB0zUlg3wGqD8JRmpNrBlJsO/cqLY3ZI=;
        b=DoThIo/gApKwRs7C+/pWnUahrot7+OLruGi5RO84pWr9Z8ZJk6lVlkvHJGEl2Krsio
         KPXo+RnHpYsCKVny0KJoVV1DIUaa3QmU89xEg8tqogPJRHc4Ne0uUnfWtTvzAPuQ+vYi
         AESMQbwTLWtgsTZTaHIwwfBpM/zPw84bp+UslB+Bou+O4VIZGxKi2SZU65gsYLROI/0L
         6HHSyx+NtBzE/9TC7A9v90sX7EeqVgQchO15xH6BvIs9ZEoNTQJW1f5jQwWVMP9xNKJy
         nrv5FWOEQ2yCaOQm6cgf2+uphyauWg8kUDiW15L5llQa0dnu4TlUUGIrOF6LwOM71pK4
         cYYw==
X-Forwarded-Encrypted: i=1; AJvYcCWqr1Wbg4HPsKtvfECBhsI+/6Amrgp0qogyCLZCbhs5N7FHfhtl7wfl5OI4MvO+/P5DHSpmrZWO1s4It8/tWGXpsFaL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70efi6cqPy2z60G3cfOL2hNMuOg8RL9RfnnTRrOG3xuyU9l2Z
	LJKgMoxRyAKnpdN8u9w78PibOFn5+2oRXZYhPoCRueTwLRXtWhJ7zdxF6daEboUPitYugk1MnED
	mkoQRyr2fWBCrNSR+csYb1VZaluvkvyh29h5qNwH+gSIGe8C1YEQDEuSuWALFRreVUZ8oeBGH0+
	TpxCiLOVYl
X-Gm-Gg: AZuq6aL/H5Otxpdsbg4GbYG2GZ+vUfq6w0zcrWoeOTNSw36PAC0Jcp84jBYa2cQKuW9
	UZV1VWYqsqQcCRNuFITA68bZoZWOw4TstDMqwz8PaJfptlExwulfvFlTXaEemRdc/PiWHvsq5WT
	SG6Sc/OgjULrxrRE4hRnJ1EyFd0t1pfI8WoYC8XzkMsKsAsWva8f+bbwdHxVyFhkS8qH/eY+G4n
	sv0XyfIcjnfvF2v8eOvvjgc9lSVXjy6JiLWZ1FonvBWxR7nR+B7fnvZe5w374qAQaPPYv3qYsx3
	JevQqI/Cz8oPyff+sIRNOfSPmsfucO56IVnVfRBullUNjX6E9jNEWp/pcdrUmRNZmmn6E/QBT3o
	FanMZihdAhOs+OgAcfvbPfE86AvFc3K1QAlYKAhQFoLdcIwhymhAPFNrY9Tx6SvjR+9U8qM9n1q
	INZOh0GHfWic7ZbGB4Iokx9RvJx63WdsquYc6T
X-Received: by 2002:a05:620a:bc1:b0:8c7:f55:2062 with SMTP id af79cd13be357-8cb424a0706mr1755104185a.61.1771334628259;
        Tue, 17 Feb 2026 05:23:48 -0800 (PST)
X-Received: by 2002:a05:620a:bc1:b0:8c7:f55:2062 with SMTP id af79cd13be357-8cb424a0706mr1755101185a.61.1771334627815;
        Tue, 17 Feb 2026 05:23:47 -0800 (PST)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc76278b8sm353463166b.33.2026.02.17.05.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:23:47 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org,
        Yajat Kumar <yajatapps3@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add quirk for y-inverted Goodix touchscreen on SUPI S10
Date: Tue, 17 Feb 2026 14:23:46 +0100
Message-ID: <20260217132346.34535-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69946be5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=B1JU46aOHVCPjXYBMNwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwOCBTYWx0ZWRfX8pcseiyvGD3e
 Jdmazcpm+6fD1zJcimCAFSMdxMmeNc1AbW5NIGMvFWBI2URlaXezaY4wqX9PNMPsTWaU4SCmkru
 47meim1WFMsG6+N0MWX2n0UH5sExvxrG7rRGH/vnVBVWO1GdKU8wXJoSSzSuNOWtEzpIPvHgGXq
 0yxq2ulIQUrg+8n41330V0/IRfvt2Tm7bM9kCRtXOzx1FHR14YR+0Fr0FXUySxiMh0sJilc//Dt
 QEoCRpaL8tFoOdtKyVxrHz0vlfwoJ6bg+OadfB3YBFUcwPgKmY6PpSzdX3F5m+F+rqYTMJDCesp
 1zAJHzsSuhLPNACC6tDMJINz2H+sEnjncuL2lqf/+pfQaJiSrn5SUP+e27VAg4qRs5jxQ8jf8Xb
 dfUuOEjuBDJ0zJoaOymiVsV24BqkMBqKTJKDsgqpReh3iLDUmd3qM8pE8UkJ2X4/6vbOehgKXMl
 jHHj9OfL7zQQiUIiWCg==
X-Proofpoint-GUID: l8aoJf_EqqGoR3gTqvO2yDsNk0cXcrfb
X-Proofpoint-ORIG-GUID: l8aoJf_EqqGoR3gTqvO2yDsNk0cXcrfb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170108

The touchscreen on the SUPI S10 tablet reports inverted Y coordinates,
causing touch input to be mirrored vertically relative to the display.

Add a quirk to set the "touchscreen-inverted-y" boolean device-property
on the touchscreen device, so that the goodix_ts driver will fixup
the coordinates.

Reported-by: Yajat Kumar <yajatapps3@gmail.com>
Closes: https://lore.kernel.org/linux-input/20251230221639.582406-1-yajatapps3@gmail.com/
Tested-by: Yajat Kumar <yajatapps3@gmail.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index bdc19cd8d3ed..d83c387821ea 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -410,6 +410,16 @@ static const struct ts_dmi_data gdix1002_upside_down_data = {
 	.properties	= gdix1001_upside_down_props,
 };
 
+static const struct property_entry gdix1001_y_inverted_props[] = {
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	{ }
+};
+
+static const struct ts_dmi_data gdix1001_y_inverted_data = {
+	.acpi_name	= "GDIX1001",
+	.properties	= gdix1001_y_inverted_props,
+};
+
 static const struct property_entry gp_electronic_t701_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
@@ -1658,6 +1668,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_SKU, "PN20170413488"),
 		},
 	},
+	{
+		/* SUPI S10 */
+		.driver_data = (void *)&gdix1001_y_inverted_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "SUPI"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "S10"),
+		},
+	},
 	{
 		/* Techbite Arc 11.6 */
 		.driver_data = (void *)&techbite_arc_11_6_data,
-- 
2.52.0

