Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3BC32C8E;
	Tue,  7 Jan 2025 22:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736288424; cv=fail; b=RZbR11j6DF+vNcJzVO6bbWEwTW75j5gD3SfQc8hEogPG8TUPZwb37dqTDju1wJCPflLKsW6rHUvLneYCfuVhfRNOX0A054mCUQh8xFlkp1aJaevHQiXUjo4kPTZ5EZlQ4qJ6L5w4fm5nAaldiafD8Kc1AiUXcdruMAYucKK8myw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736288424; c=relaxed/simple;
	bh=5FgTWFcGtQqwUelGIKDqo/jj+ggIB6SaUPeAjTQibdY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RcDiJkByv69iuxRVIEir1hHgX4s7m+aUa9wD6y6ZYRHU31GIvlboAGcm2zkXbgHTTeeWHMMJTRL6cVQIM7izpPRyEDHjDkBXOdtaVQoI2yBUcEtG94UKJuO/5pIW8QgmzNZCC5I2bACxPAb8yLNCab3Tj4KYzJ/sxZ6JZRJO8VE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KwY3thpf; arc=fail smtp.client-ip=40.107.243.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KwY3thpf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6QQpZZlnrNc3kyV1rfwLIP3k2iSjV8Y+3L4i1GIs5MUw8k7Y+VzpXXwWU8agNZWljqIvk2A2JJmDBh+Qz9wexDqPDvbT/6x3L/OOumBKpIHsVrexbewhiM8vC1ElWvS+b37iDXoD8FVIHGk6GAMuIwmP6OE0Fdcs3+sxaSfmdTzrWjtpe+w+8wFgEOBt9HPVw+QEFJVlezMFgEJ4yIHgGpDU96+BOTgLTSaFBWiWPTKN91svKgfxDcIA7EKvX7NyHGd1V+EhVDM+OIfGY5kOAu/w4hQruOZgSsgx4ADNYV59JFC/vZs9hOMaA7oQBeX1Tzl7AJmZC/zacZGxvv7uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRz33nJOUzUPvhbVS76CD3Ih3QJVN6VsT+VB/XHlER0=;
 b=np+dqEiJc2XxTcKVv1vC15pFONyqXr/VPeiBZBGxg2ZVypzcI8D873BpYX7oWo4N6rKErpfbXf2wDAiA0CaC/xefnjuhkUnDgkVSlx1b4MG9nzXlLg8TCsxVnqcbvOI6HxumDm+1frLl53etvMybXIcjEL5SDaZMeWVsuFhEZG6wBCp3GT4G3UgR2SxqYWLJZyjeRCSKkrpictoOX0Jx9NPsk87EHJZKZ277KCzaeb9yM3zTONcHK/1ArMeRCAoRUGT6c7X0uVqYzq0nsLadzd+p4NGxSuArjc5VfwFwkuwraU1wNlRAuX58YLroQMGIqYmxIP9rd9n7LzLU/p4HcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRz33nJOUzUPvhbVS76CD3Ih3QJVN6VsT+VB/XHlER0=;
 b=KwY3thpfWLxmBJu+aJSDroZE88br89GXUZic9X0AbARCxoWZ5wZPRFM2/SRMvOZkdxmbmNToy44pyjfnovF0xXdMS5EDdwO0wISEAViz+N5oUnhxRnQW3Fl78wWnZvzVKptu18VxDB+Q0ZLkDQa9ELPM4+FSnzaAaLRKkDKDJs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by SN7PR12MB8102.namprd12.prod.outlook.com (2603:10b6:806:359::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 22:20:15 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 22:20:15 +0000
Message-ID: <94769c30-af14-4111-8234-abf7e7333def@amd.com>
Date: Tue, 7 Jan 2025 16:20:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: firmware_attributes_class: Add test
 driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joshua Grisham <josh@joshuagrisham.com>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
 <20250107-pdx86-firmware-attributes-v1-2-9d75c04a3b52@weissschuh.net>
 <a20d538e-421f-45fb-b169-f9d2eb4c6aee@amd.com>
 <88ae2335-86dd-4cb2-8e20-88973a8e28b7@t-8ch.de>
 <1f5b77f3-c427-496e-9c1d-3150177f29d6@amd.com>
 <7f568cbd-b299-41c6-8786-25f225de8f4f@t-8ch.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <7f568cbd-b299-41c6-8786-25f225de8f4f@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::28) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|SN7PR12MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 755e6f53-9d03-4b5f-dca8-08dd2f697626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1kxdWtCeldSN1JKMytpZTJ4ZVptaWMyMThiMEdXYitCemVKcm5ScGptRXR4?=
 =?utf-8?B?ZGFWc2F3SHBKVmpoTnQ1cVVlUGJIRml1VHMzWHlEcE1ZRk9NTFJNQUZQOVQr?=
 =?utf-8?B?NzcrTHBaVEtMZXNBU1BUY01IbkJPNGdsVkpYWGEzcGRERndESzU0OWlJbHFw?=
 =?utf-8?B?VDIzVkZwME5GQnZhZndTMDA4eTNQMVVvTzZkTGJsZjlYRXdFRGJhcFpvZ1pZ?=
 =?utf-8?B?endKZ0s1T01jVnpzTWZCL2VldlZCVjFRbFpJbFZ5MC84ZEtkdXNUcE1aQzhP?=
 =?utf-8?B?bWxmYnVnRGYrV3V0dWxhc2ZOa0wrK1pQbGhnRWs0UExzdmFTSXl0NE41bnFJ?=
 =?utf-8?B?YURmT1pZNURFZFR3QkN2d1Y5cTlMUDc5b0hod1poRldpL1BDWG04Zld5eFlk?=
 =?utf-8?B?SE4zRHZGVmI0YXFYSkNPYUdqMFdmZW0ySVgxbmt3OEs3SjkvaGRCU1NrRzZQ?=
 =?utf-8?B?MlRsenY2cHZwOUx3MUcwTDhwVVY4Wms1UWt4QVdNSTFVaUlRQ0VOUzhEWUY3?=
 =?utf-8?B?YWU5dU9vWldoNWpHVStuUjRyWWlXR09uV1dBZUJMR1IwK3NmdmRvQUU0QmNM?=
 =?utf-8?B?RFp2emhUVktrcVFESFcxR0I2SFlycHUyTXRJbFRPVW9oSGdEbTlLbjNzWGJP?=
 =?utf-8?B?dng3NWZtdlhDSjRpVWJoS2VsYTVKN09saEF6eTltd3hUS2lkWWRycFR2WEdU?=
 =?utf-8?B?NGsxbVI1aXNOa3NNTUdIZnZIUzNLdEVuU0FKeVNXcmN1QTVLVnBnTmJUK1c3?=
 =?utf-8?B?M1J4WXBmRjI4SW5KT3V4dE12MGhwVGRjcURoNktPaXJnOEN4aDQ4b1pyeDR3?=
 =?utf-8?B?NDRSM2x6d0REb3ZZd2QwTE5YaVVHTThqQlI5Y09uaTNjVk05dCt2aUVFUVNN?=
 =?utf-8?B?YTA2WEppRHlWS09IcDBYL01EbHE1azd0RlFVWlFIWjQ0WFhpSzRTMm5VSWV3?=
 =?utf-8?B?clA1V3dMN1FudGtsTUlYTG9VR05adDdMZTFEdG5JcnpuL0tQNW1EaWpDN3Ba?=
 =?utf-8?B?NWlhLzNOL3kya1Q5Y1BNWkR0UEhUOE9GWDNDTWYvcDJ2YnlPbXkveGtRNkxN?=
 =?utf-8?B?ckdVNEFLZnVWQnlwSWtWbGJJODh3ZzFwaUNZMXpWdnlPVXZMbDFKaEVDdkNa?=
 =?utf-8?B?WlA2aVdBcVVvTVRtcUQ5OWxFT1pMM0NMNmo4QnhiR0tHaE1XQWtRL1RONHll?=
 =?utf-8?B?TWR2UU5tZ2hFSGQySmh3ZmpXTDNyenNrMjlESlp6Nlh0SHZzWHhPVVNpVjRl?=
 =?utf-8?B?YkttYS9CM1VDaHdaYW5yakMyc3lDT2wzMnN1RTdDYms0ZFNRR1ZDRHRXSlhI?=
 =?utf-8?B?RmdVaUViUWxyQlg1dzhaZHNSWVhreW1qR0RCeVVWbXZlM1hMcHBaSnVmaXgz?=
 =?utf-8?B?dTllbEJ3QWhWUU90aElib1NXY2JlY0JtSThpNnFxSUI1Vkp5L3hkdkIyUmdj?=
 =?utf-8?B?QXhidzhsdURwNEdDNFRkOGVNZXV4c2RvRjAxbUV1dE5QM1h2ekM5ZTloV282?=
 =?utf-8?B?NENIT3lRSUtXZUc5V2ZQZzI1djg5RGwxTVY2cEJNeGJBUGtnRVkwVVIvQXdT?=
 =?utf-8?B?RDBBcnZWSHRGS0RsZmhjdDA2NE1tSlhielBteW1GNUVsR0N5UWVYQmZVeklT?=
 =?utf-8?B?SzEzOGkrc3VMVDEwOFl1UHorNkwzRnZuL1Q4RlZPMVJHa2F4dTUrMXgyK0Iz?=
 =?utf-8?B?azhUM0hELzBkc1U5aVZBbVJmUkZTMmZCeC9TclhVWG5XL3hiUzR2QWNxWGxp?=
 =?utf-8?B?YWpRUG0rYVoxYnk0OEhrNHlCbngybHorVmYvVGNrc091TkRZOTAyZVFyajQr?=
 =?utf-8?B?Y3lRaGpQM2pwTEJ2MmxScnFKQnFyTDR1VWt5dklJaUJERXNJNDJYelRCZC9C?=
 =?utf-8?Q?zlWI1Y02zoP3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2VYei9oS3dWVE1LZHNMS1dTL1RZUWt4V3NNMDN5NGhOOW4yaEZPT3ZlUnkw?=
 =?utf-8?B?ZkpnTmNRWHBMMnVIS0dKNnhuN2o3R2R6djVFblBVMVo2UWliNVg0Sm16WVpl?=
 =?utf-8?B?N0F2VGh5cnFuSGxoOEwvOU5uT21CQ0ZDMTJMKzEzdEtReVpEM3RZMS84V0RT?=
 =?utf-8?B?bkQzb3RWV04vK0VheXNna0VYdEpGRng4RUQzcSt0RmZNK3hiWXdmclZIS2p5?=
 =?utf-8?B?TjlBeVlnTUM3K3l0MC9zVzNoZjVORXBpUXpXZHJDbkVUWHVHSENBaDBVQ3lU?=
 =?utf-8?B?SWRpdC9zV2RET0pUM2JwVm1UaTVtenNOSDE1VU9Sb25HaXNYWnhwSXlRc1hn?=
 =?utf-8?B?MWtYZ2xFbU5ORTRCd2RhQ0gvUG9xWnY4UC9UZVJCZDB5bUtveXRpZXBPR1hW?=
 =?utf-8?B?OENxak5JelBnMitud1hOaFl4TSt0VlRiU3BRL1QraXg5STdyV2JwV0RydGhm?=
 =?utf-8?B?MVIrcE9PaDU0V2JjTTRZUDYyenBtOHZiUTM5cldZdkJSRVdsNEtXd05ueGlC?=
 =?utf-8?B?cTF1MU54Y2p4YXZ2d1F5VndoRFJJVFJCaldVVG91TTB3b1lhOXNCNGFOQ3Rn?=
 =?utf-8?B?bms5b3ZqUTFhVWllTS8rcDdDK1EwME8xbkh6ZU9EeDNuMk1uMzkwWEJkcCtp?=
 =?utf-8?B?MzhzVGlMN3VXWUlKMTN6R3NXNkRPK2xONDMzMnZKSWUvZHZxNlNzMUtVTGgz?=
 =?utf-8?B?QlAybWhWKzdXQmRIVGFzNFh6RTBoM1lyNVcrejVsL3lCZ2RQL2x4ZlNnblhN?=
 =?utf-8?B?eUowSTFHQWQraGJ2YlBNQ1YremdiRnJ3ek9PZStoT01GdTdmVS9FV0lRT1Ix?=
 =?utf-8?B?UGtSbkYvY0lTaVNMbFJwMU5XUG9mU3VVN0VieEc1ZDFmVHhkaXA4S3JoVHBn?=
 =?utf-8?B?ZEVEVkZ0L1ZMVjBZNENCd2RSWk5jVUlFMVJUN0hkYVRHeXQrZ2VnanJiOFZJ?=
 =?utf-8?B?NVRIdktZUWxzdWlZaDl4ZTI3TGlhenlQK0J2cEpaZzJmbE5SZ3RpcDYrQWUx?=
 =?utf-8?B?OTVNSjlRNFhvUGV6dVNLOUNDbmhxQVNqSmUyN25XVkJla3BWUEQzZitlVTRD?=
 =?utf-8?B?RWZVYTZBVnVmNkJHazVUWC9VdG1VUG1kMzdzb1ZNU2hPTWkyU2ZFRlhlREoy?=
 =?utf-8?B?MDMvenlZUEJtN3B5NzJjTGJOdTN0Z2RNU0tjczd3emRGdm9uNk5xVzQramFB?=
 =?utf-8?B?T1JYQmtzZW9IY2pWdHJBTGkyL1FCTTU5eERucmIwN0dHMkZzMVBNMGZ1cVhi?=
 =?utf-8?B?dCs2WXdVN3ErTWVRSUFrRUZtTHhxUXZPL21JYmNsNTZ0U1pKWFdaYURIR3RT?=
 =?utf-8?B?T2g1VHp1cVJJRGQ4NUk2TmRKbEhvT2pVZGRmcmQzZGgvS2MwWW9BU1EzWHpZ?=
 =?utf-8?B?QWhidVJLaXZiQXV0VXlKTkNSUlE0ZlJ1bnhTWlUvdm9vYjR5cnJkYU9rWC9U?=
 =?utf-8?B?NDNtc1EzdFU4L3oyY1JyNmdyMzlHUmt5TEwyVjRTUW5PdmY1d0M4djVEZnhY?=
 =?utf-8?B?SEFoRFUrcWNvbkRVZG1adDVicE1yOExidDgzSmpYTjFOZGZhS1JIakFYSE9n?=
 =?utf-8?B?cGtxZzFmYkRxMXA2YnFWekxidUtma2IybVo0Z1Vvb3IweSttY0phM1pZYjRL?=
 =?utf-8?B?SmdvTG9Danh6bDVvdHN5a1VDR04xS2FKUFNsNlZoTktrdXp2NEZMRnIzSnBY?=
 =?utf-8?B?TjhiVVA3RDVXeGM1RHFkaTlhTWpkTnVhVDZaMk1HQ3czWWFjM29WaUZTbWo0?=
 =?utf-8?B?TW5MMHZpNUlROFdoMVZHMEhtYy8zMjFrNStDSGY3QzhQVVpmNDZzaDgwdk5B?=
 =?utf-8?B?MzB0VVA4djlMVktDcDgxTVJFR1B5eVVzUDYxb2pwbThlMDhIZ0sxaHcyOVEy?=
 =?utf-8?B?UDZtbTBaV29ndk40blZkTUsxV2ltUEFlcytuTlBaOGJNREsyY3l1RC9NNU9S?=
 =?utf-8?B?blpJbnRvN2dxTEVMVm5mbTJ5VVJxS0RCdHNOL2lRWjRYdzJ5S1dYRWgwTEZz?=
 =?utf-8?B?VFpZSFJ6SXF3ZWYvb29Dak00QzlHM0hpeTlJQXpURVBKNEwrRE5rQWE2eWpU?=
 =?utf-8?B?cmk2V3NzTncvU3RJbFVSSmx0ejR5ZHBlR0VENGs0Tjh1aE9ydnVzTDFzTWlo?=
 =?utf-8?Q?7/qLHdlfDtGcqfGB//jhojOMi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755e6f53-9d03-4b5f-dca8-08dd2f697626
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 22:20:15.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9V6RZFaCLhCwlTBMrivfI+oiTM8qDIkA4ERiYdV1Bo+wyJenzQeA4bhumkzr8U/7iGzltaxJDo0bN1g8V/KaAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8102

