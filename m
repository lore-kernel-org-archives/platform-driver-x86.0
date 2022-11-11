Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087D8C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Nov 2022 17:30:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbiKKRaG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Nov 2022 12:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiKKRaE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Nov 2022 12:30:04 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2D713EB7
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Nov 2022 09:30:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHffEBxLKmwKaUFIIeiZlEeqJDpUVtGwWt6oDIREtirzfcjLlo+Fx/LbWAYZ9vnnMwO2rs+9/IXf5JrK/rDo4Yw37kj+aLyHpieCtRPUKBKe55/cdSGCeaQlUXiGqKLSwtiTh1PaQheFvhRfFNBCnAz3+4IFDxbZlgy5JGCIGHUOArG++G1rnfhRvoYq63o140O4z+uOiMXbAwr2/EHcHqOz35UuAsBhqxumVgt86e7t6o0MFj1w3nIxg9PG/KsJQezGgbaV9ic2nDRgKVYYk2rh0JaaDRPhMjYucERTX/mbVVwDIN63Qz9mHsxQdcNygAtfZp0zmm9wsgkG8FZAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P143hASx8BS9bk6JEFp4fmSRsqA9NsfVRrQS4fuBYKQ=;
 b=citTx9pXZfV92JlehrQ7jg/BM7tWLkpvJW4Tw4GyZnHachRB29na+S+q/RGsSWnl6zSK1OLk7qSX/6sI23WA0ZYqMIxG/RzbIHO7iCaZ8DpuCBrCx3Hp1d0l8kmHpGHH5mDPkCFcU+ABJh4eFxwP1+7EyATqA058gQV6FKsjT4wGh7gS1rYXoKglH1UPflbucK5i8VabggJIMafj+uTTdGp3kIsfTZ7NTTj4GKYDofeqFgQhp76QHfO0uRPUh4M9kzcYo7K+PiCviEnMZQure2RJgOJ2gt4f14WPPa7U4c5KcXYKx7ybBBSZWBCdds80oahEk/AlLoMmYw4810jY2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P143hASx8BS9bk6JEFp4fmSRsqA9NsfVRrQS4fuBYKQ=;
 b=JrPP3Pn4W6KJFvD7e6r40Y7xpl41ZJG/CV4GXpLtlFh7Rxl2KaXjvEwJvdhOhk2mxVxbGv+S9gHeh3EC2wEYqLSSRWYOOytjfhXeICc71obaCgBAwwiAAwNRMXNKj+E+K3uftYlOsBNQq7mOwk4zbRUqU9XZY+1sMFvS+aYyLK4=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB6929.namprd12.prod.outlook.com (2603:10b6:806:263::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 17:29:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::44a:a337:ac31:d657]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::44a:a337:ac31:d657%4]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 17:29:59 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "markgross@kernel.org" <markgross@kernel.org>
