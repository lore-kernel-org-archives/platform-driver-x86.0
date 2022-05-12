Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47382C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 May 2022 13:37:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354475AbiELNhr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 May 2022 09:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354477AbiELNhm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 May 2022 09:37:42 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CAB52B08
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 May 2022 06:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTcgqE4EARL+7DjtjHOaVZ1ifwC0/MS+/Q71mfaHBi6V6TYy3QPJ+4AWGLaVJ82jmqJj28ozjYhtuHpvtMOBroOT01TIteH8E4nDQl/hNyQHfBzfz0ldkX42F1xRFEZa/jD37qUNOr0UTS5EB+IqzkX6uX6MA9VlioRvrsSb1VDp41wxQzN84NlmNw7zCnrR733wokfEBbR+Ypifqa31M8HEG8g6BpstsaE7NtQrPp9D7/W48/vlW2HC80DQ6q/H29soQUXgbs73FnkOoMpFmNlHxN4/hQVmekE1EUKnoBPYBNBMmuAIAIFCuBbk9UxyZKhaum8zG1c4m5Ki/HgYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JFdSG3JsZ/WSerufV0k8GtwfC+rtgUysgx9Dk5ekEs=;
 b=QjyF2/HnkNTIskh4gbPBItEVc1LDTN9JyTGkJf4n7N1Uk8GSMnqSo5wEFR2gc2RMMsa3bwtlttURBAU1cdX1+GE0XTQPumUuSVaqSEO0k0R6RDcJ976tF7pcKgfG4b+AAZ4CngPnEyHFQsbgwybIqu9p051fZmMVU8deHM4J85fSuPyzMCo6QgeNi7AaDNzxleY29XTDeg7D7lSO9mlt51jxTYc1l/DCHmvPfav3NRaPIAJBpisf9A5198dDcCeugTm4nThW2r+EW8RUGEArLhNcD3CKMWxRJBV73nB5DeDohxliNIAAqZdTZ+nnx8DysMv33BSUHFiR15MS861P4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JFdSG3JsZ/WSerufV0k8GtwfC+rtgUysgx9Dk5ekEs=;
 b=Iqz10/sQ94cJHUibfNX4yl2MsoYHsJNcUTqos1BkiYGtmlaBFu4zkZpbvOTeqnna1S1ul5DfwZTbwcrXOBg/RzrOGg6qG2CynmwzVSISchvUwhrXkqmlvF6AkoQsqErrfJRQ2IMQW0CUoCRsFJYkf+DSZYsbWC6OOFpBAStx+LpeNgBvAAv/he7ONleBdVfnEhH82TTtmUXtWUdX9ags0XhsANvZbiDPUTMab70SkJKy53bcYkyOG9MoVH5Um1tbgNdR6EbJE33LKjXEjw2c61kFjsqOxJeVcfdZDz8DkHrHGj53YEl45NxKUpWaQIn5RNphxLUBj0+4vbNP6FrJUg==
Received: from DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11)
 by CH0PR12MB5170.namprd12.prod.outlook.com (2603:10b6:610:b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 13:37:39 +0000
Received: from DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::e1aa:8450:2ebf:a431]) by DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::e1aa:8450:2ebf:a431%5]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 13:37:39 +0000
From:   Michael Shych <michaelsh@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: RE: [PATCH 1/1] platform/mellanox: Remove unused variable.
Thread-Topic: [PATCH 1/1] platform/mellanox: Remove unused variable.
Thread-Index: AQHYZXBt9LIVMbkgSEmUITonIkefZK0bP2UAgAAAaLA=
Date:   Thu, 12 May 2022 13:37:39 +0000
Message-ID: <DM6PR12MB4074E827C36F18FA947A4AFAD4CB9@DM6PR12MB4074.namprd12.prod.outlook.com>
References: <20220511195043.54853-1-michaelsh@nvidia.com>
 <97a97e6a-9ecc-b22b-941c-7c537badaea9@redhat.com>
