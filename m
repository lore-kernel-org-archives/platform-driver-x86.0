Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D361C8FE
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 06:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729579726; cv=fail; b=SCruV70kPqk3QizIm6pHyAnqexn0pWsQPNNSQlOLRt9JNKQO1HY7N/mEkGKKjBoyt/gaaLSlp1krPJmPy6r7qnaS1U83iCB2QGglxuHvatdFmLbUwuai/sWr6TSWc2Is/M6qKK+DYvH5dV4EfQEKA0/YKuAJn+UG5kG5Nm8USVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729579726; c=relaxed/simple;
	bh=KFLf8NNubB74KGuZ88Wye+6Nskkj6ygc8J9Tv6JSD5Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F50ftiJq+CxBmA+2VcdZGfs56oat7lliY1SGxIjbjENJ+tsVl3f6+E4axsoTP95qC4WH1TLydwl9id2/+3DcIQahlGxuR04ShdIdSoPTw2DeO8YHHXZdzda2gZX/NbQ9MTKTwjHlY0u5AmfaEwUjK/8ZmRLOwRGchUiSoscqFKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SrXyD2G3; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SrXyD2G3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUe4GW35GzhIXQxorxyBF8WuA43pfhv5b2XrtfmNLXpTMKr6EpLXnY+3YXp93oRn+olbLab/zIWjbtN5QS7OoBISn6pSdQQPKplsmD2vzml9ZdK6PXDvZG+Wc9DkHUJTqkIrZvDoi/yBRqIcXEhR6yxVHiOzYgLHatNCqkW/y+Dx5Sdg4bGDKw9uQ1HsovsOuvxLbwzbdZAGc9gg/xmYaS/FMfrm9k0xVGZpJK2bWRf5hd1It1wGVsO+BmnN4w5UtXtxqgzWLCcAvYTzo/2mXpr6kLUdyloyyEFwLjdJb6Qzs3V0/Jxk4E6A7wScmz/HChwfzJveFFJOSOJi11VuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+HOYrr/7ocwqZZS+nBczCk52K/D01HKSx4ib1Ody/4=;
 b=TKk+FiM6AfP1e7k9xvur/UxiRo/8v6iv7ztZHGOBpVFcoAHBb4o2r+09wqXmDBHp7mrRGY+x4LZf6EDrtmI5tSMWrWj9CvQkV/xKvDOzbcmkZP2m67g2O9lDSxJJz1R0HhhD68X44AeGm8tIcDXkYwRL6pngH1WjgKCCtFLSFwBBC8FziN3Bu2LvRX6Zn0lTUWkjZagKz0vRaihLk+Eif0akZ7CwqlRdiW71RmpcIupiomh5NjuVO9fexHDIbeIY2uCJc0voVOKkkVDxF5b5Wa4KIWH4KSichqX6yeYZ4V/YK0OBgOtgMAQeOwDlcYsPUIdcrB7rN3y1U2WwIxZpjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+HOYrr/7ocwqZZS+nBczCk52K/D01HKSx4ib1Ody/4=;
 b=SrXyD2G32YeqU6GdEgJ8GT82kXZCptGgq2SSrwLq7L4NMhwTHIciU24t/OX/g2+TIEVheW3RJfNJJm5mfaYE5TNy0NUx7jrVdUzsNnuX9y4IqONJ73bjn6w4z+omnhjUWkTaukQRFwy4BM820n8Yqfrj7/WLpfUHHC+ch9/fMhg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB6612.namprd12.prod.outlook.com (2603:10b6:510:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 06:48:40 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 06:48:39 +0000
Message-ID: <b9d7c7e5-e5da-4ccf-86fb-b8ab82bf7d0f@amd.com>
Date: Tue, 22 Oct 2024 12:18:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] platform/x86/amd/pmf: Switch to
 platform_get_resource() and devm_ioremap_resource()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com
