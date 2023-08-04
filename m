Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB6FC001DF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Aug 2023 14:45:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjHDOpH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Aug 2023 10:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjHDOpG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Aug 2023 10:45:06 -0400
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C3649C1
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Aug 2023 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
        t=1691160254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w2vd/QAJf740rAnPnB8jDXjnsCbvnzFUg3spdkLTG1w=;
        b=RveSpUvH5WaBU+EdbQkc5NH04tvZbzgAJxD1SvCcxI/oaWAUdxo6Dl2V85mLjrPTOzthOM
        sw09imE+YkBERyLkZ8PIipLEfMaaLX1WtcTgVQ4NCfOyIinXE1e1MiBmlWWBt1rbcZDXEq
        C8loP20H79beKv694KrfQUeYPAkohFc=
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-DlD4uVU3NdSu8jAUQfpxFA-1; Fri, 04 Aug 2023 10:44:13 -0400
X-MC-Unique: DlD4uVU3NdSu8jAUQfpxFA-1
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:160::10)
 by SJ0PR84MB1822.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 14:44:09 +0000
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e6b:1f96:bb19:ec40]) by PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e6b:1f96:bb19:ec40%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 14:44:09 +0000
From:   "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
To:     Li Zetao <lizetao1@huawei.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH -next] platform/x86: hp-bioscfg: Use kmemdup() to replace
 kmalloc + memcpy
Thread-Topic: [PATCH -next] platform/x86: hp-bioscfg: Use kmemdup() to replace
 kmalloc + memcpy
