Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012068.outbound.protection.outlook.com [40.93.195.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6118DB26;
	Mon, 28 Sep 2026 16:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611772; cv=fail; b=AEY4eLp0ofKSseKq8BgiWpBnZSZwEKYzK2h0WN0tnJQAA/nzaMMfTymbq4yHeyXuV/XzN3nNXAvAjisSJs3TdVNtdXon2WHUS9nI6MWflALmBvjK9pxeZYcSmwt9awNmVxOhgZ4ZnmCE+HDMV2DPHTFOLG3GG7DqZdNNuzT3qXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611772; c=relaxed/simple;
	bh=Hv1HdoM8Abvf6gFi2Kj5cuQZ6JsGEp1Fz6hZ7Bp0AX4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jJ8bbtrMwTTMnaZtAOPGPsTMWj0N9b8wlLPrcJFX0dDXJtIJSySDPThlSoar9uKGchpmF8e68zrFLRoMK/yPP0qW+vSk2tPbheHNeNgUa5PzLEQyOWtSBtwvLtXq9sjkN+RNkIPhC9GykvrM5xH+M2H+gk/SXDJ7/pWMjStL5TI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LtSra+v2; arc=fail smtp.client-ip=40.93.195.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LtSra+v2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uj/RfQ2DcczkyuficRGSbyvpSLQQbfnN9r3PVb/tkrTOiNeAxyvtllD6YIPOEEU7DNc615XzfUFHrf+w98QicD3NBK5tk8/E1S10QHLU+hjuy6bmdTrgIEQ4B3d6h9CEI0JiNxXBcbUHL6VSPprWp6HSaNxOE/a2gkGcgiGhk5eEt9mXbTBsTBKiKSpq7hBhHBGbVkF6bDIgdH4t4iLh51rrmm6fqZNkM/OuMf7OpQQhRN7pMAWBhGNm529LPrFWXNOLMb2V+uBAHqHo+8DwVi/pMut+jfojuGb6OBOFtoh7F55VRssi8Dkm+peG2rv4A29mq4xpZqWeEuESbFMABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxcvQ+f9zzfaj2Cnf7TRiYJjYADSeoVH1r87Xqdcs34=;
 b=IurEJrNAGDlxJ+d1cDrTI+dBg3oQXC8FJiK5APLLBHw2vFmiie2haMDeICn/jjokR1b6IBGCrQoQStGbL0ae8pAthHy0rrASSsNcYPzVmPVQ5PtyglH1j3XuDATpmkW/0wWYrxzIJwIgqfcHj0kTgvspTt0qCN/uwNsI/d0v4YMvN4vCso3HKYyisHutsz3WXaf3rCDI8Bq68WkJvq5sgnuBf/Vtj2owMIGy8WKKrNXaXmBkiwHox+WBtFGs3gByUD+Ee68pDC3Fr9ZrStm6YOZRk3EbDyGMoCtpL1mYCFDEy/vl6VQ/Y5eZD7MwJ7fvNSHS52vlwgemoGMzH9MM1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxcvQ+f9zzfaj2Cnf7TRiYJjYADSeoVH1r87Xqdcs34=;
 b=LtSra+v2X1c5H+TtK+2DNJ9gAKUhJA6Zy+hEAajSp8HHIqG6MoQCh0DJ7l9R4O8TPHk5uOBmgwyxyDQgqI75motfAqpo1aPSf/AlQGjxK0N+SGYHGTk0PV8i/xtr4m68W53ioPvGh5Ivn3EB/vIb0S2/fUiKDF4BBfOWSmjfBC0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 16:09:21 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%7]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:09:19 +0000
Message-ID: <20c15bb0-abf3-4a34-86e5-712f8f131acb@amd.com>
Date: Mon, 28 Sep 2026 11:09:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Add Thinkpad L14 Gen3 (21C5) to
 quirk_s2idle_bug
