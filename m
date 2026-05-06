Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79921391
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2026 04:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778040171; cv=fail; b=VYobS6hzYplrpEdipKfoainsV+SWSVjlz1fmRXWk0ewuQp4QLUmZETJItUK43DgAKAJQZMVItVqMJL3l6HUIv0YPOrVojk1acDbsF+SHmbwCY6qSbZNvBJKVmK+8hvhZB13NMWmrZKZC58mFH8w/pAeXvsAdpiQvujrS0B5ssb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778040171; c=relaxed/simple;
	bh=n3EqMJWW0OAJJY7EcL4h5AgG5WtT5xQsud3/s0aBG10=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AXZeqVT3XTqvI4Q7fP8hL76/fH6G9/nxytI3pggi8XdxwXtV38aTfecPfHElpbIcAL/ovC6+UsH9QYvPyYNn1jBzzj2c7XowOwsKT4QE5qBbhH3Wm3dcQ6d1kkHw0Cz0K1Y4pLEVD2sD102z/2hiGwp0ocCYc4Tqrf1P8ESQKcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ABi+aMfC; arc=fail smtp.client-ip=52.101.85.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ABi+aMfC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRvi6NAJV4UKjwM8wPZknDqmfA5oiLSRWvks7Vh/X5DNe0MnWSMHSrVjwCzoyX5j8flxfrVhjFjIC5og2s+ov7wuYJMS8Z7HYaN42QSd+2BruiEEze1IqPzhKw/m4k1LOxd7o5F8Z548iOo1JlgaIfbepWy0WUc7A1nR+Mmb/hZLnSyZXiy/lf41TxFcgM7s787MUSdTKKGc4U5OHH6ljqxx63HSZMjx+AycfL6kGf+nd0odmmL11HuMypTVpJZOxRIk+Xcuu4L9GPQBOQtb0rMhf7EyOl/34sVTQlvl6VwKgzmvrhLHf/eLBMLRJLMpxKeTg/FZI5IiqHu2UB8fog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryMjgV+vqYqO+K2BohbN9WWqMvpmr0B/E3vWrqqW/10=;
 b=oHKrgfvxkl3s+g8KkywRRsuuisJVLDHtIUbrNTd6QibF7UIqy50P52ltGj/MKrhQh/pOBFx3cxX4Nl67rqlhO948LzGadMprgH7poz96DCXN4WcMOvt+Y3wuL6R4LdCvssrQ0pZKhOo7pa94lovdZ1JkBgiHYQOsu9/8BQqI6XTckwdNFtik45V8IrvnCEqGKENqPwHB3g3su8u87/AGKTSZcOoQMns8uBoJWOddFD2QM3AxQOaukeoqPF5wlaB9hopy7m0mkZKaZhETn5mkysKAjFE4ylpzVj+lBYMgZvshbhjbXqeDkwni9p1z5p8779SJbqvLaBfU9THNx0l9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryMjgV+vqYqO+K2BohbN9WWqMvpmr0B/E3vWrqqW/10=;
 b=ABi+aMfCAEqOCxV+EbTv4eCF8tqlDHuIU8bgHfUm9yVwclj8mEKetLDZBZv4lBXHDEt7h8oJo6rdyBVbtXXvNbjrNeAhRjky2hspgj++QEk+XJCFqUsxmaJbY2lgsB76U6NLk84didRhSlioXJOpzOLWqF0nWAN6naVN2bM+LtA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18)
 by DS7PR12MB6261.namprd12.prod.outlook.com (2603:10b6:8:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 04:02:47 +0000
Received: from DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::f927:9cb7:cf3a:e741]) by DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::f927:9cb7:cf3a:e741%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 04:02:47 +0000
Message-ID: <5e7d4a67-7da0-4b4e-b3f5-e5507f8e7969@amd.com>
Date: Wed, 6 May 2026 09:32:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] platform/x86/amd/pmf: Add support for PMF-TA
 interaction
