Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28414811F1
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 14:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729605621; cv=fail; b=XMGjyeFFoPF/RYa+orq1bdZClFOrDJGsXWelUK33u+Jf6s8dYUp6dP02X+SHOkku3g2BMru/PGHvev3ZJlniKBTTjbYtI+nFcVlrEYpuB0wJFNeZVJVJC3zyjBIc1a75H33bBLd96SHp/13wcEMb2PBvSd2JznR0obg77z/tmnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729605621; c=relaxed/simple;
	bh=2rP2NncEf2NzhcfnCHGFwdhEz9zH1hoxQ/gqzTCpD68=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uJBaHPm8gFpNHuUF2MlbJ1GHLgXbJbnoDeJsNkM8X4S9xmJjAdiUCBW9oFbI99prb1H/gBr2QK8oiAk9+zhFW/XIBwmCNqoJBQp0gC0Hp1ajHAkVFe0yRHVX9xxB/TAG8sBMmec9ZaarzN/4tQxpc7MO+ciaKSEirv6B2tCttXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=456NfXHD; arc=fail smtp.client-ip=40.107.237.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="456NfXHD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAjYMM2emCNvgRIA+VFxPktSasyfzvCAaRpFXWCHT23jdP4DwsS9aFolo3KKbm/5bEj45ybU9L31X8m9Grl5sbtx1xmxKCb/dk3wR88qnbFvGaxsxBQ4o3S8V9Ju/inm+xN78mkYLtoh0/jBKSoOYrgnJP1ZpOm6npDE70nft8HuISjrhmy6QP8w1vk0Jn1u2HEvBGc92k+0iR/CXQf1ygBmLq0sn8uCUvPoDhMgmUeQqa7G+Ic4U+kxKT+ftiO1WGFz8LvgeeDvGm+eUZ5xCy94zpE/b3I3Z29fmtq4l08pe38YcnkAzUnXNGyvEF/YlmgqxtlZt4blcWtNHpO+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCW8GFMVPjEjfpJsyUPvz71TDHeY5Y0DOqP+oD6BgDU=;
 b=RjmXYR7nmC7hPwEJdTFTC2Q8EHnl+NMiI8mam8rYoszctWCS5TDWNY1ZiGNhSKGB6Zmuds8V1tGHHgLQtkOCptdI0yDEfbi6B3T6rt49sgbAIk44dA/yQM1QcqB+iRg9s1kb/0+ZpAiqRoNoRMS4Z33d1oZfJomWEtie/4J1SawRgSz/7dILn6ZxsBTMbkmt3S+uNqIj1UmV980yv/IGUXPZk3k6ZEdk6tTBCU5RLiDl1Fx11g7g5G/7mN4T1Plt1WnngrMO0Q6K5JoP3MHjX8G6yma9VsQf1J1eB2ve116QGg0HJbLm6HGL/aIdL5llksuis/Atzv9jr5AI161Qfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCW8GFMVPjEjfpJsyUPvz71TDHeY5Y0DOqP+oD6BgDU=;
 b=456NfXHD40yQZNOKYKpSuqtQVifJ6yLgcICDJkg/0HeAWmLCVzR7qP/zzB0kU/9sCS+wRjl5TKUEOid3yFJhS3tGDqrW05IGMgsqnfZH6cafeEBRsQXXOrMjL+JrUXhmqUFbKh0e/LBInDIC+8NHXHmM7DOcnwU0tABGFjqx+a4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 14:00:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 14:00:11 +0000
