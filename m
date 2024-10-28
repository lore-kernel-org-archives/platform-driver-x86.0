Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABD91DED4F
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2024 16:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730134249; cv=fail; b=jryQKEEVl+1IyWtKUmw1zKXWoJDQbrrTmJgZiCoyt/r9IUJjA1wiHdqpefwTpjTiawLDK/KCZT/LirY7qZxVBzY0JehFQAm2z8cjCWlcAU6prdLG2jxIQziBp2w/yAQ4LJ1NSl5sCkHw64xz9h98LZRyRCS1EFV6kTKbMTyzVfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730134249; c=relaxed/simple;
	bh=cl6IiC77Wh2O/LZCNC90Ce/8kDy5y9Y1AWbSgl9/kro=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PrHApu+/peY+Td+VuvnZiJE3giSE3O/mk/+rTNGYD718fCHuD7/h6+GHNeahob/XbP05WXazOJP13QvjuzCr1P+c6UJqYPhJODb+FSe8osHBGsGSj34ZrIJDx5NEmU/JwzQcINZWXBxBaAjFx/ojh7MWigD9J/cd28VDfa6uHYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=on0C1zif; arc=fail smtp.client-ip=40.107.220.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="on0C1zif"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8ERBGpUxzE2lbYKeNobCINfime/jd9njjD136Nld+LselH1N10RO4Rd3I1q0gVSAq3THnnLNB/xDO5LcEs3ZGQxzQlwJ+uMk8FIsr+CVmvEc1ehrOHE637asnEJcMxB5c5vFw9rOp8RHQTO5dbneInA8JhewSL3hkzia/aMGtRT8Tzf7UE94P6Kmt3CPcFzyQwm0XgQO4iV+vMa96d33rVVO26Dmg3UDJN8cP0zEXJl7MJIF1RULun+zqxIBNzOx6uImVdrmqNFHkpf+k5EEp12cYTTYyiBrm+obcyK/j94jbkNjLwef3BY07hoBL8AIKCtNvutjbm4ZtX3H2vPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVcqISL3QsXqsB9w7XuRtZz4m8YDXmFWpe3wWJDJ7jw=;
 b=WFo01/c/lPQrXRFY+2v1GRp8L+nmQa9Vufla+ve0g+32Vu6HkwgRZVhjVhhUj1RXZMqPRncvYDXwGZ7O4B4JhQwYGnXcbHifqWb5/fkuFQiGftUDDa/w6Aiqvm0TfA7nrvK7yLQYD7iUgTUhk90Fi+7zPYlpC0FzcWoqURTdrklBtcr29kQJO7B4u0IHMQVbW7QpGukaLFZ2KprfzrxDl3jDi0TDYUHWIqhvM5fpZW3Po6SjVuapRH1F6g+ZfPJC7KDa1Yx8DghStjQUc1tfd+qn4Qjlswj4PS/Uq1+sYP8s4zMRAZG10C55Tr3Jp73yhQWbEAZ3PYhRP8oFiSh+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVcqISL3QsXqsB9w7XuRtZz4m8YDXmFWpe3wWJDJ7jw=;
 b=on0C1zifVhXXUjdizqmym1dC/8HN5czXHxeGwHzqH3BW6x1vQONjbhTZlWJ+WCnfYdh3l8fbvNtN4y9XdyvBrjsIXRHeubyFHeQRmqfhlAOd6TleAcJcbSu3M8rx1s2+VXaz5u8M3nBBtjalJJJNZWje8UiKRVvtQCngzXiNM6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4103.namprd12.prod.outlook.com (2603:10b6:610:7e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 16:50:42 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 16:50:42 +0000
Message-ID: <5709bca7-b39b-4e81-b61b-f8fae5402cdd@amd.com>
Date: Mon, 28 Oct 2024 11:50:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] platform/x86/amd/pmc: Move STB functionality to a new
 file for better code organization
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241028070438.1548737-1-Shyam-sundar.S-k@amd.com>
 <20241028070438.1548737-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241028070438.1548737-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH2PR12MB4103:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e416d63-fcb2-4c88-aa3a-08dcf770a8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VkExYkpGSmtVK2hNYVAybFZUTFVpeGRSNWtzbVQzVno2OHZVNFNJa0VDZUJJ?=
 =?utf-8?B?bHN6WmRvNElua09ZbG5NMlM4TkdkSG4vNm9DdlV5TGthSXE0OTlLY1hvR0hU?=
 =?utf-8?B?Umc1YnZiMzVpeXVYVFl6a0FvTDlGSDZSN2MxY2dmb0VoTDZtWXd3d0lwaHYz?=
 =?utf-8?B?cXBheFNqcGJja3d6WlZBSkFoTEFkWFk3SzBvc3pBd2lLYld5UktwZjM2R3BV?=
 =?utf-8?B?U29UM2NNdGx6ZVNKVk9ZcnRXTElWeTdNMTd5TFZjMFdhTDVYVFlOQ1Uvb3JU?=
 =?utf-8?B?cTUyV2NRdytMRER4OVY4R1JXc0RnSmlXNE9RNjAvaUUxWklucVEvQld5R3N1?=
 =?utf-8?B?UUswL0FNNDllSEdtRWVHRFNubmUxdFZ6OGgxeGk0dERRQjBhdHg2UkJyNktZ?=
 =?utf-8?B?aW1Da2h1YlpUMXBtU3V6Ui9PQUV2ejJVeUNYQ1NQbWp6cExtSUFXdVdwYVpB?=
 =?utf-8?B?MTZaczY0TEpIOHU1aGdsdjY0SkRFbVA3NFd0aXgrTjZsd3dnWWtVcUxteFBt?=
 =?utf-8?B?VU5sYWQ2SXlXcitmK3JGMEh6RmdrQkQrUW9uQklzNkZTZEd6M3hsT0Z6Sjdp?=
 =?utf-8?B?cThPcWV2WXhyTkdKaXN2aVZFMjR4ZW0zdzNnd1l6cytleWdyOXNUZEUvSXhT?=
 =?utf-8?B?bGxvRVlJWG01WlU1aWtSclNGUEtra0ZkS3gwdHhySFFsUE03cHBxeEhzcDY0?=
 =?utf-8?B?bzJhZHlVWE5FRXpiOWcxYmNvRmFUOEZGelNHMDV2d3R0NlVqSlBMSzlhVndn?=
 =?utf-8?B?S0ExdkZDVGJTNkEvWlF3eFg0TjhicTBSZENuWFZFNitESUZOaHNaSW1BeUF5?=
 =?utf-8?B?dFNlOWZwbUtBVDhYaXRsSGtLaWU5bjJYRFBIMXl4bi9iSWk5N2NFcWhibDBv?=
 =?utf-8?B?d25CUEljOHhiSHpvNTZZQ2sxb0t6VWNzbFd5ZGRzQ2JZM1RmT2RqZHQ3dnZS?=
 =?utf-8?B?K3FIbVEyaGcrVFl4S3FvNkNBUTFvUnNRRFNaeVRweXJFM2Y0cXVKNGFYTmVD?=
 =?utf-8?B?RmgzRVVXdVZoNitJckExb054QXpoN3pVWUJjVFh5S01oNi9kZUN0U1ViMVBp?=
 =?utf-8?B?NEVOSi9JNHVnVXBOSXJBdWNZRmMxSklkSW9OTit5ZjhMbm1JVXBnZXRWNUxS?=
 =?utf-8?B?VEM1MEo1UTFybkhKeTlNZTlTSFNtZXpDWlUzSmpKb3V0ZjZDQVQ2VHRsejUx?=
 =?utf-8?B?VDlIVlNoaW9FSjJ1b1d2U1QwYmlLUGhlSDhzNTZOMEh2Y2c1ZXU5QWYxSmNj?=
 =?utf-8?B?c2RVRU1rbXFoQ2M4QVlKREplZVhWUEJ4UDE0cWxPUkdyNTJsQkNMK1BmRWFv?=
 =?utf-8?B?bDc4Zml5MUZzbjhQRXZ4MXR1M05NaDRNMnV6eTA0U1lzekRKbHg4bnJwOXJG?=
 =?utf-8?B?TWM2ODg0NTNKNDNTSGtxUE9FajM1TDZqdVArZS9yNlI3RGVGNm9VOVkxN1hP?=
 =?utf-8?B?dmtYUXl1Z2VaU1YvUUpEM2dGZUZiSWpsdnJoc0tyZUxEK1dBZlZpWnVmSm1B?=
 =?utf-8?B?anBJNDJwcW9NWWRGbGRNS2FhOTkvakhpa2ZrV3haTFpRSGNLOXFQL3QyMGd3?=
 =?utf-8?B?OExFT3lTUnJ5Z2FQQkRLRmROOUVSa0xxK3VtaTdpd3pDNllKRkt1eGtKazUw?=
 =?utf-8?B?TGVXeXpoY204NFUxNVBBNjFaQVVsYi8ydEdkOXM1YmUyNHhURU9ON1JOaGh1?=
 =?utf-8?B?R1BBMjRsYTVNSjdaSkkvWXBna1RFeVFnZWJYWHVTWGdrUURQNmNUYWQ1LzNF?=
 =?utf-8?Q?Ln4wE3jmaJl5Dd+Fro=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NjhRTmJobFN4RGNVaFBSZHBhS1RqWnR5NjArek85Z2FuMGVUWGtGRWxCd3A0?=
 =?utf-8?B?RURCQkh6ajUxeUhEZ3pSN2VwWU9aY051TFFUUXpzRkhQSVFQWk5yN3RSbzJs?=
 =?utf-8?B?Zlh1K1RGN0J1cFYvUUxYRzI0OW1zNzJnd0QxcHFjb1ZlUDRacUFQaCt6OUVH?=
 =?utf-8?B?cm40eWpNZmF1eWdiSDVqU3NRdGVvU1FiMGYzZlNuZHF4OHdPc3RFeCsrOWVD?=
 =?utf-8?B?d2xYSGNuNmtSc1dMUnJDTWcrSmlZUVdhQ1JGOW9WK0M1ZW96NCtUcmFsS2tO?=
 =?utf-8?B?Ylc1RDNzQ1JienVlcnZkdEd3OERRQktsMVl0R2x3ZE0zZVpXTGVGK0l6ZUZ6?=
 =?utf-8?B?TUs1R0JWYllrc05JaUQ1RHNnU09YWGpUUkpBNXQ5OEViTXlUbGY1elpqMytq?=
 =?utf-8?B?ME51ODYwYzJxb0Q3YzdvRkU3ZGFGN1JDNG51eUUrY1FndHRBZ3Y3bU5ISmlP?=
 =?utf-8?B?YUlWTUMwWms4dVpCbkpUdnF3M3hySW9YZDAxQ3B4ZFAzNHNxMXl5d1gzUVhy?=
 =?utf-8?B?alZFNUdUNXA4LzdqM3BDSkUvK2o1V2dqR3JJSVVsSTZiZC91U1ZsMFM0KzB0?=
 =?utf-8?B?T05uYlRkc3Qxck9FdFByNVdQU1MrT0pqcStjelQyaXRZS1FEN25TbjFFaDZQ?=
 =?utf-8?B?b0JuVTU2OW0yZGc4R1YzNnE2R1A0T0NRb1d4eGNGSE92Z0FaS05ud202UXNH?=
 =?utf-8?B?WjVjdFE5WGFZbitMUDFKaUU2WElheWU4YUdEQitBRWluV0VLRjdoWDMvU3Ey?=
 =?utf-8?B?NHU1UmpkbkxUdlNYazRuQ3lYcCtMc0NIZXdRbHBnYjV5dDJrV1RWQ0NieERL?=
 =?utf-8?B?WnRqd2I5QVJ2WlpzUmR5cXB6dmtZSTcwcHcwZkFCeW95VFdPL01EYTduR3Ix?=
 =?utf-8?B?S3B0azd0RzZzdTJlbzJ2ZjN4RWRHQTlkU1p0SGpKSmV1S2Y2bTVFekV1Zkx4?=
 =?utf-8?B?Q2J0cEE5SktBWjRIQzZmUUE2aVFUVllMeHBxQjB3R01QS1c1UmRLaE9WL1l0?=
 =?utf-8?B?cGlGZzZ6OGxzRmF0NTlIOGQySDFXSk9MekRBTk55L1oyeGExV0w4aFl2eE10?=
 =?utf-8?B?cUtGT1ZIOE83cVNwc1dlZFV0a3R5TEhucWVwYkFDMGxSeWJacTd0eHBVQjJ4?=
 =?utf-8?B?RXJERnNQWWo1cWw2RTVYSm8ybGVaS281Y2tEeHp6TVdSWjBLM25ua3Y3aFYy?=
 =?utf-8?B?bEE5Y0k5OUY4OC9yQSt2Z3ViUjhBamVFZHFVUDlWaU5YcnR3c3VXNUl0VFBk?=
 =?utf-8?B?UkNqTzMrZVYweEhuL25RTGFEVTRRbWFPTlVYMloxRkpaVU1QT25QM0RsN0dk?=
 =?utf-8?B?MlFEakROYnFJeTMxM1BKc2pFWG4yaHo5djJFa1A2WUhkc0pWc1dPMEdoQkJs?=
 =?utf-8?B?L244UXk5UTl5R2JZWWY5RXltbnlCZzk4QUdwR2FIK3l5OTNEdVF1K2hlNUZm?=
 =?utf-8?B?Z3hwK2dlVTB5L1l2YS9SMFBGZFp4Zyt1N1hKVUhsVVZ1TUJiN3VOU2hDUS9D?=
 =?utf-8?B?ZGF6NHhlcDhHSVloWThzTHBXNDNUeTdvUlU3Q3ZESzJvR3JHNVVTeEU5cC9D?=
 =?utf-8?B?dTNwRGl5NmhXSnNKWng3a25QUzFWM3hINUU0Rng3NFdLTW0xQ0hwWnlRVm9Q?=
 =?utf-8?B?V3p5ZjFvZkFGWnZvSGZTMHpVenV2WDBqK1kwSCsxVHoxa1ZtdlFydjUvTW9t?=
 =?utf-8?B?clZmdjBBRjVhbjFZVENrMlM2cGIvclFSaWFhamVndmhpR1Y0MW5PL1haL09M?=
 =?utf-8?B?L3BFYTY3b1IzRDl2amdqS2g3WTFzeFVXd0M2MVJ4VDdQVHdMTGdacjVRWjdk?=
 =?utf-8?B?VG1DL1JtcVB0SnZCVTJhUEN4K01xeFlROFhLQ0Q4V3A4U3RtZUgrNFhsMS9r?=
 =?utf-8?B?R2ZQNDFIaVh2U25MYUlJUXNCZjlIeEZZNHFrNWZGWDVLRkRscm5tNlpraFVM?=
 =?utf-8?B?OTQ1djMycXpwekNtTG9HTG9HNGJ3bnpSdlV6dS9RUzBxUjJ0NFU4MG01OU1r?=
 =?utf-8?B?UkFDSmhjSCtMWWhpbmNXS3lFTjFmSnpjL3M3czgzbEhSQlhjMXRPRnkxTFdD?=
 =?utf-8?B?VUJHSUV6ODBJeWtlcjFrZDB3QzFZbkl2QUtWSktZODVSYUdSSXAyNVh5ZEhi?=
 =?utf-8?Q?o+sne4YsvQPTtMROY+o+D9zMb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e416d63-fcb2-4c88-aa3a-08dcf770a8b3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:50:41.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0qT+OVD4fvj3ZyKESGq+ZYDgZZ1HyGzhOSLmszZDikW2iZPjg8PLMqa9nRjJClEhAsQ4HN7Cbqkyk5WB6VxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4103

