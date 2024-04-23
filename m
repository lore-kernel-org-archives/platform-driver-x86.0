Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFF4130E32
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Apr 2024 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713892661; cv=fail; b=jBMTPftg/joBfNioKxFYdl9LVsri2BPXEgYPzlwACqk9CNjmLUTnL/EYzvD1UFqyEBS5DcZJhpeW5I+oMx6wkVEi8TQ+k+8GomPE2tM7FThx4891zQW16O8FaDg25zrA7V/JxhWXElF+GNXompmG5drk/30z+SH6slZ4q+idg5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713892661; c=relaxed/simple;
	bh=G8aTa9uLzyTXIaB7zs3KbuHV8f2Q7pXT9y1dZJvqrws=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jiaCuYjo1801yALtL2TFgvkgkYvOUCOBTIfTLni6QUIJume5QuQyCHw26/PXTO8aH3odI0jvSku7CaL6sLBoLZqff8GI8FuqcPvl5frSriAS5YmvCjXXnFWXnwhvgPW/YC+8hJz8OhwUXoYs+/paWbQosZH1BqXYVw+uIeFhazA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f38Mbpdt; arc=fail smtp.client-ip=40.107.243.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f38Mbpdt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgPQc6nPRvgkk0fWegezD0vfGdI/bs4TPlhxEe8ohgt2h46858abLC7ztUA+Hg1P0sIQ96cbuCMYEFbAJ1aSAcb2+AySny7+XmRwiKXzBFReYy1i9pIBYaikM4kyFbf9gQuNiFTrrxwr/oDcqGNBoa6PgRsadoxXRDUm0ZpE1TpuLkYGLESMoinaXfmMYZN6wlCsSJzlCCAQwaW+i5AWNobfbFBDD14JaEksmx+wCOzXO1w3mbt1P//T1p0iz9iO/NmL/+xtKcHzuFto2JKcvh9qJZjbZF9d4CWdGv5wOS8kakPz1MxxBG+xkLAYNf/J3fs3GRST4Hf1BniKXChYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAKEKB2rKyPqPGviqkE4pUJxfhJccq78zAYJRhDY68Q=;
 b=jhp9f7ouG+VJpewfBoTQetUh6US3ZNmJhJhGvRsdYLlNoT60fRuEpKjMnyllO5kxykOBiGfn35QTScWrMN8HBb5TPk3un1NrDq0XFPpBHiYRR4++wxT/HIIRE3TWvXPlOa2Am2q+cdjp+kW3TD1ia4SJ3LWx//C/uEnK7XkkODQevinNK0H5BHNb1k/GoqGn5zXt3UOK3hFmC26Haqa7oC88Gradykl4vuymjdXkqBNa49eICRX6+l1ufDC4yQOhVYmbMet3ZUQNRnoZdtvgibCYIhIvraXI6mFcJlr4S8GR1CukV/ZWRv2QSTXcp3/yRplYreYbexe2Orc9t8khLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAKEKB2rKyPqPGviqkE4pUJxfhJccq78zAYJRhDY68Q=;
 b=f38Mbpdt0MUjlzjgif6pbjlWtmLkYtjc+zfTCePTMgpeDIru4N5XCmU+cMdqNO/uWmINcMflJhuA92VLZBe8rJH7XE9FO4KcbeadHwkXkH7zUIwyOdLulCfeh79mIsq7jeHYtD2VVKj8u+A2gp2O7cBrOFDHIs4HBsPh7AGNZzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 17:17:36 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::d9b0:364f:335d:bb5b]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::d9b0:364f:335d:bb5b%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 17:17:36 +0000
