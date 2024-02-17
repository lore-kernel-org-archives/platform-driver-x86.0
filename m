Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373597D400
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Feb 2024 16:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708188947; cv=fail; b=W+A1JsQplBCwzUqXc/qIDPRlLya8ImXx/vQO93sReRdr19/H2OcwIL+IrKmsBgjRc0GxpXse6azPsHIx/qToV7Islfih6xDuxGAdb3sgqf94Ftnw5PDxvZc2cDdDsxdSj3NaiEYi3CV5RCo989sohBnY9oJmzc4h7idUnwpkGis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708188947; c=relaxed/simple;
	bh=ICmeXouS9OBvQRf54LksVu+5GqPv5Tj8GN+IDKAIKiE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=USpTdzsCVfNls/uH9Bt6JX3py7+y3mIfeH/bP0PQYNaLL/EWwP3NxnljGofzNpzzbBIgb1Qkgcwj87gUo5nYjwDFarOUaS4ygsBlpSAsMc1NAavuiV1m33l2/c5wZMapNHptQqqckDCalKNczvjOa/62IhbdknZTlTxJPzh+OEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KV1xdEFe; arc=fail smtp.client-ip=40.107.244.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KV1xdEFe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqIKtk52UZx0yDDl0WKDDsjO9b3FPMrhhRmJaPaVBWcZhvQ8z3alAS/8GmajTKs3BLzVCcNzXGDUFyUrj2yfUVRciMAcg9PRgeqqvb4irW6df9CTfGXfARJaqpzp5eBvfjlZB1DwPu0edbm7Js3vha9tKuScKhgBTH/2ziES29WfMp74vonB83lcnvDIv+US3kK/4EIX/o1RrYWK78rF/W69tpQFh5FTiWaawX4M8X1R8ZuGxuYiqolB3HiS0vqmLmqdDSXYnyeKBUPZ8KySZ4+xgzCRGpoUjv3P5Z5qU3tax3OZtwuR+0N3nfIq66h7HBvJZzjdP/GF7H5/ucg7uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/iHn7Im4hPQ2JcuBz0v41O+rlG2wq8Uemymk1NUSU4=;
 b=gsbZiKvyAp3TLeR6RuBns4I6x4ybmqlGdViYVABPDYlTwRwQKeJueEKVXVYWz4j9Qveb1jJrfwGlCiKzA9a8zOcv6mwAXKnyah9EC2MZlpQL0+kljs4H/qlMg13Lv+KLqQw1l8hq+VoqXpYNunsI0pCk99ieDhe5C5mSPfp0dS8N5Y6SCV44ql9vu98mvY5G6F1tgf1h5SwyAuMglg3PyzCgNgSyAA2ipMz4oozhr+dMM1/A8LDgEcQoUL/Rw/5ZUlsUyiLigYdX96t1AsaQIS51UTHbPMjpMWkorYpqqQRjAln0KpilFP2V7Bz4gFF90C1dUz2AKodZgyaSpkcDYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/iHn7Im4hPQ2JcuBz0v41O+rlG2wq8Uemymk1NUSU4=;
 b=KV1xdEFeJWEwlJ2vurasbp5lgAVsWSn67qwG2VbzSBxaLa4ke0YWx6S2FvM7ljs/7oV+GSNAcpYpnGq5grJB3ShwXfVLKTX5LivdNUCYzdPLhZNFc0ZU4iSV1a7/NOOS/kBe6+fQM6CM6JMYCiv1AL6jmF9xCNQL8iGjvVnilgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Sat, 17 Feb
 2024 16:55:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Sat, 17 Feb 2024
 16:55:43 +0000
Message-ID: <cab6b74d-944a-4983-9d92-9cb4f18abc64@amd.com>
Date: Sat, 17 Feb 2024 10:55:40 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: 6.8-rc: system freezes after resuming from suspend
To: Hans de Goede <hdegoede@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Trolli Schmittlauch <t.schmittlauch@orlives.de>,
 platform-driver-x86@vger.kernel.org
