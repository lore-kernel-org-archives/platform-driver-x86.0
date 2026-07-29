Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012005.outbound.protection.outlook.com [52.101.43.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA00489865;
	Wed, 29 Jul 2026 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785360546; cv=fail; b=bQwtvkREVzuwWVvfw77CjWzBcaYlQzo9pdKOaHFbPZ+ViDYVyWKUj8Rpqk/oWM8cfGCEXkx6cJosmlwuH3Ppu/KJb5wTnmAKfOxcGsn8ZyfdZ1fFpnwKLqQ2rbKT4aAA9KN212PxfmMy44Bx9usNcSF3qxA+2i5wsonQjkG5kWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785360546; c=relaxed/simple;
	bh=7jiTc31tBYJKKIh9fgtY/FFrVNoqw4Lb5xQMiKV5AgA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ejFcPq2n1PJiga/jCY2fAnI9g8qq8Pj7M4oBlLRr3Pc0lc5oUs6jkT4XHcBXfRslHLADZH8Xzm6Ka/zTOoJoKtSBZev2KeQJ40R+iyPW5pO5q8DjlWFpbQ/hXuqoDuBs4nE5ovkpmKOv6eifLUULzw4Xz6PfpKsVCdIwdmLjx+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ngv41Bah; arc=fail smtp.client-ip=52.101.43.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ngv41Bah"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6gInqc7NuToem1j7ACrlev7h3aSVQkPG4r/wyWIk6lQEQ23xXBnraEXgI/0DqJDlcfyCD7hvAFZCFzOHbUlZj9yW+cWtIaZaIUQ1JUu9fn77hXABbUJRbbxMlKC+riGN/rzT0DVjQWFAi72+iPtbBb9wrpwW6d7U/9AEF3BXlltX2coTym+PHz0BbyKkcz2Q4BeKejaale0ITzhErotzOA0hCXiOTnj+n37MKI9ryI7Xrk0B3s2j5FqACr96c/AOHPvTAMqUWrI2QlMcSW6U+/knecN18JGVTbXDlOkBmigWbrPqiNepLdzI+pb6RHaV5NGDN/XcyYViQkNB8JqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcC3Jjc3cLQ/37r+2HVvd/0qZZDkTKRJ6O556bH7sKI=;
 b=ZSrNWHzWtAHfG41ssczV9+FlFKnhjiH4aGkUsIWazezX1qR5+aa9IVtAT/PSyyv0jb9jGEu57RCD9r1ntwl+hLutIeC8G1WNaO2bw7RHtSEN7j0Et74bn/kd+RDXKzBb43OS5nEQpePy9T3YT4yPyntL5pIUoidDqlx7BpKAGlLzMwhK+8Mtf//Q3gMOVDG7S/Dreew2msIAlnbgg4tCbIzCOZA14dmcUkHXlHG3YAsT0GV7czFupdeEevODEMmCpJsnZ663cKZbRtJAYV0rv9KrRj98FzjF727JEp0g2OgzecC1bl7HaUJZU/+s2CaMhr5slpWfp6y0Llv/s3zCcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcC3Jjc3cLQ/37r+2HVvd/0qZZDkTKRJ6O556bH7sKI=;
 b=Ngv41BahJJo5ZOc5YdChVUmnhpuBWI/upkgAYVCqBODnv2YX/kIbBzUMrEgIVvK/xC09apQNDCXoX2xIkJ1WF5WBz30oQSNruXpcll2XAoh+YF3TP3X4EPAbJEPQ/AYnBqHdbrD3R5WVvLloriUobNOAY7JAFTh/vcpbOje/XJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CYXPR12MB9317.namprd12.prod.outlook.com (2603:10b6:930:e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 21:29:03 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:29:02 +0000
Message-ID: <2cc5bfc3-7da1-4efa-8af8-89192eee1314@amd.com>
Date: Wed, 29 Jul 2026 16:29:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] platform/x86/amd/hsmp: Route metric table through the
 client messages
Content-Language: en-US
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-3-muralidhara.mk@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260729164034.1331375-3-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:806:d2::11) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CYXPR12MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: 83185146-704f-4f59-c1c5-08deedb86920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	svDtbmZMsiqK9UU9egZY0j+EpNd2asp+GnzYWohCxYXvamfdx0XCKMPJ3GZFnfjcsQROxKzT3iy/caynPkq7i/HTHAPSb7ku9ul55SklDZksXZjde5MdwG8xZDahKQ0ZFDJlmJx3RdBdGVizSpMi0eoU0nVOeaxqYGYQ9Iz3DdXBy0FbJu9szaWpa0QP2gnkOnrRFgDDV7J28QCKbgM8UE2JDea52H4rUsN2nfy+2RwMq6m7t8polV6rcPYI8V0n8tPPFjO22fWF36t8Tb9J9dACgFRf+kfHFW3dtEk8oL9Q0F/ysBFeV110NgPY2A7bxLfbSYPG7dPZoJEB7njgPW1+iEi1PnXu4us+F4emqlHvB0AosFldneMG8ywSqm4pJqoUc3SlxmE9R1BmNxgKn72O844HzMHChM0mvfw1pyTJ1yioa0SCRcrX1VKSCyo+cLORNl6R0QM9T1SMPA3XSIEFZUxnr0iCT5/6h4mj9/wLDxXvgH5+BMqeIs0zWn4XmnazHPMgyFq5Gq2/yhLF9m5ldPb9v7LUSQCOJWdlFxYg7Jkyw5PumWf0YYdk8PI7o4TO285Lp0nK/KTJQyzd6lbKi46xw4htR22zzmLFDtjei9jLDBfaqlInRi1gDeKtVax/lW5lLlNrfSj1d9oziBKBOflaNP0T+mDXMDsRhvw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elZ5MDVhREdRRkdVbWdJVDlQZVNzQ0lOU0h5Z0thY1pYT1ltYnZIM21tQUdC?=
 =?utf-8?B?ekJqT0lCbVRvSmM2NWE3YVdBYjZIZUswczlTM2lqOUNYZ3B5ZEdFS3ZHL0Ux?=
 =?utf-8?B?OXhWU1pQbGM3YzJKM0VwNWZxN0xyYjJvZlptbjZ0M1NZOHM5VkdNcmN0S2ZR?=
 =?utf-8?B?L3RCSk0zUmJ3QnlRMVhJSzlxempJT0FJVHVYTVI4bEdrTzc2dytWM3RLY05S?=
 =?utf-8?B?ZzBpeTB2WnBHVEl0cXlBTnZTTFIyYUN0NTNabVVXVnB1MWxaZ2RQOUdtclZR?=
 =?utf-8?B?L2lZOGk5T29tZWxTZCszRThuYzhzY09nQTFadUNvUDFnNVlCb2FXWnhIdlZY?=
 =?utf-8?B?eW9HU2s1OUpUS2NpTnE4OFBKNVRld0NYSG9YR2kxcDV1U0JlMlU3VHRvWUJN?=
 =?utf-8?B?cmRseGt6bnZuMzgzbE0wUzI0ZXg3bmZUT0YycXQxOHNSS3lwWVVWRUNkV1Q5?=
 =?utf-8?B?WFRrVEg2Vmk3QXl5UkUvNUttcm9scGRmVGtNL1NqOHlFMnBmb05Ja2FDTjkr?=
 =?utf-8?B?SzZ4RW5WR1JzSnVzdlU5Zzl6VnozTFEyWTFqMlhQTGVWRzRQb1V2WVBXc3FQ?=
 =?utf-8?B?S3VyU051ZGxMdTYrY3lJUGtJYVl4Sk9jUVRmSUhUZ3NLenhNbDluazd1TGNT?=
 =?utf-8?B?RjdNWmlpQmtSK1V3MXZPc1NpYkpKUStzbkZMcEFsRzMwYVViTjdIcVhXdUZL?=
 =?utf-8?B?aldleEJkMEdCQXlMdC9rcEhZWDd2bUJwQkdvK2UvM0hMVTBDNzY4bWF2dnJS?=
 =?utf-8?B?UFpZOTI2d3BhUHVQWiszeHNWbFRjU3g4YVI1VUtoV1ZRU0Vyb0ZjRmN6MnJG?=
 =?utf-8?B?TW1RMG1EK1lrR09MSndDWFNkTUk1eXNLd0dWa04yS0tWMEx5dlNkdklaNmR6?=
 =?utf-8?B?V3NTRHFyZ3h4WXpVU2o1Vy82SUhuTmJrZWhPSUJtMTFXUWFiZFFTYzl5V3R5?=
 =?utf-8?B?RFQyOFFlRDNwb0NUYU82d1Y1S3hxUkcxYTZHcCtvbEhzcVZoTXFUbDJ3SUdB?=
 =?utf-8?B?YXB0TytZSU9pTnZ0ajhlZHdBakloTFZuS0hQTjZ0Y1QxS2xkRzc4aWVqcE5D?=
 =?utf-8?B?aFdnc2RwRjBSVWdNb040UnMyeFBOeDROaVJSdTdsekJNOUdNUUUrNHNzOHVX?=
 =?utf-8?B?ZVdzOWtJVERTNTVNV2FSUXZrY3pNVVFQR0VIOGlDdW00Z0hJVldvdnJPb1Zv?=
 =?utf-8?B?ZkZGZ3JGSVUvaXAxNndiZTBmOXBqQVY1SnZSeGd0OW9HMGJPSWJEbXNNTVIw?=
 =?utf-8?B?N2tmU0dZSStyQWdPcVBub0JNY1hzZGFoNGg5OEhrQWVRNW50cDc1dHA3TU92?=
 =?utf-8?B?ekgxa2J0M041bldhcllJWUdnd0dQWXkyeG1DZTM1L1FPK1BXcnRJZmcrWG40?=
 =?utf-8?B?Y1BSVzVZYjA3SitxVWt5clQya1BtQTFzVHZtMU9Ia1pobVNTMXdnUFJRbm1N?=
 =?utf-8?B?ZnhMRUlNTmIvbTZrUmRRUFlaSDhoL0paVVgzTE5IUEVKQkt3V2NDcU5ScDlp?=
 =?utf-8?B?dmJJV3I4UUFMaDl4RXE4K0ozYk1vZklZa0p4TFplaktIaFU3bUNUYkorbDl1?=
 =?utf-8?B?RTRyYUl5U0sySncvY3dxeGhjNzFuTHl1QUpYaU50Nk9mUWgrWFBPdWNpL3hz?=
 =?utf-8?B?L3RjMEM4djM0TEF6ZVdxdFIxWWFBMU9TcC9xbTM4T3RRTUJoczRKbmxieENs?=
 =?utf-8?B?MUVoVmo0d1NWQkltWkhsbVpiT3d2WXMweGFtaXl3SVdsTTljWlp2OCtKUWd1?=
 =?utf-8?B?OG15bHZBOVE1NEZWMUFEdGYydWV2VXJXVmUxTGxLd0lTZmpvYksybHc1NTFD?=
 =?utf-8?B?ZE1ZdVE1Sjd5Qk9NNnhROERkaG9DS20ycUpzajJQU0E1MStUVCttSnlIeURJ?=
 =?utf-8?B?MW9MTCt5alFxUEFDWWhia01QUjd1WHBSTy9WYUR0c1FnZlFHanp4eHR0TDgr?=
 =?utf-8?B?N2dQVFpKNnFZTTRPSlpUWkVaL2hYYzE2T2VJaXZnZnN2ZnoyZzBhN0JvbFpH?=
 =?utf-8?B?clRSZVI1S3hjUVNDZVhDcmlyNjZMRmw4cHhhcFlPR0ZtRGFpOE1RNVY2WW9Z?=
 =?utf-8?B?cUJLeTFzSCtEK3I2OGtsYjY0a1QrMUZoYm1aRk5IRTErcElHbHZlazVGb3Vt?=
 =?utf-8?B?dHJFd01vSmlNS3Jra253ckNYYkNRbXJ0cnNnalZjbUtrU0VXemc2NWRwazg4?=
 =?utf-8?B?MEcxbFl1alhZOW95dXU1TG81RFVITUNQdzgrby9tVWNmRUVnVTlva0pPdUxB?=
 =?utf-8?B?VDEwMUhtOVdGUDN1WTFVajdGL04zMmlpU0M4SzlKTlNiejZUSE8wNk9MOXMz?=
 =?utf-8?B?dTBRM05JYlZFTjhUYzNnTzA5MTg5SVg4ZjI3c0sxSnhOaG9JcVlvUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83185146-704f-4f59-c1c5-08deedb86920
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:29:02.8379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJA/hOhlfE5JI25s0eFps6q6GmfDMhgYq2Tc6P9X7I3qb697OCxoSxAy9XljaVrF8RUFPg+wBTAckCa7hAJ1ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9317