Subject: RE: [PATCH] platform/x86/amd/pmc: Add new ACPI ID AMDI0009
Thread-Topic: [PATCH] platform/x86/amd/pmc: Add new ACPI ID AMDI0009
Thread-Index: AQHY9BYV6duaVivtZkWwZOHPaL3W/K45/UMQ
Date:   Fri, 11 Nov 2022 17:29:59 +0000
Message-ID: <MN0PR12MB61017CD9A9AB1AEC409D5EEEE2009@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20221109083346.361603-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20221109083346.361603-1-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-11-11T17:26:24Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=0423d9f1-8503-4838-a2bb-6a1949ac8ddc;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-11-11T17:29:57Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 820b4dd6-120c-4315-a386-2b442733f9a0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SN7PR12MB6929:EE_
x-ms-office365-filtering-correlation-id: b87711cf-31cd-45ae-0c34-08dac40a5bb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U6JKghYKVXdA2w3h0TnmQsfOlxcCL8ibdcX0SkevWUxnJafriWZHSBUHY4d2l4dJS+bH1QgvBlMZSzDW1hRPwV/qv0wcmjptrx8Ex3Qny86ouflt6LktUJ8g3WOClqgBabJpC1avBmiFYIoHlkbSjn53OPqItvdb7IFoylrSCss0SX+Www6n+MOllu5mMrtr2HdHcbLt/OwLY060hkgGg99u/BfQPWww6sRZGpeFMa3S/965nO8zzKlcclz6ls4IUkb+FCf4AqId4UKpRj+cR6agJrNRUB5oF5WivyHd9s8YvJTiNo+VFhyxHn/F02HFmNyqtTUhJgAJVY90Ivaog4lYEDBcjg2Ejygf2GxpcTPHQpGhu79oWFUcZIfR7DQYNt5zVuZftoTzVt1yrDYhjY653LKE/+8mgblHFLvv0o+fz4OgZzfvoSFxt/yNUKOpuXql2Mb4fAEKidRnQa3BnN9UePbmd1TEjuz2hfCM/zn2G0FCtSmEqRzecYky2vEerv2hiNcXE7mBWSTE588e2TY2iUQYGXxP5x4tqw0n08jLhJgR27O1U1riPNKHot4/oe5BzWISfYeLNLXSnNVDcMRPRoyPJNVIpMCciGCwJrvgXfF0ZfxcNY2psBF7b7zi3QgTQTq7Ry2Q/MRgAkEPGmAlD1SzplyYn/lmI3ORqD63jZpQBLX28HYLCMF3ysH5ULPfb4q4aBEQ/1Kb4Sh7IbvwBiVc6phe8SW4LAGrJmbABNcwYrIQ/cMLWyqIIIdA7h05diAblsuz7Mc2SDVeeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199015)(38070700005)(33656002)(86362001)(53546011)(55016003)(9686003)(2906002)(7696005)(26005)(83380400001)(186003)(122000001)(6506007)(66446008)(38100700002)(8676002)(71200400001)(64756008)(66556008)(6916009)(316002)(66946007)(478600001)(54906003)(52536014)(8936002)(41300700001)(4326008)(76116006)(5660300002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oOZZ76EZsocawtzep3yYt5kjwDWhemMZDSsoW8xDhbgx1oNEwyuXIR/0iTbu?=
 =?us-ascii?Q?lPfzkPR1XbYNCjOFPaeGqmmwXwELPEYkPVQEiTSuw9A+o3y0t5tmPscYB506?=
 =?us-ascii?Q?bZj7cBBHWbhRL23QBERotTuL39UlXiAu6TF9Rwq+SZ7/QuAuAr5GzEC4Qdtk?=
 =?us-ascii?Q?OiYw3Gl5/r27/+HzYHRsYgMiEfkmtXyNWHkfiWVkQJ0ldkxFBGttv3BUHDDj?=
 =?us-ascii?Q?7s8H1ilUJyrce984Djdc6Tm4yYXvyc1gUsXWPpCzC0WcOf/29pLHglsNDXWS?=
 =?us-ascii?Q?p6js3OSia38qSEtw8MJj68HfM8p1zNO9hPrpQLRQmPysPsHpES9m5s+EJJJ1?=
 =?us-ascii?Q?x+0nzmJW2aTzXQQCwfRJ/qBWtJ7+fBhSbgfMHV3KGN21+dl0+LOwVvbT+4Cy?=
 =?us-ascii?Q?k6/6soluyrSIkNdrY4FaU5o7vlpeqh0eopv3t5iT6ZYTaGQgjTG3h9Ooffnt?=
 =?us-ascii?Q?W4HUIm+kFTElc9jh+3hkyPHHK4Z/8E+w0x8RrvcAgv6vp4T+8OEC02GPSZAr?=
 =?us-ascii?Q?hekcbeH6r+cqjbky1K3Z2MMFXzAYeHmAkPoF1isYU0mi1hbEcegwR6F5lMY+?=
 =?us-ascii?Q?ocCKGHwUPrlLl120klezi2Uxp0DsFGWw1B0I7Cfgjmd1EHrBR5amU1AW+oS2?=
 =?us-ascii?Q?s0G/sbhQhvCWl3QZlSfnwsBHaMahhZdPbK9nBwmirsLpNv63Sg79W8Oses1D?=
 =?us-ascii?Q?qAc2vzsDqwxbGKtsoyOQP4joKA2J//qv3aKCRWU4K4w8IqT3505tffaabMVj?=
 =?us-ascii?Q?gTMtEDpWxZ8e49T0unhd45M5hNGIdfQqgJkIdaQz05Y3sKjsNUraxH6QNLEm?=
 =?us-ascii?Q?LREKTvj6MYc1Vm6aa9i8YUZQ7cKPqNqR4VTCIlDwSI53zokDPChMu2cxhzSS?=
 =?us-ascii?Q?InSEjbgotDIiNCJq5ATvTCg5uHCWXfaNn0RUx48PqB0qQmMVJm0pUc6A1mGG?=
 =?us-ascii?Q?tWVdiTGmTSW1NLH3jc12gFa5dT3165Qkoxn6Mmih1tZ5MdgHBZG0XGafbOVH?=
 =?us-ascii?Q?Foh8XDykBF8bkm/+yQxRAUC270sJ4aTWhX/1C2DXPAgMAmj73DGQj30m5khq?=
 =?us-ascii?Q?7ZQs7DqDhTpFnZIQszJypCt3IbKzW0+5v6E9bIBuauOBPpM/9pTkxVKI0pUD?=
 =?us-ascii?Q?jROHS9J6X8t5m49Wv7JdBg6/tu2l7CTz10I6jdnCatUXavWoHgP9O6ZKHNAX?=
 =?us-ascii?Q?5u0pk/MeTwVnP+UMbm75zckAlTmdk6NQjK45UjD45slPMdF95f2oBEyps8aq?=
 =?us-ascii?Q?8ReUravYNFdx5OfVjBFivwn2bWl50j6uhk/Ws75/SKH83HNutqwogppeXkQl?=
 =?us-ascii?Q?QEZA9c/35QRGQEWnMIDXW1E/H0eD7db2AKV3Yh9AHQtSo4RO5LVSSiC82BNe?=
 =?us-ascii?Q?BpLMSpxKK9SUaxIzkiSgLw2zmvkRdXQZYhcAdUdPmnDMecuwnLdKLU39n2rv?=
 =?us-ascii?Q?5sJMU2wlFFKXnClOw/YeaxNP2Tu3NJYs/YOHLaXh7PDKxYXne8M9x3qQd73g?=
 =?us-ascii?Q?WmqduUpMDyhdowFECI4NDsUBMYSkbFH6Ho+D9l+DqFmDhIQRLk1a6+/lwTgX?=
 =?us-ascii?Q?zhjX+5nyuHO+Ntl3ktY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87711cf-31cd-45ae-0c34-08dac40a5bb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 17:29:59.3226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vzifgGOs3nyz85BI8GUEhkUmCVfzEwJHzAnzpwH2d4SUpUX8RGCQGabRrPN/KEiKKVJykgdxT+9HtoTkOet3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6929
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]



> -----Original Message-----
> From: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Sent: Wednesday, November 9, 2022 02:34
> To: hdegoede@redhat.com; markgross@kernel.org
> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; platform-driver-
> x86@vger.kernel.org; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>
> Subject: [PATCH] platform/x86/amd/pmc: Add new ACPI ID AMDI0009
>=20
> Add new a new ACPI ID AMDI0009 used by upcoming AMD platform to the
> pmc
> supported list of devices.
>=20
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Hans,

As this is just a new ID it should be relatively low risk. The rest of this
platform's enablement is in 6.0, would you also please consider to take
this to:

Cc: stable@vger.kernel.org # 6.0

Thanks!

> ---
>  drivers/platform/x86/amd/pmc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/amd/pmc.c
> b/drivers/platform/x86/amd/pmc.c
> index 96e790e639a2..febd798d1fa2 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -964,6 +964,7 @@ static const struct acpi_device_id
> amd_pmc_acpi_ids[] =3D {
>  	{"AMDI0006", 0},
>  	{"AMDI0007", 0},
>  	{"AMDI0008", 0},
> +	{"AMDI0009", 0},
>  	{"AMD0004", 0},
>  	{"AMD0005", 0},
>  	{ }
> --
> 2.25.1
