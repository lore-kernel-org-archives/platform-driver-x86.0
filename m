Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402CD12F37F
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jul 2024 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720507289; cv=fail; b=b8oiVAQS7mwI9TEWnwqr9oet/joGGsW2coMf+4G097m13QZ2IlkxnWoc0wSszVP0MFI4tYWEY/PozQTOrzLQCvubaVT3ovqsryPW8KTm49sw1xX3b9GubuB2yRBJ+be4Ud6O7BySKw9AyhWcD7PNfAJGuHLJUsDSdNaA5j3gFrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720507289; c=relaxed/simple;
	bh=wlOsTGIp3IYZqUsdAR5ANnDsrV6lgi5aCuvEr5/Fhos=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=If7CA3aX9tVKmIPp4d+xq+zV3mCggon6hP7gDQBzKiuIqzwobRXJXxvsJpgjvXW+ZiR/fOGC09TiItikOxdrBzby9T7ZQXKcoRLPgkDhaEDcrJ76Eb8jk3MNEVTJnjYUV9x8sr6+wuDhUh4uE4xFpOTLenPTjVd1M5kcBLZrI2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TCzxDT1c; arc=fail smtp.client-ip=40.107.102.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TCzxDT1c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVzMpbLcIkGJy/MF7jmfv/L7Quj8jnnFHVxQVSdswH6xQIIl518AyRy8yuwwxngPDWuOt33bnKvocc7HlRV0voFrt+htikthVB+DaHTW1xi3HdG4p+hsJ9jpl+MwOk4r8DvQBrq5eOVai+prE6mENqo9thqi4feq++gG/CgnKQHaDwgS61upmqv3rzNqdSiwjJdbXMm1WmJW3KXfjNQgwYDtH+tGtLzqFSOFwQdSuSRVrWq4FZZh1FG5ExbVt+iDoE2IuXUwE91osXdubpLGAa/vSLccA7kF/wbiHVD1VyFXoeEGMK/iwuw802FhEC28T/jRSUsrXXVZYvWB/gwNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRFsGHxwqdVPuFrcoXk+T/bfraP00NcfvaJzE6HGH60=;
 b=age5HlrVJCiJgF9TeO9XUavidSHexYkrq24WkP0+5pkuL7qkfQu7AOVBLlQxz0hJkiHtl1FVUhAZkuhOpfmTcEAeDluO1qKw5i4+14lYpCGPvHNTu2a5n35vZLUL5eGXa79DVKugR0/YKjiyurrkopsmx0QMmvT6NneTUcZxG7xRPiPaizYG88iq/8J9Wim9axjkp6f0g61m1K5vKo2gsxSUcn63XA4MoShAycaN5sZ9xXVhMuuZzSov80JNNOi7HKlkvtdJE6A1EXX5G1UrQjJjL1HFjiVtkibGpvos/1xAR/+iXDpZ0d/SHdsKnEs+545UfiyTFQcOzwzTMyr7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRFsGHxwqdVPuFrcoXk+T/bfraP00NcfvaJzE6HGH60=;
 b=TCzxDT1cfWhhPBTCV5phDdzGcML/sPAshCUqdD0lSrEdpCQSRjTx8xxHNlzQoO9L1axx04FdFWdEym8XE7a6+ef5APqWZvTq9timkvy+CCU5Qyc3pRUlNsXvAN0NDCUhYJS7N63ijDTCoxCn5FOk6shI00nLj4aw3DpCIwKb/Qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by DM4PR12MB6157.namprd12.prod.outlook.com (2603:10b6:8:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Tue, 9 Jul
 2024 06:41:23 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 06:41:23 +0000
Message-ID: <9490acd2-f1c6-4636-9b58-eb25d3dc314b@amd.com>
Date: Tue, 9 Jul 2024 12:11:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] platform/x86/amd/hsmp: Create mutually exclusive
 ACPI and plat drivers
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
 <20240627053958.2533860-7-suma.hegde@amd.com>
 <61f51c56-a378-8649-c165-f6b4fcdf54cc@linux.intel.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <61f51c56-a378-8649-c165-f6b4fcdf54cc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|DM4PR12MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ccc35f2-d2be-4603-ce8e-08dc9fe2260b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1pBL0MxUExnajM1TGcveDhBRkgyUStmN2p2Nnc1REFFcSt3TTkrM0cyQW9U?=
 =?utf-8?B?UlFJOHlrbHFaa0ZnalNnM0JFMHU4N3BVRWFRenQxN3BnZWkreVMvNTJUOEQ1?=
 =?utf-8?B?Sndhc2RmL25FV2VEY01Fd0UwSFFlb1pDZmF1RmsvcVhsSkhvcnpDZ0x3MmMr?=
 =?utf-8?B?K3lzclU0eDZtTEFyK1Ayd0cxaHZVbUJOUi9iZVJVQUZrZkhUZk41NDJFaWsy?=
 =?utf-8?B?MDJVcW9jU0g0dHVVWnRiWWZuQjBvS3lLZWxUU1Y1MGU0dHF6T1FJeityNXVp?=
 =?utf-8?B?NU9sODdjS2JJNTRSaTd2U0t0bmgyL1BmRXNIQXZzTTByb0x4czJVRVNmM3NQ?=
 =?utf-8?B?NjFJbVBhVnRnU1EzelkxNm1DVGQ5ZS9XenNSVVROYUJKVHJpWmM0ejdrQVlq?=
 =?utf-8?B?TGFIalVZNVVINElDMnUzNEwrYTBJMjlNZ2FRem1lbWl5YjdLbzJ2dTkvYlMr?=
 =?utf-8?B?QkdjQWpLWHp4Kyt0YkdkdXA0cmhBMEJyNERUQjVtVU1sckwxcE5RSVg4NjJl?=
 =?utf-8?B?NWVCSmNiQU5HOGRjcnRDaVBsVUpWajk2Zngydmk1V3RGaEtnc3FyVFZ5cndt?=
 =?utf-8?B?TWRvS1hrM3U4SEIwc3R4OXJTNVJ0WHVYOTNIUXRYRkNNV1RtR1UyYnJ1R2hO?=
 =?utf-8?B?eDV0cWN6OEJQYzZHT095c0tFMmVZUnBGd0lxM0E5bjRPejhkTHBGRzlsUjcr?=
 =?utf-8?B?VktmazgrKzdLa1EyY2tqaWdobWkvVTRyeFVXakduNDE1MDN3a2tpaVY5TzRh?=
 =?utf-8?B?OWVRVjZwVGdCVlpOeGVTZmtVaEl5RHo0NU0xMEZVaU0wanhiclppMU1YN0pH?=
 =?utf-8?B?VU5uRGdJcE45Yk1HbnRrb3BLREJVSUVhY0NtN3VZWWJvaFMrcnhDUWpya2xF?=
 =?utf-8?B?azlNa1RqZEl6QjhsazU3WWg4eE9HejZhWXVMOEwvKzZGcVU1WjBHcGVKYzNP?=
 =?utf-8?B?NUo4NVJuSVE0MGpJWDRFS0JlczdlUldBRXlCQWkrcjk1Mzd2NDRReEJsM1lo?=
 =?utf-8?B?dWZPQ2l6ais3UmE5WWVldmd2WkE2RlA1TzVmSWJlRVNCNGVxcU9EYWhyb29q?=
 =?utf-8?B?am0wNmVYMnREdldaRFA3aWl3MTU0MEpaU1N3R1ZDV3BQc0pSYzZ5U1VITUxJ?=
 =?utf-8?B?YlI0dXptWUdIeERLVWlVMkFmRWFBamRBMFp6dDlYM1ljYUtHWk44ZmhaTHlm?=
 =?utf-8?B?WE04ekpqZTZFVDV5VGdYU3UzeFRKMGdMeHZHWkllZUlGSTRuRWE5S3Y2ZVdl?=
 =?utf-8?B?N1JXaXJUWUVNdjMxU21UNDBLUmYwVXdXb2RnTFpDV2RJWWwvbjV2UHVTb2Ri?=
 =?utf-8?B?UG41Zkl6UFVrMHJ6V3AxK3R0Rit1VFNhSm1rWEN2WE9SelN6cittU1haWjVk?=
 =?utf-8?B?LzdMeHVVallXTE9XdHZvSXh1eEJrL3ZINnkxa2xHL0tkUEF4Zll2ODh4K1dE?=
 =?utf-8?B?ODlVMXo2OXlZeFQwV1VPcVgrcWdMVjVJbHdZUk9IeEtBb1YzYUFCbzdJMyt2?=
 =?utf-8?B?RThSeG1vY1NPRkZ3MkJiVE1vbUdMVXpRSFZBY1dPVjFPUHdkb29HTnNFRUV0?=
 =?utf-8?B?WUxFcU1kU29zOVhzazA2VEdJL3JJUnkyc0hLYkxzaGxyRXhrd1BjeUdHYlZY?=
 =?utf-8?B?MlB2R1F6QlJ6bjNQU0dJTU5aRkhVU1BsUHRsYlRzU0RBQWFPd0IvcHBCKzlE?=
 =?utf-8?B?MUF4N2FxT2xaNVhzYVp2cU0wQ0NoK290TkJxRWVhc25EVjJNTmgxRmtQUzNX?=
 =?utf-8?B?RGNTZks0cDUzYjByRzNtMW10aE1VNGNtZ3kzREJSU01XdFR1Z0lDcVVzVFdM?=
 =?utf-8?B?N1BlYytIWjk4NDhGVWxKQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c21DY3pCZ3dVZEVsVmU3S2VXMnRHOHVtdjVnenhmTkx1RDI4Ujc2ajUwcU9o?=
 =?utf-8?B?S0xSdDBibVpXbml0L2tvUGNPbW8vdmx4WEIxaGxMUXVMRmhJTzdSbE1oRVNn?=
 =?utf-8?B?bFRMUitpMFNnZ1c0a3I1c0pvWk1icGJ3VHM2VG9CT2FMN0c1cVZ3amR1N3g5?=
 =?utf-8?B?L0Fya2V4MzRGMkFSdDlHZENxVUNSVG53Z2I5S2Q0cDBDbUJ2QVg1UE1PZTQr?=
 =?utf-8?B?NnJoUVJMeng2dHlFNW9lZjRwUSsva2o3a3J3Ly83QWFMRkFIV05nRXJ1ekxF?=
 =?utf-8?B?LzliUTdadkFlYU9wcDdNS2tTbm1Cd2lTK3lISnhYSzllL2NpcXl4eGxLNEtn?=
 =?utf-8?B?UXNUTDk2Y1hsK2x6V1lUUEs2N1l4VjZabGppciszLy9jSTdJbERpaVZTRVhj?=
 =?utf-8?B?Q2ptVjRnM1FQVkhlaGlNT0R5SVVaQ25aaUNRc2NCdG9JNEFLYXg3OXdVMTM2?=
 =?utf-8?B?ZlNNTXUzeG4zbWFBVTJQUEJsZm9JMUh3bExOZkpjYkxibXBlUmpZUWtESUlj?=
 =?utf-8?B?aEFkS1FndTE2WGNrUUdtT052NGpNLzBEN1NmSUxvbzBqUlErdE1yUm0raUh1?=
 =?utf-8?B?UlYyT1B4WEpiTVRyQ0ZTcXVyTHRzQllPKy9wc1p2RTlnUllxUlcxZ2NKMkZi?=
 =?utf-8?B?Smg3YlZEWlZkSjVvM1pWbEVsSmMySVdmTTNYL0ZVY0pIZzBBTzJDRXNUN2xr?=
 =?utf-8?B?aSsvTk1DTlBuVU5ZTzBSbFFHRml1NnNaZUMyZ1JlKzVEMWk3S1ZJSTE0MENV?=
 =?utf-8?B?aEJkUVBITXcwOUpPNkxnQytwSlBrdzZldE9iT2M3YU9MbzhkUVNnMXJrT3NN?=
 =?utf-8?B?ZnJnQ3U2UDVoT2k5VUh6MFZWSklGeGMxcU1vOS9Pa2NpVFVyRmFpTUNURE5B?=
 =?utf-8?B?WXRtRUNET0wyY2FGS214TEVrdStQRXZYZmhNQmZjd3dSNEV1NkpBcVY0bWxw?=
 =?utf-8?B?YXBNcC8vK1JadXQyVVd6Rm9VVGZLUDdZKytlMzBpN3NoeWYwdXdBdTJQMC90?=
 =?utf-8?B?S1VoRDhkWWJkRlh6VXdHQ3hPMFNpZnA5YUJiR21RcnBWNmpYT0tSYmVVaG8x?=
 =?utf-8?B?OWJtaW1vMTJWSnl1Si81RmNGbmNwSEpwbDVUaENZQnJVaXpRbGtpUmNHM1BM?=
 =?utf-8?B?QmNobzJ4VWMxdklIZVpXWWJTdVBqejEyTG5iYkpneTNuMlBIVjZMRXorRFVp?=
 =?utf-8?B?b0grNE41eHJyVUE1VnMvT1NqU20xVWxpNjlSY05VQmpIaTBGZ0x1NlE2WmVS?=
 =?utf-8?B?V0g4Y3JUK3lWNktEcE5SYkZBMnU3MEdRWWhDVmtFVFRoMGpHbnpVZVRsTEMx?=
 =?utf-8?B?WXo1THgzNFhzalhSdW9PeHFpSWlkc2UrNHVQQUh3cFZqTUJRZ0NUZ3d1TUZl?=
 =?utf-8?B?T1NzWGdzNWF0eDh3OE1ycFN6OVpUc3RpeUFLTlUrVDh1d3ZaTS82VFc3YSti?=
 =?utf-8?B?dW1Gd0tNb0hDdWhCN2JhVUdYVVNlcTQ0RUM4QWVMZnAxVFozdVAvSjNaTDA1?=
 =?utf-8?B?cDNCL2JYYTM3TWVhRTdwb2xCTDVqaTlhMUdiRklKUC9Xa3RIbEczMFhQdmhr?=
 =?utf-8?B?ejUycVRkdU1BZVJTRUFTUFZHQXNPNGtpNkp6ZDFBR09ycENZbXFjMjd6ajZy?=
 =?utf-8?B?MGp0dUNPdUh1cDNFcGtmYVZRa3p4YjJPLzNXSWNRNmZpZGFCcldSU0dBOTAr?=
 =?utf-8?B?dmw4QlVGTlNjZ0p3OTBSN1ptc3VSRXRMWFYvazd5SG8wYXhDTzhuN3VIUDdS?=
 =?utf-8?B?M1FzcXFyT3RCcm5lN1FjSkFWdjhEL0dRaU15RHlEZmcxM2h2aWZMVjhoRzRB?=
 =?utf-8?B?WUlYS1BXQ0N5TERzYkJobXh1RmtzVXdOQW05OGpsbVE5NDd3TU1YQTNOZ3VQ?=
 =?utf-8?B?UTF2UW12ZEpvYlo1MTNYUGVVU1djSVQwc3dkME01VDJXMUV2ZEZHTGFHaHZW?=
 =?utf-8?B?Y2c4WENRWWpTZWEwME9XaTFQUEpnT0xXNVlEcmtxUU9mUmRXMjBoU25KVkR2?=
 =?utf-8?B?VWcrWE1Mb09CYWNQcERQd2xKTStNaDNqQ1lYdnhObGVHNEkzMFArWGRqOGpH?=
 =?utf-8?B?TXB0MENEWVZBSFhTT0ZJbTN6MlRpMUFsdUpMSlI0TWZLN2Y4WG1SOVh5UThI?=
 =?utf-8?Q?siEDOmJC2dbNtJj2Rs5bpqUUv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccc35f2-d2be-4603-ce8e-08dc9fe2260b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 06:41:23.2973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MsPyU1a+QMI3RBMthdzqW8+5fpwoEBFklFDLEcmfK7HlUAcKbdHpY5glTGtIMC0cG/xZr4yLrejQvqSz3vTGAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6157

