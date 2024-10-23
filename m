Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4674D2EAEA
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2024 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700188; cv=fail; b=KjgvHj9QFNRnWohOsCH973OOwul/le+og7NvaArsnaEx5iTrQL6EgUxnHXCNGVndAKKy8UbNFsvGwnX5nvatWAR1AHosrId76QQzoUArPibUY+S1TT62QzSJCW4UjmJkkcfb0amWBXU5RzxQxd5PvKo0UxN1l9his3xsnW0IIIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700188; c=relaxed/simple;
	bh=rFvGzLiL8/xfgQv4tB3LnjuoEpCrGCiS1T7holVsHOY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eE89YIL7rYgP1nPJcKnO9fgEHlhCfnSd7u444+Y7rMsEAk1Qs1x4ow4tsnSWXdM3EFvFvT+7UATYwTfMTVHBeCvOYe7L3kNhKwIX4rJDOa5GDSJETaTb7kv9k/dfunJMblZ2orXl/n93SfVpg9ioAjMQ61C15KEFpxsi9YQ4gWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ji+yvwbq; arc=fail smtp.client-ip=40.107.236.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ji+yvwbq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DAyamVA5bCperzr6+2YMoFyuQNBUTPMxd+OMk0+XEw3g9tCMmxvWOX5jZre0SpSgxaRf+B+gmXyYfYGjmD6k3kAJrX+nnav0Moc4KgJAhlhpCKcv62njzM4mg2lkqi1+qo3aMJg1eMTx9ccWyaVN0sRBGYg5eQ8yeI5z/S9qpaGMXj+QjbYWgdtkaKLO69hS/e1q0qzw6uENRLTlOrA+XVg+vhB75Ren8q3wPhHL+Oq3wRIgsf35naBA5YSz4hTRl4nis5456PdQyFa7ED8oHttjEcU2Rqejk1dQLQVPZ7M9Wu1Uo/aWEwLYUl4+k55XdQxVl0dRT9WIsZGL15St9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUYd7C8FKXi0JMKXBR/w08QHZnOoMKavQIcvgpTBG2A=;
 b=pj6XRPO+QM7XTo+xF2/KOzI/eCU9F+JvF1zuENyo3IgwqogfjBSOMBVaph4UXdymRSuGVGvSEDgKeoRY7KYJ25lwXJb1EDgv6SQ4BHfmYDF7kJ14o3e+5WNK1Z8dIP+E4FBkiUituiH//47vYpOxHF5iZAA+ItOB+dM7Hac0QmFDA0OzfNJoMKmbUbtpMVtZcIESlFPtHWIVYtFhlozKIc5YwVyO//DRpT7v6V1b9XHb0TD1YOtAP1XBqfssuUxwNVzJWQDAmkGa2J5BZc5zokzm1ZTiU629ox8IR4yN37uPouuT5tJlTeA27VOv8G9FuIoRISK+YsAUHqVvQn87hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUYd7C8FKXi0JMKXBR/w08QHZnOoMKavQIcvgpTBG2A=;
 b=Ji+yvwbqncyMFI/Ly0fyagAeLYbhZIzyKFPO/lUBbXSAYD1qvCj8BZqYMqYHa4PExLiyty4ebWYWzRtpH/5CakIoHD+FD4SQJfc47ASlU6v1lYp7t3iNbCQho+xPYLleBW94Lteh7yHaOk3S6MffTRtz3RaZK0cl5mQFDhVpSBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB7151.namprd12.prod.outlook.com (2603:10b6:806:2b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Wed, 23 Oct
 2024 16:16:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 16:16:24 +0000
Message-ID: <98b3392f-2860-4a32-a769-b4dcd3f5dbbe@amd.com>
Date: Wed, 23 Oct 2024 11:16:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mischa Baars <mjbaars1977.backup@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
 <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com>
 <CA+b5WFFa4hMeGnN0J2xd=FpU2Cxe_AjapWBpTFjfNhzUSOUAzA@mail.gmail.com>
 <0281e6f7-4ccd-4369-9182-d1580c9e6bc5@amd.com>
 <CA+b5WFEv1Qj3NYcwXaZz1EYW9omj7FmB8FdSKZnixsMNoi1+DQ@mail.gmail.com>
 <ddd7bf09-31aa-4e4a-93ea-b1336ced8578@amd.com>
 <CA+b5WFGDstoJTjgaT+hm4r-78zup1pLa2Ada7PqbTY=wCutSbA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CA+b5WFGDstoJTjgaT+hm4r-78zup1pLa2Ada7PqbTY=wCutSbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0095.namprd12.prod.outlook.com
 (2603:10b6:802:21::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 94550297-8339-4a24-217a-08dcf37e0a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjQ3MEIyTWFsZjdmY1NDRFRIOW5wMWJncmdtaW1FZlBqS3pIUjkrTlZqMUVV?=
 =?utf-8?B?RVMxNUVSVUw3VDBKSGEvSFh6Yit2VDZQVFpUeFhEMG1oZ2hMNVN4Z0J4bVhD?=
 =?utf-8?B?NXYvWWZzeVpqNjVaeXFLb0Q5YnBzVFJoQmZ6MkxEeTRQV0RQcmhEZnJDYjRV?=
 =?utf-8?B?enZITkZDQllSVVVvbGc1OEhITDJUcUVWRkRDTDFGMmRhaTNyWVNGR1YzUGlK?=
 =?utf-8?B?OCtDY1VmdDFCQ1hCSEhONnNYVVJ4U0lpQlg1TUdHYUR5WHZzdkhhYi9mMWNH?=
 =?utf-8?B?aUk1cTY3VC9TQWVlS0lNTFljcGtkeWM3ZC8zVGNYUnk5a1JMS2pza1ZlSnJ6?=
 =?utf-8?B?blVMcnlTQzRlQ0MrOFZSM0dxTDFKZWxNSUJSSkRaZ3hEdFFxNDFJUnRXcy8w?=
 =?utf-8?B?RWZidmZjOVZLWkNvOUcxNHVVYjZaanBYQ2pUbkxMc2JJZ2NGWTRnRzZqL2t6?=
 =?utf-8?B?bFVWSFJad0ZNb3NSbWZwa2liRWdaWmpLaHpWa2pKZ2lHYzZ0bzFHRzBKd1RB?=
 =?utf-8?B?eUptT0NKbkIzUUJocXo1aEg3QkZSWWNwU09sYWdlajlKUGVQcFFlYmpIOTY4?=
 =?utf-8?B?cG85dVZwZFVWZVNYNGFDc25XbHlmZHUxK2I5NmswQW9YUURVeGRzSGVzWDV6?=
 =?utf-8?B?R3ZjUHJKTE9tcnJaN3FlVUJNbUlsVXp3MXV0NTJPTlVqcXVDSXc0Y1MvaWlP?=
 =?utf-8?B?N2lhYncwTFpDMDVLNk9XeWVtOXlsRjQwNXRsWG8yalYxVytuNkpyZWttREtt?=
 =?utf-8?B?MmxhTE50NlV3RzZ4cU5Da2lseHQ4Ty9iZWZNOFdrUDM1RXRZTEFlL0ovTmdM?=
 =?utf-8?B?MXZSTXNIenZXQVdoS2pqU25ibGRzVndpQUUrK1dubUd1Y3V1NERtQ3lrUXZS?=
 =?utf-8?B?QXFOTjF1bGl2c2FrR0kvY2lyb1pUcytNdlcrSGl6dDJYdG9wQUJtcnd1aFdn?=
 =?utf-8?B?MVlRV2VFaEQ4dlFuZ3BzTG92bnYvOXEzYzR5Qis0a1ZEMm15TXFLT0lWcFBt?=
 =?utf-8?B?SCswb28zME0ydXhYVnR1c0I4dVlhOUlaaVV3V0ZtSlZIdHUvL0gvMnVJM1Y5?=
 =?utf-8?B?enA2UCs0ZzNSb0VJV0ZXemdqekYxSktwUmJ1WkhYY082U0IrNHpMOXVPV2dm?=
 =?utf-8?B?QWZTSzFSK2lzN1ZmNDVLQTRBbVdQYzRqcnZIeGhXN0svTjFXd01ZWFN2OXNJ?=
 =?utf-8?B?bVQ3ZHV0Qnh1TnZFSzh0VUpaWlJaV1VtbFl0VGZ0TEpYc1haTkZrTDhPSHUv?=
 =?utf-8?B?TS90aFhKMkdWb3ozOWJEdExROTQ2di9tMjR4TXA4V3lNeXAycHg4T2tVSnYv?=
 =?utf-8?B?R0hwUmlOZUhRUXN5eVgveHVqWlc4ZGRoOGFuUXRBc2V1cnJlTlJZalNDZUhX?=
 =?utf-8?B?OGduRm54bUhzSmlUcklaK3oxWkhaQ1VEN3pPUTF3UHRjcnNYdkdwalUvZVIy?=
 =?utf-8?B?UmdIZ0hjYWRhbnZFTGNMd0Q0OUMyQXdLREorbkRON3ArQWRtc3VsaDY1ajdq?=
 =?utf-8?B?dzV6Qk1NcW45ZmNuZnBPRU1iV21HRW80R0MzeXJaQk5FblAvbEE2ckhMT3Mr?=
 =?utf-8?B?RTNjRW0rSXgxN0NBSm1yQjB4R1dIRVQwZ3dRR1Zla2tmR0w4MCtJYVJCcktk?=
 =?utf-8?B?eFBkL2R2UVJNTWwrMkxLRWJwSGVQeE1jd1hNVnpLcG5admpRTzlVWTJvNmdG?=
 =?utf-8?B?Wml2SUVDYnVuOXBWbGFoVEU3a3hrdXNSNDZpS28vZVM1bUJQZDF6QVE2WG4z?=
 =?utf-8?Q?7tf1z5hfq2rQJPRe+JrEd/ZcKOKh7P4zfNSzbbt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3dFZWxiV3Vra0FSR2RGOThPZ0dsbWhLWDRzclZFaXoxaHZqUGkvVE9UOVdi?=
 =?utf-8?B?Ulh0SG1OSnhEVnNOVlZWMlgvREI4ZXRuWmdwNzlIVytJZ1NWY3R1dHhhOFFE?=
 =?utf-8?B?czJrYlZiOEZQVzVCV3YrT2lWb2dsWTdPWmFmZStuZGJWWXNkbmZROEdwSEhl?=
 =?utf-8?B?MHM1ejFzTGJILzJPc01jRU1YZHhDRFJhcUhkaDNOcFBJTnRXY2hqc3Nsc0Z5?=
 =?utf-8?B?Q3EvcXl4NkRId3lYUTVQOHpWL2gwWUhsMHVLVnlCcFNtVk1lTXY1L3BMa2hq?=
 =?utf-8?B?TUZtNG55bnJOZVFMQVlTNVRrbXR4YTFKN3pHTlBhZThKcGhoL0EwWDh4dEpx?=
 =?utf-8?B?YlNlei9ZZThPWDV5YTZvT1I0VllwWW51MDI1VlZKMVI2cW9wQXptWjRDUGlM?=
 =?utf-8?B?dmEwK2hHQjFqSjlabmYraHJKQnJsNTM4UEtmVDF4NDlzOFdHUktHVk4wQlFZ?=
 =?utf-8?B?TjNHSElueDc1YTgzSCtFa2JPdUJmS25qazVncytZMkxCUU1RcVZNbkNjQzI3?=
 =?utf-8?B?bnFQTU1qM25HOGNod0Z3czVDaE80cGpDcXVnMmYxQVBlOG15MkVoMEpKbGtI?=
 =?utf-8?B?aEtGQTZRYjAyYmkwY2J6N3QwbTRhRFRtQ3FDTURDQ2gvVzV2TmlKTm9KNHFQ?=
 =?utf-8?B?M2ZsWGVNZVR4Z2trajVJRnF3bUo4MVdnZmZndC9xaHJhclpHYmxNbitKbnhO?=
 =?utf-8?B?aS9LSFFORi8wSnVlUUMrTGYvbjRCVzVvN1krRHpmN1k3M2trcXVMS2hsQXIw?=
 =?utf-8?B?NlhIeGpsNVdIZHNmSy85a1dZWEZINTRlQTc1VC9UUE5MSGswTmpGUEEwZFcz?=
 =?utf-8?B?dWpRWHVnNUxkVGRVZG1sSHJRNFg2STRaMStLOUFzd1ZGdGppMEI2T3N3c3l3?=
 =?utf-8?B?Nk1HMTN4TW5WREdFN2ozSUVyeXF3TTJiSDM0aDRkWTMrNkVYd1hOUzJiTnA1?=
 =?utf-8?B?endyMGdsK0xuMVRZLzB3aENnQWduOFZ1UXpEWXR2bktqVFBid0duVzZpTjZF?=
 =?utf-8?B?NmxVc25jVlU1WXEyTk5SVExoc3NFL0MrQ01Yc1dPaitxblNCMlVVUGpqdTFl?=
 =?utf-8?B?Ukc3aWxGRkF5cjlmN1F5NXZlWW90Z3dvUlEycmlzSzdENWxpSTJCb0l6VXht?=
 =?utf-8?B?bGJqY2NISS80bzBZYzNBRmhUMjNsWURRd0g1dXFTLzhqbmRCNXp0M2pRZHBD?=
 =?utf-8?B?ME8wckhvMEdWSzkxMmYxU3EvQ3hQdW8weUVSOUhsSXdRVUgvWG91QjltSDBV?=
 =?utf-8?B?UGxTY3NNQ1pUdUFObUZpYmRUeVk4d0pybGVaY2M2WlUyTG0zcXAyWHFPNmtx?=
 =?utf-8?B?S3QvbEF2aHVieGxnV1BrQ0x3bHpVZzNMU3hVT3YvdW5sWnBFRXVaYUhXTU9F?=
 =?utf-8?B?K2VZOWxST0NmWmpKRExINnVrTzZ3dWFlMmJDclI4aktDVzdIUDdjbkdBYVVY?=
 =?utf-8?B?MTNrNmtGWUJyaXRkbm5yRWg1NWlmeS9EUk9KZUoxVVdjN2QrRGp6bEc1SzJ0?=
 =?utf-8?B?ZWNhS0ZxK3UyUXNCTUtlM0pHcHRQRHJ0UTZLZEVIc1pHTHpObmZXcVJYaHNX?=
 =?utf-8?B?WEp5eUY2aWY3T1ArVkNBMzNacmk1dXcwWUJXL1VOY2NjK3B4N0NLM2JHY3l5?=
 =?utf-8?B?RThCYjc5cjMyVitML2h0N3dKSmZjdGZ4d1NHTFlTbnZ5YkhRWVFBUFZhMU5F?=
 =?utf-8?B?ZHVpZHdEdVoxMm9ENEQ0dkpoeTJ5MDZXVk1aeGl6d0l4Um9OdUs4Z2FtZmVO?=
 =?utf-8?B?QzUyTTRBOWU1eUlBdGdSRkxseGxiRE5SSy9lelVhdlJOWDd2RFpKZmRHTVZV?=
 =?utf-8?B?MWhpSEM4OU5MaVRteFU1RlFxZzd2Q0dBTzVGcW9JODAra2lrR3JROHJ5QnJC?=
 =?utf-8?B?VUJJL00yZEN5SjY3amdYaExUQ1BtZE5VYjZrbk43RnQ3QmZjSVJPR09VR2cy?=
 =?utf-8?B?Z0R0VHl0dURHZXE1Vk05aG9aUkJOaEpNU2hNSU0zQm0vZVdBVmRqWHVtUGFH?=
 =?utf-8?B?VSs3YWJiRGVNWlYzMkFJYm9RQlJSWDliMmo0ZDVsNFd3TzFHUjU5VEI4Z09D?=
 =?utf-8?B?UGJsSDdWWmp3YWs1NThsNStGeDk0QUNwK3lDUW5KMGttM0lNeU9yKzRJcFM1?=
 =?utf-8?Q?+41Qjv56qfM155PGzQjaDukEq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94550297-8339-4a24-217a-08dcf37e0a01
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 16:16:24.0715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LGnDT15uoEg3p9/DGxN/Y4n1+vINkE1ib8c6tpzY1G12k1KUfXpSWr+YS+kj2FEQK3kLdRiWOqCZ42M9zsmEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7151

On 10/23/2024 11:12, Mischa Baars wrote:
>> I certainly don't have a crystal ball, but I try to avoid saying things
>> like "never" or "for sure" in non-ephemeral contexts like mailing lists.
> 
> I understand. I'll concentrate on different aspects of testing the
> connection with this TV, like gdk_monitor_get_description(...) doesn't
> return a valid description when the application is started with
> GDK_BACKEND=x11. I also have less trivial questions about the ancient
> and seemingly long forgotten concept of page flipping. I'll think of
> something to do.
> 
> Thank you for your help.
> 

OK, If you have more questions about other things that come up along the 
way feel free to raise them on amd-gfx.


