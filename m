Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51508C77B61
	for <platform-driver-x86@archiver.kernel.org>; Mon, 24 Apr 2023 14:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbjDXOZn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 24 Apr 2023 10:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjDXOZT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2023 10:25:19 -0400
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 Apr 2023 07:24:32 PDT
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7D6E67
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2023 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
        t=1682346270;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AzraoFuglDODCRPAxc37PnMLge18wDf4vuI4I3aTsA4=;
        b=d5DXnJy8fRdkqwsrCkuMwt9wvyZ8f0Z4nH7nW4AZR+JKXRgGZfLdWY34CQjffSsp9RxXOK
        ymSYyWqRynShA98TuhNUKaQz0uAoFJGc0jxiYn6MelGR2XHFTse5ilLCZkkeXMJpoRvtcq
        EpSZSXZRu2Gf03jSXHDKt9jGVQ6J0b8=
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-kuCQ2jOtOyCtE59XR4-RBQ-1; Mon, 24 Apr 2023 10:18:24 -0400
X-MC-Unique: kuCQ2jOtOyCtE59XR4-RBQ-1
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:160::10)
 by MW4PR84MB1372.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:18:21 +0000
Received: from PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e16:f377:9026:9a13]) by PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5e16:f377:9026:9a13%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 14:18:21 +0000
From:   "Lopez, Jorge A (Security)" <jorge.lopez2@hp.com>
To:     Richard Hughes <hughsient@gmail.com>,
        Maxim Mikityanskiy <maxtram95@gmail.com>
CC:     Alex Hung <alexhung@gmail.com>,
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
Thread-Index: AQHZOv2ZSacMBEbqbEy4rmnLZ5eFN67FULCAgAAfkeCAAAw0AIAAGjUAgHUkzwCAADtLIA==
Date:   Mon, 24 Apr 2023 14:18:21 +0000
Message-ID: <PH0PR84MB195313DBC8EF15354C260D5DA8679@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
References: <Y+JbBiMJw+VLo2Nr@mail.gmail.com>
 <CAD2FfiGLH87H6CVbHimXUfz7ESUKwO8k1ABCgKU9L2SnfGanTA@mail.gmail.com>
 <PH0PR84MB1953825BC90B268904C6C7E5A8D89@PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM>
 <CAD2FfiFUEMupUBoWj2hq9ep=R0Sk-xgBscXqMPefAipvoCg8eg@mail.gmail.com>
 <Y+QXXXX1u33Eyf4E@mail.gmail.com>
 <CAD2FfiEj87WiByKMXrLP7zrj-_gNrNKTh6v6naCxapbVBDcEGw@mail.gmail.com>
