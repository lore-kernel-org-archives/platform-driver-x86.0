Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A1113DDAC
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 17:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713892082; cv=fail; b=tB6QUGkJtwEDAHFavr7UdZjQI8K/3EPDEAAjvEa++kfwQ8kze/RKMjp/jUAaGJo5ZrWmCai/vruRCORFOlafzHZzu1MDtHL91Y3gLqN2MYQSW9obCng95W3tQVAk1tUuFngcfGnKaTaZvjnP5+Hr/3gMEnnlCPtvmnJByiyFs2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713892082; c=relaxed/simple;
	bh=h8ou8g9qTdeu+MOV7qiVm2Gd29QhBvKBNJCsImbXd2U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CIJP5Dx5ML0LcuEPQXIrfKs9Ok0Ni3FAQhBmdFE5kQuJyiK+sEaqNj+8M1PyTy685TyghMJkWu8Qz9NEbVdwRRq0PH8YAJo8EOqgUXW/synZ1nXNDhxnXhs1dNbeAgRQqDZtXzhxRJYKP1Zvj+FZX23KwRpVQ9jfDZSFBcpIECE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QWTU0Xyb; arc=fail smtp.client-ip=40.107.223.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QWTU0Xyb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0lyuZAWuE4UZbyr27WMD8jPjaooXKNApsBe33cCm/CfMOOrIVvST4wWe7crR8XCnFvrkBA82SkWOOGf0O417bNFr6a+K9cTvW3aFmd/BZjm2PJujgfAuVeDpub8+2mO1H8n761Crz92mYPhKmVn0JBiUEZ6NjqtomsSRVomeY3y+iyM70CMB5pWXhCAucdSAmlujj3FppzLcNy7R5gu1pUeLHlfc2Mib2ZyqaKOwXYSZrkoo+aMHmZvbXFU0t853p6J0bqLye2IOzwyj9OI2an6tfOe6lJNe6LL0A4PIe20wQsSK4sYZbSUW8K0anGqYAoUZztIu/fnkCy7qqu32A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NnAWaKvXve2mD80Jw+lL4iMC6mE2xjgd9T4WheF3gg=;
 b=Nl6JzVAW9Aw2+CNH6X9MXfQ3gphUHDjJpL0bRX0NjrU3TE0d4gv29pXPUd/rJpbxToPNuj5jmvixDx5LSERMWsTca/pjFO04BLuRjTbILKj7FVoDk1QF+EDsND4JULS1dwt3N2TH5RS7YFYUnyhhli1RAEJ26OCmD5xP+QMYXjINXXw07t38C/IROyQDxjJuie9jK2TQc57XEevRdECRvr9D30ntVP8Y+lF6Cc8TgEF5A6rF5dprS/hFhLTRhJ4t/QmwLVATdnj7KVuacykhCD64iDlDAILD5cq+RDSRBnfDSP7kYKPfcSBO7qBTHjHQXNNqCtEBIDjHaccax8lbOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NnAWaKvXve2mD80Jw+lL4iMC6mE2xjgd9T4WheF3gg=;
 b=QWTU0Xyb2OsNdErlURysZsZuMisP1OPd0AwafCFmbuN61CDqPpeb6X2YNSUkiXPElJjPaC4KJu4JJhzJvmZQJ0LgY6Zd2ynXrV0eqyCcdpBN86jPvT+utzewahRVdsehj6Ru6NYt3TVQAXjgJm0eNRXDwoVt2QnarUb+1x3tS/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB6917.namprd12.prod.outlook.com (2603:10b6:806:24c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 17:07:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::d9b0:364f:335d:bb5b]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::d9b0:364f:335d:bb5b%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 17:07:58 +0000
Message-ID: <a0a27a27-0deb-41c5-9625-ddaebf42f405@amd.com>
Date: Tue, 23 Apr 2024 12:07:56 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform/x86/amd/hsmp: ACPI, Non-ACPI code split and
 other misc changes
