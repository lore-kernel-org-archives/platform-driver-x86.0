Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B1DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 18:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345711AbiCPS06 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 14:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237492AbiCPS05 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 14:26:57 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F865A59A
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 11:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOFqbukJu5rz+gXQIHdL/63nPBQjX47h+txBEgNlnhF2UouEz1dBfdy1s2EORHiatptHeWjMJ+Efw/c5azkcLFoBxjycAxywkGpexPGSYyNltqIiAdXKj70jf6i6ePIiclaAewt1+AdxU/PvfNItxdg8xHINRmuouKK+tnmoyRBhSZZdZ2bLEtjV042+x0oIyLBcc/rgX2VzyB021G51hLlM7PYh7CqJH3Le/ROwn5N5QWeu0JeYIm1PpRTvHhirF4V86RM5TLzI0sBp1y+I9lJEZCl/T3rZwLLPtbsSBgnfBuHJJ6YNWrXLOjgrQxKe09pVYftJu0zMiPeN2fz0iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9qduYsFahgRuQK0TdCZYr22fz+3Dp19ACJXbvjaN/Y=;
 b=YdLL5WddcgVuJJa2wahBQjXcvnwul2zS/Q7rCjauupet8pXZFLWSGGo933f9InVGQ8lCzyHwbnkixRBgnnGIwl50E8OsRbt0knMRx48UQdE+3mL48YlpiSj8GkiF3IHGWxn2pAvqvRdcYSJoEsUGA2SUE8hI5ar1VAL8qBJi+/h5QKOfQ/FFapSB35jtJU1VYt5SaXyzWjZ/EkwRUE9zA0KshWOzmSB7SuFngjWiK1l98tPH5rplLRQMRCfRKpASdOjbNStzGGfehsBObrs8rX6bgAHxXkUIiWGa949+Ls9DKR3u8uuVVMTFLcqCZBG6ZNz/Os1H/C7ULZ4TPDbHIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9qduYsFahgRuQK0TdCZYr22fz+3Dp19ACJXbvjaN/Y=;
 b=JCfJzRm+VXR6FQWhSRmZHRaKF6OedwbYnFocI9TCEfOOBPLWVctQAcXEUeCm/kjBx7DkgTPdtJ0DR7A5bE1BlWcnATGkrqUcGjZ0giQH5tdjE2YBXzhnGZiKbfB0ogHN9jhB1xzvlJUfh1JogzAQoWK6o+vyuSBA1FImP9Hsdq4=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.24; Wed, 16 Mar 2022 18:25:40 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 18:25:40 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Daniel Dadap <ddadap@nvidia.com>,
        =?iso-8859-2?Q?Barnab=E1s_P=F5cze?= <pobrn@protonmail.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Alexandru Dinu <alex.dinu07@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Thread-Topic: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Thread-Index: AQHYONTN37ZmrvSyq0ixjjgRCkZtxqzBT4WAgADO84CAAAQKgIAAHLSAgAACkwCAAAWoAIAADD1w
Date:   Wed, 16 Mar 2022 18:25:40 +0000
Message-ID: <BL1PR12MB5157FD128325F8CCB77E390EE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220316012516.2233984-1-ddadap@nvidia.com>
 <v_ODhOndx3g1l-BhfKGCB6_nLY83LTc5vz1YDrVEVVF5CmgKUs1x9bmROyWXhmYkeQRVVnvfBnyrFyHaEKqtoZE5P7lKJJ1j_vE0J1Piq2Y=@protonmail.com>
 <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <BL1PR12MB5157B047D2DD5548FE08F0ABE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
 <7d56afc0-3428-6ab5-ba41-c5ce4f1a7ad7@nvidia.com>
 <BL1PR12MB5157CA033FD8117DCC79D0A4E2119@BL1PR12MB5157.namprd12.prod.outlook.com>
 <d3d86512-42c6-a5df-752d-efbb89257d3a@nvidia.com>
