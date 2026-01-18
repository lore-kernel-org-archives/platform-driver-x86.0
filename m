Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FA71E32A2;
	Sun, 18 Jan 2026 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768749611; cv=fail; b=ZlLyELpilMzlEYALrKxtpag0gAXmAeMvNVWDOaz1i69EAzGuSBh9DI+EOupklovpZnWLq8nUqD+2rF1rJUwLaGbQhbHEpc3sUVEMoXAT+Ov0LDhyMjC/HBAu2S1DQaWV4yYSv6hY0kdhQ+w0zXlvhSzkmfjAvubXN+7nljHoZLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768749611; c=relaxed/simple;
	bh=Swn3DGHx93qyo+cXfG6QTXWq5aHMThXOV7jq9LHPp24=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mxqqgniPgJlTkozGxFRYCE9Xo0dzP39+D6XNw1j3tbINKtj4cLDaVcfUJSbOfiHBbEJOXw6Y8yoPDfsiuAo9H9m9SLEL91kR5tl0mvsjlAKPjIinJSDhQ9wR90n1bNWShKj5gvzjt+DfYo6Tufs/4zJ1MMzOFJKrixzBUeU5EUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vmCVnFPG; arc=fail smtp.client-ip=40.93.194.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vmCVnFPG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMbvra7Fml19yzZ0UObZZPrzdVYw2I9e8OsqWqrwuopVw4/n698ES8iNRWKPatYbC0/CKCT1PkQFTPyegHfgmymtlqIVhwalvIJPwzZgeDYZs3vEbdwQ++AiFFtL1apgkRlK4D2/f/DqIUuRL3BDzk/n0s0aJ3WDgVOT9Wxxbr0dvLi/ku1j/+UHx8MuLZWO0Gtk0H0K0eHK/dm14MIywTYQYHO4aZkCm4HapH2D2gmzGsN3W45enAmCWUftwlH4GWTrtWRif5ziAbtc7Gz2ax8N9JhNRKBgxDmqUmozmHpNDOTEPUGIfcJjtUJMvxwgNZhT+Q9gBV6lOwst+bbyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFvOnWUAtZq1TmDPmv4K6qYUMx3+4vy6VpP2dV9Saic=;
 b=Gl8Y4uzqaGWzj13KkYKq0n/+mktuYCBeZjnG454RzqwFkDa/BlHBHJXvARfnew+6lmj3qt8Yq+klfDIDzDNewkkOYYktzknpKxJwHVo0s6kcmKPk6COSZCMiNmu3oHBzp3B79rEtc0JYGSa9KCw5xJVPg1x3r85jY+SgpzvB68UMVxIpnk0OV5hlN54kzFrNELh7CW4DNnM5AbtPlW1uQQPRGzcZR5YOmvTmjYK9klIG6JyqRnVZYIa/NYGd4x2nd5my62x4XmsZIPRz4o6nU93yodwwXN3EvxTxmWBdnlo4vI1hKSib7BT217iFHScn9r7tmfdYLFyC0nmg7L01hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFvOnWUAtZq1TmDPmv4K6qYUMx3+4vy6VpP2dV9Saic=;
 b=vmCVnFPG9QhfshU9HwIW7DiGfMwGtMlSqEDwHaGRLsEKMFOd/C7Ol+xQ+nrDFpl7lJzzQnW4KF3V06ybK1rbQfImJ1a9X/uZW6OrFN6HRzKe7pNgX2kWAUVPzqgSvJiMeBEq8GQbCDBPVrX4A/vtZo1FWXjmz1wC1wenHp4y3ok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Sun, 18 Jan
 2026 15:20:07 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::91cb:8f10:c6d2:d683%5]) with mapi id 15.20.9520.009; Sun, 18 Jan 2026
 15:20:07 +0000
Message-ID: <35a7f364-a89f-4625-82e2-03c1fb42ec74@amd.com>
Date: Sun, 18 Jan 2026 20:50:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/amd/pmf: Introduce option to disable
 Smart PC function in PMF
