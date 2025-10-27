Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F41283FE5
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 12:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761567111; cv=fail; b=G3WaLXA8g7bWik/i/yffJGuMrPQsJRsodwEvHsEqWOUCkXoj+mK6zVfAF7QYANtBMcnFJ0BMs1SyC+eryMR0wM5aqDyJ37gMikU5xvALs28HvbEow88GEeQ5TzzLBX5qGD7P0rxgZ4P+vvDKztZMwIx/SjOUwS3NQyO8Rx1ZsvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761567111; c=relaxed/simple;
	bh=3tQqtFMMlsUwenXv6xZNi5d+shnUF1q4hpHm00B/XSk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dc72FLmvg30Yge/wgfQbC8wezNE1qjeL2740hvuH7xJT9mnwdWrKwFT+UZZSf+Bk0n78PZTWyJttLsME+YcmLyCb9mTLHmF5NasIeCY+vK0URagbcCSPWob/dMIUaoAg3uv7pJ/QjZVbVqgBFtbsRpdmsveid30KjlZHHmg2RLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xfGxr6FJ; arc=fail smtp.client-ip=52.101.56.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xfGxr6FJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPmFcMoBIxySALNM9wyBo1wzlrYRbaLFCf3Xxk0s0yHcXjrSlsZse0OjjaR6S5tfVYGaKwv7Dmv+v6Tj8JMgW6AY4DBFMc/SWdCr/Q0CeSmAuT9SJpjMVFLApH9woN8rQ+NZD55i/EjQFWLDNmal9p0iUXtkndAwzkjUWzWyg6zghchtif/ykbN+fPl5tSAkUqPw5ddKZlr1lniQa92pMurWZrrHZinR7/sOrF4UEd+WUeIaLiYFkeAqI++iwOxeyh5qp0tJCmrY9mEu68HRekb3WSLEEDFXCXDJikPqRpjohs3ryEkpCAJKd69GCaYB0FjPiveL1+kNvjS7rb3Urw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+hN3OLjQJXfFHq5eKqNorqIH/8Lns2aePeu64pyuok=;
 b=Cd00sjdHS64fJx4LnP3kwvEFclIJJxYNyDdB+tia4AX/zcYgzHwKlimGY2z0kbuLPmwhln7xKmVw9qi5r/Vd4HeNpbHnQEmhJEbVNCZ0zS2OSxxDNguY17S9ocIU7Ls0dQFVlcy1/0SoQI13d/YWtkbtHOfdC+X9kE1oylg7Zcl8YkyYzePn+uNvsA++gPWgjfSJCVK/45WU9TOC1AeYZkeZCv6M/inGjEfr4jsHB/afXsYkpEIq7Wc4ACOgCxi0H+M7SXjREekLI9hrmSSo8TK9rrZikfA7/r+yC/cmmN++lp7UiY5kVTPWbbLT/4UzfNJCbBMkN1j9+mbbv+LIRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+hN3OLjQJXfFHq5eKqNorqIH/8Lns2aePeu64pyuok=;
 b=xfGxr6FJvEY1+cATTsrGM6ef/eOuMt7fsdWeq4lQJXuxD70DjPoWZKXwl1HCCExVqpUMGKlWnxG5SAwvQzcy57ct4E2OeMWQ6M22ZP9LfEjVk/iWc8h6gZu1NtTSXVifInpCslVcjGvIgR0kdV+J1ojNdlVZNUgonBiBZ3ekwNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH3PR12MB7668.namprd12.prod.outlook.com (2603:10b6:610:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 12:11:44 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 12:11:44 +0000
Message-ID: <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com>
Date: Mon, 27 Oct 2025 17:41:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Lars Francke <lars.francke@gmail.com>,
 Mario Limonciello <superm1@kernel.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>
 <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
 <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org>
 <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0225.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::20) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH3PR12MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2276f0-9a4c-4785-4d33-08de1551fe49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHpDd1gzdkd1cHZ5YXJ5VzRiWVIyVmllSllrd1Vva3kzOWl3V0JwQWVBa096?=
 =?utf-8?B?T0FBQVZkNkc2Y2x1NVA1OStRMXQ4dCtsVVNDL1dVNDBKZVFoYUNtOVpyamlp?=
 =?utf-8?B?TzZHTE91NTdGangxL1VUbHd0YWVhaWRxRjBYdkcxMHYvSVZBMHB2SlhJL2ky?=
 =?utf-8?B?eHV2M3c3czdpRWI5U3pBUEw5dzBqQ2JPYUR0cUlZbVpwU2psZTNJbHJMVWRH?=
 =?utf-8?B?QXBFd2VsaVRyRDBjM2wxN0Uza1l1Z1Z3Tk16WEhuZ3RsUnN5dUgybHdPKzly?=
 =?utf-8?B?Y2FJR2lXQzdtdGJPZEVNdlV5VDFSc0NTN0lKeG1HRUNpdzZITGpoa0ZvOVdR?=
 =?utf-8?B?c1JNNUVzRzNKdmNGYWMrQnU2aGF1bEFlMGZ3K2FNSTR3RTBhc3VSbFl1K0hS?=
 =?utf-8?B?YjlQZHhZN0lJd3FHY2hvTGpIS3lLQjF6cFdPMTJ1OFBOVnl1aTl4b0RTQUs4?=
 =?utf-8?B?b1A4MlRSOTMzdHlwNUNmZEV0bGpPc3JFaFQwNEVhby82SDNOUitTQlYzV080?=
 =?utf-8?B?elNuM1dseit6QURNQmRJU2FnWklIdWZWS1p3anJzTEFQRFpseHdKdHRJRnlF?=
 =?utf-8?B?NzlQZHoyWnZNZms2R1dONi9OaG9heTlISVlWeWZJVEoyc1ZFcU90dXROajdE?=
 =?utf-8?B?amUwekF4cEsyblVScVR4U2RUOVdnOVhVaHFPclNhcGtybkFpR211dnczZzN3?=
 =?utf-8?B?eGUxVnNkT3RFN2Z6enAxY1pZTlBDSmhhVGZJVjRMcy8xdy93TEJnbzBXUHNz?=
 =?utf-8?B?WE80bTlWSzFiN1VWcHJLQnN4ZlE0Q3RwWTBOdlFFWEw3M0diQVpmclJsdmlq?=
 =?utf-8?B?MHlJNUcyMWJlU0drRStXU09hR1k0UG5ua0ZIT2ZpRXk4MmJ4WE5QeHpLWWhH?=
 =?utf-8?B?SGFEd3VsMVQrY0JwUjdNWjBHazFORjlFZXJ4VTBFZENNeDdhYWo3SWx1N3VQ?=
 =?utf-8?B?dHI0V1VJM0N6bnJaSkE2NUttbVR1WTFnSFZzUSt1b2VCc09EbStBRWtZS0xo?=
 =?utf-8?B?eDFTRnJ0L08yUFVkWGkwYVJnTXVOVTl2bTFWL3JWalUwaVN5aGV5VGJneEIr?=
 =?utf-8?B?OG5uczFwUGdGbklUWjhyVDZPUVRlVUk3bVowbCtkcnpZcEV5TCtvY3ZGalh0?=
 =?utf-8?B?YXdDdDBJUHhTVGRCZzE2a1V5eUZLMDVSdDYwNitjSG1MdHRZS280dExoVHNI?=
 =?utf-8?B?aFJoUWpYeEhmbVpNSkp4OGhiNmE0K1hUcFNmQS9MQzV4WVJSamYvcEtVMnBN?=
 =?utf-8?B?U2RJM2FrdDhZU3R3dTEyUTJxWWxuSTEweWJjSnl5c25NMWgydW1Hb20yYkk0?=
 =?utf-8?B?Zk1ybVFMRlJrNWJMNmtPUUZvbGMrZHJlNWJRTWVYQUN1bVZoaXhQT25HT0Fq?=
 =?utf-8?B?c3ZkbCt2blhkRjlkYUE3a2hRazBmZEt1b0VpVnNURi92STd5OFdUUGdkSita?=
 =?utf-8?B?Ynh1N2RqN21CS2VkeHdmVzdTVFRzV29wNG91RjBWMTQ1cTFHRzNiNTljdEZj?=
 =?utf-8?B?b3cvV0lVWDBsSWZXVVlYSXlJcWtDdUVtRUlEaG11Tzhzd2k2SVBGRk14MlFi?=
 =?utf-8?B?ZTR3dzNKNGFHNjIrc2kveEtVazlCV2FibXdRUUUxb2U4R1NZbXcyRDNJekJu?=
 =?utf-8?B?V3lnb1Uxd3BpejBJTXc1eGxWcEdHaU90YWsrSE8zdDQwTllzOUFHSVJkakJl?=
 =?utf-8?B?cFNXUXRKVmFrMGgzbWQvMHRreUY3QWVmdmwyUzB3Z2JTY0lKZk9tRmNCTDMr?=
 =?utf-8?B?bkRiK3p1YzZ3MVl3ZjlRMVZPb1N6U0lsNzhxb1NPdHBkN0tGY0g1WTBoU1Ro?=
 =?utf-8?B?eTQrSFNDZWg3KzJoM3g2WHNYYWNuSWxIK0VmTXJEU2dOTWt3d0gwNHV4KzNw?=
 =?utf-8?B?cW5BN3VpaEh3VVJZSmI1WXBmOFhwMUh4WStFTHlxMUt0cG1RQS9kZnd4R2Nw?=
 =?utf-8?Q?GsceqArif0FFcp9OFawioKUj/xRJKc9D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3Q0ZTRpNlJzZ3ljbkFPUjZYalhZaXk0ZzEwUFVNSXNZOWNsNzZucEdiV2kw?=
 =?utf-8?B?eUQyRzg1WEVBZ1NabWJZZ2pyWUtQV2ZzenNVQnNBUHBtaGhtRi9zQnpRZi9w?=
 =?utf-8?B?V0RsN2p1ZTdvS2FLQUlFVGZxak8xbUlZNytPbWM5ekloQklBbE1VWStheVhp?=
 =?utf-8?B?MGpFVVZPYkhkdmZXdGthYU5HTFdVd29lbDk4N2RPNmRiTUhoUnlzZjhFb1Iw?=
 =?utf-8?B?LzZYQmVJaVNpWEhKOXJZUm5hRDRLbmo1TjBVbllHbEZlUHB6VWVtcS9DMWhB?=
 =?utf-8?B?TU03RXFHREdzVUd3enZKSSsvcjBFRTh6dExRdE1VU1ZyTWxpMVhGTnRZcGV4?=
 =?utf-8?B?d2cxY0NUZVFHa2VCSUFUSFFvSFVTbkJmNGR6YlZYTGY1TkdRT2NjRDJXRWFx?=
 =?utf-8?B?WDhFZXVIUVJNdGlaNVVLRVVWeFpOdkZkQnhDZ2tZblh5UkViUU53TVJHbUVm?=
 =?utf-8?B?SjROakhCbjk2ZUJMMVM4UThCeFZjNDJXdEZ0ZU9uUk9IWHRjL01oK0Q0K21a?=
 =?utf-8?B?b0pkZXA4ZnVxUXdiNHRQcFRUQUlsWUpzYTF5ekZoaVdyZHRKVWhWMjVPaGFQ?=
 =?utf-8?B?MjlwOG1lSVNvVWdhQWVZbFZtc014T2QwSlFtQzVBTWduVFhpbWZndzVDcnZ0?=
 =?utf-8?B?MTdac0hJcEhzZ211ZitFSEVOZ3RHbEFaK1dtR09iWklBWjVmUWJHTW1Wbk84?=
 =?utf-8?B?RDVGUndjTGlJZlJ5eTFPSTVFeTh5M0JQT3VLSmh3dFlCSWlWTEl1Y1pudzky?=
 =?utf-8?B?RFVkenI5ZkttT1JVZWNobTV2V25HTG9JdVp0YWl6MnBJUTRNb1dLR3lzam9S?=
 =?utf-8?B?NDhNTmZkTTJwZWRCWVVIcVNZWHFxVm1mRENaQm1RcG5nWHQ1ZmdxeE9PZXlE?=
 =?utf-8?B?UE15TlVrcE9MME9kZi82VmV5VlRCVWdrcTFsNUEwdnpDNGxyYWZycVV0bWlY?=
 =?utf-8?B?VlV5TnV1S0xURXF1WTBpakIvdXRyUkpyTnBGbmYzaGhQdlZOV3VxMlNFVDZr?=
 =?utf-8?B?dHB5VUdqeVlodzh6STF0RzFTQUZFRURZN1l4KzZYVENRb2dQL3YxRzNEVXNZ?=
 =?utf-8?B?bEVnYWJvSDZCQzFQTFZEUm9KeG5xeFpBZ0VJRU85YmlKWHNxTWJLdFA2bjl3?=
 =?utf-8?B?Q0ZwRE5nRUdRRkdHR0dPRHc4T05LZEozejlybCtSazd3MWl6Q3RYaFpQV2Jh?=
 =?utf-8?B?ZE9OQUJEdDdKUndZZmV0TDBpY3pydlcrK1FyQ0pYSjhhNWtZWmlqUFd2ckZu?=
 =?utf-8?B?RkVHdy9Ha3drY0tETVdzWGdjZ1VVeEY3Z1k4cmFndWVVaFlySTdTVW5WMFBX?=
 =?utf-8?B?UnZxYkY1WlN6WkFQSWs5RGcrbndxSDdRRDFaOG5JQXJwU1A4cUJLNEFseXli?=
 =?utf-8?B?Uk5ubFQ4ZG1FTUJqdmtqeUNvUk05V2FvaWQ3OThtWlJ1ZDFFRTNuZmd3dk9G?=
 =?utf-8?B?NjlmbGRZRlpkTklXRDVtcUx5TFpDcDJucE5vb3gxTlhOT3U1SDU5VWt6Mk93?=
 =?utf-8?B?djZmVXh2RVRiVlNUbVF2RDRmNkxyMHBnWDhuMlltVnJNYk5PdFI1YXk5VW04?=
 =?utf-8?B?aVpFMnNHU0Z1LzJWZXZmVHR4UElqbGI1ek1KM21ZeEFLR3BBOG5jT0VaZFVs?=
 =?utf-8?B?V3R2NEFacjBncWg4dk11NjNmSVQ1ZDFza3MvQTdSSy9sRUFHQnVXaUJjOUl3?=
 =?utf-8?B?YTZ2KzVxRFE5QjQ1UE5WTkF0Z3RXKzJpVDAyZURSNGNTWDdJMFlKanRFWjlK?=
 =?utf-8?B?L05nNkROTDBQN3o5eHdMRVlJOWhkQXFySCtLN0dOK00xanlzNmlXdG5ZQ3hM?=
 =?utf-8?B?alFBU3l2NjdSNE5iTkFlNHErY3VLZTh5R2F0Y1VRMHI5dEpuNlcxQlBHRWJa?=
 =?utf-8?B?dytIRGpzUFlMcXZpVHhmblNQS0VWZGdQVGhsN09VWXR5Yk9sWTFDWTBhdFBK?=
 =?utf-8?B?bURrYTZybnZwbmg4ckRLNTVybjlmTFZCM2lJdXZPTWFFNDc1RGhwV29WbnJz?=
 =?utf-8?B?bGRlc1FoU2k4Q2Y3SjlvUEQ1bE54OERpZVl2bHVnRGc4RTE3Z3VEd1FOLzZr?=
 =?utf-8?B?cGtSWTltdzdTM3J3dGFodEpqSkFWY3FScHNrdDRRcFd5OFFSdGdtQm1vZVdy?=
 =?utf-8?Q?cG6taPvUCbfuXLvV4UR0ULqWb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2276f0-9a4c-4785-4d33-08de1551fe49
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 12:11:44.1962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/XasCeCUUrIA94MxObtTsSqrDmnTInFYf47WFYuEuTBj8ihr2cRo5itw29thndYyYxaclBNJOZ4p5uKqVw+jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7668