Message-ID: <aeb43442-a9d0-48fa-84fc-ec7ee773ee56@amd.com>
Date: Tue, 23 Apr 2024 12:17:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86/amd/hsmp: Make HSMP as default m
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240423091434.2063246-1-suma.hegde@amd.com>
 <20240423091434.2063246-4-suma.hegde@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240423091434.2063246-4-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0155.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::10) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: b0124fae-4947-4ce9-5681-08dc63b94542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bm9vd2lZZnVVUXBLbTA5YldibWxrM1JCQkdoaUJrbEtyckVSdDV2emlFcW42?=
 =?utf-8?B?Y3o1L3pZSDV1bGc1N3hJTWVJaExkU0p3WnNPQ3A4L2xxOE43cnVpWE90SC9X?=
 =?utf-8?B?RDVrVzhMakU4WDZrcFJVSXdjTkxYUWNJMFlEVGlhdUg3TnQ5a2JaUDF2YmhF?=
 =?utf-8?B?VDRDSEU3QzJFWmFXSE5hRDdsa1ZHL0UrNVZVKzFPMjU3MjAvN1N0YmhXTHVx?=
 =?utf-8?B?Y2cwL0g3ZkxMT3dVNHJzQlkxMUhJWTJ6dnJpL1YxQklsaDhWeW5MK2JXNzJq?=
 =?utf-8?B?QnllL2ladVNvODNqVStodG1SRVZkSHp5eFk3Nm9zZHZDcVJIRTVBajlLSTBi?=
 =?utf-8?B?SjNGMlpPa3VxY016VUpMUktudTJZdWdqRmhXdG51aEEzdWZWU3pzenhBOWE0?=
 =?utf-8?B?WE01TjduVENZc1RyTVF6NE5aMFpGZzRFUldET2U0cWdMU0gvZ0FOdzlucHdp?=
 =?utf-8?B?VU9LY3RuTnhQbnYyczhEeDFhZFFxSlB5Q2ZETjRxRmlyZk5vRllVSCtzZm9S?=
 =?utf-8?B?RHNiSlNIL0hoc1FKakZvUXQ5L1k3d0V0cVJ6UmRkaE9FMEIvRWxlY3dmekxZ?=
 =?utf-8?B?ODFNaU52NTg1Yk41ZEczVk5qMUdsdnpWcDdOTW5zRktXWjQxNE1JT2xoU1dz?=
 =?utf-8?B?aDNUS0xCNzRrZkJsNVNVdUdWbTBGUmNRT0YzWER3bW9HenIwN1VSZXZmYXNM?=
 =?utf-8?B?ODZxMGpMWkwvQXcyTTEyUEZXNDVFTDdhd1lvcUMyMFJXNnlHeEN5NnA0ZGxp?=
 =?utf-8?B?aWkrcDZRb1RHdFdJL1RFVGlHSkxDMEVhU3Y4NlFZTnRYZFJac1NoVExpOHFm?=
 =?utf-8?B?aTVESWpKR2hINnBCeWp0MUhMQXd5Ykw5OGU3d0xKZmZSZzkxd0VDR3BVaG0x?=
 =?utf-8?B?UWJwNm1EU3RpSG5QTURWSUZVakg5UU8wSXV1Q2hEZW5RVkpkVGJYUXVkdnF1?=
 =?utf-8?B?SEZ3ak50c0NvSlhXT3NleGlWcWFuOWlNem1Wc1BMeHJOeFV1T3VJeDloTFds?=
 =?utf-8?B?UHllL0l3c3hSR2tHOFBoeEJ2WTg1eXZsRU1FUFI0MTVaNGRFbmFzNmtRRzFP?=
 =?utf-8?B?a0RPTGZ5Z2RPZENpWkJORnZ1MUdhaVkrdktTNlp0RmRCSjEvRTY2Nml0dkpx?=
 =?utf-8?B?YnlCNGVFdTJUUnJXZnBodWhSVEhHUWg0MUEvN1NFWmU5Uk52bEREUUFwZW9N?=
 =?utf-8?B?eHdVc2s3WjBTK2E5a214cVpvZGUwTk9XVGRoRjZkWEhDMk5IZ0FpZE1PUC95?=
 =?utf-8?B?cEF2K25kc2JsajltdFRldS9ZV2Z0Q3Z2b0NmWHI1NjNLQ2xBRm9MUEpXcnQ0?=
 =?utf-8?B?RG5oSDdVSHdHZUd2VTdnaWFXNjJiRkhPOEw1ZFdHMHJ2QVVuQk11a1RiR0dk?=
 =?utf-8?B?NDdwMTBFWEtLOFd5VW1JWEViN2xFdFh3cGZCKzRIOGljYmt4TUpoTVlWZ2xO?=
 =?utf-8?B?M2tMcFRENk9EY0JoajhDa05GbXNKcXVmY0VJK044T0h3VXBXN0l6Rk9TRkF5?=
 =?utf-8?B?a3Q0S2p6WWhYSXVrWWtnVnVjYUkwUnVJR0dCSmd0NXZNd3NqVFdxTHRiZHVO?=
 =?utf-8?B?dUw2THRmR0VoZ0g5bGtlbUZDYm9XaW9HN2RMaHlsSkRJSTlzZ0xNNld0b1Av?=
 =?utf-8?B?QW91SERkQzlqY0R6VjVrcmplR2ErOGxKaVhjZVlUZUVTVEYrS2daSzFqS2pI?=
 =?utf-8?B?NUt4WkVsZjQ0c0haeW00dm1rLzRLQU1iSXg2cVUydUNGMHBTUU1hcGFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDE1RzFYWk9rRWdWaUh3cmhiNms2Q0FhK2ZHUHNOVFJTaGs3eDVIQ3FEc01x?=
 =?utf-8?B?L243NXluYklEOGtJL21pNG1QZHpXWFdZcTFWaklpOTJJa0dBNUJBOGEvTW5p?=
 =?utf-8?B?ZXJCV3JTRjY3VnhEN3BhZDlvREVrYkNrY28rS2ZnOWZlWDhBNlFjelhLWHNa?=
 =?utf-8?B?dTloL2NleDcvbWUzVkFTQTFWSmFQZUo5UE5jZ0lJYlkraTJpa1FEdGhmN3p3?=
 =?utf-8?B?OEtyMjc4Y3YrOWNZRjFOcGlTMVNyVTlDaXA0U2hXQWN6cW9tSG9HZ3ZpYUtv?=
 =?utf-8?B?RnVwYUNycXBtYW43WTNNcWlvUStUVDZKY3V1RS9aRVRlWSttYWlZVy9tY1pa?=
 =?utf-8?B?Q2RCOGNmSFJqSUNJTXV2VHkwQ214a1E4ZWNxWDJwZ3Z2MGxRRmkzN1p4bkJr?=
 =?utf-8?B?ZkZIcWorRzR5MG1KN0gva2ZNcmtndDFZa2c0SnltNXU3UU9EU3dJN1VXTkk4?=
 =?utf-8?B?c013Y3NtZUFSTDJtY09Mc1VWZk5ENnB3MEdGZnlZTVlaUkZkdlBMUE9DZFFk?=
 =?utf-8?B?UWE1M2hBbHFrVHQ1QWFCTGFRbjd1ZG9mR1ova3UxSWZacy9BRVRkdmFTVnlr?=
 =?utf-8?B?U2ZWaVFpNDBoaE5zMFV5d1lmL1BqQjlHRi9nY2wzL2FLWWlnNnEwdlJZN3kr?=
 =?utf-8?B?elFLaENRTUgwaHNRdTdDSGlBSWZHYnREejU2dzhFeWlleHhCWkFwdHd0U29W?=
 =?utf-8?B?WGIwMTRMOGlXT0hzU2xxdm1FUjZBd1I2cVJpbWpIOU82cytqbjYzNEpuNzJa?=
 =?utf-8?B?TkRmMENnNWxwZ2RycVdqa3lxSkp6U0R4cHY2V244QjQ3QmtDdkExZ0hDR255?=
 =?utf-8?B?cUU2LzJzR042QXZEb0FhdEpsc2I2ck91bXBCY0NOWXdJSHZzWmRZaHJhSkE1?=
 =?utf-8?B?L1ZFT3dDTENaU1BTZTdKTUp4QVRIaTYrUVpmR29kenRuRGQ1amMwUk44M01n?=
 =?utf-8?B?QUpqSGZVWnFMRzVOSGVPWnI2TTdGSitsN2pvOVlLaWlIaDNsdmEzN2lBa2Ji?=
 =?utf-8?B?R0oyYUpWazhLWTgwY3VuV2xjK1dwWlFDUnh2SEJmZmVqQlNaaXoxaDJHd1Nq?=
 =?utf-8?B?VHZSbEN4Yi9EVWtPaUJMUGI5OHRhdzNySWx6UGRVbVVJYUQvbGluWHRkQzlO?=
 =?utf-8?B?U29DTEtZdkYyRTRaWSsxS2hFM1RZcTdwZHpSSXZ5MjRmaFZwT1crNHRxWVhG?=
 =?utf-8?B?ZzFVQVBSZ09oUmh3UVpTTm1aQjVxUWNNUENBTFcvaWsvYng4cU03L0pWcTh5?=
 =?utf-8?B?ZmNHaE95dE5JazNLcFB1Wlc4cmhvRHJFOGpBWlJ3NmRyc0xCMkpjNURXMFp6?=
 =?utf-8?B?SGVvaFc1TmhUcWdYMUIzTVJrN3ZKTENlcGdycm42ZFU3emZLb1RoSU9zRTJG?=
 =?utf-8?B?S2pxWXluRFpvVEZGb01ib3hnUmtzeHNQWVdvQnZ1am0wY2tvOHVTbXZTSHRC?=
 =?utf-8?B?NmZIbEViQmp4U0ZNV3FRVDVmbU15Z0tyOU1NM0R4N0hnQjdjME90VXBLdC9m?=
 =?utf-8?B?VWJkMFNFUU1IUXJPdmlWeHcwRERiekwwb21CS2NzZmo0K2FtYUlvUUQxUmdn?=
 =?utf-8?B?MVBFQkhHWllrRGV0WXRMOHlkd0xRaXEyK0lvcUlYb0NadklycDNJQ1dFOG9I?=
 =?utf-8?B?c3Z6RE9HNUM5M28yTHJmZC9lNS9UUkEybEFJRmlwNUZmWk43RnVaNVlMQ0dO?=
 =?utf-8?B?bS9KYW5sb2JUdkFtUTFkdFJ0eTNWbVcyNHNHd2g1Zmt4RkhXQy9HMUo0cFpS?=
 =?utf-8?B?aHJ3MmN5MjhwajdJbHVLa0lJUHdvcWx5a2paQThpNDFLa0l0KzdKZHM0TXFG?=
 =?utf-8?B?SjdBS05BSmYzYnJqREhqMGRiQmowWDlwQnpyM292UEsvRVFnaWtta0JnQmxx?=
 =?utf-8?B?YUxXQklPZ1JyNHRsMmdYNmh2K0pFSVI0YWQwaUcvSUEzVWI3dk1tOVFKMjRZ?=
 =?utf-8?B?THVVKzZKSU1nNER3RlNpTWcvNjU5L1lvcEExQ2lUamd3N3g3cnZaL0FrTlNr?=
 =?utf-8?B?UnlJMDkrbGZKTUJLTnIySEQ4anNHVDVjR3grYTBCdU9vMTFydHBZUjZ6VWRM?=
 =?utf-8?B?MGRRQWZUTnFKMXg3TjBxNjhGdmxMVkNsazVTZUZNcEF4eVhtSWdRK1hRaFRC?=
 =?utf-8?Q?iavYi0Ry4vr1afnM9zCddganm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0124fae-4947-4ce9-5681-08dc63b94542
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 17:17:36.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEuBwcn9Jr0f47O+2zVdogwiPpXFOS9JfL3HqxPREpsEnoUA3+NFYXw1Mh11TNfPDAv9eAaCRsontAX7s6s5Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363

On 4/23/2024 04:14, Suma Hegde wrote:
> Making HSMP as "default m" in Kconfig, enables customers
> who rely on the standard distros to use the HSMP by dynamically
> loading it.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>   drivers/platform/x86/amd/hsmp/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index 26096f901c22..9d3f422b3f81 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -6,6 +6,7 @@
>   config AMD_HSMP
>   	tristate "AMD HSMP Driver"
>   	depends on AMD_NB && X86_64
> +	default m

I don't think Linus likes to see things default to 'm'.  I don't see 
anything in the platform-x86 subsystem that is defaulted 'm'.

IMO It's better to request the distros to enable it.

>   	help
>   	  The driver provides a way for user space tools to monitor and manage
>   	  system management functionality on EPYC server CPUs from AMD.