References: <20241015103021.1843019-1-Shyam-sundar.S-k@amd.com>
 <20241015103021.1843019-5-Shyam-sundar.S-k@amd.com>
 <0067f1f8-1efa-a7a2-0d7d-2ed4fe144308@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0067f1f8-1efa-a7a2-0d7d-2ed4fe144308@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0248.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7f8782-e408-4f81-5463-08dcf2658f96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEkzTmJuSFlUdW1ENzQzNmV5YllRTCtuNjZtdFNCWjVwWTZYRHlMZWlLbDVp?=
 =?utf-8?B?QnlEaWU4VW1keWdFaW11dmhxY0IrVWx2VWszSGh2Mm1nbjVicmZlaHA5aFFY?=
 =?utf-8?B?RGNFVkRjVGRNQmhJaDQxWTcxTTBBK1hTb2s1bVRUMm0yQjdybWRJNTZTRVp5?=
 =?utf-8?B?OHlxaGNjaWtJUWJDUGpvZUZ1dmIxUk94R2tsMm51RUx2MzI4Unh4emlaWHVh?=
 =?utf-8?B?TEtqK1lUOE84N2l2TTBXQTgxcHNBQ1A5VkxNUDZmeWJzclJHY1VhNmtraGoz?=
 =?utf-8?B?d09VUnp3WCsrQlR5VFNSdldrYS9wa0J1WXdGSHNqelNlY0dJSjJlYzJEWGxa?=
 =?utf-8?B?d29RcXNzV280cHczQU95N0N3cVIxdEVIaFFJOFVKS0JkSjd4TlFzaUxFL2t4?=
 =?utf-8?B?dmMzeTBNZzczRFYxM0RwdTN4VjBOVXNCcHFLZm5YOC9ER0JEUE9KcW1ScnRD?=
 =?utf-8?B?dVBvQi9yczVFRTBkRk8rT2k3UVNsV3QyV1k0cGVwWGFUWnFwRk9PaHlZWlJ1?=
 =?utf-8?B?RnFtUlN6TEk4TGF4YkJHOG5xTkYxMFJYTGdZc2JuZ0MzVUtDVlhwRFUxTjlR?=
 =?utf-8?B?a0hJWWhxbHkycDRyNEx2Q25qaThOVHlTVGlWTmw1REFyaEF1b010YlNyUk90?=
 =?utf-8?B?VzJjdlhiWkZ5MjdmeVB6ZzlIbm1tUUxod0NDM0luY05KTjdJSHg1SlNKSkk5?=
 =?utf-8?B?YzBBcjlxREg2SnBGVEdPNG9yRmtqT0liZXk4Unp1eGNnaDJmV0Y1ZWhrc2ow?=
 =?utf-8?B?ZkhkeGFrZXRRdzMwT21RZWxDNlFKT0hlR3Ntd0l3dXpudEJGbndHRURub01x?=
 =?utf-8?B?TEcrS3hIdlIxVHN3T3dZSklhZ01UcGwwZGV4K1N4K3BwbjkxUUd5L2JDRXZl?=
 =?utf-8?B?VjlTNG4rMHRoZFlOUVV0THBicFlseDVFNENNUXdCK0NHeVhLZ0c5ZVVlZjB2?=
 =?utf-8?B?cVBMMDlvU3BFOUFPa3gvbWtxMzVYUHFhMHgvVlpHWjZyWW42RWZDMWZmSWNv?=
 =?utf-8?B?M0N6NjFGakpBcE9meFpBSXN2YmpjbWd4TVBQWjNOTWJ2c084NTdPUkZzNDF6?=
 =?utf-8?B?RE5vWW1xMXArcXpXNlFNclZtMVpjcFZuN0VKSnBkTnRoN0gzRUdMMFVaUm1S?=
 =?utf-8?B?N3NHcWhpd2tEQmtqU0FnUUVjblc5MDNLcEd5RHhwQmdJQ1R6YmJ6cTdrSXMv?=
 =?utf-8?B?VDBGcVhMaTFpbW5heks0cXc1TGszZ0p3cmFDUXpOckFWWDJxZlpMRDFETmJJ?=
 =?utf-8?B?N0dJTTZ1bUkrYXJ5TlJUZFJoZVRIalhQWU5TblpsK2twbXZDQkJFSWtPenRr?=
 =?utf-8?B?S0xRbk0wWU41VHVqdDN6KzlOaTNLNFg1UkpHQ0QyelUwUmk2R1BvT3dMOVg3?=
 =?utf-8?B?SUd1UWNaaEcvNThVT2ZrMFprVU53MFQ2TW9Ra2JMa0pEbEd6blkzZWsyZzB6?=
 =?utf-8?B?a3RmK1lYU3d3SWVSeC8wdFRIYTFBMTE1MEpIRFFGcVJkQmhvREpYS1JHbjJv?=
 =?utf-8?B?VUZPYmVBNy9tZGY4cFgvY21wek5pTUMwcG9YU2NPeW81SU5HMmZscFczclIr?=
 =?utf-8?B?STFQSFNQc1QyOWhvanJ4ei9lWXlNRG9WVWY3T0tYZkVUTW5wbjkrSERld2Ja?=
 =?utf-8?B?K3kvNjNQai9RQ3NXVkxTbnBJeG9VS1JPRFpxQnFtWS9kbEEwdnF3TlVDRUtq?=
 =?utf-8?B?T2FHM09PUDRoMWhJUkVpTnhjZVQvN3JnTDAzdEpHdVorcTNjQjczSC9yNUdX?=
 =?utf-8?Q?/sQsvr6rsR9OdjBfifONAV8W4mHsb+M3bdb7B2B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWdlUFFzSDVwS0liN1NyMUZGWnlDQWIwZlZFSFAxTk1yV2R6SHowalJGSGtV?=
 =?utf-8?B?c3c4KzczVGIvTmFqdFdYbUVIVnBzTy84NFVpMTd5Tmx6VGlYcXFOdHEzQXJQ?=
 =?utf-8?B?QXpYMlRYNHlFUVpRc3ZQWS93YVJZcThqWlpiUzNoZzdMWm01UjJVRmlQT05J?=
 =?utf-8?B?Tm9uM1NRVytOTkgvTGF4RmFJZEQ5U2dFM2kvNTAweDZ1bUprMjFIQ0VvWUlQ?=
 =?utf-8?B?RlRhcnJiRmVrUjFDZy8wQmxRbm5uVzh1UU05WXJyRlFRYWh2ZnpnY2grWmpH?=
 =?utf-8?B?Vm1qS2w3TXUzNkdnOTF6eTBZNzZndGZENU9kNVBrTHNBdFlDcnVCZzRBRWRP?=
 =?utf-8?B?aW9DWEN6OWdDQ3k3TmwxbUtqendVNWpEWm9tQ0I4eXJLZ1BGQk9KSTB6RzVm?=
 =?utf-8?B?SEliSVMvNld4WVhJRVdnZW1MWXlDUjNUYXM3MU52M3hFTUlGUU1oZlAwNG9J?=
 =?utf-8?B?Umh1WVBsd2dOYmJMK1p6cG51S3haNXZ5MGNRQkx5UENvUnc3MC9QaUFmdHgr?=
 =?utf-8?B?RVF6L3ZXVW5OYXpYREdGdzFhZ1NZd0pCZnZRc3VoZUhkWSs4NXlNTVRCbysv?=
 =?utf-8?B?MGNON3RwZGFFRDFtRDdPeHZjTVFtY1pxcHdZSmpicVo2SzQ4MGg0WFlxS1Jw?=
 =?utf-8?B?S0ZzTjQrczNpUEJ6Tkg2eFdPMUpGaDg3SGJkUzUvdE1uK2RlK3J1aXYzbkdh?=
 =?utf-8?B?R1dlRVoxS3Q4aWxvdFljTGdvcDRuY0xPc0RzOWFNSUgrQTRVVDkrbm1yMER3?=
 =?utf-8?B?N0EwOW5MVVhIR1dtK0dlZlJxL3hQdHprMnRzT29EY2JNY3dmV3pwZEFsTWVq?=
 =?utf-8?B?OWJSTW9XTlkrSzduTEFBMytwM05ITXEralpmaHhDN3J2QUlXYWY5eDVKU0Nl?=
 =?utf-8?B?M1g0QVIrOVFSRmtsRm5USi80d0tCYnJpYVIzWjIzOXRGZFV4eExUKzVxcHFp?=
 =?utf-8?B?ZGpJMm0wVEN5RFZ4TUZ6cEFMK2VuTkJvRUV3SktnWkE2d09YQ2tLK09OdHVZ?=
 =?utf-8?B?aU4zdzhiTGFlWUtnM3FUWTVLSDJ1QUs4aklTSVNEU3d0bllEbVlEcm9tSlBZ?=
 =?utf-8?B?VHBOQ2NTcnJ3RWtHc3VnZjJqcnE4WUIyLzZCR0hmb0tLSXp5Nk1sRFBnZXlI?=
 =?utf-8?B?SzJKRXdTN3pKV1pza1NhN1JybmtzN09jdmZDU0tIRDN5ektRV0Jvb05hSVht?=
 =?utf-8?B?VTBRRllLOWZ6OVFQK0x0TDgwaW1td0xkZE4vSHh4Um04WGZobm00bE53TFgy?=
 =?utf-8?B?Zy9UZ2ZMOW5tcTExR0FyWDFYUTNyeVMxc29JSm9OY29Rbnl4ZGtZZW53WURN?=
 =?utf-8?B?b29JeFA1QklqeVdGOVNFRW9NSnFyMTRvUGl3K1YxUGh5STJHcEFFcDl4djhr?=
 =?utf-8?B?VUROY2xkQXo5WC9CdnBDNlN2QmltVlRUMWJKQ2NhSW0rbExaSi94d3VHY0tx?=
 =?utf-8?B?THExRFFQb3hGN000eEZPaEZ0VjFmd2lGaEZSSDN5Qjh0NWNPbnZPS2VKK2hv?=
 =?utf-8?B?WXE5MWJ4WkRJV1ltUWp5RU5LNG9TZlhHVU93d0UzVEpUOVgzVTV4b2xkUmdh?=
 =?utf-8?B?eXB4ckthamdvOW1sNEZ2OW04OFVPZU9ZNS9HSElFUU4xWG04aFllV3ZVdElI?=
 =?utf-8?B?d3NEcFlCcGNNc3VuT1ZlK1FTcEdqaFlDK050WUtjR05lbWZHMVhvSDhxWjhI?=
 =?utf-8?B?ejlMN1FQWWg4NFljUGl6WmRRbEJ6N3B5dytmZVpNblB1STd2bnc3WGgxdTRL?=
 =?utf-8?B?TE42d1B0bDFZKzQ1QWxodW1jcFRqdlJyNmE3MW5RS3ZNNWVybStkVGhqb1RU?=
 =?utf-8?B?UWlVZ29QZ05RQzhXallKUkIvNWc2MCtjUFlhd2ZyRXorYlVOdzBTTEVrUEtB?=
 =?utf-8?B?SHh4WEY4R05PZzZoYTg5MEVhRWdYVzBMTnVidC9xV3NzNUZDM0oxMEc3MVpW?=
 =?utf-8?B?U1I1QnVMVTIzbGVpZE9oM2M0RWs1UVlBRmFUK05PS3huS0Ruck9wTlJZZml3?=
 =?utf-8?B?Tjk5cTdyVkJuSW5uQXdXRDRCdVZ5eGZXM1A1RWtnVE9TcWhuS3puN1g3dlBI?=
 =?utf-8?B?d08vSnV0eW13K1pQQUFveHcya1NTWE5CYnNtcTBOOFRwWno1L1I4VVhiK1dE?=
 =?utf-8?Q?PG2fVC/afJXQjU2FGSk2KWoJP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7f8782-e408-4f81-5463-08dcf2658f96
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 06:48:39.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26YeW+Fr5qVqzZrYZR7OVS2Eo3Ai6TlWw6/Cnl1xklt/u0uEJHJtfz+tNkiyDhC/hY+JdLaQZg5oLukSYSlBPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6612



