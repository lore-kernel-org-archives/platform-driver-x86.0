Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0334C636D4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Feb 2023 16:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjBGQ2m (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Feb 2023 11:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjBGQ2l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Feb 2023 11:28:41 -0500
X-Greylist: delayed 339 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Feb 2023 08:27:58 PST
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 413D01A5
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Feb 2023 08:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
        t=1675787277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JEj9O+Aum2dDyQni5xWqTmWvs4j1zrM+hQNu8YMfjdw=;
        b=Xmv/hl64esHTtshzhslK1yiWXq8DO94vidiRcNrDPMdNe3GW12D4FOPQzMuUJZa2BsiPm2
        W9LW+1D9TPKPfcQcWi2qHYX0jtjhCAAnUi6xUJtafiGb7HcshsRPSJKTKSXR24fVNhpiWq
        pBsItfxJX9QJwzCn+PQWFxiMG4cdntM=
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-cfCzMLtiNC2ywNDfqbdNMA-1; Tue, 07 Feb 2023 11:15:26 -0500
X-MC-Unique: cfCzMLtiNC2ywNDfqbdNMA-1
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:160::10)
 by PH0PR84MB1502.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:171::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 16:14:18 +0000
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::38b1:a042:8174:6a00]) by PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::38b1:a042:8174:6a00%4]) with mapi id 15.20.6064.034; Tue, 7 Feb 2023
 16:14:18 +0000
From:   "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
To:     Maxim Mikityanskiy <maxtram95@gmail.com>,
        Alex Hung <alexhung@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
