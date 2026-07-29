Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011055.outbound.protection.outlook.com [52.101.52.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25613C3C00;
	Wed, 29 Jul 2026 21:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361276; cv=fail; b=WEHnKcNbG1kaqI9GCwEV4p2BNZilHlatumNqEtJmacwIZzROX+llF7Q9YjDj100Q6x+U1vFJ2SqdfvL4NVkphhtGKFSPxVoyTBw0Fe7GPcCN+9lbdR6RYbfbTF9zrT3tIUEo9GHrC90RWxWpjUcc/uVOmA6P/WO3CtQcxREXUs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361276; c=relaxed/simple;
	bh=6fqJ/7q0UXx+OClYxK2RI3GS1bw7Bh4DfwfwIoB9SnM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fHdmggranCn37Mo4OAbEjORpxrZ8sIve8jNCX6CvsNF6LO6dzWjwprdb3k1g9KbNwP1qZjOxLTJ9jvz4ofDn2l/Xgl4VSPCl3k0s+kF1QZUkELDh+5X+saPRUDcpBQYZ5RGdty9xUFbKTwcuJZh1ZBriTO7fzhvl9qQwFMVLBIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mLWHBC4B; arc=fail smtp.client-ip=52.101.52.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mLWHBC4B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGc8nL7S4gO65m4d2GE1tfFcJBFIXNn+KQI/80JqDS1Hj2gqUcGoawNEzqCumClSB7nW7gf40/JMcS6VVok/5WmLjDubElnNVDHSVknOmcRWVKqXw9MGF7NeIVEMjqQUCo3/Z7AdFsgECWwj+kkF0vuVVEJf+Y2UHluQ06PllR0EgxIrieie4L2uqIMfYJkGYlkZMrPVbaEA3yEpztpETGSnlXQV0NQSkJvo96/gsAKVtPdwNvgKimfGFS2Hm+ycnP45XNE4Qkp4OKw++6fnVy8uT1ueMoFY5MjBYX8AzeRuD9AhDqdVGHtPvD7JRvkwIPdVdS3te/P+JDP6djGMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Pce3pfG8z3GJUx4AvQFCi7XWo41GyfNVvGnt1JArNU=;
 b=ZjMuPcmOGpNzDgZMH+7Qv0JBxVBsyee8oDcuUsy1wJ79j7eMR3/z7kT7KH7sM7sX5XUaQR2bQC+q3I+f70EEcU+gqA+aBxeRsf/HMR34cQdSOVQXRnZcr92o1zKNmG+79n0s46zxz83Dj/KYsA+2OAVnCEssxZI6v516j+iJHoyj3a2Qt5jqgcRCErJJuaJYb2YAuhpMHydQJcID17h4jhOOp4BiezpwYwKD2Svxbl7yX3RXspeClQlWkjc39xdaNXQ8lc2jglxWdoNSbT1lLpX5I7gJBY6ArB4wG16PzmptD4SHGySAZq2FAeYMKy0QWOTx6AfHlN+ISs1VAgByuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Pce3pfG8z3GJUx4AvQFCi7XWo41GyfNVvGnt1JArNU=;
 b=mLWHBC4Br2Fr/mbTMnxcaukvFj4v9oqXjeq8fMkhyGjQTTqlPhquQPTkfOKRYg1XRDbL8fR5RI3UogERJpAijf4UrWUArByYlWgicw39C3ftrW7qkbEE7EIKb0NAJpir08f3YcOb2QLSRSYwJ07Rh6fX8ORNs95PNVQ9cX8o6dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by MN2PR12MB4405.namprd12.prod.outlook.com (2603:10b6:208:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 21:41:11 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 21:41:11 +0000
Message-ID: <5c7fffb6-72e1-4ead-ab02-7544593a96b3@amd.com>
Date: Wed, 29 Jul 2026 16:41:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] Documentation/arch/x86/amd_hsmp: Document the SMN and
 MSR IOCTLs
Content-Language: en-US
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 muthusamy.ramalingam@amd.com
References: <20260729164034.1331375-1-muralidhara.mk@amd.com>
 <20260729164034.1331375-8-muralidhara.mk@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260729164034.1331375-8-muralidhara.mk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:806:120::29) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|MN2PR12MB4405:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ef6fb2-17a3-41fa-e991-08deedba1b9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Voo9fsdvfcmo/xbXYJF0MEDwCOuqCvch47lqYs6igJOvImsee2o6iGdjgNcFsVL22mBewlXKOaJsUvMI1s2TWnBmzje/A75CWUzuW3+cYJ0hZg5azh9QgLqV1VWxmOuuOl4Q42b/7+1J9QN8i3hvEfVOedWLYhCT1r+ScDMIl4OVON93qq+g71Hu1gvbO7ykxmJqREg6lSu/HuQztw1x8K6RHNu9NqfSogGmKdrSHcv1BnczYQISKaQYwYfpJr2QF98sLDj7IlxJxBWOGqlapGnfw/0gGZjqKId67smyg4zySIUSdclCA9YECLVe1+DyrYEmhK627VYX83zq+adIIwvzVituwvKhE0/NsCGaqLtETA45vUd3I9asiSzsSzZgiK5N1jcPhn+fvcFdJ6DWYVU5S+UskxRJrPu+1S2BBcboTNiBqQL4q74Sp561CQmxYQjGvqXQAMJVWj57N86M71DTJCY84Ck3YVKPJenwg/bkmxzthrVY1Ey/UNRHd9luDlCkVgqGjtOgWK9bYpvhO9nQhYyfUOe3qXAyYDVPc0cL4yBGrjpnJ9GuMD2dDwBgS2pw+CXuc42tw50QDaHMs37DKbBv7PVSTi8Q1lZWWdaXJaUYwWqdAwcyxxZizLvJhRtuB+nqbkR3/7Slbv8EciuAi3UmcPDI8slffGl70eU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnhPVXUrR0V2M3dkMUhTUTM5d0lkQm9VRDdHbDFkMksxZVN4cnR0L2lEVzhj?=
 =?utf-8?B?Y0pZYThVRDMrRitCMlNJcU1hNEhlejZ3N2pBZnJzcFZSYUJxWGZGaGRDampP?=
 =?utf-8?B?N1VyZEN6YkxidExEY2tWckp3WlFFdVdwMXB5dlJiZlZJMmt6WFM0UEx3OFdQ?=
 =?utf-8?B?R3ZUU0dyY0ZrVlNIcEhkdXkxZjBJNllPVWRQZ1FYNmdDdGJwQ2p0QUlheU1K?=
 =?utf-8?B?a2hjRU9STEYwUVZTZ3d5K0pQVldWanlFN3VMUFR1cEhWT3M2bXp3cXVzdHJz?=
 =?utf-8?B?V1hkMzNlcFNDME1pQjhlU0Y2T1pDZ1NmZUNQRmMrTExpRGFNZXRUaFlnVVRx?=
 =?utf-8?B?ZmJPcFQxRWlEdk9OTVNudlgxMXR2dm53TTlEL0k2Uk4wa2hWYUY2UXpMcjY1?=
 =?utf-8?B?U3Z0TEI5Q3pWTS9DbG1QdFJjdWV0bHllQVhHZ3l2K2RiNnNteGx0N1BYOTc1?=
 =?utf-8?B?SkNZNklvS29HUkt5SFpPakVOYlRmT1ZZRDVzbTU4SHJyc0l6NVlWUnZhSE16?=
 =?utf-8?B?UXBaV2lod2JINHpMR0dwK3E5eHo4ajB5TzdDaXFoN3ZRQ2NtRzZSZDl4TnBH?=
 =?utf-8?B?dVF1bHlOTFBSZktOUzRFQXdHWCtlSHJvVHpLRDZkSG5DblJFV1BLbGlhcWhu?=
 =?utf-8?B?SGhqdjh4TWpmSXczU05oN2lLbWdtR0xCQThwb2tnbEtwLzJoeGZPWUhIa1lX?=
 =?utf-8?B?NDV4V0IxemtXdFJOUlVSY3lxbVhqbXpJRHM4OThPSURqVXE5blJrODlZUUxJ?=
 =?utf-8?B?dUdKSERsWlk0YnIzdTNwc25ub2lFQ0hFT24vRXNrSnR6b1AwZkF3U3FqT3RJ?=
 =?utf-8?B?ckhYRmNjc2RKTklXYzZyeWdkVGQyVHcxL1lQRDg4RGVHNDMxbVVjT0xFRE1Z?=
 =?utf-8?B?dGxHcmNlVTYzUnprd2xKd1JySEl1S2E5cW83clVpNndnLzFpWml5QW9ndnpP?=
 =?utf-8?B?RmpLWnZOWGNhOHVtZTdia0F3a2laczNKbEVJRkRzbkVIU3lsTS9VYkwwd2ZM?=
 =?utf-8?B?UEZBUVR3UmcrRzlLVUdWK2NJOWNGL05kcUJadGcxMlNrTXhFNCtNZUhSZGtx?=
 =?utf-8?B?c2h0VGtqK3k1eGxGUkwxVkFUTmdYMFNFL0x4RXljbEJGdXhoNTM5Sm9xTi9F?=
 =?utf-8?B?R08zb3d1Z21TVHZjN29jTnVXYisySVlxdGllMC9sWDhQbWdlSjNwMWtjRzJT?=
 =?utf-8?B?dXBxdzBwWGN6MENlMEorQXFXY1M2RnlEVE1SZGVYUG5nYXprcWVlN0ROUTlw?=
 =?utf-8?B?QVd5Q1VCekRVU3pJRjYzODhlVTgzOEpaRWhYRW9qZUxyWnh3Zm5DWDQzSFFH?=
 =?utf-8?B?QUN2WlFNY25JVEpidHU2WmhaUnVEb0ZJcElqMVRhdHg5bUkwMEpaQTdKL2k3?=
 =?utf-8?B?cFA4ZDFrSlgrdzRBaWIrU3haeldpbkVEZTBoTFEwdTcvZmJnSUU3NzI2UmJE?=
 =?utf-8?B?VXM2am9SM1g1STZlT0FpN2VwSmpTRUlqL2hLVXNBR212ODEyMFRGTHhUZlRs?=
 =?utf-8?B?bHVPdmQ0Z2dtSUxXTExIc29qWjh1cHYyS0FCVkxmUjZRTG9tcXRGdzBHVEVx?=
 =?utf-8?B?VGVKdE5ROVNmM0tqazVMd0dwVkVUNkxnTTNSdFhyU2x4eXZTeFhvVVZFdGhI?=
 =?utf-8?B?cTJtVjMwbFZXRWR6aUtkck93OG1wYzBXa2NmYktqNlVyTE16MUJCdWZuL1By?=
 =?utf-8?B?OEJRc1IxY003UERmZnVzYy92eU5QSDNERWNlY2swNFlITGtIdXVEejNDL3Qz?=
 =?utf-8?B?bVpmZVAxOFN4N0lGOS9hNEpTY25HMFVqelZmazc3SkVpTlJ4VHZqWXJTbHRY?=
 =?utf-8?B?TlFuMGl2NVlXV1NYV25XbUFlOU1WanZkSWllU3dJUHBTaWRIOTlUclNQWmZO?=
 =?utf-8?B?cnhEWTkxc2JwdWFvcTNjUWVMQmNObml2YStPMjUvK3N5RWFxamFKK0dvZ0Rj?=
 =?utf-8?B?QWdjTEo2Z0JXRVVKcUpjM3pGelYyY0pLelpVcTBFejR0ZHB5eHdmZzhGbDFp?=
 =?utf-8?B?WGZ2VXRManZpbGtCWDVFUlpSNU9NRHc0bDFQMEZRa0UrQysyMFNCVXptTjZ4?=
 =?utf-8?B?eW9HVnVPOWtBdS85OHdLU2dVbXBPaDZ2K0hqQ1ZjNGN2MUVSa0pQOHp3a21B?=
 =?utf-8?B?UEp0UWlEdnAxRFExekVWbmQ4OGJrbmFFUzNnY2dKSml4eGFsU21PTVZ6Szlu?=
 =?utf-8?B?UjVJczNGajdHOEJkNndnV0l5SzJjOUVUL3ZwSm44R24vcTRtTjhienNCRUx0?=
 =?utf-8?B?b25kbXVPQ1pQNXZkc1NrSUthZUNQWkJVLzd5UGZZQ0hFaGJ3cko0VnpUamtr?=
 =?utf-8?B?eHBTTiszSGZKbmRMMkZsdGVSVzdyMlNkLyswNUNqQ3B6MUVUSWNTZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ef6fb2-17a3-41fa-e991-08deedba1b9c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 21:41:11.7584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kO0efdwIsLtY8bJJyKVBq0yiOGukrnH0Z6Q4xgMYOJQoqcHXhRr0MrkaRLz9l2AegrNN3Y+y7865d1a3Yzp5GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4405