Message-ID: <79c380ff-4b00-48b7-a6c9-9c62957b2147@amd.com>
Date: Tue, 22 Oct 2024 09:00:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Basavaraj Natikar <bnatikar@amd.com>, Armin Wolf <W_Armin@gmx.de>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 perry.yuan@amd.com, Shyam-sundar.S-k@amd.com
References: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
 <20241021165820.339567-2-Basavaraj.Natikar@amd.com>
 <72c0b021-9778-4bbe-aa54-c7ef887c04fa@gmx.de>
 <5dce0b9f-2b91-1cac-5150-899547cd042f@amd.com>
 <7be0b988-013d-4dd4-8a85-0a72cdb1b924@amd.com>
 <f60964d0-6c10-e353-b556-0461f0d6ce7c@linux.intel.com>
 <630596ce-d298-4513-8fea-9b2dca5782e2@amd.com>
 <06f2af82-9ba5-bf96-958d-1ca22f50f1a4@linux.intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <06f2af82-9ba5-bf96-958d-1ca22f50f1a4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P223CA0018.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 47678150-3f55-4892-e3f5-08dcf2a1d883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0hqd0lDem5nbllKUmxsc2swK2JtNlZYUTNGcitsUHFUOGdxbEZMSFdxVWNu?=
 =?utf-8?B?dXE0V1JLL281eUNobnFsNEtDUnhKeVhHNzBVSEhIamtHeTUrQ0NDVmZXSWUw?=
 =?utf-8?B?anluTmZTR1NmNjkvd3l4U2VqNjN3S3dzdisxNUVBTUNOT0ZaK1FPcXhLQ21W?=
 =?utf-8?B?bmVSWTRmVmNEVkhKNjF2ZHltMmVHODRGamtSdG41NW16dkczbThoT2NHbFVq?=
 =?utf-8?B?MHVRbHJZQkV1RGkxOUVhMGZBZkJYSThVbmt6b3lieFZ2cnBlSnViM0ozcmV1?=
 =?utf-8?B?a1FaN1hJalJ4UmpsTGVWdkNjNjdaWU0zM29kVHY3MGNSdzAwbzQ1V0l3UE94?=
 =?utf-8?B?U2V2Wlh6UTZIbGR3TWZ0V3JyNFRZeEdlcTRCLzBEM25uMFo5aWxwZXZ2OS9m?=
 =?utf-8?B?a0ZrSlpNK1VMZXNZM0E1bjlRK2RCQzlpSHBGVjdWTUhjNEc5WHpaRm9JNDRC?=
 =?utf-8?B?V3NQallYSTE2dTYxSXcyNUdjSGpPcnh0ZExyNVg5cDEwajVaclNubWJ3OWZv?=
 =?utf-8?B?UndJTXZqbVZUV0JFWkhNZjNUblpWa2FKMG9wZ2dhcGhVMlNQSmdPT2padlFl?=
 =?utf-8?B?NXppWFMzVzMyd25NeGQydnNBc2ZXYXBlUzJEcEdVOVVBdy9EMEZMSFVMaFBJ?=
 =?utf-8?B?cmNCaDcxSm5qczNlbUkxR0lVTHhtVW5oc0Vsc2tFL09KWTlCdERoTEtlTGJ2?=
 =?utf-8?B?b3NoUSs4T2pud3Z2NlN1bEVuK1Y0K3NYSEorZGhYRXYyTlptZnc4OGhGMVA1?=
 =?utf-8?B?T2lNdUF5VEtLNFplZXpsUEZybXRsTGJwR2dkaHRJdjlNcVFJaHV4Z3R1M0Jx?=
 =?utf-8?B?cmUyWDJqS0JDNWdjaEJiSWpNQnBwZTY2d0RWSXJmK1A5SzRvWjBLQ1Znbzhl?=
 =?utf-8?B?RmYwRmUxYnlaRkd3YmxBV2tZeWFkMVdmODlRaUVJN21BYVBSLzdDc1dWZUto?=
 =?utf-8?B?T01UemtpU1cxaE01aWl4ME5CR2lGVzJaWHNaVFA4bmM1ZlJadWZDVDNORFNo?=
 =?utf-8?B?RHNvLy9rUnRETjlZUzBwVmk1WWd3Z3RlRjZwcDdxOU5qajBoRVZFWUpDTmM1?=
 =?utf-8?B?UTg5OUVqUm5aKzZpeTVoV1p3Z1IyaW1wTFNndjlNUTkvTjlEUTJsenI5bzdX?=
 =?utf-8?B?WFcvRURjVmt6QStGaEFsN3Bxam54amxOajFsTm9uRVRTT2puRFMzaUs2VFpQ?=
 =?utf-8?B?d2h2VEdDUWFpa2x6M01YUEtvTTdTS1pDRy9ON2xLMy9HaFRHZWdTMXJXNzcz?=
 =?utf-8?B?VzZUZkM0VFZIeUhwY3A2RGlCZkFXTWJNRlBHb3FvbnQveGZtZWRBM3ZQQmd2?=
 =?utf-8?B?QUJGaG5LcWtUcWhuYWFNWVFUVkxvZTJjZktwY044cVNEVThOcW41T0tKalli?=
 =?utf-8?B?RjRhVTh4WTVEU0V4a2ZhOHVrWkN5WXpKQlF5RGtzaGthbHJTYkEzWjZhQzhh?=
 =?utf-8?B?R0RBMTEyajFxSVorZmFuc2tweUdoUjNSV0RZUVVTaGo2MUliS0RWSWlMLzd4?=
 =?utf-8?B?TVhtZHdLb01yRjFNa3VDRTBCVHh0RGI3bWc1eFBCZ2Q2elZrWDhwR3MybzJE?=
 =?utf-8?B?SnZ5NmhpRSt0RkQwaDc3TEJSRjRwWEtpRkl4YWZGZXlLajhwV3c2TmpZYW5w?=
 =?utf-8?B?MmJzbEZ5empaOGoyWkp3NGdRVTlRODFQQzF6dEVFSTE0K2NFOGZhV0h5b3Bj?=
 =?utf-8?B?VlZ2QnE3SVY3c1hicmlJK1IyQ1RwTFhSak05RXVkV0tVaDc0YlZ2YTYyZWJq?=
 =?utf-8?Q?+WOKnDkpcuwqFum15z+CVnmZkB9/fIwo0A+dWVS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVRyM09pM0dSMEFKcWY3OSs0c2Z3ZGZmY3VJNDJ1NmpqZVpmbVl2SFdJSTN2?=
 =?utf-8?B?SE5xLytKWS81UkpjS2VNSGw1RU82NjV0WnJJYjRJVS9kV1dvZDFySi8yMTRu?=
 =?utf-8?B?Q2JXNFA5bktaaStXeFN4eTNRRFR2ZEpjVGJhZU13Y1h0RWNNVi93QW1TQ1Qx?=
 =?utf-8?B?WDFON0pZL3VWbDBlV2szUjBTVHhTQzc3KzhFbENrbnRJTTU0b1FmbERRU2Rq?=
 =?utf-8?B?eXp0Y3JHWnN6Uk9YQlB4dXRZaVY0UXpjb0xvZUNWTnVVblVEQXlVeHNUL09F?=
 =?utf-8?B?UTNseU1GNkxYQy9nbWZ0R214Y2tHRzZhNXBReStmbUJ6aUxxVk1QbnlQTDRN?=
 =?utf-8?B?MjV1emplNWNheFk5L21qTXdtTFN0VzV1b0xYY0VGZTQ1Tlo1N2RVdFhHTXUx?=
 =?utf-8?B?Uk52UVZPY1hnVDB2aWFmOHJrb2x1S0RoNnFETWovUHlUR09BbktVWVhtVWJN?=
 =?utf-8?B?YXZFTnhiTjhnb2Mxc2FQZG9pYUZMVkxoSmxOdjV2TElvTGxXbkFVaUU1QW43?=
 =?utf-8?B?SzRGQW1nWWNRVTgxMW9vT0NWcTdvaTdFQTdyZ3JoYzcvN0NaNy8yUGlqOUs4?=
 =?utf-8?B?U3FEQkNmTkl1UDVYY3RpR2ZaN1VQYWIzYlBKT0YvZmxYRlVmQTl4SmpYZkFN?=
 =?utf-8?B?OGcwVGtpQjNPc0xIU1BENGc1YWdrTE5qemJxbHFaTnhZNmF0Zllpb29zWE1i?=
 =?utf-8?B?RmtWYnAwMkxheFNLNlM1eUZNQTd6KzdBMVI2eGgwaG5oOTg3VHVtSThCVUJT?=
 =?utf-8?B?c1FISGxOVHRMWjlhZ293TW4rTkJUN0t3Z2JUKzJDeEd2T3hGTUJCdUtpelFz?=
 =?utf-8?B?TXdwVVcvbWJCb2h5YVlhV2dmc1JlUWw5aWtSSHpiendCRmxLa0JlY2huUDVD?=
 =?utf-8?B?RGdXTW9XRFFXdENCRUhYWFE1S3laLzZpeEtWL0tvVFZDRStxZlZ0bWpMY0Vq?=
 =?utf-8?B?VnlxUXprNjlrSStOZ2hjNHplanBUNWZpYmtsMVNVRnZ0bkxzUEo5UGxqbXRE?=
 =?utf-8?B?SUtISU1MTVVZYk9iUzgrdUgyNmxwQnY0ZXNxcTFReWdsNHpORWROa2FQTVIr?=
 =?utf-8?B?VVhydmVGeUpmc3J2L1UyMVM2cDJQQXFtbUg3T3NZa0RUTk50ZWpKejlHQkc2?=
 =?utf-8?B?OEVYQkkwV05wM3loTXp0OFFCU3B6N2pTTE02ak5mbDZxMFpjSjdCeTgxKzND?=
 =?utf-8?B?K1NpZTQrWnpoekdubUk0ZzRGTWxiSnhNUTlnT3JGUyswUXk2alpuNGNqMVpm?=
 =?utf-8?B?VHkzZm9xN3AxSkdjakNITnVZbUZMNkJ4dFBCYVJlSHRGa1F6SjNGMjVQYWJF?=
 =?utf-8?B?N1FCcDFBK2o1NnRNZ0FRd3hFdW5tb3JCUmVvdW0wclZSTjBDNGJwK0NZQjJx?=
 =?utf-8?B?TlZSRitSaHlBbmIzUXE2T3lEQ2dlOUo1dzFrdmEra3h3WjRUcDRZaGVFcEQz?=
 =?utf-8?B?bGduVzhYUExvN0RxR2hHWXFOYmgyUStvSTcvU0VuekJWcE5aLzV2YXgzdm9B?=
 =?utf-8?B?OGIwUUd4SEFrRk1ObUtpSzI2S1hKWDl2YzMrTG1RdjdqSjVpaVNwNUoxNkxV?=
 =?utf-8?B?NUJscll6aUJzbm0wa1ZOeVJFdE1FcmcvYjZ3SnFiamZGMnBSLzNlTU8rcFFC?=
 =?utf-8?B?dmFkS3V6bjVjRnlyZVo3alZSdlhkQXVkbGNucWs3RmRocFNabzZYaktJUG1m?=
 =?utf-8?B?c0w2dWFQL3VwRllEdW83Rk9qR1l1YTRETFNHNk5rY1g3SmJjeExUTmtER3ZW?=
 =?utf-8?B?M2o1ODQ0SitmS1RobkZZVnp2SmxqZ2orK25HY2wrWmY3VlcwUzZaR3lPUXp2?=
 =?utf-8?B?ZC9UNVJjRUZTUEpmeWZQR0N0dkxYVWVBc292MEF1cDlIRldIUXdkUDdNbGp1?=
 =?utf-8?B?TXVhVkl4Y2NUNHA5ZHFLdjdkd1hCV2tRY0w2dFRWcllhNnJCVnZkb3dQY2I3?=
 =?utf-8?B?bmE1NGloeEFlaUNpam9VcHB4U3JscXMxTXV4UHNFbWlnOEZKZ2g0bDdETGRp?=
 =?utf-8?B?STlWb1JUdCsra2Z1bHNPeEszTHU1ZUcrdHlRdEdMQk9iYjUvNEVtNjFlaGJo?=
 =?utf-8?B?aUpVREI0bjZqL2VsbmxHRFdWbVNUK1Y2dE1udlM1WVJ2b3Zhb01GUk9DZ3Fs?=
 =?utf-8?Q?vrM9tQQs6TsGRDfyKFVE3Os1Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47678150-3f55-4892-e3f5-08dcf2a1d883
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 14:00:11.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bowNjZFVKP/C9WGYz/mhfiXA1p/cjS18SmFU6I1z5yypBIF5W0O1Ux6QXp5GIId57NZMn23FPyJ2Wne5D76i+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081

