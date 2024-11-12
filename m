Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436B9213148
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731433611; cv=fail; b=BFEiiRRj7LQ32zoDheIKYyn8Rcl66CEZm5/0buBdBX0p6lFEJr6DAjhbbqxQbHuj66C2PfjUqdSp0IEvWXdMheTrJv2rPewoofqMzmy8PknPeswvE2ukSxTTTvRzuYZEueZ3COe6QoLC80RemTF+i354NOt0CwuXpfHJ4MIWdC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731433611; c=relaxed/simple;
	bh=txj4VrArZ/300a6Smga8KwysWevz8xdIkIHoPQy/jCA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LfWRe/AsUWtPKMS4qOtB+A7625QUfpbZKshKhrd0lgz9+4lj1KOvUTdYRy5xVvmpuUKDjJmDEEBPihSXUY3b2XaoiVWi3KMDOvvl4GeonOQ/2Jugz9KlEtOZDram7GnagO48gCSrmMfe4XyCENvAP2zg3+LF932+WPcRlnXAwjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hXSM82PN; arc=fail smtp.client-ip=40.107.236.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hXSM82PN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFmZTCGQA+I5WlgXIbxz/eMHiqqCNDFCXVUF+ZBl3NA+5XEjaUMBoA1fzfz0OT7KQXhLlSoF4ERZQbmc7TCaQI2LKAD/JSQU1GVSzZcs1jd3UfMFuRKOQHDA+R3NcnGcOSH3GtFkztriOJSsnwscqFsL/fhpqg3NQU4l3JSr9wVvJQYxKRtHrETVXxkiVUT3OHEg1a6KcD74IJs6NBZ1/jB7jmWQYld5tLtOCPFpnL9aRmjG4Xmb6XhcAQ+QKHkI6+5O1wBsaf8Lb7XFyVmgkduwEw42NKmG6bQIzuFld6FPFfEBSBRhMndCrZ5hUIVdV4k2aFrU1o7AfeHaFRX9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0O7yPAOjALK4TNmCOQYoWqjBQDcAPFO29ttRASyTMbI=;
 b=ZYESKkoHfP7xhYO5Nusaw+Brkb5mu5Y3OhB1L1yyFVAF06BIoCCXXZ6ukac56sX/lBkug3SxGf+am83hL9lFfz7gebZmReRlfh600V6O/39aqhgbb/GR1/t8l9Qi8I8fxMq2oakJy6ngkFJr5Z5NL/3w/dmUaFEo2D5sxhXbm1I/of+VXs7yi92Mpq07+faQQp5hl7EZSgcvKn4Stz5nEEb5UcOfwYhhySyv/JhGX9tLsrstrFNmKHTmK8AeeOEogDX/OhO/3O8WxytZLnSXTydL/kfZcPDdnfFBIBuZJAF2jf5BrBwWNeNPxghd7aJzYBVAN4cEygFbTXWnsYkZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0O7yPAOjALK4TNmCOQYoWqjBQDcAPFO29ttRASyTMbI=;
 b=hXSM82PNW1/bmaw5/6E7Fcfc4NqdkW0Bmy1Bs0y+xtnqWiwyp5xah/K+9XFgmZ+c1jv1D5EaIkT5Ysps7Nq/xMKwSP1lLjjS9/9PxjCBxMPXIsWeAiDtV58Xt6yZSIR8glLQSHAkK59wphsXp9cSYhgVp35BOj91aVyXkvDPOU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB9496.namprd12.prod.outlook.com (2603:10b6:610:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 17:46:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 17:46:45 +0000
Message-ID: <faa64967-fc02-4a36-9e3f-c1c53c31ab90@amd.com>
Date: Tue, 12 Nov 2024 11:46:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: Why is wmi_bus_type not exported?
To: Werner Sembach <wse@tuxedocomputers.com>, Armin Wolf <W_Armin@gmx.de>,
 platform-driver-x86@vger.kernel.org
Cc: Christoffer Sandberg <cs@tuxedo.de>
References: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
 <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
 <bf3dae8b-7f1f-4438-9cbe-525825d70752@tuxedocomputers.com>
 <aa129cb8-2b1d-4912-b731-74e959b99da6@gmx.de>
 <cc1721a1-bb2f-4dde-a8a5-3d4928439520@tuxedocomputers.com>
 <b2c8616e-7097-4e27-b5e4-b1fb1790857e@gmx.de>
 <663b2c15-d03e-4ff3-b0f3-54ae8403c133@tuxedocomputers.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <663b2c15-d03e-4ff3-b0f3-54ae8403c133@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0156.namprd13.prod.outlook.com
 (2603:10b6:806:28::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH2PR12MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: edafc3d8-bd15-4d52-7cfb-08dd0341f9f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OG9iSVh6dm05L0c5dzFWcTUwV0QxZ2xsbEl4ZHJhME1wS25FRGMxY0VjL3Zn?=
 =?utf-8?B?OHkxYWtKV2NDMUF2ckN0cmlZZDc4eVFjZjc0NUsvMkJQU3dnemYvV2lrRVZs?=
 =?utf-8?B?b1ErZTcxTk1BQUQrYWk2MlRSeVFPaW14RHZJRUJiVmJqSUFLSGJCRTZ5azgy?=
 =?utf-8?B?K1FvMXVDbzZFN2dDY0kyRzBjTDd0L3RBaFB5YUpqZjY2UXE3bmh1Q0pRV1Bo?=
 =?utf-8?B?cXE0c3FBOFViRnRKVzR2dlROaEE1V3NjZFpGSDd3YlE2Vi9HTFVqZVhyMnRk?=
 =?utf-8?B?cWpKRDRrVEtzR3VMTHBGaXlkMTBNMmYxRDFqeTFpaHl3TW4wTkM1QnRJL2dv?=
 =?utf-8?B?UEVEVWxJVUN6aURwdXliUXFseTZFbG8zRm9pTC9IQXFUdUE2ZDFVVnlBOUZm?=
 =?utf-8?B?b2VpZVhTYlowd0h3eUpSaG9GZU5uQXZWQWwyY2JwK05ndXdMU042cndZRCtM?=
 =?utf-8?B?ZnFLY2ZJalUxZzVvTERPcHBPa2QxSS9LOGQ5OTdocHFTVmhCbi81MWRWcDYv?=
 =?utf-8?B?SEM4ck0wQnVYLzVDWHRKNm9zOFRkRGVlRC9nNFcwZkdQU0ZFZUpJMDQydzMy?=
 =?utf-8?B?amg3Y3cyMm1mOC9KRnpFMlVTUVdFRjZUeTRMSkx2TXVNVkp6NVhkemsvUTND?=
 =?utf-8?B?KzRmYk5xOEVFNmtLMUpPTERVVnVRWFVVWmttNWJsUzdndWo4UFFFNkRhVEZt?=
 =?utf-8?B?L1g1Z0xMcGIzU2NFS1QwRnBmNzBhUm1iNDZITUJQRzZXeU1IbHV1V2UydjE4?=
 =?utf-8?B?a0QvckFlU2JJbVhoZlNjckZtQThGdHBnNkdkcDArRHV0ZnRtSmFKU0NFTXVi?=
 =?utf-8?B?MncvdHFzS0xzK3VENnV5NVBMYkQ3elI4QmFCcVh4SDh4ZDB5em4rSU11NUFn?=
 =?utf-8?B?S3FkcXpsbE1wcDMxY3VlNzVKNDdxc2ZsNGdyUGdwc0g1TkFwQ2U1WDdzbnU3?=
 =?utf-8?B?b0dUYjZ5U05tVEpIWU5HU2VmbTNObFRab3ByNTZUdUpjTlFJNlg0VkZKakNS?=
 =?utf-8?B?TEVCVEhFL0dWYWxNZ2hUWmJQNE9BMjNqM3ZxZmptTzFpMUsvdGhvdkxycUFN?=
 =?utf-8?B?NjY5UlowcGRUcStzMkV2WGRveDJCcWhjMURMRGZhZjRadzVPZk42NWFZbEk0?=
 =?utf-8?B?aENvMVlUaXkrWGQzK2RydTNyRUdzUjlVTkJFUkVDZ0FGSzAvOCs3NVRrQ0wr?=
 =?utf-8?B?SWw2czJqSVdEOTU1YlA3Z1grdTBHMWM5Z0dUcHJBZENGa2d1bU1qd3JpczB5?=
 =?utf-8?B?Q2VqYVR0Wm9LVk8rVGdjaXNCY2lydzBES1NsaXhyL0tOa2hmK0ZjWVFPZkFz?=
 =?utf-8?B?Z0FJYUlvb2VpWDVaMmdQTlJiYS9yQktlbkJUQXVnK2ZEemZZVFN1ampxT01X?=
 =?utf-8?B?M2RVOFVBeWxvcjdRbklOY0hRNWhPQjNidzUwcjBBRlIyTTZqRmhVaGFDbDhu?=
 =?utf-8?B?SXJJWExsSEdVN0VZblhiWDE3aTZSQUxUOXZ3NzFkOG9pbU1Sd1phUzE3UW04?=
 =?utf-8?B?dWROZk50MTU3SEgzWFBCV1JFTXphU205RHlMUjg3YVVDcFlsVEtVNjNMRmdI?=
 =?utf-8?B?eStadzZmTTdoeEdxaVRlK09Va040aEorUlpGNU1QUmlXRHM2cWU2RDRDSWNh?=
 =?utf-8?B?NmV6a1NwOGVNTnRncVJpZUpQMHJINE42RTBHaG9FRjFlbk41MkV3eFZFTXJn?=
 =?utf-8?B?Sml0SG1VL04wbWFTSm5QbUN2MUJWT0FzYTNSWEo0VVNHeGlwTHBMUTlxVjFJ?=
 =?utf-8?Q?cjb2YQ3iXCZaFBxfO8PF6bJjDHJUkm8MhZWzpqH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEdmdWtwYkM5L1IwelpTdVhnMnBaWi91aUhIRnlQR0NyNkVMNW1Rc0dGVldB?=
 =?utf-8?B?QzdkdHJTUHZpNHBRSTNmWGtWRlhSZStaOS9tM0l2aUtSMnVuYkRPenUxc0hJ?=
 =?utf-8?B?ejUxYS8zV0xTTzVKbGlhblpXcEpNRm1EWkZkem5RVHpFcEFOMG1XV2NFSjBF?=
 =?utf-8?B?MTF1M3NGdlJqNTJ1Y0I0SExRT0hZV0hMc3N1Z2xWUStHMG15amU5czkxeWZk?=
 =?utf-8?B?dEk5U01LK3poZDAzUmErZ1BiRkZxWGZMUXFPb3Q3TFRsbnRLNW5Od1ozbDNG?=
 =?utf-8?B?MklaaU1Ha1I4SkN4UUJZakNDTjUxZ3dvOGJONEgvUDNBc3pQdnJ6OENlN3Fx?=
 =?utf-8?B?OWZ1eEV4TldXb1Ztc3FWWExFc2pMeWdJUTJTTDVNQzdieUE2ZkhPWnR5Ulp1?=
 =?utf-8?B?RVluUVZGYjZwbkp1R1NIRWd0QWlJTUpsdWRGQzJVQ3ozWDBWR0JxZmt1SUd6?=
 =?utf-8?B?bWJwVjlTbXVWbm1aOC9PRTFyYklIVFlXZFhJR2VUL3BsNEZHT0IraWFqV3Ex?=
 =?utf-8?B?Um9GV2ZjeDNSdlNVZVIxTGhiNkhtQU9Zd2JGZmZlakZqb25zcVFjdlRTRlpF?=
 =?utf-8?B?SDdXQ0k3SHc0cnN3ODliM2NzTFU2ZURNaGpPRlAwbktYeVRsd21LSEZtYitS?=
 =?utf-8?B?ZkZ5VVhxMWhiaVAvemVLSTdoR3VNL3ZvMGtnNmtQMTBkMzlZL20xeU5LMmRX?=
 =?utf-8?B?SkNUVkNpTy9PcW1NY3puK01hcGhmTlJvOGp5bU8yWW1kSThWdFJmNHN5WlYr?=
 =?utf-8?B?NTB3T3RrSXIyY2IwY0xkL1ZDNklSYXVDQmIrNkRtVGszeDNHMnN5Z005NzVo?=
 =?utf-8?B?OGloSHpUdVp1WmU1dGh1M1JkUHU2K0xRdzFLVkFIU3FMU0VqaC9RekhlN214?=
 =?utf-8?B?YTJINERFanFUVG9odS9RSFYyL3p1Ujk1RVZHQUN6WGZxRnUxMVNKYURMLzFj?=
 =?utf-8?B?ZW5tRGhrYTFKUHFqY3FJSFZUZUIxTU1VaFNubGYrVTI0TFpvWFBMbkN0ZWth?=
 =?utf-8?B?TTNMd3g1eGp0Y2J3L2tJVitvQ2h1Tnd5UVllM1hhZ1Boemw0S0tZZ1Yvd2x2?=
 =?utf-8?B?L2dQY2FMejNqQlMvUUt6QlRRUnVrMnd2UzBhQzFGbW43d3hvenozZVpZRnRp?=
 =?utf-8?B?dnRvQ2pjOWwvek10TG9VaWR4S3U5TW5wY0JDV0xzaFQ3MFZLS0czalo2dStW?=
 =?utf-8?B?TFpDc3h0NzZuenhyeGY0Z2UxQWprYlo0clUyL2lZbzFZQlo2ZGpHQlBUelFr?=
 =?utf-8?B?NEFhc2NOUS9PL3FGNERpV2lQalRLQ0hSQnpnRGhJUFpKb3JRUmc3VHQ2Yi9m?=
 =?utf-8?B?dExwTGY0OVNrZlpLczAza0lXajFYTy9XVEwrRVZ1NFJqQTJsZTZLY2FXSW1p?=
 =?utf-8?B?dUR1Nk1JS3NmbFJ2MC8xQ3IzcVZSTTd5M0UrK3lyWTNZMDV0bWE3TWRYQUs4?=
 =?utf-8?B?Q1dnUkxTVHFOWVhoYkRqdHZUMTFleG1nanQxa3ZISi9JU05uSlFQbTlJOHNi?=
 =?utf-8?B?MmVsV1E1U0VrYXd0dmxBRko4V2U0Ny9ERG8rZ2ROUUFTWmt3NnVuYU9jcUdx?=
 =?utf-8?B?VU9mRFBMVVdlU1FaUVN4VDdETnRjcU4xOVdFbG00UWcwSzlVdjFBT0VKMEVl?=
 =?utf-8?B?U3pIZFR3cnZZa1dqSENkN3VqTURFeEZ5ZVNFUU1NeXZuZCtJZTdLTVN4cXVj?=
 =?utf-8?B?VmhLNnN5SmhDSUFuK09jQVVZRGt5RlBOYzVzaGo1aTUwY09TTHV4azM4eFhO?=
 =?utf-8?B?N1FnNU5meGphTytlWjdadlBJVFVsVDlJVG5iTGZWZG1GTkJHajU4MUwzUFlQ?=
 =?utf-8?B?MVpaZEdVUU1FVENCMUREU3A2NmJJcXhtT2twazI1RXBsbSsxbzFoaCt2MXBQ?=
 =?utf-8?B?NWJ6cmo0TGlpb0Z6d1h2cFBEQ3dpM3U5M0NjeTZkeXEvQ2gwSzJDK0dTNVpR?=
 =?utf-8?B?VXhnTEprck9zOUJxSVBBMlhEVW5BQ2dQa0hjTTA5SzVHUVhPWnpsamt4MEZ2?=
 =?utf-8?B?NmRBNGlMUGRya2Y4UURvVGdSbytVdGZQSmowOEtRdWtneU84WUVVU1NsSWFR?=
 =?utf-8?B?TURHTHdwaXVkVU9yeEZQVXFsQnB1REhxVkpBTTIzUlVBODBGSHM2Q0ZCcGRQ?=
 =?utf-8?Q?B5KY8jQTQ+tiu3jLvyscLJv12?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edafc3d8-bd15-4d52-7cfb-08dd0341f9f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 17:46:45.9032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7SqKpgQAmpfuWFwhaSj3forySauTC9WS9OE+Rfa5kBXT4D7b3OwAbU9wVxovZox41fqSOFcG1cDZd1pzJ2Wog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9496

On 11/12/2024 10:43, Werner Sembach wrote:
> Am 12.11.24 um 17:31 schrieb Armin Wolf:
>> Am 12.11.24 um 16:10 schrieb Werner Sembach:
>>
>>>
>>> Am 12.11.24 um 13:51 schrieb Armin Wolf:
>>>> Am 12.11.24 um 13:42 schrieb Werner Sembach:
>>>>
>>>>> Hi,
>>>>>
>>>>> Am 12.11.24 um 13:01 schrieb Armin Wolf:
>>>>>> Am 12.11.24 um 12:52 schrieb Werner Sembach:
>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> quick learning question: Why is wmi_bus_type not exported unlike, 
>>>>>>> for
>>>>>>> example, acpi_bus_type, and platform_bus_type?
>>>>>>>
>>>>>>> Wanted to use bus_find_device_by_name in an acpi driver that might
>>>>>>> need additional infos from a wmi interface that might or might 
>>>>>>> not be
>>>>>>> present.
>>>>>>>
>>>>>>> Kind regards,
>>>>>>>
>>>>>>> Werner Sembach
>>>>>>>
>>>>>>>
>>>>>> What kind of information do you have in mind? wmi_bus_type is not
>>>>>> being exported for historic reasons, i can change that if necessary.
>>>>>
>>>>> It's for the tuxedo-drivers part for the Sirius 16 Gen 1 & 2 which has
>>>>> a slow wmi and a quick acpi interface, however the quick acpi
>>>>> interface can not get the max rpm of the cooling fans, but the wmi
>>>>> interface can.
>>>>>
>>>>> Thing is for the acpi driver we might plan an earlier upstream date
>>>>> and it might get multi-odm support, while the wmi interface is and
>>>>> stays odm specific. So my idea was to only couple both drivers in a
>>>>> dynamic way using bus_find_device_by_name.
>>>>>
>>>> Interesting, how is the ACPI interface not ODM specific? Can you
>>>> elaborate a bit on how the ACPI and the WMI interfaces work?
>>>
>>> We have an ODM that was willing to include ACPI code by us in their
>>> BIOS blob and we hope that in the future we can carry that API over to
>>> other ODMs for future TUXEDO devices.
>>>
>>> In pseudocode that API looks like this:
>>>
>>> v1:
>>>
>>> void SMOD(bool mode): Toggle firmware controlled fans vs manually (aka
>>> via the commands below) controlled fans
>>> bool GMOD(): Get current SMOD setting
>>> int GCNT(): Get number of fans
>>> enum GTYP(int index): Returns "CPU-fan" or "GPU-fan"
>>> void SSPD(int index, int value): Set fan speed target as a fraction of
>>> max speed
>>> int GSPD(int index): Get current fan speed target as a fraction of max
>>> speed
>>>
>>> v2 same as v1 but with added:
>>>
>>> int GRPM(int index): Get current actual fan speed in revolutions per
>>> minute
>>> int GTMP(int index): Get temperature of thing fan with respective
>>> index is pointed at (CPU or GPU die, see GTYP)
>>>
>>> Like I said, what is missing is a "Get Max RPM" function even in v2,
>>> which we might add a future iteration, but, well this bios is now out
>>> in the wild. However these released devices have a "get info" function
>>> in the wmi code which returns the v2 infos and the max rpm.
>>>
>>> I want to write the code in a way that it probes the acpi interface
>>> for function existence and wherever something is missing tries to fall
>>> back to infos gathered from the wmi interface, but that one is
>>> implemented in a stand alone module (the tuxedo_nb04_* stuff in
>>> tuxedo-drivers) and I would like to keep it that way in honor of KISS.
>>>
>>> My plan is that the first time max rpm is pulled the acpi driver uses
>>> bus_find_device_* to get the wmi device, if present, and pulls max rpm
>>> from the driver data there and copies it over to it's own driver data.
>>> If not possible it returns a dummy value or falls back to another
>>> method. Maybe a hard coded list of max rpm values, currently only 2
>>> devices have the new interface, so it wouldn't be a long list.
>>> Directly going to the hard coded list is our current fallback plan,
>>> but it is not an elegant solution as the info is actually there, if
>>> you know what i mean?
>>>
>>> Kind regards,
>>>
>>> Werner
>>>
>> I see, we once had a similar case with the dell-wmi driver, see commit 
>> f97e058cfe80 ("platform/x86: wmi: Don't allow drivers to get each 
>> other's GUIDs"):
>>
>>     The only driver using this was dell-wmi, and it really was a hack.
>>         The driver was getting a data attribute from another driver 
>> and this
>>         type of action should not be encouraged.
>>
>>         Rather drivers that need to interact with one another should pass
>>         data back and forth via exported functions.
>>
>> I would be quite unhappy with drivers interacting with WMI devices 
>> without a proper WMI driver, but i can see your point here.
>>
>> Maybe we can keep the retrieval of the fanX_max values out of the 
>> kernel? I propose the following:
>>
>> - have a driver for your generic ACPI interface
>> - have a driver for the WMI interface (with fanX_max hwmon attributes)
>>
>> The driver for the generic ACPI interface exposes the fan speed 
>> controls as pwmX attributes if the interface does not support
>> the "Get Max RPM" function. The userspace application in this case 
>> searches for the hwmon chip exposed by the WMI driver and
>> reads the fanX_max attributes there. Then the application can convert 
>> the target fan speed into values for the pwmX attributes
>> itself.
>> If the ACPI interface however supports the "Get Max RPM" function, 
>> then it exposes fanX_max and fanX_target hwmon attributes
>> themself and the userspace application uses them directly.
>>
>> This would keep the kernel drivers simple.
>>
>> I suppose you provide some sort of OEM application for fan control?
> 
> Yes we do.
> 
> It would be a little bit harder for 3rd parties wanting to implement the 
> hwmon interface then and i'm also thinking of implementing it in the 
> thermal subsystem (albeit i did not do a proper readup on that system 
> yet so maybe it wont work).
> 
>> In this case having the fanX_max handling here also gives
>> you full control and allows you to stay independent from the kernel 
>> development in that regard. For example you might decide
>> independently to hardcode the max. RPM values on some machines (like 
>> the two new machines) or use a different hwmon chip on
>> some other machine.
>>
>> Aside from that, i really like your approach with having a generic 
>> ACPI interface, it can potentially save you a lot of work
>> once you have the initial driver.
> Knock on wood that the generic acpi interface works out ^^.
>>

If you're comfortable sharing - is the "ACPI interface" just a wrapper 
for an EC interface?  Is that EC interface stable?  As you're developing 
directly for Linux, there is also the "possibility" to just interact 
with the EC directly.

That being said if there is an ACPI abstraction already it is nice that 
you can tell about it's presence using the ACPI ID reserved for this 
device interface.
