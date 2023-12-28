Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2042.outbound.protection.outlook.com [40.107.96.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452531FDF
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2023 06:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HTiP1T8+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9ods5Ypd6jOCojcpzKufysCwL33hOZvAA+kMkxgakAZ4zKRopAFtWj6jyq646Fifb2oTZn6uIJHalhLEYIB7PFx0Ctc2fo8WCQ0pElHruHdnzYktp3s3t2J6/M5Btgw6jvqnpoHe11u9KS4wm/OjlYoHQs+SIRTzmxyiR117jC6Wjtl9S+ARp8vPPEOhPzNioCGUglOYyofR3Cr9TwxL0sLy9blbrYvUycIkI426AZGnbWyJBvyqk+wBFyO74suCRS42U2hiZc9fyCQxn0MIRDZAdagsn0sKdwoYyQpFhKExJcDrsHTaUppLiPaqYY2pikzjt2eu6mZnZvy+EOr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUOt/M9tprmdI0hxb4FjiaxIdC/cBVEnzR0XM05XlCs=;
 b=TyoZUFUPJtRsM873yGIesF6+D4/DyrbRzhCGWsgAGL5ZBf458CR0D5yRiMXj8q/dsc3gFK495cX1BozH7p9SIPoeedKB3MtP7hS6T1uStrr/1qmQo0WN5g2vfbXpZLzDsKWBjg5TCihhOY9AGyzivVc7MCdKEZflJqifCCmSf8NYCKULNfApgMdFmJB1nqm7rgbUzf9GqEzt6SPGmebw7KxsSqOh4Eve/m78+0JO1wVS5/YjlCC8eOBox2bEbZKVvYrFdisW2X8o+2+eqQZ1c3P4P3IbkDIMGr04BR23IJZPPVeMyOLE9G+jJFWsyRsF+PFrBOIsYTTxBjB1x8Bchg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUOt/M9tprmdI0hxb4FjiaxIdC/cBVEnzR0XM05XlCs=;
 b=HTiP1T8+N4/moaAk1twL9fb/oVhb6FaM9WTUVgsyHoJZZiTMjS3yRYM/koTI2MwnUy7vnehYfo+KvUaK2FQ8w69UiTJ7/rdG2BaaidaN+tIT9NCD/9xmU7DswLKetKvK7okIhIDzh8RNyUKPPMNBlveEHUKoQFNBLd0yrPbFSQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CO6PR12MB5409.namprd12.prod.outlook.com (2603:10b6:5:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20; Thu, 28 Dec
 2023 06:06:52 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c82c:884a:3ca3:3319]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::c82c:884a:3ca3:3319%3]) with mapi id 15.20.7135.017; Thu, 28 Dec 2023
 06:06:52 +0000
Message-ID: <e3249256-8890-471a-8d52-3846f92272fb@amd.com>
Date: Thu, 28 Dec 2023 11:36:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 6/6] platform/x86/amd/pmc: Modify SMU message port
 for latest AMD platform
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
 Sanket.Goswami@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org
