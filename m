Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219686;
	b=IJk73AjAZafRQWf72MlBP+OP8zMqBzGESC3C553SMVQWwwquudVw3ZzNo+nLPurN8+D0
	 GDWCvtSiACg3kO8hGnMUYo7Gv6Av0bfYRG7sB3+Gg96JuqQzHp31o+wS/i7g842DCQOze
	 YY03BGrUba0w8kw86aEwQ7Ky/LDF/I4mUos+On7bE6wl7OeTjfspiY8b17N+BvglRzNVu
	 vYbYAKjR1Znme9NbrCwo/DGDol3Y1EHZ2YslGivtoJINJQxL1tXbFEZ//YXdU92chIFbO
	 T4NY1Hqleh1GnKMPJufsYIFOSeL4BIXBia881F0zoaWyTtwOx++/l5wGNlKIahNO8nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219686;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=EjdmTJCyqE7i+oeTR0PBenIaEGPmZWEAi9Nx+/OK6OU=;
	b=b3LH0O1PGECZni9qIBJwGvoWQIrAigg3bitGLdRwoTT4wAJeY8OANT17so427YyWGsq6
	 b1BEWRhDuN/zxoFvygyFB8lhxoCXfnzlYUSgx8Q7TVGlzUsTFy5NzayO2EoGddijMo6RS
	 fD+ANTUgH5w+cwbQ44ACGCaEYMgxwRnk1fVZ/Onb0Pv5ljudkyMO3nP1ycBIh8rsHdRlY
	 lW0huWSxrhr5iO/gW9sDupPgq56V2HwFwjfxxbnoVTUqK+ECXyrxCImX4DpBb5xRdXDYR
	 v/MoN7/fvsx57BJ7fdMRxhBtI9Qkhvo80wspkTSPYuhQVtpijGQt9BX/kYL5O+UD6zA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AKleOnsB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.25
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FBA606A6A1;
	Sat, 21 Nov 2026 00:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FBA606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AKleOnsB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HeVvWtiGptQZfgVI/E+L/7+cuMtDsnreu13dbNrRh3iQoF1k0Ttt44vAWfYWtYfKD17SbNTGwR/3YqRkyL+RMVBO4BFbk339EoCj3/9kQklR3DePTPNFgEW6hr2WoscFvXYfLSjSIDVKeqao+FsZojRAwusWc29k/LPkyBz17q1qNTdgwGhs8YTRpGRWBDcaqjV8mOzMhxspC2gEvS65vkM8XpuTFtOZHqWcIuiJzLluq6CRXSuIrnHEGOGGVg3+1uk8SUVJ3FSVq8sdFfUpXQdVEzsmpOjqqC9pRivUDOZcLcFrWBizgoupbI8s6qT9k7VasZbSn7alpNfKnTUPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjdmTJCyqE7i+oeTR0PBenIaEGPmZWEAi9Nx+/OK6OU=;
 b=og7r8ToBJkqpDdg/jVXsn8Wxk4Ux5BhyJUX8XTL/dCeIKdvzxXQBtPN52bUvNSXwTNNUJWw88dF5xgc4wd4ArfcPdZOPF/KoKkbe+8aFeI6hEShk9dL1TpAwT8uB5IjHsZyRXpfG1A3PodOhMU1EZ8uzo10gncYNQ6AO0urWQ4iYweadOpdJrQIxwlbgn3NN1KV/DtQQmd8Ld/2guVnyPenfNtiYjcRhUNvX6gcwZEsfLuHYJdGpnB8ewMTCtMFhzI1IVf1uOJO+P0EnEq3rLQzrvkKGd7D5oIHebUA7MBJetn+HO+wpY0ZSY1AOQ0MriliSKjCA7Ogsm1ghJsuJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjdmTJCyqE7i+oeTR0PBenIaEGPmZWEAi9Nx+/OK6OU=;
 b=AKleOnsBDy/HukX4eSWsnYtgmYnde3bJem8AvaANfBmG5i+kqeADWGFzjqTem+bCebyKDy6/d4JW1CzSwK1J8W/oJa/f/KMoW+IX0Xw9DiU6eiUIti/znnWfak3T8JMGRDLMe1UjODpJm9uMgHP75Zvh3QHadt8H/jS5L079uVS9WSAj5i8k6lyroLOAdY/MPU1r5nSNDLDYw/mqvb7SYkm6/4FTy6tNb+qjrXuvo688eTuFzC/kQTDl+Tm+W0FPxA/ZgnAuZk1akIv/X/tMr29rL1tQjj4+nSV+eq5JiL7CdEmSpCR/GhIKFFMfZD7goahx+hZObGd5WBCwjsmmYw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sat, 21 Nov
 2026 00:07:46 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:07:46 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>,
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
Subject: [PATCH 2/8] platform: dell: Move out of x86 directory
Date: Fri, 20 Nov 2026 16:05:48 -0800
Message-ID: <20261121000556.173028-3-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121000556.173028-1-bmak@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:303:6a::33) To MN0PR12MB5786.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|SA0PR12MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca53bf5-3de6-4eab-5da1-08df4763789a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|18002099003|6133799003|22082099003|3023799007|261009223027099003|261021121427099003|11063799006|261021135927099003|56012099006|261022075727099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261026121527099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	Z+s0pqod3qqJnKnNPe+MjH0oqC62kc3/rYsMNZw3A58npr9tM6LyW59nFrY1P9X//ik9HiQia1jMCjM0/4JsqZKTiIX6gpRPZXSl1tsWTDlOd/194J4LU4sri4cYws79vvCxxvrTKqCwswSzO8uY+u7Q6DNLNp9mSOejhzlA1pQVbPH7PrGmu1AMwI+wwI90YFXFsXJHn8EFdmcn2qAjObnI+Y6sADI6kNsYrdGgy1OFYrZ3jqltSRNYIphlkCDRP1j2Y2Am0KE4XWMxuIhEn9PkgU8k8UHz5n0Zyx26bhcSATj0RsvlGOOS5AEfIvzrm9qCSHNi4hdGz7CzZnY/PaPxvkdCLEYZaZlivKdtEfwJZwCllVyF7JShIWt2xdv3wIe5DFPXETvsDHKHBS79OsUrlJm683IsJN9jNRL1I3mFwGa4h+Xb1M1Kd6yf3mtYTnqpZARnKpl8SP/Bcp3QespGtpP+oXRrsMVra0X10hiESyjVkzBA37n5IHfy6f23pMZXDy7kR0FNdMfTkPQgt2G6teTR6mgHdW1HYvEZ6mpgxU1Egkr2bL0597FjBdAKuCN5Q32CLu+RKRtnCU571QvyKWD5swXWpe36hy9JnDUUee0SjtuAwfIMfZdONBM0Dn/1y8RaVEujmDXEEm+utKK1AvgOguv2NHVcmjpW5VE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(18002099003)(6133799003)(22082099003)(3023799007)(261009223027099003)(261021121427099003)(11063799006)(261021135927099003)(56012099006)(261022075727099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261026121527099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmovQmQ3cWRzb0RISzlvaDhEOTJ4bFpxdnpFMGtXc21BVWh2eTZhbitVVVd4?=
 =?utf-8?B?aVNGTmZ4WWdvN1RYRG1iMTBoNmdURE90TytLM1I0QUFiWmxkcXlhTmZ1SnhJ?=
 =?utf-8?B?WnRIU3JzZm9DUnVNdWRkMmRubnZ0NVFsbGNKVEkwbWRwbjF1ekQ4WVRlRi9L?=
 =?utf-8?B?c2g3OFhlSmNKenVRY1pIbm1KblRBNm5JMEF2aE1nS1diSTNmM21qTHVjOWth?=
 =?utf-8?B?Rjl1c2VtZHRDcDRKZklIS0ROVW5lY1JLK0ZHZUdSVCsvTFpwSnQvVlJmWGth?=
 =?utf-8?B?eVBUVk1HNWFTdGJvdGdCblBqSEpXMjA2WE14UnFseGx0djNxNGE2a0FlWmdV?=
 =?utf-8?B?ZjFGeHAzRjBpTVM4YXdHcWN4TG1MaFVWR0lBanJtQlJvWWRjWC90Sml4WDdv?=
 =?utf-8?B?VGFmMFBucDhYcUNWVFJEQVVwWjRlcWx5dFhBbTdLV3BMaWpFTENxOWJlZkJQ?=
 =?utf-8?B?TnE2R1BsbkZKSjF5TWlYeEQxNVE3ME96K0lURWx6emhmaWM0b3hzVDFRSFdO?=
 =?utf-8?B?Q1Z3VGlPS1dLbUFBTEgydzdKdk0zWFFSdG00dFQ5NExENWdlbnZMakFjKzJj?=
 =?utf-8?B?d0hweUR4cjRMT2dKcUl4aDVYU3RiWmduZGZWUnpOWTYyc0c4OHhoQ1JzcFMw?=
 =?utf-8?B?TlpwTzBnQWVyaGRZbVFRN3ZLWWNOanBGOEE1MC9aWkV2WTRSbm9temFuWGda?=
 =?utf-8?B?TFVKS1lPTGNrdHNOZHRuQ2czeTFHVVRGVFp4c3Y2dVlLU1BaMldrMENzc1Iy?=
 =?utf-8?B?dHpNQklwQ05LNVlLS0dHT0UzZjc4ZEdkaVZMSUVxK2twY1V1ZjR4YjdSNmZa?=
 =?utf-8?B?aUZuUUxNd3UycjR2a3h3Nm9uSTJPYXVRZzJEbFU3S3d3Q0EzRy94L0pOMUhG?=
 =?utf-8?B?T3VJYlJvaXYzZmtzRHlZNVJGdjRTNlJQMjk0TXc0LzNRMU52NGVHSzg0Q3Uw?=
 =?utf-8?B?OUVSZC9lWEVzUEZSelgyUWJ6M1Z5amxFQ0N4KzQ3RXFmZmE5eGN5UktNanpG?=
 =?utf-8?B?cTQ0WXZyRWIwcGFiNkp3NGcxSGpsMkhldW9lVTg1bjFiUkEyUy9mdS9zZko2?=
 =?utf-8?B?VVFFNE13NlFzVlRQcHhMMmI0MnVtRXpyNk9UNVNWWlM5NnhWa3VTU084b1R0?=
 =?utf-8?B?d3ZDUC9CWXBHYzc4QnU2bjFYOU12ODAxYUpQRy9ZcnpPZlZHR2JMMkZGZUU5?=
 =?utf-8?B?YmVNNXVaUEpYbUNaT0R6TXVPcDdyMm55NDlHaHVrYmhBTXJzZ3ZCUVdtQkZi?=
 =?utf-8?B?QzlzdW5tRnluRVRPcGx1RVRqTTR2NXE0UFNob2hjMWV5NmtsMXdOKzc2YXRP?=
 =?utf-8?B?Q04yUzlDbnFnWVk2d2MxOXlDSzUvY1pxbERUVGlxUmdOMkZLUWRtSnRQazZ0?=
 =?utf-8?B?VWpPNk0xYTlYenhWdjRMVEtOV05VY1RFT0pkWEZTUkZadEVQUTNBNWVrbVpk?=
 =?utf-8?B?bnI4SFNPRENLOS9wTm1aSjFSM2FaNG9VRHBhaFJSNEM2U2RrTVIvaktPQXpp?=
 =?utf-8?B?U2VTUW10SS9nNk12K0ZIaEY2RExpdTc1dklBK1JRN2MweVc0cTBGcDZaUU9Z?=
 =?utf-8?B?amFQaEJkamNSOERQSzVUdkVlSkMrdStNVTA3QUxHS21WWHgybkJzNklVakJ1?=
 =?utf-8?B?cmVCcVpCakVMd2FvRmEyT3N0dHpuOUNjazRVbitWeUNQWklsN0NSenBUTms3?=
 =?utf-8?B?bURMaERoOUQzUVlCQ0h2YktiL3ZwVUdPdis2VFV1V0lNK1ZicS8rdlE3SWZL?=
 =?utf-8?B?Y0tKdStWbWFMc3lJNjVzRTJFNjNSUWtCVHRFK3R2QTFoN1QvWk9xY3UzNk15?=
 =?utf-8?B?eDI3VWRPREJxUXJIZ1dDcW9IRlhXS1I0NURUU3RvY1pOK0k3TXFVWENwK2kw?=
 =?utf-8?B?VmVtUUpmWURXQit1TWxvNFNIeFhTRGQrSXF2MVhTS0JHK2QxRWhRNjYraGFX?=
 =?utf-8?B?TjR2dmJwdXhXamxkcVBtN0I3OExyMmc3d0kxU2xDRE12bFpFd1QzTGppbGNL?=
 =?utf-8?B?Um44UTRmOFlGaFU5SjRCUE1OQjM2bUs5eHQ4SVhCUWxyVDVleWZKcUd5ZmFv?=
 =?utf-8?B?Um1uRnpmQTBYV3VzYU1RZjBHejBRM0JaY3hDd3RaWUwrWUxvcENhMFdad2VE?=
 =?utf-8?B?TlZ6d1o2N0FMSmFDNTBuSFMzYVdQU3FxMFRoNVpoc3QvTE1YWHhJUGxnaWVx?=
 =?utf-8?B?Y2c1SDZ1aWVmdGpIV2ZJbytCSlI3bTJrM0pCdnIvZEh3NFlDdWxmdjFYbzFQ?=
 =?utf-8?B?bnkyWGpYVFVsQi9QY2E2RC9YUmZRTktnSmZ5M0lob0ZxM3N2UGZyZ1Y0Vjlu?=
 =?utf-8?B?K3U0WXdxRUlYOEFmMk5CVjM5UWdRU2xDbUxrWk5WNnpFSkY1TW5Ydz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca53bf5-3de6-4eab-5da1-08df4763789a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:07:46.2390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6qfN7sUi3jxSv+5DN4sGYs6njFSimWmPIIffLN3jLKq8UqJkpsc9lV0nEsFjR6/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446

