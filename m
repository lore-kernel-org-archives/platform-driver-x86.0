Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97882C001DE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Jul 2023 19:39:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbjGYTjj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Jul 2023 15:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbjGYTjh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jul 2023 15:39:37 -0400
X-Greylist: delayed 155 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 25 Jul 2023 12:38:19 PDT
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582802139
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jul 2023 12:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
        t=1690313881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C1nfo32bHrBf6H8jnyff/dVYWMtOuCrrV9LFxdknfsc=;
        b=ZCz8IHqKCmjKOvHhE5b+pU30iIsjK0EdGXd8AQHC4Afcu/uezmH57miQaJPgZa9EpowOn7
        rR+x7P9z6wZGqgLVvK4XqCrQkuDW51MjdNyivramYcSQfJeMXuty4ThY+KQ8tXNGl2wpdm
        5H89GcOVH6FD6GdOKeVUewYJgesQUPU=
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-4_LmSxlwOECE_hC7hWNKiA-1; Tue, 25 Jul 2023 15:36:10 -0400
X-MC-Unique: 4_LmSxlwOECE_hC7hWNKiA-1
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:160::10)
 by MW5PR84MB1819.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Tue, 25 Jul
 2023 19:36:04 +0000
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e6b:1f96:bb19:ec40]) by PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e6b:1f96:bb19:ec40%7]) with mapi id 15.20.6609.031; Tue, 25 Jul 2023
 19:36:04 +0000
From:   "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] platform/x86: hp-bioscfg: prevent a small buffer overflow
Thread-Topic: [PATCH] platform/x86: hp-bioscfg: prevent a small buffer
 overflow
Thread-Index: AQHZuUZKI7AH7iHN1UC4v07wX8Yt8K/K67eg
Date:   Tue, 25 Jul 2023 19:36:04 +0000
Message-ID: <PH0PR84MB1953C5C18AEADFA934869C02A803A@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
References: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
 <b4950310-e65f-412f-8d2b-90bb074a6572@moroto.mountain>
