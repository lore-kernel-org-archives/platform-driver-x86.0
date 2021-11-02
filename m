Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169EEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 15:34:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0B0460EE3
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 15:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhKBPhS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 11:37:18 -0400
Received: from mail-sn1anam02on2046.outbound.protection.outlook.com ([40.107.96.46]:11971
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231543AbhKBPhR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 11:37:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UORrpQrQb98fa2b75FyLQjKvyPY2hNfLKxnoQi9peIH1WyxlALFyWU9IQatJstDMSFDLKnOXfLAVM/xR0MR7wGjNmJtcwhVBVzW3nciY22Wqwiz6NwgMY+FBQyRmG+/zLs752YqgMwZKE8gKh9h10KZbFyQcFEauO5BSuAcEa9xnl1r0AKEFr72aj1u52jswtf85HctlIpbwuWEezKdAgiJWXrG4LL/MKZmnCdehLnOCCltFhUy9EpqB6XtATnynKhbG2yRrV6ZBXtEl+CfH1YOXISMoTKCjb/jqOrS5froDIR3Dy8su1ZAtNQsvXaG+sIOjgXq0adyAUmqCeXuoeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5M7sRgC+NvzitbaYaDLeFcpl2DaEa6CdlACXb3z9EI=;
 b=gYdOK0IQ2tMzYxVvAZ5uFef3nkLr9UF9ey8YIZYX8YpVg/j+bFMRme5R+7CF2Of2Il9GchjXP2WkUZ9s0i+ZYMa+k1BLWuh+qipx/DvPVysSqzrob6neFx2m/BLe2P/YkIRBqjAQA9GnkxYFEOJlsYqtQyVVgCDEUuWwVSv8r+51fPGZFu5uxRB+jIsrCvmeDje95Pqr+WEqvri1Olrsl9ItqdQvkrUpF0qkqmZkK/3OzJHNQVetwy4j4pB/3q1dCC3ng0PTmZbMsufpCkB/qxd6zaFG5MB8WPq4HxxYUoTluJN4dLIk5lhxkmP4v4fDGn7bWFKPL5HBA2ufiXPuEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5M7sRgC+NvzitbaYaDLeFcpl2DaEa6CdlACXb3z9EI=;
 b=kxMU/gMqWiNUKHFXbSJFnD0COgdG/t/9y+t+Wh0AqLrZ72jz5a3H30D0bMYFAzYmkMu8wRVkpsfJXKb5buaWMjIcpg9tDcb30GVzJQdLMjKuRnDa3aeHS/JiLX1LTGluYE5QGou402zKM7GJk/tZUaprdGkWxGR/pYU0mrHfDb8=
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 15:34:40 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::7cbc:2454:74b9:f4ea]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::7cbc:2454:74b9:f4ea%6]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 15:34:40 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: RE: [PATCH] platform/x86: amd-pmc: Make CONFIG_AMD_PMC depend on
 RTC_CLASS
Thread-Topic: [PATCH] platform/x86: amd-pmc: Make CONFIG_AMD_PMC depend on
 RTC_CLASS
