Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1344EBAFA;
	Wed, 30 Sep 2026 20:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800910; cv=fail; b=CgjOpF359Q6BOAgg0vycvobgxCp2Pfp2C8ijfGIk5162MrXZRt+YniDk5S97FRx6P6aqd5qlxaJ+g8UDCDroxYhtJoQoVWHZqNQrBTHtilqYHwj1k4pYo3hFvxnNA1pfctaz50qClx7vbbH6UhnuG9pjk7WavZOEMdMhBmXrY+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800910; c=relaxed/simple;
	bh=UBCm0Qf31ou7JZCKcyVnCq1MW2EKGxXsGyXeRPDHXMo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GEpbbQUmgcWOmAYLT4pG+QqhEXjb760xmOJbImaUaRyj08lwzmsdG3xN68pncRwHnt8ui7O/7gCxg/900WrFbmkrC0t9qum70zy8teQg3Y4zcn/wh38WEuXdAZD7HgzchDlH63wQNbzpLGCF/iY67TZVBLTsnYIfYZEW2akc+js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gTdZQQuH; arc=fail smtp.client-ip=52.101.46.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gTdZQQuH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMOPvL31A82u7prm/OqlyWVvZMXDQeNqeXr2j8Jfg3/VA204s0dKb6kM0YgYBvKTbXZ31Cyj7RCnHLyIo9u+Yrc8yUtx4LIFViMXXgh//+QzAvhRwEGjGCAy6rtrUkvFw+4qGURYVEGntIDWX1Y6+Kz/nsRaokcD0qp3mWfB/FPoVonvN+fMwL0LVrYlWG7j+5bl4UJuAWhylivX+SfjukK0diPQJScC0kAOo02raQgefUL01lL7z3v9Hp0JE6zSeWB1BO729nyQ4WgqshuxxCyIur7awiucuPaQzCAd7nUTv6fIp+WDuohqbH2HwVFBYgyLxlFoJWfSKT2o9LluFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBBGwoN/w9CnhRZz5DKrZjA83E8J1IVhwSVS0gQ/9qY=;
 b=BADkX1DDci7KUOOwiphLscY9c5Iht8LZ5OuvWEtgH6QIgc764pxdcTxQ7OuIub+uk+9y5wJiK9ynzSlyaucfW8Xr1XhrCgpWMnctflmD6+3kl7skQz04k0p2Cv7SsedAO71eI2j2/f03pYJdkssw0Tp25VpU3FuWI1aCfj/9848rtOz97pqc/R2nDxkGNf579/SyFDa+LlJusjperZJ0szgWjudpIbzSWhxI5ymrBCoZ2HOkBbfdbkpjGdgjUN2iDSqT1VJ8ctXP/Fm1yURB4HK31po/mkN91UzTVtJdFg4oIqXO+eVVtp16BgWiBSngUUcFj5fYM4839cSv9b0evw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBBGwoN/w9CnhRZz5DKrZjA83E8J1IVhwSVS0gQ/9qY=;
 b=gTdZQQuHH5T2uhvoCfmpNliGZe8rDpcGVM93YVJkilRA9exJ42uSxidl9wkUqFVF3A+uh2I23RzFlY/1JuRX5lSg+MNHUrFdVx/h5adMoOSfqjgL9StFZ+TRlytNImtccD+Q7RMwoWmaNdvnojSUexl6jMuuGg0g85CfmR/NIv0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB8610.namprd12.prod.outlook.com (2603:10b6:303:1ef::18)
 by DS7PR12MB5862.namprd12.prod.outlook.com (2603:10b6:8:79::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.24; Wed, 30 Sep 2026 20:41:42 +0000
Received: from MW4PR12MB8610.namprd12.prod.outlook.com
 ([fe80::67c6:7360:f51:dc2b]) by MW4PR12MB8610.namprd12.prod.outlook.com
 ([fe80::67c6:7360:f51:dc2b%7]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 20:41:41 +0000
Message-ID: <ea758386-13b0-4667-8eca-9aa4efefe92b@amd.com>
Date: Wed, 30 Sep 2026 16:41:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] AMD ISP4: OV13B10 (OMNI13B1) rear camera on ASUS ROG Flow
 Z13 GZ302 - ISP comes up, SET_STREAM_CONFIG fails with error 6
To: "caspar.adriani" <caspar.adriani@proton.me>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 Hans de Goede <hansg@kernel.org>, "Adam J. Sypniewski" <ajsyp@syptech.net>
References: <lWYl1YJwDSh-q2Ew2f8b0BweQ4V-SUnPMSMurU5gT1LkqVdrmWFunj0sSgjC7m66bORBAD_jRCFTt1_ZOkotOMukY46rI4ayYbIfPQq4E9U=@proton.me>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <lWYl1YJwDSh-q2Ew2f8b0BweQ4V-SUnPMSMurU5gT1LkqVdrmWFunj0sSgjC7m66bORBAD_jRCFTt1_ZOkotOMukY46rI4ayYbIfPQq4E9U=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0135.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::8) To MW4PR12MB8610.namprd12.prod.outlook.com
 (2603:10b6:303:1ef::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB8610:EE_|DS7PR12MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d5767df-f953-42de-6b2e-08df1f333bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|5023799004|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	ThGywbbYXpZxrH4+DoeJqn5yxH2wnD9vPBYDCSra/xIBmOh9t0r+ZzXPGjlNSuXhIYQTALDY9mDuG+u3M7ScwpQmDAxsiIGx32i5fk+9S3n/y8m2iHZVDgwPww39vBbwLNCqQieydHhYh0Z4XA1ctiHCaGa8Qyhbzlbuvly17gdskQmj6PcZr9B3tzaxZToxAaUOWwVg186mwXC73/ECyiH0zv2R4pPZH/qmMPzhRdftJpiKGiiswzrjDM8AGHAyOnc9AxOhQvfqVXYl82FVS6KaZyv/7MDxF+HAYhXylHqx5w42RScqxJ1P51rk+i6ipWL4QMRbUA17luae52vXVBmOmFBJe8YEkP3qBt+DEM5Yov/g+kfzQowo/145Z02XaHbN7yoc0FgjCzDKrry5vIfDHtuGwjYH1rL/rOBLEYUX/uAkXRGOzTSJk3rW7teAlR6fpix31bDf+zHvrB7OzJo12ZSmq4Gxlx5JI9iVaDqGn6+Qyl/dsShEzVzTEDFPeKOiDBgpvYvPfnDERI6FJ+Zr6IxYJG4BEemQkD59Vg2zDMp+8cU+tqR3delFr5lghK/b7rTthSNjmTyJ9D67ZhAzvEQNCPM83bgRevAUoPrGkeYFNocJdFSo+gzIgrHe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB8610.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEFoWWxWQ3Nac29lcWNSZnJ1bHIwdnpkRnhDUlN6Ykd2Wm1HZWdldGRJYUxB?=
 =?utf-8?B?RmhJUzEybDUzNjJHSGVVUnlaSTM3Y0JCcHg2bXkvWlNkSlg3N0cxTkZ5VUtr?=
 =?utf-8?B?NitCRWlTbUpXdXFlTk9YUS83bWpJaE54U0NrWDBMRy9VQURyTmFQb0huWFor?=
 =?utf-8?B?UXFvK1c5dkRzM2d0L3hzVzlUc2pBV1EvZC96c29kUUxNVlBwZm02RWgySjhH?=
 =?utf-8?B?RzI1OUFPZTJGaXNWa0hCUEpwRXdlYjhJdG1VV3JlQTNtZXJDbU5mOXZxYkg2?=
 =?utf-8?B?Y3g4enZiR3NSbXY2SG5kOFNYMENuYTc3MnloUysxMzZBalNtaTFsSDRGeWRG?=
 =?utf-8?B?MFJDUnlYd0g4UUxCaXR5dkRjelp2WkJNN0txNEFoUFF5OTNqMHdSVzdhaXEz?=
 =?utf-8?B?VGpUU3hsQ0pMNW9RMW52Q09KZWpUdDc5RmVWTDN2THF0ajBNeXNmUTJCWk1r?=
 =?utf-8?B?Wm0vSzM1bkxza0luU3d3bnJkcTdaNVdma2g2MDI4WmU3dHlVeS93QjBqZ2lG?=
 =?utf-8?B?bHZidXlWekVLdmFlNzVxcmE2UlZDV2FQb01nQkpBcjdaUGIxUUY2K0ZwUzdr?=
 =?utf-8?B?bzRKMVYvSGpLajBscWJjSmNZcTM2cEdSeXgrWmNmalM1NHhnQ3B6c0ZCS2o1?=
 =?utf-8?B?WEJHQ0l5VkljNFZKZk9ndE1IcFNVMFliUDJyYmtTVzByQ2pqeGpHU05YQmw1?=
 =?utf-8?B?bStqM0xoN2NhK2FxNklPMlB3NUROaVBLRXRzTzlDMm9PTVViVHZkdm43N2xM?=
 =?utf-8?B?bVU4RkdxcERHT25GdThTeWRtRUZyNVJyRDJkdVhwTTZVamhPbjRwZU0yMzV6?=
 =?utf-8?B?VFFXd25mOG9KUm9sU2gyVlc0UEhaR3NLZ2g1dlBIMmM0RW1VS2VNMC93ZVhr?=
 =?utf-8?B?MUluZ2YyZ1RKTGg4SWZtUk0wd2lzR1pjeE45VFNwYzdndnQzQlljUnpTNUpq?=
 =?utf-8?B?clMwQ3BsYVhNc09UL2FJOXRkN2lONytzOEZ6NTBXSkR1V2JVQXphSHNIemdw?=
 =?utf-8?B?anVnWVFrUzBKSGVzdzFTYXpIMXZWUnhWSXdncmExMFVFc1MyVmJ1N05Renhi?=
 =?utf-8?B?QlVPSFA1LzgxaGVtNVFJTFRoWkdhOUQrRUtwM2h2UUloNXhpTitjV2pkREFE?=
 =?utf-8?B?V2Uvb0VxTk9YaC9FTDI0eHJha1g2bGgvWG02Q0dPai9vVW5mS0pURU1XVFlr?=
 =?utf-8?B?WTQ2R1NLRGJkcU1IZ1ZBZjdIaFo4U3NYV1VxNGdjSHhoakRYOXd3Y0JDbVJs?=
 =?utf-8?B?QTkyT0V2eTE5NWJCSkt2TTZpRk5HWi9HRWhQMHZpOEk5VTdZcUlvd3Q3WVh6?=
 =?utf-8?B?aWpiMXZkdUpOaWRpUFZwQmtEbDRrZnBOQXpQTXlRRTJKTnhIS090MGc0SmNB?=
 =?utf-8?B?Y1VKWXBFM1lia1YxNXcrNWV5K3JhUHd5TXJVOTZiTXhNK0Y1NXd0N0NPYmQ3?=
 =?utf-8?B?ZVB0RzNGbUdrc2lFRlQrdHhWNzdKQTBkVEh6WkJvL0EvRXBDL09lQTBSWExI?=
 =?utf-8?B?R25tWVNKcFk2OUF6N1JpZVBTQi92L2tlcGR1SXRZR01EVFI0dkp6RVozVWlY?=
 =?utf-8?B?L3MyTlNNZGdvS0liSFVxRVZCYmgvN1lPcmdNeFZvb1BENDNLNWUwVDFiTDVN?=
 =?utf-8?B?UmhEOWZJS093cjlLd3MxZTcwVVZ0U2o5MWJ4aTExVUdPR1RzNnN0bmIyZE5U?=
 =?utf-8?B?VHlvMlVlL2s2WDR0VXpZdGtZNjNMQkdqNWJDcWJ1TC9INElvSDRTWnhGY1Zm?=
 =?utf-8?B?L3pGaSs5NFFLUVBxQ3lkSm52VlhHT0tvWXJkUE5DU2VLWVAxUHZYeXBhdUdy?=
 =?utf-8?B?cWdEbEN5RVJab2crMkJhS283ZTlITnhZZFVDT2xCZytZM0RBNGYvZWVBT2Ez?=
 =?utf-8?B?N3FiWlgzWi9vcnd3ZjgvOC94NU15VXBoTUljRFlVUkJNaDdoQ2FFOG5aY095?=
 =?utf-8?B?bjJxNUFqUi9RVE1PeEJsNFVYWkxscWtuVGxBTmx6YkdJenJyTkVNZmFqRXlI?=
 =?utf-8?B?aTRHOGdKRlB0aGdBdURtVGRnc25aeUkyM1dzZjk3bWpVWk5tekxoa2hHWXJX?=
 =?utf-8?B?Y3IyZE51Y1o0S1BVeWZEMUlFdXJ5MGZ1L2p2YmdWODlpN1c2L2JkS3F2RTBa?=
 =?utf-8?B?Tk5IMkJOWjhqY3RsdSszOW9yZnpxZkVFYlA2eCttcVRwZ0RybCtRcHZDMWZy?=
 =?utf-8?B?b1FsQ3pKMXFnOEtMTW51dGhZVVdXSTZjWStzZHAxVFBWUFBSVHRtbW9sbE14?=
 =?utf-8?B?RjFMT0tUTUFaQTN5RW1LMm5XakVVeDBSQzI5Q2RXQnB2T0RDWVo5VXJpN1ZP?=
 =?utf-8?B?MHBFeWhDNGVUM1JIeHRwdmlOWEc1UWxxUGF0TU9Qb0RkSXlGYnRsUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5767df-f953-42de-6b2e-08df1f333bc8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB8610.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:41:41.8790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cvegEAo7Ch/JCcE6Puv3iHmIn2QSr1kztFZaA5Oq/pp2wfSuOMHEg7XnTxbrR0UMWsZVGgRl4YrKsxy8psUd6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5862

Hi Caspar,

On 9/28/2026 10:45 AM, caspar.adriani wrote:
> 	
> You don't often get email from caspar.adriani@proton.me. Learn why this 
> is important <https://aka.ms/LearnAboutSenderIdentification>
> 	
> 
> 	
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
> Hi,
> 
> This is a status report plus questions about getting the rear camera of
> the ASUS ROG Flow Z13 2025 (GZ302, Strix Halo) working with the upstream
> AMD ISP4 stack. In the ISP4 v6 thread [1] GZ302 / OMNI13B1 support was
> described as a TODO for after the HP ZBook Ultra G1a support landed. I
> have been experimenting with it and got part of the way. The remaining
> blocker appears to be in firmware or board wiring that I cannot see
> from outside, so I would appreciate some pointers.
> 
> Kernel: v7.2.8 (stable), plus the local patch below
> Firmware: amdgpu/isp_4_1_1.bin from linux-firmware (as shipped by NixOS)
> 
Thank you for sharing the status of your OV13B10 enablement work with 
the AMD ISP4 driver.

You made good progress toward bringing up the sensor; however, the 
OV13B10 has several dependencies on the ISP firmware, which means it is 
not compatible with the currently upstreamed AMD ISP4 driver and 
firmware implementation.

The original objective was to keep the AMD ISP4 driver sensor-agnostic. 
Consistent with that approach, the x86/platform driver and OV05C10 
sensor driver patches were submitted upstream [1]. However, during the 
AMD ISP4 driver review process, feedback from upstream reviewers led to 
a change in direction. Reviewers recommended to keep the sensor access 
exclusive to the host or FW, this led to adopting a webcam-style driver 
model because certain sensor-specific AEC-related registers are accessed 
directly by the firmware.

[1] OV05C10 driver patch discussion on the Linux kernel mailing list: 
https://lore.kernel.org/all/60cf7590-4fd8-419b-a782-8bc89fb5395a@kernel.org/

Based on this feedback, support for the OV05C10 sensor was moved 
entirely into the firmware so that sensor control is handled exclusively 
by the firmware rather than being split between the x86 driver and 
firmware. As a result, the currently upstreamed firmware image 
(amdgpu/isp_4_1_1.bin) is OV05C10-specific, and the upstream AMD ISP4 
driver support is limited to the HP ZBook Ultra G1a 14-inch Mobile 
Workstation PC platform.

We are actively working toward a sensor-agnostic ISP4 driver 
architecture. Until that effort is completed and upstreamed, we do not 
plan to add support for additional platform and sensor combinations, 
including the GZ302 with the OV13B10 sensor.

> 
> 1. Hardware / ACPI
> ------------------
> 
> The rear 13MP camera is an OmniVision OV13B10 on the ISP MIPI path.
> amdgpu reports "detected ip block number 12 <isp_v4_1_1> (isp_ip)".
> The front camera is a separate USB UVC module (0bda:636e) and is not
> involved here.
> 
> The sensor is described in an SSDT as \_SB_.CAMB:
> 
>    Device (CAMB)
>      {
>          Name (_HID, "OMNI13B1")
>          Name (_DDN, "OV13B-RGB")
>          Name (_SUB, "OV13B")
>          Name (_UID, "0")
>          Name (_PLD, ...)          // PLD_Panel = "BACK"
>          Method (_STA) { Return (0x0F) }
>          Method (_DSM, 4)          // UUID f8fd3bff-21b7-4a99-bdc8- 
> c414a3e9453c
>          {
>              // Arg1 == 0:
>              //   func 0 -> Buffer { 0xEF }
>              //   func 1 -> 0x07
>              //   func 2 -> "3001"
>              //   func 3 -> 1
>              //   func 4 -> 1
>              //   func 5 -> 0x10
>              //   func 6 -> 0x0C
>              //   func 7 -> 0x50
>          }
>      }
> 
> There is no _CRS, so there are no I2C, GPIO or clock resources, the
> same as OMNI5C10 on the HP. I read _DSM funcs 5/6/7 as the I2C
> addresses of the sensor (0x10), the VCM (0x0C) and the EEPROM (0x50).
> The VCM and EEPROM addresses are confirmed by the bus scan below; the
> sensor address is not.
> 
> Side note: the ov13b10 commit that added OMNI13B1 describes it as the
> front-facing camera. On this unit _PLD says BACK, and the front camera
> is the USB UVC module.
> 
> 
> 2. What I changed
> ------------------------------------------------------
> 
> Unpatched, OMNI13B1 is missing from isp_sensor_ids[] in amdgpu_acpi.c.
> amdgpu_acpi_get_isp4_dev() therefore fails, isp_v4_1_1_hw_init()
> returns early, and no ISP MFD children are created. I added OMNI13B1
> in the three places that currently key on OMNI5C10. The OV05C10 GPIO
> lookup tables and swnode graph are reused unchanged: AMDI0030:00 pin 85
> as "enable_isp", i2c address 0x10, 24 MHz, 2 lanes, 900 MHz.
> 
> diff -ru a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/ 
> amd/amdgpu/amdgpu_acpi.c
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1588,6 +1588,7 @@
>   #if IS_ENABLED(CONFIG_DRM_AMD_ISP)
>   static const struct acpi_device_id isp_sensor_ids[] = {
>    { "OMNI5C10" },
> + { "OMNI13B1" }, /* ASUS ROG Flow Z13 (GZ302), OV13B10 */
>    { }
>   };
> 
> diff -ru a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c b/drivers/gpu/drm/ 
> amd/amdgpu/isp_v4_1_1.c
> --- a/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
> @@ -240,8 +240,9 @@
>    return 0;
>    }
> 
> - /* add GPIO resources required for OMNI5C10 sensor */
> - if (!strcmp("OMNI5C10", acpi_device_hid(acpi_dev))) {
> + /* add GPIO resources required for OMNI5C10 / OMNI13B1 sensors */
> + if (!strcmp("OMNI5C10", acpi_device_hid(acpi_dev)) ||
> +   !strcmp("OMNI13B1", acpi_device_hid(acpi_dev))) {
>    gpiod_add_lookup_table(&isp_gpio_table);
>    gpiod_add_lookup_table(&isp_sensor_gpio_table);
>    }
> diff -ru a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/ 
> amd/amd_isp4.c
> --- a/drivers/platform/x86/amd/amd_isp4.c
> +++ b/drivers/platform/x86/amd/amd_isp4.c
> @@ -247,6 +247,12 @@
> 
>   static const struct acpi_device_id amdisp_sensor_ids[] = {
>    { AMDISP_OV05C10_HID, (kernel_ulong_t)&ov05c10_platform_config },
> + /*
> + * ASUS ROG Flow Z13 (GZ302): OV13B10 at i2c 0x10 per its _DSM. The ISP
> + * firmware drives the sensor itself; the swnode graph is not consumed
> + * by any in-tree driver, so the OV05C10 layout is reused as-is.
> + */
> + { "OMNI13B1", (kernel_ulong_t)&ov05c10_platform_config },
>    { }
>   };
>   MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
> 
> I also added a temporary dev_err() in isp4sd_fw_resp_cmd_done() that
> prints isp4fw_error_code and the payload when cmd_status != 0. Upstream
> currently drops both.
> 
> 
> 3. What works with the patch
> ----------------------------
> 
> - amd_isp_capture.*.auto, amd_isp_i2c_designware.*.auto and
>    amdisp-pinctrl.*.auto are created and bound.
> - "AMDISP DesignWare I2C adapter" appears (i2c-24 here), and amd_isp4
>    instantiates i2c-ov05c10 at 0x10 on it.
> - amd_isp_capture registers /dev/videoN + /dev/mediaN (amd_isp41_mdev).
> - On stream start:
>        enable isp_subdev module
>        ISP CCPU FW boot success
>        send fw mem pool ... suc
>        isp4fw_sensor_id 0, pipeId 0x5f91 EnableTnr 1
>        channel:prev,fmt NV12,w:h=1920:1080,lp:1920,cp1920
>    and the firmware acks SEND_BUFFER, SET_OUT_CHAN_PROP and
>    ENABLE_OUT_CHAN with status 0.
> 
> 
> 4. What fails
> -------------
> 
> SET_STREAM_CONFIG is rejected:
> 
>    amd_isp_capture amd_isp_capture: fw cmd 
> ISP4FW_CMD_ID_SET_STREAM_CONFIG(0x02010001)
>      seq 1 status 1 error_code 6 (0x0006) payload 00 00 00 ... 00 (36 x 00)
> 
> The command at seq 16 (sent after the 4th buffer, which I take to be
> START_STREAM) is never acked. No frame-done responses arrive.
> With fw_log_enable=1 and dynamic debug on, the firmware log ring
> produced no text.
> 
> Secondary issue: after this, stopping the stream (closing the fd, or
> killing the process) leaves the task in D state in
> isp4sd_stop_stream() / vb2_fop_release() indefinitely. The kernel logs
> "fail to disable stream" / "fail to stop stream", and only a reboot
> recovers the device. The driver probably needs a timeout on that path
> when the firmware is in this state.
> 
> 
> 5. I2C bus probing while the ISP is powered
> --------------------------------------------
> 
> With a capture pending (ISP powered, after the failed
> SET_STREAM_CONFIG), on the AMDISP adapter:
> 
>    i2cdetect -y -r 24:
>         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>    00:                         -- -- -- -- 0c -- -- --
>    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>    ...
>    50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 
>    OV13B10 chip ID (reg 0x300a, 3 bytes) at 0x10 and 0x36:
>        Remote I/O error at both addresses
>    EEPROM @0x50, first 32 bytes from offset 0:
>        01 0b 19 01 11 08 01 01 01 01 00 ... 00 9c 34 be 89
>    VCM @0x0c: 00 00
> 
> So the module's EEPROM and VCM are powered and reachable, but the
> sensor does not ACK at either OV13B10 address.
> 
> I then drove each amdisp-pinctrl line (GPIO_0/1/2, "sensor0/1/2
> control") to 1 and to 0 in turn, rescanning the bus each time. Nothing
> changed: only 0x0c and 0x50 respond in every state.
> 
> 
> 6. Questions
> ------------
> 
> a) Does the current isp_4_1_1.bin support the OV13B10? As far as I can
>     tell, the host never tells the firmware which sensor is attached,
>     and there is no in-tree ov05c10 driver in v7.2.8. So I assume the
>     firmware identifies and programs the sensor itself. Is that
>     OV05C10-only?
> 
Currently, the upstreamed isp_4_1_1.bin firmware does not support the 
OV13B10 sensor. Your understanding is correct. There is no in-tree 
OV05C10 driver in the Linux kernel; instead, the firmware is responsible 
for programming and controlling the sensor directly. As a result, the 
current firmware implementation is specific to the OV05C10 sensor and is 
not intended to support other sensor variants.

> b) What does isp4fw_error_code 6 mean for SET_STREAM_CONFIG? For
>     example: sensor not detected, unsupported sensor, or MIPI/PHY setup
>     failure?
> 
Error code 6 corresponds to the "UNSUPPORTED_SENSOR" error condition.


