Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07ED6EE4996
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 16:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjHUQ3H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 12:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236605AbjHUQ3G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 12:29:06 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B44D3
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 09:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYFWQWxCwnoI0BdPzvIr1WM4ns7u3DnUbJLJAtmJgm0KIxIYSu9E8ve3B/cT1Mi7HLxnxfXuw74HrYheCMA2jY0n+BXj6pDWN50e/HoaEOWfCvVN/J6QuVSQZMKGNz6cdtDsqz1LFZEG2LX8/TKNPnMMHIMH2Iu4ZjKWUZPgpLt71VUtj1X8T6HSlyOs3mmCDXTsMbJKgZ/4w7r0fn2MmL+EFo8Zp//Vszmgm7pllFgYWw769UDvRtFDhPGaaTTL2rnkgjroxexcU1tfZMLrLEoQwEKcnZSVa7A+zKoOggSfnOkJnhHXn1dAFinarE+xU0jVv8piPN2dsOETlOI1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLw/j4RtW0IaKeHD8WSvY6hzADgNNbBArrsS2gIg6UI=;
 b=N9FR3EFbyLahcCyDh2CBRiquqYTy0xwmab4/+tMbUAfRQ4Gd+wtUViyM10b/PS9COpXiJxbSGi+YA08q6XZZFbTgqAtEDXIRU4HJGzeFr0iz6k+czrlc4Mv42NWsTX7AJoKF9RNoIP4tXphXDROT9j65iOC6B5Eutpass/A5Od815G9HX362yvmf8/d2hMHTUXgCljk24o0IUTLzzsQrzYiDyAbaxtDDkBRTu9K4/UNWYcA+FqvW8cR9JoUOT3chzgnKGYAVuwh6YVK/7QYec5yF7yZoqvxZ8mj0dqqB/0bYRt7VxKCYm9AldCWsL/3xPAUigFXHviPaHbKp+iKILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLw/j4RtW0IaKeHD8WSvY6hzADgNNbBArrsS2gIg6UI=;
 b=V8f3/O5rnyeOAc2Mb1cg7R0HR6CKQ5FwreA0uKqY7sQK/DeOvi0NAvT+fE21eQ8x9HVpbhSmaSb8hmfM2/6wnOI36/E7RXw0uh7sFXbvqIIlDRJe5G9+PMkBIn/pBWrHbgD6uTyuJNWv68M01mQ2KnjuABnmFK3Y9ZAuwJL21M9WHtczMRTBoV2rbRWdHcAOazvKAOJpGXkzo2/s91FElBq0pB6WC1CtjcqZQhrROaMJhSSut5sk90y4lDiH43fAWuur63+54BQsgHlGDmaUyp3E+DG3sZVBT0w1DtSqVdWwsNXro7rdXqc1YTGC3Kh/blxSqhWWNkZarw0JLU0Qfw==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by BL1PR12MB5030.namprd12.prod.outlook.com (2603:10b6:208:313::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 16:29:02 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 16:29:02 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>
CC:     "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH platform-next v2 00/16] Add new features and amendments
 for Nvidia systems
Thread-Topic: [PATCH platform-next v2 00/16] Add new features and amendments
 for Nvidia systems
Thread-Index: AQHZzu7BZ4Lf1qukW0+SX5tJvSVk/q/0xl+AgAAvnPA=
Date:   Mon, 21 Aug 2023 16:29:02 +0000
Message-ID: <BN9PR12MB53815DE71C2FC4C0CCF13948AF1EA@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <20230814203406.12399-1-vadimp@nvidia.com>
 <6cb1e07a-5896-fd49-cbfb-99499969092b@redhat.com>
In-Reply-To: <6cb1e07a-5896-fd49-cbfb-99499969092b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5381:EE_|BL1PR12MB5030:EE_
x-ms-office365-filtering-correlation-id: 246cb6a0-8eed-4bc3-b3c1-08dba263bae0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JBpvDO++bNLy1GJuc+6W3q1Uqb+szkVO7ODMWYpWZtVzhgHRmpazUIQbBExO9yK38UhaUc9HJmW7z3RucgSlh2nsvz9U2glAu9Dq3BQHvypk1om/tIbn0tyfrEnuk6jzZDZ1u2L2yRQuRWihDbZCqA6/ApXYzeXpoqLjCkCRfknEfJ1IZtNve3i6CC8rAG+XudJV+j9Nqkj0KERb/maLsT3diPhoUEzOh6saePite+e9QLhI8+MsX5DP6D+94/p1kJgSIoZzNB/AKS0BOr1nDhr8YXHLmiT3HcGPFftyV5LPxMMEBjEgk46tr7xVWHiTUiEFknC04Uh93wfCoLf0uFpQjOPw+t3GT0rlDi5145dIXdi34t5t9lPX69xYEO0c29P3dMuPhrx5bQhH5l5BZA/uYFQ1FX1yLBsL6t9FhwBzR9ZmuolqoDrjD8Tq8BvAmZCF6Mf1rRzECfXeepJKdDsT/5WF9NMGUAspz54VWnBJ7iPHnRVfRpxj65N4ZKK0mOIX/+jTmbROHNiQTzgRzHrZ8YtgUjc0dEkP4oU57df2eYISelGAFJfUCyuJv/F4RpU36gfSFo7zKSNrKBWQPBEX7yLG47mVR351T5oAyQRCZaeV05eISaUBgmLoIMuCaiL7mehY1tdzw5PXpjRXLzlgQ/2e62fv8piFoPQx6R8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199024)(1800799009)(186009)(2906002)(84970400001)(53546011)(38100700002)(38070700005)(6506007)(83380400001)(5660300002)(52536014)(33656002)(7696005)(86362001)(8676002)(8936002)(4326008)(316002)(9686003)(66946007)(64756008)(6916009)(66446008)(54906003)(76116006)(66556008)(66476007)(966005)(478600001)(122000001)(55016003)(71200400001)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1FpSlVONSt0SFJnSjMwUjh6bTEvYWZhQkhld3U4MTU2TWFLWTE0Nk1jQUpz?=
 =?utf-8?B?T0tMMnpxbW9NRDhESDJscXphSlM3cnZDajNqY0txNktqU1FCdlN3VDRTZnZy?=
 =?utf-8?B?cXdxVUtoN3NJZzkwNERRdDJXbHhQWk1hYlJvd1JuWFFXa0tBb0NzRFErS1dt?=
 =?utf-8?B?MEh2UUllTWNSbERubXZYaXYvRXA3TW04akMyTFRkU3JkVjl6QVVxVkZxcGFV?=
 =?utf-8?B?a21RUWlhOTQxcUl1b2hETGRodWRoblA4dWtNUDlON1RQbXNQRXZnanliTEVJ?=
 =?utf-8?B?M2xkYnNGV0ZyR3JGbktUV09SeGFTREpZN3FTRkdOOEVkZzBuMUV6WUVvZ2o5?=
 =?utf-8?B?MG1mOG5yRWlIaHlJaVdOQTZnVmZnTVJDVjNiR0RyakdnMDhsbzh4NHYrNjlE?=
 =?utf-8?B?QWllRzM4NG0wM2hQTXRINGR6TTZsbzdRNE9nQ1hBUm5sT0dhZnRCNEVybXph?=
 =?utf-8?B?TDh4MnNETHBCSEFUakxITlMwRUxtN2llMnVWb1Z6OFhvVXVuOUNoVkZMTHVZ?=
 =?utf-8?B?bVFDOEtYYkZYSjhRTDNxVllrbDlTVWRqSmFBaWhDTjRPQm1wT2M4Zmx5TUhw?=
 =?utf-8?B?NzlTc1p4Wm5RNVlIMXgvNzdyRVduKzZrZEk2N1JQQ2xLMllTMEI1c21Xa1VN?=
 =?utf-8?B?WWxpby9OVDJvSWV3Q1lKQUlrODFUSGp1YzI2L24veDU4YlR6b2FPMUFFYlVI?=
 =?utf-8?B?RzVPb2ZFeEhWTHdaa2Q3VXArVjFSVXhuS3I3cVdaN1o4WDFUNm1aeUF4MGdU?=
 =?utf-8?B?aGZxRVVHNzVsQnpCYUcyY2xJT2J3aDFWNUYxelhrbjc3L0dvK0Z6RnFxUlF1?=
 =?utf-8?B?MEpmM2hFNFNqT0hqK0lpM2N3TW9uRllSaFluampsOVpSSEErUEpXRFlseWZH?=
 =?utf-8?B?Q3E0eVBDY1hzcEl0MklGYkU5RnhkVUZIZ3pKL2FQbHE2M1hrRURrdEo2LzQy?=
 =?utf-8?B?L21kNkNkZURPakZZSUJxS3hWTmtsNk1HSm5CZExQNi8rbngxeitsSCtteDB2?=
 =?utf-8?B?REhvL2o3ZlZTT1JqaGFLTWZac2NEbEZqaGxCcGU5UVVSNGdNZWdDeGFISnFS?=
 =?utf-8?B?bWh3QTU0bmhGVitWOUt3cktna1hNV0d3bDY5TDBqVzNVZVU1ODFNNlEvRHNs?=
 =?utf-8?B?V0xxVzJXWW1yV09MY0t5dHNFN2hJem96QkZaNkoxd3A1U0pZVVd2cXNkYytE?=
 =?utf-8?B?VVM0MnRqSUZHYUIrUytQNU5YRnR4Snh2RnZsaWMzVjBORDhpenFKZG9xS3hL?=
 =?utf-8?B?SXM0aWdGR1lNSnFRWlpvSDZTa3dtU1BkZi83K1IzNTd1ZFZRZ2xsR3RoZW5D?=
 =?utf-8?B?dW9Ya096Y3VzNWljSzJ0aG5mbkkzVitxRi9wWTdHSmVSS2JLY01LOFJOMGR1?=
 =?utf-8?B?N3R1N2djeEt3cFR6Tkg1NFg4NE95ZEp2czA2c0lMTUh4VWNqaGN5dzBoTUUv?=
 =?utf-8?B?ZGsxWWRDRkZiZVc5YlJPZGIrMzBMbEYwMlZaSmZtS1k0Umc4eDRFYWRJWHJz?=
 =?utf-8?B?Z3BwZDBCSW9rbG4wMkQrMkNqV2djcXpVOTNJMm1oRHJ5MElaa2JrTHZ4ZmVy?=
 =?utf-8?B?Zlo2RUkzSWVkNWtPVWtqZTBITjJ2UVpuSmlzN1R3WnRsK0h1VWJWcE4xVEZr?=
 =?utf-8?B?WElQQUhyWGhSK2RobFUxMXRyR1YyaE1RR2lnZU5VZEFKbG5tbHV0enB4RE5h?=
 =?utf-8?B?SGoyWDJyVUdiSVhkcWNlK0RxQWtvNXhmSWNHZlBINGFrVW0yL04wcTVHVWZz?=
 =?utf-8?B?WFlXcXVKNVhFT3lOZlVYZVFKc1dHeWQ0TmRsbUlxa01MeVA1NDROZ1J2czRI?=
 =?utf-8?B?WktZL3FZR2xNbTlzZGx3b3lncXpKQU5kSEFDZ0VaQ055SmhnTHJsQmc1N3FW?=
 =?utf-8?B?eGd1MlhYRnBFRmhGdkNFcXIwdi9oaDhrVGFCV3NOK0k4Q3lobU1tcHZUdFFP?=
 =?utf-8?B?UVoza0FXK000M3JBR1JTZUdIaXJpaCtPdjByOGhRQ0ZMaXFRcWRoUWEyZkly?=
 =?utf-8?B?Y0Z0Y1ZEbXZJc1F5Qkk1R3dvd2kzNVAreERwRjY4NHA5YS81WGdXT3owTmV5?=
 =?utf-8?B?V0w4cFJyUFJHK2szS1FuN3Z0aTczZ3hwdkJ6Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 246cb6a0-8eed-4bc3-b3c1-08dba263bae0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2023 16:29:02.3314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jdxo3H7AV44FtLQViaJj757DsQMh/fT2+SzmmEagMpypnZZQpyk+mCUwWsJih0N1W0eiy2K3ydAQRC+uccYTfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5030
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgcmV2aWV3Lg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhh
dC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgMjEgQXVndXN0IDIwMjMgMTY6MjANCj4gVG86IFZhZGlt
IFBhc3Rlcm5hayA8dmFkaW1wQG52aWRpYS5jb20+DQo+IENjOiBpbHBvLmphcnZpbmVuQGxpbnV4
LmludGVsLmNvbTsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCBwbGF0Zm9ybS1uZXh0IHYyIDAwLzE2XSBBZGQgbmV3IGZlYXR1cmVzIGFu
ZA0KPiBhbWVuZG1lbnRzIGZvciBOdmlkaWEgc3lzdGVtcw0KPiANCj4gSGksDQo+IA0KPiBPbiA4
LzE0LzIzIDIyOjMzLCBWYWRpbSBQYXN0ZXJuYWsgd3JvdGU6DQo+ID4gVGhlIHBhdGNoIHNldDoN
Cj4gPiAtIFByb3ZpZGVzIE5ldyBzeXN0ZW0gYXR0cmlidXRlcyBmb3IgbW9uaXRvcmluZy4NCj4g
PiAtIEFkZHMgc3lzdGVtIHJlYm9vdCBjYWxsYmFjayB0byBwZXJmb3JtIHN5c3RlbSBzcGVjaWZp
YyBvcGVyYXRpb25zLg0KPiA+IC0gQWRkcyBzdXBwb3J0IGZvciBBQ1BJIGJhc2VkIGluaXRpYWxp
emF0aW9uIGZsb3cuDQo+ID4gLSBBZGRzIHN1cHBvcnQgZm9yIEZQR0EgZGV2aWNlIGNvbm5lY3Rl
ZCB0aHJvdWdoIFBDSWUgYnVzLg0KPiA+IC0gQWRkcyBhZGRpdGlvbmFsIGxvZ2ljIGZvciBob3Rw
bHVnIGV2ZW50cyBoYW5kbGluZy4NCj4gPiAtIENvbnRhaW5zIHNvbWUgYW1lbmRtZW50cyBhbmQg
Y29zbWV0aWMgY2hhbmdlcy4NCj4gPg0KPiA+IFRoZSBwYXRjaCBzZXQgaW5jbHVkZXM6DQo+ID4g
UGF0Y2hlcyAjMSAtICMzLCAjNTogYWRkIG5ldyBhdHRyaWJ1dGVzIGZvciBtb25pdG9yaW5nLg0K
PiA+IFBhdGNoICM0OiBzZXRzIGhvdHBsdWcgZXZlbnQgYWN0aW9uIGZvciBoZWFsdGggYW5kIHBv
d2VyIHNpZ25hbHMuDQo+ID4gUGF0Y2ggIzY6IGFkZHMgQ1BMRCB2ZXJzaW9uaW5nIHJlZ2lzdGVy
cyBmb3Igc3lzdGVtcyBlcXVpcHBlZCB3aXRoIGZpdmUNCj4gPiAJICBDUExEIGRldmljZXMuDQo+
ID4gUGF0Y2ggIzc6IG1vZGlmaWVzIHBvd2VyIG9mZiBjYWxsYmFjay4NCj4gPiBQYXRjaCAjODog
Y29zbWV0aWMgY2hhbmdlcyAtIGZpeGVzIG1pc3NwZWxsaW5nLg0KPiA+IFBhdGNoICM5OiBwcm92
aWRlcyBzeXN0ZW0gcmVib290IGNhbGxiYWNrIHRocm91Z2ggc3lzdGVtIHJlYm9vdA0KPiA+IAkg
IG5vdGlmaWVyLg0KPiA+IFBhdGNoICMxMDogcHJlcGFyZXMgZHJpdmVyIHRvIGFsbG93IHByb2Jp
bmcgdGhyb3VnaCBBQ1BJIGhvb2tzIGFsb25nDQo+ID4gCSAgIHdpdGggcHJvYmluZyB0aHJvdWdo
IERNSSBob29rcy4NCj4gPiBQYXRjaCAjMTE6IGFkZHMgQUNQSSBtYXRjaCBob29rIGZvciBpbml0
aWFsaXphdGlvbiBmbG93Lg0KPiA+IFBhdGNoICMxMjogYWRkcyBzdXBwb3J0IGZvciBnZXR0aW5n
IHN5c3RlbSBpbnRlcnJ1cHQgbGluZSBmcm9tIEFDUEkNCj4gPiAJICAgdGFibGUuDQo+ID4gUGF0
Y2ggIzEzOiBhZGRzIGluaXRpYWwgc3VwcG9ydCBmb3IgcHJvZ3JhbW1pbmcgbG9naWMgZGV2aWNl
IGNvbm5lY3RlZA0KPiA+IAkgICB0aHJvdWdoIFBDSWUuDQo+ID4gUGF0Y2ggIzE0OiBFeHRlbmRz
IGNvbmRpdGlvbiBmb3Igbm90aWZpY2F0aW9uIGNhbGxiYWNrIHByb2Nlc3NpbmcuDQo+ID4gUGF0
Y2ggIzE1OiBkZWZpbmVzIHRoZSBleGFjdCBpMmMgYnVzIG9mIGZhbnMgb24gdGhlIFNOMjIwMSBz
eXN0ZW0uDQo+ID4gUGF0Y2ggIzE2OiBEb2N1bWVudHMgbmV3IGF0dHJpYnV0ZXMuDQo+IA0KPiBU
aGFua3MuDQo+IA0KPiAxIHJlbWFyayBhYm91dCBQYXRjaCAjMTY6IERvY3VtZW50cyBuZXcgYXR0
cmlidXRlcywgdGhpcyBkb2VzIG5vdCBkb2N1bWVudA0KPiB0aGUgbmV3IHJlc2V0X3N3Yl9kY19k
Y19wd3JfZmFpbCBhdHRyaWJ1dGUsIHBsZWFzZSBhZGQgdGhpcy4NCj4gDQo+IFdpdGggdGhhdCBm
aXhlZCB0aGUgZW50aXJlIGxvb2tzIGdvb2QgdG8gbWU6DQo+IA0KPiBSZXZpZXdlZC1ieTogSGFu
cyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gDQo+IGZvciB0aGUgc2VyaWVzLg0K
PiANCj4gSSB0cmllZCBhcHBseWluZyB0aGlzLCBidXQgaXQgaXMgYmFzZWQgb24gYSB0cmVlIHdo
aWNoIGRvZXMgbm90IGhhdmUgdGhlIHJlY2VudDoNCj4gZGQ2MzVlMzNiNWM5YSAoInBsYXRmb3Jt
OiBtZWxsYW5veDogSW50cm9kdWNlIHN1cHBvcnQgb2ZuZXcgTnZpZGlhIEwxDQo+IHN3aXRjaCIp
IGNvbW1pdCBjYXVzaW5nIHBhdGNoIDIvMTYgdG8gbm90IGFwcGx5Lg0KPiANCj4gUGxlYXNlIHJl
YmFzZSBvbiB0b3Agb2YgdGhlIGxhdGVzdCBwZHg4Ni9mb3ItbmV4dDoNCj4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGR4ODYvcGxhdGZvcm0tZHJpdmVy
cy0NCj4geDg2LmdpdC9sb2cvP2g9Zm9yLW5leHQNCg0KSSB0aGluayB0aGUgcHJvYmxlbSB0aGF0
IGJyYW5jaGVzOg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvcGR4ODYvcGxhdGZvcm0tZHJpdmVycy14ODYuZ2l0L2xvZy8/aD1mb3ItbmV4dA0KYW5kDQpo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZHg4Ni9wbGF0
Zm9ybS1kcml2ZXJzLXg4Ni5naXQvbG9nLz9oPXJldmlldy1oYW5zDQoNCmRvbid0IGluY2x1ZGUg
c2VyaWVzOg0KW1BBVENIIHBsYXRmb3JtIDAvNF0gcGxhdGZvcm0veDg2OiBtbHgtcGxhdGZvcm06
IFByb3ZpZGUgZml4ZXMgZm9yIHNldmVyYWwgaXNzdWVzDQoNClRoaXMgcGF0Y2ggc2V0IGhhcyBi
ZWVuIGFwcGxpZWQgb25seSB0bzoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3JtLWRyaXZlcnMteDg2LmdpdC9sb2cvP2g9Zml4ZXMN
Cg0KQ2FuIHlvdSwgcGxlYXNlIGNoZXJyeS1waWNrIHRoaXMgc2V0IHRvIGZvci1uZXh0IG9yIHJl
dmlldy1oYW5zIGJyYW5jaCBhbmQgSSdsbCBwcm9kdWNlIHYzDQpvbiB0b3Agb2YgYW55IG9mIHRo
ZXNlIHR3bz8NCg0KT3RoZXJ3aXNlLCB3ZSdsbCBoYXZlIGNvbmZsaWN0Lg0KVGhpcyBwYXRjaCBy
ZWxvY2F0ZXMgc29tZSByZWdpc3RlcnM6DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9wZHg4Ni9wbGF0Zm9ybS1kcml2ZXJzLXg4Ni5naXQvY29tbWl0Lz9o
PWZpeGVzJmlkPWQ2NmE4YWFiN2RjMzZjOTc1YmJhYTZhYTc0Y2Y3NDQ1ODc4ZTdjNjkNCkFuZCBw
YXRjaCAyLzE2IGNhbm5vdCBiZSBhcHBsaWVkLCBiZWNhdXNlIGl0IHV0aWxpemVzIG9uZSBvZiBy
ZWxvY2F0ZWQgb2Zmc2V0cy4NCg0KSXQgc2VlbXMgbm90IHJlbGF5ZWQgdG8gZGQ2MzVlMzNiNWM5
YSwgd2hpY2ggZXhpc3RzIGluIGFsbCBicmFuY2hlcy4NCg0KPiANCj4gYW5kIHN1Ym1pdCBhIHZl
cnNpb24gMy4NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQo+IA0KPiANCj4gDQo+IA0KPiA+
DQo+ID4gTWljaGFlbCBTaHljaCAoMSk6DQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG52c3ct
c24yMjAxOiBjaGFuZ2UgZmFucyBpMmMgYnVzc2VzLg0KPiA+DQo+ID4gVmFkaW0gUGFzdGVybmFr
ICgxNSk6DQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IEFkZCBuZXcgYXR0cmlidXRlcw0KPiA+
ICAgcGxhdGZvcm06IG1lbGxhbm94OiBBZGQgZmllbGQgdXBncmFkZSBjYXBhYmlsaXR5IHJlZ2lz
dGVyDQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IE1vZGlmeSByZXNldCBjYXVzZXMgZGVzY3Jp
cHRpb24NCj4gPiAgIHBsYXRmb3JtOiBtZWxsYW5veDogbWx4LXBsYXRmb3JtOiBNb2RpZnkgaGVh
bHRoIGFuZCBwb3dlciBob3RwbHVnDQo+ID4gICAgIGFjdGlvbg0KPiA+ICAgcGxhdGZvcm06IG1l
bGxhbm94OiBtbHgtcGxhdGZvcm06IEFkZCByZXNldCBjYXVzZSBhdHRyaWJ1dGUNCj4gPiAgIHBs
YXRmb3JtOiBtZWxsYW5veDogbWx4LXBsYXRmb3JtOiBhZGQgc3VwcG9ydCBmb3IgYWRkaXRpb25h
bCBDUExEDQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9ybTogTW9kaWZ5IHBv
d2VyIG9mZiBjYWxsYmFjaw0KPiA+ICAgcGxhdGZvcm06IG1lbGxhbm94OiBDb3NtZXRpYyBjaGFu
Z2VzDQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9ybTogQWRkIHJlc2V0IGNh
bGxiYWNrDQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9ybTogUHJlcGFyZSBk
cml2ZXIgdG8gYWxsb3cgcHJvYmluZw0KPiA+ICAgICB0aHJvdWdoIEFDUEkgaW5mcmFzdHJ1Y3R1
cmUNCj4gPiAgIHBsYXRmb3JtOiBtZWxsYW5veDogbWx4LXBsYXRmb3JtOiBJbnRyb2R1Y2UgQUNQ
SSBpbml0IGZsb3cNCj4gPiAgIHBsYXRmb3JtOiBtZWxsYW5veDogbWx4LXBsYXRmb3JtOiBHZXQg
aW50ZXJydXB0IGxpbmUgdGhyb3VnaCBBQ1BJDQo+ID4gICBwbGF0Zm9ybTogbWVsbGFub3g6IEFk
ZCBpbml0aWFsIHN1cHBvcnQgZm9yIFBDSWUgYmFzZWQgcHJvZ3JhbW1pbmcNCj4gPiAgICAgbG9n
aWMgZGV2aWNlDQo+ID4gICBwbGF0Zm9ybS9tZWxsYW5veDogbWx4cmVnLWhvdHBsdWc6IEV4dGVu
ZCBjb25kaXRpb24gZm9yIG5vdGlmaWNhdGlvbg0KPiA+ICAgICBjYWxsYmFjayBwcm9jZXNzaW5n
DQo+ID4gICBEb2N1bWVudGF0aW9uL0FCSTogQWRkIG5ldyBhdHRyaWJ1dGUgZm9yIG1seHJlZy1p
byBzeXNmcyBpbnRlcmZhY2VzDQo+ID4NCj4gPiAgLi4uL0FCSS9zdGFibGUvc3lzZnMtZHJpdmVy
LW1seHJlZy1pbyAgICAgICAgIHwgIDQyICsrDQo+ID4gIGRyaXZlcnMvcGxhdGZvcm0vbWVsbGFu
b3gvbWx4cmVnLWhvdHBsdWcuYyAgICB8ICAgMiArLQ0KPiA+ICBkcml2ZXJzL3BsYXRmb3JtL21l
bGxhbm94L252c3ctc24yMjAxLmMgICAgICAgfCAgMTIgKy0NCj4gPiAgZHJpdmVycy9wbGF0Zm9y
bS94ODYvbWx4LXBsYXRmb3JtLmMgICAgICAgICAgIHwgMzc2ICsrKysrKysrKysrKysrKystLQ0K
PiA+ICA0IGZpbGVzIGNoYW5nZWQsIDM4MyBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkN
Cj4gPg0KDQo=