Thread-Index: AQHXz/7uuNueMrxCi0a5ouai/f4106vwXiXg
Date:   Tue, 2 Nov 2021 15:34:40 +0000
Message-ID: <SA0PR12MB45109B2537EF33879EF41CFAE28B9@SA0PR12MB4510.namprd12.prod.outlook.com>
References: <20211102153256.76956-1-hdegoede@redhat.com>
In-Reply-To: <20211102153256.76956-1-hdegoede@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-11-02T15:34:39Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=961b0906-950a-480c-b172-f8f98ea38763;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a4413b4-b9d1-43cd-026e-08d99e164981
x-ms-traffictypediagnostic: SA0PR12MB4382:
x-microsoft-antispam-prvs: <SA0PR12MB4382B3652ED52E65921F2C4DE28B9@SA0PR12MB4382.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RjKPKpsuJItVIAYgzIEQ/xtzitQiwVLHulSJo5rry1Q1tE26TDk9BKxBvVwK12hibCbJy7chup1Oiw9GOTNe0HYQbK4QlNa0zrOHQtaZxzrb/i3Ocvfy6t4uqv40i8nJDzptcXHsfyh0AEpFzzcYHBdOktyV8iHXrGO2Aa0oPP3hBPR/jTOzj0LI1QDYNS4utx/fhibieE+agBQ2fLIoTYhe0aGOPuB+2YEUgd2l9RlrgFzaRN3LGKddxx2oOjSyFQeu3KJcbw10uE/xpT+VjNC+8qebOxWrsZH0gfnC0dascYoFatq5rM5q6R7SCDgTfq+8IocWwaWoIuX1bAFaOqqAiVL393nBS2oEc4EY+njjPSt1g8N1eVCtWEWAel9W+55gaCzFSB+EfDxiP/s2A6/N+qXvn5yvK0K5q6MI/Bk196gQ3MwPnwlwBE0u4ZbCZ+MlkoSE8Dt3kH5x4/a4ESCXhapDvZfgAbWDTZ+8KdU4M+5Gz5+VZqzyw1YHJ0V2qi165oUzdm7QcW9V0r0znfc0uuEluRB0e1M6Bedzi+l2xWyWH6wGQ4sGYRAxkHf9y2EWkUHqlr8Do1ctL7anCsHGmFEOIdKy4XO1clZQTBjDQcH6TvKcSo/tYhC4vPSysvk8hcat5g7Y7Ox76FVt1bRtUnRqnn16wyUFtw8+OvLOXRuKsBQPGxfptZFKFTbHumA8hjcNr27hDoXLSlIrhg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(66476007)(110136005)(66556008)(186003)(86362001)(54906003)(9686003)(2906002)(316002)(55016002)(66946007)(83380400001)(5660300002)(7696005)(66446008)(52536014)(53546011)(8936002)(8676002)(6506007)(508600001)(64756008)(33656002)(71200400001)(38070700005)(38100700002)(122000001)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GRoz0CjRYywR6CC2jHqKA3rrW19lFcTvRLlS3sLEC6CjhG17rKZjLzwahGJE?=
 =?us-ascii?Q?soSD9aA1n0Wtxwym55J3PeDDMRnWbc/KJeffFjMoYmTqlD/ILf+KHuSxoWeC?=
 =?us-ascii?Q?pfuZz1ULI+w5Of9zC6GZHrxh7XjvqFwwKSBhUzaVRKYblmDAsgAoaN/bpLab?=
 =?us-ascii?Q?wM5O5z46Es2wnIzanEYYW//pJyELROa6WvPZn7o9irONj+ffGs6G7cDPk8LR?=
 =?us-ascii?Q?bT7k9KK+6jkE2Ye1/e4axTXQS3FiGW/aTIeKcR2iVxFGjGsWxbxGU5jEaZxS?=
 =?us-ascii?Q?2b2lIyTHRnre/5cE7JJ+1L+SF+DimYf/+JSBcBlhxZ/OcRker4lXov7xVKND?=
 =?us-ascii?Q?AS07G5gQe5y4WJL7ZMdMOj8oFHb9cLb3kdEnrnHCfGWDjZAEMKtFHXopH++f?=
 =?us-ascii?Q?plZdCUHZtYyiHt/zCJGg1PNHZnJhmqyXLulTYZLyQnLN3L0cD/1kwKCe8LOe?=
 =?us-ascii?Q?dIRj6wWC6xEuUqG2qkGGD1G/pJg0zHkjSkEbxVAtDdwMeavxysOsuVOzJkUi?=
 =?us-ascii?Q?RUwLKmLRe4SyUl7bN9iTWFyGMk/awrqHAwWUw0wKodSAd1M/SxIjggsePLnD?=
 =?us-ascii?Q?0XAP4xyYw5x0nQEBvahu9K7eerDm05/I5GK3nnIVZx5aP0f5MbM2YvxURqKJ?=
 =?us-ascii?Q?hFruveVamaCussZwnjd0IRddzU8PGKW5XEFKWhCGscs3s/JchYlcI9Uu4M6N?=
 =?us-ascii?Q?r4l5GRHylvLJm2bjS0fLz48rdfji/EcXKf7FZzQS2gCfvOtgUYSpV5sOmAbb?=
 =?us-ascii?Q?buGslt/D83pdk9shY6Isq1wge4OMjgBAKUNJDtkcsciEYXBJQWk/A20k8WZn?=
 =?us-ascii?Q?zsUSMeBoQdiMNITO1mEhbNxR3EJda+Ho0Bh2LVU70RUcW4hAeUshj7i0p7kG?=
 =?us-ascii?Q?8pKxcMIpDOUYb6MHRUO+kCwrZ+Wy04y4Z2p3xhRYnzs0+fdpE/YZRJjOK9Eu?=
 =?us-ascii?Q?ApifvZbjji7Wex374S7m91/wWkW4cs7nkFjJfAoKQZGEeLuhTDlxLxyEln4y?=
 =?us-ascii?Q?3yM5YU86Mg0GAjGS/i3mzGVSIOnC+fUjkf9xRq1F9Wjbm+NpeRtV0xVX87zq?=
 =?us-ascii?Q?GBYG+HfRf/Z7x+/apOYre04oqwmyLIFUrOddjq9O7y6Vr0ngXda9UTNJnADA?=
 =?us-ascii?Q?AceHnlQA2SowoI96R6HQskwxisZtR5I7cpv5/LvNUVOlxfZLElPU5bXOkLc9?=
 =?us-ascii?Q?rmjJbC6S6wNGmrDV6vLThipB7oxiqolafuJ9afPV8bBlbLUyP+3Q9VRIHYhv?=
 =?us-ascii?Q?QJTjSXtYWtC8yNXgOgH2aP+xR4VT7o11gqgiND0KEWeiXLH7XqIG2kIQ2v1E?=
 =?us-ascii?Q?/F+gHpz2p3RYcwyhcwJQPpG24dyN5zXpLXUUNld00ECGlt3X+yabQTlIIQSk?=
 =?us-ascii?Q?sBAxaJOLzntUQ7JVxr2+GYLnaR764pOKp6xrayJFmHrU12cuwSEff14AzIx+?=
 =?us-ascii?Q?8VSt82Mb4xN6DJFsOWXXnJcDTdidfX1gxf+V+plkHKbe2XkzpislXrVYamzL?=
 =?us-ascii?Q?x4g4GNtxmcOsylXV+KWRZB0ZebaQGKs1qt66GyskOkWsDll+SyB58KCaSy3o?=
 =?us-ascii?Q?08ss+GupSSFWr2Ij42CYZjUw/BA7b9+Qjh/JY2UkghWh59xeif+9ASocw1Hi?=
 =?us-ascii?Q?BT1BlYi94nsppAl+mPeJdLbEw0BMdiQCeXowXD3jArZHYJKgl/+Z4uGmFQtr?=
 =?us-ascii?Q?O1XZCIQoieoNg/bjUwVlODiB7qI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4413b4-b9d1-43cd-026e-08d99e164981
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 15:34:40.7783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ru2Wzeb86khkg+qQAjRLkiUGKjfnFMjoRnxuvGDyL3TtQ+uGjZmnbWpdCauMw9MIkRmGZk9TiOqVj3YpR00dVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]



