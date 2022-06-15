Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50974C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Jun 2022 08:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245500AbiFOIXr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Jun 2022 04:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244421AbiFOIX2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Jun 2022 04:23:28 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2057.outbound.protection.outlook.com [40.107.96.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FA66312;
        Wed, 15 Jun 2022 01:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKYPuuF0NrrNOYL51Zh7easKr7FHf4gb5DbdcZmxDwE4u4XHg3iZl3d3PaBFlHbSgAItdJd/J/pcdGK0zaiN6SRCORFfpnRuhdg8aCbz6N9iCo7fohH67Vtkifhh0ScivcPoFlGY1vSpwMhHUnSuPdZsWaTgJVwv7oDkdXbjBFQn6jH6MJYnjU8JXleoZVo1zr2jN9KwpzfeHwKWZynAyKJ7AwDGlDvIihjkrUf9MCnQ9CPYX244CC+Q2QMcdc8xjcMsTo8CEQ8d5l0klhyIev0q4IueOJI4PGbaQzuOCt29OWF0M71pBUy/xEPjKDkXUPjcGAUzvQca9LoliT+5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wn0qtDsS2BZ30SXs8qXLXCUisNc4t81Sdy7p3Prko9A=;
 b=bVVbde93c7RpYvevAqEYWs/zQ2PoiSrzS/7y5DYFW/tPcNDg1EYIi4OWaPNsSiTxAMOAyL0qVK7K4JVfoPOwlYzyKv56U+sCy9aqYEi2HoAXKCiHeQ/5AnsRxoIu0naoBeNgSrORNQ6WJbIK33yIl9NVJYqmwqQ8pW6zwTHFscwHLrJbr78/yLYBB4pgB65TCrm9GFExPhAHn+t5ibPuper7fYAOC0MAE8Z17wdwHWYDPOlBFJb25BTPyqcKFoGTkMoobooa5gH76n/XhHadd5+CFReaLH/m8yjcLuj3kxJ4dpipQlQZCiLoIn3WMBQvreOd3rkzaxmXTFWsDlac0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wn0qtDsS2BZ30SXs8qXLXCUisNc4t81Sdy7p3Prko9A=;
 b=BNswQ+Jg1mJ0mBfTVeMBh9vPi/sGr6ov2ZaUo4ZjbUbRNTrpfyl5WzVAHqoaJP8HDc8bci4Te3gx0YCpwVvny/cIZJOvfv9KpYmKfXCUFCTKSeN7+CNuKI53GAa/Ei9b6s17dOJdRDeJMbRT+OscJS+cVn66bqzwtw8Xp8OJvTAo89FoxdJh/+5YiJ+t/HJK+Xf4BKeppP0y8sYG9OgLpqviQpioYIsQvPDTXEOaLNpsjT24lDJJCd/8Wq9aQtnSrPJjW/z8tvuF4fwbWkV0K0hCbPFAhtbJZjDmMh3WVaR6OBWOmznVL3yHemhMaNnoFg/TSn3pyKFEQteXWviHug==
Received: from DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11)
 by DM6PR12MB3530.namprd12.prod.outlook.com (2603:10b6:5:18a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Wed, 15 Jun
 2022 08:23:26 +0000
Received: from DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::845:3059:ba96:41d2]) by DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::845:3059:ba96:41d2%6]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 08:23:26 +0000
From:   Michael Shych <michaelsh@nvidia.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] platform/mellanox: nvsw-sn2201: fix error code in
 nvsw_sn2201_create_static_devices()
Thread-Topic: [PATCH] platform/mellanox: nvsw-sn2201: fix error code in
 nvsw_sn2201_create_static_devices()
