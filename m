Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF13B28D;
	Mon, 16 Mar 2026 15:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674659; cv=fail; b=MVNCHVvXZyTKDsv6SG37vmXUiTIjjvcpxfpL88aEE6eK2UaGUNcloehXYQ+omX/RaxDF0FdBcRaMuEKJ6664s0/aVULA1UH5gZWOLIalwSg742/V7Ccd9F8kyHPq7ZGEs9487tG0k5TXNNEm8Zk5xs3xn92ECmYwfCPCwGmgwis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674659; c=relaxed/simple;
	bh=p296B9pOVTn0IJQnWV1M0QPfEE0PiJHCy4LeIdRtQd4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rlQkRr78vD0TLwlsh2wdltiDub1nh/Ui3krCSk8e6Lqod7CmYWCAh9ONWetTDJpH+VHDk3KwWeo71IBMMDsqJ4O8C1Ztw0CdO8XzcJ71BBcEeUSddgCF5wKEIDw5j3uMGNv0t6KgWvqkhi4/deFf2WcbNQ8Zc+elB5QRoOI4c4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=F886UQQU; arc=fail smtp.client-ip=40.93.194.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="F886UQQU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cY+7vbfrSCYdUbSh05hSihxOMk5jYY9a/vsc/4LP6W/KDIErugQzjKaoF+RePMWr78WQDak92KIGjabpGgmU35bFMoGQ5uQ2P1G2QRLjfEC60jj+1WbDdX4sAmO9WQlYf1NLvB/R1W78U79Lw4S6RqtEgGiYawZO7H4buNmZ+jJCemp3LbhCgulmuJLrr++sb5qhxVJ+uGeKxEE+wZd03iJy9f0efFGuNFwGB4tzLMnbNBdidVnLXvNfcOd6aCLocbzsRoPzj958CH0XkUKZTODMHkgMNHsHOv/27942fitYc5fhxPcVlNPOS8WrxlxLsHtWqU7p42JtycNqdcrv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zR04YM8pEjo9DOO0jA9FTj3A36r6aIy2qDI0pOWVao=;
 b=dRwFfIRCQfHvvbcylLjkyygCRxwJt82yUEe7U3cTviczHJpMCahoP90ocuXfQmxSGUTpNt/LV7051oIWQfXV8vRpFrk+kYtVtMGo4WK67dWjcLu9Isge6fDOuSNFV9w+Rk9iQ5Hg74fYecJ5+9bmFIRmy1TFftoE9DwCuMIGH2T0DfcTv9qtLNlUs0PNr5Uy+RuO3JrsHyBbn/9ValpV4UFg6OcNdOulhAm/mbB8+b7y4zj0UDHZHPFvzfO47QbloM0FymY67H3XWntQ+OMA1u3Xqpc/g6U1HzZR9ZgqKqvYCLoYfk5czENrjDTfRZnj74rXgymh+TLPwHHigMUfvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0zR04YM8pEjo9DOO0jA9FTj3A36r6aIy2qDI0pOWVao=;
 b=F886UQQUgGOXxyrpK/FR+RyfYdbS0ylmS5Sb5asSMQIN8mwnpHPsJzWodBA8j/W4wIvO+KY8Yg5nqUnSnV58PRdnSIjfrTWeE7iT70ey0ThxVS4kGTIfV5G56qSsDqbS4EbiKd8RftvFr3JAlFTZih5iMILhl1ADeY/WY4lUsbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by SN7PR12MB6743.namprd12.prod.outlook.com (2603:10b6:806:26d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 15:24:15 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9723.008; Mon, 16 Mar 2026
 15:24:15 +0000
Message-ID: <7f2f4b15-2fad-4784-a524-7f92f6b21a94@amd.com>
Date: Mon, 16 Mar 2026 10:24:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: asus-wmi: log thermal notification event
To: Jonathan Grant <jg@jguk.org>, platform-driver-x86@vger.kernel.org,
 luke@ljones.dev
Cc: linux-kernel@vger.kernel.org
References: <56532bb3-c604-484e-9716-edda3758f627@jguk.org>
 <50cc3d4b-5e5a-422c-9abd-556488710988@amd.com>
 <94dbe1e1-d706-47aa-abf5-f5d76aacf017@jguk.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <94dbe1e1-d706-47aa-abf5-f5d76aacf017@jguk.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:610:e4::35) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|SN7PR12MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: f964dc01-9ff8-4f92-009d-08de837015aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bApX4bOFPLWxzgglAMVvtjj9NpMYrgTqHkBIXpbhgKL0MH2b5XFMlm53Pld5Pez45Owx/s9nsAs8gcfU9S2aBAazkLWlexnXxMMRBEQYXOkRi2PW8ne5Vj7qyglyalgSJdaEDl0X/bNZdj5N5rgkSK/726gXw6AjL7lLlp6OAKFzSqNJoLx5M/iQBI/B8CX0sa+m8lEQT64wQP8DjPFNwOSz602dCAbduj91qHiIn9xT4AIHePkrclQ0cfhZcpxDvlljZ8cUX8tus/9P73u1i9E4kaHnWjQaR31YYygab4QK+mHU2ba8EVStCxAjEC8QEfZRFMrRJdAO1GltZR7M3Qq2J0XbpyPCngdqwsyeaa5WfaidAjprEFHIys20xuuy8B2haGy2XCV9JEW22ytkv5ndJCuupDNmn6OAHDiZXgbooQISeVjkQ6T/Ql7BgEvyC6RP1Gxn5NL31um0hTcd2/W0gU3QDU74rl/veePQgJ8H2zDt3V6faK50tChGNWEfzO0Fy2vit/H/QiLdpiO+DZLT05qT7JY8TQQwR5OYiu7l8MPcMCEkmrBn7Ouiu7KshAuhHD60YdFUltkNIoTU79FZz9exap1YFkLslghjgR+3hewxmpU5xja3gqYiwtLgkDVbUmIVB88VbjjJEvz4LxLnw4tK+Ac6xI49phTTA/+T8qZsbgD1wIvCc+RZynfo2T5iiNz66iJKLv2Ksn48r750/RUZ5JeiTnrDWzTEMIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXlMZHdrQVJhU2EyZnhwNE9TZWM3ZjVLc1oyOVl5SHpmS0lVSmJhOVZhNDVL?=
 =?utf-8?B?SHNSb1BzQmpKNklLRHNTVVBNMEJ0djd4U2ZFbjMzQjJOWm1LUHpZSHVqS2c2?=
 =?utf-8?B?RXBrU0p4RlJyU2kvMEpYemlHRjlMVlYyRUp4WlNyYWxTRFYrbDhEY2haSWtO?=
 =?utf-8?B?UHM4UWZ0azNZMEFzS1VLcXlLZmZvZUsvZnVkU1RpbGh4WG9SUWttRmMrZmVR?=
 =?utf-8?B?L2R0SXpLejlwTjRROVhheDIrQjF0SFVRc0N6RStMT2RFbzN0Q1lDcFhuMEh6?=
 =?utf-8?B?TEkvbVRWN3ludUdISG9aaUxldGNNdmhiRytKbTdrU0VZak5SQW1haDYxWnZr?=
 =?utf-8?B?NVNFMVFmR3Mrckx2UmE0RllwT1BxMmNSSTBXNENaQVdFYzI4WHBSanVkWE1q?=
 =?utf-8?B?VTZhWTNRcGtaTWRBd1U2ZlVQM20zbzBPNUNwNWhEblVMeTNRUSttVlpwbFRq?=
 =?utf-8?B?WXB3WVRJYTRJVHE3Vk5jTjJHckwrTTJpZTdQNjZWaXIrK3A5RXU0dVN6MTdS?=
 =?utf-8?B?WGhRZGlLRTdIMWVFZGlvbG9uaHRodVFvdkYyVVdPSWdxaWNjazhHcHV5czRv?=
 =?utf-8?B?djUySVJ3OWlHOUxJSnlNc3lqRzRiZlRoK2tBNzdXYjh3S2dBeDBTTFFOY0dv?=
 =?utf-8?B?TGpMaHlXV3NEUnlQdXFDOGdDcS9xNmw3VTM2UExiek55dmJELzllWEJYeWl6?=
 =?utf-8?B?VkgwK3dPcWE5dEFESjdlMUQ3QnZCdnc3WkZjaHdaS2J1VDBSZGI3MFExQUtH?=
 =?utf-8?B?VlVvTFZ6SGZOcHhjaktGY1hFMkJIZmIrRVk1cHpjdHhxYTJSSmZzYUVueWFV?=
 =?utf-8?B?NmI4VVZ1S200bkUrMlhPZFRRalRtV0lEdUUwQ3hUN1VUZHg2ME1ldUVtcGhn?=
 =?utf-8?B?VmhqODJ4d3Bxb3prMlZrZXBQZ2xRdWtjRDhtUk52N1hNRFZ5ajhaYzg4K25Y?=
 =?utf-8?B?UE1tMndJUUlJMUNjb0JreWc2Y1BXRURzR2VVVkVFRFZjYjBLeGJ3SU1FZjgx?=
 =?utf-8?B?R2dseFg2WDBYTk55aTJYL2czbXFRUDZtNFB3L2NKOFEwL3R3L1FlVzdBMFJm?=
 =?utf-8?B?amFrZFZLTUNUcEtlWE9IekZUYUpVQml0MkMvOVJidHNUdlhWcmw3azVpekcy?=
 =?utf-8?B?YzlmUHRkUkZnelVGc0JRNGhTb05oN1o0VFJRRmhhWXNzSjhmOVRwZGhlbGdN?=
 =?utf-8?B?eERGRUV0SC9jaHdNbFgwcmlUcGl6L1hTRTJTaHRJVVMydUFVa0lpZU43SnVa?=
 =?utf-8?B?aUhHN25kT1U5bUVBREhscTNrOGZuMTBvQUFuMEJFMkFFdUYzeFlQaXpzL2dX?=
 =?utf-8?B?NitRYWlUdXlUMWdEY21IaUNBckZUbThqT2Y1cFNHWTIxdmpDcndidTNVVE1n?=
 =?utf-8?B?NXI2RGpxdTZhMmQrRDMzbDFmSzltRUVPVi9Oa3RsL1JRU3luKyswcjhVUDlF?=
 =?utf-8?B?bDMxa2c3S2tEWlpBNXRPcUwxcU9LNmJvaGl4M21HbmFpOUhQMFIxcXdVQ3Bi?=
 =?utf-8?B?dm9jdU02WC9iYUI3aG1Xd0gzcytsRWNGaVZyanpNMTg5Nk9Mb2dXcDA3Z1lK?=
 =?utf-8?B?cjBiZ05TOTdGRTFZbDZiNVh1VXcvYnFhUHdhWXpzbWxuaUpWUE5JaW1zSC9B?=
 =?utf-8?B?MXN1Lyt4WG5ST1Rhbmo1UkRQUU9oQU5QRW5PeURnaFVNa0o5M0I1UEJLeFBw?=
 =?utf-8?B?WVBQckhFTnBOb2lrL1R5SnRRYkhkMStjZzVsbzh6WG5FdEJQOThPMG1CMjF4?=
 =?utf-8?B?WFBhL2RDdWMzbGZtS1VYV0FPU240R0VoeGVjcUZkUVpDTlJEYnptVWhjL0xn?=
 =?utf-8?B?ZmpSbkxodHYzMnpKT2ZNU0ZOVWpxZkVpMmExNkd4eXZUVjRSMFp5QVpyNTF3?=
 =?utf-8?B?ckJaV2hHc3lBQ3ozMXQ3V29mczdSdXNvZ3dLdEZ4SjZKMmN1dmRFQW5ONlF0?=
 =?utf-8?B?RlBwVit0SXA2MmlZck1xWENtOTcxUmVFV296Y3dCSFVpWDR2QUN4bUxML0Na?=
 =?utf-8?B?WkJmT1crL3NUYWJXTG93QXAyeWNka0RrV0JwZlVnaDZiY2x0RE5KVzU2bG5u?=
 =?utf-8?B?bCs1MGw1ckVXenpETkhOOUc0OGlTc3VVRWx5cForNmtMV3lWNFR2WkFqNFNs?=
 =?utf-8?B?SS9RYXJSVGlOcGd4RFlVakQ3cVp3dkZDRXptM2pPckdnUFNaeks5U2dLOVFL?=
 =?utf-8?B?ZUlnZldibnVFa29YYSthVTNVVXVJYmI1Vk5uRGlPbE9KQW85eFdOa1RGbjFs?=
 =?utf-8?B?NHcvSHBYdmUxTTl5dC9tTUhjTi85UVJEN2QwVmZib1JIazNsdDhYeEFaTFBq?=
 =?utf-8?B?RU1ycWRsa09GaDhwUUJVZVFPWm84cllRQXMzVXV5WkNLRlhlNkU1dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f964dc01-9ff8-4f92-009d-08de837015aa
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 15:24:15.7681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+JpI7p1LwRTS04GFUPYM17SnNJ40juxWEUILvXRikPXOQaBWgN7DG754paM/8imq5k5VmPcDw/FWqKFsyEdyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6743



