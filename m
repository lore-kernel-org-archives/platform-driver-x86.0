Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011038.outbound.protection.outlook.com [40.93.194.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9663793B0;
	Tue,  9 Jun 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999582; cv=fail; b=aqS2pr3xylheC4ePclha9QkEkoyorBPGC25kXiatqqkNfVw90dOr+88a3GOaecK9QjzgG1w2UvrOjyAfZZshDG5UAay4x3BwxAMh3asSB8gX3/NgSBR48ksUhtBC5CY8va8w1Ay6UNm0GPr8blBPNmNpY4PIAyjQob0FH6mmKsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999582; c=relaxed/simple;
	bh=YR2Od5lOS5gv70tE4L922f0UHG88ETkKChWqdCkQMV8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Of3NJms1UbQKXYRw7CaY4jq/r/4vqiz5+EXF4NRTZE2CvbzcL3jFk9AaSVoqYQGgYM1Ehu9PrZpbiIjsBn85GbH2+zBQEhHLXIYieZhom5SWayzfpNF0tCOn1w8O12EmJsS+ZJrXwXm/ZaQBtey52r9S2a97/hGhDNkAo6oEN8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zuraLcYs; arc=fail smtp.client-ip=40.93.194.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zuraLcYs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r828xWiN2kZ4EhQPg/naP8K09k3nJ9K0WNMRlEKSaT1UFcfnjCTzWNflFCkbluudtRrHtFb9M4OrRX0trSmQmfIGdwEdiVMOU6OcqzUsQa3rUt4s/OBYGtAgYBFcCBsWqlYnXi+4qnPee4tNLvWx14jWACu+99vidFcc29Y2B/gTDYGD7LVvegVvAPwnMhmHWHemcJbs7OmP0qAFdmOdq3ihCD5bT3Q2yc1l7iy6bCdZZv8/VFN9V0pZbBtHWJy1b56CvScKMd48rVAVu+soUFxeEkVOY0aXXo3RY6rnz+l1ZE6rYVx82sLE0tCWMzGua/EvhbzS/Q5hGQzzJw6qmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brjfXbTtuRZBx9zBt/lCc+YxsY9NBPr6jzeqLhJPwA4=;
 b=RNx6g8Exda/x8bAmkGZI+GTYyNasORw8YtlLLAaznRFumzYR+H8fUIGxtcEgspFh6DfhIZAfblNacyMg66YsdwZZ0OG1Lj4ZZivADkOADVdkQ0uPGLUoeaI3Fw2rzJHF7vhC2H3mSEuwXIFCLZOA3DKBKa2PsFwN8AuCVJPd4yIPP1vxtfxnvkYV9iK1UnqAdBu3GmZOm8E03l8AFc0dSbvEirKn+EXiH3l/1XOFdgEoj3nx9PiEIAEc9jtstQZBnAO03UN+jEIsi7CM0mnO5XLOY3vY0kKlVvsYf3zvCpU1KVwEz1mnexSIoQl9obUC+K34UKsjneN+WZA5WoiuZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brjfXbTtuRZBx9zBt/lCc+YxsY9NBPr6jzeqLhJPwA4=;
 b=zuraLcYsfBshPSu5hYA+D7Xl64W0VrnxrDzWag+gSBnzD5gBhOUMpKjHkFO5R8gPamqAZEqBhFm5jpRePaImbpQcVzxFx4V/JXGa6ssjajiqTA52jhi+LnG1AgoVnWQYlADBKob+Ng672lVXaDyCY1CvgOjEkQkQJRMIVj51ya8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by DS0PR12MB9726.namprd12.prod.outlook.com (2603:10b6:8:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 10:06:15 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 10:06:15 +0000
Message-ID: <e9f8da40-359d-40f4-9746-b711d1127f31@amd.com>
Date: Tue, 9 Jun 2026 15:36:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/8] platform/x86/amd/hsmp: Add new HSMP messages for
 Family 1Ah, Model 50h-5Fh
To: Qinyun Tan <qinyuntan@linux.alibaba.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: Suma Hegde <suma.hegde@amd.com>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
 <20260528093954.2461272-2-muralidhara.mk@amd.com>
 <20260609081456.1152820-1-qinyuntan@linux.alibaba.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <20260609081456.1152820-1-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::8) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|DS0PR12MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a6379a-b76b-431b-f7c3-08dec60ebd85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cSlVhmolY0JHiFY2sgMaePPwJWIpqPUy6171tKVH+V7JqQkygbfGDOJ+G85fDUbCy4C8Z6+PCxquQsWf5bOMYTYj6jK1OyPaf4VNYdf62TDPLZgnILbv4v83Gg4fISC98sI386dUU2i5zfCY0GONI5gDy3/TPOqwgx2/OFItIpFw+n8FvBOmrYLAAakfzEaVsm82fDOrfzc7HM9r4zo0rkgvvoDtFi18APLjGqCHDfEbm8Ou6wZsLlCIrOEuPxmQ3NeCjvzrNsZ8xpB0d3BZlkkxHIGOvmXe76DdCMUK+7z6ZfgB6M4sMf7hbyB1IRUBahEVRZES3U4OParTK+0/BjsA2ivj58WXUL46fungNsNIWqg+1wmfDvhvMLCQv5YWJHfeUhS1XhFAv4Jkh5r+XTKJ1i7/Fp7REXfSX4WzrtkUhEzsBtnvlZE8fY2+VzEQyjkKdxYx/tvnDwQx5/RlTxXHRuDo4SMXSJfArGHxKvwdhSkdO3VSaoZc5Jag32kPTnW5ETJvMNVra/wx90mY+/tsaxjgFzSxfLfOOvjdCyY2H7GaHPGfZhf8sMfN75bCsCg3MnHunMknZlDUs+J4KFNbn8gSHLr8h32lchJNHavaHTb6/sedCCswB0ZBgqY755QUkTOpufLZk3MW+XCByF5rsayC8+l2gcpj0tKKoiZsERui6WRCqm0YYYH2fEC8gc2Sa461vp5YZW+dX4YZ+w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1FVanhMcUhnSmpkWWo1NVFMOHk2RThmU1U4OXdueXdXODB0SXhoTXYzU0h2?=
 =?utf-8?B?RndqbGJSSkRoZnAxTlh3ZGtTU1plbUxWYkFHa1dIb2c4SGdRQThaMzlRMzIz?=
 =?utf-8?B?ZmZFYjV1Q05zU1pBbWk0Mk5GWHNjUWdCWDhXSXdldTRla3BqQ1Rxd0o0Vjh3?=
 =?utf-8?B?WW5YaTUxQmYzSTVHaktWQlh2OHdIU0RFS1V1bFNBSUdqUWV2dDVOUW91TUZN?=
 =?utf-8?B?OWhLZkpyRVd4cEUrelY0ekx4c1Q0NWUySTI1aG5CYzRYRVFCbW9kME9qRnpR?=
 =?utf-8?B?elJETFRQazYxb1FkMXNUVndnYm5Wb1pVTVltZXJGS0JGRVQ0YUp6Qi9TM3kr?=
 =?utf-8?B?SUNibmV1SnJvU2pMZGdhY3B5Y0M5enNqZENKYW9Pa3F2dlB6QlNkMFZyNU9l?=
 =?utf-8?B?NkQ3QmFmdVJ2dnZrQnV4Y1RuZTlmR1JBYVFYaGVzamk0NXYvQzR4emhGWWNs?=
 =?utf-8?B?SHcrT25SQ3BiM1BPaXRhYytIWUlTRGJNU25vR3pQbjJvUys1MlE1Ry9nTmZM?=
 =?utf-8?B?T1dtd25LQWVBbm0zbDdac0JjREdCZGQ2QWRsRGljcEl4UEY4M2VsWmJEODVx?=
 =?utf-8?B?TjZyV0dwQzFiaS95UE4xcVdGZzhuaUc1Yjh6T1E3dVhBRDUwcVF3Wks5VEZ0?=
 =?utf-8?B?LzZ3MGxpRmtaeTdZZ1NzdDgzL2lINzJmZkJHY3N4MUc1OGRjL1hlNEdweW5V?=
 =?utf-8?B?eldmK1RzVWJOS2hpNmVGNTRVcDVRRVpKNUtGUllmTnpwOXROVmxiTlBsanRG?=
 =?utf-8?B?NG1kNVQ2MWxWQkJ4ZDF2bGxNMUlxdGlFUE1YM1llclc3K25SSm9KWjdlUTBp?=
 =?utf-8?B?N3RPZ1RXeFdKSHk2UFZJM2orU3h3Y1RCbmRBYUIxL2V3RUsyZ29TY1MrY25D?=
 =?utf-8?B?QkRhK2pzSkFaa2RCbkgwZlFUSWVubFNCbml6bEllNDRSWENOTkdPRkswVitF?=
 =?utf-8?B?czNOYWhXZzF4QndxMGZjblB6OTNIYVBZWnMyVmRYbVpQNS9odEYxdHZGZlQ4?=
 =?utf-8?B?KzIycCtucGtPVlVFSHZhYlg2TS9UeUx0bnJ5aGhOUjdQc0FMVlhyTGlLa1hu?=
 =?utf-8?B?dFEwdUVGMHlJZGJrN3kwTHR5aEZiclhQeXIvbkFqbE1rb0RJUDRXR2s0RDd1?=
 =?utf-8?B?dzQydTFXMUFQcSt3V2VOWVc5SVkxazZUMGxjMWhzZDMrOTliSkZUVXVycS9P?=
 =?utf-8?B?VTk4QmZac0hiS2RPUjFEdlNKNHZNZTRDMnlQN21jYmFadVRYUndiVGppQkVF?=
 =?utf-8?B?ZVN4QmQzMU9sVjBFL0JSWEF5Sm5FeVlWS1NDMWVkOVZ2aFZWTW9kQUErTlZY?=
 =?utf-8?B?TTEwVjJGYTFSZ2ZuYmVuSjRtdU1raVJmRVZuS1R3ZDFwalJoY3RWdERzSDcy?=
 =?utf-8?B?NE9XS0FZdTFkSEJFckU4YnhMSUxOemZPVThBY0dQU093d3dGckZNc0NJY0lF?=
 =?utf-8?B?NTQwSFFiYmsrSXh5Q0xVcW1GQ3VjUkVCeTNRTEdiQkpmbFRBb0RCZ3UrZVZF?=
 =?utf-8?B?QmQrbnJha1BYUlFlclhSWGg2VDBZWDhDTmxiSTJJcElBNTRHbDY1ZmY4MTc3?=
 =?utf-8?B?Z3QzRWxvQzBlUmlYUEM1WlhnZ1l1cXU1aTZIbElqdUtmQVNGUlZpaUt2ZFZw?=
 =?utf-8?B?VU52dW5iL1hUZkZlQ0J3UXhqcGw0dS8weTUxUG5VRTYvblBlK3prRFVUcXpM?=
 =?utf-8?B?V2hlRVZFb2liNU53dGtEUGJjT2RNKzZaQmFHL0RGN01JZVg1N3B0Z3dWek1z?=
 =?utf-8?B?UEJQOGdFMzJhSS8yaVpPZUs2SElpT3lUNXB4eXhUT0YxWHo3S1BiVW9iaFpF?=
 =?utf-8?B?SjBGSWdLSjNYUlQyelBHcEphMHd2SDFHK0hoZnVUSDVlVFR5VXRUb3J1Q0hV?=
 =?utf-8?B?b3pzMnVVL3JrelAwUkNFYityU1R3YXh3QkI3L0FCNysycjcveTU0bWpQTGUz?=
 =?utf-8?B?UGJjd1ZZS2hFOHl0dEh6Q1NlUW8wdjFEdVFsMWVwbmlGR29BWTFsN2dQd3ZL?=
 =?utf-8?B?bDgxU0FkOG8zUFJIYzJmaU1UM2ZSbFdXK1ZzOW9iUGFxU08zamNmOTMyN3Q0?=
 =?utf-8?B?bGROajd6cEJMZTJ2dGpXWTdDTVl3NDNLcWRneHc3TTlDR0Rod2FQdTZlRXBO?=
 =?utf-8?B?cHd2aUx1UTdnc2lMaFRWQm9jSEFYemxQcUF3Q0ZxMHZza3BhdlQ0NHZ0SWx5?=
 =?utf-8?B?ajk0UUdaRWIrY1dWa2ZWSzN1WEY0cXIrWDBNejBsUVRHT2NpdFpETVRNcUJR?=
 =?utf-8?B?a1hwL2tpb1hLV1k1NlE2RCtmVVIvdS9PeEZrZUp3RTc2VHdncEpTbUNmV1Ix?=
 =?utf-8?B?SGtSM3I3eHdtSVprdldkdjllK2hzRVRWOUYwOEJtSXlacEl5RitFZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a6379a-b76b-431b-f7c3-08dec60ebd85
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:06:14.9304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pxxPB7Lre4VSEswOk7ZUhtG61/eNTe2/DgszaCRRd81UdbLQiKO8dFh+C3/wUe0SlhCvakpf1tzjSfsfKJZQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9726