Hi Ilpo,

Thank you for your review.

On 7/8/2024 3:45 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Thu, 27 Jun 2024, Suma Hegde wrote:
>
>> Separate the probes for ACPI and platform device drivers.
>> Provide a Kconfig option to select either the
>> ACPI or the platform device based driver.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> ---
>>   arch/x86/include/asm/amd_hsmp.h        |   2 +-
>>   drivers/platform/x86/amd/hsmp/Kconfig  |  25 ++++-
>>   drivers/platform/x86/amd/hsmp/Makefile |  10 +-
>>   drivers/platform/x86/amd/hsmp/acpi.c   | 114 ++++++++++++++++++++++-
>>   drivers/platform/x86/amd/hsmp/hsmp.c   |  25 ++---
>>   drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
>>   drivers/platform/x86/amd/hsmp/plat.c   | 122 +++++++------------------
>>   7 files changed, 183 insertions(+), 123 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
>> index 03c2ce3edaf5..ada14e55f9f4 100644
>> --- a/arch/x86/include/asm/amd_hsmp.h
>> +++ b/arch/x86/include/asm/amd_hsmp.h
>> @@ -5,7 +5,7 @@
>>
>>   #include <uapi/asm/amd_hsmp.h>
>>
>> -#if IS_ENABLED(CONFIG_AMD_HSMP)
>> +#if IS_ENABLED(CONFIG_AMD_HSMP) || IS_ENABLED(CONFIG_AMD_HSMP_ACPI)
>>   int hsmp_send_message(struct hsmp_message *msg);
>>   #else
>>   static inline int hsmp_send_message(struct hsmp_message *msg)
>> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
>> index b55d4ed9bceb..1cb10d2aac77 100644
>> --- a/drivers/platform/x86/amd/hsmp/Kconfig
>> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
>> @@ -3,9 +3,30 @@
>>   # AMD HSMP Driver
>>   #
>>
>> +menu "AMD Host System Management Port driver"
>> +     depends on AMD_NB
>> +
>> +config AMD_HSMP_ACPI
>> +     tristate "AMD HSMP ACPI driver"
>> +     depends on ACPI
>> +     help
>> +       The driver provides a way for user space tools to monitor and manage
>> +       system management functionality on EPYC server CPUs from AMD.
>> +
>> +       Host System Management Port (HSMP) interface is a mailbox interface
>> +       between the x86 core and the System Management Unit (SMU) firmware.
>> +
>> +       This driver supports ACPI based probing.
>> +
>> +       You  may enable this, if your platform bios provides an ACPI object
>> +       as described in the documentation.
>> +
>> +       If you choose to compile this driver as a module the module will be
>> +       called amd_hsmp.
>> +
>>   config AMD_HSMP
>>        tristate "AMD HSMP Driver"
>> -     depends on AMD_NB && X86_64 && ACPI
>> +     depends on !(AMD_HSMP_ACPI || AMD_HSMP_ACPI=m)
> depends on AMD_HSMP_ACPI=n is simpler.
ok, will change it to AMD_HSMP_ACPI=n.
>
>>        help
>>          The driver provides a way for user space tools to monitor and manage
>>          system management functionality on EPYC server CPUs from AMD.
>> @@ -15,3 +36,5 @@ config AMD_HSMP
>>
>>          If you choose to compile this driver as a module the module will be
>>          called amd_hsmp.
>> +
>> +endmenu
>> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
>> index 0cc92865c0a2..53ebc462b0f9 100644
>> --- a/drivers/platform/x86/amd/hsmp/Makefile
>> +++ b/drivers/platform/x86/amd/hsmp/Makefile
>> @@ -4,5 +4,11 @@
>>   # AMD HSMP Driver
>>   #
>>
>> -obj-$(CONFIG_AMD_HSMP)               += amd_hsmp.o
>> -amd_hsmp-objs                        := hsmp.o plat.o acpi.o
>> +ifneq ($(CONFIG_AMD_HSMP), )
>> +obj-$(CONFIG_AMD_HSMP)          += amd_hsmp.o
>> +amd_hsmp-objs = hsmp.o plat.o
>> +endif
>> +ifneq ($(CONFIG_AMD_HSMP_ACPI), )
>> +obj-$(CONFIG_AMD_HSMP_ACPI)     += amd_hsmp.o
>> +amd_hsmp-objs = hsmp.o acpi.o
>> +endif
> You should add a third symbol for the core that is selected to make
> the Makefile side less convoluted.
>
> The build system might work with something as simple as this (I'm not sure
> if ...-m postfix works for composite objects, ...-y is documented to
> work):
>
> obj-$(CONFIG_xx)                        += amd_hsmp.o
> amd_hsmp-$(CONFIG_xx)                   = hsmp.o
> amd_hsmp-$(CONFIG_AMD_HSMP)             += plat.o
> amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)        += acpi.o
I'm trying to keep the config symbols changes minimal. Existing users 
need not change their build setup. New ACPI users can include the ACPI 
one instead.
>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>> index 90bfa1ddadbf..0307f4e7176d 100644
>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>> @@ -12,21 +12,34 @@
>>   #include "hsmp.h"
>>
>>   #include <linux/acpi.h>
>> +#include <asm/amd_nb.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define DRIVER_NAME          "amd_hsmp"
>> +#define DRIVER_VERSION               "2.3"
>> +#define ACPI_HSMP_DEVICE_HID "AMDI0097"
>>
>>   /* These are the strings specified in ACPI table */
>>   #define MSG_IDOFF_STR                "MsgIdOffset"
>>   #define MSG_ARGOFF_STR               "MsgArgOffset"
>>   #define MSG_RESPOFF_STR              "MsgRspOffset"
>>
>> -void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>> -                     u32 *value, bool write)
>> +static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>> +                           u32 *value, bool write)
>>   {
>>        if (write)
>>                iowrite32(*value, sock->virt_base_addr + offset);
>>        else
>>                *value = ioread32(sock->virt_base_addr + offset);
>> +     return 0;
>>   }
>>
>> +static const struct file_operations hsmp_fops = {
>> +     .owner          = THIS_MODULE,
>> +     .unlocked_ioctl = hsmp_ioctl,
>> +     .compat_ioctl   = hsmp_ioctl,
>> +};
>> +
>>   /* This is the UUID used for HSMP */
>>   static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>>                                                0xa6, 0x9f, 0x4e, 0xa2,
>> @@ -189,7 +202,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>>
>>        sock->sock_ind          = sock_ind;
>>        sock->dev               = dev;
>> -     plat_dev.is_acpi_device = true;
>> +     sock->amd_hsmp_rdwr     = amd_hsmp_acpi_rdwr;
>>
>>        sema_init(&sock->hsmp_sem, 1);
>>
>> @@ -202,7 +215,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>>        return hsmp_read_acpi_dsd(sock);
>>   }
>>
>> -int hsmp_create_acpi_sysfs_if(struct device *dev)
>> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>>   {
>>        struct attribute_group *attr_grp;
>>        u16 sock_ind;
>> @@ -225,7 +238,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
>>        return devm_device_add_group(dev, attr_grp);
>>   }
>>
>> -int init_acpi(struct device *dev)
>> +static int init_acpi(struct device *dev)
>>   {
>>        u16 sock_ind;
>>        int ret;
>> @@ -259,3 +272,94 @@ int init_acpi(struct device *dev)
>>
>>        return ret;
>>   }
>> +
>> +static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>> +     {ACPI_HSMP_DEVICE_HID, 0},
>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>> +
>> +static bool check_acpi_support(struct device *dev)
>> +{
>> +     struct acpi_device *adev = ACPI_COMPANION(dev);
>> +
>> +     if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
>> +             return true;
>> +
>> +     return false;
>> +}
>> +
>> +static int hsmp_acpi_probe(struct platform_device *pdev)
>> +{
>> +     int ret;
>> +
>> +     if (!plat_dev.is_probed) {
>> +             plat_dev.num_sockets = amd_nb_num();
>> +             if (plat_dev.num_sockets == 0 || plat_dev.num_sockets > MAX_AMD_SOCKETS)
>> +                     return -ENODEV;
>> +
>> +             plat_dev.sock = devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
>> +                                          sizeof(*plat_dev.sock),
>> +                                          GFP_KERNEL);
>> +             if (!plat_dev.sock)
>> +                     return -ENOMEM;
>> +     }
>> +
>> +     if (!check_acpi_support(&pdev->dev)) {
>> +             dev_err(&pdev->dev, "Not ACPI device?\n");
>> +             return -ENODEV;
>> +     }
>> +
>> +     ret = init_acpi(&pdev->dev);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
>> +             return ret;
>> +     }
>> +
>> +     ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
>> +     if (ret)
>> +             dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>> +
>> +     if (!plat_dev.is_probed) {
>> +             plat_dev.hsmp_device.name       = HSMP_CDEV_NAME;
>> +             plat_dev.hsmp_device.minor      = MISC_DYNAMIC_MINOR;
>> +             plat_dev.hsmp_device.fops       = &hsmp_fops;
>> +             plat_dev.hsmp_device.parent     = &pdev->dev;
>> +             plat_dev.hsmp_device.nodename   = HSMP_DEVNODE_NAME;
>> +             plat_dev.hsmp_device.mode       = 0644;
>> +
>> +             ret = misc_register(&plat_dev.hsmp_device);
>> +             if (ret)
>> +                     return ret;
>> +             plat_dev.is_probed = true;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static void hsmp_acpi_remove(struct platform_device *pdev)
>> +{
>> +     /*
>> +      * We register only one misc_device even on multi socket system.
> multi-socket

will correct it.

Could you please also review the other patches in this patch series?

>
>> +      * So, deregister should happen only once.
>> +      */
>> +     if (plat_dev.is_probed) {
>> +             misc_deregister(&plat_dev.hsmp_device);
>> +             plat_dev.is_probed = false;
>> +     }
>> +}
>> +
>> +static struct platform_driver amd_hsmp_driver = {
>> +     .probe          = hsmp_acpi_probe,
>> +     .remove_new     = hsmp_acpi_remove,
>> +     .driver         = {
>> +             .name   = DRIVER_NAME,
>> +             .acpi_match_table = amd_hsmp_acpi_ids,
>> +     },
>> +};
>> +
>> +module_platform_driver(amd_hsmp_driver);
>> +
>> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>> +MODULE_VERSION(DRIVER_VERSION);
>> +MODULE_LICENSE("GPL v2");
> --
>   i.

Thanks and Regards,

Suma