References: <ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost>
 <df1d5d57-1058-43f4-8aca-f91e7ad92dd4@leemhuis.info>
 <0d3bdb0f-63a7-4c48-b4d4-157b7b7c1689@amd.com>
 <92c8d543-bdf1-434e-8d92-23eeb513b35e@localhost>
 <0a103f43-0340-4c01-8a26-ecdfc186915a@amd.com>
 <d20ee821-c0e8-43c3-944c-125bf4064a16@localhost>
 <687a566b-95cf-4fa6-bc8e-7ef0b0475a3f@leemhuis.info>
 <859c089d-2c3e-4cb9-ad60-baf3e168d6bd@redhat.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <859c089d-2c3e-4cb9-ad60-baf3e168d6bd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:5:100::40) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 09abc0bb-a6c1-45b6-8b3b-08dc2fd9478c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NmMMi8F1wokbYS3x+eb5493ynjJWu81FxH5q02tv1hrBW45kIbc0WvACTk7VJxm/s2RC8HoGgfQ69w2qbzuJuxLN8gvcx7QXFaArzOvcmoPfcm++IxFomNnsuvgLlmL4Rpn6vlUtMQ7P6MB2nuooBa9/Yng4HRygtktVCc1dLJBOA5bssRf5T6UJFeJrNrkVaTTNIfved/mNea9gltnPMyVFkZsVgNRiczSccsTxkErVceN1aQSsKclvVDBQE5kxNkP9kAvvO0TB675U9n0kPQzBildI3wL+5pLae9LrtuDSeqTKfWQTEA6GX8/z4NFfaxLLXeGWd2NOWzQDet0A57OGbxEx/T4NCrZu7isHRpOp0PsXjjMMc0U8s2NeIqLdw6T60gG7sU4wt4Zs6+/ROA3D/h5WchksVXX5f6dxB+CQ/arh85sSKpYslNw5XPXbIwqSna5jMTsTj/BMSVPmmCrA1vIlsNtANqu5H8BG2tzcABMMpyturwZgAohX2tkvTAFF2qQ5MeK3VW9Mw3u78qJvic5OZ5dCO+0AuiySKGMVUWOS5EwS6COMEDN7hOHTrIahXfO51PrxQi34uxoyhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(396003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(86362001)(31696002)(31686004)(41300700001)(4326008)(66556008)(66476007)(44832011)(8676002)(6512007)(478600001)(966005)(6506007)(6486002)(2906002)(15650500001)(83380400001)(26005)(2616005)(38100700002)(5660300002)(8936002)(36756003)(66946007)(316002)(53546011)(6636002)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clFnRDhmejRmcTRxdWpzaEpaNnJuNUdFWlZNSHFleE9qUTR3bFlra0FqZ2Rs?=
 =?utf-8?B?RkdWMk9LNjhRQVNjMUFPekwzODUyUHZaZHpEZ1hEWlhHL3pYRUx2NVEwd0tm?=
 =?utf-8?B?dHlHZ254VWpYSE45WDJ1OTczZzc4Vi9yTStCa2pBZFYvREJuTlBTNHZvWjY4?=
 =?utf-8?B?NCtBYW4ySDQ5eTlPdGt2SWhCUTNoK1VzM2xUbHh1VGZ6RlVBQ3J4S2FiYkV4?=
 =?utf-8?B?ZEdwQy96M3E1bUdWNlZrcWVHa1NvZ3EyNzZzb3AyL0hKUE0wQ21NYTF3UlFN?=
 =?utf-8?B?TnFURU9CMEpMN2xuR2NybkxWTGNYRE52YVh3a3d6NUVIQnlQQlRYSWY0aDhS?=
 =?utf-8?B?RElFSUQvb3M0WVVOZFdERXdCQUxEemFQWmZOOVZUQUU0bDZML3hhQVlxUGFS?=
 =?utf-8?B?ZWtkaUFKWi9iUTVzcUZSUUNiMDdHWFc0SGhYUE92ZU01eXBnbDlTam1ZUC9p?=
 =?utf-8?B?TEF1cHBYWEtRRkhtcXc2TUVOVDNRNEV3ODV2SG1Gc3M0a1NMT1FxcmgzL09I?=
 =?utf-8?B?UnBNaXhDa3JNMGN1OWt4bDE3aXVVMkZheTIxcDU0dm9NVTZ6S0pxMFJQcTZJ?=
 =?utf-8?B?R1hHdmlXeStwdUtWbldNd1FQWDR2N0p1YkNlVGZteEFsanBNS2lYYytLdVJS?=
 =?utf-8?B?a3h0TnZUTVFmUWNGTjdzZk13RzhOZ0tCblZSNVE5U2dmL20wUSthem1EUDVa?=
 =?utf-8?B?L2d1RnYzOXNRWnpGNEJHU2kvT0NvUmNHdmJ2dmNodURRbjdSQ1RBRHRPdUMv?=
 =?utf-8?B?UzRvODRjeXhQVUZFV3ZmTCtIVXdpQTJlTVVuakh1N09OVW9heHJaQ1BMa1pw?=
 =?utf-8?B?SS9lSnFOcnBYTGMrQ0hZUHpBb0QrUkREODl4eHRBM3kxa0pDb01hY1BYNXlP?=
 =?utf-8?B?M21hOHlpVmpkb3BzQktyMnZ4TnEzUDFwbHYyUDF5TWF0YlhMQi83bGVwanQ2?=
 =?utf-8?B?SUZRNjF2Z2QwQkhBT0dhd0c1WEtpT2RISGNodk5qUjhNemN5L3hjam5sNUMx?=
 =?utf-8?B?bTVHRGtlK2ZuSHRMY0RqNHdBZDZwdVRCd2F6TVFvcllSNWNjWGhCQkFNaDls?=
 =?utf-8?B?OUUvVTZNUmhaZWVjRkpGQ0g4Mkx6NVdvTVFPUFZhaTBGaVVGSFRsWDk4U0Rk?=
 =?utf-8?B?Y1ljRTFHcWhDK2RKOFd3Y3k3T2Y1eDRna3daU1ZvMHFYd0hrNWpEeGxhcmI2?=
 =?utf-8?B?M1dxS1RyN2NjZ3lNUXlYWFR5MlMxOC8vSm9BN01DYWthZnBkR3VRZjFBQTBr?=
 =?utf-8?B?cVZ3a05rOEp5L1pQcHZFeTIzVWpWSzVCbEVWbWhSSUtGaTZxVnNqa0tpY0FZ?=
 =?utf-8?B?Zld5bGVtOUpQZ2JIU2JGaFVXejlNcjBEbm9Ic1ZjQ3FNeDlHMGxKNzI1ZFE2?=
 =?utf-8?B?T3dScGhuRUJEWmRtd0JzUXJvU21EcDJLOE5pQjNmR01nc3MzL2xFV3NPNnlT?=
 =?utf-8?B?M2lNWUw4YzJueWVJYVZFYU1HdTlRV1NibG52bmt6UE5INDlkaEw2NGwwaTM1?=
 =?utf-8?B?ajlZTEJjYWdpVTZZbURmS1ZKcjVpZW1qNlR2d0IvclZzeTJPMnBWSktCc3Vh?=
 =?utf-8?B?OXB1ZWNBektpUXhqcjFBbTF0Rm1lbEJVWVN3aFF4TFF0a1lzaklxaWpJRVph?=
 =?utf-8?B?aGpJdVUvQTVvM1RkVjlqVGxnb1NyVDl2KzdmcmdKTnN1SzBLTTVCbmNrL29T?=
 =?utf-8?B?Ym13aWtDdjhTTWJKOW9EUXEyVnBWQVFuNkxxc2QwM2dLVTR5SWN6RkRnNkpX?=
 =?utf-8?B?Z0ptZDRRYi9meTY1dHd4SUtGVi9HV0dBYkJuVUZKY0ViN2NyR1ZrWUpzbldR?=
 =?utf-8?B?ei9zUjl6RzhVSmkzWGJ5NXJJNUdRclFlTThNRW5GTEtBREN5M1YreTljNzlk?=
 =?utf-8?B?eFFncE5XaWo5WWw5V0NaK3Q2KzI0bFV1bTBqVGZ6ZWV3UE9ISy8yVjN2bU82?=
 =?utf-8?B?Y2NORVVpZEJMNjBNb2FUcFphMVd3ZXNGRUhnQ2EyUEtDZXBRZitra0ZObXdP?=
 =?utf-8?B?Y0tSY0lGaW9pdFVZbEIraEgzcEFtZE9aWU03OW84VjQ3VWIvdEk5MWw4R28x?=
 =?utf-8?B?VGxIdWVXQUVRbVRmZFpHeWNtemJXYkZVZWhMQjIybU5EL2FpSHQ5YkVKcVBY?=
 =?utf-8?Q?1/xXt3qIHG21jxgsj0/3+nlyd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09abc0bb-a6c1-45b6-8b3b-08dc2fd9478c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2024 16:55:43.5713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjhNpneuM2171tiaJ2/T/H77qAvYPC1X6F0g8hNRx5prs0xX9ROpnUPvLOKAf+wyQjbgER8jEE/XpKI6lAudRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824

On 2/17/2024 03:39, Hans de Goede wrote:
> Hi,
> 
> On 2/17/24 09:13, Linux regression tracking (Thorsten Leemhuis) wrote:
>> [/me among others adds Shyam (author of the culprit) and Hans (committed
>> it) to the list of recipients]
>>
>> For the newly joined, this thread starts here:
>> https://lore.kernel.org/all/ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost/
> 
> Thanks (1)
> 
> Trolli, there are 2 PMF fixes pending for 6.8, one of which is
> suspend-resume related:
> 
> https://patchwork.kernel.org/project/platform-driver-x86/patch/20240216064112.962582-1-Shyam-sundar.S-k@amd.com/
> https://patchwork.kernel.org/project/platform-driver-x86/patch/20240216064112.962582-2-Shyam-sundar.S-k@amd.com/
> 
> I plan to merge these and send them in their way to Linus next week.
> 
> Can you build a 6.8-c4 with those 2 included and see if that fixes things ?
> 
> You can download mbox files from patchwork and then do "git am <file>"
> to apply them.
> 
> Regards,
> 
> Hans
> 
> 

I could reproduce the hang myself as well.  I've tried those patches but 
they're not enough.

Here's a fix:

https://lore.kernel.org/platform-driver-x86/20240217005216.113408-1-mario.limonciello@amd.com/T/#u

> 1) Note I'm subscribed to the regressions list so I was already following this.
> 
> 
> 
> 
>> On 17.02.24 00:26, Trolli Schmittlauch wrote:
>>>>> Still, I had the time to bisect the vanilla kernel and landed at
>>>>> 7c45534afa4435c9fceeeb8ca33c0fdc269c2240 as the first bad commit.
>>
>> Reminder, that's 7c45534afa4435 ("platform/x86/amd/pmf: Add support for
>> PMF Policy Binary") [v6.8-rc1]
>>
>>>>>   Could be a red herring though[]
>>>> If this turns out to be accurate, it's actually quite interesting.
>>>> You can prove it's accurate by doing a module blacklist for the
>>>> amd-pmf driver (even on 6.8-rc4+).
>>>>
>>>> If that works, it's a great hint at the problem scope and we need to
>>>> pull Shyam into the conversation.
>>> I just checked this with Linux version 6.8.0-rc4 (nixbld@localhost) (gcc
>>> (GCC) 12.3.0, GNU ld (GNU Binutils) 2.40) #1-NixOS SMP PREEMPT_DYNAMIC
>>> Sun Feb 11 20:18:13 UTC 2024.
>>>
>>> Blacklisting the "amd-pmf" module indeed resolves the issue, good catch.
>>> I've attached to s2idle logs of 4 successful cycles without amd-pmf. To
>>> be honest, I don't know why the script considers the kernel to be
>>> tainted. I have compiled the kernel via the NixOS packaging
>>> infrastracture though without checking whether the distro applies any
>>> patches, but a guix user had also confirmed the issue in the Framework
>>> forum so I guess this issue is vanilla enough.
>>>
>>> Looking forward to resolving this. I guess for most use cases I can just
>>> keep the module blacklisted for now?
>>
>> Ciao, Thorsten
>>
>> P.S.: To be sure the issue doesn't fall through the cracks unnoticed,
>> I'm adding it to regzbot, the Linux kernel regression tracking bot:
>>
>> #regzbot introduced 7c45534afa4435 /
>> #regzbot title platform/x86/amd/pmf: system freezes after resuming from
>> suspend
>> #regzbot ignore-activity
>>
> 

