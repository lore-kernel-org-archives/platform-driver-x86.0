Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF479329E49;
	Fri,  8 May 2026 05:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778217200; cv=fail; b=rpbEdTE6pYDUhKMZpiQ8enoTDigaakSd/3Y4MZsDkyAYzupnjKHRybbye6HrSViyt/wPCNB6FXRhVJDHeMsOrMchqqwZ2G2fNgHtt8hc1nJfBtRB7vU2prDDuTvKqUnbTCRYsRfXspdoLH6Kww56ShP2gaG7tkBz2jHgmcXxX0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778217200; c=relaxed/simple;
	bh=HkvGb9pOEHMJFoUZpfl75xmmzEPJ9D6nYWdb2/vR6t8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ovTVGvLXjhHQpYZFqH/fLaDEAtDO1I2H3KrQnXOIUOS50yQOuX9sawi9svmfqwEkj4dbdoFgZ7VIM7ioxflkTMYKsRTVU5XiwpDzUtQ/ruEGVMRnPHRXP7jhSAHc1C37iWmjSWpKCRlB+NjQPYZEtN0DYyzUzWfeTJPh4XdeclY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i/s1MrAy; arc=fail smtp.client-ip=40.107.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i/s1MrAy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyzBLjzVMXc/UMW4XpfuUr9+tjmCRDqtGP2ltY/QY/hbWlEXSg0UvrcLZNLgE8mCfYcwgk03k7jOLSEVT5I1kD9VCvj4dmE7cHv3tPbeq+IVLPkIw1SOvIN9fb5ujHWxiWMNCEkMBi6fgbgshFWzqW/k75zrvG2HpVWxaHMSvXZg/WTxqd1XgE/Wcra3Oe7VSX44yHoFExdWwuLyPImbaYaRwLENIidol5Sqd4Vl/ujB1ro1oF7pDYJAg+K28PCt1T5P8OR1I7BLajHa/Kolf5jZHhrABjWpNMZbxMjM6l8WtoyPcuv5ZZJWFaumWFnrCA0x6UqZmuyqyvwblH8qtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPhYMk562oTX9eV9zmioyFRAOQ8EVz2+Nc/9n9eGTEY=;
 b=xsHcwWlUA94uPg9l0pr350pavO5osByCfbsA2sIyeI6i9YDXLOLs1gKsK9zJS5o6LSe2bS0SA2LMZO3amlDsxdUzviMol8QaBrb5VgkGr0b5RxAlIEQqku8L9nSEuAtRLY9+V9CYLOJym0czn2a5pMcaM1romS+fq0VgBMOeDAks1Rn0aq0iEPu0SohhhSj/ZIoHKtF/mxOzD2xNmag9znWYLjD/JES3oeKTTbuQADj2WLI0KhIlPmmM8iKn0TuXUaDBCSA4oZMnpuBNp8GN/uvfxko9nS3duZYwBNzT3tFlBoQOyq7ingVCUA9dmnvDi+trnAdIxwu2Lvx5Sa9Caw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPhYMk562oTX9eV9zmioyFRAOQ8EVz2+Nc/9n9eGTEY=;
 b=i/s1MrAyhPouJcg2AaMLwQMEg3VgWn+fqmqkJuI/VqDxDVrikRT/sRIHNzvDPRe/NvFv76vrKsmvUDBgmEPaQY17RIZgWLre5VxbEPZN12aLi/bT75ltQidWg/cA/TFgO92+PfdKRFZKMJdaHuKJbe1PciH51mml6VJFAHHPCL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by CYYPR12MB8990.namprd12.prod.outlook.com (2603:10b6:930:ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Fri, 8 May
 2026 05:13:12 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::144:144d:8be3:b980]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::144:144d:8be3:b980%4]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 05:13:12 +0000
