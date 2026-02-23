Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6EB3EBF22
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 06:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771826800; cv=fail; b=WM1sEl9/qMgXK5MeYEuDEFQd3sKLYsCml1FRaMS7NzILUxARraR9WoAvz7+AbW4RjkHkNXr1YzA3ug5tNSbLGZ46yjxvOZDRVhMIpXoxOL7b4mBTe6ODnwmyy31TL0WhfKoq1Bpt4/nbeJ1f4nTqdsYQpIl4K4HDtaYh3lDayhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771826800; c=relaxed/simple;
	bh=QUFHTh9MxB04Yeqn/CyQ+67KJDUizg6u4WH67U4z92M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qPn+YoW1Uqwp1WZxISLULDoI3pGjifEs+eWfxqNzyAY8Cv9TLORKJc8iaNMF8a3x0dq9v2nJ6fnp3UWhhvSHZmEoIqyGC3wveTyAGf9UiorHmJWU7dkAEKVf/uM85Po2tbsIjAVelcxliUB+unoZVKlI95C9FhUNJjUTz/V3598=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=x0zuig/x; arc=fail smtp.client-ip=52.101.48.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="x0zuig/x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytZAEPgyrcBRQpj8BmNoYKQm/VqhqeAfC1bGi61nH7FjUZkBZXROjXoQIqnx3fkrVuoXrSwxeQ9hOSC+N04nW2UkZDxizOZ/K8m7yTTJVR9YMT5ygMBGhsp2wGz8kWwRTc4GhOnRimFuHuoH23MXS/XdJtS3ALAfMMaFfJYZ07bcLfPc+LkR8jZZG/3MkBeTevC0Q1xgjl/eZ1NKDp8WM2opu4lnYyLqYWKkJETFJaPAnQPcUagcdZ6+VrH3A3tdio647J2/ZVYgyjzMyS/e9qT37ELvtu/sHAaipsXhFIF2y8sLULL0LFbPnUgYmGKszSFDg/spQeg8m2Xc+kWUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYIcA1lS9YQ7DH8Ff/O9XN5TtQ4nGIYaNoww3v6BzOA=;
 b=hlU8PORJeNlUqfTI8r/FIsV5a8Jj9QH86LtaCimKTw4ZkBkZ4Fn7OvwxVj/vi2xuQ21m6DiSFdWs9BrFPcVHOQ5COJdrRImkaVxGkVomkfjZiqgFRNdiFK1Mt1GgBJ+deI2bhqOPEgmoG0lqv52bAjpMOrjf0g0JAnJm47QtszVYUR5DhYVDdCEVoMQ1JeXpZWg56q8TbCGyLD9HVxuSIr8cq3AiqxIHaFqj1GEfClfoRmV+94k21uwvclUwpF7NsIdRzNMHgsNfMCYGJFQhSmKrFMyk2/YQDntvN7tssCXfmOVaBSfUTwwtSJnBo71rz5j0uNEuVaBmzZeUe+LS5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYIcA1lS9YQ7DH8Ff/O9XN5TtQ4nGIYaNoww3v6BzOA=;
 b=x0zuig/xxDEiFcSerTTlpAkr8zKmjprWM2jSLXlwMQna/0WyG6NIuuMAQkaoSX9VFGxWdwiw/YZzdmxrS1a1HAaTXuQ+2dUq6IEClXg+ahEyc22CysSRks0zkyWQr7bUv3EQWQlySwY6z1AtG1HHla5mXLYDLwYW1WN1HMiIWWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by IA1PR12MB9466.namprd12.prod.outlook.com (2603:10b6:208:595::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 06:06:37 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 06:06:36 +0000
Message-ID: <d152f056-8583-49c9-a943-494325031d8f@amd.com>
Date: Mon, 23 Feb 2026 00:06:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: Bug#1127612: linux-image-6.12.69+deb13-amd64: hp_bioscfg
 mm/page_alloc.c:4802 warning
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 Paul Kerry <p.kerry@sheffield.ac.uk>
Cc: 1127612@bugs.debian.org, Jorge Lopez <jorge.lopez2@hp.com>,
 platform-driver-x86@vger.kernel.org
References: <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <aZMt6sSlpKK_JAdT@monoceros>
 <4ddfa94c-5cb5-4c7a-a0b4-9b9ff5e4cc85@sheffield.ac.uk>
 <dafda4bd-87cb-4fbd-a811-66d629a10c70@sheffield.ac.uk>
 <4faeb5e7-e56e-429e-88fa-a1fefa4d1034@amd.com> <aZnNu_AphE78MIoY@monoceros>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <aZnNu_AphE78MIoY@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR07CA0008.namprd07.prod.outlook.com
 (2603:10b6:610:32::13) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|IA1PR12MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 5321db34-40b6-46d9-3210-08de72a1b3da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0NLRHM0ZGt6Z2dXaHlzbnI1QU5uY0tkTjFRbFFZRHBTelZTYXk0OWI0WHI1?=
 =?utf-8?B?K3hXTlpWNlNWb1VUaWRicXQxSTlCOXR0R0NpSVE3TVNVTGZJaGJlaksvVVhv?=
 =?utf-8?B?aUdocG4zcGFWbEhLMjZUWHdyaVA3Mjg2dG1WQktIY2VUTDhBdEJhV2xQc091?=
 =?utf-8?B?R0VzZXZNNE01elU2MXBQa1JnS0xLNXVYa1V6Zm80WWhtbjZrSFk0Y05yYTA1?=
 =?utf-8?B?VFNnQndjazJBajhZWG9XSnhmeVE0U1gzbHRmK2FKUEpHTGlxQWNHQng2MFQy?=
 =?utf-8?B?aUxmVDV3NzFPNXk3N21hMHJFd3ZUYXhPYTc0aExWR2N6cGw4TERSSDVqSFJW?=
 =?utf-8?B?N0YxL0REVmg0U21SdlV6Q1Q2cm1OdVRxQTl6YVd1UlJ4aERQOVpBdnJSZldB?=
 =?utf-8?B?UHFqVHFib01BTW9DeExxd0thdGFuM1cxcjJzSXU2UFFEZ2NTUFpIbm0zTURS?=
 =?utf-8?B?S0VWKytLV3gzSkRCd3RSSzJLUm1DTGlkajBHSzd6aXRvSUF0eE5jeHdqcExh?=
 =?utf-8?B?T1J5TGpLTjNGamV3V1p5SHV6ZVVLRmhLMU04OGNhVUdNK21la3VqRXZYaE1p?=
 =?utf-8?B?S0ZRUVBhUEc5OGtBNlFwYTg1MUc0cFpDd2N2TDdSSlJPK1pKalB6OXg0ZWJU?=
 =?utf-8?B?bjByVW5sTEdxdHN2KzlmaWc2VkIzc3VkQnF0WVcyenBSY2VwOTNqeUovNis3?=
 =?utf-8?B?S3lrRCtrMVVUN0pCUUQxVTRDNDBJcGtQUTE2UE9KUjgxM3FtRFdpeXBISDM0?=
 =?utf-8?B?aXBNLy82SWVXUmlMUDM0bmlpdys3a1c0Ni9VNjYzZ3R1eXdYUGVjcmhqa09S?=
 =?utf-8?B?YTgrajFsQXQ4ZDhCcEllcFJJWGxmS2t2RTM2VUVpWGdId0FLT1g4dDgwelZN?=
 =?utf-8?B?RWxxRDdudHdPT2hhT1YzQnJvbkVFWU1uY0JDN0wxTkhVMk9IcHZOczA1eVlr?=
 =?utf-8?B?ZFF0bmU4VXlOdXNqQi91dDZESzdwTkhlTHF6VEgrOGFMV0d4T1VHSlRmMVNV?=
 =?utf-8?B?TWtqbDdENTVmM0NVc2d5YzU5eDJiejh2SXM3VjQyQmJ6eXhuOW9STi9kQkpQ?=
 =?utf-8?B?azZpTTBBbzhIQ2lLUTFrYnpVeW5xTXJEa0hLeGsrL3B0TTFSQitpbFR1THFH?=
 =?utf-8?B?RG43b0JCYXV5NEFrekJnMXpzWlcyOEJSOGM2MTM2aEpKaWk2VEhrVi93RXFv?=
 =?utf-8?B?Z2k3ak9ETFNjUVRwek8wdCtFeVBLZUhmeFlSME1qdTMzWDk2bEEwRDNKT2NN?=
 =?utf-8?B?RE5ud09jc2syZzBtNTU1Q0M4VHR1UjBkdEowS08vOTVyUFdSNENuYml5aEI5?=
 =?utf-8?B?NTNIdUxSV1RmWndrNlh3ZEtxVVFoL2NTbThZaHN2ZE5JRnpzRlY1MDhhSWM4?=
 =?utf-8?B?dHFIeE90bU9CYkEvRWdTMHFKMWM0THhTNjUzZmZEekR0bHFBTitDVFRVa0xo?=
 =?utf-8?B?UXoxVTFiUFp1R3Bpc1hnWnpDU09UUVd6RVFBYU12WXQzM095R0QrZ29CbWxp?=
 =?utf-8?B?MVpQV3d3azI5SjVFazNCVzZLc0NxS0d0SmxnREVhMmdrczdCMWxGdzNvMkZB?=
 =?utf-8?B?NTJES1VSelhzVStjOVZSMFB3QlpFT0FoTmcxcEZwaDd0RDcxMGdVVGdKMThX?=
 =?utf-8?B?dXpNUjA0ZCswZjBMNXhPaGQ4ZHhQVmlCcWIxL0R4Y0xRQmlFWEZjSEFqZXZV?=
 =?utf-8?B?VTZmendQT2c5eGo3dmZ0THdMMGxYZkVoZUhHUm5FU1JhdzVsR2ZDZ3U2T0hB?=
 =?utf-8?B?SFFsRGx3eU5MWUNRNGVUVURqMDhxTlRpSXBNcUl5NW5WbWNkcmZwTTBMODQz?=
 =?utf-8?B?NUdndG5rUVo5dkMrdU1iNENEZ09aeVBSTXJld284dGZVbE1QWXIvbWRDakF5?=
 =?utf-8?B?RzJsTUMrWERNd3lKM3RVNGlURnIrb0diVEo2MWRTMVBhRFRCWUNENi96U0RD?=
 =?utf-8?B?RFdWalBXNWNiNDg4a21VOVd2Q1htbG5yLzMzVFdRelhJa2J6VTVhYVAva2d5?=
 =?utf-8?B?ckJ4ZlpCckx0L2xWTUlSaXRJbVFtYWlJdUYwRzBRQ0xwQ1NLaTd0MDVVTGE4?=
 =?utf-8?B?YXowWitkUDJDRlZjK21NSGdTNmZtSjBnUmJqYVJlVGxDK0IyL0d2OGc5bUFE?=
 =?utf-8?Q?E+JE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHlZQ1V3Ujc5MElSZVhFd2UyKzJMeGs0dVdwTWprUTAzOUgyVGNGb2Q3cHFW?=
 =?utf-8?B?NUpNbFN4WWJWelE4dFZkdmQyeXM0NCtsOG4zS0Vxb1hmcTZqWEpWa0FtU0N3?=
 =?utf-8?B?bnQ3K1BTdWphc08yb2lkRmhpbWdwMHM2aXE3WVo0Ylp6c2NrOHQ1Zk5LbEtQ?=
 =?utf-8?B?RE5LUHhmVmlZRVdRbWNVYXd0SFlCM3I2a2w3R0dobno0QnBBYjFLUHhwRDBt?=
 =?utf-8?B?MGlZWFpWeGdpYWxYREExc0VVVzZjd0d4SGNuRUszeGFYcTZQNHZhbm5rYUdB?=
 =?utf-8?B?amhIbXkyb3htMkVLUXV5cE1razhoYnlveDc4SlVJK2M1bGVLTElYN2pHUkdC?=
 =?utf-8?B?OFoyOVFWYm96NzRScC9zTVNNdDRjTTFRTFFtVEdET3QwNkwxNUwzdmhOZnhz?=
 =?utf-8?B?ZlFTYzBNNjJVODVFZXlJaXFCK0g5anMyZTRZdEtmQ0xZclBQVHRGZVFwQllN?=
 =?utf-8?B?Qm54MVo5Z3YxYXdmRTM5U0tlSjJmRXF0SWgrTUVEM3piM0QrVjRjNE8yZ1hj?=
 =?utf-8?B?V0ZzSW12RktkSFFtaTdPZW5rMHBnaG5reWJqc3M0SFdKU3hjc0wyZ2dwWWNZ?=
 =?utf-8?B?NFQ1dWZZMDZnR2Y0MU5rbWhlT011MWFEYStlS2xQWXRQcWZhWXJNZ3NJYkFY?=
 =?utf-8?B?QU9UZDlIRFJlS0ZpSE0xT1l2UHVJK1VnbHVxNUlxM3VLRkR2YjFGclV5OXgx?=
 =?utf-8?B?bDFJeDIxOWEwdG1ERERybG9JcjNRSXp6RWk0cERCOHRiN2hFRlRBbFdYamtD?=
 =?utf-8?B?WmJxNDlQbktpUjhXU2JvaGl6eEVYekZSbURWU0NoTWU3SlM5VEVDR0Fjbkh4?=
 =?utf-8?B?U21hRDZYa2ZMUVVyTmlpcVpodzloNFZaRnh4ZmIvSnFRN2kyaGprZk5MYVIw?=
 =?utf-8?B?ZnYrdTJZaHAyZUU3S3JFZS9VUUR4MmJoajlrV09INStRUnY4cE9rdlBaTEJV?=
 =?utf-8?B?UDV1Um5lQXc4em5YM2R3S1hQY1Fhdk1vNXozSkdYL2pUK29WbmhaeHNZa3R6?=
 =?utf-8?B?YkRUM0NPU2R4Yi9ZWTQ4VGVHWGxPanpCN09IVmtTR0VYVUNkZFVwRXI2d2ZH?=
 =?utf-8?B?TCtIQVloNHRjbGRjTTVXdDhIYjltNkE5ajEvTDdFWjNjZzhrbGRRQXlNYkly?=
 =?utf-8?B?MTZ5WHZjT1dLbEVPcmI2Z3kwMTVIU29UL0Y4akJEYldqYVAvNDNMVnByL0lJ?=
 =?utf-8?B?MjUrNG9uYi8zbUdlNlRBTnRLV0llOFVrRm1TRm00bGxyT3NJNERJb0N4WXhM?=
 =?utf-8?B?UldyTVFncVVpcFZQcFVXT05sR1VWTUN5RnlhWVBPZXdOS2c2aVpwNlJtNFdi?=
 =?utf-8?B?V29jS0FiOHZ6bFNzNmdoRU9JdEdaOFJKMzdqV2t0K1JUMENsZ203bnIwaHly?=
 =?utf-8?B?ZEplQlZXUldNQ1RXdER5WDIvTk04N3E4amIyUjhjNEFBazRQRWNWbDMyRENK?=
 =?utf-8?B?RWd2UlU5aVFIYVF5ZVVrWi9haVIzOStjOFJObGZJN1dYWmVhMUtLUEQ3MW5G?=
 =?utf-8?B?ZHhVRlN5U2lTa29pT0VJWWdTR0RoSk4vdG9XNS9xQ2RvNEZTV3Vjem54eGdl?=
 =?utf-8?B?RU9KcWRseGpJS1JiMGJnaDBHbSthY2RKL2t1ekZRZTB3WW5ZQVd5djYvTkpS?=
 =?utf-8?B?S2YxZXEzRGRJQUoyeGF2UVdyQ1RtTVlxck1uL1YyelRZdCt5SlUwWVE2S3Mz?=
 =?utf-8?B?RnlQdHBJaW5IcThwcUt6dmxRUllaUFZXUGhRMlNNZU5TcFlqVmJ4Z2o3RnVC?=
 =?utf-8?B?VWNIZWRsSVVCSkVsR0JYNWsxYVNtbGExMXBUaUxFbWx6SUJhYk5rQlZBS1Bh?=
 =?utf-8?B?bjcvaWhCUzEvSXpQYUJNOFRhemlCVEQ4bEt5TXhqejI4MjEzS1Z1RXVzMWd0?=
 =?utf-8?B?S2lZTXlzd3ZPQnloc3FaMzNXUHFMSEFVclU2ZW1Bc0UxMkRSYk1NejhDRVVw?=
 =?utf-8?B?cjVlQkhlckVVc29GMzhRUE4vV0FJZHRGZ2JET2ZkSllBYmN5L2RtZE1nQ1Fj?=
 =?utf-8?B?L0VqcFJpbVJ1T1llN0ZjOEZoakx6NDNGRUZKOXJWNmZmVVpkQnlVcGM2bVhI?=
 =?utf-8?B?UGJOK0tLM25VNEN1OU1oZTdTZlkvUkx6Qkw4VklEMjYwL3ArV1l1S3VHZldD?=
 =?utf-8?B?TUhFS09rMm5QYVdlWG5FOVFwUmtKQUhQWm9CNXRTdzJrY0ZHRU00NG5pSGJa?=
 =?utf-8?B?VHQ1dWZWQlFFeUhrOCtsWnFEdHRlTi9LVytYd3ZTUGlJenFiQUZGWk95YUtt?=
 =?utf-8?B?cVI3ak9rQVlvSmtzRGRJaHl0WFhLZFI4N2ZNc0RjMWlENC9HM3BZNVppOGpJ?=
 =?utf-8?B?R2lUbWgyWFBrd0taeU5RTWtkQVU1NEZiSVRzSVJwWkM3T2orS25pQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5321db34-40b6-46d9-3210-08de72a1b3da
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 06:06:36.7165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /yj0N70omx1XonZCOiblyGzaO64Rj4gDan1Os9pD5xw6h0DAW+ey6+2Fdi1t7EALdmAugq/3o+tv1RppEC86GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9466



On 2/21/2026 9:26 AM, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Feb 17, 2026 at 07:53:17AM -0600, Mario Limonciello wrote:
>> On 2/16/26 10:18 AM, Paul Kerry wrote:
>>>
>>> Hi Uwe
>>>
>>> Thanks for the reply and information.
>>>
>>> You are correct: when I boot the HP Z2 Tower G9 into the older
>>> 6.12.63+deb13-amd64 kernel, the hp_bioscfg module is not loaded which I
>>> had not noticed, and running a "modprobe hp_bioscfg" on that older
>>> 6.12.63+deb13-amd64 kernel does indeed generate the same dmesg warnings
>>> as 6.12.69+deb13-amd64 does, which auto-loads the hp_bioscfg module.
>>>
>>> I've not had any noticeable problems caused by this issue since
>>> 6.12.69+deb13-amd64 came out.
>>
>> Considering there appears to be a rather large number of attributes on this
>> system, maybe we should be using a different memory allocation method?
>>
>> Something like this:
>>
>> diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
>> b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
>> index f346aad8e9d89..72bd6037300ab 100644
>> --- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
>> +++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
>> @@ -94,8 +94,11 @@ int hp_alloc_enumeration_data(void)
>>          bioscfg_drv.enumeration_instances_count =
>>                  hp_get_instance_count(HP_WMI_BIOS_ENUMERATION_GUID);
>>
>> -       bioscfg_drv.enumeration_data =
>> kcalloc(bioscfg_drv.enumeration_instances_count,
>> - sizeof(*bioscfg_drv.enumeration_data), GFP_KERNEL);
>> +       if (!bioscfg_drv.enumeration_instances_count)
>> +               return -EINVAL;
>> +
>> +       bioscfg_drv.enumeration_data =
>> kvcalloc(bioscfg_drv.enumeration_instances_count,
>> + sizeof(*bioscfg_drv.enumeration_data), GFP_KERNEL);
>>          if (!bioscfg_drv.enumeration_data) {
>>                  bioscfg_drv.enumeration_instances_count = 0;
>>                  return -ENOMEM;
> 
> The patch looks fine to me and now I wonder how to continue here. Would
> a test by Paul help? Or are we sure enough the patch is fine?
> 

I think it's OK, but it's entirely possible it's going to uncover 
another issue on this system, so I would prefer if we can get a test 
result before proceeding.

> @Paul: Could you test the patch? Are you able to create a kernel image
> with that patch included yourself, or would a test package help you?
> 
> Best regards
> Uwe

