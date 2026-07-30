Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010040.outbound.protection.outlook.com [40.93.198.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681A73B6C14;
	Thu, 30 Jul 2026 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405918; cv=fail; b=efN338/sMItyoSz1dzR9ARYplS5UAZ8ECPkpSHbQza4wVQeCDvOwgoaX2FLbHpotMVO7w3u1zH7Yh0TT89ZjVgdyadnCJ5uf09VU34oJJcMrNro8ASwnP81dCPVBq+x6Ab2KKRuCkjGYqd/W9f/yfrlBSe+l5rdkfAARynWLGO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405918; c=relaxed/simple;
	bh=el86hcCMc2nLyWcNkEgdnZaVRnVeemEzHurQ+mofVYs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NVvxeHPRlfabZlTke5oQ09KNw8dOl36+szLWvsq+3FIrKNj5M7+E15zJ2GK3C4/e8LNeVqjReMzJS077CXwJkdFIwux8mjyP3HcOCkMRwk00YRKrlPhgEI/+PNOii2eoGau31MlHMHA38vuPDl/DT+rSaV7CGqB3cQLXXhGaMPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EkqevYZh; arc=fail smtp.client-ip=40.93.198.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EkqevYZh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsmnOVQqOfZRNlwR680jx3Gs0fdW1EdGc8MsEhiEXxFqoH3m9QsqBfNjsIN58df+MD6Hkshwc6MObAPExBapyaDjDYYkSI0bIVhgcZzw4LDR4A/l9M94Emug3AO2RL1oQ3Bl6Fp++J7shAzeZgkUCH0mdF2oEOss9WudJxdiCz0Gj3vXfafM1XDLP9Ct9ErKabQIGsgFGbnQkk0WsIOIKKqNznwfGcKdTPNdfrd9FnY6IvrnFqozZsbPvhYawcDXOBxJA9f88YQX855hkLC776I6VhP5mBLfVp22U7VNd2pqROkWEDIpO5UE4T9b8diHgE9xrAC1EDZaXYYRBajV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ufvmdBPHVEQvhz3s4XzuzFE3J5sjq562G3Y+lOWFfA=;
 b=LIw3/FfRLd9KZfSWF5pqjcizqDSE+8cKSMUn8QyIpQzmLcxI7tWerSwhrzlnarx0j/O0AgwMCKQ7hv1wbXEvgycqzSPEzY+XSxVz8ykgbDtlqRalbwI5yWi0wdvjhiRcOigxRwB9YRmUImUnqYY6S4y12yZKR5PC2dRX9AaCUg7oniR2qhHhsqOHMWxj4t1stCjQMdT64vO2jgEqA4C8covxebM6tE+kdLToP9vY0QfjX2PQ7kXn6Raqde9LrVie5Woi3pk8DSpXMcoEkQwvlgtBc4hQgIlvfiPkhq+PKFT4Lt7rwu+AS4sCZDVuDDSFFETiw2C3wltWuGQqOa+7cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ufvmdBPHVEQvhz3s4XzuzFE3J5sjq562G3Y+lOWFfA=;
 b=EkqevYZhOtjBTAq+TmhXB3sqdF4Gwn0tnfBgKuF6RqH4Ki914j1bzJKD73gFLdE7yYDSDctnBIwFnQHfX1/ZLTUAn6F7Wx1esNu6gBPJWwckyFk2A91JNmtVqJfqvRlAoM6HbFbryyZ1DpfyHscQENUyiuXIApwncLzLUBQrS9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Thu, 30 Jul
 2026 10:05:14 +0000
Received: from PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc]) by PH8PR12MB7325.namprd12.prod.outlook.com
 ([fe80::8024:a7ee:b29c:a4fc%6]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 10:05:14 +0000
Message-ID: <ffdf1489-6133-405a-a531-e8e7a6cc99ad@amd.com>
Date: Thu, 30 Jul 2026 15:35:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] Documentation/arch/x86/amd_hsmp: Document the SMN and
 MSR IOCTLs
To: Mario Limonciello <mario.limonciello@amd.com>,
 Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-8-muralidhara.mk@amd.com>
 <5c7fffb6-72e1-4ead-ab02-7544593a96b3@amd.com>
