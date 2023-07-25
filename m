Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354E9C001DE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 19:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjGYTjI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 15:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbjGYTjH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 15:39:07 -0400
X-Greylist: delayed 94 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 25 Jul 2023 12:37:56 PDT
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1889126B7
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
        t=1690313830;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+vR8VvNKeSj/pDKTar8D8s7Wlb//HnB/UJ0QyTnikuw=;
        b=ljeFosPcBxXyrH0s8crdySLq0PU6jwE31fKPtRE56WxhaO9ekxLnxaTjiERwp4CdnriBDQ
        8dn1BLZBBSvle6XQ2qiN10DrwuHbMEOtqOoYxVqNA/BPC29Kq+CfgdHuS6Q2gooufu5Viv
        xKfxgzISLZErs04/DgjLDLNCFd7zluw=
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-F-0moXS_OZ2SaIwM9ZnBgA-1; Tue, 25 Jul 2023 15:35:41 -0400
X-MC-Unique: F-0moXS_OZ2SaIwM9ZnBgA-1
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:160::10)
 by MW5PR84MB1819.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Tue, 25 Jul
 2023 19:35:38 +0000
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e6b:1f96:bb19:ec40]) by PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e6b:1f96:bb19:ec40%7]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 19:35:38 +0000
From:   "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 3/3] platform/x86: hp-bioscfg: fix error reporting in
 hp_add_other_attributes()
Thread-Topic: [PATCH 3/3] platform/x86: hp-bioscfg: fix error reporting in
 hp_add_other_attributes()
Thread-Index: AQHZuUZmZM0BuNqPMk2fsPwYH6AVv6/K62jQ
Date:   Tue, 25 Jul 2023 19:35:37 +0000
Message-ID: <PH0PR84MB1953ECE86374D00ABD82880CA803A@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
References: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
 <138641cc-52c0-41a5-8176-ad01c7e28c67@moroto.mountain>
