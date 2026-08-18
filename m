Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A74472772
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 12:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056110; cv=none; b=niJmUL3hlvW13nZiHncKv4SnwbDCQHjqQz89bi8h+8lXDH+sp3irk8sox3l++7gsJLX4Ac3XwXyZAuCL/72zkF7W0tXyY/t3RzLIPtpjAaLAMO5GsDlloxQtl2zZAq3WK4g7F5Nxd74NvKdKcZz2cTbvOLCEkDb3qNB+lQEc7F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056110; c=relaxed/simple;
	bh=eZFaY1BIWpVfZ1tIZcvPLZUtC7SI6Wv64YTWoPjqQNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B/bsywKbG5wO7zxFNIuMbpgVcoc1zIjCC84y8SY/vSks69mQlI1ju6Yl0XC2Be2D784OxtMEAoZYZCJ/icPQrbCSnsOCvWocuqfKVPNog72qRVGiuUAS8QDlIrtnp67aUc+GcnLb9FARDldfEErd3bN7dRn2aHzpgPZyAnkpl9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCRSsWZC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlsHZ1TM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCRSsWZC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlsHZ1TM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABU2j1021622
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 12:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MjJ1zqQliwzDjauMxfqUWywTg2iCdsplnTn
	CF3Oo39s=; b=cCRSsWZCxozlrqntdFvFJ83+geknQ8Lwcmbktve7zKdEANITwv+
	45dQzit1nafMX90wNC5KuhV87EUM71iUSJXrzpbmjvo42JrUyWlxTx02EWwetNUu
	3ucr77j9YHEwgJtLCvilr3dZLu2WSpGpns2PI+qYeQRkBOa3TXMlvD+4wiPsXHoG
	PjkbW+f3mt/wV1ODj+yU+7eeM3z628Xc4//DHloI0pcJDBisFh4n7QdBjGsCDJtn
	jfjRaQHddnFGUn4YIeF3+hUaMH7iDnSYA9ScFQX5fPxH2DGx8DjpOnDfUd7f3zeC
	6cTT1fdu5uN57cMpD91Ab5rgjxx3gIJ0YAg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0unbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 12:28:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso416217685a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 05:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056104; x=1787660904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MjJ1zqQliwzDjauMxfqUWywTg2iCdsplnTnCF3Oo39s=;
        b=AlsHZ1TMrbyNbG+AekrbQpdEnmrkEWoe/I1kJqnaZBftQjUFrCp/0myPB8V+MPS+0Z
         STWvLmUPeat+nOq0P4vwEQ3vlGYdQpBNXupkJgTPO3vzWyFwzeH4XnpyqnXr9t6L5lqR
         OTrx0QNGExUbbwQ3t0Mx+fHbI702q/4dJ8fBXAb47+UgXWcxVyezJ/9cffeKpFrj+FJS
         MuBh5SgbqvbMSJaQaO2vbCDdFhduS8xibJ1X+Z412DuW0KxV1bh1CnGDfdik1gEfQUoA
         KGPm357AY/69hUD0md64F5zMgtaQr2q25n9o7WTVD/4PFQCkI5NMnf9Zcxr5NIGQGLy9
         Pu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056104; x=1787660904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjJ1zqQliwzDjauMxfqUWywTg2iCdsplnTnCF3Oo39s=;
        b=MX33yCQo/k9y5xMocIpZpmWybS8Y0V8zuiDse7vcyd1KoJ6Atg5TzMk8p3sxnm1s89
         3osQ7OWrtQTe5Y62oL6scg5n1LS42ZYsw8CAkIOQKxq4ScDvHpR1fX6ozU9Qw/09PW5a
         dNHFTb6vtzLZpkcJYZb/mR43NxwS3ufORa4x7ozorWOng45eZYWzyAQTVqNEL7J7S3Ic
         9ArlcDR6yhI9adS1/bGUfjyBYan+UFu44aR7EKkjZj9ZN/vTIf/8nIyTtq6xkS/m7Fa2
         OQSTfKdLbP43msCN2HOWQ/aDXJXctTT+nZeXujT+XvYKGa7ubzo3vloumpraVyxT0LcR
         m/Ew==
