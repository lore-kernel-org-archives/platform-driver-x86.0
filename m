Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1441C8603;
	Thu, 11 Jun 2026 04:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151246; cv=fail; b=dBcb80RqUjz8e/ifBr6wx6Bi7XM1z+xynpXktquBa+5SCnAg8uPJuqpWhW+P7cgsqzw+R0igucmXZ2Vrh4mRNd6pLNattdD/HNrkqI14fel98Hnz9mTU2dHzBfTDceWOGWeW4vYVe1IEWlaqY6cDcWFKNtI0hVkWl5iQKHH+HaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151246; c=relaxed/simple;
	bh=qUdEOlxV7szNT6MuF13WrTJf//nKMwmBdBUaJcrb25s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DQqBpLmU4ILLDFm9IOKmObQV2MsKbqKhd0H1y4WMakXhCUgENJi1f/lelYiZilyjAN3qJGfjMQsAqIiLofvVZ/jzi8S3Y1kurXSJT37QwgVCK6l7XnmSe955QjQtcGZm3EKQVbeH9JxjIvEva4UWBfDSoDQ1X9tTUsxJmNrrI58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=L2Um+RZx; arc=fail smtp.client-ip=52.101.201.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="L2Um+RZx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGLhsuPuOaQ1g3nIFVAhJtABBCneeDCidKrC/e6bIRXN4wsVy/1E6SO6hiT5ntfyZ4e5fTdPzsSHsoC1qEXZ/ykZNBRV9/s3cgyimX5S0lDUmyQkt9Jb/xBB2R7G0mV3xH0a3VqSsfTmduiiqIPGBUv9kvH1ZafTwo3dgliCgYEEMYt26QcPMgF0sU3WLDS7CDb46L2L1CQnj3o5fLVlU7afXzM9P7RmTTaF2hVhA9zSloFrPro4aaV2peuzLiZZtVQcnC4N3VxmEwMXXDBvcVz34GwhQnP4yp7LJFtuXgGQmMgXSWXE5+4LWSFB5t5RaNIPwTA9MEJQ9kuYsOpUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xjjl2Y4vnXS/4gOqZ5kxdEvlnNZXXLf+dn3BeHOOCLs=;
 b=ucgQno5uRrSQsnmOTI3o50+RIgSO+Ncvt7pn8d2AQMDinLnhj39ydQS8Mcyp9mg2w8JPvVlY4/ACvutE4i/m2ogYBZuuU55rt/7vbLCBN1V2j/MkjG/yM4LG8zSI0nUuMYEqmol71edE8I6kyIvQ7ijzJt7pVUe35BqVRvMo4SKR511UMWnKu8ioRrbpN/chLKsNfRtkYp6zHsyDSEmxRVAVL7ybd1EE245DpJ4IsSuSguQ/lw8pIj7+hZ27PU3xjxo3IspmENdqiMY9Vx0ffrwXBoTqF0dMPVbnAlVuMe8yhmw5Pgkq3c0mrMDMfMCw7kh8q78/ibmq6zR2sjOOZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xjjl2Y4vnXS/4gOqZ5kxdEvlnNZXXLf+dn3BeHOOCLs=;
 b=L2Um+RZxhRrycAbHJVr6QP6k8GqDIFEe7lOkDX2GvM4NVrd+nnfsAsMozIHo27X8Sl/rk8ce5LsLDzJTWrENQ1qTrC8ogNg1I61A2FWrmAB13YPXC6z+NEmn4gVBvl4NCB3mAWqBAHdHTG47oKXlBYIoLq/sp4hPz8AgnM2R9Og=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY8PR12MB7316.namprd12.prod.outlook.com (2603:10b6:930:50::11)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 04:14:01 +0000