> c) GZ302 board data. Which lines control the OV13B10 reset/shutdown and
>     power rails? Candidates are the amdisp GPIOs, AMDI0030 pins, or
>     something the firmware drives. Is AMDI0030:00 pin 85 correct for
>     "enable_isp" on this board? Which clock output feeds the sensor, and
>     at what rate? The ov13b10 driver expects 19.2 MHz. Which lane count
>     and link frequency are used?
> 
sorry, I’m unable to provide the platform configuration for the OV13B10 
sensor, as it has not been validated on Linux.

> d) Does the firmware enable the sensor clock and power before or
>     during SET_STREAM_CONFIG? Or does it expect the host (a sensor
>     driver using the "enable" lookup for i2c-ov05c10) to have powered
>     the sensor first? Nothing upstream consumes that lookup today.
> 
As part of processing the SET_STREAM_CONFIG command from host, firmware 
takes care of powering on the sensor and configuring the required 
clocks. Therefore, host is not required to perform any sensor power-on 
operations.


> If OMNI13B1 support is already planned on your side, I am happy to test
> patches on this machine. If it is easier, I can also provide the full
> ACPI tables, dmesg with dynamic debug, or other register dumps.
> 
Thank you for offering your support. We will certainly reach out as we 
make progress on OV13B10 firmware support or when a draft version of the 
sensor-agnostic ISP4 driver becomes available for testing.

Thanks,
Pratap

> [1] https://lists.openwall.net/linux-kernel/2025/12/01/84 <https:// 
> lists.openwall.net/linux-kernel/2025/12/01/84>
> 
> Thanks,
> Caspar Adriani

