Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA274C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Apr 2022 15:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244829AbiDKPEE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 11:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241792AbiDKPED (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 11:04:03 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C1622299
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 08:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq0EwM1Kjq5eqKIucHLJxBfkzYCIjbJiqqu61By8mUvG72Eq0EywJydgZObpH7GoA5j6r/PXBwipQOkNhKmZQvR0G1FjenmcYtp5cmGATJprTTgAHQkhmSi5n1F7DlMEmyXz/lM6gh5mHdgsb17keP3sG8ITElsmOQTH5Z8EecBQAELYsm7xZD5rqYL1BDR5Led2mLEGSd+tmF4J1Jv0UQs6/jr6GqfzSJnxlmpgREuLsh8A52QochNai0qXiL3PXxnOV8ovzW5p955LNLbr6RqeICyHVGN99A9c0iAw/x3zYh+zPensHhGpOYouNH1N2GjIFCF2nzOv1IEP/IkoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aq1gi2lLB7Hm6a1//caUOyCiRDVf1vqAkWjhd5g/ME=;
 b=ilfHprWG/XGQwejpDSRvsRAWXH05OmnVDhnBZCmT1nC/TeZ91SirG3GUu1VzhH/oScHt9OMws7Gej9Ry/8t6lwD0XTas3bbEBmGRiX/fT/jSTOnOnSoZ851pJmHjqb3sUfJNSbnQ4YCYVhScGTjkyaXctU5vM+canlX5zNpvguzsDWfqXl3KkbFbSCSXqJLhkB/VHDcqAEtUKUNSaHrHCE9QbbU2NSvwqSJv3FIk5j2OM6oSOHjqOsuw9v4+RZfltaqnHgfcB9ChmdL50CVj6xV2rPu+phPcEnhQ9McW7FhsdYA8EujOE1qvyYNWzddPtNkNd9Z7fpUKAMVJlYTlTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aq1gi2lLB7Hm6a1//caUOyCiRDVf1vqAkWjhd5g/ME=;
 b=MjFUosnsvNF7+zElBBmhXXkBPyE8MaeziW4tu/dOuXxe2CgglJjQGPFj0UWAnoHqBjvUr2SfJhmpmuvxGMLBXjax6ZCGz3kzX+hlKIQjy3jP8HYVyoS6TkUe1n3lmHhNCdUgJbj2Qq0Vv0ydjA83pE2L2X33exG02LJwyCb5WkQ=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BN6PR12MB1252.namprd12.prod.outlook.com (2603:10b6:404:15::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 15:01:47 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::3157:3164:59df:b603]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::3157:3164:59df:b603%7]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 15:01:46 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "Goswami, Sanket" <Sanket.Goswami@amd.com>,
        "rrangel@chromium.org" <rrangel@chromium.org>
Subject: RE: [PATCH v2 1/3] platform/x86: amd-pmc: Move SMU logging setup out
 of init
Thread-Topic: [PATCH v2 1/3] platform/x86: amd-pmc: Move SMU logging setup out
 of init
Thread-Index: AQHYTbHDN0xG4aJY+kGk/rBsQgsYSazqzSQAgAAAahA=
Date:   Mon, 11 Apr 2022 15:01:46 +0000
Message-ID: <BL1PR12MB515730606FF854B6FB8721CFE2EA9@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220411143820.13971-1-mario.limonciello@amd.com>
 <3bb519ea-31db-d02a-cb39-d7e92e3f9a18@redhat.com>