Thread-Index: AQHYgI+Ehoai/hryrESeMH7968pbqq1QIGyw
Date:   Wed, 15 Jun 2022 08:23:26 +0000
Message-ID: <DM6PR12MB407450E2ECC20A38A456CFB7D4AD9@DM6PR12MB4074.namprd12.prod.outlook.com>
References: <YqmUGwmPK7cPolk/@kili>
In-Reply-To: <YqmUGwmPK7cPolk/@kili>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7decc22b-44bb-4f55-d692-08da4ea8523c
x-ms-traffictypediagnostic: DM6PR12MB3530:EE_
x-microsoft-antispam-prvs: <DM6PR12MB353024F3E1524DB1D2F736ABD4AD9@DM6PR12MB3530.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tLaheV6UZk20yoGsPVNywktVsj8vCZKdcJMMkDM2STFylQqwMH8sTa4fuXA5oefXA8wrGNXSsE04xEq5SJwSzayeO8NhanUsiOrJvjDfDswNBURe5hrRq+2EwXPOHPmVQhzVbTwYjNdDpb2tygSHzJsSae5aeO+EFoYcr9MRd+v5soEJATVE7MLD9BQv56pf3qaQLljEoZLdrkdRof0KYAzH9tUHPsHAaSUPL4F/cmghLCuc6p5fkQKKwpHzsQjmFWTzNSzwaw2L4R6Jk0tBmOMjIznhQQyxVjlPFWoecImsgbttJmyUNKAwbf6gA/ZrmCoH/d3gDkATEYShxsMCUTnCnjsWdb/nIv1gTru306dxl3VwGFQUG8EadeX5khCPSH8Jbv5iZOmOw96YVfLnDjGPgoL1uWgZcNaEsNB1OOac2I20VS/M8jAphNA2C7gm8Vxq6mf7884Fb5/hikkP443a5y7Wl0q5CHNGQuJ6Rosqf1mqfTGI/qovo8JSszTXHKivGdX5Vm3RhSnkiJQzaoqBWKEW8RTxx3lOs8nHLtjZka+0GRTif+Hxjkw3HvkW141GK/mICDcYUq7fbpRh56Xep0DRGDEilsZsd08vWl2TvV7I23oQc4WR6dDssEYJtrFLz30EtKgMqC+jutx/uTdf4F/qGuWiUl0E+D22PSY6IZMOId4DbQ3LqrGrFoyytiYGaD0LAO5WOmFEZDF4Hw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4074.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(7696005)(53546011)(66476007)(38100700002)(54906003)(186003)(38070700005)(508600001)(76116006)(9686003)(83380400001)(122000001)(5660300002)(6506007)(4326008)(86362001)(66446008)(8676002)(64756008)(26005)(71200400001)(8936002)(2906002)(52536014)(110136005)(66556008)(316002)(33656002)(55016003)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kgwVhFeE/PMdrGbLS0TAaVtT3I/FzrDCk+pblkydDtyVGkyIzR+gzCRmI1RM?=
 =?us-ascii?Q?OUpoifAhXbolBSwWrCvPO3V6DRqvcrnRlaW+KPIgNBlFFi9rR8tiTGAObqzj?=
 =?us-ascii?Q?uALdVErpewmaAFR+0tgXgePYRBjFRlLrYeEXhN2sVIo5jaKLRtdUA6g+te1B?=
 =?us-ascii?Q?h+/hu8Ome5/1vxb5ThTucsV8RQhLUFU+lJvrsgM2H9oQJ2EE7pfZuzOaUMBB?=
 =?us-ascii?Q?nHIswGhGmA9COkC7KhlqEvv8li+wQq9LPpm4FlfeakjySwWsVW0AiuRoMqey?=
 =?us-ascii?Q?ETgKLacBIA0WQ5vAap14OZZjfrcJ8j7PX7zuwaz6fnLoWXmyDsLN8FaZMqzd?=
 =?us-ascii?Q?VCJdjfsTqEEk6Ubk60obctQoIg1ZzMgUkbVC49uaWtc+29uM0jVLc4vnPMQZ?=
 =?us-ascii?Q?Rm4diV1DPO/Xy72z797c/yYCoGrrvvnaxXwNHsuIzCZ6nrOyb6cefvQ8MlFB?=
 =?us-ascii?Q?uQwsIDoHJG7HYSMQFJXZCoX1Br28ktbHWIsFv/Cv7l7f2zTGENBrWRnbZG1U?=
 =?us-ascii?Q?WK0ubMXZK/GulnBGwVLS2oUvX4ysLZpxbzszydP4YpNAmRfzjOzp7VXLdWfY?=
 =?us-ascii?Q?lNmci9h5m3uYSCiP6grVgsRqOxqlwJezZdb554Jybhsz+URBwJBv+qbUq1ev?=
 =?us-ascii?Q?8BQI4iRqUy92828t+iUHkp3kypRFgAA+eR7VcIp5vnsToC6kunaeMbyCFHJM?=
 =?us-ascii?Q?TvGewqH+as51XRcKy41mHDBrR5bnQpDdgGdvCl/DEKEULlwincHNCv/nHxkK?=
 =?us-ascii?Q?X5n0PpPr4zt413Fd1kr3UqcCSCopnBaLaZjhRzAl7HBoJFhGA3NWasDKxa9S?=
 =?us-ascii?Q?8pyqayIXYhga/26viVTGAqRvyb4ZZL9U5m/hhcFgcgpwpT8CmLKP2SeUxAGX?=
 =?us-ascii?Q?GVM8BHwSjAXgTLQ69keIKYKVTFaGn0k4RBVlMBQ7MgvWPgTENcZAxAswDLd7?=
 =?us-ascii?Q?syZ5YNsjSn0ECf6oZMNS9sWQ41cthSZTfayX50q84gN5HVWVbtlZOMtvNTjf?=
 =?us-ascii?Q?1rBjhf1ONAVQQm+q3FC5SRUVn8hTrjPQPuI7+boOkzKH9FhRdnF3dbyH7lFw?=
 =?us-ascii?Q?XFekDw+twt3GuzLi4Pwadc7BhLINDpZhECIp6da6sERmwxpyFkE9ch56llhN?=
 =?us-ascii?Q?kcHASqwpBvQuO77yiDuMpfZNcE2NTVjmw0vfkYOEt+mkbZyKAeyOjmitpoRc?=
 =?us-ascii?Q?bgBBqIp72AUHKaXYfJXTEOyYqqDfzqktSekNmDPI/8e9r8mS1QJS1kBXxut9?=
 =?us-ascii?Q?TgSKFU96+PWNDyo5SrxU8/Np6Lk8wkspAMR+60FQwWbu/9AWItqhwsCj/7Kw?=
 =?us-ascii?Q?9nAikgNAPW3mICQvLzbhmWwMR0uAGrFm00RoPI2JRXzUknPSaodVuy6CmCFJ?=
 =?us-ascii?Q?A6XO5oMpSAxfsWjs1vlPeHy83MjfVFAk0F4HQi6WzMtmVoPRVT30XobJ++xJ?=
 =?us-ascii?Q?x4Emqg7l9NCa/FLA6/cREDMVIxU/56lqJjtWz89esaWgoxMUDPoOXpMf/Y8o?=
 =?us-ascii?Q?mo387j4fdmNK1Tpu4CBnFQyoChV2TA7P0RGT/UDGAW9u8ZHCQVxdTDt3uIdK?=
 =?us-ascii?Q?KprD7bZ3RHlTh5BHG+2zEnKyaLNjdHmDJwubRFHl3bfzUnxwkKKxCsO4D3P7?=
 =?us-ascii?Q?JUmfS8hfaW9OurU4xrkASA7VaV9MBhIf128yU2Pz8t0o6uSAH1cZ2AfLhfIm?=
 =?us-ascii?Q?AKExZ2eVxRTWQnIEuKe0OC5iiz56XnkdVu8CB36J/J6y+DEyvwqjHZiLQgMB?=
 =?us-ascii?Q?PmNQdw28eQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4074.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7decc22b-44bb-4f55-d692-08da4ea8523c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 08:23:26.7211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: goJCD4X0YvA74osqOWPQyCKxmdxJueYI+LZbeO6yLtsI3JHDI8P1B1QBx8vrHZJwyq+lSp3yigca7k8t8ty8Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3530
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Wednesday, June 15, 2022 11:11 AM
> To: Hans de Goede <hdegoede@redhat.com>; Michael Shych
> <michaelsh@nvidia.com>
> Cc: Mark Gross <markgross@kernel.org>; Vadim Pasternak
> <vadimp@nvidia.com>; platform-driver-x86@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH] platform/mellanox: nvsw-sn2201: fix error code in
> nvsw_sn2201_create_static_devices()
>=20
> This should return PTR_ERR() instead of IS_ERR().  Also "dev->client"
> has been set to NULL by this point so it returns 0/success so preserve th=
e
> error code earlier.
>=20
> Fixes: 662f24826f95 ("platform/mellanox: Add support for new SN2201
> system")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Michael Shych <michaelsh@nvidia.com>

> ---
>  drivers/platform/mellanox/nvsw-sn2201.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/mellanox/nvsw-sn2201.c
> b/drivers/platform/mellanox/nvsw-sn2201.c
> index 0bcdc7c75007..217e22e81c1a 100644
> --- a/drivers/platform/mellanox/nvsw-sn2201.c
> +++ b/drivers/platform/mellanox/nvsw-sn2201.c
> @@ -890,6 +890,7 @@ nvsw_sn2201_create_static_devices(struct
> nvsw_sn2201 *nvsw_sn2201,
>  				  int size)
>  {
>  	struct mlxreg_hotplug_device *dev =3D devs;
> +	int ret;
>  	int i;
>=20
>  	/* Create I2C static devices. */
> @@ -901,6 +902,7 @@ nvsw_sn2201_create_static_devices(struct
> nvsw_sn2201 *nvsw_sn2201,
>  				dev->nr, dev->brdinfo->addr);
>=20
>  			dev->adapter =3D NULL;
> +			ret =3D PTR_ERR(dev->client);
>  			goto fail_create_static_devices;
>  		}
>  	}
> @@ -914,7 +916,7 @@ nvsw_sn2201_create_static_devices(struct
> nvsw_sn2201 *nvsw_sn2201,
>  		dev->client =3D NULL;
>  		dev->adapter =3D NULL;
>  	}
> -	return IS_ERR(dev->client);
> +	return ret;
>  }
>=20
>  static void nvsw_sn2201_destroy_static_devices(struct nvsw_sn2201
> *nvsw_sn2201,
> --
> 2.35.1