On 1/7/2025 16:13, Thomas Weißschuh wrote:
> On 2025-01-07 15:18:21-0600, Mario Limonciello wrote:
>> On 1/7/2025 14:50, Thomas Weißschuh wrote:
>>> On 2025-01-07 13:29:08-0600, Mario Limonciello wrote:
>>>> On 1/7/2025 11:05, Thomas Weißschuh wrote:
>>>>> The driver showcases the use of the new subsystem API.
>>>>>
>>>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>>>> ---
>>>>>     drivers/platform/x86/Kconfig                    | 12 ++++
>>>>>     drivers/platform/x86/Makefile                   |  1 +
>>>>>     drivers/platform/x86/firmware_attributes_test.c | 78 +++++++++++++++++++++++++
>>>>>     3 files changed, 91 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>>>> index 0258dd879d64be389f4dd9bc309fe089f23cc798..2a0e828657d2f07074944d6c42dc204fc8825a42 100644
>>>>> --- a/drivers/platform/x86/Kconfig
>>>>> +++ b/drivers/platform/x86/Kconfig
>>>>> @@ -1065,6 +1065,18 @@ source "drivers/platform/x86/x86-android-tablets/Kconfig"
>>>>>     config FW_ATTR_CLASS
>>>>>     	tristate
>>>>> +config FW_ATTR_TEST
>>>>> +	tristate "Firmware attribute test driver"
>>>>> +	select FW_ATTR_CLASS
>>>>> +	help
>>>>> +	  This driver provides a test user of the firmware attribute subsystem.
>>>>> +
>>>>> +	  An instance is created at /sys/class/firmware-attributes/test/
>>>>> +	  container various example attributes.
>>>>> +
>>>>> +	  To compile this driver as a module, choose M here: the module
>>>>> +	  will be called firmware_attributes_test.
>>>>> +
>>>>
>>>> I think if you're going to be introducing a test driver it should be
>>>> compliant to what's in sysfs-class-firmware-attributes so that when it's
>>>> inevitably copy/pasted we end up with higher quality drivers.
>>>>
>>>> That is you need at a minimum 'type', 'current_value', 'default_value',
>>>> 'display_name' and 'display_name_language_code'.  Then individual types
>>>> employ additional requirements.
>>>>
>>>> I see 'type', 'current_value', and 'default_value, but I don't see
>>>> 'display_name' or 'display_name_language_code' here.
>>>>
>>>> Furthermore as this is a "string" attribute you're supposed to also have a
>>>> "max_length" and "min_length".
>>>
>>> Agreed that more examples are better.
>>>
>>> But are these attributes really mandatory?
>>> "This attribute is mandatory" is only specified for "type" and>
>> "current_value".
>>
>> Ah wow, I had thought they were, but you're right they're not!
>>
>>> While "possible_values" certainly looks necessary for "enumeration",
>>> "min_length" for "strings" does so much less.
>>
>> Even if they're not mandatory, I think it's better to include them for the
>> same copy/paste reason I mentioned though.
> 
> Thinking about it some more, which attributes should all be included?
> Having all of them in there could motivate driver authors to implement
> them all even it would mean filling in random values.
> The provided examples can already be copied-and-pasted and slightly
> adapted to add more attributes.
> 
> Also as for providing an even higher level interface. There exists a
> fairly big feature matrix. For example the display_name_language_code:
> * Is it used at all?
> * Is it the same for all attributes implemented by the driver and the
>    sysfs attribute can be reused for them all.
> * Should the same handler logic be reused between different settings which
>    only differ in their language code?
> 
> The answers seem to differ between each driver and having a uniform
> high-level interface that can handle all cases would look horrible.
> So I'd like to stick with the API provided currently for now and we can
> revisit it if there are more drivers.
> As mentioned before, the current API should be a decent baseline to
> build on top of.
> 
> 
> Thomas

How about just adding min_length and max_length?  Since you're adding a 
string attribute then it makes a good example of a string attribute.
It should be pretty trivial; AFAICT it's 0 to PAGE_SIZE.
