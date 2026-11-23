Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795475413;
	b=o9XMQykp9ny8fjLYLsyvcoizGb6ahDsitkG5CrxXE3AbCkIOmlgNbRKKXHeQCbpJfaFU
	 pzACvk0+kYJCeEQbacTRh8L+AUicDw0G+BWizj+WgPFiRuCVZAiYFYkW+bb8C/GYYFBNZ
	 N9idRR4g6F82T2NmCBYYESUx3JphvmXmqDj3FQLpyzkIO8thgg/4ILmae7dvjm9OgcWcs
	 iiH4pfYG41IyLm28E2HgCk8kZq4WpyfCTN1uKSZ5YmDtDpKdLgFZ0l7hYzzT5x54Nzji+
	 TO8+enuf8yJ9KhugjtsHakkm13AmcchN1Ni9XCyPg48Mmp6q0Of4AxjcfVAu/Gd6BAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475413;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IFKU35uHbs1TwZ3j7PkoQqzA03hJBsAFgEC08EC+dlY=;
	b=2yWWeXhvy94r5zCgdjH7RBtdSvDJpFbp6HNGnaB7obk85G2VEjvM6bYzs+i8SxGlgDRE
	 /qk++c1b3fsKGGphtDGGWAjwzjH+69QjYOqahPsofp4MuKPaCJDaUY+SaL/o+SQFCuQri
	 AgDRMOMQ1K7As7DDeg4ONZFCYj/2jNeiQMo0dDvj0SivdMvPH05b4UMctVUpx5JF/6gxt
	 +gZf/SBiaCYu9Shvt8F9XVnl86JUt5JIYR2ZpJrM1+uCJ/2SsU3qc9xRq1FCKvVoE/7uM
	 5bLMXqTGZgxt0eSFQXO+tbqoE6uLA+lqsfuFLv8CxMn+1/ammuqt8Und7ujxhiZ3plg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ti+D1p0P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.34
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012034.outbound.protection.outlook.com [40.107.209.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8F606A32A;
	Mon, 23 Nov 2026 23:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DA8F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ti+D1p0P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPU++6N4rNNfGea1cUjM5fjqpaj1Y+8W864GmfYOzEBJeqXT5WAk09eZuPMzsYAHJkW8EUXOhDDIZXRoxGMJhInT+XpdgEzWn7ghUgoBGU7K5DR6GsK94GLX14HI3sHWO0wyZqM9sFesff0Jyu4GPTlHz0EV82RtpKjn6zhzwbcXA8CeYqDdCCB+JzHYyE7SQbI3e64Lp3+k3RBScEEng67eHvMctctKs+U5YTIAzhKm1i7lMbyYxmwwgTmGI/e84Qf4wCQmxyhDWdRXu8uaoOEJvpiOmQr80D+xy4vELnMEaF+4hOxyfZN2YFxNkA7FGftt47H3O3/poehRqAEhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFKU35uHbs1TwZ3j7PkoQqzA03hJBsAFgEC08EC+dlY=;
 b=XSe3e91v90cWq2n5lR+kIUkEdPsB0vhv18dg+ZV3OcZkHIbOgJAzk7n+LRgZzaxjPNdYML9otlDPT5Feqdg8okpfIIWXuhLHzS/Phm6AWhhtrSwItVggeSOe5yZ11Ua4nU8RoCoKjrXtw+OV5/xyLN9Uc8DkXe9CllG5zi36bbSh+eqmVdov+VXSb/ERPP7PkoQ/34O6mz5VEM4EcERiZhGVhYB167lv0m27JkfwKF+0Y6JFsgrNSFhnJRS3z9KSJgLZDH9stxWMSWM755+Eqdww/iGNjLxbMf0I1/TCxOacJOueypz1EBpfB4Ioz0pE+gYk1zThAe/zlujSbDaQZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFKU35uHbs1TwZ3j7PkoQqzA03hJBsAFgEC08EC+dlY=;
 b=ti+D1p0PIG0T3/7oKoLH5W+2nrajp/FAJwOB0rmdRvhvDIj5BtskP6bX0BrKP2rIqOiZyBttLNHE+xyE8ORV1a8JwsNhp7XnDMWxBjajKFJEfUG7haKylo2Beu+6HGFrt8N5IJ6uxDnpTTRGs9BfK+7R7NOCLbxf+4ggszyC7HsQJ0C4KihbG6peKLTW4GOQOsFs7vHXBYfFmhwkeIR4fEsrYkYZXODQDlVwSlCG9KKD7iBIi5zsw2JkvgrSOnS1boBNozr9NwXCQ3gA0aVHzpv85BzHKDuwG2B4XAfOp5VGEsweSY/wxusNBR9hU2oJ4Let3S0J/489rI87dbOeVQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 23:10:05 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 23:10:05 +0000
From: Brian Mak <bmak@nvidia.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: David Cemin <dcemin@nvidia.com>,
	Lucas De Marchi <ldemarchi@nvidia.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Brian Mak <bmak@nvidia.com>
Subject: [PATCH v2 03/10] platform: dell: Move out of x86 directory
Date: Mon, 23 Nov 2026 15:08:54 -0800
Message-ID: <20261123230905.13899-4-bmak@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123230905.13899-1-bmak@nvidia.com>
References: <20261123230905.13899-1-bmak@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To MN0PR12MB5786.namprd12.prod.outlook.com
 (2603:10b6:208:375::13)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5786:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: e42d6636-9694-4722-a5c2-08df49b6e92d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|23010399003|10067099003|11063799006|56012099006|261009223027099003|261021123027099003|261021135927099003|261021121427099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|261026121527099003|3023799007|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	e3iNZnVHsyWfZEo9Kia5aVsYTEWa5LNOlIL1PMUpqBkIO9v9bnM6eTWUh1muufv3oPLeGW+wBs28Oali2WgtqXwgfbB11fWVrhOaqyM9C5Q/N8KgM6AuF2x0xGRrpKMRKjqX7r0cX9jW9/7FjkxzbQP30U4+mOXAqk4VgP22FSro8vlZmeoeyNR0XKTmInn6nsiNtakGxvFo714TJ6bd/STQimR4T3KZ3Vp3v2BK3OgVME6Tp9GwqX74NVrWBtHXNcRRyfT9LWZnx1+Tf4BIowcfg8bdTPDojZusntq8NZ/saPAPN7V7prU8LZZ570vxLmatWaM0DqHpzgA6arOD+FUcot3wNgFaEtEMM3qfyqQjJ26bSf4ZzUXMNYqS2cqNFsYASbMcxir2PFIhhDEYsSnzxPa1fpkY0WNS2iFJlHEE9ri7IBqriQqsN5DdOGMAMW5jv0e39+IKo8PmBkzY6+tEVshw1IMrLg/V3JjGHeaPyRPo/0X9sMwzM+IpOoq8oKpYirrtCSbRoQaH0wtymPu2b8vRsV32LAtzo+HEVVB6xRjAuw26ZYeMOXc6a/CCEn5oOPxqkFERGUu4IbvUar3z7//UYvdO0x52zrCCnRk4JERnZ+bo1q5c123iCT2gpnAFYZzTVdpA9hpLbqWsPtgggacP5KYFqXVohlu0Pa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261026121527099003)(3023799007)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGQvakhxNnJwYlAzcHVKbWRYMnpVeUw5eHBxVGhIL1ZxMzRFVEYwRzhjMWM1?=
 =?utf-8?B?YWl6MzVXR1k0WXNKamNvSmdoYnZLNHdBRXVIZ1BFdkdILzRvYis3OUdzK0ls?=
 =?utf-8?B?aFhORy82aHR1QnBJdVgxcGpJZFZjWHEwcGY3VjVGVnhmZ05UaUd4dGZLN095?=
 =?utf-8?B?K2YwSkw0Q0RYRXRLK2M2TDQyT2VvREMzNWEvQ0tHWDFGd1ZlWTZ6NFd5UW94?=
 =?utf-8?B?bW5pcUhXb0hDQStlODhUbzFSNndMVGc0UjUxVFZUNTNNUDlqMVJCSDlORXdR?=
 =?utf-8?B?LzVTWVpDL2RXNEJLOGVPVUNNWllCN0xRR1ViZDJUTWZ6WWdHbS9jeUhsb3Mv?=
 =?utf-8?B?My9HTzgxMDhZeEloYW1QU2hJUmQyNFZCbklyUFdJczNZUEZUdk80bUVsL2dU?=
 =?utf-8?B?aE9JYTZyVjcrclFsWmtVbjBjK1ZvNkRIYVhGdnRJcG0zMnE0TEd0ZUI5djF3?=
 =?utf-8?B?SXNvUWVTYWFjVjNpNFUyYjhXNE9WZStMclN1L25JNUlwcFJEbTN1QllzZXFq?=
 =?utf-8?B?N0F4R1BkOWZneE0vRFZJTHFmaHZyQ0JaaWhrckNFVmdkRE53SWMvU2FiWkg2?=
 =?utf-8?B?SFI3SnJXbXFpSXVTNDJXZllJT1QvQU1kR0dTV250Y1Q1Nmo3VTJqYnJ0SWMw?=
 =?utf-8?B?Ym5kbjBncVZrUWpRZCtUbXUvMmVNWWxHZlo4a0p5bFRmRGVWYysyU1lJOGhj?=
 =?utf-8?B?NTI2T010TWZud29mbHovcXRVNXptdEFCb3A5MVZsZGR0My9DY3VCRUNQc3hr?=
 =?utf-8?B?L2s5cEd5UlBXR1ZHVTB3SFdoMUlRSEljbmZKcnhzNGJBd3d4MzMvcExBZTdZ?=
 =?utf-8?B?WmV0S1lLWm1nUU81Qm1oY0M5cWtSMFd5cmJiZitrcE5KZFQzY2F5SGl3TjFs?=
 =?utf-8?B?S0NwRHNkVzdORVBrdzRrVXFLekwxeGsrWXRnSmhLenZ3K0xXYklYbWFCWWMz?=
 =?utf-8?B?Q2pCQnVtOXZyUE1hTEdCRmdMbkVvM3J3bXh2ZnJoR1lPSGR0bFdyMC9xSzZQ?=
 =?utf-8?B?WU8zSnR4cW9GczJrdjBMeEsyUzVZWEczTzduN2VzcWdNWFRGOHUrZmRNRm1H?=
 =?utf-8?B?c2tuWS96QlJOeWFOaWt4Rm5FWDJtZHlkb08zNzh3UjNhUHpXWVFRc1JrdXZ3?=
 =?utf-8?B?VFNDQWFwenpqYi94N0ora1JCNjR1VS96Nk9kMzV0U3lRRy8zNGRaWW1DSUdP?=
 =?utf-8?B?VlZaVmpqa24zN0FjMXpMeHpRVjc1UHk1WXJZQVo2c3FRMlNPazNuNmVUWkhj?=
 =?utf-8?B?NjVmRkVWaXBET2lMa2JmbTNXOUlmZXZ1blY4bEhzbldMMlVlaGZzU0JmNFNV?=
 =?utf-8?B?bE5vN0lJVVl1UGU5QjNJVzNDRkNJODc3cFNyeGdvVC9tRDhrbUxYWUkxc2wv?=
 =?utf-8?B?MFdLZjNjQWNxTXhibWVUM0I3aUlZejFNcHZCK0JoeTVLK0M3UmRNeEJ6TERh?=
 =?utf-8?B?bEJOWksrQXptWngzTkxObVd5bkt4ODU1NUtubXdnTWlUM0VtR2dQRWpwVHht?=
 =?utf-8?B?MVI1OUxIczZRcjlGd3BRdytPMUtzQzlJV0xabTFsck1OV1JadVNRWkZ3YTNi?=
 =?utf-8?B?OGllUkNwQlV1SkIxUTRIWTRjR1VQc29HajlFTktaME1oMkN2bEJ6SGI1bGto?=
 =?utf-8?B?WmxxWGVXWllBYzdJaW12Y1V2a3J4cXcwY0dRK0tOelVwSFdsaS9EbFFDdEFx?=
 =?utf-8?B?ZWZ2ZUVaL2hCaHlBSkN2Y0Nwd3dNdHBPaWt0dzE5UDhJZytyUkZjU3N0TXhV?=
 =?utf-8?B?MlZhWGs4NW1wd2lCMllCT0NwYWpLSnllaC9VdjVCYU85ckJrdDdQNnNGby8w?=
 =?utf-8?B?V0hKeVFkRVFKdlFYWkk5bElDYnRZVVN6bW1HcnIvT1FCL0pqTDhuRmhzRHBq?=
 =?utf-8?B?YzJDTFhaQjZ4MjlncnZBKzM5WmFqN25uSCtmYmZTUFo4emVGdjhXNXR1ZDlv?=
 =?utf-8?B?Y1dmQzI2Y1VhZWs2ZkhJMjZ2NjFWR1k0MlNWdmlvd0NpZ3RFaGRva2g1WjZI?=
 =?utf-8?B?ZHNDNWo1UXZQT1pLQjJFdHFRZUwzemtwRlF4d0YydThIN2ZWWjNFUUk3Smhx?=
 =?utf-8?B?dmhGQWk4YnE4ZG15VWRxU2FsOW5FZ0ZROThQZGlieGMyWHJuWTZmTHQxM3di?=
 =?utf-8?B?S05JNytOei83R1dqWGdNcUhoT09VYXVuVVUzOUNLZHlUM3V3N25JRkhtNnM5?=
 =?utf-8?B?OVBRMWRlOC93RVhZU1ZCNXpvYzV4SUtVZUo2QXNNcGtHM0xJRnJsZ3FCUjla?=
 =?utf-8?B?Sk5NUWRRem9oUUdmUzBzTVpYcVRHdFpaSnJpZzVWRWhXWmV0NXM3d21lMHlC?=
 =?utf-8?B?MjJjZTVoQS92Z2VXZWRvQUV4aFRUdlNyMjRzOUJCMXdWSTZuUU5ZQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e42d6636-9694-4722-a5c2-08df49b6e92d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 23:10:05.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t9JR0R6Jip9/1HY7FL9RgUEDB06z5DBPSKpXBV0o35dXzDkqAsh5GX6JQgQChdRT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459

With the introduction of the Dell XPS 16 Creator Edition, Dell platform
drivers are no longer just applicable to x86, but also ARM64. Move Dell
platform drivers out of the x86 directory, so they can be reused for
ARM64.

Rename CONFIG_X86_PLATFORM_DRIVERS_DELL to CONFIG_DELL_PLATFORMS, and
add a transitional config.

Signed-off-by: Brian Mak <bmak@nvidia.com>
---
 .../admin-guide/laptops/alienware-wmi.rst     |  4 +--
 MAINTAINERS                                   | 30 +++++++++----------
 drivers/platform/Kconfig                      |  2 ++
 drivers/platform/Makefile                     |  1 +
 drivers/platform/{x86 => }/dell/Kconfig       | 18 +++++++----
 drivers/platform/{x86 => }/dell/Makefile      |  4 +--
 .../{x86 => }/dell/alienware-wmi-base.c       |  0
 .../{x86 => }/dell/alienware-wmi-legacy.c     |  0
 .../{x86 => }/dell/alienware-wmi-wmax.c       |  0
 .../platform/{x86 => }/dell/alienware-wmi.h   |  0
 drivers/platform/{x86 => }/dell/dcdbas.c      |  0
 drivers/platform/{x86 => }/dell/dcdbas.h      |  0
 .../{x86 => }/dell/dell-dw5826e-reset.c       |  0
 drivers/platform/{x86 => }/dell/dell-laptop.c |  0
 .../platform/{x86 => }/dell/dell-lis3lv02d.c  |  0
 drivers/platform/{x86 => }/dell/dell-pc.c     |  0
 drivers/platform/{x86 => }/dell/dell-rbtn.c   |  0
 drivers/platform/{x86 => }/dell/dell-rbtn.h   |  0
 .../{x86 => }/dell/dell-smbios-base.c         |  0
 .../platform/{x86 => }/dell/dell-smbios-smm.c |  0
 .../platform/{x86 => }/dell/dell-smbios-wmi.c |  0
 drivers/platform/{x86 => }/dell/dell-smbios.h |  0
 .../{x86 => }/dell/dell-smo8800-ids.h         |  0
 .../platform/{x86 => }/dell/dell-smo8800.c    |  0
 .../{x86 => }/dell/dell-uart-backlight.c      |  2 +-
 .../platform/{x86 => }/dell/dell-wmi-aio.c    |  0
 .../platform/{x86 => }/dell/dell-wmi-base.c   |  0
 .../platform/{x86 => }/dell/dell-wmi-ddv.c    |  0
 .../{x86 => }/dell/dell-wmi-descriptor.c      |  0
 .../{x86 => }/dell/dell-wmi-descriptor.h      |  0
 .../platform/{x86 => }/dell/dell-wmi-led.c    |  0
 .../{x86 => }/dell/dell-wmi-privacy.c         |  0
 .../{x86 => }/dell/dell-wmi-privacy.h         |  0
 .../{x86 => }/dell/dell-wmi-sysman/Makefile   |  0
 .../dell/dell-wmi-sysman/biosattr-interface.c |  0
 .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  0
 .../dell/dell-wmi-sysman/enum-attributes.c    |  0
 .../dell/dell-wmi-sysman/int-attributes.c     |  0
 .../dell/dell-wmi-sysman/passobj-attributes.c |  0
 .../dell-wmi-sysman/passwordattr-interface.c  |  0
 .../dell/dell-wmi-sysman/string-attributes.c  |  0
 .../{x86 => }/dell/dell-wmi-sysman/sysman.c   |  0
 drivers/platform/{x86 => }/dell/dell_rbu.c    |  0
 drivers/platform/x86/Kconfig                  |  2 --
 drivers/platform/x86/Makefile                 |  3 --
 .../x86/dell-uart-backlight-emulator/README   |  4 +--
 46 files changed, 37 insertions(+), 33 deletions(-)
 rename drivers/platform/{x86 => }/dell/Kconfig (96%)
 rename drivers/platform/{x86 => }/dell/Makefile (93%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-base.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-legacy.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi-wmax.c (100%)
 rename drivers/platform/{x86 => }/dell/alienware-wmi.h (100%)
 rename drivers/platform/{x86 => }/dell/dcdbas.c (100%)
 rename drivers/platform/{x86 => }/dell/dcdbas.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-dw5826e-reset.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-laptop.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-lis3lv02d.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-pc.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-rbtn.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-rbtn.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-base.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-smm.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios-wmi.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-smbios.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-smo8800-ids.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-smo8800.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-uart-backlight.c (99%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-aio.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-base.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-ddv.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-descriptor.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-descriptor.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-led.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-privacy.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-privacy.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/Makefile (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/biosattr-interface.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/dell-wmi-sysman.h (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/enum-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/int-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/passobj-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/passwordattr-interface.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/string-attributes.c (100%)
 rename drivers/platform/{x86 => }/dell/dell-wmi-sysman/sysman.c (100%)
 rename drivers/platform/{x86 => }/dell/dell_rbu.c (100%)

diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Documentation/admin-guide/laptops/alienware-wmi.rst
index e532c60db8e2..2156d46e4b74 100644
--- a/Documentation/admin-guide/laptops/alienware-wmi.rst
+++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
@@ -40,8 +40,8 @@ parameters:
 
 If the module loads successfully with these parameters, consider submitting a
 patch adding your model to the ``awcc_dmi_table`` located in
-``drivers/platform/x86/dell/alienware-wmi-wmax.c`` or contacting the maintainer
-for further guidance.
+``drivers/platform/dell/alienware-wmi-wmax.c`` or contacting the maintainer for
+further guidance.
 
 Status
 ------
diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb2b8..bfbe3d748e7c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -868,7 +868,7 @@ F:	Documentation/ABI/testing/debugfs-alienware-wmi
 F:	Documentation/ABI/testing/sysfs-platform-alienware-wmi
 F:	Documentation/admin-guide/laptops/alienware-wmi.rst
 F:	Documentation/wmi/devices/alienware-wmi.rst
-F:	drivers/platform/x86/dell/alienware-wmi*
+F:	drivers/platform/dell/alienware-wmi*
 
 ALLEGRO DVT VIDEO IP CORE DRIVER
 M:	Michael Tretter <m.tretter@pengutronix.de>
@@ -7451,17 +7451,17 @@ M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali@kernel.org>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-laptop.c
+F:	drivers/platform/dell/dell-laptop.c
 
 DELL LAPTOP FREEFALL DRIVER
 M:	Pali Rohár <pali@kernel.org>
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-smo8800.c
+F:	drivers/platform/dell/dell-smo8800.c
 
 DELL LAPTOP RBTN DRIVER
 M:	Pali Rohár <pali@kernel.org>
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-rbtn.*
+F:	drivers/platform/dell/dell-rbtn.*
 
 DELL LAPTOP SMM DRIVER
 M:	Pali Rohár <pali@kernel.org>
@@ -7474,32 +7474,32 @@ DELL PC DRIVER
 M:	Lyndon Sanche <lsanche@lyndeno.ca>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-pc.c
+F:	drivers/platform/dell/dell-pc.c
 
 DELL REMOTE BIOS UPDATE DRIVER
 M:	Stuart Hayes <stuart.w.hayes@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell_rbu.c
+F:	drivers/platform/dell/dell_rbu.c
 
 DELL SMBIOS DRIVER
 M:	Pali Rohár <pali@kernel.org>
 L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-smbios.*
+F:	drivers/platform/dell/dell-smbios.*
 
 DELL SMBIOS SMM DRIVER
 L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-smbios-smm.c
+F:	drivers/platform/dell/dell-smbios-smm.c
 
 DELL SMBIOS WMI DRIVER
 L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-smbios-wmi.c
+F:	drivers/platform/dell/dell-smbios-wmi.c
 F:	tools/wmi/dell-smbios-example.c
 
 DELL SYSTEMS MANAGEMENT BASE DRIVER (dcdbas)
@@ -7507,7 +7507,7 @@ M:	Stuart Hayes <stuart.w.hayes@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/userspace-api/dcdbas.rst
-F:	drivers/platform/x86/dell/dcdbas.*
+F:	drivers/platform/dell/dcdbas.*
 
 DELL WMI DDV DRIVER
 M:	Armin Wolf <W_Armin@gmx.de>
@@ -7515,24 +7515,24 @@ S:	Maintained
 F:	Documentation/ABI/testing/debugfs-dell-wmi-ddv
 F:	Documentation/ABI/testing/sysfs-platform-dell-wmi-ddv
 F:	Documentation/wmi/devices/dell-wmi-ddv.rst
-F:	drivers/platform/x86/dell/dell-wmi-ddv.c
+F:	drivers/platform/dell/dell-wmi-ddv.c
 
 DELL WMI DESCRIPTOR DRIVER
 L:	Dell.Client.Kernel@dell.com
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-wmi-descriptor.c
+F:	drivers/platform/dell/dell-wmi-descriptor.c
 
 DELL WMI HARDWARE PRIVACY SUPPORT
 L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-wmi-privacy.c
+F:	drivers/platform/dell/dell-wmi-privacy.c
 
 DELL WMI NOTIFICATIONS DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali@kernel.org>
 S:	Maintained
-F:	drivers/platform/x86/dell/dell-wmi-base.c
+F:	drivers/platform/dell/dell-wmi-base.c
 
 DELL WMI SYSMAN DRIVER
 M:	Prasanth Ksr <prasanth.ksr@dell.com>
@@ -7540,7 +7540,7 @@ L:	Dell.Client.Kernel@dell.com
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
-F:	drivers/platform/x86/dell/dell-wmi-sysman/
+F:	drivers/platform/dell/dell-wmi-sysman/
 
 DELTA AHE-50DC FAN CONTROL MODULE DRIVER
 M:	Zev Weiss <zev@bewilderbeest.net>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 312788f249c9..92a395bbd9ab 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -15,6 +15,8 @@ source "drivers/platform/olpc/Kconfig"
 
 source "drivers/platform/surface/Kconfig"
 
+source "drivers/platform/dell/Kconfig"
+
 source "drivers/platform/x86/Kconfig"
 
 source "drivers/platform/arm64/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index fa322e7f8716..385c33c94f24 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_CZNIC_PLATFORMS)	+= cznic/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
+obj-$(CONFIG_DELL_PLATFORMS)	+= dell/
 obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+= arm64/
 obj-$(CONFIG_BCM2835_VCHIQ)	+= raspberrypi/
 obj-$(CONFIG_ACPI_WMI)		+= wmi/
diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/dell/Kconfig
similarity index 96%
rename from drivers/platform/x86/dell/Kconfig
rename to drivers/platform/dell/Kconfig
index 4c28d4c008fc..7030f817b6af 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/dell/Kconfig
@@ -1,18 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
-# Dell X86 Platform Specific Drivers
+# Dell Platform Specific Drivers
 #
 
-menuconfig X86_PLATFORM_DRIVERS_DELL
-	bool "Dell X86 Platform Specific Device Drivers"
+menuconfig DELL_PLATFORMS
+	bool "Dell Platform Specific Device Drivers"
+	depends on X86 || ARM64 || COMPILE_TEST
+	default X86_PLATFORM_DRIVERS_DELL
 	help
 	  Say Y here to get to see options for device drivers for various
-	  Dell x86 platforms, including vendor-specific laptop extension drivers.
+	  Dell platforms, including vendor-specific laptop extension drivers.
 	  This option alone does not add any kernel code.
 
 	  If you say N, all options in this submenu will be skipped and disabled.
 
-if X86_PLATFORM_DRIVERS_DELL
+if DELL_PLATFORMS
 
 config ALIENWARE_WMI
 	tristate "Alienware Special feature control"
@@ -282,4 +284,8 @@ config DELL_DW5826E_RESET
 	depends on ACPI
 	help
 	  This adds support for the Dell DW5826e PLDR reset via ACPI
-endif # X86_PLATFORM_DRIVERS_DELL
+endif # DELL_PLATFORMS
+
+config X86_PLATFORM_DRIVERS_DELL
+	bool
+	transitional
diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/dell/Makefile
similarity index 93%
rename from drivers/platform/x86/dell/Makefile
rename to drivers/platform/dell/Makefile
index 470874c6e6e6..115511258924 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/dell/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 #
-# Makefile for linux/drivers/platform/x86/dell
-# Dell x86 Platform-Specific Drivers
+# Makefile for linux/drivers/platform/dell
+# Dell Platform-Specific Drivers
 #
 
 obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/dell/alienware-wmi-base.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi-base.c
rename to drivers/platform/dell/alienware-wmi-base.c
diff --git a/drivers/platform/x86/dell/alienware-wmi-legacy.c b/drivers/platform/dell/alienware-wmi-legacy.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi-legacy.c
rename to drivers/platform/dell/alienware-wmi-legacy.c
diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/dell/alienware-wmi-wmax.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi-wmax.c
rename to drivers/platform/dell/alienware-wmi-wmax.c
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/dell/alienware-wmi.h
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi.h
rename to drivers/platform/dell/alienware-wmi.h
diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/dell/dcdbas.c
similarity index 100%
rename from drivers/platform/x86/dell/dcdbas.c
rename to drivers/platform/dell/dcdbas.c
diff --git a/drivers/platform/x86/dell/dcdbas.h b/drivers/platform/dell/dcdbas.h
similarity index 100%
rename from drivers/platform/x86/dell/dcdbas.h
rename to drivers/platform/dell/dcdbas.h
diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/dell/dell-dw5826e-reset.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-dw5826e-reset.c
rename to drivers/platform/dell/dell-dw5826e-reset.c
diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/dell/dell-laptop.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-laptop.c
rename to drivers/platform/dell/dell-laptop.c
diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/dell/dell-lis3lv02d.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-lis3lv02d.c
rename to drivers/platform/dell/dell-lis3lv02d.c
diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/dell/dell-pc.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-pc.c
rename to drivers/platform/dell/dell-pc.c
diff --git a/drivers/platform/x86/dell/dell-rbtn.c b/drivers/platform/dell/dell-rbtn.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-rbtn.c
rename to drivers/platform/dell/dell-rbtn.c
diff --git a/drivers/platform/x86/dell/dell-rbtn.h b/drivers/platform/dell/dell-rbtn.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-rbtn.h
rename to drivers/platform/dell/dell-rbtn.h
diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/dell/dell-smbios-base.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-smbios-base.c
rename to drivers/platform/dell/dell-smbios-base.c
diff --git a/drivers/platform/x86/dell/dell-smbios-smm.c b/drivers/platform/dell/dell-smbios-smm.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-smbios-smm.c
rename to drivers/platform/dell/dell-smbios-smm.c
diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/dell/dell-smbios-wmi.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-smbios-wmi.c
rename to drivers/platform/dell/dell-smbios-wmi.c
diff --git a/drivers/platform/x86/dell/dell-smbios.h b/drivers/platform/dell/dell-smbios.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-smbios.h
rename to drivers/platform/dell/dell-smbios.h
diff --git a/drivers/platform/x86/dell/dell-smo8800-ids.h b/drivers/platform/dell/dell-smo8800-ids.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-smo8800-ids.h
rename to drivers/platform/dell/dell-smo8800-ids.h
diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/dell/dell-smo8800.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-smo8800.c
rename to drivers/platform/dell/dell-smo8800.c
diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/dell/dell-uart-backlight.c
similarity index 99%
rename from drivers/platform/x86/dell/dell-uart-backlight.c
rename to drivers/platform/dell/dell-uart-backlight.c
index bbb270ae3697..da43e25200cd 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/dell/dell-uart-backlight.c
@@ -21,7 +21,7 @@
 #include <linux/types.h>
 #include <linux/wait.h>
 #include <acpi/video.h>
-#include "../serdev_helpers.h"
+#include "../x86/serdev_helpers.h"
 
 /* The backlight controller must respond within 1 second */
 #define DELL_BL_TIMEOUT		msecs_to_jiffies(1000)
diff --git a/drivers/platform/x86/dell/dell-wmi-aio.c b/drivers/platform/dell/dell-wmi-aio.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-aio.c
rename to drivers/platform/dell/dell-wmi-aio.c
diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/dell/dell-wmi-base.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-base.c
rename to drivers/platform/dell/dell-wmi-base.c
diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/dell/dell-wmi-ddv.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-ddv.c
rename to drivers/platform/dell/dell-wmi-ddv.c
diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/platform/dell/dell-wmi-descriptor.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-descriptor.c
rename to drivers/platform/dell/dell-wmi-descriptor.c
diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.h b/drivers/platform/dell/dell-wmi-descriptor.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-descriptor.h
rename to drivers/platform/dell/dell-wmi-descriptor.h
diff --git a/drivers/platform/x86/dell/dell-wmi-led.c b/drivers/platform/dell/dell-wmi-led.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-led.c
rename to drivers/platform/dell/dell-wmi-led.c
diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platform/dell/dell-wmi-privacy.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-privacy.c
rename to drivers/platform/dell/dell-wmi-privacy.c
diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.h b/drivers/platform/dell/dell-wmi-privacy.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-privacy.h
rename to drivers/platform/dell/dell-wmi-privacy.h
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/Makefile b/drivers/platform/dell/dell-wmi-sysman/Makefile
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/Makefile
rename to drivers/platform/dell/dell-wmi-sysman/Makefile
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c b/drivers/platform/dell/dell-wmi-sysman/biosattr-interface.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
rename to drivers/platform/dell/dell-wmi-sysman/biosattr-interface.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h b/drivers/platform/dell/dell-wmi-sysman/dell-wmi-sysman.h
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
rename to drivers/platform/dell/dell-wmi-sysman/dell-wmi-sysman.h
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c b/drivers/platform/dell/dell-wmi-sysman/enum-attributes.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c
rename to drivers/platform/dell/dell-wmi-sysman/enum-attributes.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c b/drivers/platform/dell/dell-wmi-sysman/int-attributes.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/int-attributes.c
rename to drivers/platform/dell/dell-wmi-sysman/int-attributes.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c b/drivers/platform/dell/dell-wmi-sysman/passobj-attributes.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/passobj-attributes.c
rename to drivers/platform/dell/dell-wmi-sysman/passobj-attributes.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/dell/dell-wmi-sysman/passwordattr-interface.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
rename to drivers/platform/dell/dell-wmi-sysman/passwordattr-interface.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c b/drivers/platform/dell/dell-wmi-sysman/string-attributes.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/string-attributes.c
rename to drivers/platform/dell/dell-wmi-sysman/string-attributes.c
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/dell/dell-wmi-sysman/sysman.c
similarity index 100%
rename from drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
rename to drivers/platform/dell/dell-wmi-sysman/sysman.c
diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/dell/dell_rbu.c
similarity index 100%
rename from drivers/platform/x86/dell/dell_rbu.c
rename to drivers/platform/dell/dell_rbu.c
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e0475e..42ffe63d0a39 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -392,8 +392,6 @@ config EEEPC_WMI
 	  If you have an ACPI-WMI compatible Eee PC laptop (>= 1000), say Y or M
 	  here.
 
-source "drivers/platform/x86/dell/Kconfig"
-
 config AMILO_RFKILL
 	tristate "Fujitsu-Siemens Amilo rfkill support"
 	depends on RFKILL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 229057234d00..3bb983a641ca 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -44,9 +44,6 @@ obj-$(CONFIG_AYANEO_EC)		+= ayaneo-ec.o
 # Cisco/Meraki
 obj-$(CONFIG_MERAKI_MX100)	+= meraki-mx100.o
 
-# Dell
-obj-$(CONFIG_X86_PLATFORM_DRIVERS_DELL)		+= dell/
-
 # Fujitsu
 obj-$(CONFIG_AMILO_RFKILL)	+= amilo-rfkill.o
 obj-$(CONFIG_FUJITSU_LAPTOP)	+= fujitsu-laptop.o
diff --git a/tools/arch/x86/dell-uart-backlight-emulator/README b/tools/arch/x86/dell-uart-backlight-emulator/README
index c0d8e52046ee..d38d91abcf8c 100644
--- a/tools/arch/x86/dell-uart-backlight-emulator/README
+++ b/tools/arch/x86/dell-uart-backlight-emulator/README
@@ -13,8 +13,8 @@ With the DELL0501 indicating that we are dealing with an UART with
 the backlight controller board attached.
 
 This small emulator allows testing
-the drivers/platform/x86/dell/dell-uart-backlight.c driver without access
-to an actual Dell All In One.
+the drivers/platform/dell/dell-uart-backlight.c driver without access to
+an actual Dell All In One.
 
 This requires:
 1. A (desktop) PC with a 16550 UART on the motherboard and a standard DB9
-- 
2.53.0

