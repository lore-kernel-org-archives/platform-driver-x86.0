Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794804210;
	b=We1NnZAyE9JA+iqTENYuUpYsn4sy16/XUcIAjXllJSnTGJgjRFYkrralJqlKYDPZHuXN
	 5dx8uhxeB+GXBHHzTDgORECs+dnULKBq6Zlmax41qnyOCHcDfQT9/1cLtR5mYIvvKZrJA
	 YXj0aPC4/lFcZXcgr7u1Yxk+WQYhqjcmw+Zc9TkSqLR+yK7RtEoaOyG/hp1HChq9pkw71
	 /ztPbKfCE/PWe/q2b43F/IEpRI4MaYDrqKAYkarhWZUrDfzK3dvgLJY/VRX5XubiV8C/J
	 etGFdj/BiLGgRe+pjGqVjsFSA+kaCMbd1iL7dgr/8eQFUByxrpvzuqTpV6hWH/gJ3aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804210;
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
	bh=/zB83Rl3+WLG9dqZdXhp68zzelJVeqbGNhbwrPXnGyc=;
	b=CddypRkIfq8sBXk0lMqPatfwse2aPDs3tSUp8jBN1sP0dhL13dW86yj/Nqyd56U8RySe
	 vddm/Od4HNdXkaVTR/eO10ef+Mepa2efVB2zse0Ofxpg3wRF+rkoNNvr3pRSQftSpZRL0
	 CvyBSWzgVxBH4iF5lVvGybXpZesiSNIIcv2pykfanncDVpKGNuGRPYmb34Wb6dU/CTljw
	 RHAr2MxQtOM5TUQiGw3vnt8P8U+NTqGNpmKs+AYZ1XzDpV3SjmJK7BptbXKcDjSHsqqXA
	 /q9yZeYFndfx7lH+iM/Zwg560huWlG8L4tE59Jzdlbu1U/wkaziJeZ8bjST8nJ3I8kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QEx1xYqG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.24
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010024.outbound.protection.outlook.com [52.101.85.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C040D606A31C;
	Mon, 16 Nov 2026 04:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C040D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QEx1xYqG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCCkORp0bKKQCE/FpfWM6j2WAhlY4U3IaOjJsKcH5eLTZSYEgvgdAASfwvm+uVEt6amwBRntWYztleIwzvfjjyc9s39Q8VHgqlJVSTRNhaUgHqpu6eDBoexaW4Y8TLjyUiaYgy69qWnN74tGvJUk8U7UInDgJKWTVzneKi1oa7rGS/D8JhZotenIJ5qah8b0+Pr+MRyO/Ovtsn2YRnJePnLZ3qI89Z6HZNn1iJ5VrBRKhISmfgu51zp0H5Rfv5+x5wkEyjYLAgH44opji9ZPu/jbO3JNKRFxkJ+Y4sfOf10s35RFlq9lfpmMVF3Q82LoCRBFsvfSIjoCi9h/ibCH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zB83Rl3+WLG9dqZdXhp68zzelJVeqbGNhbwrPXnGyc=;
 b=U2eI+i0ILEdBQHQrcIGqcGq+okWjHe/O4FSzYJEPuYTccmcGSc9hEqIaWAh8AhsJPupU/Pm89yZ4nqsPp3AIjD6SHDqtVm3DPIojgzBgzdxOvs5tpJwlXZ05uS+VgsVN4eZzPrnmHQDdvbitCNtIwufSv5PbpdPIZLIVuNUIJ8GgkFw0y5i7hvpZayGSGrmPoA3xHGhkpA0P16ldJv/1LmBySuv1NHBYpxomhpX4vUUUg6qxLQpM4ElUf90lnX3UTUaJ/Zq40JqgknQG3lwxYK5X8fcmlny7QxQiGrI6V9Kn0V5qKQ6E0YlyaY+RXFfrhw0ZSkpMwD7DH2dYwl2cBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/zB83Rl3+WLG9dqZdXhp68zzelJVeqbGNhbwrPXnGyc=;
 b=QEx1xYqGEgRTQX/oY22NY15BvKnmU2LgIsGWRhgyQl6LTHYbyTAA4finIJOCh2BEiPpIwa2/S+aAcD8/8uaxUzS2aud5QuXDRsslNwIUS2HF1i+3M24Jsc+cdeuT3amD0ahm1oS3JALYkYJd5ITEl7aMrxgaBUUBM1njZdcvLUUr+Tu1L27UgoyCm7FMTTqKCa7gFQS2IrmOoEdI4tk6MOHo2nDdAoKYBpgzVbRE3xF2/QdwfW1Yi5Vmc1G1HFuGq8r2YtO5weNqqKavS4MHoJE3Jn/qKR3IBiSEI72+3RxauJf3s57zH4eWfnA9usxtDRrvsJxTNeJXjEUTbKx17Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 04:43:26 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 04:43:26 +0000
From: David Cemin <dcemin@nvidia.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jackie Dong <xy-jackie@139.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lucas De Marchi <ldemarchi@nvidia.com>
Subject: Re: [RFC PATCH 0/3] platform: lenovo: architecture independent home for the Lenovo WMI drivers
Date: Sun, 15 Nov 2026 20:42:31 -0800
Message-ID: <20261116044237.3760227-1-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <206de2d5-ef5a-4490-b6b7-c0e98893ec5b@kernel.org>
References: <20261113222755.1696567-1-dcemin@nvidia.com> <206de2d5-ef5a-4490-b6b7-c0e98893ec5b@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To CH0PR12MB5089.namprd12.prod.outlook.com
 (2603:10b6:610:bc::8)
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
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: a1863749-b8b1-42c8-1006-08df439c26ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DRYVmtmyJ8KV9LSaP8Fy+q37brZPZEy0f7w1AQ1XjLmPn9fOoru22KolXbFXIorSOscWrBFOMJBWnNza+XpAGZcnK195qMioNUw7Kk5O0ZQhaDh5OHInOWVicUMT+A5njjc5AFnCDG0izaDfX2Zi1/noZw8GsTkR6ivzhh1LrT6rmLgNvpHKfl2Gnhu5eAP7IOWKT/mEkx0T9bCAoVYoVHLk+3a/wqAnbvxsNRjAmspLfoRsAuVF1TlJxknK8YDlpCyYA85MZA7VmI5vlb+Onsh8ucBFx8FX9e7F9P216TdRbz2Tp6YdyeC0VkYQ4qS9meEPPCEupsYCLFRZuXVeTqobRZfvva3mhLQQzPDft6ZlTBoEfaCQSjmtmadO4dTaDX+rkxGz0/xvs534tQKgpwZcU5db0IHq6h5oBPuqHf4OPqy9OFO4CeYQvh4mOoxCtz69/cgAWc52CpZN6MxzXG7qb8zwwnMWDYWmPm19RbwKzyo7jNUvi3Ey2V3ukwepVDZYoo2WT07lHLx6JfOAu8s6V8s98O6VFLLgVhIemkAT8nUxCJoS4rM6qtZjB5rT2Nn1R/0AGiQZpPDeZWE2erZMBIRqOmk4UHpHdrKXZA7pVcsNCAL+HLoxABm2jfhMTLHCSyEZYZXgzgXOf9DJIycQ81O1CHyIJUPAJdiVYNg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0gf0uhnx0KxsukTVl1MQ7rCflKLt1Cv/wwFhYWaKJZIYiJ0M0JKXvOc8/Upa?=
 =?us-ascii?Q?1stKa5M3taZsqkGwVR1HeZc9pU9CVoT/rClVA+tU787oZtvo05RbStTCm9cA?=
 =?us-ascii?Q?r/8rEwPq2wkCGAUhSTPdaCibwT8MeFej3QyMm6KjS9qkEq8gkEEUVboa5EAC?=
 =?us-ascii?Q?VK9xrfyW2ItSuTJ2Ood6YfCxr9MsTKsMUeRlI5xDoPzidXZg+KPsWEbwI2T1?=
 =?us-ascii?Q?IOqPG9TDo+KtWSsHoRCKqEsL7XiwGKctbkrAqDxctJTiXB0sGlanRj5dKXlP?=
 =?us-ascii?Q?R3L3qt99UJ7MWj4hAHj1lpZwOZGu786WnBLIAEi73ENXdTQ/dr/+a1k1pgBy?=
 =?us-ascii?Q?FvpjGuDVQoWcam3phEr/o23kklsR3pYjZmoBnZExmWZMnWnr3JCJuGMVTh/N?=
 =?us-ascii?Q?Vjlx5jiYwlckt/SofGmS234ShWNQSHPRriW4SJw9j/tZKLud6DQN13Jr8euE?=
 =?us-ascii?Q?3IA9n4L4u9Zf1QNOLkmYzNhBp9asnGswl4RBweVPL+J5zaLWM/sOt1WfN5ZT?=
 =?us-ascii?Q?1S141YK8Wd4VH2EjYNu4Ga6fR5omPu2gkcXPnOCFudj4Ia0ZBXxrm5d5PQA6?=
 =?us-ascii?Q?JS/sRAx4uzXdrpVjWUadI8KsaAK6hbgddk8IuGn76O1FSGDTL1E/0uzj7tMM?=
 =?us-ascii?Q?sTHY1G2o0rQOoG+A06tPVdhO0mkDFe7rtIybuRDGdaKb21RsPUyYz7/axjVj?=
 =?us-ascii?Q?/TCMUh0gEGRfPwQ4WmNjJ8UVX2bzKxSHZKuYnSvMOIzzL6EsH0dDHZwmLrda?=
 =?us-ascii?Q?h/+ba0vtsgzyOs6qYEbi2424kWiZhsfspmNu4+8bJePX2N9pTNaMBXQCZiSD?=
 =?us-ascii?Q?sx1QEbHIPviWsBJ5Vx7BuVLlsn4u34ziR8qvDsGS9smNcm5Yy9wqD8pDzswD?=
 =?us-ascii?Q?NAEDUjNOm8xNn0g26Hh0D90gDN+2twV1/NSoTcNVF+kdLjhkiQXb5uMtVU2H?=
 =?us-ascii?Q?y4qbblBi2M8ENZ8hFCC675w2YF3BrWYV/OlQUs3tHCTxfpALvHP2rPNJ4KGl?=
 =?us-ascii?Q?W8rKyx0trC/dqD4NzI3SKWZygiJ8yMtsmTPOcnlVmSlJREwjnc4Kd/ZyxMsF?=
 =?us-ascii?Q?fnQqARfDRaFgka+yQDbVhSUhn/Y8kvKKqnChGtlXKR/5a7Smde4dLv34rPaX?=
 =?us-ascii?Q?SVGmwL1vOG3KNVVOTQkGYUuq0y4mbcIICiWhXSfnNCJfim1w+qVMrPedxJ9G?=
 =?us-ascii?Q?v/kS2/YRVz+zc0S7njRljntSEd5/c0p/NwZD9cmAzJ/KRs3ekmyTvz7BplBY?=
 =?us-ascii?Q?9zaX7/vCAYYJI9eyF+QWhj+YqmwLwUr5qS3fV/T6dlG2HNiDjak8rk4ykKFH?=
 =?us-ascii?Q?OlTBUN0UarXOScdXLuPXlB+CuyD5bl/MQuAbmLF7c4jUVWBCPClHVzlk0CMy?=
 =?us-ascii?Q?8VTDi06xLxskVo1SK9vFCfAPXN2bfy/CPZGmejB20ySh7P6CDlEXfnk3gA2n?=
 =?us-ascii?Q?equgmWmetRh4BeLKuaRFA0zTqNnVA8eOHAckxLYNQXhWlazOJNCd4skQZdpw?=
 =?us-ascii?Q?1bRqrCN8BMQ1dJoQIvh4TRnLgJ77Cn8Ncqb7qaX6UGrcEdEElJLGbotIoiIv?=
 =?us-ascii?Q?Jm+bV2QKTySLSeMi7Clz05BpFBFaWZbpHzNFL/YTfo5IwPGo/w/syITb4F93?=
 =?us-ascii?Q?86a1mQdvPDIs6BQCYK8B4eixNvJjRsINp06G6X1GwPonZiAKs7gr1MWpSsqw?=
 =?us-ascii?Q?kHwEVXItA4A7ESmrBNn7kUGP5e2pLnvSHBmV7y50pKdbgpfjlSF7xmtpS5Lm?=
 =?us-ascii?Q?6NrB+LF7mQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1863749-b8b1-42c8-1006-08df439c26ed
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 04:43:25.8099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzXGytmKFemYD94yLVzRfNeQaLkSNYlDc2cTZQJBAE4BuEA1vwJBY0f58AjXs/ZeRtYZADqMfoNRSeRnx0v0lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Hi Hans,

Thanks, agreed on all points. For v2 I will keep wmi-hotkeys as the
single driver for the Fn key GUID on both architectures, route its
events through the lenovo-wmi-events notifier so ideapad-laptop
subscribes instead of binding the GUIDs itself, call the chain before
the keymap lookup so NOTIFY_STOP suppresses the key, and keep the input
device name compatible with the hwdb entries. I will look at Rong
Zhang's series and base on it or coordinate so we do not collide. The
ideapad-laptop side I can only compile test, I have no x86 IdeaPad here,
so I will ask for testers with v2.

Thanks,
David