On 3/16/26 07:49, Jonathan Grant wrote:
> [You don't often get email from jg@jguk.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
>  From e110b7489b320588a7d334bf0a4e20e3e25784e7 Mon Sep 17 00:00:00 2001
> From: Jonathan Grant <jg@jguk.org>
> Date: Sat, 14 Mar 2026 02:11:09 +0000
> Subject: [PATCH] platform/x86: asus-wmi: log thermal notification event
> 
> Print a diagnostic message when the ASUS WMI interface receives
> event 0x6d. This event was observed shortly before thermal
> shutdown on an ASUS N56VB under heavy system load. The message
> helps diagnose unexpected thermal power-offs.
> 
> Signed-off-by: Jonathan Grant <jg@jguk.org>
> ---
> v2:
>   - follow kernel patch guidelines
>   - rename event to NOTIFY_THERMAL
>   - document that event 0x6d was observed before thermal shutdown
>     on ASUS N56VB (BIOS WMI version 7.9, SFUN value 0x6a0877)
>   - improve commit message description
>   - remove stray blank line
> 
>   drivers/platform/x86/asus-wmi.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 7c0915e097ba..6ab3886ad28f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
>   #define NOTIFY_KBD_TTP                 0xae
>   #define NOTIFY_LID_FLIP                        0xfa
>   #define NOTIFY_LID_FLIP_ROG            0xbd
> +#define NOTIFY_THERMAL                 0x6d
> 
>   #define ASUS_WMI_FNLOCK_BIOS_DISABLED  BIT(0)
> 
> @@ -4590,7 +4591,6 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>                  if (asus->throttle_thermal_policy_dev)
>                          platform_profile_cycle();
>                  return;
> -

You shouldn't change unrelated whitespace

>          }
> 
>          if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
> @@ -4598,7 +4598,10 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
> 
>          if (!sparse_keymap_report_event(asus->inputdev, code,
>                                          key_value, autorelease))
> -               pr_info("Unknown key code 0x%x\n", code);
> +               if (code == NOTIFY_THERMAL)
> +                       pr_info("Thermal state change\n");
> +               else
> +                       pr_info("Unknown key code 0x%x\n", code);
>   }
> 
>   static void asus_wmi_notify(union acpi_object *obj, void *context)
> --
> 2.43.0