On 7/29/26 11:40, Muralidhara M K wrote:
> Describe HSMP_IOCTL_SMN_CMD and HSMP_IOCTL_MSR_CMD: the payload structs,
> the CAP_SYS_RAWIO and open-mode requirements, and the rule that both are
> read-only, so a request with @write set is refused with -EPERM even for a
> fully privileged caller on an O_RDWR handle.
> 
> Also note that reading the protocol_version attribute can fail on the
> Fam1Ah client platforms, because some client SMU builds reject the
> interface-version query, which is why the telemetry ioctl rather than
> that attribute is the way to reach the client telemetry layout.

I'm happy that these are (at least) defaulting to read-only, but I don't 
understand their purpose.

We already have /dev/cpu/CPUNUM/msr, and we also have amd-node which 
provides access to SMN via /sys/kernel/debug/x86/.

Can you better describe the needs of why these new messages must exist 
and we can't have structured data for them?

Even if amd_hsmp needs to use SMN or MSR to fetch specific data data, 
this feels a lot safer to have a structured specific fetch method than 
such a wide (albeit permissioned) pipe.

> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>   Documentation/arch/x86/amd_hsmp.rst | 44 +++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 8a9d6fe7d4cf..0f03201a9f68 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -229,6 +229,50 @@ The following IOCTLs are defined:
>     ``sizeof(struct hsmp_metric_table)``.  Later version metrics table
>     layout is documented in the Public PPR.
>   
> +  On the Fam1Ah client platforms reading ``protocol_version`` can fail,
> +  because some client SMU builds reject the interface-version query.
> +  Those parts have their own telemetry layout and this ioctl is the way
> +  to read it.