Thread-Index: AQHZxcSMwy9dQ8e++E250//bOLb3XK/aOG8w
Date:   Fri, 4 Aug 2023 14:44:08 +0000
Message-ID: <PH0PR84MB1953D0615899FD9E60487C73A809A@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
References: <20230803032027.3044851-1-lizetao1@huawei.com>
In-Reply-To: <20230803032027.3044851-1-lizetao1@huawei.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 43b1ef27-5813-470f-92a9-f05ec463f7a8
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR84MB1953:EE_|SJ0PR84MB1822:EE_
x-ms-office365-filtering-correlation-id: 58b9e952-8088-406b-4d28-08db94f942bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Uzo0FfTFwlsYc2fYcDmqxQeyrBmEikXndfFrJMgsoMpY3NcFMKaCgwHneoLgUoXZ7ctM1U0/fHt6CFEQp37Xjx0Y6g7rVF5LKpVnWThkqPWC4ZpQtqqzKYsukQBsPQ2tJ/ob7L+gkgtmm96mjcxSG0LDCM3BX15yIp9+ST3UVQv32VgtekLmMmdLALgHtb8mX2XdcGfesDb2TK0KmZt/0xQ1jK0kywsd5zCDTOH2N1EZoh/DKmYV5IieDNRk4Rak12OPywnziKLKSsLf+t1BHbIxYnbKdJdgiYqZPrz0D22upN2k8rXo07g5lnMMmvMmiqOv2B/Zr4tKpJMhKAhVDaFbD9SLqNc9wMpnCJGZ/X8YnvZ0YxK1LXc04ePB0VFybrzJnZ8KCRCnOVbioIA3+n0s9iKIqwL8FJY60MTyJMWwwZ7bWoVcpjYyNEyL7xvVAqZLUkUTaxZsw+scDaIHc4eXBCporGnuH5roljrqunwEwrcQ+e45P0uCWizurdnVNNPnB52IrvO9FG2fJeknqOotd+c1lX4upaqU+fAWFC2FFKOwfB9QJvas19I9jvZmucFnbrQ+9D4ny+q7pOWKjC3CyYN+5WpF6MtxznqTuupB+KvMqaxi5pSNkvHM4cdY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199021)(1800799003)(186006)(41300700001)(8936002)(8676002)(83380400001)(53546011)(6506007)(86362001)(26005)(38100700002)(122000001)(82960400001)(38070700005)(316002)(110136005)(478600001)(66446008)(7696005)(9686003)(71200400001)(33656002)(4326008)(64756008)(55016003)(76116006)(2906002)(66476007)(5660300002)(66946007)(66556008)(52536014);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BwoIDp6TueQHppi1gfs6scvZg9Gjct/hw2Ob070uhHLZFW+MhU674+h/afor?=
 =?us-ascii?Q?5oVzhg9CUnmzmrvYtevr/BrUUX0aIP0R9bkndfhgFoaf1ZoQr0oC7t8o2Ys7?=
 =?us-ascii?Q?sWwR1l6VzCgGVgLXc6ESlIgrY/hBTpe/5aNKUp/7f+/D2g8x22t7EZVB/KV9?=
 =?us-ascii?Q?8udT3x2uNh1tchBEtnzJgVGHFglrIxFBw/szs0X2fA6iJNIh0YES615nLzkk?=
 =?us-ascii?Q?Ch3K+kdjWpcoIbAq0+AxCGIDctsOHDSGTXBWh5qN2JfGf5fUHADlMXkUea99?=
 =?us-ascii?Q?MAzGx1jSWxz+WATOwvwV4mdmcwrjfCaJR5AQIVRPiIA9kHlIGz9TCPT863BX?=
 =?us-ascii?Q?iSEALkXTgOhnGzDzX3zXENs9QAXVQA+RVdFqXRfaDjFu5Azxln7KE+MRgDY+?=
 =?us-ascii?Q?nm/OKtxzkYzrld46HEBsM+LxeZEifXif0ka0uUawzkk3GMd5GPTnPO0uq/bb?=
 =?us-ascii?Q?oLhiMcBGR7q6vuXhJa6z7WA4FxJGB8tnko92kPXSsOJwaCmZtx6khQOTCu55?=
 =?us-ascii?Q?WIwkn4AXKatst4KEjYWyrGmf4cju0X1MSck5drrwqZ9QebKqNKh7TyewyhOA?=
 =?us-ascii?Q?Im5VLm6xylQUqd1RJEZ1Jg7gYBjY3bi9Huf45G0IaZNgRZQZlw9minlTeT2N?=
 =?us-ascii?Q?bEeICxYDaMjhVAvq6nQ57fnVjOuaS1Y9HPKg4F6UimoVlEti55p5IFphk1B+?=
 =?us-ascii?Q?iZ+/ZxN5Md9IGomr0vKry8gxKuxNTyEyQwCsJgz4cS29Ytyjzt1hPwdA9xBb?=
 =?us-ascii?Q?l4eQznzjYgh18sntmox2lqUF7lJ+ujaLvcfDGg30GSvCbh7cDVfcJul6iTcp?=
 =?us-ascii?Q?x5U91gA7hUyy5vl7CrhEivc7VXuEgZ+vj9m2JMHKpt9tUKEOswANAXS1B0Pp?=
 =?us-ascii?Q?kdTW/SB/JF+vQNwbukw4ScqOKWnUPNVHwqr0OFKYRTB9RlgAaG2sHl/7pSDu?=
 =?us-ascii?Q?7ngwB94vrtPMpijNdJ+aWGZoWMWnrziF0FouXJkJmCCshZypZoDYTAwTjwtu?=
 =?us-ascii?Q?BW1zDpVekcct1bU6d8tfGRtD+w6zjvdDH0SPSwHxqI4Aag8VOLbE84RAu5bd?=
 =?us-ascii?Q?JNRKRmk39BVRMx7mNwSl5jYx5k1DZ01jJdjfC+OMoTeAHd0+Hy4nxzige3nA?=
 =?us-ascii?Q?8+dYs/T1hcHa/1Y9LOWdbzhX5HehgtL8JyxUzQ70DBKJEXufxKuHh0E3EZqQ?=
 =?us-ascii?Q?uuMmz0nMEnd/15WwOazL+JG2kfQgoDXmZF4KgCrRAvv54n8hTl/75m2YSn8r?=
 =?us-ascii?Q?4ZDGv5Hs8gQXaSEuKwOYiFha2WnmEdx4D6idHI/9GQODCeHUpdvoCFT1ReVO?=
 =?us-ascii?Q?1RG0JIPx1Bjonm3ZfGmeBLZY7AkWBKJyaVepj8XrSoDRBUh+1U6NWU7VwGUH?=
 =?us-ascii?Q?d3yObvWQxBqJfKrK4BQ3kgro0RkSIZqRSOcVfJqUuxemp+82lXeBhdeu5pqr?=
 =?us-ascii?Q?x/gP1Vq2wfXtN2ZbpogCSmj3pngE7K/K1MFfwCHozonnPi7tAhe+bwwBLsvk?=
 =?us-ascii?Q?1r9n8vm1kNHpE4btDV30nMRKZR+fygd13p9BhzO85Cso2UTingfTfSIp1a05?=
 =?us-ascii?Q?lew2ltdytI6FhCd0ccqUUv9SWsSY6tfzSmcUWzKz?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b9e952-8088-406b-4d28-08db94f942bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2023 14:44:09.0140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlme0XivPWpplJ50ilA3d3hiYI5bKLEonHKyVEUDtCIFb7TrKRjMOtmd8FwgXCXdEq0YKyQLrILGBnQddptdBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1822
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
> From: Li Zetao <lizetao1@huawei.com>
> Sent: Wednesday, August 2, 2023 10:20 PM
> To: Lopez, Jorge A (Security) <jorge.lopez2@hp.com>;
> hdegoede@redhat.com; markgross@kernel.org
> Cc: lizetao1@huawei.com; platform-driver-x86@vger.kernel.org
> Subject: [PATCH -next] platform/x86: hp-bioscfg: Use kmemdup() to replace
> kmalloc + memcpy
>=20
> CAUTION: External Email
>=20
> There are some warnings reported by coccinelle:
>=20
> ./drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:317:35-42:
>                 WARNING opportunity for kmemdup
> ./drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:270:40-47:
>                 WARNING opportunity for kmemdup
> ./drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c:233:36-43:
>                 WARNING opportunity for kmemdup
>=20
> Use kmemdup rather than duplicating its implementation.
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  .../platform/x86/hp/hp-bioscfg/spmobj-attributes.c    | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> index 02291e32684f..86f90238750c 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
> @@ -230,12 +230,10 @@ static ssize_t sk_store(struct kobject *kobj,
>                 length--;
>=20
>         /* allocate space and copy current signing key */
> -       bioscfg_drv.spm_data.signing_key =3D kmalloc(length, GFP_KERNEL);
> +       bioscfg_drv.spm_data.signing_key =3D kmemdup(buf, length,
> + GFP_KERNEL);
>         if (!bioscfg_drv.spm_data.signing_key)
>                 return -ENOMEM;
>=20
> -       memcpy(bioscfg_drv.spm_data.signing_key, buf, length);
> -
>         /* submit signing key payload */
>         ret =3D hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK,
>                                    HPWMI_SECUREPLATFORM, @@ -267,14 +265,=
12 @@
> static ssize_t kek_store(struct kobject *kobj,
>                 length--;
>=20
>         /* allocate space and copy current signing key */
> -       bioscfg_drv.spm_data.endorsement_key =3D kmalloc(length,
> GFP_KERNEL);
> +       bioscfg_drv.spm_data.endorsement_key =3D kmemdup(buf, length,
> + GFP_KERNEL);
>         if (!bioscfg_drv.spm_data.endorsement_key) {
>                 ret =3D -ENOMEM;
>                 goto exit_kek;
>         }
>=20
> -       memcpy(bioscfg_drv.spm_data.endorsement_key, buf, length);
> -
>         ret =3D hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
>                                    HPWMI_SECUREPLATFORM,
>                                    (void *)bioscfg_drv.spm_data.endorseme=
nt_key,
> @@ -314,13 +310,12 @@ static ssize_t auth_token_store(struct kobject
> *kobj,
>                 length--;
>=20
>         /* allocate space and copy current auth token */
> -       bioscfg_drv.spm_data.auth_token =3D kmalloc(length, GFP_KERNEL);
> +       bioscfg_drv.spm_data.auth_token =3D kmemdup(buf, length,
> + GFP_KERNEL);
>         if (!bioscfg_drv.spm_data.auth_token) {
>                 ret =3D -ENOMEM;
>                 goto exit_token;
>         }
>=20
> -       memcpy(bioscfg_drv.spm_data.auth_token, buf, length);
>         return count;
>=20
>  exit_token:
> --
> 2.34.1

