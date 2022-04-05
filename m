Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91398C4167B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Apr 2022 01:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1844670AbiDFBuy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Apr 2022 21:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1572888AbiDERPQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Apr 2022 13:15:16 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2063.outbound.protection.outlook.com [40.107.96.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74DC32989
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Apr 2022 10:13:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwAjHc9kh3O1tf49e46Ab1lqlwWjoiV2BT7CebyE9pjkXfz5zAD+k9RJV3oR6BXBthge7bsi7RjCs2TPQG3kQzYY48CEB5cZKOXe1y78yCFEMZRyVUbuM3Qx/6LPOy5moEJe4G1dzvTrLK9HtxZY3uJvbX4jV/HlvS4wfVpdHeDuhqGeuCsZrNP8xxxVUP6UbCuOMZUN1k6K7BJsq+9e2IfUwXVmoT1kkmwAJocFnhrNDeXlXFsz07XPgbZq9ljm3yVrROBMUUxXREJFUbq0ZBeGssa40Fp6VI4GEWWNGjaFz7NM9RtmeRShqNgLDrdPb2Y/IeKo3UGI/3c3VcvG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9IZ5gcsrMNKpFE0duAoyVi/Q8uRPQhLp/ErRXVQH3M=;
 b=N7ltpbhbWfSKFrdObcvY+BqR7pkotW3JIxhasZCCiHYkaDcPv3e0qZx6ga5nNeIbgCaBVRic4f/qFfz80qPqoqXyLscjmOAOtHwhCba49AgpVIPPlfl/tlOnc6FqNVmwQ3TPjrjhv+pbViWxUoV7LpumcWqkY2Glmt8/CBdsUxFkcMEgohCREFrZyQ9ZtFzGuI6/47uewUarAEEDUt38dvveVTdzUzxqxw7Dd1himZf3fvv9sTqaKLnAjj2I2ZTGwUrzIsZ2CLOEDV1UQwlGei/suJovrYTJTuBy/Jbz8Mx1sWjXJnWJ66EA9TrhPSzyEz2S/S5l2banfNoF0d6sJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9IZ5gcsrMNKpFE0duAoyVi/Q8uRPQhLp/ErRXVQH3M=;
 b=Mk6hd7eZ/7HnjgwKt9rYIcNoNSf0m93UpQOx9qviWsdn6mjJ8sdYMm6ETRCyZ6v0s1JI+RR8URqb6B0KXSfsY2/Dqf8VR3nxHBlod2MBYev9yeYMd7ABZg4cR5PLePg3hQOK/MstXij+XiU2OmqNJV9ZvdBWAsbegGKYWrv1RAY=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BN6PR12MB1297.namprd12.prod.outlook.com (2603:10b6:404:14::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 17:13:12 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d%5]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 17:13:12 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v1 5/6] Sure Admin Security Feature
Thread-Topic: [PATCH v1 5/6] Sure Admin Security Feature
Thread-Index: AQHYSGxup5C3SuFLd0KJnoLPJoyL/KzgTXkAgADph4CAAFMhgIAABO2Q
Date:   Tue, 5 Apr 2022 17:13:11 +0000
Message-ID: <BL1PR12MB515721B0E512879ECD8189B7E2E49@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220404203626.4311-1-jorge.lopez2@hp.com>
 <20220404203626.4311-6-jorge.lopez2@hp.com>
 <BL1PR12MB5157263F33A534E144618223E2E59@BL1PR12MB5157.namprd12.prod.outlook.com>
 <f346c8c9-d932-cfee-ad6c-0671461e78c1@redhat.com>
 <CAOOmCE_kg2KPwZHMfqwHMSmmd3Yh3eaMbgMwgdW65j1Nk1f=7w@mail.gmail.com>
In-Reply-To: <CAOOmCE_kg2KPwZHMfqwHMSmmd3Yh3eaMbgMwgdW65j1Nk1f=7w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-04-05T17:09:50Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=647268a8-a8bf-4de1-bba9-df6eafca63de;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-04-05T17:13:10Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 03f90839-5e86-4e6c-ab2c-de13b0679458
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98540399-563d-4195-eb57-08da17279065
x-ms-traffictypediagnostic: BN6PR12MB1297:EE_
x-microsoft-antispam-prvs: <BN6PR12MB1297332A8C366DC82A7C4EAFE2E49@BN6PR12MB1297.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AS/zpKLvTuBfbGN9ysC6fw38wdGwrGUge5VCrc41Xuflsylegcc+bClIxKCOhotN4dtoJHEVLhT8fgu1VDXILt3X0dy7B+kFvHNZkLPxxW1+z0o4yjNSbnALreVwQYX2u7/iz/zqszCFRime09YoXxfvqkZzTnS3sRudT7Qeo1jmecYs443yUT6KsFbrVlXsRiZtL29SlAYdlo9Ic5B3E/Exb1du2jliJjbJoC6JAmLKzkAIkPABFAopa+FVwF5VFia3lTcy1ngBt9HqiqeMqZTKLZMjH0p8Hpmww8bosz6mB6ptw/ctjFWretAUMjHnUWQPvaDKl1H/R0TOqxxHA6zzCkYPs/siny1iI4Q76gua0NWRSwl0e8sxSUDXlzBEQ0yMTOSz8jmjw83w8mEsMfUsT0UZCFnwnekBDJWzLqDETCI/Ir2i4Lm/AXb6ki9EWOn9e8aDvu6I/+QeWbNt9aZLNi8sHKmEvXJoBcaO5GEbk2XyeAfKYQva7EOMnJEMkIl+0FwjySIMyYGOQgNRbfIir17EURy/+qDrmOKsGYu5xjEOtdM5cnO8fNAjBGf/2WCVkiOl+2cEQUkxrqYeC/Q+Tm+yyMrCyzn+34YdQu9aBcz9wWRAubBL3DXmFptf4uf+f02NoUUykBml0o4N2Gv7vMdXaomF5ntbksdGll+lRK4XJ8D/WsdKjvieFHkppU2PK3zw8HodvAtWI8XMNVJEwag/DjhxB3mxc46Cnd+08VDHW8OJTn0ZZ5agP36LmUzbo2Dm+fR641O2bI21hjDDNDpKWMwc0PUjZkPkY2w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(84970400001)(38100700002)(110136005)(508600001)(15650500001)(30864003)(122000001)(5660300002)(966005)(38070700005)(45080400002)(7696005)(53546011)(6506007)(316002)(9686003)(19627235002)(4326008)(64756008)(71200400001)(86362001)(33656002)(66946007)(66476007)(66446008)(66556008)(186003)(52536014)(2906002)(83380400001)(8936002)(8676002)(55016003)(76116006)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+kNBvlPxcDTB2/dOlrkau35OuGrzJqWKc3r6pC9oF7wswZj8+UMCYfiEn6hw?=
 =?us-ascii?Q?XM9+oeh8ee4mbvFE8ltCcspol+GmfVjHU7F2JLMuOL6lhlht/NcLQgBLFbsF?=
 =?us-ascii?Q?jz6tRDygSG80PZGqi1Fy3EojKQi7tV3WNNzzK+CYTXoN8HlPiGWAIBHaI2LL?=
 =?us-ascii?Q?aZi+QVSHW1/1GdJ1xR9Ws9KsQtq8OqFfiutq29txsSMa8cKMBZddCTJoc1Ll?=
 =?us-ascii?Q?c6jNq2atosxOiPEz0wJPdo41Z5L7QqsovvtkHLTjnL+hrX7drVFbUmwlL7c7?=
 =?us-ascii?Q?oJrCt028mjMN6n+y6TLjeqWZ4v3FUakwHnWAhWEM6s8OJLG+csUfxQu6ZrXK?=
 =?us-ascii?Q?1lw35Ie7CrhcvDDuplKlla2oyldQGlCUlfy4s9rQDcwMq1V7Slp2jCCofdHS?=
 =?us-ascii?Q?NInhR4HCzDa8bf37TR/eeUwXs5g/LPOnOE0R/ESVjuBhl3Or/ckTK44MN4WR?=
 =?us-ascii?Q?oxUnVpFj8t3qd+npqE3P6vZXvk4DgaWWC/RT56BkSThp68fS1DBbSICVNGVW?=
 =?us-ascii?Q?cueJX5GARVPx/1NHK08g02gT/QWZZVu5JVLdiexThBrYFxSDOorQps8NvaNp?=
 =?us-ascii?Q?G9o9wTW5O3hse0n25JJom4ntsT3iP3PsCKezyJDnlYIS/5nOw4oYTb+eq2W7?=
 =?us-ascii?Q?1sz2CBK0lbi0eWn5x6ApNX5rEb+8AmmLVnOb843O89PSkVgSqppggtJwAdul?=
 =?us-ascii?Q?WZ4RUaDK9vlyBgrWanMMZzH+Rwsk2bGvenZVC8jOOAecP3pQ084zNl8kmXoU?=
 =?us-ascii?Q?wC+xop5OTQ9kTuWmqor8u+HIUbN2nqNHDFFac79vjkEY5ByBOaGempN8IXQw?=
 =?us-ascii?Q?kIK27Xgg5160YkY9IiC50S9/LvHy0HO7zO3WayJBYzZYINiUAitHSLNqH1Q5?=
 =?us-ascii?Q?9YC1LFLrCYaWtYtTvZX7jTdwuMrTqOMlbNg4StDK7KBM5tGJSJiqruEthNul?=
 =?us-ascii?Q?Nl6am7bWARwKp1nyCMRohtr2A3ZCwtj+qzGQUbWTQwuCcnT2jgQw1ZhiMhuB?=
 =?us-ascii?Q?PlqsqsPl1Lc/JO/jMWsEX3YWyat1+E37rJYd65Ly4VU016FBKX95MIUT2OJp?=
 =?us-ascii?Q?3UVecjjyGEo1ab0HOhPLOVVMe2bnN8a7I39pntR3b/1GvLC/kOLSrYfKqWf8?=
 =?us-ascii?Q?C/7HqUg9jHcCO/c+yzlld+MwKpUgiHdGY+2pV67vL86Qx7ZG2jC4sp5ePmnu?=
 =?us-ascii?Q?OSb15VWdHUV0yEObLLmDeb7SjZKT7Fp12tJNMttLuezD1BDS4cm/k7vVqBkU?=
 =?us-ascii?Q?DJOx9cowMAOinOt1mhx6xqpBhkIY5LLfsCTYpRT+BFOoVhQSEaWwM9hBzXf8?=
 =?us-ascii?Q?1RoKyzes9HdqKEX2cCnYW9rg/iYD07JT1d1SRLu0FV1FvTI2K7hjeYgvWC/R?=
 =?us-ascii?Q?F6uqV1hNlJK3Lt4tqs7eYnHqgvHMWEexWH9MrVSFD7bggeKDLeeYMdiJddLf?=
 =?us-ascii?Q?Z7vYNIxiwoK8JGxf2xILxRuxSUvBnqrsI38KFxB1fCEmyJXTTRh3EhE8HxBk?=
 =?us-ascii?Q?01Gh5n0o9P4PsGHIC7oThNH7y6Y6PhjSQHxE0DAdqc9j3j4VoigkyqqXObwJ?=
 =?us-ascii?Q?RM/kOuiNM3UNPkOlNDdXePcvRFgFh4Ibr8yujS1Bu8l1g0/xj5VD2THhpAJF?=
 =?us-ascii?Q?YHo3T7z2dY+h97wtJb9qDkjJtYhGjQxsoIMwNptX84FzqSksCvz0EBYROrIk?=
 =?us-ascii?Q?jULdMPasz2OsPYVVH5ySP0gPN4v84Fb35Fi33zN23rKSWysyr/Sso3anxVsP?=
 =?us-ascii?Q?BZVzyDCwgA6WNuLZoB3SiKeB9E6B+1aLxkzn0H8wWc6W5ebJQyA/65GCrzbs?=
