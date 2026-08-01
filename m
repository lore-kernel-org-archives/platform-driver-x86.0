Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32203A6B76;
	Sat,  1 Aug 2026 02:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785551385; cv=fail; b=meIjcPFaxfzhsXL/c7D6XwRLOx7q12TfEo0CY5RAu4KwjZFLMv/e2YahW7o8oIZHw1qQskBaRKiAa6BY9fxc8KHv1TeLvedWaWZgFun62pRvTNCY4Us6PknJlriSOiPJnU9PnNIx1L3RY17AF1ZBFsc+n0hqkXiKl1FDJohOqvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785551385; c=relaxed/simple;
	bh=JOLLgPPeafAFgNQTSuJfE3kpvL6feMeUeTaPrceAZyI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jtjcTO8Cj8oTHU8s5Ru5aC2a7C4nG/5SH7LysXtV1z0qoi7f0yG1FIgpTRWS5dcMtHa4QBJZkRMN7wsnD6WwZ8tb7dbfAcgPJz9POZa3k+kOwymWf1bn1Uyf6mWHdPH0x732bRt8PyoLBbAE3ahLwdeWhafJAHWlO5oH+Fg/L3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=VWeJkAff; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wabTc5Xr; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="VWeJkAff";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wabTc5Xr"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VM01bX1266236;
	Fri, 31 Jul 2026 21:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ZaqACCncHO/zO
	jrz2GEBuNeTJgRgLanpZfbxO4QshL0=; b=VWeJkAffxiKkjikpE+e8sd9X1d2Aq
	Kb+YAsb3H/VPSEv0HaiIH/gPuFlWyvsXYMTxI3DchHbQv2BfLqkhqG4ZvGJQ04Oq
	wAxXQzeA1zAkVmgWAV8jAlJeLpCiuZsDLoNyMcdgBhGp3ysfKhQ+TYFymjtsVWIB
	1oxJkXHiclLicsmZdcCxkrolgeBImN/9YWR0uv7nMtpdDJNmWhAnTnhtSBVyFXfu
	Tn8C5DebEpk9YYE3yHrfhYueKZTzB9NdO6szKtcNlzt9ZoxtHM52ovcX8vJZX6Q2
	nSsVRz2yCXYJ7J47ZBgIKaZAVX4tUcAlScNOyOeCBLYNZG2Gkj2pEBLRQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fru9t4btf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 21:29:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VF90PO7KIfi2i8J6k1iAVhjkodtwnX04mHCr6w0dg9jIWkfdfEYfMecrUeZHonuxFrNHT5UA0EFJPE5UrPwA2g/PXO6i8n++LSVgCgsDA1hzEuLu4xLfrDs7ieEGR1yrCekuX7pZb5cVpTfaLfNW2+KVhJUn5MRW4p9ANIikGuUZyEP+tVIJpIoDja5UsAf7NKBHouQ/v4txwce5HLvBffkA+UTHfV6jQvKNBX2nRzfLM+T11CebQi1aOQDM0zHUK6C7AxMOm/xbCrZMOD/GIOGQkageMKtE9SiDu1G7Ce28Wng8gTCxRfGzCWtBZwPerPMjAjbbTgZAs6Tw4UsbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaqACCncHO/zOjrz2GEBuNeTJgRgLanpZfbxO4QshL0=;
 b=ewi3c1XG/w98EBiGADfnNEVe5IKFx6XgXSz2swShMp/OKBrhe72u1KaFB36Fv0NGLzffV8ojTkLRyExABEF9sv++ulsAtSHjUx+7TQWI6OtH5veX+6TpG/76W15OXYSZfasIa5i7ALja37T4nFMEuyyh3b9gXFCRKH/JGNSoN4VJtsSD9TxuH3zd7Na+KDArJxg81Q/QG2qjqXFLs6L9JFxuoRNViSBhSZiOB7b1wobwisza4RbUzIkdu7TSunhRDMb5AslDyy68E5320aDycy3BgiWeRj5qOnw2IK5R87QyAlL/t1fxcAY+IcMO7Isq6TO7KWyhwzanzjfc3uJjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=hp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaqACCncHO/zOjrz2GEBuNeTJgRgLanpZfbxO4QshL0=;
 b=wabTc5Xrc569fQV97k33HClBN0fWCR1ZMEjy/czpPvMuLNmYb6v5UknK8+NBgjFwZWcG/NgZRLd7jsih00K0Sjp4oQ1qSZKGccFi/MTLbocV9EqE0vHikmPwzhFmZbtSqLxb6Y8JBt2jlN8anWOsIl5eaU3QLPi9X/UINi3EFr8=
