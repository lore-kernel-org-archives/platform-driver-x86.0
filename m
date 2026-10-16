Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010023.outbound.protection.outlook.com [52.103.32.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E63B49BB48
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 18:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175309; cv=fail; b=GanZlbgRJBzvuURYD03AH7RB2i2D7jnJ1uNw2j0CYj/+/mSwyceqitUGY0LsDyq8/dVeui7CgC53g7k3LukxJgsXTPsOZslw+Dp7JapTFdtIBHb8z8M/ez1x2lugEOYKIns6b8LP5eDx5xyDY/dTE9GLY7i+fMBbqwjZpt16GlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175309; c=relaxed/simple;
	bh=QeAyQWgMPV4D+1EXm/os3/8v5H1/vnD5RDdRgYajSOs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G0Ms3uh2GrlTWU8wKMvEITIaDzNIEejBEeMKiFz4iNFkF+8M6hWiD/sA5rzq9USsiP8rFrFUtqMGWd63OV2byfK8XzQsJ7EHLlrrr2kDk65WR+kZR3Gklb+DUodC8n+zLZjD+xtiKfDSwK2wUKwff97BwCu/ZcCrjTDkHKznvy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.co.uk; spf=pass smtp.mailfrom=hotmail.co.uk; dkim=pass (2048-bit key) header.d=HOTMAIL.CO.UK header.i=@HOTMAIL.CO.UK header.b=IyVC1nZC; arc=fail smtp.client-ip=52.103.32.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=HOTMAIL.CO.UK header.i=@HOTMAIL.CO.UK header.b="IyVC1nZC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1GHcj0j68qiOwH6Rf3g3CWTBcrILgidSaqw/Wcua84/P3aKfMov6smDAMYHDsaezDQriCDbQiVn+bNJ0y2XNE8NSXaqWkaTwxS2ZpP8LSLzSmF24pL9rlT4Qo01zuFvNvpKgdX2lWdzGmA16kB/6H6nl2mVePnHlunSh7rmd2xs6K7CaM+gVYcYQC0T/r9omjAhWFzZlCdv9UhHjOJ/R6zHzdXLagnhxUjbcZZQ0nAB1mG1IWXUxT3rTPDEP1D+xlstS6sal+2KnOgNwYl4ay82rj5GY81p6cPFKEHIh2TfTFb2WhuIdTFLEjbI/4NW3Jy9ANQ6h+shcoKRybyHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDrqO7n3TfYpJ/6bqDufJA/O6txXoMwg2xHqNsoDryk=;
 b=tdh7ocjUss7mroK21/JCUFNqZj8B/JQrJgCQKFAneKdqfOAgPVHovtyi2IunZm55WwTeVpeJBWRPn/nXkjC6t0DaEducXFTKi0tup7+YF73tbO/DmvwxoSsDk+BHrHaOXSFjAxRwFs8tz1i8yzSY8bV9WRGmtX8+XOHK7YfTj8mpH2JBRphWgLAfK5DQBUVNQN9JNAe8hAhgJ+SDZJ4knSsq+nppYefbkK4tbmE6O7fK47pzgYtQIu0+NOaDHg1EFp72VKCDaHWxGcRQ88R5SHUHgMczV7LrMhjndpFmmPXsRjbe7JcU0vRfTiMEDoRbkEDGHtJCb62xUIibS+7cFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HOTMAIL.CO.UK;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDrqO7n3TfYpJ/6bqDufJA/O6txXoMwg2xHqNsoDryk=;
 b=IyVC1nZCOrrPUr1o0CJh14TpzzLnsoRvJyBs72CI4e99bNSn1jRP5NnDq9d2MAGkekb9Cy9M84sNnICu1Rp4IOTA3JefVXmS0QcGdEM6pZWwSPtOd81L0j0bcchUUBZf7GSNDE5Vau2rnsp8q9OdycfIzPxOAKdr0La842BrWNu4YKj2MkICEMPe1Tr0qPkJ9sJwWx8Tw5b2YbDFCOT5HmlsbXR53wB3gPgCd4958FDtQ173dJhWP+iWeJSbtQlhh7hLsLPjmPj6zBRiOTPNIOLdmXcKZ6owVy2MVAwzNvubrTnZHivzUaJ14D9t926dQ0zY+mMEgv/xSqPuSeSTAQ==
Received: from MRWPR07MB12154.eurprd07.prod.outlook.com (2603:10a6:501:7f::9)
 by PAXPR07MB8014.eurprd07.prod.outlook.com (2603:10a6:102:13c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 18:28:25 +0000
Received: from MRWPR07MB12154.eurprd07.prod.outlook.com
 ([fe80::4eb5:ed1a:4b24:dd65]) by MRWPR07MB12154.eurprd07.prod.outlook.com
 ([fe80::4eb5:ed1a:4b24:dd65%6]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 18:28:24 +0000
Message-ID:
 <MRWPR07MB12154938C5707EA2B32CA7130B39B2@MRWPR07MB12154.eurprd07.prod.outlook.com>
Date: Fri, 16 Oct 2026 19:28:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 221752] asus-wmi: no camera LED classdev registered on
 Zenbook S 14 UX5406SA (micmute LED works)
To: bugzilla-daemon@kernel.org, platform-driver-x86@vger.kernel.org
References: <bug-221752-215701@https.bugzilla.kernel.org/>
 <bug-221752-215701-z45DwGMijP@https.bugzilla.kernel.org/>
Content-Language: en-US
From: Alex Armes <silk98287@hotmail.co.uk>
In-Reply-To: <bug-221752-215701-z45DwGMijP@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0176.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::19) To MRWPR07MB12154.eurprd07.prod.outlook.com
 (2603:10a6:501:7f::9)
X-Microsoft-Original-Message-ID:
 <2095577f-8192-492c-8017-31e290884699@hotmail.co.uk>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR07MB12154:EE_|PAXPR07MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 1234bac1-2282-41c8-2732-08df2bb34376
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|19110799012|8060799015|25010399006|4140399003|41001999006|20031999006|39105399006|5072599009|15080799012|23021999003|6090799003|1602099012|10035399007|40105399003|23121099006|56899033|19061999003|440099028|4302099013|3412199025|26104999009;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SCtSRFFqbnBnN0ZOY0xtOVBUMHJsaWZmdm5HK05STVlNTVNXMHgrVXY4dmsx?=
 =?utf-8?B?SjVCcDR6dTR3V0dEVk1naTFodS9RN0lCcTExY2dWMFFPQ0NZajhzTWNZSnFC?=
 =?utf-8?B?b0g3VHVmKzdQMUYwSXhBK0w5TldKVVV4WDYvL3Q2eGxBbno3VTMzK2xVd3FO?=
 =?utf-8?B?ZTNRbFltaU1BTllRVXJ5VjlQZ1h3WWNuK0ZML0Q0M1E1TlUveVdMT2xlZkgv?=
 =?utf-8?B?SWJRVTd2Mk10a2VUbGFMWjZQZE9Nd0F5dDZyMDZFbTlSQklhb3lMaWl5Nm9R?=
 =?utf-8?B?YitEZXV6VG9UMy8zSVlkMXBTZ2xIUEJGSjEyaUxhR3pWZlVoeURrVVFoOTV5?=
 =?utf-8?B?NU5ucVNMZytPaFRVTFpWLzBRQ01yZStqTjZCUGdsVVAyMWFDZmNJT1ZsdWJh?=
 =?utf-8?B?eGFJcDltdU0rd0NLeUhQUjF1QlRtamxCb2pGdEZtSHVML203RkI0QjFUVGxH?=
 =?utf-8?B?emRqU2FTV0VQSGtoWlRtdG01cTJkenRkZFg5dTJlQlRCMWNsRXJtQjJJSzU2?=
 =?utf-8?B?VVBxMVlLekZ6S011eVJWeVliU1dXRlBlc3o3UUx1SVJTQW9Id1FtRk1ibXUw?=
 =?utf-8?B?SzR4amF1QzRpQ3VZYjFEL2Z0UzAvNC85WnZTbXordDJ1RUZCMnNueHhrcDJy?=
 =?utf-8?B?OGsrYlY5WWhPSnYvOTd6d0hOdklwNm9RSnF3bFV6SGxnWi81UVR4SDNVS3JV?=
 =?utf-8?B?TmVsd2JCV2JldXdnV2pmdFFPL1hLb1B6cWtyNUNyUzJzVXdpUVBNelRKWExq?=
 =?utf-8?B?NGJaeVVMcWhVaERvVWpQNWl3QUJPRldwTnlwWFk4OHU4azdXQTRlVTd1Yk05?=
 =?utf-8?B?VGJPSmxzRUtqYU1nNVBHWmJOZklIcG95Q1pxdzI1ZlZwVzc4eTJEUFZZbnRC?=
 =?utf-8?B?b0dkcWxXSGxCczliZmZIaStOTWkvdHdkYVI4ZG1pLzk4d05rNmdmalNneUZp?=
 =?utf-8?B?Ui9nQVo0bUtKMzNublZaYm9qWDlEQ0F6OEpzQU5LTURkYmt2dzl2T2E2UGN6?=
 =?utf-8?B?UG9udk80UHZKdWNPamc0MFdnWkNRbG16NDJ0ckp1OEM1c281RGw4L2JwQ1lI?=
 =?utf-8?B?SnllVmc5Qm4ydG5WVVZjbEdJMFAxdk1JZ0UxVWxhbkd5T214cm1RRlBpNTNl?=
 =?utf-8?B?MXB6K3F2dmlZT2MxSDIxMVMxaXBHZGxpdXZBTkxQV3BqOG5aOVM1eU9sbXF3?=
 =?utf-8?B?QUxObUE5d0pTdmszQWRLaFZOZDZ3ZXRXQTliamxubEU5akp3MDlxTm1GMlJk?=
 =?utf-8?B?bXRFdjlNZmoxM3cxQkZ6V2lMaHBBNUMvek9DOVZvSVVKd01xWEFZVDZQTEx3?=
 =?utf-8?B?dEtZY3p4dUt6V1BobGljYTd3b0VURGwzUzJDZE5xT2FxcXVEcWpOb2V6VUVh?=
 =?utf-8?B?bEdvb1FIOUticllEVHYxZ2F2TVNmTVhaZE5SUjhPc3ZxditpRTdrYXhhZVFz?=
 =?utf-8?B?VGRiQkJURE5yeW9XWk9Ia3orWkRUZE5vMkpXQzRndXJhTTRNb05KU3Y1UFV3?=
 =?utf-8?B?Y2MxZC82cEJSOXpOeDV5V0Q1dTRsbWtnVnc4ZFhoTUYyL3ovTDZpcmpiMVRu?=
 =?utf-8?B?SDhqZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVlMcFRzL1dQZ3JZNkZZelVDci9uL1RuU2NCRnN5RVgzaVMrcDdpUms2bHRt?=
 =?utf-8?B?U0lrdHpLd1AwS216aUdVTi9zSUdNeDNEVktocDhScWNYYVBJam5INGhUMVBi?=
 =?utf-8?B?T1ozbHRVSGNaVWJCOGRkTGN6UXBmWU0rd2x0d1pISm9QelVLQmkyMDkxc3RR?=
 =?utf-8?B?TzU1bk13UENERzhBZTFOMmNidUg0cEFkTXcxRFFTQjBxcTAyckZwU2ZXditY?=
 =?utf-8?B?TnpCWUkycUQ4ZlNXQ20xWDI0UDh2dnNhUlRhOUVIc2ErSDcyR0JKZlloQXAy?=
 =?utf-8?B?Z09xcUkzUWNkZ0tpNzZVN3VTM2xwdzIwMHp3eHgxQSsvaXFvUGM2TXJJSTlT?=
 =?utf-8?B?RDFvUk84VjlldjhGQXppTlNJeVBqNS9hdFRJcURpMWc5TTJJV3hMNG40dTdw?=
 =?utf-8?B?dThCYzNTMmxUcVJIQWt5ZEVKWC9RcEJHTnh5aGExM081L2F4a0N3RWRnSXN1?=
 =?utf-8?B?NlY2Z0luTGhFMWVCSnBwOXRibFptWGV3a3JSbERnY3lCcVhyUUlGeC9VSjJZ?=
 =?utf-8?B?VmNvb1orVXJsQ1YvRkJIYUxXYzZFR09tb3AzQWhLUXdnUys5MWY1N0FXS1Bo?=
 =?utf-8?B?SUtJNmIzWHkyMllkZVZNTGcyNVh1WVdzUUQxeXdvYytLdXNVd3hhRmVBa3Jr?=
 =?utf-8?B?NXNpU2UzYmlBYVdKOEtMdWpibkNYaDhYSXh0Nk5HTmxLb0hiU2NZekU3aVNx?=
 =?utf-8?B?L2ZTMGl2MGZTS2R3eXFucXJVaER1cFQ2Z1dkZHlMUE9oREpJaDRpR2pINHRV?=
 =?utf-8?B?UGZ2Z2pMLzVWRmFMS2tZNlN6c094NkRVVjZQSkFtcEtZVjBUOVp1QUpBbzlp?=
 =?utf-8?B?NjdLc2t5Rzlmakkwc0h4SXFlOEpDSjVhZE5TVFhkb2dvOW1IR2VXbTl2L2Uw?=
 =?utf-8?B?SXBCV3NVbjFLdjZpOGlvVzJ6aEtGaW9PR3pVdC9VeHhqUjgwY0FvSTJ1VDhT?=
 =?utf-8?B?RVVjMzBPdWlIbVhCQUNCQlNpeStCVzNnYWk4akFWVHY5QmRNczVyYWZzQU9N?=
 =?utf-8?B?VjJOZGlwbnIxeUNVMVh4K3FRNlExcXJoKzdXSWdJOXdvUUlyd3g3ZE5GblhY?=
 =?utf-8?B?aUVmRVh1SGJRYW44RG9RR1hQd1RpSTN0SkZpbHNzVmx0OEVhT3pLQ09pTGVH?=
 =?utf-8?B?MDlveER3dzJ0UzErQjZNMmdCaXdsWVViU0xiUVRBbFF2WWdMRnJHUXZhWW5J?=
 =?utf-8?B?anUwRDFXZDNVYS9KMU9CUm93bDd6cVk3bndhUUJHUnZBc3Y2bDZZc2xGZjdr?=
 =?utf-8?B?dVFPNXBqYjlDbFQvUFg2VmhNazNwVHFNUmJiRzVqZEw2TkYwUkxUUm1ZdXcz?=
 =?utf-8?B?dW5CNm8rRlorWTVFREtGNVQyazJ6SkwrUU1xaFFpdHM0blQya0lTV0xSUmVY?=
 =?utf-8?B?cFo2MFFLZk5kNGhtSDZoUjdJcFdib2VjRmZ6eEU2Nlc5SjZxRXFKMmxiNkQx?=
 =?utf-8?B?c3lVMEJFZkRqZ0tsTHcveGtUTndEZy9ZK1BUR3E1OHQ2TkhpcVFlUm5iUjQv?=
 =?utf-8?B?elMwSG1QWWxXMkQwQUJkeVdKRDlRWjhMdUlDa2lIaEEwR1JPRXZ6Qk55SHM5?=
 =?utf-8?B?dlJCeHIzWlAyU1N4ZU9pTVI4WWMyUDFzRHNGc1RmNWVXQjdPbHc3R3JEUG9W?=
 =?utf-8?B?cVRyNlh0MDB5UjBLTlphRUQvcDJzYUFBdTJNZzRJVERxK0hveXFyMGpMdGg1?=
 =?utf-8?B?M29oamh1UG9oWTVlcjlPMHpPSk1LdkxpOFg0QXZTRkJXYjc2VyszWW1vRHAr?=
 =?utf-8?B?WEtpSDZSNDhuQllCRmZDYXg1SVlJNk9QTTF1VXRHYmMxVk9aUWx1bzJhOFhV?=
 =?utf-8?B?NUNrZUFqcHFiREhWNlVzbkhQQ0VoYUhrUDRudmhVRlY1aEg2cnI0ak5GK0ZX?=
 =?utf-8?B?WGptUmNLcjFXYitKRzcvdTNKN1lvL0RscWFFT0x4bTgyK2c9PQ==?=
X-OriginatorOrg: sct-15-20-9343-9-msonline-outlook-edc25.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1234bac1-2282-41c8-2732-08df2bb34376
X-MS-Exchange-CrossTenant-AuthSource: MRWPR07MB12154.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:28:24.8461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8014

Hi, I'm also experiencing this same problem, where the camera disabled 
LED doesn't illuminate despite the firmware blocking the camera when f10 
is pressed. I'm using a Zenbook S 16 UM5606WA on bios ver 321 and Linux 
7.2.9+deb14-amd64. My device is missing both the LED classdev 
"asus::camera" and the device id 0x00060079 (ASUS_WMI_DEVID_CAMERA_LED). 
I created a little patch that seemed to fixed this issue by also reading 
the status from device 0x00060078 (ASUS_WMI_DEVID_CAMERA_LED_NEG) if it 
is present, every time the f10 hotkey was pressed (on my device this 
fired the WMI code 0x85). Although this worked, both the micmute key and 
camera toggle key LEDs would turn themselves off every time the computer 
was powered off, and not come back on until pressed (even though the mic 
/ camera would still actually be disabled). I was first going to look 
into that, but I can still send in the patch I have - I'm very new to 
this so I'm not sure how to proceed, and I'm sorry if I've messed up any 
formatting of this email, it is my first mail to the mailing list. :)

