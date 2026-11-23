Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475415;
	b=iqAkddnWD9oV0DOmrtU6tEstN7RhDT0ACs2TZNWuCQdKtcSGKAu1lxCCB1aJw/tKcgMr
	 yTDwkvfxuWc01ZQaFjEYI5q2hEEuqmOpTWaEOAd3CfMbIo+65Qj1QNHx9c5cwwifeBiST
	 N1W5youZolzXzgEiMBKehs8F/LOFh99XCF/erjnHu1ICdIKoHusIcG9HGtJCPIsQNWbWO
	 ygFGcCx9WzyxJeMKHmGC2N9byO74xH1osP0jehBpVkxhlKeswtSdWCDCPdiOVyGNnYTJE
	 52qRfGaALLCdu+o79oe35BMgtR0Ok1xMD90ZO23Fc5XMhHpWrx2T7LSrGXXgYzNVMqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475415;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=YeoCvFTZNqPy5k9pXMBXCQAzeP289ui3FAX4MWI07rA=;
	b=otRGUSANOCo+D4MEVVYaKgXzBkivvg7RpDxt+H5UPo48OkxBNMwxkikJiRDqNFiUI/mN
	 EviwP+MG96wwVx0Rt8ZxJIuvf4ZIVRjySCdDcwGRUB3k8E1U70Iv3JREy2LwQDxrTpmb+
	 5CZhQ+TRMXQVYPw/Hwizu+gpHrIIi5d87edF+UM+h0N7TlIH9n2qn/Fbsu04E8eNeLIbq
	 DHvymn4uxucIy1/SuxRGLdT1s+/PQ0vPIwloHGjDY5q6LQaFK9VESX/h9Cr7pSHhIXzyf
	 Tw/foiNDHzVElPh2Z28xt1Wzn9ziNAPOlRVZYOzMoARBDKD4ccFvtHQkTTu/5wlNc6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TnNAqRcZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.34
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012034.outbound.protection.outlook.com [40.107.209.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC017606A69F;
	Mon, 23 Nov 2026 23:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC017606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TnNAqRcZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvAuby2y+tvKNDvk19ZuZM+NCHM7NUg8kAv0fJsY+jfdJZqvqG/QDbAjd1L+GrT88SxbIhB1QwcZqnFzS01trWI0exD8gztSqIjpKS4EaUuIFMDHCWwTLFaTtWjlrSuO6Ual4sqrxOGh6nSRJBmMvP85UcX9ZJhke+bgVE2q+xUxn4eVq7WxZGEb8F+V2JeYhthjpzs3OJMcoblyY00LI8fnyPRiQGpzGNXN/dgo4ZloWp/aZMAPDOp2jp48stURqeI9tP62x7XgCDgeKwemWgZbCBQQmaNS4y/yP8rAMp7HwlvROD10I1nnnw2CRcbEqLXDiWRIEwG5Zaie6W/C/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeoCvFTZNqPy5k9pXMBXCQAzeP289ui3FAX4MWI07rA=;
 b=fHpfYpbxeSXMsctVS5Ar8RzJN+n4hpoEIr+9iTM6GTwec83ptqjvUx9PEPQ9fGl83Qd8EmHUnPeNjngeKOTkZePCioeae42X94LpV4T201YNxQtnMpXXZFliyr/zLrzUdz0/DMIx6h5DYFnu8M1H826oVAKQU+O3x5dAvA7Y1zpq0OxyPk6hwqyy+t51qrwbMri68AjRU/aukZcnQNKg4Ljmnx+uzyNjjXaDtSkzfiQ7CUWA2XGaGrcfnkjHKy5gmoQWl8I8EpQW+N+Mv0VlxcJEx3v8pkEZOstjfU9IIPRZOMJpmfygdbbC0ccxY5L3JISb/AsoML7WSRswxhazDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeoCvFTZNqPy5k9pXMBXCQAzeP289ui3FAX4MWI07rA=;
 b=TnNAqRcZqgF/V31945oWoiwpiCQ8YqArDwey6VQp1f9tBKiiZFqnDTcxbdfDv/Ha60WOBULpBboVm/HiJL2Kflgs6jyZ98xAl647DkQGaTRw0sY5oL4XDl35mowJItjpZZk/gBcPOUIq0w+vXcUbEq0weWSaUbT5KbiB6qknYrd9ZWxmaiEaaFPc6Umbn8z1tphHG9ABCdZZsTCl2n/ROTIcvlg0MZkXchZiEzqeQ6Dx/wm/oaxF+aCMsxQo7SKcVt0heFV9tK3PrFEKmnc0sbfL5FQSSMwpTGA3zPSeOH92RClWbUX+MbZsrcG6O2pW7xyoat/5PbVVsFHaMJTKzw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:10:08 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:10:08 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: David Cemin <dcemin@nvidia.com>,
	Lucas De Marchi <ldemarchi@nvidia.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Mak <bmak@nvidia.com>
Subject: [PATCH v2 04/10] MAINTAINERS: Add Dell platform drivers entry
Date: Mon, 23 Nov 2026 15:08:55 -0800
Message-ID: <20261123230905.13899-5-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123230905.13899-1-bmak@nvidia.com>
References: <20261123230905.13899-1-bmak@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR12MB5786.namprd12.prod.outlook.com
 (2603:10b6:208:375::13)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: e659afe6-fe4a-4e82-0750-08df49b6ea8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J79tw1OPyUPTuERDl2V/hhhjcO2/i4ZCo/ix1cv/z7iiN2lQsYOcXIUBfFjR6r3Ze3+muf8ID3iO+neRL2vh58AiZLgKvOCqL6XoHjiARZKhIGwQuGA1UW8WhsspMgs4GnYfC0txVVGQAiW+LHjSSf0TzKuvdPUVNaODGCVnm1v9nJFxDtkys1KM752+SicyFt8HWA9dT7N2xSnFCxcm9srp0wDus1o8zb/WMcRgs8tlWGALNBOl5Dxi1CizhiZigQJA5THRcxdSvWmZHzh0PWSCC33oN3n6GMlca7H6j17gHmZDXlGTcJtE2ApJc1v3SvRm64elCQ+b1JNhVzrkWPyg4mdN5xW1MKyIiSOvsL1JCZ15JIOOu5A6IPfSDrLQWgZk1Vc78gjb7vH6gCA/9BW+47LM1y+uGUHGI1QkDlDad+n9PTiiUrFLP/JTMLRS96cVHkbtZaQcHrzMI6m40pZvsObesgynfT9DvPdxO/Zhmz41opPvOLihQ56C5GTiF9Ma2kemmDDCZJuPSh1MJ9XriEc0752uW1qeuto22uSOS/6A8XTqkd4ugKyf9t3TqgDz56XP8Nf0iupUr+ixsg4G+T9nLXJ71RMi2SG/zP2FdkpSavja9fpQZw0Z86ROA6InmFELsf9CxCO/r1CcpMA4yaRh8yn0YNW/R+X3zG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J/KmV/lpA1S/XLq5SsECRO7wGRMORDJ/gWQAkCAwoX+dEuWMiDKU6MrLMFXM?=
 =?us-ascii?Q?eom/1rf0H+yW9fxnjFIA6unYOsyIvHg1/COa8k69vcvAukIx0y2w0RlfKDXj?=
 =?us-ascii?Q?lrB+3CN1RfHG/AN9lbZ3AaYMJid6WtEEO+bl2D752BrtLzX7Zs2HLiXuMkEy?=
 =?us-ascii?Q?91EDA41vyRTq0F/sJkLWYBz9ASspjs4ILsjDwE4gZpirVpi0Jw+rJOUq69JK?=
 =?us-ascii?Q?FwLESRktYAo2mnFD0iGOAv87u5LTiHDXhLOCyhlBDI+tFP/ZBnGSpFXO0WVN?=
 =?us-ascii?Q?obmBU9Rcp2BCI+oUukEAdd5DeIMwJAcV0hupwcE3LyYIJfzgPfqLn9V7rZ6U?=
 =?us-ascii?Q?42UbBgciMxcSjmKfIZUvWZsc7zRmtB+nhSxBfmatP9dH2az37QyyQnM0gjef?=
 =?us-ascii?Q?IRPTZavvy4U8S5BRcE52yG1P/eF5KnNeEAgnhOAizrmZuQs+iLBbZYzvsYk7?=
 =?us-ascii?Q?W5jK+7uRavorqgCpDTMsbocV71rk1ZAsFR8luuv723Pq7cvpa5c/8Eh39RBI?=
 =?us-ascii?Q?YNSXSXexxwMXNZbgtsvq/WqzaAHWpiP6CP7OE0vwGxwFEpbgzOaJCK/D0OuL?=
 =?us-ascii?Q?OPodSmgnzUvgSYoLVRzF6qIRq4FmFHZvlSvqDCyYStQOc1jtzQwKVETBvpZy?=
 =?us-ascii?Q?++LSVnnftn0ftVEEYerykgB+cPV96B2NO7f2Li3D1VpqkJBWZtKcwaxAOR/D?=
 =?us-ascii?Q?M3cOtbW95VuuMpwxbVMZtsR/LKbkVT5K0Q7kJyQzpZhcK/u3dXOHnQ6nBAsi?=
 =?us-ascii?Q?ExECpLolED0mhpcKkuI7ORD6pzCDNQVKLZhkdH3nuuRit6GaY4pZb8XWE+x7?=
 =?us-ascii?Q?XrRbjMHu4S4u9OqRgh4t503p94OumX1Fot9i2+OrpkBux2V3KUk/K37i+zYU?=
 =?us-ascii?Q?phhcKN6/H0eOhhDaSff1UEPosOO/fqeeNDChPFIuxLfd5+9xf2FNsRwdRAYU?=
 =?us-ascii?Q?0cxy8oY3cF1HKnsGWa6/U5NJo+eJ6oy/0An9uY+S3Wi0H9NByCtiSx/8kqzG?=
 =?us-ascii?Q?3yZSUpdC32OZSVoAmAxwKfM/WEmqqr+1jIbYBm9xkDYY2LAlOeHgS55SwRce?=
 =?us-ascii?Q?tQCSw32EN9SQvIHf7B0tIqrSXmVIn8IAXnaDt/C04Rp9dILqZ4q/3YyB/+Px?=
 =?us-ascii?Q?JV4/BxB9aYTme1gsEQzNbhP69stVrHJ2Udbbs8t4kpGLmqYKOYqihOH6V1Ul?=
 =?us-ascii?Q?cn8w2wr8Hk0vdqjTg1XTqxlrIhhTqSKSpB93D+2HocoLi9dKzsT8Nno7gw8V?=
 =?us-ascii?Q?nka4oBbvMAO6uFao253xtAP4pC3s82lEGMAQDohqlY48p++I4T/0Hu3TmATu?=
 =?us-ascii?Q?zZNq0PcnR0RxNI8vriypbXzw7Rvzj8A5B4MLRbI9WS4jn9qqjVTX7S6U8Opo?=
 =?us-ascii?Q?hBkyelHqi0kx9PWW0ymz2aQmREZ4XlYFevkoudF4GGqjyCCZ0lwBDqH+MByf?=
 =?us-ascii?Q?wV61Dg6hBCBW9Z407O5GIGfazOZEXw7yd6DvpkU8pAz1tqVBaGOjfqQlZuVA?=
 =?us-ascii?Q?BltUDaTxJbHkdy+5xKtr8TrRQOf1xAhqk3d9xqvoEL/Wj1Sk0xRf9vHXVRn0?=
 =?us-ascii?Q?/wvQsPxS8RxdsHcnWnCrM2phs8h/ZGjjjfSToVH3b3YC1hODgGjo5FFXcQex?=
 =?us-ascii?Q?G6TkbIWOxmHEohtNtmlM6iMFN+oE18MvJ0ExkgJ/RCx73hGMSs9Yf4JIuDgu?=
 =?us-ascii?Q?N3/2DIJA7DcfHlLw0ey4okvLsUn3tOQUH7DpZm4/OBnxJDQIkxhHSnOJVS5F?=
 =?us-ascii?Q?ZDOOzPfp9Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e659afe6-fe4a-4e82-0750-08df49b6ea8d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:10:07.9776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D/7FwmefT+s3+ySJfNXTqNeR8k9AqgFLT8shWkZ0p7oLFzZcJ/1jf7dvOlTm1xc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

Add an entry for the now-moved Dell platform drivers, so that misc files
like the Kconfig and Makefile are covered.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bfbe3d748e7c..cc21d9cd7426 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7476,6 +7476,12 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/dell/dell-pc.c
 
+DELL PLATFORM DRIVERS
+L:	Dell.Client.Kernel@dell.com
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/dell/
+
 DELL REMOTE BIOS UPDATE DRIVER
 M:	Stuart Hayes <stuart.w.hayes@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.53.0

