Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794806471;
	b=XR/vVbUB8GX15I6NXPMmI2FlsHmBMIwVVSZmb6t7/nHg3zhoN6RbD0s8E6MIpP+qhS3E
	 5V0JphbbXpcEWjUcvaYx4NryGotgt6HXFNReFPbn2sCIqJUm2vPUPuYk8RjM2UlyoweX1
	 ubwJT8Ll+DfXqDgblTDEb4H8xFlw6zPNf36MxVbUop67sjatVHyX1lZbZ0VqvNw1LDgpt
	 w0xDKdBbWyhFwAEAiHc82MvoqhJe0N1PrgepFp6u9k144hpaR8nVjupQ5k1NKv9x9Vj7z
	 DIfYBuyJ4lWmWYOF3pLoj/+yC+mfsZOJdF9JIhPjlCslcTy50C62LlGursTGq9n3Cmg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806471;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=4pnlTFKBvhmx3ISpIAPinbnoKwQtwMnm1an9Y82XDKA=;
	b=20PD6EjY+ARQwKkoGPh8mqkydNBt8lwbMQ3zEE99xvksymIOYvw2fPJapaRlbDgNcB7c
	 CAEqmpTbZwNFVezo8KTcjuJGUL2X/LIVzdJifR6iwgIO5Qzxt87R8MWqongNe74zWD7iN
	 HHiT/lYNxv+Z15s/Ds+pCgYkwp1QCf5QZRiaBWMt5R7CvZ3b0kbY0sDRYOnD0ovbHOOel
	 5+0js69j4Va2MOTUyZUaj9Mpj/iw7Pg9v2JvS1iUCFoOAVBH/Lo3AG4FqfSXlZ5uGUvMz
	 SMxZwIvLJRTKQQLkZ7q1+QHQ6Hq041FqbEgy+KJbXPoeOIutMDD+Q5qVuC2MAaUBdjw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XezdCd9K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79307606A31C;
	Mon, 16 Nov 2026 05:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79307606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XezdCd9K
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYXWhgNWdGm4c/Ov0QIk4i3p7IMF4cOOTaq/WOhA97sqvZmIFUs5l7kP+H96ni+iYgGjO+6m3gmyq0AhuLH74z6auhGkfGr3uHfSjID3mnFvmpQTZljMe9uB4bTV4wlY7fZJmKg2e7mkPV9YDS/TAplJYM03mBxrNe51/ALriUUJYm6Hw+ZzkZt7B9GKfz/oB439bGxTiYS4K75EA7B1+Nk4LuS7ZO0CGVVl1vZXmLZ8nBAXD3Mp6bKd4VkXMumbj8SePeToGYtmzdqVmRsqWfSqH5C4cC+3x9EE8ex7afNdx8HCHB3edztlBx3L71cILDu42T1TIMa0BlKbp4DS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pnlTFKBvhmx3ISpIAPinbnoKwQtwMnm1an9Y82XDKA=;
 b=mr0rlExxZuMBp0j2abXWPBXtOpQk87FzvReUXXWgDm3bxfYelSfZqMvmhfAB4w1ISF/JwR7e+YGNkCJIAfuuJTCnf5lUe7z7uGqwZRL7KDMeVWFoqrj+vwJ/pUqIpYtNudPUosV4r62/vqaYGggng3UBRGU+LTHkURGXsguAHBQBMEyMuQBfqTitTpz3MWOVvl+/7+4NMgzMuemo5MnPoNmcKYc9p6ZYKE9h41GM7Pl1xfdYtoka8cRc1HSOijm3dQRC29QCxJCD3VXWXanckU8eAtH4w6y/R/Xtc4H/jCEBc/Xj55ntz6r7B1PcPKRusYAPKUy0F4nm+VXnMwcoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pnlTFKBvhmx3ISpIAPinbnoKwQtwMnm1an9Y82XDKA=;
 b=XezdCd9KeN4ehYpiP/cpHP9o6thWo7juwQuegNeF/s22J572lMUTAnTyXF3qrCnF5xVDZiRglUYcGicPGNU/HR3nk/ZWliA/bc4mAgS33IonfpwcTO6K/HiIGMklU73vontttxKx+8haAIolQK4QnxaXrr3opB99Eks2ecpxe4k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Mon, 16 Nov
 2026 05:21:03 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%5]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 05:21:03 +0000