In-Reply-To: <3bb519ea-31db-d02a-cb39-d7e92e3f9a18@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-11T15:01:44Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=eb44bce6-3b78-4d4b-a4c0-9e89a0945924;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2022-04-11T15:01:44Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: 30800647-c2a8-4993-a8e3-d16221688d3d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 492d9695-eff1-4c9c-f5e5-08da1bcc3306
x-ms-traffictypediagnostic: BN6PR12MB1252:EE_
x-microsoft-antispam-prvs: <BN6PR12MB1252E7A60245C196ADE00627E2EA9@BN6PR12MB1252.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6hJNjHBBHXFoujc0+j8FYW+2gBAaqv1uW85jjdyLQCW8/OfiiGIO/IhGI7OUDz+MFp0dabiBfG00td19yfCtyHFwqooV8hJhI7BONjwhCdi2lOWmbws2PfOHt8qoOCfK1pM85P0a1HOezA0z/DZnUuHh14NeEzUrq8sDWFHZxmZCvONK+VCqYbxH8Rhn+UDkFbg1aZuQypEAiPi++0kLDmXIFF5j+k+hUbPYUrdIT3+THEY3ShUY5jGDcBEtWjvTI24SAvMna/FUvO2JPrDRbHnbVZxHWaf2OhG3Lwi3/uPsZabeJMwBxkmJ/Cuob/jrsDPMee02Slc638qbcFqIWBvTVi5HXyX/uCm0hJrmJql5veeAlNtdrQ0hgnOtEfKD+krXLWi8iGdFhQvdTCrhIQzPQHbx0QTUCSXVJfZqQw8fmVx0EmAuwfAifDQGniBr61PRa1urJ0IV164GYPymW0DpaMu9BNvRuHcMWnZDQ7iYz40QyiyyYhAhgVXFRVvjhjHa4NhrOHRIwxT0VeqB32boWkC4Hk4KEkEVZ4wvAsMtSnTpxembMrmWJli5ufYPwcm7aNS+CX1bXjKvZkrIMlObBq66M6JExiW5iNK1TKXt69rWI1cDcjfI0lMmlfR15fyCK3/HQcTDozXCraIf7x+csaDrmRkmeqYlUS9NOH4EVZDwL55kO/ppRwhJHA4DgNdLQnWV3GYJ1Mt7Kg4MLYlpq7eHp9gOzAOoF96OXanWO2spvow96qLMdYQzKFOWPJxK1A9bAL8A40H8xSKiYdLUKOqMRgck/yNBmk6uJbU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(66556008)(8676002)(76116006)(66476007)(64756008)(66946007)(66446008)(186003)(110136005)(86362001)(508600001)(5660300002)(54906003)(966005)(38100700002)(83380400001)(33656002)(45080400002)(8936002)(122000001)(71200400001)(316002)(6506007)(38070700005)(9686003)(53546011)(7696005)(52536014)(2906002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cLBVNOt3v/R5rECGGNHgpy689ORwVgz95bP/5qmlbU/6vbMb0RfMb84mYw3t?=
 =?us-ascii?Q?SjedJ7g9oqhBpGLW1+t97d9L5s64HWFBTmrFfXtc7ir/V+RwQtP8zXFd1Hxx?=
 =?us-ascii?Q?lD82iRaB24ZFp37k/ClamvAcprkBqf7yP9vQ5xH0UYcK3fX78ubqgXG0F/UR?=
 =?us-ascii?Q?OY2Dcj89TRUUoxJWq0hywj0QkvTFA5c8jdADJBefyFGZ54jjI+2skWydc54A?=
 =?us-ascii?Q?l+7TJNpt65VQ19iSy7Vh6b53MrFqns9epCzmLouDCoGjrHym77rVOBwdzaBk?=
 =?us-ascii?Q?XsEJYIyYCBkiUy0bBrMzbcSK4THegeWXgr2ON3lCwyk2vD9NJP5/fETiYy82?=
 =?us-ascii?Q?rYKYv2daLxqqCaI3bjmGuWI52daABDrJzk1AmAbsYfIT39YxztOKlKnXQYXe?=
 =?us-ascii?Q?D2Yny0CVQ+J4DAHa0jwqLvKq0GQmUgFBTrbw5Pvr9dYFv9JisWv9vtnNwWNC?=
 =?us-ascii?Q?AggbMUb+rE9K3guYkjNBrCF+jDQxNAgPaWlB7RqDOIHNtzkVNd/Ua3mFus4J?=
 =?us-ascii?Q?B0Dqw6PVc2K3QjcwvhntFn2cpRDzCSY7uAIWNv5pOWdiqxpxjYKgccV1sEOS?=
 =?us-ascii?Q?8FZQaV7WI7yx7Gyx3Iz7h46R+Afs0IBvFNYhiLoTZFKLO6ZQ0N6p3a1yIqqz?=
 =?us-ascii?Q?SraJM4TIoZ9phRslNSIQ5YZOyqdn6aEIC+9zG2x3LJ3hWkbVWgINgSYvbGfC?=
 =?us-ascii?Q?jeCJc0JtF6SrOJpo1cbwrZ4b/rl4PnLUR7jws99WB7bXM2amH0VzYCQ+p6QR?=
 =?us-ascii?Q?KYCrqkz/quXBjRkUqmrfgjkh3RtCCndlA3w2QXd90IpsmFc2+U1po/Ts5KEN?=
 =?us-ascii?Q?6tvFkDhzWaXwTYNAbp2n+wxS+bJ95K2jgTQcm/oYvXLsNQynsooKU7dJ80DG?=
 =?us-ascii?Q?hknXYpA0ryj6Xgf884+icswlifByyleS4OxzMvIiXoY+pPX2i/Ia2CIEvAG+?=
 =?us-ascii?Q?BPU1Jkx009voASuTV7OtcWq0T8xzCVdXKzoiZayllWd+AXSu91nGTd/os8iJ?=
 =?us-ascii?Q?p1yWmSxf3KoBKagMXMX77zkbV4U2EgzTEyrrYGby084Q/qWUFxPtd7E1kYi+?=
 =?us-ascii?Q?M6SraU2ToJzAw/+KLMVVFR59uRDjlOuWPhWQ2BI6aYhvpStO2a+QQPTuNtVX?=
 =?us-ascii?Q?hGqd3GWNwDbcznTjCRdJAafIVmj+QPQAZ437IQb4mfStD6u3yFTL2FydCy+D?=
 =?us-ascii?Q?MWnNaHmK+zuaxnZ1hOHdSY7ER3bYJ4kJA8XBK4wEC4MFjCq+fj2glelTR2HS?=
 =?us-ascii?Q?VQp9ds0/F3wRCUk7xk68D8dMeuAwQJd1ZZKOwwQ5FtBON0MxzK1oK5krN9jO?=
 =?us-ascii?Q?K+59tctEUWZsNVtEQQ50mSmVBv6p1KnOxLDDoqiNLUvUuDi0ICrnxDi8+tgr?=
 =?us-ascii?Q?aF2N5p/Aw16yoFD6f0x+fbNgJOBZyDa+shfpuvihQNAYw7C/nDeQ8WOIVP1Q?=
 =?us-ascii?Q?wuzTA2JXaVPXopPLdW33/zdZvBbiXAa0NvfjVQr2AEEgrYhgfkplz/o1aWqI?=
 =?us-ascii?Q?kZqC6s771UvnXMsHn8cQR9y8uPzA8eaxVkVFTwIbDV5LieCOlI+pJqsilHrn?=
 =?us-ascii?Q?hDcC1Fao1U/8gu1fjk/+XRotDrj08gV/O0OSiAIBjGW5kSe9+da3IP7Ac5nW?=
 =?us-ascii?Q?arf9FpKqXceQT2zCAoCsxiu5e0Kud0fXqUBQddwWY9sdCYYD6ho2Qo8xSya7?=
 =?us-ascii?Q?dv8W5dDzqS3Q1/Nqju82+P0e7UBhHJLx4LFGqgt+dAjO+HmwPQG2Qx5o63Sz?=
 =?us-ascii?Q?xQdx4FB7HhS0K31t5DNXwSQzwxTvyhz7u9RlH7aWfzATCCcQuy8C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492d9695-eff1-4c9c-f5e5-08da1bcc3306
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 15:01:46.6750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ES4zfQkHok4eHtRMWLgr14YXYYfJpBIbOEMT7w0FknV0BgD+UWTml1epdZX8p/At3mPaurAtHpXD4ji0Tgg94w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1252
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[AMD Official Use Only]



> -----Original Message-----
> From: Hans de Goede <hdegoede@redhat.com>
> Sent: Monday, April 11, 2022 09:56
> To: Limonciello, Mario <Mario.Limonciello@amd.com>; Mark Gross
> <mgross@linux.intel.com>; open list:X86 PLATFORM DRIVERS <platform-driver=
-
> x86@vger.kernel.org>
> Cc: S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>; Goswami, Sanket
> <Sanket.Goswami@amd.com>; rrangel@chromium.org
> Subject: Re: [PATCH v2 1/3] platform/x86: amd-pmc: Move SMU logging setup
> out of init
>=20
> Hi Mario,
>=20
> On 4/11/22 16:38, Mario Limonciello wrote:
> > SMU logging is setup when the device is probed currently.
> >
> > In analyzing boot performance it was observed that amd_pmc_probe is
> > taking ~116800us on startup on an OEM platform.  This is longer than
> > expected, and is caused by enabling SMU logging at startup.
> >
> > As the SMU logging is only needed for debugging, initialize it only upo=
n
> > use.  This decreases the time for amd_pmc_probe to ~28800us.
> >
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > ---
> > v1->v2:
> >  * Drop extra check for dev->active_ips as already validated in
> get_metrics_table
> >  * Add tag
>=20
> Thank you for your patch-series, I've applied the series to my
> review-hans branch:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ern
> el.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-
> x86.git%2Flog%2F%3Fh%3Dreview-
> hans&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com%7Ca66415c73ed
> 04611830c08da1bcb69d7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0
> %7C637852857715985040%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata
> =3DhZkKrgZOzSgTIUe%2BGJK7wGpq%2BoCgB6j9SH%2BUT2rok9M%3D&amp;reser
> ved=3D0
>=20
> Note I had to resolve some trivial conflicts manually because your
> base did not include the "platform/x86: amd-pmc: Fix compilation
> without CONFIG_SUSPEND" patch (1), please double check the results.

Ah thanks.  I had done it relative to platform-x86/for-next (as of b49f72e7=
f96d4ed147447428f2ae5b4cea598ca7), didn't realize it wasn't
yet applied there until you said this.

>=20
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.
>=20
> Regards,
>=20
> Hans
>=20
>=20
> 1) To avoid this in the future please use the:
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ern
> el.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-
> x86.git%2Flog%2F%3Fh%3Dreview-
> hans&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com%7Ca66415c73ed
> 04611830c08da1bcb69d7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0
> %7C637852857715985040%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata
> =3DhZkKrgZOzSgTIUe%2BGJK7wGpq%2BoCgB6j9SH%2BUT2rok9M%3D&amp;reser
> ved=3D0
> branch as base in the future.
>=20
>=20
>=20
>=20
>=20
>=20
> >
> >  drivers/platform/x86/amd-pmc.c | 47 ++++++++++++++++++++--------------
> >  1 file changed, 28 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-
> pmc.c
> > index e9d0dbbb2887..103ba0729b2a 100644
> > --- a/drivers/platform/x86/amd-pmc.c
> > +++ b/drivers/platform/x86/amd-pmc.c
> > @@ -162,6 +162,7 @@ static struct amd_pmc_dev pmc;
> >  static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *dat=
a,
> u8 msg, bool ret);
> >  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
> >  static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
> > +static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev);
> >
> >  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int
> reg_offset)
> >  {
> > @@ -319,6 +320,13 @@ static int amd_pmc_idlemask_read(struct
> amd_pmc_dev *pdev, struct device *dev,
> >
> >  static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metr=
ics
> *table)
> >  {
> > +	if (!pdev->smu_virt_addr) {
> > +		int ret =3D amd_pmc_setup_smu_logging(pdev);
> > +
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	if (pdev->cpu_id =3D=3D AMD_CPU_ID_PCO)
> >  		return -ENODEV;
> >  	memcpy_fromio(table, pdev->smu_virt_addr, sizeof(struct
> smu_metrics));
> > @@ -447,25 +455,32 @@ static inline void amd_pmc_dbgfs_unregister(struc=
t
> amd_pmc_dev *dev)
> >
> >  static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
> >  {
> > -	u32 phys_addr_low, phys_addr_hi;
> > -	u64 smu_phys_addr;
> > -
> > -	if (dev->cpu_id =3D=3D AMD_CPU_ID_PCO)
> > +	if (dev->cpu_id =3D=3D AMD_CPU_ID_PCO) {
> > +		dev_warn_once(dev->dev, "SMU debugging info not supported
> on this platform\n");
> >  		return -EINVAL;
> > +	}
> >
> >  	/* Get Active devices list from SMU */
> > -	amd_pmc_send_cmd(dev, 0, &dev->active_ips,
> SMU_MSG_GET_SUP_CONSTRAINTS, 1);
> > +	if (!dev->active_ips)
> > +		amd_pmc_send_cmd(dev, 0, &dev->active_ips,
> SMU_MSG_GET_SUP_CONSTRAINTS, 1);
> >
> >  	/* Get dram address */
> > -	amd_pmc_send_cmd(dev, 0, &phys_addr_low,
> SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
> > -	amd_pmc_send_cmd(dev, 0, &phys_addr_hi,
> SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
> > -	smu_phys_addr =3D ((u64)phys_addr_hi << 32 | phys_addr_low);
> > -
> > -	dev->smu_virt_addr =3D devm_ioremap(dev->dev, smu_phys_addr,
> sizeof(struct smu_metrics));
> > -	if (!dev->smu_virt_addr)
> > -		return -ENOMEM;
> > +	if (!dev->smu_virt_addr) {
> > +		u32 phys_addr_low, phys_addr_hi;
> > +		u64 smu_phys_addr;
> > +
> > +		amd_pmc_send_cmd(dev, 0, &phys_addr_low,
> SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
> > +		amd_pmc_send_cmd(dev, 0, &phys_addr_hi,
> SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
> > +		smu_phys_addr =3D ((u64)phys_addr_hi << 32 | phys_addr_low);
> > +
> > +		dev->smu_virt_addr =3D devm_ioremap(dev->dev,
> smu_phys_addr,
> > +						  sizeof(struct smu_metrics));
> > +		if (!dev->smu_virt_addr)
> > +			return -ENOMEM;
> > +	}
> >
> >  	/* Start the logging */
> > +	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, 0);
> >  	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0);
> >
> >  	return 0;
> > @@ -634,8 +649,7 @@ static void amd_pmc_s2idle_prepare(void)
> >  	u32 arg =3D 1;
> >
> >  	/* Reset and Start SMU logging - to monitor the s0i3 stats */
> > -	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_RESET, 0);
> > -	amd_pmc_send_cmd(pdev, 0, NULL, SMU_MSG_LOG_START, 0);
> > +	amd_pmc_setup_smu_logging(pdev);
> >
> >  	/* Activate CZN specific RTC functionality */
> >  	if (pdev->cpu_id =3D=3D AMD_CPU_ID_CZN) {
> > @@ -846,11 +860,6 @@ static int amd_pmc_probe(struct platform_device
> *pdev)
> >  		goto err_pci_dev_put;
> >  	}
> >
> > -	/* Use SMU to get the s0i3 debug stats */
> > -	err =3D amd_pmc_setup_smu_logging(dev);
> > -	if (err)
> > -		dev_err(dev->dev, "SMU debugging info not supported on this
> platform\n");
> > -
> >  	if (enable_stb && dev->cpu_id =3D=3D AMD_CPU_ID_YC) {
> >  		err =3D amd_pmc_s2d_init(dev);
> >  		if (err)
