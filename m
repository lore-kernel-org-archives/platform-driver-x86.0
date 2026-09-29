Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22272E8DEB;
	Tue, 29 Sep 2026 02:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790648538; cv=fail; b=oQn3OOoQ25svDl7540T2sIP/bbU8L9oRHw6yGLWvyNDqooW5zhhPxjS/8F3n+SfxsWm4AaiqeJEcYVwG+6NHovWX4gxCOIAo2l6cYZdxF0wGS/EatPk/m0Nai1/b45BuUrPXMlZjeQ4g5mjNmQuwbIf5C1/qEf1Z+5PToDFnorw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790648538; c=relaxed/simple;
	bh=92rLKxw2U06xP2AIT8EaIotV1UaXG8OZ/8gVBuFuNbA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ekUmS5HHBpKgILYwfm2mGgV/4Jon7KCWh+EOprA2eWRngvf0VU42ERFzvOFbXjIVeebWonIpkQhxQ5aA9gMoxCAfgIGcdW+ePpv40ShVejNVU/Eu7NpoEFjRu2i8poJrDPItvibAbs4VUi9rCa/RG3LlVpKZBs0LGqY3EEJFYd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y1fE7czX; arc=fail smtp.client-ip=40.107.200.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y1fE7czX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQtKXyrt0N0TrUJeaybD9dKJv1+GU8uoXU93HHwdYrSgN8ikxQLq1nBXufmEgOuP9zBxleGk3hhv5cB/WkPuUluSHIqdq1Yf5ZAB3Mlagpc3YoHtjumN2QCU8OIzVesvhDDGqzUyu9m0boRHI2+tQMu3j5evLnyhTi6qVHKzGq1Z3uiQtIIr8JkzD2LfUw2QWC8Q95nX70/7B2OeXKW28TBrRrVgPT691nhDB6+QBBcO2lo7vVgyKyjiiERMc/vUnhVjozI7Is1YlWpMJkIvSRvhuzVifI41O5qiX8oCyQFZogkK+LT57PMdv2QIkEiDRWAdEswbEap5ykY50utE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlRPg4RKfK3982MX+UdDr12Wb9APNc2E/BVx3iFraNc=;
 b=pNm03PiF6g7NX2dkghsLv2xhGNtGo97pC6doP5Q+9g1QgqK2kyPmA3RJ2lUlyax3w9UllZBLGIIWwdU0uWQKfdbU1Z6+THYqjks2qtHvWq+qYa7Xhak0F4qcaLzQJXlOvoBqcHHjgK4tlvEKKgG/wESaTiDfvBt5EW8Q0soQQSB3INucEh+mZsQZxMm+HUVap/ef3MbVL+0AnnfDlDTQOL+N57GM4pCmIQyp2FVr5MOQ63o2GrEhPBOW52qcZM66iU9FamCfx7fogZlKiwsbH03vlqofc1HFLDi2nEL45FPlBhS1PXBnRC8HAGdC7OkMtqLLIY48forW658CtojBeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlRPg4RKfK3982MX+UdDr12Wb9APNc2E/BVx3iFraNc=;
 b=y1fE7czXS83BciwtJKrkMZ7998W0npJt7x155DkiUAOo/IZT/adPfqf0lM34QMUatqtLo7XHItMSfIOkprxuH5FRQPtEL8dBqfg3PM8d3M9hm9osEOSqwpTz7R3Tt+wathtSiP6eg6jaMVVyJWchz4kJiZh8Wq+GcOflQm6LKFg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by BN5PR12MB9488.namprd12.prod.outlook.com (2603:10b6:408:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 02:22:13 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 02:22:13 +0000
Message-ID: <ce21e203-f4b8-46cb-9530-88c5c3bc9159@amd.com>
Date: Tue, 29 Sep 2026 10:22:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: ASUS ROG Flow Z13 GZ302EA OV13B10 support on AMD ISP4
To: Daniel Chadwick <d.chadwick2508@outlook.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <DU0P192MB2938FCCF40E122682A04305581812@DU0P192MB2938.EURP192.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <DU0P192MB2938FCCF40E122682A04305581812@DU0P192MB2938.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0045.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::6)
 To DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7747:EE_|BN5PR12MB9488:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e84ca63-191e-4872-bed4-08df1dd078b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|6133799003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	TiA9Hd9FkRqFPV2oUmdtuEmw0ugJeEpTjwhmPmOEUyBU3i4SXjZ2AwuZ3KPrFD9PHEOLQLrXFAZu/drCWpaiKp6BB9XD8NJ7jDJ5WwZtSx1dWYO4arTMyqB0TP25yP9H1FROjGXcSaU4F9qbWDhtJDNScFQ1zSCrW9e8G3w1WgUrAoscEC90lOjcuNrncDEDaN82vclQ9zt1ZZ1r7Hmf8ZbokAO3ib2n6ZKFm1Feab4MCVYK3/Nqd/NgpelwOhcsFMYyDkjRM1hnEtz03R8bJslVHnx6g+6Ai0P47M7BUmrONOtKOzSiZojk4meUL9j8gfDkvbqWWX+fu+lnanfuC8K1kZ+bxYDJxtFB61HY5g2jOot2Ue9hQBh+lTvEdeH6205GoOdAqGwaFdyuYakMNBhDeDJBhpn1QLQbmbWEN1n7XlFwle74GhFanpqQBdRg+ujn53abAEsEyqZed15C6Y6mydBaz/z+8yph1nxzop7MFt7KftVW6S3KN9X2HDr9FndvfyJPR+JvnSXei7opWEpCLfxnVXLZnW792jombF8O1LUYrdHRtlA+Fnmcs2T4OEMV6WHhF/EPDQibKWcg4Bv3QO5hCtsZRAWfywYWNTLWBTYG76Fi+wRaQ0BteHLtyCpX/rzDdPHvSVcOpSEDvNhTbcnnBOsO3rYoIxfYsQs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(6133799003)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ynh4Q3VmUXZGOW5aT3VxUHc1aDBWWHFhRG9yeG91eTg0cVRBc2xyUkRBbmk2?=
 =?utf-8?B?Ri8rS2tFK2piRDQ5RzFJNmxidEVPL0oybDFPYjEwMy92TzQ5MDU4bGlmNnB0?=
 =?utf-8?B?ZXd3MWFIQTJNZStpWEU3TTNJbWZCakxsM1hHOVRxbVM4a05lSEp0NHVZOWFP?=
 =?utf-8?B?L0hBb2pUcHJlZ3BOVXRJSWV5TTZVT1pOV3p1Tk92ZS9oKzVCT2VTZC9hQW1T?=
 =?utf-8?B?NVlDMzdMallrcVV2dzlCRVoxMXMwMlc1OXVCZ0MxS2VLOWxwVGtsekFMWDV6?=
 =?utf-8?B?c2RrTzN0aDVGNG9Wb0lpTy9sOEcwUjNhbXd5bXhLdjJzeUkrZytOTjlrOWpX?=
 =?utf-8?B?TlM3YWZjc0FaSmR1UU5NU3NlaDB5QnN4V0ptTFNZbnBUMmFRYmxxNFZDQlcy?=
 =?utf-8?B?SlZHVVViNmN6TUtnOEJ0R3B1a3Vvai9xQ2ozZXc2OVN0UlNPVmhER3huRUtx?=
 =?utf-8?B?UjlNTXd5blVOSk1VbWR5NEtDRVppREJqRzR3QU5tMTBDbW5Nc3dlNXgyOS9Y?=
 =?utf-8?B?cEc2aW8ySFdMWmU2b3VxU2JqWDhNb0ltZkRMcGZZTmZGWEdFQVZYWlpvcUUv?=
 =?utf-8?B?c3FMa3habm4wYjNrd1FFcUlDSUw0cHJIWXhkaWt5MUV4dURZZlNOa2g4RDFF?=
 =?utf-8?B?SGVGd0lhcWVIMkRybjdja01kTldEUFMrSUkxNkdaSEl5ZmdaN2M2MXBucm1n?=
 =?utf-8?B?Ull6SXV2UFk5U3E1bVVSZE4yTzE1SHZmTURBM2JPYXNiWVdkRDRaVWh0S1FK?=
 =?utf-8?B?aXliMG1aZVBzYWZ4NnZCWnFVVHpQUTF6aGJCa010d3YzdHVyV3Z3bTRzTVR3?=
 =?utf-8?B?aEtQZlphaDJNODhmOVVySlN1RU1sRi95YWNRUWRRNEVtWEw1cVAwOWN6Nnp2?=
 =?utf-8?B?K2kvWmc4SjUyLyt6bVk3d0duOUhUcVRsZTdlaStybWo2ajk5d2NFMU5DSWJw?=
 =?utf-8?B?ODhHamU4cTdRQW5KM1FFenR2c290TzdkS2EwN0VTUEErM1VnNVZsV2Z2b3J5?=
 =?utf-8?B?QThWaWFNWDJ2RWg2QjFvY0FIWGs5anZ2S28ybXBBVkdKekRGZHRBR3c0YmtS?=
 =?utf-8?B?RGxOT00vdlZKbjduQmxwVitsZWhPM3FDeklZWlJ5NE4zWWlRUEkwQ3RqSm5P?=
 =?utf-8?B?SWNVdEc5WE5ZN3lqL3JvaW5PeDQ1blN4NGc1cmJaamhVNGFEOGFXelV2V0Fn?=
 =?utf-8?B?ZGV3L0xuNzlqeGpobm55MngzRzE1emNaMEEvTys0elFMR0E4VXVtQUV2NG1t?=
 =?utf-8?B?dSt4UkI3Mk42eWZ6UUMvRi9Pa0IxY09aUXF0bWN2K21oeWo5ZFJBNU1uYXdK?=
 =?utf-8?B?eEdkZ1R5UnRNSmhpeHRnUWVkOFlRU0d3dnAwTXNTWWJYMTY0cXBSRTlaWFZr?=
 =?utf-8?B?bG5jRm9oQlpsOGQyTmZ5UjFJQWZiMTFMeDlzSjlSZDZYZDBJOXIvTlZySmk1?=
 =?utf-8?B?SDBwYjViT0NHOHRDKzI0RE9pRFRySGNsRUFHTHluRDVqTTF5TXN3MHVmczha?=
 =?utf-8?B?QmVqVGVRTlFrSzUrMWxibWxqbFoxU1ZNME9aUTdiSUhWTFE2OU1DT3FpUTFn?=
 =?utf-8?B?aWdVSnFYNUJ4RnNsaEdUQmora2FaQWFCOXZuRkJZZ3FyWWxVbldxd0J5MlpJ?=
 =?utf-8?B?aFFyL1Zpc2VOYXVHNXVjNmsrYlk5N0cyUnBxWnBqdGw3YzZuZ0VlelhRQjRD?=
 =?utf-8?B?SUFFRnpjeEJGN3FQOWIycTlsR2hQeFNQZituMmhuL3VRTEthM1NBM25ienIw?=
 =?utf-8?B?MlJNUWtObU5icFAxT1ZMUFFnazhKdENqV1R4enNkSHUwOGs0bGRDMHI3SnVQ?=
 =?utf-8?B?a2VxMkNKUnk2cjM0ZjdML3pmTXZvbGw2cjlTRWdFZkFhMjRjMU5DYnNJcXJn?=
 =?utf-8?B?MW1BOE1na3ZhNmI4TW8vVGNSS005djBqalM4MmtEbDlGNzN1NDU4V0NIcStT?=
 =?utf-8?B?RVdjSDZQdFZ2T1J6dUZ4RVZjNXpxYVZDR1dreGQ0MmpYTlhXRElCNm9TY0JP?=
 =?utf-8?B?YWZvRnFScnJtTzNVYlZNbEMrTEcvbXUvRGRyRTdPaWVOU2kxTTB5d1VVTXZV?=
 =?utf-8?B?ZkhCN2tFUm5Eb3NGNm5tTGcvYmxzYW9WcnlwMGpXVGc4SU1QcURBaGRCMCtG?=
 =?utf-8?B?WTArV3IzSW82bXd3Y0dXdi96blhRMUNOc2JIOWZzRlA0RUNmV0RvTXRFeklO?=
 =?utf-8?B?YVptVzR6YUFhRkt5ajJlOVdhRHI3dVc2eUpXcjd4Uk9PeFVENmVIQkxUUU9T?=
 =?utf-8?B?a2dxeXNjcHBEOW13ZG9SOVJITmRvdXE0Nkk2Zk0ra2huV1BTRG9yTjlkQjRO?=
 =?utf-8?Q?xXv/n1O5ZPYiU0FFn6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e84ca63-191e-4872-bed4-08df1dd078b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 02:22:13.0192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iuayGsUATFeapklwwDtw2/Vc8H5TLhO/uAkUT3kgGC7cc65nnggdY2FZKGJVOh2C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9488