On 10/10/2026 22:09, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=221752
>
> git@turtledev.nz changed:
>
>             What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                   CC|                            |git@turtledev.nz
>
> --- Comment #1 from git@turtledev.nz ---
> Same laptop here, UX5406SA with BIOS .309 (11/18/2025), Fedora 44 on
> 7.2.9-200.fc44, secure boot on. Same issue, no asus::camera LED.
>
> I dumped the DSDT to see what's going on. I think it also explains why the
> set side didn't work for José in "[PATCH v2] platform/x86: asus-wmi: fix
> camera key led on Zenbook S14".
>
> 0x00060079 (CAMERA_LED) just returns 0 for both DSTS and DEVS on this
> machine, so asus-wmi never registers the LED. Everything is on 0x00060078
> (CAMERA_LED_NEG).
>
> The DSTS handler for 0x00060078 reads EC register 0x50 and writes the
> result straight to the LED GPIO before returning:
>
>      Local1 = ^^PC00.LPCB.EC0.ST8E (0x50, Zero)
>      If (((Local1 & One) == One))       { Local0 = One }
>      ElseIf (((Local1 & 0x02) == 0x02)) { Local0 = Zero }
>      If ((FSIS == Zero)) { Local0 |= 0x00080000 }
>      Local0 |= 0x00050000
>      Local2 = (Local0 & One)
>      SGOV (0x00180885, Local2)
>      Return (Local0)
>
> So a plain read is what updates the LED. Reading it after the camera key
> event, like v2 does, is enough. It's probably worth a comment in the code
> since the side effect isn't obvious.
>
> DEVS on 0x00060078 (2 = LED on, 3 = LED off) is guarded by a one-shot flag:
>
>      If ((FSIS == One)) { Return (Zero) }
>      FSIS = One
>
> FSIS only gets cleared in EC0W when Arg0 == 4 (resume from S4). So after the
> first call each boot, every set returns 0 and does nothing. Bit 0x80000 in
> the DSTS result shows whether that first call is still available. I'd treat
> the LED as read-only on this model.
>
> Other things I noticed:
>
> - The firmware handles the privacy itself. While the camera is "off",
>    /dev/video0 still opens and streams, but every frame is a grey placeholder
>    with a crossed-out camera icon. There's no USB disconnect. The key LED
>    stays dark the whole time, since nothing does the DSTS read.
> - On S0ix entry the PEPD _DSM turns the GPIO off, and on exit it only turns
>    it back on if EC 0x50 bit1 is set. That might be related to the stuck LED
>    in the original report.
> - GPIO 0x00180885 is GPP_H_5 (INTC105D:02 pin 31). Micmute is GPP_H_4 right
>    next to it. The pad is config-locked but TX isn't, so as a workaround
>    "gpioset -c <chip> -t0 31=0" turns the LED on and 31=1 turns it off.
>
> I couldn't call WMI directly because of lockdown, so this is all from reading
> the DSDT. I can attach the acpidump, and I'm happy to test a v3.
>