> -----Original Message-----
> From: Hans de Goede <hdegoede@redhat.com>
> Sent: Tuesday, November 2, 2021 10:33
> To: Mark Gross <markgross@kernel.org>; Andy Shevchenko
> <andy@infradead.org>
> Cc: Hans de Goede <hdegoede@redhat.com>; platform-driver-
> x86@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>;
> Randy Dunlap <rdunlap@infradead.org>
> Subject: [PATCH] platform/x86: amd-pmc: Make CONFIG_AMD_PMC depend on
> RTC_CLASS
>=20
> Since the "Add special handling for timer based S0i3 wakeup" changes
> the amd-pmc code now relies on symbols from the RTC-class code,
> add a dependency for this to Kconfig.
>=20
> Fixes: 59348401ebed ("platform/x86: amd-pmc: Add special handling for tim=
er
> based S0i3 wakeup")
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks!

Acked-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>  drivers/platform/x86/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index d4c079f4afc6..7400bc5da5be 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -185,7 +185,7 @@ config ACER_WMI
>=20
>  config AMD_PMC
>  	tristate "AMD SoC PMC driver"
> -	depends on ACPI && PCI
> +	depends on ACPI && PCI && RTC_CLASS
>  	help
>  	  The driver provides support for AMD Power Management Controller
>  	  primarily responsible for S2Idle transactions that are driven from
> --
> 2.31.1
