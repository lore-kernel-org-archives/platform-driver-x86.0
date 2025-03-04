Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CF220E6E2
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Mar 2025 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741103835; cv=fail; b=bN2w0jGk74uQ0y7I+3KDcKxH/xv4rnwBpihocRzYhdmVZ8o0lF8BSWKIaQx+DUSwB4j8Q6Cn4o3XrTmZSYtRIXBcAfqUNPIESIl31nr5SM9WzHo2u7nPcW7lBZ9YjbmTDiOtHgpL1uoyD3/YSvkJBIBlhVoq49EnHPiph/bwByw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741103835; c=relaxed/simple;
	bh=bWtPIldF98BcxvQcS8cPMTS01KgfzK4qbDsvPLI8Z3U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KaNvmSjHSIGRk2hXagWlUTDTuqPPpV4MvkvoZSvasI1BNT/wIrWM0k+5cH9vKekjVCBDs56R4ed3t0xxgtBaEk7Jo+0BhGIom3icN1VR0IqSoFnCjrNsY+aAQ8SwwkXI6D90G4dDoBqA76O/RArhC/knNfEK5F4Q24cXKQMzJQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MhYV6g7b; arc=fail smtp.client-ip=40.107.220.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MhYV6g7b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNp/B7sy57ozip/z2CVuJRguMCVDCDDSIG8q0J8/2rQeiVUzFF/3ZyjumSwahoB8U/twYti9mh/dCZ1ytzTA1OLIjs8gQ5J3L1FsMDXCcBtrbEnlrPXWhhSyOtTEJ0zUgSlFELVNGRpx2jIUDaKC1X/gr3CYjkJtBH6GHQGDe/pR8G4Wx10uZeF0UcK81NgoQEnRZqSo21SLbdqEcnjFHw5C4Jks10hMB5GYw8bTvSo0CbB+60fH3PdlzUgdKdKdMQb00NGY/nxkGAXv8ipCBonxYR4HLqJiGhKr7rji+Eqr3QnHFp8Api+S3BtdjcE4k0+WvrDa6EQ47LELQ9YiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vIb9pnlc9UuWahQdtLEtzMB+sFbnj9e3Oxe0tQ7vqs=;
 b=LxGmFtwvEUjRIQmI7achTFNgbWlgA/pPa/yZ/DbQ+/BlRTx+xwYoECzzHZeLu2ZXFQ1ivYbPT2P6PG3PyccypJnQ4/SyXKjazU70ytdQ8FJ27jmRkf0hf1q+F5HRw/fZ3LQ7z212c72lLbiuPen1pVP/MpB1COFyjEz7vzrKxFQk1gbBHiFU/u4wshqShK8tFB/Uja1IEJh3FE8gnC+3EACIUCB85durDLdbt8DT6Hin2XoUf+qF19qHeOOMQBdlkpkuIk5ypyiC7ABAXBZ7EP5xAepTKprkdQRjKC9lDkjQYRpu7H/4Mvq0rNJWLkqkStsaidHvxxaTi2mY7DOekg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vIb9pnlc9UuWahQdtLEtzMB+sFbnj9e3Oxe0tQ7vqs=;
 b=MhYV6g7bxzQEafLnRFxxHe5JLISblq9fNQ+kdqAMf7qjW8UBxYADJol5od3fcRszf6U9o0cx5NknR5zNmUmzmKlI2MJIT4OKFaoY0gljz9MttrQCp+no/lu78hvao834zdJGwJpRH7igrdpcHWSxZZ2+j2N45DGo6vrokxLDx0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 15:57:07 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%3]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 15:57:07 +0000
