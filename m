Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2306293B72
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Mar 2025 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741101460; cv=fail; b=h2shzynSFFtSG5PxEhPgqjS5NDXwTIvDbhwgD5U8rzJju+XP8nfhZxl7HGl//TenO9wHpjy1Cve4L1FjCyh3G9W7/AV6uZV2iQfmQ9hfJKHHjF+h0aOaDV97gXsN6srFJEzjjCR9pw4fgT8FwuQ+9bIXT1Mn3rdA8EmUuK02fYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741101460; c=relaxed/simple;
	bh=qYbSw6Mi5x95oJ6y3wEbLBVEd7UknYPjg93KaxPLHBU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oWUZ1xLgUSQoGVkx4L515ejFbO8yUTsMsVdlQCQW7KILSHxXlVL+na5oIYGJ7RS6+yt1ouh6Pn8+yLFe0vQ+F2Zme4g9ut94x4KCVojgkD205z6VVGelG9QmpczCnnLlyb28nKVSWbv/+aylgjhV+B1lo0o2FtB0fl1OCfqg8WI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oDt39rpK; arc=fail smtp.client-ip=40.107.223.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oDt39rpK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYf1X5xDMsCBZcHgwEEnlUcTvSqwZxvpuONB4upymBwR7kcb4TfnUcIoQ2lz8qZ59m222KtuJvzD7n1KmeuyT423WBHzrkKh7gYNnovHOcgjLpYf5WkKMnVFZxt4xTQvsW7ci4IaluhptMKBvBiHq8D2ydc2lWea7dZwRq3JQnoZiLnsXFsSmjun7umCaifbTF7sXVtLPfQo5R0yTHHa9FQd2B8Ea2FoIez2S/M8JAlTC05uWYOPt/zUITHG1C/wbTHU9xZ6v2G6pkOi83C93IzRPnmpW1ZTzIkuu40IiUvJFmqab9aGG17MXm+jsVZHZ+DVqM4r+ExEXJnbqNr20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvOrfQulIFTzW4sbyNiLZwsTlDqDhHaaoiLhGSJu4KQ=;
 b=YyEan0tB1Qh/SKG0trE1GxmAX4BKGR97cpt49bPQqy8AFbdK9omAyhDo3R7OM5sOyPPJaEk3rtjfTn1TZc2dSxORHHkhIcWILa1/rdet+2xNN4xWWOkjNPoqF+VR9JRleEbltoMoXlMQEGO2Avjo/kotBjB9fZmuj7zvjJU3ct5Rjg9ibLOVQvYCTDRTfS7yDToM478PY/wbTRwTcAEDAAOwmZAvWTb3HGZdwaYE12PHksxwgJ7j0kVKcDZQW4y8MIxIEFiDBfA03LM3lhokFBoMUSIbcJdHrl3NYU5NMcU/k2y7WAqiuDXZiEw7GFC0qXFuDzrt92WT5qfcTX0xcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DvOrfQulIFTzW4sbyNiLZwsTlDqDhHaaoiLhGSJu4KQ=;
 b=oDt39rpKEM63hUx+VLwdJPboq65WMGvYctCkl3lyMget7uscnlRt/K4ikIl6/d0hnkohI4DFRNgn0YbEcYg+Ld1hQKJ6HKa6oyj8thybq2GlpW9aoNfPGOCQUJ/B/qrb9ahjrGPFAytUwq81Tn8kQmz82izUNh+dEfRmKnx5+YI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ0PR12MB6853.namprd12.prod.outlook.com (2603:10b6:a03:47b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 15:17:36 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 15:17:35 +0000
Message-ID: <9e8b2f14-6454-4958-8ac9-4f8dfc8745d2@amd.com>
Date: Tue, 4 Mar 2025 20:47:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Update PMF Driver for
 Compatibility with new PMF-TA
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com
References: <20250218120625.1718196-1-Shyam-sundar.S-k@amd.com>
 <20250218120625.1718196-2-Shyam-sundar.S-k@amd.com>
 <85237940-b9a2-0b19-44de-058a35e2089f@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <85237940-b9a2-0b19-44de-058a35e2089f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::17) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ0PR12MB6853:EE_