On 10/22/2024 08:59, Ilpo Järvinen wrote:
> On Tue, 22 Oct 2024, Mario Limonciello wrote:
> 
>> On 10/22/2024 08:22, Ilpo Järvinen wrote:
>>> On Tue, 22 Oct 2024, Mario Limonciello wrote:
>>>
>>>> On 10/22/2024 00:54, Basavaraj Natikar wrote:
>>>>>
>>>>> On 10/22/2024 2:05 AM, Armin Wolf wrote:
>>>>>> Am 21.10.24 um 18:58 schrieb Basavaraj Natikar:
>>>>>>
>>>>>>> AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
>>>>>>> Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
>>>>>>> switching between Frequency and Cache modes. To optimize
>>>>>>> performance,
>>>>>>> implement the AMD 3D V-Cache Optimizer, which allows selecting
>>>>>>> either:
>>>>>>>
>>>>>>> Frequency mode: cores within the faster CCD are prioritized before
>>>>>>> those in the slower CCD.
>>>>>>>
>>>>>>> Cache mode: cores within the larger L3 CCD are prioritized before
>>>>>>> those in the smaller L3 CCD.
>>>>>>>
>>>>>>> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
>>>>>>> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
>>>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>>
>>>>>>> +static int amd_x3d_resume_handler(struct device *dev)
>>>>>>> +{
>>>>>>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>>>>>>> +    int ret = amd_x3d_get_mode(data);
>>>>>>> +
>>>>>>> +    ret = amd_x3d_mode_switch(data, ret);
>>>>>>> +    if (ret < 0)
>>>>>>> +        return ret;
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>
>>>>>> Please directly return the result of amd_x3d_mode_switch() here.
>>>>>>
>>>>>> Also i think that maybe there exists a way to avoid locking data->lock
>>>>>> twice
>>>>>> during resume, but i will leave that to you.
>>>>>
>>>>> I will leave as it is.
>>>>>
>>>>>> Other than that:
>>>>>>
>>>>>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>>>>
>>>>> Thanks for the feedback. I will re-spin a new version after looking for
>>>>> more
>>>>> feedback from others. Thanks, -- Basavaraj
>>>>>
>>>>
>>>> FYI - if no other feedback comes in there is no need to re-spin just to
>>>> add
>>>> R-b tags.  Maintainers will automatically pick them up when they use 'b4
>>>> $LORE_URL'.
>>>
>>> ?? There's the return change requested above.
>>>
>>
>> Basavaraj said he will leave it as is in response to Armin's comment.
> 
> To me that seemed related to the locking paragraph, not the return related
> one.
> 

Ah I see; thanks for correcting my misreading.