Message-ID: <c53faa27-5e6a-4d01-b56d-cf92f4abd96b@amd.com>
Date: Tue, 4 Mar 2025 21:26:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Update PMF Driver for
 Compatibility with new PMF-TA
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com
References: <20250218120625.1718196-1-Shyam-sundar.S-k@amd.com>
 <20250218120625.1718196-2-Shyam-sundar.S-k@amd.com>
 <85237940-b9a2-0b19-44de-058a35e2089f@linux.intel.com>
 <9e8b2f14-6454-4958-8ac9-4f8dfc8745d2@amd.com>
 <a32a5daf-9719-ba6c-c6a1-6c2e79760b11@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <a32a5daf-9719-ba6c-c6a1-6c2e79760b11@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba54032-87f0-4b1b-5763-08dd5b3536e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2wwTXloeGdzZWhLaVlyQW9wN0kvYTZSNmdBdnU5SEdkV1lUMi84T05nNEpR?=
 =?utf-8?B?eTlMTkw4NXZSWmx0WExRNGlZc084TS94OWNuQjl6S041YnhQbVp5eWFkK0ND?=
 =?utf-8?B?YVNnSUJydmpOVExtYThYV2xTUnUrOW5NZ2NKdDl2ZzZGY2I4ZlJ2aGhMUWlR?=
 =?utf-8?B?WHg3Q2lMZ0lyL2ZCbTNvaFB1TFNoN1YyVTM5enpTSkIxSFpxSU5nNnczdGEx?=
 =?utf-8?B?QjdYZXAyMC9TT1IrWmRtRXNLeHFlcG5pV0xGZGI4bzdIRTNXQnE0dE9yQlI0?=
 =?utf-8?B?K1dnOWNQMm1GTFRDczlGc2JITTZCdnJuZVcxdmRHaWM5akN6cW03ZWZyNndZ?=
 =?utf-8?B?Q3dzRlVRbjhBWmpXSzJVczhJbndJM0FISXhxWS9uNVpYUFIrRFpNWlErZFFs?=
 =?utf-8?B?aHp4Wm1TVmlBTFg0Q25UZUxib05rSDg4SHVtVjdzclhrTlRWZGdpM2VUNVdM?=
 =?utf-8?B?RUZUU2FvMDFFT2xDK1Z5QmlPdmRrZmllUUtKVkZYZkE1OFVLdE14NGxEcHpZ?=
 =?utf-8?B?VFFqZ3ZDdXo0NzkzOGNoMjRMVjV5eDRuN1ZrczlKQ3puc0JVc1NDc0tIdUJH?=
 =?utf-8?B?bFJCYUczekU0WmFXWFFuMWFadEk3UFJRVUNZcWYxWlBZS3dxbkdlbzIzYmlN?=
 =?utf-8?B?WER2SHZBaHIrbGE2a2I2VXNqd3E4MXEweE54OWdoVEJWdGxQVlh6bFBaNXBs?=
 =?utf-8?B?UEY1czFqSWN4Z0ZRNXk0T2VWTkIwbC9QM25qcVlWM1haN29mdmNDYWFCb3Z1?=
 =?utf-8?B?eDY2S3Y3TEZtYmhJNmJ4dGtsOG9JWUF5NXBBQXdJVEJ0SGwyRFBzWnA3MnZs?=
 =?utf-8?B?dzRqQjdSemdWdkpZTmR0WHFuSHd5M04zSUloZ1d1VmxyenVjZHEzeVJkb2NY?=
 =?utf-8?B?MjZ6VGJUQ0ZUTFdHM085KzhiaFkyOXVKODh6bTVzdUVtTUpDSzVlZXJ3akhD?=
 =?utf-8?B?eHA4R2FDVGpaZTNTVy8wYjJyQnd0U2NuKzZxNksySkJaQkRuVUsvNXRUd1Nm?=
 =?utf-8?B?clQyVnRoZDVvMTNuQ3BtSnEwZEdJeW1randlVjhTMHJIcDZ5MzYvblJvMlMx?=
 =?utf-8?B?dVdYTmRFcHoxeFY3UjVmQ25qa2ZzZXVzcHdrUEJtZXJhL2drcE1jVEVXN3kx?=
 =?utf-8?B?ZHprOTQvTXRxSTI1R0tOS2xsRGppUm94V1BSMFVVOEUzTVJkVmhoVlQ0cG5R?=
 =?utf-8?B?ais1ZjAyMkxaajJnc2JoY0pnZjNFVnVaWHpzbjBvbG1jOVNEWW5PQm9mQ2Rs?=
 =?utf-8?B?NFF5YzQvR2dOSDNYLytpeFFrbGhtWnVyRG9XWnJ6d0kvV3NWZ2ovTk52RGFB?=
 =?utf-8?B?TmRaTXIwdXRERWNMam9CWXhBZzdqdXhDZ1UwRTlON3AwaVJoUmhwakozR3E0?=
 =?utf-8?B?dHdidnFKUUxDdGRUZlJYY0pxb3N5d01JMHZuYVgxSkpwRVQ0bmw5S1VUanRz?=
 =?utf-8?B?SS91TFovQjFNakw2OFR6SUhzSU9hVnB3MHdGNEhsbWgxdnNUc09VcGpDampq?=
 =?utf-8?B?ZlRpVjc4L0tJUW01RDJZS2syd2NocEE5bnFwS3JkOXNtdVo1VnEyVzUxRWF4?=
 =?utf-8?B?SVIrSHh1eGFobW9GNVZKcXYycEhYV1VZK2pwMGF6cGtmRGF3YlNjK0VNVHBa?=
 =?utf-8?B?NDJubDY1WE9JcS9FS3RvNVlrSW1kNlVjZ0g0T3ZScnp6b2pjNVVaRWV2V2Vj?=
 =?utf-8?B?YmhLLzk2WkQ3NXJjWTJraUVoZHd2Sm02VDRsWnhKSExxbldCTk1TbmE3ZUEw?=
 =?utf-8?B?eDA1dXB2a2xlY21qdEcwVzh2K0lNUDFhWGVwSE9Ha2xDRGJiYTNxSGJNamNx?=
 =?utf-8?B?dnV5dWwwejNyZFBlNFM0V3VpdFFiWE1iRkhSbnpyWlo1UUdJc2xJb21ZanpY?=
 =?utf-8?Q?rF1HwcMObAW3Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MENuZXIybnc2U3ZSMmxUSjF6ZC83NEdSWlVSK2h2NnMwTDRseS9FaGU2T1lx?=
 =?utf-8?B?bEtJRDRhNndZY0ZGMlJQb3lGVEMzREFCOE5EanU0Y2xlT0tPRVhzaWdCNEJE?=
 =?utf-8?B?eDE4dUdsQkhYMmhpbVJnUmpXNGp1dVpJc05qUGNNblZ3ZHpCUTZjSG9SeXBo?=
 =?utf-8?B?cGhnMGtCcWMxajhnRVdkMkh3M0VYeUgycVZJWlVGOG1SaG5oem1PS1JrUkFV?=
 =?utf-8?B?TVVueE85RmxlUS9XWVNSRzBma0dRM1pLamg1b0lzNk5udHZPRVpRTHBIb0F4?=
 =?utf-8?B?S1RrbFVJV2RqcTN1TnlmV3hBaTY5UnZIU1FobFRsR0lGOFJEeXA3OEh6QmJQ?=
 =?utf-8?B?b21wNHN1bGJaSGR6YWRrWk1LZDduSkUrS0F1c2FYRlUycEdSMmVTZEUxSE05?=
 =?utf-8?B?OU9TYTdrd1lSeEdjdXAxWi9LWHdxTzJTYjkrZHRva0VSNTBHYk1oc28zSjZM?=
 =?utf-8?B?OXRkdldUa0cxODl2Y21PRkVMNnBvdjZwSlg4YmFpei9Bd0IwNGNFMS9JMlVm?=
 =?utf-8?B?ZEVJak45dFdxbjg5anBwRnFEblV0d2I0Mi94Z2U0YTAyN2wwdUlZMS9CaDV6?=
 =?utf-8?B?QWQwbi9lT21WU2tmSnU3cVZTZWdTUFVDVUJvSVNBQUorRHNyR3FCY01iMkE3?=
 =?utf-8?B?TnpzN0ZoWEhLaTFGNHJ6a3Rtdm1nQ055WjZqRm4xUHkyeWg4aWZCUiszcHlo?=
 =?utf-8?B?NXJJOXBPNGVwNUx6YzRuQjJzZ3d3K0hpd0FUaVp3QjJBVzVyczI2Qm1iSHNR?=
 =?utf-8?B?NVZRVFhsS2FNL0ltek1NRjhhSEVTT202ZkVMOUFVdU9RdUZ3RFRhMlhYK04r?=
 =?utf-8?B?N3liZ0FGWTlRZGFsVlN2SDBTVU54UmVMWVByWXVuMjN6VmlkRVcvNHlhdzBy?=
 =?utf-8?B?eFVSYVdlWkUxdUNKL3N5My82VGZDUUlKMEtNN2VhR0JCSlJFU090cEF2T2lE?=
 =?utf-8?B?T0Z1QWtqZXlrWDlEa1Fwc09tQ2VVVjRDR1lQWDZXVHhIRVNXblg4akRtT25E?=
 =?utf-8?B?YWQ4L3B3UlFQVUhFUUIyS2JXdnFlRGQ4NDI3Y3NxYWNQbnI0RC84cm9SdDVX?=
 =?utf-8?B?cnB1cU45QVJxbXVlV09pZzN2SXF3QmJBZ1Rla0ZHc3hEZUxOMk9tYXhWVGg4?=
 =?utf-8?B?RHNIUzFqcUtpT1lqUlYzMkFaLzZ3R3Qxekdkc0dmK1Q5VFpsaFFOV09Ob2Zo?=
 =?utf-8?B?SFdOM2hLcVBSa0t4SHhRYm9xV3libnIrT2MybjJDd3ljdGJaeEFBbXZFcytS?=
 =?utf-8?B?anhlWG1ncHdEN1ZWalVuaTM0RXhzOFhCQkFqb0tVakJvVDFJOU5IdFpxRkhZ?=
 =?utf-8?B?bWo0VEtWcEZRbWdVZjc2Mmswb2o5MGV0Q05ZSlR3cDRNbkFlbGZOVzhhaEZ1?=
 =?utf-8?B?RCszUTNEQ2tudzJicWhPT0NEVGd3dXgvdjNDZFpWK3Y4cG56QVpvQkE3MDZy?=
 =?utf-8?B?dTU1ODVOOTh3TVlJeUZBR3kzRVZRZGxEL3pCdjdrUWdUWlV4UVk0OGNDYndQ?=
 =?utf-8?B?RUtsRnpBejZLSlQ5M0V4V2dtRnF2WWU5WGc4RDFKd1JWd1p6QWFkWUlhT1hu?=
 =?utf-8?B?Qm9vSk5kZ1VraVcrZWZ5T0dKSVpNd0R0bStxK2lHOTE1MWVUQURKTHZiOWJ4?=
 =?utf-8?B?dzh1Y0x6MzQrQXdWeU5yWVZVMTRrc2dYc0QxQjU3L1p1Yko2b28yblR3N3c4?=
 =?utf-8?B?amlMWDUwL3JDeUlMQ2xjcEJWd25Ba0RMSlM2WW1UU0ZoQm1EVXpBZ29TRnRi?=
 =?utf-8?B?czRSUnJ6UWRpNXprSEIveFdKU24wbks1dFE3cklmbGFLOURFckVaTTBQVmhh?=
 =?utf-8?B?TUlNTkZLQnpqb0tyUU02UHVKM3o4R0J5eFM2S0VabHhvL0tYWmExUkJES055?=
 =?utf-8?B?dEJlRW1DZ01BTFdwQm9BU2NRUG5nbnhrWDZCaUJzTm1ubmoxeURXNktaNnNr?=
 =?utf-8?B?OUhTYzdtcXBlYW9XUkZRUWdGOENOVXpKdkJhRnFzYTlnVktoN2dHRkpjd3Qv?=
 =?utf-8?B?cHZZVVVvNmpDTlFneDZXUCt2ZDczNlEwdmQyNzllLy9YbGRqdE93Q2tZV1lK?=
 =?utf-8?B?TDM3Wk5lR3F0WlhkTHJGZmEzVHJwV1FIMVpBSEZwYy9BQ25nSEwwTlFsbWw3?=
 =?utf-8?Q?Cc6TH/x351XIE3kzhkxKjJdkR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba54032-87f0-4b1b-5763-08dd5b3536e6
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:57:07.2356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0i7iF3H6IQTYXZPcf5dvNVTdsbLVv7Vlr7Aqc4m43iFWABTgOny4LGqHqpvTmpt8neDaqiB04r9ZI0QE6c0uIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974



