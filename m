Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B051026AC2
	for <platform-driver-x86@vger.kernel.org>; Sat,  6 Jul 2024 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720276105; cv=fail; b=T54SiIxt0KJ2Hh2shMF1HAPzyk0nDtWKa/7aR1QkPfIvMgo9g6VsTumTU51UynD98d1hy1Fde6OL58RiSMtDH9cr/cLnBpj+tbL5x+Qj6V9+lh+srAK/zUZ1dpnzxW7Hqb6ZkaAmUO4NZaLriemPuOPUjgrP0QUFFtBoaMsBrmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720276105; c=relaxed/simple;
	bh=9HJPQUjerE5SB9vze95nFnkktMNBA2Yb/NtLpcy0z8c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OsB2ioVP5jVIyOToyhLRZNEWExtoHuPJhtBE2idVUcPXRLxR1VhrJGd7YRTl6NjnPgFc45F75X801yFttwx8j255xdSiiJbYg9gO/4y+g6IM6YH9k0xu6xuvyGdW0f+LZ8aIQdd5jldh5RLT5ePBF7mpRcGs8OtTMQ3qeQb6MOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kb7j2sHK; arc=fail smtp.client-ip=40.107.237.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kb7j2sHK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vyx2LwsKTVow6/lYERuZQHQ85wJqGl25KnWCOva3tinVycpc1O2y5Sl1ytjyBQgvaEGyb1GuQ1LNLbV/B1lmZh4w86Swo8Es/YAu1F4a9eRACpIhjqRGR1kSOn+bFXzt5wYCN4kTaafEN7CxJr8F4b91XcsB+ef2cicfAV1Us6m3dLix+5UhLEzvOURQSeTxDvfdc8FGXTnNMSMj9cxeCidQbcOy2EJJjmXeBHnyfAtZWwxvDOEHV7UO5jD9KIOHbPE6ujMuAopdNVW/yH+sgDJRQ5UtaBgiKoJSaN/B/F7chycRtc/XrsfXHbGWCoFl0pNrRpFpPZMRtEp5Fa+ATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m9a/M5qhl0ZEeHS39VJW3QLvrhpRyUK830kHEiaLbs=;
 b=QCa4SDAq970aTcJCVgH2hsvyaxFxa+rFg7lFWa0phjA5zQ8Ns3kRg45XS1sHFrFXGxAieTSAk+lpV7DjW6Cv05jG+vjdg0fVPFfIBAnjEvcKOZsQyKInagXjryVc/8R8jqxdffUni91KQW7el+cI+qREd6tOZBXCCJsmvcEB8npBaueJVZJ3kXBcUN/uPuJcOjscPCYqJ3KP+opCImMl0Uhry1F/uiPzS3Hy5P2O3muXnKlNwIb3WqGmiRRhaZs5LZBDmaqx8MB5ZX7XCgZb/crSTia5WRkBAG45JfU3Iy9u/sQor8nsLgAXp5BAoUJxaoDDwb/sNqymAawGz4Pa3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m9a/M5qhl0ZEeHS39VJW3QLvrhpRyUK830kHEiaLbs=;
 b=kb7j2sHKxnUw1gpp2RxZycPzCTkqLhPrMjbUiqGsejHCNGTBKAYyTv6TkGXqzlKfgPPPojbARhH2qX1146Zp7Ye0bLDr+/b0qwT6P6e9vCxcZcnw/oILMjE5TmEMdYyMYRsUCSHWx8nti4cOmNDaGltEwL4ACVGOTRXoImwHjDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB8536.namprd12.prod.outlook.com (2603:10b6:610:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Sat, 6 Jul
 2024 14:28:19 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%4]) with mapi id 15.20.7741.030; Sat, 6 Jul 2024
 14:28:18 +0000
Message-ID: <4f0940ba-05ab-43aa-ad47-62495f687e96@amd.com>
Date: Sat, 6 Jul 2024 19:58:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] platform/x86/amd/pmf: Use existing input event
 codes to update system states
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 Patil.Reddy@amd.com, mario.limonciello@amd.com
References: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
 <531d4d0a-9ba0-e67f-6f84-d11de1a0156e@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <531d4d0a-9ba0-e67f-6f84-d11de1a0156e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB8536:EE_