Message-ID: <b8e2bb91-720f-40ca-9fb0-d680ace97272@amd.com>
Date: Fri, 8 May 2026 10:43:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] platform/x86/amd/hsmp: Unify response_sz
 validation to an upper-bound check
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com,
 gregkh@linuxfoundation.org, rafael@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260427155129.545327-1-muralidhara.mk@amd.com>
 <20260427155129.545327-4-muralidhara.mk@amd.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <20260427155129.545327-4-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::16) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|CYYPR12MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d67cd8-cdf5-4af6-f748-08deacc0806f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	v+yigyIl3AY2ciG1wvFPhwpP7sy40wPDRh9V0KFgk+QjaNl3AntS5okf4shwiGXg+uF57TBACzIyzVXFJoIxBG68NdFl/Ck1x5jk9s9tyNk1figP/nxAHtELeU9zQfrFCI7e08WdIvlNAqC60sVti2dgALn0A/s+renug2rtHjQ35F47rWMoDDVjGvDmnjbDpFdP+ID44SSZQjRU++CWzluy7Fam8HODCFHI4hU+27awA5iA3M9b4aqcg6DQxnJiL8hPDc+QlEqYnVm+85/ZHvFrInE9D+WCdbwDn03Grcm8j9n7PAsFrGgNiPFDwD+P3rzeNN8qi/QTyg2bsvLAOrsi0Z5yV/6X5lOtbl9gbznGO3D4b4uaD6V4Eltle8Xbfy0mNwr3nUswuBtqnCPvQxdMC1b6z07buvo/ZtbpXeKYSdEwU8fx8YAdKWmFWVQpk1ItvT8RzGR8QzwmcJHFxy8pJUHZddLtKUj5ifCNa6VeOQEB2qDt78WbHT6bvetJBSchqdHmXKRswiYq5mL3eg/lwSa1T1w9bP6hpaONYcZS8R7tY9TkQHjTTW/JO/kUB7dAFu9rHsq9xaOIIwAmJLgB94eaNMDPzbJvegwzZltPI/LmoFBC2sB0WhZud4THdogPVcF+77+XV1R69+J+K49hWrAzZu/q8FfkzWASh7loQd0t7dUIQgDMNydTFlS9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2U4U0swdkExUS9pMVR1U0NSUVRxU3NJNlY3M3g1MkliT2VhUlVuL1JzQ0s3?=
 =?utf-8?B?RFdzQWxCM0tCbEJOWkZhSEQwVGtMYnZUTGFoanFsejZ3NFBXVGtDVVZYdXNU?=
 =?utf-8?B?N3F0cUY0Nk5TRkMyM2cyeVF6bzdsOGtScFFuUmlONW1ZNC9hRmtCeFd0Ym9U?=
 =?utf-8?B?VnRab2lHenVpNEhKL2FyQkpleGt0TVV4aWx3YWhWVXoyZDBIS2U3Rm04dDdH?=
 =?utf-8?B?bDdjS2t2QlJ2ZTNEeHFIVkZDa0Y2bG5PY1Z2cFJqOVd3ODM4bll1TEZodkpt?=
 =?utf-8?B?YXpKWnNRSEovWFlBMVFVam9RdWdrbUVrZ3l3Q2hROThZbnJXbUdvQXJFZ3Uv?=
 =?utf-8?B?ODd6RXZBZExFZGdkTnNkM0JpS1h1VENocVJxU2Nua3ZZWERHTWZXZEx5dmRi?=
 =?utf-8?B?d2MvVWxJcVhVQWFrZUQreloyWmtrcGRrVDhjQWFLUUduK2JNdXBiM3IwRHRF?=
 =?utf-8?B?M1JNZUlhc3hpN1pxa0tIdGsrdVVWMVJkL3h3TnFocjhuQTRKS1o2L2tVQkt1?=
 =?utf-8?B?azAxTXpuc2lPeFBVdjdxcThHQzFHYy81cU9pZ1RWazFmMjdwWWw0Z1hJd0lI?=
 =?utf-8?B?NTJDOHJyamdWVnhWd2hUVDVRamFqdEhGeW04cmdMS3FDejlseXVTVEYxdUhM?=
 =?utf-8?B?WEJnNXkzbTdCMTV6V3hNeFhCMkwwMXhmblcxVDJRdFZweVVhT2tCWEovdk9s?=
 =?utf-8?B?NWFjTjhLV1JxR0RLV0hpMUlrelFjZGJnam5BUE51ai9ueUV4K0ZMclBQaUpk?=
 =?utf-8?B?dE5NSFBDQ0Jpcm83UnJlWk15bGlSQXQweHowT1hoUGJreTZZaHVpaFhYcEtv?=
 =?utf-8?B?N3RtR211d3NScjZJMFdycVM2OVN3bUFtdm9xcjV6d0phVHB4c09vUUl3akR0?=
 =?utf-8?B?YldPbXQ3VjQzY056V28zZ3NobjloN0xLY2c3cnBPTHJsNStkVnRDOXpFUVlN?=
 =?utf-8?B?RHoxZWdqazBRMUtjVmR0VFRvbEoyUUg0ZHJkZURwUXl3MVlmRVE4T1NkY0Nq?=
 =?utf-8?B?TitJTTZkckpBRko0QkphSFdtNGt5b3BrNVgyM21pMVdxUzVvQXRuUlkzOGpE?=
 =?utf-8?B?TFNJVEl6YVdZdDdrTTAycW45d0dRNlU1SnB6T29mOGJaVDM1R3p2VDY0VG9S?=
 =?utf-8?B?Lys0MS95V2NHdXJNVUhhMVZReWs0aXBCa1R5UWQvSC85NUYzQzdlNlYyclEy?=
 =?utf-8?B?SVRnaHQ4eXl4d1hNQXdCNUZWQllGWG1QeWtVZkhFWlYrUDlqazFYRmY5VEVz?=
 =?utf-8?B?cGw4dnJud0FaZnJ5VU44aHo1Kyt1MzZOSEVhZEZQRzJlOUJSZkgyRUk2d2pI?=
 =?utf-8?B?Wk5wVC9XNnZSSmRucEp1TlVBbXgwKzE2ZXBtbmRBUkNXM0FSeVVuMGtWTTFO?=
 =?utf-8?B?QlFQMHdQTWRLRVdyeUFXMnoxcUoyWHpUd053YVByR0V1ZEFjRHhKQmp3THJP?=
 =?utf-8?B?dVpKMGIyaGRIeHl4Q1NiMU0vczNXVW1QdG9ZRDNVdGRFSXh2aEZ1S0pWTHhO?=
 =?utf-8?B?bEpKUEUvK0dJUkVGSDlqVW5sWGs3d3QzbEFaN01ZUVdvWmJrbnc2a205enUv?=
 =?utf-8?B?RGtqY0x1N3EydTg5cjhZZ1UvWmNmRGJiYU5LdHdiZjlTSXFER2U5ZDZIenYz?=
 =?utf-8?B?eUltMDBldjBoL0ZBcW1kUndUd1dKVkpBdjhqZHpWMUxCMlQrc2xaWU1MbE1Y?=
 =?utf-8?B?allsalkrSWRSeW5Ba0xBOTVXNElpbTd1MStmSm1SSlUvajlOVUR3QXBtclQ1?=
 =?utf-8?B?SllJYXEyWit6SWU1WWNKQ2VDZHF2QWtBMWt2RlptajFiMGJIU3lHQWJsZGZK?=
 =?utf-8?B?M3pyaEpTMEd4WXZkdTJZN2hKaWZXNHkyS21zY1ByeVphNEFmSWJqb1UwUDJj?=
 =?utf-8?B?bC9HZnBtNkNPSHVqM1BSaDJlc1dEZ21WYnhrWUh3VnNQdStzLzQxNTFnaXJO?=
 =?utf-8?B?dk5MZFRjSHRlOGUzQ2hlclBqSUZ2Qjd1UVpmL1VJa3RBKzNMTW1LTTY2bFl3?=
 =?utf-8?B?Tnp6V05Md0l3MGw0TFk5Yzh6WjA4ZVFUVWovUGNSbVFxVEhzNUZ0S1lXaUho?=
 =?utf-8?B?NGZScTF1dTJWQ1gvWThnMFNScUhLN2Q1WWZaTDRpa05pRnB2cFdSVGVid2lY?=
 =?utf-8?B?N1N1RGJwVm1XYWpScEVIZ2JQSW1ya2pVNEpWWlBnUjYzSHE4YzlEVXZVbWdX?=
 =?utf-8?B?YWIwdFBoRlJSZlIzUFVHNlZmNkNlQVFkNENJTTg0WWZwbS9RV2ZtZXdEeWh3?=
 =?utf-8?B?RElXUEZ3RE9JWGowZVpxQVBMbThIVkVyUHFRUkVoV0NBalVOMDhhSDdWSlZW?=
 =?utf-8?B?V2FMUlFSbmY1Qzh4azg1a2hkSDFrVzdFdmc1cG94YUxMV0pabTQrQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d67cd8-cdf5-4af6-f748-08deacc0806f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 05:13:12.5162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7drK9NygAjFwkRDbliK2tbZkvl/EB+Mt6vBG2xAK20sxIuOrlwR2lEf/a0OeYcf3+RNNLs4vOInHvajYZUxqeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8990

