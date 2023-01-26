Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE9FC05027
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Jan 2023 03:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjAZDkA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 25 Jan 2023 22:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236001AbjAZDj4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Jan 2023 22:39:56 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::621])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB22176A8
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jan 2023 19:39:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYWHm6RdVs69bIp6a+jM/NOEhMaytR675tO17L4SJGP4wPc8jaSR47nhxLeyhuk0qCm+YBC3MtakkxYV9QXkzwDmjWXkinOGtfnN2sv2/wfTvLws5t7o2nxjfuQEr8mDUAqlV4cb551XZL2bPqMKp9J3CdWbDCPEfg1nWsM/VQFaERjxnZ14966S8n9k4LxUYL8PRbCn0quTHV48OjXwPiFnHgKoSo3r6+Hegkbyn6WKiPaViZ6YV5Im3mWVacFYB8A7oHQdtWRUj1ik0bfpJzc2EdkevbXDKc931iQv0+ixcmB2c4xsnj72ofmCAI0GPijmT+jWkfpxju4a5HTq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dh3cw/zc4V1paY3Co2MBrvqFrloIHscIbZLBGSUL9U=;
 b=geGA3azkSJv848EbFe+pcgvLmxqaenki0idge55qxXNoq4pJBDp7zzEERPCXv1rzDe1tCNjK2Iw7jRCIi4qBAanZhOnWpnsC/bkeNhWO5pWQix0DssnnBPFCTv1TtGJiEqhu2Gs7pSn3ogRVTx7t4FhymBqcFx5nxf/Onuza3CNu7q24pIvq7eqX5WV7Ki0h4kGykD24Wbw1hzOhti99WCAw+RBE+QvnPuh4bp/dL8EmH1mjBVEgkZCFTO6wSPCPgizT3R0Vo2DNjmMRxMyceY9SWRkOnlpgx14WDCgRISSK4/m37gPIYhHnD8etbWLxS0J40ga560fzDsNN/76OgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dh3cw/zc4V1paY3Co2MBrvqFrloIHscIbZLBGSUL9U=;
 b=GCYEyjzDYPKJ6PeATci6r+71RgWmuc0h2xzOGW9dDQMJmJCa2H6eY9Vexb+1IavbxkQvSq7rBPO1b0SbMVsz2Z+h8pV2VJDJZ9umUUk10AecOFtysj3fHhG3Ji39wn3nPnglNzVYbXmFEO3rZSl8SWdrLrdjr+LA7n0gXO3G9sY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6658.namprd12.prod.outlook.com (2603:10b6:510:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 03:39:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%7]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 03:39:53 +0000
