Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4A0C04A6A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Aug 2023 08:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235599AbjHOIK1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Aug 2023 04:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232758AbjHOIJ5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Aug 2023 04:09:57 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742E51703
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Aug 2023 01:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWTCYhi2t/J6Pp0sd7+9o1ORgv1jZ/HVYCubSPIpM0nijZv3ZJGcQi31BRuq0q3GfPYetCy1KzXQKd+AO3puSQ+mgitEg/EPdYeTLi1sHST53itWvDS4lU+GZAB6AqjGsJiWE1BRs290mnjGZbWJXFFt4fnQVSUYppz891jQV4uQ8nvUDExu9pDM4CDWTxRD77CPSBDHBlpgadhKp6R/OiHsSjWwiQclZb+n2Iu1fHRLafUuoKT8uex0qMNMAQtEdtol1CJd32ccXHue138G1CIY3xo2GRncaneNZsX4wh4LVz/5nWPUqe2SSOxE3TjQaGI9LnQSGGnNiis14sFPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3RChoD5/3MIDrFukf8lEeQeQKq2ERuUWplDVI+ZSCk=;
 b=W/DataRzZx+VvivxT/xRUThLQkJifbH8AXTcHGs+Xh4H3pzPiWuq4PWsajiMn1sBnu0Q3lLy6Qz6BJ9+9VPPqm3NuIb1Jt8iJ95ydc9WSFXMFIPqEHczJsqy6OooduwMjkfRUFg80aVU+xDIZhcTr2FHzzFDtEcTl48d0eGRiBwT15pFKUSvq8CUfjapfnzIIlaGDGne9/SZD2cw0M07RMpg4zcrawiFrzUphzy/khG/FTsewDhvZdQBWB9rgz0Gbkw8SWX8I7a71LSCNz+mlkHspBBE+TsfP1atjiBbJpRXLNcMbzKX0Gg638zP7vciDo1JhJK2bRaeQlKfLSTfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3RChoD5/3MIDrFukf8lEeQeQKq2ERuUWplDVI+ZSCk=;
 b=TvCia+tLLwUJkkIj4GvnrjcdVfqkM7gCYd0u6D5fQ9Hdq63UiqZ8S+mW4rs7KcCxP+jrZTGkJWYnJwC0mEd4NKyx8I/sohdUoPor7xxCCqGe0aha++3vMdmh7FidxEmFzZ8YiXWA7Sh+UuSNFUP8ZWUJLtQmNzEvlJjNEgHpttJEbd66ocm/tTxZLfS/3IRzoDTXvgndHNt2H81Hb3E0K/hSYzSvEDfGjv7kHUmHxXyIylcq/mDoCp0Nrpx90Aw9LcdOa4GzanNVbVAIZ5qBmF/J0mQf3ROIZTSHBaV5iXPgq4QjewyYMDAQtOfhz1BtEVaNjlIgGMa6fYb1lVsVTA==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by PH0PR12MB7837.namprd12.prod.outlook.com (2603:10b6:510:282::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 08:09:52 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb%4]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 08:09:52 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>
CC:     "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH platform-next v2 00/16] Add new features and amendments
 for Nvidia systems
Thread-Topic: [PATCH platform-next v2 00/16] Add new features and amendments
 for Nvidia systems
Thread-Index: AQHZzu7BZ4Lf1qukW0+SX5tJvSVk/q/rALcAgAAAf4A=
Date:   Tue, 15 Aug 2023 08:09:51 +0000
Message-ID: <BN9PR12MB538136ECEF25054EC6EAE9B1AF14A@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <20230814203406.12399-1-vadimp@nvidia.com>
 <34f2c08b-c07b-b789-487b-615868cde500@redhat.com>
