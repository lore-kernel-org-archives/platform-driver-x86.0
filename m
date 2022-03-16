Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAC9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 19:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346526AbiCPT06 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 15:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344118AbiCPT05 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 15:26:57 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2040.outbound.protection.outlook.com [40.107.96.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B12B6E35E
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 12:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUa4LJnv+XeIXY4/dJ3a7s17kLGZzM+wT9XoBM+2mLjLBwsPG+/0LnLnRfCXHUsMBsnSXbZkiPIxOivMyKgrD+zTpCqOirO8MG8+XZnrNer90ZETe5SX3l2iSjXgbJW0riTK31ziGHZXcHFzmTJOctPV4gdILNPX8ZiIjLUYzrbWccXQ+u9St99okgSqVa5wIsK/6Q+Jvo7t30GYLJeBJ+EOgkbJ7rQP3+QATBQGRi3lz+yRm2e10Nitb4y8LHeYBVnzMahSeqsp9ZyhhxIKJSDqgxIKOdIXXEW/XVChpgDxMRu2//xRe0CKzeD3SMOBU2o7tiTv4KJ472+i3J6jqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRfrlhTIq47KjIQwIAxmFV61VhTERFQg2aITtMISTsA=;
 b=h9spwwEi5Cu29zl0vjmH4nOIN3tLhq3ZOX22ts4g5H5VtPhCLkWyPTZlOJ6124cFWJLnrWc5So/X0oSlC3IJQUChQZxmba3oXjgRMa4283EAU2JvBEWP7YHXev+t/zs+4FjYn/dClBSz2/GODe0mWTV8nA6bHTejJWJ5uehaCJq2SMzvtgfc/Q9zKMR2W27RQsTGAPacoxxYVbC5U91bWntxXOnxLolT+SkC+oMi7cE35e8yV4BsoyMBA0qPdaUrbMCUrt0ZhRIb96Cjzu6xs16kMTybBc3MGVdA/XEz5A2V89ECZA04YrUbZ99ld+dx1R0xzk4bTJXtb6YuTv8vjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRfrlhTIq47KjIQwIAxmFV61VhTERFQg2aITtMISTsA=;
 b=1Lvw9vedF/U9MGJIX1RU5V5RafRjhcr8rqu92lS/Zblz7d0KRoWwtpSAXGb0IU2URlZ2uM5Ud04ELilxRp1Xjpyuvv3YfdrHqIk4mJ57RmACNVuIXmpb3/Gsbnug2fMfnpBwjSHm0n9MXGUJYwqXA1vgUv9qRm7St/e+a/g0OzU=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BL0PR12MB4897.namprd12.prod.outlook.com (2603:10b6:208:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 16 Mar
 2022 19:25:37 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 19:25:37 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Daniel Dadap <ddadap@nvidia.com>,
        =?utf-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
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
Thread-Index: AQHYONTN37ZmrvSyq0ixjjgRCkZtxqzBT4WAgADO84CAAAQKgIAAHLSAgAACkwCAAAWoAIAADD1wgAARXgCAAABysA==
Date:   Wed, 16 Mar 2022 19:25:37 +0000
Message-ID: <BL1PR12MB515799AD192C4DDD25EFF990E2119@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220316012516.2233984-1-ddadap@nvidia.com>
 <v_ODhOndx3g1l-BhfKGCB6_nLY83LTc5vz1YDrVEVVF5CmgKUs1x9bmROyWXhmYkeQRVVnvfBnyrFyHaEKqtoZE5P7lKJJ1j_vE0J1Piq2Y=@protonmail.com>
 <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <BL1PR12MB5157B047D2DD5548FE08F0ABE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
 <7d56afc0-3428-6ab5-ba41-c5ce4f1a7ad7@nvidia.com>
 <BL1PR12MB5157CA033FD8117DCC79D0A4E2119@BL1PR12MB5157.namprd12.prod.outlook.com>
 <d3d86512-42c6-a5df-752d-efbb89257d3a@nvidia.com>
 <BL1PR12MB5157FD128325F8CCB77E390EE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
 <884d57c1-5f41-ea80-dfaa-ab5b2f310891@nvidia.com>
In-Reply-To: <884d57c1-5f41-ea80-dfaa-ab5b2f310891@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-16T19:25:26Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=1c2ed776-617c-4ae5-a618-8afc262fc7f9;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-03-16T19:25:36Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 06efbf68-2eed-429a-ad6b-9f7dfabbbcec
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a532815-65c4-49ec-1c6e-08da0782c01e
x-ms-traffictypediagnostic: BL0PR12MB4897:EE_
x-microsoft-antispam-prvs: <BL0PR12MB4897D612D5EC41622E900C37E2119@BL0PR12MB4897.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rky66aPgy+6EAh9T+RiWOaxhPnoRMX3jDxVwLmeCEOtVbsYGrAUOB57O4+iJ3aeS2yCR/lzS2xDu3MqzV0qZf4WB+xyaY7SU/kwczfzMP9UKnAQQlZmANEU32GteZob0CK2KlDv8izxKfcwKXdHrjpHGpaejoJK9heppCw3Wnp+ykvytjElg8qcdVvTclUKoMIxbiqQTfCDE9QReO7ErDOwk/pgskVyxCTURcGZ/4ysIFn2cZvbQrJPLmZvkUBMVsDOcIiMl8oC4LUQEXoaobyKnRnVRcjkfLsj1EsTqP24RNfM4fT+nqUGwZiKw6mpb6XOhROoBhPq/lz2QFPeiYARpJsMKay4naBxkt6UOIpP6q5Q84HwKHnfSrBiGexk3GTAy9TA5Sm/s5xKS8XSoMy4DlcuuvANgTQoJLXbXq37SS3nz6zO8wzEbIGeAIxxVzHa3WoNS0KLswkjL4lYlOtXOXDY/Roq3rEea2u+smMm5uKJYV/bPXK1QL833GUaQgMJK1mb3MmU2SVntnJVtgBJNk5DBeiaWq4cv4gnVDzEKfmrQhnjtGVLmlifg/B3VmbZw6TRDzghw9dAGJnUhWbUK2LlBReNfjhdTVjTHyX758VW4SmRF3U11sic8+YxiBIbCP6X46JlVqhKl8gQ4hGRlpnCxV0BV75fy5tUgLpHcodXEmSLiLZqL0R12sUyHNpDmg7AnONxYRmNIq1Y57g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(2906002)(5660300002)(8936002)(66476007)(8676002)(64756008)(66446008)(66556008)(4326008)(66946007)(38100700002)(86362001)(33656002)(122000001)(76116006)(55016003)(38070700005)(9686003)(508600001)(186003)(316002)(83380400001)(54906003)(71200400001)(6506007)(110136005)(7696005)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEtEc2Z4T3V4b1JUL2pycnYxdkJwbVRRTlc5RFA5YjdxY291Qy92LzJvckl1?=
 =?utf-8?B?MmJSQzB0S2FqcnorM25PaUgvNXNzY21WUDVLTkZocC9KemZrZnZRbmxnaEpW?=
 =?utf-8?B?TE52MDYyRjU3eDY3NC80UWtEdFRYVTdZVmg1SXhWQ2pjMFNhU3k5dllKZVBS?=
 =?utf-8?B?aHVKQTl1MXZSaTVRM0EyVStaeTdiY0c4WXZJc3IrcmNJOWpjRzNhY3BBWWEw?=
 =?utf-8?B?NVJSZ0w0aU1McVNML1Rab1Bjb3hUei81KzVSempBZWlPdkJORmdwNW8zU0do?=
 =?utf-8?B?TTBQd1lYSHNaYTQxMENrZUY1YWYyMy9ab0VPQUZUcEVReG0yNmRwd01Xektv?=
 =?utf-8?B?QngvK1AvcE5CUG1mRms3RGZNTzIyOTI1dEY5Y0Zna3BhRi84bjM5dHBQNDl5?=
 =?utf-8?B?cmpzSXR5ZlQ4SDBjSzR4WWx6QUdvT01xS0xIYkgxUkdOdkxyckJ0aUJ2UHNS?=
 =?utf-8?B?NGZ1MmVQUE1OL1FmRXVsdnNnWTJ4YWIwblVnQUY5Y3ZNQnR1bVVUaVlseU5y?=
 =?utf-8?B?MVplN0dKUW41QlhRZDNGdWVUbHgvTnkyZm9NSUdwWW5HY0FTUW01ZDFEYmFV?=
 =?utf-8?B?T1h4UGpNbmVpRTNkMTVETEVpWWpIdHJDOVpaUWRxOWtrQjFPVCsrMzllKzhK?=
 =?utf-8?B?SWE4MUxVeGRMbTJJTFZRODRqTEZaemNadXNqaWNKQlNyYkN6NFpHa1h5aHpn?=
 =?utf-8?B?YVhyc01WS0phVXpDK3g0S1Z2TzZpQUhXeFpMT1VsaTNDTXorUnZYU2p3V1Vn?=
 =?utf-8?B?d3JqMktPV0xSelhZRUxpVlJaNUZnVGZXT2ova0V6QUpMbFFCemFBcDdsRUY2?=
 =?utf-8?B?RUN6MmIwTDcrRldzZE5VMzhrZ2N1QUI4aTlpSDBwZFVQRG9ydC81dWlYMExv?=
 =?utf-8?B?MW1UL1hHa3RFWFZhbllhc2JoOG5veFNWM0xGTURtVlNkR2NSU3ptVXhlblJi?=
 =?utf-8?B?dm9Cc0ZjU0xQVTFFN0l1Z2xDUitXVTQvblI0UXRxNU8xa2hZWjEzUkhOSW16?=
 =?utf-8?B?SEFWWnBuVFdHYlRNLzlUMVVaMHRuZWNJYXhhWExPTEE4VTNHOG15VXp2M2ZS?=
 =?utf-8?B?NC8yNEhIaG9haDczL1RiV2NZeE5zZXlhVTVvdXBjeDFaQnVSeDJ3ZVY2bTlX?=
 =?utf-8?B?ZmVVNnpsZU5DQlVQK004REIzSk4yUzBNMFJzYi9EYzVjdXV3N3VUZFNLb1M0?=
 =?utf-8?B?U1BrYlpxTUdnN3FJdGwxM21hZmU1MWlab2xYWXJ1UzVSUXMwL2tmOG80aENT?=
 =?utf-8?B?RDk5UERjSnV2Q0VnUlNDeG1zcE9ZUjA2SHVjT3E4UkRkTEtDVGRkME1ydVVT?=
 =?utf-8?B?NlVNREwzRmF3RnZOelFWTDFKMTAxVkVjTjJDQXZKbnYzMUwyT2E0dXZWRnNp?=
 =?utf-8?B?UFB4cVdGMklKNVRnZnpZYU0vbEp2bzZuNVFlQkpJS1ZMbG9Cd0hrTHc2VXoz?=
 =?utf-8?B?NWdXZzFJYStXMW1Tb1VuZEJkYVZtZ1FIWDdFSHFkMWlNMjVpa2JVaGFBYWNW?=
 =?utf-8?B?ZHFEdmM1SHdMZWRpUCtsR25WcnZ4cTNOOTZvaUp0bUVNSzJkZmR1VXFzM3M0?=
 =?utf-8?B?cjhtSjJodDVwSXRhb1lXUmJpYzdqN3V3eDNNOWFaSWUwK1FaR2JJbTdpb0ZT?=
 =?utf-8?B?b2lKWkxRMzk2S1p6YzgxZnNIcFlsNFNlbmhSSGZIb0U0eVhuWTltbWhkbVlP?=
 =?utf-8?B?eU1rU0tDT29hVDFJVnJlbi9LTk96UEFFcUFjbmpXemlFRkZtamc3cGwvNFd0?=
 =?utf-8?B?dlgwSU9qcWxYc0N1Wmk1cUhQQTIrUHd3emw5ZUFrMHNJWTB3ZjZGVnl4M0tG?=
 =?utf-8?B?TnVRVEp6UUswZ2xLRUVZZ0ZBWTNEK3lOdzB1aHhnajRkWWhTbGc3Y2V5aDJL?=
 =?utf-8?B?MUhxOGU3NktZNVYvKzU0aEFzaUxjY1ROSm5TdGl6WmtXSWdENGxUY0l5U3M2?=
 =?utf-8?B?alc2OTEwZGFWU1JxRHdHVm1rYjUrcDlyV3BKNGhONWpDWGVubGhtZFNOLzdM?=
 =?utf-8?B?RHluTFBSU3RCR2JxU05ESlJpb25FV3JCdUxBdFpMSnN4V2tnS1JwRCtJdzF6?=
 =?utf-8?Q?7clcED?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a532815-65c4-49ec-1c6e-08da0782c01e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 19:25:37.5750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ubLqP/stjFTBsUm97Zhkcmzd1ThgTZqo/xWSuHcqtDCKilqemnuqaWAN5A1nz0LJ31n37UuGD0bBzcwPdpoaIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4897
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFu
aWVsIERhZGFwIDxkZGFkYXBAbnZpZGlhLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXJjaCAx
NiwgMjAyMiAxNDoyNA0KPiBUbzogTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5MaW1vbmNpZWxs
b0BhbWQuY29tPjsgQmFybmFiw6FzIFDFkWN6ZQ0KPiA8cG9icm5AcHJvdG9ubWFpbC5jb20+DQo+
IENjOiBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZzsgQWxleGFuZHJ1IERpbnUN
Cj4gPGFsZXguZGludTA3QGdtYWlsLmNvbT47IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhh
dC5jb20+Ow0KPiBtYXJrZ3Jvc3NAa2VybmVsLm9yZzsgRGV1Y2hlciwgQWxleGFuZGVyDQo+IDxB
bGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBudmlkaWEt
d21pLWVjLWJhY2tsaWdodDogQWRkIHdvcmthcm91bmRzIGZvcg0KPiBjb25mdXNlZCBmaXJtd2Fy
ZQ0KPiANCj4gT24gMy8xNi8yMiAxMzoyNSwgTGltb25jaWVsbG8sIE1hcmlvIHdyb3RlOg0KPiA+
IFtQdWJsaWNdDQo+ID4NCj4gPg0KPiA+IEkgZ3Vlc3Mgd2hlbiB3ZSBzZWUgYmFja2xpZ2h0IGlz
c3VlcyBvbiB0aGVzZSBBK04gZGVzaWducyB0aGUgY2hlY2tzDQo+IHNob3VsZCBiZToNCj4gPiAx
KSBBcmUgdGhleSBzdXBwb3NlZCB0byBiZSB1c2luZyB0aGUgbnZpZGlhLXdtaS1lYy1iYWNrbGln
aHQgZHJpdmVyPw0KPiA+IDIpIElzIHRoZWlyIGtlcm5lbCBuZXcgZW5vdWdoIHRvIGhhdmUgaXQ/
DQo+ID4gMykgRG8gdGhleSBoYXZlIHRoZSBjb25maWcgZW5hYmxlZD8NCj4gPg0KPiA+IERvIHlv
dSBoYXZlIGEgc2NyaXB0IG9yIGNvdWxkIHlvdSBwZXJoYXBzIGluY2x1ZGUgc29tZSBkb2N1bWVu
dGF0aW9uIHdlDQo+IGNhbg0KPiA+IHBvaW50IHBlb3BsZSB0byBjaGVjayAiMSIgc28gd2UgZG9u
J3QgYWx3YXlzIGhhdmUgdG8gZ28gdGVhciBhcGFydCBBQ1BJDQo+IHRhYmxlcw0KPiA+IGFuZCBt
YWtlIGd1ZXNzZXM/DQo+ID4NCj4gPiBJIGd1ZXNzIGl0J3Mgc29tZXRoaW5nIGxpa2UgZ3JhYiBf
V0RHIGFuZCB0aGVuIHBhcnNlIGl0IHRvIHNlZSBpZiB0aGVyZSBpcyBhbg0KPiBlbnRyeS4NCj4g
DQo+IA0KPiBQcm9iYWJseSB0aGUgbW9zdCBmb29scHJvb2Ygd2F5IHdvdWxkIGJlIHRvIGNoZWNr
IGZvciB0aGUgR1VJRA0KPiA2MDNFOTYxMy1FRjI1LTQzMzgtQTNEMC1DNDYxNzc1MTZEQjcgaW4g
L3N5cy9idXMvd21pL2RldmljZXMuICgyKQ0KPiBzaG91bGQNCj4gYmUgdHJ1ZSBmb3IgdmFuaWxs
YSA1LjE2IGFuZCBsYXRlciwgYW5kIG1hbnkgcmVjZW50IHByZS01LjE2IGRpc3Rybw0KPiBrZXJu
ZWxzIHdpdGggSFdFIGJhY2twb3J0cy4NCg0KUGVyZmVjdCwgdGhhbmtzIQ0K
