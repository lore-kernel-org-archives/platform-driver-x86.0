Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7C36607D
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 15:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551397; cv=fail; b=jnsktSuP7cVfr+HfwjWBJarJ4+oKnqe2PWjq90xNtC5eT9x6eOUbMMjMMnHyFrQacstp5ABbYOexII+ByfR36K53dUlB6IDBzvPuG0g/l4yhjcmgoSYatPwX1FFnKorpMCDdpaYFXekGi8XFFzqq4xVtpNLUKh/QQ2TB2i9dKHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551397; c=relaxed/simple;
	bh=ag/MgvzMK3fpkDYmzFs88EeVC1FQXUYEobDsyeQ0H7k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iCgRLhsY2or4r3IqjOv98puACw9NiLwmcaNN3bR48OAM/Z8+MWwPwx6bidntuvyipRWKwZJxSGfvzTo84Pess9gOx7vcF021fEV81cJXS3OnExAlnVw33WZ29GcFs+G0isa0Dqzsowp5tuTvIJrIo0ECc1QMHqj7uurGVukHFRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BjL3IjDJ; arc=fail smtp.client-ip=52.101.48.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BjL3IjDJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuaaYPJKi/TPl1oxbpB98DumnmGQfXk1Z73BfO86DdG/qGj0SZlJC6hZ6YOe2ONijTHUpsOcoGM1Mk4mStfukqS6HrVA0yhutyhMDiY+EDsH/nY/Bb2mREt+OT99xdjq8/czoBHeBmBnaz4cWoz+dEfgCMNd9SZQC8V/T1fdAitQ66f1kIPwIel2lKdEKoNu7insnAgEYOUJjJ8kQdTGn2B/JHcM0s8EuZS4SxSmSvczBOdybtz0uGE4QLIKXredtbXkwMOUervGaxMtZLKpk6Y74/T59UC5+HqLckvJgjZ6sRdU027iS1G8oJoCTPQJ5yfWIwGPQjdW+muCdqV7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHusQerMY3XeP0iExF9KSTDIAdCOpVAw/jJqsdn6+1o=;
 b=xKUq8X1Clc8KM30TiTXskvZx9Aujx2FPbT6idXcENTN0pggbyCV9X+qElJ/wbD904oJ9y00SxaMH41KCqCMD5UwHcch5WfNdAX66oRRWpx3Ys44VKg3Skm/NzFlWqEinqnQIlliL4JK5garTKgbewcERMVjaK4Om8QlJKbCwtHY+LRsvbWFbERz5xhPEGjGUkCSpMZTR/v+T/RLQ6uuM8dF1sGw9/RBRAvvovnHD9yyXZcfZT1qhOSl/xOi25ZIJyIhIMeHRIRw+C70xu+0M+YqVB4ZpogU2YhoH8EOguDgdiYAkPYI21w8zEGQyU9FOpamcT3xVTDY+gBXDD0/2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHusQerMY3XeP0iExF9KSTDIAdCOpVAw/jJqsdn6+1o=;
 b=BjL3IjDJx8NiONzgsM8kj7XbpLploliVVMD3PC7JlAPwuxs0DgfbhhyyAgpcdPEQJ6APuQg7p3XUYpR2Eody7vtbF3TzJR8w6IXuNqoIZtkAQoV+Rpt119v55mycMQLn/v93cSy3hudLFyfug0+6QHPizZhQKP8kkWvxjpRjlfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH1PR12MB9575.namprd12.prod.outlook.com (2603:10b6:610:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 15:23:13 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%3]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 15:23:12 +0000
Message-ID: <01b5eb02-7948-4609-bb5c-754953cbced1@amd.com>
Date: Tue, 3 Mar 2026 20:53:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] platform/x86/amd/pmf: Introduce PMF util layer
 with userspace interface