With the introduction of the Dell XPS 16 Creator Edition, Dell platform
drivers are no longer just applicable to x86, but also ARM64. Move Dell
platform drivers out of the x86 directory, so they can be reused for
ARM64.

Rename CONFIG_X86_PLATFORM_DRIVERS_DELL to CONFIG_DELL_PLATFORMS, and
add a transitional config.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 .../admin-guide/laptops/alienware-wmi.rst     |  4 +--
 MAINTAINERS                                   | 30 +++++++++----------
 drivers/platform/Kconfig                      |  2 ++
 drivers/platform/Makefile                     |  1 +
 drivers/platform/{x86 => }/dell/Kconfig       | 18 +++++++----
 drivers/platform/{x86 => }/dell/Makefile      |  4 +--
 .../{x86 => }/dell/alienware-wmi-base.c       |  0
 .../{x86 => }/dell/alienware-wmi-legacy.c     |  0
 .../{x86 => }/dell/alienware-wmi-wmax.c       |  0
 .../platform/{x86 => }/dell/alienware-wmi.h   |  0
 drivers/platform/{x86 => }/dell/dcdbas.c      |  0
 drivers/platform/{x86 => }/dell/dcdbas.h      |  0
 .../{x86 => }/dell/dell-dw5826e-reset.c       |  0
 drivers/platform/{x86 => }/dell/dell-laptop.c |  0
 .../platform/{x86 => }/dell/dell-lis3lv02d.c  |  0
 drivers/platform/{x86 => }/dell/dell-pc.c     |  0
 drivers/platform/{x86 => }/dell/dell-rbtn.c   |  0
 drivers/platform/{x86 => }/dell/dell-rbtn.h   |  0
 .../{x86 => }/dell/dell-smbios-base.c         |  0
 .../platform/{x86 => }/dell/dell-smbios-smm.c |  0
 .../platform/{x86 => }/dell/dell-smbios-wmi.c |  0
 drivers/platform/{x86 => }/dell/dell-smbios.h |  0
 .../{x86 => }/dell/dell-smo8800-ids.h         |  0
 .../platform/{x86 => }/dell/dell-smo8800.c    |  0
 .../{x86 => }/dell/dell-uart-backlight.c      |  2 +-
 .../platform/{x86 => }/dell/dell-wmi-aio.c    |  0
 .../platform/{x86 => }/dell/dell-wmi-base.c   |  0
 .../platform/{x86 => }/dell/dell-wmi-ddv.c    |  0
 .../{x86 => }/dell/dell-wmi-descriptor.c      |  0
 .../{x86 => }/dell/dell-wmi-descriptor.h      |  0
 .../platform/{x86 => }/dell/dell-wmi-led.c    |  0
 .../{x86 => }/dell/dell-wmi-privacy.c         |  0
 .../{x86 => }/dell/dell-wmi-privacy.h         |  0
 .../{x86 => }/dell/dell-wmi-sysman/Makefile   |  0
 .../dell/dell-wmi-sysman/biosattr-interface.c |  0
 .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  0
 .../dell/dell-wmi-sysman/enum-attributes.c    |  0
 .../dell/dell-wmi-sysman/int-attributes.c     |  0
 .../dell/dell-wmi-sysman/passobj-attributes.c |  0
 .../dell-wmi-sysman/passwordattr-interface.c  |  0
 .../dell/dell-wmi-sysman/string-attributes.c  |  0
 .../{x86 => }/dell/dell-wmi-sysman/sysman.c   |  0
 drivers/platform/{x86 => }/dell/dell_rbu.c    |  0
 drivers/platform/x86/Kconfig                  |  2 --
 drivers/platform/x86/Makefile                 |  3 --
 .../x86/dell-uart-backlight-emulator/README   |  4 +--
 46 files changed, 37 insertions(+), 33 deletions(-)
 rename drivers/platform/{x86 => }/dell/Kconfig (96%)
 rename drivers/platform/{x86 => }/dell/Makefile (93%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-base.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-legacy.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-wmax.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi.h (100%)
 rename drivers/platform/{x86 => }/dell/dcdbas.c (100%)
 rename drivers/platform/{x86 => }/dell/dcdbas.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-dw5826e-reset.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-laptop.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-lis3lv02d.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-pc.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-rbtn.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-rbtn.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-base.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-smm.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-wmi.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-smo8800-ids.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-smo8800.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-uart-backlight.c (99%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-aio.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-base.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-ddv.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-descriptor.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-descriptor.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-led.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-privacy.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-privacy.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/Makefile (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/biosattr-interface.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/dell-wmi-sysman.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/enum-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/int-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/passobj-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/passwordattr-interface.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/string-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/sysman.c (100%)
 rename drivers/platform/{x86 => }/dell/dell_rbu.c (100%)

diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Documentation/admin-guide/laptops/alienware-wmi.rst
index e532c60db8e2..2156d46e4b74 100644
--- a/Documentation/admin-guide/laptops/alienware-wmi.rst
+++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
@@ -40,8 +40,8 @@ parameters:
 
 If the module loads successfully with these parameters, consider submitting a
 patch adding your model to the ``awcc_dmi_table`` located in
-``drivers/platform/x86/dell/alienware-wmi-wmax.c`` or contacting the maintainer
-for further guidance.
+``drivers/platform/dell/alienware-wmi-wmax.c`` or contacting the maintainer for
+further guidance.
 
 Status
 ------
diff --git a/MAINTAINERS b/MAINTAINERS
index 3ed1991cac46..0de02594cd30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -868,7 +868,7 @@ F:	Documentation/ABI/testing/debugfs-alienware-wmi
 F:	Documentation/ABI/testing/sysfs-platform-alienware-wmi
 F:	Documentation/admin-guide/laptops/alienware-wmi.rst
 F:	Documentation/wmi/devices/alienware-wmi.rst
-F:	drivers/platform/x86/dell/alienware-wmi*
+F:	drivers/platform/dell/alienware-wmi*
 
 ALLEGRO DVT VIDEO IP CORE DRIVER
 M:	Michael Tretter <m.tretter@pengutronix.de>
@@ -7452,17 +7452,17 @@ M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali@kernel.org>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-laptop.c
+F:	drivers/platform/dell/dell-laptop.c
 
 DELL LAPTOP FREEFALL DRIVER
 M:	Pali Rohár <pali@kernel.org>
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-smo8800.c
+F:	drivers/platform/dell/dell-smo8800.c
 
 DELL LAPTOP RBTN DRIVER
 M:	Pali Rohár <pali@kernel.org>
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-rbtn.*
+F:	drivers/platform/dell/dell-rbtn.*
 
 DELL LAPTOP SMM DRIVER
 M:	Pali Rohár <pali@kernel.org>
@@ -7475,32 +7475,32 @@ DELL PC DRIVER
 M:	Lyndon Sanche <lsanche@lyndeno.ca>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-pc.c
+F:	drivers/platform/dell/dell-pc.c
 
 DELL REMOTE BIOS UPDATE DRIVER
 M:	Stuart Hayes <stuart.w.hayes@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell_rbu.c
+F:	drivers/platform/dell/dell_rbu.c
 
 DELL SMBIOS DRIVER
 M:	Pali Rohár <pali@kernel.org>
 L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-smbios.*
+F:	drivers/platform/dell/dell-smbios.*
 
 DELL SMBIOS SMM DRIVER
 L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-smbios-smm.c
+F:	drivers/platform/dell/dell-smbios-smm.c
 
 DELL SMBIOS WMI DRIVER
 L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-smbios-wmi.c
+F:	drivers/platform/dell/dell-smbios-wmi.c
 F:	tools/wmi/dell-smbios-example.c
 
 DELL SYSTEMS MANAGEMENT BASE DRIVER (dcdbas)
@@ -7508,7 +7508,7 @@ M:	Stuart Hayes <stuart.w.hayes@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/userspace-api/dcdbas.rst
-F:	drivers/platform/x86/dell/dcdbas.*
+F:	drivers/platform/dell/dcdbas.*
 
 DELL WMI DDV DRIVER
 M:	Armin Wolf <W_Armin@gmx.de>
@@ -7516,24 +7516,24 @@ S:	Maintained
 F:	Documentation/ABI/testing/debugfs-dell-wmi-ddv
 F:	Documentation/ABI/testing/sysfs-platform-dell-wmi-ddv
 F:	Documentation/wmi/devices/dell-wmi-ddv.rst
-F:	drivers/platform/x86/dell/dell-wmi-ddv.c
+F:	drivers/platform/dell/dell-wmi-ddv.c
 
 DELL WMI DESCRIPTOR DRIVER
 L:	Dell.Client.Kernel@dell.com
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-wmi-descriptor.c
+F:	drivers/platform/dell/dell-wmi-descriptor.c
 
 DELL WMI HARDWARE PRIVACY SUPPORT
 L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-wmi-privacy.c
+F:	drivers/platform/dell/dell-wmi-privacy.c
 
 DELL WMI NOTIFICATIONS DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali@kernel.org>
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-wmi-base.c
+F:	drivers/platform/dell/dell-wmi-base.c
 
 DELL WMI SYSMAN DRIVER
 M:	Prasanth Ksr <prasanth.ksr@dell.com>
@@ -7541,7 +7541,7 @@ L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
-F:	drivers/platform/x86/dell/dell-wmi-sysman/
+F:	drivers/platform/dell/dell-wmi-sysman/
 
 DELTA AHE-50DC FAN CONTROL MODULE DRIVER
 M:	Zev Weiss <zev@bewilderbeest.net>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 312788f249c9..92a395bbd9ab 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -15,6 +15,8 @@ source "drivers/platform/olpc/Kconfig"
 
 source "drivers/platform/surface/Kconfig"
 
+source "drivers/platform/dell/Kconfig"
+
 source "drivers/platform/x86/Kconfig"
 
 source "drivers/platform/arm64/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fa322e7f8716..385c33c94f24 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
+obj-$(CONFIG_DELL_PLATFORMS)	+= dell/
 obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= raspberrypi/
 obj-$(CONFIG_ACPI_WMI)		+= wmi/
diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/dell/Kconfig
similarity index 96%
rename from drivers/platform/x86/dell/Kconfig
rename to drivers/platform/dell/Kconfig
index 4c28d4c008fc..7030f817b6af 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/dell/Kconfig
@@ -1,18 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
-# Dell X86 Platform Specific Drivers
+# Dell Platform Specific Drivers
 #
 
-menuconfig X86_PLATFORM_DRIVERS_DELL
-	bool "Dell X86 Platform Specific Device Drivers"
+menuconfig DELL_PLATFORMS
+	bool "Dell Platform Specific Device Drivers"
+	depends on X86 || ARM64 || COMPILE_TEST
+	default X86_PLATFORM_DRIVERS_DELL
 	help
 	  Say Y here to get to see options for device drivers for various
-	  Dell x86 platforms, including vendor-specific laptop extension drivers.
+	  Dell platforms, including vendor-specific laptop extension drivers.
 	  This option alone does not add any kernel code.
 
 	  If you say N, all options in this submenu will be skipped and disabled.
 
-if X86_PLATFORM_DRIVERS_DELL
+if DELL_PLATFORMS
 
 config ALIENWARE_WMI
 	tristate "Alienware Special feature control"
@@ -282,4 +284,8 @@ config DELL_DW5826E_RESET
 	depends on ACPI
 	help
 	  This adds support for the Dell DW5826e PLDR reset via ACPI
-endif # X86_PLATFORM_DRIVERS_DELL
+endif # DELL_PLATFORMS
+
+config X86_PLATFORM_DRIVERS_DELL
+	bool
+	transitional
diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/dell/Makefile
similarity index 93%
rename from drivers/platform/x86/dell/Makefile
rename to drivers/platform/dell/Makefile
index 470874c6e6e6..115511258924 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/dell/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
-# Makefile for linux/drivers/platform/x86/dell
-# Dell x86 Platform-Specific Drivers
+# Makefile for linux/drivers/platform/dell
+# Dell Platform-Specific Drivers
 #
 
 obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/dell/alienware-wmi-base.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi-base.c
rename to drivers/platform/dell/alienware-wmi-base.c
diff --git a/drivers/platform/x86/dell/alienware-wmi-legacy.c b/drivers/platform/dell/alienware-wmi-legacy.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi-legacy.c
rename to drivers/platform/dell/alienware-wmi-legacy.c
diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/dell/alienware-wmi-wmax.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi-wmax.c
rename to drivers/platform/dell/alienware-wmi-wmax.c
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/dell/alienware-wmi.h
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi.h
rename to drivers/platform/dell/alienware-wmi.h
diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/dell/dcdbas.c
similarity index 100%
rename from drivers/platform/x86/dell/dcdbas.c
rename to drivers/platform/dell/dcdbas.c
diff --git a/drivers/platform/x86/dell/dcdbas.h b/drivers/platform/dell/dcdbas.h
similarity index 100%
rename from drivers/platform/x86/dell/dcdbas.h
rename to drivers/platform/dell/dcdbas.h
diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/dell/dell-dw5826e-reset.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-dw5826e-reset.c
rename to drivers/platform/dell/dell-dw5826e-reset.c
diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/dell/dell-laptop.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-laptop.c
rename to drivers/platform/dell/dell-laptop.c
diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/dell/dell-lis3lv02d.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-lis3lv02d.c
rename to drivers/platform/dell/dell-lis3lv02d.c
diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/dell/dell-pc.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-pc.c
rename to drivers/platform/dell/dell-pc.c
diff --git a/drivers/platform/x86/dell/dell-rbtn.c b/drivers/platform/dell/dell-rbtn.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-rbtn.c
rename to drivers/platform/dell/dell-rbtn.c
diff --git a/drivers/platform/x86/dell/dell-rbtn.h b/drivers/platform/dell/dell-rbtn.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-rbtn.h
rename to drivers/platform/dell/dell-rbtn.h
diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/dell/dell-smbios-base.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-smbios-base.c
rename to drivers/platform/dell/dell-smbios-base.c
diff --git a/drivers/platform/x86/dell/dell-smbios-smm.c b/drivers/platform/dell/dell-smbios-smm.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-smbios-smm.c
rename to drivers/platform/dell/dell-smbios-smm.c
diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/dell/dell-smbios-wmi.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-smbios-wmi.c
rename to drivers/platform/dell/dell-smbios-wmi.c
diff --git a/drivers/platform/x86/dell/dell-smbios.h b/drivers/platform/dell/dell-smbios.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-smbios.h
rename to drivers/platform/dell/dell-smbios.h
diff --git a/drivers/platform/x86/dell/dell-smo8800-ids.h b/drivers/platform/dell/dell-smo8800-ids.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-smo8800-ids.h
rename to drivers/platform/dell/dell-smo8800-ids.h
diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/dell/dell-smo8800.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-smo8800.c
rename to drivers/platform/dell/dell-smo8800.c
diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/dell/dell-uart-backlight.c
similarity index 99%
rename from drivers/platform/x86/dell/dell-uart-backlight.c
rename to drivers/platform/dell/dell-uart-backlight.c
index bbb270ae3697..da43e25200cd 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/dell/dell-uart-backlight.c
@@ -21,7 +21,7 @@
 #include <linux/types.h>
 #include <linux/wait.h>
 #include <acpi/video.h>
-#include "../serdev_helpers.h"
+#include "../x86/serdev_helpers.h"
 
 /* The backlight controller must respond within 1 second */
 #define DELL_BL_TIMEOUT		msecs_to_jiffies(1000)
diff --git a/drivers/platform/x86/dell/dell-wmi-aio.c b/drivers/platform/dell/dell-wmi-aio.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-aio.c
rename to drivers/platform/dell/dell-wmi-aio.c
diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/dell/dell-wmi-base.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-base.c
rename to drivers/platform/dell/dell-wmi-base.c
diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/dell/dell-wmi-ddv.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-ddv.c
rename to drivers/platform/dell/dell-wmi-ddv.c
diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/platform/dell/dell-wmi-descriptor.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-descriptor.c
rename to drivers/platform/dell/dell-wmi-descriptor.c
diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.h b/drivers/platform/dell/dell-wmi-descriptor.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-descriptor.h
rename to drivers/platform/dell/dell-wmi-descriptor.h
diff --git a/drivers/platform/x86/dell/dell-wmi-led.c b/drivers/platform/dell/dell-wmi-led.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-led.c
rename to drivers/platform/dell/dell-wmi-led.c
diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platform/dell/dell-wmi-privacy.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-privacy.c
rename to drivers/platform/dell/dell-wmi-privacy.c
diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.h b/drivers/platform/dell/dell-wmi-privacy.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-privacy.h
rename to drivers/platform/dell/dell-wmi-privacy.h
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/Makefile b/drivers/platform/dell/dell-wmi-sysman/Makefile
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/Makefile
rename to drivers/platform/dell/dell-wmi-sysman/Makefile
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c b/drivers/platform/dell/dell-wmi-sysman/biosattr-interface.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
rename to drivers/platform/dell/dell-wmi-sysman/biosattr-interface.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/dell/dell-wmi-sysman/dell-wmi-sysman.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
rename to drivers/platform/dell/dell-wmi-sysman/dell-wmi-sysman.h
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c b/drivers/platform/dell/dell-wmi-sysman/enum-attributes.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
rename to drivers/platform/dell/dell-wmi-sysman/enum-attributes.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c b/drivers/platform/dell/dell-wmi-sysman/int-attributes.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
rename to drivers/platform/dell/dell-wmi-sysman/int-attributes.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c b/drivers/platform/dell/dell-wmi-sysman/passobj-attributes.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
rename to drivers/platform/dell/dell-wmi-sysman/passobj-attributes.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/dell/dell-wmi-sysman/passwordattr-interface.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
rename to drivers/platform/dell/dell-wmi-sysman/passwordattr-interface.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c b/drivers/platform/dell/dell-wmi-sysman/string-attributes.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
rename to drivers/platform/dell/dell-wmi-sysman/string-attributes.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/dell/dell-wmi-sysman/sysman.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
rename to drivers/platform/dell/dell-wmi-sysman/sysman.c
diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/dell/dell_rbu.c
similarity index 100%
rename from drivers/platform/x86/dell/dell_rbu.c
rename to drivers/platform/dell/dell_rbu.c
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e0475e..42ffe63d0a39 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -392,8 +392,6 @@ config EEEPC_WMI
 	  If you have an ACPI-WMI compatible Eee PC laptop (>= 1000), say Y or M
 	  here.
 
-source "drivers/platform/x86/dell/Kconfig"
-
 config AMILO_RFKILL
 	tristate "Fujitsu-Siemens Amilo rfkill support"
 	depends on RFKILL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 229057234d00..3bb983a641ca 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -44,9 +44,6 @@ obj-$(CONFIG_AYANEO_EC)		+= ayaneo-ec.o
 # Cisco/Meraki
 obj-$(CONFIG_MERAKI_MX100)	+= meraki-mx100.o
 
-# Dell
-obj-$(CONFIG_X86_PLATFORM_DRIVERS_DELL)		+= dell/
-
 # Fujitsu
 obj-$(CONFIG_AMILO_RFKILL)	+= amilo-rfkill.o
 obj-$(CONFIG_FUJITSU_LAPTOP)	+= fujitsu-laptop.o
diff --git a/tools/arch/x86/dell-uart-backlight-emulator/README b/tools/arch/x86/dell-uart-backlight-emulator/README
index c0d8e52046ee..d38d91abcf8c 100644
--- a/tools/arch/x86/dell-uart-backlight-emulator/README
+++ b/tools/arch/x86/dell-uart-backlight-emulator/README
@@ -13,8 +13,8 @@ With the DELL0501 indicating that we are dealing with an UART with
 the backlight controller board attached.
 
 This small emulator allows testing
-the drivers/platform/x86/dell/dell-uart-backlight.c driver without access
-to an actual Dell All In One.
+the drivers/platform/dell/dell-uart-backlight.c driver without access to
+an actual Dell All In One.
 
 This requires:
 1. A (desktop) PC with a 16550 UART on the motherboard and a standard DB9
-- 
2.53.0