Received: from CY8PR12MB7316.namprd12.prod.outlook.com
 ([fe80::6d07:74d1:96a0:9069]) by CY8PR12MB7316.namprd12.prod.outlook.com
 ([fe80::6d07:74d1:96a0:9069%5]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 04:14:01 +0000
Message-ID: <5de79916-8000-4676-8eae-769a305d709d@amd.com>
Date: Thu, 11 Jun 2026 09:43:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] platform/x86/amd/hsmp: Add
 IOCTL_GET_TELEMETRY_DATA for metric table reads
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Muralidhara M K <muralidhara.mk@amd.com>
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com>
 <20260528093954.2461272-6-muralidhara.mk@amd.com>
 <24802a50-52d9-0a89-a330-acc43b01b72b@linux.intel.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <24802a50-52d9-0a89-a330-acc43b01b72b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::15) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7316:EE_|SN7PR12MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 384aa70d-4630-4edb-e0cf-08dec76fdd70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|6133799003|3023799007|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	8D3ecPDDsQ4wIpVcQvbWZC/dBE4N8nwba22clAjObdE5IiBnfgcka0exoUTPcMEFGQD+M0DpJTcb50SplfAI5q+AvzDnV3C692w3V8l7+LUHuMO3gVP/Dzfp4CweKGFw+5HwYngoyyXfu36k4WmnSt5cCShPcgs8ujn+QieZ8XTQ/1oGgAAFO2iLNI10bCOra0y8c8vIdyAjo6w4ml51Sf+UHxyzXQ/IsnxaV6zOIAOCdMllC32mVlO3M/OqNPxcYheTo8jOr/ukt9DEHDRwFsYK4kQ96nieARcyDrtpNNoKDOiEQGrrg3c18M1pJLJUSNr2Cxa1JUqG0O5ORKmhwr4L6M5FmsVpkAO4OlVGviFNUOe9RUDWpwC2omtz9PxGEA1S2Yxjjz7BcKiwbHkaB/mGV8qfCUmbN2axQ+LG3qqsr6x4AUYvfHmhTvCzEHeQ2O/Q6g7ATvLa3ZmvbJ9r0cleg9gwNdpoAxQ1ATl2Iy4lItzG3eqihu/EpFQLbTTKW8ulv+bB6M4ltuIlm4/uHO0Q5nBQgd20z3epyNzsGol90gaCxH7y3kp96z1yXBjRDxdtUOOO2ibpPI4Cu2e5K+w+wVSdajgI8C4WZlB39QAhxMwPx+itljVi6CgHp77IdpZapACknOBJhnBhDpmo4eRiPGj+f0+p7y46G4oi0Yuq9aMaxpwVlSJXyRYb+b1p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7316.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(6133799003)(3023799007)(4143699003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QW1adzNLSjhPRHpXaGJxNEZFNStjN0FCNVhSOURLNEw5S3R1OWFLRjhMRnlI?=
 =?utf-8?B?TFBFTGhaU0M0Zit2U1RzbFY1RVZNNGJnem51c1lwSjgvMDVZYXJvcEdUakQ5?=
 =?utf-8?B?aWNYVStDNnAwallrdFRmSVI4RjBqSisrV0wzSjdaMmFTTEdTc0RsOGNvdVYw?=
 =?utf-8?B?b2xMN0htWUp2U0wvcHhoNGJqNjFVam5MK2lUbXZIdFhRZnpvdHplMkhmQm42?=
 =?utf-8?B?Q29oRXpzcGdPN045Z25WczB3clJaNkg2eXg0Mm16UENEbXlTc1Q4blowbjVq?=
 =?utf-8?B?N3NJYlFNZDU2WkdFVldGcXh4bzlkYVdpUXQyTTRNQTIrRlVYL01WalVqVmRX?=
 =?utf-8?B?cFhNekY1eGZzTENpUFJnajRTYkdkN2haNWZaU3NnQ1pjUktCMzFXWitCQ3JX?=
 =?utf-8?B?T3RmRWFqSUxPVHRJekNDZmhtSGhyL2lEWGdaWEhESnBlMWE0a0tuMUhJd3lL?=
 =?utf-8?B?YXRpMW4wczl5QVBaQ0grWWVYbGhaRXlNR013OGI4Mk1qc3Nhc2NuYXBuRjJP?=
 =?utf-8?B?T01UOWpESVZ1cWd6Z3EzZjRCUkRBNFY4RUFTQlhCVFU4UTZEQ3RncHNkNHJp?=
 =?utf-8?B?VUNLUVd0cWU4Rm44Z2QwMmNyWTQ5VWcvVTB2T1Z3K3kvMjZ3RTZ2YWFxcWx6?=
 =?utf-8?B?WnhROTBZQUQ2b1o0RWloQ1RlOFlWdEJENWlYK0pjUzVBYVNoM01mUGxyVno1?=
 =?utf-8?B?VzR5ZXNEQmx2OU5jSE9jRHk5ZENrdHBTV0xvVFh6Z0NkcnJkK2hYWlBVVWwr?=
 =?utf-8?B?bUVOYWQ2eHJadHNZRGtEVHA0WHkyeWJuOWhSQTYwWlM5RFhMbFc1S1RnUVpZ?=
 =?utf-8?B?Q3pJUXg2UTFJV1NzTmpUZzQwY1Z4NWNZUW9CR0dQREc4YmdjVFB4SWJPditq?=
 =?utf-8?B?NnNzRkl6Qkdmd05uRjlDZkNrbXVnQ3o2NTlwSzd3TUVzZi8zem9qbGQ3L2NM?=
 =?utf-8?B?dEs0VWZrU2hyeTNpWnlMUXpCTW4wb2pqSWNOanlMbnM2dnluV3BQQmFpN2M5?=
 =?utf-8?B?aVkzUDk5SWVSd1Nic1p5MDN5aG9WV3FnWEFTUUsvdVFwckRXVnZ1ZXF5Wi9F?=
 =?utf-8?B?dzV4aUk3bFFoZlB1UmpSTVNDT2gxTitOSXBESjNRbmJIRnNiVVNjbXJmb2py?=
 =?utf-8?B?alptZVY1Zk93VUlBc1JjWmVGaXlPQU9rc1VqdUxmbnVQaXBvQU9ob2xibGkx?=
 =?utf-8?B?amRQd3ZwQTlGL1d6NjRLeWhzNWowakhkSVJZK0JZYmRUWlFkSGRiZmVoSzZ1?=
 =?utf-8?B?L2NFYjNwbnlDc2F4QWtVM0JEUGZ3a3ZPT0loemZuRTJuam83TU9PdGgwQjNK?=
 =?utf-8?B?WmxyN1psbWJqcUluMktDUkJ2MXpLVEcvdHFjbDJTQ1NMRVVucSt3TUZHbThG?=
 =?utf-8?B?dm5CeW5CSlA1aTdQY3p6cHBmMWRidnRLZXVWVks0VkZCR1hzelArc0tUSnRa?=
 =?utf-8?B?d1MwV0FFbms2S2NmSWVoS1REbUQrbTJodEJEa0czd1d3WlZ3VlJnNjUwSVJi?=
 =?utf-8?B?M3Q0cEFqRGZGWEVlWjZzZjU3cTROL1R0T0xRZ1loNGVtemlyUmpQOVNOQzJT?=
 =?utf-8?B?NzRNMG8yVE5UTEtUMCtjMnIwK2NmN1R3S2VZbFY3c1dCRlM0bHp3T1UxaE9s?=
 =?utf-8?B?QThIcXNncUpPQm41UVVCdkVZU0FyOUpZOGsvaCtXMVM2SndZay9DSGJCQTJO?=
 =?utf-8?B?SXRuSWNjbG94QjJqeHRVRWdZTlI0YXN2UFZNZU9BbVN6aVJ5b3JsdWFXbTNU?=
 =?utf-8?B?WmZjZFgySUNXMXpKU0pxWUYzTTRJdGI2dDBHclRVNys4dHFHVndqWE5CdHFj?=
 =?utf-8?B?TDlJTEc2ZURxbDhYMVNoaWlGeks1Q1BBb2ZMWkFySCswREhkeklIeWtmc0hF?=
 =?utf-8?B?bUxGbVJGZW5ZalN2Q2FTNUtsT0t3VHB1dGM0OU81bE5vU2tIN1hiTzkxaVNO?=
 =?utf-8?B?ZkZmaitTSmVRUERaRFJ5ZUtyU2Q2aVRwMWFKU0hPbldQNVpYaDRCYjEzSTVN?=
 =?utf-8?B?SE9JSnVOQ2p6aEh3T29LN2haNGF6UVBqT28vQXpLQ1dGWXBTbW8vYVJHdGVH?=
 =?utf-8?B?eUNGeHBvZmxLK0ZkTnNRODI2L0RtQ0w5MlpMV0RmR3VVRzhCd29kSEtzdVZB?=
 =?utf-8?B?RUJkTmFObWJYMGNhNjBqL2ZyY3RaOFJyU3JrOWVIM1dRQmlDZE9LK3cvUjZU?=
 =?utf-8?B?UzVTS1dpMXRuaHh4dW1ZZzFiblBFdEZWV3plUE04ZE1UV3lRdklsQnRmTXFR?=
 =?utf-8?B?VDhHSVJzN3V0eWkxaVNEazVKbW1YNjJ5dG9GN2k4VkY2dnBrNERJRGhvdDNl?=
 =?utf-8?B?bTBDM1RpbWFpOFRrSTdjeExOdmwyTHFKSHkzQ1h2MFMwWWJTUDVIdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384aa70d-4630-4edb-e0cf-08dec76fdd70
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 04:14:01.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92bSA3RLRNDJJ0pexeuEqidFO+VIOvD2R8J7G/L5vI/rntEK0RY0TtC/mnzDJX+f/+ShzmzrL1ZpjWIIjZu7KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911



On 6/10/2026 4:32 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, 28 May 2026, Muralidhara M K wrote:
> 
>> The metric table needs to be delivered to userspace as a single
>> atomic snapshot, but the current sysfs metrics_bin path is a file
>> read: userspace can read it in chunks and observe a torn snapshot
>> if an SMU refresh happens between read() calls. The same path is
>> also bounded by PAGE_SIZE, so the ~13 KB hsmp_metric_table_zen6
>> used on Family 1Ah Model 50h-5Fh cannot be returned at all,
>> regardless of how userspace reads it. Rather than extend sysfs to
>> lift both restrictions, expose the metric table through the
>> existing HSMP character device using a new ioctl that always copies
>> the full table in one shot.
>>
>> Add struct hsmp_telemetry_data and HSMP_IOCTL_GET_TELEMETRY_DATA
>> to the UAPI header. Under the surrounding #pragma pack(4), placing
>> the __u64 user pointer first gives a tight 16-byte layout that is
>> identical for 32- and 64-bit callers, and the trailing __u16
>> reserved field is rejected with -EINVAL if non-zero so future
>> kernels can repurpose it without breaking already-deployed
>> userspace. Userspace sizes its buffer using the matching UAPI
>> metric-table struct for the running platform; sizes that disagree
>> with the firmware-reported table size are rejected so a short copy
>> can never silently truncate the snapshot.
>>
>> Dispatch hsmp_ioctl() on the ioctl command: the existing message
>> handler is factored out as hsmp_ioctl_msg() for HSMP_IOCTL_CMD, and
>> HSMP_IOCTL_GET_TELEMETRY_DATA goes to a new
>> hsmp_ioctl_get_telemetry() helper.
>>
>> The user-controlled indices reaching kernel arrays via these ioctl
>> paths are clamped with array_index_nospec() to mitigate Spectre v1
>> (CVE-2017-5753): req.sock_ind before indexing hsmp_pdev.sock[], and
>> msg.msg_id once at the entry to hsmp_ioctl_msg() so all six
>> downstream hsmp_msg_desc_table[] dereferences inherit the clamp
>> from a single mask.
>>
>> Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   Documentation/arch/x86/amd_hsmp.rst  |  30 ++++++-
>>   arch/x86/include/uapi/asm/amd_hsmp.h |  43 ++++++++++
>>   drivers/platform/x86/amd/hsmp/hsmp.c | 117 ++++++++++++++++++++++++++-
>>   3 files changed, 188 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
>> index 8bb411f0d70d..74c259507888 100644
>> --- a/Documentation/arch/x86/amd_hsmp.rst
>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>> @@ -68,6 +68,14 @@ under per socket sysfs directory created at
>>
>>   Note: lseek() is not supported as entire metrics table is read.
>>
>> +The sysfs metrics_bin path supports only HSMP protocol version 6 and,
>> +because it is a file read, can return a torn snapshot if userspace
>> +reads in pieces.  Protocol version 7 metric tables
>> +(``struct hsmp_metric_table_zen6``, ~13 KB) also exceed PAGE_SIZE, so
>> +a read returns ``-EOPNOTSUPP``.  For atomic reads on any protocol
>> +version, use the ``HSMP_IOCTL_GET_TELEMETRY_DATA`` ioctl on /dev/hsmp
>> +(see below).
>> +
>>   Metrics table definitions will be documented as part of Public PPR.
>>   The same is defined in the amd_hsmp.h header.
>>
>> @@ -167,7 +175,7 @@ Next thing, open the device file, as follows::
>>       exit(1);
>>     }
>>
>> -The following IOCTL is defined:
>> +The following IOCTLs are defined:
>>
>>   ``ioctl(file, HSMP_IOCTL_CMD, struct hsmp_message *msg)``
>>     The argument is a pointer to a::
>> @@ -180,6 +188,26 @@ The following IOCTL is defined:
>>        __u16   sock_ind;                       /* socket number */
>>       };
>>
>> +``ioctl(file, HSMP_IOCTL_GET_TELEMETRY_DATA, struct hsmp_telemetry_data *req)``
>> +  Atomically fetch the firmware metric (telemetry) table for a socket.
>> +  The ioctl copies the table in one shot, so unlike the metrics_bin
>> +  sysfs path it cannot return a torn snapshot and is not bounded by
>> +  PAGE_SIZE.  Required for HSMP protocol version 7+ (e.g. Family 1Ah
>> +  Model 50h-5Fh, ~13 KB ``struct hsmp_metric_table_zen6``).  Argument::
>> +
>> +    struct hsmp_telemetry_data {
>> +     __u64 buf; /* User pointer to destination buffer */
>> +     __u32 size; /* Size of @buf, must equal firmware-reported table size */
>> +     __u16 sock_ind; /* Socket index */
>> +     __u16 reserved; /* Reserved, must be zero */
>> +    };
>> +
>> +  Userspace picks the layout matching the running protocol version
>> +  (``struct hsmp_metric_table`` for v6, ``struct hsmp_metric_table_zen6``
>> +  for v7, queried via the ``protocol_version`` sysfs attribute) and
>> +  uses ``sizeof()`` of that struct for ``size``.  The kernel rejects
>> +  a mismatched ``size`` or non-zero ``reserved`` with ``-EINVAL``.
>> +
>>   The ioctl would return a non-zero on failure; you can read errno to see
>>   what happened. The transaction returns 0 on success.
>>
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> index 438ac38d0dc8..50b28ccc7597 100644
>> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -686,6 +686,40 @@ struct hsmp_metric_table_zen6 {
>>        struct hsmp_metric_table_zen6_ccd ccd[HSMP_F1A_M50_M5F_MAX_CCDS];
>>   };
>>
>> +/**
>> + * struct hsmp_telemetry_data - Request descriptor for HSMP telemetry IOCTL
>> + * @buf:       Input. Userspace pointer (encoded as __u64 to keep the layout
>> + *             stable between 32-bit and 64-bit callers) to the destination
>> + *             buffer that receives the metric table.
>> + * @size:      Input. Size in bytes of the buffer pointed to by @buf.  Must
>> + *             match the firmware-reported metric table size for the running
>> + *             HSMP protocol version (see below); any other value results in
>> + *             -EINVAL.  The kernel does not write this field back.
>> + * @sock_ind:  Input. Socket index from which the metric table is read.
>> + * @reserved:  Reserved for future use.  Callers should set this to zero;
>> + *             future kernels may begin interpreting the field, so passing
>> + *             a non-zero value today is not forwards compatible.
>> + *
>> + * Placing @buf first lets all fields fall on their natural alignment under
>> + * the surrounding #pragma pack(4), so the struct is a tight 16 bytes with
>> + * the same wire layout on 32-bit and 64-bit userspace.
>> + *
>> + * The exact metric table layout depends on the HSMP protocol version reported
>> + * by the firmware:
>> + *   - Protocol version 6 -> struct hsmp_metric_table
>> + *   - Protocol version 7 -> struct hsmp_metric_table_zen6
>> + *
>> + * Userspace queries the protocol version (e.g. via the protocol_version sysfs
>> + * attribute) and uses sizeof() on the matching UAPI structure for both @size
>> + * and the allocation backing @buf.
>> + */
>> +struct hsmp_telemetry_data {
>> +     __u64   buf;
>> +     __u32   size;
>> +     __u16   sock_ind;
>> +     __u16   reserved;
>> +};
>> +
>>   /* Reset to default packing */
>>   #pragma pack()
>>
>> @@ -693,4 +727,13 @@ struct hsmp_metric_table_zen6 {
>>   #define HSMP_BASE_IOCTL_NR   0xF8
>>   #define HSMP_IOCTL_CMD               _IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
>>
>> +/*
>> + * Fetch the firmware metric (telemetry) table for a given socket via the
>> + * HSMP character device.  This avoids the PAGE_SIZE limitation of the
>> + * sysfs binary attribute path for tables larger than one page (such as the
>> + * ~13 KB hsmp_metric_table_zen6 used on Family 1Ah Model 50h-5Fh).
>> + */
>> +#define HSMP_IOCTL_GET_TELEMETRY_DATA \
>> +     _IOWR(HSMP_BASE_IOCTL_NR, 1, struct hsmp_telemetry_data)
>> +
>>   #endif /*_ASM_X86_AMD_HSMP_H_*/
>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>> index cf9392f99298..67f0074bb532 100644
>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>> @@ -12,8 +12,11 @@
>>   #include <linux/acpi.h>
>>   #include <linux/delay.h>
>>   #include <linux/device.h>
>> +#include <linux/nospec.h>
>>   #include <linux/semaphore.h>
>> +#include <linux/slab.h>
>>   #include <linux/sysfs.h>
>> +#include <linux/uaccess.h>
>>
>>   #include "hsmp.h"
>>
>> @@ -287,7 +290,7 @@ static bool is_get_msg(struct hsmp_message *msg)
>>        return false;
>>   }
>>
>> -long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>> +static long hsmp_ioctl_msg(struct file *fp, unsigned long arg)
>>   {
>>        int __user *arguser = (int  __user *)arg;
>>        struct hsmp_message msg = { 0 };
>> @@ -303,6 +306,19 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
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
> 
> This is a good change, but it looks to me it's fixing an existing problem,
> that is unrelated to this patch which is supposed to be about:
> 
> "Add IOCTL_GET_TELEMETRY_DATA for metric table reads"
> 
> So I think it should be done in own patch.
> 
Sure. I will make this as a seperate patch.

>>        switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
>>        case FMODE_WRITE:
>>                /*
>> @@ -343,6 +359,105 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>        return 0;
>>   }
>>
>> +/*
>> + * Fetch the firmware metric (telemetry) table for the requested socket and
>> + * copy it to the userspace buffer described by the request.
>> + *
>> + * The metric table size is variable across HSMP protocol versions and on
>> + * Family 1Ah Model 50h-5Fh exceeds PAGE_SIZE.  Userspace must therefore
>> + * supply a buffer at least the firmware-reported size in bytes.
> 
> Here the comment says "at least" but you check it's exactly equal to the
> required size?
> 
>> + */
>> +static long hsmp_ioctl_get_telemetry(struct file *fp, unsigned long arg)
>> +{
>> +     void __user *arguser = (void __user *)arg;
>> +     struct hsmp_telemetry_data req;
>> +     struct hsmp_socket *sock;
>> +     void __user *user_buf;
>> +     size_t tbl_size;
>> +     unsigned int sock_ind;
>> +     void *kbuf;
>> +     int ret;
>> +
>> +     /* Telemetry data is read-only; require read access on the fd. */
>> +     if (!(fp->f_mode & FMODE_READ))
>> +             return -EPERM;
>> +
>> +     if (copy_from_user(&req, arguser, sizeof(req)))
>> +             return -EFAULT;
>> +
>> +     /*
>> +      * Reserved fields must be zero so future kernels can safely
>> +      * repurpose them without breaking already-deployed userspace.
>> +      */
>> +     if (req.reserved)
>> +             return -EINVAL;
>> +
>> +     if (!hsmp_pdev.sock || req.sock_ind >= hsmp_pdev.num_sockets)
>> +             return -ENODEV;
>> +
>> +     tbl_size = hsmp_pdev.hsmp_table_size;
>> +     if (!tbl_size)
>> +             return -ENODEV;
>> +
>> +     /*
>> +      * Userspace must size its buffer using the appropriate UAPI metric
>> +      * table struct for the running protocol version.  Reject mismatched
>> +      * sizes so we never silently truncate or short-write.
>> +      */
>> +     if (req.size != tbl_size)
>> +             return -EINVAL;
>> +
>> +     /*
>> +      * Sanitize the user-controlled socket index against speculative
>> +      * execution.  The bounds check above retires the out-of-range case
>> +      * with -ENODEV, but a mispredicted branch can still let the CPU
>> +      * speculatively use sock_ind as an index into hsmp_pdev.sock[] and
>> +      * pull arbitrary kernel memory into the cache (Spectre v1, CVE-2017-
>> +      * 5753).  array_index_nospec() turns the bounds check into a
>> +      * data-flow clamp so the speculative load is in-range too.
>> +      */
>> +     sock_ind = array_index_nospec(req.sock_ind, hsmp_pdev.num_sockets);
>> +     sock = &hsmp_pdev.sock[sock_ind];
>> +     if (!sock->metric_tbl_addr)
>> +             return -ENODEV;
>> +
>> +     user_buf = u64_to_user_ptr(req.buf);
>> +
>> +     /*
>> +      * The bounce buffer is overwritten in full by memcpy_fromio() inside
>> +      * hsmp_metric_tbl_read(); use kvmalloc() to avoid the zeroing cost of
>> +      * kvzalloc() on the ~13 KB allocation done on every ioctl call.
>> +      */
>> +     kbuf = kvmalloc(tbl_size, GFP_KERNEL);
>> +     if (!kbuf)
>> +             return -ENOMEM;
>> +
>> +     ret = hsmp_metric_tbl_read(sock, kbuf, tbl_size);
>> +     if (ret < 0)
>> +             goto out;
>> +
>> +     if (copy_to_user(user_buf, kbuf, tbl_size))
>> +             ret = -EFAULT;
>> +     else
>> +             ret = 0;
>> +
>> +out:
>> +     kvfree(kbuf);
>> +     return ret;
>> +}
>> +
>> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>> +{
>> +     switch (cmd) {
>> +     case HSMP_IOCTL_CMD:
>> +             return hsmp_ioctl_msg(fp, arg);
>> +     case HSMP_IOCTL_GET_TELEMETRY_DATA:
>> +             return hsmp_ioctl_get_telemetry(fp, arg);
>> +     default:
>> +             return -ENOTTY;
>> +     }
>> +}
>> +
>>   ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>>   {
>>        struct hsmp_message msg = { 0 };
>>
> 
> --
>   i.
> 