x-ms-exchange-antispam-messagedata-1: FxSQco+wNdae7w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98540399-563d-4195-eb57-08da17279065
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 17:13:11.9014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMlu5dFjK06M3xAOh8r/UnK1tOmn8aE8o1EhKmMQDcdTKxYeWMLZgCy2D4PE+BgbBjdszAa2gEb5DDp1F/zmZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1297
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]



> -----Original Message-----
> From: Jorge Lopez <jorgealtxwork@gmail.com>
> Sent: Tuesday, April 5, 2022 11:52
> To: Hans de Goede <hdegoede@redhat.com>
> Cc: Limonciello, Mario <Mario.Limonciello@amd.com>; platform-driver-
> x86@vger.kernel.org
> Subject: Re: [PATCH v1 5/6] Sure Admin Security Feature
>=20
> Hi Hans,
>=20
> On Tue, Apr 5, 2022 at 6:54 AM Hans de Goede <hdegoede@redhat.com>
> wrote:
> >
> > Hi,
> >
> > On 4/4/22 23:59, Limonciello, Mario wrote:
> > > [Public]
> > >
> > >
> > >
> > >> -----Original Message-----
> > >> From: Jorge Lopez <jorgealtxwork@gmail.com>
> > >> Sent: Monday, April 4, 2022 15:36
> > >> To: platform-driver-x86@vger.kernel.org
> > >> Subject: [PATCH v1 5/6] Sure Admin Security Feature
> > >>
> > >> HP Commercial PC's have several BIOS settings that control its
> > >> behaviour and capabilities, many of which are related to security.  =
To
> > >> prevent unauthorized changes to these settings, the system can be
> > >> configured to use a Sure Admin cryptographic signature-based
> > >> authorization string that the BIOS will use to verify authorization =
to
> > >> modify the setting. Behind the scenes, Sure Admin uses Secure
> Platform
> > >> Management (SPM) and WMI
> > >>
> > >> 'settings' is a file associated with Sure Admin. BIOS settings can b=
e
> > >> read or written through the Sure Admin settings file in sysfs
> > >>
> > >>      /sys/devices/platform/hp-wmi/sure_admin/settings
> > >>
> > >> Expected data format to update BIOS setting
> > >>
> > >>      [BIOS setting],[new value],[auth token]
> > >>
> > >> Sample settings reported data
> > >>
> > >>      {
> > >>              "Class": "HPBIOS_BIOSEnumeration",
> > >>              "Name": "USB Storage Boot",
> > >>              "Path": "\\Advanced\\Boot Options",
> > >>              "IsReadOnly": 0,
> > >>              ...
> > >>              "Value": "Enable",
> > >>              "Size": 2,
> > >>              "PossibleValues": [
> > >>                      "Disable",
> > >>                      "Enable"
> > >>              ]
> > >>      }
> > >>
> > >
> > > This sounds like it has re-invented /sys/class/firmware-attributes.
> > >
> > > Shouldn't you adopt that API?
> >
> > I fully agree. Jorge as I already indicated in our off-list
> > conversation when you initially started working on this
> > feature, we already have a standardized API for querying/changing
> > BIOS settings from within Linux:
> >
>=20
> I agree that changing the BIOS settings from within Linux could
> utilize the new methodology,  I will need to look closely at the
> requirements before I can proceed to make the changes.
> Keep in mind authentication of the values is done by BIOS.  No Linux
> process validates any data name, value, or auth token; only BIOS.  All
> data written to the sysfs file is not validated, it is just forward to
> BIOS.  See spm_kek_store and spm_sk_store functions.

That's fine, and it's a safer design to have BIOS validate it.

> One point I must make clear when updating BIOS settings.  any  NOT
> read-only BIOS settings can be changed by the application at any time.
>    This list of settings changes from one system to another.

Right.

>=20
> I am in disagreement with reading the settings.  hp-wmi does not read
> one value at a time. It reads all values exposed by BIOS.  See
> attached sample output.

The settings can all be read at initialization time for the driver and cach=
ed
then.

> The method for how all BIOS settings are reported needs to match the
> method how Windows products do it.  It is a requirement to start
> migrating customers from Windows to Linux while minimizing how BIOS
> data is reported.

Because we have a standardized API in Linux for this, I think it's best to =
abstract
this behind a userspace application/script.  If they expect to see it in th=
e format you
showed, the userspace application can take the data from Linux and package =
it that
way.

You'll have richer libraries and languages and tools to work from when doin=
g this too.
It should make it a lot less painful.