X-MS-Office365-Filtering-Correlation-Id: e62bd379-db38-48db-a3a3-08dd5b2fb138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STduMEVQYVJ5Nldqc2xqNUNPL2RKTVMrY1hNUUtzMktCUjJkMnJNYzd0WS9C?=
 =?utf-8?B?d2RGYzduaExJTnM4dnhFOW5yeGp4aUdxdm0vKzU2MDMzalUxL3hPdFEvSDFU?=
 =?utf-8?B?R3V5dUFTbEREMmI2cGZ4cVczMXlLYlFMek5YcjUzQzV3MSthTUl2YmQyWWl6?=
 =?utf-8?B?S0twNWJvVVY5YW8wQUhtNThPREs0RnZCemZ4ekd4WXgrTHJxMUU2ZmQ4bEd0?=
 =?utf-8?B?akVQQ2FyNU9IcWJzRERydEpXMCtjMVB0cTgvSHBuWUE2K095ajhiMEJGOWMy?=
 =?utf-8?B?c3M1N3Myb2I4bGVQSSs1UFZoTWQzS1V0NDBaNTBhVU9YenB2QU5hL3J0d1Bz?=
 =?utf-8?B?VnN1TFVkZkpTT21xN3JxRFREQkFSY0M1MndtSUZXdGxwY0tTaEdWMVpWczQ1?=
 =?utf-8?B?OWIveTA5U0NFLzAvR3RWYjFNTlNYa0J3empKSjNhQ29majNWV3NWbnJ6eHE4?=
 =?utf-8?B?TGJzMFlJczVsS3c2cG9vcnZKZXhhWDlmMVgrSzZFVWt6Y1JIdVMwbUlwK3Fh?=
 =?utf-8?B?TENUdXljcGdkYXBSMStGS1VMZERNQjBMKzBNUG9tZ1ZNWW1ZMmtDVDhGeXN6?=
 =?utf-8?B?ejZQVFBEU01kZlIrc1pYV1FOdHdWeXNmM0pjQ0NIZENFMWFndlpPTTduQzhH?=
 =?utf-8?B?aG1XSDVpT25Ra2lKWkdYREd0NklENWdXWDN0MWttdzkzZkJ1TjhDbHBqd0VC?=
 =?utf-8?B?akVLMDJKajF6ZUd3dnBLdmd0SjBnZEVWVDhHekN1elh0VmxTTVY3N0NIVkJu?=
 =?utf-8?B?MkYzaUg3am1nckFNSkx1K0lQTnA3SWNubG1DNHRoVzhvVVdxVktxWitFRDRR?=
 =?utf-8?B?cHoya1c5b1pYU2F1MWxWdkdUWldqWE4rN09RYis2TGlZUGZnTCs0MXprbmxl?=
 =?utf-8?B?eitIZktkSFdZSXNwR2xOeVJBblQvZ3U4VE5kbGtrVzZQRXFJYlJYcEVBWkxh?=
 =?utf-8?B?djVSdHVtYlIyU0FHUXNuajhPOVVMQ0FEOHQzZU10cG1Tc0cyNStBNXowZkxF?=
 =?utf-8?B?NnZkNXpyUytyL0xUZ3llQ2pUZExFUWVOZ2VndWtTQTZNRFRNQ2duNU1ZUzF3?=
 =?utf-8?B?Qm9kVDVQS2JzbDZzeUt0ejVheGI4ZU9mN1hCbWFzNlhMejVhekJvUVMrQmRs?=
 =?utf-8?B?MERzaGlSem1VWFB6cVlaQ1Q1c0pyNXduVHdzRXdVSkdUdmFCY0duaXVKT1I5?=
 =?utf-8?B?RVdlV21kMktoa3l0QXZ6WmlqSnQrYVJpeG9lZnpuY3F1UGVJTHQyS1VxT2ZT?=
 =?utf-8?B?cGdNM2tKZjRiSURLYkFEd0NVY01aQ3lNRDVqVGFHSWpGM0dtS1JYRUpmTTRM?=
 =?utf-8?B?cDljY05KRmZhMFRjdndzWmRaYzlYbnFaSXlEOTFLR2Jvdnc4MmhTMkVZQjdL?=
 =?utf-8?B?QXdSaGRobWZrUnVJYk9TenlmZUNMam1aS3kwRmtmUFpsdEZMZUJ0eksrQWdI?=
 =?utf-8?B?bUtxWjlmWGsyWDlMczFUajdOT1BEWDh0ZFpXS2t0WU54WnRaTXI4bHErUDhO?=
 =?utf-8?B?ZW9IZ0trODlpakZ6YUpFSVhoT3JJalFWTmtaY0c1K0tZL3FYMkdIZWF0OEVk?=
 =?utf-8?B?N2E1cFJCRjhWZm1LWVZGS0NCaXR2RGQrbWloR0tlZGpvRXZQMjh5ZnQvc0Rn?=
 =?utf-8?B?Q1ErQmZKUVRmMjkzUVVoamppd0FlTkhyTTE1WEFGb3hwVHNqTW5NUGh0WDJG?=
 =?utf-8?B?NUJFOEh0c0NaV0hicjA4b0RSVFNFeXRIWlZnZFdFeWNMS243Z0tSc1lKb3E4?=
 =?utf-8?B?VFZ0L055aGNjYlZuTmMzbXRWSmE5dVVvTU1ydkJQakxSMlk0Q3NndUxyVDM4?=
 =?utf-8?B?OWw2UmJuY2xwTkY1N1dDWm9XYmFxM2FCcStjWXArY1VsOThXZU9VWlQxb0RF?=
 =?utf-8?Q?0mctgFSHyoXJ8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUI4cWd4SWhKYlp3Vk1GcVB2emxLWFRIMDFkVmtSUmx0OXU1TlFHbG5PdTgw?=
 =?utf-8?B?SHNwZlhaSXRvQXh5dW5oWmNrdGpUQjVUQTBtV25WK2RoQmZFZDVUWmZPWU4v?=
 =?utf-8?B?VE1CTmo5cnhJM1VTb1doUEY4b3c5Tk1XNjhTWmpZaHk0cFgzQlMrdjRIdTht?=
 =?utf-8?B?azltTVQ4NldyYTU4aUtpa1JFUlRXLzEvY1FBS3U2OGtqZFFGTjVsdFpEMzIv?=
 =?utf-8?B?YkxoeGE1ck9FcGl4OTlpZGdodUlaY203L1RVTEJVK2k4UW9YOHFjRVFoR0pD?=
 =?utf-8?B?YTN3RUM0WmVKRlMvNjlRa3hqbGlWS1YzcDhxT3dONUl0R1VhaWw1TjJxdlFE?=
 =?utf-8?B?RnZ1NkF4aEdDL0J0Zk15K1dmN3IwRUNzYVl6a250SFpOUitseEVWMW4zS1F0?=
 =?utf-8?B?SDJQLzB0MmJSb3g5RTVlZWZXT3hIUDM0V2Z5RXJZaHB4TVJVREd0R2JUQXFa?=
 =?utf-8?B?akpsaGdiaXhqTTF3c2J1anBiQTBnYUtLMDBjVFRKVTZQdlBDb2U1aFZyVjI3?=
 =?utf-8?B?Q3huSm1EZFlQKzlhSTdTYUlIbkhIVUVtZVJNaWswTmdoMnVLdTlGV09TUkwv?=
 =?utf-8?B?UUgvZ2JUMEd0K0x2MTJqNVBiWkNtcTRVQW0yUTczRjkzNHZEVVRXTUZERlZI?=
 =?utf-8?B?eVJ0eENTQVRiaHNyc3hZUE5OenYvVkxheFV5NHo2VU9lNHNsSW5xMWE0V3hB?=
 =?utf-8?B?clRwZTFHRTRybUYvdll6OWhPTGFIS2lZcHp4TFViNUFLZjVkL3BLdzdnNU02?=
 =?utf-8?B?d3FucFZ5cjV0aDJGYk03alVaTiszcWsxRVg2eTZTY3Joc2VYVFhjN3dPWnhs?=
 =?utf-8?B?RDg3SUEyVzMxYzRNMmE3WkJXc1V5aFdIUWZmWDJKazJvNE53b3Y4V0NtQ2po?=
 =?utf-8?B?Zm0xQ2FET2pxRFYyVTJrZWxXdDJraWtuaDNaSmxEcWsvQ1FCdEcraThpTGFV?=
 =?utf-8?B?Z0NWcGdNaldRbDluVkJzVUd2N3o0UUlEM2N5MGQ3dUVKUzYzL0tjSkdxcmsv?=
 =?utf-8?B?aVRHVWJtWTkrY3dCK1orQTUyMXdtMEJzZFE4R0orbGhtcWdOUktJQks5YWJ1?=
 =?utf-8?B?TC9INzY5bjdtTnl2VjJTWTBITmswdCtZTUtHOTFueHBTUlpqNlRVS0tYeWs1?=
 =?utf-8?B?cGtaU3JmQlpZSi9zQW96NWlTV3MyWlZNR0hnbTZBVFIrY0UzbzhPZnFZRi9h?=
 =?utf-8?B?dUxXQU4va2NzMlppYkhWMktJY0dZSTMxN2hLN0pycmpzZjJuT1VDYnFvMk9X?=
 =?utf-8?B?WWw3OHp3Y1NRK3BMakhQMFNXWjdiekR1T25nOVlrOTVjcWxBQUxlRVFXU1lZ?=
 =?utf-8?B?TVZmcE96RjRGcVdjaitKWGlxRkdkZVRaTGJORjFiMXR1aElobDJSQkluOGEz?=
 =?utf-8?B?Wjh6d014SE8xOVNTb0tydkw2R0Z2dDJETkxKdWdHbForTkxDalpuUWNRdXhC?=
 =?utf-8?B?NHRmT25ZU0pMUml0TUpxRnFLZlpQT3lUNGdKRDdDMExmZjBva09LTVFrZjVl?=
 =?utf-8?B?MUlLclhpSjBWVFFhakxHSkwzcUUxZjgxRkRVTVpmSnhuenBta2tBZjE0cGxh?=
 =?utf-8?B?ZWhRYkd1aTQ5eXg2ZHRnN2ZpQmJ2cFBYcFo3cFZ1WkdXcmJZUWJyUW9VOURm?=
 =?utf-8?B?ZzVpMll0REVHNnBQVHlmUnZoTHFHL2l4Yy8rd3RyeWN5NWVVdmJVWmtmcVJu?=
 =?utf-8?B?Z0l6MlpKQWh5UUpHVFVHRjJBUmxPUzIxRnZldExpeEtLeWJ2QzRQQnJWc2dR?=
 =?utf-8?B?eHo5aElIL2crTWtVa0xXa1RZNjQyT05DaVBZdHFuWnVtNG51emFSUmFYelZV?=
 =?utf-8?B?akd4Y2dNZ08wcmFEMzVBcHE2Yi9wOVNjdGl2Ky9vbk1FZS92UHFpc0xUN0o2?=
 =?utf-8?B?d1d1ck0zQ0F4aTdCamMzSEJuUnhCQVVQb0p3YW5SM1gxalQ0RWJKQmdwM3Iw?=
 =?utf-8?B?Tk5iaGo2cVJ1ZXNRNEQxeXk5Z1pWa3VSR0F1N1lSL3l6V1Y4U1JyK1dDUkxw?=
 =?utf-8?B?THdMNGRkQ1J6cnJtVVFjOG1zWEpFM0JRTHpCVTRlQlZDRnFxKzhIM2R4RDNW?=
 =?utf-8?B?czJESC9LMWhtVVlhUjJEeWk0NFF4TWNzUWRYRVpBZnBib21mM1lENDRMK1A5?=
 =?utf-8?Q?EbFwBlKEo7P141qm78UfrEiNy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62bd379-db38-48db-a3a3-08dd5b2fb138
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:17:35.4874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPT8OLi7mQEnz0iGgrc9rY1ySsCL7B4OkgV6b+9TZMMzyjFCxqk6bKrIGZfrwcRE4Qdi8pSqNwjssJjaE7u2PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6853