On 7/29/26 11:40, Muralidhara M K wrote:
> Wire the client metric table and metrics DRAM address messages into the
> metric table read path for the Family 1Ah client platforms (Models
> 80h-8Fh and E0h-E3h), and initialise the metric table on the platform
> driver probe.
> 
> The client reaches its metric table through the Ryzen Master SMC message
> set, so add the two message IDs to struct hsmp_plat_desc and have
> hsmp_metric_tbl_read_locked() and hsmp_get_tbl_dram_base() take them
> from there. Unlike the test and version queries, these two are not
> numbered alike in the two sets - 24h/25h on the server against 05h/06h
> on the client - which is why they have to come from the descriptor
> rather than a shared constant.
> 
> Fetch the metric table on the client whatever interface version was
> reported. That query is already non-fatal there, since some client SMU
> builds reject it while the mailbox works, so hsmp_pdev->proto_ver cannot
> gate the client metric table the way HSMP_PROTO_VER6 gates it on the
> server.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>   drivers/platform/x86/amd/hsmp/hsmp.c | 16 ++++++++++++----
>   drivers/platform/x86/amd/hsmp/hsmp.h |  4 ++++
>   drivers/platform/x86/amd/hsmp/plat.c |  7 ++++++-
>   3 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 9b65dbd47965..2326506929a4 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -65,6 +65,10 @@ static const struct hsmp_mbaddr_info hsmp_mbinfo_client = {
>    * are also the only ones the two message sets have in common.  Messages named
>    * by userspace in an ioctl need no entry here, as that path already resolves
>    * the ID against the running platform's table.
> + *
> + * Being common does not mean being numbered alike.  The test and version
> + * queries are 01h and 03h in both sets, but the two metric table messages are
> + * 24h/25h on the server against 05h/06h on the client.
>    */
>   static const struct hsmp_plat_desc hsmp_desc_server = {
>   	.mbinfo			= &hsmp_mbinfo_server,
> @@ -72,6 +76,8 @@ static const struct hsmp_plat_desc hsmp_desc_server = {
>   	.num_msgs		= HSMP_MSG_ID_MAX,
>   	.test_msg		= HSMP_TEST,
>   	.proto_ver_msg		= HSMP_GET_PROTO_VER,
> +	.metric_tbl_msg		= HSMP_GET_METRIC_TABLE,
> +	.metric_dram_msg	= HSMP_GET_METRIC_TABLE_DRAM_ADDR,
>   };
>   
>   /* The client drives a different mailbox with the Ryzen Master SMC message set */
> @@ -81,6 +87,8 @@ static const struct hsmp_plat_desc hsmp_desc_client = {
>   	.num_msgs		= HSMP_CLIENT_MSG_ID_MAX,
>   	.test_msg		= HSMP_CLIENT_TEST,
>   	.proto_ver_msg		= HSMP_CLIENT_GET_INTERFACE_VER,
> +	.metric_tbl_msg		= HSMP_CLIENT_GET_METRICS_TABLE,
> +	.metric_dram_msg	= HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR,
>   };
>   
>   static struct hsmp_plat_device hsmp_pdev = {
> @@ -643,11 +651,11 @@ static ssize_t hsmp_metric_tbl_read_locked(struct hsmp_socket *sock, char *buf,
>   		return -EINVAL;
>   	}
>   
> -	msg.msg_id	= HSMP_GET_METRIC_TABLE;
> +	msg.msg_id	= hsmp_pdev.desc->metric_tbl_msg;
>   	msg.sock_ind	= sock->sock_ind;
>   
>   	/*
> -	 * HSMP_GET_METRIC_TABLE makes firmware refill this socket's shared
> +	 * The metric table message makes firmware refill this socket's shared
>   	 * metric DRAM region, which is then copied out below.  Hold the
>   	 * per-socket lock across the fill-and-copy so concurrent readers of the
>   	 * same socket cannot return a torn snapshot.
> @@ -713,8 +721,8 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>   	int ret;
>   
>   	msg.sock_ind	= sock_ind;
> -	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
> -	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
> +	msg.msg_id	= hsmp_pdev.desc->metric_dram_msg;
> +	msg.response_sz	= get_msg_desc(msg.msg_id)->response_sz;
>   
>   	ret = hsmp_send_message_locked(&msg);
>   	if (ret)
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index b4bd9800dee1..c46d53dbcd43 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -103,6 +103,8 @@ struct hsmp_mbaddr_info {
>    * @test_msg:		no-op message used to probe the mailbox.  Also the
>    *			lowest valid message ID, as ID 0 is reserved.
>    * @proto_ver_msg:	returns the interface version.
> + * @metric_tbl_msg:	refills this socket's metric table in DRAM.
> + * @metric_dram_msg:	returns the DRAM address of the metric table.
>    */
>   struct hsmp_plat_desc {
>   	const struct hsmp_mbaddr_info	*mbinfo;
> @@ -110,6 +112,8 @@ struct hsmp_plat_desc {
>   	u32				num_msgs;
>   	u32				test_msg;
>   	u32				proto_ver_msg;
> +	u32				metric_tbl_msg;
> +	u32				metric_dram_msg;
>   };
>   
>   struct hsmp_socket {
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 7423c98a7b3e..bc29b0ec18f7 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -185,7 +185,12 @@ static int init_platform_device(struct device *dev)
>   			dev_warn(dev, "Interface version query unsupported on client SMU; continuing\n");
>   		}
>   
> -		if (hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
> +		/*
> +		 * On the client the metric table is fetched with
> +		 * HSMP_CLIENT_GET_METRICS_TABLE_DRAM_ADDR whatever interface
> +		 * version was reported, since that query may be unsupported.
> +		 */

What version was reported on client platforms?  Since it's the first 
time client is being supported with HSMP, maybe it's best that client 
should be reporting 6.

Then this part of the patch could get dropped later.

> +		if (is_client_platform() || hsmp_pdev->proto_ver == HSMP_PROTO_VER6) {
>   			ret = hsmp_get_tbl_dram_base(i);
>   			if (ret)
>   				dev_info(dev, "Failed to init metric table\n");

