Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520D7292918
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 09:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153224; cv=fail; b=dZNaKEDYdLQng6aJuZnqBHX2klUYagwBMEFZznMN+IC0XwhkoyGZipCLhWX0ZV1OhYyUr8TN06aVi4dgqzGprdQBg3Q3RWT17WNpX8Y/Uv8uKTG3DF0sfnPPdcVf6gvLwCp9WOYo10/Qw2wbHzvcXDfOqzLk0N2ASE1gH0lzZIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153224; c=relaxed/simple;
	bh=nYkU+0pQ6+wWnNUZRkSgiU+qKtCgRBFHbLcIcPM6VdY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E5zwAirBM35uhQKiiI7bNhzVw4Tf1cBbODEgNWS+TsNYR1+xesW42BCyH2C+qIr+tZeXXVjVl8MMbxUhXju22Tcjg5u5MO2HTM6EhFrtjcgN2gt4oc63dnusuuWGGImbdLb1nZ3m04wiXkFOqib3OBehCLgQJ2ixSEjsnR79pRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1uIpjB1a; arc=fail smtp.client-ip=40.107.100.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1uIpjB1a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiQuNHJmsX5pDrcfUUaGMhgnjLjG2suD//LS0NFh707U10Oh5/mH7IrSBtUVuf/MvURcEkFszDYjQpi7usJG66AoDY9tSgs4Ot0o3FQot/JREBLsNa1IKmzIp3UVuWF+UaeGv5NJIpddj9y2o9YnUzbBsJZ5+oUoXrjWA8J3hFcel/YrlPBcoxLyJs/55L0JcMkCj7PlU+tm8WODvJRZC1nmVJCJMUX85hrLAPMcXzMl264vDVgfXSHCWOdjW9m6WUw0AWMujbZ5njkl127nvwuLz7PtAOUMC7e2Nf8yjJ8R9+8aWoqYVtdmVeZpNLgYEOEWe74+YYGjd+Kio8cjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEBokuiyMLkBUhqMxwQB3k+JuGbWFdM1KmQKdKwx118=;
 b=ZBt16mfsrv+S4xNOYp9SgqeyF1ewCw7A914cy2leswoiYa7ppq9nhqGmcBeg2w5r6D3EFcezAGIVMP0ovrxQhDQoYlLoFxP5TBTYWcS+vlrG/JgDwA+ss1kIq0p3sDMBqAN2ovQazUm85NU0Nh5XiFLNY7EtEnRlNJ9iA4nfuEvFRRX5zPImeyJzzYtD6cEmkAlcUZGYIhnYbkwwaZb0B6WVeHhLt33LfAf88jOrvumyARdUqbVfSjo79neVEvLSpOY6lH943hMbwxa1XcPh3xTtr4yw+KNi1xM3o8Zb9zUhtskn6D93cxxxXvc7GJk6+OVRtzsagfION8zc9CgJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEBokuiyMLkBUhqMxwQB3k+JuGbWFdM1KmQKdKwx118=;
 b=1uIpjB1azJVORPkdwZtU4JK60PlHumK/ZQxyk0amHI7NsyA+fe3S4EzI7pA885ouVyVaT9ykWqzb0TjcKvzWLaZqrTaU3YTR1QaAeNiM3TGziJw8Gk+6cAoBTB+C8SxmPr2md+xTdIhuFAzlsix4LgJDW8YECx+ltEWk3rtMdL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Tue, 17 Jun
 2025 09:40:19 +0000