To: Dan Carpenter <error27@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <aenFs-bOmM6VpO9W@stanley.mountain>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <aenFs-bOmM6VpO9W@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::21) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5184:EE_|DS7PR12MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: a49a8bc6-4b61-4167-70e6-08deab244d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	d7lCMc6Q66HkvbA/E8G30k6+eOLxSCgXrb8zzfOT66HGilsTtqtiwGdMlodEPd8q/W/39R5+0WOZAQzkFbqnnfikg/egx9egDFnZE+9d5dRP53I1pHLOqVqquYiHr32YkxIf+wO36VlXO+qbVYAO6Q0cJtZPdQxx78Fd+/xwS+Li322CgrXSw3tM5RLScMt0u3dkOFY64QXbA2FBVVqJHkBDYLnGSlgjDBcaw+abvHgkdaBlnk1kCgx0pZDUOTGm4GUquVN6/Krf/iSWZXKxmm5YXp0Y6kYUXMIiKQMJt8nXfz43iCK7iLibrgDn2AUWR0CjRQ5YaHg+SwT84W+VdXL9gm5NYe16nRq0JcGeztKFVkWXq24kltmAlzzlDwvt7I6Aflu4o/AS9tLJZHHS3E4dTPI5NPUDV1/UOF2YiSvGsKcelWqJLeCOePim4Wwg93ocCHkDSMmczlwGhvoJOgifBN4ee4ufNJjjWlp4uKcJmBrw3MO1F6ccCmLj/sDGh/b9UsArgpzlxXxCTG2YJ4FQCYsjKNGKbQEuQuJiTLyrDf71IvLHVgMEiSsiNwvo25APSiHKROHHVJfpt7HgpB4NaEHwHcl5jpJrcsJlbYgYUZ1HuFGJP13tpnzE9eJGEOAPyGf1M41XCTiM5Be0HdCdjRJMbOjzpk4co/mm4KU3FfGS1t1joz10mwElvnrN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5184.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnhEU3M4WEw5NUlHdVo0ZE40eVhWNlNJZjNiYmVBaG5OQkFseVhHV1FOMGlm?=
 =?utf-8?B?RlNuYzl6WjBEY1lSdWpBUzZaOWYrTDBWOWpRT1l4OGFxQm91dU5HNXcrbzdQ?=
 =?utf-8?B?SWVWamNtZ1N5OExuT1JybkR6b1pac2kvOXF2VlE1amQ3VmJubHVDeHQyY3pB?=
 =?utf-8?B?bGhhQjRQQStLY1JYY0dSVDJuT21Yb1lqTG53QWhUV0E2cC9FMGIzRy9ZZlQ1?=
 =?utf-8?B?RFZxcWVNM2p5N3dXRjd3MjNjV1FPT0xKdlF6QWsyNjQ3cTNhc1JzRzhSeXY5?=
 =?utf-8?B?a01JZzVzR0xLK0FvUmZMTDB6N2t5NUUrUXNuWk0vcVNiZENucHBYS29rOElV?=
 =?utf-8?B?N3MzT2VUNkYzZXV1MnliN0pzWkhXMmdpS1dNWm1HL2FJOWdmSU56RFJaWEsy?=
 =?utf-8?B?Ui82dlJROWlMSXZ5by9oL3pBeGVJMWV0Wi9hcWtoSGwrUmVYUTBvSE1GQ2Q2?=
 =?utf-8?B?QmNGNndGRVA2enFzOXRuMU1KVHRXT2ZXdDgxK3NEZjNlYnFXdFBOQ2dJT1dy?=
 =?utf-8?B?TWdWUDNSbk45RzI4UGxidnNSSGpKRjNseENtU1h6QlcrSWY4RjhzdFNWYVVv?=
 =?utf-8?B?S0d5Q281cHhWeXpkY2Q4eDdLL0xQSDVZNEZZbmZvSGk3Z05XaFl5U2U4UElB?=
 =?utf-8?B?RDJRV2NkQWxvaTJuSHNFUm55WGhKQ280dFVYNUw4RVNvdERaWWRjd1M3blJq?=
 =?utf-8?B?NW45QWFMQXp2Q2ZPL0lmaGtBV1FjZXlramdwU3RUbWJXUGdmNHRQMFh4S1RZ?=
 =?utf-8?B?eWt1Q1h0R3ZkUmdXZml2NXYyZEZOKy95ZGpWUGhvaGxFSkF0STdackhTeXUr?=
 =?utf-8?B?bm9tOUZXSGN0citpNnJuQ01CS1lSWExmRkhIZmdOSHFKWDFwTWlXa0krSDRn?=
 =?utf-8?B?TkZEUVRKQ3R5QmUvZXFZRUN5OHBzZ1ZBVGdyV1NOb1ZwRk50OEZGVjdPUjhJ?=
 =?utf-8?B?UGNvNFFEWk1NbjVDN21OL2tSeEFuVnNnZ1RPcHFteUhmbW8vMGRaWGZkcnNh?=
 =?utf-8?B?UWtrN1U5akprV3hYL3dFRkZjVkRneGJOdXI3VE5yRTg0ZVNnUi9lOXhMcEtq?=
 =?utf-8?B?SUdzMVpwY2FXTzYweldCc000cE1oVFgzamNSRWEwU003dWFwejE0SmtQYWhq?=
 =?utf-8?B?WXpyS2dPcGMraTBia0tkd2NFQUdwQVc2dUduNUVYRHVVV0w0TmN4Y1gwVnQx?=
 =?utf-8?B?azQ4WjF3NDJvYVVIMjQvLzJsUDcrZVZKelErTEF6bkF2T3FFbkg1SldCY3l4?=
 =?utf-8?B?V1ZHc2xnNFVNM04wTVY5Q3doNkhVMnhnMkx4aE51UzFyTDR0L2I0eHBhZWFK?=
 =?utf-8?B?eHR2dm9JR3lVQVJsNUdLQWVtckVrVU9IMjhHSldKejhuaTNhL0xFVnowRHZv?=
 =?utf-8?B?MkJFemc5YlF0SXVBcCtrOTMzNHY5T2VrUmFBcVZDRVY0U054eE1jVmdZZ1lC?=
 =?utf-8?B?aXlheTY2SUpKM2N3bjVsZkhoa2VNbk9xVHQrNENJcXA5N0g1WXp2MGlhMVM1?=
 =?utf-8?B?eVdwV0hWSmZpY2x6WTZubktvNm5OalcwaTJPaGltU0ovMStwQWNFTkx2eU14?=
 =?utf-8?B?aUkrYXFQaXRlNVljbVVyWjlmcks5Y0hCS0tBZEtrbGMvcEVMeitSYzQ1OVBM?=
 =?utf-8?B?K2ZBQU5TeXAzUUJMVGVqQWlZbG1OQmdta2xwMjJLYkNqYlk0cVhyQlpnSXpw?=
 =?utf-8?B?Y29EcGFrS2ZQZm13S2hXY1hOSFd1ZE1uOU5RTGswRUI1TTlNMHE4OVFNbEg0?=
 =?utf-8?B?MEdZSTZGakJWdTlpa0trL1NBRkxsV0tDU1hsUGp2ekJqNXF4VzVJQVo1eE5P?=
 =?utf-8?B?OUM3S1lkTWRLNmpQeUtaY0VKb090TWJOdk5UYXpBM3hEcDBCQzBDTUNSNHJ3?=
 =?utf-8?B?b2tPbFVVM25McGEvbU9HdjBPN1JtMnNPZ1QrQldhdHdNRThuR0VGLzlzc1ow?=
 =?utf-8?B?eHloYkd1aWFtRGpvbXR1ZjZYRjdocFV0MU1JcGtvZ0c1N2hSR2tmOEo3SHpU?=
 =?utf-8?B?VVlBR09wWXU4amVtQSs3ZUQrSG5ZSkpsQytYUTZBOUZMOWk2Y2hsQ1FqaWhM?=
 =?utf-8?B?M2cxbjdyaTVuMkRRS2syR0dDalhZNE1teEZMOERaM1dKakZaSzNVblZlWHRM?=
 =?utf-8?B?Qlo2M3pjY0dCMzNpNlNEZmVxZWlWWStwQzZhdmxNL0hHbysra2kyb1B0MU5E?=
 =?utf-8?B?YURPZTAvMWpUbzdBd21qWHFZYnA4RnhYSEhaUHNvbk80ejFpSGtlQlJMUzZi?=
 =?utf-8?B?enl4cjBjK0pqc0svZTV6bHgwaWxzT1JMZFN1dWp3M3BRdFRHaXkwTmJMY2tX?=
 =?utf-8?B?QmxoRFNUTEJsWUZJbmkrVW14MTBjWE45ekpaUVRNOTRFTzgvME5Ydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49a8bc6-4b61-4167-70e6-08deab244d29
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 04:02:47.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtvbsUrJJerLqq7rIZA6JA7AVDw9PVDR3KP7fXQZPPMIkPEaYXuB7aw/mQwvakOpEXWpl7D8/NqmB0wHMricVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6261