To: Mario Limonciello <superm1@kernel.org>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
 <ff438997-5d76-435e-a2e5-9ac6f8658eb1@kernel.org>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <ff438997-5d76-435e-a2e5-9ac6f8658eb1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0257.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::12) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH1PR12MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: b233ade8-286b-4b64-5bd4-08de7938c6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	iiMCSrSQXD13taZo6sWbgvqv+ZCYdOKy++2LX1mWs5fWUE9h3DTIKmT62locmIDOQYETiRRzSg9U+GNFhojBthF050SmpZEsli8+SJn4goxwMLFKtQpB+NqhgWXu/fhVtriVdSoTx0723Kx/O9iSyiD6Yk0HMiuyXkdwMc6BRL0b1KVw4+XDHbUILHTXBUF0lS6p/EKSJ3Lm7b9/5+nF8ezn2u+90il9Yf2WOMnrTPgVFCd6BnR3efrxbO4dpiZTCTzpp3GP/Rc9kGWz6UzbYnMqk6aaotIC/N2BdZgt9dGHMTFHoCikDTxh//azZmVDJm6uu0PznOPbpYMbTZT3LZTTVXOjW4xkZJRylx9gS7wOtiKCndMRuEATnKZg2ncquGJnVQnsidpXjn2Hi1YOTkY/Mfo5znGMeh+jUyYDaeJrvIFqvvsNBP5M1G8DK+Jv2IoCBpnbvrNYIaZ1AvK8wc6IQPnll6ozBj1kOZLDtHPGVUZBdWmOped4FyssK1G63i8mgMijoc2q85MDZFtjtXe1kfv1ucxtxHAcMwZoReLERK+FiQRQ6yDYI43IhyMk9jfKpXI9P9I2Ywf9A6vooxgwnaP4ss7zqt7CmPPmA6bE9TsmhLiNGAwJQQJavVnEqATARsAhCl23Eg9qdmZ9XGUyY65Qg8ZEhvyfHM+fLgf2nSMXf6y8o6nRx0pivxS/PlR4sKrMW07eXcpMj/gusQfpPFfcSJvaXAKZ4TmDhiA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGxROGZ3SFFwYThnVHU5RXI4RktiUmJqa2xwbUU2T3cyakVhdEZxT2NackVr?=
 =?utf-8?B?cThqTnVUZzBwUmMxcFRaR1IxZUFzbHViMEhYS056WE5ncWZmdUNkOTV6S2pU?=
 =?utf-8?B?M21aQnJpNHplUGNsQy93M3pRUDJWQkJTWjQyNndTUWJ0UklUUkNsejlWSC8r?=
 =?utf-8?B?MFQ0YzN5YVFuNmpBS3FnQUtXSEtpbCtibHR2THhsMjNpbTBVa2t5Z21JVXNj?=
 =?utf-8?B?S0pYV1YrWmw0eGJTL2JIOENNV2lhWFZPTkprR1E2dHExQ0ZuR1hHa01NZU5a?=
 =?utf-8?B?VVgvS2J0Q1NCcW1hSC9QNi9tR3dzMUJkNkJyWXE3eUdTVUl6YTdlYTlvSGlr?=
 =?utf-8?B?dU9JeXVRU3pPR3pkVXhVOVZEdTNVUlZKZjFhUk16clRGWjBBendaWm5YektU?=
 =?utf-8?B?bm13Ym1qblQ0cXdLenBDNGVBQU0rd1cyVTRKUWREamRHK1lIeGZ5NkhHTXM1?=
 =?utf-8?B?TFJTRC80WkljQWhIWSt1NE9xK2hHNHZWcXZTNlA3WjZkZUdSYnMreHNzQ0dt?=
 =?utf-8?B?ckhZa0N6UFFyUlc3aUkzd0F4UFlWVTk3R3lINFdlVjlsVzd6M3NCSUVXZWwy?=
 =?utf-8?B?SmNMek54UTE3c0l4c09nV3E5a0RCdFNKdkF5TllXUU1UQ0xybGFQRGpIR0Iz?=
 =?utf-8?B?VEd1M1dad2tyOXpVWjFWUmhmSnhGbXdZUHlUN2pSdEhLSDBHTWl5VXQ5QklW?=
 =?utf-8?B?dlJncmFEc3BSVGVtenVxQVdyb3BxRGZhVjY2dUs3ckk5RmloQmJIaVhrd2tn?=
 =?utf-8?B?bFdJNXZwTFZ5b21jY0dHYjFiUHRsMDgzOG91d2pqWnoxS2grZEVPK1RjWFAv?=
 =?utf-8?B?YXFZSkNlVWM0Z0pHa295NGQrNmpJNlBDVmlGSXFUalFVYlpINkdSNnliamxU?=
 =?utf-8?B?U1NKUXE2WFBFREtpOCt3dit2RmhmaWxjZ2Z6RklMWUFxeDNmV2JVYzY2NkMr?=
 =?utf-8?B?VFFQTkdMN21jWmNOV1p4L050akVrR2lleVRHeWN2WWl4dmkzSWJLdXMxdGIw?=
 =?utf-8?B?VENaMkN1Q3dFVExEaTJXU3RlaDZJNG5CZU9EOHpNWisvVUtKZUllYzcrYzd1?=
 =?utf-8?B?TFlyMXhxY2orUUZFU3BBZ2sxKzFhUW5NZ0p4dnE4aFFheW4reWdyVldUOGQ5?=
 =?utf-8?B?ZnY2bGMwbjFkdVpvNHJ5L2llb1lYRElCeDlGTHNSckl6UkVVZitKendGbXVx?=
 =?utf-8?B?eXRkUDNDcWJuNG1oMGgyV1dQWGEyaC9DcjgzYmxHajhWRWVLM3RzV0dkL2pu?=
 =?utf-8?B?MTdBcXlweTBVYUpOQS92YXd6QTl0eEFtVldDSThUaFBiUzlSWlVqeEQ5cklL?=
 =?utf-8?B?TGtFbmQxV0l2ZHZROHkwU1BLelh0ZTdCUjZNbFJpdk9tNUI2MHQ5YmRvWmxo?=
 =?utf-8?B?V3NWeUk3YWtFYjcvY3B3c1UzcFVKYlJVcmFINzRMeTlkTCs5d0hWSE8rYlkr?=
 =?utf-8?B?bVVoY0RNUUh0bGJNSThMMWRGNDZFa3Y4Szg1MTZTQmR1MXhMUlJRWFY5Ny9j?=
 =?utf-8?B?Ujg2ZXhNekpRWEJVSW9BcGFoTGlQSlNIZEROSkJDSGhjK2N1Ty9UR2JVMk1Y?=
 =?utf-8?B?M0VKbHZONE5RYkF4VXE0TXlLVGZ4enFHNG85RktNQUNiMnpWQ0dkb0xyazFj?=
 =?utf-8?B?UjRheWlMQWJzL1JvOXNzcVR6NFc5R252V1luemFYWVYzVW54b3ZHZzFsQmNi?=
 =?utf-8?B?MjZ0TU5vSmRNK0JOdFlhWW0xOHdCTVFOdDlUTGwrUHBiMjZRL2lwWG44TDM2?=
 =?utf-8?B?a3ZYOW9WNXVQTXNPWm82OGdpTVlwQ2J1cENKRE94ZEx0bmptbWZ6VVR5K29T?=
 =?utf-8?B?Rm9MV1V6M2pQOWpvQ253b1pjN1p0VXEyOHZmRFlCaXM5alZ3REVrYnhOa0k5?=
 =?utf-8?B?Q1VtZkFoNkl2bHhxNy9aMFBmZnpxb2t5YlVoNXRrOWVzWTFFNW9UTzNjaU5s?=
 =?utf-8?B?OXl4azJWWTA5UzViVHExS0pXZ1hncmpGejhoZGxDcFJxS1Y4akRiM2hYN3lu?=
 =?utf-8?B?dkZFKytCMVY3WWNNVHM4emJ1WFlkdXVIZUMwSFo3c3pNeU4zOWhzeU1hT09K?=
 =?utf-8?B?NDd4amlTTTFmdHpjT05Yd3EvK0RzM2V1NHl1TEF0cXhPN3dId3JVWWhPRWpZ?=
 =?utf-8?B?dGUxVEJ2Y2E2Sm9BZjU4dy9QSGlNdGNrSzRBT1RYOGxnVTZzbGRvNFM2QlA4?=
 =?utf-8?B?QTFTaVBFUVVCZHpiWWU2MC9vWkgvN3pLNzZmelpialBhb29kMFJYM1lCbDlT?=
 =?utf-8?B?NDlIdFo1S2hJdkE5Z1pyTUdrdnZ1ZUFXdWdXdVZtYTNkZXZaQVVvY1lvb25p?=
 =?utf-8?B?K2U5a01mMklqZTVjeU91QXpLbVlTSWVZd1BhNWpxamdCSWFLNGJTQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b233ade8-286b-4b64-5bd4-08de7938c6af
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:23:12.1950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnAjYMfn4Mo9Dbymi/zDMk5G0Tr7bKqkB3X6+Jz1CZI7BRyTvjhuTJRGlHksVn7J3Li2TUTJGLQgLlitEBm9bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9575