Hi Daniel,

Thanks for reaching out and for the detailed investigation.

The current upstream AMD ISP4 support is specific to the HP ZBook Ultra
G1a 14-inch Mobile Workstation PC, and no other models are supported at
this time. Per the current management direction, we are not planning new
AMDISP4 platform enablement work.

We are working toward making the ISP4 driver sensor-agnostic. Until that
work is completed and upstreamed, we do not plan to add support for
another platform or sensor combination, including the GZ302EA with OV13B10.

Therefore, we are not able to provide a validated GZ302EA/OV13B10
platform configuration or GPIO table at this stage.

Thank you for your understanding and for offering to help with testing.

Regards,
Bin


On 9/24/2026 3:06 PM, Daniel Chadwick wrote:
> 
> Hi Pratap and Bin,
> 
> I'm working on enabling the rear camera on an ASUS ROG Flow Z13 GZ302EA (Ryzen AI Max+ 395 / Strix Halo) under Linux.
> 
> The rear sensor is exposed by ACPI as OMNI13B1 (\_SB_.CAMB / OV13B family). Fedora's current ov13b10 driver already recognises the OMNI13B1 ID, but the sensor remains unbound and no rear ISP4 capture/media graph is created.
> 
> I've compared the current AMD ISP4 platform configuration with this machine and also analysed ASUS's official GZ302EA Windows camera packages (V11.04.02.1159 and V11.04.02.950). Those packages confirm ACPI\OMNI13B1 -> sensorOV13B.sys and include an OV13B_3001_ROG_SRX.atb board profile, but the profile's electrical fields are opaque and don't provide enough validated information to reproduce the board configuration safely in Linux.
> 
> The remaining information I haven't been able to establish reliably is:
> - ISP4 CSI port / lane mapping
> - I2C adapter mapping (the sensor address appears to be 0x10, but I have not treated that as verified)
> - sensor/ISP GPIOs and polarity
> - clock source
> - power rails and sequencing
> - any OV13B10-specific ISP firmware/profile requirements
> 
> The existing OV05C10 platform configuration appears to supply this kind of information in software because it isn't present in ACPI, and the earlier ISP4 review discussion also mentioned the GZ302EA/OV13B10 case.
> 
> Would you be able to share the correct GZ302EA/OV13B10 platform configuration, GPIO table, or point me to where these values should come from? I'm happy to implement and test the Linux support and can provide ACPI dumps, the ASUS INF/profile metadata, logs, and test results if useful.
> 
> I have the physical GZ302EA available for testing, so I can validate patches directly and capture frames once the pipeline is safely instantiated.
> 
> Thanks,
> Daniel Chadwick

