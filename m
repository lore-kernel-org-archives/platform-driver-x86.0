Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EB6335BDC
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 12:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605611; cv=fail; b=q8N60W5uhavYChY9YGq9AdcMf6FB6r5/EpaUU+hBs0YdYilFcia7JVH9jSF9A2/5MfIt4uXB2QdpU1jei3IUGBULNAtuzUk++bODd1tVr+N2HI53FCAcy9FucT2rK+tpokIBl3mHrGpLfCIzBb7G4rQ3sjSAnaIzPz36LVYvCUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605611; c=relaxed/simple;
	bh=ejKhy9mFfjP9LAylL7AWuNpW2m/gcR4yGpI3K5iPtD4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LqCRZhtyBNmrekCJPnzUnWY5hfLhlt9VvxLZStd9lEmXDvQAagX4y2/PECOwXljZKeABXfnBZTdzjeNH5WMLctv8hbdqsoq+W5ZJrHXnB+EJ54XBiVwt127JjMa+pYTJKu3iuiuO5Ea1E+sG/4rNyd0Axa4dEia3v+MI4Wui6/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1/wuGxoX; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1/wuGxoX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AusEP1fX7/5V9tBu+dN5aRhnRLPw5zbCH1PpIO57SQlnWYzKnwYJdW+ddAd0D8dKr0avgcgbqyqcbFYFhyuq/8g+ra5nUgSFlvefPBqE2GZo0CDJOUoVP9Ole4R7ME3vaq7SX02rSsXjUtgLd2tzfy74vNR+OOxoBodzlkWNTT1+lQswHaA3hr+OsTFOSHcp4bC+B3VSYpa0nomSIuMMACKGRSRyJNRSnB6+G9Spqf4r12SWhqhQK4V86tMF4mDdzWm6tzgPawvHzNUcvmClKDmlulbOFK5IZOK61s1dp38enqHjuO3caKe+qqMPdQC0Q8XlQjEW4et9HvIwvvW/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SCi9mIV5ZSNuh81wuWHA771H61yB5wEHXjzeBDqtKE=;
 b=oZCPQlCZT0BYXl/wMeZtx2zWMPOsOlIiPw6MDVpruge0ulNqxYNtGftTuJox9+eKsCS+Ba8kjAAEPVgVkjJTWumK5RrK2OMZzgTkBjmgmPQY+lE1i/+m2NH0ZTQ0d9s51Pcy8zmUALbhYq0IeeEYqHjLY2+NAj6bGll4VbM2uGkDKdeXbOrLM8gpk6308fzIRElDyOa287kFwKKJ9o9bJb9RcwbwNjZVhjdi13+H/KjReDaVM6KYJPBOnrKIuMqqcKfg9w4mkDZ8CwNls2wQ1qdyboObSKojwew4QRErh+KMLAunWynxkYelgquxhLkf8jWbPnZTzbSXsm0xkOjeAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SCi9mIV5ZSNuh81wuWHA771H61yB5wEHXjzeBDqtKE=;
 b=1/wuGxoXFPoG4XPF4UwU6AE5ZUu9r5klMHR+iQitvD5S9Kpx3Kub6WlGBTblXje6C9kDpApBHvm3CnEuuL0XZrM52vf2Q6psG9zU273KZUzu4QIm9i3cm11EtjHyKnPey1anuJ8ZNKoR1L9Z6qlAci/v2f5Qtik6GG2cHNC8FXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 12:13:27 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 12:13:27 +0000
