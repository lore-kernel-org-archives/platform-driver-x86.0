Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6586F2FE
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 05:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733202728; cv=fail; b=DCJOO3hZJ61lky4pTp1TKCKEnL6SZA8JKtBS+TneAwV9GBgsNFlOY+OuaxWnWcT8EclEj3M1CKUc6ybzr+omd1djCvuySTH3nA6J6sYs6UuCp82Uq95bN6mTulB3S/VxECcATwAm94ADen23GecQBfLC/8BMgA4h2q27poANFQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733202728; c=relaxed/simple;
	bh=byJL5qzOuC96TixqWxOjbc7ToEdx8sSqrhwV33Vblgo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bm/ChsRqmP5wFdLS5a6iv8ea1X8QlRy63iDNuK6NKuwvMSmCa9m4JCB25omiwYHzbIqrX7atOAou2lgY37t2zA2B9/MFktYbN9XICj604SoibUDQjq8Rv9+MQ6SgvwYAQ+2+Ty78mo3XOr9zfY8XbS8WuROkXB03llOBrY18Nlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=owfnEC5E; arc=fail smtp.client-ip=40.107.223.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="owfnEC5E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySbtLbud896penR+kl8pm29p2OC2MWrh+QJTkiP2JP7WVDNLmNEs7UtTq+keHFt+04HxJWtdkVrVERXT8EqCYDKhxEiCsZiftF7G/MpQnDIIyMEX4W6jNPHaQVlgOjZLOaWMAsgdbpN3b2t2BJhtmyogyS2+jAQm7QOSQjUjTOkKYshGnskZiOsfhB5FlIxxAtQWD2RBwWigSzfUbhJ9jqfgwTOgm11LX/5K48gcwV+Klz+Rert8ASankVKUjfSmHnAEKnewFblM0IxxH/W7II4OZpEw1mdbYhjFtRBenoCYkGFEvPz3WFqwrCCQrmMS95KNRmgWouSjqh0d2agtsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbfzcoNQa25WUy6fl33lRo6VD1simF9Uu3emwgnzh7Q=;
 b=UKNabeHIxg/YZC/f42Rtg8tygS1gosl1LV5pQ4cO/UARpvaqVGKlnXAeBZOqKvWgLTaQ7/0HOwxRwGMMTIof4YLReV3kKjbYRmZTfPa9Qoc9zSSh93C/X6NltpEUmYQ7Nhb1mxPrls20We1siJagFTOh3M1/AuqZpl2kx7K7Y4Gl7y5RnhYwg4Kx9x2Y6K7KRDkeKqRb86KBhLe695LursCtb/D2QUodO1h1k1PfTnp5qxJ4uMsvuDOpKZzkdTgv50w4/ozCMVoZFGPfi4JA3wXTE7l3Vt3Rtu84pH7C1rhv2JZxxtjl+3W7Ad2FxS7hcdr7xnWaZHRRlig+b4aE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbfzcoNQa25WUy6fl33lRo6VD1simF9Uu3emwgnzh7Q=;
 b=owfnEC5Ej+VLm39fIiP0eMiY/NZGSmo6s6Q+jfalDz5hovcU21vB0BxOJczSMeTXhVxIcTK8fkmrssnU/NhISybtGMXVSmoGma0NogvRYUOFBafuzh3uQhzvRQxkHnSkgthlmcJpY7LC8+sGn3meTRa/ZUefGM4e/cyLfxiTsUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH2PR12MB4229.namprd12.prod.outlook.com (2603:10b6:610:a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 05:12:04 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 05:12:03 +0000
Message-ID: <da755bfb-3b29-4b4c-adf4-7ce800f771c9@amd.com>
Date: Tue, 3 Dec 2024 10:41:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] platform/x86/amd/pmc: Updates to AMD PMC driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com,
 platform-driver-x86@vger.kernel.org
References: <20241108070822.3912689-1-Shyam-sundar.S-k@amd.com>
 <abf2b911-e3a1-f8fb-5edf-82cf989fc4ec@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <abf2b911-e3a1-f8fb-5edf-82cf989fc4ec@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::11) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH2PR12MB4229:EE_