Hi Dan,

I was OOO. Apologies for the long delay in responding back on this
thread.

On 4/23/2026 12:39, Dan Carpenter wrote:
> [You don't often get email from error27@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hello Shyam Sundar S K,
> 
> Commit ae82cef7d9c5 ("platform/x86/amd/pmf: Add support for PMF-TA
> interaction") from Dec 12, 2023 (linux-next), leads to the following
> Smatch static checker warning:
> 
> drivers/platform/x86/amd/pmf/tee-if.c:261 amd_pmf_invoke_cmd_enact() warn: set error code if 'arg.ret != 0'
> drivers/platform/x86/amd/pmf/tee-if.c:307 amd_pmf_invoke_cmd_init() warn: set error code if 'arg.ret != 0'
> 
> drivers/platform/x86/amd/pmf/tee-if.c
>     234 int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>     235 {
>     236         struct ta_pmf_shared_memory *ta_sm = NULL;
>     237         struct ta_pmf_enact_result *out = NULL;
>     238         struct ta_pmf_enact_table *in = NULL;
>     239         struct tee_param param[MAX_TEE_PARAM];
>     240         struct tee_ioctl_invoke_arg arg;
>     241         int ret = 0;
>     242
>     243         if (!dev->tee_ctx)
>     244                 return -ENODEV;
>     245
>     246         memset(dev->shbuf, 0, dev->policy_sz);
>     247         ta_sm = dev->shbuf;
>     248         out = &ta_sm->pmf_output.policy_apply_table;
>     249         in = &ta_sm->pmf_input.enact_table;
>     250
>     251         memset(ta_sm, 0, sizeof(*ta_sm));
>     252         ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
>     253         ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
>     254
>     255         amd_pmf_populate_ta_inputs(dev, in);
>     256         amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
>     257
>     258         ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
>     259         if (ret < 0 || arg.ret != 0) {
>     260                 dev_err(dev->dev, "TEE enact cmd failed. err: %x, ret:%d\n", arg.ret, ret);
> --> 261                 return ret;
> 
> return ret ?: -EINVAL?  (not sure what kind of error codes are stored in
> arg.ret).

Yes.

return ret ?: -EINVAL is the right thing to do in this case.

But I quickly ran the smatch and could not catch the problem what you
is being reported. Can you let me know how to trigger this warning?

Thanks,
Shyam

> 
>     262         }
>     263
>     264         if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
>     265                 amd_pmf_dump_ta_inputs(dev, in);
>     266                 dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
>     267                         ta_sm->pmf_result);
>     268                 amd_pmf_apply_policies(dev, out);
>     269         }
>     270
>     271         return 0;
>     272 }
> 
> This email is a free service from the Smatch-CI project [smatch.sf.net].
> 
> regards,
> dan carpenter