Content-Language: en-US
To: Bruno BOI <bruno.boi@bobtopus.eu>, Shyam-sundar.S-k@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260928160607.679319-1-bruno.boi@bobtopus.eu>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260928160607.679319-1-bruno.boi@bobtopus.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0252.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::17) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 00c1a39f-71fa-4a30-24d5-08df1d7ad9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|13003099007|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dFjoF+MpIoN3MMxc1g34+2F3QrnKIEtwmuyl13oHtyElB3hjrJ0A5mJG3xBp+nIm7ClRsz7SihjAB8RKGaFvQbYVnUab0iMYw/0vKtnXaOWmkC0oOi+QcUFHga9c4Nbkz0btqW5TjLA7K4nczceScOI15zg3cGdNCHe1zdBQj+Q1MxOVzHs/RaSJxpGUpJU01eRBZBEVtsoxiHyN2+EyBEsxlxaCIRvMxwrhPNfe24IkcmecP9Kjq8xxbI+EQyGG0+8BnfvItgvwgiVEYl2ikiwwpYDZ855u4F+qLsVXWPWjjwsAI2oPSF81BxmIvpUWUUqp3zoQqNCFIVGCmdT1c9Ql175lYXVH//+3yzq4ndx6XEGKgLfWLz42D92MYTgq/4IcHpCKIjfiifDhba/zPggU7+LQX9f6ztFAmLc8y/cGTbnVSXBdh9eT7wVS32DGKUY6nEy/TVKFVF6RAyZC36YE+AXK5IJXGeZ6zAHdOucMVCmtt3J3YWVkNNjnAXQZCjb98KpfkCuuFldkLpNrjGcx9VF+PM07HenORIXvvXXwGV5ixx6xaPWvgr6zMoZ7cZpgwj1zsILYG2lf4K+ZdTijfhEv1KcpyFDgFfHdZSs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(13003099007)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzlxNHFzODhvRU5KcTlXRDF6dFp1ODN5Y0lLTVcxekNzazFWODBNdmRVRmhO?=
 =?utf-8?B?Umd4VlQvUU9hSjJyUDFnczlZSG1ZV2szV1pWV0ZPcDJ4OEIydSs0TWRlM1Yv?=
 =?utf-8?B?RDY4bEFRNlY4Qms1R2ZYM1FMOC9wWDBCMzBIMjJRelhremVOU0FQU1pyc0R0?=
 =?utf-8?B?MjJYc2ZWZWpVYTdTYzRKNFVoOGVuaXMyNDZhdkY2V3RLck96NTNJVDlFdHpD?=
 =?utf-8?B?UzJLYitTTFFraHRvdnh5SVVrWEJJRG14R0xDL3ZoM0NONFkrc2FyV05DWEll?=
 =?utf-8?B?eFpsWW1vcTlBQWY3RGtXK3NEcnpRNmZiTXhXam4xS2o2bFBKZGtRbElZZkNY?=
 =?utf-8?B?WS81aU5OWHRhdWRKTFpnSVpuQ1lSbTNWMmVJTGpUMGxOaUs3eXZpclpSdy9J?=
 =?utf-8?B?UUFhSkVJMmxPcmRjMUdWaEkzdDFwbk0zYmpwRzIwOHZ4bWc0K2VsVkRzd0VN?=
 =?utf-8?B?cUl4cEYzaFpOR1VUaXRFNytXZWJORmhsNWJRKzk1YlExU2dGWTNFb1JUUFFl?=
 =?utf-8?B?Wktkb0w0ZHdlSjdQZG8vZTdUdUlGVkV3RVZHUkpqSVowZHBWNnBmeTFCUkJy?=
 =?utf-8?B?aWswSks5TTdVRzVhMlhHamRQVmUrOVdLQk1VVzByZzhmY0xVenNDVEVubDZF?=
 =?utf-8?B?azBaSk9MSTBmTUtXQTlUOXBFdlZKamxpUHpWNGtPRElNOENuOWRielpQWUhv?=
 =?utf-8?B?N0t3TUhmSndQUjYzdHJlYXRQb0pqc1dsZ0FGREFvcUtrVnlqSytmQzRvUFNI?=
 =?utf-8?B?Nkk5Y2RqaEQ5R0dFa1Nkd0FmRVhMRnZBdUlFUGRseVR0cFlOQUl2WTFwZU1j?=
 =?utf-8?B?WTg5cUsrbzlTVVJUNFFpd2NwZEpxa1ZwbDhORjBnbDVCTERac2VYd3UzbGZT?=
 =?utf-8?B?eS9oVGRPL3R6ZWxPeWZ5b1ZUY2xhaGR6U3VvLzJBcERjV2I1b0FQanZycS9C?=
 =?utf-8?B?RmliWDNSWXVDd2lHeDVGTFVPYkFoYW0rODFrcVlmV2JYV05QWXJJV0w3MDhr?=
 =?utf-8?B?cUZwTWtaY3VsZmMvWVNCdW5JdmV3MmtuQkw4RG5GUGlYTVJNaTIxQlFyb3B4?=
 =?utf-8?B?SXhrUlZDampGYnR2Mm1qaGM0Slp2Y3h4Vmd6S3R2Tzd5QjJqemVseFVtQ01S?=
 =?utf-8?B?elhJZm03VnpMT0w4eHR1b29wZ25DeGUrbmVXdWZPMUVWNGxYUEpGQWhtOXk0?=
 =?utf-8?B?dFYxOGp4WlJCN2E5RmpUcm5yU3BBNzVQZ0ljU05CaUQxYW9STnUrWmZOdmor?=
 =?utf-8?B?UzZQMjE3ZFJKekJwL1diSFdadHNmdlNvQUZXVXZLSHJSeGlBUDlDY1JWNWcx?=
 =?utf-8?B?UGxMaGNIZ01ybUVwamV5dWg4Nk1tMGcvVjYrbHJtbk9tQWhxV1JlYy9iREdD?=
 =?utf-8?B?ZnBmRlo0aW1jRkdvTVp1TmRLWUR4Sm5xWDZtME9aK1F1M211NUFqc0dxSnor?=
 =?utf-8?B?UTI5aTFQYzd2V2E1QVQ0UjU2dk9XY3pyNW9SbXJYUW5EdERReC9IK09Sand4?=
 =?utf-8?B?UUo5RTVCcHBYa2s4ajZxSDI0U1FkeHppckpMMGhFN2xsZjkxai9wenlwdG9r?=
 =?utf-8?B?YXplWGRObi9RK1lQbGtrUWlPVzlqSXVlOUphZmp3bnE5ekVCV2Q1UmZ2WUd0?=
 =?utf-8?B?SXd3dGxrdFlLYlcyQTNjVE03YUdpN0lUZkN6R3BNR2ticFphYU1PT2g2dFhR?=
 =?utf-8?B?S282cDhYWms2WVhFY0ZrcWlMSDNBTFdCQ29MM2NVUjR4TjVSSWN0YlBxaWJm?=
 =?utf-8?B?L3VPZzkxeXVlQjRnZ01LRXhaSXVncUloRW0vSmRaZ2RlaGQ0NnZxelRhNE5V?=
 =?utf-8?B?bGpRNldyWUpheS84bURJTFN5Ny9aRFA3YU5oZnp4UjFFZlltbEZ6VTN6S1JN?=
 =?utf-8?B?cDFPR3JzalBuY3BxaTM5RFJ4WVNHdU9mRlprY21JRDdNT0c1UzhzTnBOV0NK?=
 =?utf-8?B?SDRGQnhLVFVXMmdJUzlodG5IUnpOTXphRGhIbm0vMU5mU2lSU2taSDAyRDVL?=
 =?utf-8?B?ZUNuSXJpcHZtNmNTSmFTZ3JrU3IwdnplMnZCNEpxanVNcmdxV2hlMEJQSkQz?=
 =?utf-8?B?UFFDY2hDZ2FnNTZYL2FEelowR2xmSFZ4R2J0V1FjTGdjTm5wOUd6cmppNmln?=
 =?utf-8?B?NEVMa0FaaTcxQnJOSENQUFpIRjlBK0szem9mSW1pTUZEVlVSVHBMUG9DazY4?=
 =?utf-8?B?NWNXQUlEQWFYZUM1MHV0QWticFpUaUxEY0dWSWZIMWNTVlVzeUJPMk0wRkJX?=
 =?utf-8?B?RWlQQWpjUVdIdTRyemdzU2FjTFlXSjJRdTVtQ1p3am9xVkEvQlJYRHVHWTU0?=
 =?utf-8?Q?oZMVvyzOrrqDeDqzkt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c1a39f-71fa-4a30-24d5-08df1d7ad9e9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:09:19.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01ApV1sHuntCbMkoNYeTFl56GgKrLV8Tda6/9YK3davwPJNiM+1DgFdDcrQo6cQxCVzqok3C1ujGXKTeJXJEcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880