X-MS-Office365-Filtering-Correlation-Id: c48a250f-d0ba-415d-2577-08dd13590646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFpXa1d2c1pJeGpiMXh4dmgvYzFlNDVMN0drVGdQQXAvUDVDekhhZmVMU0Mw?=
 =?utf-8?B?SXZvcVRNTk5pcmNuVlpPMVFmT0ZOc1J4QXMwa1EyWFliM09qZG1qbU9KbDdh?=
 =?utf-8?B?Y09PeWxPT1Q4RTI0M0NHNDl0cnJCY1VsMHNFTjJXN3UzKzRERUp0VHQyOUVC?=
 =?utf-8?B?MTNZYkNOZFR3M2VNNHhTT3h0dXVBeDJrM1ZMWEJqS1dUdVpRT0Rud3QrdXFq?=
 =?utf-8?B?a1lZRUFCblBvY1UwTHNydjdXajJZajVuTmpBMEphVFJKQWkzb1YxdmZ1VEhQ?=
 =?utf-8?B?bmhsa0FMVUNKQWFUQjA4OElUSC9xR011OVZ5ZjZuSWFLRExUZ0xxampuSUNo?=
 =?utf-8?B?QkRldEFJVExGbkJUb1EyUGd2UFRTUzUvSWJ5eHRIaEYrRUtCdlJoZlJXWlV5?=
 =?utf-8?B?ay9tVEhtbDBZbDdHc1ltZ2R0Uy81cUhxdDBqQ3I1c0ppZmZzbnUxZGtiWWJY?=
 =?utf-8?B?dmQ0WGlsd2hoUkd0R2h1bktkc1R2V0Z6cHhuNlNDdkRmMUxHQldEb0EvNWkx?=
 =?utf-8?B?UHEwNDdXTG05RncwUTZsWndUV0dudmp0dmZYK0pFWTZ6WlhNVVB1RlhLYytM?=
 =?utf-8?B?QXNwa2hKWUhqYXlCUEs1RnZzOFVVay9HdXdGaFVpOHZLWEt2THJRM2FCMTBE?=
 =?utf-8?B?dXlJUjNFTkNZYnUrdERNYlJpajZhYk8zaXZKc05GVnFMOFYzdjRROHlySG1D?=
 =?utf-8?B?RGtYWWZWbEFBOFlkcmxtMTNQRk1ib2hEelU5eHpYMWJHZi9tT1lsL0NodW9y?=
 =?utf-8?B?MlVSSXdqYXBLZTNYZVlyUEJjcFRPWjVjNmM3UkI1MWNwV3MzbWZMRjhRTEg3?=
 =?utf-8?B?Mm1SU3d4NjMwMzhCQjRlTlM1ZEdoOFlTU2xZekFIRFhYZDRPTFdaN3hIZVRv?=
 =?utf-8?B?M1pDWXoxTjFGREI4MWxvQVlIc2l2RGU1Z1Q1SGxsOEVub1NlMk9WZEZmS25U?=
 =?utf-8?B?T2dVUm5XbVhSYmJUZitIbFpRbnFlZVlkelJvZEowOFdaV2pzZlVQZ2hPQVk5?=
 =?utf-8?B?aXpUVkZuY2pneGdIanIxcmtld1VnUExJMm9HYnlsVUk5R2t1eDlJMDFOWGZ0?=
 =?utf-8?B?bmhTaENCVmJDK0hKZ2hpS3habWRSTFBsQ2thbkdGNndBMlN0a21sTnFyT2tD?=
 =?utf-8?B?UGdjVk1FbFJZRkhnRnRMbzNZeXpadEZBMlNac3N3QllKUlhkbTZsanpSSVdP?=
 =?utf-8?B?SmRuYzlkbEFNc1BncWJGWWlVYXdhUG56OXJTRGpORkMyZCtacjFoWVJvb05W?=
 =?utf-8?B?KzloS1RGdGN1em5ZeHY5OGZkMjZJU0N5dVR3bFVyc1gxQVdJN3ZUcUlkb0Fh?=
 =?utf-8?B?THVCWkNSUW1HZVdteTV0ZWxPVVRWN1ZiaVNoajZkTVlwKzkrZThzc1RBK09y?=
 =?utf-8?B?Vk40U1pYZy9EcDFQL010THJzQ29SOG9vdEJsM3hIcW5HbTROc2tNb2hleGNS?=
 =?utf-8?B?UXlqODVNOFlGYUJ3WTR1b29wUENvMjBMQ212cFFwajl5ZHd1VXJpaktuaVBr?=
 =?utf-8?B?ejNUVi9DRnpQaWM1eElaU2MveTFxRkh4WEJKTEtydjZuWStISDE0YnJyQ21z?=
 =?utf-8?B?TnhpMUI3eWxnVHdLRCtCWDVJWVpBeUErSUU4eEE1WHQ5cVlaRWlKcTN0NUF6?=
 =?utf-8?B?L0ZCbXp6MHVnM2pZQ2g3cXp2SGlIcWN5QXZsVllTVDhxMUprNzdMRU9KU0x0?=
 =?utf-8?B?cC9oaGUyaklMMFYrRFBDMkZSSGxVUk43UHRPUFhwQllvdFd5d09NZkFlRnRH?=
 =?utf-8?B?M1lXRS93WWJjcmNJUFlESUF5eDh0YjNDRkhWZFBnK2hHZytCNURhNDRpeHA4?=
 =?utf-8?B?eTdzR1hNdklpT3N0YVN1UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEo2VGtGd004aUtjemdQUTRVMy9rM1JnTEtHRmlZL25FZS9FWFFBSStnbyth?=
 =?utf-8?B?K0luQ0RpZW90Q0JXQW5BbFlVaitQc3hPZ09TUlpRWmt3TDNETDROb3p3ZEVv?=
 =?utf-8?B?cHFrTGxTdlFsNlJjRWRlWmhockZJcUl2UXNKNGRGNHRUaW5FamV0NlBTT0w3?=
 =?utf-8?B?VndNa2Q0WUQvMXBVMWkxVFhSYlpoQ2lZQ3ZYR0QxelVkeWhZclArRGpGVURY?=
 =?utf-8?B?T0ZCSUpaMk5UZmlCWGt1TVJLb3BFS3FVTHBWWVppL2hVbFhLNGtHUFhYZmI5?=
 =?utf-8?B?YUxqcVUyRnZramoyTlE1V0RzS1U1cUJLSXljaTF3R1VXSDB4ZVlSeUFSaW1T?=
 =?utf-8?B?ajVDcFdLQkxub0RvMlp4dE01UVREZnF3SXdqVkRPdEdJQm5lVHk0R3BJV2Ja?=
 =?utf-8?B?RE9mdGJsbGExSmg4NDJaK2dMT0dVSGF1L3QwN1ZaQWZKbUZxTzE4Y2xmWnYz?=
 =?utf-8?B?cG5udzFLNzZwcDBmWHF3UVAyS0xTM1grdml3ZS8vQVdGQ0JCZ3F3S1dmQUk3?=
 =?utf-8?B?eXhqTVd2NlltS3NYLzExNFdvMUhsQzNvNnA4eFFKZk9TbmFOSlpLUGhjNUh5?=
 =?utf-8?B?UFE1QUYzTnc0cDBmZUs2WkRRbXhLdXphQ0VpMk4rTG1QTHJwR1B0ZDZyUVNR?=
 =?utf-8?B?Sm95dGp1THZFU2N0d0ViRk0zUDZYNk5MVCtPLzdiWG9OTmtqZXphZmVYVW5T?=
 =?utf-8?B?Lzg3aytFUC9nWi9ld1JRVzE5VkY2OHlhVkJLZzBKYWwxaVk1TCtxY1A4ZlJZ?=
 =?utf-8?B?K2trRThGTzFGVGFEUDlYMFNSZ0lYeWN1ZHArU0x1UWtOY2pkcDFjVTBtV3RG?=
 =?utf-8?B?R2ExZG5iM3N0SXBmZmFlQTYrNmpMQ1VTZ3Y2UE9ra3ZpNkV2SUc1RkNTVWZ6?=
 =?utf-8?B?UVhNL1FuQ2VESkFzZjZ0cVJFQWNVc2JVemgyUHlBbVg5YzN5cnUxaEtZeGpB?=
 =?utf-8?B?WUpBcnhmRHZPd2xJcDIwQ1BGcjFFTC94bXlJemVUQmRYbkp5Ujg1ZU50RXJC?=
 =?utf-8?B?cjh2bC9VOG1Rd3p3em14elhQVk9mVUV3bU51Y1FJRmcyOHMwVDJ3a0U4TTdJ?=
 =?utf-8?B?NDZSRW80RU5zcC9lTEIrMDdWSUlXa0ZFVkJSOHByTjdSZllaTk9TcStnblVj?=
 =?utf-8?B?WEw2UUNRdjkyUHhRczNMbzhNb2dWSjQrNmg3NERiYmRkK21xQzdiVE9wYU5P?=
 =?utf-8?B?MmQrLytRc28rcHF6ZzgzSStXeTIwc05udW9hTmtuWFhTQ3dqV2d4aDJpd2NY?=
 =?utf-8?B?Qnh6ek1HdWEreVRnVms5YTEvVTJudUNFd2p1dkpKVVZHYWdmZWRNcXZ3STQv?=
 =?utf-8?B?VC9Gc1NqUHB5QTFnUW45bkpZQXlCN0RFRWtLc3c5eERUbWhoT0NjU1NUUWty?=
 =?utf-8?B?QnhDa0ZQSWEzZjNSbFRqUzBRbjBibTFadWJLeUNheEtqN0hZTkY2cDJWQkxI?=
 =?utf-8?B?YUFhRk9Wb2Z1eXdHcktkYUdPYXp1RDRYZ3ZIOS9FZEcvQW55WGJ5Slgxckpp?=
 =?utf-8?B?Yk9nRGJZdTF6WXZxdEtWK1RzS29RRXA2NVpvbjNhSnNvOGNYMzdFZk45Q0pL?=
 =?utf-8?B?ZmlYREpqRW9pbWtTYzRLZzhsRktoQkhwOTJ6Qi80M2FOaFR6dHhJYjdZeFhG?=
 =?utf-8?B?d3RUVjBWTkRvS0k4SzVEaHc1cTIwQ1FKRU5sVHUycmthUlJ4b1I2aldIb2tR?=
 =?utf-8?B?WHd3eWo1aTJPL2s4QloyLzI2dkl6RW5nWHo5SkQ4VkFvellGdTRPaG1KRy8z?=
 =?utf-8?B?K29aSEQycTJpMjEydmZLNU5uNDJUZ2k2ZEVQQnFBMnZVdFdaNTBLRGFERmxC?=
 =?utf-8?B?c3l4YlllT2crOVpTb245UFhzaHc0RWo0YisyNklEblNNYzhlVXd2cCthVlhS?=
 =?utf-8?B?NEtUWDlaVVp4SFBETFVZUHltYWNjaTg2QW92WlBsa3p5UmU5cUpZQXVGaWY2?=
 =?utf-8?B?OG5GSG51aTMvSlp1ZEpLVWRuTmVrTGxTdC8xcm1NRFl2RFdpcmVjRWpqRXQ5?=
 =?utf-8?B?Nmg2cXdtU0J4ZUhTblFwcTFPSjlHRkZiMXhqZkp2QTNtL0pua2VYTWJMaUM3?=
 =?utf-8?B?KzlXZm11dUNia2Rpb21GMElyRXRGWmZzejhFYlhIZTB6YUZiT3FGMWJ3SEo0?=
 =?utf-8?Q?N3T/Z0tBs2NLObYHMt5IS+ELX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c48a250f-d0ba-415d-2577-08dd13590646
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 05:12:03.8759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ey6CE8OYaoaNEpV0DjdNPtmhWGLHlMFPsogmq5tTFfnkbswbuwZD9TtgYfmBlk79ctg/8tw56qgYmRV5J/PRzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229



