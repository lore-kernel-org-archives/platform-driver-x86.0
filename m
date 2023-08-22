Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7226BEE4996
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 12:45:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235763AbjHVMpl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 08:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235755AbjHVMpl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 08:45:41 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2073.outbound.protection.outlook.com [40.107.101.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AD2196
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Aug 2023 05:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq01PZ02vX78mb+kcHy0ToybtUzURiTGyXcVwPz+UPRZhCbFITLo+IKeuL4lP6CZAF6DlXu47Hyl9zNDI+QevtGcmyB+2aHvb/M73p/hBcsePL+rGLl4O1XoCqZYjtV91JOV8WpqK336rwc410F3x2rOrK4JEiB/B34USQrN2p/XMqrWMHFX9C1OoWg52cJZ5PhaUk57q20gi5Qkz0c3PBeRJhMqlkcGv0I0HyiqzGUzZ8GaTZwLhlNmS8euvjy7GhxJLtdCXbLusQhz8CCJQC/va1R/Mv8OwIJB5uJijQk3IW8MR9mIVBAEq1qHVd678Ce6PxaI/P35GvWVOwol/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxryaA7rK/zfmVerLmRksidlwn8pKksavwJA7CUL8jk=;
 b=ONisgNwUauF2IdAbWJY/rxAfTaS5q0ONOkMshY/Komz+gVjPzqg/6YJmK10P8cOoGPx2V8UqcJJfSWYkjWpsKRLKtGBdID34AlOk15aQb6+fcYEd8Xt3z0SLIF68bJ7IdLbHrcqiy1//aYwdwjrPdhEL8RqJv1ot2sENAWoIRPD5OwVPyZSDzP+9JiXMihY1WjpUZrw0FlP/gXYMCsAS5v1yjxqw8pTIuD6LqQACSLvasdVatU06d2F9x1WGNHZa8fxGUmUEqYyPkoiXoc7hLVEQLJYcTzrbziXL9HLq+/mC0GNb3VeNvr5jWr7W+7K9bt3gynjVcFQ/DgFgXm89xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxryaA7rK/zfmVerLmRksidlwn8pKksavwJA7CUL8jk=;
 b=CgV5myhizv+UI50qWqkIAL7D/ijYqP8KVdtVNzljn9yV9lxtXH1LP0gM9ozJ8i5KlxVtwyuaqrkysiRfs31Yxng2NokXthVUp/oSM91sDf0oL5yOypqwkeQ0rsFrxrA/tub75bw2grdKUzqMaTXURfWszP713ADQPyNGMycN5jlEvkvbzNYoLAuaTW3iWjycdeoXC62kZ2GadJQuQLM03IDwA/IakkxN2GdDBEfkr5vGBj1xAfcTdAcRLu9utr9nnoh1Iokl/ho/0jejjmeNGL4+BzoD7KNvtQXUk+PGh4JA8ANQJPGwIEJl68VQUpknoyHFoGGYZQyvkk2c4XYBcw==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by SJ1PR12MB6267.namprd12.prod.outlook.com (2603:10b6:a03:456::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 12:45:36 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 12:45:36 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH platform-next v4 16/16] Documentation/ABI: Add new
 attribute for mlxreg-io sysfs interfaces
Thread-Topic: [PATCH platform-next v4 16/16] Documentation/ABI: Add new
 attribute for mlxreg-io sysfs interfaces
Thread-Index: AQHZ1O1pEzyq915IHUSWvOcPMnQKca/2MgAAgAAQ27A=
Date:   Tue, 22 Aug 2023 12:45:36 +0000
Message-ID: <BN9PR12MB5381CBFC444A8ED7BDBCEF16AF1FA@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <20230822113451.13785-1-vadimp@nvidia.com>
 <20230822113451.13785-17-vadimp@nvidia.com>
 <7e70744f-70dc-43d6-54d0-fcc6c23d912a@linux.intel.com>
In-Reply-To: <7e70744f-70dc-43d6-54d0-fcc6c23d912a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5381:EE_|SJ1PR12MB6267:EE_
x-ms-office365-filtering-correlation-id: 65e29fef-8f98-44cc-f4b2-08dba30daea9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IXF0kcHAkxlvTFatUeJeULOkvXKGRzdJOMufxjsyOq54CSowpppW7N/kDI0pAIZAQnTjeOWnxBgcvK8SihSwqunOTC6xI0l9o0sX7a2O0NwDl957RP4gdiD0a3RZYi8eJeRFauRJY1g+sMghoqlZasKwv/aMtx4ANl9HacNhr32rsX8t1dYcenMEW5IEqZRyz16nolh8Iouf1k2W/PY1W20+i+8smnSKTTyAAwuzkehtf3lfcEQd28zbKBRuCrbaDGFRyBW1M7meNUZ6n97QzvLRdCYGqd2f3Tj3LvvIuYoDeuSEqKzTTtyFUxUEyaUWFiIYpjpm8o6C8xmxFMSspd+Bm98Oj9TuYmVEm91jFVsMVaY4SVQtKyGp32x5HafzfJw/lLgNPBkVoH+uabKCkfqCovmBxySBTQn+5F9nXjJwuDC3tUfIadEqyqJetEW0nRq2/G0+HTGfLk9QBb+mDOIFINHGATsexc/nS7+oOOjluYvB3f6AyjcwyRzsd347Q5VqnDBwQTnrxBAzDLKWGbJgrwtdWAsGubaWoxuyB2i64WHUMUDPLFhxVm9YQ6/lE5NlLuBReIv4rikNFdF6qMVw8RP8mSMoif6+hdSjBzUamUM1AJZ8F5IWl1LdE2ku
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(54906003)(76116006)(6916009)(66446008)(66476007)(66556008)(64756008)(316002)(9686003)(66946007)(8676002)(8936002)(4326008)(41300700001)(122000001)(478600001)(55016003)(71200400001)(38100700002)(38070700005)(53546011)(6506007)(83380400001)(66574015)(2906002)(86362001)(7696005)(5660300002)(33656002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cndYcG1WOWxSUEs5NnU3L2NVWEptVGtyZXJqa1BvcXU0bjZaUGV0Uit1V2Zt?=
 =?utf-8?B?YXhZYmZjTTNWWWdWY0VVNis1WFpmVU9ZMDFLc1BUZkN4VGdRaTlmZjZ1SEFi?=
 =?utf-8?B?Z0hQNWFRMk8rOUJZckpIdTd5SzNCTTNvbGF5RmJWaUt4eFp0ZjdVYVJ6Qm9P?=
 =?utf-8?B?UXVIU0oveldPWjdNTXJPUmx3dEVSd0ZDZ3dXem5tQnpoSndPTEFod25OWWNY?=
 =?utf-8?B?RFp3TUlQRnFzUlR1Skt6UW91VlBJNllnUzkrVVRZNGcrWEtEQ1hzZGI3RVZ6?=
 =?utf-8?B?YSt0WnByQU1UemJ1Y1lmR2tmSklUTWRGeXlpdEl3MWdoaUVaazdEWnVjdkpp?=
 =?utf-8?B?UVFocWVhU0FPeWxLbyt3TGhtZlkzN0hpaGovWnhoSy8xYjRncGRBOVhlRG1K?=
 =?utf-8?B?TExXcmtsa0JkRXNwQmRhbTZ5TWJjcDAzVEQ3ZUF2RXI1Zmd2azFUWWZiTkwy?=
 =?utf-8?B?SU1SY0Y5OEltcGpwVGZVdG1sVG9tbHFQbHJYK2ppV3l6bTBFbnE2R2ROb25z?=
 =?utf-8?B?dkM0ekU5aDhnY0k0SDc2d3dablcwVDJuVEhoVXNqaVEvRzFIV1VkcW5pNjNO?=
 =?utf-8?B?ZHo0NlZYdjZnMUtwdlhsN0UvZjdZMWtSNlRBTmJ1dENvaWVmZmVFK05Yc1Vj?=
 =?utf-8?B?VkFEVDdabGlBTjRudU9odE00TjBsSEF5NVBIbEhHVUsxUGFqMzV6TzFxM1FM?=
 =?utf-8?B?em9IQ0ZNS2VFc0V1ZEs5QkpjU09zYnRnSEhaeWpKZnFJRWt1S1BZZE56RVB6?=
 =?utf-8?B?azVLRkhuaEhaeFVGUG81cjk4MXdENTZpRkxLcXdJV24zVXpxYVRKRFcyRGZ3?=
 =?utf-8?B?Rk9WTHovc293dUpqSk1mSkxtbXdHenF1Rm9MU0w1VEZaaUtHaW9LbTB0MXNx?=
 =?utf-8?B?blJ3U3YrcTZtSTRVZmk2YWdGaDRvMEVqL2IwcDFqWW5VcXFjRk5PdlNwVmRV?=
 =?utf-8?B?NzYyT2M2ZnUyMWJKTUc2Qms0ZHVadkhlMDF5eGRadHZWNE9iK05ybzF4WWoy?=
 =?utf-8?B?bUdDdUMxNEZsYStENjhXQkFUSlQvREthODJ2bDhJSi8rY1AzM3BpcnFZTkRs?=
 =?utf-8?B?RnVrZytEKzVZU0hPZ2doVjBNRWVXMlhaaEYxTXhJeCt0TEwwOUtydFF5djBZ?=
 =?utf-8?B?R2hIM1NvRGxWVWxnV2I1TzRWZ2J0MDgvMG5JZHRpOGxDeGpDMDA4dXQwSmtp?=
 =?utf-8?B?a05tODhLTXJOdFJoZE0wWngraTY0eFArWlRhREx2SXpEMGlvTnFISHROM1pu?=
 =?utf-8?B?d1M0RzRBRUtaMk5kUXU1U2YvYnpXRkdNQXhIWXNTWXJ1NmtMOWNnR0FNR2hX?=
 =?utf-8?B?bUxJMFp0alE4WW9qNEI3T1BUclcyU0NycE0zT2hpTCt3blNNcXZTb2dEWk83?=
 =?utf-8?B?amF0ZndsY3c2VENMU3Vzdno0RXhMUWN1U2NvWGlqUDIreFNCcy9lUnN6Sjl3?=
 =?utf-8?B?U0Y2WFJFbTk3bFA3ZVpoelZSSVM5NHA2N0xEMnRUYVZkd1djTncwdiswdFN2?=
 =?utf-8?B?SGNNWnE3VWtMV3lzMlBPVCtOaVRoei9xbFo3ZkJSdWFxWEx0WUtuRUlwcHBS?=
 =?utf-8?B?MHpjSkpQSmtSbTBIVXQxODI1bDBwSVg2UDZOUXZoRHloUFVNR3BoRlZsejdo?=
 =?utf-8?B?OFNGc0lneHJ4bm1lSTJIOXBudWVyV25YY2JLbmlDelp6MTJHT2NKT0tTTWhn?=
 =?utf-8?B?Y2c0K1BiM1JTa3hONjJ2ck9NeVV3Y3RKc2s4dVM1KzFCblRvUkFHa2dHcmN4?=
 =?utf-8?B?eEhxd1lmK1d3MGRKN1FJaHk2aGRZcDR3NnJWb294WG9tSk5jQnBEbGJpckJw?=
 =?utf-8?B?UVlWRkhzM05jR29RUk92SEtiTXdNSEorb09iSWl5U0Z3cGwyMVZzc0J3K2oz?=
 =?utf-8?B?U0MvTnFCOXRWWXZpVm1jb3RJRXgxVGNZU3l5ZENVMCtsbnZjT29Zam52emla?=
 =?utf-8?B?VTNWLzI0QURXb2dIeHRNVFFreTlGRU02b0JjbWFXaXdQMzZBYzZlTFVJM2VG?=
 =?utf-8?B?NkxjTG5jMWpTWWRUK0RwcnVXVEhmRkdONVZqZnZpRUxja3ArMG55TzhXN1pk?=
 =?utf-8?B?QU84YkpUN0ZoUm0yeEZXcXdudVpHaStMRC8zQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e29fef-8f98-44cc-f4b2-08dba30daea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2023 12:45:36.3116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fi0ahC/g4jVL9cefqoHYIRenL34SK7Kdb0AjEjglycFkOKnjNrqIUiDgOm4DNs+YgQnMyPgBiIkV1UQ9sO/pfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6267
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWxwbyBKw6RydmluZW4g
PGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCAyMiBBdWd1
c3QgMjAyMyAxNDo0NA0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbnZpZGlhLmNvbT4N
Cj4gQ2M6IGhkZWdvZWRlQHJlZGhhdC5jb207IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJu
ZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggcGxhdGZvcm0tbmV4dCB2NCAxNi8xNl0gRG9j
dW1lbnRhdGlvbi9BQkk6IEFkZCBuZXcNCj4gYXR0cmlidXRlIGZvciBtbHhyZWctaW8gc3lzZnMg
aW50ZXJmYWNlcw0KPiANCj4gT24gVHVlLCAyMiBBdWcgMjAyMywgVmFkaW0gUGFzdGVybmFrIHdy
b3RlOg0KPiANCj4gPiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIG5ldyBhdHRyaWJ1dGVzOg0K
PiA+IC0gQ1BMRCB2ZXJzaW9uaW5nOiAiY3BsZDVfcG4iLCAiY3BsZDVfdmVyc2lvbiIsICJjcGxk
NV92ZXJzaW9uX21pbiIuDQo+ID4gLSBKVEFHIGNhcGFiaWxpdHk6ICJqdGFnX2NhcCIsIGluZGlj
YXRpbmcgdGhlIGF2YWlsYWJsZSBtZXRob2Qgb2YNCj4gPiAgIENQTEQvRlBHQSBkZXZpY2VzIGZp
ZWxkIHVwZGF0ZS4NCj4gPiAtIFN5c3RlbSBsaWQgc3RhdHVzOiAibGlkX29wZW4iLg0KPiA+IC0g
UmVzZXQgY2F1c2VkIGJ5IGxvbmcgcHJlc3Mgb2YgcG93ZXIgYnV0dG9uOiAicmVzZXRfbG9uZ19w
d3JfcGIiLg0KPiA+IC0gUmVzZXQgY2F1c2VkIGJ5IHN3aXRjaCBib2FyZCBEQy1EQyBjb252ZXJ0
ZXIgZGV2aWNlIGZhaWx1cmU6DQo+ID4gICAicmVzZXRfc3diX2RjX2RjX3B3cl9mYWlsIi4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52aWRpYS5jb20+
DQo+ID4gUmV2aWV3ZWQtYnk6IE1pY2hhZWwgU2h5Y2ggPG1pY2hhZWxzaEBudmlkaWEuY29tPg0K
PiA+IFJldmlld2VkLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPg0KPiA+
IC0tLQ0KPiA+IHYzLT52NDoNCj4gPiAgQ29tbWVudHMgcHJvdmlkZWQgYnkgSWxwbzoNCj4gPiAg
LSBNb2RpZnkgZGVzcmlwdGlvbiBmb3IgInJlc2V0X3N3Yl9kY19kY19wd3JfZmFpbCIuDQo+ID4g
djItPnYzOg0KPiA+ICBDb21tZW50cyBwcm92aWRlZCBieSBIYW5zOg0KPiA+ICAtIERvY3VtZW50
IG5ldyBhdHRyaWJ1dGUgInJlc2V0X3N3Yl9kY19kY19wd3JfZmFpbCIuDQo+ID4gLS0tDQo+ID4g
IC4uLi9BQkkvc3RhYmxlL3N5c2ZzLWRyaXZlci1tbHhyZWctaW8gICAgICAgICB8IDUyICsrKysr
KysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtZHJpdmVy
LW1seHJlZy1pbw0KPiBiL0RvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1kcml2ZXItbWx4
cmVnLWlvDQo+ID4gaW5kZXggNjA5NTM5MDNkMDA3Li4xMTUzMDIyMzY2MjcgMTAwNjQ0DQo+ID4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9BQkkvc3RhYmxlL3N5c2ZzLWRyaXZlci1tbHhyZWctaW8NCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtZHJpdmVyLW1seHJlZy1pbw0K
PiA+IEBAIC02NjIsMyArNjYyLDU1IEBAIERlc2NyaXB0aW9uOglUaGlzIGZpbGUgc2hvd3MgdGhl
IHN5c3RlbSByZXNldCBjYXVzZQ0KPiBkdWUgdG8gQUMgcG93ZXIgZmFpbHVyZS4NCj4gPiAgCQlW
YWx1ZSAxIGluIGZpbGUgbWVhbnMgdGhpcyBpcyByZXNldCBjYXVzZSwgMCAtIG90aGVyd2lzZS4N
Cj4gPg0KPiA+ICAJCVRoZSBmaWxlIGlzIHJlYWQgb25seS4NCj4gPiArDQo+ID4gK1doYXQ6CQkv
c3lzL2RldmljZXMvcGxhdGZvcm0vbWx4cGxhdC9tbHhyZWctDQo+IGlvL2h3bW9uL2h3bW9uKi9j
cGxkNV9wbg0KPiA+ICtXaGF0OgkJL3N5cy9kZXZpY2VzL3BsYXRmb3JtL21seHBsYXQvbWx4cmVn
LQ0KPiBpby9od21vbi9od21vbiovY3BsZDVfdmVyc2lvbg0KPiA+ICtXaGF0OgkJL3N5cy9kZXZp
Y2VzL3BsYXRmb3JtL21seHBsYXQvbWx4cmVnLQ0KPiBpby9od21vbi9od21vbiovY3BsZDVfdmVy
c2lvbl9taW4NCj4gPiArRGF0ZToJCUF1Z3VzdCAyMDIzDQo+ID4gK0tlcm5lbFZlcnNpb246CTYu
Ng0KPiA+ICtDb250YWN0OglWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPg0KPiA+
ICtEZXNjcmlwdGlvbjoJVGhlc2UgZmlsZXMgc2hvdyB3aXRoIHdoaWNoIENQTEQgcGFydCBudW1i
ZXJzLCB2ZXJzaW9uIGFuZA0KPiBtaW5vcg0KPiA+ICsJCXZlcnNpb25zIGhhdmUgYmVlbiBidXJu
ZWQgdGhlIDUtdGggQ1BMRCBkZXZpY2UgZXF1aXBwZWQgb24NCj4gYQ0KPiA+ICsJCXN5c3RlbS4N
Cj4gPiArDQo+ID4gKwkJVGhlIGZpbGVzIGFyZSByZWFkIG9ubHkuDQo+ID4gKw0KPiA+ICtXaGF0
OgkJL3N5cy9kZXZpY2VzL3BsYXRmb3JtL21seHBsYXQvbWx4cmVnLQ0KPiBpby9od21vbi9od21v
biovanRhZ19jYXANCj4gPiArRGF0ZToJCUF1Z3VzdCAyMDIzDQo+ID4gK0tlcm5lbFZlcnNpb246
CTYuNg0KPiA+ICtDb250YWN0OglWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPg0K
PiA+ICtEZXNjcmlwdGlvbjogICAgVGhpcyBmaWxlIGluZGljYXRlcyB0aGUgYXZhaWxhYmxlIG1l
dGhvZCBvZiBDUExEL0ZQR0ENCj4gZGV2aWNlcw0KPiA+ICsJCWZpZWxkIHVwZGF0ZSB0aHJvdWdo
IHRoZSBKVEFHIGNoYWluOg0KPiA+ICsJCSBiMDAgLSBmaWVsZCB1cGRhdGUgdGhyb3VnaCBMUEMg
YnVzIHJlZ2lzdGVyIG1lbW9yeSBzcGFjZS4NCj4gPiArCQkgYjAxIC0gUmVzZXJ2ZWQuDQo+ID4g
KwkJIGIxMCAtIFJlc2VydmVkLg0KPiA+ICsJCSBiMTEgLSBmaWVsZCB1cGRhdGUgdGhyb3VnaCBD
UFUgR1BJT3MgYml0LWJhbmdpbmcuDQo+ID4gKw0KPiA+ICsJCVRoZSBmaWxlIGlzIHJlYWQgb25s
eS4NCj4gPiArDQo+ID4gK1doYXQ6CQkvc3lzL2RldmljZXMvcGxhdGZvcm0vbWx4cGxhdC9tbHhy
ZWctDQo+IGlvL2h3bW9uL2h3bW9uKi9saWRfb3Blbg0KPiA+ICtEYXRlOgkJQXVndXN0IDIwMjMN
Cj4gPiArS2VybmVsVmVyc2lvbjoJNi42DQo+ID4gK0NvbnRhY3Q6CVZhZGltIFBhc3Rlcm5hayA8
dmFkaW1wQG52aWRpYS5jb20+DQo+ID4gK0Rlc2NyaXB0aW9uOgkxIC0gaW5kaWNhdGVzIHRoYXQg
c3lzdGVtIGxpZCBpcyBvcGVuZWQsIG90aGVyd2lzZSAwLg0KPiA+ICsNCj4gPiArCQlUaGUgZmls
ZSBpcyByZWFkIG9ubHkuDQo+ID4gKw0KPiA+ICtXaGF0OgkJL3N5cy9kZXZpY2VzL3BsYXRmb3Jt
L21seHBsYXQvbWx4cmVnLQ0KPiBpby9od21vbi9od21vbiovcmVzZXRfbG9uZ19wd3JfcGINCj4g
PiArRGF0ZToJCUF1Z3VzdCAyMDIzDQo+ID4gK0tlcm5lbFZlcnNpb246CTYuNg0KPiA+ICtDb250
YWN0OglWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPg0KPiA+ICtEZXNjcmlwdGlv
bjoJVGhpcyBmaWxlIGlmIHNldCAxIGluZGljYXRlcyB0aGF0IHN5c3RlbSBoYXMgYmVlbiByZXNl
dCBieQ0KPiA+ICsJCWxvbmcgcHJlc3Mgb2YgcG93ZXIgYnV0dG9uLg0KPiA+ICsNCj4gPiArCQlU
aGUgZmlsZSBpcyByZWFkIG9ubHkuDQo+ID4gKw0KPiA+ICtXaGF0OgkJL3N5cy9kZXZpY2VzL3Bs
YXRmb3JtL21seHBsYXQvbWx4cmVnLQ0KPiBpby9od21vbi9od21vbiovcmVzZXRfc3diX2RjX2Rj
X3B3cl9mYWlsDQo+ID4gK0RhdGU6CQlBdWd1c3QgMjAyMw0KPiA+ICtLZXJuZWxWZXJzaW9uOgk2
LjYNCj4gPiArQ29udGFjdDoJVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbnZpZGlhLmNvbT4NCj4g
PiArRGVzY3JpcHRpb246CVRoaXMgZmlsZSBzaG93cyAxIGluIGNhc2UgdGhlIHN5c3RlbSByZXNl
dCBoYXBwZW5lZCBkdWUgdG8NCj4gdGhlDQo+ID4gKwkJZmFpbHVyZSBvZiBhbnkgREMtREMgcG93
ZXIgY29udmVydGVyIGRldmljZXMgZXF1aXBwZWQgb24NCj4gdGhlDQo+ID4gKwkJc3dpdGNoIGJv
YXJkLg0KPiA+ICsNCj4gPiArCQlUaGUgZmlsZSBpcyByZWFkIG9ubHkuDQo+IA0KPiBUaGFua3Mg
YSBsb3QsIG11Y2ggY2xlYXJlciB3b3JkaW5nIG5vdy4NCj4gDQo+IFJldmlld2VkLWJ5OiBJbHBv
IErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+DQoNClRoYW5rIHlvdSB2
ZXJ5IG11Y2ggSWxwbyBmb3IgYWxsIHlvdXIgcmV2aWV3cyENCj4gDQo+IC0tDQo+ICBpLg0K