References: <20231227063749.1780900-1-Shyam-sundar.S-k@amd.com>
 <20231227063749.1780900-7-Shyam-sundar.S-k@amd.com>
 <46588b85-afda-28ce-7e92-9c14e23bf346@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <46588b85-afda-28ce-7e92-9c14e23bf346@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::16) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CO6PR12MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4b3f77-1639-4fd3-a2df-08dc076b2f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1RJXG8BIigGxes5iIuWgf9ILUoMoZCMleFnFEkTD8N+dgWAR+8FPlXhARr173AoE1LnsKU7plNPip2mSa0Vz5zWnnvnKWSsF4gxARGRLhpIpmE9DO2Z8YZc06FgSR8y01I3EfgSk6tFLBW6XCJ6IWpjizWZGlibe33jAGQ9i3GEw4Y7n/Edvt2W8lc9QOn4ZExXK9pFrA6Bl6xIz6ihEHsFBjzi/pN0JFhVBp16c+0FNEVuOt3DTOH+9lB2wKLU/rWPa273ViNDttNc/8+rmJTuRkzjLI9MEOz+GBdICfZX/4ubBg2VHML39NPnj9JU20tTlPPJQ3FrtcVf0fIqSRVUZBfdLz+BWqLGQQsHi9yD3fGlbk4ds4o6FpgTfWDVqYy5ARm6F5qf2RB/hXKx5BRZRH+8Kid9hNPvOyngghYBZQOduWO/GL5eD+hIG1b06pDlM8yJXoGO6nH+/XO7aickIICnAhuFXTxYtI5lUhKnCLOt3f0C/VBOHm8VuVX3kl0WxbBK6G/+MyvyNDAuN55NFN5spi5bV0YfqMuelJUP6VMH/pwhZ5saHg5IruVzo3Sj4Hah/1xZovKhsnXH5qpntM0IXS+hyFva3l7QMlBKfCl9rJCOMC13twkflMGeeNVESppxR1GdqOvemprLWrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(396003)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66556008)(66946007)(66476007)(6916009)(6486002)(4326008)(316002)(8936002)(8676002)(2616005)(26005)(83380400001)(478600001)(6512007)(6506007)(53546011)(6666004)(5660300002)(15650500001)(2906002)(41300700001)(36756003)(38100700002)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0YwMW4wSlQ1eW44UG5LRmNRQ2FsTUpEeEN3Qk1nbkVSWklxZmxKK1V2L3Iw?=
 =?utf-8?B?VVJWNzNpbERlaEtTWFNxMDl5MC9aK05ZSStBQ1B4NGJaMHBkWFZpSmVncjUx?=
 =?utf-8?B?cTB2K1JNcFMvazlkZUM2bHBuVTdaV21GME9Zd29BTUlvMnBlbTlzbnB4K1Fx?=
 =?utf-8?B?L1RoOHZqR0NKanRVTDFtNGRjNFpleUd5RkFQeGszRGRmS0phRVgrUXdoRUVw?=
 =?utf-8?B?YmlQbmZKVlEvbUtpbTNvaEdJUGdLY2U0ZFE5ZTgyOS9Lc0hLUlJPOVRYWG5S?=
 =?utf-8?B?UU1neE9DVTVTdGRJMHg0VUxsZFllZHQ3cmMzNUJHTG5CN2cwT2RQZFRUeTJ4?=
 =?utf-8?B?NHZDd2dySzhhQ2M3bmg4NkhyZVp2Z1JxTTFIaHZqQk1xUjVheTNYNXkxQVhO?=
 =?utf-8?B?UVNaTFBNeVRlTEJBUXNuK2x3Tml5Z3dNemI0MjlRZFVFemF6M2hmYkxTQjRy?=
 =?utf-8?B?SEtrVkdJcnpQZHZ2UHY4TU1IRGRqOGZNeUtZaC9tOFBCODdITjJBREVLRk11?=
 =?utf-8?B?d1U4VThiVGRXclIxNzlGQThHbFlqWE85Qm1wYTlZdXdUaTdOWjNCa2hMQnFq?=
 =?utf-8?B?RlVHcitIeGFReWRvNXYwZjNsUUgvZEdEMFpoYkZEQ0JjMk1OZkV0cHlrc2N4?=
 =?utf-8?B?Q1VBcWg1dWlUTWw5eC9BTzN6Rm4zUWJOWlpqQ21rby96Vnk3SVN2Ly94aVh2?=
 =?utf-8?B?WTJzSmxjS0wxeXNiZ3o4U0Y1N25PN3NrL0pFSFhwZlpyUkxLekMyMmVEeW12?=
 =?utf-8?B?N1JFaGo5c0FBN1ZoS1M2ZDFuY1pPSXRGb2pFMHhjRWdTK1pqcGFsRjRtZDF2?=
 =?utf-8?B?NGtmMmVYVWZ1VnArdHUrR25TYVVLL0JYd3R5Q1JLMnY5MENSMFUySWE5eEZs?=
 =?utf-8?B?TVg5MldnaXRjdWYwc1Z0VEVsR2NBWTVWbTY4UEhiT01Fakh2eEpIOHU1K21B?=
 =?utf-8?B?WXNSRDJGZzF2TzFkbTl6MnRGVm9tSXpwOXRSaVdxMFFxY1krcjd1d1MzeFpT?=
 =?utf-8?B?U252N2YyRVFDNVQySHJuNWJkaElFNU5FODRrU0FZWm5QQnlZTVNuZmphbXFV?=
 =?utf-8?B?emhCbkppOS9mUk1vSmd0SHBCUWUrY3lpampod0lsMlZYUXRqV1NKUmZmSWdj?=
 =?utf-8?B?d3MxUS9zai9kM2F2Snhoam14YVpVUjNkVWlaWWw4b2tOS0dCQjNuTTVsVE1m?=
 =?utf-8?B?dlVGNWJtMmlZV3R5Qk56WjdEQkwvMWREUENnbzRwQnc5MnBYZ0c3ZUNCYWs2?=
 =?utf-8?B?NkUvREpLQnkxN3hZM29ZSDZiVXA3ZjdwTmJCekpXZUNjRS9rSUxWdzUxRXBL?=
 =?utf-8?B?SkRKZUVqQXJQTE1ubEl1bFMrY09GYlplTVRTbGhaZElGNlhxUmlTTkhFNjJT?=
 =?utf-8?B?bTJyNk5OYU9WRzZOMkZxbW5tdWZqYjcxZ3BUTFVaWmZadGpqcTY2clZianBO?=
 =?utf-8?B?QTgrRjBoUDdKYUw5ZHd6clE0R1pMUklvN2REbFdMV09tOHcrZW5UR3hhWXZ5?=
 =?utf-8?B?VFR1eEZGYlFKUm9ySE9tOW5WS1o1NENvSTdORDhQSE1wZklIbDV3dituYzNS?=
 =?utf-8?B?Q2c2aHlneXBqckFQNm9XMEJyQnFzSVFZaFNXL2lSVzExWDRPOGsxS0dJenJn?=
 =?utf-8?B?QkxreUdkK0ZqSldCTk9SMlpUaGZEcXhjb0NNMnhsUHZha2pKRTczS1JmL1l2?=
 =?utf-8?B?eDcxVjBNZ1pRdm5leU9MY2xSdW9oemtlQkcvem1lazVQMllsWklGK2pJTlBw?=
 =?utf-8?B?My9uUmFjd0VrYU9IcUlrV3h1YWs0ODM5Tk1JTnJDK3IxMlZUYmhidUdvL0Zh?=
 =?utf-8?B?TitRUFFQU0svcVBsYXFqYUx4aDZ3enZNaURubUZZRlkzNTFxZ09UVkxqUTdw?=
 =?utf-8?B?ZS9aem9FL1Vsd05aUDhMeEYrKzFyak00N2U3clBINDFrbjhvVXhSZ0lTeWNT?=
 =?utf-8?B?Z1I4dWN1KytPclFndFoxS052OWtQek11M0VQdzBiMFVSd3BBK0ZtL3dVQllC?=
 =?utf-8?B?NDZ2d3FEVFA3VUNjTUdpbmhEeHlYZXhYWlFUR0ZaeGlnWXR3TEZPOTBQWndE?=
 =?utf-8?B?THBkWHZWTjM4bS8wSUdUc0k2WFJqa2ZNQnJhYmJkNXZ5UHFJb0crQk5EU0U0?=
 =?utf-8?Q?xhFALqKWeB9k3+Oy8KlusorZj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4b3f77-1639-4fd3-a2df-08dc076b2f6a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 06:06:52.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3L/MotXFmu2TbE/CGQzGukHQUKhosttM5e1k52xT2R2S39dids5UU27uZ4xehzLv2hLyN2TwxzW5wCMSx3nvLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5409

