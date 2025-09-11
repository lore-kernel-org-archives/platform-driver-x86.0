Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED391DBB13
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Sep 2025 07:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757576304; cv=fail; b=TPelYSYb1lMthLoMDU1of/3y+UkuExAR+fykFafFqmEdTrhVkLtXPi3KriEk+W8DnpYS/r4evDNCOa3/UGWrm3a1GW6dovHIZUs2XE1hdfOFKli/HDf9P2N4ROtD2uh0ncL/Aju8FOa+J4irpXgtNiGUYukMN+QN+jLPpv3k1QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757576304; c=relaxed/simple;
	bh=WqYebAHs985k99qO6MUz45N/ALuW6X7vrDxbqQJMC4A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L8l9EsT9xyEaKfca3+S6zKm/CozYMyZL7wWOvX+22KCqzjvaOJGzC++k4Y+mJgTWVNX2dzZ7Q21oMynGWvQaen58X3YuqNOfvR3nxYgppogZFkjhiMLr2tR8k3q56WxvQWHBTag2Ulw1BaLlGP7LafUT1nx1o2zhYZqKH5/A42U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eaph/nGw; arc=fail smtp.client-ip=40.107.93.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eaph/nGw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXMQwSGwQg8+86Jm3cDUpaozY+nVTweW6IiFdiFlr9t4bHcyGUtwCQuf5grF5iq5lPXTE5vpvFTfOuLpzpzAyQBGU6Aj3wy8dgy7zWC6GiVMHBl1fRNhSXcljFumiwl9vvDFjnzxIZFOubVNNKU7ww958tf4vhEn4jVMwcC+5Dbi3DFiYZ4Eg18Rkk4iQzpsoKEveiThvIJ/RnjWceFpsEpQ7OZROH+gyYjKguXEJjayyLZ/r0dsXgtsubb1WZzdJLCFRXmMEs5/mUDVRjDEhB3TWOy6lDBtueNCxTeQ2CMJK8dMekaiT+3I58IiSefwutbD4E2vlIeKKTeVvpzC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GtIODzTKfN26G5f0U3nP+V0fs+xDPaD9XtL/6O/BeM=;
 b=HH9iKRyNMSeZTD0nmdles+ZQEOPcvKUd8OVOrfmA63dklqHs3orocsFRgNgLMdbvLN2JeMaG5/m6PVa+YafcOqqQprh8yhU6Nj7cRRt7g1SnPqPnRbN/6fVH+XDbrdDa2sAhGevSOtiNiPNflS5qqU7XvEOFK+zv9rrAeJBENz+/qz0EA6fHZwEq9hCdmQ5mBElWVgwLK4iKij16y1bo3RAN+SGhfoCNJyXe5oD4PFzPr+CLAOcyRF7F1gy7Xc+4SOWmzVS4p53Dy+O5TaChlyeCHo/E/ONg8gtnxKQHwB9Kla9WSLHrsZ6939Kexi5hacp0IzZJR6eB8BbFfq2fKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GtIODzTKfN26G5f0U3nP+V0fs+xDPaD9XtL/6O/BeM=;
 b=eaph/nGwt/f9wEpImevJTcOFfveu03mmYTixLErjMDX06HqytESS6kfJKrDUCOADLNDJzqFSrkfmsnIF4Iu1RjgyFE9UC6gDX6VIHnAUz6So9UPyc+vuPWsG/KdXTOHWVNJ76rDxAWAALlY8X0HnHzu1WqsuPORocXhu4ywciDA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SJ2PR12MB8956.namprd12.prod.outlook.com (2603:10b6:a03:53a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 07:38:18 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 07:38:18 +0000
Message-ID: <75f525f4-7ea4-4083-9777-46852c1007ca@amd.com>
Date: Thu, 11 Sep 2025 13:08:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 6/9] platform/x86/amd/pmf: Add custom BIOS input
 support for AMD_CPU_ID_PS
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com,
 Yijun Shen <Yijun.Shen@dell.com>
