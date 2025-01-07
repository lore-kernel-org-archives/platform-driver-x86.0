Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5514E1D63EB;
	Tue,  7 Jan 2025 19:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278159; cv=fail; b=HOdBQaRifnE1nIMZO5VdutbeMDEk1g+2BnLKoxcanmpRrFWhmcMGLWz8TPJYP6iOGh1yo9arVNBOP2zQgGFafZrtUaMYf2Zty2njqWpq+VeQ5c3eTy0TWjDhToEfcC/KlKraum6cgo8RMeu7KKeNPPIx1To4APBTtGnZI3QeZtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278159; c=relaxed/simple;
	bh=M4JsCwlDzINwxS6WAym+GHJyvNg9ysjl3GIzYVEmq+Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DUOlF0p9yk06wKqE9rYTg1lSAxCe9uyErxwCT1xNMEEPnofUhf8cin5HMyn17teJ5FlGyYE6g5YgzRHc9ZD052mxHA/qJdVEI8Q6mdMHGtlJVj2ZR8wPQCt5R32+ESx7V47WfNbQdYP/tkf9GKKAdyWdw4sg4dbiHFJL66XHuVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VJ5360PO; arc=fail smtp.client-ip=40.107.236.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VJ5360PO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJvWYKSGwoYq0aCDMgBs/B/EfrpFRtpYy+IVjw901eqoxPdbHlwtOQOYmhmVMXvEvnTRQQ2N0a3cRYLGESlef1ur5TzRA75AMm7Ga6URYsHofpBOMMIwoBn3wc6avSesM8J3ut3N7ZOVYiV98gjbhsT1xRUpgvXuFgoAzcUBlD7rk9R3LzGfdvqCjhqDxtfA9jZdg+46QGO9nwt7TDJwqY6cw1DlhC8CpyP33IvzSAlKvPjX3zq88GhyoCMGDidW9Wxs3P/B4oKrRrQmQg112IrCqlH3HGZXHoSEWsBTM2IEktO6VmnvoxqJorR7P8Qroqwd6053PDiCFt4aJEGsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qE//lBfvCWesgh1rBYmT+aTgYnms23XaBow7+8R1u+0=;
 b=FBFgLC2hmvv7SJVHYYS5mvIP5Q96npjeR2GRRKHSoIFImPDypFtgleNOFASWRfpfeEb6gnXBhZMX2HaCihMyFix3vGD6K+ABjn3PH5mlIrPxRX222fIWaJhbeirRzri2Ciq86lWsxEsQ8yEbnOn+2zAvhA0dlBXaAxeHVVnnHgoIR0cFdtpDwr9NaGmzD/dw/Gd0m/vnwunB4l5Y9DCDMqkwfqzUgAwHSTdMvLTZXWG2uEVkJoYDmSAnY37z/J+R0C3UoJFNiknfAWvtxfZv+SfSNLxx3Hd5ZpPI603P5VI7V8XOIrmOQ+ung0+lLg+Qf5A4TLyg9+X6+HVUnieCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qE//lBfvCWesgh1rBYmT+aTgYnms23XaBow7+8R1u+0=;
 b=VJ5360POBDsGd8W5i+MSrmu6JJYD6Up1bmjiaJuO4MimwsNG+b5VeNVl2bErvbJHu2+5I7gDsm9K5VydBOxW63ete8I43HTVTTnuOto6mFMxU+aGteHoI/w5HmK2J3rj0h4Rn2n4W3cpumStTZdtDLQuwQN6D5Cn/nniKsS6Ago=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 by SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 19:29:09 +0000
Received: from CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754]) by CY5PR12MB6108.namprd12.prod.outlook.com
 ([fe80::46e5:5b51:72c3:3754%6]) with mapi id 15.20.8293.000; Tue, 7 Jan 2025
 19:29:09 +0000
