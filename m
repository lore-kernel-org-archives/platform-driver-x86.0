Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3047841C64;
	Thu, 19 Dec 2024 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734620364; cv=fail; b=ss0hhgdcBnhO4uRdUIe5F4gH5Ed6mNAiFhuT91ghaahj5I5Os3pbUe8z6xagDgsTwocWcYU6FlUB9gyTxuVZL5zXNVo+c56aeFTRuspMh86i4VXyoc5bzAa9bGTjyopoxDTnt8mmoIPcdZML708iGobI/730WyPi0M1Zg7J/p7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734620364; c=relaxed/simple;
	bh=80/7GzBWJAMHmv6Y+/2BqfQesVcH4b4O1eV74cb7IeE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VgxjbzoJG4cwQ9FoV8lAb+i8NTO03YUKAINumeTaWgLPDOJpDe/JDQhoIjI2WgKyQanaXqNtDWssMoeFnf3CMsQwgb/qb5tiVLITeRYK/Tryj1AWvgbJtz1mvtjetODXME9f7Gl+F49Y+lKKD/wU8/MEmemtQXrsaj1latKGYTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=a7hIurZO; arc=fail smtp.client-ip=40.107.244.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="a7hIurZO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7D+5RLg/StTr6g81UCfbPhZVymrc15CWaCagM1UDeSbtqgbTGSG8tsatxdhOpE+mzwek+J4sGbXBmELm3Nx0vYnyxMRMV8NJEh9nwXYpC8Y57Rvnhd997ShAFUtT4yLoSlbilxuf/V75A7cfqieCIk/RSWqs2UluoaNBra+KUbp7KeAGDltNpfBYoqXjqCLGjLSDji49mySnN4vhQlW29JFzV+CbJjf/izhn8gKsreZZH+e/fMbS9KtQH3IXhRdq4ro2GM/7qEcw+uzj0RZjEz1MWa/+7XOwHK38qE+kafdwWLWOrLG/gRi90tciEGt1hok/IPWyFyKJAyGdAw8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdlUQGggl/OBrQ22llQpfKY+7ZnosCdVuU0RVEUCXEY=;
 b=LeDhyYltSCwxoFRLZREAniJ2wNBMP/Pqph1kL2cIYOuosHqx3gNYIi3T8WVNl2YZ5yd9+jixlHrkjfMKfBgILEWQZcQ0EQSTRid96kP0E0KwDD4/TkI37z7801cPDzBrZU85Xpo0LoATro46KN3dG0MyP3+xmYl13uG/dZ8GFPZ9Y/b2IQepZeN2r1YVmVZ5bz9JeCy2khd1DIL91YO6ELz3DqqJ4ezOGWgz/zbqIg2NdwzZnc4EKRJgG87u/2pkg7PQirEwHFFDTRyAlyneOrUNIrlprKecjKkfd0V1ew6aUXm/Ugjdkei1W3PU47sZBL94NATHvtH9A49HCRiDDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdlUQGggl/OBrQ22llQpfKY+7ZnosCdVuU0RVEUCXEY=;
 b=a7hIurZO3rSkIJiNQcdXrMUXTD7v6bEM3cXIBfxnMxrLoLtYs9M3DlvgJvSYbWZzrxbVzMCLXPNMlwhgsvOL9UT8LizPNOrNYLpvKHMt2lJp52h7AjParQEDbEa8+6eGWfAl/EYg+Lhb1sB5jsEkVMtN8v4sxYoJAI0qXO8QCxk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 14:59:19 +0000