Received: from MW4PR04CA0346.namprd04.prod.outlook.com (2603:10b6:303:8a::21)
 by MW6PR10MB7616.namprd10.prod.outlook.com (2603:10b6:303:249::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 02:29:18 +0000
Received: from MWH0EPF000C618F.namprd02.prod.outlook.com
 (2603:10b6:303:8a:cafe::21) by MW4PR04CA0346.outlook.office365.com
 (2603:10b6:303:8a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Sat, 1
 Aug 2026 02:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C618F.mail.protection.outlook.com (10.167.249.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Sat, 1 Aug 2026 02:29:18 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 21:29:17 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 31 Jul
 2026 21:29:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 31 Jul 2026 21:29:17 -0500
Received: from LAPTOP-70RJ5B8Q ([10.250.165.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6712TBqn1691017;
	Fri, 31 Jul 2026 21:29:12 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
        <andriy.shevchenko@linux.intel.com>, <shenghao-ding@ti.com>,
        <13916275206@139.com>, <platform-driver-x86@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <robinchen@ti.com>, <bill.yu@canonical.com>,
        <pin-hao.huang@hp.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Add new quirk for HP new project (Messi)
Date: Sat, 1 Aug 2026 10:28:31 +0800
Message-ID: <20260801022831.1241-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618F:EE_|MW6PR10MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b8e051-0b9a-41c3-313a-08deef74b02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	34pyklKDDiCvJLWZI1KlKxnK327uFTc18RRI7ZZIE+EPjt+SPKzHY7HaXMAg0KErICM3Gc74ETZnbR+GjRTZbpOt1lrvlVgOrGtGGJDuPhp/Gxm4vjFFD8ezlWRlvIWCgY8kvIfbrmAfuTv6yVW2xYSOvBy365xo6qVDaxrAcYc9bFsF+/onqnLch9B6Y6IaZYpYOZ3kqMvgG70f57XK/cQIq0Kl/98I6Q5xT0N6swVBifqpN33am+hUIeYR+5KyBKav9yGcUrLSF426j1d/7+OB+usy8SfJV0UvL0NxKuQS5VlZ+oumKr4dhUzUUivrqLabMei9m2BcIDIA+gOrvPGu2ewpLtQPYs5UiMCRVq1Tb63HnglX/tixj2UEmb1CPQSiOgMT6AWU9IYhmz2EcR3YdUpTFRRs1Rq7Z62CuwbRyFxI3XO4x8YjJGKtqfKfzINu0dWeMWVSVd4HKcRwRvNUSROyej7OZMKbPEIqUUzTljETphIGxeul2cVUQGD6JOxjSaqw2KRrHthSlAE2uPvB1pbuNNu5/wTLzH2/hnAxP2QepumQ0pZ4e3TpZgH5OzYuwqXuLAxarFRLM3ifJ9mioh2Mhy84txL6I42GmSlI3rtpJY5gkHd1Ujugk9Dgadi+2wp7PpbtAeiyJIt6ofA3M3QJqx8XRPRDXkMBxDQe93hDkVonJaGHn3JRuvapErjBrxqGocBL99rpRToOwA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+IhYhZjypki5S1do09U5jTe9Ish9p88QZnJFOvzD7TuiwvIaUyuphOXWp1YgeV4nkiRGrxVDQpgpihT+FmUefmXccXakuJZ8s1TUKv0jbrnlwMmyztF52P/VL1OmZqzoOBSDfeVJXnStp16csifPPLcm+bdCWKDUNKvV8tJffzm8vKIS9nfI3Rn1X0aElHCIfKTMbdDZMrBCr6KxcNvS8QPdnKekspLSJDhvIa+jWTttfUl8eQZLiaDtAmyQPWpQJ4lO7RzkDHzCMNhaudyCmNEVunQLm2qgmyrLJNj4OoZNwQczLjSpGyqFmjrdqFI7SjlmyEnx5ZbewKbEMxtlPfo1Sp7OtroiwFVDii52My1icRiS6HoubOsK+OJeHdeKY9MhKJOziSZSd2B0LYUoKrXt1V78DN2ZopbGOlnft7ap+EKkQzipOpTJ7GSAMQ2t
X-Exchange-RoutingPolicyChecked:
	kGQDg8yR/efcyM/pSTEQDl5uAdcuZt24xfZJp3Yimnnpo1XdR+X3DKahfNojFB4WkF03aFCk2Rs00/KxiMmv5w5GMYK4jPuFJu9E/0Y/ZE2YDYxilnHPKnXVcevP9s8x+e1S9SnjGtRqvowElo4RcsoJE0ngPykxLSnOJbQHLR8B8//H5ElzGuEYIEFACWev1oyo7R7n407kvAgh8nmJ1csNAcXa5O5VwGBJnQXy7gxWs4of6FXw+Ad4/Ce+y4wQAmbCccQmfvMjQJuBYcW2gjpCEUgt9VEO0jpApYwpvoVvXiTkMVQJuoYNaKRX1DqHkBZOHRgdmSmG6Ao40gceNw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 02:29:18.2851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b8e051-0b9a-41c3-313a-08deef74b02e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7616
X-Proofpoint-GUID: PhYT6O3v7aED6LqiO4CbzjB7_KZq9QMr
X-Proofpoint-ORIG-GUID: PhYT6O3v7aED6LqiO4CbzjB7_KZq9QMr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDAxMSBTYWx0ZWRfX1+W/daszWNID
 n0WNcJJe9v+Bqs7TCmFsHmddmgr6L2/HGMDXZcowaNFgR/pmNOHdii0jLU1yl/BdfhFq96NYOcI
 34IWXFQcVeDIsJeSRJVJRVUEZc+cUhk=
X-Authority-Analysis: v=2.4 cv=MIJQXsZl c=1 sm=1 tr=0 ts=6a6d5a01 cx=c_pps
 a=SWHM+P2JNiUeaYpOZLdr7w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=dAWQ1WzoSw-l28kffRgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDAxMSBTYWx0ZWRfX091kBXT7OvN/
 1bi8E5Z8VPXnmo6gsz6CNW5tZNeyCavpR9Prd4G09iNuYBlgiWNRFjKVXTHLuSDYVBqt9GU8WNZ
 AchRGWPdGibiIDv0aWlfaskf5kq6b/s9Hxu0i7H/m5V90/BgthORyDre1ijAFsdZBC0nUvyAHGS
 ePEvblboHe3xaqVfubyWJI72I0cMDPZlu+fZoVw/Ir0HLvYkMKeZUIp4s3bQgc1guLGoYXeKIlJ
 YZnbwzTZ42Q/dPUeJA8goRekITDZMEfX2oP+OuFnYCiSS6OX8k1EsfzAsmAiBa4GXyzF4iZa9pg
 ovug6UKCX0v0CenY4joxxJg3naWkXKasLVzTod1NoWkuGRzDLPoRAsersl2TQ6yrkJR+lgpc8W0
 heB/5n/ABlEUG59jnA0BoGnvya1l7kBORknmPE6TqcXYrcpKbII3txD1SNzBqxDRfWlhASc6Tkm
 q8PP6G1GeJZLD6gPP1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010011

Add new vendor_id and subsystem_id in quirk for HP new project (Messi).

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7877127e0e4..97ad23cc78b9 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7577,6 +7577,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f57, "HP Trekker G7JC", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
+	SND_PCI_QUIRK(0x103c, 0x8f7e, "HP Messi", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f94, "HP ZBook 8 G2a 14", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x103c, 0x8f95, "HP ZBook 8 G2a 16", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED_INVERTED),
 	SND_PCI_QUIRK(0x1043, 0x1024, "ASUS Zephyrus G14 2025", ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
-- 
2.25.1

