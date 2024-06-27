Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2059.outbound.protection.outlook.com [40.107.102.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9782D047
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2024 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719517719; cv=fail; b=dvxC3OUFDfPxrIBVmFv5E+M3ie6tKdXWhS4OU7pCmgsjAYRPm2BrQrKI4X5dF8sApbuJe0jtWWwHKM+OtBdNiYB7lQE2RLhXRnfnV/5pnSuDuI0TuQe9O7pgTuOP1C2e2HBtvU6k58XNgtvsk7p9+kG0YKun9ZBjVwRuK0FctwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719517719; c=relaxed/simple;
	bh=YU7ofDftEleZx9x9dcIDulyJPlNthodw0eDAOp9J+5E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nrNfjrQbVd2EXXCjtx1Pt8RLyrs0etSLh0V5if0DfjiYsjZumEE4l3ftU5GDwRPA5SRRP/yK1P0cGhZdq9K4igBlNgfMvWwueq7WrKaLr93piwzUvSlltUNf5BCuTjXZWruZzYBPA1Tg7jmMbZql3p5VHYZ3bmqHGw9SiLJgnjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uInats9d; arc=fail smtp.client-ip=40.107.102.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uInats9d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7dhXPWxgoTWeZGfcxfI9qb9Vg9+dqrdeXvm2oaX8+KXHo4Ierhpfxkimg77qpngsCyAjv5xk3M2Szes8MrUk28s7cfGHuOxXBJPhb5zvQweFnBQRan6ShCikKl+Lno2eQzleRD+FnSvSV8wj4yXyWsG2pvsQdIgp0w2dJZ03aMGfdZrdLWx9JrDnPan3dSxcPaMNqUDSKbXco+MCNDfVYdu6iEo2hbP20ib/sl08+hc0/nnAv8HzGRTZJApjrMQybVYp9ceAgUilRInN2rV5Dkje54kQ8gwPK3JDVv4Oqq6Z9JZ2lYITH9z2WNMoVEN/b0VQThlIWnbQRVp3xkFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Nlm0fJLvRwhvQxPt6NlWdQGYfUJg/RGxcru+neqDB4=;
 b=GKD7JhTFQP6KuZxAmLQpxJhUpwuIfNmn6UKICqUE9blcuonaTtUkfMVFV2Cz5jFDMj7jS/fRxCH2/77P9wFoTFLr+pgv/lfJrZWgrdxq5sHJJEgw0uU1Jq8m6AkxI2beFil/7CoG/qEcjUKznVDPIrIum1vQgjpyg5meOVN2gMuvHdldN1TuyfXTt2Dh3BVN7JP4zioKEZFhHXKQt7IZI7BKm/widlZcJXGSqlGmpistd6xhoOZh+cacVrG+H8h4dy1iZu5vdlqGTWKg3lX7Qr7KdSuEk5zfLAhA7ZlSkSF2hV2k1czx/z+jYnYUO9ntxvqBNVAGifXIuCqpFg/Cmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Nlm0fJLvRwhvQxPt6NlWdQGYfUJg/RGxcru+neqDB4=;
 b=uInats9duqO7oftgdJuMtv0n+MKS+jzzYg79673bHq7ApoxaHt6yt5epuB1eB+WWSW5atzq0lJrhkAI8EZTpOP6bAH7e5OJtUImLw+FRpSc5KSU79nPBHgKq6FdT3M87JJjEpp7ri3nijOJjKLxAChvXoSNhgDbzWAajVI/A6M0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5851.namprd12.prod.outlook.com (2603:10b6:208:396::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 19:48:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.022; Thu, 27 Jun 2024
 19:48:32 +0000
Message-ID: <24f48c77-42bf-48f7-8e79-a97285bf4fc3@amd.com>
Date: Thu, 27 Jun 2024 14:48:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] platform/x86/amd/hsmp: Move read and is_visible to
 respective files
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com>
 <20240627053958.2533860-9-suma.hegde@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240627053958.2533860-9-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0019.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BL1PR12MB5851:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7e2c54-3dce-46d3-5427-08dc96e21fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NExKeFlOZkRQYWdUbDZESzlMRE5lNERlZ1lMMU8xU0tBYWJuT2FDNURzYnhq?=
 =?utf-8?B?TlZZeWdRRzE0S1FXalpGbWdyUStONGFlRVNhSVQrOURpSk9zd25qQkhCQVA4?=
 =?utf-8?B?Ti91M0xpOGpmUlRtd0wwTnlXK2gwMnVpNEdPcjc2dEVKelp5aW0wNEZqVmts?=
 =?utf-8?B?NHZjSGNCaGpXaldxR1hxYnJMQ0xST3JXUzFvblR6bDhwbjFIMTB3SVRSNlFD?=
 =?utf-8?B?OGU4WDAxd1JiRVozWDlGMzdCNi9yd3B0SmJVbFpYUkJ6cnpVelRqWmpKaVVl?=
 =?utf-8?B?NlFDREhzcU1sbmRsZnkyMTJUTk1UOFJzNWFNbXZBNEVmek15QndkblZVQXo5?=
 =?utf-8?B?SGxwMklTV1B4QlZEaS90aDYxZmtPZ2Y4c1RuOTNqbWJSSlpjcmFzS3gxc2xC?=
 =?utf-8?B?clFxUXZ2bEl2a1lzTzlQUWZIQXZtSmo0Y1ZyMmRBcFNFL2FvNXVMdEFia2lH?=
 =?utf-8?B?Ry9xOG44QmFLWmlKOUJJMWtjU3VJa3VxTmxncmM2ZlNrN3hqUWtQbUYvTHd5?=
 =?utf-8?B?a2ZMMzdXRlppV2lsbXh3M1VURkI1OE1MSnM0Uko4enF5TUZKVXJTZWozcUhO?=
 =?utf-8?B?N0ozdlc2Y3M0M291cTJzT0YwekttUXZkWHlkM3FZMzBlWGhOeWQ1NjQvM0FL?=
 =?utf-8?B?elFKeXNBaXVtNDI4ZkJNc0h5b1hHSVNIanR5Wm1GckZNZHhiWGVBUlAwc1Jq?=
 =?utf-8?B?YklOdzQ0Q216NTlMZXhyQ011OHpBbjQ3VXFLZHlObjl0MFZTWDVmTUt1ZTdK?=
 =?utf-8?B?cE5SY3Z0Qlh1Yno1Vjc2NE55N3hPR1RSaDFNMmhLT04zUzRJMFJpVnQ0aUVB?=
 =?utf-8?B?YWduZDFCM3Y2L0l5elBpb1FoQzh5NjFydzdqTVU1WnMrZzZYck1hcHZ1ek1i?=
 =?utf-8?B?Y0FTNDJLT0t1RTJ6T0JzSWtKT3VISFV4cUs0QUxtMDVVTUJEVnRuNTdTZ1Zo?=
 =?utf-8?B?dklZbXQ0d1RHZlRrMExBUi9yTWI2NDFCUGs1THFQNXd4Mmt1MEJEaThOWkZp?=
 =?utf-8?B?YmVLSGdKUjdNblNXMlFpeVpmMHNCc2F5VG9ycjJsRk1ac0J3SzliaFR4djlD?=
 =?utf-8?B?VXFWYlJOZHAxcVFZeFRmcDJPb0RoeEFBSElnY1JIQUN6cG5YdzRPVDBvRVpr?=
 =?utf-8?B?RWpkbk1HN2p6T3oxNjdncloxeWRtWXVqbkE3OXFLSFZaNkpKOGZvOW9sZ2xt?=
 =?utf-8?B?TjZTZ0NlemE1L2J4aXIrV3BuWk5DeUhteCt1RDBNd21sTjByZzZDYVN6dHVD?=
 =?utf-8?B?MHpOZVdoU21EeC8vZ1N4azNmSEY2dVhrQktQZHRsdHJLMUUxdzBsUzdvTG51?=
 =?utf-8?B?ZUpOQUMvaGRtWGRjMC83SDVkcWRVNUlUTllrTyt5VVNZb09DUzNIdWxLb2ZJ?=
 =?utf-8?B?NUZkOHhLWlozVExvK0hGaDZYL2dkdm1QUlRUaG5kYksvTW5Eam51WkpINDZK?=
 =?utf-8?B?dlZCS3BzYTUwNzN3UktLUmFnclVHc2hwRUFQckZGQ3ZSbW1LUFpseVlCUzJV?=
 =?utf-8?B?bDFKWmNUZDFVUTBzV1c5VEl3dFQrZTErQ1dLaGJvdDZoajhSY1p4QzE0MlVS?=
 =?utf-8?B?Y2dqYnVxSk1zRlZHSW5iUXFuZWRndG91SFptZzRnR0I4KzErVmdRc1hpYWcy?=
 =?utf-8?B?YmhwNDJYWHRjUDU1a1hDK3Z4ZlhPWFJpUGZ5VjZsODNlS2N5NGtscW9DMTRs?=
 =?utf-8?B?OEh0Z2RDRmdlem5iajNaclRlclJiMHU2cWJhZWdiYk1rUmNpNks3Ny9qdWYv?=
 =?utf-8?B?VVhyWThTT2Y1RytYdmlCSFhwNFRBYTI1eE1iWnhNMmp2M1orS1NCb0hFMUJV?=
 =?utf-8?B?UklJRkdmdGpiNENFVHFFZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q29WaDZOZGtxeWFIWUFXWW9DL3lMRmRmZytITlpqVG5IYjhMbStFRWZFRktq?=
 =?utf-8?B?akJmK25WSUlrcE9tbWlNNlVPSm5qcWp5ZytSZzRJU2VKejB4ei9GZDVocTky?=
 =?utf-8?B?SHlRZmRCTGdpSE5SNGNIc1hvZGQ0dEpFSlZEUFd4cE9LSUJFTWxnZGZxQVpa?=
 =?utf-8?B?ZGdVWURoVXdlUmhFNUZxMlBnalJDTWxDVFRJRWpDTnY2cEtocGtOVHpHc3Ux?=
 =?utf-8?B?Z0g3YlhuZjVkV1B5MWdvTFNmVDJ5S283VUJwU254S21LUVo0NXV4Z3lvaUdH?=
 =?utf-8?B?TWs3K2xQaXpOTTl2cURaZGRRczUxakxwUXd2R1QySDI1WEs1UXhFSUpFeEhN?=
 =?utf-8?B?eXhiaG1XN0ppbFQ1elVKcXRoUW1yRG1wS3dvVk5WaE1Da2JqaGY5UXZqSDlW?=
 =?utf-8?B?eTc4OGIvOURJZUY5azVid21KYzVpenBEWDhIenRIL1dXU3BBSnIwR0tMVDZn?=
 =?utf-8?B?KzFJNUUwdmg3WDhlZlBsVkxFeWo1VU9VYjNXVmg0eTQzSEVYOHgyUXowWGxE?=
 =?utf-8?B?NlZIUnJwNUxuRHRuWGk3ZU9OdFFOTHVUOWtRbkRPMFdZQjRlS3J6NHQrOTlt?=
 =?utf-8?B?a0ZoOE1ERUluMTBhbk5aT3J2WTg4bVBDMXVtR0JVZ0ZYSHVvVzJ2NTJPeERZ?=
 =?utf-8?B?TUlFTDRYTUhFUW5DNUlVSDRIZlRNTEMxUkNZY2dnN0VCcjVlcWhtUVNjRlV4?=
 =?utf-8?B?MTlFcWdLYWN1QURqcTZ0N1lpNzcvUkhqeGpCZmVOZlJVdnhCU2o4ZXByU0NF?=
 =?utf-8?B?MDNyaExER0xBSjYzWFc4ZUNRWHlxV282eGJocERVOEdLTDBMYXBlQUkvMWZr?=
 =?utf-8?B?a3kzM3l2V3hGNHJrWnlzdjk1Sm1pSkdFcUczNGVOT1E4cDgwdUwvdzVGelhi?=
 =?utf-8?B?TmhZTnRvTEZwSmR2ZitLbW50TjhpTXBqNmU2OWU5VnZTMXBKQTArZEtlVVhq?=
 =?utf-8?B?c1ZkWkdOMm1Gd2xjMVV4UWtscGdBMVVLbjQzeG5MUlpkTUJQbVFvYXNWQmRX?=
 =?utf-8?B?NHJHWFFWM2lTL1NxRWVuNXJ6OXVVdDhIYTUvQ1N2a1dIbkd1SWVUdWM4MUR4?=
 =?utf-8?B?OWRoelg2NHh3ZkkvRzVodmxnbEpqZGNGR0lSY0oyb2c4bzluQTk0U1REWW5S?=
 =?utf-8?B?T1hGUk56dXRXajIza1BQS3lpVjJTL0VET1pKSUp0bWc4RHRKTkJJUVU3cWtH?=
 =?utf-8?B?MExFai9rMWtVMnJ6a1hNMDRQSlJ4ak1CRDdkdDB3MmpTV1Q1U3dDKzdnVzcw?=
 =?utf-8?B?YkNQR3J1c1g2Q0VlQmtlS1J2VjJmRk94ZE5XdHZjUmlBOGxBKzF4WHJQbDg1?=
 =?utf-8?B?endDK1k4ajFUZURhbnNsY2ZhNzNuYzZCb25tOWRBTTk2ZjhhWkRucmRvKzlJ?=
 =?utf-8?B?ZHZ6by9KNG9icFY5ZWlQbXYwSTBFUkFMZTR2RzZaSWJ1YlBxaWhyT3d1bVBG?=
 =?utf-8?B?TDQrY0tMY2FQM3VWU0szWHlDSC9DeE1TN2xMSFdyU2svRlZFdGI3djlrVTUv?=
 =?utf-8?B?NWxGSk9yWlRZQlVjTXg5czk3cUtFYTFKME5hMk5yTUVTOEJrYjd4d1Q3TTFt?=
 =?utf-8?B?dEErV1lrdjJCVmd6MlNpZ1BaeWw4NjJ5SDVsSGVWVENVY3NoTzcxd1hGelo1?=
 =?utf-8?B?UG1pZzcwS3c5WHExcGc5ZlAvb1FLVmZHdksySE9PeHhNajZtYTE0ME9kUUlB?=
 =?utf-8?B?RWNCdGp4RkdzTzE4blZId28wSlNITU80d05Ra25LaGdHQ0wyL2FpbnBTUXYv?=
 =?utf-8?B?eE40NlFQc0l3eGszRVZiZ1BIZ3l6cDRtb0s3dlk1RjBsaktjbitQSXZOejly?=
 =?utf-8?B?VnpVdmQ4L0RvcDNuRzZMUjg2cDFZdFVFbzZHQ1A0SUpDejVVVkNzVXlhOGUx?=
 =?utf-8?B?Yi9MVnljVllPblowNmZzSDRRWlBuTjlsOVVIWHVSN0xkSVdDZTcxVGxKVSsx?=
 =?utf-8?B?bE40S3liZTRhdmVRYlRLTXBhRUtldFpYOTRyM09VdHRKZzF6NExPdFpqaE5S?=
 =?utf-8?B?ajZEVWp6VElLalhYZGVjS3dMTWdSaUpQdHNKMm01MDNZcjVnallEelNmcEdi?=
 =?utf-8?B?ZDR0eldjL3JHZnQyKzZUZVVpQnRqOFZuMWJ6ZlIvL0o4bGowSk02L21WN3Nt?=
 =?utf-8?Q?+QbouVVvSE4Vtw2ZJyujvtuPk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7e2c54-3dce-46d3-5427-08dc96e21fe8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 19:48:32.3054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kA/HC2+0Vxg6F3u0aaYFSPrTKgpoD6OIPnNihosHioXvXDCc1jAgZvJI55naZstkJspbk1HDhpH5x68fWgSjYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5851

On 6/27/2024 00:39, Suma Hegde wrote:
> The .read() and .is_visibile() needs to be handled differently in acpi and

is_visible()

> platform drivers, due to the way the sysfs files are created.
> 
> This is in preparation to using .dev_groups instead of dynamic sysfs
> creation. The sysfs at this point is not functional, it will be enabled in
> the next patch.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>   drivers/platform/x86/amd/hsmp/acpi.c | 41 ++++++++++++++++++++
>   drivers/platform/x86/amd/hsmp/hsmp.c | 37 ------------------
>   drivers/platform/x86/amd/hsmp/plat.c | 57 ++++++++++++++++++++++++++++
>   3 files changed, 98 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 0307f4e7176d..1ea17aa296c7 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -12,6 +12,7 @@
>   #include "hsmp.h"
>   
>   #include <linux/acpi.h>
> +#include <asm/amd_hsmp.h>
>   #include <asm/amd_nb.h>
>   #include <linux/platform_device.h>
>   
> @@ -206,6 +207,8 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>   
>   	sema_init(&sock->hsmp_sem, 1);
>   
> +	dev_set_drvdata(dev, sock);
> +
>   	/* Read MP1 base address from CRS method */
>   	ret = hsmp_read_acpi_crs(sock);
>   	if (ret)
> @@ -238,6 +241,44 @@ static int hsmp_create_acpi_sysfs_if(struct device *dev)
>   	return devm_device_add_group(dev, attr_grp);
>   }
>   
> +ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +			     struct bin_attribute *bin_attr, char *buf,
> +			     loff_t off, size_t count)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	struct hsmp_message msg = { 0 };
> +	int ret;
> +
> +	if (!sock)
> +		return -EINVAL;
> +
> +	/* Do not support lseek(), reads entire metric table */
> +	if (count < bin_attr->size) {
> +		dev_err(sock->dev, "Wrong buffer size\n");
> +		return -EINVAL;
> +	}
> +
> +	msg.msg_id      = HSMP_GET_METRIC_TABLE;
> +	msg.sock_ind    = sock->sock_ind;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
> +
> +	return bin_attr->size;
> +}
> +
> +umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +				  struct bin_attribute *battr, int id)
> +{
> +	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
> +		return battr->attr.mode;
> +	else

Since your only path in the "if" returns this else is redundant.

> +		return 0;
> +}
> +
>   static int init_acpi(struct device *dev)
>   {
>   	u16 sock_ind;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 4bf598021f4a..c199a0ff457d 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -273,34 +273,6 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>   	return 0;
>   }
>   
> -ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> -			     struct bin_attribute *bin_attr, char *buf,
> -			     loff_t off, size_t count)
> -{
> -	struct hsmp_socket *sock = bin_attr->private;
> -	struct hsmp_message msg = { 0 };
> -	int ret;
> -
> -	if (!sock)
> -		return -EINVAL;
> -
> -	/* Do not support lseek(), reads entire metric table */
> -	if (count < bin_attr->size) {
> -		dev_err(sock->dev, "Wrong buffer size\n");
> -		return -EINVAL;
> -	}
> -
> -	msg.msg_id	= HSMP_GET_METRIC_TABLE;
> -	msg.sock_ind	= sock->sock_ind;
> -
> -	ret = hsmp_send_message(&msg);
> -	if (ret)
> -		return ret;
> -	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
> -
> -	return bin_attr->size;
> -}
> -
>   static int hsmp_get_tbl_dram_base(u16 sock_ind)
>   {
>   	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
> @@ -334,15 +306,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>   	return 0;
>   }
>   
> -umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -				  struct bin_attribute *battr, int id)
> -{
> -	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
> -		return battr->attr.mode;
> -	else
> -		return 0;
> -}
> -
>   static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, u16 sock_ind)
>   {
>   	struct bin_attribute *hattr = &plat_dev.sock[sock_ind].hsmp_attr;
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 62423581d839..57aa64b18e0d 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -11,6 +11,7 @@
>   
>   #include "hsmp.h"
>   
> +#include <asm/amd_hsmp.h>
>   #include <asm/amd_nb.h>
>   #include <linux/module.h>
>   #include <linux/pci.h>
> @@ -88,6 +89,62 @@ static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>   	return device_add_groups(dev, hsmp_attr_grps);
>   }
>   
> +ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +			     struct bin_attribute *bin_attr, char *buf,
> +			     loff_t off, size_t count)
> +{
> +	struct hsmp_message msg = { 0 };
> +	struct hsmp_socket *sock;
> +	u8 sock_ind;
> +	int ret;
> +
> +	ret = kstrtou8(bin_attr->private, 10, &sock_ind);
> +	if (ret)
> +		return ret;
> +
> +	if (sock_ind >= plat_dev.num_sockets)
> +		return -EINVAL;
> +
> +	sock = &plat_dev.sock[sock_ind];
> +	if (!sock)
> +		return -EINVAL;
> +
> +	/* Do not support lseek(), reads entire metric table */
> +	if (count < bin_attr->size) {
> +		dev_err(sock->dev, "Wrong buffer size\n");
> +		return -EINVAL;
> +	}
> +
> +	msg.msg_id	= HSMP_GET_METRIC_TABLE;
> +	msg.sock_ind	= sock_ind;
> +
> +	ret = hsmp_send_message(&msg);
> +	if (ret)
> +		return ret;
> +	memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
> +
> +	return bin_attr->size;
> +}
> +
> +umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +				  struct bin_attribute *battr, int id)
> +{
> +	u8 sock_ind;
> +	int ret;
> +
> +	ret = kstrtou8(battr->private, 10, &sock_ind);
> +	if (ret)
> +		return ret;
> +
> +	if (id == 0 && sock_ind >= plat_dev.num_sockets)
> +		return SYSFS_GROUP_INVISIBLE;
> +
> +	if (plat_dev.proto_ver == HSMP_PROTO_VER6)
> +		return battr->attr.mode;
> +	else
> +		return 0;

Since your only path in the "if" returns this else is redundant.

> +}
> +
>   static inline bool is_f1a_m0h(void)
>   {
>   	if (boot_cpu_data.x86 == 0x1A && boot_cpu_data.x86_model <= 0x0F)

