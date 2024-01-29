Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC70155A5B
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706545367; cv=fail; b=ip9aRAyXj78KKRIi61nZ0iQFl0NKlJv9KPjgIsYx8hWwuPA4g8gKfPFB8lIrdYctqvSnfiyo9VIU8HMnmK0dSsozM9WtXeHvdPdAtAw28Uu0PtFlvdy/OWZJeSN3CFHvKqZ88uS8UIe/QURjCzXV3wIGo2ggNe3fBqJcFE42uBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706545367; c=relaxed/simple;
	bh=yU9SVgjxoU2VWkOzd8SnxAcKx4r8T3i2uufgMwI3OT0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Y23CA6cmj9m4K5K/SY3Ib4R2Bts8BAXbuO7JsaX8Yl8dFExhccYgKg1N1BwVAYI8OLJ+BeBIzg+8L1+sTEGbxIqibdGp7xzSG5FZypmdovtIgk6NNFjiMTNAdUgprHVfWELzlK/x9+M9gdMnW55K17vJhhhyrGn+OPWCIFYxJSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fxaIE9FO; arc=fail smtp.client-ip=40.107.237.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fxaIE9FO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEwDnpRTh41EqHdXgIu2Ilj7nK+n4jR6bmR2Uv3HRTfXo8b5TlX4V74wHVKL1I3PbDD8X5Wip3bsx9brDpBw/oJUMTeQl0C/Mdy2AmJpIH7rmjUIVBAN0PiGTJEXIHu9N30toCtrcmpGB/mXfds4uO1u+4kHx3c/oieLpUbMOQ7Bnk37O/PzSeEghIDspf9MgDHtHmwvwp3rueAbKqqY/+d3oZRxoyCLkJ70jYU/6Wfe19YTlTamw82Mg4kxmBs4vEHdcrbNlDldo8f/Hetl48FLFA7ddMvpuem5be3/szXB5YW66ypO1PONwv+IafKbJDkuYDJoMXiTysYExBkxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8b7s5k8Bzfk2E3hHlr8OL/0GBmxGnD+BpB0iO2u13M=;
 b=TX1V9C+OeaWqIU5GlJBBB4JURpweAsBoHiuT5wJI0mSzmW+fGxc/3sQfggF621uRuZ2dFmoSA2XOunWlCcoV/ceLxP/4Ux4syeBTbD7XgmNHkH/hUQWLe0dejdQ0aQIRoFjQnCCqCUOAFgu2gZ1pZVAemHJvnSI5o4JV2fbkAE6nqfSW1gVs1vaW7qnrkWimfbrsAOCcoj1tDnyD4hE4IUe3g1sPcbXR3/t1L4ROkmz8mKPwnP8bwprK18GynKp2v/etjDmeKGUtxA0GXWgkK0CIcf1IRML7p8CVsptIwYyaBI36YnAfEKe/qSNxdFYvjDMm2vmYeGlNfyQFoxCKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8b7s5k8Bzfk2E3hHlr8OL/0GBmxGnD+BpB0iO2u13M=;
 b=fxaIE9FOu3rXDgsjiGLfF9xqn46d/5FSaBzMcSXj52DXQa5UPBscHEpVU328VMh1miZKKyDDdazuzgcs3cal4iobdorb3heaMYNKDCOxb1J0bi/80lBFhqfR+TDEc8vz4+WXkowgFvf9S7GA/Wh9FQ36KyJqkiyxKMjoD/04v3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB6678.namprd12.prod.outlook.com (2603:10b6:806:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 16:22:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 16:22:40 +0000
Message-ID: <fc61aacf-d93c-4f74-a48a-c4c75794e3d8@amd.com>
Date: Mon, 29 Jan 2024 10:22:38 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: add CONFIG_ACPI dependency
Content-Language: en-US
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 kernel test robot <lkp@intel.com>,
 Naveen Krishna Chatradhi <naveen.krishna@amd.com>
References: <20240129132433.2087490-1-suma.hegde@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240129132433.2087490-1-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0004.namprd08.prod.outlook.com
 (2603:10b6:805:66::17) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 21122564-06b9-418b-f884-08dc20e68388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6veZ3tIIz8z+z8D1YIDySqPQA5HPzXkWzUFJzNi6awGIOmKUGCvJoBLAecS/yAefEleVVG1AiWll7Vv/Tf4Y5UXIL8o1lAzXyQYrJ656JOMDswuEpg4le/0le3gMy6lA3NeASAMvvJbKpDVU4t+ClPZKTA0icNWw8oHkgtu8SOowwelsHqC5q7NQn1yKTDq9TSQxTS+tUkGl20qeZVHxpUK62tzCyanvodzkzLhHjtFhSBsCddCo/Wcwtzb15OChyjU0rSzyN4NM1/T6ktXcCv3JW+bIUYb1JRMfRsgn4p1zLznO+2rbeEFhQ/nRqGl4IYY9XoTAaS0tlohu/5Tx2AmwZYvCjmmxJFL3AUOGbrVNZE0Cc9asmIq/6+obKiDk9jcb1KCbHO8/OMqOAZsVZPiqFNsYgjQlkU9OPYSbD8kWJy1jn/UGtgu3O+yMsQk2FfPaEMvLmH6/L+yxvvYghGYBXayEDS1o/h0rEeCpGJr80dN3uGpgoawPDKrasHz3E1Swy6Is8YOG0sUiRBRv2TApE8RSMRufE11fYA7lEcJN6DE0VhZtQn6AcUNbfOn6m5O01P7Wqf2d6TM46aHEbwV1b9Qj5ahzr2LEsjD/NOERuSePG9B9W5fAgHgcWUbZy/00zWe8Phy+rt6G9o1CGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(2906002)(5660300002)(36756003)(41300700001)(2616005)(6512007)(53546011)(6506007)(83380400001)(26005)(86362001)(31696002)(66946007)(66556008)(316002)(66476007)(54906003)(478600001)(6486002)(966005)(31686004)(38100700002)(8936002)(4326008)(8676002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHc5Y3FXWFBnT0Zxdk5heTU2cHkxMmg0RlY2WXVuWC9nZGY0Nk05Y2M0WWdI?=
 =?utf-8?B?WDI1VFZlQWJaRDdXYUY2VmRjTUdZeFBMWGYwbHJ0YmtrVmNDTTZUYU1JV2RY?=
 =?utf-8?B?VjMvUWpPa3J5TEdnWS9yMjdjcXRCY1JjN2JsTkFBakFzYVdycFhDWkMwaU5n?=
 =?utf-8?B?SnpPVTNPczhocEd4bW1CNWVJYmsvS0szaEtMNU9Yd3h2czZBVENIaysycTJu?=
 =?utf-8?B?MjQ0UVR5bURrSitwai9LSytyeTJ3TlgraGhzU0hjTUR0c1NwbGVUL2RKdCtj?=
 =?utf-8?B?eEd1cW9SQ2MzTCtpeVh5SWM0c0RBSGVESHJVanlTVTBqUE8zZUp6QmhQUlZM?=
 =?utf-8?B?ZFZQMWRQUnFRQzFEdHdEL0JhTnV2ZDE1SjFKb1gwbmd4VXZyeUFpV2NvaUFm?=
 =?utf-8?B?cDNiSzNuaTlEcjdHRnZuZlEwaWtqL05raU5KU1V5RGxVSkNyUk5qcUs2NEZh?=
 =?utf-8?B?bmdHOFY1QWhiKzA3Mm0zaVdDcmtOaDVCbUlNUlF2TjNsOWtCN2ZvYzhWd1Z3?=
 =?utf-8?B?NTU5U1Y2R2xxVlVtNVpiTXdSU1NNZ0hDekRjK2VDUFNaZ1NlZlBoMXdoVWR6?=
 =?utf-8?B?ZityLzVpTTRJV08rWXdPcmtzY2Q3cE9zdWc0KzdSY29qWE5ia2x4d2o2Z3I5?=
 =?utf-8?B?K0xvRnloeWpJNGVGa2J4YWcrK3dpcmNWQXU4RlhTWlBSWEtRSXY1WnBKTHJ5?=
 =?utf-8?B?VXJuc3Nka04rTGh5eHlLWWczYk1STTF4YXE4NjJkaXFLYlkvZ0krWVRPMURE?=
 =?utf-8?B?YWxJaEJRWWxoWGpRM0g5Q3RvRlU4Q0plaEpJR3Nwd29EaG92L0xUL3p5cEJC?=
 =?utf-8?B?M1hkd0JJTDBhcys2WGlGeHhPV096K2IzRHliWVlHcEZ4S1hZWDZEREJWMDl2?=
 =?utf-8?B?ZDd5SU1uM0RXODRhV0ZYcWRWNVFjb0pqQVZhbnpnNHViZmpRcFJhU05vVnlV?=
 =?utf-8?B?Z3BYOXMrZ2NoUEI3SWRZY20rTThzM1VSLzA4QVZhVGEyWExDQ1ZSYlRSTURq?=
 =?utf-8?B?bTVRQVpZbDZxTE5JN3AybjlmVEFYZEsvYWVaRXI0S0xnVllhNm5CSUM2aWJu?=
 =?utf-8?B?bVFFaWwxKzcxeDBvSXg1bTdIL1dyMXc3eEdwVE9QWWVGZC9sTVFIVTE0dlFZ?=
 =?utf-8?B?cy8xU0pZYTc4d200b3MyNlVlTkc4ekdFaDNuZ3BGWExJV2NJbEFEYTRzeUls?=
 =?utf-8?B?a3lTVGRJMmcrUzRzR0toR0xybXYwMytpa2RBZU9ucDdsYU9TREttL1dYTitK?=
 =?utf-8?B?ZlpCWnRrQm5EL0N1OHRRUWZ3LzZtc2pTWDVIejc4bHRtMlBZSDNJR1hoaVhC?=
 =?utf-8?B?dnorVWtoVVY3NDJZUy8yZjlWNEJpVWtoSVlUK216RmM3N3dqbU1sSXBwVllt?=
 =?utf-8?B?bG1tdHhzVEtQSWJYR0t3bDlabUFqbG9ZZ1JqWmZmL2QyR3V1YkxRUEtxUE1G?=
 =?utf-8?B?Y3dLQmRVNkhHSFM3YS9vQzhwMTNjMVNPemtwSHoyaVpOemNCNDV2OGxrQTZ6?=
 =?utf-8?B?ZExudm5BeXNDdllMUm50aUtFVmhVbE1jTW45TUM5Q3hDaExDTEg0N2xIQWN2?=
 =?utf-8?B?dmJCNllRbitoanJodVFFMUpremN3TWJ2VTQ0UHp3QjJZdUo1eVN2Qm5CZ3V4?=
 =?utf-8?B?eklOZXF4M2hkbGFYeEE4cE9Od2tacHFyMEF6MCtmVWJOYUtJZENGNXg2cUdm?=
 =?utf-8?B?UThXNE1KNG9UZjYzUWpYNHZ1N1k3WEFmVGlGdDNOczIvYnFTNnN3NFhzRlVM?=
 =?utf-8?B?MnBNaVBqL1pmMHZRemxHMTNYME92TWMyeG5FTXJCUkxTK0VpekFBSHZCWWxq?=
 =?utf-8?B?Sjd0RUdHZmx5UjNqUUk0Y2RMalA1bFdtSmFhSVpJeDYycDBnQ1ZVMDBTdnFx?=
 =?utf-8?B?bXIzRkhNcHp2dFhyYXlycTIvK1JYeHlqSFRBdHBXb1RpdjhjQ2J4RW1TcGNK?=
 =?utf-8?B?dmhaQlBSZzc3ZVE3c1pDU2VVdGo3Nlh1NDRFU2xGNzl5amV4UFh4QXNheHJk?=
 =?utf-8?B?MjdoTG1hbWxlVjRIazVaZ2JBaUdXMWU2WU55d01yeU1CQ093S1lOMGtpYTJK?=
 =?utf-8?B?M0V0MTd5QVBGMkNZMzJjcHYrY3dEQk5WQSswUkVOeFRGKzdDSXJYeTJMaTNa?=
 =?utf-8?Q?SIu0BLtoZFIB/Vl8sL1jN05bW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21122564-06b9-418b-f884-08dc20e68388
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 16:22:40.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fqBrnI6kw9lDTIYKnsZAqQEiorxlyAHA7qqLnhmfD3qylVp1stTI2YGoa025F4M6y8biP/pdG1Cr0VtsEzRhmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6678

On 1/29/2024 07:24, Suma Hegde wrote:
> HSMP interface is only supported on x86 based AMD EPYC line of
> processors. Driver uses ACPI APIs, so make it dependent on CONFIG_ACPI.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401281437.aus91srb-lkp@intel.com/
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <naveen.krishna@amd.com>
> ---
> 
>   drivers/platform/x86/amd/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index 54753213cc61..f88682d36447 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -8,7 +8,7 @@ source "drivers/platform/x86/amd/pmc/Kconfig"
>   
>   config AMD_HSMP
>   	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64
> +	depends on AMD_NB && X86_64 && ACPI
>   	help
>   	  The driver provides a way for user space tools to monitor and manage
>   	  system management functionality on EPYC server CPUs from AMD.

This specific patch looks fine to me.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>


However I would like to ask for some follow up code:

This driver is missing some safety checks that it really is running on 
EPYC.  Probing registers that don't match the same mailboxes randomly on 
client or embedded parts might lead to unexpected behaviors.

I've seen when someone explicitly compiled with CONFIG_AMD_HSMP=y this 
breaks s0i3 on at least one system.

I have two suggestions:

1) Use something like amd-pstate does in init:

static bool amd_pstate_acpi_pm_profile_server(void)
{
	switch (acpi_gbl_FADT.preferred_profile) {
	case PM_ENTERPRISE_SERVER:
	case PM_SOHO_SERVER:
	case PM_PERFORMANCE_SERVER:
		return true;
	}
	return false;
}

2) If in non-ACPI mode, require that a user use a module parameter like 
"amd_hsmp.force=1" to load the driver.


Furthermore I noticed that your init call has a dev_err() that will show 
on unsupported parts.  If someone compiles this driver into the kernel 
and runs it on one of these parts that's pretty noisy.

I suggest you downgrade this to debug.