On 3/4/2025 21:02, Ilpo Järvinen wrote:
> On Tue, 4 Mar 2025, Shyam Sundar S K wrote:
>> On 3/4/2025 19:16, Ilpo Järvinen wrote:
>>> On Tue, 18 Feb 2025, Shyam Sundar S K wrote:
>>>
>>>> The PMF driver allocates a shared memory buffer using
>>>> tee_shm_alloc_kernel_buf() for communication with the PMF-TA.
>>>>
>>>> The latest PMF-TA version introduces new structures with OEM debug
>>>> information and additional policy input conditions for evaluating the
>>>> policy binary. Consequently, the shared memory size must be increased to
>>>> ensure compatibility between the PMF driver and the updated PMF-TA.
>>>>
>>>> To do so, introduce the new PMF-TA UUID and update the PMF shared memory
>>>> configuration to ensure compatibility with the latest PMF-TA version.
>>>> Additionally, export the TA UUID.
>>>>
>>>> These updates will result in modifications to the prototypes of
>>>> amd_pmf_tee_init() and amd_pmf_ta_open_session().
>>>>
>>>> Link: https://lore.kernel.org/all/55ac865f-b1c7-fa81-51c4-d211c7963e7e@linux.intel.com/
>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>  drivers/platform/x86/amd/pmf/pmf.h    |  5 ++-
>>>>  drivers/platform/x86/amd/pmf/tee-if.c | 50 +++++++++++++++++++--------
>>>>  2 files changed, 40 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>>> index 41b2b91b8fdc..e6bdee68ccf3 100644
>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>> @@ -106,9 +106,12 @@ struct cookie_header {
>>>>  #define PMF_TA_IF_VERSION_MAJOR				1
>>>>  #define TA_PMF_ACTION_MAX					32
>>>>  #define TA_PMF_UNDO_MAX						8
>>>> -#define TA_OUTPUT_RESERVED_MEM				906
>>>> +#define TA_OUTPUT_RESERVED_MEM				922
>>>>  #define MAX_OPERATION_PARAMS					4
>>>>  
>>>> +#define TA_ERROR_CRYPTO_INVALID_PARAM				0x20002
>>>> +#define TA_ERROR_CRYPTO_BIN_TOO_LARGE				0x2000d
>>>> +
>>>>  #define PMF_IF_V1		1
>>>>  #define PMF_IF_V2		2
>>>>  
>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> index b404764550c4..a81c661abd7e 100644
>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>> @@ -27,8 +27,11 @@ module_param(pb_side_load, bool, 0444);
>>>>  MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
>>>>  #endif
>>>>  
>>>> -static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
>>>> -						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
>>>> +static const uuid_t amd_pmf_ta_uuid[] = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8, 0x8a,
>>>> +						    0xcc, 0x2b, 0x2b, 0x60, 0xd6),
>>>> +					  UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d, 0xb1, 0x2d, 0xc5,
>>>> +						    0x29, 0xb1, 0x3d, 0x85, 0x43),
>>>> +					};
>>>>  
>>>>  static const char *amd_pmf_uevent_as_str(unsigned int state)
>>>>  {
>>>> @@ -321,7 +324,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>>>>  		 */
>>>>  		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>>>>  	} else {
>>>> -		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>>>> +		dev_dbg(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>>>>  		dev->smart_pc_enabled = false;
>>>>  		return res;
>>>>  	}
>>>> @@ -390,12 +393,12 @@ static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const voi
>>>>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>>>>  }
>>>>  
>>>> -static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
>>>> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, int index)
>>>>  {
>>>>  	struct tee_ioctl_open_session_arg sess_arg = {};
>>>>  	int rc;
>>>>  
>>>> -	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
>>>> +	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid[index]);
>>>>  	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>>>>  	sess_arg.num_params = 0;
>>>>  
>>>> @@ -434,7 +437,7 @@ static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> -static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>>>> +static int amd_pmf_tee_init(struct amd_pmf_dev *dev, int index)
>>>>  {
>>>>  	u32 size;
>>>>  	int ret;
>>>> @@ -445,7 +448,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>>>>  		return PTR_ERR(dev->tee_ctx);
>>>>  	}
>>>>  
>>>> -	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
>>>> +	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, index);
>>>>  	if (ret) {
>>>>  		dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
>>>>  		ret = -EINVAL;
>>>> @@ -489,7 +492,8 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>>>>  
>>>>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>>  {
>>>> -	int ret;
>>>> +	bool status;
>>>> +	int ret, i;
>>>>  
>>>>  	ret = apmf_check_smart_pc(dev);
>>>>  	if (ret) {
>>>> @@ -502,10 +506,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>>  		return -ENODEV;
>>>>  	}
>>>>  
>>>> -	ret = amd_pmf_tee_init(dev);
>>>> -	if (ret)
>>>> -		return ret;
>>>> -
>>>>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>>>  
>>>>  	ret = amd_pmf_set_dram_addr(dev, true);
>>>> @@ -534,8 +534,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>>  		goto error;
>>>>  	}
>>>>  
>>>> -	ret = amd_pmf_start_policy_engine(dev);
>>>> -	if (ret)
>>>> +	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
>>>> +		ret = amd_pmf_tee_init(dev, i);
>>>
>>> Any reason why you just pass the uuid pointer as it seems more obvious as 
>>> a parameter than something as vague as "index"?
>>>
>>
>> The objective is to select the appropriate Trusted Application (TA)
>> binary from the /lib/firmware/amdtee/ directory. This selection is
>> determined by the UUIDs listed in the amd_pmf_ta_uuid[].
>>
>> Typically, the most recent TA version should be located at the first
>> index, with the next most recent version at the second index, and so on.
>>
>> All these had to be done so that we don't end up in the version
>> compatibility issues we had encountered last time.
> 
> I'm sorry, my editing messed the meaning of that comment up (I forgot to 
> add the "not" word there). I only meant that you could pass uuid pointer instead
> of the index.

OK. I can respin, just to make sure are you expecting this?

//ret = amd_pmf_tee_init(dev, i);
ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);

so that I propogate the uuid to the export_guid() rather than the index?

Thanks,
Shyam


