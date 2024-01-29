Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092AF156963
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 16:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706545618; cv=fail; b=ryfzxkKqG6UoJFqLxLmXusMeOokafcSdDH+8A4pNZ7izz70sgbS6Rz//KmpxvulundmykXyRTGRi0F2COucBGwjnO4T6+NTjvbxZBbe7ugh6LAzEFtHzoou/rpwBgI8NUIvvBZB/tPC5HT8HuJJkViSIo0SduBdUJqeLmHzD1QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706545618; c=relaxed/simple;
	bh=kjURzD3wUW1Xg9OgGxHaojPe9t/SKFBQhYK7ZsGDTvM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BTekbKN8kc4xhrWqUHIDLAdzNSTw26mBhYa2byIqbFcZnCgkh96443jC86yVvK9/ir5zi1sI/byKrxR3v7//+I5hQU2GkokZBj3O4bZTgBmVP+UohuwAunkvQtZeeWhd/beNLepmE0XgOJ9rb64qbdcq6mexUQd/4usRlYUBGlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pK/qlI8W; arc=fail smtp.client-ip=40.107.94.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pK/qlI8W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyEHt7fzosHGB5fOpHAEIqog9PGFlNB3hSlSTW6RFlYDmyG7ooTWEVXkgmRXUvfLzdalcOp4PQWN1sS86BRXHW0In4UKpNOrPfo1EzE+htiggKlKbaPjSTrn45fj048DJIbQckUXTxwpQmIiG1Lu9wuzqgJ3YINHumVCIp5SUIYpfKR9x7Lj5knIWJSJUQoWZMFHmlrowAty1jvngHAXMvp/twEGQOJ+1ERs9QLkkYiO4ay1oLtE5AYbNbIbYBvYWwVMVbSHmtG+SCD7PNQVQ0EcPDp7w8tcKqfMznonzy9KWt43LL9ynCSwpuAJLpVhVdjFDLY9NRMCrqCpBBd37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfCnK2uq0yWtJVBidwT5lWJp8Adl31XuKZtSYSKJaXc=;
 b=CMobZrbunpI7v3uUYpSVQgqMPNdvl99cLJbI6PHIK1cxoWv/ZAyu8+vAhOT/5EoFRjrGsMB+kH6ZDifl5LVpsHNrA/cAvDRhv+I6gumwhPe9mZsyIuMUNWJ1AzcwIXasUU+db0TcAqUU2r1uVtsdazlO/RctqCi2JHOthXXoVytrBQeBqpzvxVmfhm+vnr9pP2gIziR2BqwEiIR68kXYfTLERGJfLN+xQc0OW99bKWvSUp2MZX14dleqajV155h1Vhb1IpUhDSJlaxnaBJXd/K4PGd2nWm1qXBOPOAIFrbAP4C5gD0HKeKjiYe87yvzojTfchiJmUILKkjI0QvHLKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfCnK2uq0yWtJVBidwT5lWJp8Adl31XuKZtSYSKJaXc=;
 b=pK/qlI8Wd+/3Ms3Kpke8Rbak6LoubjwwKH8iItfN8Fzgrd4xW9sUQICHV371cwJYCCsgXkit9PKSLAgz6WVH9C+gObKLXyDZBupw7p3r14CqW0Np42Qbb5PljHojNh0we1+BWN+6/4a+VRBEA/i2w8LXe10grzL/GpU1LFGHJa0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH0PR12MB5346.namprd12.prod.outlook.com (2603:10b6:610:d5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 16:26:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 16:26:53 +0000
Message-ID: <8265245b-4390-4e7a-a9ec-1d066fa7367a@amd.com>
Date: Mon, 29 Jan 2024 10:26:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Remove NULL dereferencing code
Content-Language: en-US
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Naveen Krishna Chatradhi <naveen.krishna@amd.com>
References: <20240129132433.2087490-1-suma.hegde@amd.com>
 <20240129132433.2087490-2-suma.hegde@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240129132433.2087490-2-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH0PR12MB5346:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e92240-fbdb-41dc-acdf-08dc20e71a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5RRG/LYjWfWNzJT8uA8cKv/C8lhLR46bCqrK8ipeZYVxNtSDfW+Q4RS4M+eSGd3k1IrG7kqaLNwYs438NTGxZvHCEvxcn/g0wRv2rM7jiOzZyVVSQjR/BlxdBAksq0uzu5QmoaIhEXzgSdXetA63md4gJSYO1bghcXrLtLc6naSA6a1r1mIzSgiBGUXGTj7AmBYRY1GuRYLahR986d5ofFA/5mC4QZk3pqvoVuJ/8cfQqoA5Swq9784kaJKzyDvFSSAFiduj5UcUYZIOpSKsesgWw4pI2QbjtLoHB88HpcWDMpRPwsXt8GAh052BmM+LQdzJ3OX0/pKSh2Qge5S1c+72hN58NKYy7Hi4TMWzjQOceVhwPwyEhCS1lYUrYhTotmaKAiu5GI/Go3gwM7mac+jnFC4t44GWvbP+O//Y4ilr7+Fi7fKHbfrJzh1mbzHGMWcdmlMdgUnFh79sbTupxmllhPb5mjtLbeFsVzeRAom0zNLf7iX90UErsMfyUiV7aS1CzoGhPaw1QwedPCbgwTtUS7LAGFW+0WNuSPoSA9TJ6OaCjqH0MJ3yQLT0CqmhL2gTm7ZT7qrorSGyk7+CwptQsC5guQdZpv9Y2+TUnAFNjVisrsitA8NkTh6AxBRH9DyTomjlxfnOYEIxzGN5NA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(376002)(366004)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66556008)(6506007)(83380400001)(36756003)(5660300002)(316002)(54906003)(66946007)(66476007)(86362001)(8676002)(8936002)(53546011)(966005)(6486002)(31696002)(478600001)(4326008)(26005)(2906002)(44832011)(6512007)(2616005)(41300700001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2plNW5sRHZIQ2hOd2lxc0d6eU5uMWlYUGQ1dUowQ0d3NlFiMXo3WmtkNUh2?=
 =?utf-8?B?MitkbU0wUlBOWjhjMG9tcHgvbFZGUHZwdDZRTkZNTXlWQ29OZjlJMWR6Mzlq?=
 =?utf-8?B?Nm9PNHJmYmdXTDdRN1FaYXQvM3h5YkJNNXBTd01hMnBNNDdsRHFIQ3Fxcmwz?=
 =?utf-8?B?aWZpdkZ4a2p5ODE1UGtWUUp6d3dycnlkSVNDSlIwcXlsalNZK2s5N3RYN3pN?=
 =?utf-8?B?WitTa1RuV21kMDZrZ1BRb3V5eFprM212eG43ZUY2UG5YZWZZeUQzVVlnblFh?=
 =?utf-8?B?NVRrZXp3dlJXSzIrQUdBUHh0RS9YNUMyY1NSOVZIVVpJcVZQTk94dHBRaWV1?=
 =?utf-8?B?Njl3bnF3dnJZMVUvSHcvdi9ZTzVkbHgrb3FzaXo5NXlXcGFzYW5sem1vREVY?=
 =?utf-8?B?Y003S2lZamxoYU1reUM1VEhvWGtRc1M5a0pTYllVZm1KWWlGWDAyZzR0bjkv?=
 =?utf-8?B?Qnc3a2ZsUnRURjBDOGZxKzZNdlVnNXJsQkRsOHN5OFY5eCtxQk1kT3pBL3A1?=
 =?utf-8?B?VjR2bDg3ZzExcm11V0tnaEdTNndSbEd4MEd1OGc3ZzI4cnoycjFzQkdCN1FY?=
 =?utf-8?B?aWQ3TlYwZVdnUGNBYWt0RGFKc0dVbUpuUnpreWJCdUt6NTZnNWpRS1pvZmZB?=
 =?utf-8?B?aWI2VEg4LzcxZWVNbUgzWWdub21RemwzRnNNbFVLa00wMzNwNE9xVWJCM3lx?=
 =?utf-8?B?U1Bha1BvSENjTTBLTE1IelhVY1RSRkxiQUhTcFJaZUhpYk12WUVPT3JOUys2?=
 =?utf-8?B?ZW45QVFGdE1LemtzeVBzcjhyUjd4QVV4UnhXdUFSUmQrOFk5SkhSSkJpYjVB?=
 =?utf-8?B?WEJqVVV4QllWWnFONlliQURqVkRuTVp4dUNPQisyOFkrWmRrL2FpSzdKYzV4?=
 =?utf-8?B?ZnFtd1o2SmdhWmdCcG5yRTRHZVFVYzlGdTQrK01yWm0xaFJKM3VQMmJkVWVP?=
 =?utf-8?B?bUdIMVp4WVJPZHpxZVdXQkI4SDVMdVVxdG5nZnBMYW9nbGF1Q2VFM2JIMkph?=
 =?utf-8?B?ZFVlVkNCdUlGeVYxb1FmYXlHcnRiWHhDWnN6ZmY4RlRkMStOQWNNN0RGNHds?=
 =?utf-8?B?dG1mYmpyYmEvaHdiWE0rV2tBR3JFbmd3dlBDc3packN0N05iUkhzRkNCT1Er?=
 =?utf-8?B?a3V1UDRsM0lSOEZ3ZnE0OGs5d3F2YUpOMEk4VXBFRW1zbUdVL2g0RzZIWFNP?=
 =?utf-8?B?Y3RhMk1jdnZZclBZNHZleTdtTHhRVVRTbXduUEdHWFJSMDJyTWZOL3BJNEdP?=
 =?utf-8?B?QU5uZ1JrSXpyMzNyVm55b1lMRWpEbUs2Qk9XWlExeDJPL01lMWlxVTJ4MmYw?=
 =?utf-8?B?bFIrVDA3aUVlS0pvWkVEVTFrVGt2ajVlRzNNU0ZlMVo1WFBjTzNrdGpzSE1x?=
 =?utf-8?B?YWRzYUhqbmVQaENxOWhuNUtVUEU3LzliRDlSTHA2bWtURlFDUXc1VXJQb050?=
 =?utf-8?B?QkhsbkdwV1NpYXU1NEVvVlBUN1RXWEdnWitnTE1hQnpSQVVIOHhJQk94VEFw?=
 =?utf-8?B?a3dkSzZFci9TcnN2WEdrZWN1MlMzUFdLc0xuYzI3ck5yY29nUHFUWm4zVnI3?=
 =?utf-8?B?NzdtcjY1V0x5ZHBzRmdRakZwT3F4aEJLWjhoNFl5ZVBmNmJVUU9NZlZPN2xL?=
 =?utf-8?B?aWVTVWRydjhENEdBNnhJN2hIVUtYc2VjYWtRWDdFNUJQMy93TmlObmlsRHRO?=
 =?utf-8?B?ZFdSWm05SVRRbFdHWlR0WjluUlZFenRUREpVZW8xUEVQS2pyZS9PVDg4THVh?=
 =?utf-8?B?R0dGdGtvSkp2NEJGa1JPbHl1SDRWbFNzZFVvN0d3SzhJSVpUTnlucllVRk1i?=
 =?utf-8?B?OUlPdU0vcTZNVE15TmdqNUhKNWpvSEdrMXNyYjFFYVFVTDd1dXRjUXNsbDRi?=
 =?utf-8?B?dHkxMHdVcVRCa2dhY3Vpb1dCR01FOVZmb1hpUFAvZ0t2ZTZ2Z0tMYmVxS1RE?=
 =?utf-8?B?WmpVMmJ5bDZFUVRSN2FXS3g2TmxncFBocXdrRlQ0a0dvK1drZFFBR3hZclhl?=
 =?utf-8?B?SGNFNVBDY3lQTmU0bTdORXdpRFNUV0d6UFhadjNUVG9XWTBUVEhiRDFPSVBD?=
 =?utf-8?B?amJrMDhLZGpsZkxFWlhUMnNZTVprRjBBaCtzclJKQVNOajVSOWdLRms3Q1FM?=
 =?utf-8?Q?F2DjJ0vmRaBw/PDWQqaWBPj+f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e92240-fbdb-41dc-acdf-08dc20e71a4c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 16:26:53.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yl0ufM1BZw9eQ3Xh6XkPkm2el49CTCIb24O0ZM5l3k3R/Pn/LigmLuJMmW96Ys4d/+iVOQmdXEBBcIUjqpcyXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5346

On 1/29/2024 07:24, Suma Hegde wrote:
> Do not log using dev_err() in case of !sock, which causes null pointer
> dereferencing.
> 
> Also remove unnecessary check "boot_cpu_data.x86_model >= 0x00", which is
> always true because its an unsigned type.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401292056.qkUFS09Y-lkp@intel.com/
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202401291311.gzMCj6SP-lkp@intel.com/
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveen.krishna@amd.com>
> ---
> 
>   drivers/platform/x86/amd/hsmp.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 1baddf403920..1927be901108 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -566,17 +566,15 @@ static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>   	struct hsmp_message msg = { 0 };
>   	int ret;
>   
> +	if (!sock)
> +		return -EINVAL;
> +
>   	/* Do not support lseek(), reads entire metric table */
>   	if (count < bin_attr->size) {
>   		dev_err(sock->dev, "Wrong buffer size\n");
>   		return -EINVAL;
>   	}
>   
> -	if (!sock) {
> -		dev_err(sock->dev, "Failed to read attribute private data\n");
> -		return -EINVAL;
> -	}
> -
>   	msg.msg_id	= HSMP_GET_METRIC_TABLE;
>   	msg.sock_ind	= sock->sock_ind;
>   
> @@ -739,8 +737,7 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
>   
>   static inline bool is_f1a_m0h(void)
>   {
> -	if (boot_cpu_data.x86 == 0x1A &&
> -	    (boot_cpu_data.x86_model >= 0x00 && boot_cpu_data.x86_model <= 0x0F))
> +	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)
>   		return true;

Does this really need to match a specific model, or is it a Zen 
generation level?  I wonder if you want the synthetic CPU feature flag 
for Zen5 for example?

>   
>   	return false;