In-Reply-To: <138641cc-52c0-41a5-8176-ad01c7e28c67@moroto.mountain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 1a19bbb6-946a-4831-b59f-537908eb4d17
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR84MB1953:EE_|MW5PR84MB1819:EE_
x-ms-office365-filtering-correlation-id: 3dda5d3c-e84c-4bbf-459a-08db8d4652d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Zj1YITSfeKOPDL2w79PjV+lTLy0ySBOt/mGosObXfJfCdfpEjAMctSHCjp1LM/lhg7OW0zlcEMU5rGwbBxQmYNcZir/f1tbIwhX8dlShQtXy2n8kiw3awgFfnTCWJU9cit8rXyPFgwEPQaVEcWbbHbXXj1FHRiBf/JUIN9zC5fbX1pHO/yTsSORLnJI5hlVFLYprRBh7rdAa2x069HAoVVZZJ48mxidL88SJI1mOWrOkHApajVn94WcdTfcauT+r7V0ADv3a4Eusn/3tJSLJmKH+C2l5YiPg1Oxze2YPbTogKxiqwqIEaL1OgiElSgZEccqLPEgRZPRF/u6kIgtieQBB+t8ghsJB8sUlHoQb6QLPTIpOpwTfnypOU26x7xQbmCRFo4Ou/R5dH84Dyf18kAo2Ny1lzOzf0reUxab+iRed5gYUfDHWMqjoTtgnZ1ixa2LYoWOtXocSidpiOrnmj8QgX+38qsxt/DX88NE7HIKrxygBqEuGmgHwFc/NhsXDPmu0wIpLgJTLF+So9LZPC+wIr+o/IY+p04bN8TL1GM/RHOK8K9LNqZo4N41HKSNlRMbotMMcXjrMe5AkWseN3SRckGrhM4lJHTlGT0koX2+mUNaJCAJk3WyyIdTYJ0GY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(4326008)(38100700002)(122000001)(66556008)(66476007)(55016003)(83380400001)(53546011)(66574015)(8936002)(8676002)(9686003)(5660300002)(52536014)(54906003)(478600001)(76116006)(66446008)(41300700001)(66946007)(316002)(6916009)(64756008)(71200400001)(26005)(186003)(6506007)(2906002)(7696005)(33656002)(38070700005)(86362001)(82960400001);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ob90IwzqALANrm0KWhVssCQsRLNNoW47U2UX5R+UmSoalTuW3rto7Cc9GP?=
 =?iso-8859-1?Q?RlGHfbRRXi1490RmLODWFqm2NQluMKuK0ffFaQa8/EWtAedGbAKX/JFn6q?=
 =?iso-8859-1?Q?/5SU7Bm3pwOKECFJVgXe+9aRlITbChukE+n2b1gQEKF1Hny3USBq8fRB12?=
 =?iso-8859-1?Q?QyTRS0o6rj4Yu/4KM2GRQ9lOhYjHWoJSk97QTfMpndISxnZaqIzhCNR0nL?=
 =?iso-8859-1?Q?VJxY9XxTwkp3w7VBzwdwjWwYj28PDfC6I1cNUIgjzydx7mRJcR6xqJGJVG?=
 =?iso-8859-1?Q?DGG8PrF7w9KUwA9DewmmanTk42duCnnmG+t4Z7ZyBltjKu0EZvRfEin9Hd?=
 =?iso-8859-1?Q?YiYRhnC6Roows6Ymx1HOfREs/1CWRJvar1pYQSb6ne2IDyLiu0u6+vuGAk?=
 =?iso-8859-1?Q?pdxugGkArOt9gUlb+nOU6ELaZGvC1AIMky+Q6QyUHxPT5xsEAQ+OylEzBu?=
 =?iso-8859-1?Q?ikQtwcR/dTMyoqtbBSaRNSpA/fClAnxwep3B5WPrer1v6kkjoXZZ3lJvKf?=
 =?iso-8859-1?Q?ByQK4A2KDxheHBVaswEf1KECjafywYy6XA0B4qOpMelW6yQSFxf1PnI8Qb?=
 =?iso-8859-1?Q?abGMiwmBrtu2lcW3FeZwZe0yZs46NWMLfMMtbRhVLV425UiqoBlbld+1O0?=
 =?iso-8859-1?Q?tV7gc7rvSwxFdOcqqS/MTK3/JaCQ8H6RY/B8DSo9HnRjyDUkBoVEJ9O03w?=
 =?iso-8859-1?Q?kQkVRwGV2ctXzzKFF/9UOHyeMEAoR7CqM8yewc6/hKjEinxTAAnZ5RVSMB?=
 =?iso-8859-1?Q?Fw9mAs16EXPz9+Ett7Y6IBQ3iFCj4OoXaTC4WOAIfgej3O3I/DStfK9kqt?=
 =?iso-8859-1?Q?6nbeTZWRnIdjwrQ3B3Z4UP04rLavZrA2FRvFazJJ8QwBICnrNho+e+UxEc?=
 =?iso-8859-1?Q?s/5Rf9vh5lSHlkkc6KD9MTy7/IkafVYJ5Qr1Y6VoACmZth7HQCBgNxZcP1?=
 =?iso-8859-1?Q?FqcaL5oWbugQFWIM8mohnbuqLWTRxWpniM2kOn+5O+glPjZmjrMK9SfYZg?=
 =?iso-8859-1?Q?CFT7eaBos7Yd5hw05JWzKSI7X9ln1Dm7vEZQo4gMvybRr7ngl5LHng3sQ+?=
 =?iso-8859-1?Q?ZSyXt4smJGTMQ5SWNSlKm3AOnZd11HJ2FRBIXJ6ArXOntaRCY9SpEl/8o1?=
 =?iso-8859-1?Q?B6CVeWJhfn3GitdCGUd+uIps7rVx2cB0SXcTUzvZwMZ+RMOVkpq4TJGp/7?=
 =?iso-8859-1?Q?9+wE14bZ4pqPfm9CZtn+OVYyOr00AZM9hhEHqxbWS2pO6klVv430rTcata?=
 =?iso-8859-1?Q?q0jw5T8kzOujwkU31dSwEZtqpJ0PHBr1RNR+Y5gp6jMRtS+eWDxfaHV1NR?=
 =?iso-8859-1?Q?Y5lFwZ//yEWjfa259sVVF4ASW7E1VuH1yDBNFd8LcTpS8xCrqW27RpAnY8?=
 =?iso-8859-1?Q?xBNeAgyED4iF7zW3c0lENaSZLrn8uv17ILZbcn4zlHWY29owgpCtB99oGk?=
 =?iso-8859-1?Q?nshEML0GZ5Q4SNqkwpQA39AkYcplK9lw8h3kKbY5h2EPCW81L3hOeB4Dlf?=
 =?iso-8859-1?Q?+cLe3vegPT/h8MuqBNqiA/ocQeemki0Ii8P8lVGtqh0szc2ZX8PUGN6IBn?=
 =?iso-8859-1?Q?Nr47rDa4yccMRMOfk16vD9R4ZIzlE+udoPM9Zgv+UIIyIdg8yFZdTzl8R4?=
 =?iso-8859-1?Q?R35BrTdV66LijlRvdlfLSv4/o6byqpwhzC?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dda5d3c-e84c-4bbf-459a-08db8d4652d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 19:35:37.9201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMWB5/3q8dGvpD5TIzTfCWmf0F+8iqVLt+ujNQYnK0k+A/UQz7LY1wvA3tnLSjR5dMCmHV1iIDz5XEsyhlCR2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1819
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Reviewed-by: Jorge Lopez <jorge.lopez2@hp.com>


Regards,

Jorge Lopez
HP Inc

"Once you stop learning, you start dying"
Albert Einstein

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Tuesday, July 18, 2023 2:06 AM
> To: Lopez, Jorge A (Security) <jorge.lopez2@hp.com>
> Cc: Hans de Goede <hdegoede@redhat.com>; Mark Gross
> <markgross@kernel.org>; Thomas Wei=DFschuh <linux@weissschuh.net>;
> platform-driver-x86@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH 3/3] platform/x86: hp-bioscfg: fix error reporting in
> hp_add_other_attributes()
>=20
> CAUTION: External Email
>=20
> Return a negative error code instead of returning success.
>=20
> Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index 32d9c36ca553..8c4f9e12f018 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -630,13 +630,18 @@ static int hp_add_other_attributes(int attr_type)
>         switch (attr_type) {
>         case HPWMI_SECURE_PLATFORM_TYPE:
>                 ret =3D hp_populate_secure_platform_data(attr_name_kobj);
> +               if (ret)
> +                       goto err_other_attr_init;
>                 break;
>=20
>         case HPWMI_SURE_START_TYPE:
>                 ret =3D hp_populate_sure_start_data(attr_name_kobj);
> +               if (ret)
> +                       goto err_other_attr_init;
>                 break;
>=20
>         default:
> +               ret =3D -EINVAL;
>                 goto err_other_attr_init;
>         }
>=20
> --
> 2.39.2