Message-ID: <0ef2bc00-ed43-4f99-876a-ebc6d819c27f@amd.com>
Date: Mon, 16 Nov 2026 10:50:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86/amd/hsmp: Validate num_args and Report
 raw SMU mailbox status
From: "M K, Muralidhara" <muralimk@amd.com>
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261017165153.3748458-1-muralidhara.mk@amd.com>
 <76e78226-66ba-420f-bf89-74b8504bcafc@amd.com>
Content-Language: en-US
In-Reply-To: <76e78226-66ba-420f-bf89-74b8504bcafc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0295.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::11) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8d52ce-2800-4bb7-be8e-08df43a1685a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|5023799004|4143699003|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9WSM9VsJI6dczcIAm5lESSGAVXud4cS15ZKBHANlCBpUcEUqGEv3/SR/6bM1IifKopSGDq4tdvCL3nFOmjF9ddNwc1uRbsjLBUm5UdP9O1mubj3j2fumSXQaE1AD9WRFzA1IgHkx2kxY8gfcT/CP8SMwDkNvTw+bOj8FgtLgTXSbTmc6KvicbJxh9Uk6XXwWxqFjRkKIm69PhjPQYn7uWxqd9p2o1nIKCLyE40gwewGdeR6/Cl+33uH4KG2+tFp6tJb49ASG+/sIEf6I38pYJLWFjuyf3DMvGgo5rymTvoHt2lOXP1HgIkSaK+a5OvfoPU4voAGwmrxqkkfs8+fxau1T3wpnyPnCPnwO0rh15S1wJRJFb0fiNA32mQbkF3ynaAWs2sBuInE05wsYsSTR6jVT27T13eyVbDjrn1OJ2r/rBfGRSyLBpTMLQAzew/+b49ZVRh2x6fZE/PrVZwWBzkB4+4siS1FfQq4J2wGIM2Y1hw5FLEx5xo9SkjEAAs1cnEIlsuXCBhJSQvrsvoE9Ei82c2dbeeV5TLRUHWjkvd403QMqv0v+v68y6D4IGzTzdWI3fjQsc8DO7D7WKzp8dMPdZXurUBDJq6q+1vAsZA4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGNmV3pxeTc2MkQ1eE90ZC82d3pMcittV1c4Ly9LaGQ5S2JsOGl2STFERkNI?=
 =?utf-8?B?WXdwSzJLSzU4YjFvU3FrWkZJT1RZZnhWY2Rrdk5OZmlOcDhlU1RjbEhlQ0Vx?=
 =?utf-8?B?UWc5ZElUcVBUUkliM3RhSnV6Q2hza0M0Z25aa2Jjc1FHVzh6UmdXZ2pmdWtp?=
 =?utf-8?B?NGtOOXVhUG5Hc0FnckdzaW5BNjNRcDUxQVJNWGR2VEF6SWlmMmtGcjZ6bWlr?=
 =?utf-8?B?LytEWTB2U1VIUWdabUJEM3AzQ1ZYRE13azVOKzJoSElHVGJXN1J0T0ZNTkdJ?=
 =?utf-8?B?c1loOUwyRkdCSk9jN1ZzWEhqUEd1cGJ5OWRGVUNreXlkV3R1elB3MzVNcmxL?=
 =?utf-8?B?UXVZL0ZLaFdFOFZId1NXTXBaSTk1NXNxeTNnZHJkamdFNis2NDVXZ2hFRTJz?=
 =?utf-8?B?bVMxWUhvT0YvdVRnVzlKYUZ6R1RIZ2RaaU9iQkFwbm1CMGgzUUlBZlRJK00x?=
 =?utf-8?B?YWZCWEVFTFhRR2FrdGp0a1Jubk5RRUg1NWE0aWlaREF5Qy8wb1lMTWVVT0VP?=
 =?utf-8?B?V1Mvby9EOG5JZXVQNS91NVpoOEZGWlBoaEJsRXBjS1h5cVV1TmppQTI3Nmwx?=
 =?utf-8?B?Q3BUZTgzMDIzZEhFUk5PSWtLUmR6Nld6c0tOcTBaeXBudmlzTkNkQnVaVXRL?=
 =?utf-8?B?Y0xJZm5uVnloTUxiOGVjUE9GbkRXMGpNUFR5dDkxMldmR3ZPbjlscVFnQnF6?=
 =?utf-8?B?SE9QQ2NWaXc3ZThId1M4dnpEL1V2aXBTYWRoSXdBdCtJZ1RNNFVnSHQ0Zm1V?=
 =?utf-8?B?WGplRFgxcFlGNW0yL1RhSWEvMERENTRHWUNRSWgxYm8zM0c1WHk1YlJPNDBp?=
 =?utf-8?B?Sm9xR0VwM2lYWlM5cXJtekd6c3RENE9vcS96WVhId1dhcEJyOGxZS0F4Y2lk?=
 =?utf-8?B?Ly9FV2h4bVFSdDdrRkx6ZDJwMkh6cnkvTi85VW82RUFsRURxVzNSODY3TGkr?=
 =?utf-8?B?UWExVVpmbzJkaENTZFd3RWZrTi9BQUhjMFlYSU9wQzMzN2NWbkRoU1lFUDlY?=
 =?utf-8?B?U0t4clJCTVl0VnNpVXRPdFQyanAyNTRTZ2JHcTJnTi9QWVl3T01lMW9BclF4?=
 =?utf-8?B?T0UwV1pxZXk1VU9RZUI3dkZlY0tlUElwRm5XaS9mcWJRVWxBWW1mb0R1UXh0?=
 =?utf-8?B?SjZUSDV2VlgrL2tsYk53NkpWeHBOUmU1WDB6dVovd3dMcTNyVUZzbGlBZzhv?=
 =?utf-8?B?cWVSNmQ1TVVWUGxndkFLRlhtbmhCcHZudkxYQk5KMXdlbDBSUnRUOUZJRWhF?=
 =?utf-8?B?WDJOYUg2NnRPLzRUb3duOWZORXdmQUFrRzB5NE13VjZFL01mUDRScXNUUm0y?=
 =?utf-8?B?SHdxYVBZTERKbWhkOGxyYVFSNHd0QXBFRC9KR2dneGJuekFhbVJuNGM2aEIy?=
 =?utf-8?B?KzduU3B3bFprUEVCTGtHdjBnbGp5TC9qVWczUStzdGhDZEkydUdHN3RMYS9n?=
 =?utf-8?B?cEhZcFMxVmFoS0h1S2luaHZzMnJaSmJ4NDhwVWxmRE51Y1NhNGFWZ3VRemZq?=
 =?utf-8?B?M2tFZlJ6NmtrUk9yQnlkek96Z0ZBTkExVGU4S1Q1anl5WXF0MjY4UllTS1NV?=
 =?utf-8?B?a2NXYkMxOUM0cTdybWgxZEtDcklYbE1PYTkxSzlOdEtTbVJEMG5FendaWEhE?=
 =?utf-8?B?RXlIcjQ4K2hiRTlxa01GVERnbmwyMlpXVXVYUzR4eGlqVjJGVzNMVkFZaHR0?=
 =?utf-8?B?eE5aMDh2SmF1UnFMMU9WQWd2Y2p0ZEVWamhrRkVtWnVHakRJcEtWM2N6cjhz?=
 =?utf-8?B?aGs1UGVkb21COWQ1dTBackpOdXVGU0dXUzZ4TWlPYlRhMi9yRUtGeW5IV2lR?=
 =?utf-8?B?VTh5UzQ5OTVxZEwzcnc3MUltejIvNWhuSDI2MUFsc1Z3VGIxc1Z3bHZ1cHNH?=
 =?utf-8?B?eEMrSUNEUFBaSlRTZjVRUnFoRUdzNHAzdVRtVDZ4VFR1UXJaYjc1cXZrbUR5?=
 =?utf-8?B?aDBKc2FrdElRTDN2a014NHdaRHM5akNDcmlPYVg1bTNrV2MrMm12Q0dBU0NT?=
 =?utf-8?B?ZW1XUnFJVU82emZQWUhidEtDZ2ZTcnZWcXVEZUx5MVpWam5pVStQemdTQ1Jt?=
 =?utf-8?B?MTlhbTlKOXRKanlwU0tnbzBoaWpoNjZRYkY1UkUxWXRTaWJJS3UxajRmUWFX?=
 =?utf-8?B?bkNONmc2WFRuSFlPR3p5VkFoOHhKdVR6SUlOVytET3h2WWFvbGljRmNOQWZC?=
 =?utf-8?B?clRxSko4M09uNEcwZElRdGpDamUrVmx1SWxpbThEM2hlSjlwZVRHcE92clZo?=
 =?utf-8?B?SkIvb3dxb09CbVpBME02bWp5K0Q3eDh4VzFxUWRvVHR3cUwvRXgyeXRUZGho?=
 =?utf-8?B?RlQ5ZkZXS0dFdFBnSVV2TzNPWUdJdldiVG11Z0plVTB0MW9Pb080dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8d52ce-2800-4bb7-be8e-08df43a1685a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 05:21:03.2356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 149R90eS8VwJ/N3mC4QI3DnLcbLHJ31O5iG89cLChzmmmWOE1IF674D1RTa0pdjObpARo/mTRpLgnJH4qYf2QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811

