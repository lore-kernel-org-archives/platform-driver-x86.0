Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130C83F926D;
	Mon, 10 Aug 2026 21:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786398774; cv=fail; b=uT30A/LsN3HdCouRXktF2k/Ewbxa5cS5AlOdrZcDZrO2cQTfLGS+C68z9sTffZj68JU7JndMwvh1J44DOoclHRArNjgsM1Z/GFwSSOZE2CuyBz5Xh9HR18tvr3zFsJdnmiQaomdowCNY5kQwoEtwsszoJPNgwh92Lgffg9hZHXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786398774; c=relaxed/simple;
	bh=fLxrpj96Rl3i0g8ASoSWS2fa4TZf5yC6lFjb8KK5g3U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n5DxheVuryyDpeyCLolYA5UU0bdU+BAUvWPu7cL9ByhbIKXklQNt22XavuSGeXfFV1zWtvK+iH3O3d+0vVp8s3mwlYAhze/JvP3bI0CBKU5s57AXwjQI1aRJv6fxver+FEQlKYkdPxUuxcjDs6l1jAgC5M47HimT0C+1fsXLfKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xe1qVdj8; arc=fail smtp.client-ip=40.107.208.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xe1qVdj8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnOZUIjjSp2KRL+UqB6H7XJ0URl33HmiSeMPzCX6o5Zn2hDzpusIawSb/jn7abUhyGAKT4G0+vgorOG+nv/Oz2gy+meCN/7/c4v6jmFNC2YnCeHSCtVNL6usKqKP/T3p/8dd3hF4FKWOt7DKAhAgvKlAcNdIDLxeSsBZEr4ogKFsa813869rhqDJHJz75zbYJDgyUIUQibHK16dUQ12yPtHSOfDFaWfRe5GKfrxOPOBca/3qJXGS7/Yh6OpOjt85ESwL8XUTg30VgZ2iyt7/c/d9lO15v3KgQzxlxdXAS+jkRp3Bv34RrrW4jl162vCv2nna9MsbxIKrAFPHV4o0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8WxRHCjUP/7ly4S7wgmBAO5rUUYWKu3Dw956qicXK0=;
 b=P1qZe2YEq8sqH1tzqRc7Vw7XlKu5Z5NprudEbvRZ0yGif6Q5OEm3hf67wVjnyUY/Xury28dA356CI2qPmDqrvGuVxEe4cOOMna+NYISRHqMa1tUDxIuQlzRf6F8R7UUvPfC70uBTOfe7sFM5jHbOckFUUqLYO9DySlv9EKKHSeWoj6vXC/cb7QZiP5kE1SnWU6X6R3nFXEBBaAVogkZN0LscXVovbtMA8BkJGECqsw6Hkh6sWED3DEsNquEni0r+jc/sVtcsINVFIr+8aNUcieIanDkW+iDa6Hc+wWLB/SshxOsgmFulrRpNA2ltCcu8O2R1Dedy0RM2f26M/gtF6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8WxRHCjUP/7ly4S7wgmBAO5rUUYWKu3Dw956qicXK0=;
 b=xe1qVdj8lCqbPEZPNjglWq+G4g71PIcP5isUKtJpV0Xj49gMdnviaiScrR4+zWK6BaDXKg/NORbM6SHn/PNR9aIA8ucDsb7sDOYqgUGO2mTooIrZivw1EhUkrU7Ml2P8FqiRf4msSCb3OLzABowJ4jBm0I3cM/T+emeOnp6vQa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB8610.namprd12.prod.outlook.com (2603:10b6:303:1ef::18)
 by SA1PR12MB5672.namprd12.prod.outlook.com (2603:10b6:806:23c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 21:52:47 +0000
Received: from MW4PR12MB8610.namprd12.prod.outlook.com
 ([fe80::67c6:7360:f51:dc2b]) by MW4PR12MB8610.namprd12.prod.outlook.com
 ([fe80::67c6:7360:f51:dc2b%6]) with mapi id 15.21.0292.022; Mon, 10 Aug 2026
 21:52:47 +0000
Message-ID: <7ad7533f-c55c-44ec-91a1-53153d632fb3@amd.com>
Date: Mon, 10 Aug 2026 17:52:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: Fix NULL deref in amd_isp_probe
To: Xueqin Luo <luoxueqin@kylinos.cn>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: pratap.nirujogi@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260810032450.692844-1-luoxueqin@kylinos.cn>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20260810032450.692844-1-luoxueqin@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0073.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::10) To MW4PR12MB8610.namprd12.prod.outlook.com
 (2603:10b6:303:1ef::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB8610:EE_|SA1PR12MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 58538149-7fe4-44e9-504c-08def729b747
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|11063799006|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info:
	WqUlKcS6Z+QEu5tbGj+ReYKDVUWC5BuyryqMhUWccuSW4ZteNo7pXoeXQs4cVbxkSejTtAVIBKWsBUk2gO8B9gc605zGpHQ9rmOQEr1Fj/A8Vmics7gXnDKkeqYbmViTtUy+8DyaLeV1nT+j+//UmCPlsIDHQbDGXiNaQ0bz+kO+ejB+z+Fan54jNZxnuCqVIFiSudz8sDEs8pH1/zMstfJgJjEQ+2AunGhBqvO4/ZD7wmhUK30h2Vpp4ePdlmlynvpemYTCqu3UW3ct9QDPgzfZVvxZqmgFaX8jsjoJVj4/VVi1ASL7fuFtrJ5xn/O6IutRyqLLuAoUHxdIg7ia9Ij91KksA6WY6r0gbySgBwhRmwFqLtyQs1Y0op1hbalLqIbMS3Vn2xTqM7saTjoem84/3+C3ZQEm0xEO+DCN/3l8sPP4GTXfc0jubvbmFez/0htkdigpJUI/KqoyavkT9KKWzL0vRIPWkBIfOySXv2HB/q+ILqk9bhUJj6YQmfrY4egoXCEWSwOOornEqfl0XKrChTAhfC3SfpN4EGK1U/BsZPyRBCHzfOU6gzl6bLSEtpjiMPvCo9Vyl7AzZOtZrWLf/3Zn86DhwydyaOsALoF9BC51XhRbcamg6Eomzb610cThIM2BjYQNGBAQ6nmETEVltOVcvPAzI7t48+G4LSk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB8610.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHpRc3ZyekdlL1FHOXhSSkdCU1BnWVV6eW9VWmpjalV1c1dzWCtpS0VSeXpO?=
 =?utf-8?B?SEVsTnZxQTNuK3k1TFJSN1JEdkVicTErNnp1dTVCVGtNTWZCNDhPMUR5MGZB?=
 =?utf-8?B?TVJVYkxkSS9MU1kveFZZTTd5eVNTa1RCSjZ4eWJEV3UveThYNXRzeXFsUmFh?=
 =?utf-8?B?cXkvUzY0OW5UNDRMOHZheDBLRXh5YVFWcFRrUERKaHptd1NIRXMrd2wyWVNn?=
 =?utf-8?B?a2FDMjY1K1daSGI1azRGd2syZkNpeWVxK0Y1cnMwYTdSTlNwVVNWUzg2WFF2?=
 =?utf-8?B?MG5YWklEbG1qQVhRU2VvZVM1UU5PejIzTGNLd0ROWUlrbHRWN3g5V0dMcjNk?=
 =?utf-8?B?WEFaNkxZZXZNODhnMGlNUDJKTVk3Z2hXYXR1b0hXbldGWVZsalFUazdBeXE4?=
 =?utf-8?B?U2FxdjRDb2ZONEJHZmpCL3ZmYk91U01jSlgvdlhpdElwbXcwK2JFRzNlZ3pl?=
 =?utf-8?B?bGlDSDc0KzlkOXo5aFhPVHQzQzcvOWtsRGJnb3M0VkUrSzZ6bit3Y2llcnBo?=
 =?utf-8?B?M2lMTzQzRnBsUU9rVDlOZFFGYkVLMzFISDkzdVBoN1JMaFh4Mzc3Y0Z2Nnkz?=
 =?utf-8?B?dlkySXdNRzZUR2dhNjhHNFYzZGFZNmVzUlg1OWVqdEFJcHhNV1Rvdmp0dElR?=
 =?utf-8?B?Z2hYRTZtSitzSlBDQXB1d1ZZV1lIRGx3dGRVeWtETTZpTUJPSkh5VjFvSXZT?=
 =?utf-8?B?NlF4b1IrVGcwNEo1SlpIcmpucm5VdXVaYVBqbDQ1RktRRktTWVB3ZkNkNjRs?=
 =?utf-8?B?djRDdGRLWjFBOUpaREJyeUlIZDEwSy8xRzBYNFh2WFMvdmQ5UGcvQzJNaHJT?=
 =?utf-8?B?dWhPUjNoR2F3SUY3MFBuZ0RQVEtQL0tXaFFLWFphNWVtbDRwSFZtOFluNmth?=
 =?utf-8?B?Rk5wZmFZZ0hGT3RDYjE0VTk4TVpRdFhwaGRHd3lOWm1MRXpRYURrdUtwWWNS?=
 =?utf-8?B?UVZpQ1FydGRXMkE5Q21mSmt2bWVsY2lJbk5KRU9NbHVzOGNqVnU5Z280Um5H?=
 =?utf-8?B?SUpyeXZOWDFIa3hNc24rTW9hd1VYaER6S1NVZ2FNMnh3U01kQnpsdDVOUmsy?=
 =?utf-8?B?MTdNcE9WSzk5NWtabWlZNk1YWmUvTmQrMDNRUEV1TVYwcyttVGpBRVluS3Bw?=
 =?utf-8?B?YW9BTWR2QzNrSENiNjkvVksxbVEzcUJpbmRnZnAyaGlrVk5vRUh4QTd2eWYy?=
 =?utf-8?B?Y3JHVDA0Z0VFYnVjOWxKNlo0dVd1OURJbnRaekpnbHFzKyswYmRmVWdSS0Ux?=
 =?utf-8?B?dmRYYTRkL2RIWTd4N2huWXkyL2VlVWV2Ulp5S2kyN0xqY0ZscEc2cEJOYlBz?=
 =?utf-8?B?Qy9BU1ZZdStTTWtpMms4VG5id2twZ2RrM3dnZiszY2I1V1FVM2tkaERYTkdx?=
 =?utf-8?B?d1JkVXQvK24zbTZzZTJURHpxVnZ4T1JwSWlTeFUwL1lHRENwc1JjSmhUZDl4?=
 =?utf-8?B?dEptT1QxZXNXV2Z5aVdjbUx6NXJWRzNMRkZXQkdmYk1lRzZUT3pPKzJ6Mmd1?=
 =?utf-8?B?TFptekdzVnNrKzdoYWtPdGs2SGNZaEZSbnk1UlFpaC9IOUdwNTNqQkRmbFlj?=
 =?utf-8?B?SW9hV0hFSit3K1dNSkF4NU5XeGw5N29YOHBoQ0ZRQ3Z5QVp3VXFMVFlBekNw?=
 =?utf-8?B?dU0xTkJiNkFMeFNwOG96Y3JCNFlIYUl0VE52WkpiTnczT3c4aThYbkEwdjFP?=
 =?utf-8?B?MmkrYUI5MXpVQzlGR2VNS29Vc1VldmFYUjRqTk5oK3RHSCtOdm15VUx6NDNP?=
 =?utf-8?B?c05DblFocys0ZXFkNldSTXZvYlJ6UlNBdlRDay9QcWZ1b3NjY2grc2V0UDFE?=
 =?utf-8?B?NnB5dWxyeVpwdnJJbytXWEpUWVZRUTJNUEl1TTh2UE5IL1h2TTBrcjNKNzcr?=
 =?utf-8?B?T1lXMUpkRXBCSGFOMHFhcXdiM1k5S0RGSkFxdnNHUHZrYVVIR1R6N0V3YVZP?=
 =?utf-8?B?cWZtaWVNTTBMR09xY2JVM1VCNmx2dWRUME9BK3FobFg4V2ZiNzJSUUdYTmlU?=
 =?utf-8?B?YWlyZDZwSytORFVmd0ZYUE11T0lDTlhPR1FSeFVlYTRKdnpzN1RzMjBxVlVz?=
 =?utf-8?B?NFBEWjVUYWtpOGtZejBoUHlvaE5NOHJNVlc5SFdJTFJuclNlcS9wSEZkcGlO?=
 =?utf-8?B?OTg3eE5uQkZ0WTZqamhKOHhrbk04bVNKa1h3TmN3dEhUNks5WDNoRmpxMG1G?=
 =?utf-8?B?N0NjRWx2YUdHenJLTkpvN3lFbFZZWk1vQ1cxbEwrMzFYa3IwT0dkbU85eVNh?=
 =?utf-8?B?cWIydmVNc0YxMyt3cW44Q1Y4bFNWTHp1ampNVHg3K1RLSnpDZTg2eExjd2gr?=
 =?utf-8?B?N1JOTzg0aGdpamQ0c2lYcmdGelI0Mno1K2dPekZleGpxM1AzUXpjdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58538149-7fe4-44e9-504c-08def729b747
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB8610.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 21:52:47.6289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uj9iCK/ma74Zw8tIWatqCLgvVxjiXfkW92XYyr5+e+QkYBlszEigFZNDUfMisCYht2Y4yyGzECJngOPnaPIlhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5672



On 8/9/2026 11:24 PM, Xueqin Luo wrote:
> [You don't often get email from luoxueqin@kylinos.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> amd_isp_probe() uses ACPI_COMPANION() without NULL check. Add it to
> prevent crash when driver_override matches a device without ACPI
> companion.
> 
> Fixes: e1af6f0146d6 ("platform/x86: Update swnode graph for amd isp4")
> Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
> ---
>   drivers/platform/x86/amd/amd_isp4.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
> index 0d494899502c..0026d6663c5c 100644
> --- a/drivers/platform/x86/amd/amd_isp4.c
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -379,6 +379,11 @@ static int amd_isp_probe(struct platform_device *pdev)
>                  goto error_unregister_sw_node;
> 
>          adev = ACPI_COMPANION(&pdev->dev);
> +       if (!adev) {
> +               ret = -ENODEV;
> +               goto error_unregister_notifier;
> +       }
> +
>          /* initialize root amd_camera_node */
>          adev->driver_data = (void *)pinfo->swnodes[0];
> 
> @@ -388,6 +393,8 @@ static int amd_isp_probe(struct platform_device *pdev)
>          platform_set_drvdata(pdev, isp4_platform);
>          return 0;
> 
> +error_unregister_notifier:
> +       bus_unregister_notifier(&i2c_bus_type, &isp4_platform->i2c_nb);
>   error_unregister_sw_node:
>          software_node_unregister_node_group(isp4_platform->pinfo->swnodes);
>          return ret;
LGTM. I agree that adding the NULL check is good practice. That said, I 
believe it's not strictly needed as the device_get_match_data() in 
line#366 is expected to fail if there is no ACPI companion.

https://github.com/torvalds/linux/blob/master/drivers/platform/x86/amd/amd_isp4.c#L366

Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

> --
> 2.43.0
> 