On 3/3/2026 01:06, Mario Limonciello wrote:
> On 3/1/26 7:11 AM, Shyam Sundar S K wrote:
>> This patch series introduces a new util layer for the AMD Platform
>> Management Framework (PMF) driver that exposes a minimal userspace
>> interface for metrics monitoring and feature discovery.
>>
>> AMD PMF currently manages power and thermal policies internally through
>> Smart PC features, Auto Mode, Policy Builder, Static/Dynamic Power
>> Sliders. However, system designers and OEMs need visibility into PMF
>> metrics and feature status for validation, debugging, and integration
>> with monitoring tools.
>>
>> This series addresses that need by adding a character device interface
>> that allows controlled access to PMF metrics data while maintaining
>> the driver's existing automated policy management.
>>
>> The primary use case is integration with userspace tools like AMD
>> SystemDeck, which are widely used by system designers to:
>> - Monitor real-time power and thermal behavior
>> - Validate PMF feature operation during platform bring-up
>> - Debug thermal issues by tracking skin temperature, C-state residency,
>>    and socket power metrics
>> - Verify BIOS input/output policy values during Smart PC operation
>>
>> The util layer reads from the existing Trusted Application (TA) shared
>> memory buffer and cached BIOS output values, adding no new
>> communication
>> overhead with the TA.
>>
>> v3:
>>   - Stop exporting battery information via util layer.
>>   - Optimize the core logic for fetching BIOS outputs.
>>   - Update the documentation patch to reflect the current util layer
>> design.
>>   - Consolidate amd-pmf-io.h changes into common UAPI header.
>>   - Define a single unified uAPI structure and IOCTL.
>>   - Address other v2 review remarks [1]
>>
>> v2:
>>   - address remarks from v1
>>   - add a new tool that exercises the IOCTLs from PMF interface
>>
>> [1] https://lore.kernel.org/platform-driver-
>> x86/20251111071010.4179492-1-Shyam-sundar.S-k@amd.com/
>>
>> Shyam Sundar S K (7):
>>    platform/x86/amd/pmf: Add util layer and userspace misc device
>>      interface
>>    platform/x86/amd/pmf: cache BIOS output values for user-space
>> metrics
>>      via util IOCTL
>>    platform/x86/amd/pmf: Add feature discovery support to util
>> interface
>>    platform/x86/amd/pmf: Store commonly used enums in the header file
>>    platform/x86/amd/pmf: Move debug helper functions to UAPI header
>>    platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
>>      metrics and features
>>    Documentation/ABI: add testing entry for AMD PMF misc device
>> interface
>>
>>   .../ABI/testing/misc-amdpmf_interface         |  70 ++++
>>   MAINTAINERS                                   |   1 +
>>   .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |   1 +
>>   drivers/platform/x86/amd/pmf/Kconfig          |  10 +
>>   drivers/platform/x86/amd/pmf/Makefile         |   2 +
>>   drivers/platform/x86/amd/pmf/core.c           |   8 +
>>   drivers/platform/x86/amd/pmf/pmf.h            |  32 +-
>>   drivers/platform/x86/amd/pmf/spc.c            |  55 +--
>>   drivers/platform/x86/amd/pmf/tee-if.c         |   9 +-
>>   drivers/platform/x86/amd/pmf/util.c           | 210 ++++++++++++
>>   include/linux/amd-pmf-io.h                    |   9 -
>>   include/uapi/linux/amd-pmf.h                  | 324 ++++++++++++++
>> ++++
>>   tools/testing/selftests/Makefile              |   1 +
>>   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>>   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 243 +++++++++++++
>>   15 files changed, 897 insertions(+), 86 deletions(-)
>>   create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
>>   create mode 100644 drivers/platform/x86/amd/pmf/util.c
>>   create mode 100644 include/uapi/linux/amd-pmf.h
>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/
>> amd/pmf/Makefile
>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/
>> amd/pmf/test_pmf.c
>>
> 
> Thanks, looks good to me.  You can add this to the next version (which
> incorporates Randy's feedback).
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 

Sure. Thanks! I will wait for other feedback to come in before
re-spinning.

Thanks,
Shyam