Reviewed-by: Suma Hegde <suma.hegde@amd.com>


On 4/27/2026 9:21 PM, Muralidhara M K wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> The original validate_message() enforced a strict equality check
> (response_sz != table.response_sz) for HSMP_SET and HSMP_GET messages,
> while only HSMP_SET_GET messages used a relaxed upper-bound check.
>
> As HSMP protocol versions increase, existing message IDs may gain
> additional response arguments on newer platforms.  The strict equality
> check rejects older userspace callers that were compiled against an
> earlier hsmp_msg_desc_table[] and request fewer response words than the
> current table defines, breaking backward compatibility unnecessarily.
>
> Replace the per-type branching with a single upper-bound check for all
> message types.  This allows older userspace to request fewer response
> words while still rejecting any request that exceeds the hardware
> capability defined in the descriptor table.
>
> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
> Change v1->v2: New
>
>   drivers/platform/x86/amd/hsmp/hsmp.c | 21 ++++++++-------------
>   1 file changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 631ffc0978d1..9bad58fef304 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -182,20 +182,15 @@ static int validate_message(struct hsmp_message *msg)
>                  return -EINVAL;
>
>          /*
> -        * Some older HSMP SET messages are updated to add GET in the same message.
> -        * In these messages, GET returns the current value and SET also returns
> -        * the successfully set value. To support this GET and SET in same message
> -        * while maintaining backward compatibility for the HSMP users,
> -        * hsmp_msg_desc_table[] indicates only maximum allowed response_sz.
> +        * As the HSMP protocol evolves, newer platforms may define more
> +        * response arguments for existing messages.  Use an upper-bound
> +        * check so that older userspace callers requesting fewer response
> +        * words than what the current hsmp_msg_desc_table[] defines are
> +        * still accepted, while rejecting requests that exceed the
> +        * hardware capability.
>           */
> -       if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_SET_GET) {
> -               if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
> -                       return -EINVAL;
> -       } else {
> -               /* only HSMP_SET or HSMP_GET messages go through this strict check */
> -               if (msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
> -                       return -EINVAL;
> -       }
> +       if (msg->response_sz > hsmp_msg_desc_table[msg->msg_id].response_sz)
> +               return -EINVAL;
>          return 0;
>   }
>
> --
> 2.34.1
>
>