Received: from BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::35a:28cb:2534:6eb7]) by BL1PR12MB5286.namprd12.prod.outlook.com
 ([fe80::35a:28cb:2534:6eb7%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 14:59:19 +0000
Message-ID: <3b2c016d-9991-4cfa-9cf1-bbac39d5a183@amd.com>
Date: Thu, 19 Dec 2024 20:29:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] platform/x86/amd/hsmp: Constify 'struct
 bin_attribute'
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stuart Hayes <stuart.w.hayes@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "David E. Box"
 <david.e.box@linux.intel.com>, Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241202-sysfs-const-bin_attr-pdx86-v1-0-9ab204c2a814@weissschuh.net>
 <20241202-sysfs-const-bin_attr-pdx86-v1-5-9ab204c2a814@weissschuh.net>
Content-Language: en-US
From: "Chatradhi, Naveen Krishna" <naveenkrishna.chatradhi@amd.com>
In-Reply-To: <20241202-sysfs-const-bin_attr-pdx86-v1-5-9ab204c2a814@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::6) To BL1PR12MB5286.namprd12.prod.outlook.com
 (2603:10b6:208:31d::6)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5286:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: d9592109-06d0-435b-b737-08dd203db6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L2RIZStRbTF4c0w2YmRUNWcxTzlueFNZazRtNHNNR242bFlHaXJlSVNWL3o0?=
 =?utf-8?B?UVNoUUVzK3o5VS93Nk1WZ2l6OXQvdGlhWFMwejdXQ28yaSs0NmJVWjJxd0R0?=
 =?utf-8?B?YndOOFEwaUJlcWhRQUpYWXhKYXZNcDRXbU9ISkJsZy9NQm1ubXppWnNIUWNY?=
 =?utf-8?B?U1NkOVB5TW5BejBRN2ZtT3ZCRzI3N2p1Yk1wMnhWQVlxRVR4THVCV1ArQ010?=
 =?utf-8?B?bk5LSmdMZ1FCeDZKcU1DTnV3SjhXeVFHc0xtNUl2cW5MQWU4cE0zNkxGSkNZ?=
 =?utf-8?B?eGUvNVloRHUwTzRaY0hjV1FGOXdMNUVOTERBblhJcSt4L3puT3JHY2pYQzdC?=
 =?utf-8?B?UlZhSnB6TXp2TzZ2aDRuMHJrMHZvc3UvUmszMnBEelFrcjM2Tkk4cmJyelpY?=
 =?utf-8?B?d2hTQzlTREhBTHRObDk0ajBLTW5xUXk4NE14Y2JHZGZVYmN1WEVBVDJsdHdz?=
 =?utf-8?B?Nks1NFBqdU9waFdERmpEWmgvWk1DcHA1VnJraGpUVzlCTTMvaDRGaWhJcTRN?=
 =?utf-8?B?SktTMG92b3kzeDhCYUpzc2lEWEN3alI3N3JlOHUzM01Xei96d1lrTnhHeS91?=
 =?utf-8?B?dGFSZGpqeVNYcURzTkFtNmNzazhaUS9GSlN4RytoVFBCbFM5cVpSSVRneGlH?=
 =?utf-8?B?M0pvcTRzVmtrR01CRkxwenJ0NFFuZ2hwNnpuRTd2bHQ3VGNKNmZUYU1RVWJT?=
 =?utf-8?B?TUNXQ3dvWmptZmllRC9QZVdGZHA4ZlJuY1JiaTN4SUpzNCt4YkdVUmlsd1dL?=
 =?utf-8?B?bDgrcUJvdVIrcTBReEF3dDVyeTZvZkZETWZjRitzR0Q3dFhENW1xTVE1UXFt?=
 =?utf-8?B?WjFNNzFWTmoxb1RWU3ZsTkhmV05VZC9iWHFDd3FOeENMZG9LempjcDdhNGlR?=
 =?utf-8?B?emRra2FuWGpxdS9XQkRjVTNVRVhOQzdxRU1ESUpyOVRkS1IzbWR3ZXl1T216?=
 =?utf-8?B?WDJCRjV0K3k3cW5QdHo0U2VVK2ppYkZsUHBReExTT0NtajVmakkzTSs2cS9r?=
 =?utf-8?B?NkUvaHZwWHFNWld6enNBM21KQXpFcmtzN1BvTTFqSXdDWHNmL3RGMUJNQno2?=
 =?utf-8?B?VHVQMUw5R3ozUjFqenJFajkrZWpjRlh2TnV4ZkN1eW9pMVlBKzYzMHZ2NUgy?=
 =?utf-8?B?a2lLZm9QMDhDOGRlVHV5ZVk1OGx4aldDRDNibllvV1gyZm5xM1BocC9vU09R?=
 =?utf-8?B?WHZDNE5CaXp5ZWVIei82Sncvb1d3RWRYL1VzdmRiOEtvT3dMZXdLMXJGb1Nv?=
 =?utf-8?B?aE5pQTZjRHUxM2drL3ZQNGZRNjVEaDNSZWFpNmFRR3F3S0ZMZG8yc21jMFhl?=
 =?utf-8?B?c3k3cmFOa21ybXZ2ekNXUFM4Y1Radyt4ZlpiaXc5SGVyNFZyOWJ6ck85dzIx?=
 =?utf-8?B?UW5qUVlzTEpIUUY2dkx1QjhEcXE1L3VMOWdGS1I3K1dzKzd4cU5GZnVDMm9p?=
 =?utf-8?B?dVRic1dYdXgxRUlJR3JPc1JzT0JmS1VhNi90MVlYUG5ZVE9kaVJ5Ri9UbTJ4?=
 =?utf-8?B?ZFR1OGRMeXZlUnVaMUtUVUIzSGxZcDVHYlpmZFhidVNxZkFTWTNyQk44YTJl?=
 =?utf-8?B?YWliTEFWZVBpSXQwZTBZVEl6cTlKYmdET3hVcDM1NUpsaWlIbVNhU0lyOHdK?=
 =?utf-8?B?M2U1VnpVSmFIY21ISTFERGdlM1V2aWt0S2xqb3J3TkEvUU01ZjhCUXE1Ry9C?=
 =?utf-8?B?MWVwMEN5YUljWnI5ck9malEyaVZNQmZOZHhvUFBQdVhJYmozc1ZmTDhmb2U0?=
 =?utf-8?B?NHVHNzFwOFFVb2FkV0xHRTdiY2QvQTZhbzJJdzA0bmRuNnNiY2lqSkp4VFpK?=
 =?utf-8?B?MjVSL3hNakR1T2dTSnF6QTVhRm9YN2ZZSDFrbkNVSXluQkhHNysydlppbWYv?=
 =?utf-8?Q?KmeNXxTnsnBNq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5286.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajYrczFGRDJwQllhQ0tuY3c0Q05aUkk4dWlMNFdTS1IvU1FlN0JwQm1NcDBo?=
 =?utf-8?B?NXBRenZiVnZoY3p0cVBHb3poc1FqcmpRNHlVOHhZUnV3RlNHcGpDYzN5NG15?=
 =?utf-8?B?di96bk55QVJESWV0YW8zaXFMTHRCSTJLUU9MUE8vQk5mWS9PQU5tUlV6QzVu?=
 =?utf-8?B?Smxlbm1HTkp6cmlBRk1SRUk4SFV1RS9wQjZtYWRnVFphRVZtOGkwWXBLUTZM?=
 =?utf-8?B?Rm9MQURDMFFWS0pQNVdTTHZnZXlxUTUxWUNxSjE0L2NBTjBDaUxQOXg0YjVU?=
 =?utf-8?B?S3lUa0s1T1Q3cjFzVU5TOTJ5bCsrNjJwcjZSZWo4WXQ4QmFBWTM3SzdpcDFM?=
 =?utf-8?B?NGRONHd4c1ZPSzRZbzVPTzhyaHVjN1R2TS9IUEpnY3ZiRk9BYlNpN3M4UmFY?=
 =?utf-8?B?bDQzemx2QXZGSldQOWJvY050NEc1cGMyY2syZEVyYzNHTzF4WFBJazc3RXJN?=
 =?utf-8?B?bXhnSWF2b1lUMGxBMlFKUW9leG1tQW9JOXBDQTd3SFU1Y0xoTUJXd2Y3aHF5?=
 =?utf-8?B?MlpmdWpWemdjVXlqZ0kvaVg1R0ROQWIvdE5jQTJZZHhMM1NYY003a1F1NWdB?=
 =?utf-8?B?SXhwQlp4V0t1d0I1RFpueW01UXZpLzVic1A0ZGNXMVBPNTBFUytXUnNGSHMr?=
 =?utf-8?B?Y0xpcDczdW1EVXkyWlRaM0h2cnBBU2J6OWwxRGNhOEVBRTNDeXJZMmwvVzNN?=
 =?utf-8?B?QjFTbU9rVXcrbWxzdndxemV4ZExHdERUNWNqOVhXVS83RUNmSXFGSTRGRjc3?=
 =?utf-8?B?SmhiZzBoVzE3WE5mZFBwU21TcnNDNTFXUjMrVGErRXZUeGZua3dxeDkvdDJz?=
 =?utf-8?B?UW9RaUhJci9RajNSbjVQejRFdnd3eWNoK0dpRHNkdW44QTgrTmFzWUNoWGtW?=
 =?utf-8?B?b2NoRFZMNlVPL25XUjdEc0NvRDNhamFBRjhKUUtNN3RkSjM4WDhnZEF5Kzdp?=
 =?utf-8?B?Z0dDMCt6THorUHVMOC9XK1ZMK1ArcE5MM1U2RWZ5eW5oMUIzVVRVTkdTUjU4?=
 =?utf-8?B?dStnZTk5RWdGSUU5cmxEL2FOOG9TMy8wM0M0ZDVjbkFIOEJDR3J4Zld6TW9w?=
 =?utf-8?B?L05QenpWdk9pWitwMUpiMWZQanFIdlFxMFk4Uk5DVUdMVlRpaksyUjBYUzVC?=
 =?utf-8?B?K2tybExYcmIzWWdYNFFNQ1hIOEV5VHhvNitRUHNOTVBuVUFXK0FvRm5aR0Jo?=
 =?utf-8?B?YmxHeGlYbUtIYldmWVowcjBKNXZHczBBeU1HdmdvUDFERnhkNlJGVmwwRkY4?=
 =?utf-8?B?bW1tVjErL2lBc0Y5UVA5Zk44dDRIMW9HRGxnWVFFWThLRXZoZlA0SU42MWcx?=
 =?utf-8?B?ZVQ5MjZSZ0ZQSm1kUldMcmhQS1VhMW4vMnZUSVdBaVp6bitxVVBlL1VkTFJx?=
 =?utf-8?B?ckVOd0NnUE1GcjlOOXJ5NkhPbTJOcHBLTVRLNEVPSzZUaEE1TTlPaHR1Vjkz?=
 =?utf-8?B?YlBPUmdvT2JnR1NNNjh4UERIa3p5blMzQWNKV1BKUVRvZEg1cHVnaldueXpw?=
 =?utf-8?B?RzUxQlJ5bnFxWlpVdjd2VWpMYWNOSmV3UWlKRlBSZXhFbUtlVEppaGFnNnBP?=
 =?utf-8?B?L3pTTHlzcmUvb3p6c1NrZXp4djNyZXA5bEcvZUVkclp0VjVQNEdZTlhpdTln?=
 =?utf-8?B?NEdrRlpDV3dsc3hWa0l6QWlENE5VMU9RVWQ3N2d1bnp3QzV1Nmdhc2QvT0Zr?=
 =?utf-8?B?dS9HaytmQkxKSkpyaWk0SnlDQjdZbW0ydzZrL3IrZWRPS3Vrb3FVekVkUWVv?=
 =?utf-8?B?NjJSTWp3Y2lXc3NYZGhmekNCZjYxS2xwNU84WlFPUXJ3QTF5cS9IRnpTblQ4?=
 =?utf-8?B?cjlRVDlrbEtFVFdER2l5dkZtQUtsRHpKVDNlcUxjSHpPNUk5MEpvYmdQS2pC?=
 =?utf-8?B?QlVIWnpKRWIvRm00bTBseGpiYkpJVVBwRUZlZk5TbmNRQzB0ck5hMUFCb2Vj?=
 =?utf-8?B?dmJZcmlTWEZ1MVNPcW1Tckk5L0k2bkEwT3hxVGlHU0FPcnYzN2tOMWhEWStt?=
 =?utf-8?B?dG1Gc3pFYUQxd3lSZFJvZ0xFOVJ5a1ZmK2FtRk5lSnhSTytydVlFcUxoYXB2?=
 =?utf-8?B?RC93QU1mVm5NcUVjVU1IWTZsRHZaVXlMcFF5MG5tMFBaZWp6NEJZYkh0NmZR?=
 =?utf-8?Q?kYE8br8WisAfe1yxsZgNLrZA4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9592109-06d0-435b-b737-08dd203db6c0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5286.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 14:59:19.1396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2m41Q0j9n7mvZK0TR/l0Xo6JTuy1csuKT4T5Fv9sxwonPKOGVgttwILJmau6DDupedEYFpP1O54/8eY1RCoJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273