In-Reply-To: <d3d86512-42c6-a5df-752d-efbb89257d3a@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-16T18:25:08Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=2b9e9467-a409-4179-9c4d-c2b94ebd67f1;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-03-16T18:25:38Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 0b0bc57b-dcda-409c-9200-5b5faaeb44ef
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad95631e-6ba1-4bbd-886a-08da077a6010
x-ms-traffictypediagnostic: DM4PR12MB5892:EE_
x-microsoft-antispam-prvs: <DM4PR12MB5892ABF030E03D469CF34CB4E2119@DM4PR12MB5892.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uk1W1BNhT8ejo+S+jL+aq8PjUlga8aGzCyaJ3MeWkRVc4flY7hFtv+pYb4uSoDPoEmb7cr5rIsDTBD2LIaBOHGcGXyHUAVjJ1cViFxvHgFzuMCr4B04SOgjFLqiMVeSB8G4MtsnAkQ/CeClqpEFObj1xGg06lBDcgYjk88QZTScfA2eIzuBm7rFgrBFmVo1Tpuh/+f03pnkk/GNpFRd/mMV+l04cntbuY74mmZYIEBz9peT8w0UdYUw/MEE7tV94hpkrhbms9F1xjHnZpVWaW5JsP0bMwDmzACkVj9HxBzaOHb9y5M7xxIb0uwiNF70TRJtmKWEOtKz8Mt9HYkz1puNf+QE7C3I/BeI6RreSwX+9WPHN7QwPs7BegqXPHl5erV2mTLz7BbQE13jnS3Xhb9uw+HrFcmmy7tEkgJU2bMQz7Bzz6NoLF0Y/30pG6c3oW9BhxmtkV6VJIieBYoioOOZ2wPR/yFZjdKCR4FKVYdDhLZNRaFz8OlPDw236/njQ6aweS5+Ew0wpTYLyBicoThVTWr/HS4uB0ggI88dbkeuJQw7imLtz8Ku1kifumRWV3zOlv0zrccKxlkNaKw23G2ffcpINP7852nd6wJzItgWGwmZ/8P/orqokHSfNCYBAS5xxzDbrFp0UNHxfFsdBEyJviAfjL5/Ub0XibyLLf6akduTt6VvVcCoXqKvsaiXp1e9C4sFYwfPLfkpg8pZ8vEqV+iIk6+NJWQURxSxk8QI0g7nUzKj5/HLnN+RkaL7SIYo+NHaAsmZI1E76zSOErZJJdThzxYoQ1LYirYKKCQA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(33656002)(66556008)(8676002)(66446008)(64756008)(66476007)(4326008)(76116006)(83380400001)(66946007)(186003)(66574015)(55016003)(45080400002)(8936002)(38070700005)(71200400001)(52536014)(122000001)(508600001)(966005)(7696005)(6506007)(53546011)(9686003)(316002)(54906003)(110136005)(2906002)(5660300002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?DNyOL459hjIaFi/2WX9exT1WhdBEEA6Up/5s+NHGuY25Mjii49sXlKY9R/?=
 =?iso-8859-2?Q?D3vO1m5W+4QAbf+0OFXDZMrCB9YNXoq9ZNsMdh/Buh8jz1s68pVRx9KNvX?=
 =?iso-8859-2?Q?l5/uEZuHv67hQiieRL6ilVQ0B5N59bVLQTCAfDx0rTTwRY876hInN7aDWL?=
 =?iso-8859-2?Q?VkbnFGBeC6xcVSrZduvmVxejgqLhTbSJ4ADKnbo6zI+6G6eq2CRlRRwLLG?=
 =?iso-8859-2?Q?VucXis0tX29d0NwVnPyHrUCaUgJjYeTre/pJ03CJCOmgquKlnFplE1Gnot?=
 =?iso-8859-2?Q?KPhfQLL87ZZNcaotRM/+FsrdRFYb05h+lhMysvaqq3L/cep5ZSWc+SDzIA?=
 =?iso-8859-2?Q?JdlzRMpm+5BfYKFEKCrGCDtjX7EWcddgBrUfKjavyI+72zgTCnsfKC3bv7?=
 =?iso-8859-2?Q?k7b5jewBPgOLBr0iTrgBEZEA+/Blgln/hjt3iZmL0SnMScAsmSQe/YyTwY?=
 =?iso-8859-2?Q?957o30E9gY9SLLwCgBEHIT94jLCkXVEvs8DlTDvFcPeJpICy7dlXC9W13O?=
 =?iso-8859-2?Q?u1qZUJFPxT2scOWDPHSYdqURupGpFhtPIFMuke3LBhQLFCfXvbs27Kc1m7?=
 =?iso-8859-2?Q?r7rsEiFKx8hdneBpmnf0v2I/QsXktnq47UUUeHeBxWv/gaWzoordTaJS/4?=
 =?iso-8859-2?Q?WEKXhWFzpgEZ98Wh7pinXJvBQXLof0RH96B908/3HL/qJojPueQnyprIiz?=
 =?iso-8859-2?Q?SmezNQdj7eYhj6j1TkFPCnm9v3VcyrXxe0ANv+7qBCHbixWOctz+KHgVv3?=
 =?iso-8859-2?Q?l87I59N0V+KE3Gn00qZAMEErtSqHTtOAWYmV7yrHMMRrmuc9tIdRXA0//G?=
 =?iso-8859-2?Q?sqSmer9Iy4rdyfoLG5Cb08QESxodk48QI8drZaMC8a6XrNAbYFWaj0J0ke?=
 =?iso-8859-2?Q?0FWUhS6+Gfkjvu5GY5FO7W7OvO+r/xzMW4P9Fzbkv9+ypZIrkC4luul1+p?=
 =?iso-8859-2?Q?xpyTtR2ys7I4aMH90txo8EoU1aQpRk8WnM+B3B0GHCSLVm41eHShYKhOhQ?=
 =?iso-8859-2?Q?S0mBYMxeXACHqYNrtuAQBaOMvdgbM30eEA13sukvCPzDdRkG0gIDSsDcwg?=
 =?iso-8859-2?Q?v0NDAcTBAm4d3JnKcqCHiXzomirTz5dnuCUihW2nyn8THLocU5//q8bMUo?=
 =?iso-8859-2?Q?yO+xeLM6zoY6O0sYmq/fte7JqdiNNnccNFu1VCQY1XNoHY2EJ3zP4iBzeb?=
 =?iso-8859-2?Q?UaNiVcMg6bU3fP2xcbemk5Y1JWzY1sdc3d+PSbSvaQh+exZy/Mc91a5/fZ?=
 =?iso-8859-2?Q?HruVUy4mc8XlC/Dss/bTyjslsYGeUjlIwEho4xefHPYwwMlhB3sp/uT8xi?=
 =?iso-8859-2?Q?pOcZhaDo7c9jOOMCaldFBnw0y9qMYURjwI5VhmKACgljeiOSxnE35R4L42?=
 =?iso-8859-2?Q?aWJPYmFYpin/srZQNLI+aVcFUw22cRXAtszHikBTHmu9fbWW14Ia53KsyL?=
 =?iso-8859-2?Q?Gy6fks4H8+Bg95Z4qH6PO4EsqC19VWvNcn9fBdApQrjVaXUvi6JSVavXAG?=
 =?iso-8859-2?Q?8NYBcBFC98w/gafbCus8m2AIPwslEBw6MxMD3PQR9Ac5FfMW0JMyi36+0b?=
 =?iso-8859-2?Q?zciM6R2Av9KcamH3Y+dB8AzHo6IQ?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad95631e-6ba1-4bbd-886a-08da077a6010
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 18:25:40.4353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPRd1czdqHkHBVQLFwPl5tOHs2+jOjV0hCucTtrmLLnwpyU+w15ojblxhn5YLQaT3aW56ESqABzX4rNIF1yZRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]

