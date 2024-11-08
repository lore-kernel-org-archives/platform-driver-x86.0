Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB6DDA8
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731049998; cv=fail; b=OlMd4SLk0WjubFejfKZ2zGLq7/x8eKQXsJXAuqJL5KKUVf9EyxZVeIhQRpPBjEOsKuVEtQIaYBvltHbamEl/CTQ5tIvBBAPf9DhE7QnDnKoJRdt/IBErKWYODtsdbzKo82Rh2aO6YrdoxZgWNCdH7ht8DIYctraAEx91d5uc0Po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731049998; c=relaxed/simple;
	bh=13whtE53U5VXtw49oU3lBj9DnLor+zLAs0q0unDnNOE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VLVs/DDRuPBAxBwmGGKiBG2fmZZ/0zy+bXLF1UQhGAM7NHSPNQSheZH4c6XtLiFM6IpxBLYHNUpqSOmciOHNadzGSK1ESevQwaYLzfheKMp/aUwtI5bliiWjEq75feQ0B57Vi9UcYhgZQOI2n9dIYy9K4y4AyUXOX86z+/VneUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wdBDqM56; arc=fail smtp.client-ip=40.107.223.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wdBDqM56"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAqcZfmLtcwwUvQSsyg788Bng6F83aNTn/XPVJlOpXyVEPjSotU0pvGXJv7k1Rk5WCDdnUkgfpmglbKUx2Y0B0i3i9AeEWb9xFg+KOPbNZR7VGZvT+JoMzcd9y8pAAoIhxuxhnDELIT8hAjx0SsvErxkvHaHja5PSoMup6BUz0W9R5sxDLxfLknkfkSIOTXTChnwMYrU/jcicdHbktkEOPIL4fxmevnEwlIkcHKR0lBPiyuei+0JHJ2nMHfVX2QG+0gF8fpGEBBch/bMb1S3l1Y6dzEwy1rx6mZvspiOkq/gNiSpZ3oU8Aji7aptKGHjWrZB7u+qypH+cjEYYeXvvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMgrvVCjKgqZWHemsIn+u7oR2pwPxWFpLHn2d4Tk/Xc=;
 b=cXmiBzrY1BE40/gUu9oILF/airmq/uc7voeX6hF2o6DadEMkfmdjWbG7BGgXmgCug1CZHSGO2WZ23rlaCpzk7EBPQ5yxl10Ehb1ewmVcFz9uzlZbYLwz8HBBSq+78HlkBrCyeKqENqcdn8UTkJSVs9xOqWSBON2lUN2Mr26iMZWUAoLxYulqJg30e6eSIA98Ss++3UN3PR+Y3XtCOJ8bTZeEI2rwSQamyXNx7YCBa2M8/+0R1TDzW3ibompv7PHbnpV9bpUcEZNEiijfnKkWiHBE8yWgHReikNgpK9q2PvBTomHGpb80+IC0meMehca5pkf24B/fhZ5FXCeJGlvFkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMgrvVCjKgqZWHemsIn+u7oR2pwPxWFpLHn2d4Tk/Xc=;
 b=wdBDqM56fkJuyFAWcrtQjmKVWw4iHv5AWnDSYNh6CdAMh6vOBi8xHz4ibqiyCCGWZNFUX6ukDeGu1MAn3dwGY2uaRAZlbrZpRJtjVC2DEOOVmqR9Tw1k63/QMNpm2C9OjFBqzC/SOrBoXLRkgI0OfN89jwHo2752u4vNkzDGO/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 07:13:12 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8137.021; Fri, 8 Nov 2024
 07:13:11 +0000