Message-ID: <a20d538e-421f-45fb-b169-f9d2eb4c6aee@amd.com>
Date: Tue, 7 Jan 2025 13:29:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: firmware_attributes_class: Add test
 driver
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joshua Grisham <josh@joshuagrisham.com>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
 <20250107-pdx86-firmware-attributes-v1-2-9d75c04a3b52@weissschuh.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250107-pdx86-firmware-attributes-v1-2-9d75c04a3b52@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:806:122::16) To CY5PR12MB6108.namprd12.prod.outlook.com
 (2603:10b6:930:27::15)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6108:EE_|SJ0PR12MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: f9aa6f78-6090-4600-c277-08dd2f518f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzZKR2RnUmhDVStUWGNKN2hHWnhDNkJrZlBVeE52cFV3RnhQV21Eemttb3l1?=
 =?utf-8?B?QnY5UkQ0dUd0NUZTT1pQb1QvZ0x6MnZXWWxUanZnSEhkck5QRmVkWmpWMldh?=
 =?utf-8?B?YnR4eDdSdU8wYXJvWnUzTVVyTkFlY0FhZUJyNW9WclN1MFNxTjlEOEhzQUxv?=
 =?utf-8?B?SmFmN0VWZ1VQTEVRbWcyeFNwWlZsQXdRSFJWZWlEckpYMmVySGpiNjNNM28r?=
 =?utf-8?B?eFFEZU1SQ1lNT0dJOTBsakFCVW1wZTROOXdoYk95VGtHUys2Nkhsc2VVWnNO?=
 =?utf-8?B?bWxRNjNjTDdJd1R1VW5YM3F2TlV4bm1uN0MxSjdDc1JqenJkbzZqdlVRZUlr?=
 =?utf-8?B?a3RBdlRBWldUckNtY2RTVi8rZi9FNVVxV3VhQXI1eGhpYVFOcFI1WXEydGRP?=
 =?utf-8?B?RTg1RitseUJxbUpiSG9mVStGalZhNitIYTUwTzJoUExXWFJnR2hPdUlWNEVT?=
 =?utf-8?B?aWhhZm50RnE0WjRjQlFyNkdPd040QlpqTEljZmRsUElNODBsWmdSQUNBaFJh?=
 =?utf-8?B?U3d4Q1VZK3dmSm54Lzd3ejdHNTcxakRnV2d3dTk1Q2ZyRHBYSTh0QWhqNGFn?=
 =?utf-8?B?TWdWSHpUKzdTK1lEMDZ4Y3FKOVdVY3NBdlJjQ0RTSzV0Y29xMmh0cXZCeUpS?=
 =?utf-8?B?M0s5bXJlbCtiTDkwNkdrcHVBS3ZPRzdnQjdWcDFYcmdTdlVmRVYrQWJ0eExE?=
 =?utf-8?B?TG0xVEVwM2I1eEJRMXRUSGNHS3VnYUJGYVBDK0IrTGV3M2pFZGYvOUgrSWwz?=
 =?utf-8?B?ZjI4RWxiRWlNVDFRb29GOW1wWmlOYkJ0S3lrNkNOeGJVOVNxaFpTRVcraE5U?=
 =?utf-8?B?cE5ZbVQzY1ZBSmNyNFdLbW9qOHQ5cjJlbGp3aitNU0psbFhTRGR4VWhBRnl3?=
 =?utf-8?B?UEV2SXFJSEF1ZkhMMWoyRnhuMDZNY1ByZ242cVZUZzNiRUVHcFBuQTN4THd2?=
 =?utf-8?B?YVVBeXJlSSs4SUsxMSs2bWFyRDJDQ2twV1kzWVRBUHA3eWFMdEFTdGZUTkpB?=
 =?utf-8?B?ZkIvSWltbkJlcFZqTXlGWE9rcHJqM1VINzV6V0hUZDNBdk5UV0hsL1RXYWVB?=
 =?utf-8?B?dHpUQ2ltaVkxa3dMUmR6RTdEdkl0UUNuWDlkZFUxOHZDZ1JjR1FqeGlMZ05K?=
 =?utf-8?B?NjdETnNvb1RJNXR2eENWTXdXUXVpMUNJZjY0dkx1UWFia2RPMXRnZzhrc1dQ?=
 =?utf-8?B?ZGdIcEhmdWVycDhhbStxYzBJSERGdDZ1Njd4eW9IOElld3RzVWN0WS81ME1a?=
 =?utf-8?B?QW81blpVNXliTG1NRXp3S1l3Z2Q2emVhcVhYV3BUd2tLQVRTejBlMnhvamFL?=
 =?utf-8?B?RFRNeEQ3VlBneXN4d1pydjBuT0JxK3F2U2Zsc2l5cTVBTjZuZUpEV0JLWmJ6?=
 =?utf-8?B?MEVoOGFXUVVSY1kzWlRablVjZ3Y2MHdUTEJJRmFUTWlWdTFtYU85NDhNYjdQ?=
 =?utf-8?B?dGhMdEFTVnJaanl1TGRFQU14cWNZZ1NtbnFjbkZsbE1QaG5ITWZIVmIxamdp?=
 =?utf-8?B?K2kxUWJKVUJQVUd6MUcxeC9qV0Qxdmd1dndtTE9XZ29ZRkJmMjdSVkxXUGdO?=
 =?utf-8?B?aWxEd3VuaGxDRE5nMVVmVDVYSm02dngxMmoycXJQN1huaWdvcmtSd1lsTGdK?=
 =?utf-8?B?emdkT3ZoU3IvbEZ4aWZqOVBxTlNicW16NWZGT2g3LzBBbnRVaTVmUDY3K21p?=
 =?utf-8?B?VFdaYkNIVG5DZUJXYXYwOVg5RHRjUGJCQ3lzMWpmME02bWw5MDVCWkFQZzBt?=
 =?utf-8?B?clU0cnlLUG9YZGxuenpmOHlDak05Uk13UERFYlloUkRnbUltb1pjdVZrUUdF?=
 =?utf-8?B?b29lZVJSWWE4MHQ1UjhGTE9rcTg5WmtERUZ6SlgzdWZMcXVBOGVtak4rMVlX?=
 =?utf-8?Q?lvQMqQHwebnYG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHhWVHE2OWthVXREaWd5T1RhVXZPV2xLMFc1Tm1iWE5XS2UweEdlTGh3MUg1?=
 =?utf-8?B?ZmY2MkVZaXkxVTFYcnRCSzlkOEs3bmtDMUE3aEhZaDJueTlVS0pLdE5GWmVw?=
 =?utf-8?B?OXRzOG1tWWRXL0dEYnNpbWxYdnJMbFVuWWNhOU1LYmxqcE1WNVdvMUl6ekdX?=
 =?utf-8?B?SC9BUlA2VFhya1BoM3BmRXZ1SGpLZXo3U0NXbWd3MzArRjVCUEJkeDlqVkRX?=
 =?utf-8?B?ZkRjdUh4T1Q1MXJSbncxU1d3eGQ4dGN2MmNIMGFrRWxaeWJCdWxTSDBqd01s?=
 =?utf-8?B?T2E3d1hRZW1EdGRMaU5LRmdBbTQ3RHRTczd3R1JZUWpoNHFVZ2JXcEFIcnBm?=
 =?utf-8?B?aXVWUEdRZzVBbXd0SjluemMrMkh6MmF3RFRkdWxlVDRIUjJCZXJrMFlyeE92?=
 =?utf-8?B?NXN4Q1pNblp5K2YvQ056cUZMSWg5aFBPWWNldThkTzNkMVZRdXZWOTZralZJ?=
 =?utf-8?B?RmNGSHFSTk44VFRlbWhEVTBkSm5EalJCSkxBdk1wYXBxUHhPd0FWMEFWbFZG?=
 =?utf-8?B?a2VWeUVwaTJ0eDJESEhldk5tdEYyc3VoZXB3TjF6SlFRbWs5VGxVQ0k4Z0Zp?=
 =?utf-8?B?WUppODVUTm1jRi9oWWkrdWtTTGNtclJZMmt0YndxNWpUaUZ5dmtEcFZRSFpI?=
 =?utf-8?B?Y3BmbGo2OVFMMVNsMTZDVml1d2ZFSkhaalFPZFlza0tVZXc3U3hxcWNudzJV?=
 =?utf-8?B?TmZUaWtGRER3emY0bmdhWWdGTi9tU2l6aWcwQldTbG5Hd2trcFNLSVNyMnZv?=
 =?utf-8?B?ODVhQ3FDWXQ1N0k0SlJhMENJeDJ6ZlBWYlNkb0gxTUpNeW9RRndraUlpY3VW?=
 =?utf-8?B?Ykc5VGh5eHZnYnQyOVJKRDFkRzArQll5T2VzZEo3b3ZDRkVWcnF4dUpXVzgw?=
 =?utf-8?B?bHFmK3Bpd1YxZXRFODE5QWxYWC83NldoTmthUExvQk5WWm0vN01UUWdYbVdP?=
 =?utf-8?B?YVV4YWw2WTFtYTNmeGd4YU5RS2llb3Z5L2FNYWVUOEt4d2FXdGcyb1dJT1pE?=
 =?utf-8?B?Nm9ESkQxT25KWkpDRzZXZ3lBWWpyMDdsckJBek0vQnp0YlJrNnFJTnBxTkNG?=
 =?utf-8?B?NjFEVjhYblRrVW5YV3VqRld1TjlDakNZbFI4VmJLY2pmM1ZUN3FXbUtUeXBw?=
 =?utf-8?B?MWhNNDJWVkdlcVdKMi8zQVNiZjFleks2a2xjZUZRTnF2OUFoTnNuTk1kOHMv?=
 =?utf-8?B?VEdTeVFUU3BTN2Evcm4rczlBcE4zWjFOUkQwNnFSQnhoSkxyNmZVS3JiUFc1?=
 =?utf-8?B?NitXVWVvSTBYTlJpdWh3Ylp5Y2JmVjQwL09tVkZJRkxwWFRZYTlkRmNZLzNh?=
 =?utf-8?B?U2EvTzlKV1k3VHp2Qm8xWU5iN1IyK2g1T1h5UTJIVUUyZ3VyVXUvdlB6c2hl?=
 =?utf-8?B?ck5YSzhQbkxnSmVjcUtCVUVYV2dSRlN3OXVYY09pMmJvWHhsNFhzU3JDeTA2?=
 =?utf-8?B?dURKNWY4WktqazNNSndjczg5a0krVHdqaXh4dWxwaTFTMTBsdVNhR3daOTlv?=
 =?utf-8?B?djFNTENjUThnam1QNGVLdjdjYW1Cc2ZtQVgxVThsSndQaDdjK2pvTTVVazdv?=
 =?utf-8?B?NmlOWDRqcVI2cDZxdWw0R0R6Mmcxd0ZhbkxCODZSZU11UzZSNFNpMUs3WFA1?=
 =?utf-8?B?U01ybGxZSTFhV3NISEpXVmlEcWhnQ21udnZBbEZaT1JuSG4yT2dnK2lXa284?=
 =?utf-8?B?bnh6NFRBTmorNUZIS0lFWXBqUFdmV3NvZVo3dVJoMmZVeWtFdlhjKzJhOFBj?=
 =?utf-8?B?bXlTK2toT1VoV0NERzFWWExwRGV5WjkxMUpJNUFERkdHb2RBd3l3R1RPdTZQ?=
 =?utf-8?B?QnJRUVRhOEhXNktkVHU1QXk3cm1wTXJFbFJXbmd1MU02cjFmNVIwcVROMkd5?=
 =?utf-8?B?VVJxTlB0eEJCeElQNS9aYTZoY3R2VVVvUmhlVy9na041R0h5YUdrQkl6amhz?=
 =?utf-8?B?dS9NUmo1NTM3YXJaQzhqdWxEV2NVY0wxbE5CVHBxcTkrNUZFR3FZOUNMd2I3?=
 =?utf-8?B?cE04czZxZzN6NVp5NUkzc3FiM0FMckpRNFlwbm0rcnpGY0xuVHM3eU9IUXQ0?=
 =?utf-8?B?TXdiWWw3bEdmRGR3N0MrTmFwY01OWENXQWpBRU14TVBZdXFCNmVkb1hhZU45?=
 =?utf-8?Q?b451UW7VbJ/thoDp879m5KSfX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9aa6f78-6090-4600-c277-08dd2f518f1e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 19:29:09.7580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyxD882oQuQWwuFhsGxUf+IUgaa/xxSzDw7jkxNk0qmweOmzt+Wuc1DUO81FDkMV6OpbAX+YajbO8+yxrluyzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635

