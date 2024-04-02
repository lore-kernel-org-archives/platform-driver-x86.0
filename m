Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2110.outbound.protection.outlook.com [40.107.94.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F4D5E091
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Apr 2024 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712061915; cv=fail; b=YAAcx1q+yQUS82MLwg42P20yZubGppCc11I/rDQX1d8LFlOcawedUnTK9kxg2ZJl5MLANNgzShQS/x0GVEFyaKz/NfUZcbKJyKRUDQWr17FDHr5+cOVokbnp0UAeEHN+uaJMLeHpLti8mhvpOlzsCX4UBW+V2fCcq98pN4wFxDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712061915; c=relaxed/simple;
	bh=eRvGoSmzjV0p4oAoyZC+wdRTGobYa+Ixy8SIYYEhuUw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JbTZzO4c3QnrpaGKfGuDB57OSIxCIa2HnAmYOjxAisKC5bTpiFhs7tpgx/MGINMbxPCGHHhu3+/sMfppPLjZv3nSAUerBADmXTucDJGrRF4KeyXf+zICpeuLOMp9cuqOgZ3xgxScgHVJUGAC0tS/XLXsI7dn2xbz4Mixs77leFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4JTA8w/k; arc=fail smtp.client-ip=40.107.94.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4JTA8w/k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5T6G/f8zyV3LwVSkDLRpR3TdRL3Al5tlV3+IT6Y48CcnT7cKaQFpciov+/JFyeuC3Lsma8mCRx4RxaUjPkQED9Sa8WVskJeJ1+oQ1PSQSBM3KgdItVmNZolBH5A2yRu2nLxytGu/Fgj6keuv/YivpCwceQwb+Ku1ZcrNzlgubPXTF2xj/YICZMbRGBcDRDXOwTpjF5UyQkvhHGW/IwFoJB5o/gokPupZtIlkny3b0oH7tV5rqqjt9C9RIChJNelmU43TyVQUY6+p0Dh0Ru1kWireEVESdlnu7RMUU+UORWJVMi1GYficlkZuUnk3/Rt5K0b5e0xj3EkxbsUhFUNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CInYMwCPyiaPiBNKUTv95ZHUrfzzINcFmGCVEAdnVY=;
 b=QMkoP7hfmbdd9DDb+aVHJszVJvw1XG3xfeuisLdf/9ZgNUA5/3bUgkcfDb+SCEgibNikr5SAjlFk2ejNP1hzNyAqVU+tO6aa5rc9q7DXfKRCU3qN9TXek9stTQpJR46s3vIYQsFC/cB4qKLiOX9clZBda9Yt5CIbFXTC0O5lrr/qBYDQ2nw8UijBV4aG2/tii756cRx9jab0H673CAgxwvmoW5/Mkhn4S21nCtTBZ3ZRZP1SWnjicW8LqHJO0flADUmC0oHkXjSBUS8nTEM8pITADYFR9PwHzuX15XtziKxcYWNaMGNMjSbU/PpdLXytQteqL51OCcUQmL+LmOV9TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CInYMwCPyiaPiBNKUTv95ZHUrfzzINcFmGCVEAdnVY=;
 b=4JTA8w/kjYIq85cqKp11juiSbMR48+Pr9jm0a1fH4J+vurb1iV6bVSa9Fi/IzA3ljSjQNgNGoBSulWfWHnJw+NDihNHwh/I0BwQ569zsIBf+VH7BUsbsyHDd3hf4uuhSP14sVlGMIXyZ47aDdra4GeZCE+dULFzfd+m6A4Vmml4=
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by LV8PR12MB9155.namprd12.prod.outlook.com (2603:10b6:408:183::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 12:45:08 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::50af:9438:576b:51a1%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 12:45:08 +0000
Message-ID: <b684365c-cb64-4da3-8ad5-30f54bf969e1@amd.com>
Date: Tue, 2 Apr 2024 18:14:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/amd/pmc: Add AMD MP2 STB functionality
Content-Language: en-US
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam-sundar.S-k@amd.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org
References: <20240304064147.2586158-1-Basavaraj.Natikar@amd.com>
 <5e3678cd-8dbf-4297-b786-e380a03a1b4b@linux.intel.com>
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <5e3678cd-8dbf-4297-b786-e380a03a1b4b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::30) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|LV8PR12MB9155:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kk52RR4k0srmVWCyaXiTQWjvIxd2/wuxZBqcB1bo15BUg3spmB2NYIyTYBHrENlFIKnb4NART9ANCJmjOYzwxFVYHzIQjicJK2P5tge4hzHPh1FMR3hp9nyfiSOW51sUkMlMau3hWeYwOfbJwxeHJRnGDrneQ5MSjDuqZU9iCw09O9qEYNFRti6qz2yDkaFTON9GLNFiD4mSVAisZnNAHhuy/J6hcNBS/vRYxIE7X6YDaUHOzhGqsgXqvCMAV7+cwKEQjJap62ueDn7tc8+8qHYrJb1b0poiHXFdtbZZiOQLRcbj/wp1oS4Ip6G9Nn1/4wMdEffby1kjJikRbUvQlfMV2wQM1xizsuv18sC+zlNec++gfWivwWm3VQ36Qvg6jLGzeAeGJcO/22nkb5qECqXOiZkZj+juNxdZ3NDDwWB3bK2rcVXaoCXfxqvHwULjVdbD4IY+1nf56/6WDm25B4pqehSw5yEuY5D/auo7o4ZLU1mj68QFsq11DsmxRCJWl8cLxvnAZQUUxTXtTZCd+c6sxwDEkjS7eMzDximZ246kKjy3Ny6u1lK7QLnsQW8sH8nodTvGmbTXEQ2rzAxlOgOhXVG+YpUpmgUuqHySJTgQzGX9HKRLmdmJrOYezPlN5WL7RanWzdP1bcRFpQgwXwgdZios7B2S0IhDTjHcItQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDhSdXdtVVNOKzZRL0VlaHBmNzl6UzJuYTltbkdiZEsrbTVzb1EyYmFmTjR3?=
 =?utf-8?B?d2VBallGajg1bTRTNncwekVpVUVYUnRFR01tR3BrNWN0YTJpeXNEbU1KdTBa?=
 =?utf-8?B?cDhpOUNpazd5VTNNNGZjZU14Q0YrNGRGRVJ6OWNJTXUrSS9ybFREZkdjbnhh?=
 =?utf-8?B?SE50QVhMemNid0dMUTZKbkJFT3kvOXJRT3BaTDArQmRmZUUvbFU0Uk9INXZS?=
 =?utf-8?B?a1FNMmMwajZEYnYzMGhDRzFRMzRFUDY2WnI0UlpBMXIwKzBWUFBDc21PNS8z?=
 =?utf-8?B?OTRxL3hMS1oyMzQ2MkJJY2xNeHhvT3N5d2dISmRpckhUcFpYdGE1QzJ4YUM3?=
 =?utf-8?B?K2JMOGw5YklGTG52ajdrWVR6WHJmTmFNNW5taEJtWDY1c0N6T0cyenZQZlRV?=
 =?utf-8?B?d3U3Y0VOQ3lSVVk5dEFxS0VRUnYvK1BaMXcyQ2hPYmF3T3RsQnJXNjFFVzRX?=
 =?utf-8?B?ekxEaUhTLzNuZzM4anlydWhaT2M1V3QwRDlGdDdsamlpdmtGOGJDS1JNWE5Q?=
 =?utf-8?B?MC9xVnUrRU80dFlXbWxNZnlBTi9VNEFTa0V1U0VoNnZMdlp2NVZWYnVLaEJx?=
 =?utf-8?B?MnVsb0dWb0s1NFlpRG5mRnpkOGRMQmVKRkllaXRYU3ZiTXJUVmFPRmVOcWI3?=
 =?utf-8?B?U2lNTXY2Z3R5bGt1S3Q2UWRUVUZvRHlWUk42N0FQNkUxMFlzRE1EV3V3L1Jk?=
 =?utf-8?B?UHVCZmIrSnlVUm5TR2pobWtlNFJkWGpKRzl0cXpXWU5wTkhENnFpTVpvVlJj?=
 =?utf-8?B?YWNJeEFxOWRzUGhFY3JDbWdINWtpajBwY2s4U1JkMnYvVy9ZTGViUEtPd1JX?=
 =?utf-8?B?SXNrWnlQN2RrY2xIZGV5YzRNWEd1Yk14Zm9lNmdTY2FrV1JCUXFmRUk4bmNY?=
 =?utf-8?B?Umo0QTJseWRNNDJWa3lqcDdMWmk0OUQwbzc0S1l2MXpYVEx6ck80dDZyT0Rp?=
 =?utf-8?B?ZnpOcG5KSTdYb29WR0todzh0WWhMT3BzZXZERlNVcXgzTHpqQzE3RHo4NWJD?=
 =?utf-8?B?Q2tOUDErZjVqdktQWEZFZU9sb1F3cUZ0S2dLMFZweDlDc1dQY1BsditTOWRs?=
 =?utf-8?B?Qzl3MEF3TFA0WllkaW5JUjhMQzdQNkFXaGgralNjTnlKcWpqZ3dGTTFzdFBj?=
 =?utf-8?B?MGhhcnlMc1R1ZkN1S0R1dlJpaEFEN0gwempLRHl0d1NkVitHWFBLMXNXV2ZX?=
 =?utf-8?B?bmJDSXpFYlcvUEQ0dURVNEg5YWd5b2pab0IvRTlNYTRITFRzRWJ5eWJsOERY?=
 =?utf-8?B?bUkvMjRVSmFHSTFqcWFQK3NsV2MraWJvNEhjMmYvVmVvb2M5MUc5Qno1RXA0?=
 =?utf-8?B?a0ova2tvcDhUM2FVRHN1a0xJd09oUWVDVEVEWTg2Y1Qxb3A5QVpPT3hqbTVl?=
 =?utf-8?B?SFFtbnRrTUJlVDBpZ3N0Mi9MWHE1dlF5MXNFZW96Qk41VlRSUngxdENtRnN3?=
 =?utf-8?B?NmdjMDZzWG1yU2lnb3NYWDRuMmp4TDI0OEJUYlpaTm1nd3pjZGhpNmlxSWNI?=
 =?utf-8?B?KzFOcjF6dGFJSmo4c3NWTVpVTjR5WThPVXlHYlJPRDFNZStoUVloSWlYSCt0?=
 =?utf-8?B?a2NWK2cySkdDZmVCaXc2SkhaR25RU3VPSzdFVkhkbUhQT2taRkxlbnRkZHRC?=
 =?utf-8?B?QjVxWStkOWJUNnFwZUFzbjU3MVJSY1lOWUs5U29YcFl2YUFFNDJXZzBmUFFC?=
 =?utf-8?B?aTJqdktkVmRqVHpnMVdoZGVZWE9HRGtRbGdENVBadVgyc1VhYkNMdnpOSUx2?=
 =?utf-8?B?NUszY3I2RmdPdlhMZjBVNmVQZW9GRzRwUEU0aHFQZmlVLzM4NmpuZVJEZ0xq?=
 =?utf-8?B?b2NGcmo3TjZMQk5Wc21nNUt3eStjYkpxK0JVL0lBNVpkeXM2dXFzR0dXUlBK?=
 =?utf-8?B?L2lqTXhsQzZSUVBkbWpOVG1IQnp5SGxkbGRLQkNiRHNiUGpLRHhMdnZxaklr?=
 =?utf-8?B?RTlUSlFwdGU1N1lieTBSQzFQZzNMMmVvWG8rcVVhMVhaUTY2Z1Nla2VhSDYx?=
 =?utf-8?B?ODVWbE0zMlp1N3JwUzFMVWtubW9BWnBwYjdoalBDNWVYdHBOb1lXaDRVdVhj?=
 =?utf-8?B?WCtXakVMMXErTXF5U0FBdFVyY3ZQQWRtTklMT2w1ZmFjTTRCcGRDRThtbmZp?=
 =?utf-8?Q?m1MbGeObu/sHn+3NkvAXxH6zm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b953cd6-b95a-432e-5eb3-08dc5312baaf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 12:45:08.7494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMeOKvlKhNVon9GNJCYXTauudw/4JtJm9W4COS9Nmw50dFRXvfh4px6vtHk2Yit3GHGmT9Dz+mUS2hBHyY+N4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9155


On 3/9/2024 6:20 AM, Kuppuswamy Sathyanarayanan wrote:
> On 3/3/24 10:41 PM, Basavaraj Natikar wrote:
>> AMD MP2 STB function provides a data buffer used to log debug information
>> about the system execution during S2Idle suspend/resume.
>>
>> A data buffer known as the STB (Smart Trace Buffer) is a circular buffer
>> which is a low-level log to assist in debugging by providing insights
>> into any potential hangs or stalls that may occur during the S2Idle
>> suspend/resume processes.
>>
>> The current PMC driver retrieves STB data from MP1, but there can be
>> scenarios where MP1 might hang or become unresponsive, leading to the
>> loss of critical data present in the STB buffer. This defeats the purpose
>> of the STB buffer, which was originally meant to help identify system
>> failures.
>>
>> This feature creates stb_read_previous_boot debugfs allows users to
>> retrieve the STB log from MP2 specifically from the last occurrence of
>> the S2Idle suspend/resume. A userspace daemon can access STB log of last
>> S2Idle suspend/resume which can help to troubleshoot potential issues
>> related to hangs or stalls during the S2Idle suspend/resume sequence.
>>
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> ---
>> Changes in v3:
>> 	- Changed an error path for deinitialization or freeing resources.
>> 	- Modified the macro and variable to have a more specific name.
>> 	- Included header files for USEC_PER_MSEC, writeq, and writel.
>> 	- Switched the data type of the 'len' variable from 'int' to 
>> 	  'unsigned int'.
>> 	- Used one variable for return values.
>>
>> Changes in v2:
>> 	- Used linux/sizes.h instead of defining KB.
>> 	- Defined timeout containing unit as per USEC_PER_MSEC.
>> 	- Modified macro of AMD_C2P_MSG and AMD_P2C_MSG.
>> 	- Changed string stb to STB in log messages.
>> 	- Defined literals using Macro.
>>
>>  drivers/platform/x86/amd/pmc/Kconfig   |  23 +++
>>  drivers/platform/x86/amd/pmc/Makefile  |   1 +
>>  drivers/platform/x86/amd/pmc/mp2_stb.c | 260 +++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmc/pmc.c     |   4 +
>>  drivers/platform/x86/amd/pmc/pmc.h     |  14 ++
>>  5 files changed, 302 insertions(+)
>>  create mode 100644 drivers/platform/x86/amd/pmc/mp2_stb.c
>>
>> diff --git a/drivers/platform/x86/amd/pmc/Kconfig b/drivers/platform/x86/amd/pmc/Kconfig
>> index 883c0a95ac0c..8177486babf9 100644
>> --- a/drivers/platform/x86/amd/pmc/Kconfig
>> +++ b/drivers/platform/x86/amd/pmc/Kconfig
>> @@ -18,3 +18,26 @@ config AMD_PMC
>>  
>>  	  If you choose to compile this driver as a module the module will be
>>  	  called amd-pmc.
>> +
>> +config AMD_MP2_STB
>> +	bool "AMD SoC MP2 STB function"
>> +	depends on AMD_PMC
>> +	help
>> +	  AMD MP2 STB function provides a data buffer used to log debug
>> +	  information about the system execution during S2Idle suspend/resume.
>> +	  A data buffer known as the STB (Smart Trace Buffer) is a circular
>> +	  buffer which is a low-level log for the SoC which is used to debug
>> +	  any hangs/stalls during S2Idle suspend/resume.
>> +
>> +	  The current PMC driver retrieves STB data from MP1, but there can be
>> +	  scenarios where MP1 might hang or become unresponsive, leading to the
>> +	  loss of critical data present in the STB buffer. This defeats the
>> +	  purpose of the STB buffer, which was originally meant to help identify
>> +	  system failures.
> Above is the detail about change history, which is not appropriate for
> Kconfig help. So I recommend dropping it.

Sure I will drop.

>
>> +
>> +	  Creates stb_read_previous_boot debugfs to get STB, a userspace daemon
> Just say debugfs. Don't need to include the name.

Sure I will change.

>
>> +	  can access STB log of last S2Idle suspend/resume which can help to
>> +	  debug if hangs/stalls during S2Idle suspend/resume
>> +
>> +	  Say Y or N here if you have a notebook powered by AMD RYZEN CPU/APU
>> +	  and supports MP2 STB.
> Move "or N" to the end of the sentence.

Removing the above sentence as suggested by Mario in the patch.
 

>
>> diff --git a/drivers/platform/x86/amd/pmc/Makefile b/drivers/platform/x86/amd/pmc/Makefile
>> index 4aaa29d351c9..f1d9ab19d24c 100644
>> --- a/drivers/platform/x86/amd/pmc/Makefile
>> +++ b/drivers/platform/x86/amd/pmc/Makefile
>> @@ -6,3 +6,4 @@
>>  
>>  amd-pmc-objs := pmc.o pmc-quirks.o
>>  obj-$(CONFIG_AMD_PMC) += amd-pmc.o
>> +amd-pmc-$(CONFIG_AMD_MP2_STB) += mp2_stb.o
>> diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
>> new file mode 100644
>> index 000000000000..4acea31daaaa
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
>> @@ -0,0 +1,260 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD MP2 STB layer
>> + *
>> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>> + */
>> +
>> +#include <linux/debugfs.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/iopoll.h>
>> +#include <linux/pci.h>
>> +#include <linux/sizes.h>
>> +#include <linux/time.h>
>> +
>> +#include "pmc.h"
>> +
>> +#define VALID_MSG 0xA
>> +#define VALID_RESPONSE 2
>> +
>> +#define AMD_C2P_MSG0 0x10500
>> +#define AMD_C2P_MSG1 0x10504
>> +#define AMD_P2C_MSG0 0x10680
>> +#define AMD_P2C_MSG1 0x10684
>> +
>> +#define MP2_RESP_SLEEP_US 500
>> +#define MP2_RESP_TIMEOUT_US (1600 * USEC_PER_MSEC)
>> +
>> +#define MP2_STB_DATA_LEN_2KB 1
>> +#define MP2_STB_DATA_LEN_16KB 4
>> +
>> +static struct amd_mp2_dev *mp2;
>> +
>> +struct mp2_cmd_base {
>> +	union {
>> +		u32 ul;
>> +		struct {
>> +			u32 cmd_id : 4;
>> +			u32 intr_disable : 1;
>> +			u32 is_dma_used : 1;
>> +			u32 rsvd : 26;
>> +		} cmd;
> Can you use "field" in place of cmd?

Sure, I will change.

>
>> +	};
>> +};
>> +
>> +struct mp2_cmd_response {
>> +	union {
>> +		u32 resp;
>> +		struct {
>> +			u32 cmd_id : 4;
>> +			u32 status : 4;
>> +			u32 response : 4;
>> +			u32 rsvd2 : 20;
>> +		} response;
> Can you use "field" instead of response ? Usage like resp.response.response
> will be confusing.

Sure, I will change.

>
>> +	};
>> +};
>> +
>> +struct mp2_stb_data_valid {
>> +	union {
>> +		u32 data_valid;
>> +		struct {
>> +			u32 valid : 16;
>> +			u32 length : 16;
>> +		} val;
>> +	};
>> +};
>> +
>> +static int amd_mp2_wait_response(u8 cmd_id, u32 command_sts)
>> +{
>> +	struct mp2_cmd_response cmd_resp;
>> +
>> +	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG0, cmd_resp.resp,
>> +				(cmd_resp.response.response == 0x0 &&
>> +				 cmd_resp.response.status == command_sts &&
>> +				 cmd_resp.response.cmd_id == cmd_id), MP2_RESP_SLEEP_US,
>> +				 MP2_RESP_TIMEOUT_US))
>> +		return cmd_resp.response.status;
>> +
>> +	return -ETIMEDOUT;
>> +}
>> +
>> +static void amd_mp2_stb_send_cmd(u8 cmd_id, bool is_dma_used)
>> +{
>> +	struct mp2_cmd_base cmd_base;
>> +
>> +	cmd_base.ul = 0;
>> +	cmd_base.cmd.cmd_id = cmd_id;
>> +	cmd_base.cmd.intr_disable = 1;
>> +	cmd_base.cmd.is_dma_used = is_dma_used;
>> +
>> +	writeq(mp2->dma_addr, mp2->mmio + AMD_C2P_MSG1);
>> +	writel(cmd_base.ul, mp2->mmio + AMD_C2P_MSG0);
>> +}
>> +
>> +static int amd_mp2_stb_region(unsigned int len)
>> +{
>> +	struct device *dev = &mp2->pdev->dev;
>> +
>> +	len *= SZ_1K;
>> +
>> +	if (!mp2->stbdata) {
>> +		mp2->vslbase = dmam_alloc_coherent(dev, len, &mp2->dma_addr, GFP_KERNEL);
>> +		if (!mp2->vslbase)
>> +			return -ENOMEM;
>> +
>> +		mp2->stbdata = devm_kzalloc(dev, len, GFP_KERNEL);
>> +		if (!mp2->stbdata)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_mp2_process_cmd(struct file *filp)
>> +{
>> +	struct device *dev = &mp2->pdev->dev;
>> +	struct mp2_stb_data_valid stb_dv;
>> +	int status;
>> +
>> +	stb_dv.data_valid = readl(mp2->mmio + AMD_P2C_MSG1);
>> +
>> +	if (stb_dv.val.valid != VALID_MSG) {
>> +		dev_err(dev, "Invalid STB data\n");
>> +		return -EBADMSG;
>> +	}
> Since user can understand the error via error number, can you use
> dev_dbg to avoid dumping messages in dmesg logs.

Sure, I will change to dev_dbg.

>
>> +
>> +	if (stb_dv.val.length != MP2_STB_DATA_LEN_2KB &&
>> +	    stb_dv.val.length != MP2_STB_DATA_LEN_16KB) {
>> +		dev_err(dev, "Unsupported length\n");
>> +		return -EMSGSIZE;
>> +	}
>> +
>> +	mp2->stb_len = BIT(stb_dv.val.length);
> Why not multiply with SZ_1K here instead of sprinkling it all over the driver?

Sure, that's correct I will change this accordingly in all places.

>
>> +
>> +	status = amd_mp2_stb_region(mp2->stb_len);
>> +	if (status) {
>> +		dev_err(dev, "Failed to init STB region, status %d\n", status);
>> +		return status;
>> +	}
>> +
>> +	amd_mp2_stb_send_cmd(VALID_MSG, true);
>> +	status = amd_mp2_wait_response(VALID_MSG, VALID_RESPONSE);
>> +	if (status == VALID_RESPONSE) {
>> +		memcpy_fromio(mp2->stbdata, mp2->vslbase, SZ_1K * mp2->stb_len);
>> +		filp->private_data = mp2->stbdata;
>> +		mp2->is_stb_data = true;
>> +	} else {
>> +		dev_err(dev, "Failed to start STB dump, status %d\n", status);
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int amd_mp2_stb_debugfs_open(struct inode *inode, struct file *filp)
>> +{
>> +	if (!mp2->is_stb_data)
>> +		return amd_mp2_process_cmd(filp);
>> +
>> +	filp->private_data = mp2->stbdata;
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t amd_mp2_stb_debugfs_read(struct file *filp, char __user *buf, size_t size,
>> +					loff_t *pos)
>> +{
>> +	if (!filp->private_data)
>> +		return -EINVAL;
>> +
>> +	return simple_read_from_buffer(buf, size, pos, filp->private_data, SZ_1K * mp2->stb_len);
>> +}
>> +
>> +static const struct file_operations amd_mp2_stb_debugfs_fops = {
>> +	.owner = THIS_MODULE,
>> +	.open = amd_mp2_stb_debugfs_open,
>> +	.read = amd_mp2_stb_debugfs_read,
>> +};
>> +
>> +static void amd_mp2_dbgfs_register(struct amd_pmc_dev *dev)
>> +{
>> +	if (!dev->dbgfs_dir)
>> +		return;
>> +
>> +	debugfs_create_file("stb_read_previous_boot", 0644, dev->dbgfs_dir, dev,
>> +			    &amd_mp2_stb_debugfs_fops);
>> +}
>> +
>> +void amd_mp2_stb_deinit(void)
>> +{
>> +	struct pci_dev *pdev;
>> +
>> +	if (mp2 && mp2->pdev) {
>> +		pdev = mp2->pdev;
>> +		pci_dev_put(pdev);
>> +		if (mp2->devres_gid)
>> +			devres_release_group(&pdev->dev, mp2->devres_gid);
>> +		mp2 = NULL;
>> +	}
>> +}
>> +
>> +void amd_mp2_stb_init(struct amd_pmc_dev *dev)
>> +{
>> +	struct pci_dev *pdev;
>> +	int rc;
>> +
>> +	mp2 = devm_kzalloc(dev->dev, sizeof(*mp2), GFP_KERNEL);
>> +	if (!mp2)
>> +		goto mp2_error;
> I think you can directly return -ENOMEM here instead of calling
> amd_mp2_stb_deini()
>> +
>> +	pdev = pci_get_device(PCI_VENDOR_ID_AMD, 0x172c, NULL);
>> +	if (!pdev)
>> +		goto mp2_error;
>> +
> Same as above.
>
> Also use a macro for 0x172c.

Sure, I will use macro.

>
>> +	mp2->pdev = pdev;
>> +
>> +	mp2->devres_gid = devres_open_group(&pdev->dev, NULL, GFP_KERNEL);
>> +	if (!mp2->devres_gid) {
>> +		dev_err(&pdev->dev, "devres_open_group failed\n");
>> +		goto mp2_error;
>> +	}
>> +
>> +	rc = pcim_enable_device(pdev);
>> +	if (rc) {
>> +		dev_err(&pdev->dev, "pcim_enable_device failed\n");
>> +		goto mp2_error;
>> +	}
>> +
>> +	rc = pcim_iomap_regions(pdev, BIT(2), "mp2 stb");
> Why BIT(2) ? Comment or use macro.

Sure, I will use macro here too.

>
>> +	if (rc) {
>> +		dev_err(&pdev->dev, "pcim_iomap_regions failed\n");
>> +		goto mp2_error;
>> +	}
>> +
>> +	/* MP2 MMIO is mapped to BAR2 */
>> +	mp2->mmio = pcim_iomap_table(pdev)[2];
>> +	if (!mp2->mmio) {
>> +		dev_err(&pdev->dev, "pcim_iomap_table failed\n");
>> +		goto mp2_error;
>> +	}
>> +
>> +	pci_set_master(pdev);
>> +
>> +	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
>> +	if (rc) {
>> +		dev_err(&pdev->dev, "failed to set DMA mask\n");
>> +		goto mp2_error;
>> +	}
>> +
>> +	amd_mp2_dbgfs_register(dev);
>> +	dev->mp2 = mp2;
>> +
>> +	return;
>> +
>> +mp2_error:
>> +	amd_mp2_stb_deinit();
>> +}
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index 108e12fd580f..926257125ac1 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -1106,6 +1106,8 @@ static int amd_pmc_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	amd_pmc_dbgfs_register(dev);
>> +	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>> +		amd_mp2_stb_init(dev);
>>  	pm_report_max_hw_sleep(U64_MAX);
>>  	return 0;
>>  
>> @@ -1122,6 +1124,8 @@ static void amd_pmc_remove(struct platform_device *pdev)
>>  		acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
>>  	amd_pmc_dbgfs_unregister(dev);
>>  	pci_dev_put(dev->rdev);
>> +	if (IS_ENABLED(CONFIG_AMD_MP2_STB))
>> +		amd_mp2_stb_deinit();
>>  	mutex_destroy(&dev->lock);
>>  }
>>  
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
>> index 827eef65e133..a49af1fa0060 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>> @@ -14,6 +14,17 @@
>>  #include <linux/types.h>
>>  #include <linux/mutex.h>
>>  
>> +struct amd_mp2_dev {
>> +	void __iomem *mmio;
>> +	void __iomem *vslbase;
>> +	void *stbdata;
>> +	void *devres_gid;
>> +	struct pci_dev *pdev;
>> +	dma_addr_t dma_addr;
>> +	int stb_len;
>> +	bool is_stb_data;
>> +};
>> +
>>  struct amd_pmc_dev {
>>  	void __iomem *regbase;
>>  	void __iomem *smu_virt_addr;
>> @@ -38,10 +49,13 @@ struct amd_pmc_dev {
>>  	struct dentry *dbgfs_dir;
>>  	struct quirk_entry *quirks;
>>  	bool disable_8042_wakeup;
>> +	struct amd_mp2_dev *mp2;
>>  };
>>  
>>  void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev);
>>  void amd_pmc_quirks_init(struct amd_pmc_dev *dev);
>> +void amd_mp2_stb_init(struct amd_pmc_dev *dev);
>> +void amd_mp2_stb_deinit(void);
>>  
>>  /* List of supported CPU ids */
>>  #define AMD_CPU_ID_RV			0x15D0

