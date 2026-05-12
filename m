Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681FD357CFF;
	Tue, 12 May 2026 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567375; cv=fail; b=K2gjqBEiIgSMnG8qqACMGTFEn44JmIsau8P1PZeaQiuBLhuUCPOti8vpo86qULiff1ickbRqoV4qccrDidGpnlVX4SjyI2Pa8TiDOqP/YWUq8Zr1JlQXk1pB4wARD/d3bye7iVnv9oOAAaDg8oMoiRAvjS9fyUUUXZNk+VlsZRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567375; c=relaxed/simple;
	bh=eUuNSvnb0mSSViEpTVdiNEKOqEikCjgd7dcxvotdSuA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WYrP+pqbKCr+2nTOO9HTurgVKy8WFsccJKiiRiDHLfAP4FXED+xBIamuOpRYYG44bM7yrM7zr7ytH5vXDWP7S6xc+6fChbdq6xT40v51r1PIhYdhj1wM3wo424JuirPn0S/2Sc8Xn6OHV0/VHK/NC3/q56aIQya8z9R55kKzNaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=a9U4LqXd; arc=fail smtp.client-ip=52.101.52.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="a9U4LqXd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhUtnMK5RrRaw4lxpdmoCV6MDXnWFn+qfr1BbwrKC1WJg6zD4NQhlQpOWCqTAGZXCAwCW+vNNmUCqN0BN3qKwbs6Ij/UABr1xAVL3wHIJWoBO+z/1AzTuNKZRATrYrxBeVBANQu4qUo0mld97HNZ0l0GytJvxVTDTnpS5SsKpB6ASB26p27sf6Husq1ptxISZb0URIHuCbil/XkAPcbHHMajQcPjUppHDfVkdychA6wIqsw+wCXJJ3bwIIhTgNtzvjdLMGosuB4nmfJxuR7Xi3OFQDVA+Ehb0pK0379Ex1qJ7zkkJLpeKXgs1HJwGvnNMtS0sgcqJIHZxJ2VoT6rfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0p5ein7Cu6mvqSn66Y6HVjTCG00V0v/Nde2arFW9l9M=;
 b=bqvfGv1OqMPE2f4q2sZtRxs7kEVsn9p8rpm9u/FYue2QpWkLiP/d6VT83Z5zvbvbZ5KrQR5qjkf+MxbbzFsPYcor9RQ2oMp14HL1lwW35/8WqIgmeyWIapSX1hzu33D5VaphgU2eZa8ynUa0rI+vcjGYKfKJqqoHMAbwhxDf9QTKizX30jYADvlQToZaf0z21cHE4YDMu6/RHDG2oZzS0Ho1es2ICIqjDAQvBOrEKODhyN0PmJvKpDGMfDRW9UJ4fVZ46z7O5FgBQGL23M8D+W1iVkWmCV/orGjEY7HhxclsdZ0TxLx5oxQrlw4MBlTBUETWh9jj0y0IgJdoj17VJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0p5ein7Cu6mvqSn66Y6HVjTCG00V0v/Nde2arFW9l9M=;
 b=a9U4LqXda9WeUzFaKeZD/ud1pppMUmjPYo9SeozSszwPCkWn6UP7yYNNdrF+h4po9gqK+8pfkjAQAqF3kZwig4q+7IzVCqWTeOWpziBioZAWaD+/56gADhjCp5KMMMbDonUzppOhTNqgc1Ez5YMHVSDDK8f8MWdeWxAdsCSaibQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by SA1PR12MB6776.namprd12.prod.outlook.com (2603:10b6:806:25b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 06:29:08 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 06:29:08 +0000
Message-ID: <5f20b0af-bb3a-499e-8ee0-c1ef0429345b@amd.com>
Date: Tue, 12 May 2026 11:58:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] sysfs: Add SYSFS_HUGE_BIN_FILE flag for binary
 attributes larger than PAGE_SIZE
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com,
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, Nayak K Prateek <kprateek.nayak@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-5-muralidhara.mk@amd.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <20260427155129.545327-5-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::14) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|SA1PR12MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e7c9402-2858-4ce7-b115-08deafefc56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|17002099007|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	gwaWBqeQt/qxwb0Vinac9c+A7XowE5WO3K+jMx2Pqr2lJtctuOMWLi8ybw3OoyNwh91brjUIG70wUN6d3eYdUtwx3THApsHIYS5ZUJilhje4FGEb7qg+AcShJrm4OJDNTG4J8hCzimr8p9C3JJdJPAsFKKuo9eJQS4sn8Q2vgVFjSxB+04MDUpGpUsSgfYNQbPNbxV4WF3n2I+b60auQdd5IYdOt9RcrzxK4BFE3u+tgBxJP+GqQp8iukXYOusAxBFq1uxQBm4deE2rY8O6nJ0fQ7OGdKWpd6ey7pibJpOZRIEcbRyGhAAuDxngN0MegIi+zvIMKrHIpqjEi4eTasSaun1a9+5RYVVhZTCxMt/VhtFGRDwL0BJhxvRYk3G06Jy86kGR9nhazrdNigcCDe32LX3ou2uqZzlVCkb1lZV3kEADg08QEotGH1CmKY5yWTeOXGQbPvEownwGRibcuYxLHelZHJKr1sr60QE8WqxFRqOUmIKxm1NvbZgsb0TouTEImw+tkMjulczXn2wnxs0jce7xrK2R/12PqnA6T8f2AhpuBZRooqSF56Gnl6GjjN7/Xm31BkJcrj+B7uKSCV+22lT40fYEbBXecBUBSJY2oKA8awe6g0obZ4gzLfBsxDGHMvVzEZ3HrSLLqWfJsKesrMc9CBEWIlHgDLPx/9/QTU+u8sTE+sEkse24XW6Ri
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(17002099007)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUk0SEZDRTVtVkdSdzFtTEpuVXJBT1JjT3JRRVJub3NJNGVUMHpmd2JWUHZy?=
 =?utf-8?B?SnFUNGYwR0xuVkJuR2NRRGZzMXFtWGtIN1pMTGkxQ21GOHBOOXcvZkZ4djVu?=
 =?utf-8?B?a2c2M1VsWmxGd0J2cWhFZ3JzaUV3eEdNQnVWUEZjajNYQXE3WGNSNCt6dmRO?=
 =?utf-8?B?dHFUYWVraC9PcHgxTTZLSVhjc0dxbm9lMWRScksrVlAxek00Q1lvbnBwR0d4?=
 =?utf-8?B?N0dtOHFCRGYyaVpCVmVhd0dNV1BBWHQ5ODBjai9SaXdOVGo4eSt0Z1VSNEsv?=
 =?utf-8?B?akVzcFF6QzhGMW1ZZ1lnMUsvU3VPWlBOVE1SNHlNc0dCSGdyYXlzaWFWZ0dN?=
 =?utf-8?B?cGRLUkczZzJJV2NDNVBuZXpJVkVWeVdENnprNVVQMEhEcDRKMlkwb1FrT0Zo?=
 =?utf-8?B?NURsRTV6bHlQQ2VtaXN2SzhObzhIa0RHUTZMbzc2ZDhrZXU3TUNNcTNxUmU2?=
 =?utf-8?B?QmZCeGZZUk8xbE9keENqMGRpSENwYlJSQit6NDMrdzFRWUNlZHBja1Fra1R2?=
 =?utf-8?B?Uyt1Z09hMHNEb3R0Y1ZRWTd5Y0htbFdndHkvcThONFVBcEEyNXBvOWphNWdv?=
 =?utf-8?B?Q09sRHRIQ0NGSDd2ZHR0U3BZeXZNZ3NqWXExeFpWN0tmZVlRUU93UFVJQWhJ?=
 =?utf-8?B?YXhqeGVEbXN2ek9NT0EvM3I2WkNJT3d6bk05WTV0NEdRVkdCQVB1eEVOK1VL?=
 =?utf-8?B?K0Z1QWd1NHltRmVvU2Z3eThBeVJsekpJMnNNREk2Uk5WbmV0ZGtSejkydGJ2?=
 =?utf-8?B?RVlVWEg3YVJSQThGTUMyWGNPQ01JbjVZNjdmcEZGemlsZEhQNGxCb2pzUjJ4?=
 =?utf-8?B?M0FpU09NTFRNcmNhdmFGQjR2TDhPNnZyeitlbnZvOXpzRDdCdFlqanV5Qkcr?=
 =?utf-8?B?TGJQc1RMODY5MkdDeERZOGNjQ2NERFdEdy9qaDNSRG9pM3dEOEtYN3Jzejc1?=
 =?utf-8?B?UVlRQTc2Z3ZjUkpkVHg3L1VSVmdYU2VxY0dHbk9QaE1xVG1HN2JoS1ZLRmJk?=
 =?utf-8?B?Qnh0dS8xL21tMzJsS3RxaE4xODBFdGg4dnNVbWFZYjVrR3U3emwxY1ZQcWtL?=
 =?utf-8?B?NHNEL2xqNGNPNGJVSjVVWWFzWW9RbENOdUxEbkhaQlUxck5xUHhKb2xSZFVp?=
 =?utf-8?B?cEc5SC81UDR0QjQ4M0Q5ZTg2RGtEWXM1cFE3K25EZ2tZeEMydjByeVpPRmhS?=
 =?utf-8?B?OE9nM1lEeE8zNm1UOVc5YmtIektod0NWN2lsZlRwM0VQdlhCN3ZVWXlWTEhs?=
 =?utf-8?B?eGwycEEwakdkQVpwZVBObHY2MURYV2hra2RhM1RkSWtyQlkxSVVQamNXbnVh?=
 =?utf-8?B?bHBzWVFtSG1xa0ptaFUrZFBwSi9iM0JsblB6VlA3NzJyWkd3MkRFSGw1R0Fq?=
 =?utf-8?B?UzY2WGlmY2VHQkRmTWJMTXFPMFRCWUxCMXdJaVhrbXI5UzMxZjJIY2tKMGZL?=
 =?utf-8?B?RitURVNZRGdYZ1ZiRTJUYjBQSUNxdnZnSkZ5d2V6M1BSSkZERkhXaG8yTkdU?=
 =?utf-8?B?dm5yNnU3RmIwdHNseWFFVVNmWVB1QVRaazcvVHU0Yi9KM2dkaE1IZE5BOS9Y?=
 =?utf-8?B?ZCtpTkx3ajI1VkljR3RJQ3NRSFdyTzNJSkJFdGtJakdGK29UeW5wZjIxcGta?=
 =?utf-8?B?bVdjVElvQlBiSzZYZmcwMmZUWkE1YlQ2TFcxVXlmeDVVcytqa3JJeFByeDAr?=
 =?utf-8?B?KzZGS2xXNC9NQVE5UzRmWHR3dDVOSzUwY1h1SnpvdjRTMXpRVzdmQklIZmZm?=
 =?utf-8?B?TUlrQ3IrVlF1UHdmcE9uRGRJQ0V5NGJwRzBWWUx0TWdoN1hTbi9tSnJPQWFS?=
 =?utf-8?B?NFJEL2FGaXNyQTl1akFMWXVJZHNRSGszeXBaMERlcGhYWk5qTnlGUEFmZTl4?=
 =?utf-8?B?V1k2bmpIbktJQjJISCtNamJsRDhHaFFncWN6cEZFakM5MVRrT3QzTk1NRWcx?=
 =?utf-8?B?RkhNS3dwb3RPd2tHTmUzSkt1ZXhaeFRxZXRQMnJxUm5tb3Fwckl4V2xsVjdL?=
 =?utf-8?B?MnljVXhIaHJDRExIWWN4Q2szZGV2eGxacjFIWVQwc1A4ZFNtVDhTZTNEZTVq?=
 =?utf-8?B?dzlCenY5ai9ta1hISG5NcmtlOHZycDcydDRZdWc2TVdvUkxNSjAwWjl6SUFN?=
 =?utf-8?B?YkNkVytCN2poNERidUpGVklUZXJpNTVIc3lpNFhIRmMrQzVObUtmMUR5bkdL?=
 =?utf-8?B?RXBPU0l6UnBCYitibElYS3J6cHgzbDN5STRiRWNOc3R4enlna3JWSzBsM01K?=
 =?utf-8?B?VlFTYlFkYzczY1ZBV25POTRucjFHVDc2RGxaMzYxbXJlblpmZlBHOGZTVTJL?=
 =?utf-8?B?cnRCVEdBL1pJMUdpUkZtZERwMkpZaFhRVHowbjRyVGpSRjQyaWF5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e7c9402-2858-4ce7-b115-08deafefc56a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:29:08.1119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDD5HGxKBl5voNJzKFUfMxHzbBX2MWkZhlHFvYh5lk6r9BvPr07LCZRrPEQ2svPY+6K4fssri6q7lBcfi0D4Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6776