Message-ID: <1c6a5ea8-742d-42c1-8687-20927a5ba2b2@amd.com>
Date: Fri, 8 Nov 2024 12:43:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] platform/x86/amd/pmc: Updates to AMD PMC driver
Content-Language: en-US
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::22) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dab354f-d95c-40f9-a29d-08dcffc4cde1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?allzbTlRMURORUZmeHUvaVlOSzZ5bnAyQWhGeGV1Yzl1UG5RTjQrUVJod1ZR?=
 =?utf-8?B?R0V0N0NsODZZT1prYnoxc0ZVdTdIOTl4SGFmZWIzR2JuWE9DMkM0N3pOZll4?=
 =?utf-8?B?Mlk4SHBHN1BockJqMEhOaFBibitNRDNiWHZUV1loZW1FU0swTGdpclFTREd0?=
 =?utf-8?B?dVA2OGQ1dWJXOGlpOXpZbEdPUnE2WENvVUNBSHNndHBGZnM5cGhLWlEzTDZZ?=
 =?utf-8?B?YUs4azNNY1Q3T1JITjZ4R3pxTURDcWdkRlBUY0NlUHB0cW85Z2NwUWVHUXVR?=
 =?utf-8?B?dGZ5bE5tR3d2NGFmS2FwbTBaUzZUaEcwcGltVXZKQ205Y0J2TEovb0NZSzB1?=
 =?utf-8?B?c2FkajVWRFBVdnlLc0Q2ZmFZd3Q5cjBzSmt5NEd3YVN4ZTlxelliUW5ITGRt?=
 =?utf-8?B?ckgxZEY1MGIwa0JBRVg5SUFJeFQ1OS9DbXIvMWJpMlpST0x6Zk51S1JUTURv?=
 =?utf-8?B?VjZyRC8rUmVMTGtpd2o0eE11eXJIYmY2bU5HYkMxbDYyZ1JFRGljbFpSaEFk?=
 =?utf-8?B?YXduZDU1R3VyZmdOS1kwcEVsNjIwbS8wRkk2cStJNDR3WDBoMzZrQjQxT3Yr?=
 =?utf-8?B?cXFUNEZKL3hrRkg1eU9qNFVhejBqZDloSmsvQWh1ZE1LaThJT0hoZ1VzSHBI?=
 =?utf-8?B?RDNOU3dLbjhSV005SUlCQk5SdTJndjk0VlJNNGRIbERqcm5XcDYwTjRENlFv?=
 =?utf-8?B?dE5CSXQycmJETnRiNU13LzBVTkpUdWtLYVRqOVpydkhTdnZQZlpSeHdhWGsz?=
 =?utf-8?B?OVBVbGluOVZrQUNPcFhLalNYYlBEWUlXamJjb3dkNU4zODN6dVBnMjlKSUpE?=
 =?utf-8?B?LzlieU9WVkVkYzY2M25rOHdnUTR6OHp0a2hITEg3cksxRmt1NTFmazlaT2Rz?=
 =?utf-8?B?NnlJc0JTaDBuZVR1dUV0VU95ZnVHK2RRdjFuV1ROOHc5Nll2QWhUVUlUU0Z4?=
 =?utf-8?B?MHdZNDBQZElrU1drZjdlZnFYM3NHM3JhalIvSEthQnRnYklIdDZZc010MnFy?=
 =?utf-8?B?ZjQ1ZUZiR25lVXloU1BYOEptRWtOTFkyZjF3MXVnUDcySGZ2WStIcHpWQitm?=
 =?utf-8?B?dUFYbGluM01DZEtaMU1YVjFQNFZPanJIZExJY0FJa2JvWi9CbFRxNGlMS0p3?=
 =?utf-8?B?S3lkWmoxODNML0l6QmF3MzJ3NWhsZ0JQYlBnS3pHYVhsS21HeXlYUWttZENL?=
 =?utf-8?B?bU1ncTNMM3ZnY1haMzlDNXBFWDdYQ0tkVk9CZVhPdE5oWkhsN0V5dE1TN25H?=
 =?utf-8?B?Ynd3MzRvVmhRUWg2V0JhTmtscjBjVkk4L3BUbVE5aklvSWNMbkpzaUk5UFVC?=
 =?utf-8?B?L01zQzZqMFFwbVdoYUViVDIybW5IRGRVQ0o2M2c1cVoxTWtsWTNaUWNEaUt1?=
 =?utf-8?B?bUlycUl2ZVVTWEt3TUVqOTdERGx3Y0M4eTR3QTV4NTBEWnJDMDlxM01PNEpQ?=
 =?utf-8?B?VVJFM21BQ0tqeWZBNlA1MzVZcVR0ZUp2bHVuVWdzdGF6S20zdXZ6TUdyRFN5?=
 =?utf-8?B?VUxxTWRxSXl5QjlyNTJXbGJUS01CcjQ5d0Z3M2ZPRktxUFd2SWUyK1BjQkRl?=
 =?utf-8?B?cEtuRVNUWGZnclBrOVMrMjMvYS9INUlMSDRETUxBYlpJK1J2bEt3Y1FDMHVL?=
 =?utf-8?B?bkZLbUw0ME9JakVlQjIrWHBNdEQ1RkU2NHB2OUk3TGg3MVZWa1M4MUJFd29X?=
 =?utf-8?B?LzBtT053RzNTZ3oxRFFRZXBPWlVwZHE0eVVzTjdYQzloSk5NUitpNGxkYm1j?=
 =?utf-8?Q?WHB2Uea3mPdxJfK5i3slEeBccZfDGxTpiLyAiSD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGh3ckFoSTBCWkZQdjhDUVUrZXhObU5DVEtISzdXUmJSd1JubHBNclc2VVBO?=
 =?utf-8?B?bFNzZU50OVUrWXkxU1dWdEZKbHdhd3IyNFlwZlVydFhHRDRNUlNzaE9aN3hq?=
 =?utf-8?B?YmZXNWNkU21xMlpxQitXUzh0eG1vSGQvK0UyNlJGY1k0Tnc4eWVZeE1ITXBZ?=
 =?utf-8?B?V0JkY3hOTWtWSm05alV5TUNZWFd4R2xRcHdOVUp3Mit3VTg3L2JCMzRGT051?=
 =?utf-8?B?Mnd1YTBIR24zeUNaZkFINGVXN3dSSE5LaEJ4TmkwdkdVT2hSNXBlUUpQSEJJ?=
 =?utf-8?B?TEM5UGVpa01uTGViZ05xdkRFZmdEdEd0SWc2aFUzUE1helVsZER3cUgrYnhl?=
 =?utf-8?B?R2JVVlJMUHpRZ3BqQzBmMm1CaFNiNTNOcUE3U2h0SXVoYTJUajNzSVZUenpl?=
 =?utf-8?B?TmFDZERpTXBKNXNuYkNpQ2VrdnVabFpKbDkyUkx4MjkwK2ZtcDBXREszTXoz?=
 =?utf-8?B?YnVtaDBQV1ZCK1dBTHN5RFRsM2hERmg5NE9BTDRleWszK2lyZlhSRXhLZGFE?=
 =?utf-8?B?V0VBTzJjK1NES3pMUlBVaXpRWHJXMldNVGJZWjJzQStiQWdwQmpmUGU3OXdB?=
 =?utf-8?B?bzBXOUVLbmlVR05PQ2xTc09EL2xmSE9vMzBPay9oYXdQZ2VuVksyTDFlbnhi?=
 =?utf-8?B?dVdnVThZOU4xakFDbUFrV3I4UXlkdm9HWTg1ZEZZVFRUQlgvb3ZMOXZJSFEz?=
 =?utf-8?B?YU1QcWRsQVVzTnF6RVdqUkZMTGQ0Zm9BMXdSZEdoV0Y1NEJRZktLSll5SFM5?=
 =?utf-8?B?Y2ZhU2JRVEhGMkkxQlJheXVQNlpUQVM2cmhQaStMN2VHWGRIK25TVmF5cFdu?=
 =?utf-8?B?bFlmanliWDhnVWIwZVY1NVlNYzBMM3ZUeXpZT1E3RWZXcWU4U2hpcTVIZUVS?=
 =?utf-8?B?aWJWYUQ1UGdRQlhXSWtOZzk4L1VpbmlNb24ra1NGeW4xRHQ3TWhmSHhBM0M4?=
 =?utf-8?B?UjFHOFlVYkwvWkJPRVhibkZXQUthelgzUUFjTGNwVE1WVVk5dEN2bTRSOXFZ?=
 =?utf-8?B?TUY1Yno0aHJDeWVTdVR4aG5ZSXBHL3VtellUcnJSVWRhQlVUZ2Z6YnNVU0xH?=
 =?utf-8?B?Mm5wSXRjd2dSVkg4K1d4VzlaNldFbUtkaElDME4xS25hbkkyQkNVc2NRTG1T?=
 =?utf-8?B?NXh4WEVPZDRLWmw2VXVRT0VIMkxjWDVURnZlNkNGd0hwZmxFcU9aMGdQUDNR?=
 =?utf-8?B?cHhaNk1oTW1FOVRzRmd3amZiZ3lXUjd0U05oRzlYOXRzcmFKT084d0lLdkdT?=
 =?utf-8?B?WXlrMG9kRm1HOUtwOHRKanZEMVZHcmUxUEVPb2xKdUxoblVVbkQ1RWkzS1ZV?=
 =?utf-8?B?aXY1VFV6cG9Gd0RzS1lWQXNjN3pxalhIcFA1alcyWXhFbGVPY0NvZTZ0ZWpz?=
 =?utf-8?B?M2VscmIrYm1lZ01KZUhSeVhNenFOZ3ZDOVZLTGh0Y3NkNnV1ZmYrTzhtQW42?=
 =?utf-8?B?RXR5RmVtaVVXR1ZWQzJWbjZRQ0xKeGdtRGFtL2ZIZUpVeE4xa3o2Ty9BRXV0?=
 =?utf-8?B?K3JSOVZSOHlqcjVES0VEUGZjb0dwdnFhOHRPenVRUm1ZY0ZlVUdUMEozRjlN?=
 =?utf-8?B?ait0dHJ5TEJodmJ3VG53dmJxVEJYbHEzMkFUb29qNEh4TGN3RVhIRzZybGVQ?=
 =?utf-8?B?eCt6MmFxVFpEc0ZuMjlKVlRPeDBQVzhTVFA3R2JMU0k2VDBPT2NBWndaU29I?=
 =?utf-8?B?Sm02bGFJeXoxcDBIRUdKSVE3SDVPcDdSL056TStZWHhXcE1NenZkcG5NQ2RX?=
 =?utf-8?B?dVJxTTJCcytFblU4b2wxWWVTZlI5bG5zSnN6Wm9Mc3dMaGdiSUJKblhYU1gw?=
 =?utf-8?B?S2cySzVYWEJQRGRqMHo2ZGQrSDFOcXpxeGpPU2tTb3lUbDlac3gvSEVnbnJQ?=
 =?utf-8?B?cWZ6YWZZVlFNYmZaR2VWMUJ6aHBGQndQZW16UVRJQWt1U3M3YWZQeng0OFVQ?=
 =?utf-8?B?cFZaVlo0NjJKK05WWHdEOUpNNHR3aTFlNVQzRHAzUjdxK0Z3OE1hY3hnRnBI?=
 =?utf-8?B?V1NaYURBZXEra3ZsZFVHKy8xZzhIbjZBdGk2UnhJUmJmcVQ5S0kyQTVueGpa?=
 =?utf-8?B?ejgrdjJxSGFsZlZNTWIydlBHNkJZWUsvdTd0N05NQ3lqbFBhWkRrbkJnVURp?=
 =?utf-8?Q?4UGVw3YQG3ytj7w920TbOE8JO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dab354f-d95c-40f9-a29d-08dcffc4cde1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 07:13:11.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hl4x2sPIyWBzcjU3elXyHuXF80q6rYK6DC3orDtNELMsX1bRFB9UJF0TEW4Ss6cQd1cbPnxAMARAo0zFqXixuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600