On 10/21/2024 16:18, Ilpo Järvinen wrote:
> On Tue, 15 Oct 2024, Shyam Sundar S K wrote:
> 
>> Use platform_get_resource() to fetch the memory resource instead of
>> acpi_walk_resources() and devm_ioremap_resource() for mapping the
>> resources.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/Kconfig  |  1 +
>>  drivers/platform/x86/amd/pmf/acpi.c   | 37 ++++++++-------------------
>>  drivers/platform/x86/amd/pmf/pmf.h    |  6 +++--
>>  drivers/platform/x86/amd/pmf/tee-if.c |  8 +++---
>>  4 files changed, 20 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
>> index f4fa8bd8bda8..99d67cdbd91e 100644
>> --- a/drivers/platform/x86/amd/pmf/Kconfig
>> +++ b/drivers/platform/x86/amd/pmf/Kconfig
>> @@ -11,6 +11,7 @@ config AMD_PMF
>>  	select ACPI_PLATFORM_PROFILE
>>  	depends on TEE && AMDTEE
>>  	depends on AMD_SFH_HID
>> +	depends on HAS_IOMEM
>>  	help
>>  	  This driver provides support for the AMD Platform Management Framework.
>>  	  The goal is to enhance end user experience by making AMD PCs smarter,
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index d5b496433d69..2d871ff74fa7 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -433,37 +433,22 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>>  	return 0;
>>  }
>>  
>> -static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
>> +int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>>  {
>> -	struct amd_pmf_dev *dev = data;
>> +	struct platform_device *pdev = to_platform_device(pmf_dev->dev);
>>  
>> -	switch (res->type) {
>> -	case ACPI_RESOURCE_TYPE_ADDRESS64:
>> -		dev->policy_addr = res->data.address64.address.minimum;
>> -		dev->policy_sz = res->data.address64.address.address_length;
>> -		break;
>> -	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
>> -		dev->policy_addr = res->data.fixed_memory32.address;
>> -		dev->policy_sz = res->data.fixed_memory32.address_length;
>> -		break;
>> -	}
>> -
>> -	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
>> -		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
>> -		return AE_ERROR;
>> +	pmf_dev->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!pmf_dev->res) {
>> +		dev_err(pmf_dev->dev, "Failed to get I/O memory resource\n");
>> +		return -EINVAL;
>>  	}
>>  
>> -	return AE_OK;
>> -}
>> +	pmf_dev->policy_addr = pmf_dev->res->start;
>> +	pmf_dev->policy_sz = pmf_dev->res->end - pmf_dev->res->start;
> 
> A small thing still, I realized this should really have a comment because 
> it has a big risk of getting "fixed".
> 
> Also please describe what's going on here in the changelog (answer "why?") 
> since this is such a thing that people who look this code from history 
> have zero chance on figuring out the reasoning on their own.
> 

OK Sure. I will add a comment and leave a note in the changelog.

Thanks,
Shyam
