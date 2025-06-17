Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C7922F76C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 07:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144565; cv=fail; b=fv+HGq2Oz9PK8YcfbwE88Qe2GCK6Eh5CkBkJkUOg3SJh5sJOE7P+1TMWJIMvI/+M7imEo0udT7bc5az7nRsM0p1/aEFYVJwPDUVavR9Sd7WCoFLDNtbX65oOdCJ+MgoVaqkB8Fz2TMZY3JQD2pzNwRulqTVGAUqLeTJITNZ5wyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144565; c=relaxed/simple;
	bh=BYc9g1ZcBwkgwxiiKKS3u9DSRhrpvrflFu8J3OZ580E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tZrx7zoQvz++dupi/5GznibKDayekP6aUk1kYnst40FgFI0ijHKHJwW4vChJ4PhHzLLIOwAI1Y3HJFQ5GDpyWgpX9k3/D55OIYjvh6MzfgzI73SEh3CceLKsqd/l8nd0LFejHEqiRb1E6863O1D2zov3WIFJvzJNIlEO3Xz9yAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JxksXypu; arc=fail smtp.client-ip=40.107.244.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JxksXypu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOTEm+H27JkTnLhAOPKEsXF7sf4iM95A9E53Jtb9+XSVft/edt+AqXXySjtuvJrxT04OiQK4KOnPDTeNOB5LkN0CEmN1BIV3XfM4RKEpSGWPCBefJVZs+Puv8VoR75Hadc5zR2p0igVpUSEuugVy/RNa1JYer3E5A1M9Dh1GIY76G6AVGm/rxwPt4TY9MQ16/wABv4At0+yIIFdmjh2dbBVAM2kqgV2zSs9HQbxS9phE3Q33hYZ16ZSwUuaexSvAV+GTYzNXLfM/KKkAzrMfrNZjoNvQAB4DXHwiotcLp6IdosWhBOzx7pUphiC6HA4ggodM1hLJCm1UrVWLPvL99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9eLJV5Wx2+5Lx9savun+2bhU99zRLkY1MhnjC7lx+Y=;
 b=j9zAYm3YvbYRANFttp1FDVnNE+xyeVwM3wU/0sy+Y6IAMAtIaYLRc68ooXX4V8m6EKN1gfoAQUeRFecMmHU0KzHxAOpO0Sxc1OjoFOSEOBQPgOtyw6N+7+7h2hU1lttDe5HqW0bjk2+pmUAuhWt4GLh9stIvzfQrd5bhrG5LZoGZWIaU6T7PZGp0w++YhLTnLRBXmRpHc4RngBfeWgeSk0t8w2MuqaEXf9l7Y+Mw2ZYrrfeUpyLBmRwZDy9PaHjrJe4kL5a+v7EVQjrWxqszTMvUeEXRWUK/ItM79D4helWvnM5eBDulI/9Qm2KrKki/V9DgX9wupGOLem2CDV2uPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9eLJV5Wx2+5Lx9savun+2bhU99zRLkY1MhnjC7lx+Y=;
 b=JxksXypulsmjgJEcjCeT/r+w0eP+P19mO4efDgZtnx+127lnDneFMLUIrKttFHNPRGFj9dEFrbV8VnNjk2Np8uHaHc6T2grUzebZFx/kQGMGF9AKLKGhQ49D2biFxve9dc1peyOnsEz8Qwgv7YSXV46Wy0+U/so2J8+MNC/Ej9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN0PR12MB6318.namprd12.prod.outlook.com (2603:10b6:208:3c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 17 Jun
 2025 07:15:59 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8835.030; Tue, 17 Jun 2025
 07:15:58 +0000
Message-ID: <c86eff53-f243-40df-9626-fc5259b351c4@amd.com>
Date: Tue, 17 Jun 2025 12:45:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] platform/x86/amd/pmf: Add support for adjusting PMF
 PPT and PPT APU thresholds
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
References: <20250509072654.713629-1-Shyam-sundar.S-k@amd.com>
 <20250509072654.713629-2-Shyam-sundar.S-k@amd.com>
 <5f5ab951-b948-e9d0-6ae2-d8269e4d82e1@linux.intel.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <5f5ab951-b948-e9d0-6ae2-d8269e4d82e1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26b::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|MN0PR12MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: b2692e5a-d833-4c6e-9b3e-08ddad6ece95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWZWZHptUXJwSkpwSnh5MlJ0bW9nZHBYVEhxSXdoR1hoOTVWSTBINXpyRlV1?=
 =?utf-8?B?MElTdUorZnRWRzM3NHZSSWcwazJnTUhCMm1WcVZFeE9DQVdKa2sxUXgrWm0z?=
 =?utf-8?B?UXlEcFM3T3Q4SGQwemd6RVIzbGNuWSttODJZZ1JFck8wdExCaktaYnJXbjNa?=
 =?utf-8?B?Rng3UHlwL2lHYnJnRmN3YjN1bHdqaDVVZnd6cVZ0VGFxMTJwdURJVjdTV2Zl?=
 =?utf-8?B?S1JQYW84RWcvaDhOM3h0bW82bFphY2sxNDF5amxieWNvUEl3SXhKeFdxK3Q2?=
 =?utf-8?B?R2F3bXRYa1lPbmo0UG9zL0MrMldGUWtaRTZ5bXQ5U3YxWVEwQ1dwMWhyZ0xU?=
 =?utf-8?B?YytXWG5pdWxQN3ZzcDkrQWpzOThEZlJsZ0dlZ2tnem1RRnpsYVpQbmJaTU5O?=
 =?utf-8?B?UHpwYUVxNHB6VGIzZlU2OXZHQ3dXVlNjWWFlbUZhem0yNlRITjQ0OW1rRGI2?=
 =?utf-8?B?RCtIQzA5dVZNZkRJQTRxTS9sbkhXUFRQdzhWaWU4UUdPQUJFa0JhT2pISFcv?=
 =?utf-8?B?VXFFWmpzaXZzM2JENmwzWklHWnREM1luM2wyZlB4ai8zYUhhMzVXaHdRaDFC?=
 =?utf-8?B?MVptbGFSVEtudlJUSy8zeVEyTXZWTDRzTlg2ZTQ0NmhXNm55ZWZ4MFBhdjFp?=
 =?utf-8?B?bXdUMndybGlsREpoMVhzeHFVS3ZBbWEzb2hXUzJYOXlZY0hIR1VzT1pDN0V1?=
 =?utf-8?B?VTlPdXlQdFk1SU5sZmdiVi9pVkFycnlVUHZWYi9teXF0cnVRUkgvTlV4ZVJu?=
 =?utf-8?B?cVk0bEZFakkyMll5ZTZrOXc2NE1tZXRNb1VQSnFWa0NLQkpVYXJvcGx3VTNz?=
 =?utf-8?B?aGdVVGhkWFp4bHJibDJYOVVndW1MNFBXbnh1RWJkeUxVanBrUXZTdXNSMzdF?=
 =?utf-8?B?b2FOTmRLTGtLSWtFdnV3Q2szRGQvY0NJZTdidUZlM1JBMjE4YjdnZHpMNkc5?=
 =?utf-8?B?ZlFkL0tUSS93cWRMaUhLdXdEU2xDdERWNUhNcExZV2JUditMTVJGa2hoM1Zv?=
 =?utf-8?B?bVErQjdtdmFMZTZrUUIvWmZhOVo4WllqQjIzWTY3YkdIOFNJa3ZuK29iSzhG?=
 =?utf-8?B?MjZvenFOQzhqSnlQd2Ntc2Y3cUw5TmU0SlI2S1dURFdjeGdEaWdNc01QUi81?=
 =?utf-8?B?bCswWllVdlJWSUpwNWxES0l5UEhBdVVEZEFKbWFjNjFHS2xWMEkvcEJZTWJh?=
 =?utf-8?B?SDEwdi94T0lPKzc5eGwyYmpmZitrRzVVOXhnamxvNHUyOUhObVZpL1E2TGd6?=
 =?utf-8?B?VjZySVZ0WHpsNGlrcDJBWDgrRXpWK1paK2w1WjQ3WGRMVGh6Z09qVGppKzdI?=
 =?utf-8?B?NERTSmtvYWFhVXhiNTREUnZuK2p1dERLYklPRytNOUFLVUFZNWNMTFAxSzhP?=
 =?utf-8?B?b2hkYlMwdlN2QW5oLzZQalQrNWhpcVdsTWMwTGFFc0oxcDVkWm4ra1g2THBS?=
 =?utf-8?B?c3QzSEg4WkNqeE5LM2tvYW9FeEJVeFJOdDNraytjWFl6YzNhSW9hT3JTRXdj?=
 =?utf-8?B?QkxDSVo4Q052N1pCMDd3SGdraCsyNEg3UFpVdXVMdnBMVUF1OWZnYndlS2V6?=
 =?utf-8?B?dHRwOVRmTEFoanptZ0ttTFFnbFpST2llRzhsUG5ETStoSDB6a0VORkV1RzNv?=
 =?utf-8?B?aGRsM1JnUm90eVhMS0VHaXlubHJUejZtMVF6cFpobHlQbUxpZEk3VTkxVWhk?=
 =?utf-8?B?YWFkdUVsZktnUmFPVnFWWE5DTU9kdWRyZ2lqeDBhNkJYRThkZzFSWm5WUnp4?=
 =?utf-8?B?UERwMGdjNmJsNitHL3B2QncxV0lsQTRmVlJQK1k2c04wbTFwamJQNkJNZWdm?=
 =?utf-8?B?Wm0ydUxFckYxVFBPcTFBczJkbFIvM2Z6SWlOTk13UnJaZnY3dFZqY1pCbWh5?=
 =?utf-8?B?S1o5OWFMUWhWbHRic3IyVDFjbVNKLzRaYmFDRXdqb2ZDQ2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmE3Y1QvYmZTVk83RUhOMjZFRFNVdDhnZ3BzdUppUTcrT0dCbWdKaS9RSytJ?=
 =?utf-8?B?YkZNTm9lNWVmVXhpUHlVc0EyZ1JINlpvSUlNV2FVUi9FZm4wTGx4N0M5ZW5P?=
 =?utf-8?B?NGtqQWM5Y1ZMVWwxOUFsdjVnNkp2ZnNIK2k5bVNlSU9OUEtVMG1YaWRGbm9E?=
 =?utf-8?B?M0d1aFhnUnZTSlRPTHZkTXBJMVBrVlYzRFV2T1RHREFvWU9tK1lpTGZ5ZjZ0?=
 =?utf-8?B?bU9DZUMvNmR0RmVUMThpWXNrZjdVblkxeXh2Yi9iN2kyeXRsRWpYZEppaW52?=
 =?utf-8?B?RlRRdXlrVWNIcFVXNzVvN1p2NUhYOTNMSnA2dlhzYnA0V0NwYWwrdUtmTEpD?=
 =?utf-8?B?aGx2aGtCRXd3OFd3REgwSTcvSlBvVVFxNmtUelB3OThIeVlTckp2Rk9GSkZB?=
 =?utf-8?B?alRzQkVuUHRrbmsrOFE0emNQYWdJWUFUV1JXSGk4QUVMKzJwd0VaM0FiV0VV?=
 =?utf-8?B?YWFWcFhJT3VMS2tzQ3U0aFdzVGRFdU5MYTRqQThheU5YTm5FZ2pLMTl6RFpj?=
 =?utf-8?B?c3d3QXZmeXJhVHF2cCtlQ3BTS0lEUVp1TGpwWXhoQ1UwRURFYlNHb2dYZFdY?=
 =?utf-8?B?RjlBWll1OWFOa2QvWTNkV0E2VmFGOE40Ni9wMlpHZ1JUTmswVDVjYWwyUGYv?=
 =?utf-8?B?V0c5YSsxaTEvN21yQ2dPbFA0SHc5YzZPNEtxTWZTZVFiVmpWcUxpZEZFeEls?=
 =?utf-8?B?K0xjczhEQU9TOGxuSUN3SE11WmdmMnZHSEtTNXpRMVhkMzJ0d2ZXVStuNjlU?=
 =?utf-8?B?cWJidzBCTVhBQ1pPeGNSVStWRzVXNHJjdjUwV0RjdGFTUFFXSjhzdEdPdUx5?=
 =?utf-8?B?UG9pN0FtMW5QN2ovbG4yQUJaWmwrenFwVW5QYzl6QlJ2TXBVZElkOEVuWWFO?=
 =?utf-8?B?aUhkMy9KK011TTZlQmxYeUxvZnlrNS9HQ3Y3YTJvTG9PeXRKZDBDQTlrZldK?=
 =?utf-8?B?N2lPUVNhcmRqakYrbG1TVldGRXRxZUFHZEFEcFd4QytYZjYwYTJzS3dVU2ZE?=
 =?utf-8?B?WDVCSFlkK015Qk9Idjh3aWNiWDlEbVU2QlQ1OVJDcWJScnhZbU1kcGRkVzZZ?=
 =?utf-8?B?QWc1d2RjVmpLYlh0VWhCbC9WWFlleCtkY2F0RjAwNUlIQzdNK21OMTdoTVU1?=
 =?utf-8?B?a2dRQzRQTFZPN3UvWVhlUEwya2RkZVRHVUordVlzNndNQlR6VnN6b0V5UTBH?=
 =?utf-8?B?aDhQQzRla2JVa3hLcWlISm1LSDdpV1hPcVlackNEZ2VEcFZWNmZMSStpUEFS?=
 =?utf-8?B?U3hJMWRtTlhGcVRRcUFXZ01QNFNsamp5SzFzMUp4N0FBbVlSUDVOQ0dQQ0lp?=
 =?utf-8?B?Y3EzVlNGWk5yWnM3eDhBMjFwZEVheWtTTnZWOENORnVLNHlQMTlzU0NnSjls?=
 =?utf-8?B?YkVjR3JUS1dnWURqQ0NMRlVQcHVYQ0hOVXZ5MnZUQm1BdTNVV1Q0YUE1VkJr?=
 =?utf-8?B?eFhQZnVNeXJzRnlKd04yaHZqcUhMMDl4dnpwejBLMkk5alQvMThjSVpOV01Y?=
 =?utf-8?B?elpzMXVQRTMxWUM5WE5NM0dNTmJ3OGxIaXZCV3VhcGdsb0VOcGdUbmVMOUZ0?=
 =?utf-8?B?b2tJZnMyREtkY1JIK1BRVjdUTmJqVUI2MnJDbXJCcytxZm9pS0FIRDFFcHVI?=
 =?utf-8?B?SXdjeUpFNk1mVE9LQzlGc0NlYlZJNHRXVVVnRndqSUxtZnphWkw4dzJGQTBp?=
 =?utf-8?B?Y0lwbXNDRGlmODhZaWd3YzJ4alRiR0V6SUVCdkdyMkxOeXJpaDZJaGVtUzNo?=
 =?utf-8?B?WitjaTdnSkRwMGRSSnNWWUpTVVNvczg3YXpCKzdWS2MxRWdIQTBsTUswTVFE?=
 =?utf-8?B?elBGb2Nuck4zUGVCcmdYZXhITVZGdWVjUVdFd2J5VlFXU3NPMGhHWTBPaFRj?=
 =?utf-8?B?clpiRjhyQ1RRUktVNCtxY1JaajFMNFlUOFBmMXZoK2ZJa04xRjd6RmpNTEVs?=
 =?utf-8?B?cGI2dlFaNExHZDR5eVpHZ1d4WlJPZytadTFkYjJUL2RTOUNTVGl1TUsxcGFj?=
 =?utf-8?B?ZHkyajk2MHo4dlhocTJWK01SMm5KT3JEdHh6RVRxK0VSSk5oZ1NoNFY3SExr?=
 =?utf-8?B?elpZelZ1OE1EMTZGeWNsVG1SSGhBSTN0ZlNTaWlvQUkyQ3ltTDd6Qk5RVFp4?=
 =?utf-8?Q?HNLrvMdChSXBb3zjK77C0x2Y7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2692e5a-d833-4c6e-9b3e-08ddad6ece95
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:15:58.5787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7OKUuU1qmXy7ui6sdNMd15CnQvysKTKqpuSjZZmkLklwazT//5CdjKNem7yZRUdN5RkaXWqgAM4+bS4inIlhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6318