Message-ID: <324fa2c6-72dd-4133-bcec-e428cea1e781@amd.com>
Date: Tue, 19 Aug 2025 17:43:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] platform/x86/amd/pmf: Fix the custom bios input
 handling mechanism
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com>
 <20250723064121.2051232-3-Shyam-sundar.S-k@amd.com>
 <0f057e4f-621c-5b96-fd84-f88e3ecc99a5@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0f057e4f-621c-5b96-fd84-f88e3ecc99a5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26e::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM6PR12MB4090:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3ea051-b549-413a-646c-08dddf19cd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmVoanhMMkRDK09zbm13d0N0UEJLbWo1emZDNjdRdzN5bDR6eHJlUUFYMVFu?=
 =?utf-8?B?Y3lNb3RURkdBT3NBMzlEbVZ0YWZGclYzdC9qRmZ6dTdRL3FrTWc0MlJ2ZzYx?=
 =?utf-8?B?UEliemJZY0xYeGovNXU4aW1TR041bkpiNW5Fd1ZHS3N2QXIva2I2Q1BaTmo2?=
 =?utf-8?B?T29xWEVrd2ZyWVVOMUtPRVBiUVk1Q3VXSkhnNm91bFI5a1E0alFsVElMSzJO?=
 =?utf-8?B?Y0RXL0tUayt2WEN2a3BqbC9XZEZOamdiMFJuVGMyMEFkMDNaRnlWenhsMngz?=
 =?utf-8?B?bTRIczdCcE9YSEltYnhJc2d1Q1JIdm5KMTNXZzFmNElONGwvVkJXci9qZEZH?=
 =?utf-8?B?YmJINVpsbFZESjVyQmlnbGdzOTBMQTB6Q2xZY0tLSlFHNjlyTEZsZGFIZ25R?=
 =?utf-8?B?V1JSRVdHVGpIeUJneE8wQWplazJEU3BPcHFvVlBTWktjZWdLaSt6TER5emk5?=
 =?utf-8?B?amZ4VjJTMDhTb3hwRWR2OGtPYjl0eFVHMkJQaFlHNmNNei9FL3VIUC9UTFA5?=
 =?utf-8?B?SzdUbFdIUGloak1ZcytPMk1NVksxTHh5WHpINm85blAzVERUTEdQdUVEUkY1?=
 =?utf-8?B?NDNpTmljSnIyK1FvR1hHRG9NYWFIWFU4cVRvRUhLZ2dqYi9FcGVGUXlpRVd4?=
 =?utf-8?B?b0liMmFobmlwaTZwYTM4NlhWc1NXUlZTOUNzYkZtdEkyQkZ0eElxUDhWaTNw?=
 =?utf-8?B?dHZkZit5eHprODRKRFF1ZDdPMjFQVFp0eEg2TmVaamhXR3dPWUJGNDg0RFht?=
 =?utf-8?B?bTZQY1poQXlnaEVZWU1OaitVT1FnbFVpUGhMQlRWWnQ3UEYrZm53VStOUW1l?=
 =?utf-8?B?T1drRDdqSjQ2RGpxQVRlbmoyOVEyNTZMSWtxZUpZTzFaeG5XQmxVSHVvUWxt?=
 =?utf-8?B?RWhBeUV0VzYwQmhONGJLMGxHN3l1OGZYNU1FZFRPZWRoOS9MVHBTb3RDNnFM?=
 =?utf-8?B?RHBDbXkyT3pWeUk1MVp6QkFvUGYvakFQaXFFMHhnckdpRGFwRjhUYWw5ZzFD?=
 =?utf-8?B?NW1yclNpTmhKbzB1U3FyOGV3UlE0R0JJRnN3c2lLVnd6cWlnK2N4Y0srTldU?=
 =?utf-8?B?VHQ4REVpOWRsTldEVkFLWjFEbitaTkxEVEplM1ptR2xIN1VqbkZiQ0FBRVk1?=
 =?utf-8?B?bU0vNTdneE4vYkhyR0pLN25yWnVOYXFOemhzbnpSc1FxU1hrRElPZFNpTHBl?=
 =?utf-8?B?VzhILzdNMFdtR0RMaWlnMmxwdUV3OERSOXRWQUJvQUZuREcrZWdEVitqM2NJ?=
 =?utf-8?B?Z0F5cTV3QWNOanRPdzlVR01kYjlxbXhvaXBsdVcyS1g3SVZJWlRqQkNmK1pZ?=
 =?utf-8?B?UFVISFpaUDRVVVZsRFdTNmY0Qnk0TnJOU1dSYUF5NGpRQU82Q3FqR1dCMGMz?=
 =?utf-8?B?eUlRLzlYeDlMY3NmUEI0QmZqNEhzbnNkdWRhclpGdHRVVDhnMEloUi8rd2dE?=
 =?utf-8?B?NGlrTTllNXJnWjlBUlcxMXROdGw2U0FMcVd0QUZLUlR6eW9DTVh3YkpRTkRj?=
 =?utf-8?B?NzVicTdYMERTVFE0QytUbVNwWTFsM1AwR3JwRGdpUUU5MENCRm9EWXVJcVVs?=
 =?utf-8?B?U1BITmlPWlFWRTdPREFET0lZTVZicWo5UkxZaE9lRENlN2lHSHBLSkZQaHZV?=
 =?utf-8?B?MVFIbDlTUlVEV2Jpb3pMRUxGNXAvUUJBbmtWTERVaUROMEF3anFmVVpwdEVP?=
 =?utf-8?B?NlV3SWtHR3daTEI2U3J2SCthaUYzbnU5OTQ0cGJwS2RJOUJMalRJTGp4M0lV?=
 =?utf-8?B?cGMvcjBMWWNMa05UbFd3Vi9zSXBiL2dLZzV0cXV6bitSNEY2aER1UEI3RCsw?=
 =?utf-8?B?NHNQWDBkRzYrTWppSlhhcVVMUWorWWNKMXJpdk5CZjQyVGhuTHNCamJtTGtR?=
 =?utf-8?B?WExmTWpXc296RjAwRXRWRDZtTGdoUEJobzlmcFRZR2ZDV0pKT2pOaEJ3WG9q?=
 =?utf-8?Q?yHBtIhAP5Nw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjZ1YmxDVVJmVUdiaUJabVpKNEM2S1QrUUt5cXpyY3N2QnRGbHU1L0JQdHhS?=
 =?utf-8?B?NFpDTTVJWE9ENTJUL3F4L0dTdytVeHJUZmsvb2pkVVNWR25DZXQ1aFJEeHFa?=
 =?utf-8?B?T2pLNjBYMWlsb0RYZFcxakxnOC8vZHJKQWxrTWpncUJONkxFbjczeE9VcFVq?=
 =?utf-8?B?QXA3TS9zK29zNXJYd0dadldEcUl0dmhuend6MXQ4dmhkMFUrUEFZeWpjS1g4?=
 =?utf-8?B?aEtvQmlqeGVRbWR0blZLNGcvU3Z1WFIvZ05lQ3UwOGtuQnpyL0sxcGVWbkQz?=
 =?utf-8?B?NHRZVzQ5MUxKeEdaODI3Y3ZzTWZGN21xNGVpc3o3UlNBaUJuL2w1eW40T202?=
 =?utf-8?B?YWhUeS9BU05leTU2U3JsQlFXQ3FQeGd3bkFVRGY1ejZvSEh4Unp5OHlzdkhZ?=
 =?utf-8?B?VnBWbkNaS2xuQmxqUW9BWC9xeUdkYWlxWmMrTHZCbWVpTXJua3lCUmVGUVMz?=
 =?utf-8?B?c2ZFQ1lJT25vdHBtR3RQRmlNazlRRGNxT0ZOcVBIR1BSNlM5b3M3NWhxQ1NX?=
 =?utf-8?B?Snh2U0NoYWUyNE9WUHY0UWxJNlAycjlPaVhDNmQ2T3FGZzNseDcxYWtQb0lT?=
 =?utf-8?B?eW1TTnU3djU2YzdUUGxTaWRJUmlrcmxPa3JRRDdEY2xOY0NMdEEzZWxxT0ZY?=
 =?utf-8?B?RWNYWVppdnBCbTBKTWFGU2pxQUx3cHVUbEduSk1IVUlDQy8zRXNYQXFKYW9y?=
 =?utf-8?B?VkpCVGpPMHhNdEtTQzFybGI3RlBBZ1hBL1RWTXNMWVJRRVExakF5OXNwOUVB?=
 =?utf-8?B?UEhLRUNZV09LZVpoQ0hFWVowQmF1cXhHbVRWWStjOGxIcmt3a1NkOUpDWEl3?=
 =?utf-8?B?L0dtTTlPTE4vWGVuZjZCVXI5NlRERGpyT1l3ajczNUdLZTB6Nm1rT09GNWQx?=
 =?utf-8?B?LzR2QUtZblo3S3FTSHU5Y0QrVTBydDJ4YU5mZ2JyREZ3aitCUjZyZ0VmdjlW?=
 =?utf-8?B?djdZWUhSTitNNzkwa2FSd2IxOUIzSlVOSkVzR1NNV01jOFE2cEZlRGxvTEtI?=
 =?utf-8?B?VFBlWGo3REwreUUwYUIxeDBFTWJxaHh5MFg5RXJBenU1TzRPb3hPMUNTOU1M?=
 =?utf-8?B?ak11SlgxZHZOQjJ6eDZmaHJ5WHNlMTJQRHp3c3JoUVBnQjN6czU2VjFraDRJ?=
 =?utf-8?B?by80UHZ0d3JwZlN3R1FvS0dGVHpxRHNxL0JzelQySVVvaWllZTl3SkRKNnl5?=
 =?utf-8?B?Sjl2QTduWUh5eGF3b0tHMVJnT2x5NVlvMnpRakVXZE1ROEJSZ25GcHBQTWR5?=
 =?utf-8?B?MjhjQkxHT2txZVc1WGZWOTVWZnJ5NFVrQmJEUkFVdGVBSzY1OCtkYjFDM1hZ?=
 =?utf-8?B?QjZvS1FxcDNia3EyemRjeTd6OWRacThNa2ZNT2pvVlJoRVNWcTNHVjdVTmpF?=
 =?utf-8?B?MTE2YTl5Z0tRS2lhMmlGalQ1alFqanJUN0Y4UUFuTlR4YTFnSU9PRDRqMUZS?=
 =?utf-8?B?Z0dxY0Y4NEprTWxIdXpmajNQT1Fnb2ZlS2QrblFRVm14VzZXMmFIRUtrSFB0?=
 =?utf-8?B?bVZSd1BzQTNWaksrQXlodTg3MEQ1cEcrZzFXbmJiSVRwenFiR2IrNWpKTWFQ?=
 =?utf-8?B?dGVvamtXZ29wWHFuVkJwblhSd2UwdHhrZENUMk1pVk1GeFB5eHRidnY0MERx?=
 =?utf-8?B?RWgwVnVuUUhwZGpRTnJHR3BDVkt4QzN0eU5qR3k2c0pTSGRUbzFaQm9lUE0z?=
 =?utf-8?B?VzNXc2J3NVNSRXJ5UDEyR0xHdGdYdGd4SHhTMTFRcW9xN1ZHUlRQK3BQTmdC?=
 =?utf-8?B?dC9vZUx0ay81anU1RTF1WWRGYVR0QmZFeE1JVTVLYU10bmExR3FJL1lCcnlG?=
 =?utf-8?B?YktiZVppTkZjOCs3TjNTUHdXZ0x5WlNXb2ZXWnNNa0hvcnRRRE05emFSaUFJ?=
 =?utf-8?B?MFpQdjIzSERFZ240Q0FPT3lUa1BzSTEwTjhrejRLbjV3V3JJMU9taVBQd2Jp?=
 =?utf-8?B?VWxZeG80b2w2eW0venY2MjE0VjNPVk92VVZyL3BybExnTHUvVFovZkMvZzMy?=
 =?utf-8?B?Z1cwaExKa0JRUlIyeCtEelorUmR6Zmk2T2IvaHlzTVgzenY3VjkySW4yanda?=
 =?utf-8?B?cXJPZEdEOWtMdW8yOEJLSUI1eW0xWG1HeTFPdFozMDdKOXQyWjBoYzY5dStN?=
 =?utf-8?Q?wpijnvhakKLAHs6YG0nibzs+t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3ea051-b549-413a-646c-08dddf19cd5f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 12:13:27.1820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0irDU7+Sg7V0BdGMKghOViPUaffdKLK4icGjL+0f2XBYjHBQA9CUd1VmhzLrcsJhz2lJhCn+73cfM7aMO3KKXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090



