Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2043.outbound.protection.outlook.com [40.107.212.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4D1F9409;
	Tue,  7 Jan 2025 21:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285433; cv=fail; b=ovF8dl9scIzzhGjuObOud1FYRivBK7dk+LWWCDuOIUFiqBIiMYjqmoQ9/jZFe7rfJ4SqZuo9F0MM2lDMH3awCEPBhySp5a9OlFyH13sj0DUKQ3ZzEcOkVKAMx9OrVP0AJ2OkBHRdmg1LEKgQIvCtPO0jF2x4CCWDUsj99Z1pioA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285433; c=relaxed/simple;
	bh=iQsy9r1O1Uyr24lhh+EZdQDAQfOvV9Yr207eSePQZNY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c8lLrKm8AvGVJq1crV9bVkgQZR3UnNrlwaoTAbmnE58Hs+wDkMAY1z2wwSbvqUaYbCBIO7WSyvRG6JrCA5qul+ozgDq0ohFg0hdiJ2BFZ7o0h+c7Zz8YQ4uvjqFoywvd7e3gijpueGyNUOwFnHnhmz5ae0bqBrAM06Qigpd/I8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qE42emoL; arc=fail smtp.client-ip=40.107.212.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qE42emoL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHfGDfsoQ6IIhBvCKw2z9HO1mlb9Ra0Iuo+9+oWX41NL2O0GbHDleFicumo7YIDO7p7tBhp2xvjSm5zZKJdwyiptqcdD7ESZCucTdl2ODq3hYh84I0j4R/2H2kihoV3TvygNiLAyLuMNKfYB3607Lde2/UcwBKQnKUnGEjQ8PRvAhwxc5fqw2wO+Bv5Wz5VScHlOWuOBE9RizAsG+ltuSPOCY07sx7TgBTCLIdjhjm/DjXTKxh60bsZjGbSj89eojbwLN6+0xsRpv/eApAwHK4Q6MkmAE+AbuqsIdu8YQF4BVG2gRrsMZJaPRcm6vJFx4pWgpmo86KC13PodUVHxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74btqpMdoWhFwgrO+Bu1cvHESaGu3VycTNk4ZKWYXao=;
 b=MCuHtIkMtXqwXS1ztctlxjDI8tVFyf8E/1iPwBrU5gZZblL9bbnX5gFzI6eWP6og4xbzVaUR9cxqaaONn/h6EBf8328GMfrI3n9iBhqh+2BQZYXlVUHyNAflVhoE8I0Zdt9vsxnYa/tVLm4zLp6m6lJ/xmYnTtDNXtabHnOwicBcBmJ+cMfvn/pD/pEpLKYdkXkdQdscXQeolKVBe+eIn56emN7gmRTDkz0i8XMzmK9ZcDNDE7Jc7myK8een+gIHkvlkyZheJ5TO+je3+1MN/RATp8ukuo06apwT9rh6YOegRMQg1zbcbHf0YN5cAopu6qVeocXq0As2E9+jz5gPaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74btqpMdoWhFwgrO+Bu1cvHESaGu3VycTNk4ZKWYXao=;
 b=qE42emoLSLlxi0GKv0rLyw3db5Sd1+BxwA1aEPLvPgaTAlcXk74HOKr3mzmTFYgd16BjBl7CrM+oKUwGqt3fYg4emvaNXqG2pFa6XHxfEg+OAPvYDsbIayTJ2aIoAl3iLl/wAlW3G3UYnhYkA/dBJZcDccMqE8iOmpvvYZxiH+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 21:30:24 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 21:30:24 +0000
Message-ID: <6c8bdb75-3101-48d0-960d-881c7cb4fb2f@amd.com>
Date: Tue, 7 Jan 2025 15:30:23 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/20] platform/x86: alienware-wmi: Split DMI table
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, w_armin@gmx.de, hdegoede@redhat.com,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20250105153019.19206-2-kuurtb@gmail.com>
 <20250105153019.19206-15-kuurtb@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250105153019.19206-15-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:806:22::29) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 981ef398-91f8-46e8-bea8-08dd2f627efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVhRdVUxelgxUGp4cDlxeUloSXNtZzdnMUQxRkN0SHhzKzVvVXNuYjFJeUlk?=
 =?utf-8?B?eWl1VnFmQjlKVEk5Vm03WG5Ia1dvOTAzMGZSb3NuTTF3dC9xanVGZ0Z1U2FX?=
 =?utf-8?B?eDRBeE1la2xVbWp2RWwxNDU5NXp0SUM5aUVBNE81bFNqUklJRkp0UXgzNnAw?=
 =?utf-8?B?QUdWaVQ5cnNPbjc1Q0hCTC9XaGxvdk52R2ZHd29SU1NwRytPaEFMUitqUzh2?=
 =?utf-8?B?NTdyOVJRamhvOGZrZTUzKy81UkxVVHRzNTVYc3d2QmVXQS9yZVlMbHg4aUxJ?=
 =?utf-8?B?c1I0b2dqMzA1M3hpN2tWQUNkKzdNUFdpYVJ3aSthbU50MmZvNWtUZXhuY2tp?=
 =?utf-8?B?TTkvVEdkbFRldHd5ZjFkVVN6Y1BGVkJrdFNUZEs4Sm5vMzRiYlhTb2dwR0Nv?=
 =?utf-8?B?V2JqLzA0bEx1ZXZ4UmFPbjFZaWxYamNWRy9EckxnRFgvdWNPeGlRbHJCS0tP?=
 =?utf-8?B?N3E2UTN0UnRaNG9TZzB6bk1STDk3Ymg4UC9NUUlCdGNRWU9xcFlpQ09qVWhR?=
 =?utf-8?B?WnpYaktQRXBBaVRwVmFXaStpWXBQRFd1TUF5QVdhNFIwSFlUK2I4UUNHdlpT?=
 =?utf-8?B?TWVMS0RkeUd4cXVvL25CYWF0YVJLVFdYelZiQVhBRTRtQWdQbGZuWXdSZGZI?=
 =?utf-8?B?K3VON0V6eHRzM05sbVRNUWZDSXRjQzlWanBXdFFUVXBha0FIbnhQazVRYVo0?=
 =?utf-8?B?elpRTWY0OTFCekJ6Z2lyME9kTTZhQVhXbXJaa2M3M1FrRjg5clcrbnZteVRm?=
 =?utf-8?B?MjliNUNRMHB2eUhNY0pzSzVoSUNWdTNkVDR4MFlSMVFZNDY2YkNkUjB2OWVL?=
 =?utf-8?B?dDRFUDlkK3VzRjlNRm5yTVA0M2MvSmhhRS9KbkwzYVlqYms0LzdRaHM3d2J1?=
 =?utf-8?B?aThrVEN6azBoeDZ2T1BIbmQwTTZCRTFtNGM1djNJYWtkUDdoWllKY0wvcU9N?=
 =?utf-8?B?allxVnlkMCtzU3FKM1duR2d5d2NSK0hvK05KeGZsZDg0eTRiWlZveDhmQmpV?=
 =?utf-8?B?eEtqNmlncThwd1ljZ3hieHlUUjBPei9ZencydVFiT0JJMEttZkpBck02VXE1?=
 =?utf-8?B?S2tURFozVFdSUWozQ2cyRW1Zb1RjVlNLZ21OUzNpczkxa0NnT3Q5ditadHk5?=
 =?utf-8?B?WFNBWnZnZEorYVRhcXVMdGVoSkJvTWlReEdVa2dndHE2MVAvc1VtbG4zeFA1?=
 =?utf-8?B?QUdvbDlHdVRrUWVMaTYvODR4L3N1aUZNcUczc0hrTWdRc21CaURJVDBFVDJv?=
 =?utf-8?B?bXhoUVFJTFRPSzVqVG5RcTdvSUpoSzRtVmJ6QkprN0pVNDB6WmYyVVQ5RzBt?=
 =?utf-8?B?MkNKQmFjOTZkclhmVVBpUmNGZTJIei8zZkdqTzcwMVc1b0JKOGdjZU1rRWZ1?=
 =?utf-8?B?Zk9uTWkrUXJmVGRvaUNMRzQvQ25CdzY0NUxzNUZER1BUTXVJbDh1eFl6ZTBU?=
 =?utf-8?B?VGtBM0licHpVNkh3ck9LRlAzSnpmTUViRW1aTGd1bm5Jbi9FZEdaRGNEYnZ0?=
 =?utf-8?B?Ly9tajBhNWRvUkREakdCRmczZlgzSGxEWTQ2VTl4aklQZUcxMFVvVHpmeU5H?=
 =?utf-8?B?N2ZwZXlraWUvV01lc0djKzNNazRQeWZLajJPV29QT2NLblp3NjI1cHZ3Q0RE?=
 =?utf-8?B?WE0vZll6QzZJekFZMWFPdkZSUmxsM0hYUXlRdlM1ZzhlSnBtQWxnU1lXa0lZ?=
 =?utf-8?B?VnpndkpWNS9tUGZsY0ozTDdJSGhWU1Z6UzNTaTdtYlNsczB0azlxMVU1bTlt?=
 =?utf-8?B?SlZCM3JwVTZ1Mm11TldrdERzOXVFaDhIaW1hR2YzY2J0czZ1aXVZMmlTalFq?=
 =?utf-8?B?R3p6KzV0SmlVZDFlWG5iTmZudlJ6elpldEc4UUNKTmRoam1DV3dDNmhpc0JW?=
 =?utf-8?Q?77JzOTxvd0ES9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHRPZVBla2ZGQzZxczBLanFOWURvWCtqOVhnRWFwS2ZodllkQjl5K0JMN2o5?=
 =?utf-8?B?TEFXbzZtVHl5czJsK3BxTnlNdmJnTGFEMVg2VG1waC96aFVGTXYvRjZOeCs4?=
 =?utf-8?B?SVdkRlZZcEp2dkt2dUUwemI1TWtVWXErQ1IrQS9pZFp1U0ZaeTRRSnBwVGQx?=
 =?utf-8?B?Ync4eXpGZVhlVnU0b2NaKzgzQ0lUOGRpVW0xMzdWeGxrekJUMGlCYUVmVnN2?=
 =?utf-8?B?Vmk2ME0zczBSYVpNYVNJTHJmblE5SlI1d2dxdU00SVhhdTRvK29SOGEzUGZr?=
 =?utf-8?B?ZmpYL2ljS0xxWjd6SGZMUzdRdjRiNjRnRFRldm5WZmJvSmt3c0FqVDcxWmNJ?=
 =?utf-8?B?UnFUM3pFbjFvVXM0QTZhME12cHRIaHh1Z045SWZpbUJHdWhWb2xIc2lFK0dq?=
 =?utf-8?B?SUgwb2pNbFRNY2NscUxyY3N3M2N1eldMWmkvVVY0YXJXOWFQSERySVQ5S0dx?=
 =?utf-8?B?SnYyYkFIS3NPZk1aaFRPK1ZHdG14YWNvbEtDWEo2WndhV2tMczNtbjZORHZm?=
 =?utf-8?B?b1ZBUEs3Qlpmanl4NUZIQlROcGZrbjNMUUc2NTV6UXFvVTdZYzgvaVZDSDcw?=
 =?utf-8?B?Y1RHTjFYcGkvaFFlOFM2S0FRRUp1aGd4MEdpQVFraVNRdFhOOGhrREd0bTNQ?=
 =?utf-8?B?V3NVVlVqSm1YVnZRNjRtYmNZNDJCdzNJdFUwaWhBeDI2K0lsWEJhckNONzhr?=
 =?utf-8?B?U2I4cFBQNG9SVHRtb0Y1NXVPYUZQNS9yRnBDOVRWN24wTVl6Zi9PaHlveGRw?=
 =?utf-8?B?a0lwVHNYTFZDM09ya2Q0dXVKN0ptOUJBSFZLaWJnb2RubGxZV0hUUEVJZklV?=
 =?utf-8?B?WU05akFibEJUenlvYUovUmZCendJUm5PNWhZYnpqZGowSUdUaFJFRmdWVlJk?=
 =?utf-8?B?dWFyVmw4cWxENm1rMDEwK2VMTk1tODVNM290UEJCeFk3NWNnOHVNdkxqSTR5?=
 =?utf-8?B?MW9jU3gvdlYvTHl2N0JSeExDMHVnS2xkby9na3gvT2ZnNFdKTEJHRnk1MkdG?=
 =?utf-8?B?WnpaN3VQVVpvcUdnakxQRlhCZk0yNW9xbW82OXVXYkZQSHNuUDM5L0lSN2tZ?=
 =?utf-8?B?V3h3Y0c3dUZ4L2xZdDlqeDFoNENiVk1LS3YySW16clBSTDNJQlhudzgvaVBs?=
 =?utf-8?B?bCszcFAxWDlnYllxZWlqZXFMdnNnZDhKVWM2S1h5T0gwcW9NWUZIK0RDakcz?=
 =?utf-8?B?SmgzSG5mTzhtYVVUNWJ0ZXYvSjliTkdYVWVmcFBqc1hNQk4yakE3NVZqcXF0?=
 =?utf-8?B?SUlXUWJPYXkxb3FxYlNib0oyWlJHWDQ3TW1VOVV6aE9zRzRmaE9aalRzdHhu?=
 =?utf-8?B?YmhrOG5ld3NDVGFXMzRkb29PeFV3bFIzTzFFVi83TWR5bXZMNkpOZjZCZWlu?=
 =?utf-8?B?dFc3eSt2M3hTNGd1eEFmelgwQW1qSno3TSt4Tmxxb1Rma1BBbm4rN1JXakhX?=
 =?utf-8?B?S05YQ0NsTG14OThLT0tlWkNUMms1L3BadGRHMUNkblpOTzJaTG1ud0pWSHlz?=
 =?utf-8?B?TVBFNEVXdGk5aVc5dVZhNkVFbm1PN2VmYXIrVHFKMHNMZ2NHdTJ1dmd4S3ZF?=
 =?utf-8?B?UzhIeHdwcmQ5T3BvMXVMSVdTUExzWDVTWUFrMStEWm1IbUxuWXA3bGhTcGdL?=
 =?utf-8?B?SnlaMk1Jc1E0TDIrNFBQRU5DNlR2VFBMVGFUZW5VN0ZRd29ZcWlZd0xsaGpE?=
 =?utf-8?B?RFBocUdiVEFhMEQ5SFZndkdGcUhVTGVIWmVKTEpvUStyVlJreHJmNW9sS2VP?=
 =?utf-8?B?d0cwT1J3OWs2OUZNWFhIUThIT3JsV1ZIc0k0MWtCalhBOXRQZ0gzbG5Gd1hm?=
 =?utf-8?B?aDNyTUJrcDdkdWxuYlFSRjVObXZpVWxIU05jSGxVN0Z6bXYwL1Q0Nk1Ia2Nv?=
 =?utf-8?B?SysvL1gvL0EyZHQrK0MxYW15T2hzaFpiY1g4TVdNbnpCTDBFV0JTVkpac01l?=
 =?utf-8?B?c0pqSXFpdFVnZTRSR1hEUHBDSzhwSFZxOEp6S1B2cWZCejhvL3AxNDU2cWts?=
 =?utf-8?B?eGs1aWN3NFBkMmJ1eUlSWE5uTlRPK0MxMW9UNnFWQXhxaXdyS1djMmx6YTRo?=
 =?utf-8?B?SUdOdGVLUjlVQ01yNTVnTUthTnhNQWFmWFdZc205cElMUzJjYjBPUTVKWnd6?=
 =?utf-8?Q?/fAHY6vNiB8mJXjPOHWIf7O+1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981ef398-91f8-46e8-bea8-08dd2f627efc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 21:30:24.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caOiQRKTLyA23zGH8suOwJkwk7g1ZEVXa7MCfL5K5y19/nWjkFzgLeFMsjGxulQx8vOTEKusiOebXDXhUnXDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 1/5/2025 09:30, Kurt Borja wrote:
> Split thermal features into a new DMI table to support upcoming file
> split. While at it:
> 
> Rename quirk_entry -> alienfx_features,
> Rename quirks -> alienfx
> 
> and change hdmi_mux, amplifier and deepslp types to bool, because they are
> already being implicitly used as bools.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 337 ++++++++++------------
>   1 file changed, 158 insertions(+), 179 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index c75ad7ef3d54..e2fcb95b506c 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -113,102 +113,68 @@ static const enum platform_profile_option wmax_mode_to_platform_profile[THERMAL_
>   	[THERMAL_MODE_BASIC_PERFORMANCE]		= PLATFORM_PROFILE_PERFORMANCE,
>   };
>   
> -struct quirk_entry {
> +struct alienfx_quirks {
>   	u8 num_zones;
> -	u8 hdmi_mux;
> -	u8 amplifier;
> -	u8 deepslp;
> -	bool thermal;
> -	bool gmode;
> +	bool hdmi_mux;
> +	bool amplifier;
> +	bool deepslp;
>   };
>   
> -static struct quirk_entry *quirks;
> +static struct alienfx_quirks *alienfx;
>   
>   
> -static struct quirk_entry quirk_inspiron5675 = {
> +static struct alienfx_quirks quirk_inspiron5675 = {
>   	.num_zones = 2,
> -	.hdmi_mux = 0,
> -	.amplifier = 0,
> -	.deepslp = 0,
> -	.thermal = false,
> -	.gmode = false,
> +	.hdmi_mux = false,
> +	.amplifier = false,
> +	.deepslp = false,
>   };
>   
> -static struct quirk_entry quirk_unknown = {
> +static struct alienfx_quirks quirk_unknown = {
>   	.num_zones = 2,
> -	.hdmi_mux = 0,
> -	.amplifier = 0,
> -	.deepslp = 0,
> -	.thermal = false,
> -	.gmode = false,
> +	.hdmi_mux = false,
> +	.amplifier = false,
> +	.deepslp = false,
>   };
>   
> -static struct quirk_entry quirk_x51_r1_r2 = {
> +static struct alienfx_quirks quirk_x51_r1_r2 = {
>   	.num_zones = 3,
> -	.hdmi_mux = 0,
> -	.amplifier = 0,
> -	.deepslp = 0,
> -	.thermal = false,
> -	.gmode = false,
> +	.hdmi_mux = false,
> +	.amplifier = false,
> +	.deepslp = false,
>   };
>   
> -static struct quirk_entry quirk_x51_r3 = {
> +static struct alienfx_quirks quirk_x51_r3 = {
>   	.num_zones = 4,
> -	.hdmi_mux = 0,
> -	.amplifier = 1,
> -	.deepslp = 0,
> -	.thermal = false,
> -	.gmode = false,
> +	.hdmi_mux = false,
> +	.amplifier = true,
> +	.deepslp = false,
>   };
>   
> -static struct quirk_entry quirk_asm100 = {
> +static struct alienfx_quirks quirk_asm100 = {
>   	.num_zones = 2,
> -	.hdmi_mux = 1,
> -	.amplifier = 0,
> -	.deepslp = 0,
> -	.thermal = false,
> -	.gmode = false,
> +	.hdmi_mux = true,
> +	.amplifier = false,
> +	.deepslp = false,
>   };
>   
> -static struct quirk_entry quirk_asm200 = {
> +static struct alienfx_quirks quirk_asm200 = {
>   	.num_zones = 2,
> -	.hdmi_mux = 1,
> -	.amplifier = 0,
> -	.deepslp = 1,
> -	.thermal = false,
> -	.gmode = false,
> +	.hdmi_mux = true,
> +	.amplifier = false,
> +	.deepslp = true,
>   };
>   
> -static struct quirk_entry quirk_asm201 = {
> +static struct alienfx_quirks quirk_asm201 = {
>   	.num_zones = 2,
> -	.hdmi_mux = 1,
> -	.amplifier = 1,
> -	.deepslp = 1,
> -	.thermal = false,
> -	.gmode = false,
> -};
> -
> -static struct quirk_entry quirk_g_series = {
> -	.num_zones = 2,
> -	.hdmi_mux = 0,
> -	.amplifier = 0,
> -	.deepslp = 0,
> -	.thermal = true,
> -	.gmode = true,
> -};
> -
> -static struct quirk_entry quirk_x_series = {
> -	.num_zones = 2,
> -	.hdmi_mux = 0,
> -	.amplifier = 0,
> -	.deepslp = 0,
> -	.thermal = true,
> -	.gmode = false,
> +	.hdmi_mux = true,
> +	.amplifier = true,
> +	.deepslp = true,
>   };
>   
>   static int __init dmi_matched(const struct dmi_system_id *dmi)
>   {
> -	quirks = dmi->driver_data;
> +	alienfx = dmi->driver_data;
>   	return 1;
>   }
>   
> @@ -240,42 +206,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
>   		},
>   		.driver_data = &quirk_asm201,
>   	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "Alienware m17 R5",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> -		},
> -		.driver_data = &quirk_x_series,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "Alienware m18 R2",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> -		},
> -		.driver_data = &quirk_x_series,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "Alienware x15 R1",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> -		},
> -		.driver_data = &quirk_x_series,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "Alienware x17 R2",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> -		},
> -		.driver_data = &quirk_x_series,
> -	},
>   	{
>   		.callback = dmi_matched,
>   		.ident = "Alienware X51 R1",
> @@ -303,60 +233,6 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
>   		},
>   		.driver_data = &quirk_x51_r3,
>   	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "Dell Inc. G15 5510",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> -		},
> -		.driver_data = &quirk_g_series,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "Dell Inc. G15 5511",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> -		},
> -		.driver_data = &quirk_g_series,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "Dell Inc. G15 5515",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> -		},
> -		.driver_data = &quirk_g_series,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "Dell Inc. G3 3500",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> -		},
> -		.driver_data = &quirk_g_series,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "Dell Inc. G3 3590",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> -		},
> -		.driver_data = &quirk_g_series,
> -	},
> -	{
> -		.callback = dmi_matched,
> -		.ident = "Dell Inc. G5 5500",
> -		.matches = {
> -			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> -		},
> -		.driver_data = &quirk_g_series,
> -	},
>   	{
>   		.callback = dmi_matched,
>   		.ident = "Dell Inc. Inspiron 5675",
> @@ -431,6 +307,103 @@ struct alienfx_platdata {
>   
>   static u8 interface;
>   
> +struct awcc_quirks {
> +	bool gmode;
> +};
> +
> +static struct awcc_quirks g_series_quirks = {
> +	.gmode = true,
> +};
> +
> +static struct awcc_quirks generic_quirks = {
> +	.gmode = false,
> +};
> +
> +static const struct dmi_system_id awcc_dmi_table[] __initconst = {
> +	{
> +		.ident = "Alienware m17 R5",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m17 R5 AMD"),
> +		},
> +		.driver_data = &generic_quirks,
> +	},
> +	{
> +		.ident = "Alienware m18 R2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware m18 R2"),
> +		},
> +		.driver_data = &generic_quirks,
> +	},
> +	{
> +		.ident = "Alienware x15 R1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x15 R1"),
> +		},
> +		.driver_data = &generic_quirks,
> +	},
> +	{
> +		.ident = "Alienware x17 R2",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware x17 R2"),
> +		},
> +		.driver_data = &generic_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G15 5510",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G15 5511",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5511"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G15 5515",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5515"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G3 3500",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3500"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G3 3590",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G3 3590"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +	{
> +		.ident = "Dell Inc. G5 5500",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "G5 5500"),
> +		},
> +		.driver_data = &g_series_quirks,
> +	},
> +};
> +
> +struct awcc_quirks *awcc;
> +
>   static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
>   				 void *in_args, size_t in_size, u32 *out_data)
>   {
> @@ -612,7 +585,7 @@ static DEVICE_ATTR_RW(lighting_control_state);
>   static umode_t zone_attr_visible(struct kobject *kobj,
>   				 struct attribute *attr, int n)
>   {
> -	if (n < quirks->num_zones + 1)
> +	if (n < alienfx->num_zones + 1)
>   		return attr->mode;
>   
>   	return 0;
> @@ -620,7 +593,7 @@ static umode_t zone_attr_visible(struct kobject *kobj,
>   
>   static bool zone_group_visible(struct kobject *kobj)
>   {
> -	return quirks->num_zones > 0;
> +	return alienfx->num_zones > 0;
>   }
>   DEFINE_SYSFS_GROUP_VISIBLE(zone);
>   
> @@ -746,7 +719,7 @@ static DEVICE_ATTR_RW(source);
>   
>   static bool hdmi_group_visible(struct kobject *kobj)
>   {
> -	return quirks->hdmi_mux;
> +	return alienfx->hdmi_mux;
>   }
>   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
>   
> @@ -795,7 +768,7 @@ static DEVICE_ATTR_RO(status);
>   
>   static bool amplifier_group_visible(struct kobject *kobj)
>   {
> -	return quirks->amplifier;
> +	return alienfx->amplifier;
>   }
>   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
>   
> @@ -868,7 +841,7 @@ static DEVICE_ATTR_RW(deepsleep);
>   
>   static bool deepsleep_group_visible(struct kobject *kobj)
>   {
> -	return quirks->deepslp;
> +	return alienfx->deepslp;
>   }
>   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
>   
> @@ -1009,7 +982,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
>   {
>   	struct awcc_priv *priv = container_of(pprof, struct awcc_priv, pp_handler);
>   
> -	if (quirks->gmode) {
> +	if (awcc->gmode) {
>   		u32 gmode_status;
>   		int ret;
>   
> @@ -1075,7 +1048,7 @@ static int create_thermal_profile(struct wmi_device *wdev)
>   	if (bitmap_empty(priv->pp_handler.choices, PLATFORM_PROFILE_LAST))
>   		return -ENODEV;
>   
> -	if (quirks->gmode) {
> +	if (awcc->gmode) {
>   		priv->supported_thermal_profiles[PLATFORM_PROFILE_PERFORMANCE] =
>   			WMAX_THERMAL_MODE_GMODE;
>   
> @@ -1306,7 +1279,7 @@ static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
>   	struct platform_device *pdev;
>   	int ret;
>   
> -	if (quirks->thermal) {
> +	if (awcc) {
>   		return alienware_awcc_setup(wdev);
>   	} else {
>   		ret = alienware_alienfx_setup(&pdata);
> @@ -1327,7 +1300,7 @@ static void wmax_wmi_remove(struct wmi_device *wdev)
>   {
>   	struct platform_device *pdev;
>   
> -	if (!quirks->thermal) {
> +	if (!awcc) {
>   		pdev = dev_get_drvdata(&wdev->dev);
>   
>   		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
> @@ -1353,6 +1326,22 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
>   
>   static int __init alienware_wmax_wmi_init(void)
>   {
> +	const struct dmi_system_id *id;
> +
> +	id = dmi_first_match(awcc_dmi_table);
> +	if (id)
> +		awcc = id->driver_data;
> +
> +	if (force_platform_profile)
> +		awcc = &generic_quirks;
> +
> +	if (force_gmode) {
> +		if (awcc)
> +			awcc->gmode = true;
> +		else
> +			pr_warn("force_gmode requires platform profile support\n");
> +	}
> +
>   	return wmi_driver_register(&alienware_wmax_wmi_driver);
>   }
>   
> @@ -1366,18 +1355,8 @@ static int __init alienware_wmi_init(void)
>   	int ret;
>   
>   	dmi_check_system(alienware_quirks);
> -	if (quirks == NULL)
> -		quirks = &quirk_unknown;
> -
> -	if (force_platform_profile)
> -		quirks->thermal = true;
> -
> -	if (force_gmode) {
> -		if (quirks->thermal)
> -			quirks->gmode = true;
> -		else
> -			pr_warn("force_gmode requires platform profile support\n");
> -	}
> +	if (!alienfx)
> +		alienfx = &quirk_unknown;
>   
>   	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
>   		interface = WMAX;

