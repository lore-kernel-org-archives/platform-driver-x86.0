Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2073.outbound.protection.outlook.com [40.107.95.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CF920B0F
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 03:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719546649; cv=fail; b=VXmHB8qpeYnQuhCe1bPz7yoXRZxSITWg//CE7Va2sv3C2foqvuoRRWXpnS7Np4Z0MxyGLW+DUkUEqsc3pogvRoGVz8BQWgXtsdaIIMEGNkeo9PQEUAHKmhdoVxdHDmzkf99tL1C4q4Us2I+FNOPFFws4GXVR9TYtShVYVZCvm8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719546649; c=relaxed/simple;
	bh=fhOUR9iVRdEUtI6bjSpqqD5wog4yNqVvVfRO9svTXso=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ogpqoeOhhz37XRspIZ4j0Qf7k/5DDeQtgMxt45u6j5wZHy4TgS0JoCN0jSx/k4kB6gtt/r1JVdaXduzZXgxYC006ZR0MgNOezUa1uc8+cpgI1IZHv93CMAeI+SKek+whR1B/FH2my+gshXQT4jV3CbC+YF3pIw9oJ77X82J5S5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I2RXmXG1; arc=fail smtp.client-ip=40.107.95.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I2RXmXG1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O99zxz2vB0CF81WFrfoy6LuWArqPmrN2H8iPY7LnVpJiYnwl19bRVXqmOgq+I88A7+kaJcL+7cjgztvrtxSNYzQiNW3MK9hSsWZrgFfeaDbWDiEGHLPaLRVfA/N7Y0v2qYtBsmSXm+4WfOCO1nbsfQh5UT2PPvMsqAeUuICwSTsuwA14tFMZVxuBtVXEXUiir8k5ipcpJCmtKKpVaXQ0uGLjwze5NkCVNqZ1YZYBJaLTh6ob//YHolFTY2eV5ZmaZRbT8QUhUU0uLEAXkOQj3iORdN5QzW5rtGX7NSK9GkZpv1HYVELyXFLgK8Ekqmc1t0bgBw6mg+YXgve70C/cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ldcsEB/dYWIhcrIebdmHfu+hvOpMEsaK+61D5In6OY=;
 b=lHn76vOTifOIr1d+hpVfMTDR7ecqsMKmNZ0L7gUEIt6HUo6uf3Yx9TMyCcQx3KUXPfqs7v2A4kHmnVpW3DPMop+H3Gh4HxyYblFdUvNIL1ZfZbLqClL/2UIvqKh76ib32S9JhjSL657+dECBRTAgg5MZjHK94rjIXol+7LbYYWRym4FZKY8OSJwsvwgD9ciMP9qpzoXuNGnsdnD5GxkDuf5JJvD4iPlBeUUzkTJKwisb7WJYZjG8axm4sEznwlZ3EqV541dlM0IclxOnK5AGhCCv+SRPZ/EJwOLDlohf+yaJLC3Sfpk5HfdbVPVCJXsiN7YaIFz4g7sEINQiHjmYEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ldcsEB/dYWIhcrIebdmHfu+hvOpMEsaK+61D5In6OY=;
 b=I2RXmXG1th4QU5asZDByVUjs8XChM/1gKfF/0tIRC1YSqgvIOMvdRzfqnYVYxn8fWqbonkHJwhoRN1SQG6HuF6CtwNJJSMp7VMFH6klPCsKktDrRBGzQcPxgpWcktZn54LpFL3M9EeHC8MAScQlDB2XJ2w9Yqx24sNov8rAmAFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by CY8PR12MB7564.namprd12.prod.outlook.com (2603:10b6:930:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 03:50:44 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 03:50:44 +0000
Message-ID: <27aa9e58-4dea-42f0-901a-0c9ee696fe2e@amd.com>
Date: Fri, 28 Jun 2024 09:20:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] platform/x86/amd/hsmp: Move read and is_visible to
 respective files
To: Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
 <20240627053958.2533860-9-suma.hegde@amd.com>
 <24f48c77-42bf-48f7-8e79-a97285bf4fc3@amd.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <24f48c77-42bf-48f7-8e79-a97285bf4fc3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::7) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|CY8PR12MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 345580f9-3836-4538-173d-08dc97257d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTFoaE10YUtmV2VTY1UwbkF4MTZxK3l4SzB4UzZOZUtQZ2pPTDMyMEVDOS9Q?=
 =?utf-8?B?REdHV00vcWxZc0RsaVFwVDExVFV2YXF6Y3JrR3QrTU1pRFdOWTByZ2RCb3VY?=
 =?utf-8?B?UU5VTDE0R0JWTWEwaGJLcmk3NGovK0VFb1ZkY3B0dmo4Z25peW4zaHhpMHU3?=
 =?utf-8?B?ZnZGNUxVaFl3dE1CakhobUZXamNydlF1NG4yYWFUUTdsVUVIdTg3RVZLSG94?=
 =?utf-8?B?THpqK0wyNkxGa21lSk04UC9zdG1ZN1JnREtXTExnVHlDNExGRWVnQmxIZGsr?=
 =?utf-8?B?dUJVc1Zpc0ZWdHpLenFJZm1zK2lkd3VTamw4YzFyRGdtdVZKb0M4cUxWNm5Q?=
 =?utf-8?B?TkZYb2FWcklIcWpXY010VUl0NGRLZ0FEYmNObkQvZ1JzckE3NXdqbjV0ODBU?=
 =?utf-8?B?UTY0RlFCaFpHbGtVblVZQjAySDljUVZZeWhoVlhaWE9WaS9zQmxsdmNLUWww?=
 =?utf-8?B?YlhLV0FSQTNBSHljT0hoRVB4cUJNbzdCVDU0TGJSUDJ3TWp4cWVNNWxRYUdN?=
 =?utf-8?B?ZUwyaEdzQ1ZtdVI5YVVJejBkVkc0cDF6SGtVaDBsZ2xrbkdialEwZW9kcm5F?=
 =?utf-8?B?aGI3akh1QndtNHF5d1dPaHhKSm5uZWdkTlpudVd1S1hyWDBmSVJFRngzVmVZ?=
 =?utf-8?B?dGFUSkJ6SHplRzNHTlFNRnN0cGdpRGVCM0xlK0JCd2pUNHFuRG5PS09tRFp3?=
 =?utf-8?B?bTNJZlowbUkrNitIRlpWbDAzY0VkTHVzbXd0R0gvdkRoYjZ6ZFpZZkp2OVo2?=
 =?utf-8?B?cG92S2FsSTR2NnBXVkN5dnZ2Mzg2RExIakRqbjUwSlZzcEI0aUtNZForMGE2?=
 =?utf-8?B?TVhESnBMYU1DeVNOaElYYUFzL1Zmb0tLMU1LZU5sMHdjWTFVOGU0U21TT2ta?=
 =?utf-8?B?K1ZxYW1RTWx5Mk5pUHZhWWcrWGJLbWRhYTArL2FtOUtOaVB2K2ZyTFFVckNW?=
 =?utf-8?B?WXArR0dPRzNjNmVYaStJMXBTeCsvb0JRVCtpVzlJV25IUGU4d1lRdXNmc2t3?=
 =?utf-8?B?elcyeDR6VUNnUlVWTko5ZytURDFIOE5qZmpoN255MmVDQVg1d1BhajNJM1NG?=
 =?utf-8?B?cjhVMW1sY1pQTzdXTDU4V25OSGdkMlNYNjFNVzlCK1I2RmdEWThFS1M3L1N4?=
 =?utf-8?B?L2lkZzRjSVNXQjdyczg5RVhYU2YyWGl3R2RHS0kzU3Vya3JUMXhKTC9WYytp?=
 =?utf-8?B?Q091VXZyMXpyL01ReHZickFRN2wwbVZvbVdvREp0R2RuZEg0cElaL3FYaG1n?=
 =?utf-8?B?cERvZEZnUTBjNW5WcEZNS2xKcXI4TkxnalVJZTRXdE9LSS9VUEdHTjNYbnJr?=
 =?utf-8?B?eDJyWlJyK2x5MzAvUjMzR1RSQXlWMTVFWG02WmJHS3NvNkdIczFrcTZLa3pI?=
 =?utf-8?B?TTArNjFnL2l1VTVLWTB1TndObmdCMHpiS0FwRGJMVkpYemlyZ2w4c2FvQWtu?=
 =?utf-8?B?b2s4WXZ3NXNUdHIrSU5DTkM5SkRBMEQzeXkwblJiN0E0dVFGUG95aThsYVQ5?=
 =?utf-8?B?aC9TUGhJNTZNRzJRcmRMWnlYLy9pWVQ3ZlVtSUhFS2VvTStHblhBbFBDeFpS?=
 =?utf-8?B?YjBvUlk0c1V5QlVvc3YwckNuTG1kLy9rZ0RCWUlpM2l4eXB6K1FwT0xSdWhE?=
 =?utf-8?B?Q3pGT2lBNmlTL1BGVHU3eWhoV3NNd1E0aG9Id1d0cTM0NFFuZVhZMUFqWEVl?=
 =?utf-8?B?amJWUlJkRTgyRlBGK3pNY3pUNkNNV3BsWktEZUlYcVVzais3TlNnV050YVgv?=
 =?utf-8?B?dFZSZGo1anVhTnJFSS9pSkk0a1BkRS84UU16M3U3ZUh0bVpCVk1LOXZWRkRl?=
 =?utf-8?B?UmwzV002QzlqN2xYdml6QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVJzZXJRZk50ZlZNUDQxRkNKN09NR1p3anA2VGNyRUF5UEVXZXVTei9wV2FR?=
 =?utf-8?B?V2ZqUm1VWjE5b0FHMWsxak1jRkdWRXJmamxXc1Uyck9lTktUVlBQcWhxZWFM?=
 =?utf-8?B?MVhVQ3lxN2ZmdC9FM3BDeThubk1qL0IzdGlJcVdvTFVMT2FnZm5aeFBlamE1?=
 =?utf-8?B?RXRPMGhtNko0RGFrUTBGdmdoTVdXL2x3WURjdjhaVHNvU3JWUThaODZJbmpx?=
 =?utf-8?B?cnNHcHVIbGoySXB6ZWN6dzB0VUhsUW1JTWxraVZLVFF5azVPM2p1cFY3NzV3?=
 =?utf-8?B?MnczYW9rTkc2VzBBZ2lSWUI5WWo3clhRb2pyZUQzYXBXeUtRTEtJMEgzL0t4?=
 =?utf-8?B?QWR5VlBvb2dEbi9CdXFORVVBNVk0SGtCeGNoblRrUkJBd2Z4bEIwWUNRSjFy?=
 =?utf-8?B?YTdrWjFkelBnQVk4VnJveEhzcUN5ditqVC9DM0VwWDlDcEd6Z09VV0lheGFI?=
 =?utf-8?B?R1hxS3doZU8zMHNvYlk0RmVRVE81Sk1JZWdRWklSeGdWdUd6ZXJITjRyR3RP?=
 =?utf-8?B?VzF3THhNTkRxTk5LeWoyWHZIVmRyYzZGZ3NkTXhLYzBRL3cxRUtjK2lYNkNH?=
 =?utf-8?B?VStjVnF0NXl3VzFwTkVxV3p0cndoQmM4UWdHdjd4RTVhNUYyQnlvUjFuSDFL?=
 =?utf-8?B?OWRmOVR5Q1c2SEJVRkNYMEwyRmVNRGNyQmJEem5qOGl6bW5CZ3cvaXJhYUQ2?=
 =?utf-8?B?RitBSVhPT09ONXdBeUNHNEluV1pMVHI4TVRwL1dxQk1hOFRselg2RFZOQkJ3?=
 =?utf-8?B?RjJabFdHZWgxb1lrTVJYa0gwVkRGOGhMZFBoRmR2ZFBqWnV5VHd3M0RiV1pi?=
 =?utf-8?B?RG1FaHZUR1RSRkkvV1ZkeXlFVWJZdTArMjVWOVF3N2plMnVHZkJCTXBNMm1U?=
 =?utf-8?B?V0N1Y3NzOFkyTGIvMkdHZUx5aVFRaUsrbmFqcU92K1J6b2UyZ1o4WGJDQVFT?=
 =?utf-8?B?RmxLd3NGMEpEYlcxUjFDVTdaTUJPMlFQS1ZQY1FNK041dmp0NXpHMTh4Q2E1?=
 =?utf-8?B?SkhNd3RETHFxVDU2VC95amhncWJIZmpQODQ1ck52ZzZZdkJpbHhTRmtzT3Zr?=
 =?utf-8?B?UmtiQTZPMlQyQ2NDbUFQR09OTlRqbnJEbXRFYnQ5M1JsQWRZbzM1TGFDb04y?=
 =?utf-8?B?bGpQcTZXN1NudlUxQmMwQjZBYUlPTGxkYzhJc0llcXRvQytFQnNtZ01pUkdm?=
 =?utf-8?B?amo1RXpkTTdqNHRJRDBCa0ViZXU1bkFqRmszZVZTRDAyWm9ZZTVVTFRWS0Qr?=
 =?utf-8?B?TWJJSWZPaFlQbDZEbWdOZUpiNGJzdW53bjN3L3Vndm42TnY1UHFqN0JPV0sr?=
 =?utf-8?B?RmsyTzhqbXBjbWE3WHk1bC9JRm1nek5GSGF1bm9MbTJhOTV2czlFVWNVaWZR?=
 =?utf-8?B?K2wySGNLTUwzM2dNeGdlQ3ZVTGhjZlhTWFh4bEhiaTk1M3ZNcWIzSUNQRlAx?=
 =?utf-8?B?YjNCNUhvbUo3UVlpMDJQaUlTM3h3cjQvbS9ZM2M4SnJhaHVLUWE2M2s0SlZL?=
 =?utf-8?B?NktBS3RGcVlOSU9hMXJ5NmZKSEtGaUxSZHQxdzRvQnlRelBiei8yZm1ZdmpI?=
 =?utf-8?B?NnBpSUI2dlZEZEtHNTQ3L2wvQVVYakJtbUtXOGVKSUNHSXVWRWJVd0ttYWFJ?=
 =?utf-8?B?bzExem00OW5UaHNnRnNscDFuQi9TT2VUTXhpc3hUTTM0WFI0bldrUklac3dw?=
 =?utf-8?B?QU9zdWZCYU94TThjc0J6MWd0ZkQxQUJ0aytlSGdBZkRGTGtxcGlGUk1OTjdm?=
 =?utf-8?B?K0J1Z0QxL2t4bTRxa0hNa1JsUFR4VVVYajBPc3JIWkNKZ0JGdWlnK1FWSm5N?=
 =?utf-8?B?UjRoSytZMmdtZDFoZ3lXc0tlWUU4MytxLzNrTDFQT05CbEJmcmV3WmthUXVt?=
 =?utf-8?B?TjU5bVVwYVdPcW5WV3ZlS00ycXVhcStMdWtibUhQVks1Zi9yUWhEQWtza01x?=
 =?utf-8?B?MkxnbDFTWUFFeTVOeWpRL3FVS1VzaHFJTzZDMjdXVVFYejRROUpyZVQrbW43?=
 =?utf-8?B?MTJ4UTJGL1pKR3VNdzdiR1hkUDRvZUJKa3hhT0t1eVVrTDUvMjBKbG41TGJh?=
 =?utf-8?B?TnhyK2xmaCtKNi9sZjFSV2h4NHZXcCttZ1k0ejVxRVRFY1dZSnE3QjRLSFh3?=
 =?utf-8?Q?Ff6zGJWSolYwuJFi5RFmazrcw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345580f9-3836-4538-173d-08dc97257d07
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 03:50:44.8323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khuWJ0uP5mzpNSnxh2oJkSzDSp8zX2BWtzsvJxSkoaVu10L7JsbfhB6MAnfFFKiMnF4RkOM/G3mssD48RVuw8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7564