Received: from LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81]) by LV2PR12MB5966.namprd12.prod.outlook.com
 ([fe80::7c1b:5fa1:7929:fd81%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 09:40:19 +0000
Message-ID: <69bd20a2-2dc3-4d31-96d3-29dda7e6d671@amd.com>
Date: Tue, 17 Jun 2025 15:10:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: Improve the print messages to
 avoid confusion
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
 "e.velu@criteo.com" <e.velu@criteo.com>
References: <20250613114445.1665728-1-suma.hegde@amd.com>
 <d5867166-f0e1-42f6-a34f-4a7e33b71b09@amd.com>
 <03da9b39-7bde-43c4-b1c6-4aea871a4ab6@amd.com>
 <43764072-617f-4d89-b513-ac5401a191fe@amd.com>
Content-Language: en-US
From: Suma Hegde <Suma.Hegde@amd.com>
In-Reply-To: <43764072-617f-4d89-b513-ac5401a191fe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::9) To LV2PR12MB5966.namprd12.prod.outlook.com
 (2603:10b6:408:171::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5966:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c83adf2-8782-47e9-6fca-08ddad82f8cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTVCdVAxQTBmajg0cFJzWGFPNENkQUlmUURyUU13SmxLaitXVTlZQlN3VWd6?=
 =?utf-8?B?UE45VTBQd2RVOW4zNDFvV3pxeStyalY5a1R5amFZcW94cHBFTVlFV3FERnFE?=
 =?utf-8?B?cktRbFhLR0psNzBRQmJDaWhuaGZ6VzdLb21Ha3c0UW50a0xzZjBZNDI2YlVl?=
 =?utf-8?B?UTREaUhHc1FOMWx3b2FzTVh6K3lzY2RDRkVueUdZMFA0dldqcVdYdHNPV3dl?=
 =?utf-8?B?K1BGN2tzZCszK0FWazV4b2NwS3NPc2U4VmtHQmtSSTAzNldCSGF5WnZNdHFZ?=
 =?utf-8?B?RHRUMS9kdDRsQllJSy9nMmZYVHpudHB3Umt3UEhMVy9VM3BNK1E0Zlk3RGNC?=
 =?utf-8?B?aUs1T2FiWEhXOWozSmhwUU5Hbm1qdEdnTm9FRUlCRTBrYW91NmM4WHBEMTVB?=
 =?utf-8?B?d01IUE1rTEU5ZVVMU3RBd2hVdWU2NDloajYrSGx2R2xHRVhjejdWTlVxQ0ZR?=
 =?utf-8?B?VjVzQkMzRXBHVllFNkZsdjlSWVp5NDBkQWZwajMxOHlWUzBjdkZqWlRHeFl4?=
 =?utf-8?B?aTBPTVJVb1pnTCtDSnFtRktBOWg5MTNjQ2s0Mlg2b2ZWYVVDUU9QY3BKN0tE?=
 =?utf-8?B?VTV2NmhZcU91Y2NQdE1xeEc0NTVlTlJqSmR2NytsL3gyZm9naUVKcVNLdHhq?=
 =?utf-8?B?cjNQWjlYZXBYcmFrSDIvLzdnd2RuYUZ2T0lWOFdjQjdWMzNmUHV6WTVrUjVL?=
 =?utf-8?B?TXFDTE5CaUIyMTYveVAzTXh4Z1dKMWZYQkdzcy9xMmw0d1NFMlExdEJtY0Zo?=
 =?utf-8?B?amd4SWFXNVNKb2hnTW50MmdtdjdGMUs1Nit6K1VONXEyeEVYRmZnMzFveTll?=
 =?utf-8?B?U1F3YzdzSG9WRjZIbXJhQmdEMi8xeEpVWVM2dFVDY0ppRmp4clJyU0ppd2Mr?=
 =?utf-8?B?WTNmTEM4OFFaTFpsR3NlenNkM0svdWE5MktVeStSRjEzR0Zhd2FxS1RZRGFB?=
 =?utf-8?B?Z3BsSm5oNTlTbzJoZmpJTmVyR3pCbE5nelVUc240cDlVeDVNWDdSdWc3STky?=
 =?utf-8?B?MTJzOFE1SkU5RWJnOHEyZVozbjFyVUdZWFpPamNZaTdlVmh6N0NBSUVsVlJN?=
 =?utf-8?B?Tk1Ya01va25lMXB4ck9NNmRvZk1YM3QyL3VYcFpyWG10OFhkNCtMM2c1d1l5?=
 =?utf-8?B?ZTE1WEx5eVc5V1dncEJLWERlN3pxUnE2bk4wdFhCaTZmOXVUd0J0TXIwbTU0?=
 =?utf-8?B?cXZUNm5kL0JVRWpFL0ZWMFpYR0hGcUE0U2NHWjJmUW9kS1pjaUtLVnUvbjcy?=
 =?utf-8?B?bTIwZEk4emd2SVVONk9qZG80WG0xSXZmZ0VSYnhhUzdhSm82T2ptTXB5enJy?=
 =?utf-8?B?ZjZpMUF1TUlhS0V5NnBYeC84U0dNRTI5NXZ0VTNXVFI4dWo1Q3FtUEd4TDZB?=
 =?utf-8?B?bXpkdWJ2bm5xU1dlVklUelBkWThBaEZUT2t4OEE5TkZjaWszR1F0ODk2VmFF?=
 =?utf-8?B?Ry9hYlhPM2tmZCsxY1M3WjFac0FYOGZKUFhHUDJFOE1VNDd4ZWFvYkpjZHo2?=
 =?utf-8?B?bG0yYUduWnlRUGw1cjl4WEhMSHhZd0w3T25CSnRxMDYzSkszMitUNDJsQUps?=
 =?utf-8?B?Q1pmQzllcEZxUFB2NnI1VXV3Y000czlyN3RDdXZDUS8wS0NpaDFKUVdzN09u?=
 =?utf-8?B?ZUlMRzhjTDNjT1JYeVpkTm90U3BnbnY5QzdIeDA3TzR6a1dNeXBaUTIzQVVE?=
 =?utf-8?B?V0xqTmxoMk9GalpzL05KdEV4blZESDV3a3grTG9weTRaZTRreENVdzFraGV2?=
 =?utf-8?B?eGY0K0Zhd1VVZXEybzllR2lJUU1UUTA3TmNPMnNaTHhuK1FHSWhFc29pMEp4?=
 =?utf-8?B?Z0QyTHZrSXk1RXpqNUlscjBCK1V3U0xtVkhuR1plSkJmUlRMbTAwQ0FiQ2di?=
 =?utf-8?B?UXNOQlNIc3lEY0VxSEsrSUtJVmZDcWwwdzdySHVlTkFsc2dZeXVkUjQ4WS9N?=
 =?utf-8?Q?/fkCzYfLsxg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5966.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWFBeUVVZXFvcUZMTTFlNHBaODJNd2oyNlFFaWYzWWprZGxyV3NqVUpsYS9q?=
 =?utf-8?B?RFlzd3FnRm8wQ3o2Y3YwVUhpaDR0TG9XSHE1UHpLanF1Mi9iUU1GQUZlTnB2?=
 =?utf-8?B?N29mZlY5VWlLaksrZTU4ODc5YTZMZSt3T1ZyR25OSjRKYmVwdkVVZHdON1NX?=
 =?utf-8?B?YWhCZ1NKYWpRYmlxNzVtbEp2Z2loQy9ZUXZJNmQ4ZEJQMi9wbEJENUtrQ3NG?=
 =?utf-8?B?VmpLSXprMmRSK3gyWEs0c2p1U2ZIclpMbzFGUUk0eGhYQmtzU2RHM3hEaEdU?=
 =?utf-8?B?R0hIZ3dEakV4T2ZKV1ZUNHBsU1plY1RPUzl0YkhxL2lsMzZRbGdvRlNPa2NW?=
 =?utf-8?B?L0ZTZDk2Q3ZxSWFIN1JlSzc5aDNXcjJ1UzZQeERQTXdEL1dUZTliajdMV0gr?=
 =?utf-8?B?bDJQOEFmekFuVlhRNWpWWmJBWVJsaDBPNXI1N2hFM1llVDh1cFJTTGg3aDB0?=
 =?utf-8?B?QS9rbGZTanEyRmwyTlpnRTN4K2JOSkp2cllqQnNtdnNmWmZZM2lhTjBzelFt?=
 =?utf-8?B?VHl4aXJ4RVJURGRIZThhb01oY2dTcXBlVmtIclJaM3QxRk1PVXUwM1Zxclph?=
 =?utf-8?B?anRaVHZxV1QrK1lqdlJDUVJ6UWk2WDJ1MlZRbCtjODM2Y1NYZlk1akFGdzJK?=
 =?utf-8?B?OWtaRjU3UzdUNmlZTlZhRTVCT0YxOS9HZTlWbEpLRFV4cDFYMVpOMFQyMWl0?=
 =?utf-8?B?QlorVGw1dk1MYnFVcTFGZ3F6VzFXL1pZZFlrWGlOL2s0ZUtpcDNyQW5zZVBk?=
 =?utf-8?B?c25yeTlBWFk4NW5BMFdtMmNjRkQzMnptQXE3eERGMTVzZ05IZ1dmOFFyT0F6?=
 =?utf-8?B?Q3JWd04xWkVBSEVlcEwzTnlUcDB5WVBobUpaNFIrTDFjSTZmWk1KOG43dFZI?=
 =?utf-8?B?MWcyOXdZc2lzU1dOd0FWTW1rOVNDYUUrbzRxdklCeGRReHNhblcxdGl0c3g4?=
 =?utf-8?B?TFVOOXliMXg5aU9LaDRLbmZuVThuQURPSjlidHUxTHYyWjYwenNVVmV4dnhn?=
 =?utf-8?B?azl5L1ZhNmhBRWtoSGc1cDFvUHlPMWFCN3ZVTzlvNGFrbU8vbWdlUXcrUmpE?=
 =?utf-8?B?U1pTQTI0ZWhrdjJselo2eW5iSXowRHNrdEM4cHJ2VktWY2M3V3hMQzBVVkta?=
 =?utf-8?B?M1FYeVNTa1lURGJrUDVCRjVud09DZ0NqUC9kUVFReHMyYnNlQ2tTVW5JRlVF?=
 =?utf-8?B?cnNDMmhROGp3NXYyczlNOWZkbVd4N2swbTEvZlFCeDlMK2NpNTVQRDZ1dXhF?=
 =?utf-8?B?WGowYmtSZm5aL1JIUHBiZHJQTlR4LzBlQ3VlVTZNRUxLU0RRVWZJN0Q1STM3?=
 =?utf-8?B?eEpEL2ZjMVBSQjZMc1IvVnlmS2hRTUhyMC9vdmlZL29YVzA4Mkp6ckZ6QU8r?=
 =?utf-8?B?cnZvTml5YkN3Vlg1WCtRSS9ySzhtWVV4YXVEalN5SnRHQkhJNkh6cENWc0R6?=
 =?utf-8?B?ZGZwbFhJUU1XbFVLYS81VzRDUlA0S3lOVkxwY1JmS3FFWW9MY1ZLc1FVYUV1?=
 =?utf-8?B?ZFFqeE9QeXZRTk1uV3Y2RStHWTY2RXVqcHdtRXE0MXVVdnZBT0lLcVdUd09n?=
 =?utf-8?B?WUtDdWcyWW1PYWE0bXNnOEtuZG43eWh4b2FiOEMyYVgxV0FQd2dZVURMZVF4?=
 =?utf-8?B?dVhaMTBzL21DeXlQN1kxNHBMOVhYYW0zRm1MRDc4d3JLanhmSTEwR0JYMWdn?=
 =?utf-8?B?aUZTS0VwZHExV0JnRVU3ZE95UUZGaE5adHpjRWpCeVduNlZ2UFA4bVAwQzVn?=
 =?utf-8?B?SlNhdFBPM1BOaEo3bUpKaG9zc1Q2NlY3QlVGVDJjUXJFYjNjTVl6TUxiTmNs?=
 =?utf-8?B?YXRoeFQrV0NkK1F5bEU3MEhHUHg3UlpJK2Y2eEd5TlhLY0pFckhnU2NnbzFr?=
 =?utf-8?B?eHVvclpRY3lsZDAzRVJuZmdZNWRSK0wwMGs4SThEVEs5ZU5xZDdVR29TQ1Z0?=
 =?utf-8?B?cFNMYTRUUHkwaEZyRmRSVHhtcXpIczFsK3dRRlNzVGUyZmVjOXR5SGFPYlQ4?=
 =?utf-8?B?dmJZRm0wS09YRUxYOVhZM1RYaDg2RTFCMHJ4SDVVVGUvY0FkaUlPdCtrNFBY?=
 =?utf-8?B?K0YvMWYreENpb2pubW9McVBvakNqUzYzdWV6c2xaVW1acTUyWVJyTEpaTXFQ?=
 =?utf-8?Q?W8ZYRn1PCyhnOcdjQvkQUWoy7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c83adf2-8782-47e9-6fca-08ddad82f8cb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5966.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:40:19.1913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJwnBHWrFxu03o+J9bRRfUQTiKyefwymEANVXm9PlczC0cQFa8SzroTnFHwNp4WSih5OGYUFohJ0IKo2kly+3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603

Hi Mario,


On 6/16/2025 7:59 PM, Limonciello, Mario wrote:
> On 6/16/25 8:13 AM, Suma Hegde wrote:
>> Hi Mario,
>>
>>
>> On 6/13/2025 8:30 PM, Mario Limonciello wrote:
>>> On 6/13/2025 4:44 AM, Suma Hegde wrote:
>>>> When the HSMP ACPI device is available, then loading the amd_hsmp.ko
>>>> module incorrectly prints the message "HSMP is not supported on
>>>> Family:%x model:%x\n" despite being supported by the hsmp_acpi.ko
>>>> module, leading to confusion.
>>>>
>>>> To resolve this, relocate the acpi_dev_present() check to the
>>>> beginning of the hsmp_plt_init() and revise the print message
>>>> to better reflect the current support status.
>>>>
>>>> Also add messages indicating successful probing for both
>>>> hsmp_acpi.ko and amd_hsmp.ko modules.
>>>>
>>>> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>>>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>>> Generally this seems really noisy, is it really necessary?  I feel
>>> like the messages in hsmp_plt_init() have value because they show up
>>> in the error path.  But in the success path if you don't get a return
>>> code it should be working.
>>>
>> With the upstreamed HSMP patchset in linux v6.15, "Erwan Velu"
>> encountered an issue on an AMD machine with a "9845 (Family 1A, Model
>> 11)" processor.
>>
>> He observed the error message: "amd_hsmp: HSMP is not supported on
>> Family:1a model:11," which is misleading because the HSMP ACPI is
>> actually functioning.
>>
>> He raised a concern to correct the error message and ensure consistency
>> in the message across both initialization paths (ACPI/PAT) so that users
>> are informed that HSMP was successfully probed.
>>
>> Could you please provide your suggestion to this issue?
> How about in hsmp_plt_init() you re-order things?  I think the
> acpi_dev_present() check can come before the legacy_hsmp_support() check.


Thank you for the suggestion. Additionally, how about having only a 
single probe message in acpi.c rather than printing it for each acpi device?

I will do this change and send v2.


>>
>>>> ---
>>>>    drivers/platform/x86/amd/hsmp/acpi.c |  1 +
>>>>    drivers/platform/x86/amd/hsmp/plat.c | 17 ++++++++++++-----
>>>>    2 files changed, 13 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/
>>>> x86/amd/hsmp/acpi.c
>>>> index 2f1faa82d13e..b631110e5834 100644
>>>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>>>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>>>> @@ -610,6 +610,7 @@ static int hsmp_acpi_probe(struct platform_device
>>>> *pdev)
>>>>            hsmp_pdev->is_probed = true;
>>>>        }
>>>>    +    dev_info(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
>>>>        return 0;
>>>>    }
>>>>    diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/
>>>> platform/x86/amd/hsmp/plat.c
>>>> index e3874c47ed9e..724e5c7fc819 100644
>>>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>>>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>>>> @@ -215,7 +215,12 @@ static int hsmp_pltdrv_probe(struct
>>>> platform_device *pdev)
>>>>            return ret;
>>>>        }
>>>>    -    return hsmp_misc_register(&pdev->dev);
>>>> +    ret = hsmp_misc_register(&pdev->dev);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    dev_info(&pdev->dev, "AMD HSMP is probed successfully\n");
>>>> +    return 0;
>>>>    }
>>>>      static void hsmp_pltdrv_remove(struct platform_device *pdev)
>>>> @@ -287,15 +292,17 @@ static int __init hsmp_plt_init(void)
>>>>    {
>>>>        int ret = -ENODEV;
>>>>    +    if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
>>>> +        pr_info("HSMP is supported through ACPI on this platform,
>>>> please use hsmp_acpi.ko\n");
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>>        if (!legacy_hsmp_support()) {
>>>> -        pr_info("HSMP is not supported on Family:%x model:%x\n",
>>>> +        pr_info("HSMP interface is either disabled or not supported
>>>> on family:%x model:%x\n",
>>>>                boot_cpu_data.x86, boot_cpu_data.x86_model);
>>>>            return ret;
>>>>        }
>>>>    -    if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1))
>>>> -        return -ENODEV;
>>>> -
>>>>        hsmp_pdev = get_hsmp_pdev();
>>>>        if (!hsmp_pdev)
>>>>            return -ENOMEM;
>>
>> Thanks and Regards,
>>
>> Suma
>>