On 12/3/2024 1:08 AM, Thomas Weißschuh wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
>
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thanks for the patch

Acked-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

> ---
>   drivers/platform/x86/amd/hsmp/acpi.c | 12 ++++++------
>   drivers/platform/x86/amd/hsmp/plat.c | 12 ++++++------
>   2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index dd5b5773328a9aff376a389cbd0109cb8cf0e385..7d802bfe206c73a4570dcd3752faee853bb81485 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -226,7 +226,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>   }
>
>   static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
> -                                        struct bin_attribute *bin_attr, char *buf,
> +                                        const struct bin_attribute *bin_attr, char *buf,
>                                           loff_t off, size_t count)
>   {
>          struct device *dev = container_of(kobj, struct device, kobj);
> @@ -285,19 +285,19 @@ static int init_acpi(struct device *dev)
>          return ret;
>   }
>
> -static struct bin_attribute  hsmp_metric_tbl_attr = {
> +static const struct bin_attribute  hsmp_metric_tbl_attr = {
>          .attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
> -       .read = hsmp_metric_tbl_acpi_read,
> +       .read_new = hsmp_metric_tbl_acpi_read,
>          .size = sizeof(struct hsmp_metric_table),
>   };
>
> -static struct bin_attribute *hsmp_attr_list[] = {
> +static const struct bin_attribute *hsmp_attr_list[] = {
>          &hsmp_metric_tbl_attr,
>          NULL
>   };
>
> -static struct attribute_group hsmp_attr_grp = {
> -       .bin_attrs = hsmp_attr_list,
> +static const struct attribute_group hsmp_attr_grp = {
> +       .bin_attrs_new = hsmp_attr_list,
>          .is_bin_visible = hsmp_is_sock_attr_visible,
>   };
>
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 748bbc35648474370275a80daf2c26e5d732f6ad..1fdcd65d398e6ceca154b804074cbba083f4b7f1 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -59,7 +59,7 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>   }
>
>   static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj,
> -                                        struct bin_attribute *bin_attr, char *buf,
> +                                        const struct bin_attribute *bin_attr, char *buf,
>                                           loff_t off, size_t count)
>   {
>          struct hsmp_socket *sock;
> @@ -97,13 +97,13 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>    * is_bin_visible function is used to show / hide the necessary groups.
>    */
>   #define HSMP_BIN_ATTR(index, _list)                                    \
> -static struct bin_attribute attr##index = {                            \
> +static const struct bin_attribute attr##index = {                      \
>          .attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},       \
>          .private = (void *)index,                                       \
> -       .read = hsmp_metric_tbl_plat_read,                                      \
> +       .read_new = hsmp_metric_tbl_plat_read,                          \
>          .size = sizeof(struct hsmp_metric_table),                       \
>   };                                                                     \
> -static struct bin_attribute _list[] = {                                        \
> +static const struct bin_attribute _list[] = {                          \
>          &attr##index,                                                   \
>          NULL                                                            \
>   }
> @@ -118,8 +118,8 @@ HSMP_BIN_ATTR(6, *sock6_attr_list);
>   HSMP_BIN_ATTR(7, *sock7_attr_list);
>
>   #define HSMP_BIN_ATTR_GRP(index, _list, _name)                 \
> -static struct attribute_group sock##index##_attr_grp = {       \
> -       .bin_attrs = _list,                                     \
> +static const struct attribute_group sock##index##_attr_grp = { \
> +       .bin_attrs_new = _list,                                 \
>          .is_bin_visible = hsmp_is_sock_attr_visible,            \
>          .name = #_name,                                         \
>   }
>
> --
> 2.47.1
>
