Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCEC305075
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606840; cv=fail; b=A9EnY20O0z2oyRcvk30gpF4qN1NIhC2MPSPl4Np1QuCq8QCebt1Y/yPfzpxE/bqxip2iXPtlInwJi+TcKU03LloikoaLlyCOzoGhllMpvhirKk3IDnm5RFEpTS9ZHYbXxNXhqI+Xvn23kmqYrMsLkUv7S1GnYEvHb7A9TFG0vO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606840; c=relaxed/simple;
	bh=LrJ5OUn1txj/4x2EZB36dldQbAznOFN59ewRm1aO+tU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fnTOOyuI81I2FBO93OTGjsXZP7gjHsPAvAuOJn5TAddlVHTFACRxHi4l9UbGT9fDpQM4ATfKKpTs9+Ejb5DLnhdd886HSa0L/4FncdYIk0jyKjM5nscs8r23PwxdSkF7nanMauYVogn/58j/98Ffx3AwwfxQiq/igZjEEdVrJhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KOKjPn+o; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KOKjPn+o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIIhgr4MQa0zV99CuuCxZNPwSrBNS0BZXqF2XpaurTMXDawMpv4QdFTwP/Dzg3WchqN0GZbxUo+UOAabMzuUSKD+GXalpnrsb03plQq6Va3T6s56THmYdRvIxmPt30ffMScmIteSWcrkEOKbf19/ZvC/ZovojUYrCxrcxbDsFI/YgNoBDHVLVZrpGofQlk389dqRq5GD5/pqPpVwuHvVwdE7KBa/RCLm1Rg44w/VFPxxArv+vxwslma0sg5MQTo+gQBqR+SUWfG+RzFRzTuS54lIeLibxy41Lp62BOzdTq9tZ70vJeiY6e5toUDvgrQTnZSK63mOdvCuqNvba13/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1y0ganMTa7NWAywB9u9muw9tLobFel3MTKc5SUBMg8=;
 b=f9x+Cf3IStHp2hf4hpm35T8Sjjz1w0m8HU5jXfrZdmU0OmpWFrtQ+CWY6OCso51LIswvOEUN+TZXNbPMffK6cyqnqmXKqlyVn0SJAzqtDpVdGG1+hUQhVECFkazVnjrqUP6cyn2xDlOAkvIGjyfFBTG6jJSDR7dOjF7R/fXW2ZKYQ6qIeZ8ZYHW/3JC/wRrGMvZD3G2J6I5eHm1bjvoYGbIZZL1izeDfZfNQ2krjxdpnKCgH8lI4VbcGRZ9trDCb9JftzIBz8oT2PLMvLQTR0g9yQt58dMWnReY5XZAt67mk73HfeH2hehb3H9LGtpGEpPN40LujUHd6U3UsQXTV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1y0ganMTa7NWAywB9u9muw9tLobFel3MTKc5SUBMg8=;
 b=KOKjPn+ozicTesdvI8bgflER86H/EPlp8N51XAJ5vhPqikc1TtTpB8njGowDKWeiJsDPv9vnlKZOGLZczv3mMIzfWmasd4wYxDK3K7+/Wgsutnd3EjpRVSSBDgEcKS5bD4HojdMjwwTkBCo/s2dBp+Wpqng4+JrkAYKBdSom+Ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BN7PPF49208036B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6cf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Tue, 19 Aug
 2025 12:33:56 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 12:33:56 +0000
Message-ID: <9ec2e048-a14c-4235-9bfd-4d08ef039476@amd.com>
Date: Tue, 19 Aug 2025 18:03:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] platform/x86/amd/pmf: Update ta_pmf_action
 structure member
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
 <20250723064121.2051232-5-Shyam-sundar.S-k@amd.com>
 <0c6a6c0d-9abe-eb64-7902-b9f1045835f5@linux.intel.com>
 <3d800301-526a-40fc-be67-ae067de03bfe@amd.com>
 <4a3310d1-0da5-e31f-f25d-5d255fec3d98@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <4a3310d1-0da5-e31f-f25d-5d255fec3d98@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BN7PPF49208036B:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a129446-4eb2-4196-a4d8-08dddf1ca97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mks5U0JCQ0s1OWRJVG1SU2JjL1BJWVFIbDF0RVZPWjRnc2V0SUtjMjJXSVli?=
 =?utf-8?B?Y0FhRXpOc3RQTW9PSEZIb1pSVjlIQk5NOEd5S1I4MWdlNFJYVlhWOHhqeDkz?=
 =?utf-8?B?MjIxM2lyNG1WUi93YlNvUVZEMXV0bXZubHAvekRuekNhVi85TFBZTWd1Z1Ns?=
 =?utf-8?B?dnIwQTcrYnIwL0g4S1lQYVVzMFY3YVhsdG1hZG1mL2xpVVJLcndiRmRoTExF?=
 =?utf-8?B?a2x1SzFTLy8zb21LZFk5aVRUVC9reEJ0ajQrRER1MU8zdDVWRnNsMWJ5Vlla?=
 =?utf-8?B?Skd4VEdTRVMzUVFRaHJ5MDl1OExDY2Fna0ZoRTlVTExxczJPakwwb3BRajZh?=
 =?utf-8?B?RWl1d0h5K09JV1RTUEJSR252MnZpSXlFbXNjYk9ZVWc5SzRYU0loOFpmT1VJ?=
 =?utf-8?B?UzhpMWlQcFZTcWFoMkVJMVROZlUrb2pqUkFBSFhYSzZuZXVWaGNZTXZxNzM3?=
 =?utf-8?B?UlFKYTZwNCtDY1EzRkV0aHg5NkhpMkswNXFSUE55WDZ2dFZtdFhyV2FWUHcw?=
 =?utf-8?B?eFVHZUJVOFFobG1qQ1ZXVmVMeVFQb3BTb09BUE1wTlgrTGhxWWRzZTM5S2gr?=
 =?utf-8?B?SVRxVVl1VFFEU293RklrMkRaOHhnWHA2eWxqTExlVEpGZ3U1b2ZtWVlmKzRM?=
 =?utf-8?B?eFMzaU9Ld2VwTU5XbG1MYzE1emREd1MxdkNveDByTXI1ZkRrQ2M1cmNRT25l?=
 =?utf-8?B?cHN2SnkzQlVia3BSL25SYU00ZzJwc3pLZmU0ZmFEaVN4K3lWMkZZajh1eG1O?=
 =?utf-8?B?MEdSUE1vaFB4WkVkd0xNOU1nRUUyTEZDRHl6aDNWdnppWmE3eGZqdW40TlRw?=
 =?utf-8?B?dWpaY0IwMXVLV1VCYUt2OTBnYVAweThKL0FZRVVrQXY2MVZvaFNzRHpoRS9l?=
 =?utf-8?B?bTh0dnJJamNCbVhnYkFrS0liUGVyVm9OUlkyUWxHL0VtOGZYT2hBZXBDanZl?=
 =?utf-8?B?ZmIxZ1FEeFVZSGo2Z2p0SjR3NmpBczhpQ2ljYW1ZdlBHVmZpbWJuWmVmVi8y?=
 =?utf-8?B?QXliNjI2cVYyYU1OeW0vaDVNeEpwdEZDUWcvY3NLQjB5WkNhc3gzc3ZlUCtx?=
 =?utf-8?B?SHNHanJWSDdXdllMVnYvcWZvaGlXR2lHbFlrWXMzNmp6cWNqOC9kR2J4NFRy?=
 =?utf-8?B?RmtONVZEbVlZdmIrY2hMbnJNYy95TUQ0SmxxOThVQXZtMS9uYk9KdHlCUXZ3?=
 =?utf-8?B?ZXYyQVloMzNyUXBRYjBlZWF6STNZbTd1RTNiY1RKcUNYeGhUZzUzSTU2aEpF?=
 =?utf-8?B?M3RwMW4wbktZTzZ2UVNvSUNrc3pPZDFJNXZwQml4TXoycnpLQno5ODR4bE5E?=
 =?utf-8?B?eDNFYkt3QkdsZytIV0szcC8vUWx0dUtzYTEzNHRwUFZDbjJqQlV5NGJBUE9Q?=
 =?utf-8?B?UHVVL3RrZ0JmNjdKT2I2cVZSWjkvcGVEbHZnaG1rVUt0WksyVkgxRmpaSlJT?=
 =?utf-8?B?WkpJV3gvV2xDSllERWx6eWNVSlFQR2w4dlRIYkdaTFZUNEdrTjN6SUl6bVpV?=
 =?utf-8?B?L2JhYjRlamxCN042cEJVWDQxbXhRVGtNVlFGVHdzbmxkU3FtRTdpdmZKVGpV?=
 =?utf-8?B?dkliTW9iQXRjRGlKbVl6N21Cb2tuZUdVTzBWTkk0R2lGVTlLVXF2VGRkOFFN?=
 =?utf-8?B?ZXJwOVpRc3BpanZpSlNyRmlBcWhEeFpWVXlmKzcvNHJ4clBvVHhYbmpwOHNw?=
 =?utf-8?B?TnJud04wUVZ4eGw4L3FzTW9MMlJoei9aMjFQSDRDWk9Sa2JVOVMvMnF1YjVk?=
 =?utf-8?B?RkJDdEV1akF4RzNOVS9ab1BVNnBzaGdQQmx6b2FWZ3ArNy9tUDYraWFXbnRh?=
 =?utf-8?B?MXRQREkzbXRMVEFkMHFWR2VybWFrSzVwMUZVemcxamR2dHpQMW9MNnBtYitU?=
 =?utf-8?B?WjRMcWFKZU1SK2hjRzRRUXFJRTlIU1dqMUhEZmJETWFaRGk0SytKUm5PQWxp?=
 =?utf-8?Q?h+RDkalWWjs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NiswZThtdnQvSCt2a092TGUwVTVpakpDNkVVR1dYd0JKcmRNQ1dSVkE3Um91?=
 =?utf-8?B?RDA5OFNna3BsYk1TaWhpeHMyeUxnUy9LT1NRS3ZDUi94U3VaNmhjWlZRbHJp?=
 =?utf-8?B?aWZLNjRxdXhxRHRiNDhuU2tMSzAwdmNGS1ZTd2kwbHpVVWdkb05vQXJ4WXJH?=
 =?utf-8?B?TDBQZzhMbHovSlhDY2lIbUZES0xMT25LT1R3T21mQ3ZlYnhJUGNtNHQ2ZUlq?=
 =?utf-8?B?UTFrbVJWT041S0Q0bVk3d0dTdnJiN0pGdWkrSVo2UUtYeFhhUTQ4b0RvR2lO?=
 =?utf-8?B?Ky9UUk13cjdMOWJzTi9QbjFUcUl5bmltMytybkpWd2Mrb3hmdmluYVpmL25K?=
 =?utf-8?B?ZWpVV09uWFZvWFB2V2U5NXZJZWNwVWQ0K1I5WFFkejB4RXhmL2lJT2kxeGdB?=
 =?utf-8?B?RDJ4aFFEeE15T3VFdkU0azYyUFZEQ2NkNkpGOTgrN2ZuRm05SkllVkVWNE5y?=
 =?utf-8?B?Z0FWM3VLYzVtaTdOMEgyMTFnL2hqY0d2Wlg2YWxEUDBVTDhuNUxRdDkvSW43?=
 =?utf-8?B?L29OMERiQkIxZkxBVC9QdkNFdGhNMWpBaDNlUWgzeFVKQlBBZFBVM2kwYUpJ?=
 =?utf-8?B?VWxTdENuR3pJVzRjL2pHWU9WNVhTYmdzalFRL2hhenpJV1E5V2dzOGdzbXF4?=
 =?utf-8?B?eXZKUnNRMlFrUXVGVlRGcXh4VENZRlRpUUkyNlVCWnRvUWU2VXJmazJUWGhj?=
 =?utf-8?B?T0NBL0hXMzZLVFp6Ny9QdFJwRVMxRFFWaEFROFdnbnhoVkx5ZmtjdG1Xa0F0?=
 =?utf-8?B?RkhnVHVSQk8vdGpWZzlBSXViQ1U4SmxGa3JHZnZjQVZzMFUzY1ovSkRzOUg2?=
 =?utf-8?B?bjBrUVgzKzNKOHB5RmpnVmhzMHVtTG5HNFUwZWJnZitYYTNRcDBoZTZDNlRV?=
 =?utf-8?B?dmNEUmZPMHVWdFZ6RWJwcmRLNUxpZSswb1VEcFZSRGJNa0d0TkJaSlVkU2I3?=
 =?utf-8?B?OU9xaW1QY21HR1dxU0FjTUVrRk5hTk53WmxvS2kvWVQvclRKZ0Y2c05nM083?=
 =?utf-8?B?Ri9rUGRycm11WERZa0x6L3RPcTI5K1Fxc2hXM1g5R3J2RWZQWnVBT3B3eWp2?=
 =?utf-8?B?YXg0c3YrVDZSMUZmSW4xYzUrcDRsYjl0d0hSZE1FcnltUHFGSEViNDcyQTkw?=
 =?utf-8?B?bTd1T3grY1JPYmJUdS83YzVDSE5iMmJsRDR1ZDMrbG9Vd0tlT3Y2ZnV3M2di?=
 =?utf-8?B?R2VST21ZWlhqaVdKWjZ2YW1ESENHVUlVVTkwR2NLWmxnZWplUWIrcDBPWUNM?=
 =?utf-8?B?OUE0SHVrdE8zM2g5RDBQOUVDS2VyRTh4akVab0JUSU44YkhzTmJZZU1UWEFG?=
 =?utf-8?B?ZHI1QlM1RUdORmVZTm8yTVZzaHhsMjJaQWp4aEtXZmVJT01RVm1sNUViVUM5?=
 =?utf-8?B?L0oxd2ZmVDF5RkxFRXAzdWdOUDRqVG9MZ0dCMFR3cytUNnNnL1QvSWtzQ0Nz?=
 =?utf-8?B?UXVhc0RGSFBxbENuV2diUThXS0I2L1RTRThqeHhScE5JR291bnBNYXY4a0dk?=
 =?utf-8?B?KzMvMHBnMERGVU5EVk8vRHV0aEs2bi9IV0xmRkV6aTNSVVVJTGFYdE9heDVv?=
 =?utf-8?B?THdhWEMzd05haExBdU1DSjdPUjY4K1hTV0NIY1RBVVltRVg3RmpkYml1VFVu?=
 =?utf-8?B?RU8xQmFFclNqc0lJM2NaSEI2UnM2M2ROa21JZmJqbFIzLy9ZMmhLajFjMzlE?=
 =?utf-8?B?VTdSeDdwSEJyMHVYc2VzcnlmbWhNbEJsaEVlYi9sSWlRRG5JMDAzeEZWTzVH?=
 =?utf-8?B?alFLandocWFWcVd6bGFRTTZrcHlCTFZ1M1lNWHAvK1lvcWJoREVHTVhsUm9G?=
 =?utf-8?B?SWhBd0Z4L2JMek5UZUpTdXpUZEpiR3ozaXFWbDBUcDdpNXQwV1NHRWoxWXR5?=
 =?utf-8?B?dXowcFdFeTFPZU5hbC9yNm1kbGwzWEpBeXM0NFowaDF6Mm1RQm1mYUd3MGdv?=
 =?utf-8?B?RmdDbnovaEExZjI2V3oydThuaUpQVzQwckpuckdTSDhPd09hT3F2L0grc3VD?=
 =?utf-8?B?VEUzeXQ5QXVvOWhmZkJjbFJJZHJtWWYxT2NkTnpjMkVzQUVtSzAyRyt6WUJX?=
 =?utf-8?B?eFNaTmljNk01K2xFbS9yQ0luanJqVmVKbnMvclZTcWVPV2t6ODlsQXZuaS9I?=
 =?utf-8?Q?z/ym54eJR4Qy1yp1MUHcQe2sM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a129446-4eb2-4196-a4d8-08dddf1ca97b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 12:33:55.9840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEMXRYVR/yuyFt+9+28sD/V/JeTsvf1ZCz7zmBULcHmjdKbxahmo6qXphOtdWfMGk2ZCDtoTSNTsoS9JSwaarA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF49208036B



On 8/19/2025 17:50, Ilpo Järvinen wrote:
> On Tue, 19 Aug 2025, Shyam Sundar S K wrote:
>> On 8/19/2025 16:44, Ilpo Järvinen wrote:
>>> On Wed, 23 Jul 2025, Shyam Sundar S K wrote:
>>>
>>>> The latest PMF TA has been updated with the additional structure members
>>>> for internal evaluation. Since this same structure is utilized in the
>>>> driver, it also needs to be updated on the driver side. Otherwise, there
>>>> will be a mismatch in the byte sizes when copying data from shared memory.
>>>
>>> How is it known if "latest" is in use or not?
>>
>> it is based on the GUID
>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/amd/pmf/tee-if.c?h=v6.17-rc2#n30)
>>
>> We start of with the latest TA and do a fallback to older TA; if the
>> TA load fails.
> 
> Yes but how is that reflected to handle the mismatch in sizes "latest" vs 
> "older" TA? I don't see anything to that effect in the patch.
> 

In older versions of TA, there wasn’t a spl_arg field (a 32-bit
integer used to track certain failures and debug features internal to
the TA firmware). However, in the newer TA, this new member spl_arg
has been added to the ta_pmf_enact_table structure.

If the driver does not adapt to this change in the structure, the
memory layout becomes misaligned, resulting in reading incorrect
values from the TA.

The ta_pmf_enact_table structure is an output from the TA firmware,
specifying which actions the PMF driver should take if certain input
conditions are met.

> Is this patch causing breakage with the older TA?
> 

No. It has been tested for majority of the platforms.

Thanks,
Shyam