On 6/10/2025 21:42, Ilpo Järvinen wrote:
> On Fri, 9 May 2025, Shyam Sundar S K wrote:
> 
>> The most recent PMF Trusted Application includes enhanced features that
>> allow for modifications to PMF thermal parameters such as PPT and PPT APU.
>>
>> This update introduces the necessary driver support to utilize these
>> capabilities.
>>
>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/pmf.h    |  4 ++++
>>  drivers/platform/x86/amd/pmf/tee-if.c | 16 ++++++++++++++++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index e6bdee68ccf3..4665e68e5c07 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -93,6 +93,8 @@ struct cookie_header {
>>  #define PMF_POLICY_BIOS_OUTPUT_1				10
>>  #define PMF_POLICY_BIOS_OUTPUT_2				11
>>  #define PMF_POLICY_P3T						38
>> +#define PMF_POLICY_PMF_PPT					54
>> +#define PMF_POLICY_PMF_PPT_APU_ONLY				55
>>  #define PMF_POLICY_BIOS_OUTPUT_3				57
>>  #define PMF_POLICY_BIOS_OUTPUT_4				58
>>  #define PMF_POLICY_BIOS_OUTPUT_5				59
>> @@ -677,6 +679,8 @@ struct pmf_action_table {
>>  	u32 stt_skintemp_apu;	/* in C */
>>  	u32 stt_skintemp_hs2;	/* in C */
>>  	u32 p3t_limit;		/* in mW */
>> +	u32 pmf_ppt;		/* in mW */
>> +	u32 pmf_ppt_apu_only;	/* in mW */
>>  };
>>  
>>  /* Input conditions */
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index a1e43873a07b..679c5bf5faca 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -145,6 +145,22 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  			}
>>  			break;
>>  
>> +		case PMF_POLICY_PMF_PPT:
>> +			if (dev->prev_data->pmf_ppt != val) {
>> +				amd_pmf_send_cmd(dev, SET_PMF_PPT, false, val, NULL);
>> +				dev_dbg(dev->dev, "update PMF PPT: %u\n", val);
>> +				dev->prev_data->pmf_ppt = val;
>> +			}
>> +			break;
>> +
>> +		case PMF_POLICY_PMF_PPT_APU_ONLY:
>> +			if (dev->prev_data->pmf_ppt_apu_only != val) {
>> +				amd_pmf_send_cmd(dev, SET_PMF_PPT_APU_ONLY, false, val, NULL);
>> +				dev_dbg(dev->dev, "update PMF PPT APU ONLY: %u\n", val);
>> +				dev->prev_data->pmf_ppt_apu_only = val;
>> +			}
>> +			break;
>> +
> 
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> ...But with the caveat that you should start to consider something more 
> clever here as most of these cases are essentially just copy-paste code 
> with very minor variations in a single parameters and offset in 
> dev->prev_data so it would be nice if the similar cases could be handled 
> with once generic code fragment (I don't count dev_dbg variations).

Agree. The code has grown over a period of time and it needs a rework.
I will work on them and submit as a separate series.

Meanwhile, I sent out v2. Please have a look.

Thanks,
Shyam

