Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEDFC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 00:55:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17D0061930
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 00:55:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhCVAy1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 20:54:27 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.116]:26088 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229613AbhCVAxv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 20:53:51 -0400
Received: from [100.112.133.80] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-west-2.aws.symcld.net id 1B/A8-48750-D9AE7506; Mon, 22 Mar 2021 00:53:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSf0xbZRTle++1fRA6X0sZH7At2rFMpu0oDK0
  Jy9Q4UxNxxikTp2kf8qB1pTT9MQrJSJdNWNqJzYTgKgwYHQqF8MM5wHZMWRlbQdwoJLbGuY0J
  tEhAcboADl/72NT/zrnnnnvPTS6O8m+yk3DKZKB0GlItZMdghVtCHFF96IAirdfLl45MFkh/H
  a5FpJ9dzpLWTXcAqf+oC5E63bPo82xZv/0njmzlGyBzNS4hMtviPFu2MDDJli31bHmd/Q5Lpc
  krNilYyj73d4jWJzAt15xEzKBLYAExOJ9YA9B/o4rDkFkAff47bIZ8iECHr3tdWQWw7qo/ogD
  iHAqr7bUchlzB4PyYeV3pAtC6vATCBCNcKLx3yoExA84gcChoQRjyM4CtNWdoTzTOJrbD0LeT
  Eb+A+A3Av7+wRfwo0QjgxFQrGu6KI96GxyvHIw4BkQv7J6wYg1+E1Re7kTDGiG3w/tpCpM4l3
  oW2mvMos64Fgf3mURAWoond0NsTviqajrsR/uVtj5hRIgEG7jZEMCQI6HB/jzI4HganHrCY8y
  wANjvq15uEsPKKjcXgzXC8wQoYnA2d94c5DN4BfasX1wdlwaGZRjodTuMU+GCwlCkfgrec9zA
  byLD/J4ad7kKJVNj59U6m/ASstt7m2COn8eC103exRoC1AWmeTlWoNBSRKrVIkpYmkkjSRZKM
  TJHk2TQxWSbKExv1ohJKbxCli8kSvVhfWvS+Ol+soQw9gH6yfG1lWx+YmVsUD4JEHBHGc2uDb
  yn4G/KK80uVpF4p1xnVlH4QbMJxIeSWzx5Q8Hk6qpAyFajU9Ks+lCEeKxRwR8IyV68li/SqQk
  byggzcFqw/i+Ke+nNnUT6mKdZQSQlcWZBuJcKtSqPm0aCHbz8ONifFcUFUVBQ/VkvpilSG/+s
  hkIADYRz3dnhhrEpjeLQvREdB6CiLaE44ioH8V0oyI10VL2CBqjlF2ZOtbxKPey6N5nQGkhOr
  5NrtTVtfhYfHUg9ZSE+7Lp7ET9RQbwQy1QO5H/X6X/oDc33i6fk8sy106UjFhdqFl3Xpe/dtO
  37+cHWfbGAPa/ea65eN3paJkl03V8XyH6dP51xPfdpAXt2Ufcvd2V7nCzRIcvfsNZ2MKTPtLO
  5gW/68/Nyc5ffkrB+aV2ZGhl8h59B92UbPaO+dE48lOqmvunHD7NblC9epj1uOECkftD7DM86
  ndKiPNs5gu5yV3rbkKTOXN9WUWF7wqfi193THrh30Vq3wrLIGt3yDY//+5vgWlbJJXj59jPKs
  jt146mBFH+JXBENfKmOHhJheSUp2oDo9+Q8H51fScQQAAA==
X-Env-Sender: njoshi1@lenovo.com
X-Msg-Ref: server-11.tower-356.messagelabs.com!1616374426!89357!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8516 invoked from network); 22 Mar 2021 00:53:48 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-11.tower-356.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Mar 2021 00:53:48 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 02AD65E7217678423E2F;
        Mon, 22 Mar 2021 08:53:44 +0800 (CST)
Received: from reswpmail03.lenovo.com (10.62.32.22) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2; Sun, 21 Mar
 2021 20:53:43 -0400