Hi Ilpo,

On 12/27/2023 11:16 PM, Ilpo Järvinen wrote:
> On Wed, 27 Dec 2023, Shyam Sundar S K wrote:
> 
>> The latest platforms use a different SMU message port(0x938) from the one
>> currently being used (0x538). Make code changes to adapt to this new
>> information.
>>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmc/pmc.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index c8d86dd392ce..acac2a4194d4 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -31,7 +31,6 @@
>>  #include "pmc.h"
>>  
>>  /* SMU communication registers */
>> -#define AMD_PMC_REGISTER_MESSAGE	0x538
>>  #define AMD_PMC_REGISTER_RESPONSE	0x980
>>  #define AMD_PMC_REGISTER_ARGUMENT	0x9BC
>>  
>> @@ -362,14 +361,17 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>>  	case AMD_CPU_ID_CB:
>>  		dev->num_ips = 12;
>>  		dev->s2d_msg_id = 0xBE;
>> +		dev->smu_msg = 0x538;
>>  		break;
>>  	case AMD_CPU_ID_PS:
>>  		dev->num_ips = 21;
>>  		dev->s2d_msg_id = 0x85;
>> +		dev->smu_msg = 0x538;
>>  		break;
>>  	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
>>  		dev->num_ips = 22;
>>  		dev->s2d_msg_id = 0xDE;
>> +		dev->smu_msg = 0x938;
>>  		break;
>>  	}
>>  }
>> @@ -673,7 +675,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>>  		argument = AMD_S2D_REGISTER_ARGUMENT;
>>  		response = AMD_S2D_REGISTER_RESPONSE;
>>  	} else {
>> -		message = AMD_PMC_REGISTER_MESSAGE;
>> +		message = dev->smu_msg;
>>  		argument = AMD_PMC_REGISTER_ARGUMENT;
>>  		response = AMD_PMC_REGISTER_RESPONSE;
>>  	}
>> @@ -700,7 +702,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg,
>>  		argument = AMD_S2D_REGISTER_ARGUMENT;
>>  		response = AMD_S2D_REGISTER_RESPONSE;
>>  	} else {
>> -		message = AMD_PMC_REGISTER_MESSAGE;
>> +		message = dev->smu_msg;
>>  		argument = AMD_PMC_REGISTER_ARGUMENT;
>>  		response = AMD_PMC_REGISTER_RESPONSE;
>>  	}
>>
> 
> You forgot to git add the field into the struct?

ah! my bad :-( Will adjust this in v2.

Thanks,
Shyam
