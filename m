Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFEBC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 17:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiGKR3e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 13:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiGKR3d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 13:29:33 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2059.outbound.protection.outlook.com [40.107.96.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1ABD205D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 10:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rk0jL1U6KzuRHHt1Vz1rkBz8rjNkGcGVkdHex03lO9lqhO3Cx/GrQPprk9yMJz2+B4A7317qD5LFkDZZpG3ogP/0L7bft8S36HRSHn0ofmnROfyOclS5ZsJ107f2rqVuLwmbcQBHysQUX8I5joPaKnqerNzDhXybX5je/2z/+Eg8DtTr59dLPPkESv+LZjN42gFiUNLp400qMkg2AxdIfqw8Dk/ZpnB1NEpPjKWNPSL1CYuzbErQbOWD9ihkEAdcjukyGGM0fzwKzGvjqbpqELFU1hP87MehSFhhN4TAaMCa4zTOaHfJeOBqwGZcL8oDCXXIqyPaX7ogI/To6qPF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1CJ9CNQjVNC095pWB+DDj9pT5uZRhiEHaqIOsMgY70=;
 b=emJ5GkmCgYp2OHoKC7reiGVajCSslx4SvZWBSTpxC1TLCvcZANkEKQr5pJIjJWMo98uX9OJKtWti8C6HN1PZHfQdln9MO0HsS2p2l0I+kwnTKiTrfr2PGGJZ3P2SLxpFsKItNPr/Y424iVW75THWjB2eCH0nYSfrkz1t3Ob6GObrHXCk67UL9CAbGydFngxU95iNI9nZ0p5zwcWCUQ+reJDwdiVRP2ccIZDlgyEz3H5uAXipYTb8587j7vZ0YAl8qCRXiWorjrUnxMZ6poZYoGAfrWiIXlN/ecIlfiVUJDpNXAvHJEDPlTI7GfdkbeZmIHI5ZHP5ZFc3NqiY0Xhx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1CJ9CNQjVNC095pWB+DDj9pT5uZRhiEHaqIOsMgY70=;
 b=gFij5YukB9sDCHaNOldQ1cDmlbjx9xn16le+bYOSKflXwXZOHcW6KkN4N5eToCb2JyYbwsoAh3IAJj7fMa8z6SWPgwhQxI4b9Qh/CE2636NpObnIKILhu9BtD/8vEsbam50VAjh52lGr1zgSIcxIu/NGXgn3+b3i/Kt4FSm60fU=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL1PR12MB5256.namprd12.prod.outlook.com (2603:10b6:208:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Mon, 11 Jul
 2022 17:29:29 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::1143:10a5:987a:7598%6]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 17:29:29 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     Armin Wolf <W_Armin@gmx.de>, Mark Gross <markgross@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: RE: WMI driver duplicate UUID
Thread-Topic: WMI driver duplicate UUID
Thread-Index: AQHYkzP6H35eCBovR0mxnJBL5Xghdq115byAgAAHqQCAA4OJgA==
Date:   Mon, 11 Jul 2022 17:29:29 +0000
Message-ID: <MN0PR12MB61010FDDBF73FDC8DBB6BA71E2879@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <ddd7bf26-f790-1e7a-dd19-9db2e5336cff@gmx.de>
 <ae136d14-d632-5e58-fb21-28c5e79f92ff@redhat.com>
 <CAHp75Vd4J2VfBKCbQewNmjrPHk7-adjYkyxPh4tZbR67oUvW1Q@mail.gmail.com>
In-Reply-To: <CAHp75Vd4J2VfBKCbQewNmjrPHk7-adjYkyxPh4tZbR67oUvW1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-07-11T17:28:46Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=5244349c-af04-45f8-abfd-ea37884bb94a;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-07-11T17:29:28Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 27ad32c5-2bcf-44de-91f6-2205fd13e9a2
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71577214-9234-49cd-3014-08da6362e94f
x-ms-traffictypediagnostic: BL1PR12MB5256:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d7I2d6mj6lWZUiVDKWzeM7hzpl3dQBLt+mbmwX8BLAMYy/kvj3FqyWvhOabJGotmlRi0+QbGekin7/wzsOfhNto/QaUkynA63hzqqnRBj4VgUobyWG9/Q0SD6qzttwcLZr9+WpzC+xOhnQarD1fcWjEtg1U2SS4Cw7OoryhArzMq9AYU/2U/xg9P768wk2tTkz9w6FhokVJDFJZh5/Pe26aaTK5+2vkcuMmj5MfPloaCiXKYz0/uRNuA2sSV4Wgj3ZNr1Pf15sFualbjT1oAaG4y31E1zhCmPWo9ivJmNvBkOP/LbLO+TLpw/4KbATNFbQabE+P04Nay8BVUcT6DsTj2oKjFgtu+S5spUmRn1uKLsSHB90jMob9X0qcllphBy2zuWB1Gk5gGCdIjCer7aCix5pObl0DHEdJ+Zc1voABpJCE+Y/9Hh93IRlXLzD8R6Mq0N2jvOMTwu/9NblhupwHG4ucnAGnLLGxN9XFtdOSL4U7XXNv7iAVIt4K/uHrQy+NTfleDnHmiq/9Y3n5C9kwJIE5YYSoIV/vmNu9K36VayapO5Gp5mpvDOVSBmtRxZemyHjeykqlzD617lsxqfbNmuadYlcM0mYn4nYC3BxmeLBwZK9sjM9w/6Xlykv1pqurVL5z0Zjlae3mGNpl6Px6fljmVmpH8XCQdOI6Zwv6q343eOutrC8PB8HjfHfGf5/vy4XMPv8AgIxQy88GrC910xUX+ULEKhyirX8MN6QixO8fs+NWVn4JC0XfxfgpR4xMi1QYWVxJMCnwryqbPzjQujh4RFUFknSf89zTsoNxrCT9mibj5MVbHZUO4pZek4Dwr3wgujc7th3wTd+0lb+jjH6dKQ6nH83bUfQYvrFg9yhZFUZqjdCmQT/dwkrLx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(52536014)(5660300002)(8936002)(3480700007)(55016003)(478600001)(966005)(86362001)(83380400001)(38070700005)(6506007)(186003)(26005)(9686003)(2906002)(41300700001)(76116006)(53546011)(71200400001)(66946007)(122000001)(66556008)(8676002)(4326008)(110136005)(64756008)(38100700002)(66446008)(54906003)(7696005)(66476007)(45080400002)(316002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ryrCSBlSUMf1sYxqBJ1BWT6Vyn85sXw2qm7SYBOsiRNRMHf3q8bizTueAhA3?=
 =?us-ascii?Q?eAwjQ4tBG6ZhrSMk/ZGRYVaZVzl1oRkDfCe+7MnZyau1e4hF3guyYcSGUaay?=
 =?us-ascii?Q?RBNl7PuINGDoqkEPmCFj2oZp8HGGp+Mp6AGPMJwEaer6GcMZBgGborFkc6Za?=
 =?us-ascii?Q?h/7PrKL/N7MOYb8wEYjvpvdMB+UAxzH4RblgBNqvz/B6sxS+5YF+pw5MvTAK?=
 =?us-ascii?Q?rs3e1WAfAqpRbyduSzX9VWVI1Rjkcb9ENVAVDPuu1uO13m88t2swWmvMHSeU?=
 =?us-ascii?Q?i5qK4+EMkni/qreHvJZPSMEC8cO+h5HblwZpqvMp0Mg1q00aiEJ35J153rIW?=
 =?us-ascii?Q?jMUBZJhUS0aPG8ix9JdqqFTlXzE8VleSr2Pn2kvB3MgUqAl8g/LeAlucxR0J?=
 =?us-ascii?Q?+lyEPTpCIztYJvG0SPG/IvXOy3j6ZSOXxzEaRIIaNRXGDHLqevQmdwJmNfTv?=
 =?us-ascii?Q?8ee+rfk5E1iJTlrGkzRegVtvN6DPRCggsnA3sIgtj0k39vIc1b0nnU5cX03B?=
 =?us-ascii?Q?duug1yL9hGQ8o2EwUcI4IX3+BentRl17VLbDQz/2deV2VPyctguhD62iH9Oz?=
 =?us-ascii?Q?szshopoS2/H/kJa0WqUCeZuikd5xRi8jIrXBwxqrTB4O9u8sQLEKA8+FicpX?=
 =?us-ascii?Q?mzKmi8bR0o/3jGXivJiqMGyTqf5qMXAVR2HclnwIgs8iwekQx5pcG5eMGGPy?=
 =?us-ascii?Q?tgmucSvbJRdezrwjfZbmJqyOnZosZEmZBxEEumkA2aN5eHOafBmHE1MLoPcc?=
 =?us-ascii?Q?w6Eqcf6V1qT1x+K8MWXFS38OY8c211JIXXcwt1XYvW5/La91Ag+mErvZ+0lv?=
 =?us-ascii?Q?uhXk6x+2bLDfMQiOC7o9cFRapubSTvJXQjNnEQXntsi99oQrWFazx1zf1rFX?=
 =?us-ascii?Q?boZPwNl/ahUKInvbzBu6Nx+wJbLugB2XtIjrXRLlvck6b/qrdIt2W9aaZ5FF?=
 =?us-ascii?Q?wa++kcmHfpPuvb2Zw0uHSi2ji/vWWXQ7vGNLYXQk/0+VeL9RimqIjZy3J1N7?=
 =?us-ascii?Q?qtfgSDoWQf8wJNOulsXjPPu5zKMQrfaIrYvV98wHHhbWzerIV6YQLGz1RhBj?=
 =?us-ascii?Q?AQu85YUTAms/E7LAJ1WcPnAw29ofPstVJMQyEcULu0LYKUseZDXmVcgPgEoY?=
 =?us-ascii?Q?FLvUYsvckuduvql96J90S31Jau8CPV0fzZI1rf+9qVg6cLoKBvna33ndK68z?=
 =?us-ascii?Q?xVkiiTrowWKOC2/bVLDnhoDri+I1007yE+kEFpotO1tBZDyjkUAGilaJAalc?=
 =?us-ascii?Q?LqV+bZPZwW3Uy/RRiK+ZEHEDTFNxYgiL654ZoPsTlcv9S9mhlsIjzwxb+15V?=
 =?us-ascii?Q?je4gvPjvXUJGEc6+RvzueWj7qgKDQdfk36ypk74ZQCpV5mCS5bzMXD9dq7R6?=
 =?us-ascii?Q?e4Ie9lI4ANhio4Ez1AwzwUudA1+FVb0K3tF78oIDvjX488nwkdc9yRhtxLBM?=
 =?us-ascii?Q?cXRbwSPRHVAtauuxkZh4cp9TYfuwqQxDrwVnwp1xIxHD66OLKDU4Fq90ogFX?=
 =?us-ascii?Q?cMc4oU3PSq6BvZP5xRrgFl/7/EUWb42CNSg+VhrwtZ+Xl5CNvSn8xAiVzqhk?=
 =?us-ascii?Q?HLrg4IDC8ByMNLWe88I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71577214-9234-49cd-3014-08da6362e94f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 17:29:29.8416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qXPhTCl7EcHy2SoZxRPUbW22KhI944O0l2YngWUcF9QV4I7IW3nuaU53CyF1ZmRAvLZI/4Po6E/UYCvXZkPypQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5256
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]

> -----Original Message-----
> From: Andy Shevchenko <andy.shevchenko@gmail.com>
> Sent: Saturday, July 9, 2022 06:49
> To: Hans de Goede <hdegoede@redhat.com>
> Cc: Armin Wolf <W_Armin@gmx.de>; Limonciello, Mario
> <Mario.Limonciello@amd.com>; Mark Gross <markgross@kernel.org>;
> Platform Driver <platform-driver-x86@vger.kernel.org>
> Subject: Re: WMI driver duplicate UUID
>=20
> On Sat, Jul 9, 2022 at 1:39 PM Hans de Goede <hdegoede@redhat.com>
> wrote:
> > On 7/9/22 03:33, Armin Wolf wrote:
>=20
> > > while trying to write my own WMI driver, i noticed that the WMI bus
> driver complained
> > > about duplicated WMI UUIDs. After doing some research, i think i foun=
d
> the reason for
> > > these messages:
> > >
> > > Apparently, the ACPI WMI specification by Microsoft treats the _UID o=
f
> the WMI PnP-device
> > > like a namespace, which means that duplicate UUIDs are llegal if they=
 do
> not share the same
> > > namespace (=3D PnP-device).
> > >
> > > In my case, only one wmi-bmof device is used, the rest is filtered ou=
t
> despite laying in
> > > a different namespace since they have the same UUID.
> > >
> > > Could it be theoretically possible to fix this issue with the WMI bus=
?
> >
> > Yes this has been a known issue for quite a while now, there
> > is a bugzilla for this here:
> >
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz
> illa.kernel.org%2Fshow_bug.cgi%3Fid%3D201885&amp;data=3D05%7C01%7CM
> ario.Limonciello%40amd.com%7C68ec85e0fe614746fd3208da61a11fc3%7C3d
> d8961fe4884e608e11a82d994e183d%7C0%7C0%7C637929641896425658%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
> 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D6uVZ3KvXGg
> R4AoW9r%2B%2FGN%2BJtdzlQnVtsxp0v5DGsVEY%3D&amp;reserved=3D0
> >
> > As pointed out there, patches fixing this have been posted
> > a few years ago already, but they did not get merged.
> >
> > The patches are here:
> >
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkml.
> org%2Flkml%2F2017%2F12%2F8%2F912&amp;data=3D05%7C01%7CMario.Limo
> nciello%40amd.com%7C68ec85e0fe614746fd3208da61a11fc3%7C3dd8961fe4
> 884e608e11a82d994e183d%7C0%7C0%7C637929641896425658%7CUnknown
> %7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DGlS4xGplKlj6IBbrySl
> 3Pm55CNKsMr4meOyAG3%2B1%2Brw%3D&amp;reserved=3D0
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkml.
> org%2Flkml%2F2017%2F12%2F8%2F914&amp;data=3D05%7C01%7CMario.Limo
> nciello%40amd.com%7C68ec85e0fe614746fd3208da61a11fc3%7C3dd8961fe4
> 884e608e11a82d994e183d%7C0%7C0%7C637929641896425658%7CUnknown
> %7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D16UieLiYmcRdsB0E
> P%2B2ftVQ5MrrnzkpF6rCAw%2BZkBX8%3D&amp;reserved=3D0
> >
> > There is one review comment which needs to be addressed:
> >
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkml.
> org%2Flkml%2F2017%2F12%2F9%2F165&amp;data=3D05%7C01%7CMario.Limo
> nciello%40amd.com%7C68ec85e0fe614746fd3208da61a11fc3%7C3dd8961fe4
> 884e608e11a82d994e183d%7C0%7C0%7C637929641896425658%7CUnknown
> %7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DK0L8i9lsTyl%2FT3c5
> RNBWFc4kjbtWgzPNUuB5ew7EYGs%3D&amp;reserved=3D0
> >
> > If you can pick these patches up, address the review
> > comment, test them and then submit a version 2 upstream
> > I would be happy to merge this into the platform-drivers-x86
> > tree.
>=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.
> kernel.org%2Fall%2F1512786861-1014-1-git-send-email-
> mario.limonciello%40dell.com%2F&amp;data=3D05%7C01%7CMario.Limonciello
> %40amd.com%7C68ec85e0fe614746fd3208da61a11fc3%7C3dd8961fe4884e60
> 8e11a82d994e183d%7C0%7C0%7C637929641896425658%7CUnknown%7CTW
> FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> VCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DTjNdUrnI3nndRIkRpDkReuE
> VGQeVBeMuLtO%2FrK3yGdM%3D&amp;reserved=3D0
>=20
> This way it's easier to handle with `b4`
>=20
>   b4 am -s
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.
> kernel.org%2Fall%2F1512786861-1014-1-git-send-email-
> mario.limonciello%40dell.com%2F&amp;data=3D05%7C01%7CMario.Limonciello
> %40amd.com%7C68ec85e0fe614746fd3208da61a11fc3%7C3dd8961fe4884e60
> 8e11a82d994e183d%7C0%7C0%7C637929641896425658%7CUnknown%7CTW
> FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> VCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DTjNdUrnI3nndRIkRpDkReuE
> VGQeVBeMuLtO%2FrK3yGdM%3D&amp;reserved=3D0
>=20
> --
> With Best Regards,
> Andy Shevchenko

I forgot all about those patches, blast from the past.  Yes, please pick th=
em up
and carry the torch to fix this issue.
