Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C23C77B7E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 25 May 2023 14:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbjEYOYw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 25 May 2023 10:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241078AbjEYOYv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 10:24:51 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6172F189
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 07:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKsWpG0B1X1UYLXj1XX77C1xde4EEMW6Kmo9zc0078mkXPw34pBo34Sa+TDhsQdnU+Gl/y8YoHizQw8MqLOakpHMHzvLU83ffAnf/JUQUuyxdlaY6CL9GGmV8kGMUsJty2CIoZHFdSjsCfRrToOseKR4LbV0CMl38fPmTY+6qI/mV3LmE9VoWdQmsxRkeH+9kyy/QPS/a3j6EaAJzJ12gG997odo2VCDvyzojxKNLcgK3AMBcEeclmtJoV2jlpywktcJsEmC6AdLt0zlPklVY85fWiZzozVGCWSpuYepnfLesOQAknsqT+K0tOoHahkfgcttUM3BJUwv9OkrzXIv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRSK5TCNapjcMm0bU8nKPfqSqZv4ypWPUFOUifrSWlw=;
 b=gBLkgFCDvXeHpaDD4FXRdBWoGy30PasvO+tfV5SmMKDW+4H7otvuDOCIHkzlR1RM3gZyAJFH1HuJEecTZGagY6rczsYkSQgMzhOK5Rs5KhjwGAMu637TQGqRGx9ImMky/DsEqEwvKmdWH0xad1fuOu35hrboASOT6MT1GWMEEJa6ys3ETr03nk+aPfzmN89YmArNvGecb3A1E5BniamZFh5a+sWjXFNf2LVhe5StOtHIa8jO7+PPjjA86iTUeq+4LrzcD5U0yb58ADov22cOWeavb8w8zz4rl5Rk8IAwvcGlRwWyAZPWxuXineXKccbEnOh4JJX7vxMaxq7nr/CyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRSK5TCNapjcMm0bU8nKPfqSqZv4ypWPUFOUifrSWlw=;
 b=Tt5ZLYPY38yrD0KRJGl1eFdoysiFZrkIieyYMu/zcrBkUH4BjwiFcffm3+Zsy13WUkh2yyO1Phduos1kueki4UrapnNlwQTTCHGcHqM3KLnDvRrmUdkW1gw6RphXDT6ejpHvuwqPnSyetM7gdcnisUxEWJ1DaU21cOmIxcdc4PY=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 14:24:47 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::3f45:358e:abba:24f5%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 14:24:46 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>