References: <20250901110140.2519072-1-Shyam-sundar.S-k@amd.com>
 <20250901110140.2519072-7-Shyam-sundar.S-k@amd.com>
 <2ba64be3-34c8-b9e5-549a-8548571168c2@linux.intel.com>
 <7f93331e-0576-40f1-a692-9d41da778dc9@amd.com>
 <6287dfa9-9938-278a-fbc1-e3b142c42a3c@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <6287dfa9-9938-278a-fbc1-e3b142c42a3c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0116.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::8) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SJ2PR12MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: df0b4522-e0d0-4dee-900a-08ddf1062d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHJsdFgvUXRUNWd4SG1mRjQxeGhoVzlGRzRkZ0VVV3ZkTjV3OWhSK3FnWXFJ?=
 =?utf-8?B?eWdFTklYYytsL3dQd1RTWkltZTZtL2h6RVN5a0R3bEhGbGlhd1FESjhxTlg0?=
 =?utf-8?B?dnZLRTZYT01jdCtwb3dDTDZCalJDVmdFUXllSnluOHh2bE1Bb1dQMTlPVEV2?=
 =?utf-8?B?UzdmbjBldWh1SmdVN0RVcnFidDFsVlIwN2hGMkttL0xwUHdLUlp5Y0xGbnp6?=
 =?utf-8?B?eDBqV1FHNjBVZldMV3lybTlQbDJKWmx1NTBTTTBudUwwWXY4SWNLOGpCSG8y?=
 =?utf-8?B?anJSU3ZEQXM2a09xNTNYeGhBblB3bWR4bFpqYWU4TkNUbTM3a3UydnBDUVc2?=
 =?utf-8?B?MXUySzgyVVBmbnYrZDM3NHdreFE3YmY3Z25vUnp5ZlA5UjRhTlRNaVZlR2w3?=
 =?utf-8?B?eHJTV3BuV2FGaXJIa2RJZUVZaklZT0lHZEhjUWd3alRkRmVLYjV0ZnFyMTRN?=
 =?utf-8?B?WTE1WFN1cDZDczR5NEZqYjg1ZHlpaXZyVHgvZUJaVkRLSHpQRmRXZG1KOVhl?=
 =?utf-8?B?bEVqWTRTUTUwaXFVL2VZYVVPZ09hL1FiV05FbngrdGdLU0FhcUtmQ1VEdXhK?=
 =?utf-8?B?M3Bxd2RKWnMxSUhJV2NjSFdhcm54eFliSlZMVkMxMzZYL0RPaUpqdGRJS1JV?=
 =?utf-8?B?SWw0UlFtalFyUXo3VkNDOE1NQUlPdzVaL0ZJdjY2aTZ5cWl5TEhKZ2tqUnpv?=
 =?utf-8?B?UGFkK09OKzRTek5HV2tNelNCZjRjMm1kUWdIZnE0UW1oSUNqWHE5V2pZU3FN?=
 =?utf-8?B?YngwdldHTExRUVlGOERxNnVTTGJOVEdHWmxXY0xucnhnWE9QeEJhWTlnSHBP?=
 =?utf-8?B?TXdzd1ZFaGJQRllvZmdGdm9iUHl4aWpQSzFjL0krWlF6U2dyUVl1OEVRUmNN?=
 =?utf-8?B?aloxdk5VQXlHaFJwc0tmZnZkZGcrTFkyNzcxVEpKWUlVQzdaT2M5aTdiOXE0?=
 =?utf-8?B?Q2ZDR2RYNklOOCtYT3M0STluYTYxTENHSDg3OHZoYmxLRWdXSmRsOFcyTFJY?=
 =?utf-8?B?QWkxMHpFekZSNmlzMFh3Mmk5WGlwMTBkdmNxelcxaFdZNHR3TXNQdmZEMExX?=
 =?utf-8?B?SW9IaXJ6V1UzL21DblhZRzdMYk5wa2tSOVpMSlE4cjhTNFpDZnJNNlB5blVZ?=
 =?utf-8?B?SlJhY2N3anp5TytOWXZibFBhUm5yZkpVOGhHNWJzdDNxTHRpSlZwSG1jTEtL?=
 =?utf-8?B?NkNHQmc0bnZXWlNKNXM2eXpxTFR0K05lQkZOakg2Mzc4RmZRL2Z6SEpDenNU?=
 =?utf-8?B?Y3JEV2tpS1RvUXJTY01uL2ZZbUtZWW1qWXRnUXFoTHZ4aTVteTVOWDJxZDV3?=
 =?utf-8?B?OUVPNlgxa1VVaU1lK1htU3FWZ1N0WE5KNEdVTTl6UEx2a3o3U1EwMDhlQUZO?=
 =?utf-8?B?S3RSdTlyNXlXUFczQjBtS09XeFZiYkhPeTRNTVQwbVFTUmZlTnFFREptKzZT?=
 =?utf-8?B?Z1JuZTZYVHoxc29jNjZpVFdjVkh6WWZSOVloZW9XN21EMGh4SFA2Q3ZaQm82?=
 =?utf-8?B?THV6cU1ZMzhMQmE4V2U2bkJBVmg3b0dxY1d6VXBzWFlZcXpZZmNnL1Vla3RT?=
 =?utf-8?B?Rk1idElZUDIxTmlrQjBzNU5WWmJVdHlPR0Y4SXc4T1RvdDJWQnNBZEExWmcx?=
 =?utf-8?B?WUNmOEJpTi9ROVFvUjlxUWErdXZHQUUzY0thdXdJNFY3WElMdzQ4dU9uM2pN?=
 =?utf-8?B?TDNWNEE0N1htdTB2dGxDNjFVKzA5bWh4aVFkUVJaVE1pYWYySVpjRjlEYUEw?=
 =?utf-8?B?dE5CM21lZEpsdTFJbHFWTzF1OHR4RTkxTElXckRKTFNOUGFMZWVvRUNWZXh1?=
 =?utf-8?B?NG1MTXBUU3dHVmtyeXhlNkVxT25ZNDF0Q3VWNW1QMHlabUV4QWFMaVlWemFi?=
 =?utf-8?B?b3lhYWhhVzc3Q1JpTWo0Y3FGVGVxUmZyTnZPOVFyM3hhN3p6a0ViZkVFOXEy?=
 =?utf-8?Q?Xu38ZRScXfE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0o1amJKUi9kdVFzSEQwdkYySk1WUjFRMFg0R0p6L2J4NGdISkx2MXlUM2J6?=
 =?utf-8?B?NDBEb1p2aVllZ25BOEx0TVA3TDErUDN0RGlxajVuVjMyZU82K0RKNTBYYTlZ?=
 =?utf-8?B?cys0Q0M4ZDZPb0ZnMTJmc1JHU25aMlVaSU1qbnZuT0h3ZHJGQUZjcyt0TU1a?=
 =?utf-8?B?UnBaVW9DQWNYbWVWd1duSGpxcHl3SUJuREZsUnRYakNnK3NKZC9VTU1IaWYv?=
 =?utf-8?B?andFUGJuMEpybjB6dVFpQjNUV3p0NytEeUsrS2lVMUo1SlhreDYvanFVcGRq?=
 =?utf-8?B?L2tnYnF4NDYxLzVCd0pwZ0xML1VUUEcrN0tyYzRkdTU4YVpDZldxWmFjQm50?=
 =?utf-8?B?U3hkalNpb1FvMU9pWmFHOG50YUtUVXpVSmhaVkN6VDJVZkZYWE5IS282bmtR?=
 =?utf-8?B?OEZUODRFWHVCZGE2QVFsaUhwTm5FVk1QTVR4UEFpOFlGdkNVS2lTSWxUVlJK?=
 =?utf-8?B?TDBTR1pVeG1XOFEyZjhMTGhsV1BndGNLZzdSYkV0M3p6ZnEwTU9sbXhpNkxK?=
 =?utf-8?B?bXI3eXlUYnhYU2k4NmdGd1ZXOHhDTE9uWnkySTgrV2ZLTHRlZjQ0M09zUFJa?=
 =?utf-8?B?SHc4b2JIN2xhclFVbldCS2lRVUlGV3NZWDMySWo2dVk2Tnh2R0RRWVMyK0hy?=
 =?utf-8?B?ZW9VREtEWkE5KzVNbVBVZnRDYUN4eHFMdUlFeTh2ZHlxQno1Z2lLYTYyajlx?=
 =?utf-8?B?cUxKMEJkSnZzRCtWR1BXSWlRL3FNeTgrU0ZEc0cwWllqVXJyR0RhSFB4aWJs?=
 =?utf-8?B?RUQrbWVaUVU3U2F5NVJRSXh6WFgyV0xsY083c1J0Q3pubUJGZHNvVW5TdUJi?=
 =?utf-8?B?cFlzVkp3N2tpNmcwaDRudEovR2xqWTExZlFvcnZ5SjYvZHBpL0xPbnpuUURu?=
 =?utf-8?B?amRRbVZSWDFpMk4wRmV3akxjNExFbjloMFI4U2h0M0J0aDZUaGQvY3VlUmRa?=
 =?utf-8?B?bENJcTU4azVxWkx2UThUZ041QTBibldVRXpHM2lsU0kxTkVBdTFRZkRTcUQ2?=
 =?utf-8?B?c3lHV2VUWFc4R29VVUlxc0pnWFhzQkpKb1c0emx2TFB0c01MQkM3VDBNeVBt?=
 =?utf-8?B?eW03UUF2eXB1aEdNS05hZFU4Q3ZEb2xDQmljU0E4TzJaNG9hVHY2RFlESm9T?=
 =?utf-8?B?VDVpSklRa3BQbWxQbWdVVFdnUnZkTlo5SkdZNlljeGdycm4yVkpHcVNmTHNP?=
 =?utf-8?B?QzdKL1dwdURqUWxNd3d2eXNGTHZ1REdlSHJQY3ZwdkZNSExvMVNPY2RhVmQz?=
 =?utf-8?B?VWswMnlWV1lJcmRJNkxIQi8ycGF6eEhTWEkxVmpqT3hRcWN2TGhZNkRVTFFx?=
 =?utf-8?B?V1lBc0lyeFkybFZZd2V1OHJETTlHZmp4a09GdnlMZ3pINHNKcWJCMGlpNFda?=
 =?utf-8?B?NVFUek5tVXJpRXV0S2dHb0JaRHI3TGQvcFRpR1JaZFQ1T0U4SWRPdUFNT1pF?=
 =?utf-8?B?S3NRY1dVaG5VdnpuazlveWk5SnVnMmxWS2x6SW52Y2U2azJaZDRCN0dTdGNZ?=
 =?utf-8?B?NXd5Q3RaTTluS0sxd0lkY1F3emdFSWVIYlllbjI0dnRNNUU5WjN5VkZKK3Ri?=
 =?utf-8?B?djZwb3Zxb1U1dDNnbzk0QUQwd01OdWR1Q2M1emRLVDZjbHVjUUNONHc2QlJi?=
 =?utf-8?B?MzJrYXJQVlNIdnhDVXZ4M1JFN2VhWDNxdkgwSXpSbWRSVGZFQlFZQmVvVGFw?=
 =?utf-8?B?TEF1L1NpdVZCb2lXcXAyVCtqUmFGSWNpL0JEOXJVYkdCWjhXNENqU0JDbHQ4?=
 =?utf-8?B?aUoxYzFXRExNWm5sRERBbXNhaUJNbEdZdCtjTlU1c0Rvb3ZIYXpSa2FUajNI?=
 =?utf-8?B?MmZ3dHBtZWM5cXU4bzd5SkNwTGE2NGcvVWVVUUM3TTZ1Z0cwZ2Fmb0ozUmov?=
 =?utf-8?B?VTlOU09VeXR2b3F3dmFEeEtYMGRhQjJ3b1QzVTBDSVRLNG5QSFVIK2NwY1NV?=
 =?utf-8?B?UURjalkyTjJxeHpaSW5pRmJubDkxWWFkbU54dWJ3cHFXQkFwbFBNRWlZL1hD?=
 =?utf-8?B?Y2FQbVlsdTk3UGxSQmlxeVd4dFl4dVJ0RHVrYzdHU1VWSDUzSHFuYnhSMjd4?=
 =?utf-8?B?SWlXSzMreDBPT253dUhJSjBOWU9NRUpEakt2aEpwOU1vMlQ1a3lodUhJa3lV?=
 =?utf-8?Q?TCQqyYQBtxl8CxjiCAP0IQLyi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0b4522-e0d0-4dee-900a-08ddf1062d0f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 07:38:18.6535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNBY3nrQ21EUMbhMZAOaQDgfWzUXd3rLZihwx7rJ49UcYgpjHPuRrD4+MXqtNc0uCCeqlM+bzaXGgm656wycuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8956

