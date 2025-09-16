Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012039.outbound.protection.outlook.com [40.107.209.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08622BE7A6
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Sep 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758016764; cv=fail; b=ZSjcQFAHXgPxmlBV2zixYIFAnOZ9SVxhYQRAucHFlHwonKOTsENukhLBsaZDvat0d7rZmzkEracWoL8lWqGQsygrCs0qNChZrC4vNIRNAMiNVx6sFukaF90ZtIF1TxEgdP8GZDt3G3RGpmO9CKnY7bxVp0BXQVPVE4bkY9eQ3Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758016764; c=relaxed/simple;
	bh=z3heQRxhXX+SSAfDGvkThsrDtN5KsOKoFJLd7FNDXx8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KlO1TZNrqPZYbqQqfcyx6Gs+f1PGcfuXw/ImVlr9TnEvPxZycUDta7dBMRBGRMefgkgTYGcXItAu0W9Np3y28XoV+95/7Di9O4+16KFdG8eR68AVhfjM9jw4TRpMApixYnsh2zNxnQgna7iJsqwQvDM9f0n1AUoZIUATbLitIAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xCmw8i9C; arc=fail smtp.client-ip=40.107.209.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xCmw8i9C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3D/fXz8RJAQiKPYIDONpWtESAjFy33je3zRrcsBsGNEmTArdIkvIZQMrbNpePFQ7n1XaH9yOF51zS0+KSXogVW4QI1fGHm/mCzHLVctfhN1frsriLti8uc97h9QpToDjjmDhntcmsiaBs2FXRp6hN3f7Dg+U1oAsFLCE+z70qDXTQXkCEaIEL9czJAgSvf0O7LllDlir5/JDz8fals/CKwWYJz+oRk+6hVH1C00AV21mBlnIzFFO/EBpw6IXhWcr5hL4bw6nV4LRGYZXpE/w1qTFaO4DK5WBtvSJf/Cau4+1aRwwY5UEPcr6vBDRCSRO849Gyrw2fiz6i4TZWtJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RL/XGIJQPEGbe3mYystC5mxiNL02NH9VxCgW8LDqws=;
 b=T1leah3nRmNr96z9BtwjKWiJuFdLKvci1ATUbHjhybSQ3dWGHPEePijC3EAT7qp5Haqm1YkwllGtZ5ZnUUGF4faQEjlXEF4rhIvnWS+TXdYmSjqq98AN5FVXA5SKPjLkv+1FqpdnVNP8HMrqDVOJkzszoV6aSE0ZkRFsskDJ02cyiEVEmR/HaL+eDcORbyrozqtKZdbeuQO8nhA3lsBr/sbH63aS5bL2z+NtMVMjzZZhDcWduqj399J7g0FuIUaEpTQURmN03MvYltY/BHhY40oQ9ey1rHrdtD3c4xI9OrTXVkjGXErbH/4rAOcnh6rtZoZ+0Xk6z8B9cE9hjK/h2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RL/XGIJQPEGbe3mYystC5mxiNL02NH9VxCgW8LDqws=;
 b=xCmw8i9CRXpLPQ3uyoZPHZLZ1rvycERfAe76YdcNneQDMA7gcmQmp4w4J3GYIhpCFXaApMnnXoDUvdjlDPlxMuAPeJIw305hj2k8FKWRrjnwNCQCBoLuf3iSUUUckk5Mj7lTGYbPsQ1Oit/JyF44QdVedeqq47qDb/C3a73bvbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18)
 by DS0PR12MB8270.namprd12.prod.outlook.com (2603:10b6:8:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 09:59:18 +0000
Received: from DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::c8eb:eeb9:cd73:b236]) by DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::c8eb:eeb9:cd73:b236%5]) with mapi id 15.20.9115.022; Tue, 16 Sep 2025
 09:59:18 +0000
Message-ID: <8b3548e8-eff8-4f7c-8dc5-077df69de76a@amd.com>
Date: Tue, 16 Sep 2025 15:29:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/dell: Set USTT mode according to BIOS after
 reboot