In-Reply-To: <34f2c08b-c07b-b789-487b-615868cde500@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5381:EE_|PH0PR12MB7837:EE_
x-ms-office365-filtering-correlation-id: a78cf409-68eb-4187-9bfb-08db9d670090
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SdlxazvCJM+DTpGarSplW+kbCpvPV8jYyIOYk6Y2wML1rRsUJfH/j7LmB1b7quy5Sqmpzj458fNnBjMe8kXZ9zOEdtSVYXOrWhhSzQdbjGgRY1fLz8BlghW41dI4Pvj8aFk27bC78icOlQab0kq3f11vMq9gbtpN+4XvV9eYz6nOteKSUThqKsYZmSOq8ZYKS2ylwnGknMYcO2TxJcmCqVbc1YMocAVlXBZbdcy+zopCI7GzxXfPAzYP+3/aYrnBwZb5+bGkMImk9gfD7hN/LWCYOtvOqlhrQ1VHmQu8/3mLn5oIW8FDtZD+8LD3y0nSIsG3vN+to02+13ob95wBGOA59l6RneDjMVGEg2sxm3iH2XPdc7EfQ5pFZC1+3QuRgmUKSXyiUfDyziViXpoLmCGzEhCx9IN9p8T3z8qEAuGOFxs/vTwAedGY4P+WNPiDBb5p5mgvVOUcDpU5Ir16JeDTUrSvyOI4E+K45+Kr703WK7U+rZbRvWGNToyl7zL8Lf5SlwWt9B8wNmKUgcd58ei/SqRnlgE0csknUxktlAJ7ynbu02/tCayuriTgtIcbxbZSB3xIsznCLkOzMwDENljgtxA0pjv6VoAHLu3VpkCENK2PtAThHJFOkqQJOLCo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(186006)(1800799006)(6506007)(53546011)(7696005)(9686003)(83380400001)(71200400001)(52536014)(5660300002)(8676002)(8936002)(2906002)(54906003)(478600001)(316002)(41300700001)(76116006)(6916009)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(86362001)(33656002)(55016003)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlBOQ21XZWFjN1NoQmFkdWdFT245QXJoWVBEb0NYRkQvYUJ5RVZpbDFMZTU1?=
 =?utf-8?B?Q2pYMCtjQWhHOFpzaEs0Z3JTcEx2aHNtTUROWVhHdzByTTlsWmlKSVZkc1g5?=
 =?utf-8?B?QTZVSlUybWo1ZzRnVlFLZmEyOHlYWXhrVi9Gb00vbzYwSWtzUEVpNHU0Rmdm?=
 =?utf-8?B?RnNVcy93eTlZM0NmRlE3NW9xcXV0RmtHeFVFN0w2NTJNUW9KQjRpQVBYNHVO?=
 =?utf-8?B?clplTS94R1d2bHNWaW5lamtPd1ErN3VYMGRLc252N3F0bDhhS0lwMWtBeTVY?=
 =?utf-8?B?d2tLVU93aHFJVGwvTWdBZzc1a1k3NFY3V0tDczZHNm16ZW1ZdlR5anF3V3pj?=
 =?utf-8?B?Z1ZjNy9uSWgvMnNyTEdPckJxU0hUTS9xUVhzZkF1WW5CNDR6a2pUWlJweThx?=
 =?utf-8?B?aW1kbzRBQWtwUVBzeG9zZDVBbWc3ejU0blFxRk85VTF6eXpzdHZaRDZZSm5O?=
 =?utf-8?B?b3l0NWhzUFVPVjNQYy9sSUFuczFMaUJkT3F1Ym9ya2FKWTNZNEZKWVV3WERV?=
 =?utf-8?B?WFV4TEpwUnJMeGxOZHpRdUljSjlLa0R1bjd4MHgzY05WSFpjNGZtS2tGYXJ0?=
 =?utf-8?B?bk94R3RONEtVNElhbVpsbzJDV3JBQnpDUU1nOU81T1g3TGdHRjdtbTZENmw0?=
 =?utf-8?B?YjhNMUJGNFE5bThiMWhoT1doZzVOaHFpcGVmT01JTnJnNlY0UHU5NDNaYWRx?=
 =?utf-8?B?VjREZm9vY3ltbHg5R2t4ejFGWGowaUw1SDdhVWRIVjlyNVM4aWc3VVVaNmN5?=
 =?utf-8?B?YVg3a3g2NUgxdFpBZmR2RG5rbDhURjhXQlRTanQrUVQ2ZVI2SG1kNnlEaHJz?=
 =?utf-8?B?UWFac2ZyRHU1cmJzc0Mva2JMa2d0ai9OM3UwdDBBbUs5ZFRZQ0c5US84eTZx?=
 =?utf-8?B?QUxSdHRVV0hpdDc4bzZ3N2Z5RTNmcUFvRWNWUnVRZlZBeXRsQ3lUc1FZbmhl?=
 =?utf-8?B?ejd0ZUhmYjJndFoxaVI4ZFdLc2Q3bDF4UnhxZ3YzVS80RTlyZjhNYkUzREFC?=
 =?utf-8?B?S29BSkUzREliNXBUbFczWk9kM2ROVzJkWHJrMzZsMmtGRUhZeW5aVjcxZUlS?=
 =?utf-8?B?WUNVMFcvYzgyaW5VaUkzUjh6V2sxVms5MVp0RDcxMy9qSlVzZks1N0lVMWs2?=
 =?utf-8?B?K2gzbUVFeG9yNjJBTDk3NjJFQk9iZ0gycExLbWMxRmg2Q3dCd0FpMCt3eEox?=
 =?utf-8?B?bUtta0RvYUhBN0dORGZZS3NqQ09iMEhxam40dVo1UUdEWUo1QU9FYUYxMlp6?=
 =?utf-8?B?K21WY0pQbVJXMXN5b0MyZFVjcDdNQUlCRk5td0NlVHZvcWc4S3FHSFJ5WXNi?=
 =?utf-8?B?dExxYzdQcDNlWWhpMDZKTzQ0V2lxeHRsS2Y5aU94bjBYTTc2SzlIekJNNDdI?=
 =?utf-8?B?eFZxZjJDMXVPdEJYTXBTeXpBWEp1QkVkZjd2VEpqdUp3VExXRzZkUjhleENs?=
 =?utf-8?B?ZlVGUWdUc1oxNGtscXNoYkQvVlkxczZINzV4bGgyRDNtOEpldzlOT05OSURn?=
 =?utf-8?B?TjZyckM4Z3B4dm03MG5UekdMSzVwT3VvQnNxWkdpSkpIY0gyb0dWd3cyQ3Vv?=
 =?utf-8?B?U2YvTmpjZzVHNHo1M3ZsWHM4OGtPNGpIWFpWcjl1ZmJPd2RYdGx1WExEa0h0?=
 =?utf-8?B?eStldFNVb05aME1zZEpvOUJNOVlNcmszSWJ6bitlQnM5T1BYUFp4WVpTYjVW?=
 =?utf-8?B?SStjSVYyOGh6QzZqbGxmWUNHd1VRcm1kWER0K1FjRnF2alpWVEhBMnpreWdm?=
 =?utf-8?B?aC9OSkcyaUdVQjRFNFovTzhwZlRqMkNCL0ZuSHlxZHIrSUR5N0dJSDRTd3Rt?=
 =?utf-8?B?bWlZU3h2UDhGRVZUT3dhYU9GNDZONFRDaklTd083SWI0SExUbnkyaEtKZUda?=
 =?utf-8?B?Tyt5YlpJN2I2RExUeTZBVmpMamxGTmpzMkdxV3FtVlFGMjY3Q1Vad0NZMDJ2?=
 =?utf-8?B?VDhZaTNUL3JaVnNOR1duQ1FqOFM4NnJuN1R1ZWRKdzBYc2NOUjRCZm40emFp?=
 =?utf-8?B?OU1DOVdsZmlPUkhvZ2N1TGJsOW9DUTlvVzM4QzdPVkkreHIyRlB4Ry9CYW40?=
 =?utf-8?B?MU9FSUR1cVVnMkYxNkdUMGRRVWsxRlJKY0ZhUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78cf409-68eb-4187-9bfb-08db9d670090
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 08:09:51.9198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 42gG+GwWMCU2GkLZUrg9iRO3kSLfR0GLqNXXytUMIqVWZj0TKFcrxCBzUE47PILjO1d13zArQEH5uwEDiFKaxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7837
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KSSBwdXQgY2hhbmdlbG9ncyBpbnNpZGUgZWFjaCBwYXRjaCwgd2hpY2ggd2Fz
IGNvbW1lbnRlZCAodjAgLT4gdjIpLg0KV291bGQgeW91IGxpa2UgbWUgdG8gcHV0IGl0IGluIGNv
dmVyPw0KDQpUaGFua3MsDQpWYWRpbS4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCAxNSBBdWd1c3QgMjAyMyAxMTowNg0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBA
bnZpZGlhLmNvbT4NCj4gQ2M6IGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tOyBwbGF0Zm9y
bS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHBsYXRm
b3JtLW5leHQgdjIgMDAvMTZdIEFkZCBuZXcgZmVhdHVyZXMgYW5kDQo+IGFtZW5kbWVudHMgZm9y
IE52aWRpYSBzeXN0ZW1zDQo+IA0KPiBIaSwNCj4gDQo+IEl0IHdvdWxkIGJlIG5pY2UgaWYgdGhl
cmUgd2FzIGEgY2hhbmdlbG9nIHNvbWV3aGVyZSBpbiB0aGlzIGNvdmVyIGxldHRlcg0KPiBleHBs
YWluaW5nIHdoYXQgaGFzIGNoYW5nZWQgaW4gdjIgPw0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEhh
bnMNCj4gDQo+IE9uIDgvMTQvMjMgMjI6MzMsIFZhZGltIFBhc3Rlcm5hayB3cm90ZToNCj4gPiBU
aGUgcGF0Y2ggc2V0Og0KPiA+IC0gUHJvdmlkZXMgTmV3IHN5c3RlbSBhdHRyaWJ1dGVzIGZvciBt
b25pdG9yaW5nLg0KPiA+IC0gQWRkcyBzeXN0ZW0gcmVib290IGNhbGxiYWNrIHRvIHBlcmZvcm0g
c3lzdGVtIHNwZWNpZmljIG9wZXJhdGlvbnMuDQo+ID4gLSBBZGRzIHN1cHBvcnQgZm9yIEFDUEkg
YmFzZWQgaW5pdGlhbGl6YXRpb24gZmxvdy4NCj4gPiAtIEFkZHMgc3VwcG9ydCBmb3IgRlBHQSBk
ZXZpY2UgY29ubmVjdGVkIHRocm91Z2ggUENJZSBidXMuDQo+ID4gLSBBZGRzIGFkZGl0aW9uYWwg
bG9naWMgZm9yIGhvdHBsdWcgZXZlbnRzIGhhbmRsaW5nLg0KPiA+IC0gQ29udGFpbnMgc29tZSBh
bWVuZG1lbnRzIGFuZCBjb3NtZXRpYyBjaGFuZ2VzLg0KPiA+DQo+ID4gVGhlIHBhdGNoIHNldCBp
bmNsdWRlczoNCj4gPiBQYXRjaGVzICMxIC0gIzMsICM1OiBhZGQgbmV3IGF0dHJpYnV0ZXMgZm9y
IG1vbml0b3JpbmcuDQo+ID4gUGF0Y2ggIzQ6IHNldHMgaG90cGx1ZyBldmVudCBhY3Rpb24gZm9y
IGhlYWx0aCBhbmQgcG93ZXIgc2lnbmFscy4NCj4gPiBQYXRjaCAjNjogYWRkcyBDUExEIHZlcnNp
b25pbmcgcmVnaXN0ZXJzIGZvciBzeXN0ZW1zIGVxdWlwcGVkIHdpdGggZml2ZQ0KPiA+IAkgIENQ
TEQgZGV2aWNlcy4NCj4gPiBQYXRjaCAjNzogbW9kaWZpZXMgcG93ZXIgb2ZmIGNhbGxiYWNrLg0K
PiA+IFBhdGNoICM4OiBjb3NtZXRpYyBjaGFuZ2VzIC0gZml4ZXMgbWlzc3BlbGxpbmcuDQo+ID4g
UGF0Y2ggIzk6IHByb3ZpZGVzIHN5c3RlbSByZWJvb3QgY2FsbGJhY2sgdGhyb3VnaCBzeXN0ZW0g
cmVib290DQo+ID4gCSAgbm90aWZpZXIuDQo+ID4gUGF0Y2ggIzEwOiBwcmVwYXJlcyBkcml2ZXIg
dG8gYWxsb3cgcHJvYmluZyB0aHJvdWdoIEFDUEkgaG9va3MgYWxvbmcNCj4gPiAJICAgd2l0aCBw
cm9iaW5nIHRocm91Z2ggRE1JIGhvb2tzLg0KPiA+IFBhdGNoICMxMTogYWRkcyBBQ1BJIG1hdGNo
IGhvb2sgZm9yIGluaXRpYWxpemF0aW9uIGZsb3cuDQo+ID4gUGF0Y2ggIzEyOiBhZGRzIHN1cHBv
cnQgZm9yIGdldHRpbmcgc3lzdGVtIGludGVycnVwdCBsaW5lIGZyb20gQUNQSQ0KPiA+IAkgICB0
YWJsZS4NCj4gPiBQYXRjaCAjMTM6IGFkZHMgaW5pdGlhbCBzdXBwb3J0IGZvciBwcm9ncmFtbWlu
ZyBsb2dpYyBkZXZpY2UgY29ubmVjdGVkDQo+ID4gCSAgIHRocm91Z2ggUENJZS4NCj4gPiBQYXRj
aCAjMTQ6IEV4dGVuZHMgY29uZGl0aW9uIGZvciBub3RpZmljYXRpb24gY2FsbGJhY2sgcHJvY2Vz
c2luZy4NCj4gPiBQYXRjaCAjMTU6IGRlZmluZXMgdGhlIGV4YWN0IGkyYyBidXMgb2YgZmFucyBv
biB0aGUgU04yMjAxIHN5c3RlbS4NCj4gPiBQYXRjaCAjMTY6IERvY3VtZW50cyBuZXcgYXR0cmli
dXRlcy4NCj4gPg0KPiA+IE1pY2hhZWwgU2h5Y2ggKDEpOg0KPiA+ICAgcGxhdGZvcm06IG1lbGxh
bm94OiBudnN3LXNuMjIwMTogY2hhbmdlIGZhbnMgaTJjIGJ1c3Nlcy4NCj4gPg0KPiA+IFZhZGlt
IFBhc3Rlcm5hayAoMTUpOg0KPiA+ICAgcGxhdGZvcm06IG1lbGxhbm94OiBBZGQgbmV3IGF0dHJp
YnV0ZXMNCj4gPiAgIHBsYXRmb3JtOiBtZWxsYW5veDogQWRkIGZpZWxkIHVwZ3JhZGUgY2FwYWJp
bGl0eSByZWdpc3Rlcg0KPiA+ICAgcGxhdGZvcm06IG1lbGxhbm94OiBNb2RpZnkgcmVzZXQgY2F1
c2VzIGRlc2NyaXB0aW9uDQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9ybTog
TW9kaWZ5IGhlYWx0aCBhbmQgcG93ZXIgaG90cGx1Zw0KPiA+ICAgICBhY3Rpb24NCj4gPiAgIHBs
YXRmb3JtOiBtZWxsYW5veDogbWx4LXBsYXRmb3JtOiBBZGQgcmVzZXQgY2F1c2UgYXR0cmlidXRl
DQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9ybTogYWRkIHN1cHBvcnQgZm9y
IGFkZGl0aW9uYWwgQ1BMRA0KPiA+ICAgcGxhdGZvcm06IG1lbGxhbm94OiBtbHgtcGxhdGZvcm06
IE1vZGlmeSBwb3dlciBvZmYgY2FsbGJhY2sNCj4gPiAgIHBsYXRmb3JtOiBtZWxsYW5veDogQ29z
bWV0aWMgY2hhbmdlcw0KPiA+ICAgcGxhdGZvcm06IG1lbGxhbm94OiBtbHgtcGxhdGZvcm06IEFk
ZCByZXNldCBjYWxsYmFjaw0KPiA+ICAgcGxhdGZvcm06IG1lbGxhbm94OiBtbHgtcGxhdGZvcm06
IFByZXBhcmUgZHJpdmVyIHRvIGFsbG93IHByb2JpbmcNCj4gPiAgICAgdGhyb3VnaCBBQ1BJIGlu
ZnJhc3RydWN0dXJlDQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9ybTogSW50
cm9kdWNlIEFDUEkgaW5pdCBmbG93DQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0
Zm9ybTogR2V0IGludGVycnVwdCBsaW5lIHRocm91Z2ggQUNQSQ0KPiA+ICAgcGxhdGZvcm06IG1l
bGxhbm94OiBBZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBQQ0llIGJhc2VkIHByb2dyYW1taW5nDQo+
ID4gICAgIGxvZ2ljIGRldmljZQ0KPiA+ICAgcGxhdGZvcm0vbWVsbGFub3g6IG1seHJlZy1ob3Rw
bHVnOiBFeHRlbmQgY29uZGl0aW9uIGZvciBub3RpZmljYXRpb24NCj4gPiAgICAgY2FsbGJhY2sg
cHJvY2Vzc2luZw0KPiA+ICAgRG9jdW1lbnRhdGlvbi9BQkk6IEFkZCBuZXcgYXR0cmlidXRlIGZv
ciBtbHhyZWctaW8gc3lzZnMgaW50ZXJmYWNlcw0KPiA+DQo+ID4gIC4uLi9BQkkvc3RhYmxlL3N5
c2ZzLWRyaXZlci1tbHhyZWctaW8gICAgICAgICB8ICA0MiArKw0KPiA+ICBkcml2ZXJzL3BsYXRm
b3JtL21lbGxhbm94L21seHJlZy1ob3RwbHVnLmMgICAgfCAgIDIgKy0NCj4gPiAgZHJpdmVycy9w
bGF0Zm9ybS9tZWxsYW5veC9udnN3LXNuMjIwMS5jICAgICAgIHwgIDEyICstDQo+ID4gIGRyaXZl
cnMvcGxhdGZvcm0veDg2L21seC1wbGF0Zm9ybS5jICAgICAgICAgICB8IDM3NiArKysrKysrKysr
KysrKysrLS0NCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAzODMgaW5zZXJ0aW9ucygrKSwgNDkgZGVs
ZXRpb25zKC0pDQo+ID4NCg0K