In-Reply-To: <b4950310-e65f-412f-8d2b-90bb074a6572@moroto.mountain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: c97707d3-fa74-4f70-a4f2-845ff14b45e8
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR84MB1953:EE_|MW5PR84MB1819:EE_
x-ms-office365-filtering-correlation-id: 6c6556e3-c4dd-45d9-5bfd-08db8d46625a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: QBOWTrdpoaKedz9NuEF7XQyyORL+Web4mLpsQleZHQXQtCVofzrYB5TwozPNQjAZoNIi+S6BLLgzyKoRza5r6ghuqJgIJ365uyfp48HzB4qzPuXK6WuvENOFGGBGlD+owXVxVpYdVGxcJhLWBAzuDXMHRwILSG4SowYJV3sZ7bpyvFg/JEdxf1Bh+5QR63j6Nemohc2WclxHyeDbEmDT/WToUG7fGNYSdl9jmZNwZHZHDlHs5uHtShNQ9QNJGHNHKTxw6nzHj3CMQ3TNrXpmVngnWwWQCl6ahBLuQ9N0HdoiWXktaoC0pV27xM4KjPQiwaQSrjIwqvZAn3+oZVQN3r3vSpeX4F81AfIOOrm4Ddu4koDi7awnciLZVL+jJih4KgFp9n8UnfCAMFCoWqdNyEqoQOPvEce/SApZxEm651kHJWoUsRN19t9+Sjz79HmW9VO6/jeeA8lhau82uO0bWko3R/P3tixLTfAcewT2blfo2VU7fx2I1IdYrN+Y3r3fG/YbVHyMS3oJYtq373ryw/pO0xbnnii715GzsR3vZCd6LMR2wiyqBmN4u34Wph4J0Z+RYf2NrV9bTMAr+79xZeWZzawzSA7vw3Nhydojkrq7YTrAX2+gTtAW41kFgBQJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199021)(4326008)(38100700002)(122000001)(66556008)(66476007)(55016003)(83380400001)(53546011)(66574015)(8936002)(8676002)(9686003)(5660300002)(52536014)(54906003)(478600001)(76116006)(66446008)(41300700001)(66946007)(316002)(6916009)(64756008)(71200400001)(26005)(186003)(6506007)(2906002)(7696005)(33656002)(38070700005)(86362001)(82960400001);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fOV/mDP6Gx71fGsxyas4YO2eOljfV+3fPEOFHC6b0bLfkX2WZUZsgn9mh2?=
 =?iso-8859-1?Q?0ZCslizLTBSn/Dx43a1tJzZY+reR629oj9//upQXttWXNGzBylrWAGclh2?=
 =?iso-8859-1?Q?8wB1Y5PT+HrO3iSJfUOip4senOHN8Ckz39iaE6dLIvfg7yJg9AfWVxojOQ?=
 =?iso-8859-1?Q?LexPX8gdAvsGpN9ukYsEzIqu/3gjsO4+/zpD9hvJzKE4IcwBXHqqTyGol/?=
 =?iso-8859-1?Q?BnjuzJcwl4tpldaL0TZVxpTyIAHHa7iwkVeZBCqbBT6cTw/65Nr3jIOGYE?=
 =?iso-8859-1?Q?pi7TQXHgPu0M+brCL4SiktFkb0alE9VwWbyUu4wI+gbU5+dRTTAInGGy8w?=
 =?iso-8859-1?Q?Ckp1S48tlJDKOvep4vkmhxQqHCS9gwtOuJAnRUTMJLl8sA1baRs3VKRnzw?=
 =?iso-8859-1?Q?c1DqV+oLs283fJozrAxLKaZED7dYHcMeD7k56bLtj8IiQknJo8lrseX0VI?=
 =?iso-8859-1?Q?Hl9F3DJpotWCixtBsdvdHuEMn+glAVxviNcz/WLayGBI9iaLV4XGB69MNU?=
 =?iso-8859-1?Q?octm8ea9ZgC/k0Hl3TRIaQzLmzPQHxK/NQUBNvE8Ya5AA2N+Px1uDFYM4S?=
 =?iso-8859-1?Q?wrWpUmoOJYPgde103Mx04q+Qdc6ahjNzdW0n2lntMGBZ5oFBp1UpHQ0wKg?=
 =?iso-8859-1?Q?Ygu50aTEvLeWYv5cXmSNfY7z3VLL5D5HxhGuJbI54OZvhaWe44lgFDIG8u?=
 =?iso-8859-1?Q?dUgsfgtwYn5gHs9tEPxyapzaoPF+J5FzlU5yP8CEBCZwTfWabn2UWc4nVN?=
 =?iso-8859-1?Q?LDLgJe5cgG89NCQw2nn+eI0sUAzTrrcKSNk3eNIKGXyhFpLzJUWhPo+Hyq?=
 =?iso-8859-1?Q?raPL72vLbfLv4RGhjbmWxUBq1LXb/oWOOgifQ+rlXZVti4zI2S7nCjGJY0?=
 =?iso-8859-1?Q?SFfNvJhstN62j2KG02vMthb0Z3Z7MznqEh9hlolgXt+yq1tAqGFPXQ5GZk?=
 =?iso-8859-1?Q?hDGR3Frx8oJPwpuBugImlpkyGzYx9HoHw5LOA5gSx8YSsmKXZPXUpHQoe0?=
 =?iso-8859-1?Q?8YbA3r77IvW5HoCGEWO2mJkFV5XUurPFjsbpsgNRW+1s5aPprtPO59siXM?=
 =?iso-8859-1?Q?gXw+5t4kW8FWWVtjkSRH/JuutaIHCJD0X7qX29QIDyUDV65ce6II59jXwo?=
 =?iso-8859-1?Q?Tqtdmeky5ZPNFZ4XRINEawZWdnIp2UzwhtyYE5fmIInXB77Q9U4oe/5o0s?=
 =?iso-8859-1?Q?eddpr4I3QQ/6oyRCrm8F3AnLAFlFAAG8jGNPBzree2maabonf6JNBVEVqw?=
 =?iso-8859-1?Q?Iy6iB7ijXs19U192VOsUnPFHzRvfSSr/Bs9TnviwHZgFixnn9Uxqn8qCP3?=
 =?iso-8859-1?Q?YTUnC+ySdCF6ZNMu/mZnU5deqpDnxYPcf+GI2E9vlECCsYRyECmM/1z/2g?=
 =?iso-8859-1?Q?2gsUHfSAFiNSZWG4WUBmKpHbZat4XEythi/jrsmUcZR+UTqa9J5XGAlkKX?=
 =?iso-8859-1?Q?lmqBOA45rm2bgaZYlHhPQmculup0ABl0hN6yQSMGb62LwThdnRU6iD6W7F?=
 =?iso-8859-1?Q?NpwLmnv62q+iptcZrodByQ9TxHBa+xuvWEVrZ7H9ncGC4wJO5G7zkdg2xo?=
 =?iso-8859-1?Q?Kx28xhN7KHIy1dzezZfE56JUm8kdtEzG7pFr5Lz79o6qzwO4BRpB1S9qgP?=
 =?iso-8859-1?Q?mwdwBJOk5ahANkd+m0xlMD8jWrGf0VMabc?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6556e3-c4dd-45d9-5bfd-08db8d46625a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 19:36:04.0278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K7xhv3Jcd3rNJ06ONY8tiuR8HyQE6C1ggI2cyLzf0S00CGBnMfv8y3uGx/sbrqhDnoFWVKqw9AGDLR5bExEIfg==
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
> Subject: [PATCH] platform/x86: hp-bioscfg: prevent a small buffer overflo=
w
>=20
> CAUTION: External Email
>=20
> This function escapes certain special characters like \n.  So if the last
> character in the string is a '\n' then it gets changed into two character=
s '\'
> and '\n'.  But maybe we only have space for the '\' so we need to check f=
or
> that.
>=20
> The "conv_dst_size" variable is always less than or to equal the "size"
> variable.  It's easier to just check "conv_dst_size" instead of checking =
both.
>=20
> Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index b0a94640ff6f..32d9c36ca553 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -94,12 +94,15 @@ int hp_get_string_from_buffer(u8 **buffer, u32
> *buffer_size, char *dst, u32 dst_
>         utf16s_to_utf8s(src, src_size, UTF16_HOST_ENDIAN, dst, conv_dst_s=
ize);
>         dst[conv_dst_size] =3D 0;
>=20
> -       for (i =3D 0; i < size && i < conv_dst_size; i++) {
> +       for (i =3D 0; i < conv_dst_size; i++) {
>                 if (*src =3D=3D '\\' ||
>                     *src =3D=3D '\r' ||
>                     *src =3D=3D '\n' ||
> -                   *src =3D=3D '\t')
> +                   *src =3D=3D '\t') {
>                         dst[i++] =3D '\\';
> +                       if (i =3D=3D conv_dst_size)
> +                               break;
> +               }
>=20
>                 if (*src =3D=3D '\r')
>                         dst[i] =3D 'r';
> --
> 2.39.2

