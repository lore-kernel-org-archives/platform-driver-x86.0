Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AB4EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 19:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjGYTlz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 15:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjGYTlz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 15:41:55 -0400
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49FF10F8
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 12:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
        t=1690314069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oDZy2HtQFFZFBLd8CyirtLbx0qVyFC3rNOXbTdGvxO0=;
        b=jhuI9/KvxJCzGbsHwwqRHwwqfa8OMFgYV2c6YQEMAyF0bRCl78rEHvpb0GqgdrMgxpznsx
        pnlUXySPYXGdlaA5tjXUcjcnQ605RwOqRfYKwGdUngz4lU4OhJfzUnfZ6gZoY0o7gtwFY2
        5MCPN6Tu+mLOgS8br4YVavvFO1sI3Rw=
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-12WY0bJ_OmSs7YKpRv6P5w-2; Tue, 25 Jul 2023 15:41:08 -0400
X-MC-Unique: 12WY0bJ_OmSs7YKpRv6P5w-2
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:160::10)
 by CYXPR84MB3515.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:930:db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.30; Tue, 25 Jul
 2023 19:41:05 +0000
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e6b:1f96:bb19:ec40]) by PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e6b:1f96:bb19:ec40%7]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 19:41:05 +0000
From:   "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 1/3] platform/x86: hp-bioscfg: fix a signedness bug in
 hp_wmi_perform_query()
Thread-Topic: [PATCH 1/3] platform/x86: hp-bioscfg: fix a signedness bug in
 hp_wmi_perform_query()