On 1/7/2025 11:05, Thomas Weißschuh wrote:
> The driver showcases the use of the new subsystem API.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>   drivers/platform/x86/Kconfig                    | 12 ++++
>   drivers/platform/x86/Makefile                   |  1 +
>   drivers/platform/x86/firmware_attributes_test.c | 78 +++++++++++++++++++++++++
>   3 files changed, 91 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64be389f4dd9bc309fe089f23cc798..2a0e828657d2f07074944d6c42dc204fc8825a42 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1065,6 +1065,18 @@ source "drivers/platform/x86/x86-android-tablets/Kconfig"
>   config FW_ATTR_CLASS
>   	tristate
>   
> +config FW_ATTR_TEST
> +	tristate "Firmware attribute test driver"
> +	select FW_ATTR_CLASS
> +	help
> +	  This driver provides a test user of the firmware attribute subsystem.
> +
> +	  An instance is created at /sys/class/firmware-attributes/test/
> +	  container various example attributes.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called firmware_attributes_test.
> +

I think if you're going to be introducing a test driver it should be 
compliant to what's in sysfs-class-firmware-attributes so that when it's 
inevitably copy/pasted we end up with higher quality drivers.

That is you need at a minimum 'type', 'current_value', 'default_value', 
'display_name' and 'display_name_language_code'.  Then individual types 
employ additional requirements.