CC:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v5 0/4] Updates to AMD PMC driver
Thread-Topic: [PATCH v5 0/4] Updates to AMD PMC driver
Thread-Index: AQHZjxP52PtE0ko6/Emy5xvl4mNOXK9rCwgQ
Date:   Thu, 25 May 2023 14:24:46 +0000
Message-ID: <MN0PR12MB6101914CE87B150D61369F92E2469@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=6d88b744-1354-4675-bcd8-07f860390a2c;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-05-25T14:24:19Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SA1PR12MB9001:EE_
x-ms-office365-filtering-correlation-id: 16bb8200-2604-4558-cca6-08db5d2bca7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AcgPtuA8eSibMHF1cxN+zUtfvdh0WPqkUpr7Ht31yqN5UyCJgMe6o1qG7PwIFwXbJ3/NTNTTZQNZMJq2QbZYRzGe17WQRZir6KVmHtZLnTcq395S8Q4ywbxZihGS9v8xsO7jrIAnTvCS1k50Y3CVPuGWjAYI40ULuTZYeR0PXOYPYgRskKQ+UUK/tDPVxvBcvYlHxN4lpQraRvVd98PwSc7gnpAfgPyb7wwZcM/Ea9G5mZkCJ9GncoCJ0PVd+DlUC60X7yIGWN/05lMqHM54vRNrz/wLjLdtEwszEAr2N6Tp/cB3dc43dkWnPHAfBgM3VFOhLfP9BUDhTQxvAnrLtayp1ZIMOgvdqCp0qgPzZgRkzy3pvLCdXGaIgoZcF8cI6bAAcgHy9NbQoRUtXkxngPAODGvMtp+yYRfwHGakh5kBjv2EVDWC6GYkVLjj2P+veZrWYpi2HpFPX8pYaJ4puNoZZzOxC6j7Ol9kME1UWw8RVdZ9rM1UcmZ4+gXYpgZWgTlIBydOu0KVPkOs3vI3/n972prNz+u4EgXjJyquIUNtrKyNZ6QKF5WQGsXfGjawt89UBA6jb8YkXJ9v60q4VxIj0/uBSbFk6GL6zDMPeyTglMVeGpK1zqxQgq6biahl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(33656002)(4326008)(55016003)(86362001)(8676002)(8936002)(186003)(9686003)(6506007)(41300700001)(26005)(53546011)(110136005)(52536014)(5660300002)(83380400001)(38070700005)(54906003)(316002)(76116006)(66446008)(64756008)(478600001)(66556008)(66476007)(66946007)(71200400001)(7696005)(122000001)(38100700002)(15650500001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YT7hL/UvIutkWZnRHNVU8Zy1JQ+G/bB3qtetxKUqQz0LNa5T2hSPvnl2MYpp?=
 =?us-ascii?Q?WKdeVtVn9FbDSJEUABLC9JTHpBNXdbnlVzkoRxANmyxFBJk3v7f1ZDKODxky?=
 =?us-ascii?Q?A1KwP3VezMFLseiVIjZQkSLo0ulQqoRZF0PnfynsF8f1g9JYdvclguop+XCk?=
 =?us-ascii?Q?tNlWBDiRR7Azn0yyTWDrvYrF0IRYGU9uYhbxHN1wzEAlegf+zu35+hVbWg2z?=
 =?us-ascii?Q?Sk33Re5Xx6QwNfKDsqbnDQFJ1FueOUFbh7dFZpavqZv6lh3QyDTlKhx8EACy?=
 =?us-ascii?Q?bVKO0HWtR2NHNoQPY50kdWIZowXrjkTNDys3khwwz/XddSDrDWX/6+BsrJMT?=
 =?us-ascii?Q?sp6J08c+RJ8r9SGaTimZIkaSjUwmo6jW7cyVqB+lgcwShhJXRxiT2rabrCaL?=
 =?us-ascii?Q?BCF6XCat6b86yUkcOulClW1Mx/ngnxYqKtmm220h0bIq4uc6t9pIfCxtiFs8?=
 =?us-ascii?Q?7PLh/86C23Zba2B7Ahg00EAvHndPxHKxbCzJZPkmUWJKU+DVLQnCx9yxXR0h?=
 =?us-ascii?Q?ohR2WmnV1e6joA9NbgESfxJMSqEjmQBtdLYgY+ng6Vjtump3/XhhNW7H2l+P?=
 =?us-ascii?Q?TzwNbuToFI3tXcO+E3ozEMh1zywaegsiOk3OvX+wEXtlT0Iz80OcPAR4TDoW?=
 =?us-ascii?Q?nc1QHQH2XK9/l1WRNy5RWT9I90tof11tC3rKjZDGeVhQBN9N9yhrFj/eCH2o?=
 =?us-ascii?Q?dPS8JOJ84MmyXCzoBnvTRCIobY4QK8kq1NilAmfout8Jwp0yx9g8uuukDlmy?=
 =?us-ascii?Q?P9pvvtWYiolKxiwt+A5NtH6kN2T4OJRtr96NUWG5EB6kFhDSgSX6uI2ecyra?=
 =?us-ascii?Q?+pPDYLseWKigJQE0fL29htll2lG5nRU2cbTeVurto5EsUApmjP+6Z9Qc9v52?=
 =?us-ascii?Q?pjN78qdmboJGGor0T2oLJObXypKZT5Vj2IQI9BBA0zyU4lxM+xE1DOAcNt48?=
 =?us-ascii?Q?JnokTprExniJViXOvW7qZ30ZnJSRJ0Q9m2gKBmZhyDDz+j9bGt9n4Ojol+AK?=
 =?us-ascii?Q?CTQnkKeBvMsjemyECCEVGTvJOjkdMJHDKWmr4EQ5hq81iViAkRXHRwNtVYu+?=
 =?us-ascii?Q?hXWoyVaYTEMNQx6XzUMB+twwIkVJySWFfr8Rp5ES4VrnFauC4rmmpLbcjTkL?=
 =?us-ascii?Q?WRRhtkVq8Y6EHsNAu84pUn2Y+7Q/ahux57Ivf/leMcOhpCGxErPhUorm/wr9?=
 =?us-ascii?Q?lzXIaGZrwja7XgiK+7rTkZOgESWHfH0KCz6Mi3vRHukwfnZ7i5zKi+SDrxrh?=
 =?us-ascii?Q?JroZonvSy4FZrZgCVdX8pf2qEGOqSAoqbH0qGZziYpIxTdA4BbNufyNPITlV?=
 =?us-ascii?Q?0O4NanGPkiQ6gzQkzvZPoJ1qXABbk0bJhX2mYyK4Co+52E871SgH9pbyMd3u?=
 =?us-ascii?Q?c9JZjEa5PaRtO+BmzlSDuvqzDUFLi6H6ehWQFgtgb7SFuwdsWrNwHBhVjf8E?=
 =?us-ascii?Q?PlUXJ1wcPESauBNPGJgfwcSp1boi8KdYPjZHU9ZVy+2mrxZlFTADc32KsRD8?=
 =?us-ascii?Q?CdS+8yqFE2GyYfiUD89/oHki/1L1u/L3q/7pM3IIdj/qyQ1ezd4CVyrP66I/?=
 =?us-ascii?Q?+dQNtatkW5j4Vivwo7A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bb8200-2604-4558-cca6-08db5d2bca7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 14:24:46.4891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcy6IKEcddDXqc1h+Rg0AbsCggYKXLDTENnGc23XT9kosL5hs8upm7AHlF4NFrxsXyEmdVWH3kSMlPeac8TF7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[AMD Official Use Only - General]

> -----Original Message-----
> From: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Sent: Thursday, May 25, 2023 9:19 AM
> To: hdegoede@redhat.com; markgross@kernel.org
> Cc: Goswami, Sanket <Sanket.Goswami@amd.com>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; platform-driver-x86@vger.kernel.org; S-k,
> Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Subject: [PATCH v5 0/4] Updates to AMD PMC driver
>
> Series includes fixes and feature updates to the PMC driver.
> Series has been split into 4 patches to incorporate the review
> remarks from v2.
>
> v5:
>  - Change amd_pmc_is_cpu_supported() to amd_pmc_is_stb_supported()
>
> v4:
>  - Based on review-hans branch
>  - Address review remarks from Ilpo on the commit-msg and function names
>
> v3:
>  - Based on review-hans branch
>  - Pass true/false instead of 1/0 the amd_pmc_send_cmd()
>  - Add helper for supported cpu id check as suggested by Ilpo.
>
> v2:
>  - Based on review-hans branch
>  - Add a switch for cpu-id check based on feedback from Mario.
>
> Shyam Sundar S K (4):
>   platform/x86/amd: pmc: Pass true/false to bool argument
>   platform/x86/amd: pmc: Get STB DRAM size from PMFW
>   platform/x86/amd: pmc: Add helper function to check the cpu id
>   platform/x86/amd: pmc: Update metrics table info for Pink Sardine
>
>  drivers/platform/x86/amd/pmc.c | 123 ++++++++++++++++++++++++++---
> ----
>  1 file changed, 99 insertions(+), 24 deletions(-)
>
> --
> 2.25.1

For the series:

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
