Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DC838239D
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 20:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207129; cv=none; b=ZZ/nNmZLuQv9StqtxJIP5Etkz8nE7mxM9TSnF+2LLJ6H25tWkZhWI0JEqeMBWOINmMv7szUNm1lN4ELiB9mElhankFQfFD2I3Hgvy5xmw/xdmU+WNleu3e+iFnhVXZ8TKNElJQS4taTxTy42GhU99mi7duiX0Y5chpL8IkXc5eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207129; c=relaxed/simple;
	bh=KoM875MqjOkZrJz0ExLrVcdzN210PYBQHIAC0lXMkoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q7MX9jZ+GbKyrcnsaiNFtSOAb1tKQLy+09FYTbfLXIiH8Y56n2NrxL20ue2inmaYE/V8sprphtFcGJpCMhaTll70KWZvKdmY0sJj4xhr79zxsKxFaTwfDK/5IRZkf1GIbwQVKRZgH5vOZsE3nEkrjlnPQfy2zGxmGCfMs8xYg/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dZ34a0a9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cezw9Z3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dZ34a0a9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cezw9Z3M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIYpO8072428
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 20:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fOvov3iFBof+3IEdk3+r5Ak8IkGniwYunTR
	7sOwf5nQ=; b=dZ34a0a9cUnGOlXmrUz01p+ySlEmX33mCaiUKiBr1mqy84Z5Wyj
	TcXKBNf/59APyswXuZu+vYsgY1dRea3F3GkYrD5ZloJARzrlcVHgdTqViJfmNE9v
	OAcN3+JHLnw8n7JP1Y8xeTjvGWrxcivDLidOKJdxTCBQy600rssAF1yjDB9gMVV1
	GtMIlTZ9GSDF+zEyinhShSHG92g/eoPMJmkNr/tpg67kuZyfwbm8xb7uvNvBSGnY
	imvksbzxaGkuTS+2mQoO6raJM/e0qUFofnhf/oot+Z4+wdDApIos2ykXC+luqwOV
	P3RgrMNCeZS+GZrT0Ey+GPopzMWHED5lRig==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yaty35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 20:12:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938153538caso25112885a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 13:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788207125; x=1788811925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOvov3iFBof+3IEdk3+r5Ak8IkGniwYunTR7sOwf5nQ=;
        b=cezw9Z3MJBFxEkL7DWeJkC4dir70VPKrjKFwT1zOk3vSkNiU2fl/bJdVQY7ZNKVKnP
         jboR1CHmRL1Un2lkyXI337huKMHmnOfQKoAp2guCIiZJTNRJdjf/1Ram4mVeXXlKX1yc
         E9GRd13fX9hJ3B9tnZY/2b900bJYUagXJiSv229S67mmzC4ro0e9oJxAmAhILNRcPAm4
         YJPdNGoqpoi13o0oPS+C3MjIiFJJDyaqb0q2xTDrmMDsMvSSDGhNjLdXR/gCFV0RLEoc
         gPUrvmhdz4sMNR9J9witsu8RAh+F8GLcq5pC1Bpy5YXQn9njUmNz9ODBSF2feBw2Vo18
         lUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788207125; x=1788811925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOvov3iFBof+3IEdk3+r5Ak8IkGniwYunTR7sOwf5nQ=;
        b=M8K6hAnTfGFUvqyVcFh47qkmpfHvPW0dzpf6LAPTlaou1iZu8zCSpv3VBQnGYCAseQ
         bj0RNGVEFm70cM3GQXVegdQ6gqQ4vQglUYR5myI2ToVC7gm9d2JODV//HrhNjSQk5w/v
         v18PFfBk5lXzPHcoD2DZ5yEXRWaO7gugKrnbDaqmXnO3NsFFmcSvSkO+KhvmuFQ4v8FB
         EWtc9f0qhRnSSdL2H5wqnxSr2qijiwVe4aP4Qqp1jx/RVFm16rIDCeGcN0XWKglwJpUj
         MLxTg1NOd3Uqr6SFmsGPDlMvhBlZ/2IddCMMNcumMPHJAj1m7/Go02u0AnlP8T6aWFaf
         x2Jg==
X-Forwarded-Encrypted: i=1; AHgh+RqZ0qdW9l83eJIFZ3B+gIX8FrcgaH3ZhnVYR3NzOOwxbuEdC06MOLbuk01nfoMEJnVoIxyL7Pqntb0T2lt04+NpZdE7@vger.kernel.org
X-Gm-Message-State: AFuF++lmEiP+t6vGzqxNAmbw8VhyCMVlH5t5Pc6o2WOLk+CwhqP0FsQx
	oTk9AXOXAfUREIWWCrVtyn7nir9uBwjB05IfOTKAYWG6eYfyHafMdg0PeRZJcUcgfuP7O8lbOdL
	CqJNnU+gK32CnDo+sb+8Ifhqtoif1MSlRQ4gb9UwXW5cElY1s5lHCRiVHtLve5FTm7ZZhHLO1ms
	bd