To: Mario Limonciello <superm1@kernel.org>, lsanche@lyndeno.ca,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
 Yijun Shen <Yijun.Shen@Dell.com>
References: <20250915094154.2765361-1-Shyam-sundar.S-k@amd.com>
 <9c25dc53-aff7-4ecb-b3cd-9ed9ed8cac23@kernel.org>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <9c25dc53-aff7-4ecb-b3cd-9ed9ed8cac23@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::10) To DM4PR12MB5184.namprd12.prod.outlook.com
 (2603:10b6:5:397::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5184:EE_|DS0PR12MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 404589fa-981f-4d55-3360-08ddf507b396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1NoUjVTNHA5UVpVQkZMR2oraTZtK3VEeHRPaElZSFdZa1huYzhkV0h4MFJ1?=
 =?utf-8?B?YWtjYVN2Unc5dTRBOGFrZ3QxRmtiR1dlWGRhL1pKa1F4OXN1Uy9mR2d0UjJ3?=
 =?utf-8?B?L2VNd0F0NGxjUzFQQ2dhN3V5NVpZbEJvQzhQNW13VnZGenc4QnRsNWd4eGxE?=
 =?utf-8?B?eXFxcGRTSElCSDFEM3BOUmtPQ00yNi8xZjdBUk90MEsyNU5TVGMvWXNlMWJE?=
 =?utf-8?B?eVN6eVdMZDRjRUt2OGZaS0kyK1dsTDQ2bmhXSDg0ZjY1SlBOaEUzK25idHNp?=
 =?utf-8?B?Yk9EVk8vbW5Ua1FwV2I3U01saFJNNmRFUys1cGFjdnNKMyttSy85ZmRQbWhu?=
 =?utf-8?B?cUUySGF3Y2s2ZmxiS2crcVBuaDVVdHdLRlZCU25IYTlia3VYazJQM2x1RktV?=
 =?utf-8?B?QmkzVzg3TXBtK2lNSFBUcEhhSXNoa2RmcmdSbVZQVW1jT1QydUNRUnpUcG5V?=
 =?utf-8?B?TktLUHJnTTk2MXVDTUZNanlrL3lkemgyejRtSWluMDEvSWRpeU5NZzMxVGFj?=
 =?utf-8?B?c3pTLzNzR0RNWE40MkpwcllqKzlrZ2VGdlR3N3JBclR4STdGb3V0WWw3Sy94?=
 =?utf-8?B?Z2ZYbFFNb3VubjNXcXNRSmJEMWx5Y3k3R2dHSmpWdjRMbHU0M3dkVW51NFVC?=
 =?utf-8?B?M0UwS2FyTnFUU3ZBMDBFcVV5WHZBMWlXdUE5ODRYUVhtTWhrMkQ1R0l1d294?=
 =?utf-8?B?SVV3dkNhMXdzNHJOU0FBdDgyeXRLdXBBVU10czNFcVFLQktRVGtHWTM4RnR1?=
 =?utf-8?B?TUVET1RDeDVFVFdvKzM1eFByVDhVR29RY1ZOUGREaTlZeDNIcmNGSi9hb2RS?=
 =?utf-8?B?Z1I0c01ncUU3SjQ4VEZqMHk0aFhxOEQveklpTFhKZDVkRGt5RElJRk4yd3ZI?=
 =?utf-8?B?Q0NKSUMyNkdUU0Y2S3R3clh5ektxMDhnc2R3NEc2NEFrSWhubEx6andLTGFy?=
 =?utf-8?B?akFOelBXQWZ0eHFVZGwrWXpBYWp0UzFFOW0zaUhBSy9zSktTSjZqd0VBZHA3?=
 =?utf-8?B?djFRR3RGTVF2a0J1cnFXVjJvWHBEcjRoSit4MWt6RzlwN2dYZjJIekw1RnZp?=
 =?utf-8?B?Mlp4K09kN3pvRjVSdXB0OVpUeXlHZGttWEw3bEFKZ3JNaFlsZ3lpTVl5YjFX?=
 =?utf-8?B?Wi9UcmpJc2hvdzhIbWVFSWlnN0VaUVZWUmZkQ2RrSjVEOFFVeVZNb0lETE1R?=
 =?utf-8?B?ejNkNDhwYkRKT3FEbTFBcENHdUtVOWQrbEtGZWxHckNlNW5XdkVjRWpBb1RP?=
 =?utf-8?B?UkZ4ZlhOYXlaTTgyMFB1bVBMazVmZ3VsL1hrMFJoa2Z1UWxKeG9IMnJtVFFp?=
 =?utf-8?B?TWdHeTJyWlNDZGlmcXdUMXN3VkphV2ZYaEhpaEJxRkxvaWRTMmxrYjh2RS9V?=
 =?utf-8?B?Zzk2S0t1dXhCeU9BYnhPcFR0S1V5K01pa3VWVVRMa3g0VUlIV284V1c1ZXI3?=
 =?utf-8?B?NTlsb1BqVkd0RVNaTCt3dnoyWG1aMyt5SWYxbWZLVnNnSXduVStZUlczNTFU?=
 =?utf-8?B?NHRkUlNZZFFCd0RhSWp0Qy9HbGZkNEtqR0tBSGtzZlRiVW41U2hNQ2c4eVF6?=
 =?utf-8?B?S1RHVXFUa0xkc0xOMzJMblpVZUZVSjFTdEk2bDlDM2tST2FCWUpJY2F2WTN3?=
 =?utf-8?B?SEtXTHpxVHM3UVcyekFRTEUvV3lLaC9MM3JaMnhENFJCWk5jY21Bazc1NUJD?=
 =?utf-8?B?YTZtQkpJbjYrRG94T2NyOC8vYjZ6M0FOZXU1TktrSzJlVGEySnA5bjYxbk44?=
 =?utf-8?B?anFsajR5blNFSnNHdEF6WDlBOWY4UHRNNlNkM2VMR1NLRXE1ZS9IUHVKci9L?=
 =?utf-8?B?YkxVZHFKVWE5YnVFbUN1YkdFdkFVRGFvUlZTaUhoR0lyOFdqOXc5dFVJR2R4?=
 =?utf-8?B?L2R5NWJ2ZUFJcXR3YzNHT0hGODVucXkxTG80OFdQbUIreTlVeGtGMGxoMEQ2?=
 =?utf-8?Q?43NnswiCOYE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5184.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjB6ZnpFam1BTktYRlI1aTNPRjBhQkZiZGlTVmhwUzNEWm5sK1NFMWEyc0ox?=
 =?utf-8?B?cnVtWW45VUsxOEtzcTJrWDJIdFhoeFBic1B0ek9sSHlIc2lncGdXdUVaNzB3?=
 =?utf-8?B?Vk53aVg4UEtidkp6R3o4Uk8wVjkvNk15OURmc0cyeUtOa3JWSnJSb1JSMktU?=
 =?utf-8?B?WHVTekpDN2NOa20vRGtQM2NWMi94aytkdFRGT090S2V5SmNLOWFVZUh3dUNL?=
 =?utf-8?B?NWZpL0hrT3pURE1PQjhpazJTZ095eGM2WnVmUExrclI3aWpYT2JDVURCNDdv?=
 =?utf-8?B?bFAwanh0OGt6YmFrWGxyU2RTRkJGai9JREtZczduTVduNE43a1lQaVRxT2F3?=
 =?utf-8?B?NnoycGlEL0J1QjRuU045ME9iVEl0cHRrRzJ5OFdVODNVcXpLVXVBVk9sQWJO?=
 =?utf-8?B?UElJZUZTaUJaYVhmU2NtampDR3Q2c2FlNGp0T052Rm13K3IxODhNSUlhT2Jk?=
 =?utf-8?B?UTYrU2VSWElFRlY2TUtQZStITkwzeDk5ZWFaWHlnaFBVUkM5NGZBQUJucjh0?=
 =?utf-8?B?Y1N4bVEyTmIwRzlXNTBqcEpwM2ZUcWhianFZcUhKL2UzYTdiT1VmbCs5clB0?=
 =?utf-8?B?R043bk16Yk5BSVlFSFl4SGNRcXBNMVBBaXBhTXR5MGZYbTZYekI0MGpMTzNU?=
 =?utf-8?B?MUt0akU0RVBGMXZIdGIvWVNYN29hZG1aZ3B0eGc5VjVqMnZTN0VlSXNmWVpk?=
 =?utf-8?B?TktNRERaUWZUcnpCUWZpekU1YSt1b0hVYzhic3lmc3VwOWc4b2JWa1pKUC9E?=
 =?utf-8?B?Vy9wOERPMGFaZ3RlQVNWbFJEb3MwMVdEb2FJK0xqaEp3N1lkVnhjRzRmVzBO?=
 =?utf-8?B?cUZCSmJRUG80V3dpT2daYTV6Zkw3L04xVmVCWkFMQ0E4cnR5Zkg5aU41TDJP?=
 =?utf-8?B?djVDSkpzZUtNVWhxSFVvMEU4M212R1kwaEVBTWFvUEU4TDBHYWhBQUJwbkdm?=
 =?utf-8?B?RWIxVHpoa3c5NCt2UEFJUjRCOTdmL3BCY01QbXhSS1B6bWR4SzRwbFA0QkRL?=
 =?utf-8?B?NGtZNjFGVWlQdVlnQ0ZKMldna1JKbDJVOHBOTUorTGhDNWg3cUdHZVhGMEVs?=
 =?utf-8?B?QnNJcXBodWZNV21XaDlsUFkxNUErNjl3azZOMU9wdE1VT0VCUFlldVg5YXEr?=
 =?utf-8?B?S1VBM3YvTWpzbWIycTNQYXpCOXRvQUNZbm5sYWhhZE1JZkw5aGt1eTFqaDJz?=
 =?utf-8?B?OTRkTG0vSVlKYzB6d0c5OE1KenRvem5ab2NEd3VNUWlvYnZneU90aWVrTFpL?=
 =?utf-8?B?ZTVrVWV2MGtCc0dFU1dpNUExalRCaFE1d3FTWTJ2QURyOGxqTjBNRXg5dlVK?=
 =?utf-8?B?L1o0RTRzQWdSNEVBdVhuQkZvRS9BUDhDem5vc0UyY05KMVBDSzc3blNmNHVw?=
 =?utf-8?B?clBsNG1MRWlsQnprbEtjaUMrYTYyMlk2MzYyLzlhVWJmK2tTc2I1cjlCd0FY?=
 =?utf-8?B?VjMyS0NaakgramN0YTFSS1pvUUt6UThzZmdTRWVsZGt5UmZFd1FjdHo5Qmxh?=
 =?utf-8?B?anozZEJNZ2xQYmhNOTJBcWkvWnJKZlJjYmU4YXdDOUx6QkhOTkxRQTlDdGEw?=
 =?utf-8?B?ZGpCZmtRZ1BhTUVCNWdxOUV4S1FLRk0zTVl4Z2pkSGNGaUh6eHhwbnliY1RG?=
 =?utf-8?B?ei9nS1o3S2VJb3dlK3VpZ0d6QWtnOWtGbkxybWM3Qis3VnloNktmaEhGY2g5?=
 =?utf-8?B?Umphd2lyQ1Jhd2JuL0RkODBwenl6clNiTk1YZ2hFWWNPTlloRHNSdzU3RnEz?=
 =?utf-8?B?WjVsYVN3TExnc3l2eXdDRDVMUmFlcXFEM1RwSG5SK1NETTBwZGJCMlY5QzBv?=
 =?utf-8?B?bGtoWC9iRk5BOXR2cXY0K0JVS2tGbHl6Ukp6QUU1MjJETVl3NHpJOENUeDU5?=
 =?utf-8?B?amRUQld6NUpETmV4Y3V1OEVmc1AyNmMraVVpVEVIZTc0YzBxd2g4alU1dEFw?=
 =?utf-8?B?ci9IanZIeTd3d0FBZm12czRsSFR5TTRSWm4xNkMzcTZ1d21FOFV4Z0dJL1h5?=
 =?utf-8?B?TldiaElFeThnQ3RBeTN5R2cwV2JDaWg2RGVTZno3VThLRzNUREYrN1MwS1pG?=
 =?utf-8?B?MzVzVjMzK3dmT05LNzJPRXRxRms1QUtVWHkxRm1HZ0Z1WGZpdThhZ3FySW5y?=
 =?utf-8?Q?x8InaXud/mOSQ+4cedYwjOggd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404589fa-981f-4d55-3360-08ddf507b396
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5184.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 09:59:18.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQTJq58zG3EzYfwKPYNu7eXl2najATFhdMGIsmqTzLQYwyZ9Vde6ZvC3krUnARKIUD1+QQsr4EtW89NseSvnyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8270

Hi Mario,

On 9/16/2025 00:30, Mario Limonciello wrote:
> On 9/15/25 4:41 AM, Shyam Sundar S K wrote:
>> After a reboot, if the user changes the thermal setting in the BIOS,
>> the
>> BIOS applies this change. However, the current `dell-pc` driver does
>> not
>> recognize the updated USTT value, resulting in inconsistent thermal
>> profiles between Windows and Linux.
>>
>> To ensure alignment with Windows behavior, the proposed change involves
>> reading the current USTT setting during driver initialization and
>> updating
>> the dell-pc USTT profile accordingly whenever a change is detected.
> 
> No need to refer to "this change" or "proposed change" in a commit
> message.

Ack.

> 
>>
>> Cc: Yijun Shen <Yijun.Shen@Dell.com>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>   drivers/platform/x86/dell/dell-pc.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/
>> x86/dell/dell-pc.c
>> index 48cc7511905a..22248cfe21c5 100644
>> --- a/drivers/platform/x86/dell/dell-pc.c
>> +++ b/drivers/platform/x86/dell/dell-pc.c
>> @@ -228,6 +228,8 @@ static int thermal_platform_profile_get(struct
>> device *dev,
>>     static int thermal_platform_profile_probe(void *drvdata,
>> unsigned long *choices)
>>   {
>> +    int current_mode;
>> +
>>       if (supported_modes & DELL_QUIET)
>>           __set_bit(PLATFORM_PROFILE_QUIET, choices);
>>       if (supported_modes & DELL_COOL_BOTTOM)
>> @@ -237,6 +239,28 @@ static int thermal_platform_profile_probe(void
>> *drvdata, unsigned long *choices)
>>       if (supported_modes & DELL_PERFORMANCE)
>>           __set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>>   +    /* Read current thermal mode from the BIOS and set the mode
>> explicitly */
> 
> It's got to do with extra ACPI actions that happen "by the act" of
> setting a profile, right?
> 
> I think it's worth explaining in more detail in the comment /why/ this
> helps so it doesn't get removed some day in the future as part of an
> optimization.
> 
>> +    current_mode = thermal_get_mode();
>> +    if (current_mode < 0)
>> +        return current_mode;
>> +
>> +    switch (current_mode) {
>> +    case DELL_BALANCED:
>> +        thermal_set_mode(DELL_BALANCED);
>> +        break;
>> +    case DELL_PERFORMANCE:
>> +        thermal_set_mode(DELL_PERFORMANCE);
>> +        break;
>> +    case DELL_COOL_BOTTOM:
>> +        thermal_set_mode(DELL_COOL_BOTTOM);
>> +        break;
>> +    case DELL_QUIET:
>> +        thermal_set_mode(DELL_QUIET);
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
> 
> Why even have the switch/case?  If thermal_get_mode() returns an
> invalid value you already will return current_mode.
> 
> IE I'd think it's as simple as:
> 
> /*
>  * Make sure that ACPI is in sync with the profile set by USTT.
>  */
> current_mode = thermal_get_mode();
> if (current_mode < 0)
>     return current_mode;
> thermal_set_mode(current_mode);
> 
>>       return 0;
>>   }

Okay, will make this in v2.

Thanks,
Shyam
