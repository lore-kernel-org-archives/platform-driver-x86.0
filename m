Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F24194ADB
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2024 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729602311; cv=fail; b=e/XnuAnqV17QQdPIOwgAjuaQ00tZBOj+hd7Nm35WmUYlYgtnI5EYGTpPtf6hGTkD1nh5X2K4EovNiEYC2G1JnD9v2flE2hTZzk34ExMAtu1yZ4yvF+9fouaWUTEt9UNcTc4W5xB4BEgrnEISzP04SqFkAsHoyy0I22IRh96WIGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729602311; c=relaxed/simple;
	bh=4fHNs+AGhXe1QF3ykbCx47q+Z1RlJpvVI3gVp25edpw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oWZOzXdKaSnIICeUWGmPV6pXaftHD/QZsmwo3MhOXvNZaTeYCzHnwAepTy8mG8vjyYkGvkTArzPrmut+Ye1Dg8XjEoL8GXNhLKBSj5r00zcdkzKTfJM5aC9ko87CPijWxLOwAxAfzXwwlCLQhy2Y2OoMT88UWj78AVC5Xy3rcJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UtzIu337; arc=fail smtp.client-ip=40.107.223.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UtzIu337"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQ+LxSzHYvXoU1VPI95e3oI95piReLYYCMetsDTJLWPLczYVpEPvXXHxQ3nC7x24eCaYZk/MjIudrseka8lP/y75k6kL5Qg5668XYPfiN7tHy8TNEEdQhNrB75+AqnJZ6bnBES7sQm6M2oNO5T67ZlIe4n+BOOR0a633WGeRD0KFNRw1DZ/LoeJaqNaJ84evL81QMs4EynvnMm9GEay9R2dWzyqv79PmwOBOgzCaOQ4c7W57HlcJFvpe1NRrSnSxJVRgfHn3NlWB9Bslnf8WSLNj7w0CEVchqoK4yjGh3TCrHlTu4KWYbjatQ3KAtyiORoShs9L3/vIjhDiJii47pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnChO55AJcVu0vPWWpquS+CZCQqEUVCzA2gi0wpxHvU=;
 b=b75EPtE2y78/tj6cx4SBinL/6rVMA0JSHRIER7aeqsQEckMuazaaVkw9wOQNvffAjKC9OA7jFZrddHAs2bY35tgdPrkYheXbLhVUD9MUmlMQ220cjyutKhGdJurFvN6mYzKZVw8Lgp9La1ZrFEBXXvjIcRwUx7YhnPNX8q/EtNLeJ4T9i31eoNHCTpkWcJdfllY4VWoT4MTQqcPUNhc7ZVo2bSrcvxJSlvgDpfhBmx36JGBjIEkqdjR1AisCY2Xa+M9+ZMcymFTESe/DT0xf7HvE2k2CsT/oeLD9Vrd1CZqmUryJgkA4KhZaQcI+qccirVFkuV0vNpRr3HZnjkQUuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnChO55AJcVu0vPWWpquS+CZCQqEUVCzA2gi0wpxHvU=;
 b=UtzIu337CLpduPUximQ8izGpLxyGjIxcOV6z4Vt+IH7ocyxmvEJC1kpcchtgfBYVcShG+p6XwiLSxd2XmAqf+D43FW4aDRSVsPLlEyZPCYEK8ZQI+3iWeRtgOhU5DkCzyyJtDz46yYS5VDKU5AJeP0WGP3PI1ZUm1U6E+zimPgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB7576.namprd12.prod.outlook.com (2603:10b6:8:10c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 13:05:06 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 13:05:06 +0000
Message-ID: <7be0b988-013d-4dd4-8a85-0a72cdb1b924@amd.com>
Date: Tue, 22 Oct 2024 08:05:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D
 V-Cache optimizer driver
To: Basavaraj Natikar <bnatikar@amd.com>, Armin Wolf <W_Armin@gmx.de>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc: perry.yuan@amd.com, Shyam-sundar.S-k@amd.com
References: <20241021165820.339567-1-Basavaraj.Natikar@amd.com>
 <20241021165820.339567-2-Basavaraj.Natikar@amd.com>
 <72c0b021-9778-4bbe-aa54-c7ef887c04fa@gmx.de>
 <5dce0b9f-2b91-1cac-5150-899547cd042f@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <5dce0b9f-2b91-1cac-5150-899547cd042f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 219da087-73a5-4fbd-7597-08dcf29a2661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eElDSm9pVTErSVBrWmltQmdHcWE3eGxtYzkrQTFCVi9DaWdxVXM0NURBWmhL?=
 =?utf-8?B?Z2gvMnpyclEvMEdnSXcvREd6azNFb0EyTG1hVFFSUUwxeVhBYzV5YWcxYTFi?=
 =?utf-8?B?V3dOUnA3QW5JamdNU2E3K0NUSWdFRW1XSTArN2RQTjBGWDdYbnBHL2prVnR3?=
 =?utf-8?B?WllCYXVoRDllUEVxNUNlMmoxdm1WYXdYSkhFQmI4UmFSaVlraXkzZU5SREI0?=
 =?utf-8?B?em84N0t5bjdVQU9yV2hpQjR3SllsdGQzNFdOZWJGa0krN251QVg1OVIzNytE?=
 =?utf-8?B?dEYzcUExNkdFeEZ2MFJVRUVCQ3Q0L1p3Nktjc253UzlCMkhRLzJ4ZGdWQXZY?=
 =?utf-8?B?dHlaOUZFK1JhNUlXOFFvK1ZlSGhKMkNUUEJxNmkwQW5rTjVNc2lDMm1iZXZj?=
 =?utf-8?B?Z0ZEdU1ISnNnbFFOM0xKcDBBV3BNZTBtVjZVUENLeFBHKzZHWFB2UCtXRDhn?=
 =?utf-8?B?V2wrN2ZYeWJkbTJiRWlSeERzUVkzVk1xWityMnZ2NGNTVkY0eCtWQWk0eEtR?=
 =?utf-8?B?b041M0lkc0lENVJDTnYvRTB4MnZ6N1E5MmpIVVBTSHN2MFZVR2VEM3oyMGJo?=
 =?utf-8?B?aGhPcTlNVTBDOXAwdy9JRW1mb2ZoQktqVFZ2WG81OGdGQ0V5ZWhVZUsrTVBp?=
 =?utf-8?B?dC9hd0tzdjZEVGJsZW9TMmdoVWVnZlREYjVxTVdQQjBhYjlCbDRqT3B5Mlp4?=
 =?utf-8?B?ZjQ1RUV6S3hmTjgxdTRETFlxWkhCYThtaGxsRWk2VXRlUmIwanFOWmp2NG13?=
 =?utf-8?B?TjM1TDZ4RlZZSnFXOHBpZXpiQUpNY2RIRlZDUnJ2TmZpcFcvSXdhNDRiaExm?=
 =?utf-8?B?akkvSzEycEZseFZkN0FIOTJoTVpZRUlQb1VQOXl6MUIyelNDc3ZXTnB0MjR1?=
 =?utf-8?B?aWdUeitVbGtRdHdtT2t0RE1qZ3d1eS9SaGtvUHhPb3NETWt6aVFGWnp6Y2lv?=
 =?utf-8?B?cHJ4OWpjVDBBNjZlUGRHZ0N2MVBuUUtmOGlUMTYxRnpPQjBySW5mU1ZPM05K?=
 =?utf-8?B?NXdtemcrWVJMdjZLbGtoWUVUbnlMdnk1SXRQak5XUEVMek1iOVpBdTBtU29L?=
 =?utf-8?B?MDk1OFkxa1VGNVRXbGR2OFBUTE1mWncvdDBBZHJLZVVyMFZRaERrMUdjZGRa?=
 =?utf-8?B?VXMxRzREOWI4Z3VYOTFJbDlzeHJxZDBRZGlWaXNnZDl2KzAxSTUvczljU2hv?=
 =?utf-8?B?QjBsaXNxbnlVNTA2TkZpcjBkKzFMb3ZJT1M4cTVYQ0pqRk1qTmk4S3YrbHJj?=
 =?utf-8?B?WXNlNjRMQ0ZPcnkrdDZsZVMxcWZtRGU0NXJwQXpTQW1PVHJkOGNWMzZ5aHg5?=
 =?utf-8?B?N2tzcDdPK3crWnBPNUVpVmc4TnNMSEZPeTJHWHdSRENBdGdoS1k3bmxjc3BC?=
 =?utf-8?B?ZEZEWW52cWR6T2pvdHdPaHREcmE0K1FkOStDekVaTUZHditYWFJSMHZ2S1RL?=
 =?utf-8?B?cy84dC9rL3J0UFJGWlpJeTJaRGVudWlsMmNaWWJRVW1WRDJmc3hja2Q1S1JV?=
 =?utf-8?B?ckRvTXNTOFV4QWkxVUVBNmhnMHo0eDRJdUZtb2pmckVTVHQrNmxwZmtNeWFi?=
 =?utf-8?B?bC9ML1UvWTF5U21XUHV2ekU3QWtZQVMwVURnclpnczYzSFV5QnJiU0lQa3NV?=
 =?utf-8?B?R01wc1U4dWRTR0lxSWJPVWQ3aEVvcTJHcEdtUVNwQythNXJ1Y2pBVWFsU2hQ?=
 =?utf-8?B?VDgrOHlGNVpDYk5JZVBpNm1HYnJJSU9MYTdwTWViN2tJa1hibFNVK29BaTc5?=
 =?utf-8?Q?F9HE1UW9RPx+Flt+lau4k5C+a+O4X7FVunN6rkJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXptNm1PTjI1T0wza1AvbmdOeVV4eGpOYzYxUVFDblFSRUthd0FFdkJLaUlF?=
 =?utf-8?B?NHlvcDhzckNqaE1QTE9hbFdmNlE0U0RPY0t3dzRuaW8vVFkyRHM2bm1yWG5l?=
 =?utf-8?B?V2J3Q1Bhc3UyaXBYdUV2Mk01RUN5RUxya1pjUlhkRGdBcWJocGpWWnJiempx?=
 =?utf-8?B?aHU1N2wxRXVUamgyY1ZObXp1L2xGMnYwSDVpWHlZSHpSL2E4U0cvM05ZTWRD?=
 =?utf-8?B?ZHhwcTI3V0ZyYkZxNElpRUhEWDNuVnB6VUFwa291VFR5bWo5bDFxekF0TXc4?=
 =?utf-8?B?NFZKbitaUVZ3ck05Sm9KNkU5L0Nmb1ZHWTdyYjFQT0FtNEliRnZxWkk1cUNB?=
 =?utf-8?B?dklDK2Ezc0xJNFRaYUY4NXZOT1VVN3RqSWR5VTZpNlEyTER3dWJKa2pxaVFy?=
 =?utf-8?B?cnRhb1VyS2lsZjh3NEhQZ3FDbWhGOUpuRzNFeDVPQUY0ZExDOEtqYWdDWEZ4?=
 =?utf-8?B?SkJ5U0tDWXRXTkJMS2xlMTBOcmpEWHg1aXNyRnFDTG11eUo5K3dFVFVpTTlW?=
 =?utf-8?B?Sm8zVHZETldsL2h1WlN1U1piMDJSRERyb0dxa1BabDhzVXBqcnFHKzUvTGhC?=
 =?utf-8?B?dEhtWUd2am9aN2xlYnBaamdjeFhhU0dqVXRHRGtjNUlQSEY4Y25wZWVMK3pM?=
 =?utf-8?B?VFBzNWFybkFxaEZ5R1c1SWFyYXZ5Rlp1MGZ5dlFZKzhZRTVvb2dhU1JVTHp1?=
 =?utf-8?B?RHIxeW1FMXJMVENCd1ZTelNndm1aVUNaYURwTzJLUlQwdjljd3JhcVFlMzZx?=
 =?utf-8?B?cEF0NklUaXMvcmxUTTl1b3F6SU44Z1lMU0RqNTdncUYvcXA4ZkgxU1hGQkxX?=
 =?utf-8?B?NkY3UEJjUkhzZnEvK29sVWluTWdDR1gvNXhnbGpIU2c2UjJpdVEyTkNMcmQ2?=
 =?utf-8?B?K1RTWHdHTTBvTHZiU0N6UnZIb0ZuTmRmdndtbDZRVElOVEE1VW13dG9EbzBE?=
 =?utf-8?B?b2R4VE5jTU92d0M4NHlOZGhFMllrTHErbGpiMTJBWXhkMmNScWlHY1FiS29P?=
 =?utf-8?B?bE9UYnNzWXQ3NHFhT1ZZN3FCTVdscm85OXkvWlNsRldZUllYTll4bThnZVJR?=
 =?utf-8?B?ZEdHN293M3ppMDFOR3lES1ZXL09WZlVldmRRVElQMDROb3lWeTFNSWFNbERj?=
 =?utf-8?B?K29oOVJGVnE4MllmYWN5ZEE2RkNiR0JQVkZLWkxxOEk2cVNRL1JGekJFUmRr?=
 =?utf-8?B?N0RDcWljNnlNT1EzUW9JcStITTJ3RUUva0RIdnRkazNBNFBPZ1FqNnNXTGFx?=
 =?utf-8?B?aWg0K3VaVmlod0ZubXF4dXdaVWRDdEJ5S2R0TlUrbXUyZWIzTFV1WUZlc1JM?=
 =?utf-8?B?RTBEeUdNMlBJUTRUSUswMFpVRk5reTE0SkNlUzFvcHhIazVnbUxWUkovYVZl?=
 =?utf-8?B?RDMvSGxVT1VkWVIraVcxVSsvVjNkcGdPT0xNdFQzaWJ3RG1TbjlueWxuQ2xz?=
 =?utf-8?B?L1EwL2VXbllXejR4OUZxTFU4OFR3UzJCNUxFdHVPRHR5Z2FUYUE2dHRWdjBl?=
 =?utf-8?B?RW1BUUI3OElKYk50TG1ic25jbUhRQ0hrL2prSGFmNjZ0MmVuTjhxOFBudW5i?=
 =?utf-8?B?K2pXOTEvNWFIYmdvRU5MbnJhM0Q3L0NUMzZMS0dGWWJqQ2NTMXR2dXlodzY1?=
 =?utf-8?B?T0ZnVEFwcElkSU4zTzZZSkpJeW1tcUpkcU1Dc3VWQ0N5V1IzSnBSYXlYMzVw?=
 =?utf-8?B?NjQ5YnlxNUVEYXEwUjVUbUExby9VdUVXTjNIZExYN0tYZEhybWZTRVlXcDhW?=
 =?utf-8?B?L0MzWER0bFZuSXdMK3ducWVaZTB3ZzQ1Z204OWFURmg5L2xublVXYmg3RU11?=
 =?utf-8?B?cWpRSHZVNS82aVFnaUoyN0VURk9IYThQeE1VWWZsVzh2V2RubWxkci9kNWtG?=
 =?utf-8?B?cERxMHp3aHh6M0xrRC9sYUVFWlpSUXptNzEzd1ZiWWJTWGJ3aDBDS0R1bGhM?=
 =?utf-8?B?bytQNnRiOVdLeUh1K1J4Q09QK2JoY1BYSzE5aUlHczJYRW1ncCtENUlDRjhS?=
 =?utf-8?B?ZnorSXVuZnk2WmloTlc3cjJncEE4blE3Vm12Yi9UK0J1N2RsWnV2eW5jRG1u?=
 =?utf-8?B?VWUzaFpRSzVUYy9FOFlvcHJKczJBLzZDVWVxdENQMGJBekNPcVplcm9wZnZE?=
 =?utf-8?Q?m+YixK1J/pdfQj+1qtIIhEwga?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219da087-73a5-4fbd-7597-08dcf29a2661
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 13:05:06.4204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoPtPHMn6phYtQkagoWGK2yKM/CU1n7Wb9wg2XHujMjMh+vM2lHIZJYx4u4+Z8+6jW6NVlAet133o0/C7sHhhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7576

On 10/22/2024 00:54, Basavaraj Natikar wrote:
> 
> On 10/22/2024 2:05 AM, Armin Wolf wrote:
>> Am 21.10.24 um 18:58 schrieb Basavaraj Natikar:
>>
>>> AMD X3D processors, also known as AMD 3D V-Cache, feature dual Core
>>> Complex Dies (CCDs) and enlarged L3 cache, enabling dynamic mode
>>> switching between Frequency and Cache modes. To optimize performance,
>>> implement the AMD 3D V-Cache Optimizer, which allows selecting either:
>>>
>>> Frequency mode: cores within the faster CCD are prioritized before
>>> those in the slower CCD.
>>>
>>> Cache mode: cores within the larger L3 CCD are prioritized before
>>> those in the smaller L3 CCD.
>>>
>>> Co-developed-by: Perry Yuan <perry.yuan@amd.com>
>>> Signed-off-by: Perry Yuan <perry.yuan@amd.com>
>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>> ---
>>>   MAINTAINERS                           |   7 ++
>>>   drivers/platform/x86/amd/Kconfig      |  12 ++
>>>   drivers/platform/x86/amd/Makefile     |   2 +
>>>   drivers/platform/x86/amd/x3d_vcache.c | 174 ++++++++++++++++++++++++++
>>>   4 files changed, 195 insertions(+)
>>>   create mode 100644 drivers/platform/x86/amd/x3d_vcache.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index e9659a5a7fb3..11b829956499 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -965,6 +965,13 @@ Q: https://patchwork.kernel.org/project/linux- 
>>> rdma/list/
>>>   F:    drivers/infiniband/hw/efa/
>>>   F:    include/uapi/rdma/efa-abi.h
>>>
>>> +AMD 3D V-CACHE PERFORMANCE OPTIMIZER DRIVER
>>> +M:    Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>> +R:    Mario Limonciello <mario.limonciello@amd.com>
>>> +L:    platform-driver-x86@vger.kernel.org
>>> +S:    Supported
>>> +F:    drivers/platform/x86/amd/x3d_vcache.c
>>> +
>>>   AMD ADDRESS TRANSLATION LIBRARY (ATL)
>>>   M:    Yazen Ghannam <Yazen.Ghannam@amd.com>
>>>   L:    linux-edac@vger.kernel.org
>>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/ 
>>> amd/Kconfig
>>> index f88682d36447..d73f691020d0 100644
>>> --- a/drivers/platform/x86/amd/Kconfig
>>> +++ b/drivers/platform/x86/amd/Kconfig
>>> @@ -6,6 +6,18 @@
>>>   source "drivers/platform/x86/amd/pmf/Kconfig"
>>>   source "drivers/platform/x86/amd/pmc/Kconfig"
>>>
>>> +config AMD_3D_VCACHE
>>> +    tristate "AMD 3D V-Cache Performance Optimizer Driver"
>>> +    depends on X86_64 && ACPI
>>> +    help
>>> +      The driver provides a sysfs interface, enabling the setting of 
>>> a bias
>>> +      that alters CPU core reordering. This bias prefers cores with 
>>> higher
>>> +      frequencies or larger L3 caches on processors supporting AMD 
>>> 3D V-Cache
>>> +      technology.
>>> +
>>> +      If you choose to compile this driver as a module the module 
>>> will be
>>> +      called amd_3d_vcache.
>>> +
>>>   config AMD_HSMP
>>>       tristate "AMD HSMP Driver"
>>>       depends on AMD_NB && X86_64 && ACPI
>>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/ 
>>> x86/amd/Makefile
>>> index dcec0a46f8af..16e4cce02242 100644
>>> --- a/drivers/platform/x86/amd/Makefile
>>> +++ b/drivers/platform/x86/amd/Makefile
>>> @@ -4,6 +4,8 @@
>>>   # AMD x86 Platform-Specific Drivers
>>>   #
>>>
>>> +obj-$(CONFIG_AMD_3D_VCACHE)     += amd_3d_vcache.o
>>> +amd_3d_vcache-objs              := x3d_vcache.o
>>>   obj-$(CONFIG_AMD_PMC)        += pmc/
>>>   amd_hsmp-y            := hsmp.o
>>>   obj-$(CONFIG_AMD_HSMP)        += amd_hsmp.o
>>> diff --git a/drivers/platform/x86/amd/x3d_vcache.c b/drivers/ 
>>> platform/x86/amd/x3d_vcache.c
>>> new file mode 100644
>>> index 000000000000..833e7704e6f9
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/amd/x3d_vcache.c
>>> @@ -0,0 +1,174 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * AMD 3D V-Cache Performance Optimizer Driver
>>> + *
>>> + * Copyright (c) 2024, Advanced Micro Devices, Inc.
>>> + * All Rights Reserved.
>>> + *
>>> + * Authors: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>>> + *          Perry Yuan <perry.yuan@amd.com>
>>> + *          Mario Limonciello <mario.limonciello@amd.com>
>>> + *
>>> + */
>>> +
>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/device.h>
>>> +#include <linux/errno.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/platform_device.h>
>>> +
>>> +static char *x3d_mode = "frequency";
>>> +module_param(x3d_mode, charp, 0);
>>> +MODULE_PARM_DESC(x3d_mode, "Initial 3D-VCache mode; 
>>> 'frequency' (default) or 'cache'");
>>> +
>>> +#define DSM_REVISION_ID            0
>>> +#define DSM_SET_X3D_MODE        1
>>> +
>>> +static guid_t x3d_guid = GUID_INIT(0xdff8e55f, 0xbcfd, 0x46fb, 0xba, 
>>> 0x0a,
>>> +                   0xef, 0xd0, 0x45, 0x0f, 0x34, 0xee);
>>> +
>>> +enum amd_x3d_mode_type {
>>> +    MODE_INDEX_FREQ,
>>> +    MODE_INDEX_CACHE,
>>> +};
>>> +
>>> +static const char * const amd_x3d_mode_strings[] = {
>>> +    [MODE_INDEX_FREQ] = "frequency",
>>> +    [MODE_INDEX_CACHE] = "cache",
>>> +};
>>> +
>>> +struct amd_x3d_dev {
>>> +    struct device *dev;
>>> +    acpi_handle ahandle;
>>> +    /* To protect x3d mode setting */
>>> +    struct mutex lock;
>>> +    enum amd_x3d_mode_type curr_mode;
>>> +};
>>> +
>>> +static int amd_x3d_get_mode(struct amd_x3d_dev *data)
>>> +{
>>> +    guard(mutex)(&data->lock);
>>> +
>>> +    return data->curr_mode;
>>> +}
>>> +
>>> +static int amd_x3d_mode_switch(struct amd_x3d_dev *data, int new_state)
>>> +{
>>> +    union acpi_object *out, argv;
>>> +
>>> +    guard(mutex)(&data->lock);
>>> +    argv.type = ACPI_TYPE_INTEGER;
>>> +    argv.integer.value = new_state;
>>> +
>>> +    out = acpi_evaluate_dsm(data->ahandle, &x3d_guid, 
>>> DSM_REVISION_ID, DSM_SET_X3D_MODE,
>>> +                &argv);
>>> +    if (!out) {
>>> +        dev_err(data->dev, "failed to evaluate _DSM\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    data->curr_mode = new_state;
>>> +
>>> +    kfree(out);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static ssize_t amd_x3d_mode_store(struct device *dev, struct 
>>> device_attribute *attr,
>>> +                  const char *buf, size_t count)
>>> +{
>>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>>> +    int ret;
>>> +
>>> +    ret = sysfs_match_string(amd_x3d_mode_strings, buf);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    ret = amd_x3d_mode_switch(data, ret);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +static ssize_t amd_x3d_mode_show(struct device *dev, struct 
>>> device_attribute *attr, char *buf)
>>> +{
>>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>>> +    int mode = amd_x3d_get_mode(data);
>>> +
>>> +    return sysfs_emit(buf, "%s\n", amd_x3d_mode_strings[mode]);
>>> +}
>>> +static DEVICE_ATTR_RW(amd_x3d_mode);
>>> +
>>> +static struct attribute *amd_x3d_attrs[] = {
>>> +    &dev_attr_amd_x3d_mode.attr,
>>> +    NULL
>>> +};
>>> +ATTRIBUTE_GROUPS(amd_x3d);
>>> +
>>> +static int amd_x3d_resume_handler(struct device *dev)
>>> +{
>>> +    struct amd_x3d_dev *data = dev_get_drvdata(dev);
>>> +    int ret = amd_x3d_get_mode(data);
>>> +
>>> +    ret = amd_x3d_mode_switch(data, ret);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    return 0;
>>
>> Please directly return the result of amd_x3d_mode_switch() here.
>>
>> Also i think that maybe there exists a way to avoid locking data->lock 
>> twice
>> during resume, but i will leave that to you.
> 
> I will leave as it is.
> 
>> Other than that:
>>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> 
> Thanks for the feedback. I will re-spin a new version after looking for 
> more feedback from others. Thanks, -- Basavaraj
> 

FYI - if no other feedback comes in there is no need to re-spin just to 
add R-b tags.  Maintainers will automatically pick them up when they use 
'b4 $LORE_URL'.