On 8/19/2025 16:36, Ilpo Järvinen wrote:
> On Wed, 23 Jul 2025, Shyam Sundar S K wrote:
> 
>> Originally, the 'amd_pmf_get_custom_bios_inputs()' function was written
>> under the assumption that the BIOS would only send a single pending
>> request for the driver to process. However, following OEM enablement, it
>> became clear that multiple pending requests for custom BIOS inputs might
>> be sent at the same time, a scenario that the current code logic does not
>> support when it comes to handling multiple custom BIOS inputs.
>>
>> To address this, the code logic needs to be improved to not only manage
>> multiple simultaneous custom BIOS inputs but also to ensure it is scalable
>> for future additional inputs.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/pmf.h | 15 ++++++------
>>  drivers/platform/x86/amd/pmf/spc.c | 37 +++++++++++++++++++++---------
>>  2 files changed, 33 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 1a5a8d70c360..79defe2c91e6 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -623,14 +623,14 @@ enum ta_slider {
>>  	TA_MAX,
>>  };
>>  
>> -enum apmf_smartpc_custom_bios_inputs {
>> -	APMF_SMARTPC_CUSTOM_BIOS_INPUT1,
>> -	APMF_SMARTPC_CUSTOM_BIOS_INPUT2,
>> +struct amd_pmf_pb_bitmap {
>> +	const char *name;
>> +	u32 bit_mask;
>>  };
>>  
>> -enum apmf_preq_smartpc {
>> -	NOTIFY_CUSTOM_BIOS_INPUT1 = 5,
>> -	NOTIFY_CUSTOM_BIOS_INPUT2,
>> +static const struct amd_pmf_pb_bitmap custom_bios_inputs[] __used = {
>> +	{"NOTIFY_CUSTOM_BIOS_INPUT1",     BIT(5)},
>> +	{"NOTIFY_CUSTOM_BIOS_INPUT2",     BIT(6)},
>>  };
>>  
>>  enum platform_type {
>> @@ -690,8 +690,7 @@ struct ta_pmf_condition_info {
>>  	u32 power_slider;
>>  	u32 lid_state;
>>  	bool user_present;
>> -	u32 bios_input1;
>> -	u32 bios_input2;
>> +	u32 bios_input_1[2];
>>  	u32 monitor_count;
>>  	u32 rsvd2[2];
>>  	u32 bat_design;
>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
>> index 1d90f9382024..3e3f5a2473bc 100644
>> --- a/drivers/platform/x86/amd/pmf/spc.c
>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>> @@ -90,29 +90,44 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>>  	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
>>  	dev_dbg(dev->dev, "Laptop placement: %s\n",
>>  		laptop_placement_as_str(in->ev_info.device_state));
>> -	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
>> -	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
>> +	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input_1[0]);
>> +	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input_1[1]);
> 
> Please convert this to loop + helper in this patch, not in the next one.
> 
>>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>  }
>>  #else
>>  void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
>>  #endif
>>  
>> +/*
>> + * This helper function sets the appropriate BIOS input value in the TA enact
>> + * table based on the provided index. We need this approach because the custom
>> + * BIOS input array is not continuous, due to the existing TA structure layout.
>> + */
>> +static void amd_pmf_set_ta_custom_bios_input(struct ta_pmf_enact_table *in, int index, u32 value)
>> +{
>> +	switch (index) {
>> +	case 0:
> 
> case 1:
> 
> (these can use the same code)
> 
>> +		in->ev_info.bios_input_1[index] = value;
>> +		break;
>> +	case 1:
>> +		in->ev_info.bios_input_1[index] = value;
>> +		break;
> 
> ...And remove this duplicated case.
> 
>> +	default:
>> +		return;
>> +	}
>> +}
>> +
>>  static void amd_pmf_get_custom_bios_inputs(struct amd_pmf_dev *pdev,
>>  					   struct ta_pmf_enact_table *in)
>>  {
>> +	int i;
> 
> unsigned int
> 
>> +
>>  	if (!pdev->req.pending_req)
>>  		return;
>>  
>> -	switch (pdev->req.pending_req) {
>> -	case BIT(NOTIFY_CUSTOM_BIOS_INPUT1):
>> -		in->ev_info.bios_input1 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT1];
>> -		break;
>> -	case BIT(NOTIFY_CUSTOM_BIOS_INPUT2):
>> -		in->ev_info.bios_input2 = pdev->req.custom_policy[APMF_SMARTPC_CUSTOM_BIOS_INPUT2];
>> -		break;
>> -	default:
>> -		dev_dbg(pdev->dev, "Invalid preq for BIOS input: 0x%x\n", pdev->req.pending_req);
>> +	for (i = 0; i < ARRAY_SIZE(custom_bios_inputs); i++) {
>> +		if (pdev->req.pending_req & custom_bios_inputs[i].bit_mask)
> 
> Reverse logic + continue.
> 
>> +			amd_pmf_set_ta_custom_bios_input(in, i, pdev->req.custom_policy[i]);
> 
> This approach will definitely look better in the end, thanks for doing 
> the conversion. :-)
> 

Makes sense :-) I shall do a quick rework and send v4 shortly by
addressing your remarks.

Thanks,
Shyam
