Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BD31ACDE8
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 15:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729697672; cv=fail; b=PjWSOMQrSTBdCzoYbf80ytek+9FYO0O/6ADsddLDeOEizg4+mJF9cv7WcZNAUiYmAowIRSbw/whPgvRBjCYDbT/Sg/PJzc6zioIeuUB6X6OeK8VcGOfthLUHcJJ7Bu9Mb9/yyMWdc3N1xYB5NQN+wXqSSlVtU5HybbY1Vtw0WDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729697672; c=relaxed/simple;
	bh=duGTaMhScKqJZtuEiEhKh9vCgRw21X9TY60F8I9bzjE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SyCYFUICieozWuz90buZCEF5bd9QeRbAaf0UTXdewP4ZUd3tR83VNMDZSMiMNwfE7j+FujJYHSd0xGLf+YChkeYBYXZhI57FWXpLGnIVAMRksSFfeUv15H8+OknI9u5ExgnkU2Vj7rzjWLjseyB6c5SjrBjQnL3Hcpl6vubDdq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bb24hl8a; arc=fail smtp.client-ip=40.107.102.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bb24hl8a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkDwVZeAD6sgxWP7EUV3PLaJ103AIUwo920x0NMOhFwqwY8aWUM9xp4/giiVZ/7TyUxC9ZCbqz/T8asjtYmVTVpLJCkS9WCmzPFx+7n49vydJh6RuaM4xR7EUbCK4OVhr4kF28/bmhKkLQrO+jc+ttwZrftXeeFmS+Ueje9E5jXuFs7PzJD3/UTZJIoHFKC0EAslZzQhw1R3sHllVqDY200ipxM1jJxYXup1w2SaPga3jkLqqRKFXtttsR0+E5JD7ZKBwLcOK6RC9l1fGNLdDwGc9cbVaTWpIrDdAcEbuwdM8sMX1N1sT+NyffHCQf/9UudaaBT+RXH/MCSmaYhzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+c5lTMU71u7cjgW9QStgI9ujEfx/xzSh5kOef3QTQw=;
 b=fOUYBfTeXe2tDyxzvoL8+0N8dQdBumeCJ6Z52Yc8qCFCWJW8kzEZBFZqg3RfC481rdi17pxd9/6z0RODmawAhQRgI76Oqem6zWT2Cg0F7pHUnO/Uk0xNkcE50bSP0V14iMsQTvswkZsFPhWjR4FH3VtXMBGPZbli0jHRJ6cvJR0dT5wQ5PdVc51Z8VRNDc8uk6RT8/9eYthbVG4JHTExQGxNWep3pE3GHXNxMjTUEMo2T5knvCgFUX93hLnt1HzlJXcA9rZxa1zFOSEQoxhTANh+BJCZ/5I8Of877izDgWtPCBRAYE/l04dL/AyM54ZgFe8THjZgxI7dMEcPiU8JNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+c5lTMU71u7cjgW9QStgI9ujEfx/xzSh5kOef3QTQw=;
 b=bb24hl8ahyHg7kb9Z5VC0zqisR5T8lVpwMUsbFhjrI060Stt1bC4OrLjTZbXGbTozdGeT97E71j1JWaTKqFsq7mUkJI93EIPh6SwLXGsj4AeX3ctmUyhQKgSnhN2oTPVVFbgn1Q64x3Hj5QzDvf1n8t3GOntICPHlaxOnCdVwr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Wed, 23 Oct
 2024 15:34:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 15:34:28 +0000