It seems to me you don't actually describe the telemetry layout or what 
should be done with SMN.

> +
> +``ioctl(file, HSMP_IOCTL_SMN_CMD, struct hsmp_smn_message *smn)``
> +  Read a 32-bit SMN register on the socket given by ``sock_ind``.  This
> +  reaches registers outside the HSMP message ABI, so it requires
> +  ``CAP_SYS_RAWIO`` as well as a handle opened for reading, the latter
> +  because the value read is written back into the request struct.
> +
> +  The ioctl is read-only.  ``write`` must be zero, and a request that
> +  sets it is rejected with ``-EPERM`` even with ``CAP_SYS_RAWIO`` and an
> +  ``O_RDWR`` handle; the field exists only so that write support could be
> +  added later without changing the layout.  ``reserved`` must be zero.
> +  Argument::
> +
> +    struct hsmp_smn_message {
> +        __u32 smn_address; /* SMN address to read */
> +        __u32 value;       /* Value read, filled in by the kernel */
> +        __u16 sock_ind;    /* Socket index */
> +        __u8  write;       /* Must be zero */
> +        __u8  reserved;    /* Reserved, must be zero */
> +    };
> +
> +``ioctl(file, HSMP_IOCTL_MSR_CMD, struct hsmp_msr_message *msr)``
> +  Read a 64-bit MSR on the logical CPU given by ``core_id``, or on
> +  whichever CPU the ioctl runs on when ``core_id`` is
> +  ``HSMP_MSR_ANY_CPU`` (``(__u32)-1``).  Any other ``core_id`` must refer
> +  to an online CPU, otherwise the call fails with ``-EINVAL``.  Requires
> +  ``CAP_SYS_RAWIO`` and a handle opened for reading.
> +
> +  Read-only on the same terms as ``HSMP_IOCTL_SMN_CMD``: a non-zero
> +  ``write`` is rejected with ``-EPERM``, and every byte of ``reserved``
> +  must be zero.  Argument::
> +
> +    struct hsmp_msr_message {
> +        __u32 msr_address; /* MSR index to read */
> +        __u32 core_id;     /* Logical CPU, or HSMP_MSR_ANY_CPU */
> +        __u64 value;       /* Value read, filled in by the kernel */
> +        __u8  write;       /* Must be zero */
> +        __u8  reserved[3]; /* Reserved, must be zero */
> +    };
> +
>   The ioctl would return a non-zero on failure; you can read errno to see
>   what happened. The transaction returns 0 on success.
>   