On 10/27/2025 16:42, Lars Francke wrote:
>> One way to be sure it's applied is to add a pr_info() message into the
>> new function.  Then you'll know exactly when the new function is called
>> in the logs.
>>
>> But assuming that was in place then I feel this will still require some
>> other coordination work with the PMF driver then too.
> 
> I did that now, thanks for the hint.
> I added a pr_info to the sp_restore method but it is never printed.
> Just to confirm that I'm building and booting the right kernel I also
> added a debug line right before the "TEE enact" error:
> 
> Oct 27 10:50:06 lars-laptop kernel: Lars patch worked
> Oct 27 10:50:06 lars-laptop kernel: amd-pmf AMDI0105:00: TEE enact cmd
> failed. err: ffff000e, ret:0
> 
> In other words: I'm pretty certain I have your patch applied but
> sp_restore is never called which I think was the intention.
> 
> I did play around a bit in the code but all I achieved are NULL
> pointer crashes :)
> It looks like "i2c_hid_core_pm" might be a typo/copy & paste error? I
> assume it should be "sp_pci_pm_ops"?

Yes — that should be sp_pci_pm_ops. Keep the pr_info in sp_restore();
if that log appears but the issue remains, the PMF driver will need to
be updated to support the .restore callback.

Thanks,
Shyam

> 
> Cheers,
> Lars