Hi Greg and rafael,
Could you please review and provide your feedback on this patch.

On 4/27/2026 9:21 PM, Muralidhara M K wrote:
> Historically, sysfs read buffers were allocated with get_zeroed_page(),
> limiting reads to PAGE_SIZE.  Commit 13c589d5b0ac ("sysfs: use seq_file
> when reading regular files") transitioned regular (text) attribute reads
> to seq_file, which can dynamically grow buffers beyond PAGE_SIZE.
> However, the PAGE_SIZE limit was intentionally preserved for
> compatibility.  When binary attribute handling was later unified into
> the same codebase, the non-seq_file read path (kernfs_file_read_iter)
> retained this PAGE_SIZE cap for binary files as well.
> 
> Drivers that expose binary attributes larger than PAGE_SIZE — such as
> the AMD HSMP metric table (~13 KB) — cannot deliver the full content
> in a single read() call through the existing path.
> 
> Introduce a new opt-in flag SYSFS_HUGE_BIN_FILE (040000) that drivers
> can OR into their bin_attribute mode.  When set, sysfs selects a new
> kernfs_ops (sysfs_bin_kfops_huge_file_ro) whose .seq_show callback
> pipes the bin_attribute ->read() result through seq_file, allowing
> reads of arbitrary size in one shot.  Existing binary attributes
> without the flag continue using the legacy capped path.
> 
> Co-developed-by: Nayak K Prateek <kprateek.nayak@amd.com>
> Signed-off-by: Nayak K Prateek <kprateek.nayak@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
> Changes v1->v2: New patch
> 
>   fs/sysfs/file.c       | 45 +++++++++++++++++++++++++++++++++++++++++++
>   fs/sysfs/group.c      |  8 ++++----
>   include/linux/sysfs.h |  1 +
>   3 files changed, 50 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 5709cede1d75..be42c3c1e056 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -38,6 +38,45 @@ static const struct sysfs_ops *sysfs_file_ops(struct kernfs_node *kn)
>   	return kobj->ktype ? kobj->ktype->sysfs_ops : NULL;
>   }
>   
> +/*
> + * Reads on huge sysfs bin files are handled through seq_file, which
> + * takes care of hairy details like buffering and seeking.  The
> + * following function pipes the bin_attribute ->read() result through
> + * seq_file so that reads larger than PAGE_SIZE work in one shot.
> + */
> +static int sysfs_kf_huge_file_seq_show(struct seq_file *sf, void *v)
> +{
> +	struct kernfs_open_file *of = sf->private;
> +	const struct bin_attribute *battr = of->kn->priv;
> +	struct kobject *kobj = sysfs_file_kobj(of->kn);
> +	loff_t size = file_inode(of->file)->i_size;
> +	ssize_t count;
> +	char *buf;
> +
> +	if (!battr->read)
> +		return -EIO;
> +
> +	if (!size)
> +		return -EIO;
> +
> +	/* acquire buffer and ensure that it's >= size */
> +	count = seq_get_buf(sf, &buf);
> +	if (count < size) {
> +		seq_commit(sf, -1);
> +		return 0;
> +	}
> +
> +	memset(buf, 0, size);
> +
> +	count = battr->read(of->file, kobj, battr, buf, 0, size);
> +	if (count < 0)
> +		return count;
> +
> +	WARN_ON(count > size);
> +	seq_commit(sf, min_t(ssize_t, count, size));
> +	return 0;
> +}
> +
>   /*
>    * Reads on sysfs are handled through seq_file, which takes care of hairy
>    * details like buffering and seeking.  The following function pipes
> @@ -249,6 +288,10 @@ static const struct kernfs_ops sysfs_prealloc_kfops_rw = {
>   	.prealloc	= true,
>   };
>   
> +static const struct kernfs_ops sysfs_bin_kfops_huge_file_ro = {
> +	.seq_show	= sysfs_kf_huge_file_seq_show,
> +};
> +
>   static const struct kernfs_ops sysfs_bin_kfops_ro = {
>   	.read		= sysfs_kf_bin_read,
>   };
> @@ -333,6 +376,8 @@ int sysfs_add_bin_file_mode_ns(struct kernfs_node *parent,
>   		ops = &sysfs_bin_kfops_mmap;
>   	else if (battr->read && battr->write)
>   		ops = &sysfs_bin_kfops_rw;
> +	else if (battr->read && (mode & SYSFS_HUGE_BIN_FILE))
> +		ops = &sysfs_bin_kfops_huge_file_ro;
>   	else if (battr->read)
>   		ops = &sysfs_bin_kfops_ro;
>   	else if (battr->write)
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index b3edae0578c0..2d0b01c00a97 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -74,11 +74,11 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
>   					continue;
>   			}
>   
> -			WARN(mode & ~(SYSFS_PREALLOC | 0664),
> +			WARN(mode & ~(SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664),
>   			     "Attribute %s: Invalid permissions 0%o\n",
>   			     (*attr)->name, mode);
>   
> -			mode &= SYSFS_PREALLOC | 0664;
> +			mode &= SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664;
>   			error = sysfs_add_file_mode_ns(parent, *attr, mode, uid,
>   						       gid, NULL);
>   			if (unlikely(error))
> @@ -107,11 +107,11 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
>   			if (grp->bin_size)
>   				size = grp->bin_size(kobj, *bin_attr, i);
>   
> -			WARN(mode & ~(SYSFS_PREALLOC | 0664),
> +			WARN(mode & ~(SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664),
>   			     "Attribute %s: Invalid permissions 0%o\n",
>   			     (*bin_attr)->attr.name, mode);
>   
> -			mode &= SYSFS_PREALLOC | 0664;
> +			mode &= SYSFS_PREALLOC | SYSFS_HUGE_BIN_FILE | 0664;
>   			error = sysfs_add_bin_file_mode_ns(parent, *bin_attr,
>   							   mode, size, uid, gid,
>   							   NULL);
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index b1a3a1e6ad09..78f6c6252cf9 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -124,6 +124,7 @@ struct attribute_group {
>   
>   #define SYSFS_PREALLOC		010000
>   #define SYSFS_GROUP_INVISIBLE	020000
> +#define SYSFS_HUGE_BIN_FILE		040000
>   
>   /*
>    * DEFINE_SYSFS_GROUP_VISIBLE(name):