On 3/4/2025 19:16, Ilpo Järvinen wrote:
> On Tue, 18 Feb 2025, Shyam Sundar S K wrote:
> 
>> The PMF driver allocates a shared memory buffer using
>> tee_shm_alloc_kernel_buf() for communication with the PMF-TA.
>>
>> The latest PMF-TA version introduces new structures with OEM debug
>> information and additional policy input conditions for evaluating the
>> policy binary. Consequently, the shared memory size must be increased to
>> ensure compatibility between the PMF driver and the updated PMF-TA.
>>
>> To do so, introduce the new PMF-TA UUID and update the PMF shared memory
>> configuration to ensure compatibility with the latest PMF-TA version.
>> Additionally, export the TA UUID.
>>
>> These updates will result in modifications to the prototypes of
>> amd_pmf_tee_init() and amd_pmf_ta_open_session().
>>
>> Link: https://lore.kernel.org/all/55ac865f-b1c7-fa81-51c4-d211c7963e7e@linux.intel.com/
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/pmf.h    |  5 ++-
>>  drivers/platform/x86/amd/pmf/tee-if.c | 50 +++++++++++++++++++--------
>>  2 files changed, 40 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 41b2b91b8fdc..e6bdee68ccf3 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -106,9 +106,12 @@ struct cookie_header {
>>  #define PMF_TA_IF_VERSION_MAJOR				1
>>  #define TA_PMF_ACTION_MAX					32
>>  #define TA_PMF_UNDO_MAX						8
>> -#define TA_OUTPUT_RESERVED_MEM				906
>> +#define TA_OUTPUT_RESERVED_MEM				922
>>  #define MAX_OPERATION_PARAMS					4
>>  
>> +#define TA_ERROR_CRYPTO_INVALID_PARAM				0x20002
>> +#define TA_ERROR_CRYPTO_BIN_TOO_LARGE				0x2000d
>> +
>>  #define PMF_IF_V1		1
>>  #define PMF_IF_V2		2
>>  
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index b404764550c4..a81c661abd7e 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -27,8 +27,11 @@ module_param(pb_side_load, bool, 0444);
>>  MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
>>  #endif
>>  
>> -static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
>> -						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
>> +static const uuid_t amd_pmf_ta_uuid[] = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8, 0x8a,
>> +						    0xcc, 0x2b, 0x2b, 0x60, 0xd6),
>> +					  UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d, 0xb1, 0x2d, 0xc5,
>> +						    0x29, 0xb1, 0x3d, 0x85, 0x43),
>> +					};
>>  
>>  static const char *amd_pmf_uevent_as_str(unsigned int state)
>>  {
>> @@ -321,7 +324,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>>  		 */
>>  		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>>  	} else {
>> -		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>> +		dev_dbg(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>>  		dev->smart_pc_enabled = false;
>>  		return res;
>>  	}
>> @@ -390,12 +393,12 @@ static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const voi
>>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>>  }
>>  
>> -static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
>> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, int index)
>>  {
>>  	struct tee_ioctl_open_session_arg sess_arg = {};
>>  	int rc;
>>  
>> -	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
>> +	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid[index]);
>>  	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>>  	sess_arg.num_params = 0;
>>  
>> @@ -434,7 +437,7 @@ static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
>>  	return 0;
>>  }
>>  
>> -static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>> +static int amd_pmf_tee_init(struct amd_pmf_dev *dev, int index)
>>  {
>>  	u32 size;
>>  	int ret;
>> @@ -445,7 +448,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>>  		return PTR_ERR(dev->tee_ctx);
>>  	}
>>  
>> -	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
>> +	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, index);
>>  	if (ret) {
>>  		dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
>>  		ret = -EINVAL;
>> @@ -489,7 +492,8 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>>  
>>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  {
>> -	int ret;
>> +	bool status;
>> +	int ret, i;
>>  
>>  	ret = apmf_check_smart_pc(dev);
>>  	if (ret) {
>> @@ -502,10 +506,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  		return -ENODEV;
>>  	}
>>  
>> -	ret = amd_pmf_tee_init(dev);
>> -	if (ret)
>> -		return ret;
>> -
>>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>  
>>  	ret = amd_pmf_set_dram_addr(dev, true);
>> @@ -534,8 +534,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>  		goto error;
>>  	}
>>  
>> -	ret = amd_pmf_start_policy_engine(dev);
>> -	if (ret)
>> +	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
>> +		ret = amd_pmf_tee_init(dev, i);
> 
> Any reason why you just pass the uuid pointer as it seems more obvious as 
> a parameter than something as vague as "index"?
> 

The objective is to select the appropriate Trusted Application (TA)
binary from the /lib/firmware/amdtee/ directory. This selection is
determined by the UUIDs listed in the amd_pmf_ta_uuid[].

Typically, the most recent TA version should be located at the first
index, with the next most recent version at the second index, and so on.

All these had to be done so that we don't end up in the version
compatibility issues we had encountered last time.

> I assume this change in general is to unbreak the case "3." from the link?

Yes. that's right.

Thanks,
Shyam

