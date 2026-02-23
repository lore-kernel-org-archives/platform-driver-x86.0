Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012063.outbound.protection.outlook.com [40.107.209.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4476F314B6B
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864777; cv=fail; b=r/Qz4xBqjfDvheMVUsmz43kqnykdbHVz22orAXTcvnbN6mCaAovDn33VOVoLAWMrJsuzDZp3FtsXRH1Hw6kVPzgqL+QPYB1CmFHj6YyivDuohvoJ2wE6UMH3XWw99vIIPYyrmR2Q4pC9P/OiZe4D/V5HpUwkMKTWBxAFuJ9aEZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864777; c=relaxed/simple;
	bh=3EIDXjURcVhUm6u4Q23nxMCRUP8UNO6abvfUXhu7Ei8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XCaU48fuf+x1XG8Cc6oN5yzKQgBdY1IAGDDlBPLmmeIsBkmT4WlBtQRCnlQahck7P7msBDoV5OiK8eRszz7qJzHhG1LOooImiG7+Yu61iOpaeREIOwC7jSUo3JFiEWybkY7Ap51tR8EJFjGKeeuVLaFrGrlMLKysOHt73fl5ndU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rgT2NsOB; arc=fail smtp.client-ip=40.107.209.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rgT2NsOB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlLhZ/PtikF1vj8fgfivGMqisU7GO9d1GTRkNA0LnU8iG8Fo/KAYTdXVRYmZ7bPMx4mlPU4/tDluzfy8hwY75tBvcZDUkJ8WAcDVC5l8D4+FudwOMWPDdDNv0vYTCTQY0xifCRJBTQ8oTviSmae8UtMyu6xCwsW09o5+ZxFf36gWggsZ4HB1OswoPTyJEnK6jhIjir0x/i4S9P9sR5rkErfyGBa+LmDltcboguDKvlyHxrWJuocfEYHm28AzISVPov2MhM7js05yrrVuy18mIuHxrrO/DzuHhM4ajMpH1Wa5Zz2etbU5YvAPWX9ceciPdcS+EI5qkc3hFoz8ci+o9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM1Tov7UDFlo824XG5zA2K8MMFA/4C2y4OpUtzTBHcE=;
 b=TzG9xbUNsZJNxbHLmcTbfmtEgy+Ag/fjJcgFW+9pKg7JM0B0Pg+GnTnLaSkd2IIWlkyCIlXrRoJ12PpFnrO6Gn/xCJ8/nPDG1ZDOtcPwmEpamoudmdRFAnCGfVTonYHAwmdPfkpXY1qPRLsYP+vvty5ezfBD1uaTK2uhdtMcIuaW3ccXTBlF4cI9c4Ud6HQ8QgprrtTWD8YCSKZfdxOcpgDaCXmw1y//omc8bcrpQFQXFg4X4GOVPqFwNrjCNjkAe923FwZIgORCtNP3upVyX8UMN/TbFgU5R+lrcln5lDA6qBCeUqxy5ujpkYsXaiUKDRRkSn3DQnwyMQt6XsXBWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KM1Tov7UDFlo824XG5zA2K8MMFA/4C2y4OpUtzTBHcE=;
 b=rgT2NsOBlVaWq+AwDP0wu+sxL/74qHw3g6bQpT8lstWT3uo6/lVZxDuwLUvnHxxSoM1dldOlUyp9JhYSZ5n6qEPggOQuWhBsuHLa8goXjc5A/sQwfrx/YKe6jmkC4I4KmL97sbYf5QKb+MvUy7dI9BX0o9hcNLaF8obJM6G+iLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by IA1PR12MB8336.namprd12.prod.outlook.com (2603:10b6:208:3fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 16:39:33 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 16:39:33 +0000
Message-ID: <0b744c9d-9874-4755-9b25-d00f2465a751@amd.com>
Date: Mon, 23 Feb 2026 10:39:31 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
To: Paul Kerry <p.kerry@sheffield.ac.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 1127612@bugs.debian.org
Cc: Jorge Lopez <jorge.lopez2@hp.com>, platform-driver-x86@vger.kernel.org
References: <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <aZMt6sSlpKK_JAdT@monoceros>
 <4ddfa94c-5cb5-4c7a-a0b4-9b9ff5e4cc85@sheffield.ac.uk>
 <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <4faeb5e7-e56e-429e-88fa-a1fefa4d1034@amd.com> <aZnNu_AphE78MIoY@monoceros>
 <d152f056-8583-49c9-a943-494325031d8f@amd.com>
 <d152f056-8583-49c9-a943-494325031d8f@amd.com>
 <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
 <7599e019-5c25-4bce-8308-05d53699a2f5@sheffield.ac.uk>
 <3167b808-1fc9-4b73-9bd3-b76b149d2b65@sheffield.ac.uk>
 <f4f2c1a2-25a7-4399-8b13-d627f7a20ac7@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <f4f2c1a2-25a7-4399-8b13-d627f7a20ac7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:5:80::39) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|IA1PR12MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd31ab3-1f27-486f-e6a7-08de72fa1fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MjBCZFI5Umx5RWFrVlkxZjBUL3htZ25KYUo5dWd6QjhoamJsSTZKdHk5NHZN?=
 =?utf-8?B?Kzl2aFVEL2RJYnFyTHozbW91bDZMU3RIK3JPRWJweUVBVGl2Vm4xdzMwbDli?=
 =?utf-8?B?UUFFQWwxNmdnYVBmeGpFNGhxaWxXZHZJS0t3UDBUWnp5UERMNWtENkRCVG9o?=
 =?utf-8?B?MEthU3pMMmViOUQ0S0RSOGN6K0pYWW5IMXA0WWxocGI2R25TaG9sRXI2bjky?=
 =?utf-8?B?bEZBMkh6dXllREJZL2FXU1FVd2pKaG1LMUVxcjFkYWlxTTN2WGt0NXNDVEUw?=
 =?utf-8?B?MWZMQis0eTcxNjdSQnhpNHZpWlZwMlkyOFpuSkpvSVBwNHBHejZDREo4STVO?=
 =?utf-8?B?Vks1NEtoOTZkZjFzN1BxR0ZYeXRYclJBYWUxVDNrNHNsMlhwcVRwT0dlL2hy?=
 =?utf-8?B?ckNQa3ZTRVU4VXpBdTJFeVpYUE9MTGY5VVFybkVPNzU3YjFBV2lJRDBLU28z?=
 =?utf-8?B?VUhqWTIxQWxGc3M1ZU44a0FIN09WL1B6aExZWWRBUWNJMkF5TGtNOW9mUkVo?=
 =?utf-8?B?ZzJiMUdGZlFPRWNVcWhaSmxYOVY5NVMrUWhOVWVCbjhwdEFXeEZjU01CMmxG?=
 =?utf-8?B?MEErYk5JdVduQ0hGTjVnOG1yREt5ZGxTWDlrcWxFbkJ0dUsrOWo1eEdQdmh5?=
 =?utf-8?B?VkJNbmtwQjNzOUJVc0YyakF6U1RqYzJmL09jS0gvTUNCZCs0a3hhUkMwMWxB?=
 =?utf-8?B?RCtWdWg2Y3M1ZC95a1ZtRnJZRkdycnE2dk5rV2VZenluV1g5L200a0Ftb2dH?=
 =?utf-8?B?UVV4bHI4azJ1dUNHOHVXT2tKbXZsVDNHbmF2dUxEWnU2a3ZteXZiOGs2TjFB?=
 =?utf-8?B?MFlMbzFKOTFYcjdUU3NNSy9NMzBQNDdkamN2bDBscEtrY0xSajI3alV3eE85?=
 =?utf-8?B?NHUwYlRFU0h3M0trckRXWXg5TDZFeENJSTBiOUd6LzIxSVZWQ0doRm83aUg4?=
 =?utf-8?B?b01PNlJDNzkvNjRQMVlSWWhkUXJzWHdDaVZIcFdjbVp5aXhKdWFJaTJEWnY5?=
 =?utf-8?B?bmVlbHpPRDA2bk9LMG9Bb0Q3ZFRyKzdCek16Tlp6ZTR2b1FFUjVpWkF4enJ0?=
 =?utf-8?B?R0lVc0VFKzNPcmJZbHFRMWpyN1RvL241Z1ZrVG0yTlk5aWpJbjgvWWZva245?=
 =?utf-8?B?T0NCTWJiTWR3NS9MRU0zQ0FQK2pnUnJvOWEvWG1OUFEvVllQZ2ZnZGtnRnBO?=
 =?utf-8?B?WUtpU0hraTVKSyt6Z2JZdnNRTGY1NXRKS3JxNGlBZTZpNkpKSzJ4TjN5amd6?=
 =?utf-8?B?bEZHaEt0UHJpcWVrWi8ybENoUSsyekU2cG5xZkNnQ2N4WXRkR0JpQlJGWUVr?=
 =?utf-8?B?Y3IrRHFCeEJQS01OalowME1lcHJCWkVjWkl2a0FybEREYVFrdXM3ejdmTnY1?=
 =?utf-8?B?L2o1K3o2MDJGUkJObEdMbUtLOHVaaERpZ01OYS9HSjR3TStBbHRxT2FVcDJx?=
 =?utf-8?B?aTRqTFFuT2lFbEt2TU4zcFNWa1pnVlFmNXk4bUJxZ2NJZWlPWGdWOHN0YUtr?=
 =?utf-8?B?dUR4YXo5V3JXdmtzTEp1Wk80alVCeFEySlZuRlZNN3FJNVZPSFVKVXBUcU5N?=
 =?utf-8?B?QjdRaGZIck5PUjBvMWNRNm00QUJpWHpsckk5dHVyVFg2U3lQWXY1dmsyblZ6?=
 =?utf-8?B?TE1YVVUzd2FZcW9oYUZKWXBxZWpyankxTll0bTRVU3FCV3p6b1U5Wmo4TFdI?=
 =?utf-8?B?Z29PMm9GbmZqbmdHUjhVOUdNMi82VFEzSFpnb0dZR0lxMU1SSHZVR1lKV1BB?=
 =?utf-8?B?eG5YZGNRSXgzQnBaRTJ2aWphTjRUWHhPdG5IWTFyT2JTUWdYbjRqc3UrVVpm?=
 =?utf-8?B?WWRoaURybnNPYk4yTFhGQ21TZWpHNjZ0UVR4VTQwSnNwaGJaWVhxVDlvUENs?=
 =?utf-8?B?bFJmbERYbWgzSkRZMnU5RmpvNE9vdXVadTlVNGFNcVpyMkFCcXZsMElITUVE?=
 =?utf-8?B?S0ZpYnRXQlJDRTYzcGRnaVJoTVRnRjBsUng4RTJIR2dDSGhkdndEa29xU2hX?=
 =?utf-8?B?ZXVzaWp5NnQxRVF2cXFUTHVvbHdwS2lVTVA5VHFYdWI5WFl4MUN3N1lDdXcr?=
 =?utf-8?Q?QfiJDp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qmh0VTJaazhVbnhoekw4UXRLQVZtYVllQzNuZTJ4dFRPcWE4Z3J6UkYyaVlm?=
 =?utf-8?B?bHB1ZW1iM0pSMzUwc0p6eXZhRUN5WDlhSUtpYVBHY0Q4Y2FXbHNkSlMrc0Fy?=
 =?utf-8?B?K0Q0aUxLemE1T1FXUVQyZWRPblR1OEFYSDA0RmY2VDl6aWFIZklvTEhTSEQv?=
 =?utf-8?B?ZnFlTVBUNG1iVUZXRXpKUjlPWlFSMkc4MTBkNldMbUhXOFpmRjF4SzZNbEdU?=
 =?utf-8?B?bHN4REovdkp4dTdpTElQVzYzQ2Q3azdGVjNnVlh0V0hQS0RJTnQzM0NRUGtC?=
 =?utf-8?B?OWUwSWNmRkpCeW1pTjBVdFdUdUp3NXJwNEJMQ1JFMlpUeDArMjQ0RWNKeUlV?=
 =?utf-8?B?ZU52d2V2R2dsanFycGEyY2VCNHUwNDFqbXFNdmw3YWlZZVVOWWtVOVpBVVIr?=
 =?utf-8?B?WHJXNll6YUVabjhqbzlzcDE3Q0J6bWYxZGk5U1VDeVFCb2dqOTdRSEZMQ0NT?=
 =?utf-8?B?Ti83UStlMERKTEpxL00wb2hwVEg3bDkrMFhnUFphTEVuQlZVYnlWUENXaUNF?=
 =?utf-8?B?NXdEdUQybDE4T1JnMGdsbWVCUFlJOThDU3l5TW4vMjZWaTFyN09jSjhxeEUw?=
 =?utf-8?B?TXhxbmNTMjZRYUtRbkxGa3hXTWRmQm1UbGwwYURHYWZkQVRhdHpQb3RDb2Rm?=
 =?utf-8?B?cUE4cTV1aEo2VVVhWFJra25UL1BSNXg2TGJkR2tzVUpReUxtSWVhL0YrbE1N?=
 =?utf-8?B?cXVxZlVnb1FpOXFTYWUwWVhUaVFVYWQrSTRxRlpNZlg2WXViZmtUY1BSU3Ji?=
 =?utf-8?B?ZC9qU2FDU1VnUURBWTFrcklndWhYdGRpMUNiUmwvaGtIL0w4VW1TTGZCNmxq?=
 =?utf-8?B?TUtNWFloVFpIcHZrOU1MeDhhbC9wR054UUYzRVRGOEgvNEQvOGRZdEtjOCtL?=
 =?utf-8?B?YzU4b1ZaTDFaSHJkNGVBVWkvU2FMdGwyS1hsVDFCdjl1WWFmYmRKTDNYNVBT?=
 =?utf-8?B?bmcwbTdQK1VjcjVZcHFRclBqZFlKb2R4SWl3eks4R1NuL0l2Q2d0TWZjRVky?=
 =?utf-8?B?NVJQYjAzWjZqaGtUS1V4ZUJqQS9BK0dXK0dFcWs2VXdiNStxZkY4eFlzdWs1?=
 =?utf-8?B?SmFaVTc0c0lqbVNNRmFuQ3NRMlhFYVBsSXZsV0dIYUFxdFJNU2xIeTkzbVBw?=
 =?utf-8?B?UnJid2UrYlFLVkViWEd6L1BtdnVkTUVNL1FtNm5QNUQ2TngxZU5hR0tDQnJF?=
 =?utf-8?B?VytNdlN2aEZBcXlIYWpxcE5ZdHNKcUF1Nzd3T052U0o4Tk1idDRQTmlObkU4?=
 =?utf-8?B?YWVIMUU5VlRWRlVHc1RWNG1HUXpvRWNoT2l2V1dKVXJUZUh1aU5SVnJjbUdq?=
 =?utf-8?B?d1Fhay8wZU11ckV3R2lRcCt3RXpTTkVCRjcwV0hyS21LQytSeE5hZ2FCOHg4?=
 =?utf-8?B?bUlHb3UweWtDMVBWeTczSW1IaUE2WEtGbGdQOHA3TmVXLzV5V0xwQVd5UStl?=
 =?utf-8?B?QURjMm1CZVUrYnZPZzhMT3BUS0JUYVA5ck0rYlpnOVR6NW1oOTJCeTdnV0w4?=
 =?utf-8?B?dVU2bmdlTDl5bmVtTng0M05FbUczTkxyaHptd29sWCtlMmpHR0VRUUlvQkZo?=
 =?utf-8?B?U290WGV2Q2cxaWs4ck1pU2srdGUzbm8vV1ozVEhPa1U4aWpXZDNPZHd0TlEw?=
 =?utf-8?B?NTNua1llWGIwd0hHSjJKVDlyZkFYR0J6NU0vaFA1dE11VkcxU0JHU29USU9I?=
 =?utf-8?B?eWJEZWQ2NHBkRkNZS2k1NUFqOCtwTTlJSkp5MjBnTlQwdWlGYmFmZUNTTGZh?=
 =?utf-8?B?VEtDejV1RThEOVFVL3cybnlaM2NqTTFnV21jNHJ2VW9QS3JJQjhPeDN5UHh4?=
 =?utf-8?B?TFlnamltb0RZVnVBbnhhVTNaRmtmNHU5S3dSRE5DaTYvUEkzYzRKNTQrMWpR?=
 =?utf-8?B?ZFdFQXMwNG1EYXNKSVE3L2hMTDVoOC9HdlBFaDhpU25rWmIvalEzK0I5ZzRL?=
 =?utf-8?B?NGJIUDBTV1AwbWplY3cyVVk4TC9QMkNtS2R5bFJYL2ZQdTRXMHV0OHBCMmFG?=
 =?utf-8?B?cVpkTy9qWHhjT0tybk9OZkZXL3ljdVNadTBUc2ZoVVY4R3l3a09RZjdoUlU0?=
 =?utf-8?B?NngxUmlndzNHYUJCSkVoUTYyS09HOWUxV3NZeUhqSHRPS1czalI2MVpVT3hE?=
 =?utf-8?B?Q3gwbndDVDNTRGdvMnluNzVvY2JOZ0hUOFA2eitRL1FnUiswNXZDQUsxUU5y?=
 =?utf-8?B?QUwyOWwwL2JFQXlZNnQvWEw2QnY0MllMQkZzZGVMVDRlUHptZXJjcnlZeTk3?=
 =?utf-8?B?WFNGQ0lYakFXYlpHK2k2aG16THhRMG9MdTlUdWJDaWdPeHh0Ym84T25VeDA5?=
 =?utf-8?B?b3RVRjEyc2pwczF4S3dqeUxvZnVaNmV3Rkd5WkdMSndHcGJMUkd2QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd31ab3-1f27-486f-e6a7-08de72fa1fd1
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 16:39:33.6656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgEQxesgyP1PzqFq1N3WzQfShhuEZLPWUZHqTDtl55Pl/YyQeJYZACRKwAoy14McD0BaytgUEAgIVVoOsg38XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8336

On 2/23/26 8:28 AM, Mario Limonciello wrote:
> On 2/23/26 8:26 AM, Paul Kerry wrote:
>> On Mon, 23 Feb 2026 12:46:54 +0000 Paul Kerry 
>> <p.kerry@sheffield.ac.uk> wrote:
>>> Hi Uwe and Mario
>>>
>>> Thanks, and yes I should be able to incorporate the patch and create 
>>> a kernel image: I've now moved up to the recently released 
>>> 6.12.73+deb13-amd64 kernel and the same warning occurs, so would you 
>>> like me to try to build the patched version against that or on 
>>> 6.12.69+deb13-amd64 ?
>>
>> [apologies - I didn't include all email addresses into my previous reply]
>>
>> Hi Uwe
>>
>> I'm following...
>> https://kernel-team.pages.debian.net/kernel-handbook/ch-common- 
>> tasks.html#s-common-official
>>
>> and I've tried to patch things using debian/bin/test-patches but am 
>> getting...
>>
>> patch: **** malformed patch at line 11: 
>> kcalloc(bioscfg_drv.enumeration_instances_count,
>>
>> so perhaps it is how I am copying/pasting the lines from the earlier 
>> post into a file that is then causing the problem?
> 
> It's totally possible the patch got mangled when I copied and pasted 
> too.  It's pretty trivial, I'd just make the modifications directly if 
> it's not applying from copy/paste.
> 
>>
>> It's also been quite some time since I built a kernel and a debian 
>> patched one at that, so I'm more than likely doing something wrong, so 
>> if you could create a test package instead of me having to build 
>> things, that would be a big help thank you.
>>
>> Best regards
>> Paul
>>
> 

I've posted the patch separately for you to be able to test with.

https://lore.kernel.org/platform-driver-x86/20260223163245.3294630-1-mario.limonciello@amd.com/T/#u