Thread-Index: AQHZuUY5OFBVS1Uj0EKiYyJH0OX0Sq/K7P+g
Date:   Tue, 25 Jul 2023 19:41:05 +0000
Message-ID: <PH0PR84MB19538BD19F89F060D79173B4A803A@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
References: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
In-Reply-To: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 9f7194f9-68d7-4ff5-b249-ba89c431cbe8
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR84MB1953:EE_|CYXPR84MB3515:EE_
x-ms-office365-filtering-correlation-id: de5d7e62-c1d6-4b3c-cbf5-08db8d471604
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: RKZdyj1zzHGvOrp62IWIMEWJFc2BUDjFsA520NbaO5pR2m9XrkEgoePXkQxZywe7TZF0YhiqGNifc33aKCg5CeOA+z5BNqPOsWhuQ9h98uxiGRKood6p4UhXDXbdysk/J3G3FRFieRXqCdleeaoxGVb6MuXbWmV7JZE1jNaWV59FWtNxChzMdDDFpvtz+BY2pGjP600kjNCfjjOPK3Tp1tttuz/Elj/c2jgwMTWybQTJOA+BruvDusEYi3RP4EF9m/qNCPgAW6+n/bLBfIxSNnt6A3paYISj0+jI8lJegVX+7IH6xt3jVGeWuo5gp0/HKQFNy/s5f0eSZ1JhbzaCqqSTOn5SQqnJOf9oOLOjT90p00YZNKgRx1oyfQcpZKdHjdMEgPJsOPjFXG2Q9iANQuWZkZ4rlSJlT6NOrsAIT/szF9KrkY1UKaO3w2eu7C/i94DOAo9OSbc4vfV35jTaoGlXKbxbLEoP8s8cJyUZiKxYPuIRP6/rSG/cirzDnGtY1dnURXDoYbjK/ezwVdlQoO5MMnuLlHvoRoSQ0jHT1O7Egy5ct6lk8PjkQ9V5aUnvLZTlAEsDBGUB3lKI2Ah5b/Gxsk30whhod4WS/xV06EIaaafNCxvgdsOLq1AKOkg2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(86362001)(33656002)(38070700005)(2906002)(55016003)(83380400001)(66574015)(186003)(53546011)(26005)(6506007)(122000001)(54906003)(38100700002)(9686003)(7696005)(71200400001)(66946007)(82960400001)(76116006)(316002)(6916009)(8936002)(64756008)(66446008)(66556008)(66476007)(41300700001)(8676002)(4326008)(478600001)(52536014)(5660300002);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DohS4PMjteEf7+fNQPiXvh0PIbayznPpj6n5z6FtRv/CUtrkJmFK1ioku1?=
 =?iso-8859-1?Q?ugYNsiBxFY/4LjVOj6S/JBxt2zWP05ySzDbhbzQ9pkhKXDnCIjgKoRAm9l?=
 =?iso-8859-1?Q?6BWco56blL1KNkxB0DZAIJszw6RfUMF/cmnvRO49PIRh2zGgnmPSHcDD6x?=
 =?iso-8859-1?Q?rIRSemuwKaf3rt+QETWwhfhH0pcNlmf0wxE51VCJ6WTbJRCP+io2Uc4Jpk?=
 =?iso-8859-1?Q?VTPbOEOjfjhT27ge88bIITgjplIaZ+qeO3tMV3wuizDwm5JXoLBONzQaBs?=
 =?iso-8859-1?Q?7AAQru5/Rhzbu4YeL2PKxmkppCs9JWvXsO7hsMvLCMHDRDcu8sv/OGO7Bh?=
 =?iso-8859-1?Q?zq1Qz3NjluFjtzqA8FQUjZ3+nkjKEqfn7OiodkB/HTIp9YdXm9DhL1C5FT?=
 =?iso-8859-1?Q?ajiFwF971Y7YVpoIJ4uHTM3hIbHyTP0XsKiv5HlRGaHbf7gaLgkmt4AQLa?=
 =?iso-8859-1?Q?g6MrZe3Itdiji1e95EEPUXNnZfaL8xfgz57d48MtRsl7L+SEdS1NiV5TJY?=
 =?iso-8859-1?Q?aMhw4aZ1LHEP/5FAr0Ffc3q1+PPagJVENK+N79Le89fm/RhuxzR6vQDVFS?=
 =?iso-8859-1?Q?/ahsP0ch0a6FWGgTjnqKMdV3wfePLTt6vQbgpZV2iGG5Q+twZ/k17hv/5a?=
 =?iso-8859-1?Q?gLEqJQt820D2O97omNnstbuZsSeDhrfZbcxRufnH5Zk+39lRfIkjEX7mhB?=
 =?iso-8859-1?Q?tjoaCw/imksGRPWcIiANUBcxmE7/JBN63OG5iKW9Ed7PX5X7jN1NCJSfvb?=
 =?iso-8859-1?Q?4G3j6uHAQBhaHKsTQajf7M6WXt2MyBIlNcgzlYtcjxt/zoeEmWMQV1zogm?=
 =?iso-8859-1?Q?XeydM4srw3V+/pCOBpb/fvk2LCz4zeAN5ot1p5j7MNzqZPkhyLQM93zTdc?=
 =?iso-8859-1?Q?G77rf/C7NQpE57+k2KjUNWjZ4MKimMuzrXT/tGh5pmI8pHe8qJx/VctJMv?=
 =?iso-8859-1?Q?wbkKg2Gbik0LF7V7F8cDH8mpmI3ZmNg8bBghxvTryu82RDji/MZzppEhmd?=
 =?iso-8859-1?Q?5++mrM+M9YRxNtGHPR996Ox3YUZENSl4HuLdzMGJ+Ujthemr84NaEmGLG7?=
 =?iso-8859-1?Q?UFjOuxHD8B437QTsq43aP8xWzGIjszaWZ9FbyxXcv2nsqoyfKBsZ08tVcy?=
 =?iso-8859-1?Q?G9N+eSc5+t4FLIBm1Zr7QuJkD785wszJWb4YEy8A6EIjUiy72K1j35LAWQ?=
 =?iso-8859-1?Q?PZ5b8qETho9/lq0Vd8uKjS7xyzqoT92RUSeLu+US4v5nADSNZA15bmaDUM?=
 =?iso-8859-1?Q?icK2ajBAkJL+twiTZPSCh4Ov1Qbq5GOSwYNdJIQQa8NRBx/wZyYbL6ilHM?=
 =?iso-8859-1?Q?4ji3mqI7qHwGvKDmtUTzdVoeeOIeIuezPzTpgwrwpOVYr2rNdeZAENnSbY?=
 =?iso-8859-1?Q?ZzTd8ZNv47ooy71imHVH5Rs7vzKjnaSKCl18mpuYqOLOyIOYIko2bTBPMX?=
 =?iso-8859-1?Q?CnJ7ztvAOSUixJOBMQmD0rR2xjwDcmP6aFd7rQRI/Lh1XmuafiZe1SY2FZ?=
 =?iso-8859-1?Q?3l3J+Rw8jIIT+SnGIpSz4abLA0xY/oWUhA6E2a7dJaCUFdQo32CPkuNSKZ?=
 =?iso-8859-1?Q?z2P1fBqwDkCrPk7LKJSrJR+AGlFXphq87TctvfLAzoMjDm/2CbWQ7sweiU?=
 =?iso-8859-1?Q?xMvnnWy/mQgWaGnETZ/At/G6/JM5Ypzpsn?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: de5d7e62-c1d6-4b3c-cbf5-08db8d471604
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 19:41:05.4431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2SPYhNJU4DTkoIWw05v8Is4uw/oocN1ViuZUJSs5JXmlu30U3VdmD5B65RjwGsjmBVj+ix+IeqrIj3W4qBvmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR84MB3515
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
> Sent: Tuesday, July 18, 2023 2:05 AM
> To: Lopez, Jorge A (Security) <jorge.lopez2@hp.com>
> Cc: Hans de Goede <hdegoede@redhat.com>; Mark Gross
> <markgross@kernel.org>; Thomas Wei=DFschuh <linux@weissschuh.net>;
> platform-driver-x86@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH 1/3] platform/x86: hp-bioscfg: fix a signedness bug in
> hp_wmi_perform_query()
>=20
> CAUTION: External Email
>=20
> The error handling won't work if "mid" is unsigned.  "ret" is used to sto=
re
> negative error codes and declaring it as a u32 won't cause a bug but it's
> ugly.  The "actual_outsize" variable is a number between 0-4096 so it can=
 be
> declared as int as well.
>=20
> Fixes: 69ea03e38f24 ("platform/x86: hp-bioscfg: biosattr-interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> index 1d59ad600b84..dea54f35b8b5 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> @@ -123,7 +123,7 @@ int hp_wmi_perform_query(int query, enum
> hp_wmi_command command, void *buffer,
>         struct bios_return *bios_return;
>         union acpi_object *obj =3D NULL;
>         struct bios_args *args =3D NULL;
> -       u32 mid, actual_outsize, ret;
> +       int mid, actual_outsize, ret;
>         size_t bios_args_size;
>=20
>         mid =3D hp_encode_outsize_for_pvsz(outsize);
> --
> 2.39.2