X-Forwarded-Encrypted: i=1; AHgh+RqZaEaIIpdlbd3wPBpB/H6SvvvkeGnSn2QAbJG37pwInOXDucopvIgbWYej7HpJ6UuHQvSPBPxlR+0bTW5M6B7fDkHS@vger.kernel.org
X-Gm-Message-State: AOJu0YyNaJNG0kWqX7RH9IiIk+znlH5ArIDBgEwV7ki4HeIixdC4OUFa
	R9ttG+ijEzMckE6hEQrcWeApCb0b4yHsCitHdhj0gQTapPVKhGKbkjwCCk0v5zgNMcZnBLfuY5E
	xB3lq0pTKeCeK3AIvxGDfwWgrqQdybAEq+Fj4OqRI0BNrZa3NXMsRWgJ+ZjY6b7A3vgMUDrB2oi
	Rw
X-Gm-Gg: AR+sD119fH+U/QwLyPgbB2DO3FJn1oiQEN5bjgktW3kezpARyUUtnj8JUayrylPvru/
	KXJkghIa/IVaMHSeqcU2C4Lga/KE6cx3mCu2F6+pwvrnMKLqg3H8J8TRPE7mCtLJhfZGPxCJqyf
	EEIXWC/WEnaqbkKuGj09V3v0Dte/2FWO1j3H+0wSdJKxX5Hq2AtZSh9GX25F8AC3izzB5yxXlSO
	bEKubt6CO+0Cj7OYjOSwlU7XsQuoZ68Mz+QNbKmc5rDLXS5Fq2oWGz7xqLSPyL66tr62S4ilplz
	AdORKL7c/SR5hVdwCIdurVlHXuLKg0t0VMR0n5xADk/IV1TwakxyL0kgaley++hZdVL6epvtU7H
	xdqtXr4xurNBaooUl9+2qcTkSxEkWa0LtO8OSy52lC6KgzVnSvUkGfV+jwWncjQmIlP14X/tkTv
	VadriVvhsSc3HmLcY=
X-Received: by 2002:a05:620a:a2c5:20b0:930:fbdd:c242 with SMTP id af79cd13be357-936d234d96dmr2496474285a.29.1787056103983;
        Tue, 18 Aug 2026 05:28:23 -0700 (PDT)
X-Received: by 2002:a05:620a:a2c5:20b0:930:fbdd:c242 with SMTP id af79cd13be357-936d234d96dmr2496470585a.29.1787056103474;
        Tue, 18 Aug 2026 05:28:23 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fecb5basm174486066b.24.2026.08.18.05.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 05:28:22 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        James Alexander <opensource@inspiredexperts.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] platform/x86: int3472: Increase handshake GPIO delay to 200 ms
Date: Tue, 18 Aug 2026 14:28:21 +0200
Message-ID: <20260818122821.165541-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MiBTYWx0ZWRfX55wsruIGUOrN
 IHx3BpblAFKrI4LdoEGDtvs7gggyrs7v5XGA5AYvmXSz547SDb6ADoDLdWq4iUrAb8dVVEllxgW
 r1RJKjqBSSocu697dnC3o1NUbRst/fU=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a844fe8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=BEWJZVgQAAAA:8 a=20KFwNOVAAAA:8
 a=EUspDBNiAAAA:8 a=NkGqlDX_d_C5XZyMslwA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=r2lMSnxMdfrVB7dy-wwo:22