To: Alexey Zagorodnikov <xglooom@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20260117200819.12383-1-xglooom@gmail.com>
 <20260117200819.12383-2-xglooom@gmail.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20260117200819.12383-2-xglooom@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MW4PR12MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: dd0cc352-42f8-41b3-f638-08de56a50faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDZTaXVUNWh1d1pIREJnY0dhakN6R0ZDb0VlbXIycVFvdzdYKzZXejg1QW52?=
 =?utf-8?B?TVFoOUljdzJtRzZGd20vNFc1YW9FakVOb2hEWjVWTjVZd3lsOFpNSFNSWnNt?=
 =?utf-8?B?YkdjY3R1NVZPZlErQWJJelBvR1kxeWlXdjNxYlhTRlpnUXIySDJvdnltdkph?=
 =?utf-8?B?SjBzN1BhRkJyR2hkaVRySk52WitOaGxrdUtHcTczckJYaDBYYkowUEFVandJ?=
 =?utf-8?B?SUtjT2ZRZUwrM3BmQk9pWEtaSHh1RmZYQnJwODEyWEZLQVorcmg2bk1zOGdF?=
 =?utf-8?B?dThOckJiU01RdTUvOVhaYnRlaWtxcUZSd0NIRVZLaDNsQzN2ZHhnY0ZOalJy?=
 =?utf-8?B?bjZxSm5xbjhFcUhncHdDMk4yM1JOZXJqQXJoY1ZIanBWei9PTnhtUXFreDhB?=
 =?utf-8?B?NzN3TTd3bUNVZmk5TFB0SVdDenNNeGV0MUJSbHBTUHVVMlZ5dVBoRjRhbHpx?=
 =?utf-8?B?NW4rTjhhL3pTMlZEYzNNaVhmSk53TmRrMUx6L3Y0WGhwekFWRThsSTNMc2ta?=
 =?utf-8?B?d2hmVWJHTFk5NEozUGpWd0s4SDRwdFVOYldBL1FLWnNES3NGRHIvSXJST3Er?=
 =?utf-8?B?VzQzV2trL0tUUVhlbS9iNmRpd1NjRUJtcTkvNnk5SkovVlBYZkZWSGJ1OFNK?=
 =?utf-8?B?NWFIZ1lxTXcrZC9nckM3MVg4dDJySVVSUWpjZGwyeFRLQW53ZWhCcEpEand4?=
 =?utf-8?B?VFd0RndrM29yK3dzNkFzOTU1UnZDSnR5bmFLejFBd0V5cVNZUHNGS0JRTGZK?=
 =?utf-8?B?dG5JMGxrU3k4MlBxQU1tMklTemtGd043dmwwMjlqbUxCRk03bldCcDZYV21s?=
 =?utf-8?B?eTg1WEtQUDRnak9CVmI0SU9yMktLYjh2L0dsb1ViYWRhTitCRHBwNGs0dDlx?=
 =?utf-8?B?TmEzeEhuWTVVK3VNbmwwNlpvS1VUSDZrVnJKRENwanJGQnFGMFJXWEMreitP?=
 =?utf-8?B?TndFZ0RNdU53TTFHeFZVZEZnKzl2ZS92WW1wN2tjczNmc0V6dVhseGI0Y0s0?=
 =?utf-8?B?WHBsSDhZa0trMm5wMGMraWFXWVVKNEh1V0luY2lKS3FRLzQ5elZjbHdrVVdZ?=
 =?utf-8?B?aVV5YjhRVVUxVXNucWtrMTQ1WmxZcVlBdUJEdXlpcmpXWFZrZEtzYkNnM085?=
 =?utf-8?B?WnB5a3JiSisxRk53SEVPcTRUR2RvQ3Z4bW5BWXVkRjMzMXF6VFpNSC9jZnFS?=
 =?utf-8?B?K3dVQUwwRkZvTGlBVnNsbGEwUUEzQjNEZEZaZ2kybjBCWlZVLzFZcm55WDA5?=
 =?utf-8?B?OTR0em9ZQU5abjR5S3dlNStPS0htaHFuVVdBaE54VXV5VkgzWWM5MHFoODJU?=
 =?utf-8?B?VDdmMzR3anBSem9OM0ZZZmtuS2wyZk9KNHVwaDFoWmVjRkVzR2FsZ0d4bFdM?=
 =?utf-8?B?UWNFTWh0dzNqZlgwUmdTR0htbWJsbVF0ZktlelVsSUc4TlNMZDZLSFZLbEly?=
 =?utf-8?B?dGdDQVJ2dkpxdE1EYlZoWUpvS3FFcU5rRDNtMWIxVlkydlJoZjc3N0xpQXdI?=
 =?utf-8?B?d1lBblAwYTJIakxyRUpjWHFEYnl2NEZpdS9ocVJzZ1lMaWlJOWduYktLOHdy?=
 =?utf-8?B?L3Z1TlRBOHFuWDRsd0tZUThiVm00bktsTk5ndEhsZC9tQWJrb1hGeWRncitQ?=
 =?utf-8?B?M2Z6dDFiTE1zRDFvbzh5SjlSdFhQZVBnbVdrVU9uVHpSUUwxa004Vm1uK1B0?=
 =?utf-8?B?L2QzcnZKaHFtRzdHUGNTejNmWW44Wkg0S2tueHdabFYzMGEwQU1oZS9SdWdJ?=
 =?utf-8?B?dCs4dElIbXNkUHFuVUhRRzRIaTJFTUU2WjVrMk1oQ2tRd0k2VmJ6RXlSdDlV?=
 =?utf-8?B?b0k2dTNEcWtnVU4wb3FsSHRVeS9lMGFuMkxjMmNQcWdRMklmWTRFQ0I5OThQ?=
 =?utf-8?B?dno4b1Y1WXNmaEwzblJBb2RObkphdHE0WHUvUnk1eTdFWlEra0FVYmlZR0lL?=
 =?utf-8?B?bVprUm0rYWNmckFUSUd0MEZYNnFDeW5sMVVuUVo2L2N1VTNZMmplM1FWTklT?=
 =?utf-8?B?OWd3d3A0d0hmQkJnNjdmUThYTGQ0ME5QY2RYK3N0SkJLMWpacC93d0dXWGlU?=
 =?utf-8?B?bTFIVWtwZkFJVU56amFyaDFoL0tRMkpWM3oybEhNM3M3M0s5dk1LLzNIVFJy?=
 =?utf-8?Q?B4bU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1VRTmVNVzM5MlBTODl1RjJMUGMxOVR1QUE1STc1RjFzRlIyS0Z3TCtwd09O?=
 =?utf-8?B?WDVxeVlBSkRmV2JnVy9Wb0tJWDEveXIxL1NuT3oyUEdMWnpnZ2VxbmFJdnY1?=
 =?utf-8?B?eHFvVUh6UWZKaXZHRENkMm90YnBhaDEwV0xIL2dZWEY1VTRQc3p1M3ZPUzF6?=
 =?utf-8?B?ZDFjdjRHMWdYYldvYmtaQUYzYlNpemhyYjVvTWxTcWVyeGh0UzhTNWR3eXJW?=
 =?utf-8?B?c1dNSG1yT20ybTZtNUNZSThCVFVOQU0rczgxb013R0F3ZzBOMDRqMGRXa0x1?=
 =?utf-8?B?N0xsK3Fta3FQb3ZyZ0M3NzZKRzZMLzVmTTFnRUdYT21EM1V6QnUxS1l5ZDhD?=
 =?utf-8?B?NitKTzA3cHgzZ3pwK2puQy90ZEJZdDdmRi9DK3RQV2FzTzJoMUtsazMvTGdM?=
 =?utf-8?B?RDg2L01xTkphSGpYUVhxcVh1UFgwMEdUQlRGRHJnUVcrTWFVc2xiT2UwRU5j?=
 =?utf-8?B?a095RDMrWlpDVXJPWENBQjBPOGh1dExSUnFRUi96cFBjaE1DaGFranU3WjY2?=
 =?utf-8?B?OEhpVzFZMlFsbjM4Zmhoa08xSDFhNlJZcGo3L1VGTVc3L1kzTDQwVk9EM3cz?=
 =?utf-8?B?RDRoYVgzQWcvQ21kK29SYlZURXBWQmZEYWlGdGdTREUxN0dSSDVJQ3hIQXVO?=
 =?utf-8?B?VGlFdHZMb1pmSkdmSmtvdHFUNjgycU1La0xoeG1JOVpDNkVaVm94UHlNNS9s?=
 =?utf-8?B?N05yaHBHZ25Pak54aVRsMFZ1OVN2blhNRDRKbDlBb1lhdGpkUkxLZDNBVWxk?=
 =?utf-8?B?V1B3eHJ2clBTZHhiR0tjSVd5MFhrSlRWWnFJaldyZHhMdTlnRGJxUXNmNWZi?=
 =?utf-8?B?VGsyRy81VzAwTkloVXZpWWVOV21DZ3NuU0c4dW1FSmRRR0IzY3hvVGJGK0JS?=
 =?utf-8?B?Yi82YnhjQS9yYzBrOXJINTZ1eWk0N0Z6bjJwS2RYdnhUNEZKL1FXMTB5L1Bk?=
 =?utf-8?B?TEs0clp4Q1lxM0JIYk9hSVBLUy8wZ1NIdXl6SnB4VUNpTkhvTTFHbWhOWkZY?=
 =?utf-8?B?TkQxWFBTMGRMQzRFVm9NMlJjSWM4YldLSE1LWkwzMUJqM2Rsb2ZlY0N2NVVY?=
 =?utf-8?B?M2FFZ2hUV1JkU08vRzBBWTRDcjcwbDR1ZTBudzRpTmRBOUg1eUlkK3k3d09R?=
 =?utf-8?B?akhTemg2T2x3NTFqT1U0SUduWll6R0ovQXRhRmxFYWJhclZkT3RIbFAxdnlR?=
 =?utf-8?B?NkZybi91d2VNSkZvcEdZdDA4QkZGR1U1WVg3TjI2MTJZS0NUK2UxdWE2Yysv?=
 =?utf-8?B?b1pKMzdGU0EwREh4ZG1BaFErQVRNdjBmVjBSYjQrRXBnM0NmY0ovMWx2QzJr?=
 =?utf-8?B?ZUNWTEJXaE5IanIzR3pqSndOaWF3S0dSWURNRHc4aytiYUVtRUw2VHR5aFZL?=
 =?utf-8?B?alUxc2UyR3BYSk9HaThMd0dMNnVCOVBOTEZMVXNPK3E2bkVPQXdkbGY5ZVJH?=
 =?utf-8?B?RFNqcXdTaFZPNlcwYVZaaDZHS0toTTRWVC9DaWVPeGR2QlloNXg3dFgyaU5t?=
 =?utf-8?B?alpINEVpQVVaZWJsaUZueTluMkZZR0owbFBqSzZrL0xmQW5zdUdnako2NytS?=
 =?utf-8?B?aEdCanNtc1hMK0tpWUlNZm9xWk53SWFoSXd3cVpvTHhaOUV6U1lzT294MGpv?=
 =?utf-8?B?UW1FbjNOSHlyb3NaUDBCdnZZNmhQUmV3WXVKU3VvNFM2akl3U0NFZSs1Ykx6?=
 =?utf-8?B?aVJUUk5NNW1XTVdHTVZuOTRwK295aXZOZFRyWTQ5V1dxVWpsTTZka3pGRGtH?=
 =?utf-8?B?QktMUWhUU2Ivc3dTdEprdXZJNkFVYTM2anVWck1vR3plaGxxbFhIRm11a25m?=
 =?utf-8?B?VE1aSFdWWmtaRmtlNDZmQUZoSnlnaEI1cFE1Y1VvRCtoMjJMUHRETVVsQU9x?=
 =?utf-8?B?NXVTUmdaR1lIQ29waldnL2lMcG9YWnZ0SngrNlJ6SFJwTGdaNzZkeHpVODA0?=
 =?utf-8?B?NXVRMW9CQThEclF1T0ZQQUNOWWhhZFJVb1pMVUZrc25tdUJ2VFZ5eUVMVHNW?=
 =?utf-8?B?RmdYNG56SWtqbnprZ3JQeUlicDU4V3BFM1BIU0NHWU04VkVsbjVBR2hsYjNR?=
 =?utf-8?B?U0VLUGl3dklVQmhUNmhXRzFWQmZ2S2ZFZFRxQjNSbDE3UE4zN0hEY2JOL1FQ?=
 =?utf-8?B?UTQwajFzMHRIY005R2trbEVCNG5MczRWOWVFNkJDcG1DT1FqbWdsVXJ5VGZB?=
 =?utf-8?B?cUZMNzMwOUpUS1FjVVpuMk8wYnhrV2oveWs1L2IrQ3ZLYjc2cWZiUktCQTB0?=
 =?utf-8?B?ZGM2emx0cWE3ZlFMbjRRVmpKQ0hIbVBhbUpSN1hmM3FHSjlLcE5YSGpRRWwz?=
 =?utf-8?B?OGRuNld5eWxjeEgvUGdEdnZzdXpRRUhXNzh4U0VIMGZMS3ZVbDJNdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0cc352-42f8-41b3-f638-08de56a50faa
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 15:20:06.9072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a55tulkGhk2NoGFKMYLGTqY11AzEjKUQ/tbkkcS0/EjSvttCdh8ZSsscYPEC/drP+2Nzv4H5MjiovBEdIGVJ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7334