X-MS-Office365-Filtering-Correlation-Id: a836007a-eb85-41ae-3e5e-08dc9dc7e108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVdMSnlLZWdxZUM5UGNRbnUyeE9lMzEraGlFWEdGNUlxN25CYkVjOVVibE1W?=
 =?utf-8?B?eVlIeEdsaDBRWWMwaWVkcUw5MWxRMy9FcjFRUXBXRUVEV092anJSc05RV05Y?=
 =?utf-8?B?M3RjcnpWaUtvZ3A0R3V5Q091Z3NJVlhudWtUYUVsYjh1aGkwbExTazJjRzd0?=
 =?utf-8?B?NW40MjZYOEpGdEZ1cVdZWXlKZ0s1azRqRVlDZmhqNXkvUGtld05IL1dWSU5P?=
 =?utf-8?B?NGtBTm5RdmtQdXBySGRNcE5xb3ZSNlM3bmtGYlZhR3Q5QmxTa2Nya1llUURk?=
 =?utf-8?B?dFpqR0tUWi9KVmh3YmJrRXhhRzZNUHRFK0p5ZXZWUmw4ZFhSR1JzWlZrL3Nr?=
 =?utf-8?B?Vk9lYm5VeUNZa2M5bWU3WUtzQ2JWWGlIMUJ4WFR6VTVPZGs3WDRnVUk4WGtJ?=
 =?utf-8?B?ODl2MTd6YnMyYmVLSWJUZDRzT2VuRWtLUnNjUDdtZDRNSXhPQXE2Q2ZEOEt0?=
 =?utf-8?B?VnovQ3FYOHhuQ0xwL0VyUzhETG9Qd1JQVFV0Wlh6d3JZckQ3RFNrWjNkclUx?=
 =?utf-8?B?VHhqbHF1YzJQYWN2d0daR1VDNTRmb3lsdG9CRyttbjloMmMxdWlIM2JXS0lj?=
 =?utf-8?B?aHZjbHlrUVluV1plMWNkRUVtOVh6QXpYNll4Tk1RTndjWWF3RjBNZDJDUjBV?=
 =?utf-8?B?Y3MySVZTVEJuU3YzNlpCbDFGdkRxbXVsaU1oSXh6N1BEWjVURW92aDNRMXpt?=
 =?utf-8?B?eXpDclR1Q2pLSlorMUgrUG5EVlFhcittb2g1WC83cmc3YzEwUlgraExmR2Ex?=
 =?utf-8?B?TFVNTjdhQ3oybWZxOWUxYmE5Z0ZMdG43VDh3MGxDSHNYc0dwQWJxcW5VdVZ6?=
 =?utf-8?B?WC82bFhGR2xFdUI5SHhUYnpsTVlvUlhyWldNcG9jRTlDNExTVHYveHMwV01r?=
 =?utf-8?B?bkRPc2R4RmZsMzUrQ2dNaVhaQXdvdGFFMHpTVVR4OWpqY0c5Y1RIWGNwQVdD?=
 =?utf-8?B?SnVIT0ozZXlEMlNwWGk5ZmJBd21GOERKZjJ5emM4bkExMERtOEtUNVIzMGZC?=
 =?utf-8?B?WTd1MGdTbStibFY1UUxDVWlOMitNQXVLUVlFVGpBaFVRU1A5R0hQdXdKaURP?=
 =?utf-8?B?Qk1CWHFzZ3o3WkdlalRVRGZseG15TERBZ0tHbFdtQmxrRjR6ek9MZU80TzhK?=
 =?utf-8?B?NmZwYkNmSGFTc1dpZ1c1RVBlK0dJaWNEajB3NWtlbnN4T1BhNHhCV21Mc1Rz?=
 =?utf-8?B?eXpsVDZqVjVhUHhSMzVma0dPZDZrSkQzZ2dINjJhR0hpM0kwaXhXTENOaHJK?=
 =?utf-8?B?Wm5JYW1ZQVpoOVBFY3R2WnRvVko1M2RHRUNXYlBqaDgrbTdYNFp5WkJmY3Zm?=
 =?utf-8?B?YzJuT050a1FSR0RtUWI4VmtZTGk2dXBwdlFDZ2JwWDBQRzEzQ1c5UC9kblZ6?=
 =?utf-8?B?RFFxSFpVMXc0dFVFZWlnMm96L2dZNGJRSU1VQ0gwbUJqdkl3YUZZSDlIcWFn?=
 =?utf-8?B?b25uM2dhSW5udUpDMmxqVUczVTRtVncvSkRuS2M4RmFDK2ZRU0dQSVFyQlZ3?=
 =?utf-8?B?UzRtRDE1Wk9LVWR1T1FobzJOMHlSeDlqMWlhRGxtdFRGeXUxcnJnc3JPaHNT?=
 =?utf-8?B?NUwxWUZPUWR4VVJIRGRObEM2cEgwNG1pWUZPbEFOeGlRQS9lUzl5NXZDbllR?=
 =?utf-8?B?L2pvRWtMSm1TcjEzN05XaVRFUnBxSStWSXM0TGQ3djdpWGdmOU95TEVVM1kw?=
 =?utf-8?B?aHlFT1BIVWhjb040QmJ0d2YxRmxxblY2QkltQXhEaU8yM1hRazJ5SDZ0dlBo?=
 =?utf-8?B?TnREQlZJRWFmbkQ2NGRtSm4zZUxwL2VmRmQwZ2pMYWJycFZhd1FOcFpmMFFw?=
 =?utf-8?B?Q3VjVUVJMmg0TVlLZFZsQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czFuZ0lkak9vWVNqTWhoN0RueUdBVFNjN1paaytST0t5RTRQd0dHMFhtYzM2?=
 =?utf-8?B?UU8rZ3dwKzU5b2NrZEsxeExVVHhNdFRUWCtkVmJZeVlPMkVjOUdlN0pnaG5F?=
 =?utf-8?B?K1BUSm5Kc0FhTllFMlljeURRZHhsRHNZRUJqd2VDUC9rNHNqeTBMKzhCOTQ2?=
 =?utf-8?B?M0ZuVEZQV0liOVVTYU1FbE44MlcrTno5cHpHM3VIMUVpR3NqM0t2RDNIdnJO?=
 =?utf-8?B?ZEZ6Uml4UEk1TG0zRlpTTXNPaklyY0dvTW9DSTZ6Rkh4QVRxRVlxeGpVb1FW?=
 =?utf-8?B?RXAyaHFZU0dVcmh1cGV1Sy9CejZBSW85YjY3MGFVbGxtUDQ4MW5GVWtKbko0?=
 =?utf-8?B?UmF1dG54UDIxNno2SDRBYmtYWGRjYm1yQ2ZhNXdnNnhTZEZXaXZxMW1TdjRq?=
 =?utf-8?B?Qlh3aVNIdldaTGsxTE1jbVVmR056eWtvYlZKMG9lSkU2NEo4bjhYemRWalVr?=
 =?utf-8?B?SmtBS01weDFoMXdoOUdJVTF2K0pYZXg4OGFVNDVkeFNDVThKOUdSbFN3aXdV?=
 =?utf-8?B?enZBOS9TY3VrY2RkNEpXQlBwWU42U1Zxb2tpQ3VibW8ya1lqY0h2eTdTeStO?=
 =?utf-8?B?WmtLZHc3d2dWVWZ1alBLUk0vWUtWVStiSjc5emRnbmVmY3ZHajBlc3NsYTVm?=
 =?utf-8?B?dWZ4STN4M1YxYmhaYmVSN3VRVmlCSktnaTIrWEt0Y3YxbEFrTnVFaVpEVitL?=
 =?utf-8?B?UUo2N3NhVkJFSHRDa0lJQzYwcmtHaHc0ZTNva0JvbDhRa0xLOHBRZTdZMHFC?=
 =?utf-8?B?RU9LcHU4aFlWTGN0eEVIeWlqQTFBUHpCV3RSRFA0elZsMU5GcFpsY3crekFs?=
 =?utf-8?B?TXl2ak1PWFU4QlJ3aU1xcWhZeWVSN3JpNlRnRmc2bE5hMXpEWUE2eklBUnhQ?=
 =?utf-8?B?QnZiaGRpa1hWTmZvL1VjWWZEa3Z6YnBPL0QxU1l1dU5zMTVxM1JuVG0rc0pT?=
 =?utf-8?B?dzFFSlBpKzdod0FXUWpsVXQ4QWFNYUljUlc2UGtGWXdqWm5RcHlpN0NqNmQ1?=
 =?utf-8?B?a2VRbUIrUXpOV3hYcXdIR05qNC9JYUxyYk1pQUlPUXhBdHQxVzVHRnhPS1dx?=
 =?utf-8?B?UVhZUnlmeXFrU1ZDSVdwbmxNZjBGS0NoK1ptYXlVd09hRWJNbXd6Q04wVUlo?=
 =?utf-8?B?YWF5QXVPYlUwUE1oWjZLS1I5cU9Yc0c5Q2xQUzNHazQxdXZtc1duK3E5d1du?=
 =?utf-8?B?eVg4bDR4Q01FZG1IUktyeTJGNjhHRmttZm9lV2lVMkpWMm9DajVnc1BqMGZj?=
 =?utf-8?B?d0crM1JYZ3dyZnVLZkNmNmdjc1A2cEpyY3pPbU1JVXF6OVBPYThnTXNVMEpy?=
 =?utf-8?B?c1d1d3lzNTBFNnBBQzhkU2ZlTjlkOGtRdGE3dVRkSUdoY3Fac2greHBqN0Jk?=
 =?utf-8?B?OEdjZGNJY1lxdEFON3pIZXlMTzJneVdCQUNMdWRFMk1zMTg3bDNoUjlqemhK?=
 =?utf-8?B?QVpSZFdVeE1abzZXVnZ3eW9neEtFU1hjVWZPY3RJaUdsNURQZTN0Mk14TTdY?=
 =?utf-8?B?VmNTb0NGMXFjTTZXbWtBTncyVy9YRlNVUU13NnphbVVWbXVvcDNtZlNlblRU?=
 =?utf-8?B?Yy9lNUFWZGhMUjA0U1lTZjB0UkNObUdUTFArZUhicS9FeFZxSlpyUXFKMkg0?=
 =?utf-8?B?WitqL2Y4ZHJIN1J2eWJ4cmxzelZUNlZBQkF1eS9JNURhMUxUQmx4Vnh6Rjd2?=
 =?utf-8?B?OUJPa0pqUkVYRFdQWTV3enptVHVEYVRNQzJ0RDhuUElYc2Z2RzhYellPb2RZ?=
 =?utf-8?B?akh2V3pkNDBtcmZ0a1hGa2gvN0U1UFE3amtqSjk0aFRYM29DZXRvclZwa1hF?=
 =?utf-8?B?bXZ1NSt1NlJvYlRaZXVlRFgwRWF6ZGFZS0ZtbElhT3JUVnR3aEh5V3FWLzRY?=
 =?utf-8?B?OUZrcVl5Y0ExT2NiYWhLMHBDZm9Cc3pLL1MweXd4YlNyZWdSZ3NDY1RjZkdO?=
 =?utf-8?B?OGNWVU1WMk5ZTnlmeG1wT0dYZzc5Y2tDS2NESStBTjBqY3RaMjJDWHMzYk9w?=
 =?utf-8?B?U2IxeCtlV3hIYlpreHFTY0UzK0p0T042eHh0eDI5L0ZBTkJQMDhBWjUvdzdm?=
 =?utf-8?B?K1hjaGJoVUlDUFRyaHV0KzNMWVgzUHY2N2R0NnU4YTc1ZnRiLzNObkZPbnlC?=
 =?utf-8?Q?S8zcDXsNLEJAlyHGXIeUx89sY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a836007a-eb85-41ae-3e5e-08dc9dc7e108
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2024 14:28:18.2493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNTPWXZYXH19PwlBCjf3AW9ckTL74NuqVCaBo01xUCfWspsZjci4f1oVKjtTEWbIHvoMKhqzk/tnP8MqP4vI7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8536



On 7/6/2024 18:39, Ilpo Järvinen wrote:
> On Tue, 2 Jul 2024, Shyam Sundar S K wrote:
> 
>> At present, the PMF driver employs custom system state codes to update
>> system states. It is recommended to replace these with existing input
> 
> This change entirely removes the way userspace worked before this change?

No. It's still the same way it worked like before; just that we are
removing an additional technical debt of maintaining a separate udev
rules file for kicking in the user-space action.

GNOME folks told that they cannot have a custom actions defined in
udev rules, instead asked to use KEY_SCREENLOCK, KEY_SLEEP,
and KEY_SUSPEND so it entirely matches the behavior.

> We cannot take userspace functionality away like this.
> 

Can you please take a look at PATCH 2/2, that may help to clarify on
why PATCH 1/2 is required.

Thanks,
Shyam