> >
> > IIRC this is the bug you want linked in the commit message:
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla
> b.freedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F1671&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com
> %7C5559a4f23f46426add1808da0773b4ac%7C3dd8961fe4884e608e11a82d994
> e183d%7C0%7C0%7C637830490785879396%7CUnknown%7CTWFpbGZsb3d8
> eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C3000&amp;sdata=3DP%2FBcLeN9rnjGam4kh68ZQUBAPIDM4G%2Bk1ukb5
> k%2BRFVg%3D&amp;reserved=3D0
>=20
>=20
> Ah, thanks. Most of the people on this bug seem like their problem was
> that they didn't have the nvidia-wmi-ec-backlight driver, which also
> didn't exist at the time the bug was filed. There is one person with a
> newer comment reporting behavior that sounds like what this patch works
> around, and it is the same person who initially reported the issue to me.=
 :)
>=20
>=20

Thanks for looking at those.

> > But these two look possible to be the same root cause:
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla
> b.freedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F1791&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com
> %7C5559a4f23f46426add1808da0773b4ac%7C3dd8961fe4884e608e11a82d994
> e183d%7C0%7C0%7C637830490785879396%7CUnknown%7CTWFpbGZsb3d8
> eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C3000&amp;sdata=3DBv3lJJOG7BZxlvizh0L4gmHgakzjlJkl7TqGh9HTho4%3D
> &amp;reserved=3D0
>=20
>=20
> This one sounds like it might be a different issue, since it was
> apparently working at some point with a kernel that didn't have the EC
> backlight driver, and then not working on a newer kernel that also
> didn't have the EC backlight driver. That is, of course, assuming
> vanilla kernels: it is certainly possible that the EC backlight driver
> was backported.
>=20
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla
> b.freedesktop.org%2Fdrm%2Famd%2F-
> %2Fissues%2F1794&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com
> %7C5559a4f23f46426add1808da0773b4ac%7C3dd8961fe4884e608e11a82d994
> e183d%7C0%7C0%7C637830490785879396%7CUnknown%7CTWFpbGZsb3d8
> eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C3000&amp;sdata=3DJfUhLPRIMVLypLXoAxKhpSw7WIN4M%2BS4Y48MQ
> %2BzXdbk%3D&amp;reserved=3D0
>=20
>=20
> This sounds like it could possibly be a simple case of not having the EC
> backlight driver. Notably, the backlight device exposed by the amdgpu
> driver never works, in contrast to the system these workarounds are
> targeting, where the amdgpu driver's backlight device initially works,
> but then stops working after the first suspend/resume cycle (and the EC
> backlight driver doesn't work initially, but then starts working after
> suspend/resume).