Received: from va32wusexedge02.lenovo.com (10.62.123.117) by
 reswpmail03.lenovo.com (10.62.32.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2106.2
 via Frontend Transport; Sun, 21 Mar 2021 20:53:43 -0400
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.56)
 by mail.lenovo.com (10.62.123.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 22 Mar 2021 08:53:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuAk+Uh8KX2eyPENCqWcqafd+fOi7jyDreBNUOnz/LjMgapLRQNxgE0cDKEuFh7YNJUKz8TjUjirSF8t/5dTMIqA5jt0D6VWTXhntOwXTfwDkgmWTOUotyYKl+Z3hMYUNdrrUfNUWO7pBVsCtkrPRp/KnjYXiaU7NZ1/XWUqK+FOhVgG/CgVEvFKAAIdkwR7WmfsjVN/UXI0ExPrewrWDdP4XooUcM6qXG04EfciCvMrdYZtC79AiLNMaOWxtvv+xqXE+FkcsKd+bV2Fvj+XssTexfq/jhutCRaox16EfT6MST31KZr18lk8pgOSipXuaaxDzXs1X6LBV9gLL0+D5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6or2n7H+gTwaR9rfauYD1VWsPRFjofOqE2VB0MYjFc=;
 b=ik1w3UMx+mO7hJ6IDOLt8g//dxoNlIM8pbNEvaThhcfyIr7NbwXao45mNxMnKYnHmDuoVntJQSeluhyr0DsxeQTXermUpx7Xq3BuwtwwQ5OVrOPt+1KqlzbVIpm7acBIMqnfOkoyWh9udy3e68dpYPsiA+eJVaNC8fnfuRZOvSwyNZYnim8TVcOTag914t1CET8VhvYqooL67/oioZJPu+ESAZaaojwsy7b8Bye8i3NKNSScBY5t0UjPqs/xktGZ16Toolo46oNWHNl0wyocj+eASVbGOqdxyaqTNB7+U7SlXSgSrK1J4WWp+dtmt9/p1J1eghPUKXvSUI8Y6I4T/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6or2n7H+gTwaR9rfauYD1VWsPRFjofOqE2VB0MYjFc=;
 b=sYbHEWmPLLIGStJGcR005vldsK3gztK0A08ArUK2nwXXtDMIsTLz4cHhF6zuU8+Zl6pwwqnnbgzt/CIn9oMDaKFBMUYFfViiMGeI5SaTqJtf/oqjfHFw2z1g+AeBA6ghnv71MtJIjqENsOD79R/A3CBSjrdZtMjgy6uH1mvaxtE=
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com (2603:1096:404:3f::21)
 by TY2PR03MB3263.apcprd03.prod.outlook.com (2603:1096:404:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9; Mon, 22 Mar
 2021 00:53:39 +0000
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::a0e1:86f6:bc8f:8f15]) by TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::a0e1:86f6:bc8f:8f15%7]) with mapi id 15.20.3977.019; Mon, 22 Mar 2021
 00:53:39 +0000
From:   Nitin Joshi1 <njoshi1@lenovo.com>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Mark RH Pearson <markpearson@lenovo.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "Esteve Varela Colominas" <esteve.varela@gmail.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
CC:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [External] Re: [PATCH] thinkpad_acpi: Allow the FnLock LED to
 change state
Thread-Topic: [External] Re: [PATCH] thinkpad_acpi: Allow the FnLock LED to
 change state
Thread-Index: AQHXHDMtRNsEjYElGUiAQROxEf+fs6qLHLhggAAS5QCABAKCUA==
Date:   Mon, 22 Mar 2021 00:53:39 +0000
Message-ID: <TY2PR03MB36454496E484AB8FEF5B15AE8C659@TY2PR03MB3645.apcprd03.prod.outlook.com>
References: <20210315195823.23212-1-esteve.varela@gmail.com>
 <7fcaeb12-35b1-242a-dfd0-02324643c34b@redhat.com>
 <18ee74c0-85d9-6a1a-67f5-82682878001a@lenovo.com>
 <TY2PR03MB36456F1A3EFC9C31A865BF498C689@TY2PR03MB3645.apcprd03.prod.outlook.com>
 <a7d7b03b-1053-56ed-15eb-44910753e8e3@metux.net>