On 9/28/26 11:06, Bruno BOI wrote:
> The Thinkpad L14 Gen3 with DMI product name 21C5 is affected by the same
> s2idle resume stall as the already listed 21C6 variant: resuming from
> s2idle blocks for several seconds before the kernel resumes.
> 
> DMI_MATCH() performs substring matching, so a "21C5" entry also covers
> SKUs such as 21C5S05800. Add the 21C5 model to the existing
> quirk_s2idle_bug table.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222070
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221273
> Signed-off-by: Bruno BOI <bruno.boi@bobtopus.eu>
> ---
> Changes in v2: resent with the correct sender address; the patch
> content is unchanged from v1.
>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Mark,

Since it uses prefixes rather than a new entry how would you feel about:

DMI_MATCH(DMI_PRODUCT_NAME, "21C"),

On the 21C6 existing entry.
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> index 74ddf1d..c3fabc9 100644
> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
> @@ -246,6 +246,15 @@ static const struct dmi_system_id fwbug_list[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "21C6"),
>   		}
>   	},
> +	/* https://bugzilla.kernel.org/show_bug.cgi?id=221273 */
> +	{
> +		.ident = "Thinkpad L14 Gen3",
> +		.driver_data = &quirk_s2idle_bug,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21C5"),
> +		}
> +	},
>   	/* https://gitlab.freedesktop.org/drm/amd/-/issues/4434 */
>   	{
>   		.ident = "Lenovo Yoga 6 13ALC6",

