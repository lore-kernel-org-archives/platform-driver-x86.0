Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9865A78B4C
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708093607; cv=fail; b=rGAcVQAiE7HE1UZfFrsNssmitExwfDxlaR/Xrkxm3m8eIyDOSqlX+zVaoAFvTNG5hVzk48KAM3tcYdrIIi4j03YOWkae+Zi+H3Hj6ATxRgqXQ7zgFMTjPTxud9gcrxKgL9u904B+zxB4ZWPqTtz1H7j08MLvvWjdX3QC+pTMbiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708093607; c=relaxed/simple;
	bh=EwxzGoDt0YhWxzDPAzCleCGf6kssMwXSdzFkTRr0sY0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rsste7YhINhgYJX14o9UMbiVDTJ8ohkXuWfT+sbdE01uoA4Zwy5qb9tn2NRmlmRKMGGWvXRvwQDbcb0MVzmIpc8iYMqmwivhoz7pr0FQnzKk3s0muG7BF1rWSrPsKLYB3MHYHIYMEMSowwm49+Xc6yva1nbljzE08nL0yR0R614=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rZVfPeCO; arc=fail smtp.client-ip=40.107.93.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rZVfPeCO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoDEvrsV6Vie04zaWJUDr/WQyphLvmZfz+RuUAwoFjFyIaA+wFRO5R1tA/55b4/uDU4Ur0ulahZ31dijjABs12m+GbetX+O9d4JaUdMw+abPB4l8pt4wCVxH7i1OXU9eI62Fhs6DyOpKggiMwhe9/pOMIG42qkAHli9TDfsmOmcSN9zL11SobAv1py2v9whwke/0MdyRYOSvbl+7hwmUSnN7NiF/6jq2mxM1m0ywA28GaUYwoe9HHK/pFErV2lkt3EPcCnBFU/eL4wtrjhHsNsaw3Pu2D0TmR4CRl2vVQBuA2AWaTGmeko3RVNfiPqA40iQLN65LY29QHvh7esIZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Sn0+NWWOVS1ftpiL8A89cg8jceglPyIVCU3/F0nyjw=;
 b=laJee5bBThFVlI74rNyaco8WciRoD36JNpo+1Y2xmVTPMR5CwKP7Zn2ObnHOmQPZFdPdxCdrWUlEk0raUOENoAHKyWOCN+pAq/nm0V8yLdzpt14EPzDHpKUzAO+mIxd28z9nziHwsUdDOSIhQ4tD3TGnnYmr7bYvUMRDQ+1nmck3H9o0bxkY33KP9zwvY8weXduisijcASnFEGeU62hB8D7QTWjyxeRIogwo9Z76v1PTOzNr208rO3kyZx4Sas3Vc7GgmO9K/zNXe0noFL/KPJEMIZV6esbKgPNGD3WR+xXQmlEnsDHJkRuQFfA5vet280l+kds8hy+zsbk/kS/CCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Sn0+NWWOVS1ftpiL8A89cg8jceglPyIVCU3/F0nyjw=;
 b=rZVfPeCOmYZiiQAnvTVu5E6KJG0tjszDUeOj+xE73qjEGe2udJWLIUgEexZmHcs0RydT9SE5z1YsXnnWxzx3+b3WATUm86uVggnklQBe5xEii6Y5TB4hAfeMfDYhkWBKM6HZmSHOkRFjasUYYDsXS6ktnz/UHcA26UrtemX1zuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5747.namprd12.prod.outlook.com (2603:10b6:8:5e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 14:26:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 14:26:43 +0000
Message-ID: <4c52b3de-5bb9-44b5-a42e-0510ddfd3863@amd.com>
Date: Fri, 16 Feb 2024 08:26:39 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmf: Fix TEE enact command
 failure after suspend and resume
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240216064112.962582-1-Shyam-sundar.S-k@amd.com>
 <20240216064112.962582-2-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240216064112.962582-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:5:337::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4a0591-4510-449b-5e9c-08dc2efb4c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ol6zxe5jcQM04aA+R8ldR3nErD65nIOdGY2Os3DJMxpV26GAxQRXtN9GERImqjX9ulPG7R9AdKjfa3DAjVCqnv5kNKIskTFJYhucjCkElIZS5kbxaHZTTRZJ0hxkxbvcYTDtvHOyg3D2WlAgERXMkj2PwG8zQiUzTqHuKxbF2H+bRfyuWdEAf6AaqfBDmAMRmc6tdqMm4WD4wIXkcjFtYiQBrLX3czotj2UJRn74k6Tae0xYNBs55jTZXRjkYOaxWmLMrClaoL5piNV5PqllCSYTTKropNd15sfPlWpleTvvon1+JxyEzK8BHY4rK7xFgi6q8AFbVjoP+VBYzlyHMTBo9clErqYiIN998mGMH1si1Z7KUczuarcHfyfw5V1+idCYz/QGcHNSAwnJ0NeLvGdhf4s9q531UU/VUQ3iZu3YvD7SZxgGXZEqm7eXvCKq2wWn6EUoA6St5Lq9925e+z3Glkg9FE/IWYJ0SQ97UDvjBow7D+YQ6o3zoucSl1haGwDr/mhKJ5lwKY0FuG/PXeWGlyThuSfPvQ7v/VyxdMfODGIwzoVjIDJFBMXRyYIu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(366004)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(15650500001)(44832011)(31686004)(2906002)(5660300002)(83380400001)(26005)(2616005)(36756003)(38100700002)(6512007)(6666004)(478600001)(66556008)(53546011)(6486002)(66476007)(31696002)(66946007)(316002)(6506007)(8936002)(8676002)(41300700001)(4326008)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1g4RnYrNXQ3ZWk1eHZGYTlPZGxDVERIajJTRjBsVG5uK0NlNGhwaDVnNXkx?=
 =?utf-8?B?c2ZMMDFYN2x1a0ROcTFQVzZVWlBjN2ZLYVQ5aEpoYWo5bDlpK0x4RWhDNjlm?=
 =?utf-8?B?TUhnYVR3NSthanRieXhDTkpNM0kxZFpZOTd6ZHFQdlowMVNDc2J6MGFJeC9K?=
 =?utf-8?B?U3MwYkZpSWdLUjZieTNkWGdaeS9ad0lUUEVRZ1FIRjF3UURpZGRYbGVZQ0RQ?=
 =?utf-8?B?OHdGVVQzSVp1ZmtHZWZwemRscHgyY2xwdVFLTm5tREM0dHZ6SjRmak9sR1E2?=
 =?utf-8?B?SFlHWDJXNnVJL2NNd1R5U3FQZ3IzRVdBZWgyRnJDcGdqTUNFcHVRTGd3MGJL?=
 =?utf-8?B?MjF3bnc2eEpGNmNZY3pIQlNPVHRreHBnVnN3bXVuUDNDVW1mbjVkbTYxK1Mw?=
 =?utf-8?B?alFqTHpkbk8weE5KVFg2NXdsUHpNZVZjaEpHai9yYm41YkM3TGswU3NBdkZ6?=
 =?utf-8?B?YW92YmxablBUTk1CRGhnTkphTGNiUVRpQWhEYmxCSUNCS0hRK2pYRFovUFBI?=
 =?utf-8?B?VUhZUHJ1aXhsK1UyR3NiYkZJemc4RkVVTWVRbGEwWmhlaS9YVERqMEtQQWpy?=
 =?utf-8?B?bk1yRVlabi9YTGlKamFSVXdKZC92MlVFbmwza0Zzd0JSc2RHZ2hKcFg2MTlm?=
 =?utf-8?B?M09IaUZzUG5MZ2l1YUtJcTVDQlkybURqS0k4ejR5YVFrMEcwWjJYMDBvTUpq?=
 =?utf-8?B?NGQ4QVErYnZJaW01RDJYZktMR2U5b0Jwc0dKV2VhRlZqSVQwZEZxL0s1dVlN?=
 =?utf-8?B?eTI4cjAwU09LRVVDbmw3elRua2Z1SGRvYkxxYTAzV0lhd3RnMnF0OGRMS3RX?=
 =?utf-8?B?VFRJWC9yQjZFVkNLVGdPSExwZ3MrVTgwUGFzSFdRTy9wQzBlMFdUTDBnVVhw?=
 =?utf-8?B?OXFRbWgxRUtBV1FHaGluTlBwS1Zja0ptUTI5ZjEzNE9PNjJvUndqNTdZSXYx?=
 =?utf-8?B?MXJzSkpDRjZkSWhJV1lxRmltNnV6anR2NVJqejBiMlQyY1FKZGF3VVY2Vkdt?=
 =?utf-8?B?MDhtUmhyZXV3SnErejU0NWNQbytnV2lHWFNmb3dIRXNUWXNvL0owbTdqZWwy?=
 =?utf-8?B?NHJmZmRpbVQ2T0ZNV1djMm9NVUdlUm5yZFFyK0loZDl3b3h0QUdMSEZGUUc4?=
 =?utf-8?B?MFhUNXRsOGpQVG5xSFc2aDlWOUR1WDdOTnVSdGNoSWM4RXVNOTd4eFBBMkh2?=
 =?utf-8?B?UVhMTnB0ajJwK1hoNy9RSU45NC9DU2FRWkZ0OGxFV25VRGtGUjAxN0Jwdjd6?=
 =?utf-8?B?SE9jM1JpTitXTTlFK01CbVB6K1o2ZGdXZ2NiKzRnUmExRmZ4SjBIc2lMdFpG?=
 =?utf-8?B?S2luSnNIeGNyTkV5bTVSUGpucHJ3MGE4YkJUL3M2UjVQWTRkVlNzSnMzbGJS?=
 =?utf-8?B?Ulc1T2U5T1dmUm5MY0xhNWhjY3BEc1ZqUXczYmNFR0wxZDdrZUJVZ2FMcWNG?=
 =?utf-8?B?N2pxcmtnaE9haW9uanEyaVZadlg3SVF6U0w5aUxXYVhQVk1SWTZNRjg1QTl6?=
 =?utf-8?B?MzBjZUZoRkRjeUhoSktzdWRIS1cvdDBPeFBUdGlaTGlhVTZGd2V1NmxnNWpu?=
 =?utf-8?B?aUlNd1huZU04VUdrMEh6dzducThNODNrRXJvQVM2RDZCeE1lR0MvSnVUazNS?=
 =?utf-8?B?d2lJL0QvQndDazNhYXFuWHliNnM5VmxLY2xGSjVkamdrVVd4NEllRG12Mld6?=
 =?utf-8?B?Zmtrc3psTm5WVXVQbzl6K0doK1ppNllocGNac1Y5SkdPYzBPRWRCQU1MWnRj?=
 =?utf-8?B?OXVJdklUL0NaYzdobHIrNFRKeE0rUUE2WlhwSHhIaWg3V1l4WnZ4VXUvdUVa?=
 =?utf-8?B?MWo2ak9ySmoyOEoyaVQ4VnlYNm9Ob1hVL0xFNlhmenlCWjh5bWVlVjl1aVJR?=
 =?utf-8?B?STZpclE4QnNPQUJUVFRmc3A0d0RZb1NWTXlLUG91Q3JMYytlcjAvVTlPTmtN?=
 =?utf-8?B?MlFIaVpjT1Zoc3pZdDV1aUMrQVpwUkN0a1dveFZtTjVZUWowRkdrYXI3UkFR?=
 =?utf-8?B?WmV1RHNIcCtLRU9QNkE0cXRtZlpJaXdod1E2eEMwOGNCK1ZaVkRBVitkbHJw?=
 =?utf-8?B?UFNkV29PSS9TN0xWanV3Q3FuMFVYd2xCcjRUZk1wVFYraDRRZXFPMC9DRFFp?=
 =?utf-8?Q?JEQOJXo4mgvJIwrgf40xw6VFg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4a0591-4510-449b-5e9c-08dc2efb4c53
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 14:26:43.3623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: miY0N2RlVHE2xE6fzOsRzMGHWUlCcjN+Q4LMOLAeioG1oHEVjPuSpTp/uIfHNiZaRtXsfB6OdmMXwGsT0LapBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5747

On 2/16/2024 00:41, Shyam Sundar S K wrote:
> TEE enact command failures are seen after each suspend/resume cycle;
> fix this by cancelling the policy builder workqueue before going into
> suspend and reschedule the workqueue after resume.
> 
> [  629.516792] ccp 0000:c2:00.2: tee: command 0x5 timed out, disabling PSP
> [  629.516835] amd-pmf AMDI0102:00: TEE enact cmd failed. err: ffff000e, ret:0
> [  630.550464] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_RESPONSE:1
> [  630.550511] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_ARGUMENT:7
> [  630.550548] amd-pmf AMDI0102:00: AMD_PMF_REGISTER_MESSAGE:16
> 
> Fixes: ae82cef7d9c5 ("platform/x86/amd/pmf: Add support for PMF-TA interaction")
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2->v3:
> - No change
> 
> v1->v2:
> - remove enum smart_pc_status and adjust the code handling
> 
>   drivers/platform/x86/amd/pmf/core.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 1d6dbd246d65..853158933510 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -296,6 +296,9 @@ static int amd_pmf_suspend_handler(struct device *dev)
>   {
>   	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>   
> +	if (pdev->smart_pc_enabled)
> +		cancel_delayed_work_sync(&pdev->pb_work);
> +
>   	kfree(pdev->buf);
>   
>   	return 0;
> @@ -312,6 +315,9 @@ static int amd_pmf_resume_handler(struct device *dev)
>   			return ret;
>   	}
>   
> +	if (pdev->smart_pc_enabled)
> +		schedule_delayed_work(&pdev->pb_work, msecs_to_jiffies(2000));
> +
>   	return 0;
>   }
>   