Message-ID: <662fcfb1-b588-cd03-a8ba-978a9896735f@amd.com>
Date:   Wed, 25 Jan 2023 21:39:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/5] platform/x86/amd/pmf: Updates to PMF driver
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
From:   Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20230125095936.3292883-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0205.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: 59472d42-02c1-4593-cc29-08daff4efc36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IDVg4YaQBM4FHhWxrooWf+BRrdYs89f3+O6dwpN+nExzdym/WlKCima6zEsIy/SAYir8NfbpBm2eu1x5VvdVnZLKlIdWzzyJL6NL/27j2a7NgyP72+Mr+EzitibjgIMDp9Q7ZaSp8YHwa4H5fL0Y+0527MY9JEyzKs4cTyRm1cXIQ6L55E7q1kgtZSQbeR8OihvxBIOhJ6boyieGCjhMsTGHHzugyvqVb3IRy3gScJVzjKu4kWO1RcYPGmrojmbz4NPAD6CPa9R17c4fn3b2weku+9GkvAzuAToY18Nphk343CUIO2CMttS2JTAmXttA+RNHstEsmH3r6sl+jv5T/Zxfv+yoJMiT2dbwT1VPi51bWsGVsZdxdLb1OVD2VaQLlfrtUawENnTaqNrO1duiy/dF033YNHXU49KAY8y4lR06TqFons9RxIlsaZINKP0IYREMfd5Fv8YqP09tthTPQNAJxtPXsQhwfpWviRgbeeSl3vgUhAMwzwZnFPEgAqMGfwD2Zco248PUHav9NfIiePrdNcH658MrWF22NvziQ4kJS3jOaVVPj2q9Xh7pEXacRpj09TAve5qu6yMKgAhF4j3kKqgs/GzscOhctRiv18mUiL++Ijix0cG1L38nvCGu5io3xog/Uao4qFXKP/bAC4hQUuIlnqxp84EPEynAQ5/gV5oUpqPcNfdK1a3atYVrvrO163i7kXn8ZfrS3niY0QgXrTxmwbGySP6biqtCC4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199018)(31696002)(4326008)(86362001)(6486002)(66946007)(66556008)(2616005)(186003)(316002)(2906002)(66476007)(8676002)(31686004)(36756003)(6506007)(15650500001)(478600001)(53546011)(83380400001)(38100700002)(8936002)(41300700001)(5660300002)(6512007)(4744005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUZBcDhKcGd4NDc3bTlWZm5nVFZtczdqb2RDeW1FQVRHcWJmbjZpbjdaNHh1?=
 =?utf-8?B?YVROZ0FraFJ4b3owWnBYZ2NQNmMzMS9vcUY5VGc4Q1RFSTRqNlBZZ242STZX?=
 =?utf-8?B?UWYrNE9HbFkwWEZvVlU4TE5XaXJhdlB3QzFpL3N0emtrZXBvSWp2Y3pINnVu?=
 =?utf-8?B?a0ZFUnpELzFSWkNhWlllTDdmNFpIZlJ5dXB5Vitta0VBNWthM2xYY0lFTit6?=
 =?utf-8?B?emxoVlh0bDZpMG1zc055SjcybGkrb3haUEhmNGg5QTJCSEFsb2NTb3pyVG8r?=
 =?utf-8?B?d0FJbFJiTUY2OG55dnl1WXZSd2N2aU0vbElRaXRPem81Yk1FYVhXVDFOMFhF?=
 =?utf-8?B?VktMKzd0WjcvSUxZUEhZVng1SWd3VXIxdHd6ajh1UjJyUEpiWXZYeVFsczZo?=
 =?utf-8?B?Y2Fkd0FMUS9WVzBPZkk5Nk8rMzA5Y3FSemEzUHBzR1FqcWd0VktHODZsWmpV?=
 =?utf-8?B?NnlQam84YVZzQzVmUXNBb2EycU1jeHdIanpxL056M2loVU55UXVmelBVbjVO?=
 =?utf-8?B?YUtMZzJsbmpOYjlDU2RHVHNYa0xxdlNmTXJpTFJLdHdYSjNQQmlSbVJqcjRr?=
 =?utf-8?B?MkQyT2xDNVE4WUV2aisveDhuRm5lelF6UjVnYlQwQ0ZyRk81N1Voa0dwemVW?=
 =?utf-8?B?eXdkSkNvWm1TOG9VdUQ1SW1iMHVCSDhxZ1Q3SDRTdmM0bC9wbms2Y0trZlZQ?=
 =?utf-8?B?dzB0eHJkdFJlbmE5STBzODR0SHBDMEJWM0svR3lMK2crNHl1ZW9iNXJqcFJK?=
 =?utf-8?B?QmNTbVFjbDFnWmJPaHVhaVVyam11bnBoRHZKbFRXWFhYR25BcWVYOE5tYUs4?=
 =?utf-8?B?cWpPTmtkaWJwbUYrRk1xdkZHb0pYVGV1Qndic0l4UWVuWk1IeEVJa2hUSnRP?=
 =?utf-8?B?aDlVQ25ibWpDdGpsaFYyQkFGOTZicjVWdkZoalV2dEJZOWs1TDNscld0M2FP?=
 =?utf-8?B?Q2Z0K1MrcGh2UUpWY0VPbGt5R1pnQXRvQ28zMlMxeld1c0xoZWRJK05UcC9W?=
 =?utf-8?B?R2ovQlhhdDVyTTdvc1BYSEc2ampzdnc4VzhsQzA0aHhLNjFGYlYzSnBkNzFm?=
 =?utf-8?B?QVFpYW1PbG9temZKTjZ0OWVPTHRmNmdsVVpTRkprZkZXVHVEdHlkN1M2QS9z?=
 =?utf-8?B?bVFvNTBkWjQwRWJ1NmxUaE9LNzlQYXE3blRQaFkybC90MDhKV3pyZVhCUWJE?=
 =?utf-8?B?TnUvejhrTVdKRDdQR0phTXJFck9ZekpRNWpHL2JGSCtyaUt1YVNKRnhTYlM0?=
 =?utf-8?B?Y2dJWXhLSlIzSXJ3UGMrQTF0NTRnYlpkNE1NeWZ1Kzk3Y01IM0xjQWVxS3Bx?=
 =?utf-8?B?RkdHU3Bhb0VWMWhlR2NyQWw2TmNPM3Q3VCtKTGswOHZmZE0zcFdmV0VMY1dk?=
 =?utf-8?B?a1o1UUVvS0Eva1NIV1JrOCtYSTlkbWdhemRDaXhQS1dzSzhTdmlEYm1xUkFJ?=
 =?utf-8?B?NUVpMkN2S05kRk1EQjZJRU5aQS9vU2lmNEwxUGlCNEd0UXV3OTNZUEtFSlBI?=
 =?utf-8?B?YmkvRXBLMWp2dUZHeUxNUUhreFh6eFNldko0RXR4bEFkd2U2dG5ZdVI2OHZF?=
 =?utf-8?B?SytXUHJ1RzNuSkF4eFhKcjh4Yzh6Z3FYandYdm5HL3BPbjdCZEtyOGZMSkhs?=
 =?utf-8?B?MFdheVBVaE9OeTVPYy9HaHNTS3VQVUVlSkFNblcyODR6YXBvYU1LZ0ZyeWZP?=
 =?utf-8?B?Tlo5TVc2YVY2Ri9RWHYvNXY5TnRMWEU3UWVicCtnSU82cmVYUXN2dHpJS2Rt?=
 =?utf-8?B?cHJ6TXFwYnpLdTVYQnF4SjEyVm5ZNGh1c3N3YjZkSUV2clhNcDk5czIwRk16?=
 =?utf-8?B?N2F1cnB2TDE0UzI4Z3pseW5OSXR2MGwwN0k2N3lQZjViejM1V2VrSDR5WlFk?=
 =?utf-8?B?ZjZtdXpkc0VNOFZncDRjZVRCaWMzcWVqbEI5K3BXVTM1dlVnVU9sdWxEVmNP?=
 =?utf-8?B?a3phc2JDOEQyVTVaRlFiclNXdEZZelhDdWhTV3o0ZTdmL1NzSXM0NmVTVDM2?=
 =?utf-8?B?c2dmV2VIRXR6RGFuT3laUVhPYnJLcFFEMlA4amdZQ3lDeDhtR1pSOU9Zcjlm?=
 =?utf-8?B?ZndHMWc5MExGR0N6bE5EbVkyZjZwK09iOHlLRUNzMk1NZGFNWU96WC9hbTJX?=
 =?utf-8?B?cUlsdFdmdnpRQnEydVZGRnFjSS9qZUdwK2pSS0lBRnNYUndCTGhwdmFQOW1k?=
 =?utf-8?Q?Hq5cUGYGv2mgiGDenLrNyCZuzaMqrefVq5HciDIuTwcs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59472d42-02c1-4593-cc29-08daff4efc36
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 03:39:53.2358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMewKspPAnI3kxtuCg8wPlrJAlosDHw8Zqw9yCL5+/4wt1r89emiOSR39GatkBVyGkKvHQ/ciSHKrDA3JFWXJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6658
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 1/25/23 03:59, Shyam Sundar S K wrote:
> This patch series includes general updates and bug fixes to amd_pmf
> driver.
> 
> Shyam Sundar S K (5):
>    platform/x86/amd/pmf: Add helper routine to update SPS thermals
>    platform/x86/amd/pmf: Add helper routine to check pprof is balanced
>    platform/x86/amd/pmf: update to auto-mode limits only after AMT event
>    platform/x86/amd/pmf: Fix to update SPS default pprof thermals
>    platform/x86/amd/pmf: Fix to update SPS thermals when power supply
>      change
> 
>   drivers/platform/x86/amd/pmf/auto-mode.c |  9 +-------
>   drivers/platform/x86/amd/pmf/cnqf.c      | 14 +++++-------
>   drivers/platform/x86/amd/pmf/core.c      | 23 +++++++++++++++++++
>   drivers/platform/x86/amd/pmf/pmf.h       |  3 +++
>   drivers/platform/x86/amd/pmf/sps.c       | 28 +++++++++++++++++++-----
>   5 files changed, 54 insertions(+), 23 deletions(-)
> 

For the series:

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
