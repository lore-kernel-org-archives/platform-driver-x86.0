Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795055371;
	b=oRxXlpbssIBVv18Ky/wQABZg/RLeyb7edLxv7dayxyePJH50GfrVxj9ipu8x4sChJ0Lf
	 awJFrcuzfQhliSA4LLzPJ96oQXnnCxk2dyR85icY+sjLO3jKZUMgKRSYADLwKkHqaGvzI
	 Cl90VLJOsoLy7J3iznyjH0LuKnnGuv8DBo30c5tlv3OGX51cZwede90xAm6Qz7Ybvqr+2
	 +XlYW61XfrVpTJyfTwFAzIGnhbwy5IsG1efBks2a/EVcIH+DwDAzVOv0g84f+hDSMlrkq
	 +ZYtD15x62u7kS5gp/nlbivlwbxQrAwKChG7Oe++19JGNIHGSwpJv6dd1anpBGsFy1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055371;
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
	bh=fsczLtLrXEn3F8lWgjXd1RupscsYBmJy7xI/HD6PDDU=;
	b=iH6SIzAc72KonQwth9zUe/uQ+37GwgwW/5OAcWIFiyljnLbjx96bXwQpHBaZPzNSeRVH
	 OipqowC3VcxwLRdeBGutjakybRtGJ4fpopXtZricsanwyulTiF8pQIQuy8u5wguWJIkCa
	 UPUT2kDsLJYz5jrayqp8WT2XB2q03Nc7FkimDhlzdcwXkxZnA86QNVxhoRb3AYn2qKy/4
	 FsqzNpBW5RDljaWD/S6rfsCUfhnOfMwFmSWLd+2PXvhrc3TacEx2GKQe3qQD+hy6PnW3l
	 TGMYa4AL8pw0H6gKB8tpDq+GhvO1hLUQS2XQ5+0mO1ewi1niiDEKiBXBf/z3L7ha1Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=flvYy+2+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.71
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011071.outbound.protection.outlook.com [52.101.57.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC99606A335;
	Thu, 19 Nov 2026 02:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC99606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=flvYy+2+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrhw1JA7KiUbfypCyVhnzqdJpNAi3REqh8iv4o9sfAPIssbjLZt9Narsr/JDlPiPStVYiCdhHahJOFQooft216/33UP7qXMLgO/ym6KGI4CHppsyReoLIjvDUqPx/0GZ2LZso0tlCXVwSwQshJUk8oSdii1QlQxd6XNozY65aNT7DP4uWTT6DM6UlnAnLZS57TkIzywo7o/wDeqd1McBuRB1rW2HU1pAIOOFpxsggV/cSIqHcfTnZ5IAKA+eBa1QISJHQl/4s0QEtHNQ1lsEzEVnsEYJ5rzZbwq+eVhFgEb518A6Kugk8ovD4cQ0SbRRWFPrz2iz3cGN7+1tGY0x8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsczLtLrXEn3F8lWgjXd1RupscsYBmJy7xI/HD6PDDU=;
 b=VN3WscxCqc5ebBPfHLe7q0Gdb9MABRNUixP02YBqTrPuuvxel6Sb8GpFuIw7Uu6v1o46yrzCj3JrmWlsPVaNDv7HgCPXxttBkGz0EKvwF+86m1W7Ajxw5Gw0HZW+4B1CR0i4/h4l6Z0ixzJrxiSo65GygjfFf4Xm2W8Nwv68AI52SHiZ6+xepANw03nOJEdjKwdytREQ+4SR9yngTOHg/qIDm3nhBVwGF7WTyMw/53WaRFsgOSAszG9HCsIyPKlIYAhqaRpGhvAE6U+f8NDF4kUwJ34xGah7pF1uMp1MAQoTQeDdLqpJcykv8PK0lBkthxO/pUbpRzK7HFVgwugHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsczLtLrXEn3F8lWgjXd1RupscsYBmJy7xI/HD6PDDU=;
 b=flvYy+2+V4zqKy5KhgvuCk0hm6a63Q8qm1OL8zgQgi7yY0tcvfXPHUB8G/X8TW6VKvVMfxwxfgboKSxDcRJ3WaSHVYOjjOzrVHN/Mh5jgvvQsIVI8Mb6JyQO1+97OYN3J/S/1uJOGnf9Jevs3mRwAaGNvBtahnQEKy2httdlK3NgMXdcPfOdp8xolZFP5XAnfAtMlj0cnom2FdGWSoZV0ifld1PwBrgnY//22H1dbCqiJwb5U0ZtQ1spprZzMHGKXWNqu1z7Lmn/s2tFvQRthNnFw75R8f9yjbPrfpk01UQ3Lv4Nje6Ta2Gq8bsWw/teC5nPnDM8+63w9SUIp58vjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH0PR12MB5089.namprd12.prod.outlook.com (2603:10b6:610:bc::8)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 02:29:26 +0000
Received: from CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6]) by CH0PR12MB5089.namprd12.prod.outlook.com
 ([fe80::cb31:7ebf:51e3:d9f6%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 02:29:26 +0000
From: David Cemin <dcemin@nvidia.com>
To: xy-jackie@139.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	ikepanhc@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ldemarchi@nvidia.com
Subject: Re: [RFC PATCH 2/3] platform: lenovo: add WMI hotkeys driver
Date: Wed, 18 Nov 2026 18:29:22 -0800
Message-ID: <20261119022922.3090399-1-dcemin@nvidia.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113222755.1696567-3-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com> <20261113222755.1696567-3-dcemin@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To CH0PR12MB5089.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CH0PR12MB5089:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: e910b40a-4234-4ce6-fad0-08df45e4ee55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|261021135927099003|261022105027099003|261021121427099003|261026140227099003|261026121527099003|261102123227099003|261028144727099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	qE67tb0BsskyKOqgLZFvkEJhw1dTn59I18TbcqK+V9HY99ZLxJQY73P9wLYWneooff3K6tblt0QeDitYLXZIDBsdk4m51zoJBsnYpcoyL47os9+UuGOYr4rH2+4FM1Hn08rjb9BGa+qHy1g5bv2Ap9Uoq3MmRR64nWxIU/NuzCJBU1S/GtceCi4NFDim3gKFPx51/ocPEXhQkBmdtr01buLpma1xT7VCu7aWOdLKiFe3gstlGynz7zYeSrZJeiFPylCGFukh4yFb6iYH5G8Uils6G5SivSNMlg/ysBehYeKUi13wfwMJybVkIki2N2Qhi0oIKt1E4F0IiNWTZrn+Gaj2Icu8owBrorvxCpM8CjeebDfA03BOc5hBPSO/L2KHXvj8JhqV0IGGJG5MdlvnFdFx+WxvGijNAeNK5rmfCXOkN9zW66LI29WwYZhuIU28MLRUIngC6rR/xhiDbUhm9ZXR9v0kw4J49M/pzdgMhyl26Lfcnff6jgBfb+Omgo39xbUrN+gH8nPYyfvbGpvj8f+j1j79nrn81nEKAjOF7KC+UEr7v1p8A/FJ9UtRAE7pCAC12lNfgVSl70lKwBrPeVXvfR9qQhxDv0BilyW7TRN5ZxTdA4aBRqB9BtNXtPUYwOVz9KQqSWaTkTlluech2afZ8mEeBPgFNPoT7GoY3hA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR12MB5089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261021135927099003)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FIw1paY/Y3R/k+daleSRqVBLe3DpZFGAe2yZoGL40Pl2Sl2PSCqyjA07qO08?=
 =?us-ascii?Q?93SHrmvSz0tjRCsjPLX2bw06GaJGLSk0Bn/AMTRumd57xs8inuOzG36zsuio?=
 =?us-ascii?Q?ocVdPd2ljitJep+JXcacdZ340sat4zso3HExPa2AqmN9PHP9bD8YOFhD1n0v?=
 =?us-ascii?Q?Y1yssQNzvoMMfOkyJqqSHJNSNpnKbkClwPtmPFAvvL4yAEi5OQOXDl+FaDUc?=
 =?us-ascii?Q?A6FvmkriJ40bwjwy3WU0gZueQLjSK/N6knynNoibge766ZxmQSp8MLdS4KLT?=
 =?us-ascii?Q?mIZmqMbySX7wByCa2g6Lb6y9P9DIAaKYyKMkZMBEHlvGOrgr6drYkyfbi9TT?=
 =?us-ascii?Q?QwlmGNU0tJm6GSlDoEW+n33T6eN0zWw873AnzyeaN/2l/6//YPwN6jDqZI99?=
 =?us-ascii?Q?22x9dKMvIwxJJdqSdOiAzt/sqj54pwsmMxs996gvHPiuwGb7bnsZotRt1abc?=
 =?us-ascii?Q?/FnzthswXiXwUuw9+cN5J/r4necUmYXnP3mJuEBZT1vZOhu18s/Wp6cJRhLW?=
 =?us-ascii?Q?MvS0EJ3MD3TdoVw2XwI1Zr/Pc+Om0Gu0VD0MxdHteABEcyBRyZl9/sHhi7HJ?=
 =?us-ascii?Q?27LiBi1kspgKYZesBurXEVtxG7woGnZHZc57oyDNb2XV7QvSJJR23KWGl7CR?=
 =?us-ascii?Q?GaNVR0lSKbOzZRIwCdLmfMRGZSU4AJZJs4djy2o4GCuIfSrX8rn2MZ7F0dKJ?=
 =?us-ascii?Q?/dUtSb3IbPGsYrjc3WhSRdPY1v0xyoM+0sOucPe90ZE68L6qXPUg8eBtamCD?=
 =?us-ascii?Q?pETN/cwKQUF3hXG3+d+SRPOXy9lvEAGxgCLfY7dPy1MEwOUiv2IJwyKtxoNq?=
 =?us-ascii?Q?tCJQ1M+jtwub3GV7g76aQU37wpg+dc0NC4YSLCSzaasp47tDtf4AQuDXpaKt?=
 =?us-ascii?Q?o1+ZRUOVy9/yYyBq/VslxGFkkSHpBzGwqqYOXnOeuKy6CNbjPcFN4/zS2XTC?=
 =?us-ascii?Q?/fXEpGIjjTYN6gJrCdXPGW56gB/Cl9q3SvtEWSAe47r/bmEhrl95WWtWqRY6?=
 =?us-ascii?Q?jIBwqeZcdl9KPIzEXfq1hgczrQQdJN7QE9+qNUi3EBX0i6+VHQGeWQKUNGfz?=
 =?us-ascii?Q?Z4lA06+qDeP+tB705Lfammz7mRhsdNMzBU6s2fRBjsTZKijzcB9H5Sn6EAEr?=
 =?us-ascii?Q?iZV2GCfUdynQ60HoIjgTfiL1gROYWemM//4e3JROLp2brP6MVc5O+e3EWhX0?=
 =?us-ascii?Q?QgjavQSu2ZLCn62C1GH75VD/EFaIddgsOZPpkIyykUq9nFUvDU/Q0GMnMiag?=
 =?us-ascii?Q?y/myf+nl7IZg9AYXC3G5tz9nMSyXtIChu6Iagl9XroP3E/5k4ld6qSM3IV4V?=
 =?us-ascii?Q?61GCFrWzhUWDc31056Uaw+20295T1EP2FJuI36MyyAjo56ZbVgl0pu45IirI?=
 =?us-ascii?Q?TQxmSRGA0LlRVDYhFWsJ/GvV1bzpQiMFJNeU/CXMFhGl+sQ2C1ZB2i3iasdB?=
 =?us-ascii?Q?TWw9NP7HHx8G2sg96MrWSHqzcKiA3YdeUgSOtc2YSGqquihjMzPq+8zi2SKM?=
 =?us-ascii?Q?oEuTezHUlys2Os31oJvxayn4wdbNzhb8W6gqVFJiyrMngVl/PA4DB9h/dqmK?=
 =?us-ascii?Q?ZZH91Qi4Ws0otuynSwUnEfo81cMgVxVBODMm9HB6I7vtHr8CfEU6fBn77SGe?=
 =?us-ascii?Q?Fbj0JkWCBHgcNOl6JMndoeZcP+IYnt+CcfsX9ZlesSq6s+OKHWJzL2Run2if?=
 =?us-ascii?Q?lD+EZkrkverl6uikkj/k/Ix/J8osOqKIxxXlYBEl1DsRd6AtfWezeTMgfWtI?=
 =?us-ascii?Q?byEjR1kL+g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e910b40a-4234-4ce6-fad0-08df45e4ee55
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 02:29:26.6573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b20wz5JyEz6f5yN4jjU0PtJehRhfECkchQg+vC0MffjyUTmBcg9XPpWjq8lGE1xvhXxSHG0d/hBMBRHYk0C+KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174

Hi Jackie,

Thanks for the review and the Reviewed-by on patch 1.

On merging wmi-hotkeys.c with wmi-hotkey-utilities.c: I kept them
separate because they are different interfaces. wmi-hotkey-utilities.c
drives the method GUID (microphone mute LED, Fn lock state), while
wmi-hotkeys.c owns the event GUIDs and only turns events into input
reports; the notifier chain is how the two sides meet, and ideapad-laptop
uses it. If the maintainers prefer a single file the merge is mechanical
and I am happy to do it in v3; otherwise I would keep the method and event
sides apart, as the other Lenovo WMI drivers do.

v2 is out as 20261119022719.3089229-1-dcemin@nvidia.com and includes
your tag.

Thanks,
David
