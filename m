Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D6A2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 18:24:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbiFHSYS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 14:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234407AbiFHSX3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 14:23:29 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56834184870
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 11:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ljHACL/RJnp/GyRzGftJE0eg/RzU4cKVesGBTjBq6NFDKtQdpi2RpaeDIuDMuy4xbFQNibfeE4chZZzyAkvKKBKqgsJ+YBH6HFerWLE3tCT+Hsz8OUUqd37KbiQN6Ti52rHpOh5nocF5mRiLI7qiXf/wVVN4CLOJcNBv4C5rCQ9PambL6fS/bp8ykcVWFsJGeFkOlXkHrRFXYBIXIz0DROJwtOcafLHhXUuIdlRq/we1yJcNrdmyT3/SICqf/JHBi/MInjTlRKHHFvDNWZl5BD+wkfbgje0ewL5BoR0MFCG1EcIBH5M04qlo1xYojM4gcP+eHsnQzJOvee3BvSLwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GamuBdZM5RvQ+du9vcLS61SO1OxHWHQzU0gzeV0fdWE=;
 b=CK5tM8KYt1M/CqHIfYvCXw1iMVfw7eUmWmubOiH/SDstlM9VIdtijufKNeHJNL39CICHqHtNqEBBcTYLXyEARJ/RbTgYQlElo8ldFZsA6va8ORJLyZOa/PoVO6o2bYuK70O3BsAFCvtcsYQ/QYEYtIGqENo8AiDoQEiPop/TVJOqMbgLElZbqdJP0OwGnHIjQKBT7NWO/K6ZEcWWdLwCpblHK4mAn79k1VSRqXfncFSxaZkTxvK2UESevXtjZiiokTNzJNz7wOXGD1WZ5sNwjyMEhSf267PH/d3KMwKf+nAB52PRjobR5XLUx4LkdvVydR5wnEiFBnX3t4WfPN3vLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GamuBdZM5RvQ+du9vcLS61SO1OxHWHQzU0gzeV0fdWE=;
 b=tv56WCdnCM/r+MUDBiOl1B0J8tNQcfZW5Angl6t/bdCfUEJ/kBiceUx0C9Gw2x7im+HvdImAeC7oE3nKi4+qpDV86aKpD3nl7pJXXc9dJ+nl408/vbd/iuWj38ojXyFh6kmSvQ0o50D+ELq32JBxDp7A5teFayScToorDVqs2PM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by MN2PR12MB4029.namprd12.prod.outlook.com (2603:10b6:208:167::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 8 Jun
 2022 18:23:24 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::d2:aa27:39ac:5fd7]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::d2:aa27:39ac:5fd7%6]) with mapi id 15.20.5332.012; Wed, 8 Jun 2022
 18:23:24 +0000
Message-ID: <b4c7ae3e-d0de-a278-6be4-f5ece95749e1@amd.com>
Date:   Wed, 8 Jun 2022 23:53:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] platform/x86: Move AMD platform drivers to separate
 directory
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Naveen Krishna Chatradhi <NaveenKrishna.Chatradhi@amd.com>,
        Suma Hegde <suma.hegde@amd.com>
References: <20220608061703.2664926-1-Shyam-sundar.S-k@amd.com>
 <CAHp75VdRsK9dVJgDkzJnzfDPJR7xgvK2=UdAg4zr6Uf8pHPc2g@mail.gmail.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <CAHp75VdRsK9dVJgDkzJnzfDPJR7xgvK2=UdAg4zr6Uf8pHPc2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a42119c-e5c4-4ad9-2601-08da497bf981