Message-ID: <ddd7bf09-31aa-4e4a-93ea-b1336ced8578@amd.com>
Date: Wed, 23 Oct 2024 10:34:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mischa Baars <mjbaars1977.backup@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
 <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com>
 <CA+b5WFFa4hMeGnN0J2xd=FpU2Cxe_AjapWBpTFjfNhzUSOUAzA@mail.gmail.com>
 <0281e6f7-4ccd-4369-9182-d1580c9e6bc5@amd.com>
 <CA+b5WFEv1Qj3NYcwXaZz1EYW9omj7FmB8FdSKZnixsMNoi1+DQ@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CA+b5WFEv1Qj3NYcwXaZz1EYW9omj7FmB8FdSKZnixsMNoi1+DQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR2101CA0001.namprd21.prod.outlook.com
 (2603:10b6:805:106::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: e7874b16-f4f5-43d3-7202-08dcf3782ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGtLZmNkdk8rOGVVWi83VU1QS1NiL3RBZWxRd3J0S2RTQTR1dHAzQ3FrNWNF?=
 =?utf-8?B?L3RKR1lndlkvNG96R3ZDR25UZ25XcmMvc21nRTl6MkhOL1hUdDV4YVZiUmV6?=
 =?utf-8?B?U0lCbGgxMlo0c3VXdDE5bUhNVVFKblZMTW9OcUhpU1BTZG5YQW4xTm5SUWQr?=
 =?utf-8?B?SFRJUksyMDM0VEZlNmR2RC8vSUdrUVcrZTdvRmhFcE9zU2VFSmFNRU9laXZj?=
 =?utf-8?B?QmZjZWwwaFZwZTYvVkR0d3FLZWgzaHN4MnJNLzlndFdNRDMzQzF0cmczR0xj?=
 =?utf-8?B?bDVQSXVmNCtVNnRibVEwNEVNNmNkYmVGcFVVZzdaMVdLcDRsZis3dzhkZE9U?=
 =?utf-8?B?Nk1PdWNaZ2pYNXZTVjZtM0lKOFFtWFBWWThsWjdmTExvVmU2SDRkc0JVSUla?=
 =?utf-8?B?T0Y0T1pydUJrOVdqWTJRZEZrQmFWQ3lrVFA4TlpHUGF4Mk92S3lTNWI1Uk44?=
 =?utf-8?B?OFdyY21qRVJqanJreHk2NGVESC9BZkdxcXNBQjVrM1UxTEh2ZmxtZjZhajI2?=
 =?utf-8?B?SmtQOWwxSFZWRm1yTkFvK1RGOUkwWWpVeWVlbFU4RmJlOXYwak9nbkxtZDhF?=
 =?utf-8?B?aUNjZEpDem9UMFhRb1lqU0ZnUHZWRnJkNU5UYXg1R1hRNjBZcDlVeFZvM2FY?=
 =?utf-8?B?TkpiL2JiblBzaE03YnRoK0xHREl1Yy9ERmlJU3ZGek1Ma0ZocEhzWkdGbTM5?=
 =?utf-8?B?U2ZBNEsvMmZuQnlnL3ZhK0s0Y2FQM3NpZ2MvWWN6TWVzWWQwRTV2Y2R0SzRB?=
 =?utf-8?B?bHM3dWZvVFU4NnpRZi9STXpVTmpOUHBvenNQVmJBcHJkQms2bTVEZTZiUGhi?=
 =?utf-8?B?UFpQNWRMRHhlZGhMaDZUVVNFY0E5SHpHSEpRNWJLMWF2VjExQ1N5L0JaQld4?=
 =?utf-8?B?NVRJNlU0WjdKR3ppaEZiS3JUUE5sbnBnSUR3VlV0RDc3SWRrdzkvZEFMTldm?=
 =?utf-8?B?YStlN0t3QlhkOURyVmc4ZVlFWlJXK2xEN1dDUy84cmo0eHFPZENMNWxqdUgv?=
 =?utf-8?B?OVdSZlVLNW9MZXhOdTdJSGU2ZEhwTlpWb09PaU83enF4L0N0UW5ReHN0YllI?=
 =?utf-8?B?SktPQUd4T0RGZUZoOE5yZElBMEFzc0hQajAxeTBDTS8zQU1Pd1JiRU5NQndG?=
 =?utf-8?B?Z3lLcVdET2tXWDNocXJQZGU4d1RxLzNDVlNxNitqTkdNZ2YrNmlKTSs1ZWo4?=
 =?utf-8?B?bkEzSXdsUnMybHN2d0dyV3VTWkk5bWoyTWdDMkVUa3V3ZzJ2bVVWSStOZjZo?=
 =?utf-8?B?YXhTeU9UbjFycjE3K0c4UXJaRjVoem1YWTV5U1U2OGhtYjI1ZVNjaVFBQ05W?=
 =?utf-8?B?SGprendkWlBscXlWMjE1TGJLS1RDbE9lVWZmdWF0Wnc3cU5OSm9MaDN1dE1x?=
 =?utf-8?B?STI0dE5kQXhVRjkzdkg1b3VkYm1ZTlJOVHl2Yjh5U2sxdjUyMlJCbkdBbURv?=
 =?utf-8?B?aDloaEdwMjRYcXhYNGdTTmdJZlgyRDNKS2tHdlo3bEhTL1ZBQnN6ZXB2TUVv?=
 =?utf-8?B?alBrcFBRZGNyZXBVTUZrSXU0S01ybG9EWkx5YmZ0RUVjTlA2ZGFiUWRyYUx1?=
 =?utf-8?B?RDlsMk9TT2FwRGErZEN5ek1OMlphL1M1ZHFueHlmM1cyTGRsZGtramxPYmlL?=
 =?utf-8?B?ekFHMFR2clJ5M0hBZHhlOU5tbVZGT1VGWis4YUNOek1YeVAvaHJWUDZoM2pi?=
 =?utf-8?B?UTZObm5Nd0dhQ3B1VmhyVmdHQ0Q2Q2tOeG5hZDlGYS9YV056YmZ1Q1p5WHVq?=
 =?utf-8?Q?8IrAfFNhc0jxx5Y//zO4c+Tx+wYwIiyKypbZKGF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWVnRENqaG1zdW55a1ZocER0b050QXR2d0RuK09nK0ExeUVldllORUNwQ21B?=
 =?utf-8?B?K1FMQjM4QlZ1eXI4LzVmVTFMUTFxYm1jTE9rZ2hkbGdvQkg4UHFkTk51MXF6?=
 =?utf-8?B?WUZEcWdPUHhmWEJuWmdYU0dKS2gyYWNjcXRQYlBoS1R1RXFiSHJ6RElCSVk4?=
 =?utf-8?B?VHRTMzVETHlzTk03ZS9qcTNGdW1qbExOcURoN25EWUEranpVK055T3BTcTE0?=
 =?utf-8?B?WTRKWitxcnlYOGZxOFRMRjd0RjJobGJwS3VLSWVDNDltTm5pMEYwbnRNbjF2?=
 =?utf-8?B?SkxKRTM1WjhTa1IyOFZkZUJRdS91d0NGRUZaeDhCUVZvVkpwb0trVmV3R0M0?=
 =?utf-8?B?blI4VDVTRHNsK2NEUHIwVzBTbzR6S0NSd21GVHg5OGx5STZ0T2FzVWhwcVU5?=
 =?utf-8?B?RUhaM0xjZ2ZPR0V2K3UxZ2tjcEtvdEtoK3hGOGxkQUdqdi9vU1VCVGVtWnl6?=
 =?utf-8?B?QUtNUlo4Tkw4OU9RRnRmTjR0RXJocGhTL3BFVVptYS9XVFd5VUs1SzEzWXZB?=
 =?utf-8?B?eS9DbEh1bGd2ZDJvTXpxejFuN1FFcmZ0Q1VjNjk5NFNMVXk5WVBvZjFsM1Bl?=
 =?utf-8?B?NEpla3o2bG5QeG5iZ1pmSVJDUDM1cE1TNTJOUUlqdkxnZjBYZlhFSE41bHlw?=
 =?utf-8?B?L3crekRGUGtPcXl5WTZSMEx1WWhIYmZlNkJ6YmRoWGpBY0l3b1J6dVUwcFVF?=
 =?utf-8?B?N2tPMHU0YUc3OGtvcENPL3NTRm5LaXBXNXRQNGsrNkx2R3RQbTBvYmZtNUt0?=
 =?utf-8?B?aVBTZFZLcHp6RzZGMXRpS1NOOWR4NDBCNmwrQ0RvcmtEY0xZZmtWUzZxQ1ZU?=
 =?utf-8?B?MnF3L2VNV3Y4WHFCcDJ5UE1MbmF5QWhmTGd4dmxXdTV4bEVnWDdBaExVaGVa?=
 =?utf-8?B?MHZSUmlEb1NDcFUvZnJQMktnZUxvU2FudFZCOGNRQ1l0L3pQN01QTWRFOHZE?=
 =?utf-8?B?VHFxYVJTWHpidFJGZ1ZZVVpRdUdHU1JvUEtYd1lJT0VVMjdFa1liUXhOWTQ5?=
 =?utf-8?B?MXM4ZlpKelZZTlhtcTQvYlJmS2dKOGZOQXZjelowOVBTUDI4czlpakNKU3Nl?=
 =?utf-8?B?emZoeDZ1KytrZ0FXUFdWcGVqNmpXN2FRRmh5OXpyQ01TanpaMUxic2Nlb2F0?=
 =?utf-8?B?Q1JBUko0ZmpXc0JDZVZMMW9jRWFQbEhJcWdieDJhcEJtWk52Z2tnWUNIWGZI?=
 =?utf-8?B?QW5ROW83SGRaeWdqdmczRTVhbzc0L01QVGhqbk9YeFFyRmZyU3BXZFR5MERN?=
 =?utf-8?B?K0doZ3ZTYU5hTUpia0ltajZidWJDblJmWG9DU3lmejNvUVkvUUhGSGx0OUJ3?=
 =?utf-8?B?TWhXdjR2b3lydUNSRXMzK1ZldW9ESkNwa2dNMXFRM3oxWGh0NzVGM1FGTVpi?=
 =?utf-8?B?Vk5GU2tFZ0dLblJQQnJmSFo4ajNnNVlsUzM2bmQxNGRMQmpvUkZNZWh5aHAz?=
 =?utf-8?B?dVZFWnlBWmVaa3BKTGxTWkJ1c0UwQXIxMzltTWNCS3hZU2xONkM5ZXgzWUh2?=
 =?utf-8?B?NDhHQWpSTS9KVW0yMGsrWW9aVjM2RUJZaGVQbXErUm4yRDRpZVNWUkVvVUpp?=
 =?utf-8?B?RnlhV043eHp5WVBKQVpiSTdHQS92bnZ3YjJWZ2NBYlFzT0E1aXl2SXpFYndt?=
 =?utf-8?B?VGFFdkhNQk1YdzJFY25RTjE0c1BvNVlEZm5lTW1GblZwWVRHM29RQnRhN3hx?=
 =?utf-8?B?eW1zclY2M3RzTVRXSWF3RlpuYzN4OVVDSmIwcnUzenN0Mzdac2xYaHlzOUtX?=
 =?utf-8?B?NTNHc0NFOWhGbmhPQW1CVjhrOXVOL2krd1FwTlJIUHVPYXBvU3c1UFRLQXNs?=
 =?utf-8?B?RTBvOSsrbmx0WHlTMjBJamRGTzE3aklETmJMdmZiZkw4eGRGd2RxMGM5SGVu?=
 =?utf-8?B?NEZ4Y1JQUHd0ckNuZXhHL1dzc05pSmJENlptVHVLb3FqVU5jcG9DeTBRRnlW?=
 =?utf-8?B?a0hkc2NWbTVNWnRpc2h3Tkt5cUx0RkZqOXpCZndxeXFFMW95YVM4WVN6cUpR?=
 =?utf-8?B?RWtwUUc4aEZhRTR1dkkvaGMrUWVvbjhrL1VkZVljeVY3RTh6WWovSVo1TjJs?=
 =?utf-8?B?TUdOb1J2R2NFWmRtRFVFdGxuYTZ2UGdOOENjWXppZVc1YVE5M0RhNTdQYUtD?=
 =?utf-8?Q?dPvb4KL64y+6ecEMauRTI7N6d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7874b16-f4f5-43d3-7202-08dcf3782ecb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 15:34:28.7589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCTqNWRFxf/vacYmtOlURMXY7W+42YlFipZvgEZA4Lks0dBTnZ6CAA+M4qC/IpCujZA0FFsdaK7flX6sso/iVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996

On 10/23/2024 10:30, Mischa Baars wrote:
> Hi Mario,
> 
> The amd-gfx mailing list at freedesktop.org that is? I'll have a look
> at it, as far as that would make any difference.

I just happen to also contribute to platform-x86 for a few drivers and 
saw this message.

It won't make a difference on the stance, but you would get it in front 
of more people that actually work on amdgpu.

> 
> But if the official driver is indeed open source as you say, then how
> would the official driver be able to support HDMI 2.1? 

It's not able to.

> And do you
> think this problem will resolve itself in the future or will there
> never be an open source driver with HDMI 2.1 support?
> 

I certainly don't have a crystal ball, but I try to avoid saying things 
like "never" or "for sure" in non-ephemeral contexts like mailing lists.
