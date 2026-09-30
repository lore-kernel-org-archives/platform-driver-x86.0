Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AB83B7B6B
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 22:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807855; cv=fail; b=TnEHKPIDYdVBH1oK+H/Cg87kIryq0SKlWbwtPvEMeOMnHdF6HyD/1lEhwqLSWPsfZ/G1xG8mZ2304KuREHt6kCT5GLAOoXb0rhLQpmaRh100xDgPvdLzyVsxt5rH/Sn1UWA79MHLUmSIY+ZWHngnfMJJug6+H+/K58v8vToxdQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807855; c=relaxed/simple;
	bh=q7EoHLfCa7/6f1Q2pWr4sXFYTZCtkE+ftZt7Lz1oR5o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PPHWBpNZvMIfMmCbcjGBY0gCA4KiIgi3KKIiwRW14NSuLAzEv9Lbfg2yhl+UZvaU30hXIABK2vSYr4NWgmnyFlMH/MajnZHLMAGi9LW7el4YpjHMq+baGo8K42yR1WUHY7QGXfhKYKtETNefJCY3Lry+nv6CvEeZw+rYEZ8gArQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W2o0gv7b; arc=fail smtp.client-ip=40.107.209.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W2o0gv7b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3CUiq2lNBaDMTHl6w26F1gZ07KY09jAoFNITacEf74/hwvRDJ+K2scGw1ZN2mIy9m+vHtZXOz7MyrScPp6CjmFoSTeDkZ8O1sthC66j2bl/vO62kpVclHRwlNhlRZMjswzW9urEfzJTmQl4wQqBb6RzDbvVQnVCZxMU/L72ujjUyBDCrrm0S+w6mrSyfTHKcVPaTdJtZ2XbDLZvRCVenSd3PHNOEqA+3jnDWZoOw5YvpB5JIH+e50bAe+TNZIMtwIIwpGo8qyFDHvuDXvfo7jjmAkttUjPiOvFV43mu/NAJVnVKC4i6kH2Ochwe3EYUXOPnGQmZcg8S6BLcW62Ivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlL8BSnHptaKy4PZ/nuiavrKHHiMSzIG6o0irePiFAE=;
 b=IhJV8kWEm1lhUl7BlQD4OYMnpW+Y/HcB02Nn0XFnxQ4TkPAyM9BDXFZtP28wop2Fr+CilOx7EFVQxrQOSP4yf/buDDj6VcQuWH7sAoO7WIb7wG+Kv72Xcx3rDuIsKRNHa3qxWiylGiyMxjWVnKgJbmOkj6uKQ3w8IedWP/Gtp20azz0zoOQCpENMFHD0ws2uIssjJujqpFOXXCASDxTM1C2bRrm1AUdDyRXF5MIiCeqz1mYqGFBXxZgqGf/jVYwYU+ClseO3moSoGMmPPrv/6yWfu/nLiMiH39Wpsx8reUhKWnYhv/+85BPFsRbGXircXbCPy5hCkgdmCXU0bfbzVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlL8BSnHptaKy4PZ/nuiavrKHHiMSzIG6o0irePiFAE=;
 b=W2o0gv7b6wXTUG8NIOlF14Ey0AqHmb+o6BvLlMsygsKSyp/EwGPr6UbAYzikW/SUoOxiJFU3supugjBqhuwbSM3muo+jYhoP/BevQMU3/l8upqRIRwhCWoXyas1NI9EM5P/2F/S1Iq8qnYbTUmEx54k9EALpEXM8mKniJDQjx1E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by SJ1PR12MB6292.namprd12.prod.outlook.com (2603:10b6:a03:455::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 22:37:29 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 22:37:29 +0000
Message-ID: <92166b67-3cac-467a-9917-8c5bbdf96a42@amd.com>
Date: Wed, 30 Sep 2026 17:37:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmf: Fix ACPI buffer validation in
 APTS path
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20260930172404.3506849-1-Shyam-sundar.S-k@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260930172404.3506849-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR02CA0127.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::29) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|SJ1PR12MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d944023-f837-4532-963b-08df1f4368a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|5023799004|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SHNcxiZRZ3+KNHsaM1ewZAq0+/sC5wBNhbcxui3XLKrV2V8dEnsY5fAcwrRLmUNBG/tIjzZ9fMsU2fPbuQvzR4g6+p46fMGOzLqVcr+fFdswJCzZ7rQ0bNx7UQhyC4CiPyQfJMvhO/rZHHVQ/uef32gEyaEFnfTzr0otmZM7qbvIoJW2eyuvhicUTa2GQNUIrCntoPjtECfNI2LkoSe2BLeYVmOg2Psth8MQ1YcL2pfI8/MhGVFLpilX4FWMzPO9eWuGrHq7aZW9MlkPvJzFIWi6TDzjhQj0i1RwFtT2gJeMXNxfMfwEZYMIxMwN8nQv3i4x17zCF0ilv/0Ir88DaAAF0zuD/dnyVJfYZBL1Lkjl+9N9lsMXjBfij3J4uFE+wuXBDOdh5i2J5yt4S7wGTPV7BLJoV+QxFdK5SDhs5Knnm2/EIv39v9zZNe/LKG5+qjVMYzF8T/+fpfP99erz2usAg1IPsBlgD6KOdFIEKHr8QKHRMlKgA7pRVOWm9W7AQtBZHOz8iYbHdr8pcpf9LOKmf416voMjiSmqWamq/FDw28QQW43qD7GjvlfbS5oYf0vDmLxqYFmXwJZcjzqM8M1s8R9CWsvx9lrpOT79IFoC48F0nByaEc+2M07YM3QFfnCtaKsL54+KKTUvUAbhOQUhVWGYqDvkuzQtV4DfHWo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(5023799004)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFd6VUpuWEN5dm1ReDV4VXNDcS9LMmhBZURsYmdSWU5xMUNvaGJUc1BlS3pP?=
 =?utf-8?B?WjJEcTBSWWZrKzlwdU1HSUM5YzFSMFVlVkJuMkhwV2lVblJFTnBCcWF1RytZ?=
 =?utf-8?B?VTgwbnI2dVpEMDhhd0RHMk5TNnlUNVlZUzZjL0J2dHRDN016U0NpU3B1and3?=
 =?utf-8?B?RC8vM1pXZElSb2ZORWFrRTJuWVUzTHlJTitHVi9NUTJud0xOTDNxdFV0M1N4?=
 =?utf-8?B?dzIvS25QVjI2S09kc2hFdHZya0x5QW9mb2hORlpnQ0tEbUhmWUtGVmEyWXlw?=
 =?utf-8?B?elJ3VXUxNXJuQlJiSVI5cTU0RUYzSDNQWDZwYjFSU2syZHVMZ2loQkpaVTRh?=
 =?utf-8?B?aFZtSTRsR1NZOXZaNzBKYjlFQXd2R1BMekNmSWxMS255OTgvcWJxKzdkRGY1?=
 =?utf-8?B?c3NvaEcvSFc3Y2Zlb3NReWtPbWxwc0ZmT2d0cCtOS2R1SEFqaTZaM0N4aGJv?=
 =?utf-8?B?d3hOSjMydjlLUW9OYTdQVEZWSmNZTmp6cUovSjl0K0UwazQya2lJTnR1YTdW?=
 =?utf-8?B?RlRpd3RrTjdEQi9YUjRYamQ5Ui9tREZhdEhsMW9zZGZWdUtjMStBa21IVkRN?=
 =?utf-8?B?WGNiRDJSSkk3V0xYQnprKzBPY04yWWFoSGVTVng5bnpaTEN1UWdBbHFIdHF6?=
 =?utf-8?B?a2VPaFVNb1JyM29GUVNMZWJTYXh5NHBWbExqWU45OVM4UVJPSW5LRkR0OFJB?=
 =?utf-8?B?d3pRd2hxVks4V2d3V1NUZUJsdDkzc011U0NaQ3lyVU1IOVZOZm94Z0FFQWpO?=
 =?utf-8?B?TCtqWjVjTURqZ0gzSzMxZEFwU0N6RTh3cnJkVERMVE5vSGRFdW84RVI0Mitt?=
 =?utf-8?B?TGM5ekh0c1lFOUttNy9PTFoycGhPNWNmSkNQTlFFUk9EMi9EOVQwb0dYSk51?=
 =?utf-8?B?ZWZzbXR5OHdISTNtM2VKV2FEZVFPVVY1VDY2OEpqWnA2dFdoakVSQXc0TkVR?=
 =?utf-8?B?TThvQVJOVzVHdUlyY3FQa0lrOHYzbHV0aDZFTHovUGk0bWdPMjh3UDdEOU5Y?=
 =?utf-8?B?aklZUnJhVkhiaVhRb1VWeDBHeittZnM3TXYrV2RTeGEyZmcxRm05cjl5SjRy?=
 =?utf-8?B?Vk9zYmVGUUJ6R0RqWWhVNWw4YXVWdXQxbUY4V1VLVjdabHFsek9PcStwc2dF?=
 =?utf-8?B?U05VbTNDdXZEZkw4VlhJSE1WOXhtSXBZTWV6aTUwYmtma3hnVXBmc2x3QjAx?=
 =?utf-8?B?SkRjMFd1emVCVUhDVGRLQ05oZWxqTGdSVFFMMkkzRjVnTU1wb0RvUEJtZDh3?=
 =?utf-8?B?OUxnZjJ0aC9XSW1hdmI4eUplTVdSTk10R3pROFQwY3BFUmkxT1lFWW5sYkNh?=
 =?utf-8?B?WXBBeGRWTDJHeW0rQ0hMQXJIckVXb2VPeERZRXVMUWNnOWYvYjVrR09wakp6?=
 =?utf-8?B?VHk2WmlDRnpDMUJFQ2I3QXpwSFpNMk1ubnFINExTbWRxcVRJMy9BR3ZyWVg3?=
 =?utf-8?B?SXUxOVpYK0VqQkM2ZjFuL0wyVkpIUkVxTFVPck01MXBNMSs3K0xCdXNKNWNY?=
 =?utf-8?B?V05CWmlSS1ZMU2lFK1RRSGlCS3V5RkNubmpBME5qRGRRNHhPUWhRL0lVSUdE?=
 =?utf-8?B?Q3RTUEQ0T2tEdHZyUkUvaXRUL0ZLbnNvbzJmVmtvRWZNdUJjb3paN3NEbkIz?=
 =?utf-8?B?SGNtRnFyWjN3QkJ5Q2FOaVA3ODJhWWVselNQbTg4WXpHckI3VDFOb2t6L2pN?=
 =?utf-8?B?Z2ZRMC9pc1FiVitOUmNFVHFIWlV4MVNaQ3c0Ti8rcUNlQUdBbHFMc3RYZGxC?=
 =?utf-8?B?V3VtWWZIbUt3eVNqVHE5M0V2Y05QQnpUTzg0a3BCVXgraGpmWmZFajNHQmNi?=
 =?utf-8?B?MVArdTgyeExiNWRTK1dUR2ViaHJIVEJNeVFYcEx3aWw2eDdCZUI2MkJsUlZo?=
 =?utf-8?B?Z1d5ODkwZnJjTjVUMDhzZjduSEd2NjQ5TXo3NTAvVU5VdW9CVFRndG1wSnFx?=
 =?utf-8?B?NzEwMzA0NWw4WjVOYzcwbFA5aUx0ak9UWFU1TDVQVmZsU0xyL21wY2Z2Q0Nu?=
 =?utf-8?B?cHY4UG14RVdDQUc3UEdUeHZZS2FoczhlQW9UdU1HeFZRRjVCZndMNFB0K2dT?=
 =?utf-8?B?UUVUSURaWDZNTUU3M0FvV1BUUmxVOHB4M1lGTWhHMWZ4VGl3OWJnNlBFRFhC?=
 =?utf-8?B?SEtnb3doc0pDTnRnaGhSRTkzVit3UEVjeTMvcTAvc1FFUm50Q1EzVURZM1dz?=
 =?utf-8?B?RzBDa0RhUWh2MTl4dGJUYmxZc2dJWXdrRWtneFZsaTdockttc2FybjZ1S3JR?=
 =?utf-8?B?ZjVpY1E0SGhwcTNPRmdONTlFdGFWcGVzcVFVUExTL092eWc0TlpoWTZLYTFq?=
 =?utf-8?B?cTM2Q0kxMm9WL2o5TVdlZDJ5TmRDZlIzeFNDUDRhMDRLWlNzdHc0dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d944023-f837-4532-963b-08df1f4368a4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 22:37:29.0844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWzJehj+EiaqbMuRVwg0UfMzgW/8zdwYdpa8YGhMO4LliWNB1YOVkBBoKbXtRsdd4RLc/Vp9iqji4TQ6cMyJ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6292