Hi Ilpo,

Could you please review the patches below and provide your comments if any ?

On 11/3/2026 1:02 PM, M K, Muralidhara wrote:
> Hi Ilpo,
> 
> For your information, I noticed a "Failed to Apply" status on the 
> sashiko.dev review system for the patch series I submitted below.
> You can find the details here:
> https://sashiko.dev/#/patchset/20261017165153.3748458-1- 
> muralidhara.mk@amd.com
> I hope you could review the series.
> 
> On 10/17/2026 10:21 PM, Muralidhara M K wrote:
>> This series adds a __u32 smu_response field to struct hsmp_message and
>> struct hsmp_telemetry_data, so userspace can inspect the raw SMU
>> mailbox status instead of only the translated errno.
>>
>> Patch 1 is a preparatory fix: hsmp_ioctl_msg()'s fd-mode gate calls
>> is_get_msg(), which reads msg.args[0], before checking that num_args
>> matches the message descriptor, so a request with no args can still
>> reach that read. Validate num_args first.
>>
>> Patch 2 adds smu_response to both structs, set from the polled SMU
>> mailbox status register, and has hsmp_ioctl_msg() always copy the
>> message struct back to userspace, even on failure, so smu_response is
>> visible on every call. It also fixes a related copy_to_user()
>> error-check bug in hsmp_ioctl_get_telemetry() uncovered along the way.
>> Both structs grow under #pragma pack(4) (44->48 and 16->20 bytes),
>> changing the encoded HSMP_IOCTL_CMD and HSMP_IOCTL_GET_TELEMETRY_DATA
>> command numbers; existing userspace needs to rebuild against the
>> updated header.
>>
>> Each patch builds individually and is clean under checkpatch.pl
>> --strict.
>>
>> Muralidhara M K (2):
>>    platform/x86/amd/hsmp: Validate num_args before the fd-mode gate in
>>      hsmp_ioctl_msg()
>>    platform/x86/amd/hsmp: Report raw SMU mailbox status via smu_response
>>
>>   Documentation/arch/x86/amd_hsmp.rst  |  28 +++++--
>>   arch/x86/include/uapi/asm/amd_hsmp.h |  35 ++++++---
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 111 +++++++++++++++++++--------
>>   3 files changed, 123 insertions(+), 51 deletions(-)
>>
>>
>> base-commit: 03f79b70cfa59c76751bc176e6a85a5a67c91801
> 