>=20
> I will investigate the new API and bring it to the team's attention.
>=20
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k
> ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%
> 2Ftree%2FDocumentation%2FABI%2Ftesting%2Fsysfs-class-firmware-
> attributes&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com%7C43a12
> f8fea104034282708da1724a70c%7C3dd8961fe4884e608e11a82d994e183d%7C
> 0%7C0%7C637847743455947225%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM
> C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000
> &amp;sdata=3DQhkFIYFCRXg1seDPb3qhk5qMkNQ%2B8AQXmHuke0YrWKc%3
> D&amp;reserved=3D0
> >
> > and any new code (such as this patch) which implements BIOS
> > setting changing MUST follow this standardized API (extending
> > it where necessary).
> >
> > I'm sorry but this patch is not acceptable in its current form,
> > it needs to be *completely rewritten* to implement:
> >
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k
> ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%
> 2Ftree%2FDocumentation%2FABI%2Ftesting%2Fsysfs-class-firmware-
> attributes&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com%7C43a12
> f8fea104034282708da1724a70c%7C3dd8961fe4884e608e11a82d994e183d%7C
> 0%7C0%7C637847743455947225%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM
> C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000
> &amp;sdata=3DQhkFIYFCRXg1seDPb3qhk5qMkNQ%2B8AQXmHuke0YrWKc%3
> D&amp;reserved=3D0
> >
> > See:
> >
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k
> ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%
> 2Ftree%2Fdrivers%2Fplatform%2Fx86%2Fdell%2Fdell-wmi-
> sysman&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com%7C43a12f8f
> ea104034282708da1724a70c%7C3dd8961fe4884e608e11a82d994e183d%7C0%
> 7C0%7C637847743455947225%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&a
> mp;sdata=3Dz5jmH7ECYBeLcndQ2vfHaUuyE04Eaf1Lymh6BjnyJ%2Fk%3D&amp;r
> eserved=3D0
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k
> ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%
> 2Ftree%2Fdrivers%2Fplatform%2Fx86%2Fthink-
> lmi.c&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com%7C43a12f8fea
> 104034282708da1724a70c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C
> 0%7C637847743455947225%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;
> sdata=3D5n6w9LEB2iWpj1cOQP6Ngz94AqP1Bu4vu8T0EdN%2FThU%3D&amp;re
> served=3D0
> >
> > for example code / for 2 drivers from other vendors already
> > implementing this.
> >
> > The same applies to the:
> >
> > "[PATCH v1 3/6] Secure Platform Management Security Feature"
> >
> > this needs to be implemented as
> > a /sys/class/firmware-attributes/*/authentication/
> > authentication method, see for example these Lenovo specific
> > addition to the /sys/class/firmware-attributes/*/authentication/
> > userspace API for similar functionality on Lenovo Think* devices:
> >
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k
> ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%
> 2Fcommit%2F%3Fid%3D06384573a3e8335ac6797577e545c33dbf91b490&amp;
> data=3D04%7C01%7CMario.Limonciello%40amd.com%7C43a12f8fea1040342827
> 08da1724a70c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63784
> 7743455947225%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC
> JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DeldS
> 4H3Z%2BAyL%2FG%2FO9W9rDGC37yh5sGgtUhpKdUAoSmA%3D&amp;reser
> ved=3D0
> >
> > I'll merge patches 1-2 sometime this week since those are
> > fine and it will be good to have those "out of the way",
> > but the rest of the series will need to be rewritten
> > taken the above comments into account.
>=20
> v1-0003-Sure-Start-Security-Feature.patch  reports the number of audit
> logs available and reports them when read.    it does not read/write
> BIOS settings hence it does not fall within the same category as
> patches v1-0002-Secure-Platform-Management-Security-Feature.patch and
> v1-0004-Sure-Admin-Security-Feature.patch
> Do you agree?
>=20
> >
> > Regards,
> >
> > Hans
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > >
> > >> This feature requires "Update hp_wmi_group to simplify feature
> > >> addition" patch.
> > >>
> > >> All changes were validated on a HP ZBook Workstation,
> > >> HP EliteBook x360, and HP EliteBook 850 G8 notebooks.
> > >>
> > >> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> > >>
> > >> ---
> > >> Based on the latest platform-drivers-x86.git/for-next
> > >> ---
> > >>  drivers/platform/x86/hp-wmi.c | 977
> > >> ++++++++++++++++++++++++++++++++++
> > >>  1 file changed, 977 insertions(+)
> > >>
> > >> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp=
-
> wmi.c
> > >> index 918e3eaf1b67..b72ca18b77a6 100644
> > >> --- a/drivers/platform/x86/hp-wmi.c
> > >> +++ b/drivers/platform/x86/hp-wmi.c
> > >> @@ -27,6 +27,7 @@
> > >>  #include <linux/rfkill.h>
> > >>  #include <linux/string.h>
> > >>  #include <linux/dmi.h>
> > >> +#include <linux/nls.h>
> > >>
> > >>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
> > >>  MODULE_DESCRIPTION("HP laptop WMI hotkeys driver");
> > >> @@ -37,8 +38,16 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-
> > >> 3D44E2C707E4");
> > >>
> > >>  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-
> ACCDC67EF61C"
> > >>  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-
> 3D44E2C707E4"
> > >> +
> > >>  #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
> > >>
> > >> +#define HPWMI_STRING_GUID "988D08E3-68F4-4c35-AF3E-
> 6A1B8106F83C"
> > >> +#define HPWMI_INTEGER_GUID "8232DE3D-663D-4327-A8F4-
> > >> E293ADB9BF05"
> > >> +#define HPWMI_ENUMERATION_GUID "2D114B49-2DFB-4130-B8FE-
> > >> 4A3C09E75133"
> > >> +#define HPWMI_ORDEREDLIST_GUID "14EA9746-CE1F-4098-A0E0-
> > >> 7045CB4DA745"
> > >> +#define HPWMI_PASSWORD_GUID "322F2028-0F84-4901-988E-
> > >> 015176049E2D"
> > >> +#define HPWMI_SETBIOSSETTING_GUID "1F4C91EB-DC5C-460b-951D-
> > >> C7CB9B4B8D5E"
> > >> +
> > >>  /* DMI board names of devices that should use the omen specific pat=
h
> for
> > >>   * thermal profiles.
> > >>   * This was obtained by taking a look in the windows omen command
> center
> > >> @@ -1025,6 +1034,973 @@ static const struct attribute_group
> > >> sure_start_group =3D {
> > >>      .attrs =3D sure_start_attrs,
> > >>  };
> > >>
> > >> +
> > >> +static int convert_hexstr_to_str(char **hex, int input_len, char **=
str,
> int
> > >> *len)
> > >> +{
> > >> +    int ret =3D 0;
> > >> +    int new_len =3D 0;
> > >> +    char tmp[] =3D "0x00";
> > >> +    char *input =3D *hex;
> > >> +    char *new_str =3D NULL;
> > >> +    int  ch;
> > >> +    int i;
> > >> +
> > >> +    if (input_len <=3D 0 || hex =3D=3D NULL || str =3D=3D NULL || l=
en =3D=3D NULL)
> > >> +            return -EINVAL;
> > >> +
> > >> +    *len =3D 0;
> > >> +    *str =3D NULL;
> > >> +
> > >> +    new_str =3D kmalloc(input_len, GFP_KERNEL);
> > >> +    if (!new_str)
> > >> +            return -ENOMEM;
> > >> +
> > >> +    for (i =3D 0; i < input_len; i +=3D 5) {
> > >> +            strncpy(tmp, input + i, strlen(tmp));
> > >> +            ret =3D kstrtoint(tmp, 16, &ch);
> > >> +            if (ret) {
> > >> +                    new_len =3D 0;
> > >> +                    break;
> > >> +            }
> > >> +
> > >> +            if (ch =3D=3D '\\')
> > >> +                    new_str[new_len++] =3D '\\';
> > >> +
> > >> +            new_str[new_len++] =3D ch;
> > >> +            if (ch =3D=3D '\0')
> > >> +                    break;
> > >> +    }
> > >> +
> > >> +    if (new_len) {
> > >> +            new_str[new_len] =3D '\0';
> > >> +            *str =3D krealloc(new_str, (new_len + 1) * sizeof(char)=
,
> > >> GFP_KERNEL);
> > >> +            if (*str)
> > >> +                    *len =3D new_len;
> > >> +            else
> > >> +                    ret =3D -ENOMEM;
> > >> +    }
> > >> +
> > >> +    if (ret)
> > >> +            kfree(new_str);
> > >> +    return ret;
> > >> +}
> > >> +
> > >> +/*
> > >> + * hp_wmi_get_setting_object() - Get an ACPI object by GUID and
> instance
> > >> + *
> > >> + * @guid:   GUID associated with the ACPI list of managed objects
> > >> + * @instance:       Instance index to query on the ACPI list
> > >> + * @obj:    The output ACPI object of type ACPI_TYPE_PACKAGE
> > >> + *          or ACPI_TYPE_BUFFER (freed by the callee)
> > >> + *
> > >> + * Returns  zero on success.  Otherwise,an error inherited from
> > >> + *          wmi_query_block(). It returns a obj by parameter if
> > >> + *          the query returned object of type buffer or package,
> > >> + *          otherwise, a null obj is returned.
> > >> + *
> > >> + * Note: obj should be freed by the callee once it is finished work=
ing
> with it
> > >> + */
> > >> +static int hp_wmi_get_setting_object(char *guid, int instance,
> > >> +                            union acpi_object **obj)
> > >> +{
> > >> +    struct acpi_buffer output =3D { ACPI_ALLOCATE_LOCAL_BUFFER, NUL=
L
> > >> };
> > >> +    union acpi_object *tmp =3D NULL;
> > >> +    int ret;
> > >> +
> > >> +    ret =3D wmi_query_block(guid, instance, &output);
> > >> +    if (ACPI_SUCCESS(ret) && output.pointer !=3D NULL) {
> > >> +            tmp =3D output.pointer;
> > >> +            if (tmp->type =3D=3D ACPI_TYPE_BUFFER || tmp->type =3D=
=3D
> > >> ACPI_TYPE_PACKAGE)
> > >> +                    *obj =3D output.pointer;
> > >> +            else {
> > >> +                    kfree(tmp);
> > >> +                    *obj =3D NULL;
> > >> +            }
> > >> +    }
> > >> +
> > >> +    return ret;
> > >> +}
> > >> +
> > >> +
> > >> +static int get_string_from_buffer(u16 **buffer, char **str)
> > >> +{
> > >> +    u16 *ptr =3D *buffer;
> > >> +    u16 ptrlen;
> > >> +
> > >> +    u16 size;
> > >> +    int i;
> > >> +    char *output =3D NULL;
> > >> +    int escape =3D 0;
> > >> +
> > >> +    ptrlen =3D *(ptr++);
> > >> +    size =3D ptrlen / 2;
> > >> +
> > >> +    if (size =3D=3D 0)
> > >> +            goto cleanup_exit;
> > >> +
> > >> +    for (i =3D 0; i < size; i++)
> > >> +            if (ptr[i] =3D=3D '\\')
> > >> +                    escape++;
> > >> +
> > >> +    size +=3D escape;
> > >> +    *str =3D kcalloc(size + 1, sizeof(char), GFP_KERNEL);
> > >> +    if (!*str)
> > >> +            return -ENOMEM;
> > >> +
> > >> +    output =3D *str;
> > >> +
> > >> +    /*
> > >> +     * convert from UTF-16 unicode to ASCII
> > >> +     */
> > >> +    utf16s_to_utf8s(ptr, ptrlen, UTF16_HOST_ENDIAN, output, size);
> > >> +
> > >> +    if (escape =3D=3D 0) {
> > >> +            ptr +=3D (ptrlen / 2);
> > >> +            goto cleanup_exit;
> > >> +    }
> > >> +    /*
> > >> +     * Convert escape characters only when found
> > >> +     */
> > >> +    for (i =3D 0; i < size; i++) {
> > >> +            if (*ptr =3D=3D '\\')
> > >> +                    output[i++] =3D '\\';
> > >> +            output[i] =3D *ptr;
> > >> +            ptr++;
> > >> +    }
> > >> +
> > >> +cleanup_exit:
> > >> +    *buffer =3D ptr;
> > >> +    return 0;
> > >> +}
> > >> +
> > >> +static int get_integer_from_buffer(int **buffer, int *integer)
> > >> +{
> > >> +    int *ptr =3D PTR_ALIGN(*buffer, 4);
> > >> +    *integer =3D *(ptr++);
> > >> +    *buffer =3D ptr;
> > >> +    return 0;
> > >> +}
> > >> +
> > >> +
> > >> +// Sure Admin functions
> > >> +enum hp_wmi_data_type {
> > >> +    HPWMI_STRING_TYPE,
> > >> +    HPWMI_INTEGER_TYPE,
> > >> +    HPWMI_ENUMERATION_TYPE,
> > >> +    HPWMI_ORDEREDLIST_TYPE,
> > >> +    HPWMI_PASSWORD_TYPE,
> > >> +};
> > >> +
> > >> +#define HP_WMI_COMMON_ELEMENTS      \
> > >> +    "Name", \
> > >> +    "Value",        \
> > >> +    "Path", \
> > >> +    "IsReadOnly",   \
> > >> +    "DisplayInUI",  \
> > >> +    "RequiresPhysicalPresence",     \
> > >> +    "Sequence",     \
> > >> +    "PrerequisiteSize",     \
> > >> +    "SecurityLevel"
> > >> +
> > >> +const char *hp_wmi_string_elements[] =3D {
> > >> +    HP_WMI_COMMON_ELEMENTS,
> > >> +    "MinLength",
> > >> +    "MaxLength"
> > >> +};
> > >> +
> > >> +const char *hp_wmi_integer_elements[] =3D {
> > >> +    HP_WMI_COMMON_ELEMENTS,
> > >> +    "LowerBound",
> > >> +    "UpperBound",
> > >> +    "IntValue"
> > >> +};
> > >> +
> > >> +const char *hp_wmi_enumeration_elements[] =3D {
> > >> +    HP_WMI_COMMON_ELEMENTS,
> > >> +    "CurrentValue",
> > >> +    "Size"
> > >> +};
> > >> +
> > >> +const char *hp_wmi_orderedlist_elements[] =3D {
> > >> +    HP_WMI_COMMON_ELEMENTS,
> > >> +    "Size"
> > >> +};
> > >> +
> > >> +const char *hp_wmi_password_elements[] =3D {
> > >> +    HP_WMI_COMMON_ELEMENTS,
> > >> +    "MinLength",
> > >> +    "MaxLength",
> > >> +    "Size",
> > >> +    "SupportedEncoding",
> > >> +    "IsSet"
> > >> +};
> > >> +
> > >> +const char **hp_wmi_elements[] =3D {
> > >> +    hp_wmi_string_elements,
> > >> +    hp_wmi_integer_elements,
> > >> +    hp_wmi_enumeration_elements,
> > >> +    hp_wmi_orderedlist_elements,
> > >> +    hp_wmi_password_elements
> > >> +};
> > >> +
> > >> +const int hp_wmi_elements_count[] =3D {
> > >> +    ARRAY_SIZE(hp_wmi_string_elements),
> > >> +    ARRAY_SIZE(hp_wmi_integer_elements),
> > >> +    ARRAY_SIZE(hp_wmi_enumeration_elements),
> > >> +    ARRAY_SIZE(hp_wmi_orderedlist_elements),
> > >> +    ARRAY_SIZE(hp_wmi_password_elements)
> > >> +};
> > >> +
> > >> +const char *hp_wmi_classes[] =3D {
> > >> +    "HPBIOS_BIOSString",
> > >> +    "HPBIOS_BIOSInteger",
> > >> +    "HPBIOS_BIOSEnumeration",
> > >> +    "HPBIOS_BIOSOrderedList",
> > >> +    "HPBIOS_BIOSPassword"
> > >> +};
> > >> +
> > >> +static DEFINE_MUTEX(buf_mutex);
> > >> +static int settings_buffer_size;
> > >> +static int buf_alloc_size;
> > >> +static char *hp_bios_settings_buffer;
> > >> +
> > >> +
> > >> +static int append_package_elements_to_buffer(union acpi_object
> *obj,
> > >> +                                         char *buf, int alloc_size,=
 enum
> > >> hp_wmi_data_type type)
> > >> +{
> > >> +    int i;
> > >> +    union acpi_object *pobj =3D NULL;
> > >> +    char *value =3D NULL;
> > >> +    int value_len;
> > >> +    char *tmpstr =3D NULL;
> > >> +    char *part_tmp =3D NULL;
> > >> +    int tmp_len =3D 0;
> > >> +    char *part =3D NULL;
> > >> +    int status =3D 0;
> > >> +    int size =3D 0;
> > >> +    int buf_size;
> > >> +
> > >> +    if (type >=3D ARRAY_SIZE(hp_wmi_classes) || !buf || !obj)
> > >> +            return -EINVAL;
> > >> +
> > >> +    if (obj->type !=3D ACPI_TYPE_PACKAGE)
> > >> +            return -EINVAL;
> > >> +
> > >> +    buf_size =3D snprintf(buf, alloc_size, "%s{\n", buf);
> > >> +    buf_size =3D snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\=
n", buf,
> > >> hp_wmi_classes[type]);
> > >> +
> > >> +    for (i =3D 0; i < 3; i++) {
> > >> +            pobj =3D &(obj->package.elements[i]);
> > >> +            if (pobj->type =3D=3D ACPI_TYPE_STRING) {
> > >> +                    status =3D convert_hexstr_to_str(&pobj-
> > >>> string.pointer,
> > >> +                                                   pobj->string.len=
gth,
> > >> &value, &value_len);
> > >> +                    if (ACPI_FAILURE(status))
> > >> +                            continue;
> > >> +                    /*
> > >> +                     * Skip 'Value' (HP_WMI_COMMON_ELEMENTS)
> > >> since
> > >> +                     * 'CurrentValue' is reported.
> > >> +                     */
> > >> +                    if (type !=3D HPWMI_ENUMERATION_TYPE || i !=3D =
1)
> > >> +                            buf_size =3D snprintf(buf, alloc_size,
> > >> +                                                "%s\t\"%s\": \"%s\"=
,\n",
> > >> +                                                buf,
> > >> +
> > >> hp_wmi_elements[type][i], value);
> > >> +
> > >> +            }
> > >> +            kfree(value);
> > >> +            value =3D NULL;
> > >> +    }
> > >> +
> > >> +    for (i =3D 3; i < hp_wmi_elements_count[type]; i++) {
> > >> +            pobj =3D &(obj->package.elements[i]);
> > >> +
> > >> +            if (type =3D=3D HPWMI_ENUMERATION_TYPE &&
> > >> +                i =3D=3D 9 &&
> > >> +                pobj->type =3D=3D ACPI_TYPE_STRING) {
> > >> +                    /*
> > >> +                     * Report "CurrentValue" as "Value"
> > >> +                     */
> > >> +                    status =3D convert_hexstr_to_str(&pobj-
> > >>> string.pointer,
> > >> +                                                   pobj->string.len=
gth,
> > >> +                                                   &value, &value_l=
en);
> > >> +                    if (ACPI_FAILURE(status))
> > >> +                            continue;
> > >> +
> > >> +                    buf_size =3D snprintf(buf, alloc_size,
> > >> +                                        "%s\t\"Value\": \"%s\",\n",
> > >> +                                        buf, value);
> > >> +                    kfree(value);
> > >> +                    value =3D NULL;
> > >> +
> > >> +            } else if (type =3D=3D HPWMI_PASSWORD_TYPE &&
> > >> +                       i =3D=3D 12 &&
> > >> +                       pobj->type =3D=3D ACPI_TYPE_STRING) {
> > >> +                    /*
> > >> +                     * Report list of "SupportEncoding"
> > >> +                     *
> > >> +                     *      "SupportedEncoding": [
> > >> +                     *              "utf-16"
> > >> +                     *      ],
> > >> +                     *
> > >> +                     */
> > >> +
> > >> +                    buf_size =3D snprintf(buf, alloc_size, "%s\t\"%=
s\": [\n",
> > >> +                                        buf, hp_wmi_elements[type][=
i]);
> > >> +                    while (size--) {
> > >> +                            pobj =3D &(obj->package.elements[i]);
> > >> +                            status =3D convert_hexstr_to_str(&pobj-
> > >>> string.pointer,
> > >> +                                                           pobj-
> > >>> string.length,
> > >> +                                                           &value,
> > >> &value_len);
> > >> +                            if (ACPI_FAILURE(status))
> > >> +                                    continue;
> > >> +
> > >> +                            if (size) {
> > >> +                                    buf_size =3D snprintf(buf, allo=
c_size,
> > >> +                                                        "%s\t\t\"%s=
\",\n",
> > >> buf, value);
> > >> +                                    i++;
> > >> +                            } else
> > >> +                                    buf_size =3D snprintf(buf, allo=
c_size,
> > >> +                                                        "%s\t\t\"%s=
\"\n",
> > >> buf, value);
> > >> +
> > >> +                            kfree(value);
> > >> +                            value =3D NULL;
> > >> +
> > >> +                    }
> > >> +                    buf_size =3D snprintf(buf, alloc_size, "%s\t],\=
n", buf);
> > >> +                    continue;
> > >> +
> > >> +            } else if (pobj->type =3D=3D ACPI_TYPE_INTEGER) {
> > >> +                    /*
> > >> +                     * Report "PrerequisiteSize" and "Size" values
> > >> +                     *      ...
> > >> +                     *      "PrerequisiteSize": 1,
> > >> +                     *      ...
> > >> +                     *      "Size": 2,
> > >> +                     *      ...
> > >> +                     */
> > >> +                    if (i =3D=3D 7)
> > >> +                            size =3D pobj->integer.value;
> > >> +                    else if (type =3D=3D HPWMI_ORDEREDLIST_TYPE && =
i =3D=3D
> > >> 9)
> > >> +                            size =3D pobj->integer.value;
> > >> +                    else if (type =3D=3D HPWMI_ENUMERATION_TYPE && =
i
> > >> =3D=3D 10)
> > >> +                            size =3D pobj->integer.value;
> > >> +                    else if (type =3D=3D HPWMI_PASSWORD_TYPE && i =
=3D=3D
> > >> 11)
> > >> +                            size =3D pobj->integer.value;
> > >> +
> > >> +                    buf_size =3D snprintf(buf, alloc_size, "%s\t\"%=
s\":
> > >> %lld,\n", buf,
> > >> +                                        hp_wmi_elements[type][i], p=
obj-
> > >>> integer.value);
> > >> +            }
> > >> +    }
> > >> +
> > >> +    if (type =3D=3D HPWMI_ENUMERATION_TYPE) {
> > >> +            buf_size =3D snprintf(buf, alloc_size, "%s\t\"PossibleV=
alues\":
> > >> [\n", buf);
> > >> +            for (i =3D 0; i < size; i++) {
> > >> +                    pobj =3D &(obj->package.elements[i +
> > >> hp_wmi_elements_count[type]]);
> > >> +
> > >> +                    status =3D convert_hexstr_to_str(&pobj-
> > >>> string.pointer,
> > >> +                                                   pobj->string.len=
gth,
> > >> +                                                   &value, &value_l=
en);
> > >> +                    if (ACPI_FAILURE(status))
> > >> +                            break;
> > >> +
> > >> +                    /*
> > >> +                     * Report list of "PossibleValues" of size
> > >> +                     * "Size"
> > >> +                     *      ...
> > >> +                     *      "Size": 2,
> > >> +                     *      "PossibleValues": [
> > >> +                     *                      "Disable",
> > >> +                     *                      "Enable"]
> > >> +                     */
> > >> +                    if (i =3D=3D (size - 1))
> > >> +                            buf_size =3D snprintf(buf, alloc_size,
> > >> +                                                "%s\t\t\"%s\"\n", b=
uf,
> > >> value);
> > >> +                    else
> > >> +                            buf_size =3D snprintf(buf, alloc_size,
> > >> +                                                "%s\t\t\"%s\",\n", =
buf,
> > >> value);
> > >> +                    kfree(value);
> > >> +                    value =3D NULL;
> > >> +            }
> > >> +            buf_size =3D snprintf(buf, alloc_size, "%s\t],\n", buf)=
;
> > >> +    }
> > >> +
> > >> +    if (type =3D=3D HPWMI_ORDEREDLIST_TYPE) {
> > >> +            buf_size =3D snprintf(buf, alloc_size, "%s\t\"Elements\=
": [\n",
> > >> buf);
> > >> +            if (size <=3D 0)
> > >> +                    goto finish_ordered_list;
> > >> +
> > >> +            pobj =3D &(obj-
> > >>> package.elements[hp_wmi_elements_count[type]]);
> > >> +            status =3D convert_hexstr_to_str(&pobj->string.pointer,
> > >> +                                           pobj->string.length, &va=
lue,
> > >> &value_len);
> > >> +            if (ACPI_FAILURE(status))
> > >> +                    goto finish_ordered_list;
> > >> +
> > >> +            /*
> > >> +             * Ordered list data is stored in hex and comma separat=
ed
> > >> format
> > >> +             * Convert the data and split it to show each element
> > >> +             */
> > >> +            status =3D convert_hexstr_to_str(&value, value_len, &tm=
pstr,
> > >> &tmp_len);
> > >> +            if (ACPI_FAILURE(status))
> > >> +                    goto finish_ordered_list;
> > >> +
> > >> +            part_tmp =3D tmpstr;
> > >> +            part =3D strsep(&part_tmp, ",");
> > >> +            while (part) {
> > >> +                    buf_size =3D snprintf(buf, alloc_size, "%s\t\t\=
"%s\"",
> > >> buf, part);
> > >> +                    part =3D strsep(&part_tmp, ",");
> > >> +                    if (part)
> > >> +                            buf_size =3D snprintf(buf, alloc_size, =
"%s,\n",
> > >> buf);
> > >> +                    else
> > >> +                            buf_size =3D snprintf(buf, alloc_size, =
"%s\n",
> > >> buf);
> > >> +            }
> > >> +    }
> > >> +
> > >> +finish_ordered_list:
> > >> +    if (type =3D=3D HPWMI_ORDEREDLIST_TYPE)
> > >> +            buf_size =3D snprintf(buf, alloc_size, "%s\t],\n", buf)=
;
> > >> +
> > >> +    /*
> > >> +     * remove trailing comma
> > >> +     */
> > >> +    if (buf_size > 3)
> > >> +            buf[buf_size - 2] =3D ' ';
> > >> +
> > >> +    kfree(tmpstr);
> > >> +    kfree(value);
> > >> +    return snprintf(buf, alloc_size, "%s},\n", buf);
> > >> +}
> > >> +
> > >> +static int append_buffer_elements_to_buffer(union acpi_object *obj,
> > >> +                                        char *buf, int alloc_size, =
enum
> > >> hp_wmi_data_type type)
> > >> +{
> > >> +    int buf_size;
> > >> +    int status;
> > >> +    char *str =3D NULL;
> > >> +    int i;
> > >> +    int j;
> > >> +    int integer;
> > >> +    int size =3D 0;
> > >> +
> > >> +    if (type >=3D ARRAY_SIZE(hp_wmi_classes) || !buf || !obj)
> > >> +            return -EINVAL;
> > >> +
> > >> +    if (obj->type !=3D ACPI_TYPE_BUFFER)
> > >> +            return -EINVAL;
> > >> +
> > >> +    buf_size =3D snprintf(buf, alloc_size, "%s{\n", buf);
> > >> +    buf_size =3D snprintf(buf, alloc_size, "%s\t\"Class\": \"%s\",\=
n", buf,
> > >> hp_wmi_classes[type]);
> > >> +
> > >> +    for (i =3D 0; i < 3; i++) {
> > >> +            status =3D get_string_from_buffer((u16 **)&obj-
> > >>> buffer.pointer, &str);
> > >> +            if (ACPI_SUCCESS(status)) {
> > >> +                    /*
> > >> +                     * Skip 'Value' (HP_WMI_COMMON_ELEMENTS)
> > >> since
> > >> +                     * 'CurrentValue' is reported.
> > >> +                     */
> > >> +                    if (type !=3D HPWMI_ENUMERATION_TYPE || i !=3D =
1)
> > >> +                            buf_size =3D snprintf(buf, alloc_size,
> > >> +                                                "%s\t\"%s\": \"%s\"=
,\n",
> > >> +                                                buf,
> > >> +
> > >> hp_wmi_elements[type][i], str);
> > >> +            }
> > >> +            kfree(str);
> > >> +            str =3D NULL;
> > >> +
> > >> +    }
> > >> +
> > >> +    for (i =3D 3; i < hp_wmi_elements_count[type]; i++) {
> > >> +            if (type =3D=3D HPWMI_ENUMERATION_TYPE && i =3D=3D 9) {
> > >> +                    status =3D get_string_from_buffer((u16 **)&obj-
> > >>> buffer.pointer, &str);
> > >> +                    if (ACPI_SUCCESS(status)) {
> > >> +                            /*
> > >> +                             * Report "CurrentValue" as "Value"
> > >> +                             */
> > >> +                            buf_size =3D snprintf(buf, alloc_size,
> > >> +                                                "%s\t\"Value\": \"%=
s\",\n",
> > >> buf, str);
> > >> +                    }
> > >> +                    kfree(str);
> > >> +                    str =3D NULL;
> > >> +                    continue;
> > >> +
> > >> +            } else if (type =3D=3D HPWMI_PASSWORD_TYPE && i =3D=3D =
12) {
> > >> +                    /*
> > >> +                     * Report list of "SupportEncoding"
> > >> +                     *
> > >> +                     *      "SupportedEncoding": [
> > >> +                     *              "utf-16"
> > >> +                     *      ],
> > >> +                     *
> > >> +                     */
> > >> +
> > >> +                    buf_size =3D snprintf(buf, alloc_size, "%s\t\"%=
s\": [\n",
> > >> +                                        buf, hp_wmi_elements[type][=
i]);
> > >> +                    for (j =3D 0; j < size; j++) {
> > >> +                            status =3D get_string_from_buffer((u16
> > >> **)&obj->buffer.pointer, &str);
> > >> +                            if (ACPI_SUCCESS(status)) {
> > >> +                                    if (j =3D=3D size - 1)
> > >> +                                            buf_size =3D snprintf(b=
uf,
> > >> alloc_size,
> > >> +
> > >> "%s\t\t\"%s\"\n", buf, str);
> > >> +                                    else
> > >> +                                            buf_size =3D snprintf(b=
uf,
> > >> alloc_size,
> > >> +
> > >> "%s\t\t\"%s\",\n", buf, str);
> > >> +                            }
> > >> +                            kfree(str);
> > >> +                            str =3D NULL;
> > >> +                    }
> > >> +                    buf_size =3D snprintf(buf, alloc_size, "%s\t],\=
n", buf);
> > >> +                    continue;
> > >> +            }
> > >> +
> > >> +            size =3D 0;
> > >> +            status =3D get_integer_from_buffer((int **)&obj-
> > >>> buffer.pointer, &integer);
> > >> +            if (ACPI_SUCCESS(status)) {
> > >> +                    /*
> > >> +                     * Report "PrerequisiteSize" and "Size" values
> > >> +                     *      ...
> > >> +                     *      "PrerequisiteSize": 1,
> > >> +                     *      ...
> > >> +                     *      "Size": 2,
> > >> +                     *      ...
> > >> +                     */
> > >> +                    if (i =3D=3D 7)
> > >> +                            size =3D integer;
> > >> +                    else if (type =3D=3D HPWMI_ENUMERATION_TYPE && =
i
> > >> =3D=3D 10)
> > >> +                            size =3D integer;
> > >> +                    else if (type =3D=3D HPWMI_ORDEREDLIST_TYPE && =
i =3D=3D
> > >> 9)
> > >> +                            size =3D integer;
> > >> +                    else if (type =3D=3D HPWMI_PASSWORD_TYPE && i =
=3D=3D
> > >> 11)
> > >> +                            size =3D integer;
> > >> +
> > >> +                    buf_size =3D snprintf(buf, alloc_size, "%s\t\"%=
s\":
> > >> %d,\n", buf,
> > >> +                                        hp_wmi_elements[type][i],
> > >> integer);
> > >> +            }
> > >> +
> > >> +            if (size > 20)
> > >> +                    pr_warn("%s exceeded the maximum number of
> > >> elements supported or data may be malformed\n",
> > >> +                            hp_wmi_elements[type][i]);
> > >> +
> > >> +            if (ACPI_SUCCESS(status) && i =3D=3D 7) {
> > >> +                    buf_size =3D snprintf(buf, alloc_size,
> > >> "%s\t\"Prerequisites\": [\n", buf);
> > >> +                    for (j =3D 0; j < size; j++) {
> > >> +                            status =3D get_string_from_buffer((u16
> > >> **)&obj->buffer.pointer, &str);
> > >> +                            if (ACPI_SUCCESS(status)) {
> > >> +                                    buf_size =3D snprintf(buf, allo=
c_size,
> > >> "%s\t\t\"%s\"", buf, str);
> > >> +
> > >> +                                    if (j =3D=3D size - 1)
> > >> +                                            buf_size =3D snprintf(b=
uf,
> > >> alloc_size, "%s\n", buf);
> > >> +                                    else
> > >> +                                            buf_size =3D snprintf(b=
uf,
> > >> alloc_size, "%s,\n", buf);
> > >> +
> > >> +                            }
> > >> +                            kfree(str);
> > >> +                            str =3D NULL;
> > >> +                    }
> > >> +                    buf_size =3D snprintf(buf, alloc_size, "%s\t],\=
n", buf);
> > >> +            }
> > >> +    }
> > >> +
> > >> +    if (type =3D=3D HPWMI_ENUMERATION_TYPE || type =3D=3D
> > >> HPWMI_ORDEREDLIST_TYPE) {
> > >> +            if (type =3D=3D HPWMI_ENUMERATION_TYPE)
> > >> +                    buf_size =3D snprintf(buf, alloc_size,
> > >> "%s\t\"PossibleValues\": [\n", buf);
> > >> +            else
> > >> +                    buf_size =3D snprintf(buf, alloc_size,
> > >> "%s\t\"Elements\": [\n", buf);
> > >> +
> > >> +            for (i =3D 0; i < size; i++) {
> > >> +                    status =3D get_string_from_buffer((u16 **)&obj-
> > >>> buffer.pointer, &str);
> > >> +                    if (ACPI_SUCCESS(status)) {
> > >> +                            buf_size =3D snprintf(buf, alloc_size,
> > >> "%s\t\t\"%s\"", buf, str);
> > >> +
> > >> +                            if (i =3D=3D size - 1)
> > >> +                                    buf_size =3D snprintf(buf, allo=
c_size,
> > >> "%s\n", buf);
> > >> +                            else
> > >> +                                    buf_size =3D snprintf(buf, allo=
c_size,
> > >> "%s,\n", buf);
> > >> +
> > >> +                    }
> > >> +                    kfree(str);
> > >> +                    str =3D NULL;
> > >> +            }
> > >> +            buf_size =3D snprintf(buf, alloc_size, "%s\t],\n", buf)=
;
> > >> +    }
> > >> +
> > >> +    /*
> > >> +     * remove trailing comma
> > >> +     */
> > >> +    if (buf_size > 3)
> > >> +            buf[buf_size - 2] =3D ' ';
> > >> +
> > >> +    return snprintf(buf, alloc_size, "%s},\n", buf);
> > >> +}
> > >> +
> > >> +static int hp_bios_settings_free_buffer(void)
> > >> +{
> > >> +    mutex_lock(&buf_mutex);
> > >> +    kfree(hp_bios_settings_buffer);
> > >> +    settings_buffer_size =3D 0;
> > >> +    buf_alloc_size =3D 0;
> > >> +    mutex_unlock(&buf_mutex);
> > >> +
> > >> +    return 0;
> > >> +}
> > >> +
> > >> +static int hp_bios_settings_realloc_buffer(char **buf, int *buf_siz=
e,
> > >> +                                       int *alloc_size,
> > >> +                                       struct mutex *buf_mutex)
> > >> +{
> > >> +    int new_buffer_size;
> > >> +    char *new_buf =3D NULL;
> > >> +    int ret =3D 0;
> > >> +
> > >> +    if (*buf_size + PAGE_SIZE >=3D *alloc_size) {
> > >> +            new_buffer_size =3D buf_alloc_size + 2 * PAGE_SIZE;
> > >> +
> > >> +            mutex_lock(buf_mutex);
> > >> +            new_buf =3D krealloc(*buf, new_buffer_size, GFP_KERNEL)=
;
> > >> +            mutex_unlock(buf_mutex);
> > >> +            if (new_buf) {
> > >> +                    mutex_lock(buf_mutex);
> > >> +                    *buf =3D new_buf;
> > >> +                    *alloc_size =3D ksize(new_buf);
> > >> +                    mutex_unlock(buf_mutex);
> > >> +            } else {
> > >> +                    hp_bios_settings_free_buffer();
> > >> +                    ret =3D -ENOMEM;
> > >> +            }
> > >> +    }
> > >> +
> > >> +    return ret;
> > >> +}
> > >> +
> > >> +static int append_settings_to_buffer(char *guid, int type, char **b=
uf,
> > >> +                                 int *buf_size, int *alloc_size,
> > >> +                                 struct mutex *buf_mutex)
> > >> +{
> > >> +    union acpi_object *obj =3D NULL;
> > >> +    int ret =3D 0;
> > >> +    int status =3D 0;
> > >> +    int instance =3D 0;
> > >> +
> > >> +    /*
> > >> +     * Query all the instances until to receive a AE_BAD_PARAMETER
> > >> +     */
> > >> +    do {
> > >> +            ret =3D hp_wmi_get_setting_object(guid, instance++, &ob=
j);
> > >> +            if (ACPI_SUCCESS(ret) && obj !=3D NULL) {
> > >> +                    status =3D 0;
> > >> +                    if (obj->type =3D=3D ACPI_TYPE_PACKAGE) {
> > >> +                            mutex_lock(buf_mutex);
> > >> +                            status =3D
> > >> append_package_elements_to_buffer(obj,
> > >> +                                                    *buf, *alloc_si=
ze,
> > >> type);
> > >> +                            if (status > 0)
> > >> +                                    *buf_size =3D status;
> > >> +                            mutex_unlock(buf_mutex);
> > >> +
> > >> +                    } else if (obj->type =3D=3D ACPI_TYPE_BUFFER) {
> > >> +                            mutex_lock(buf_mutex);
> > >> +                            status =3D
> > >> append_buffer_elements_to_buffer(obj,
> > >> +                                                    *buf, *alloc_si=
ze,
> > >> type);
> > >> +                            if (status > 0)
> > >> +                                    *buf_size =3D status;
> > >> +                            mutex_unlock(buf_mutex);
> > >> +
> > >> +                    } else
> > >> +                            pr_warn("The retrieved object type(%d) =
is
> > >> not supported yet\n",
> > >> +                                    obj->type);
> > >> +
> > >> +                    ret =3D hp_bios_settings_realloc_buffer(buf, bu=
f_size,
> > >> alloc_size, buf_mutex);
> > >> +            }
> > >> +
> > >> +            kfree(obj);
> > >> +            obj =3D NULL;
> > >> +
> > >> +    } while (ACPI_SUCCESS(ret));
> > >> +
> > >> +    /*
> > >> +     * AE_BAD_PARAMETER means the loop ended by exhaustion
> > >> +     */
> > >> +    if (ret =3D=3D AE_BAD_PARAMETER)
> > >> +            ret =3D 0;
> > >> +
> > >> +    return ret;
> > >> +}
> > >> +
> > >> +static int hp_bios_settings_fill_buffer(void)
> > >> +{
> > >> +    int status =3D 0;
> > >> +    int initial_buffer_size =3D 20 * PAGE_SIZE;
> > >> +
> > >> +    mutex_lock(&buf_mutex);
> > >> +    hp_bios_settings_buffer =3D kmalloc(initial_buffer_size,
> GFP_KERNEL);
> > >> +    mutex_unlock(&buf_mutex);
> > >> +    if (!hp_bios_settings_buffer)
> > >> +            return -ENOMEM;
> > >> +
> > >> +    mutex_lock(&buf_mutex);
> > >> +    buf_alloc_size =3D ksize(hp_bios_settings_buffer);
> > >> +    settings_buffer_size =3D snprintf(hp_bios_settings_buffer,
> > >> +                                    buf_alloc_size, "[\n");
> > >> +    mutex_unlock(&buf_mutex);
> > >> +
> > >> +    status =3D append_settings_to_buffer(HPWMI_STRING_GUID,
> > >> +            HPWMI_STRING_TYPE, &hp_bios_settings_buffer,
> > >> +            &settings_buffer_size, &buf_alloc_size, &buf_mutex);
> > >> +    if (ACPI_FAILURE(status))
> > >> +            pr_err("error 0x%x occurred retrieving string instances=
\n",
> > >> status);
> > >> +
> > >> +    status =3D append_settings_to_buffer(HPWMI_INTEGER_GUID,
> > >> +            HPWMI_INTEGER_TYPE, &hp_bios_settings_buffer,
> > >> +            &settings_buffer_size, &buf_alloc_size, &buf_mutex);
> > >> +    if (ACPI_FAILURE(status))
> > >> +            pr_err("error 0x%x occurred retrieving integer instance=
s\n",
> > >> status);
> > >> +
> > >> +    status =3D
> append_settings_to_buffer(HPWMI_ENUMERATION_GUID,
> > >> +            HPWMI_ENUMERATION_TYPE, &hp_bios_settings_buffer,
> > >> +            &settings_buffer_size, &buf_alloc_size, &buf_mutex);
> > >> +    if (ACPI_FAILURE(status))
> > >> +            pr_err("error 0x%x occurred retrieving enumeration
> > >> instances\n", status);
> > >> +
> > >> +    status =3D append_settings_to_buffer(HPWMI_ORDEREDLIST_GUID,
> > >> +            HPWMI_ORDEREDLIST_TYPE, &hp_bios_settings_buffer,
> > >> +            &settings_buffer_size, &buf_alloc_size, &buf_mutex);
> > >> +    if (ACPI_FAILURE(status))
> > >> +            pr_err("error 0x%x occurred retrieving ordered list
> > >> instances\n", status);
> > >> +
> > >> +    status =3D append_settings_to_buffer(HPWMI_PASSWORD_GUID,
> > >> +            HPWMI_PASSWORD_TYPE, &hp_bios_settings_buffer,
> > >> +            &settings_buffer_size, &buf_alloc_size, &buf_mutex);
> > >> +    if (ACPI_FAILURE(status))
> > >> +            pr_err("error 0x%x occurred retrieving password list
> > >> instances\n", status);
> > >> +
> > >> +    mutex_lock(&buf_mutex);
> > >> +    /*
> > >> +     * remove trailing comma
> > >> +     */
> > >> +    if (settings_buffer_size >=3D 3) {
> > >> +            if (hp_bios_settings_buffer[settings_buffer_size - 2] =
=3D=3D ',')
> > >> +                    hp_bios_settings_buffer[settings_buffer_size - =
2] =3D '
> > >> ';
> > >> +    }
> > >> +    settings_buffer_size =3D snprintf(hp_bios_settings_buffer,
> > >> +                                    buf_alloc_size, "%s]\n",
> > >> +                                    hp_bios_settings_buffer);
> > >> +    mutex_unlock(&buf_mutex);
> > >> +
> > >> +    return settings_buffer_size;
> > >> +}
> > >> +
> > >> +/*
> > >> + * sure_admin_settings_read - Return a formatted file with settings
> > >> + *                              and possible options read from BIOS
> > >> + *
> > >> + * @filp:  Pointer to file of settings read from BIOS
> > >> + * @kobj:  Pointer to a kernel object of things that show up as dir=
ectory
> in
> > >> the sysfs filesystem.
> > >> + * @attr:  Pointer to list of read attributes
> > >> + * @buf:   Pointer to buffer
> > >> + * @off:   File current offset
> > >> + * @count: Buffer size
> > >> + *
> > >> + * Returns the count of unicode chars read if successful, otherwise
> > >> + *          -ENOMEM unable to allocate memory
> > >> + *          -EINVAL buffer not allocated or too small
> > >> + *
> > >> + */
> > >> +static ssize_t sure_admin_settings_read(struct file *filp, struct k=
object
> > >> *kobj,
> > >> +                                    struct bin_attribute *attr, cha=
r *buf,
> > >> loff_t off, size_t count)
> > >> +{
> > >> +    ssize_t ret;
> > >> +
> > >> +    /* clear the buffer when offset is pointing to the last positio=
n */
> > >> +    if (off >=3D settings_buffer_size && settings_buffer_size > 0) =
{
> > >> +            hp_bios_settings_free_buffer();
> > >> +            return 0;
> > >> +    }
> > >> +
> > >> +    /* clear the buffer whenever the read starts from the first pos=
ition
> > >> */
> > >> +    if (off =3D=3D 0 && settings_buffer_size > 0)
> > >> +            hp_bios_settings_free_buffer();
> > >> +
> > >> +    if (settings_buffer_size =3D=3D 0)
> > >> +            hp_bios_settings_fill_buffer();
> > >> +
> > >> +    mutex_lock(&buf_mutex);
> > >> +    ret =3D memory_read_from_buffer(buf, count, &off,
> > >> hp_bios_settings_buffer,
> > >> +                                  settings_buffer_size);
> > >> +    mutex_unlock(&buf_mutex);
> > >> +
> > >> +    return ret;
> > >> +}
> > >> +
> > >> +
> > >> +/*
> > >> + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicode
> > >> + *
> > >> + * @p:   Unicode buffer address
> > >> + * @str: string to convert to unicode
> > >> + *
> > >> + * Returns a void pointer to the buffer containing unicode string
> > >> + */
> > >> +static void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
> > >> +{
> > >> +    int len =3D strlen(str);
> > >> +
> > >> +    /*
> > >> +     * Add null character when reading an empty string
> > >> +     */
> > >> +    if (len =3D=3D 0) {
> > >> +            *p++ =3D 2;
> > >> +            *p++ =3D (u8)0x00;
> > >> +            return p;
> > >> +    }
> > >> +    *p++ =3D len * 2;
> > >> +    utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN, p, len);
> > >> +    p +=3D len;
> > >> +
> > >> +    return p;
> > >> +}
> > >> +
> > >> +/*
> > >> + * hp_wmi_set_bios_setting - Set setting's value in BIOS
> > >> + *
> > >> + * @input_buffer: Input buffer address
> > >> + * @input_size:   Input buffer size
> > >> + *
> > >> + * Returns: Count of unicode characters written to BIOS if successf=
ul,
> > >> otherwise
> > >> + *          -ENOMEM unable to allocate memory
> > >> + *          -EINVAL buffer not allocated or too small
> > >> + */
> > >> +static int hp_wmi_set_bios_setting(u16 *input_buffer, u32 input_siz=
e)
> > >> +{
> > >> +    union acpi_object *obj;
> > >> +    struct acpi_buffer input =3D {input_size, input_buffer};
> > >> +    struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> > >> +    int ret =3D 0;
> > >> +
> > >> +    ret =3D wmi_evaluate_method(HPWMI_SETBIOSSETTING_GUID, 0, 1,
> > >> &input, &output);
> > >> +
> > >> +    obj =3D output.pointer;
> > >> +    if (!obj)
> > >> +            return -EINVAL;
> > >> +
> > >> +    if (obj->type !=3D ACPI_TYPE_INTEGER)
> > >> +            ret =3D -EINVAL;
> > >> +
> > >> +    ret =3D obj->integer.value;
> > >> +    kfree(obj);
> > >> +    return ret;
> > >> +}
> > >> +
> > >> +/* Sure Admin Functions */
> > >> +
> > >> +#define UTF_PREFIX                  ((unsigned char *)"<utf-16/>")
> > >> +#define BEAM_PREFIX                 ((unsigned char
> > >> *)"<BEAM/>")
> > >> +
> > >> +/*
> > >> + * sure_admin_settings_write - Write the contents of a formatted fi=
le
> > >> + *                               with settings and performs the log=
ic
> > >> + *                               to change any settings in BIOS.
> > >> + *
> > >> + * @filp:  Pointer to file of settings to be written to BIOS
> > >> + * @kobj:  Pointer to a kernel object of things that show up as dir=
ectory
> in
> > >> the sysfs filesystem.
> > >> + * @attr:  Pointer to list of attributes for the write operation
> > >> + * @buf:   Pointer to buffer
> > >> + * @off:   File current offset
> > >> + * @count: Buffer size
> > >> + *
> > >> + *
> > >> + * Returns the count of unicode characters written to BIOS if
> successful,
> > >> otherwise
> > >> + *          -ENOMEM unable to allocate memory
> > >> + *          -EINVAL buffer not allocated or too small
> > >> + *
> > >> + */
> > >> +static ssize_t sure_admin_settings_write(struct file *filp, struct =
kobject
> > >> *kobj,
> > >> +                    struct bin_attribute *attr, char *buf, loff_t o=
ff, size_t
> > >> count)
> > >> +{
> > >> +    int status =3D 0;
> > >> +    char *part =3D NULL;
> > >> +    int part_len =3D 0;
> > >> +    unsigned short *buffer =3D NULL;
> > >> +    unsigned short *tmpstr =3D NULL;
> > >> +    int buffer_size =3D (count + strlen(UTF_PREFIX)) * sizeof(unsig=
ned
> > >> short);
> > >> +
> > >> +    buffer =3D kmalloc(buffer_size, GFP_KERNEL);
> > >> +    if (!buffer)
> > >> +            return -ENOMEM;
> > >> +
> > >> +    tmpstr =3D buffer;
> > >> +    part =3D strsep(&buf, ",");
> > >> +    if (!part) {
> > >> +            status =3D -EINVAL;
> > >> +            goto out_free;
> > >> +    }
> > >> +    tmpstr =3D ascii_to_utf16_unicode(tmpstr, part);
> > >> +    part =3D strsep(&buf, ",");
> > >> +    if (!part) {
> > >> +            status =3D -EINVAL;
> > >> +            goto out_free;
> > >> +    }
> > >> +
> > >> +    /* Add extra buffer space when encountering an empty string */
> > >> +    if (!strlen(part))
> > >> +            buffer_size +=3D sizeof(unsigned short);
> > >> +    tmpstr =3D ascii_to_utf16_unicode(tmpstr, part);
> > >> +    part =3D strsep(&buf, ",");
> > >> +    if (!part) {
> > >> +            status =3D -EINVAL;
> > >> +            goto out_free;
> > >> +    }
> > >> +    part_len =3D strlen(part) - 1;
> > >> +    part[part_len] =3D '\0';
> > >> +
> > >> +    if (strncmp(part, BEAM_PREFIX, strlen(BEAM_PREFIX)) =3D=3D 0) {
> > >> +           /*
> > >> +            * BEAM_PREFIX is append to buffer when a signature
> > >> +            * is provided and Sure Admin is enabled in BIOS
> > >> +            */
> > >> +            // BEAM_PREFIX found, convert part to unicode
> > >> +            tmpstr =3D ascii_to_utf16_unicode(tmpstr, part);
> > >> +            // decrease buffer size allocated initially for UTF_PRE=
FIX
> > >> +            buffer_size -=3D strlen(UTF_PREFIX) * sizeof(unsigned s=
hort);
> > >> +    } else {
> > >> +            /*
> > >> +             * UTF-16 prefix is append to the * buffer when a BIOS
> > >> +             * admin password is configured in BIOS
> > >> +             */
> > >> +
> > >> +            // append UTF_PREFIX to part and then convert it to uni=
code
> > >> +            part =3D kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX, part=
);
> > >> +            if (!part)
> > >> +                    goto out_free;
> > >> +
> > >> +            tmpstr =3D ascii_to_utf16_unicode(tmpstr, part);
> > >> +            kfree(part);
> > >> +    }
> > >> +
> > >> +    part =3D strsep(&buf, ",");
> > >> +    if (part) {
> > >> +            status =3D -EINVAL;
> > >> +            goto out_free;
> > >> +    }
> > >> +    status =3D hp_wmi_set_bios_setting(buffer, buffer_size);
> > >> +    if (ACPI_FAILURE(status))
> > >> +            status =3D -EINVAL;
> > >> +
> > >> +out_free:
> > >> +    kfree(buffer);
> > >> +    if (ACPI_SUCCESS(status))
> > >> +            return count;
> > >> +    return status;
> > >> +}
> > >> +
> > >> +HPWMI_BINATTR_RW(sure_admin, settings, 0);
> > >> +
> > >> +static struct bin_attribute *sure_admin_binattrs[] =3D {
> > >> +    &sure_admin_settings,
> > >> +    NULL,
> > >> +};
> > >> +
> > >> +static const struct attribute_group sure_admin_group =3D {
> > >> +    .name =3D "sure_admin",
> > >> +    .bin_attrs =3D sure_admin_binattrs,
> > >> +};
> > >> +
> > >>  static DEVICE_ATTR_RO(display);
> > >>  static DEVICE_ATTR_RO(hddtemp);
> > >>  static DEVICE_ATTR_RW(als);
> > >> @@ -1050,6 +2026,7 @@ static const struct attribute_group
> > >> *hp_wmi_groups[] =3D {
> > >>      &hp_wmi_group,
> > >>      &spm_group,
> > >>      &sure_start_group,
> > >> +    &sure_admin_group,
> > >>      NULL,
> > >>  };
> > >>
> > >> --
> > >> 2.25.1
> >