On 9/30/26 12:24, Shyam Sundar S K wrote:
> apts_if_call_store_buffer() reads a u16 size from info->buffer.pointer
> without checking that it is non-NULL and at least 2 bytes long, so a
> short or NULL firmware buffer can cause an out-of-bounds read.
> apmf_if_call_store_buffer() checked the length but not the pointer.
> 
> Add a helper, amd_pmf_if_verify_buffer(), that rejects a NULL pointer or
> a buffer smaller than the 2-byte header, and call it from both paths, so
> the check is done consistently.
> 
> Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2:
>   - Add a helper function for NULL pointer and buffer validation. Reuse it in
>     apmf_if_call_store_buffer() and apts_if_call_store_buffer().
> 
>   drivers/platform/x86/amd/pmf/acpi.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 3d94b03cf794..efad01a4ed27 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -50,6 +50,16 @@ static union acpi_object *apmf_if_call(struct amd_pmf_dev *pdev, int fn, struct
>   	return buffer.pointer;
>   }
>   
> +static int amd_pmf_if_verify_buffer(struct amd_pmf_dev *pdev, union acpi_object *info)
> +{
> +	if (!info->buffer.pointer || info->buffer.length < 2) {
> +		dev_err(pdev->dev, "buffer pointer is NULL or too small\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>   static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *dest, size_t out_sz)
>   {
>   	union acpi_object *info;
> @@ -66,11 +76,9 @@ static int apmf_if_call_store_buffer(struct amd_pmf_dev *pdev, int fn, void *des
>   		goto out;
>   	}
>   
> -	if (info->buffer.length < 2) {
> -		dev_err(pdev->dev, "buffer too small\n");
> -		err = -EINVAL;
> +	err = amd_pmf_if_verify_buffer(pdev, info);
> +	if (err)
>   		goto out;
> -	}
>   
>   	size = *(u16 *)info->buffer.pointer;
>   	if (info->buffer.length < size) {
> @@ -138,6 +146,10 @@ static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
>   		goto out;
>   	}
>   
> +	err = amd_pmf_if_verify_buffer(pdev, info);
> +	if (err)
> +		goto out;
> +
>   	size = *(u16 *)info->buffer.pointer;
>   	if (info->buffer.length < size) {
>   		dev_err(pdev->dev, "buffer smaller than header size %u < %zu\n",


If I'm not mistaken you can actually fold in more to the common check.

if (info->type != ACPI_TYPE_BUFFER) {

and buffer size check

if (info->buffer.length < size) {

and then

	if (size < out_sz) {

Then you could just return the size on success from the helper both

apts_if_call_store_buffer calls
1) apts_if_call
2) helper
3) memcpy
4) kfree