On 6/9/2026 1:44 PM, Qinyun Tan wrote:
> [Some people who received this message don't often get email from qinyuntan@linux.alibaba.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, 19 Jan 2026, Muralidhara M K wrote:
>> The same firmware also extends three existing SET-only messages
>> (HSMP_SET_XGMI_LINK_WIDTH 0x0C, HSMP_SET_DF_PSTATE 0x0D,
>> HSMP_SET_PSTATE_MAX_MIN 0x22) with a read-back path selected by
>> bit[31] of args[0] (0 = set, 1 = get). Without converting these
>> entries to HSMP_SET_GET, userspace cannot query the currently
>> programmed value even though firmware now supports it.
> 
> I noticed that HSMP_SET_XGMI_PSTATE_RANGE (0x26) is not converted
> here. The esmi_ib_library already implements a GET path for it in
> esmi_xgmi_pstate_range_get() using the same bit[31] convention:
> 
>    msg.msg_id    = HSMP_SET_XGMI_PSTATE_RANGE;
>    msg.args[0]   = BIT(31);
>    ret = hsmp_xfer(&msg, O_RDONLY);
> 
> Since the kernel descriptor is still {1, 0, HSMP_SET}, hsmp_ioctl()
> would reject the O_RDONLY open with -EPERM because is_get_msg() only
> recognises HSMP_GET and HSMP_SET_GET types.
> 
>>        /*
>> -      * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0
>> +      * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0/1
>> +      * input: args[0] = set/get XGMI Link width[31] (0 = set, 1 = get) +
> [...]
>> -     {1, 0, HSMP_SET},
>> +     {1, 1, HSMP_SET_GET},
> 
> Does HSMP_SET_XGMI_PSTATE_RANGE also need the same conversion?
> 
Hi Qinyun Tan,

This command is not supported on the Venice platform (Family 1A Models 
50h-5Fh). Please Refer 
https://docs.amd.com/v/u/en-US/58264_B0_Venice_PPR_026
The modifications need to be made in the esmi_ib_library, not in this patch.


> Thanks,
> Qinyun