Hi Ilpo,

On 11/8/2024 12:38, Shyam Sundar S K wrote:
> Updates include:
> - Rework STB code and move into a separate file
> - Update the code with new IP block information for newer SoCs
> - Add STB support for new generation
> - Add STB support for Ryzen desktop variants
> - Updates to MAINTAINERS record.
> 

Note that this version is based on mainline (git head: 906bd684e4b1)

Thanks,
Shyam

> v5:
> ----
>  - Merge patch1 and 2 of v4
>  - Update Ilpo tags
>  - drop explicit typecasting.
>  - Use switch() for getting the message port
>  - Rename function names
> 
> v4:
> ----
>   - Reorder patches as suggested by Mario and Ilpo
>   - Squash patches
>   - Update tags
> 
> v3:
> ----
>  - Split patch 1/8 of v2 into two more patches
>  - Add helper for printing S2D/PMC ports
>  - Use ARRAY_SIZE() for getting the number of IPs
>  - Address other remarks from Ilpo.
> 
> v2:
> ----
>  - Add Mario's Reviewed-by tags
>  - Add amd_stb_update_args() to simplify code handling
>  - use cpu_feature_enabled() instead of root port's cpu_id information.
> 
> Shyam Sundar S K (10):
>   platform/x86/amd/pmc: Move STB block into amd_pmc_s2d_init()
>   platform/x86/amd/pmc: Move STB functionality to a new file for better
>     code organization
>   platform/x86/amd/pmc: Update function names to align with new STB file
>   platform/x86/amd/pmc: Define enum for S2D/PMC msg_port and add helper
>     function
>   platform/x86/amd/pmc: Isolate STB code changes to a new file
>   platform/x86/amd/pmc: Use ARRAY_SIZE() to fill num_ips information
>   platform/x86/amd/pmc: Update IP information structure for newer SoCs
>   platform/x86/amd/pmc: Update S2D message id for 1Ah Family 70h model
>   platform/x86/amd/pmc: Add STB support for AMD Desktop variants
>   MAINTAINERS: Change AMD PMC driver status to "Supported"
> 
>  MAINTAINERS                            |   2 +-
>  drivers/platform/x86/amd/pmc/Makefile  |   2 +-
>  drivers/platform/x86/amd/pmc/mp1_stb.c | 332 ++++++++++++++++++++++
>  drivers/platform/x86/amd/pmc/pmc.c     | 377 +++++--------------------
>  drivers/platform/x86/amd/pmc/pmc.h     |  22 +-
>  5 files changed, 424 insertions(+), 311 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/pmc/mp1_stb.c
> 