I see 'type', 'current_value', and 'default_value, but I don't see 
'display_name' or 'display_name_language_code' here.

Furthermore as this is a "string" attribute you're supposed to also have 
a "max_length" and "min_length".

>   config INTEL_IMR
>   	bool "Intel Isolated Memory Region support"
>   	depends on X86_INTEL_QUARK && IOSF_MBI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e1b142947067475ee5472400a5a1cd20d79e12bd..610a1ca850a4353fd490e43b214a9e5872d2d28d 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -121,6 +121,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
>   
>   # Platform drivers
>   obj-$(CONFIG_FW_ATTR_CLASS)		+= firmware_attributes_class.o
> +obj-$(CONFIG_FW_ATTR_TEST)		+= firmware_attributes_test.o
>   obj-$(CONFIG_SERIAL_MULTI_INSTANTIATE)	+= serial-multi-instantiate.o
>   obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
>   obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
> diff --git a/drivers/platform/x86/firmware_attributes_test.c b/drivers/platform/x86/firmware_attributes_test.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..84f6a92e5163378c655f30ac022d513d7df5a18c
> --- /dev/null
> +++ b/drivers/platform/x86/firmware_attributes_test.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/module.h>
> +#include <linux/sysfs.h>
> +#include "firmware_attributes_class.h"
> +
> +struct fw_attr_test_data {
> +	char attr1_value[PAGE_SIZE];
> +};
> +
> +static ssize_t test_attr1_default_value_show(struct firmware_attributes_device *fwadev,
> +					     const struct firmware_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "default 1\n");
> +}
> +
> +static struct firmware_attribute test_attr1_default_value = __ATTR(default_value, 0444,
> +								   test_attr1_default_value_show,
> +								   NULL);
> +
> +static ssize_t test_attr1_current_value_show(struct firmware_attributes_device *fwadev,
> +					     const struct firmware_attribute *attr, char *buf)
> +{
> +	struct fw_attr_test_data *data = fwadev->data;
> +
> +	return sysfs_emit(buf, "%s\n", data->attr1_value);
> +}
> +
> +static ssize_t test_attr1_current_value_store(struct firmware_attributes_device *fwadev,
> +					      const struct firmware_attribute *attr,
> +					      const char *buf, size_t count)
> +{
> +	struct fw_attr_test_data *data = fwadev->data;
> +
> +	return strscpy(data->attr1_value, buf);
> +}
> +
> +static struct firmware_attribute test_attr1_current_value = __ATTR(current_value, 0644,
> +								   test_attr1_current_value_show,
> +								   test_attr1_current_value_store);
> +
> +static struct attribute *test_attr1_attrs[] = {
> +	firmware_attribute_type_string,
> +	&test_attr1_default_value.attr,
> +	&test_attr1_current_value.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group test_attr1_group = {
> +	.name	= "attr1",
> +	.attrs	= test_attr1_attrs,
> +};
> +
> +static const struct attribute_group *test_attr_groups[] = {
> +	&test_attr1_group,
> +	NULL
> +};
> +
> +static struct firmware_attributes_device *fwadev;
> +
> +static int __init fw_test_init(void)
> +{
> +	static struct fw_attr_test_data data = {
> +		.attr1_value = "attr1",
> +	};
> +
> +	fwadev = firmware_attributes_device_register(NULL, "test", test_attr_groups, &data);
> +	return PTR_ERR_OR_ZERO(fwadev);
> +}
> +module_init(fw_test_init);
> +
> +static void __exit fw_test_exit(void)
> +{
> +	firmware_attributes_device_unregister(fwadev);
> +}
> +module_exit(fw_test_exit);
> +
> +MODULE_LICENSE("GPL");
> 

