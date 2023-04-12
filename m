Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D681DC77B6E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 14:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjDLOYK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 10:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjDLOYJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 10:24:09 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C466A769E
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 07:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFDkGRHqarXrv5c8srY5nO8d7Pw5rAb4xvOIg9R7QN11cLI2kn8fSP2Bl8q8NcTtotlUIH82/SIMDyo/VSl4761TiSF56/dL+024NHiOKGxOPPGo74mgujNdVcVvNSI4fJ/3afk+iN8mTjfmcQZfaRaJ2QtL8a3ziOjZFf9WVje5+rxtT0BwI/PQYqrckOSOVRJcRDMqdjNFwT+OVdxYqeiUZhUT7IdH3iKbWJL/lYwnyCCbFSOuPV904zahL0bwmYsEUHh3SkYRcZMo12n3GXwXvYlVh7F26vDqbezLEDgLTXSrbaBO/UN0MH5cFEtLyIZC6qXvoYdqrCjpPTeSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5VvNwl659VSBhqHgSZMVno94KHtsQFDIVJvuwpqHhM=;
 b=Kip0uhnMgO6JOjf3Ko5WexXyd+ib3MxJqtiITzKLsBLKU9RJW6v3+iUHuofKwKOKZUZ0ua9JMK4PMay8sD7js7uRKU5hVaJIrXJW7iwwXiiuFTHMyiuDIg2++GY3WVjRiclA5sVBFTBSOj2Zw35B+Thd3WXxHd73pkRiK6fIYZ4l3JxYQulvIz5mJD97GsYtgppkN13pP/s/Bb5RzEZWpl4YftG+xRMv9dkt8d72IZN17RgmR6KKIpijyqTyc4DCOad6sXU89Fr+6wQJhHbL5LcvvpYevdMErqQFwOsU6sPJm8TsDBQ3M+kShAixywK2C3BX0Luwr5T0ZtPv/d+cVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5VvNwl659VSBhqHgSZMVno94KHtsQFDIVJvuwpqHhM=;
 b=xcBHNxCbejcRi3u7Erwa0YPerCSScVTjdgl8YXLONepcbSBgs+9DN5DDRpRtHLGIxp12z978EZMqqY40OeltO/roj/axzDjKrbVAXy3WGzocdDRadw1u4tne44LKo7fPbtHfat+75Jwjl061wJSkXeKIYq56K6LL0iecbI7SyYc=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB5406.namprd12.prod.outlook.com (2603:10b6:a03:3ae::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 14:23:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6277.036; Wed, 12 Apr 2023
 14:23:59 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>
CC:     "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86: amd: pmc: provide user message where s0ix
 is not supported
Thread-Topic: [PATCH] platform/x86: amd: pmc: provide user message where s0ix
 is not supported
Thread-Index: AQHZbTAjTALgZ7UteEKyAUN127/q168nulBw
Date:   Wed, 12 Apr 2023 14:23:59 +0000
Message-ID: <MN0PR12MB6101DDEDF1410015A35DBF7DE29B9@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230412111500.2602529-1-Shyam-sundar.S-k@amd.com>
In-Reply-To: <20230412111500.2602529-1-Shyam-sundar.S-k@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-12T14:23:57Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=4c942767-f815-469a-8e26-2290b231ebc9;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-04-12T14:23:57Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 51dc39ca-dcbf-4d89-b9f7-7feaa353cfb1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SJ0PR12MB5406:EE_
x-ms-office365-filtering-correlation-id: 9044c618-93b9-4da0-741b-08db3b618e97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NbIJOmc0b0m24ddKITVlFduU64MMRZLJLqRuLI5aX22vWzTny4lReKsfCHPftVPE8nCLQ0v1rRLaLtKj9pdcbPGkVeAgDg6vljIThRfwh1L4SjdSHcCifw+DRFMnkUQolRPEKcMHZbio5NnRKYazQwA0rInI4s+W7Ui11BanYvuVjCdY2CesLOXhxcAVd8Tp2nchP9s7z8O7OB+EQpmndCXX2hItMlLuVGBcVBT5wZB1hCsq8jcPG9oPu8QTD2BAjTZSqjG/4SOqTmhriFJZasQpl5HVuxv+P8uVMwrbD7NRggNvKVHi+v8qGdeRYLfTet3V/90/+apf6/MSZK+gwrko4HikE8bhi6G7vBzl5/UKglJOLT/Cz0UMkrpxlM+S94BavSyfSqZPBUWxH92hw8zUesdnzk1rXoJpnTDMKUL02iOYjya//edNfSUWS3m9yJIyYU+UYunIXLNPvhP+s64n/PrAvpqw4H7QecOJKWY0p0UsoA9S0TiiRaZ9+JOdU3fbj6tSQLmvaKkaLkE7TrsvdIoUIqNxpmB9BTmHSgjlP/3RgB2TkC1a3xqZSO97yUSiL3s/CpGMWXouzvzUaeLuYD2vVhQC+25hiAIGjl3zIMUAsE+oX167z/OIHQjnNXH9ilmnJt1o3u0mord91w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199021)(33656002)(122000001)(38100700002)(5660300002)(52536014)(2906002)(15650500001)(38070700005)(316002)(8676002)(8936002)(55016003)(86362001)(66946007)(64756008)(66476007)(66556008)(41300700001)(66446008)(4326008)(83380400001)(76116006)(54906003)(6506007)(110136005)(26005)(9686003)(186003)(7696005)(478600001)(71200400001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CXqmjru19JGtakV7bNlc1jrf45l/pCMJBvOfDEinZ7ZIwulSiD7eyML9FmI8?=
 =?us-ascii?Q?7fmuVyqZugzfpVaCMVn7G9DodGf5Vwk7kpwZJ1J/22Zj7uNkWOykLXrBBw6k?=
 =?us-ascii?Q?mT9lHavB2ND+9aB2GdnylHjGx/XI08KqNDZQDzOabt+OL2jf0ku0AIuukKMH?=
 =?us-ascii?Q?DHjLDaq5CcrC31MJchqsgYOsT28eI0pChUQzsXb3lHQGQ2QEJVT9I9Owyx46?=
 =?us-ascii?Q?FJQrtJEeDHEXi4wzkaGiY0u/cNn9Ogl0qDC4DXxStnpvGnVmn7Xg45B3huqf?=
 =?us-ascii?Q?ta0REJ+YXHNBnv6Vwmlu2YfgZSbJooN2u8QgyjFtzG7Fbe6ERYy1o4TPfHqq?=
 =?us-ascii?Q?Uvv0ilyQE9ndrerI0lL8Y3xrQj9iyzw/vP88e905m8cAiUaVJD9TaFt3QVai?=
 =?us-ascii?Q?9kSlxWVQ3HbDA5T6zsgch1BggRE6PHQsYgHP6YhcL5uZYHfVFJhUB4gaOwe7?=
 =?us-ascii?Q?LWmLtxZ1FKxkHpzEnkjhj4BAkZTfYAT82VZg6punx4Dkan9zQwzMUzCh78LJ?=
 =?us-ascii?Q?H4LrvmYplYcU9XZk8/V8zBqkX6pWLV2A9MWDG4J3jATiMNQ0YpbQa2YhXMD7?=
 =?us-ascii?Q?0P9KN/lXE+oOKXBxxClQK1PQXBqJtLIfzDhQq2HoxE3Aas6ppy84hM4ZwZNw?=
 =?us-ascii?Q?zAUX8MjW6OtI3YFBJVhyVMwZHcTg9AtipV/CrlBbU4McWFeDgfzByIVp53PV?=
 =?us-ascii?Q?CEf51u+6wWOH3uR7zp9p/qEPYjX6fepCZg9Ma51bI08GWRT4oGT/YJqXTQEU?=
 =?us-ascii?Q?4+KtmWes8lBavG2AUx93eUZwAqoVRA/5SqEvgusdXX+p3I94mioVEBEbA2ZH?=
 =?us-ascii?Q?jZkIXlfT19srS2QnmS93EcXhSPanndaQB93tncYM4WfR9x2OTyuEuczK3KoY?=
 =?us-ascii?Q?73fQuN+Ly1gi6y+ROf3wDVNZDjc3ibgPXK+rhAiLkVl2hiv3R1HRCxXavX7m?=
 =?us-ascii?Q?zPlc0Sc3zkhhTh+TF/kEyttfFXgVL+yAUUJgJFL5Vg7rK7aFedsIT9Iw7Bem?=
 =?us-ascii?Q?9cRzHEKBrs3h8i+QfW40DE2BncWtMPlCAcEaK4fv0npxLweakZBwe7BdVOQO?=
 =?us-ascii?Q?9W78mhvCmiwv5mvR+dpzp2b3Wly1RkypbdUkZS/EkxvPBrZ/WMaQc/94HAxd?=
 =?us-ascii?Q?phBb58ck2/9b2OZrJuuN+Z2/ZJ2N8WlIsPZ4m4DJ0Y1nHzNhSMnq5xkNNKhD?=
 =?us-ascii?Q?ATV3ljcBHDkgIbKWjyjk7uWATnpby9Awx/df423OJORtEoQLHEILGegGWYc5?=
 =?us-ascii?Q?jhdN7dhE9G3oDpx6MJHMhPrA4OURI95H9zRZ4+bFLqucXACCp/4BEh2GWLXW?=
 =?us-ascii?Q?Rs9+e9tX1BfhNaCVdNOJ/1prxXPMljLepCaM/HTGJs/jVHhHjHULBitn+/5F?=
 =?us-ascii?Q?afFn7UsTbLMFTrf9oMXpewRDfFw0KvahKN51XyOkN/hdhF7YszIESGCwfznW?=
 =?us-ascii?Q?/hTRYvN70HRb1w6tF1WyhC3smFa+SvB0w8ZTA2JNIfS2SvsbHXl5aS7AyRx5?=
 =?us-ascii?Q?/oJD9O+smok7kGk03+6Y5ryumSvFaUa5+8ZaVSsWoWhRGMoxT2M5cswdteQ6?=
 =?us-ascii?Q?CB2C94Q3M9DrX8p3ikw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9044c618-93b9-4da0-741b-08db3b618e97
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2023 14:23:59.2999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2WJ0j/Z6CrKwCpU0E3MykrjAlur5YS/0PQxdTWOm1wniC3SRSfBYEQbkHTwu56ikgnBuISYPpigZWeHmNtTO5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5406
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]

