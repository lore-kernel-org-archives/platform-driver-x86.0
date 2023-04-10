Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01185C76196
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Apr 2023 20:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjDJU0G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Apr 2023 16:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjDJU0F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Apr 2023 16:26:05 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9220A173E
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Apr 2023 13:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBRO1To9lw0S3hpGESTOuRuodfpo9b6xS0x1ncyRj6mkJmyjs9icbu9LVwXZG3eKIOai6ztYA4zf2tmqXWkeFTXtn/gmIjpC8JUnkYYj2YGXYe8ICHyLYxIpaURprvsY4cEznWonJTgYzK9D8iOrUG8iwcaveR374k60DLOY6PLt12m32GMQcrjCq8x+JwgB5nT+VbV/QojjsGx7ERK52NJW2EX5EY9lUqzkalIu+FRUAh/n6xf9QQC/KTcNCsMkzXzF3pfo6NhjavariWwr+2DRP93xaOD9G9ZvEKMvdRRrvq+0ZF+dyXMjuJp10zu5E5MHjgz1i9YcKjx8M/DQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmCoaN37Mlz6tOsdO8qg+AZPkmo6gIa9cqE1eKQPrV0=;
 b=k7Eg5s+JB+1mzGSNGOItpCfMAF4VoSswg0Rv10jFxKjmN2D7Ibv9ooRs0EW9MkYh4GZx+xbpVU6pFpIML4meQRizGuDHuR2nR/ZVFPLQo2lK57EzQ/bEhr9paNFf7/dXZo44O/ZTSyvDdf+wEZWZJAUGwSt4hG0xDkOWqUKt0YdcTzcFpCAgq58Ft9eK02FkVpD3Uyg2R4IimBbNHS8BXX4bNqxBipq2OYDiiATYYfrr5AbN+Rs62fNcnoiK65ctl/mhOfLaHtrIW3gnOCispgpC54fpWNG54XCusChZeH+s1FAG8rZSVX9aL+mREZOJogqFfooohGPrI3pYSLiUPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmCoaN37Mlz6tOsdO8qg+AZPkmo6gIa9cqE1eKQPrV0=;
 b=BLENZtcWD1BZ6uQmEVuT6wWhMmKZ/DJGYQzHUtOItSUKpRG7Dco0dfq3THyFx0L9CVeE0UuSPsTsn3NFLy4mN9Mz9SxLHrKFBTqjYkfVwNT6eqI6wZQig7pWfOM3egPESt07+LxO91sqo/UjhQoGBUF+HcyO5RKGXtrP/6PUH6g=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB6461.namprd12.prod.outlook.com (2603:10b6:8:c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 10 Apr
 2023 20:26:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f4d:82d0:c8c:bebe%2]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 20:26:02 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH] platform/x86: amd: pmc: Remove __maybe_unused from
 amd_pmc_suspend_handler()
Thread-Topic: [PATCH] platform/x86: amd: pmc: Remove __maybe_unused from
 amd_pmc_suspend_handler()
Thread-Index: AQHZa+OyXSIUmSbR7UWPwHMWLlwZxa8k/W/A
Date:   Mon, 10 Apr 2023 20:26:01 +0000
Message-ID: <MN0PR12MB61017289753C3AB5336A040AE2959@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230410193512.64232-1-hdegoede@redhat.com>
In-Reply-To: <20230410193512.64232-1-hdegoede@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-04-10T20:26:00Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=b666c9d4-67b2-463e-8291-055366aea4eb;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-04-10T20:26:00Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 7475e3d5-ad94-4214-902e-e81f99d370af
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DS0PR12MB6461:EE_
x-ms-office365-filtering-correlation-id: b93bf711-a1d6-49fc-0d04-08db3a01cd7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199021)(186003)(9686003)(71200400001)(316002)(26005)(478600001)(110136005)(86362001)(38100700002)(8676002)(4326008)(66556008)(64756008)(41300700001)(122000001)(66476007)(66946007)(76116006)(66446008)(7696005)(6506007)(52536014)(8936002)(4744005)(38070700005)(2906002)(55016003)(83380400001)(33656002)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93bf711-a1d6-49fc-0d04-08db3a01cd7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2023 20:26:01.9494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HRbfKqdDmA26tycAP6H4YlPE0J2mAZBFKaWDHG9tMrlOhIS4gHiIV3eTz44yT7dHZ5iUjuAsBU+0/7ssrBdvGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6461
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]

> Now that the pmc code has switched to DEFINE_SIMPLE_DEV_PM_OPS()
> the __maybe_unused is no longer necessary, drop it.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/amd/pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/amd/pmc.c
> b/drivers/platform/x86/amd/pmc.c
> index 2761e9b76e95..2e2b99b93df7 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -840,7 +840,7 @@ static struct acpi_s2idle_dev_ops
> amd_pmc_s2idle_dev_ops =3D {
>  	.restore =3D amd_pmc_s2idle_restore,
>  };
>=20
> -static int __maybe_unused amd_pmc_suspend_handler(struct device
> *dev)
> +static int amd_pmc_suspend_handler(struct device *dev)
>  {
>  	struct amd_pmc_dev *pdev =3D dev_get_drvdata(dev);
>=20
> --
> 2.39.1

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