CC:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        =?iso-8859-2?Q?Barnab=E1s_P=F5cze?= <pobrn@protonmail.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Enver Balalic <balalic.enver@gmail.com>
Subject: RE: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
Thread-Topic: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
Thread-Index: AQHZOv2ZSacMBEbqbEy4rmnLZ5eFN67DpF2A
Date:   Tue, 7 Feb 2023 16:14:18 +0000
Message-ID: <PH0PR84MB1953959E3B2E51839A529CBFA8DB9@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
References: <Y+JbBiMJw+VLo2Nr@mail.gmail.com>
In-Reply-To: <Y+JbBiMJw+VLo2Nr@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: edb8ea59-1413-4810-a7c6-30bc71dcf1bf
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR84MB1953:EE_|PH0PR84MB1502:EE_
x-ms-office365-filtering-correlation-id: f7aae5ec-002f-4547-2efa-08db09265d86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: MzoCR3r6i02OGP5Ya3I6TbMjvNd/S3Syi2Rjx2FM9GJNs20yZ4mH/cKv16v4t2Im2qS7zHZxp8BLu83mqmO8hb4dOHkULlbPVG0FQR4baDSadNeK3ivIojv4HURPMXyKqbRkNUvYjlZTUlUTbCNk3sFFxueC13d5C4Oe8Nlq+s9PguLtkxu96s18ZcHB26vnUCiorIvovvHSrhF2DkOTR0RDRKH1wBfIuL1On/wxSSUBw7Zz13gXBay2MHRA5G/uWJyWykbUzN4aIeOtZywqhwaajTWnOusXCsZOLGlysX/o761ltUC+bLsC6PnfG01lnBTmEUYCiKIWeI0gofaCXqa73g6pBQBDhUKPY5+1jGSsyflSBiRtuppAfgHMTC7lrPEs9l3HEuWE06WjBvlN9KPGXQjiTOd5cxb9kGsRH8yRnzJMAKCjO8oDNsFZ5uuyLsyyiZNtFdkfdqrnnplvZWCKWTkjjlazwCLfKgznsEekm8RWPHe49G9f+DSRRSy14GvsaGnjC422zxocxJdSSDADf5QoM0J4sh/+eOGGvau7OQYbXXbluSY/R+Jx4rJUUCJ0bna9Lrl+hNs8raeHQ9oYxYgKigOUzqIdIKlaPNpE6LZtW/hs6defo0UPCkxK/NCWBmSHVxng20ZgE8KliJ/Inar/NcHe4BU3fMFDa2qeH4Epvkj02gKbgZTHcpinRfmJYyymHk+qn/hAz56YiA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199018)(38070700005)(82960400001)(122000001)(55236004)(9686003)(6506007)(26005)(53546011)(186003)(38100700002)(478600001)(66556008)(66946007)(71200400001)(7696005)(66446008)(64756008)(4326008)(83380400001)(66574015)(76116006)(66476007)(86362001)(316002)(8676002)(54906003)(110136005)(7416002)(33656002)(52536014)(55016003)(5660300002)(8936002)(2906002)(41300700001);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?7ezItk+KnJA5Gp5zzIpa70/UUIHRGrvggkFiR7QFEJp+mCpJ1blbFHeiVa?=
 =?iso-8859-2?Q?QFyYlf0cQtdi7wzKFWAiiGsB87GhvsTIqRQlE7l0MtinqZbNEi+v76IqCH?=
 =?iso-8859-2?Q?qFjSTdKz33XUJo6qllDmEBCbXnr/e+XyrMi9I/WOYf4tdoJXFtqu6POJBz?=
 =?iso-8859-2?Q?o4eQ7b6WYTfZyQA2I0L9pXC1zSLtdtYHL3JEpILnl3mPNkjvv2EonXNehM?=
 =?iso-8859-2?Q?qXCfakuJTbFmBSu0eoI7cVWKz4bfFVvjITTlL05qKF3PckJJPJGtZZURZT?=
 =?iso-8859-2?Q?N3c5WI5+7m0cjNzzbvqHegMpTGoBPTHi6k3pkVQ5TpgHMqNg8gECHCMvMS?=
 =?iso-8859-2?Q?UMAj9VqTTE1NOBaMUjKfaJt6borogcedTdWe69kGlySNpiCDKpmypodz0v?=
 =?iso-8859-2?Q?a8j1A4HO76iwjatBEkFVl8En60W1CJetbIZG6JPd0M98dV3i8C8jUJObTB?=
 =?iso-8859-2?Q?/VSeRg57ZR1tAhXwm8cHnpmPQU03YEn2sy+y/PUH+aX+/yAiaV5XCy9X/v?=
 =?iso-8859-2?Q?SnInTFJPgE2Z/Gze0fQ1Ut7UB649oJ1k3jeLYDcWZgweSToG/ng8APaVLz?=
 =?iso-8859-2?Q?fVgWQR+EFufg9PRAmbFL6ewHV0hMQZaRCC2urhJnsgUO9khJZf53rI1i3S?=
 =?iso-8859-2?Q?RuHDp6utVghmAWoiisFYFdxvLCQp69t8vw8Eta7eDUgrf3PazI6nIAjxal?=
 =?iso-8859-2?Q?E4By8AlJ1FBVS9fgoFKblkYaXkhskW01WBb8FXumzViK9fNd0RtziSZ1zQ?=
 =?iso-8859-2?Q?jJMwVlE/bIhu3dsd81/sOfU9CDQo0ZdxH/kj2SAeVbY4mCH7z8UMdi8nca?=
 =?iso-8859-2?Q?3fOpGl0VdkwJMaRkdC54PfWHO36b6TbJO1G+odUARqe9zVXD+cOLbFkSW2?=
 =?iso-8859-2?Q?+Y6lZx7m2l6MrhTIAlroTw3Oh7AQEGcoPkJc7s+fn4X5JxiD3QRqmBj7Yy?=
 =?iso-8859-2?Q?f726RwfY4PGZw+WXQJ0KrQCx+87D5gUpSWOMwOcwbYr/+8YUjdpRNi3aJ4?=
 =?iso-8859-2?Q?vhgCIGB7b7KiYUqmjCWU6HrVrxveuRwOuQFvl/cbxgiMHWnRFjdwv3+Chw?=
 =?iso-8859-2?Q?H5jk1DkWHCP6bRyZxtCO3W2D79ZGOGyoUTDSBZinLdWbPUfJWStUk+V6eP?=
 =?iso-8859-2?Q?f8SHHUjEir7oPC8ufUyzM5WWidNFGnE6arAO8VV9h2Z2hPwFdmUy41GCQf?=
 =?iso-8859-2?Q?W8Dg4c71c+qpMjApHUP4R0a8e53VbtpsObDmTQ6TPmKKidSeF4CoVtWuPt?=
 =?iso-8859-2?Q?EjX/H4S5o6P+CFcWVP30WNnNSm7Z+ap5+gpabqraBUarwSMAmsKN5tDyqg?=
 =?iso-8859-2?Q?Oad+SRlvWVm1KvjmoX6qSFtkD3MG3OOSgzkjy153Li+76B2x/sKlc3Cac0?=
 =?iso-8859-2?Q?KfgLAd0rNVVqKhSvHugjjezexEMopvrOKlTo3P0KG2Pjh0uruR/19kmQmO?=
 =?iso-8859-2?Q?GB/s+R73NET9Frn/81RlMEeExEiTkZSi/u8sje6T2MxZd1E9a+gSPdzwmn?=
 =?iso-8859-2?Q?Rs9/QGbQ/fT4z3WU+KEdjlipH3LO1aPTmM4P/rM/EPLIia+Nb0vaNhP3mU?=
 =?iso-8859-2?Q?iIaZQHYMjUpJJFEhPTGqzUuscPxNUDovOOiv4lNThCNSePffJ8vltpNH92?=
 =?iso-8859-2?Q?dkIeoZft/4AQZr6mKal+eAqRjAkPNNzwK5?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f7aae5ec-002f-4547-2efa-08db09265d86
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 16:14:18.4910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6ecYe8pKgHCKPLFHrsuRi14v0pPII4pfnpMBXsxPXgFtgnCzG7+rKbTsbzFrU+3xU5v3RVE88d9ljrxlofJqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR84MB1502
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Maxim,