X-Proofpoint-GUID: h8d8R7jEMwP_VZVFDLW-A--HxvA9_GFe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MiBTYWx0ZWRfX6loVZk42CMlU
 udHD7hnh4JShEG6pR+JgCHJhwyZyopfX2b1vJG5c0jMvVrqaOZBm2C76CpPSo6yKklN6w+BxNXQ
 MG1io6YLAOf5TQBGqFTdiKfduT0hXb6Qoz2SdEBVZNUvcPGT7iyAN2ghyfAAxKuoc3gm2HLTeFk
 273Pk8sSemPyRKZQuoaKpDbR1uuJ75JMNKqlPeZhaCj4VpnzZDA7Ms+8z8aZfTWUiSvus2YUuwz
 zPegu4j3H740NspTV2Z5YUrQijtEjQuVZD5n34W4hTzT2equo/Jd/l+ADaNS4VE5Gil8WwoAsCI
 8CsgnTg09YBvr+I9nP+bM+4R2+05SlU9eg1eJN6Vv0H8dYdqjLGqS4qKY7I6I93XwJxzi39TKGC
 emVBH+Ra3OXLepY7pvOhSUxLnCg21dOANzZFtbh/4YbBNaHlrV4OwIZySXl7VFQ+RXWFkkQ3SSh
 12xXjTSCfQZAZ6YuyTw==
X-Proofpoint-ORIG-GUID: h8d8R7jEMwP_VZVFDLW-A--HxvA9_GFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180092

There have been several reports of the sensor not properly powering on,
on laptops where an INT3472 handshake GPIO is used. Both with ov08x40 and
hi556 sensors.

Testing has shown that a delay of 200 ms is necessary in some cases.
The handshake GPIO is typically used to signal an extra bridge or other IC
with that IC running the full sensor power sequence based on the handshake
signal and also possible controlling I2C pass-through.

It seems that in some cases that extra IC takes up to 200 ms to before
the sensor is fully powered up and ready for I2C communication.

With the default handshake signal delay increased to 200 ms the quirk to
increase it to 45 ms for the ov08x40 is no longer necessary and is actually
undesirable since some ov08x40 setups also need the longer delay, drop it.

Fixes: 30359c239ba8 ("platform/x86: int3472: Increase ov08x40 handshake GPIO delay to 45 ms")
Closes: https://lore.kernel.org/platform-driver-x86/20260816204247.2844986-1-opensource@inspiredexperts.com/
Reported-by: James Alexander <opensource@inspiredexperts.com>
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2333331
Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2333647
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Rebase on top of media-committers/next
---
 drivers/platform/x86/intel/int3472/discrete.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 6c729fcfce5d..f24add37fd36 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -15,6 +15,7 @@
 #include <linux/platform_data/x86/int3472.h>
 #include <linux/platform_device.h>
 #include <linux/string_choices.h>
+#include <linux/time64.h>
 #include <linux/uuid.h>
 
 /*
@@ -178,13 +179,6 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 		.type_to = INT3472_GPIO_TYPE_RESET,
 		.con_id = "enable",
 	},
-	{	/* ov08x40's handshake pin needs a 45 ms delay on some HP laptops */
-		.hids = (const char * const[]) { "OVTI08F4", NULL },
-		.type_from = INT3472_GPIO_TYPE_HANDSHAKE,
-		.type_to = INT3472_GPIO_TYPE_HANDSHAKE,
-		.con_id = "dvdd",
-		.enable_time_us = 45 * USEC_PER_MSEC,
-	},
 	{	/* Sensors which expect "vana" as con_id for power enable */
 		.hids = power_enable_hids_vana,
 		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
@@ -273,8 +267,8 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
 	case INT3472_GPIO_TYPE_HANDSHAKE:
 		*con_id = "dvdd";
 		*gpio_flags = GPIO_ACTIVE_HIGH;
-		/* Setups using a handshake pin need 25 ms enable delay */
-		*enable_time_us = 25 * USEC_PER_MSEC;
+		/* Powering up the sensor through the handshake pin takes up to 200 ms */
+		*enable_time_us = 200 * USEC_PER_MSEC;
 		break;
 	default:
 		*con_id = "unknown";
-- 
2.55.0