On 12/2/2024 23:23, Ilpo Järvinen wrote:
> On Fri, 8 Nov 2024, Shyam Sundar S K wrote:
> 
>> Updates include:
>> - Rework STB code and move into a separate file
>> - Update the code with new IP block information for newer SoCs
>> - Add STB support for new generation
>> - Add STB support for Ryzen desktop variants
>> - Updates to MAINTAINERS record.
>>
>> v5:
>> ----
>>  - Merge patch1 and 2 of v4
>>  - Update Ilpo tags
>>  - drop explicit typecasting.
>>  - Use switch() for getting the message port
>>  - Rename function names
> 
> Thanks for the update. I applied v5 to review-ilpo-next branch. I ended up 
> reordering ips_ptr and active_ips members in the struct amd_pmc_dev to 
> group them together.
> 
> While checking this series out, I notice there's also one sparse warning
> in amd/pmc dir:
> 
> drivers/platform/x86/amd/pmc/mp2_stb.c:105:30: warning: incorrect type in 
> assignment (different address spaces)
> drivers/platform/x86/amd/pmc/mp2_stb.c:105:30:    expected void [noderef] 
> __iomem *vslbase
> drivers/platform/x86/amd/pmc/mp2_stb.c:105:30:    got void *
> 
> If you could fix that please.
> 

Thank you, Ilpo. Sure, I will send out a fix in a while.

Thanks,
Shyam
