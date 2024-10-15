Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7549B146D6B
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Oct 2024 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988866; cv=fail; b=Gde0O88365VOmV9NQHRpdmF/hrlfkfNyibvXCH/iW8jLsVF5t2dX/wumvSbJFt15P95zn+ISOEZgrQwIBl3gOMfkSTTvrK5hL/3yQiFFTt5JaYLWqZKb1U83rgLPVSVrD8AYm/Jj/jwNSxwAtP1O1AERaXEWd7EeVXLxYd64Mlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988866; c=relaxed/simple;
	bh=XJfzYO6PmDnxnUYMlhHHLEvylNbwWMMmEscZfF6PD0o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X59Pf8ae/aQXfk+j0V773XTTsgcKMddly7Ql8U1BVxDnp8mGMt6+fVObt97hd9lzwE8pJDbL8FfzQD1TOncAIzsjySVoQRHvb/eObwLU6QHD971VjfoNybHfwa+ahK0HjSZsvYpPLWM27mw9nK4H2H25HllDprvdfnc4PaQRD+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gBbyTRWq; arc=fail smtp.client-ip=40.107.243.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gBbyTRWq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQ1drKP/4Tri6nBkbQIE7ea6DLsOtvMvt0IUfaW8eCN0SoehKHA+JH3dQbD38qRwKVIqtgaQmgUQ0FR853LbJIDWh0BYcDBQyp6/3fFEo/Uq/GtepYQgxCjzevfsDGQ8gFPECz2R/0C5pQTkhMHgu+IlbI4DGOZhIRklCSGUEhrBaAiBZq8SbUqpDdogzlnl83zPDBl8jNbPFtUehubXFtf1lG50BoO4S/uDseIdRL+BA2P4UrEZDBW5mXMRe8tT+Q8hpuUUE4w4HCFyyajwSn/igzpjSbLmOrg5+IGQ1IH2LmJgLvCF/8qKHC8T035zYLvFlxSaUIgFsisejdpamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKI8oT7G2WwY2W59DjjwoeIlfEHZwcSWIlkWiPdxlaU=;
 b=MO2kQ1cxi356MFvHGnjL7SGzYfk264a1C1xRIghZBoQ9O4EWw2hAGdC9Zl26hTWOiN4QHIjgrDDqCOx5G97OnQ5YZ0IwF/76UiJNrO9/GS+km7bAGq3IVoOzT6wPkJnzOrT5Q77ftYaKLvZnEEwXhBTKybK20ZdiP9dHgqVrfbwkE4bKg/F0dHd5g/ZjmbQidwpe4ug3b2hI+d6VxaRsowJQ5J6z7Wu4XpNyEG4mmriP4jn30lhLNP5aj3sGn6UezqIJiTlJbI2bQUc57kXWXFlyunXZ0NkJsbxnHZd0dTylzYcidU2UPWmDNPoH0qQzciCw5LpawvCrsiXP4loGog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKI8oT7G2WwY2W59DjjwoeIlfEHZwcSWIlkWiPdxlaU=;
 b=gBbyTRWqc6rstnuDy/p2NsPCU3Y0Qio4F8/h6Lp+sLn3EmyXRHRInT0UzS4peFTO4aTi4Q9XQBuOBKnr+ByU/VoMsa02kZ1ukcGoCvbBmStkXm8Km0xHiixGB9LB+eGly8ys59nlD3zn3CW6jR8C9dk3ZAlhb6rX6vBk1Xkanks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by IA0PR12MB7776.namprd12.prod.outlook.com (2603:10b6:208:430::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 10:41:02 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 10:41:01 +0000
Message-ID: <c588ff5d-3e04-4549-9a86-284b9b4419ba@amd.com>
Date: Tue, 15 Oct 2024 16:10:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: please help with intermittent s2idle problem on AMD laptop
Content-Language: en-US
To: Corey Hickey <bugfood-ml@fatooh.org>,
 "Goswami, Sanket" <Sanket.Goswami@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <48c7aa22-7c0d-40af-80d4-538fd16327d1@fatooh.org>
 <MN0PR12MB61028BD76B3F88121289BAAB9C442@MN0PR12MB6102.namprd12.prod.outlook.com>
 <a6f7dc24-b56f-4f69-8065-d99dc43e7b06@amd.com>
 <4d0d49eb-c407-4d63-847b-69f155449850@fatooh.org>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <4d0d49eb-c407-4d63-847b-69f155449850@fatooh.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|IA0PR12MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 189344d7-f4eb-4ef1-35dc-08dced05dcd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW5QU3ZIQXFKMkhSTnl5UWh5Z29aMElIOUM0L3hnOFdMYVpFK0pHSEFKb0lw?=
 =?utf-8?B?WG9RaGZuQnp0UG1SVmFhdFd6ZkRtZ3JtL2FQb1ZlMTRob211U1pUVmVuN0N3?=
 =?utf-8?B?dXFRTTNGZEN5bzZvVWQ3RkN3U0l2YVpPanRpUW5YT3VWNUJKSFF6c0U5UUJk?=
 =?utf-8?B?YmpROTkzUVRqTXFvUGhaMlFXZWEyU240WHVrSmt0RFlLVDdSQmYzc2J4TSsx?=
 =?utf-8?B?K3NHTFFpcC9rRzF4dnpHMWs0eXF5TVkxcmV0Mm9BdGlTM08zcU1zcUd2TmYz?=
 =?utf-8?B?bCtSQ2JiUlhQMlhBSzJ6VHAyY0EvWmtZZ0h5MkJmdDE3MHhTVTRkbDFIQVkx?=
 =?utf-8?B?V1V4ekdYOSs2dkpMdXVEbVJKbk9mc0ZleUZ2WWV4WHBuR0h5Z2pJemVJZmVD?=
 =?utf-8?B?Sms4bmdDUlZ0RHpCWGx2c3pLN2pXNnp2eTJaN3haYmZ4TGQ1WE42UDJQNDRY?=
 =?utf-8?B?MFQ2eUNhVCtEcGw1RVptNUQ1RmRqYW5Uc0ovRXhSU0krU3pIVDQ2NDM2VW1N?=
 =?utf-8?B?ek5mbGE0M1lHUVc4MnhrRFdYV0Y1aEVXTTBFeFVqVEV5cTc3UWE3ZHBBNnNZ?=
 =?utf-8?B?b3NYNnJvYUtjaFNkZmpwWkY3MmIxcGFhMHY0VUZJV1Z5WlZMR0ZPaXhpU0VX?=
 =?utf-8?B?UG9veWw5NG5VaWNMYjdjZmRibGNYQ1Mzd1kxT3NUUitvdWlOMFBTMTVVcHVm?=
 =?utf-8?B?MTNtTEVKTEovNGtHTWpJb0JTVmErYksyVHEzSllaZFI3M0F6Z0YrdUIyYkRj?=
 =?utf-8?B?Vkw5ajU5ZktwQTQ1ZzdRNkp0aVVkbm5RcDc1elJiYTJzaHV5WFRlSk9FM1NT?=
 =?utf-8?B?Si9jRVdEUTJQQWgzbzNsOFlTKzNMTE9LS240WXMzeU44cFF2eS9HNThQYmJ1?=
 =?utf-8?B?WCt0TXpURDArUnpKU1ArUXJHS3BvTW5kdDFqS1NDbENWbnQ4WTlmOHAxWlhJ?=
 =?utf-8?B?ajV6K2RLbUN5aUVET3RTZ3dZT051UWV1ZmM5b2U2UUxQVXBHMjRIVlBPa1B1?=
 =?utf-8?B?RjJnNnl0anhjOVMyN1hwWFpvRzlpUENBbVpaVFcxSW5wY0Voa2RhOHhQRnFY?=
 =?utf-8?B?Z045YVR0K1VrVmV0b05jYnAwV093VDdTU3ExMWY5cUdoT1RFeDh3c1lCNlp2?=
 =?utf-8?B?cEQySG9ZR2w0RElxSWxUZmV2WDBydWYzRkQ5QjA0YXBSbUJja2J1ZTk4QnRY?=
 =?utf-8?B?Kzl4T1dRQStsdHRuVVJmbmZrdkNvZ2NGdXoxU09ldi8xRVRYbUVWZUtNVWlF?=
 =?utf-8?B?aC9tU2lDU0dHRUdjT3dxWGhEekJDNmJkaGVTS3N0MGFMSDJTUlg3ekNIMDlV?=
 =?utf-8?B?NnRZZlVCNkdIZUtiT0F4SVVrUzlEUTV6KzZNc0JRSVpOYXR4T3E4QXRRYU85?=
 =?utf-8?B?emI4MlBndEJ6aHIzcHBYYVlYVFdzUEhQa1JwVzZuajNSamFpTGI5L0FxZkJ2?=
 =?utf-8?B?U2hwb01OeWV1NVU0a28rRDVEb2YxVWNCYk93eG8vWVlyby9rUnByTUNkeUtM?=
 =?utf-8?B?SzQ4U3ZlYTQyVU11VGFNdHg4ZC9GaEt3YThwY3lRL0d3QldDL2JnaXdwYzBW?=
 =?utf-8?B?V05vcWFwRTJlTSs0QUpsM1NhdTdlK3BWbDJCT2xKdDFNaTFRZjc4YnRkc3hN?=
 =?utf-8?B?S2hwZ1JQSFhGRkw0M3J0aVZLQTlIek9vd0lyUFBWTjFnbXF1Z0l6OTJQKzFP?=
 =?utf-8?B?SERjYVV0ODZSaHJsZjZjQ20xTXB1RTB4a0Z3R1pCR25naVZrL2pvN3JnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TktWQ2kvOUEvS0xveUtvcGJKUDJObkVUY0wrZXppTEpoY240KzZmT3pwejZU?=
 =?utf-8?B?MDJDbUdldHNnMVFlNTlneENZU3RLZ3hDMjY0Y2FFUlV1WlorYVFaL1hSdjlG?=
 =?utf-8?B?bTlqY3cxYU8yQmxlOFFFUU1kY0huaUdseXhvQ0IzS21TeXZsOEpJY1pFcDQ0?=
 =?utf-8?B?VXFXQzNUbGNUL1JoUlc4TGpmVUZGM1RCcGNGKzZNS1JVOGhjNXZZdktQc3Fm?=
 =?utf-8?B?WUUxdkVka3VYVjNoaDBoWVg5aXNNcytTbFlqSGJqa0htOUthY0tkL3NYZnEz?=
 =?utf-8?B?YmcrY2VkVC9pVEgydC9UK1hjSVZQNDdUcUt5NzVCSXdjSHgzdCtTckdBNkE2?=
 =?utf-8?B?V1dQeGljekQ4M2NsVzJHUHJ5L1pFRXZ1Z1RlQmdJaHV6ajNGTE1JMXhza3NB?=
 =?utf-8?B?UlZXMzlyaU1FeGMyZFdBQjhqYkRGYnB6Qm8zdUQ1UUhqVUlmUmlhVzE4MzlT?=
 =?utf-8?B?Yityb1ladGsySzZPNGh1YThKVG1VbnEzclQ3NnNDcWRWeFpWN3psOGlibnVC?=
 =?utf-8?B?NkVNT2loU2ltZXAyUG9wbFVSRnFnNmxFQnhZYjVLWkUrZ1QvY0RtQUxZVnFy?=
 =?utf-8?B?aWtHemtoRmFkd0hkNFJ4MXNLT29MT1lFU1EwejJDUUpwajdYc3R5VEFESHlI?=
 =?utf-8?B?WUQvakd6Rm9wYzJIM0JqbXFOQVc4akRHUEFTVWprUjh5ZE95M1lCeXVvK0l6?=
 =?utf-8?B?WTZ2MUdndDVFU0lvelM2TWtRVnRoc1dFTnk1b0IvY1lLRTZ0dGJWSytOdDNo?=
 =?utf-8?B?KzdVbktQVDNwMFNENlByUVRMS0hTUzVkQTVnaFphOVZjWEYweWNzNFpyZ2lN?=
 =?utf-8?B?enlzRHZ5aVFyMjJ0dW45L3ArNXNQdW8wd3Vka1NKMk5yK1l5eW51MWlyUUdj?=
 =?utf-8?B?a1czZ3VyZFdFdW9QSUY5aWhSZGw0Q2h4MzdIRUdONm1jY2ZXNWRzUFdjUTEv?=
 =?utf-8?B?eXVDdFNnL2hjS2VYMnlqeENMWlc0QjJoOU9oTFN3eFdYaFdkMjY3OUxDeVpQ?=
 =?utf-8?B?TmJKUnl4MnFzdmFkeDdxakdxc1lTUTM1bE9nUGplbjE5dnI4UlN2T0cza2JE?=
 =?utf-8?B?WXZWY1VPcHJWdS9tQ1BQZ2tvSWJBZDEzbHBoekl0QmJRZWV1RkxlZkk4czk3?=
 =?utf-8?B?MDZPcm1jUmppNjlTcDlwdEdweFdqVmpaaXB0Sm5KczBQd2tyYy9EcHROaE54?=
 =?utf-8?B?RmhVNzI0ZTFZSWJiRGFCTm5zS09mVDl0R05sejJMUHVtR09HdTF6aFRxTStm?=
 =?utf-8?B?UUdMdEpnVDRkSzJUeUlPenorMkJWaXh6NUNRNXJFRTdZODZHdENka2R3bTZF?=
 =?utf-8?B?QUZEbXA3N21QYWNnUUl5NnZweVRTTzZzSTNETFA5cnZOQjB0T1dXY25MWFZ1?=
 =?utf-8?B?VjcxMGF5ckptYU9sZnlnSzJQRVJVcDdzR1FJOHRjdzNXUTBTQmJkU3ZsQU85?=
 =?utf-8?B?UDJxVDMyQS9VOHZVc0ROZUFFdUVkNmpwN0VGQk0rTm5vMUtRbGNCYVV3Q2M0?=
 =?utf-8?B?VDhidGw1TmhZQVhNb0VvNml6ZmJzR2ZWckw5dzJXSDh1UWVjMlpmUFZXUzd5?=
 =?utf-8?B?TkVGOTRRaGxnMTlRNE4yQWF2TFg4QVMrWEp3d0N3SkdUcHRqUGZVTWQwWEw3?=
 =?utf-8?B?THZubU04djh5QnlwUVdxVlprNldUeDY0M0tqYjRRc2k2VzNkUU1EdTdPcHRH?=
 =?utf-8?B?VGI1ckduZEZscWhCUlcvUkpRVzQySFduRm80c2Q3QXYrQWN2MytwdEwyYXFI?=
 =?utf-8?B?TE56RjBDUWwzWXlFdGVFdUkyRTVRVjVPL09WSTZqN25OdllXbFNkU1U5ZHBm?=
 =?utf-8?B?YWNuSlJublFOMGJtaDZkNFYrdURMU0JkNEZLSDloYk1zQ0doSVVrNkozU3Fz?=
 =?utf-8?B?M0lsWEFSRWdwQjVUTGlkMEFlV3M0SkdmMUZkZmpnWGtVV3ErODlPeUVCZTBu?=
 =?utf-8?B?ZE9zaitzckw4RnpIdUdRcXdJYWNYZlNCeDNzdndmY0VSd1R4VzVQR3phczJu?=
 =?utf-8?B?amViTXhzYll2MG9Oc0tLSDRmeFo1Nk9JTE9HelZob1lCZW0wSGUzbDBFRGtj?=
 =?utf-8?B?eWVSU1gza0FHTVRwdGp1Q0FzVE5ROGVkaFZvbHVWRkxLTzllZlpvRE43YzdY?=
 =?utf-8?Q?lrYsprfrqOjUcOkDqFlkIJcYb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189344d7-f4eb-4ef1-35dc-08dced05dcd0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 10:41:01.8683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnTDfg6AZ6PSVVmGrhY3fOo7p8yVe/BDY+y8t1p8TJDavNca8LRyXtgHUGImqggwDnvIIrQG2r07yd9iDrhTjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7776



On 10/15/2024 04:02, Corey Hickey wrote:
> On 2024-10-13 23:58, Shyam Sundar S K wrote:
>>> As far as I can tell from the code, I need to load the amd_pmc
>>> module with enable_stb=1.
>>>
>>> lizard:~# rmmod amd_pmc
>>> lizard:~# modprobe amd_pmc enable_stb=1
>>>
>>> If I do that, though:
>>> 1. There is an error: 'amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff'
>>
>> this is expected as the command is not supported on PMFW loaded on
>> your system.
>>
>> and..
>>
>> ret=-5 is expected on your system, because it does not support EFR
>> (Enhanced Firmware Reporting).
>>
>>> 2. There is a kernel WARNING (which I will paste in full below):
>>>      ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff 3.
>>> The expected files in debugfs do not appear.
>>>
>>
>> This is happening because, the ioremap() is happening for addr 0x0.
>> Ideally you should have got the physical address from the mailbox
>> command. But that does not seem to happen.
>>
>> I suspect that on your system, the STB is not enabled. Can you check
>> the following path to see if that helps?
>>
>> AMD CBS -> SMU Debug Options -> SMU Feature Config Limits -> STB To
>> DRAM Log <Enabled>
>>
>> If DRAM log is disabled, then that should be enabled to attempt to
>> take a stb log.
> 
> Unfortunately, the AMD CBS menu does not seem to be available in this
> laptop BIOS config. I can try checking with Framework support for that,
> but I don't know if I will have any success.
> 
>> No need to look at mp2_stb.c as it is meant for chromebook use-cases.
>> So, it will not take this path on your framework system.
> 
> Ah ok, thanks for clarifying.
> 
>> Note that I have looked at your debug patch, but it may not be in the
>> right direction.
>>
>> I would suggest:
>> - reload the amd_pmc driver with dyndbg
>> - Put the system to sleep "echo mem > /sys/power/state" and take the
>> dmesg logs
>> - get the dump of /sys/kernel/debug/amd_pmc/s0ix_stats and
>> /sys/kernel/debug/amd_pmc/smu_fw_info
> 
> I had not used dyndbg before. I found the documentation and ran this:
> 
> 
> lizard:~# rmmod amd_pmc
> lizard:~# modprobe amd_pmc dyndbg='file drivers/platform/x86/amd/pmc/*
> +p'
> 
> The result of this is:
> 
> lizard:~# grep amd_pmc /proc/dynamic_debug/control
> drivers/platform/x86/amd/pmc/mp2_stb.c:126
> [amd_pmc]amd_mp2_process_cmd =p "Invalid STB data\n"
> drivers/platform/x86/amd/pmc/mp2_stb.c:132
> [amd_pmc]amd_mp2_process_cmd =p "Unsupported length\n"
> drivers/platform/x86/amd/pmc/pmc.c:276
> [amd_pmc]amd_pmc_stb_debugfs_open_v2 =p "S2D force flush not
> supported: %d\n"
> drivers/platform/x86/amd/pmc/pmc.c:448
> [amd_pmc]amd_pmc_get_smu_version =p "SMU program %u version is
> %u.%u.%u\n"
> drivers/platform/x86/amd/pmc/pmc.c:609 [amd_pmc]amd_pmc_idlemask_read
> =p "SMU idlemask s0i3: 0x%x\n"
> drivers/platform/x86/amd/pmc/pmc.c:678 [amd_pmc]amd_pmc_dump_registers
> =p "AMD_%s_REGISTER_RESPONSE:%x\n"
> drivers/platform/x86/amd/pmc/pmc.c:681 [amd_pmc]amd_pmc_dump_registers
> =p "AMD_%s_REGISTER_ARGUMENT:%x\n"
> drivers/platform/x86/amd/pmc/pmc.c:684 [amd_pmc]amd_pmc_dump_registers
> =p "AMD_%s_REGISTER_MESSAGE:%x\n"
> drivers/platform/x86/amd/pmc/pmc.c:832 [amd_pmc]amd_pmc_verify_czn_rtc
> =p "alarm not enabled\n"
> drivers/platform/x86/amd/pmc/pmc.c:854 [amd_pmc]amd_pmc_verify_czn_rtc
> =p "wakeup timer programmed for %lld seconds\n"
> 
> ...so I think I got that right, but let me know if you meant something
> different.
> 
> I wasn't sure if you meant for me to run this with enable_stb=1 or not,
> so first I did this with the default of enable_stb omitted.
> 
> 
> lizard:~# echo 0 > /sys/devices/pnp0/00:01/rtc/rtc0/wakealarm && echo
> +5 > /sys/devices/pnp0/00:01/rtc/rtc0/wakealarm && echo mem >
> /sys/power/state
> lizard:~# dmesg -r > 2024-10-14/dmesg.default
> lizard:~# cp -p /sys/kernel/debug/amd_pmc/s0ix_stats
> 2024-10-14/s0ix_stats.default
> lizard:~# cp -p /sys/kernel/debug/amd_pmc/smu_fw_info
> 2024-10-14/smu_fw_info.default
> 
> In the dmesg, I don't see any further debug messages; I don't think any
> calls to dev_dbg() are being run (I could be wrong).
> 
> Here are the files captured from debugfs:
> 
> 
> lizard:~# tail -n +1 2024-10-14/s*
> ==> 2024-10-14/s0ix_stats.default <==
> === S0ix statistics ===
> S0ix Entry Time: 38004185743
> S0ix Exit Time: 38177312687
> Residency Time: 3606811

Here the "Residency Time" seems like a valid number, that tells that
system was in low power state for that specified duration.

> 
> ==> 2024-10-14/smu_fw_info.default <==
> 
> === SMU Statistics ===
> Table Version: 3
> Hint Count: 1
> Last S0i3 Status: Success

Status "success" reflectes that the system indeed entered s2idle.

> Time (in us) to S0i3: 385104
> Time (in us) in S0i3: 3606811
> Time (in us) to resume from S0i3: 115504

and here, it resumed back from s2didle. So, I am not sure where is the
problem. Like Mario mentioned, you can keep only one SSD and give it a
try to see if you hit a s2idle problem.

But atleast in the current logs shared. Everything seems passing.

> 
> === Active time (in us) ===
> DISPLAY  : 0
> VDD      : 0
> ACP      : 0
> VCN      : 0
> ISP      : 0
> DF       : 0
> USB3_0   : 0
> USB3_1   : 0
> USB3_3   : 0
> USB3_4   : 0
> USB4_0   : -4647714815446351872
> USB4_1   : 0
> MPM      : 8366
> JPEG     : 0
> IPU      : 0
> UMSCH    : 0
> 
> 
> The USB4_0 value stands out as anomalous; I don't know how significant
> that
> is.

negative number could be a problem from the PMFW or the USB4 IP
itseems. Numbers here would matter when the system is not entering s2idle.

> 
> 
> I then retried with enable_stb=1
> 
> lizard:~# rmmod amd_pmc
> lizard:~# modprobe amd_pmc enable_stb=1 dyndbg='file
> drivers/platform/x86/amd/pmc/* +p'
> lizard:~# echo 0 > /sys/devices/pnp0/00:01/rtc/rtc0/wakealarm && echo
> +5 > /sys/devices/pnp0/00:01/rtc/rtc0/wakealarm && echo mem >
> /sys/power/state
> lizard:~# dmesg -r > 2024-10-14/dmesg.enable_stb
> 
> 
> This time, I get some debug lines from amd_pmc_dump_registers(). I am
> including my debug patch here--I think it gives a bit of context that
> I can understand better.
> 
> 
> <6>[ 1143.655752] amd_pmc_probe: 1
> <6>[ 1143.655763] amd_pmc_probe: 2
> <6>[ 1143.655764] amd_pmc_probe: 3
> <6>[ 1143.655773] amd_pmc_probe: 4
> <6>[ 1143.655796] amd_pmc_probe: 5
> <6>[ 1143.655797] amd_pmc_probe: 6
> <6>[ 1143.655798] amd_pmc_is_stb_supported cpu_id: 5352
> <7>[ 1143.684758] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
> <7>[ 1143.684768] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:100000
> <7>[ 1143.684770] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
> <6>[ 1143.684772] amd_pmc_s2d_init size: 1048576
> <3>[ 1143.684873] amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff
> <7>[ 1143.684886] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:ff
> <7>[ 1143.684894] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:5
> <7>[ 1143.684901] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
> <6>[ 1143.684903] amd_pmc_s2d_init s2d_dram_size ret: -5
> <7>[ 1143.715734] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
> <7>[ 1143.715741] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:0
> <7>[ 1143.715744] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
> <7>[ 1143.746780] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_RESPONSE:1
> <7>[ 1143.746790] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_ARGUMENT:0
> <7>[ 1143.746793] amd_pmc AMDI0009:00: AMD_S2D_REGISTER_MESSAGE:85
> <6>[ 1143.746795] amd_pmc_s2d_init p_a_l: 0 p_a_hi: 0 s_p_a: 0 sz:
> 16777216
> 

High and low addresses are zero, because STB is not enabled on your
system. So S2D (Spill to DRAM) mailbox commands are expected to fail.
You will have to contact Frame.work team to get you the STB feature
enabled.

Thanks,
Shyam
