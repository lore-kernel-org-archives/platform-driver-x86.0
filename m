Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7CEFA3740
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Oct 2022 15:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235830AbiJ0P1c (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Oct 2022 11:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235922AbiJ0P11 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2022 11:27:27 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2064.outbound.protection.outlook.com [40.107.102.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCAE1863FF
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 08:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bn5+DJ5NEoX7e+B6dq6hjyqshXIzYW8ay1Balzno0zV3ClZBKBY1qfBSBf05e486w8lHeDhWzo91hFMgm4SXHVk7gFuOYzoSgZRK+qsIZwXfYk/Gvw7vHG24mcerhwoIRVIMz6r4A3egTWvxdeeQCD4uEZGqFu6PnuXaZwA1JsOA7XW/7ZnwsJqN4fpd8fQg5o7zt1B/jYQvud4hHSfF8tB8+79csoSqF6v/uaT+63b+sAsbYRS7N0aAbmbefzQ8odBkMQG/BiYvSiZfubSseJXIvEX8Jk1SdlY/b2SKeum+JL1JQ25cNgmkiP9sx2rUBGygSjv967WX8i6JJLhwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOGKKwwCBDJ+FW9zPx0ZXs+MuSGnixKhpL5RLstuZ/s=;
 b=eFSJdZxHFfdSBJ/ozxfnwYZtnanod5M1mi5Iq41TTakocYMpgiadVKd4LKdqWLS0cm+ezE/KlH0gE3WwhgVXT+pneIitagw6M4VDyUeGQ6Kv/pWpZZzKVlefQAiFtpv9S26NI+IY5DeHEj/WJGyFBarh9Tf9chPs9/CmyOFDkQxlsp2QE4ANh1TkPUUFHB6zpo0EG6RVoytMyiuBHxQmHAynYl48BPzlhRjpmsctr+FQhOY6nL0LKPSryrHt2Rvouw955rX/7P3Mb//9GEh6cKeUgcnB2vEuJGrHivdFguRmC6qE7vWSsyptki+jpH+EkLW3bnacIAhzAoxAeInDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOGKKwwCBDJ+FW9zPx0ZXs+MuSGnixKhpL5RLstuZ/s=;
 b=JHTkzqGvKlx87DdQ6sOsp48N2Mlxm23/7JR1w95J3XidZF5cynIjhrbzwiAdQWy7lkrNGU4K6pAZyeY7mLE6jtQcVjSUrXWhAufnCMttsgkqdLgrYkQ64ZiU11YKAP03RvMRJh9Okbm2dIErnM5TC+ElFNeK05eQucM/INWU/ww=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Thu, 27 Oct
 2022 15:27:19 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f8c0:db03:2d30:792c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f8c0:db03:2d30:792c%3]) with mapi id 15.20.5769.015; Thu, 27 Oct 2022
 15:27:19 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "bugzilla-daemon@kernel.org" <bugzilla-daemon@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "jorge.lopez2@hp.com" <jorge.lopez2@hp.com>
CC:     Hans de Goede <hdegoede@redhat.com>
Subject: RE: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
 version U82 01.02.01 Rev.A causing rfkill soft blocked wifi
Thread-Topic: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
 version U82 01.02.01 Rev.A causing rfkill soft blocked wifi