In-Reply-To: <97a97e6a-9ecc-b22b-941c-7c537badaea9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c28c295b-872e-42e2-d15e-08da341c954d
x-ms-traffictypediagnostic: CH0PR12MB5170:EE_
x-microsoft-antispam-prvs: <CH0PR12MB517062112806A1833CAA2913D4CB9@CH0PR12MB5170.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u7dzReC1GUuq7IfCrbg1GEGNbMw34i4lm+uPT4TGHAIHZoTTjxl637PlDSFv/jmDEFzoRRNLLgMYKPDqV/XVpyf+UfYDTbzd5t0Tk15/HNOsxEmZ4C4O5LQwLaeToNvIH3sA9w+ZgQ6BkTxvbALxjKefIoo1F3q8AX28nELK6F2BNmCkmUzlfkshDN9B3DYmfYX/u0FD41lz9mBUFcuVen8J7U1ElY0r7bAEE6ryZn7qUfAA547qwDaSzCW9bf078FsVNKpVyLHZNiNVR3AgKsjx5ayL3sS7ndWGn6EunCW9tAg8SmLBHAhfIHiyfiEZrcCTuj3UQPUnxWA4+PmvcQfVBSemZ/8L4pQfSS7AGKKs2+QGExsMs3zY79WgKBT+VGGu+YT/XBu8tf1b3k3c2lUmy2LIZ3qyrTnYBFMcclZhxxbFBFGmac0GEtuqoITSmAlEyKvxHZRboEbS0OiNrL16MIh4xDNsGbjY61DlTZ4s/gAASVnT3tryRpZ3CDh7gA8kOXNRvIQMcnT1xwAlImNw6WaZ/KDVZc22jvDUS1pKbaGBEPfiKAUxT+tvCQ2dRF30XcD3iyYgTBMuVGBo0UpTPm43lh4o9DJwwvZaPTTY05N1uhn88rf9VYL0HT+wydUIHAPNpARrHRD4hlwIghEHbd78cf6+d8wkZTQ/d5mYW2bVj77O3Y3fFanI5TmyxvceSiHRk1schXKwILmukA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4074.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(8676002)(66476007)(6506007)(186003)(66946007)(66446008)(66556008)(64756008)(76116006)(86362001)(26005)(107886003)(7696005)(2906002)(53546011)(55016003)(9686003)(71200400001)(52536014)(5660300002)(8936002)(33656002)(316002)(122000001)(83380400001)(38100700002)(6916009)(38070700005)(54906003)(508600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFUxczJPT25qc3BHMThVdmdBSHVzZVQzcUFNLy95WVRaaUd5bjV0R1lFemlW?=
 =?utf-8?B?Skgvb2s1bUNzazM1SmZCMUFCOGx3K1lQVjk4NHJZZ29TMVN0OEpYVHVjWnpl?=
 =?utf-8?B?eWwxTm1RMSsybHdHSkRDT2RzTTRESWlQUGRhb3kxS3lVbWZ5ZHJkdnIzODNB?=
 =?utf-8?B?YlMrblh3bDRmc3FGS2tTMWxJemxwQ2lzU002SHQzWDgyRk41eHNJRFNzeGM2?=
 =?utf-8?B?bjZ6UTlZN1FjZ2NOYmw4RzlmeTNNZGc5QzNlVnRmZ0lQM0c1QWRsbHMyUE9X?=
 =?utf-8?B?SkdWQ2xlMWxHREE4RVVNS0RrZ0dqZ1JSNi9mbFNFQ1BMNGY4S1ZRdk8yNFd4?=
 =?utf-8?B?YVJHQXU1R004eFU2Y0FVa2ZQbDZISTZGZGx3R2MydzQ0eDJUWE9PaHdFS0tB?=
 =?utf-8?B?UDZyOFV5ZlVjM2Q2LzFKTnJoMjBnREZkK2ExYUQwVU5hVExqQWQzMEhOc0Fm?=
 =?utf-8?B?d2Rydm8rQWp3ckhNT2loMW1KMmdhbm1YcFhLWGpXTmU4dzhLR2MyUlA2V0lT?=
 =?utf-8?B?a1MweGxKUTNzYTRtWjhWZTVQT0J4WXpGcFR4T1hTTHdpZ1AwTWxDRnQ3RGNH?=
 =?utf-8?B?YlEwcXZuSzYvdGZQMDVkSlQ0Ukk1WmVIai9UTUM3UUp4Y2w1WDVmTkFMeG8w?=
 =?utf-8?B?NTN6VFhJZXpON3ErNlpjTEVqRWUvOTRWMlAzbkNwcUc5T1JCOFVSSDhXcFBs?=
 =?utf-8?B?SDFJZ3JjOVRlcEx3KzB5eEY5TjVmRGJoUllMWkJOSDZaK2hqSnhjS2xwd1N4?=
 =?utf-8?B?M0lPczhiTUJkSXMvdTJSUFhuKy9LZHF6bXFIb0lxWVJCU0I5d3NONStJcnBw?=
 =?utf-8?B?aFVQMWtqekNCOU5YZ0gvYUVEZ2I4TUFGQmtOY3RGb01Fajg0UDlxaEpFUjJ6?=
 =?utf-8?B?TW1kbmdNMnRvcUpOS2VDYTdZUXd4MkZVZStKZko2UzJ1UHFoYk1ldUhDaGVE?=
 =?utf-8?B?cUVLMXVHSWRrVXBydklJbGFrMUpvczFCbFJ2RUtRVlV3ZG1FanFndEZFZ3JE?=
 =?utf-8?B?dWM2TDdEUzk3aHZxSDlWeDF0WE9mWmlRc1ZXR3BlOVRaSDhOUndJOW5vZEd1?=
 =?utf-8?B?VEZhUjJZT3ZDS0NoTHJDcGx6MllES20yaVRpcVdCb3VEY0hCMjlrZDBkdVJS?=
 =?utf-8?B?djEzWXV5cE1ESTdFbVJ3a2E5SFc2eU9iUFdRUGg2L3B0SW5adlZMYUlxYTFa?=
 =?utf-8?B?WVd6a2xIcnMvQ3hhcGR0d0ZkTmFoL0xIZHVRVHF3R0VwNk9CN3QrRUQxNGti?=
 =?utf-8?B?MXRza0dWcWJYT0d6QnplLzRSRkFoc1hzbTgyWWdlOWFjc2wyd05pOWsxeEVN?=
 =?utf-8?B?d3ZCQ1BDblp0SVZmWmZlWGRuUmRmOVltT0dIaEY1dEtzTWdpTHczZGpLbS9E?=
 =?utf-8?B?cGJkbEo2dDNnNzhGVGxGT1c3VUJMMzYyQnBIUXhsOFk1YmlvQ1lQNWhsZGdY?=
 =?utf-8?B?WWpVeEkvUlhycHVVdGsvZzUrWS9na2tERWUxYUhqV0t0blh6ZnNiS1pLa3pk?=
 =?utf-8?B?eGlyLzlYdEd3dW5ueVhLc1RZd0VPUlZBZUdUZDFlVHdHQU45ZUhVRzZIMmU2?=
 =?utf-8?B?Rk1ZMm94MFNwM0lRV2JuMzJzb2R2YXlBR3RvbVBGUnpxWnE3b3E3T2I4UDdY?=
 =?utf-8?B?STdyUFIwVkwxaDY0V1duZG9xZkNPU05wcHJqaHg4eHRrdnBIUUNlbWtUK29q?=
 =?utf-8?B?cDF4dE50TzJLVjZYVU92Y3NDaGV0eUg2UEh2ZFA3OG9lci8yTlJXMThOQ1VF?=
 =?utf-8?B?LytBN2xpQ3F1NmJIbnFhWFFtb2ZabG9hVHFpMmFNL3BQQlhTOWJSdmhQbzVk?=
 =?utf-8?B?RTRBWnhmeGVDSFUrRVFSQy81MkxoRGQyT2lzdE0vaGYybFpTSFF3cGtIdk9T?=
 =?utf-8?B?eVlVRFpxQXIyOG9GUzZzbDdFMVBpS0VUZGpGVUplQ3FybE1PTURwa2M0WU9H?=
 =?utf-8?B?ckNncVdqcmZzSk9oZFBwSlV6bVdaZS9TbW5YZytSNjdKU3FnZlZQWHVpT3ZO?=
 =?utf-8?B?dEdvUFZwSVdGZFhSQ1d1MkRlcmhRdjhjMXl1bWRIMmMzY1pqbGFuVzZyVy9m?=
 =?utf-8?B?TVU0MDlmL3U3R3ZxNnczN2ZKaW1lSUMvYStzcnlZd080UzdINE4xN2tWRlAy?=
 =?utf-8?B?SVh5L0g5NXlHVWlMeEdKSDk1aVF5U2d6THVFVTVtbGJGNEJzcXJ5aTRWaWJ0?=
 =?utf-8?B?b09LZ1VyZnN4Y01WVEdwY3pvbnk4OWdFejNYRUZneVRJRklKSURpcjF4MGdy?=
 =?utf-8?B?Y0xwTTZXeTF0ekJLczFzMWR6MDBJeXJNMTJDZGZqdXA3Y2J2ekhJZHVSempP?=
 =?utf-8?B?WGNLcjhWMkp3cnVkamNxRlFmaU4vR0k1YWozWTBQYlUzTWdzZ3ZhQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4074.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28c295b-872e-42e2-d15e-08da341c954d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 13:37:39.4511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6+AKFT+PeXOKX1udZd7QhNZo1qHXlhSyh21pYOw2BcvUDkBrSg4nBobRIC22oPT8hmIX0/5Dba+YJS1Gtj0dVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5170
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2VkZSA8
aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE1heSAxMiwgMjAyMiA0OjM1
IFBNDQo+IFRvOiBNaWNoYWVsIFNoeWNoIDxtaWNoYWVsc2hAbnZpZGlhLmNvbT4NCj4gQ2M6IHBs
YXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBWYWRpbSBQYXN0ZXJuYWsNCj4gPHZh
ZGltcEBudmlkaWEuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMV0gcGxhdGZvcm0vbWVs
bGFub3g6IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUuDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDUvMTEv
MjIgMjE6NTAsIG1pY2hhZWxzaEBudmlkaWEuY29tIHdyb3RlOg0KPiA+IEZyb206IE1pY2hhZWwg
U2h5Y2ggPG1pY2hhZWxzaEBudmlkaWEuY29tPg0KPiA+DQo+ID4gRml4IHByb2JsZW0gb2Ygc2V0
IGJ1dCB1bnVzZWQgdmFyaWFibGUuDQo+ID4NCj4gPiBGaXhlczogOWUyNjdmMDUwNDQ0ZiAoInBs
YXRmb3JtL21lbGxhbm94OiBBZGQgc3VwcG9ydCBmb3IgbmV3IFNOMjIwMQ0KPiA+IHN5c3RlbSIp
DQo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgU2h5Y2ggPG1pY2hhZWxzaEBudmlkaWEuY29tPg0KPiAN
Cj4gVGhhbmtzLCBub3RlIHNpbmNlIEkgbmVlZGVkIHRvIHJlYmFzZSBteSByZXZpZXctaGFucyBi
cmFuY2ggZm9yIGFub3RoZXINCj4gaXNzdWUgYW55d2F5cyBJJ3ZlIHNxdWFzaGVkIHRoaXMgaW50
byB0aGUgb3JpZ2luYWw6DQo+IA0KPiAicGxhdGZvcm0vbWVsbGFub3g6IEFkZCBzdXBwb3J0IGZv
ciBuZXcgU04yMjAxIHN5c3RlbSINCj4gDQo+IGNvbW1pdCB3aGljaCBpbnRyb2R1Y2VkIHRoaXMg
cHJvYmxlbS4NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQoNCkFjay4NCg0KVGhhbmtzLA0K
TWljaGFlbC4NCj4gDQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94
L252c3ctc24yMjAxLmMgfCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRm
b3JtL21lbGxhbm94L252c3ctc24yMjAxLmMNCj4gPiBiL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFu
b3gvbnZzdy1zbjIyMDEuYw0KPiA+IGluZGV4IDYxNjVlMDE1NDQyNC4uMGJjZGM3Yzc1MDA3IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbnZzdy1zbjIyMDEuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbnZzdy1zbjIyMDEuYw0KPiA+IEBA
IC05MzksNyArOTM5LDcgQEAgc3RhdGljIGludCBudnN3X3NuMjIwMV9jb25maWdfcG9zdF9pbml0
KHN0cnVjdA0KPiBudnN3X3NuMjIwMSAqbnZzd19zbjIyMDEpDQo+ID4gIAlzdHJ1Y3QgbWx4cmVn
X2hvdHBsdWdfZGV2aWNlICpzbjIyMDFfZGV2Ow0KPiA+ICAJc3RydWN0IGkyY19hZGFwdGVyICph
ZGFwOw0KPiA+ICAJc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+IC0JaW50IGksIGosIGVycjsNCj4g
PiArCWludCBpLCBlcnI7DQo+ID4NCj4gPiAgCWRldiA9IG52c3dfc24yMjAxLT5kZXY7DQo+ID4g
IAlhZGFwID0gaTJjX2dldF9hZGFwdGVyKG52c3dfc24yMjAxLT5tYWluX211eF9kZWZlcnJlZF9u
cik7DQo+ID4gQEAgLTk1Miw3ICs5NTIsNyBAQCBzdGF0aWMgaW50IG52c3dfc24yMjAxX2NvbmZp
Z19wb3N0X2luaXQoc3RydWN0DQo+ID4gbnZzd19zbjIyMDEgKm52c3dfc24yMjAxKQ0KPiA+DQo+
ID4gIAkvKiBVcGRhdGUgYm9hcmQgaW5mby4gKi8NCj4gPiAgCXNuMjIwMV9kZXYgPSBudnN3X3Nu
MjIwMS0+c24yMjAxX2RldnM7DQo+ID4gLQlmb3IgKGkgPSAwLCBqID0gMDsgaSA8IG52c3dfc24y
MjAxLT5zbjIyMDFfZGV2c19udW07IGkrKywNCj4gc24yMjAxX2RldisrKSB7DQo+ID4gKwlmb3Ig
KGkgPSAwOyBpIDwgbnZzd19zbjIyMDEtPnNuMjIwMV9kZXZzX251bTsgaSsrLCBzbjIyMDFfZGV2
KyspIHsNCj4gPiAgCQlzbjIyMDFfZGV2LT5hZGFwdGVyID0gaTJjX2dldF9hZGFwdGVyKHNuMjIw
MV9kZXYtPm5yKTsNCj4gPiAgCQlpZiAoIXNuMjIwMV9kZXYtPmFkYXB0ZXIpDQo+ID4gIAkJCXJl
dHVybiAtRU5PREVWOw0KDQo=