> Some platforms do not support hardware backed s0i3 transitions. When such
> CPUs are detected, provide a warning message to the user.
>=20
> Suggested-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> Based on review-hans. Apologies, I missed this change in the earlier
> series.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

>=20
>  drivers/platform/x86/amd/pmc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/platform/x86/amd/pmc.c
> b/drivers/platform/x86/amd/pmc.c
> index bb7597ca334f..3d2a377f4424 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -93,6 +93,7 @@
>  #define AMD_CPU_ID_YC			0x14B5
>  #define AMD_CPU_ID_CB			0x14D8
>  #define AMD_CPU_ID_PS			0x14E8
> +#define AMD_CPU_ID_SP			0x14A4
>=20
>  #define PMC_MSG_DELAY_MIN_US		50
>  #define RESPONSE_REGISTER_LOOP_MAX	20000
> @@ -913,6 +914,7 @@ static const struct pci_device_id pmc_pci_ids[] =3D {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>  	{ }
>  };
>=20
> @@ -1022,6 +1024,13 @@ static int amd_pmc_probe(struct platform_device
> *pdev)
>  	}
>=20
>  	dev->cpu_id =3D rdev->device;
> +
> +	if (dev->cpu_id =3D=3D AMD_CPU_ID_SP) {
> +		dev_warn_once(dev->dev, "S0i3 is not supported on this
> hardware\n");
> +		err =3D -ENODEV;
> +		goto err_pci_dev_put;
> +	}
> +
>  	dev->rdev =3D rdev;
>  	err =3D amd_smn_read(0, AMD_PMC_BASE_ADDR_LO, &val);
>  	if (err) {
> --
> 2.25.1
