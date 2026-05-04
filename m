Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010001.outbound.protection.outlook.com [40.93.198.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCEF3DD53E;
	Mon,  4 May 2026 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777903546; cv=fail; b=jn4p813DGUzrds691tZuzK6I6QUfuyJrXm2k6UpKFgvZnRJq6l4LNiNs4Un/JlcJGN+cSWUNtRXbIQOZY7trTnBkp06+kYJbYAscNrD1d271kHAyY0Mnk5xDRdO8/+2wA1jR83pwJASnWGXQlvy899sWuvZLvZqUAuPDtxPdFLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777903546; c=relaxed/simple;
	bh=xH0g2XOElmb3WuHqbJeYAbXCTBy9ZXHDeGhTKyQ/6Gc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IBEXjKIKs2WjCON8jE8/AKRfb/HhFT4Wb/4o4XY04/y4gXciiGiTOIRrut/ke3EUtqKElGdFvX68asvioWaTSKNT7MIXqCdrlEONHaKfoQwb7/rPBiDvNcfutCCYLus3HTZEVEN73Q57nCmRkaLPoJ6+I/a911Ixk5mJlyQfZfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=31vX83Nb; arc=fail smtp.client-ip=40.93.198.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="31vX83Nb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhs5eKb6uIuByhCvzeTJAxyGLtcrQOSHfaPdi6LYJnV0BwTo0gKsKoFiooJlzNtr3Er9kBRkE4wDWWoSML+ezF8GwmYHXVZypNhuYy84bE01LUODH4ozMmkHDQUoaz7t6TTmSfeDNwqluHbxltD2LGuZKvu8LPL1S+Cw6uPkLoxNY/2aPzIf4CfjjLqPMyAfmDB2qf3Wh7SYPo+d7YYKycRtgBHWtRi/F8iTNCRQIqi5W73R6fbAyBLZoXZqboSNHDzxJaca4f0E8c1y2SGvw86rxUcCajGjuWlQIEwyEd9VvPlqExP+M6rtlb/NVl0J0ptd5zDLopoVuLWym2v3hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrR7P3dg/urhsxBbn7u5yb+embBTzum3MXftmMAPdw4=;
 b=VrTWeQrp66YUtDtR+UrVlp7Fy/p6f4edrXBGGbI/CbzFPQDiAN9/NQtBv1038csP9hYMWBvFOBMU7OKBBGDH+kSk+QCeESzjTFigZmVTihPH1LDKUepKIGEAJ4xqVhi4dwMyrB8gylLirN4Sc2jmgRvaXCgD3+bZH3UUOPdST8QXdmGSq7XUof/r4irlODAJhQsPQOnJthaQgZWY6rXsDjso7UvUbtuOrgrnAUmdIKjWdIURtNBhGWL8FkheUc72ZSMWaENzE/0o656zC5syKK5h7ml+lwUnsnLZwF2/TJLv51mO4lrHZxjLn9JGDqRIGwKvU0IqrMToYwATIkNXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrR7P3dg/urhsxBbn7u5yb+embBTzum3MXftmMAPdw4=;
 b=31vX83NbxNTDvPTydSbQGlEPLg1Ol4JQHhRD3+3pa8GL1B6a70ZlVYHOQrm2/OmZiQxVEmk9qprYPgWE21DqjnSIl1n6Ml7ESFAGEZ0KAPciRUOsKXQMZ4JQIxHs4ct6NVsW5GX86bMv2fOGWkoc5RMd3Gc1JXwMBavjnjrPtgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by SJ5PPFDDE56F72B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 14:05:38 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 14:05:36 +0000
Message-ID: <933d555d-183a-4f72-a8e8-822e6dd9758d@amd.com>
Date: Mon, 4 May 2026 09:05:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: asus-armoury: downgrade missing power
 limits warning to info
To: Armandas Kvietkus <armundunelis@gmail.com>, luke@ljones.dev,
 denis.benato@linux.dev
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 fxzxaxon@outlook.com
References: <20260504072734.17113-1-armundunelis@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260504072734.17113-1-armundunelis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR14CA0040.namprd14.prod.outlook.com
 (2603:10b6:5:18f::17) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|SJ5PPFDDE56F72B:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5b5a46-656b-4db9-b960-08dea9e63698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	N9JEl2XSBoRPEL69nOSqYONpejC6jiywjQda01kjAtJacY5IbdvgnZu3ab5C9LA3wH78pQLv2lL9KfsUxUS+H/nqOEZx5UYyEX/LulBt/dbD5GqWfNBBphow/q1fjQWJLcPleYjP6rytm/jvosudK0zjyahTGqxUX6m4xXmk2XOx0bxLyxkw7HEh3b9c+bHhvEpLfLEAgNfu2Fwus07zYWxGDgOH3fzut7hkKKrBuQg+UxMICVtOqfqVbIW2eNISV48Xsit4lP3I0AkWPfCN9tIUSCLxsDt2Il4JPOeR13DhcRPwe4T8tIlFBJ1kJwb13aX+H3Vt+Il6Pd5g3gO5rUxHHsoLb24ns9nSZvMr4XFDvqgpCPD2SoawoscWqsUUU4bGYXQTogdHwF56QWuuY6Ye304B8lRmVAwgMVv03+TDZ+y5qmNpsGZCRTIEVbTWvLHm3Xk4Wbb3oljlcL7N4vCYIKS/1eJlWBgzQOOf05QrhyYQLZ5m8OFZJkGlE5XcmNw4hpc1wocLgfDGT4GjjAuk0M7crxjcbUtpP4RdvNoIsBVjvb9gcD+Yv446nfnA3SGoxkhh1h7uRFhms+f3kKVe3nWrYV8q5+iK/zqOBjcP/3RDSJrkvR0IYGBHUzdzyihysnPFKJGuIs+YHglmhkCd8PTFTyDlmB44dhieW/I+YBfIU3K4h9JYPF6loq2+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVZ0QmFkV1dzQmkycjBtOWVXRE5MQVdOZnlhQXRrTHEycUttaWs1RGpNamFV?=
 =?utf-8?B?MlorUnpXYW0wZ0p0R3p6VUQzdE4zOTdvS0JHTks4bjZrVXhvNHMyOHo1YUNs?=
 =?utf-8?B?b1VSRUNLbXJ5MXZHTXoxcHJLaXRXOWkzQ2RDeHhRVDF4S0xQOEtOZXlzZ1hR?=
 =?utf-8?B?TUdBVXk0SnRaUnc0ayt2YmZqY0pWbnhhaGN5aTJCcnhmQ0luSGo3c29DZmJQ?=
 =?utf-8?B?YmNwcTRTVVVuNTVsMDJCSkFJcTN5Y3gwSVVSb0l4bG5naTNFQWk1UHNzL2tm?=
 =?utf-8?B?NVJEdlJUdHpJb0MwZyt2dUZsdnROWWtkckJTeDMvWDFFbkRaSGdpajJPOGNY?=
 =?utf-8?B?ZTJtZFVreExyeFF1T21QMk4xaVY5R21HeHZoellYczBSZHR1ZU5weXNVYi9a?=
 =?utf-8?B?ZXV5WXdUU3VaOUpxZ3lDQlhYeTV4Vnhla1NkVndNLzJ6ODZFNWRReEtISmp6?=
 =?utf-8?B?cEU5eElqRkdaQXp6b1dYN1lVd3M5dkQzVmg4Yk5xV3ExTytGVEFUS2NUeFM3?=
 =?utf-8?B?eEpuMWdHZEFyT0FKYnZ3b2pEVVpmblppcHNrY2NBWktFcWcyNmlTOXo3MDVS?=
 =?utf-8?B?dTRpSjR1MFZZT2xxR0VOdWt0YklDcjlOWVdVVHorQ3RkWHJPblcwTzI4ekhI?=
 =?utf-8?B?eHEzNDlyd0FOK1JuRlFvT0tjK0JSUXhheDFYb2JLLzBFSlgvY3g4ZlNYalB6?=
 =?utf-8?B?d29PbFBhUmhaTEQ0ckt1RER1T3ErYjU3cGwzKzd3bS82SncyNStBcHNSd2Rv?=
 =?utf-8?B?bHlMcXU5WFlKaVZRQ3pNeGpXSERnMWNnaHNHNFZ3U2I0TnpQMHp1aDA4b1lG?=
 =?utf-8?B?SWQxNzV0QlM0QmhzS0NwTHZQd0ViNnRNbmd1b09WMDlZc3ZpY085YzQ5Nkhu?=
 =?utf-8?B?VTVwc1pVQjdvdk1lS0JCNDJidTk0VWsvZjRMbXJoSytYRHhweGc2aGVsQ1JC?=
 =?utf-8?B?SGZWa2NobENFWWYrSncydVBSeHdFdlJUaUZ0YWN2WWhZVnZFZS95MGJOS0VG?=
 =?utf-8?B?VXN1cENsTlZsZU50OUZ2aW5KRXpTTXo5SnhRaFFoRE90cm9WVXg4bVU2a1pC?=
 =?utf-8?B?TUxCaG1xVXZJdUpLYjRPMmtOMW5RN05KMmRDdzRlSFBBdWVuSnZhQmVkR0Rj?=
 =?utf-8?B?V3lwY0ZON2drczRQTTNQYysrZlFqTi9XYmFKbHJzcFJJc0h4Ny9zN3k4SEg0?=
 =?utf-8?B?N1BjZ2ZJUTJnNWNjcXFBRElYS2p4QUtPYVYyZ1Uyc2xncWFYdnBGcGRGV1VI?=
 =?utf-8?B?a2NYcHluZ1l4QnZxR0h0Q0Z0U3BVQTJSY2tWNHJxSWhTYU51SWdzd0wyY3Rr?=
 =?utf-8?B?aHBXZHNpL1ZpTHFyUGZva1dhdkdmQUd1ZXN2SllUNkZSY2ZEMld1dkhjRi9q?=
 =?utf-8?B?TkNieFB0ZHA0b2R2TVA4ZGRONktFUDI0MEZyNFZ5dWZmRW5vRjMyd29BNXQy?=
 =?utf-8?B?MEVlZjhPK3VEZmNSQmdhMmU2ZVRhdlRJRk0vN1pQZEl6aGxwSzFMRUNzTEJq?=
 =?utf-8?B?RnBKWVZmUDNTY0U4Mnh3djJjR2ZBVHRqSjFIS2ZtZDQrZFA4SVEvMTdxMlNt?=
 =?utf-8?B?YmprMGZNMW0rM2EzSVpPMDl2cjBkbWJrS3VDOEdaem9yMENSRzNqSjZyTXNG?=
 =?utf-8?B?emtrb1I1TVQ5OXRQOWFNbThMWE1SUzJGZG9GOVZyUzUxaXFneGN2V3J1Smxa?=
 =?utf-8?B?VzcrNzMyTnR3RUF2RHFsaEkvUThkWUQwZUExNjcrNytheXZscjdaajZuUlVV?=
 =?utf-8?B?cUFncktHbHNGbHVLakZiVXk3czYrc0MyTTJwWTh1V05kN3BYMjBHM1FJcExu?=
 =?utf-8?B?VzV0WERCcnlielJWMXhTRUhHVmZvbytPYVdrVGFuV1NRRnl0NUZPUkgxbXdR?=
 =?utf-8?B?WURPN1g3RlBsVWtoUVhBRU5PdWVoTm1YdXpURlVGdnpDd1NQMktpWHU3Yk9B?=
 =?utf-8?B?Ny9VM2lLQ1dGejhSRmtTSHdiSlpaelRvRTk4bFcyQzR1bGYrR0w3Y2R1Sith?=
 =?utf-8?B?UXJpb1RSTHlKYnZ5VGRoMEkwamQ5M2gzYko1YWVCK0xHcWtYc3BsYWt6WHU1?=
 =?utf-8?B?SEEwcytSZDJUci9tSXJ0aDNzME1kdXhnM0d6Y2ZYMUlkYXZUMkhFZFU4ZkI3?=
 =?utf-8?B?UGlJMVhUcEpuM0tVREp6T0VZZlkxeTRUNUZXMTMwSHBPZ1lER0gwd0NYcTNv?=
 =?utf-8?B?NEFPcm50c2RLRkRCb012QjF6Z3hNQ2J3VlVUWWZrL2pjc0h5QUlkT21pQ21U?=
 =?utf-8?B?dTgxVEJnOFhSVjE4NWI1ZndvQUV5bUZiUXJUYWV2d0JoQjYwZE5QVXh5VnF6?=
 =?utf-8?Q?E7E5JPEVEkv/wqdpBk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5b5a46-656b-4db9-b960-08dea9e63698
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 14:05:35.9734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0iEEsKpl8Ens9N5whuVfMG6KzRe/rCirDskoNmmCnWS8Dhw66s3onhRid7Ci+/bpefMZJBkaUlKZWXnYcTfSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDDE56F72B



On 5/4/26 02:27, Armandas Kvietkus wrote:
> [You don't often get email from armundunelis@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> When a system is not found in the power_limits DMI table,
> init_rog_tunables() emits a pr_warn() and returns. This is
> expected behaviour for hardware that does not support ROG
> power limit tunables, not an error condition.
> 
> Downgrade to pr_info() to avoid spurious boot noise on
> unsupported systems while keeping the message visible in
> default distro configurations.
> 
> v2: use pr_info() instead of pr_debug() to ensure the message
>      remains visible without dynamic debug (Denis Benato)
> 
> Reported-by: fxzxaxon@outlook.com
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221441
> Signed-off-by: Armandas Kvietkus <armundunelis@gmail.com>
> ---

I thought the whole point of this message was so that the limits could 
be looked up and reported.

If anything I would argue there should be more added to this message 
telling people to come file a bug report to the appropriate place to get 
the limits determined and added.

>   drivers/platform/x86/asus-armoury.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 5b0987ccc..b87e0b601 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -991,7 +991,7 @@ static void init_rog_tunables(void)
>          /* Match the system against the power_limits table */
>          dmi_id = dmi_first_match(power_limits);
>          if (!dmi_id) {
> -               pr_warn("No matching power limits found for this system\n");
> +               pr_info("No matching power limits found for this system\n");
>                  return;
>          }
> 
> --
> 2.54.0
> 
> 