Content-Language: en-US
From: "M K, Muralidhara" <muralimk@amd.com>
In-Reply-To: <5c7fffb6-72e1-4ead-ab02-7544593a96b3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0249.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::10) To PH8PR12MB7325.namprd12.prod.outlook.com
 (2603:10b6:510:217::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7325:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 68824998-1be4-4283-6892-08deee220c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	c6OZ7sgh4YVukS7J8FRL4zWZEvZvHASqCT3vHY5bd+GSkeVYMWKZ0rOmEh84Ugb4gI3lg1McnBdNpJQEsgNNGSXH9lxBpta+09dZ/p28BHnEGp9hXqQfAv6/lSgtI0jgtFLpBMvK2lQeQRkdmEzPJRnbdJgTTmtclc1Sh2cEf9EswBiRRkgCPx9M0VA4sC8XtVNPKEsQXlh+qRog0ryMmq6UYpUVCW/yEAlF+h3ihQ49n9DdrEmZff6i5FsCpB2cx1KGNRMHzrqTztYWu9a7OerD3BEHfYhBMj2rZL8dlKrSQPSvE/kIXtSDnT/xzXuJWWw4L3Pn0AOSDeGMSbmQKvTIo0+bZfwLRjGIcaoRd08cn3G+FZ0GcKSvoyGtRnVRqQyiffcKrDz1pa+bPZEUya71xH78l1cSq7JowC3ZV1Pt9inzcE+Wcqd9zyj6mWcAb/l4zegbwh0y1toqgA3hPOaB1j7OiS6m/QfnFvc/OnrZvUIrdffzUiAWSNjoZcDt/9DrX22qLazl0R/URIO7uUYtWHxsRP1m29nPY7tpo2g55iDwFuGkgKNrvcsf5SBfRbtQQs75JZo7negYtJpoT8+zMLQleSfMhPQN1MuxdudpZrXSe71lbq4dztE1LshMBJM3Q3hNwN9L73tmzF4cvbynIOV5Cy5DV4moqEmtcok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7325.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cC9TRnp2enYweStIbzRCcGtSR3BMMkNoUitma3FMZ0R5WWdyWmR3S1o0aTRR?=
 =?utf-8?B?M2d0TGRaUXJWUGxSTHg1M2xsWmQvd0xOY3BPTjJ5OG5zam1qbC9KNjBPczFy?=
 =?utf-8?B?U2daWGtBOEhYMEpXbFBxRzZsNE9yOExkM2hpTkpRVGxHRzRUc3Z0ejN2MzlH?=
 =?utf-8?B?dmFidHFuNUVFSlBwa0ZHSXBEWUpwVGRzMUhSazZmM0hTN2pOSTRVckJuanNX?=
 =?utf-8?B?Y0VZaGhaWEkxaTdWMGlYUkdFUFVCUjNudC9ZbktIeFRQNUQ4S2d4dkdndGxM?=
 =?utf-8?B?UHRhUCtObzJUK3VnZ2ZrdHVHc3lYMTlQR09wejVpSGdVMXEwOTdnYjQyNHNS?=
 =?utf-8?B?dUNVTG9nZDNMSkc3ZUFyenBQOUU0TkkxU29GY2xSUXdNWFk2UW5VUk1rOFVa?=
 =?utf-8?B?aURSZ1RqZnY5SkZiV2VXRE5IU3MvM0JObGxLbjhlU29RZGxMbXBmMVZkNjUx?=
 =?utf-8?B?bW8vbVhWbnZqaXpPN0NPWnRpaHJ2RjdrZDV5TEhLVlZuazRpVzhubXc3RUlH?=
 =?utf-8?B?SUo3UXNnQWlhZlJqaVc5cTZXZ3hzbVNTem5JRjNyWTBjdmVNTzNUS2NyY1h2?=
 =?utf-8?B?VGVqSllWRE9qNE9TT29hc0RwTDZ4V21KYzRCSkF6ZlQ0b0p5L21Kd0tqeWIr?=
 =?utf-8?B?b0JpdEtMTHpweng5MVBuSnlvbnJSQ1ZzYjdGMUwwckY1S2JBRjBVYVlQTVp2?=
 =?utf-8?B?b0FUemFIZ2NLbnEzcEtkMFZiYzBGR0E4alZYb1YxUFJPMGZyWi9SZGwybVVR?=
 =?utf-8?B?SjdFME9aWnVCZTF3UE9iTUZpeTlIaFFMU05aRkF6a1NvaE1JOEFxd2krZVpO?=
 =?utf-8?B?WUhaVkVZUEVPUmtkeU9FUEJzNyt2dk1MelVzcVVMeGlvN2RnVHF4MGw5aDJM?=
 =?utf-8?B?OFMxYXNMYUdIMzAvbGhiV29xL1VkRHhHd0ZoZGkwdnhnVXh3bFJqTFZSYnBG?=
 =?utf-8?B?ZGNVdm5vWE9oYWhoRllkRGdCcCtXRHFIcW40NmhtVjBnZjdMengxVFViQ2N6?=
 =?utf-8?B?VzBoRzVuMDlyR3kxMUEzYUo0NmUveWMxKysvOFd5VGlqSUdMUVBIMStJRHRu?=
 =?utf-8?B?V1NEUFM3Nzh5b3VUU3UyQ3ZQdWJkeVg2N0xOTFU4YnJQQ01UUitZaHpWU3Va?=
 =?utf-8?B?WXFtVEF3QXF3dnhicmZOejBpb01iS1l6elNBQ2hGakR3RUZhRzJZYmtCdmlW?=
 =?utf-8?B?b3NTeGM2ajc1MEtTYXNSNkd2cXF0OHlWcFJuMWVITEY1b1AxUGJza1VScEZa?=
 =?utf-8?B?MDlHMm44a2wxUHY1aExRUVR6d0NmMk5ROXRxNUNxSGpOdk5CNVRqSENhTnR2?=
 =?utf-8?B?TDZtMFdac25kc2dkUHBHV3BXbEEwbHdYMGZ6QVYxVk55SHh3YUdrSXg1VVQ1?=
 =?utf-8?B?WmJSM256WS9kMDBkYmVVZ0JiRmhhdWFsZW9NOVdCamNsck8vUEdocUltRG5i?=
 =?utf-8?B?OGR0NGZGTGo2OHpicHdKb3VoTXgvUm5YZ2dJdW1xbzlyRVczTXVzTW1Ta2R6?=
 =?utf-8?B?RGZtRDZVemhUUEYzYzBBSHh0a05qbjVVOGRvdkZHaU5xUExPV0ViYVA3WU51?=
 =?utf-8?B?YmF1WDNYa1NsbFJyRGEvT3dmcW11NEpVMHY4eFZ5dXZyZ0dLRVJHNXhiUzZN?=
 =?utf-8?B?aUFCSC9GS0lQNEZZbE11TFU4U1dVcE90TTlOay9uYnNSc2hzbmdqS040RURu?=
 =?utf-8?B?aG5JaWhjS0VEdGlZUTFYWTJFOUtwRXp6K2UwdzRpZ3I2bzJmWVlDUU5jS3d6?=
 =?utf-8?B?UFNCUXlIa2VpekVhWG1lSnMrUjByK0prRXFxbUZIaFJUSE1PYkRxUm9Va0xI?=
 =?utf-8?B?Y2hDYWFqWElJTWVBblVWNFdlNVNiQlAzNEE0MU5tRjYyUGk0TTVDNzNmWUpS?=
 =?utf-8?B?dGsxSGdlaUFXUi94SFFwblNSeTNpMThxQnVXb0RFbmlpUWJPZWNKbWt3UmEx?=
 =?utf-8?B?ZGxxTEhLK1IrRGZvTjFNQ1R6QzF3QWxPV0p0ZWFvZ2F5cTZuRURPL1pkN3Nz?=
 =?utf-8?B?emFjKzJ5VTV6cGtPSVhpdGkwN3VCd21IakI3UXFOd3dWOWtoTkFFTzFSblJE?=
 =?utf-8?B?WlVvaUpJcmcvQUYrcVF2WXp2TjY1MU1lRmNZaGlZNWNEZzZ4Y3ByQnRpcmJx?=
 =?utf-8?B?dXFlRGYrRmdlTTlhZDByYWJRWDJ0THlaRVQyU2J2L0wyMHZzU29JTnlpUWZ6?=
 =?utf-8?B?cm9CbmNIeWtwR2h5UlNiK2pYTUpYcVI3KzQrSUc3Tnk4NW5Pcy9TTngwWlZp?=
 =?utf-8?B?NlZNdzd4YkROUUljSi9Ha3h1SDlHQmUzMVRram5RL0gwWFJmS25KQWhwajZB?=
 =?utf-8?B?UzdhUittV1R5U0pKT2x5YnJsWktaZnMzY3BNUzk1MUJxbGVMYnRQdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68824998-1be4-4283-6892-08deee220c79
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7325.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 10:05:14.2563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Az4722Jf2ar6jNbin9r/uTuohrELrS6upRbthNDQtK21SWa5V3f4uC+f9hdqPVzL36a1O2F4rUOgyz8/Hgkz2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072



On 7/30/2026 3:11 AM, Mario Limonciello wrote:
> 
> 
> On 7/29/26 11:40, Muralidhara M K wrote:
>> Describe HSMP_IOCTL_SMN_CMD and HSMP_IOCTL_MSR_CMD: the payload structs,
>> the CAP_SYS_RAWIO and open-mode requirements, and the rule that both are
>> read-only, so a request with @write set is refused with -EPERM even for a
>> fully privileged caller on an O_RDWR handle.
>>
>> Also note that reading the protocol_version attribute can fail on the
>> Fam1Ah client platforms, because some client SMU builds reject the
>> interface-version query, which is why the telemetry ioctl rather than
>> that attribute is the way to reach the client telemetry layout.
> 
> I'm happy that these are (at least) defaulting to read-only, but I don't 
> understand their purpose.
> 
> We already have /dev/cpu/CPUNUM/msr, and we also have amd-node which 
> provides access to SMN via /sys/kernel/debug/x86/.
> 
> Can you better describe the needs of why these new messages must exist 
> and we can't have structured data for them?
> 
Thanks for the input. Yes, I will describe more on why we need them.

> Even if amd_hsmp needs to use SMN or MSR to fetch specific data data, 
> this feels a lot safer to have a structured specific fetch method than 
> such a wide (albeit permissioned) pipe.
> 
>>
>> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
>> ---
>>   Documentation/arch/x86/amd_hsmp.rst | 44 +++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/ 
>> x86/amd_hsmp.rst
>> index 8a9d6fe7d4cf..0f03201a9f68 100644
>> --- a/Documentation/arch/x86/amd_hsmp.rst
>> +++ b/Documentation/arch/x86/amd_hsmp.rst
>> @@ -229,6 +229,50 @@ The following IOCTLs are defined:
>>     ``sizeof(struct hsmp_metric_table)``.  Later version metrics table
>>     layout is documented in the Public PPR.
>> +  On the Fam1Ah client platforms reading ``protocol_version`` can fail,
>> +  because some client SMU builds reject the interface-version query.
>> +  Those parts have their own telemetry layout and this ioctl is the way
>> +  to read it.
> 
> It seems to me you don't actually describe the telemetry layout or what 
> should be done with SMN.
> 
>> +
>> +``ioctl(file, HSMP_IOCTL_SMN_CMD, struct hsmp_smn_message *smn)``
>> +  Read a 32-bit SMN register on the socket given by ``sock_ind``.  This
>> +  reaches registers outside the HSMP message ABI, so it requires
>> +  ``CAP_SYS_RAWIO`` as well as a handle opened for reading, the latter
>> +  because the value read is written back into the request struct.
>> +
>> +  The ioctl is read-only.  ``write`` must be zero, and a request that
>> +  sets it is rejected with ``-EPERM`` even with ``CAP_SYS_RAWIO`` and an
>> +  ``O_RDWR`` handle; the field exists only so that write support 
>> could be
>> +  added later without changing the layout.  ``reserved`` must be zero.
>> +  Argument::
>> +
>> +    struct hsmp_smn_message {
>> +        __u32 smn_address; /* SMN address to read */
>> +        __u32 value;       /* Value read, filled in by the kernel */
>> +        __u16 sock_ind;    /* Socket index */
>> +        __u8  write;       /* Must be zero */
>> +        __u8  reserved;    /* Reserved, must be zero */
>> +    };
>> +
>> +``ioctl(file, HSMP_IOCTL_MSR_CMD, struct hsmp_msr_message *msr)``
>> +  Read a 64-bit MSR on the logical CPU given by ``core_id``, or on
>> +  whichever CPU the ioctl runs on when ``core_id`` is
>> +  ``HSMP_MSR_ANY_CPU`` (``(__u32)-1``).  Any other ``core_id`` must 
>> refer
>> +  to an online CPU, otherwise the call fails with ``-EINVAL``.  Requires
>> +  ``CAP_SYS_RAWIO`` and a handle opened for reading.
>> +
>> +  Read-only on the same terms as ``HSMP_IOCTL_SMN_CMD``: a non-zero
>> +  ``write`` is rejected with ``-EPERM``, and every byte of ``reserved``
>> +  must be zero.  Argument::
>> +
>> +    struct hsmp_msr_message {
>> +        __u32 msr_address; /* MSR index to read */
>> +        __u32 core_id;     /* Logical CPU, or HSMP_MSR_ANY_CPU */
>> +        __u64 value;       /* Value read, filled in by the kernel */
>> +        __u8  write;       /* Must be zero */
>> +        __u8  reserved[3]; /* Reserved, must be zero */
>> +    };
>> +
>>   The ioctl would return a non-zero on failure; you can read errno to see
>>   what happened. The transaction returns 0 on success.
> 