Thread-Index: AQHY6hSd0qwHdpAXQUy4R9nfQCJASK4iXAcA
Date:   Thu, 27 Oct 2022 15:27:19 +0000
Message-ID: <MN0PR12MB61011B5F90BBF2C605F9C2B2E2339@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <bug-216468-215701@https.bugzilla.kernel.org/>
 <bug-216468-215701-QHBdtq8AGO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216468-215701-QHBdtq8AGO@https.bugzilla.kernel.org/>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-10-27T15:27:16Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=2dbedb3a-777b-430a-b875-8dbc24cf2e2b;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-10-27T15:27:17Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 2b20df01-a818-4965-ab33-facd8835e5f5
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DM4PR12MB6134:EE_
x-ms-office365-filtering-correlation-id: 54fd1750-3c94-4102-bdab-08dab82fbcb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z637W+PPALfSpuuidvxhksvJb+s1KVOXJ5jZE8e6S48uoI/6kQEKZXxq1Vufs78tRA3Yjl+e4JXzSS51z0rMpV04HySUbqtmEl9/fvrH/4w1RWNA5YsrKvrxB3jDvN43XSjb/MxU/mhpHyhH//hn/MbsirnDRTcpgsNhY0ctliUs/bescswOFbZWeuXFdVOymqBiSRHxG+TvtcXgUcdjPxvQ0bV6Wjo91UN/qtPZPm3pFlzW+iwLEunlc0BeI5bZqe8ioPWuw0p/3TxgN/2owtZA0HDrIWNiBaEdcKM8xaptJTulQk9We16EWnRtUsN+MUMIajyKyRA0zfRvhI7c8GfmMe7/jdMf0vqkCAzis1gepwf56NwQ9BC2C8kZnCWZkE6Pw8t1H04wdO14Le7lKwy+9MPFKEfI69UZscsx8w9bgdV9dqGTQYnW5nwk4gr0VtUizPv6VRzXNIjNYaPlurMXoXhqCUNJKC5CvNNE5kwFQZWx3xh0XxNZayc39ptwX40Hu+PcyUyCFHsWST4onAp62t6hDO3j7UpIG6iDmQKe0lLfWS93W4Ez+X1fsFmneJyCND+7JfqOQ2/q5JOfdvsyHd5IccyjpgdzGLf//vvKwZbbjMTrAzwJoRkYJcDWolO2X4liOVkXOvc+d1p9un8nA19W2+l8hoopzgmg6SE13Q4UTt5TL2OCP0+81DQvdbUyrALD3nDD0vb5Y76U/hkRTWL28uRUqBdoy78MNBbgLzjiOTmwTKsg2ma3GO7jpMUOJL4/pV6TCRn4aSQ89vqN9foZAAlN4WUuAxpKNpM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199015)(55016003)(38100700002)(122000001)(2906002)(5660300002)(83380400001)(86362001)(33656002)(38070700005)(41300700001)(9686003)(53546011)(186003)(26005)(478600001)(71200400001)(966005)(45080400002)(110136005)(316002)(7696005)(15650500001)(8676002)(52536014)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(6506007)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jBsBH99zCuTPw4jSjvxfd3OjtGjRzvtMTzBBunx6mPtHQfuxgXtrQmHTkdRQ?=
 =?us-ascii?Q?svxItxgFdLpk2vSMbE2I6DLheAsdvdFtpo4DktM/4IFxhxTEwb5swtmYNY2g?=
 =?us-ascii?Q?wdkIxcyMIxJ7w2TzmdSXnMX2Es2QWpMyQ7cF0AmKLLYQLZ530/QvtvN5EoJA?=
 =?us-ascii?Q?COvyDAwf2mB5CGnj8AHx0Ecr/RSWOb6nXwmCXw07mWUxGd5y5N7FyXuiexJH?=
 =?us-ascii?Q?nwJdLKxRVU0WMPgnWZChy/WOm98I4GRb0k7+J/nx2nT+uy6S0j6fJqPyqUba?=
 =?us-ascii?Q?uEcqq70qQp1aX/wQZJQx56td1dp6yPMImZN/fDTHgjtL+VIKGasf+92D29uv?=
 =?us-ascii?Q?v/CwVodhuoOccboO5rUbqbah6LmWdbRwuuYRj4Gfe/5qkS6OxW8d/Lq71xgA?=
 =?us-ascii?Q?ckwGLMR1RxvQ0pC9LykDba5fihafuyaWjpiu/tjBIcy33OYo8RnPnskktzpB?=
 =?us-ascii?Q?7yiiJQVrwuOIfV89WW9W/EWG+avxQjmC8jSTDlBU7gVXESedEDcilfTCrcVD?=
 =?us-ascii?Q?CQQIftMcjM/TIw7+sLslQSZTcCHk+jfMetBaEEDpGbyf6NOpwj0ge1gHfz+4?=
 =?us-ascii?Q?kLOzJoDbLb9VqOXx2FgBHKgnXgasL1LIscossv/AzphamY4Ccr3MJmeH3lh7?=
 =?us-ascii?Q?04CGTmahPRZPyNnjBIAoRRTDsruuqIkEGaqeaikV46VSEOB51174SaFrPJb/?=
 =?us-ascii?Q?385tHct22VRAw+sSuE8UxI0H8R+TZA1SC3CesklHirHbK4dRlZnuwgYe0UDU?=
 =?us-ascii?Q?PKVrlkR1tij63mkcOC2jWvNdbVTurFiY6UwSwqC6YCk3sUF7+jUXgqokldqB?=
 =?us-ascii?Q?qucL0MfRBdUbQaI7zr3HsFWRvSCTDvo/r++LyhH8UlCynDuXPcXpyymrpEjd?=
 =?us-ascii?Q?SeeMNQMIuQsN3GU3X2jlRqH+EGrWZnN63qn2BSAlb6AbC9+oF140BSYwF3xM?=
 =?us-ascii?Q?st9lHw5Rn2wb7oFSLou0vUcgNJwwftssVW5KwGCbeq3573YLM8dtE3Fn4uhR?=
 =?us-ascii?Q?SJ7Zy12lCUxKTnMx1HLtKNjmbIPly51j11NrJ0Jekp5DFzXqLTONKBEo6GUJ?=
 =?us-ascii?Q?6c4XWTuRLsULKZ4Ecoq4QO7A5QIS7CbI/DvkFpRTAsq0gQTjErX090EZZIuU?=
 =?us-ascii?Q?arKcnWj2Lt9ch9JrvdGwJYUqUPHpm5uXBv4DL4kwRgjqQlUtXCu8oAgFNyxA?=
 =?us-ascii?Q?73oPrMPn3Ax2+FoJOsWKGJ1NhQCzc92GNBKrBWMzua3HFNuQNl7ogQYE8v2j?=
 =?us-ascii?Q?gfyVLv0TxwRrvXYHC6JENu+TJkIyGMWllj1B+mO1x8niWf2w3eK3iiI3hUbp?=
 =?us-ascii?Q?98UyNiWp33Gvra8j6ZASu0GyAyRIcmm2d/a5qgdi2LtvsVGtKbAG2VWUg1L0?=
 =?us-ascii?Q?aa6RpPLRMDIZYTqrxJbRiVaeZt1R8QKsKwS2cYWu2O26QERPlt885Rj0wLZH?=
 =?us-ascii?Q?a5JlzcGZrguNKh2EVh5i39340V58UsMZ2CMDVwvYZyxgH19S1K+OsDBUjRi5?=
 =?us-ascii?Q?RiXBqDst259Mpu2QfuH433dPBw/GztBCsfsuBHhUjKN+Uvx5ZgDq+jNvGv8K?=
 =?us-ascii?Q?Dy6fk6O2C1bA7eF2BFE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54fd1750-3c94-4102-bdab-08dab82fbcb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 15:27:19.4994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yazyIRvx6tZUYAdPNPCDqHjOAoCvt0UyM6cHx8AVYfSj2t93grfpmNngCpy8pOqC2AC1p7IEXX/xrZOhksps1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