Hi Ilpo,

On 9/11/2025 12:29, Ilpo Järvinen wrote:
> On Wed, 10 Sep 2025, Shyam Sundar S K wrote:
>> On 9/10/2025 16:01, Ilpo Järvinen wrote:
>>> On Mon, 1 Sep 2025, Shyam Sundar S K wrote:
>>>
>>>> The PMF ACPI Specification (APMF) has been revised to version 1.3 to allow
>>>> for additional custom BIOS inputs, enabling OEMs to have more precise
>>>> thermal management of the system. This update includes adding support to
>>>> the driver using the new data structure received from the BIOS through the
>>>> existing APMF interfaces.
>>>>
>>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>>> Tested-by: Yijun Shen <Yijun.Shen@Dell.com>
>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>> ---
>>>>  drivers/platform/x86/amd/pmf/acpi.c | 58 ++++++++++++++++++++++++++---
>>>>  drivers/platform/x86/amd/pmf/pmf.h  | 22 +++++++++++
>>>>  drivers/platform/x86/amd/pmf/spc.c  | 36 +++++++++++++++---
>>>>  3 files changed, 105 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>>>> index 4982311ac045..41c34c26ceec 100644
>>>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>>>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>>>> @@ -320,6 +320,11 @@ int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v
>>>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
>>>>  }
>>>>  
>>>> +int apmf_get_sbios_requests_v1(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v1 *req)
>>>> +{
>>>> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
>>>> +}
>>>> +
>>>>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
>>>>  {
>>>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
>>>> @@ -338,6 +343,18 @@ static void apmf_event_handler_v2(acpi_handle handle, u32 event, void *data)
>>>>  		dev_err(pmf_dev->dev, "Failed to get v2 SBIOS requests: %d\n", ret);
>>>>  }
>>>>  
>>>> +static void apmf_event_handler_v1(acpi_handle handle, u32 event, void *data)
>>>> +{
>>>> +	struct amd_pmf_dev *pmf_dev = data;
>>>> +	int ret;
>>>> +
>>>> +	guard(mutex)(&pmf_dev->cb_mutex);
>>>> +
>>>> +	ret = apmf_get_sbios_requests_v1(pmf_dev, &pmf_dev->req1);
>>>> +	if (ret)
>>>> +		dev_err(pmf_dev->dev, "Failed to get v1 SBIOS requests: %d\n", ret);
>>>> +}
>>>> +
>>>>  static void apmf_event_handler(acpi_handle handle, u32 event, void *data)
>>>>  {
>>>>  	struct amd_pmf_dev *pmf_dev = data;
>>>> @@ -427,6 +444,11 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_
>>>>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
>>>>  }
>>>>  
>>>> +static apmf_event_handler_t apmf_event_handlers[] = {
>>>> +	[PMF_IF_V1] = apmf_event_handler_v1,
>>>> +	[PMF_IF_V2] = apmf_event_handler_v2,
>>>> +};
>>>> +
>>>>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>>>>  {
>>>>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>>>> @@ -446,13 +468,26 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
>>>>  		apmf_event_handler(ahandle, 0, pmf_dev);
>>>>  	}
>>>>  
>>>> -	if (pmf_dev->smart_pc_enabled && pmf_dev->pmf_if_version == PMF_IF_V2) {
>>>> +	if (!pmf_dev->smart_pc_enabled)
>>>> +		return -EINVAL;
>>>
>>> Hi,
>>>
>>> Is this change okay? Previously this function returned 0 in this case.
>>>
>>
>> Yes - this change is okay and was introduced to address your v4
>> remarks w.r.t to code optimization.
>>
>> This function still returns 0 upon success but this additional check
>> is to make sure we don't enter the underlying code block for smart pc
>> if the feature is not enabled.
> 
> Code flow within this function is fine but this doesn't answer my main 
> concern related to the returned value. Is it okay for this function to 
> return -EINVAL if smart pc feature is not enabled? Previously this 
> function returned 0 also if smart pc was not enabled.
> 
> (Maybe you wanted to say it's okay to change the returned value from 0 to 
> -EINVAL but it's notindicated by your words, thus reiterating the 
> question.)
> 

Yes. I think its okay to return -EINVAL in this case if the smart pc
feature is not enabled.

Thanks,
Shyam