To: Hans de Goede <hdegoede@redhat.com>
Cc: ilpo.jarvinen@linux.intel.com,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Suma Hegde <suma.hegde@amd.com>
References: <20240423091434.2063246-1-suma.hegde@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240423091434.2063246-1-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:5:333::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 8667240c-abcb-488b-addc-08dc63b7ecb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V05oeFJwWVBaeHJLUWtpbUh6YzhZcVA0S2MwK1ZTbFFVTUhieitTL0FQdjdQ?=
 =?utf-8?B?WWJWdnFMYisxekVPRHl1U1d4djdKdnNXclI0SEh3UUw0R28vT2dvSDJvRWUv?=
 =?utf-8?B?WUxBYkdua3FzbTB4R0x6OWRFaEY4SE1qVmhnOHRTR2lydkVFM05QUmFoVVBk?=
 =?utf-8?B?dTVTNkhPVkxkV2hlelZ3TnNZZXJ6QUh0czFiNEk2bFBrbERXa2k4NXlEd0x2?=
 =?utf-8?B?aDRoRHp6Z0JPY2lmZDA1c3NPQ3pQeEVYc0U1dGhpZ1lWUi9WM3haNjRNNHFn?=
 =?utf-8?B?SkNZQTl2VDV3YVRoaThiaTJQb3hocFM5RHVWMExncmhMOW5xVW5XbzlDN3hR?=
 =?utf-8?B?aVlKamEyNUlQWTRLRUJ3WmNaOG9HM1ljWEg2bFByRWpQeWNoZ20zVy83UDZm?=
 =?utf-8?B?aDNNRGxCNXFZLzNMQ2ZvMm1jTUhzUVlYa2ZMdE5lc2lNOU00Y2pZTlcwNG0r?=
 =?utf-8?B?V0tSMjRQL0I1Y2k2K2o3aUVPc3pwKzJ0blpFdFZ1bTdsc0c0ajA1L2UramRH?=
 =?utf-8?B?Rk5WbDIzbldUMmYwdlJBQXU3UlR1SWFIeEsvZ3hUVHRqRVFJRXhjZytSeXQz?=
 =?utf-8?B?bG1IMG9ZSk5OZTBrd0p2Y1R4cVhUN0NEZTMwak1XanMyQWlJa2F2VzNHQ3dM?=
 =?utf-8?B?MW5FTE11RkN3YzVBY3VtOVBtNHdHRS9sa1cyamFJSjRtTnZzaExHR0RjUXpS?=
 =?utf-8?B?TjNmY0N4QUw0SG1Ib0VQM2ZMWlBObE5GUXJYSW43NkMzc1huZE5pTHBzUi8x?=
 =?utf-8?B?MDdrdHRQYkxrdkZua2JwamNYSnZYMm5ndjZYMTRHVVpyYnByTy94Q1dZT1BJ?=
 =?utf-8?B?Si9pdEcrSFBLV2FqeTR6dmhWcnZXQzh6REZBUisxRnlNVFBHWlpvbzBlakxL?=
 =?utf-8?B?aUxUWTNTa05jRkl3S2t3eWIzZnNVVU5scm1jcm1SQ3ZQN1JXeEhPMTJtWmxC?=
 =?utf-8?B?Z3YyNnB4bW5JWkFHWUR2cUVnWTFXK3ppUS9SWUwzUE5YUTRDcG1JaTBQRDhO?=
 =?utf-8?B?T0lzUXZSS0JNc3JiN2dSaE9RK1dSeUVSOVJKTGsvOFFMcWhqb0xncjIvRUIr?=
 =?utf-8?B?Ym9Eb08wS3VUWFIvdVVaUjcwdjdhM3FYSFZNVWZ1Kzh3NHhteUhab3d4MTZ1?=
 =?utf-8?B?emxTSlVXdld3bnN5RzlzeE00VDB1bW9vUmZPOFBZRXIvOFVLL2dSZjFhdGoy?=
 =?utf-8?B?amx2ckFzR3VnTmxXY0g3bVZsK01QUDRyMFZRcmN6N2Z6L3dMMGs2SmRZSTBn?=
 =?utf-8?B?Zy9xMkJFcjB3dTRXbklXZGFtQTFDRUZKd1NZYnk0enRvcWcyd1VtMUh0R3Zt?=
 =?utf-8?B?Nm9kbXhKWTdmY2VPZENDcjJzT3YxS0w1eTdqcnAvS1VsWDEvU0x6SG1md08w?=
 =?utf-8?B?OXNLa29hcFdwNHZmejRTekNtbXF5UkczR1hJaWplRFNaNXRoUXhkSkxwTzFG?=
 =?utf-8?B?NEs3cEJ3a28xUzdFQlJDVXB2QjZpam41R1FxdnJIQ3Q0YlE5bzM4K011a2Na?=
 =?utf-8?B?MWREamRFOVo2VWVhYzNRQVhKMm1OMFYzVEZoQlBiVCtxbE9HNDF4a1o3c1Vu?=
 =?utf-8?B?NjJMOXJWR3R2NU9nR2syNUNuL1B1QWREVWg4cTNYczQ3Z2ovUlBUY2M2cGxy?=
 =?utf-8?B?NUZjRHhsNldnMTZPaU5BbTZwTkxMUVlCWlkyMjJ1V0pKdWxuTzh4NFl0d2ZR?=
 =?utf-8?B?MEJlem9QbWQ5L2JhT2poTkxBTXBJbUdOck9Vd2UvWW1mbzJhYUxYNmFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEdNaWRmanpxZnV2WVZuMkRwUzZweVBtUVZqck5CNDU0dHFkRjZYVm83NzNx?=
 =?utf-8?B?Mk0yVGpBMEJYd2NQUXZwWmVBcGtrVlU0djBKcFl1ZjhCdnl5S2pHcEJpSCt6?=
 =?utf-8?B?VGtCNFRCNUpKTU1KS0JYVFdpRGFEaVV5Ui8ycFFTc3FrcTErQ2ExMjZ2eFdx?=
 =?utf-8?B?YkEwak43L1J6eXZSNUdqd1pKUFhEa1dVOGdqTUZ2Z2MzT2dzQjdoeXBYbXFC?=
 =?utf-8?B?akxGVk5taE12cithaVFTOEJheWRGZ3d0ZXZpQkl3OURNbU10YThZT1hMS3NK?=
 =?utf-8?B?allQZzV2Nk02Zm9sRktsdEdlMHdNM1dGbW8ydXZpbm4zQkRRYTZFMWViVTZw?=
 =?utf-8?B?SUI5cm9kanRVK1JxZWxDZ0FZYnJjbHRYRytHOGxZeXRldW1VV0NGYllOT2Mx?=
 =?utf-8?B?bkJxd0pPWDZ1WUN0S2t5bXhMVml1TmhMNGJUYS83aUxpVWMrUVdTOW00bWZq?=
 =?utf-8?B?MGRkMTY4T0FQdWR2S0NCcThZSVBTM2pHanJIMkNZV2k1NlBGWUo2eU1JQjRs?=
 =?utf-8?B?aUdyaUt1V3dJSUJuUkpqV3FveDdJaWFhRTFVMFduVTNkaDZoa2JRT1V3RkFF?=
 =?utf-8?B?MDJ2OUh4clhKQ3FnMCtud1U0RkMxV1hvOExwT3UxTDhqQmRzazQ2MXRqcWhs?=
 =?utf-8?B?VkxhK3pDbDR0VlYvdkMrK09mdGRhVXRSblIxUnZia2tNNGxBNmd2cWNsLzA3?=
 =?utf-8?B?UzlHdHhFODRvb1YxSjFYSWN5RFdLcmVGTUViSXl3eXVZc0FMRVM4cFA1czFq?=
 =?utf-8?B?VkNyVE43cktuZU50TitRdnlMZnNES0FLYlQyMVNkS0ZJdjByRzVVeUZSanZC?=
 =?utf-8?B?WlhEdnhjM0t4anplUU5vUnJQSm42K0N6MTg0V3lZcXRjWWhucmNHMUcrNFBC?=
 =?utf-8?B?Q0tkSWFjZHZnenRGeW5zK3BacWFSaWM1d1NsWTRuL0ZRbUVGbVAzcncwSE9k?=
 =?utf-8?B?VHpqenNoRDlaWDJjeXNMdDBpTExQTTcxdGlrSFh6bEhYWEFheUh1c1o5RmpS?=
 =?utf-8?B?ZU1nZ0tCUnVyWG9HQWpVNWpXVEREdHpqYTFtUUJDYWxIc1FoTmdDU2lNQWlG?=
 =?utf-8?B?UzFhaGxjODg0R01pN3NWR1YzSi9rcnYxaHVsV2twNWtIQm5xNkZOaXh5cmM5?=
 =?utf-8?B?b1FXcUxLbnVwYVpBUzA4M2FoM1hlT1o5NC9lL0pJeHlqUi8zekhmYXFvK2N4?=
 =?utf-8?B?SS9CaVR6bmRJU0NManllY3d4eXFoUlBqR25URmNCamZwTDBhbm1qUjVqaXdy?=
 =?utf-8?B?N3RBc2JHWk5MeVRSQTJHeHllMDBNblJpaFlxVUdJVlhIZ1FROGsyeC9PcUZo?=
 =?utf-8?B?NjdHaGF5Vlo3V25LUmRIUTc0L0pCdFF2dUh4NU9PVnRYQWtLdVJJbnJOTFlN?=
 =?utf-8?B?UFlCU0pwU0RkRkpDWEorcnZJWlVvditBNDdHN3d1TEF3R3VnNE9PbGFZenFG?=
 =?utf-8?B?Y08zN1VndnNIUlo4ejJIc2JmSjkxemF3Q3dIR3JLV1ptdEZrWmtuUmxZUUNS?=
 =?utf-8?B?bzBMbU91OXF4QzV2R29na3BmOHduaEh3TUNhVnRBSENjazNlc2ExNGVMdG9C?=
 =?utf-8?B?ZTJwWnFLeWlXcXVOcDFmSWNTclVyVUNTWEQ3cFBDNHBRQ2VRdmhlODA1RHhJ?=
 =?utf-8?B?VzhHL0IrSGVSSGpFQk8rRWtKUyt4dzRXWGZlUjhiYmU1Nk9PdExURHlCTTd0?=
 =?utf-8?B?MEI1TXdFNCtRaWxvU3p1R3k1U3FUZk43S0pSSDdjMHViNm9yQnRJOVA1ZEJQ?=
 =?utf-8?B?YUJDVW1qWHBRaVMzUjV4SlNXSEhUZWtjQ0s0L1Q5TjROZzlNZHQrUWppS1R1?=
 =?utf-8?B?czFqSXc4aE9Ka1NMYkhoaDAvb21BODBtVktGMU42Q2dITVJNQnFOUERWL3pD?=
 =?utf-8?B?b3VtU1FUaHFRcWRLVU9JWk4wU1FITCs3dkpTd2Z3UWZMSG9laUYrQWV4OVdq?=
 =?utf-8?B?ZlpPSWl3bUlmVFhTUHE1OENqWUdZSUJXdmE4dWxoa1dObmZIb1c3TktsYWNB?=
 =?utf-8?B?c2RYN05maHp4Zmt4K2o5eGRHM0d6U2phY2Z2aGZ6U0dVeklxQzc5NVRxU2dY?=
 =?utf-8?B?cmJZby9hZlpzYlNKVTlUMk1vSnBwN3E1WXIrczdEVzg4VXF3MHN0bC9STE9K?=
 =?utf-8?Q?1D+9o+rI6Te+ILOcz9jl/+lQ0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8667240c-abcb-488b-addc-08dc63b7ecb8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:07:58.2839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdsaCQdPVunYr4LUlBu0D3paZGF1nLmablO4L8Hhb9tzYnDavmpFE2eAXYxuPW4rdFUQmhsPNb1d+UBHn7b8Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6917

On 4/23/2024 04:14, Suma Hegde wrote:
> Patch1:
> The first patch is to address the concerns mentioned by Limonciello,
> Mario i.e to address the issue of
> "Probing registers that don't match the same mailboxes randomly on
> client or embedded parts might lead to unexpected behaviors".
> 
> Because of some limitations, instead of the methods suggested by Mario,
> family check is added to differentiate server socs and client socs.
> This check is only for backward compatibility, Going forward all
> systems will have ACPI based probing only.
> 

Thanks!  Hans, please drop the PM profile patch from your review queue 
in favor of this series instead.

> 
> Patch2:
> The second patch splits ACPI code into  separate file there by removing the
> dependency of ACPI in Kconfig.
> This is based on the suggestion from Ilpo Jarvinen.
> 
> 
> Patch3:
> The third patch makes HSMP as "default m" so that anyone who uses standard
> distros will be able to use HSMP by dynamically loading it.
> 
> 
> Suma Hegde (3):
>    platform/x86/amd/hsmp: Check HSMP support on AMD family of processors
>    platform/x86/amd/hsmp: Split the ACPI and non-ACPI code
>    platform/x86/amd/hsmp: Make HSMP as default m
> 
>   MAINTAINERS                                |   2 +-
>   drivers/platform/x86/amd/Kconfig           |  14 +-
>   drivers/platform/x86/amd/Makefile          |   3 +-
>   drivers/platform/x86/amd/hsmp/Kconfig      |  18 +
>   drivers/platform/x86/amd/hsmp/Makefile     |   9 +
>   drivers/platform/x86/amd/hsmp/hsmp-acpi.c  | 219 ++++++++++++
>   drivers/platform/x86/amd/{ => hsmp}/hsmp.c | 378 +++++----------------
>   drivers/platform/x86/amd/hsmp/hsmp.h       |  82 +++++
>   8 files changed, 425 insertions(+), 300 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/hsmp/Kconfig
>   create mode 100644 drivers/platform/x86/amd/hsmp/Makefile
>   create mode 100644 drivers/platform/x86/amd/hsmp/hsmp-acpi.c
>   rename drivers/platform/x86/amd/{ => hsmp}/hsmp.c (71%)
>   create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h
> 

