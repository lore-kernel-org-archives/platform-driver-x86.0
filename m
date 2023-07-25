Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7437EB64DD
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 19:50:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjGYTuc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 15:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGYTub (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 15:50:31 -0400
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6103A19B0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 12:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
        t=1690314582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/RxVgIVrOB+2mchdbRZnao1fG8xrprtvDP0Fb1HcCmA=;
        b=GZtoAMOPRA3S0zGXijLXR2oicpqaLnBpWo7xlhdWhKjNIwD+ump8vyJYepAeUzsuxi0ww8
        hF/Vedun+/dpHst8w4wRi6J5lAl/cFGVq7QL0nybArDyS9DQVePoXtqNe/2+eBkmhe+eD7
        xKD3BwP234ko8qzEYGgU5/+1CG6ZKCw=
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-680-uczssUUsOVG3l64gL7dKvQ-1; Tue, 25 Jul 2023 15:49:36 -0400
X-MC-Unique: uczssUUsOVG3l64gL7dKvQ-1
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:160::10)
 by MW5PR84MB1425.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 19:49:33 +0000
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e6b:1f96:bb19:ec40]) by PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e6b:1f96:bb19:ec40%7]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 19:49:32 +0000
From:   "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [bug report] platform/x86: hp-bioscfg: enum-attributes
Thread-Topic: [bug report] platform/x86: hp-bioscfg: enum-attributes
Thread-Index: AQHZuJsJKPiFXgxXfUWCSftSA1z06K/K8JOw
Date:   Tue, 25 Jul 2023 19:49:32 +0000
Message-ID: <PH0PR84MB19534201D5136646B17738E3A803A@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
References: <176e14a2-41f8-41b2-854e-77319ec2416d@moroto.mountain>
In-Reply-To: <176e14a2-41f8-41b2-854e-77319ec2416d@moroto.mountain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 61409e0b-d56e-40ca-b7bd-e75a25ac96f4
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR84MB1953:EE_|MW5PR84MB1425:EE_
x-ms-office365-filtering-correlation-id: c0991bf5-ec30-4501-27b0-08db8d48447c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 0qVrkjSXrjP7RGXTH2m5Mzv7dGA9K5ePuzCNDOIDHXDWN01XOGuErOx+2ThGOtWutpwzb3UGplwa18phtIoeQC1MtR4acc+bIVssE5t5rqW08LWGsZ7iMgha4tlhNAP9bpg8jUfsKjNb2fFlpcNRptSXcut7vDebh3fPUqwzE54WKh35eVDTDyCI731kWMPCaPTquwjpTtfk5x4mD2K+JaN2DilFOvW9oeO68hXW0DhgqT8vtDeOW0toFGTDT0uLgyMMeZ0rxLaklzQAw8hb+dp2mxPX4IGEYsQqVBNd7qRFxUAlGtZZ1uiY6o/ojwe8Bwu2ElqZS8xTDUibf+0qocYVjOMVAFhCEvIL4CdA5ajvbRnGyiBUEGi9Nr1m1sbbkIIJvqfsJXID5PoARKfSlqEQO9TBzohckIn8sI5lwIrjh0/OaVEko6eWZ4sCOh5ONbeEpN0B7NZru5crnuoDjHWcMhm1RdWLk3AodiyhvMyzzhCuq2AS7urayRikP8UfVWSNSkQNhKHm88fo+rZPF1H/XAN0CqBp0s5KZrCpYCvknyswE/JosZqDPWWiBHYc2W2fseW7DWqbTmx/gES/wNk807RT3rVl6hmln7/nhS1Dje3bmWZKrQyjNckgXQSH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(8936002)(8676002)(82960400001)(316002)(66446008)(66556008)(52536014)(66476007)(6916009)(5660300002)(122000001)(4326008)(66946007)(76116006)(64756008)(38100700002)(38070700005)(26005)(33656002)(6506007)(41300700001)(53546011)(83380400001)(478600001)(186003)(2906002)(9686003)(86362001)(7696005)(71200400001)(55016003);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f51Kf144ugBthVrVfyyrN2NzFeGQbhcumaujTOvrgTzBykHIZ6Cl8IWaM/QD?=
 =?us-ascii?Q?F3W9q/jb7boKnOX3+6EPG7XAED5y9jOfsjgSGvRY4tx5PzOcnFS0jfFaJFLq?=
 =?us-ascii?Q?XGmiDNYmnPrjR1uNMrjwaAvwhet1xy3nRQEXHDXB6IQS+prXaaYq0CiNDUUh?=
 =?us-ascii?Q?kZ+lUmOGPschaNRabRFfJkiV9+sCFhq5shzsxemVO1ms02Y3paIXiY414oFx?=
 =?us-ascii?Q?fHgscqvWiiSaA7BWD1Oh7n6Sx3GiPd2JhD5cpH28pdqAp9UvEdnh1CnMlLm9?=
 =?us-ascii?Q?wrG02QSpJePNIoz88tYFkdJwIyWFL//UFUMAmCdfps7bSaHjc0o+g+y5QyaJ?=
 =?us-ascii?Q?7yGW3avv8lCMyyXu5qzguc8WHztygKebeqDxghKQORPpLkcv1wKsy1YXGk3B?=
 =?us-ascii?Q?/0qwPk+4r3KORwr7iha8eQ6fTzulC631fZb3zTvoGha/sb1l8xhNNllllqFk?=
 =?us-ascii?Q?u7m/tWVTlZEWkf1FOSwXng1p3eDbiqptPH5V3TdKZZsoluijzxDxRtZRMCsw?=
 =?us-ascii?Q?RGaD933HuC8T2TF2c1j/GkPhcg/EagbYgFf7BHz/fq8ED/qw9kL7UTCNyTSE?=
 =?us-ascii?Q?obHNnIpGbr3ps8hXccz2uwDUeHT8NYIjHm/aCC3dxoBnDFqCfRtX4wX2fTR7?=
 =?us-ascii?Q?nAFdPwTvb4kq/9N1lssj1/NnU+dzO+TPZCg7SaVsF5nZG7Dg8YnL+3CDNMxu?=
 =?us-ascii?Q?wpb0E/im/1KMycyBZuHXzlXLUyeY+uJY/Ja1JSv2wxT7z9T108aWPiopqRSm?=
 =?us-ascii?Q?rn7iZRvVN0A/zAjf1wbXrNyaav1wYpSkiT61CVLvrzcGOAF8aKLfu/zjmrNU?=
 =?us-ascii?Q?jo34nFpRs3VddGH8LecLq0UPdkANNSAtjqQiNj0R5w8r2ITdoJK/i+ZFWQK7?=
 =?us-ascii?Q?1+i3ifZJ0fIuendWvT7ijclu5jnmYX8YYgdvqtzktFCj42Si06+bE7a9epRk?=
 =?us-ascii?Q?yNFZ+zDyIGLlkdKtMRE7z4TrLvEo8gVAiGqq5gV5VADk3OVk0wZ2Ld16uKGd?=
 =?us-ascii?Q?Kp5biD4mQ3FMIvd+dDQXocfU6h3deEjfnXFVhJttv4Np6s4JuR0BVPn9zs0a?=
 =?us-ascii?Q?7Ucm40TCZ1GinYnnRC/17BUYbJYE9zF2LHyFYexTpVUqV1qHSd/ghZBe0ll6?=
 =?us-ascii?Q?nTp+AvbNIt/kYqdvD1FU/xrOJAwcEQOKrAU17DRztRx8V+nfx87EHu1nsNrc?=
 =?us-ascii?Q?10rUdvFj/BqTIQjTu7TwaQ7IbgpeNEExrK9/cIt7YwlrnrgXepHcvGIN6lSd?=
 =?us-ascii?Q?mK8W9MmlzmyiZOj2oIG61rBygkME9+4oCKhpP65CFiQiXeTvdhXoonZjcdOb?=
 =?us-ascii?Q?54LDhGexqRUAXiXM74Jn4VSwshFGw7QS5C3+lrso/c3cmC2ojQQOSGk84dNP?=
 =?us-ascii?Q?N5C+whNDbBIK39nEZ1HgG+VX+Q8to022pQZ9059ztNaspm4DHwg/QPBMofas?=
 =?us-ascii?Q?HaNf4qW3GcY2HAHD28KKiTYcfn6hcGy8phQQyOzbfzbYsb7gN0YCINd8x/VT?=
 =?us-ascii?Q?twoU15BT+rTtVt5EBJ8Sr9e4iObMbNuZzmifNiVBxEQZdGiIIJtYbA+kGzdP?=
 =?us-ascii?Q?yymmy99DnQlMYFBVG7eo8Cv301QLxTvGj+u40Hxn?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c0991bf5-ec30-4501-27b0-08db8d48447c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 19:49:32.8921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JC6Q9s38qld6tdERrm/O/R7eDw/BlkalaZcZaX9FpmxcsblOZ8S2rjK1j+SbP34ykqDCzrs8cDu32tVARFChjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1425
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dan,

