Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010035.outbound.protection.outlook.com [52.101.46.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DF8190473;
	Thu, 11 Jun 2026 16:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196413; cv=fail; b=akHWdVv2fACdJYFN3pXU0dDkB9KzWKeWxOhoYtuGEKdyP1cf3msQ9rGjLXo/cPG/qi/owBA1Twqwiuz2PbjjJxIgDS6V3d2YHtBAa33mUs6hSr5fKO2GJR3/sgWBTSlgquoc7wYwIyLG+ESfmS+/qYcIY2TIBkHz+0xQ4XarovI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196413; c=relaxed/simple;
	bh=CdXLiQyzCHY4RNVWSmxfIMGxdSmSmLI+6NCPN6WYqLw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bEWPw+P6e1D4qjwa+3qesZJ/6hj1It9G/JvfWsOmYRtmxbdpuqlstkYJdNYrf4KcUnI944XC/kGtCyC3Qu/Rj1hQ9E90kspXNyug1MOZFjdQVldxZsUgikGXZHPDtHSTqtAL3OWbKjp09L6YZZrJha+m6f3PUS1+uleY3msxgxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uSfQExiT; arc=fail smtp.client-ip=52.101.46.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uSfQExiT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gM0nQGS4FKDazSiDo/iJDikq1VxbEnFs9Xfx2+ESZG7OD7H9WpHjgKAvbusG3goD8qCZsOn6Zaas+G4nEe+QMIWDS2w/0F5ugrQ/V53d2+SHHwZAi2HiIgbWrcmuUgTAkGDVskaD4Pqi/OcExMdWo0RnPKiMNWJb8dkYZxqc0Q8HbxHWt4gy1r3dce8Qm2KekiD3nq41grAZifkLGQ6PGyS9v/mz+bNAo+ly1cUk5go9kvK5eluCVjg2Sdyw6AqSZ3a4aMXvL50S+gfCsMfYEJclmrSfv0mzsIJmwcVXCzir79+4kvpkPuF1Egrk0A/Wow4gxAq2foz4CxCZjqgjqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7J2mJrmba/vLtS9yaxS9ZxfFLPgpHy/awF9VsOiHTow=;
 b=TqRvR0AtI3jcCLEXy2G6exQzAaWNHP9OJPXco4yNWxqoT29V8LPqfR9QPC1kAlw9orEyxCLyz8RT+voOb7ba9mnZOPXflX8h1c0idy7djBKoc44GinFKzElyovRgRB5Yf5uUb54SQRcyct/9waQ7ltlCRGGXXhQE2YOFwT03EYrXOfwWxSx7EhEpTXpw7t4mqUw742b4rIRjBLz3dNhTQIQAAKD5Ss+lVt60N2EpLiwUEn+wQ9OfTJgDAUuVlJyYnzvPc61+siEpJoN7gvHgTwDCcG66RPahJiLT9WVtRMDFo4zi0iZ9SL61Va34Ub1cax/ZLqtqbe/EEI37cWxufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7J2mJrmba/vLtS9yaxS9ZxfFLPgpHy/awF9VsOiHTow=;
 b=uSfQExiTuN7A9OUia/qdIrlMMF2W4RRpqiPHuVvMs66/QlufdfWY+G+bZSoy4fRY5PtG9ovA/iKpmwzRRHWnoDYyONwYNuN9Amrfu5P83n+flzzsrL5MYo98PS6MhvOSYKI5o+DbOiQTJrXsQ2EE15YOOiO6CtLmGTN3EmJj+X4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by CH1PR12MB9645.namprd12.prod.outlook.com (2603:10b6:610:2af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 16:46:49 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:46:49 +0000
Message-ID: <bf7abfa1-e9c7-47d2-8362-97c31feaba37@amd.com>
Date: Thu, 11 Jun 2026 22:16:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] platform/x86/amd/hsmp: Sanitize hsmp_ioctl_msg()
 msg_id for Spectre v1
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260611052919.1095549-1-muralidhara.mk@amd.com>
 <20260611052919.1095549-7-muralidhara.mk@amd.com>
 <0a312950-54df-7290-e702-14ba31951b0c@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <0a312950-54df-7290-e702-14ba31951b0c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0219.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::13) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|CH1PR12MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: e8e20d23-569b-4160-050e-08dec7d90835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TrMIx+V+LEaZnoB1fms/NiUz7vxPZJ+7ofVhyrtexDv2ScpjIKbg4k2aetSnB6ykbCeb3bZxf5P73PoHfqCF8YoiRLX4MidJMXV9sTGEeii0jms0qoZNa43Sofl4gbhLkPAgLuN46ya+D/sRJz50ShD6rK7MUb8LIPPnqJXJP2TcXWBSnzssxz1ZiJUbjL59ESF9My7S7KAEAMpKPz0TXBeZvcfcLXlck9SJPqA0TPIPHB8P6DjjOjgwKjJYw63jePDfo1mC37o+E9fOeIPKLFR9CRQtohqGZF5VnBv0btiYKGb14xzQcH41nYR/1AVAsjvVzAjt0g5VBOQlzc3R6sseKTtd6bO61n6eIfRPgy4pywe5YtdscJVIm0tb9teKfzTpIxZlMMOfoMI9oETaPUTmQs7ePg5Myb/rrCC0I9AstJL96PFy4T1sKof6TQjxwWDJO8wdexDTJkW0Efii0WjnyT9s3givg6+sLeZnC+nXcDqUbwsIjNTgtJerpeqi9+F8q+JtKDFxMeKuc5P37kM6YnYZ3/b3C7jAo7qlHl8Il3MxUb7Sj+2bgnHWuaNhzXX2l0IgqFBNDDqNoLPZ/xt3ofl1dBvumpBQ5rDOGkQ7cN8PPSeeCnURgMb3AOLaLgZmf+f9F8Ia7atbubnZOpRKZhzY4h3wA1d80AbEQXWmmU0Du8h0zH0XgHLUJd8m
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0pBOU9DM1FQeThzNWpaaCtJc2tSbmFDd1ZxRXFhc0FsaUN5U0N1MFd6bHo3?=
 =?utf-8?B?QVBtTFFxNExseTZVUDJvb2hwWmYvM2ZIU2RmU3kvMjlIN2E0RU4ySjhyZnJ6?=
 =?utf-8?B?a2RKVjhHODB5VnZabllLdjBxSnV2MnA3MG9iemcxb2MwbXRjRzhMQ3BraDBO?=
 =?utf-8?B?M2ZSclNUK1pvNmpOaCtiSWJhclZCSHNlbzh4b3lZNFAwVW5wWXJwZUl5bkp3?=
 =?utf-8?B?NWFrWHpYWG9UYlpERWVWY3VUUTFlbk0yWnJtZUI0NVJpYlVrMUtOaURuMHBi?=
 =?utf-8?B?STk2K3g1S1oycXZlZ1AxT2gzU3dxcmhoZ1hMSnhJRUJGWU5qc05xa1N5alVX?=
 =?utf-8?B?WlBkaFVkL0FFM2plQzdEY2tqa3lhYWU0dEl5MmFjRnRJUVQ2NGRNd2JMS3RZ?=
 =?utf-8?B?Y2Uyck9jaThKcUpMRWFUNmtrMUZLT0ZiVGwrN2lTbzlxT3VGREx3ZnNMSlpW?=
 =?utf-8?B?OG5ueTIvd3lRUGpDU2Rqb2JUMWF3aXhoL1ZqRCtlOGdHUWM4TWVlSjRUaUNZ?=
 =?utf-8?B?U3ZNQmN2TVlMWm5JZE9VaGQ5T05JZzNsblJWZm9IUmE1dmRZbkxVWnM5aWht?=
 =?utf-8?B?U3dYaVJSS2JSR3B0Zis3MW1haVplTmNsc0luS0h0eTVEVXBkWW5md1hmZUhj?=
 =?utf-8?B?OW9CQ3plTFhNWjlrSlpmVUYrN0psaXdCeXFSSDZvdWVSazdmY2tlYk41MmJH?=
 =?utf-8?B?bTFJYkFwSkhINUszbFpNcXRBTFZmQ0wydi9aNkZmU256Y0tROUJKWmFIZVg4?=
 =?utf-8?B?ejkxd1Bnem5CcGVoZEU5SUJmRjJveWJCRE42cjZ0RVRUQlBKT09MQ0NaaVJI?=
 =?utf-8?B?dmdDU203NzdJeHdWSUtRTlJmbkNaSWNnckZOVkltRWpEVEdLSW1ra3BtalVL?=
 =?utf-8?B?UEhRc1JHUHcrSCtpMlhBZm9hVTkrOW1iY1F5S0x5ckRaTjE0Sm43KzVpeHd1?=
 =?utf-8?B?cFMydndjVGk3aHQySlV6VnYvUC9WT0JFUE9KOUpiUGM5NHJSbVMrNlRWUUlr?=
 =?utf-8?B?TitoYzF1ZGVNMkVJbUtGRDduU256NDZNbkJSTlhEeUNhK3RZUkdTbHhzbDRV?=
 =?utf-8?B?SVFvSyszalFwL2JheW5ibzdPUFloaFNMREJsbmtlZFFmbHFMaGowc3djTFRR?=
 =?utf-8?B?elBRSkd6RVZVS2JJb3BkdnQvMFJzd1NMemVjdU1qNDZ3UG44emsvVkV0QVV5?=
 =?utf-8?B?SDhUanpydG5aTGo5QmQ3c2sxSlFnZGNTUEh4NHljcjFENGpMM1BSY2w1cjJO?=
 =?utf-8?B?bEVzTXpYK1V2RXR5c3ZVVHU2MmRjeWp5V25IaGJBYS9YN2tyZHkxd1BxUStI?=
 =?utf-8?B?WTJuTmRRNHhiZjRpdzhmR2hjQnF3UWw5T0lVaU9iWkc0WGdkUGc1eE9yMVI1?=
 =?utf-8?B?NGtISDVxR3QybFBDalRtTWlSdCtmcVhmQjlkTjg2VXlDR2FFVzNrdlpSdWJw?=
 =?utf-8?B?ekZ5MGxmSEJaakZwNU9iTC9WbThaSStIT3JpR0xUYVhiVzUwU2Jxd2FUMWFk?=
 =?utf-8?B?VWwyaGhQSTd4WVNtUE1CVFRpR0dac2JXNmRscVRURUlOTDJPdm5wbEZ0RmlG?=
 =?utf-8?B?UllzSjNVbGVoTUU1anJFQy9pbUxvMWg2b3FDOXBkYkRyOStET3M1MFVZalpt?=
 =?utf-8?B?bGVnbGpMc2s2cENqMVpOMUpKOFR3TU01Z2tQOFJHZTRCbkR3cDVsN2RkSnQ5?=
 =?utf-8?B?WVNmUzBLakRiZ2I1N2V5SXhwdjVUYlpYMlIzZHJ5MWhJLzR3dks3S3RLSlg5?=
 =?utf-8?B?N3FiZFJEbTg3YzVEQXNkSjBGVWNJdEh3WThiL1hSQmpZQWpnM045R29EbnM4?=
 =?utf-8?B?d2o4ak5CY09oWFRPVFNlMlRvbXc1TytZeGRaZ3ZBQndCYWxweE1VUjNOT0lu?=
 =?utf-8?B?NGlrNnpjVUR6QkpTN3RxdzFuL3dua3ViY0U1dDEwOUY3aDdERHdNTm9GbUZB?=
 =?utf-8?B?UmVKOE9LQ3FNMWh5MW0xQUwrcUtVaFNZdmFsOS9yRHY3Q1RkVDJ2QkRONmtw?=
 =?utf-8?B?cVV0eU5lSDl4eXZVZElmQ0wwMkx4WllzV2VhU1pvSGx4TTJVU0VCOG9VeWJR?=
 =?utf-8?B?VVV3TjRXa1ZCQTJ0cDRtSUFkWHorNVpWQXYvOW1Ibmd5c1FQVUhkUmtEK2Iw?=
 =?utf-8?B?L1JDc3VqNUFyWFV0ZVBuQ0NSZEhHYldrb1dPaGJiSjg3Q0UvMDA4V1dZNE5X?=
 =?utf-8?B?c1pPYkFJbSswK0dkWGhGb045Ujc4THIwZnpCSGhmQnh2WDN1WFRsSm1OaWhy?=
 =?utf-8?B?cFNZSDNUSVRtVTBOM2R6REw2U09oS0VFS0RaQllZNUlKRysvUitQNmxLTG94?=
 =?utf-8?B?VUpFZ2RMZ1RiZlFmS0FTQ2MvdHA1TllQaG1rS3BpZXhMeTFJUnJwdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e20d23-569b-4160-050e-08dec7d90835
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:46:49.6472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6qgWnBxpOvO56KuojuqUUvWqBZECuZ7+fOkycdudLUAziTW/yuRTh0Jnr1BFm4huuoOycPGETsm1bv531vihg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9645