In-Reply-To: <a7d7b03b-1053-56ed-15eb-44910753e8e3@metux.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.164.25.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a05820d-47b4-4ca2-8320-08d8ecccee96
x-ms-traffictypediagnostic: TY2PR03MB3263:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR03MB326365AAC9BD9794A5D361938C659@TY2PR03MB3263.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fRgH9OciO88wQ0+6HGNYQ+i93hIPLQ7CR7eB8NpT3EwsldZ9AJo9NSYezOA3BvzF5+0oZY8a3eS4YA1TeeDeSQ7ACNpGrR1NGLwWWKwwxOmrZM2zEb8zRqNUGUKB/sXWFdVX32N8kkB5DbN/nTZOauuNo6EM8A+aQzD8KKvAhCS1KK1uGDIjG80Za7htW0V6uZyH9/WrI/kVHtMY9QsX/NUf8cBKsPwkGqJf6hv94SqZUQCRBVLVmrcm12ZdDO9MgwhByCdDCEfATgC+4BwIwU250Vnq2Lz/OOlqPyKpoTTBA6hVbqaDo6eyRppeTfQVQZbbCXDsCv12bOHfpjzVf0u45Wh1Nnoj0UiFlId0DcAPEbkuvae/IZeTEbPNcshT0jUDSxg02eDtHB2yBBm7JTbdxGJ3uooGTZVRCJ/kG77hlelPqRHgY1hBoBdO8yK6B/28kVTy2yzKhkOebGxaAqy+rQ15zxGRMDO7OpQQx98qZVCQqLWfAkYZEOKfBTYdC2X4m29fcdWikXg6CegyCNtnugV+UJkd/fqHl7A2kDwWGxDky4pIMqSPDUvMBB9+hSRomtn/+g2FByNZTlr2biwKXWsPaBWXxohaUUM/01ey9KJrf18tLjYw6X7wEpNgpFkMH7xoqm9Jhifx8HCErBE43rQoEUgpM8zjI801erJLGj/6nxc6DUmBKNp5ZXJ5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR03MB3645.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(71200400001)(66574015)(4326008)(5660300002)(8676002)(8936002)(38100700001)(110136005)(54906003)(478600001)(2906002)(316002)(6506007)(7696005)(83380400001)(52536014)(86362001)(186003)(9686003)(66556008)(64756008)(26005)(76116006)(66476007)(33656002)(66946007)(66446008)(55016002)(2004002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cU1VUFdPcm9naHhsdm5nRXJVQS8rSjRieEJPWGFLZzZGQXh4c1F5RlM4THQr?=
 =?utf-8?B?QjZGUHAxL1RXUWNxbG52bVp5QS9RS0JZVVVGQ1NPbjNJYmI0Q0RWNE9CVWpt?=
 =?utf-8?B?NnZURnVsMmMyL0EzV3FIdmtlVjZlazRqMEZoaHlMZnlMbFJmbitzb3NvR1Nt?=
 =?utf-8?B?K0ZJMVB2WGNZdmliZzhyU1QrVGJBSGFDVjc1VFYrdUdoaHZGWmE4SkdiN0lo?=
 =?utf-8?B?TWV5cVpGUlBGaU4yQlJlNHRKMWV3bW1sUFdVai9NSTJDS3U5Z1ZJUkdaaUhj?=
 =?utf-8?B?Mnk2MzFUUFV3V0hlSXlhbDk4UE5XS2lkYmlkR21qMC9iM3lSblJ5THJFQkR3?=
 =?utf-8?B?UlZVWEdMbEY4d2VKYjlaclAxNk1LbzdueVAvWGpPZXFJenBwQWJHQWtheDk1?=
 =?utf-8?B?U09sWWRuVnFocTliMm5PSEIraUJUSTBVQWxWVEtGSkVBWkdveHZUbzE3dG1a?=
 =?utf-8?B?OFpuYllVcXJvOE11ZmVrTDgxRHNEaldPRU03RlQ3L0lOR3JlYzNDdmxHc1pQ?=
 =?utf-8?B?R1VmR2J0bnF5UmhTYms4c0FyRkxBVTBnaFVVZ3JDSmhMa0pYWDNBdWthaXZG?=
 =?utf-8?B?eTNZVnBibmdFMzI1S1hBZjc2TC9nMmtWR1RrN21VUnNPQzhmaGloZVBVNk1S?=
 =?utf-8?B?Y1oyM1BkejJVeXBPRHBwT1JoT1puc0hack9BLytLOWV2Y2pwMnVMLzZjV1M3?=
 =?utf-8?B?NnV2WmN4YWx6bnVvVVJTVG4ydm9xYzJ0aWNjSlJhL2hVTW9mbXo3aDlDazZI?=
 =?utf-8?B?alJ4bzh5VXNSZU5Lb3VxbnpLdUhieDVteWdaVmZ2bUxvRndpM0tYclE3UVhq?=
 =?utf-8?B?SWQyYTdJL0VWRVhGcUlhMDhLQnZIZlZKeHhYck45RFJEaDhyZEJaYTFmTWdy?=
 =?utf-8?B?di9ZcExTRmhJYWJRcDhJQnJtdjdVSmdEL3FlSm1MSVMxQTVGNk82NUNORDhz?=
 =?utf-8?B?K0Nnb2ZYTTNVQmhUenZzSGE2bzFJZERLTXpLSUZmaVZCeTZaeHUvQmdBREVw?=
 =?utf-8?B?bnZoR0JQallaT3pkRVRLS2FPUVJsblVvUkZ4QVpjQ0FCVXNON1ZvNVErNTRt?=
 =?utf-8?B?N1lJOWRKVi9QVVp1c1NaUTdQWEhuZFpZVS9Zdkg1Q21QWW14TktpUFpxcmNG?=
 =?utf-8?B?SlRraEhNZW9ueVc5TWV4dmdlZFc3SWZtNG1TQVZsUjgxSXhySXZNWDhLY2wv?=
 =?utf-8?B?M3puZUVXWDgyZWhjVzVsVjRyNjlZSU8zczBTNzZabmh2MWxmZG8wNngyNHFx?=
 =?utf-8?B?dE4yS2U0NUhvTWhDbytsRjNSZTNNSTJMZWJ1R1lTdkc2ZzRha1JwaVpzZmlo?=
 =?utf-8?B?dHVHbmU0ZHJGOGs5c2JseFV5VXJVMis1SzZJVW5CdUZpeURWOGJTM0FhVUdV?=
 =?utf-8?B?V0NDaVRudVFQai81U2dDYmFReHU5eGNXMFhtOTN6Q1hvRmhJcXFuSmdVdnB4?=
 =?utf-8?B?amRiTkFra3ZUd1hKMnRMaUoyRUR3ZU1Zb2loenpiVXhTcEpja0ZFVXBwMlVS?=
 =?utf-8?B?OTdHdktqYUUwaGtsd0cvcXJ6Z21tV01BdmFXZmJrNWMrVE9FWnppSmhoZTk3?=
 =?utf-8?B?RHZhTHpMNkpSc04zTFFUazNQU3JwbXoxQlB1Y21VOTlUVklJSkdkdWtuRXpo?=
 =?utf-8?B?VFhQWUdFc3lBWFVVR20yVitHbTEzL3QzbVN0U0I5QVBCOXNacDBMK2pzWEJj?=
 =?utf-8?B?emQ1ekh1YnY4TDJWZTJjZU5BM3o4WEgwZi9USHFNWXFibHRLT3hnUXliclM1?=
 =?utf-8?Q?4DxkWyZvAV6mWTS/8OQYwP4/M652VMMufaw+jZt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR03MB3645.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a05820d-47b4-4ca2-8320-08d8ecccee96
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 00:53:39.2220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqezF+5tlk+fGGv+zErLVSfwHpq1qz083BJE10uMv0rhtJVeKqIOQC5bRnlod3gzFlPibuVEa9umkqliUCpciw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR03MB3263
X-OriginatorOrg: lenovo.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGVsbG8gRW5yaWNvLA0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBFbnJp
Y28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdCA8aW5mb0BtZXR1eC5uZXQ+DQo+U2VudDogRnJp
ZGF5LCBNYXJjaCAxOSwgMjAyMSA4OjM2IFBNDQo+VG86IE5pdGluIEpvc2hpMSA8bmpvc2hpMUBs
ZW5vdm8uY29tPjsgTWFyayBSSCBQZWFyc29uDQo+PG1hcmtwZWFyc29uQGxlbm92by5jb20+OyBI
YW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPjsNCj5Fc3RldmUgVmFyZWxhIENvbG9t
aW5hcyA8ZXN0ZXZlLnZhcmVsYUBnbWFpbC5jb20+OyBIZW5yaXF1ZSBkZSBNb3JhZXMNCj5Ib2xz
Y2h1aCA8aWJtLWFjcGlAaG1oLmVuZy5icj4NCj5DYzogaWJtLWFjcGktZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0OyBwbGF0Zm9ybS1kcml2ZXItDQo+eDg2QHZnZXIua2VybmVsLm9yZw0KPlN1
YmplY3Q6IFJlOiBbRXh0ZXJuYWxdIFJlOiBbUEFUQ0hdIHRoaW5rcGFkX2FjcGk6IEFsbG93IHRo
ZSBGbkxvY2sgTEVEIHRvDQo+Y2hhbmdlIHN0YXRlDQo+DQo+T24gMTkuMDMuMjEgMTE6MzksIE5p
dGluIEpvc2hpMSB3cm90ZToNCj4NCj5IaSwNCj4NCj4+IFJlZ2FyZGluZyAiR01LUyIgbWV0aG9k
LCBpdCBkb2VzIG5vdCBoYXZlICJ2ZXJzaW9uIiByZWxhdGVkIGluZm9ybWF0aW9uLg0KPlNvICwg
aXRzIHVubGlrZWx5IHRvIGltcGFjdCBhbnkgb2xkZXIgcGxhdGZvcm1zLg0KPj4gSG93ZXZlciwg
SSBnb3QgaXQgY29uZmlybWVkIHRoYXQgZGVmaW5pdGlvbiBvZiBHTUtTIG1ldGhvZCBpdHNlbGYg
ZG9lc24ndA0KPmluY2x1ZGUgYW55IHdvcmthcm91bmQgZmVhdHVyZS4NCj4+DQo+PiBCdXQsIHNp
bmNlIGl0cyBnZXR0ZXIgZnVuY3Rpb24gLCBJIGFsc28gdGhpbmsgaXRzIGhhcm1sZXNzIGFuZCBp
ZiBpdCB3b3JrYXJvdW5kDQo+c29tZSBpc3N1ZSB0aGVuIEkgZG9u4oCZdCBzZWUgYW55IGNvbmNl
cm4uDQo+DQo+SG93IGFib3V0IHB1Ymxpc2hpbmcgc2NoZW1hdGljcyAvIHNwZWNzLCBzbyB3ZSBj
YW4gY29uZmlybSB3aGF0IGl0J3MgcmVhbGx5DQo+ZG9pbmcgPw0KVGhhbmsgeW91IGZvciB5b3Vy
IGNvbW1lbnQuDQpJIHdpbGwgY2hlY2sgcmVnYXJkaW5nIHRoaXMgYW5kIGZlZWRiYWNrIHlvdSBs
YXRlci4NCg0KPg0KPkluIHJlY2VudCBkZWNhZGVzIEkndmUgbGVhcm4gdG8gbWlzdHJ1c3QgdmVu
ZG9yLXByb3ZpZGVkIGZpcm13YXJlIChlc3BlY2lhbGx5DQo+d2hlbiBpdCBjb21lcyB0byBhY3Bp
KS4gVGhlIHJlYXNvbiB3aHkgSSdtIGN1cnJlbnRseSBiaXNlY3RpbmcgQU1EJ3MgQUdFU0ENCj5i
bG9iLCBpbiBvcmRlciB0byBjb21wbGV0ZWx5IHJlcGxhY2UgaXQuDQo+DQo+SXQncyBhIHRlZGlv
dXMgam9iLCBoYWQgdG8gd3JpdGUgbXkgb3duIGFuYWx5c2lzIHRvb2wsIGJ1dCBzdGVwIGJ5IHN0
ZXAgbWFraW5nDQo+cHJvZ3Jlc3MuIChhbmQgYWxyZWFkeSBsZWFybmVkIHRoZXkndmUgYmVlbiB1
c2luZyBhIHByZXR0eSBpbmVmZmljaWVudCBjb21waWxlcg0KPnRoYXQgY2FuJ3QgZXZlbiBpbmxp
bmUgdHJpdmlhbCBtZW1jcHkoKS4NCj5Qcm9iYWJseSBzb21lIG9sZGVyIG1zdmMgLi4uIDpwKQ0K
Pg0KPi0tbXR4DQoNClRoYW5rcyAmIFJlZ2FyZHMsDQpOaXRpbiBKb3NoaSANCj4NCj4tLQ0KPi0t
LQ0KPkhpbndlaXM6IHVudmVyc2NobMO8c3NlbHRlIEUtTWFpbHMga8O2bm5lbiBsZWljaHQgYWJn
ZWjDtnJ0IHVuZCBtYW5pcHVsaWVydA0KPndlcmRlbiAhIEbDvHIgZWluZSB2ZXJ0cmF1bGljaGUg
S29tbXVuaWthdGlvbiBzZW5kZW4gU2llIGJpdHRlIGlocmVuDQo+R1BHL1BHUC1TY2hsw7xzc2Vs
IHp1Lg0KPi0tLQ0KPkVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0DQo+RnJlZSBzb2Z0
d2FyZSBhbmQgTGludXggZW1iZWRkZWQgZW5naW5lZXJpbmcgaW5mb0BtZXR1eC5uZXQgLS0gKzQ5
LTE1MS0NCj4yNzU2NTI4Nw0K