Hi Mario,

Thank you for your review. I will address these review comments in v2.

On 6/28/2024 1:18 AM, Mario Limonciello wrote:
> On 6/27/2024 00:39, Suma Hegde wrote:
>> The .read() and .is_visibile() needs to be handled differently in 
>> acpi and
>
> is_visible()
>
>> platform drivers, due to the way the sysfs files are created.
>>
>> This is in preparation to using .dev_groups instead of dynamic sysfs
>> creation. The sysfs at this point is not functional, it will be 
>> enabled in
>> the next patch.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/acpi.c | 41 ++++++++++++++++++++
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 37 ------------------
>>   drivers/platform/x86/amd/hsmp/plat.c | 57 ++++++++++++++++++++++++++++
>>   3 files changed, 98 insertions(+), 37 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c 
>> b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 0307f4e7176d..1ea17aa296c7 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -12,6 +12,7 @@
>>   #include "hsmp.h"
>>     #include <linux/acpi.h>
>> +#include <asm/amd_hsmp.h>
>>   #include <asm/amd_nb.h>
>>   #include <linux/platform_device.h>
>>   @@ -206,6 +207,8 @@ static int hsmp_parse_acpi_table(struct device 
>> *dev, u16 sock_ind)
>>         sema_init(&sock->hsmp_sem, 1);
>>   +    dev_set_drvdata(dev, sock);
>> +
>>       /* Read MP1 base address from CRS method */
>>       ret = hsmp_read_acpi_crs(sock);
>>       if (ret)
>> @@ -238,6 +241,44 @@ static int hsmp_create_acpi_sysfs_if(struct 
>> device *dev)
>>       return devm_device_add_group(dev, attr_grp);
>>   }
>>   +ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>> +                 struct bin_attribute *bin_attr, char *buf,
>> +                 loff_t off, size_t count)
>> +{
>> +    struct device *dev = container_of(kobj, struct device, kobj);
>> +    struct hsmp_socket *sock = dev_get_drvdata(dev);
>> +    struct hsmp_message msg = { 0 };
>> +    int ret;
>> +
>> +    if (!sock)
>> +        return -EINVAL;
>> +
>> +    /* Do not support lseek(), reads entire metric table */
>> +    if (count < bin_attr->size) {
>> +        dev_err(sock->dev, "Wrong buffer size\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    msg.msg_id      = HSMP_GET_METRIC_TABLE;
>> +    msg.sock_ind    = sock->sock_ind;
>> +
>> +    ret = hsmp_send_message(&msg);
>> +    if (ret)
>> +        return ret;
>> +    memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
>> +
>> +    return bin_attr->size;
>> +}
>> +
>> +umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>> +                  struct bin_attribute *battr, int id)
>> +{
>> +    if (plat_dev.proto_ver == HSMP_PROTO_VER6)
>> +        return battr->attr.mode;
>> +    else
>
> Since your only path in the "if" returns this else is redundant.
>
>> +        return 0;
>> +}
>> +
>>   static int init_acpi(struct device *dev)
>>   {
>>       u16 sock_ind;
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c 
>> b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 4bf598021f4a..c199a0ff457d 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -273,34 +273,6 @@ long hsmp_ioctl(struct file *fp, unsigned int 
>> cmd, unsigned long arg)
>>       return 0;
>>   }
>>   -ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>> -                 struct bin_attribute *bin_attr, char *buf,
>> -                 loff_t off, size_t count)
>> -{
>> -    struct hsmp_socket *sock = bin_attr->private;
>> -    struct hsmp_message msg = { 0 };
>> -    int ret;
>> -
>> -    if (!sock)
>> -        return -EINVAL;
>> -
>> -    /* Do not support lseek(), reads entire metric table */
>> -    if (count < bin_attr->size) {
>> -        dev_err(sock->dev, "Wrong buffer size\n");
>> -        return -EINVAL;
>> -    }
>> -
>> -    msg.msg_id    = HSMP_GET_METRIC_TABLE;
>> -    msg.sock_ind    = sock->sock_ind;
>> -
>> -    ret = hsmp_send_message(&msg);
>> -    if (ret)
>> -        return ret;
>> -    memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
>> -
>> -    return bin_attr->size;
>> -}
>> -
>>   static int hsmp_get_tbl_dram_base(u16 sock_ind)
>>   {
>>       struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
>> @@ -334,15 +306,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>>       return 0;
>>   }
>>   -umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>> -                  struct bin_attribute *battr, int id)
>> -{
>> -    if (plat_dev.proto_ver == HSMP_PROTO_VER6)
>> -        return battr->attr.mode;
>> -    else
>> -        return 0;
>> -}
>> -
>>   static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute 
>> **hattrs, u16 sock_ind)
>>   {
>>       struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c 
>> b/drivers/platform/x86/amd/hsmp/plat.c
>> index 62423581d839..57aa64b18e0d 100644
>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>> @@ -11,6 +11,7 @@
>>     #include "hsmp.h"
>>   +#include <asm/amd_hsmp.h>
>>   #include <asm/amd_nb.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> @@ -88,6 +89,62 @@ static int hsmp_create_non_acpi_sysfs_if(struct 
>> device *dev)
>>       return device_add_groups(dev, hsmp_attr_grps);
>>   }
>>   +ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>> +                 struct bin_attribute *bin_attr, char *buf,
>> +                 loff_t off, size_t count)
>> +{
>> +    struct hsmp_message msg = { 0 };
>> +    struct hsmp_socket *sock;
>> +    u8 sock_ind;
>> +    int ret;
>> +
>> +    ret = kstrtou8(bin_attr->private, 10, &sock_ind);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (sock_ind >= plat_dev.num_sockets)
>> +        return -EINVAL;
>> +
>> +    sock = &plat_dev.sock[sock_ind];
>> +    if (!sock)
>> +        return -EINVAL;
>> +
>> +    /* Do not support lseek(), reads entire metric table */
>> +    if (count < bin_attr->size) {
>> +        dev_err(sock->dev, "Wrong buffer size\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    msg.msg_id    = HSMP_GET_METRIC_TABLE;
>> +    msg.sock_ind    = sock_ind;
>> +
>> +    ret = hsmp_send_message(&msg);
>> +    if (ret)
>> +        return ret;
>> +    memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
>> +
>> +    return bin_attr->size;
>> +}
>> +
>> +umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>> +                  struct bin_attribute *battr, int id)
>> +{
>> +    u8 sock_ind;
>> +    int ret;
>> +
>> +    ret = kstrtou8(battr->private, 10, &sock_ind);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (id == 0 && sock_ind >= plat_dev.num_sockets)
>> +        return SYSFS_GROUP_INVISIBLE;
>> +
>> +    if (plat_dev.proto_ver == HSMP_PROTO_VER6)
>> +        return battr->attr.mode;
>> +    else
>> +        return 0;
>
> Since your only path in the "if" returns this else is redundant.
>
>> +}
>> +
>>   static inline bool is_f1a_m0h(void)
>>   {
>>       if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)

Thanks and Regards,

Suma