Thank you for the detailed debugging and information. =20

The BIOS upgrade should have not affected the tablet mode behaviour.  Unfor=
tunately, HP does not have an official process to support HP Dragonfly G2 u=
nder Linux that I am aware of with exception of a few HP team members.  Non=
etheless, this is unacceptable, and I will forward the information to the B=
IOS team for them to investigate.
Personally, I work in a different team so I will try to get a patch out dep=
ending on BIOS team response. =20



Regards,

Jorge Lopez
Hewlett-Packard=20

"Once you stop learning, you start dying"
Albert Einstein

> -----Original Message-----
> From: Maxim Mikityanskiy <maxtram95@gmail.com>
> Sent: Tuesday, February 7, 2023 8:07 AM
> To: Lopez, Jorge A (Security) <jorge.lopez2@hp.com>; Alex Hung
> <alexhung@gmail.com>; Hans de Goede <hdegoede@redhat.com>; Mark
> Gross <markgross@kernel.org>; platform-driver-x86@vger.kernel.org
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>; Mario Limonciello
> <mario.limonciello@amd.com>; Barnab=E1s P=F5cze <pobrn@protonmail.com>;
> Rishit Bansal <rishitbansal0@gmail.com>; Enver Balalic
> <balalic.enver@gmail.com>
> Subject: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
>=20
> CAUTION: External Email
>=20
> Hello,
>=20
> I use HP Dragonfly G2, Arch linux, kernel 6.1.9, and I upgraded the firmw=
are
> from 1.9.1 to 1.11 (using fwupdmgr/LVFS), and this upgrade broke tablet
> mode detection on my laptop. I did some debugging, and that's what I
> found:
>=20
> 1. On both firmware versions: hp-wmi registers SW_TABLET_MODE, but
> never reports events. Although HPWMI_EVENT_GUID is present on my
> system, hp_wmi_notify never gets any events of any kind. Good thing is th=
at
> at least hp_wmi_get_tablet_mode (/sys/devices/platform/hp-wmi/tablet)
> works on my laptop.
>=20
> 2. "Intel HID switches" is the device that reports actual SW_TABLET_MODE
> events on firmware 1.9.1, but not anymore on firmware 1.11.
> SW_TABLET_MODE is registered after the first event (by auto_add_switch,
> on firmware 1.9.1 only).
>=20
> 3. SW_TABLET_MODE reported by "Intel HID switches" (on firmware 1.9.1)
> differs from /sys/devices/platform/hp-wmi/tablet, when the laptop is not
> fully folded, but put into a stand position (the hinge is open more than
> 180=B0, the keyboard faces the table). The reason is because hp-wmi only
> treats system_device_mode[0] =3D=3D 6 as tablet, but 5 (stand mode) isn't
> included, while "Intel HID switches" report SW_TABLET_MODE =3D 1 in the
> stand mode.
>=20
> I'm pretty sure about my findings, I flashed each of these two firmware
> versions again and tested what happens in hp-wmi and intel/hid, of course
> without changing any software versions.
>=20
> Regarding point 3, I can send a patch for hp-wmi, but it's not going to b=
e
> useful for my laptop because of point 1, and I can't be fully sure it doe=
sn't
> break other HP laptops (unless Jorge confirms?).
>=20
> Now back to the main topic. There are two directions that I see:
>=20
> 1. Fix the regression in the firmware and make Intel HID switches work
> again. Unfortunately, I didn't have success reporting the firmware bug vi=
a
> HP customer support, and they don't seem to admit the bug or even having
> uploaded their firmware to LVFS. If Jorge (or anyone else on the mailing =
list)
> could give me some contact of a person responsible for firmware on LVFS o=
r
> the proper way to file a bug report, I would highly appreciate it. Maybe =
Alex
> has an idea why intel/hid could stop working?
>=20
> 2. Somehow tweak hp-wmi to start getting events on my laptop and switch
> to SW_TABLET_MODE reports from hp-wmi (also fixing the stand mode
> reports). For this, I would need help from Jorge (or someone who knows HP
> laptop internals), I don't have ideas why it might be broken for me.
>=20
> I will appreciate any help, and I'm happy to provide additional informati=
on
> if needed.
>=20
> Thanks,
> Max

