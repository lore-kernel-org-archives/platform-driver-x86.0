Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD95C77B73
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Apr 2023 19:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343976AbjD0T1h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Apr 2023 15:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343910AbjD0T1V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Apr 2023 15:27:21 -0400
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49085599
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Apr 2023 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
        t=1682623569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rUBJ4JyV0eh8xVQ5czcpQ+E1Ssz11+bxU+ut37z13DA=;
        b=L9kmPNYQ6WEWudLTaSSwivhEZukhdj2UgVasJ+qJCoQMglirZ1hIzXY4kT2eap+kA9ec/q
        nsaU0sw2il/NmZZPtPVggDCtjymZ2WO8dwQlNxXMo6PlTPkO9HU0g+B6KErrZIxwgfBpNk
        MobtOXlj3qDm9UtcpG60iXwHzPFjwR4=
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-I8tLU321MVuTwLSp1SB55w-1; Thu, 27 Apr 2023 15:26:07 -0400
X-MC-Unique: I8tLU321MVuTwLSp1SB55w-1
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:160::10)
 by PH0PR84MB3280.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:162::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Thu, 27 Apr
 2023 19:26:04 +0000
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e16:f377:9026:9a13]) by PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e16:f377:9026:9a13%6]) with mapi id 15.20.6340.021; Thu, 27 Apr 2023
 19:26:04 +0000
From:   "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
To:     Maxim Mikityanskiy <maxtram95@gmail.com>
CC:     Richard Hughes <hughsient@gmail.com>,
        Alex Hung <alexhung@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        =?utf-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Enver Balalic <balalic.enver@gmail.com>
Subject: RE: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
Thread-Topic: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
Thread-Index: AQHZOv2ZSacMBEbqbEy4rmnLZ5eFN67FULCAgAAfkeCAAAw0AIAAGjUAgHUkzwCAADtLIIABnCcggANECYCAACPEUA==
Date:   Thu, 27 Apr 2023 19:26:04 +0000
Message-ID: <PH0PR84MB195361F00A2ADD103FECAF57A86A9@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
References: <Y+JbBiMJw+VLo2Nr@mail.gmail.com>
 <CAD2FfiGLH87H6CVbHimXUfz7ESUKwO8k1ABCgKU9L2SnfGanTA@mail.gmail.com>
 <PH0PR84MB1953825BC90B268904C6C7E5A8D89@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <CAD2FfiFUEMupUBoWj2hq9ep=R0Sk-xgBscXqMPefAipvoCg8eg@mail.gmail.com>
 <Y+QXXXX1u33Eyf4E@mail.gmail.com>
 <CAD2FfiEj87WiByKMXrLP7zrj-_gNrNKTh6v6naCxapbVBDcEGw@mail.gmail.com>
 <PH0PR84MB195313DBC8EF15354C260D5DA8679@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <PH0PR84MB1953774AE5A9A238928E1CEAA8649@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <CAKErNvo7x+ONMuAnbmiCfydbOkyx6JEcVKw05sjAXs4U=i13dQ@mail.gmail.com>