[Public]

+Jorge,

Can you take a look at this?

Something that comes to mind to me is maybe the more modern
platforms shouldn't be using hp_wmi's RFKILL feature anymore.

Aren't there rfkill services provided by all modern wifi drivers now?

> -----Original Message-----
> From: bugzilla-daemon@kernel.org <bugzilla-daemon@kernel.org>
> Sent: Thursday, October 27, 2022 09:58
> To: platform-driver-x86@vger.kernel.org
> Subject: [Bug 216468] hp_wmi: HP Elitebook 865 G9 after update BIOS to
> version U82 01.02.01 Rev.A causing rfkill soft blocked wifi
>=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz
> illa.kernel.org%2Fshow_bug.cgi%3Fid%3D216468&amp;data=3D05%7C01%7Cm
> ario.limonciello%40amd.com%7C01a1b92da9704ede465f08dab82bbf27%7C3d
> d8961fe4884e608e11a82d994e183d%7C0%7C0%7C638024795272794223%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI
> 6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DZVHHH70%2
> FoyrXWVbad9GvomwvlYaGwhpdQEiGEXJNFcg%3D&amp;reserved=3D0
>=20
> Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:
>=20
>            What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>           Component|Platform                    |Platform_x86
>            Assignee|drivers_platform@kernel-bug
> |drivers_platform_x86@kernel
>                    |s.osdl.org                  |-bugs.osdl.org
>=20
> --