On 10/28/2024 02:04, Shyam Sundar S K wrote:
> As the SoC evolves with each generation, the dynamics between the PMC and
> STB layers within the PMC driver are becoming increasingly complex, making
> it challenging to manage both in a single file and maintain code
> readability.
> 
> Additionally, during silicon bringup, the PMC functionality is often
> enabled first, with STB functionality added later. This can lead to missed
> updates in the driver, potentially causing issues.
> 
> To address these challenges, it's beneficial to move all STB-related
> changes to a separate file. This approach will better accommodate newer
> SoCs, provide improved flexibility for desktop variants, and facilitate
> the collection of additional debug information through STB mechanisms.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/platform/x86/amd/pmc/Makefile  |   2 +-
>   drivers/platform/x86/amd/pmc/mp1_stb.c | 295 +++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmc/pmc.c     | 289 +-----------------------
>   drivers/platform/x86/amd/pmc/pmc.h     |   9 +
>   4 files changed, 310 insertions(+), 285 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c
> 
> diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
> index f1d9ab19d24c..255d94ddf999 100644
> --- a/drivers/platform/x86/amd/pmc/Makefile
> +++ b/drivers/platform/x86/amd/pmc/Makefile
> @@ -4,6 +4,6 @@
>   # AMD Power Management Controller Driver
>   #
>   
> -amd-pmc-objs := pmc.o pmc-quirks.o
> +amd-pmc-objs := pmc.o pmc-quirks.o mp1_stb.o
>   obj-$(CONFIG_AMD_PMC) += amd-pmc.o
>   amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform/x86/amd/pmc/mp1_stb.c
> new file mode 100644
> index 000000000000..9a34dd94982c
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD MP1 Smart Trace Buffer (STB) Layer
> + *
> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *          Sanket Goswami <Sanket.Goswami@amd.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <asm/amd_nb.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
> +#include <linux/uaccess.h>
> +
> +#include "pmc.h"
> +
> +/* STB Spill to DRAM Parameters */
> +#define S2D_TELEMETRY_BYTES_MAX		0x100000U
> +#define S2D_RSVD_RAM_SPACE		0x100000
> +#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
> +
> +/* STB Registers */
> +#define AMD_PMC_STB_PMI_0	0x03E30600
> +#define AMD_PMC_STB_DUMMY_PC	0xC6000007
> +
> +/* STB Spill to DRAM Message Definition */
> +#define STB_FORCE_FLUSH_DATA	0xCF
> +#define FIFO_SIZE		4096
> +
> +static bool enable_stb;
> +module_param(enable_stb, bool, 0644);
> +MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> +
> +static bool dump_custom_stb;
> +module_param(dump_custom_stb, bool, 0644);
> +MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
> +
> +enum s2d_arg {
> +	S2D_TELEMETRY_SIZE = 0x01,
> +	S2D_PHYS_ADDR_LOW,
> +	S2D_PHYS_ADDR_HIGH,
> +	S2D_NUM_SAMPLES,
> +	S2D_DRAM_SIZE,
> +};
> +
> +struct amd_pmc_stb_v2_data {
> +	size_t size;
> +	u8 data[] __counted_by(size);
> +};
> +
> +int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> +{
> +	int err;
> +
> +	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
> +	if (err) {
> +		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
> +		return pcibios_err_to_errno(err);
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
> +{
> +	int i, err;
> +
> +	for (i = 0; i < FIFO_SIZE; i++) {
> +		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
> +		if (err) {
> +			dev_err(dev->dev, "error reading data from stb: 0x%X\n",
> +				AMD_PMC_STB_PMI_0);
> +			return pcibios_err_to_errno(err);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	u32 size = FIFO_SIZE * sizeof(u32);
> +	u32 *buf;
> +	int rc;
> +
> +	buf = kzalloc(size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	rc = amd_pmc_read_stb(dev, buf);
> +	if (rc) {
> +		kfree(buf);
> +		return rc;
> +	}
> +
> +	filp->private_data = buf;
> +	return rc;
> +}
> +
> +static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> +					loff_t *pos)
> +{
> +	if (!filp->private_data)
> +		return -EINVAL;
> +
> +	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> +				       FIFO_SIZE * sizeof(u32));
> +}
> +
> +static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
> +{
> +	kfree(filp->private_data);
> +	return 0;
> +}
> +
> +static const struct file_operations amd_pmc_stb_debugfs_fops = {
> +	.owner = THIS_MODULE,
> +	.open = amd_pmc_stb_debugfs_open,
> +	.read = amd_pmc_stb_debugfs_read,
> +	.release = amd_pmc_stb_debugfs_release,
> +};
> +
> +/* Enhanced STB Firmware Reporting Mechanism */
> +static int amd_pmc_stb_handle_efr(struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	struct amd_pmc_stb_v2_data *stb_data_arr;
> +	u32 fsize;
> +
> +	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
> +	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
> +	if (!stb_data_arr)
> +		return -ENOMEM;
> +
> +	stb_data_arr->size = fsize;
> +	memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
> +	filp->private_data = stb_data_arr;
> +
> +	return 0;
> +}
> +
> +static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> +{
> +	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> +	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
> +	struct amd_pmc_stb_v2_data *stb_data_arr;
> +	int ret;
> +
> +	/* Write dummy postcode while reading the STB buffer */
> +	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
> +	if (ret)
> +		dev_err(dev->dev, "error writing to STB: %d\n", ret);
> +
> +	/* Spill to DRAM num_samples uses separate SMU message port */
> +	dev->msg_port = 1;
> +
> +	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
> +	if (ret)
> +		dev_dbg_once(dev->dev, "S2D force flush not supported: %d\n", ret);
> +
> +	/*
> +	 * We have a custom stb size and the PMFW is supposed to give
> +	 * the enhanced dram size. Note that we land here only for the
> +	 * platforms that support enhanced dram size reporting.
> +	 */
> +	if (dump_custom_stb)
> +		return amd_pmc_stb_handle_efr(filp);
> +
> +	/* Get the num_samples to calculate the last push location */
> +	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
> +	/* Clear msg_port for other SMU operation */
> +	dev->msg_port = 0;
> +	if (ret) {
> +		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> +		return ret;
> +	}
> +
> +	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
> +	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
> +	if (!stb_data_arr)
> +		return -ENOMEM;
> +
> +	stb_data_arr->size = fsize;
> +
> +	/*
> +	 * Start capturing data from the last push location.
> +	 * This is for general cases, where the stb limits
> +	 * are meant for standard usage.
> +	 */
> +	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> +		/* First read oldest data starting 1 behind last write till end of ringbuffer */
> +		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> +		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
> +
> +		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> +		/* Second copy the newer samples from offset 0 - last write */
> +		memcpy_fromio(stb_data_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
> +	} else {
> +		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
> +	}
> +
> +	filp->private_data = stb_data_arr;
> +
> +	return 0;
> +}
> +
> +static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
> +					   loff_t *pos)
> +{
> +	struct amd_pmc_stb_v2_data *data = filp->private_data;
> +
> +	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
> +}
> +
> +static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> +{
> +	kfree(filp->private_data);
> +	return 0;
> +}
> +
> +static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
> +	.owner = THIS_MODULE,
> +	.open = amd_pmc_stb_debugfs_open_v2,
> +	.read = amd_pmc_stb_debugfs_read_v2,
> +	.release = amd_pmc_stb_debugfs_release_v2,
> +};
> +
> +static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
> +{
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_YC:
> +	case AMD_CPU_ID_CB:
> +		dev->s2d_msg_id = 0xBE;
> +		return true;
> +	case AMD_CPU_ID_PS:
> +		dev->s2d_msg_id = 0x85;
> +		return true;
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		dev->s2d_msg_id = 0xDE;
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
> +{
> +	u32 phys_addr_low, phys_addr_hi;
> +	u64 stb_phys_addr;
> +	u32 size = 0;
> +	int ret;
> +
> +	if (!enable_stb)
> +		return 0;
> +
> +	if (amd_pmc_is_stb_supported(dev))
> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +				    &amd_pmc_stb_debugfs_fops_v2);
> +	else
> +		debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> +				    &amd_pmc_stb_debugfs_fops);
> +
> +	/* Spill to DRAM feature uses separate SMU message port */
> +	dev->msg_port = 1;
> +
> +	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
> +	if (size != S2D_TELEMETRY_BYTES_MAX)
> +		return -EIO;
> +
> +	/* Get DRAM size */
> +	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
> +	if (ret || !dev->dram_size)
> +		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
> +
> +	/* Get STB DRAM address */
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
> +	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
> +
> +	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> +
> +	/* Clear msg_port for other SMU operation */
> +	dev->msg_port = 0;
> +
> +	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
> +	if (!dev->stb_virt_addr)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index bbb8edb62e00..a977ff1e52b5 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -44,20 +44,6 @@
>   #define AMD_PMC_STB_S2IDLE_PREPARE	0xC6000001
>   #define AMD_PMC_STB_S2IDLE_RESTORE	0xC6000002
>   #define AMD_PMC_STB_S2IDLE_CHECK	0xC6000003
> -#define AMD_PMC_STB_DUMMY_PC		0xC6000007
> -
> -/* STB S2D(Spill to DRAM) has different message port offset */
> -#define AMD_S2D_REGISTER_MESSAGE	0xA20
> -#define AMD_S2D_REGISTER_RESPONSE	0xA80
> -#define AMD_S2D_REGISTER_ARGUMENT	0xA88
> -
> -/* STB Spill to DRAM Parameters */
> -#define S2D_TELEMETRY_BYTES_MAX		0x100000U
> -#define S2D_RSVD_RAM_SPACE		0x100000
> -#define S2D_TELEMETRY_DRAMBYTES_MAX	0x1000000
> -
> -/* STB Spill to DRAM Message Definition */
> -#define STB_FORCE_FLUSH_DATA		0xCF
>   
>   /* Base address of SMU for mapping physical address to virtual address */
>   #define AMD_PMC_MAPPING_SIZE		0x01000
> @@ -97,7 +83,6 @@
>   
>   #define DELAY_MIN_US		2000
>   #define DELAY_MAX_US		3000
> -#define FIFO_SIZE		4096
>   
>   enum amd_pmc_def {
>   	MSG_TEST = 0x01,
> @@ -105,19 +90,6 @@ enum amd_pmc_def {
>   	MSG_OS_HINT_RN,
>   };
>   
> -enum s2d_arg {
> -	S2D_TELEMETRY_SIZE = 0x01,
> -	S2D_PHYS_ADDR_LOW,
> -	S2D_PHYS_ADDR_HIGH,
> -	S2D_NUM_SAMPLES,
> -	S2D_DRAM_SIZE,
> -};
> -
> -struct amd_pmc_stb_v2_data {
> -	size_t size;
> -	u8 data[] __counted_by(size);
> -};
> -
>   struct amd_pmc_bit_map {
>   	const char *name;
>   	u32 bit_mask;
> @@ -149,22 +121,11 @@ static const struct amd_pmc_bit_map soc15_ip_blk[] = {
>   	{}
>   };
>   
> -static bool enable_stb;
> -module_param(enable_stb, bool, 0644);
> -MODULE_PARM_DESC(enable_stb, "Enable the STB debug mechanism");
> -
>   static bool disable_workarounds;
>   module_param(disable_workarounds, bool, 0644);
>   MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>   
> -static bool dump_custom_stb;
> -module_param(dump_custom_stb, bool, 0644);
> -MODULE_PARM_DESC(dump_custom_stb, "Enable to dump full STB buffer");
> -
>   static struct amd_pmc_dev pmc;
> -static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
> -static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> -static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>   
>   static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>   {
> @@ -193,155 +154,6 @@ struct smu_metrics {
>   	u64 timecondition_notmet_totaltime[32];
>   } __packed;
>   
> -static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
> -{
> -	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 size = FIFO_SIZE * sizeof(u32);
> -	u32 *buf;
> -	int rc;
> -
> -	buf = kzalloc(size, GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	rc = amd_pmc_read_stb(dev, buf);
> -	if (rc) {
> -		kfree(buf);
> -		return rc;
> -	}
> -
> -	filp->private_data = buf;
> -	return rc;
> -}
> -
> -static ssize_t amd_pmc_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
> -					loff_t *pos)
> -{
> -	if (!filp->private_data)
> -		return -EINVAL;
> -
> -	return simple_read_from_buffer(buf, size, pos, filp->private_data,
> -				       FIFO_SIZE * sizeof(u32));
> -}
> -
> -static int amd_pmc_stb_debugfs_release(struct inode *inode, struct file *filp)
> -{
> -	kfree(filp->private_data);
> -	return 0;
> -}
> -
> -static const struct file_operations amd_pmc_stb_debugfs_fops = {
> -	.owner = THIS_MODULE,
> -	.open = amd_pmc_stb_debugfs_open,
> -	.read = amd_pmc_stb_debugfs_read,
> -	.release = amd_pmc_stb_debugfs_release,
> -};
> -
> -/* Enhanced STB Firmware Reporting Mechanism */
> -static int amd_pmc_stb_handle_efr(struct file *filp)
> -{
> -	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	struct amd_pmc_stb_v2_data *stb_data_arr;
> -	u32 fsize;
> -
> -	fsize = dev->dram_size - S2D_RSVD_RAM_SPACE;
> -	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
> -	if (!stb_data_arr)
> -		return -ENOMEM;
> -
> -	stb_data_arr->size = fsize;
> -	memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
> -	filp->private_data = stb_data_arr;
> -
> -	return 0;
> -}
> -
> -static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
> -{
> -	struct amd_pmc_dev *dev = filp->f_inode->i_private;
> -	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
> -	struct amd_pmc_stb_v2_data *stb_data_arr;
> -	int ret;
> -
> -	/* Write dummy postcode while reading the STB buffer */
> -	ret = amd_pmc_write_stb(dev, AMD_PMC_STB_DUMMY_PC);
> -	if (ret)
> -		dev_err(dev->dev, "error writing to STB: %d\n", ret);
> -
> -	/* Spill to DRAM num_samples uses separate SMU message port */
> -	dev->msg_port = 1;
> -
> -	ret = amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
> -	if (ret)
> -		dev_dbg_once(dev->dev, "S2D force flush not supported: %d\n", ret);
> -
> -	/*
> -	 * We have a custom stb size and the PMFW is supposed to give
> -	 * the enhanced dram size. Note that we land here only for the
> -	 * platforms that support enhanced dram size reporting.
> -	 */
> -	if (dump_custom_stb)
> -		return amd_pmc_stb_handle_efr(filp);
> -
> -	/* Get the num_samples to calculate the last push location */
> -	ret = amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->s2d_msg_id, true);
> -	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> -	if (ret) {
> -		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
> -		return ret;
> -	}
> -
> -	fsize = min(num_samples, S2D_TELEMETRY_BYTES_MAX);
> -	stb_data_arr = kmalloc(struct_size(stb_data_arr, data, fsize), GFP_KERNEL);
> -	if (!stb_data_arr)
> -		return -ENOMEM;
> -
> -	stb_data_arr->size = fsize;
> -
> -	/*
> -	 * Start capturing data from the last push location.
> -	 * This is for general cases, where the stb limits
> -	 * are meant for standard usage.
> -	 */
> -	if (num_samples > S2D_TELEMETRY_BYTES_MAX) {
> -		/* First read oldest data starting 1 behind last write till end of ringbuffer */
> -		stb_rdptr_offset = num_samples % S2D_TELEMETRY_BYTES_MAX;
> -		fsize = S2D_TELEMETRY_BYTES_MAX - stb_rdptr_offset;
> -
> -		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
> -		/* Second copy the newer samples from offset 0 - last write */
> -		memcpy_fromio(stb_data_arr->data + fsize, dev->stb_virt_addr, stb_rdptr_offset);
> -	} else {
> -		memcpy_fromio(stb_data_arr->data, dev->stb_virt_addr, fsize);
> -	}
> -
> -	filp->private_data = stb_data_arr;
> -
> -	return 0;
> -}
> -
> -static ssize_t amd_pmc_stb_debugfs_read_v2(struct file *filp, char __user *buf, size_t size,
> -					   loff_t *pos)
> -{
> -	struct amd_pmc_stb_v2_data *data = filp->private_data;
> -
> -	return simple_read_from_buffer(buf, size, pos, data->data, data->size);
> -}
> -
> -static int amd_pmc_stb_debugfs_release_v2(struct inode *inode, struct file *filp)
> -{
> -	kfree(filp->private_data);
> -	return 0;
> -}
> -
> -static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
> -	.owner = THIS_MODULE,
> -	.open = amd_pmc_stb_debugfs_open_v2,
> -	.read = amd_pmc_stb_debugfs_read_v2,
> -	.release = amd_pmc_stb_debugfs_release_v2,
> -};
> -
>   static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>   {
>   	switch (dev->cpu_id) {
> @@ -350,18 +162,15 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>   	case AMD_CPU_ID_YC:
>   	case AMD_CPU_ID_CB:
>   		dev->num_ips = 12;
> -		dev->s2d_msg_id = 0xBE;
>   		dev->smu_msg = 0x538;
>   		break;
>   	case AMD_CPU_ID_PS:
>   		dev->num_ips = 21;
> -		dev->s2d_msg_id = 0x85;
>   		dev->smu_msg = 0x538;
>   		break;
>   	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>   	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
>   		dev->num_ips = 22;
> -		dev->s2d_msg_id = 0xDE;
>   		dev->smu_msg = 0x938;
>   		break;
>   	}
> @@ -625,20 +434,6 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>   	debugfs_remove_recursive(dev->dbgfs_dir);
>   }
>   
> -static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
> -{
> -	switch (dev->cpu_id) {
> -	case AMD_CPU_ID_YC:
> -	case AMD_CPU_ID_CB:
> -	case AMD_CPU_ID_PS:
> -	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> -	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> -		return true;
> -	default:
> -		return false;
> -	}
> -}
> -
>   static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>   {
>   	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
> @@ -648,15 +443,6 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>   			    &s0ix_stats_fops);
>   	debugfs_create_file("amd_pmc_idlemask", 0644, dev->dbgfs_dir, dev,
>   			    &amd_pmc_idlemask_fops);
> -	/* Enable STB only when the module_param is set */
> -	if (enable_stb) {
> -		if (amd_pmc_is_stb_supported(dev))
> -			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -					    &amd_pmc_stb_debugfs_fops_v2);
> -		else
> -			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
> -					    &amd_pmc_stb_debugfs_fops);
> -	}
>   }
>   
>   static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
> @@ -683,7 +469,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>   	dev_dbg(dev->dev, "AMD_%s_REGISTER_MESSAGE:%x\n", dev->msg_port ? "S2D" : "PMC", value);
>   }
>   
> -static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
> +int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
>   {
>   	int rc;
>   	u32 val, message, argument, response;
> @@ -975,69 +761,6 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   	{ }
>   };
>   
> -static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
> -{
> -	u32 phys_addr_low, phys_addr_hi;
> -	u64 stb_phys_addr;
> -	u32 size = 0;
> -	int ret;
> -
> -	/* Spill to DRAM feature uses separate SMU message port */
> -	dev->msg_port = 1;
> -
> -	amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, true);
> -	if (size != S2D_TELEMETRY_BYTES_MAX)
> -		return -EIO;
> -
> -	/* Get DRAM size */
> -	ret = amd_pmc_send_cmd(dev, S2D_DRAM_SIZE, &dev->dram_size, dev->s2d_msg_id, true);
> -	if (ret || !dev->dram_size)
> -		dev->dram_size = S2D_TELEMETRY_DRAMBYTES_MAX;
> -
> -	/* Get STB DRAM address */
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
> -	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
> -
> -	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> -
> -	/* Clear msg_port for other SMU operation */
> -	dev->msg_port = 0;
> -
> -	dev->stb_virt_addr = devm_ioremap(dev->dev, stb_phys_addr, dev->dram_size);
> -	if (!dev->stb_virt_addr)
> -		return -ENOMEM;
> -
> -	return 0;
> -}
> -
> -static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data)
> -{
> -	int err;
> -
> -	err = amd_smn_write(0, AMD_PMC_STB_PMI_0, data);
> -	if (err) {
> -		dev_err(dev->dev, "failed to write data in stb: 0x%X\n", AMD_PMC_STB_PMI_0);
> -		return pcibios_err_to_errno(err);
> -	}
> -
> -	return 0;
> -}
> -
> -static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf)
> -{
> -	int i, err;
> -
> -	for (i = 0; i < FIFO_SIZE; i++) {
> -		err = amd_smn_read(0, AMD_PMC_STB_PMI_0, buf++);
> -		if (err) {
> -			dev_err(dev->dev, "error reading data from stb: 0x%X\n", AMD_PMC_STB_PMI_0);
> -			return pcibios_err_to_errno(err);
> -		}
> -	}
> -
> -	return 0;
> -}
> -
>   static int amd_pmc_probe(struct platform_device *pdev)
>   {
>   	struct amd_pmc_dev *dev = &pmc;
> @@ -1095,12 +818,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   	/* Get num of IP blocks within the SoC */
>   	amd_pmc_get_ip_info(dev);
>   
> -	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
> -		err = amd_pmc_s2d_init(dev);
> -		if (err)
> -			goto err_pci_dev_put;
> -	}
> -
>   	platform_set_drvdata(pdev, dev);
>   	if (IS_ENABLED(CONFIG_SUSPEND)) {
>   		err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
> @@ -1111,6 +828,10 @@ static int amd_pmc_probe(struct platform_device *pdev)
>   	}
>   
>   	amd_pmc_dbgfs_register(dev);
> +	err = amd_pmc_s2d_init(dev);
> +	if (err)
> +		goto err_pci_dev_put;
> +
>   	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>   		amd_mp2_stb_init(dev);
>   	pm_report_max_hw_sleep(U64_MAX);
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index f1166d15c856..07fcb13a4136 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -70,4 +70,13 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>   #define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT 0x1122
>   #define PCI_DEVICE_ID_AMD_MP2_STB	0x172c
>   
> +/* STB S2D(Spill to DRAM) has different message port offset */
> +#define AMD_S2D_REGISTER_MESSAGE	0xA20
> +#define AMD_S2D_REGISTER_RESPONSE	0xA80
> +#define AMD_S2D_REGISTER_ARGUMENT	0xA88
> +
> +int amd_pmc_s2d_init(struct amd_pmc_dev *dev);
> +int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> +int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
> +
>   #endif /* PMC_H */