On 6/11/2026 5:39 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, 11 Jun 2026, Muralidhara M K wrote:
> 
>> Although validate_message() checks msg_id, a mispredicted branch can
>> still allow speculative indexing into hsmp_msg_desc_table[].  Clamp
>> msg.msg_id with array_index_nospec() at entry to hsmp_ioctl_msg() so
>> downstream dereferences (including via is_get_msg() and
>> hsmp_send_message()) see a bounded index.
>>
>> Reviewed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index 36ff83744684..a9dca97568b8 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -306,6 +306,19 @@ static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>        if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
>>                return -ENOMSG;
>>
>> +     /*
>> +      * Sanitize the user-controlled msg_id against speculative
>> +      * execution.  The bounds check above retires the out-of-range
>> +      * case with -ENOMSG, but a mispredicted branch can still let the
>> +      * CPU speculatively use msg_id as an index into
>> +      * hsmp_msg_desc_table[] (here and in validate_message() /
>> +      * is_get_msg() called downstream via hsmp_send_message()), and
>> +      * pull arbitrary kernel memory into the cache (Spectre v1,
>> +      * CVE-2017-5753).  Clamp once into msg.msg_id so every downstream
>> +      * dereference sees the sanitized value.
>> +      */
>> +     msg.msg_id = array_index_nospec(msg.msg_id, HSMP_MSG_ID_MAX);
>> +
>>        switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
>>        case FMODE_WRITE:
>>                /*
> 
> Sashiko mentions there's similar gadget for sock_ind in
> hsmp_send_message().
> 
Thanks for pointing. I will update in next version.
> --
>   i.
> 