I will submit a patch to address memory leaks in hp_populate_enumeration_el=
ements_from_package() reported here and to address some uninitialized varia=
ble errors reported in a separate email.



Regards,

Jorge Lopez
HP Inc

"Once you stop learning, you start dying"
Albert Einstein

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Monday, July 17, 2023 5:40 AM
> To: Lopez, Jorge A (Security) <jorge.lopez2@hp.com>
> Cc: platform-driver-x86@vger.kernel.org
> Subject: [bug report] platform/x86: hp-bioscfg: enum-attributes
>=20
> CAUTION: External Email
>=20
> Hello Jorge Lopez,
>=20
> The patch 6b2770bfd6f9: "platform/x86: hp-bioscfg: enum-attributes"
> from Jun 8, 2023 (linux-next), leads to the following Smatch static check=
er
> warning:
>=20
> drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:285
> hp_populate_enumeration_elements_from_package() error: double free of
> 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:289
> hp_populate_enumeration_elements_from_package() error: double free of
> 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/int-attributes.c:263
> hp_populate_integer_elements_from_package() error: double free of
> 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:286
> hp_populate_ordered_list_elements_from_package() error: double free of
> 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:290
> hp_populate_ordered_list_elements_from_package() error: double free of
> 'tmpstr'
> drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c:291
> hp_populate_ordered_list_elements_from_package() error: double free of
> 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c:371
> hp_populate_password_elements_from_package() error: double free of
> 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:252
> hp_populate_string_elements_from_package() error: double free of
> 'str_value'
> drivers/platform/x86/hp/hp-bioscfg/string-attributes.c:256
> hp_populate_string_elements_from_package() error: double free of
> 'str_value'
>=20
> drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
>     125 static int hp_populate_enumeration_elements_from_package(union
> acpi_object *enum_obj,
>     126                                                          int enum=
_obj_count,
>     127                                                          int inst=
ance_id)
>     128 {
>     129         char *str_value =3D NULL;
>=20
> str_value starts as NULL.
>=20
>     130         int value_len;
>     131         u32 size =3D 0;
>     132         u32 int_value;
>     133         int elem =3D 0;
>     134         int reqs;
>     135         int pos_values;
>     136         int ret;
>     137         int eloc;
>     138         struct enumeration_data *enum_data =3D
> &bioscfg_drv.enumeration_data[instance_id];
>     139
>     140         for (elem =3D 1, eloc =3D 1; elem < enum_obj_count; elem+=
+, eloc++) {
>     141                 /* ONLY look at the first ENUM_ELEM_CNT elements =
*/
>     142                 if (eloc =3D=3D ENUM_ELEM_CNT)
>     143                         goto exit_enumeration_package;
>=20
> But here we free the str_value from the previous iteration.
>=20
>     144
>     145                 switch (enum_obj[elem].type) {
>     146                 case ACPI_TYPE_STRING:
>     147                         if (PREREQUISITES !=3D elem && ENUM_POSSI=
BLE_VALUES
> !=3D elem) {
>     148                                 ret =3D
> hp_convert_hexstr_to_str(enum_obj[elem].string.pointer,
>     149                                                                en=
um_obj[elem].string.length,
>     150                                                                &s=
tr_value, &value_len);
>     151                                 if (ret)
>     152                                         return -EINVAL;
>=20
> Here the str_value from the previos iteration is re-assigned without bein=
g
> freed.  (memory leak).
>=20
>     153                         }
>     154                         break;
>     155                 case ACPI_TYPE_INTEGER:
>     156                         int_value =3D (u32)enum_obj[elem].integer=
.value;
>     157                         break;
>     158                 default:
>     159                         pr_warn("Unsupported object type [%d]\n",
> enum_obj[elem].type);
>     160                         continue;
>     161                 }
>     162
>     163                 /* Check that both expected and read object type =
match */
>     164                 if (expected_enum_types[eloc] !=3D enum_obj[elem]=
.type) {
>     165                         pr_err("Error expected type %d for elem %=
d, but got
> type %d instead\n",
>     166                                expected_enum_types[eloc], elem,
> enum_obj[elem].type);
>     167                         return -EIO;
>     168                 }
>     169
>     170                 /* Assign appropriate element value to correspond=
ing field
> */
>     171                 switch (eloc) {
>     172                 case NAME:
>     173                 case VALUE:
>     174                         break;
>     175                 case PATH:
>     176                         strscpy(enum_data->common.path, str_value=
,
>=20
> If str_value is NULL this will crash.
>=20
>     177                                 sizeof(enum_data->common.path));
>     178                         break;
>     179                 case IS_READONLY:
>     180                         enum_data->common.is_readonly =3D int_val=
ue;
>     181                         break;
>     182                 case DISPLAY_IN_UI:
>     183                         enum_data->common.display_in_ui =3D int_v=
alue;
>     184                         break;
>     185                 case REQUIRES_PHYSICAL_PRESENCE:
>     186                         enum_data->common.requires_physical_prese=
nce =3D
> int_value;
>     187                         break;
>     188                 case SEQUENCE:
>     189                         enum_data->common.sequence =3D int_value;
>     190                         break;
>     191                 case PREREQUISITES_SIZE:
>     192                         enum_data->common.prerequisites_size =3D =
int_value;
>     193                         if (int_value > MAX_PREREQUISITES_SIZE)
>     194                                 pr_warn("Prerequisites size value=
 exceeded the
> maximum number of elements supported or data may be malformed\n");
>     195
>     196                         /*
>     197                          * This HACK is needed to keep the expect=
ed
>     198                          * element list pointing to the right obj=
[elem].type
>     199                          * when the size is zero. PREREQUISITES
>     200                          * object is omitted by BIOS when the siz=
e is
>     201                          * zero.
>     202                          */
>     203                         if (int_value =3D=3D 0)
>     204                                 eloc++;
>     205                         break;
>     206
>     207                 case PREREQUISITES:
>     208                         size =3D min_t(u32, enum_data-
> >common.prerequisites_size, MAX_PREREQUISITES_SIZE);
>     209                         for (reqs =3D 0; reqs < size; reqs++) {
>     210                                 if (elem >=3D enum_obj_count) {
>     211                                         pr_err("Error enum-object=
s package is too
> small\n");
>     212                                         return -EINVAL;
>     213                                 }
>     214
>     215                                 ret =3D hp_convert_hexstr_to_str(=
enum_obj[elem +
> reqs].string.pointer,
>     216                                                                en=
um_obj[elem +
> reqs].string.length,
>     217                                                                &s=
tr_value, &value_len);
>=20
> str_value is re-assigned again.  (memory leak).
>=20
>     218
>     219                                 if (ret)
>     220                                         return -EINVAL;
>     221
>     222                                 strscpy(enum_data->common.prerequ=
isites[reqs],
>     223                                         str_value,
>     224                                         sizeof(enum_data-
> >common.prerequisites[reqs]));
>     225
>     226                                 kfree(str_value);
>=20
> str_value is freed.  (this will lead to a crash).
>=20
>     227                         }
>     228                         break;
>     229
>     230                 case SECURITY_LEVEL:
>     231                         enum_data->common.security_level =3D int_=
value;
>     232                         break;
>     233
>     234                 case ENUM_CURRENT_VALUE:
>     235                         strscpy(enum_data->current_value,
>     236                                 str_value, sizeof(enum_data->curr=
ent_value));
>=20
> No check for NULL.
>=20
>     237                         break;
>     238                 case ENUM_SIZE:
>     239                         enum_data->possible_values_size =3D int_v=
alue;
>     240                         if (int_value > MAX_VALUES_SIZE)
>     241                                 pr_warn("Possible number values s=
ize value
> exceeded the maximum number of elements supported or data may be
> malformed\n");
>     242
>     243                         /*
>     244                          * This HACK is needed to keep the expect=
ed
>     245                          * element list pointing to the right obj=
[elem].type
>     246                          * when the size is zero. POSSIBLE_VALUES
>     247                          * object is omitted by BIOS when the siz=
e is zero.
>     248                          */
>     249                         if (int_value =3D=3D 0)
>     250                                 eloc++;
>     251                         break;
>     252
>     253                 case ENUM_POSSIBLE_VALUES:
>     254                         size =3D enum_data->possible_values_size;
>     255
>     256                         for (pos_values =3D 0; pos_values < size =
&& pos_values <
> MAX_VALUES_SIZE;
>     257                              pos_values++) {
>     258                                 if (elem >=3D enum_obj_count) {
>     259                                         pr_err("Error enum-object=
s package is too
> small\n");
>     260                                         return -EINVAL;
>     261                                 }
>     262
>     263                                 ret =3D hp_convert_hexstr_to_str(=
enum_obj[elem +
> pos_values].string.pointer,
>     264                                                                en=
um_obj[elem +
> pos_values].string.length,
>     265                                                                &s=
tr_value, &value_len);
>=20
> Re-assigned again.
>=20
>     266
>     267                                 if (ret)
>     268                                         return -EINVAL;
>     269
>     270                                 /*
>     271                                  * ignore strings when possible v=
alues size
>     272                                  * is greater than MAX_VALUES_SIZ=
E
>     273                                  */
>     274                                 if (size < MAX_VALUES_SIZE)
>     275                                         strscpy(enum_data-
> >possible_values[pos_values],
>     276                                                 str_value,
>     277                                                 sizeof(enum_data-
> >possible_values[pos_values]));
>     278                         }
>     279                         break;
>     280                 default:
>     281                         pr_warn("Invalid element: %d found in Enu=
meration
> attribute or data may be malformed\n", elem);
>     282                         break;
>     283                 }
>     284
> --> 285                 kfree(str_value);
>=20
> str_value is freed at the end of every iteration so this is double free f=
rom
> the PREREQUISITES code.
>=20
>     286         }
>     287
>     288 exit_enumeration_package:
>     289         kfree(str_value);
>=20
> This is a double free as well.  I don't see how this one could have been
> avoided in testing???
>=20
>     290         return 0;
>     291 }
>=20
> regards,
> dan carpenter