X-MS-TrafficTypeDiagnostic: MN2PR12MB4029:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB40298D25A9B2E0C7D5664CB89AA49@MN2PR12MB4029.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z5F1osdBeiuUhCy93IY6rtWxhoIZJc7BQ7fVGsgXgmYz/0MKXXY9SRuAgkaR0B93pdVORQVoBQSfDXItnQHnYj48ooruAAWXUyYNoeNSgMBtNqtO/ZPuG/RKpPc87lYPil/HzBrAEDir2DkLfioILWDH9QZMZBsIAaEKGg0y4ieUl48DFiKVnccGg5s02cttsttlISVIH9rBODxIF9AbswWJHyz8RPH2o0wfXBlCU1sumtbvTPSVQvVivnjIfmBAXl4N+hwuqi4TJIc8GPgVOcNizJnGR9HkdypEAS+uIdqjlts0rooKfeAMN8Tw2SmDBvbBNp20jvVTmZMv7oRQUcTecVw3piGsGgtXZp/pWaRY1xcRIb0uFsJ6xS3zn1i72uf2r52ZmuwJPucEWduiXpkyFNnCcP3iV7ZTyarGIACqXbk7IvEJhVEJfdfcyPkPza8iWOXrXUF1BHPCvChEvmjwOOpepZR6CWk21gNLXmsjZl5421GFgSo9sWZZohBfbjOPPPiQivGX5hqO6hl375/7Bygpx2lzqd8RnIdpnBLwUO5QmvFLia/NCtg14KzWzAwwNoeb+aGVojp3ShZhAHl1QVqxiptJ1kavocYy/v2RXBNLmCHozwgMH5KzBzQVwudqiENoKhgME36D0HXgxoN45YLb1gNbVZtojaBXCSLkslTsTqwqvSRFLGIIJGphVT7wN8CUQV4NLmLn8MzJm+emUS7KtcuP/gOJvd2ZAfk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(186003)(86362001)(54906003)(53546011)(66946007)(508600001)(66476007)(66556008)(8676002)(6916009)(4326008)(31696002)(316002)(8936002)(2616005)(4744005)(2906002)(6666004)(38100700002)(6512007)(26005)(5660300002)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFNNL25ac29CQzVEanBsSVpueEhQQWhjczFibzFETm5pSHNCUE4ramVPZEI3?=
 =?utf-8?B?ZVBXTXd3eTlObVRtcmwzRlpkNndVZDhYbk1sTDlZcTdheFo1cnNPVFpYQVVQ?=
 =?utf-8?B?SnRVSjJoU0RGa3Vrcng0V0dEQUppbmRlVjEzRVFtTTV6bXlTRGNQWTdEK0tT?=
 =?utf-8?B?V2VSbzgzU05qY0hGY2FFT0JDTDBvbXlNRTlLbUhydHQvbW8yY21RanIvUXNF?=
 =?utf-8?B?b1VtRWdkZFZCODRtZllMamlWMkI3UTU2bE9kL1NaUisxaWtudlFIUSsvY1lH?=
 =?utf-8?B?ZkRvOTlDTE9TOFBYVDM1SW5JYzNoZ01PNDRHSlpVSW9aYjhFRHN1c2w3b3Aw?=
 =?utf-8?B?Y2FFYnprOHBhTWtPVGpaSm1KczgwVk12SGpVKzVHRHdsTGk3OFhzOUVSL3BR?=
 =?utf-8?B?cFdhRjRpdDFXc2ZYSE5mbkhMY2FOK2ovbXFsWGlzaGlCVWhodzVVS3htMmIw?=
 =?utf-8?B?c09pVDJuSDltZmxBMjZRMjVqKzFXalRpaVpuYktvb1dERkk0bWJIQ0kwbWtm?=
 =?utf-8?B?blgvQ3NPdXJlbDBHVkhadWVpVDl4d1I4TWc0ckl1MG85MHZOQ2hDQmJDa2JK?=
 =?utf-8?B?SCtROS81SGJFUzZOTHc3eVV0VG83MmNXaUZaM0ZpN0x3TGRKb0YxZnZsMjgw?=
 =?utf-8?B?YkxOVTNPU2ZiRlllRDJSdmFOV2lKT3R2NHk5YXptb0NKSDdVc0RiNkxHOU45?=
 =?utf-8?B?MUtlSmROWlJzVE02RldUSzBDQWtHa0hEeWVXNlBGY1FLYU4wNEx0S0tGZ2JL?=
 =?utf-8?B?bG1ncjVxTVE4MEwzU3RBRk1DMGZ6NCt5TkJRamRONnUvd0tSUXBPNnhiNG1n?=
 =?utf-8?B?bUhVeUVvR09xRlNhcmtBUUg3MUdtS3VGdUt4c2NVOTBCUXRreTNVejErWjcw?=
 =?utf-8?B?d2doTnNTcFk5eXRod09ubFpSN0lTLzY3LzBsV1g3eDBlVzNDcTJnWDduZVZC?=
 =?utf-8?B?Sk8wQkJscGNNcXZ3YjA1U2FuTVQ5Yk9VemhhVVNETmhUN1QvZ3NDSjEyVVJL?=
 =?utf-8?B?MUUxYk1keUF4b0J0RUtMOUZrVzcwbS9UTE5LZUd4L0hrR3dGZHgzRU91bHRG?=
 =?utf-8?B?dXZiVGo1aFRXSG5NeVpZaTEvL044YmVPOU5FNGtFOWlaMStNNWZjZEQwMVpk?=
 =?utf-8?B?UUVQZFVrakFVSmIzemR6Q1dJTGd2YmNKV3ZuRHVhU0ZtMTJEdW9iWVdlcnlx?=
 =?utf-8?B?TVJuM3psMm1jZEp4Yk5SODg2UHdJRDZyc0p2LzhiZURlOHM5OUM5dUVXNVVE?=
 =?utf-8?B?SDBDNE1jb1FoMkJ6bmlxK3ljL283eE0yczFaRXlpMnlXSWRHTGkwSXRqMHJ3?=
 =?utf-8?B?ZzFFRUllN1RaSHZkdUhSRFdVQWVsRVV2U3FvbmkwVWo3TFNSTmJsdGEwL0x5?=
 =?utf-8?B?bnllRWx5RWJxSnQ5bTlMSm02ejZmNXBTNS9NNjMxVE4rZEpJRTNaVklaK1dr?=
 =?utf-8?B?TFFIVnMwNFgvWDhKMWFtUkhCeTZBcnFhV0g0Y0J3ck5iWHhTaHZhWUx1TDVW?=
 =?utf-8?B?WFQreVpBUE4xN1F2ZzRUK0F2cStTcWNkT0dxakptU2xWZDVNdFE4SWtud29h?=
 =?utf-8?B?TmJkTEw1TFhmU0E0MUxOVjlDTVlUZkFpUEJBemI4cWxVQmdaQURPdExENHBj?=
 =?utf-8?B?MTVPajNGRVhYTEl1ZEVoL1F0N1paRHQyUmFsV0RyVytpM1EyV1FnTzU3UU1B?=
 =?utf-8?B?TEh6UTd5QitFZVJidW9CYUdRTXovT0UxMnVwbTZ6VExqQXF2T2tnYXpWRmh0?=
 =?utf-8?B?UUFrMTU2bmNUVUVsN2NBV3NkOFozdE96MFNuSWowbHY0OUhqejRXUFNvSmFw?=
 =?utf-8?B?ODk3ZDlmSkU5d2hPQW1JSzYzeGxDdVVkUi9qN1dPa1gvb3FnMDBUTEU0eUN3?=
 =?utf-8?B?YjZtRnhCQkRFRC9ESWx2Z2JDUTB6aXBXaXZFb2FqQVZWM3duQlV6cFBENmJI?=
 =?utf-8?B?Y0YxdnlKL2JWRGEzcnVsbUM2UTlBUnduNjB2OE9tdi80T2s3Um9raXBub0V4?=
 =?utf-8?B?SXJlYWE2M1A1V2cyRHVGMStlUE50ZGxtb0V4S3R5N2thbVBDQmM0bit2UTVN?=
 =?utf-8?B?ckYyV1IvT25CeFpOczlhQng5NG9MUTdxR2FxUGE2SFFMWVpjUWM1SmZEM0hy?=
 =?utf-8?B?OTlzYmVRWmozMSsxeEZiZU95Mks1aWZlT0YwVjF2UjZsUElnZWNHNGhISHJC?=
 =?utf-8?B?TkJjWEozRkM1TDdrSkhDbEdRbUNZci9CakZrQVVsUyswS1ZGM0sxNXVad2dQ?=
 =?utf-8?B?Z3hZeU9XMlZFNFdBS0dOYTRIRE1IWjJzWkVZYUpHNHVaUnBueVZ5Ulk5YnJF?=
 =?utf-8?B?U2xmeUEydGJsZHZuYldwRXJNTFVUSGQwdDlZTXVnSDNtZXd0Q09EZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a42119c-e5c4-4ad9-2601-08da497bf981
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 18:23:24.5747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ik//EKSjEIWN+cc549El1205vElcwfgTSxruv5yrFEwj+GERZuumJQX4bibyy1ZgnN63ESXeV0HaIADpk1rwBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4029
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 6/8/2022 4:30 PM, Andy Shevchenko wrote:
> On Wed, Jun 8, 2022 at 10:38 AM Shyam Sundar S K
> <Shyam-sundar.S-k@amd.com> wrote:
>>
>> Currently, AMD supported platform drivers are grouped under generic "x86"
>> folder structure. Move the current drivers (amd-pmc and amd_hsmp) to a
>> separate directory. This would also mean the newer driver submissions to
>> pdx86 subsystem in the future will also land in AMD specific directory.
> 
> Can you use the trick that allows you to drop the "amd" prefix from
> the file names?
> 

Thanks Andy. Sent a v2 as per your review remark.

Thanks,
Shyam
