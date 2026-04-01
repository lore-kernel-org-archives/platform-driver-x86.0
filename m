Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8B36AB50;
	Wed,  1 Apr 2026 11:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044654; cv=fail; b=OyGLWmV5iwfZ1jXxpDE/KV25CYm3GB+4nfRC6VeHYE0r7NT5elSFov6omWqj2qWkM0uH5iYZwFPTGX9zFSPKlLYzJxoX42ry/cNsX+xeQWXk8NK2Edy7JY3ffYWfI8l1br02PJi64n4CkX20Az35Q7lI3RnwQ3AyUU/upGNmo3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044654; c=relaxed/simple;
	bh=xVV8VzcnGCBBzJeMns1E7Os4iFe9xt2eNcZN9JIPBI8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KpMfaBSXphXxr23E2euuES01tMGZMGk1OAbkE6f4G04nejKFiFQOPbJHAY3P9dcUnAAq+fcUD5aEYJVGkd6VPvAEHEF9YD2QoQ9Ma3kVUxZZ7v2gCjNTKwBG/aC/lB/iosslmC3SQOr9r+rokeB0XhJFHEgO6b9hcqFlTn+AJTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rwbe0b3y; arc=fail smtp.client-ip=52.101.62.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rwbe0b3y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYYkxiedAbhGEC5M4Xdm+seYxpka6UqIQFSyOr0tajHgsnLlZbg6kX2HVg5YzMFa3Tz8kB1PK9L4QV2P7/CCPqVr/RxAHowQMtgklisJB7Z2M2Ik8+YqGd0Qdnow4dwa68pk28/1cPGNjs8HnTFkukF9Re5Oax/0s25cAxsJBxznYlsoUGTgHEARsOvaLkaVpI+Z3r7GLRZ3gnj3u/yDcsizx7TZWBxXFfVZ93G5pQVYVJJr6AneoELwr5dYNIEYYCnHkSc0iv95+Gba7ExfbSO8Yv8osF+Up4op2uGO5NV3eKrZ16iY+mpcE92vm2bRzUIlW2Laht02gO3qR//XmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PsNfzaqT1TcoP8UQ97hQJYw1K8xBSY2+wCxbyCbXUVI=;
 b=x6c08PA3ee9FFogg9nY0Az42OFL52A1gEaHaaDNDqdOzj54H6+0Xi6qzqFp2MAACnVHkLGhf7ZL9LgcDiNOjp1UI43Ck8KDLQL4DrQh4GvPhVrXgAr77Sw0+rdStTSp1gq2/3binimD7Bd7AN9mbsbN8VigNTqBe9oWdSVdFNcCCJ+lu2e+feYwY8t/LSPA4H96DeZM+qwDZiYwNVKU6PlgCcMufHCl6xJI7ZYXs7g3WFhfR3A9Lw1UOiountJSV4xLkNPQv6/A8hjXz/3qqHigpbFMyzvlvDTxRcZlZbWYxNXuEB0FtWA6J23aWBaBM5NErqIhYXXk+O/05vl+fPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PsNfzaqT1TcoP8UQ97hQJYw1K8xBSY2+wCxbyCbXUVI=;
 b=rwbe0b3yVg4Qz+TNJxFezNN+A2+JeSPOalRgyFjZhUG1miOMBgvxKMVRRm2ZP88UFYO3jzZa8mOf4QCOWNDSzA6spRZ6sUYfW/3kK1RKq6oGSD3P6inyUyrNX/plIjOHwp7VNZFJdZJIAqexonxvYFB8d3QpZUmR5QOp6Q/Bw+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6482.namprd12.prod.outlook.com (2603:10b6:208:3a9::18)
 by SA3PR12MB9129.namprd12.prod.outlook.com (2603:10b6:806:397::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 11:57:30 +0000
Received: from IA1PR12MB6482.namprd12.prod.outlook.com
 ([fe80::fb1a:a997:de4f:da62]) by IA1PR12MB6482.namprd12.prod.outlook.com
 ([fe80::fb1a:a997:de4f:da62%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 11:57:30 +0000
Message-ID: <405ec857-3035-46cb-b3d2-4f3808561ca4@amd.com>
Date: Wed, 1 Apr 2026 17:27:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/hsmp: Add support for variable-sized
 metrics tables
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Muralidhara M K <muralimk@amd.com>
References: <20260305105050.2940904-1-muthusamy.ramalingam@amd.com>
 <20260305105050.2940904-3-muthusamy.ramalingam@amd.com>
 <81915669-87e0-f06d-7a91-eaec41ecc0e1@linux.intel.com>
 <f2df9d24-6dc0-4359-b325-e5037865758a@amd.com>
 <6ca38d8c-6419-57fa-cc08-50cd53e8408a@linux.intel.com>
Content-Language: en-US
From: "Ramalingam, Muthusamy" <muthus@amd.com>
In-Reply-To: <6ca38d8c-6419-57fa-cc08-50cd53e8408a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0040.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::11) To IA1PR12MB6482.namprd12.prod.outlook.com
 (2603:10b6:208:3a9::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6482:EE_|SA3PR12MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f392d7-96d9-442b-47ce-08de8fe5d9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	enurnINbEBqJNmoatK41yXRbDDCmACUdZIvXA5/gH0S4vmign4ju1NvM/RPtXff+4l6g7ZJfhxDH3Dd5Bg9dfYUvjSYE86RXariXIuxNJeVRMIS7SAX4hinlQ88cYtzudPcMcEWULO3D5STKB6zxIXO2d07Pfxkz598NN4QNu2BhnGvNBrVmx2CGToYauR/Oxgwr51/CZyKLNAW956eMWY//9TNjpxlzixubOM45cK5PH7FYu1gVWD95MPfbSJlNpHxnHUjg41vMro9G9P1NwKep6eDpxJAFNCNlQExqekT12H8XG6jyqXDK8GkdPI+RUOEuQbNSd9c4Lu01i1lOco0XzLkp/PdbXYHBcHOogE2P85iK2nKx8bV4WM9xcle4JFhDwsowguw4Emi8kAx+qC3LbOSDqsjXTuj0LgVl0oQiPNxLxVPASMuosBwLfLwlpqpQZkoWwIatC17ZZ3GXxoPgj/ZN7UNqky2A0nMAzAbyNLE/1j2l59It9dJIg9fnq5w8cXJC9PhIR7ArV194CmFvcXJe7jEk2Cvg6vA/UaLWYmaIpUS9NMLc76pTlgVyCst5+EXm2VYHK443Sy08AwuOCzPVXM+mysP36LjKEwSdtkx4ygdwDQUHkkw126liefw3imjApx/RDtuhqXhgS4vtpYthDwv/D28fg+qZkfTenOgh6NwmtJD++szjHJbC+kScBghc/FY8XILfuTCv5YaKkGO4PrNpw+wSIYmj5zg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6482.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1llRk9UWk9hbHlSWXE3VGRhTVlYNVlNR294NGRqWEtSRWpTaTR0MUlHeDl4?=
 =?utf-8?B?R05maDNYWmVPNVFkSWN1aHpuRWVMSGFzc1U4OW5HUmdOU1d4TnBXdEhnWHh5?=
 =?utf-8?B?VUxqRk0zdWtxcnBBek5ZR1RUd3IwSFdtNGtrcEM0N3pQWlVHV1IxNDFGczZn?=
 =?utf-8?B?ME1NR0wzQ1VPWkZRSDN0Q0ZzWXpyMHpoL0t5Q29LRHovTUwzbkR1UG9LZWgv?=
 =?utf-8?B?M1JDMEtvSXRkeUV2OGQrdjVsTEpHc1FicFJlSHBWN09aekk0akw0aHk2OHdX?=
 =?utf-8?B?NlFnY1dOZ0ZHOGlVVFFzVlkvdHRNZmk5aytoRGZvd3ZzQWtvQ3lsenBSTEJQ?=
 =?utf-8?B?L28wVmF4ZTM4ZGl6b0YzM1dqKzh4RDZld0JKeTdGczZVbmQ5ZFlTa3g1aTc4?=
 =?utf-8?B?WklwNGI0WUlUV21YRmdvZ0VLSDZsTHhJVzdCWis4TXp6dHFrbzkrY3ZybnBn?=
 =?utf-8?B?UzVzbnRkWGJESWR6VnprVWJFVHFoc2tJZXdZTlY1T2kzZ2dGbnBJcmtLTVZ1?=
 =?utf-8?B?VWRCbCtyVDFCVUMxSEdia25iMGx3M1M3ZnFIeEFqQW1oTFgyOFVpZGdmZU9T?=
 =?utf-8?B?eWMzSzBHaXJhT2tNaFJZL0g1MlhSc2ZvL3FRQ0RPZ2IzeUoyWmR1YTRaZnp6?=
 =?utf-8?B?Z0xDVmFmZXRFK2p4enlNb3ZoanN2cTNPYmRMb1ZhY0gvMkpnTWhrREN0UHI0?=
 =?utf-8?B?dW9PQkhybTZOQTMvR3FWeGlLTUM2UkpBSGJrT0V2Y01Ca1lVVjFzTXFDV3hq?=
 =?utf-8?B?aGZJRHV1bHBYUXBzcVhKS2EyK1VGVEFNMU9xV2ZJckZpQi9yam1mWktCUEFj?=
 =?utf-8?B?cWo2RXJoR2FxQ3ZrYktLVnI5cjdzMlF5MlBmZFh3WTNEZjBIRDc0Rk5DT0Jl?=
 =?utf-8?B?ZWxCQmpGdzBuY3FKTUxHaWVDc2VxOE5rcG1OOURTK3IzWFZ5Y2V0cUNNQ2FE?=
 =?utf-8?B?ckM3NGx3ZS9UU2JIeHh3VUVVMXh1QnlsVTN5eDVYMzhpMi9iMDd4YmxESmYy?=
 =?utf-8?B?RmU3aFBsKzhUMEVLSFgraHR2eWxCZUNaWUFCUGF3Nkl3cGNGaFEzQnJ2dmdC?=
 =?utf-8?B?bDE3L1k2QmRZQ1V6VUVYU3dpWkpVL2xVQWp3eGgzUlpxZ1h6VkdidVJZeU0x?=
 =?utf-8?B?TVdoT0RyVVY4RTRDMUVDNjVGdVo4ZkdBQUZZcUZONmU4Sng1ZFBTNXkzakdJ?=
 =?utf-8?B?Sk50Y2tyMWhOcUVSWnBFczJ6YkZSTTF1TVZLWmYxNjJ0UUVvbS9BVDdlTTVK?=
 =?utf-8?B?WDRvZlB5RUJuRVF0SEJQcTJCd29IWmZEdWVqcVNDVE9oUitOdG5YdktUR0FB?=
 =?utf-8?B?WDQ1M2FPSTYvajdOVTU2UVBsbVg0VjBqTkdOQU5sUC9rMTg5T21QU2Q4UDVJ?=
 =?utf-8?B?LzBrTTRwa3BZcFlZT0FudUcra09Bcmdxa1lYV1BYNzhGeG41SU0vZDZ1WXZO?=
 =?utf-8?B?bkxUY2RNelpKakFlUTRXakpQTWNTSE1QV29sNTNYZ2kxQnRzMmlzc1dneHEv?=
 =?utf-8?B?V24yT1BkczBNSXpQcnhmOGMvWXFtaFNadk9YOSs3Q0loMEdvTlVncVRydXVv?=
 =?utf-8?B?WGZtcG5SMUd3TmdNbGNLbUZzSlhjaHFxbFNzWWZjL1c0QkpXWGFadDRsL1E4?=
 =?utf-8?B?YzhzTkVQV2NyUjVzRGZJbyttRkRBbllDS0pHa01hS1BKODRwaEFPT0p0N3ZY?=
 =?utf-8?B?MEsvRzdQek9qblhjaWtHa1laMmo1ZVBpUkFpWFJPTmFUK05ZUHhlT0txN3Nq?=
 =?utf-8?B?VzFyQ2V2cGl1SnppVk5BRWxMYmsraCsrS3dwb0RQK1l3c2tIT001RlZhczBE?=
 =?utf-8?B?N3dlS29xaEpWaUQvdlpEL0M0RTVEWkd1aDVxajRyd1IrdWRnTGdiVURSL2p3?=
 =?utf-8?B?cXl5MjlrR0pEczFNdndicUFnMk9qa0tNazFOblNaWHVwckJwS0JydkYyR3Ir?=
 =?utf-8?B?Nm1tcVdwYnlsUjVJTHA0RVh2YkRPZnlGSUlQVENwalZ2UDlZZ3hXbzY0aW5X?=
 =?utf-8?B?REU0RUc4VTlIdWFQOTRYSCtabGFOZEFlL2phU2I5U2xJZUM3SUpqNW1ldDh0?=
 =?utf-8?B?N1psQnBvbG9JMDBCUndOQ0ZDUG9TZ3pscmdVRzY3cXZhb0FmUnZnaXVGbGFG?=
 =?utf-8?B?eHgyQjB0UHlNeEM5ZmNHSVlrVE8zNHJscmQ2aGxyOGQrSjhwb3Bmd1VPaEVw?=
 =?utf-8?B?TkFHL1RNNFhVVFVUcndOZEtSdDV3QXU1TnRFYUhpRzNBTTJEZzdKMXZua1NU?=
 =?utf-8?B?R0dmaDR6UndsZzRLM3Jxd1pmNSswakhxdllDK3V6QzBwbTlsamZYYjZvMVhG?=
 =?utf-8?B?MlN4eUdkcmFDWFR6YXdsenFKUis2T01NcXlHQ1dMV003TTVsRXAvQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f392d7-96d9-442b-47ce-08de8fe5d9be
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6482.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 11:57:30.0659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6wWRwDWjNLw8gL0F6QYQlROMWQqzeR5FdgBYdbtOHpiOtUOymEqC7vxOobJf+7/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9129

Hi Ilpo,
Thanks for input.

On 01-04-2026 04:59 pm, Ilpo Järvinen wrote:
> On Wed, 1 Apr 2026, Ramalingam, Muthusamy wrote:
> 
>> Hi Ilpo,
>>
>> Thank you for the suggestions. I will update version v2 shortly to address the
>> comments listed below.
>>
>> On 31-03-2026 02:13 pm, Ilpo Järvinen wrote:
>>> On Thu, 5 Mar 2026, Muthusamy Ramalingam wrote:
>>>
>>>> Add support for the new metrics table format introduced in AMD Family 1Ah
>>>> Model 50h-5Fh processors with HSMP protocol version 7.
>>>>
>>>> Use CPU family/model and protocol versions to map respective
>>>> variable-sized
>>>> metric table configurations.
>>>> The exported hsmp_metric_tbl_read() function provides offset support for
>>>> variable-sized tables.
>>>
>>> This patch should be split into multiple changes.
>> Sure.
>>>
>>>> Co-developed-by: Muralidhara M K <muralimk@amd.com>
>>>> Signed-off-by: Muralidhara M K <muralimk@amd.com>
>>>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>>>> ---
>>>>    arch/x86/include/uapi/asm/amd_hsmp.h | 86 ++++++++++++++++++++++++++++
>>>>    drivers/platform/x86/amd/hsmp/acpi.c |  9 +--
>>>>    drivers/platform/x86/amd/hsmp/hsmp.c | 83 ++++++++++++++++++++++-----
>>>>    drivers/platform/x86/amd/hsmp/hsmp.h |  3 +-
>>>>    drivers/platform/x86/amd/hsmp/plat.c |  3 +-
>>>>    5 files changed, 164 insertions(+), 20 deletions(-)
>>>>
>>>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>>>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> 
>>>> @@ -403,8 +424,44 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>>>>    		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>>>>    		return -ENOMEM;
>>>>    	}
>>>> -	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
>>>> -					     sizeof(struct
>>>> hsmp_metric_table));
>>>> +
>>>> +	/* Get metric table version */
>>>> +	msg_tbl_ver.sock_ind    = sock_ind;
>>>> +	msg_tbl_ver.response_sz =
>>>> hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_VER].response_sz;
>>>> +	msg_tbl_ver.msg_id      = HSMP_GET_METRIC_TABLE_VER;
>>>> +
>>>> +	ret = hsmp_send_message(&msg_tbl_ver);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	table_ver = msg_tbl_ver.args[0];
>>>> +
>>>> +	hsmp_pdev.hsmp_table_size = 0;
>>>
>>> Is this necessary?
>>
>> Yes, We want this for unsupported family check.
> 
> Isn't this initialized to its default value which is 0? So why it needs to
> be explicitly done again?
you are right, I will verify once and update in v2.
> 