In-Reply-To: <CAKErNvo7x+ONMuAnbmiCfydbOkyx6JEcVKw05sjAXs4U=i13dQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 885e6377-7651-453e-88f0-9fcbb04045f9
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR84MB1953:EE_|PH0PR84MB3280:EE_
x-ms-office365-filtering-correlation-id: 945ea05f-4bb1-46e0-8912-08db47553e3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: heQhc4GU3hvRgkRtj3oqgb1LSNn73yQ1PbLQAKlukmmPQtYN72oqkLCeFilptUJaK185fPPLVdzHsimq8ZL6WWkcPLQ9J/dpOZZk2KFf+aUkdVdUlmnSvYiVf/0iVr0txbLm8/ztzQ9aPRaWwQR5y8MQ2o9Sj68JYrZJHWGcRSnzy4IzxwXuwT9CiX2Cq/Xs3lqq58CdcWdAS6ZGVOt9A6/QdBxyDWNqpG5GCeNMHTX3i/uXKFW6ZRKEZFXToZnP5k52wKPkgrg5qxymTiZDFVUHxEd/ypBQYtS4HaJusvTMuMXqduz+Iz1GmHqnwDkMjnqs7l36HSaQ8WnUi/KrVyIu3Y+fQLw55W5kkTc+S+G/pf4Ksh/fRZKy/Z5LqdLTY8Azu7mBrRth+6x5CwUp4qHd3+clFSF4rbGIY1rpdY2+SYEfXO33A33oPPR3+QwW7c0xFHp4kittOHKrEmrIvYuKLc9UcmwVQU/3xYEvIxGA60VyrE9VZ5R6B3C3KsEycaidjUpDvuKOhIXIOp0TnBAE8nWSzXuZkbf7F9nAUYgK/PSZjNUQlHtzPZU6BKmGwzqlrmW0+WQO99H5hai/UDFOk8ctqqUnkDz1pD8kctI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199021)(6506007)(53546011)(9686003)(26005)(186003)(966005)(52536014)(66556008)(66476007)(6916009)(4326008)(64756008)(55016003)(82960400001)(5660300002)(66446008)(41300700001)(76116006)(66946007)(316002)(71200400001)(7696005)(66574015)(83380400001)(66899021)(38070700005)(54906003)(2906002)(8936002)(7416002)(8676002)(86362001)(478600001)(33656002)(122000001)(38100700002);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG9vTEdvSmMyTTR0YTk3aW0rd2NvT2lkRndRRndsa3lYNXdsTTBCUytjRUpU?=
 =?utf-8?B?YTFjS21sRmZPTS9ESTQxSUF3L3VqdFdrdWQ1elZkbm0yMWlodzZ0K3ZiS1BK?=
 =?utf-8?B?ajlnUkZBcFMzbTd1SVhLRUxxNzhPZ0Zib0RuK3lITXlIcUI1Q0liZXBya1E2?=
 =?utf-8?B?Q2U3WVpKbFppYk1mQmZ5UUxwQVFOTFZxdmt4S3RFd3NIamx5RGJhWVpWdVJp?=
 =?utf-8?B?TE5OaFQwbWpVQU1RMnBCM2dHRkZQQzNWMTlmU2NhTFNMa1k5VllhOUJucHpr?=
 =?utf-8?B?L0l3RzdlcGRxOGZCWDB4Z2x6ZjRjb1R2Qi9XQXM3aW1rKzJndlROVVU3SW85?=
 =?utf-8?B?OUxlSlYxalUyWFNnNjVldTRqdVNTQU0zeEMrTHErWnhLdEV5b3Q0MlRncDZL?=
 =?utf-8?B?UjhTQ2RGbzA2L0M2SE9ISXlhVE1kdis5dkJUaTZKTmpIUjBicmhpbXJQd2dx?=
 =?utf-8?B?YXNQb3VxbnlPL0hFeDFSWjVZV2dwbHl3dnBCcXdZWi9adi9HL29IR2locnFQ?=
 =?utf-8?B?OXdjK2Z3MlBEd2lqSTBXdFJ5OTZjOVk3c2NOanZMU1dUL1NMUlM5V2xQSG9L?=
 =?utf-8?B?bEduZUZWa3ZraUdEOXpqSlJEMENrdGg3SlRqdjVISkprVndMOU5GWWczQmpz?=
 =?utf-8?B?cUVrVUtoSlhDNk4zcVZGbDkwNGRpSWxGd1l3K2Vtay83Z2ZyQldVSjQ1L1VQ?=
 =?utf-8?B?UDViekFEaEJxVjEwK3JjRmFTejhmZlY0VVZnRG1OaFZ4L0h5Z05jZ2JPYWNo?=
 =?utf-8?B?WlkyYmhBNzhhK1FRUkRXVkExaklSaTRMcVJaMjlIVXZFNUI3V1RhNHR5eHJV?=
 =?utf-8?B?eEV2OFJHOWlpVzdWZGZ1a3JOSXRrMjRXQlpZVXQrQjFhaktwcmIya0w3eDQw?=
 =?utf-8?B?K1ArVTNWMUZkK296VjNocnpIR1pIOUdxODNnYkVHbWdXUitjZ2NOenRMV1hO?=
 =?utf-8?B?dUVybXhDL3BNRzFJVDFxaHNob3RscHVzZXlBR2NyMXFKZWV4cE9rR0RJdTVl?=
 =?utf-8?B?S0xkRFgzazk5dHZLVVBidW8rQnNJQVpHcWZudkphcGlwWGNiRThCQktsWVU2?=
 =?utf-8?B?VHFQTWhGaFBkcjliVE1ScXNVYlBLblFsbU5xcmRjM1dXRUI1ajRxOGdPK0Qv?=
 =?utf-8?B?UnVmVEJMWS96WTNPc0cvd1lIMXYwRnpBNWlGb01TbzZmTXVSWGhhQTFzRG5H?=
 =?utf-8?B?ZVJMS3BUZXBwVW0vNzNMcys5NXFxdG9aR0VMSVhiYnhiQnZlVlVSdFFnMC8y?=
 =?utf-8?B?aFhEUFlaY1lZcE9DVlVrRCt1MnhsSDlSU1pWSTZ2czhFc0JpNE1WZFVKazRq?=
 =?utf-8?B?NVRIWmFMUWVXQVE5RnJtU3ZrWUNJZ1NvVGtiazZveUlwZTh5SGR1RjhSV25O?=
 =?utf-8?B?NE9Fck1ET3JCeTF6ajEwcGJIdFUrK1hSdzFReEpGZ3RBNUtpdGRWeEg1M3Mv?=
 =?utf-8?B?RklBK3ZENm5hSVUxd09KVVZLZ00wRzZrZ21HU3lmYi8zK2d0L3E3L2o1Ulcz?=
 =?utf-8?B?RG9mNllPVkRTeFFyZWhLRnl3bW1CQVlhOW1FNlFnT0lrRit3RjcxZ3paU0c3?=
 =?utf-8?B?aG1IcEQ5aE9jaUZia0dVWU5JZlVQNzRqV0R1enc5Nkw3RDRQT1Y1VTN3QzI5?=
 =?utf-8?B?em9oSUZGM2VvUlV0UGhETTV3ZTlIdXRkOTFqZ3BRTE50SnZCb3NuaHJKODRv?=
 =?utf-8?B?dlU2R0wwUGU4a3hLeVlTNGVtZkhSY1E1ekRNZE84cGl6c25iTVFxNjZLQlZ2?=
 =?utf-8?B?UWNWS000cUxyK3dRMVQ2NkRHWG9ML2VBRVZoMXJ1VWl0RWpYWkNRTW1YcFU1?=
 =?utf-8?B?NjBGSG5PdHdzOHRFblNMUmhGMTVxdURCYmd0eVVFTXZwZGliZXh4U2NSZmxn?=
 =?utf-8?B?d2k0bkZ4aHdFaFAwTjM2dkpBckh3Y1BZVjJ4SDhFNk9TSFBnYnpPTjJOU0ov?=
 =?utf-8?B?SDJ3c0tqaXlZZFkrT3ljWGpMaE41c1V3ZzFwdnIxM3hYNjIwejdmREx0Y1dQ?=
 =?utf-8?B?UjZaekZoa3l6UUk3SUVqYjBvSU0yaTRWRnNQblo5TkdHNTVCb3I3RjFJdEdp?=
 =?utf-8?B?UHJkZHYzWHFPNE1tSm8rWFE0Y0ZkbG16NVFQc0dkMXpVZjF1b1VrZHE3QVRo?=
 =?utf-8?Q?RcH0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 945ea05f-4bb1-46e0-8912-08db47553e3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 19:26:04.4721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rjtigz3xI8ENpr/xVPszOPWTH6i/BC5WPRfsDyh5aeIeGyYnLv6jGwZocDSG36DQJQmdl4gTKdpQJnWirlKesA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR84MB3280
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgTWF4aW0sDQoNCg0KRnJvbTogTWF4aW0gTWlraXR5YW5za2l5IDxtYXh0cmFtOTVAZ21haWwu
Y29tPiANClNlbnQ6IFRodXJzZGF5LCBBcHJpbCAyNywgMjAyMyAxMTozNyBBTQ0KVG86IExvcGV6
LCBKb3JnZSBBIChTZWN1cml0eSkgPGpvcmdlLmxvcGV6MkBocC5jb20+DQpDYzogUmljaGFyZCBI
dWdoZXMgPGh1Z2hzaWVudEBnbWFpbC5jb20+OyBBbGV4IEh1bmcgPGFsZXhodW5nQGdtYWlsLmNv
bT47IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+OyBNYXJrIEdyb3NzIDxtYXJr
Z3Jvc3NAa2VybmVsLm9yZz47IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBL
YWktSGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+OyBNYXJpbyBMaW1vbmNp
ZWxsbyA8bWFyaW8ubGltb25jaWVsbG9AYW1kLmNvbT47IEJhcm5hYsOhcyBQxZFjemUgPHBvYnJu
QHByb3Rvbm1haWwuY29tPjsgUmlzaGl0IEJhbnNhbCA8cmlzaGl0YmFuc2FsMEBnbWFpbC5jb20+
OyBFbnZlciBCYWxhbGljIDxiYWxhbGljLmVudmVyQGdtYWlsLmNvbT4NClN1YmplY3Q6IFJlOiBG
aXJtd2FyZSB1cGdyYWRlIGJyb2tlIFNXX1RBQkxFVF9NT0RFIG9uIEhQIERyYWdvbmZseSBHMg0K
DQpDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbCANCk9uIFR1ZSwgMjUgQXByIDIwMjMgYXQgMTg6MDUs
IExvcGV6LCBKb3JnZSBBIChTZWN1cml0eSkNCjxtYWlsdG86am9yZ2UubG9wZXoyQGhwLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBIaSBSaWNoYXJkLA0KPiA+DQo+ID4gSSByZWFjaGVkIG91dCB0byBC
SU9TIHRlYW0gYW5kIGhlcmUgaXMgdGhlaXIgcmVzcG9uc2UuIExldCBtZSBrbm93IGlmIGFkZGl0
aW9uYWwgaW5mb3JtYXRpb24gaXMgbmVlZGVkLg0KDQo+ID4gSGkgSm9yZ2UhDQoNCj4gVGhhbmtz
IGEgbG90IGZvciBnZXR0aW5nIGEgcmVzcG9uc2UgZnJvbSB0aGUgQklPUyB0ZWFtLg0KDQpZb3Ug
YXJlIHdlbGNvbWUuICBTb3JyeSBpdCB0b29rIHNvIGxvbmcgdG8gZ2V0IGEgcmVzcG9uc2UuDQoN
Cj4gPiA+PiBIUCBFbGl0ZSBEcmFnb25mbHkgTWF4L0RyYWdvbmZseSBHMiBOb3RlYm9vayBQQyBU
OTAgU3lzdGVtIFVwZGF0ZSBpcyBpbiAnRW1iYXJnbyBTdGF0ZScsIHNvIGl0IGlzIG5vdCBvZmZp
Y2lhbGx5IHJlbGVhc2VkLg0KPiA+ID4+IEN1c3RvbWVyIHNob3VsZCB3YWl0IHVudGlsIHRoZSB2
ZXJzaW9uIGJlbG93IGlzIGZpbmFsaXplZCBhbmQgbW92ZWQgdG8gU3RhYmxlIHN0YXRlLg0KDQo+
IFRoaXMgY2xlYXJseSBkb2Vzbid0IG1hdGNoIHdoYXQgSSBzZWUgb24gTFZGUzoNCg0KPiBodHRw
czovL2Z3dXBkLm9yZy9sdmZzL2RldmljZXMvY29tLmhwLmxhcHRvcC5zeXN0ZW0uVDkwLmZpcm13
YXJlDQoNCj4gMDEuMTEuMDAgYW5kIDAxLjEyLjAwIGFyZSBib3RoIG1hcmtlZCBhcyBzdGFibGUg
aGVyZSwgYW5kIGZ3dXBkDQo+IHN1Z2dlc3RzIHRoZXNlIHZlcnNpb25zIGZvciBhbiB1cGdyYWRl
LiBXaGF0IGRvIHRoZXkgbWVhbiB3aGVuIHRoZXkNCj4gc2F5IGl0J3Mgbm90IG9mZmljaWFsbHkg
cmVsZWFzZWQgYW5kIG5vdCBpbiB0aGUgc3RhYmxlIHN0YXRlPw0KDQpUaGUgZmlybXdhcmUgd2hp
Y2ggc3RhdGUgaXMgc3RhYmxlIGlzIHVuZGVyIGEgZ2VuZXJpYyBuYW1lICdIUCBDb21tZXJjaWFs
IExhcHRvcCBUOTAgRmFtaWx5IFN5c3RlbSBVcGRhdGUnLiAgIFRoaXMgQklPUyBpcyBub3Qgc3Bl
Y2lmaWMgdG8geW91ciBzeXN0ZW0uICAgVGhpcyBpcyB0aGUgcmVhc29uIHdoeSB0aGUgbmFtZSBj
b252ZW50aW9uIGlzIGNoYW5naW5nIGFuZCBlbGltaW5hdGUgY29uZnVzaW9uLg0KDQpUaGUgQklP
UyBzcGVjaWZpYyB0byB5b3VyIG5vdGVib29rIGlzIGZvdW5kIHVuZGVyICcgSFAgRWxpdGUgRHJh
Z29uZmx5IE1heC9EcmFnb25mbHkgRzIgTm90ZWJvb2sgUEMgVDkwIFN5c3RlbSBVcGRhdGUnIHdo
aWNoIHN0YXR1cyBpcyAnZW1iYXJnby1ocC13cycuICBCSU9TIGluICdlbWJhcmdvJyBzdGF0ZSBh
cmUgbm90IGRlY2xhcmVkIGFzIHN0YWJsZSBvciByZWxlYXNlZC4gICBUaGUgTFZGUyBkb2N1bWVu
dGF0aW9uIGRlc2NyaWJlcyB0aGUgZmlybXdhcmUgc3RhdGUgZmxvdyBhcyBQcml2YXRlIC0+IEVt
YmFyZ28gLT4gVGVzdGluZyAtPiBTdGFibGUNCg0KDQo+ID4gPj4gSFAgRWxpdGUgRHJhZ29uZmx5
IE1heC9EcmFnb25mbHkgRzIgTm90ZWJvb2sgUEMgVDkwIFN5c3RlbSBVcGRhdGUNCj4gPg0KPiA+
ID4+IEJUVywgdGhlIG5hbWUgb24gTFZGUyB3aWxsIGJlIGNoYW5nZWQgcGVyIGN1c3RvbWVyIHJl
cXVlc3QgaW4gQ1EyIHJlZnJlc2guIEN1c3RvbWVycyB3YW50IHRvIGhhdmUgcHJvZHVjdCBuYW1l
cyBpbmNsdWRlZCBpbiB0aGUgbmFtZS4gVGhlIGxhc3QgY29sdW1ucyBpbiB0YWJsZXMgYXJlIHRo
ZSBuYW1lIHRvIGJlIGRpc3BsYXllZCBvbiBMVkZTIGZyb20gQ1EyIHJlZnJlc2guIFNlZSBhdHRh
Y2hlZCBKUEVHIGZvciB1cGNvbWluZyBMVkZTIG5hbWUgY2hhbmdlcyBpbiBDUTIgcmVmcmVzaC4N
Cg0KPiBUaGF0J3MgYSBncmVhdCBjaGFuZ2UsIGhhdmluZyB0aGUgbGFwdG9wIG5hbWUgZXhwbGlj
aXRseSB3aWxsIGJlIG11Y2ggY2xlYXJlci4NCg0K