In-Reply-To: <CAD2FfiEj87WiByKMXrLP7zrj-_gNrNKTh6v6naCxapbVBDcEGw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: b26bcba1-6dc7-4063-a6b4-890375c4abee
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR84MB1953:EE_|MW4PR84MB1372:EE_
x-ms-office365-filtering-correlation-id: 37f08908-f388-4474-6601-08db44cec229
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: MbaQdxBK+nsPsJfh7P7hsx2dltcaXHhmf8lqFemAI9OsL9yJWJSTkqylvQHBRANdTQuQjZ2k8IJDzMp/pC7qZZWiCS/OTXkWWphnkecmJUowYrs8gWMoF7VmSXo0B6CqsxSRAbo40XexqtGicsPqcvQQMcwYmRaHpmMkQpxYX4dcb01KJBVt6Swj1ebDnduFV859IDT5Om6MMf2uaPkgxepDg7D+oHy2DF7fCY3x25waobOU/V3iI+gnnJB+znlk1T9ZLurCgcff5OZrtWsi9KXBqVRkRdJUZ4kcHqR3Xk9taRjrNSYUf/8rmewY8E5SX1p7YDUIdfDLMG4GOqdZvtqRR/bkYr8Fzwfp2B+UJyEXRVRVLoCpLGXd9s6YAc+a189ILx/HP/h4Mppqaci1ec39wLGuom+Yfj1oq4zeCvi3m/6NfCioymvE5/6dBJ74+77fiURDhsoG8QuvjX864r9nxQ3MGnBrsTx688PJEpw/OWQ1Wx0q9zRdh3JgLzA7Q+rW8dxxkzqphkGC11T4Cv2+ssFR8D08LJJN3gnrC4DmO1zoDKjuDBTxvpaJHEBF5v6QpkDS30p9NMcKXtE0N5k1eQVxkcE7+plZIx2JkXbU7dKLRg0kEs1R3fpb5QuU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(110136005)(54906003)(86362001)(186003)(53546011)(55236004)(7696005)(26005)(9686003)(6506007)(55016003)(33656002)(71200400001)(4326008)(64756008)(66446008)(66476007)(66556008)(316002)(82960400001)(83380400001)(66946007)(76116006)(2906002)(38100700002)(122000001)(41300700001)(8676002)(8936002)(38070700005)(5660300002)(66574015)(7416002)(52536014);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vk5OWUNPZDlIQjVVWDJqTGRybXp6V3AwUm5NNjRFMlBka0lqWk9ENWl6OXB1?=
 =?utf-8?B?bDNmUWNwWmVZcFlPOTFEU2JNQTdiVTgvaHlIY0dNQ1ViQitsNGRQTzY5cjZr?=
 =?utf-8?B?dmpLbTFPczFXeDhkcmVMVW9NbUpxZ00rTG1nYW5UY3dFWGR6Nml3bGprMkRF?=
 =?utf-8?B?ZzJscGxTNURhK3VJMm8zNUxNRFU5TUVodkkrMHFFa3REWHRUYnRrTEk2RXQ3?=
 =?utf-8?B?RVY4QldoUHRQS0FtNEh4YlhFWEdiUjRNUC9EY0ZIcmQ1eUI4bzNjVTloSE1i?=
 =?utf-8?B?bURFSmZDV2RBejZES1dqeDVUeE1OTGJ6SEFJcDZ2YkNJdFhpNGVicGtockRp?=
 =?utf-8?B?alIxSmxVdnAxVFc3VkRDclY0ZmV2VE5pSUpYK242ZFFtUngrT2k3K0p1TEFF?=
 =?utf-8?B?a08zYlBwUXNZV0dwWkluVnN4Y3dSekthdUtQdmVXYWJRR3ZwVEI1c3BHQjhV?=
 =?utf-8?B?L2k0ZXN3TmQza1VJR1FpL3ZzbWN4OWFVUFo2WGlKZWJoSzM3bnhVYXpmQXg1?=
 =?utf-8?B?U25FK2FIcnVhTFZ0N0poR00ydkRIRzVwVzQvd3J4bTYyRkdFbDlOZEp6VEZ6?=
 =?utf-8?B?YVhWK2RFUlNQZEVHWnVXQzFEY0RFTWp1cnhNOGFVZ09HOHZnS0EveHpsRDk2?=
 =?utf-8?B?NGRjN1ZKdjlicEJFZFJlRGJrY24zN0U5M2xuOFhETVV2Sk1yaFNwTXRtUnlO?=
 =?utf-8?B?bjJobkJ3Q0QwbDNSUFFTRjZ6WjFmRmhLeGEvY1BLL2RycExlTnU0b2t4ZXBZ?=
 =?utf-8?B?cnFvRGVVSUZiWTY3NzVHcGpyWkp5eGtKZXMxZFhULzR1K0g4NzRyL2pvTXhQ?=
 =?utf-8?B?OW5ieWNXaXRXcjU4TDVlY3FXblFiZGhnaFdzeWxnOWNBUDhmbjE4SnJvcCtv?=
 =?utf-8?B?enB5cnNkNzczVWRuZERwZVFReE4ySUVwTWpsc2UxSk4xTEZuT1BYOGFmbTBT?=
 =?utf-8?B?WkMvUkxOSEZzRFFReSt0anB4dHNDVDM5M21aUXNlTThMcDNwb0JSWXFNeFl5?=
 =?utf-8?B?ekc3OVI4RVBybWpIQkU3NTNRRndZZnFPcloxNkduQUtmcG5oZjBYVzg5Lzh3?=
 =?utf-8?B?V1c0cW5DUGt4U1IxUXFROHlLazhRd2djdFlVVk5LWjZHOXdqVis5UXBCdFh5?=
 =?utf-8?B?MTUvMWNMSGE0M210OU9EM0liSWt0aG9KeE1iTnlQVGU4bDl5L3dybUh1WVBo?=
 =?utf-8?B?ZEdTUUpmZ1ltNTJBSkFQMFdiZlZnTnR6dHUxYlAycWxJdDZsVTFOUUU3OUlF?=
 =?utf-8?B?Z244bGFuNktkNUtCNjRCVlhNYy9pdGh0Z3B5czF5NzdzUUtuVVUwQXRLU2Ey?=
 =?utf-8?B?cmFYKzhYUHc0RkFUcjZkQTVvekNLZE40TUptdEEzUVk4R2IzTkVPNEkzZzRD?=
 =?utf-8?B?OUxucitPL2IxRSt2czlYWEFiU0lvb3FoWUgyenJUV2NBa1lNTC9nMDVuVHFr?=
 =?utf-8?B?R3pKanhYRGZheEVqRllNOCtiYmlFazJ6enA4SlpxL1BkR3orNDJ6eHBTdi8v?=
 =?utf-8?B?U1lwbFkvVW1LclZpWkpwQ0txZGxJZXcvTDR3QnVsTzkzbVRUWlQzRlpDNjM5?=
 =?utf-8?B?YkN4MDJPWjd4VUFtOWRTTGFYQ1BGNmkwZ2U1M01zWVFvZmxvaUZKcFpIazR2?=
 =?utf-8?B?cVJHbWpMaFo5QjFvcWZmdklnT1JJWGV2TEVVNEMxNVVzTWFVaWtGRy9BeUYz?=
 =?utf-8?B?b0J6Qi80WkxNdHB0M1J0NjI4b1VPQU0wVUt5cUtXN0YyVGxUUnkvc2tvVnR0?=
 =?utf-8?B?cXZzbkhZdWVHT0RJQnlPd3IyaEZHWFJPNHV1cUFlWGpMUXR2ZTkzbVROaG9r?=
 =?utf-8?B?NTcvK1VQYXBPK1RSU015VE0xUnZjcm5nSENOTHhZOXB4RkhtS0pnSHhCWWNi?=
 =?utf-8?B?QWNDYi96RDQ4L0FQYTlRb24rYTYzUzREVzhndFlWRGxDUkJZQmJ0VGE3RDl1?=
 =?utf-8?B?NXR2VlFkY2RMSzJaeHlWM2F6WG0rZm1xZzRDTVVkblo4eDRxalVMK1g2WnBD?=
 =?utf-8?B?bW4yc3E5Zi9XYlhGeTRxRjNRSzQ2TEJyK1FoZGV0YTlxblF5SVZUSGdjbkVX?=
 =?utf-8?B?Ujhuc1BtZFRQUWJBMlQzOVV2S1VnN2ZPSWtNR0Vzd2VvUnZTbmZiR3diWFY4?=
 =?utf-8?Q?zW8+JS52gm7Ldg4oq7Ay5ZVtg?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR84MB1953.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f08908-f388-4474-6601-08db44cec229
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 14:18:21.4448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gx5pA6a1p6Lz7bkKdekLfdmb275cYx8a+n3/5Fny6Vy6h9yqhyPAoADBNWauFUPPqJvD2VXrCB1d1fnY5iwscg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR84MB1372
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgUmljaGFyZCwNCg0KSSBhbSBzb3JyeSBubyByZXNwb25zZSBoYXMgYmVlbiBnaXZlbiB0byBN
YXhpbSdzIGVucXVpcnkuICAgTGV0IG1lIGFwcHJvYWNoIHRoZSBCSU9TIHRlYW0gYW5kIHNlZSB3
aGF0IEkgY2FuIGRvIGZyb20gbXkgZW5kLg0KDQoNClJlZ2FyZHMsDQoNCkpvcmdlIExvcGV6DQpI
UCBJbmMNCg0K4oCcT25jZSB5b3Ugc3RvcCBsZWFybmluZywgeW91IHN0YXJ0IGR5aW5n4oCdDQpB
bGJlcnQgRWluc3RlaW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBS
aWNoYXJkIEh1Z2hlcyA8aHVnaHNpZW50QGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBBcHJp
bCAyNCwgMjAyMyA1OjM3IEFNDQo+IFRvOiBNYXhpbSBNaWtpdHlhbnNraXkgPG1heHRyYW05NUBn
bWFpbC5jb20+DQo+IENjOiBMb3BleiwgSm9yZ2UgQSAoU2VjdXJpdHkpIDxqb3JnZS5sb3BlejJA
aHAuY29tPjsgQWxleCBIdW5nDQo+IDxhbGV4aHVuZ0BnbWFpbC5jb20+OyBIYW5zIGRlIEdvZWRl
IDxoZGVnb2VkZUByZWRoYXQuY29tPjsgTWFyaw0KPiBHcm9zcyA8bWFya2dyb3NzQGtlcm5lbC5v
cmc+OyBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZzsgS2FpLQ0KPiBIZW5nIEZl
bmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT47IE1hcmlvIExpbW9uY2llbGxvDQo+IDxt
YXJpby5saW1vbmNpZWxsb0BhbWQuY29tPjsgQmFybmFiw6FzIFDFkWN6ZSA8cG9icm5AcHJvdG9u
bWFpbC5jb20+Ow0KPiBSaXNoaXQgQmFuc2FsIDxyaXNoaXRiYW5zYWwwQGdtYWlsLmNvbT47IEVu
dmVyIEJhbGFsaWMNCj4gPGJhbGFsaWMuZW52ZXJAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTog
RmlybXdhcmUgdXBncmFkZSBicm9rZSBTV19UQUJMRVRfTU9ERSBvbiBIUCBEcmFnb25mbHkgRzIN
Cj4gDQo+IENBVVRJT046IEV4dGVybmFsIEVtYWlsDQo+IA0KPiBPbiBXZWQsIDggRmViIDIwMjMg
YXQgMjE6NDMsIE1heGltIE1pa2l0eWFuc2tpeSA8bWF4dHJhbTk1QGdtYWlsLmNvbT4NCj4gd3Jv
dGU6DQo+ID4gPiBPa2F5LCBub3cgSSdtIGRvdWJsZSBjb25mdXNlZDsgdGhlIG9ubHkgSFAgRWxp
dGUgRHJhZ29uZmx5IEcyDQo+ID4gPiBmaXJtd2FyZSBvbiB0aGUgTFZGUyBoYXMgbmV2ZXIgYmVl
biBpbiBhbnkgc3RhYmxlIGJyYW5jaC4NCj4gDQo+IEFoaCwgSSBkaWRuJ3QgZXhwZWN0IFQ5MCBh
cyB0aGUgZmlybXdhcmUgbmFtZTsgZm91bmQgaXQuDQo+IA0KPiBJIGVtYWlsZWQgdGhlIEJJT1Mg
dGVhbSBzb21lIHRpbWUgYWdvIGFuZCBhc2tlZCB0aGVtIGZvciBhIHJlc3BvbnNlIGJ1dA0KPiBn
b3Qgbm90aGluZyBiYWNrLiBTb3JyeSB0aGlzIGhhcHBlbmVkIHRvIHlvdSAtLSB2ZW5kb3JzIGFy
ZSB1bmRlciBzdHJpY3QNCj4gaW5zdHJ1Y3Rpb25zIG5ldmVyIHRvIGJyZWFrIHRoaW5ncyBsaWtl
IHRoaXMgZm9yIGEgc2VjdXJpdHkgdXBkYXRlLg0KPiANCj4gSm9yZ2UsIGNhbiB5b3UgY29tbXVu
aWNhdGUgdGhpcyBtb3JlIGNsZWFybHkgaW50ZXJuYWxseSBwbGVhc2UgYW5kIGxldCBtZQ0KPiBr
bm93IHdoYXQgdG8gZG8gYWJvdXQgdGhlIExWRlMgdXBkYXRlcyBwbGVhc2UuDQo+IA0KPiBSaWNo
YXJkDQoNCg==