I guess when we see backlight issues on these A+N designs the checks should=
 be:
1) Are they supposed to be using the nvidia-wmi-ec-backlight driver?
2) Is their kernel new enough to have it?
3) Do they have the config enabled?

Do you have a script or could you perhaps include some documentation we can
point people to check "1" so we don't always have to go tear apart ACPI tab=
les
and make guesses?

I guess it's something like grab _WDG and then parse it to see if there is =
an entry.

>=20
>=20
> >
> > If you end up introducing a module parameter to try to activate these
> quirks
> > it might be viable to ask the folks in those issues to try the v2 of yo=
ur patch
> too
> > when you're ready with the module parameter.
> >
>=20
> v1 already has the quirks plumbed up to module parameters (those module
> parameters just don't have corresponding sysfs entries). In any case, I
> only see one report between those bugs that sounds like the issue these
> WARs are meant to address, and since it's from the same reporter, it
> sounds like we won't need to be adding any additional quirks table
> entries right away.
>=20
>=20
> >>
> >>> Comments inline as well.
> >>>
> >>>> -----Original Message-----
> >>>> From: Daniel Dadap <ddadap@nvidia.com>
> >>>> Sent: Wednesday, March 16, 2022 10:11
> >>>> To: Barnab=E1s P=F5cze <pobrn@protonmail.com>
> >>>> Cc: platform-driver-x86@vger.kernel.org; Alexandru Dinu
> >>>> <alex.dinu07@gmail.com>; Hans de Goede <hdegoede@redhat.com>;
> >>>> markgross@kernel.org
> >>>> Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for
> >>>> confused firmware
> >>>>
> >> [ ... ]
> >>
> >>
> >>>> On 3/15/22 9:50 PM, Barnab=E1s P=F5cze wrote:
> >>>>>    [ ... ]
> >>>>> Lastly, is it expected that these bugs will be properly fixed?
> >>>> Possibly, but I wouldn't hold out hope for it for an issue at this s=
cale
> >>>> on an already shipping system.
> >>> This question I'm assuming was aimed at narrowing the quirk to only
> >>> match certain FW versions or so.  If there is no certainty of when/if=
 it
> >>> will be fixed I agree with current direction.
> >>> However I think it's still worth at least noting near the quirk in a
> comment
> >>> what firmware version it was identified.  If later there is confirmat=
ion
> that
> >>> a particular firmware version had fixed it the quirk can be adjusted =
to be
> >>> dropped.
> >>>
> >> Thanks, Mario. Sure, I'll make sure the firmware version this was firs=
t
> >> observed in is noted.
> >>
> >>