X-Gm-Gg: AR+sD10cpRlAkEz2vgU6kp5UsTgUROZ+6jSqnBbis5EK3JKN0x9juCsS/u3R+WScT/e
	/pSfYbgp7EHEa634cX2qOzsiMOQ02vX3glmNoqTj7PkME9KLz96CnBMlnRfP2cnIRgOP50wFx0k
	+xBDpqnZSSq0WqwvJ2rz4t8I/A2a+BV2+fajxm3PBH8Zjx5oZi0rvEkZCFiztlUCGsIyCoKD7uq
	PvWsE/oFcGKcJzxlVXewwWmGPVMd51+TSjDnoOyF5kzr5PVFA8YlcsSWQDBStW3E4bB2lf+dYpj
	HTNZB/ds2L7kHVTAU3OsShTsk366686dqkz2qET3NiXu9+jl5abmq3jUjafS8x879S/x4U/+GlB
	XTTGIqv7MCYYCCSkiYX/J6Bm6DH7ERGvro7Q5titL4IIKnPh+ZW4iCOyhDYLjRqhnHfvghIswKR
	HyX7dY3s+aYUexCHg=
X-Received: by 2002:ae9:f104:0:b0:939:116c:2f5e with SMTP id af79cd13be357-939138630e8mr2745734585a.19.1788207124961;
        Mon, 31 Aug 2026 13:12:04 -0700 (PDT)
X-Received: by 2002:ae9:f104:0:b0:939:116c:2f5e with SMTP id af79cd13be357-939138630e8mr2745678085a.19.1788207119759;
        Mon, 31 Aug 2026 13:11:59 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1fdasm496241966b.37.2026.08.31.13.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:11:58 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: fix gpio_secondary_fwnode_init() not working
Date: Mon, 31 Aug 2026 22:11:57 +0200
Message-ID: <20260831201157.36397-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE3NCBTYWx0ZWRfXwLwIh2/eUltO
 tbHYXi7Ueo8AK6RvGRIizPB8krC2b5RlDFeKwd1LF6JZA9UhGDGvgJm9kgWPSICA1X13M1aHKl3
 4xz5x2tgjaeyFzZBWFPLD/15rRShGjc=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95e015 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=g95ZEVw2bScK6zofCtkA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE3NCBTYWx0ZWRfXy5svUBmdCLbY
 VY7c82Z9kYcoxtDblnB3wema6q2STLz4axocPWpLK4jNoOr443/TWEqAYh2HOTnQURgs40zg/vj
 2e1EFgW07+uRrVvcthc3947ZOuzK791y5RZEnO60492s/rirjHQEErtItu/IkrkiOzndr53KRBB
 OB3Cew9jwYKexUXPThLVn32/T6/tY/rqgKCRxgBcJyGpLxa8OWesEeJXYsD71c61GsW+FBIxK4/
 9xgGRBvAV/PtLvXebWRWZyy9lMmneDycmreh3q4sr6Zpr18Gg6We+3HjdUsFbFnuuQv+fGllMI8
 +KS/SfNgPnS3eGTuLQWakK8XmOah50LtJ/N1s1roNvZrsjek6Uva5eag0PVhhAlvZ+DDXGp+mUi
 zlw1WxeO/mmrGa5CzXOGQ/yOC8L5pn4rsETrEt1savpfweP+9e0TDcqQxFr9hOQ4vncfLuq1YH4
 HSG64yO4trpl4o2xf9w==
X-Proofpoint-ORIG-GUID: 7ViuixJ9OF5WgI_WHcPnaNie06WEIA5V
X-Proofpoint-GUID: 7ViuixJ9OF5WgI_WHcPnaNie06WEIA5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310174

acpi_bus_find_device_by_name() call returns a pointer to the device object
on the ACPI bus, aka the ACPI companion device.

gpio_secondary_fwnode_init() then continues with setting the secondary
fwnode on this device. But this is not the actual physical device for
the GPIO controller (e.g. the GPIO controller platform bus device).

This mismatch is causing GPIO lookups by secondary fwnode to not work.

Modify gpio_secondary_fwnode_init() to instead set the secondary fwnode
of the first physical device associated with the ACPI companion device.

This fixes the GPIO lookups not working.

Fixes: 1448c2d2ca5c ("platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index b028af1c9942..1706287fd136 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -417,9 +417,15 @@ static int gpio_secondary_fwnode_init(struct device *parent,
 		if (WARN_ON(!fwnode))
 			return -ENOENT;
 
-		set_secondary_fwnode(dev, fwnode);
+		struct device *phys_dev = acpi_get_first_physical_node(to_acpi_device(dev));
+		if (!phys_dev)
+			return dev_err_probe(parent,
+					     -ENODEV, "No physical device for ACPI GPIO dev: %s\n",
+					     (*swnode)->name);
 
-		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(dev));
+		set_secondary_fwnode(phys_dev, fwnode);
+
+		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(phys_dev));
 		if (ret)
 			return ret;
 	}
-- 
2.55.0