On 1/18/2026 01:38, Alexey Zagorodnikov wrote:
> Signed-off-by: Alexey Zagorodnikov <xglooom@gmail.com>

Please include the context in the commit message instead of the cover
letter. Additionally, if there are any bug reports or issue tracker
entries (e.g., Bugzilla) documenting the problem this addresses,
please reference them to provide justification for the change.

Thanks,
Shyam

> ---
>  drivers/platform/x86/amd/pmf/core.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 8fc293c9c5380..00a4fc899c727 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -53,6 +53,11 @@ static bool force_load;
>  module_param(force_load, bool, 0444);
>  MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>  
> +/* Force to disable Smart PC Solution */
> +static bool disable_smart_pc;
> +module_param(disable_smart_pc, bool, 0444);
> +MODULE_PARM_DESC(disable_smart_pc, "Disable Smart PC Solution");
> +
>  static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>  {
>  	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -362,11 +367,15 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>  	}
>  
> -	amd_pmf_init_smart_pc(dev);
> -	if (dev->smart_pc_enabled) {
> -		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> -		/* If Smart PC is enabled, no need to check for other features */
> -		return;
> +	if (disable_smart_pc) {
> +		dev->smart_pc_enabled = false;
> +	} else {
> +		amd_pmf_init_smart_pc(dev);
> +		if (dev->smart_pc_enabled) {
> +			dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
> +			/* If Smart PC is enabled, no need to check for other features */
> +			return;
> +		}
>  	}
>  
>  	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {

