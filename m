Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C537E92707
	for <platform-driver-x86@archiver.kernel.org>; Thu,  5 Oct 2023 14:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbjJEOS1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244344AbjJENxD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2023 09:53:03 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::610])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA58868F
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Oct 2023 01:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InK3mLkHgwi506b24knAbYqOgIuUQrzIU3vcRaaF69SLJsAa+WzLPcrbAfpI9G5+RIkoFHvB9HvTWSGe8K+9fqWgGcW/rRIYIBgx+55OWk65Bz0LLNIslupQaeqiFEh8xC286eAmrQO+fr39sri0BW6ieRoQ+39Uo6WOLFi/usioOyTrhOrFJT3OxW4o9OVT7JlEjq8vnoKP6B8ktLCmG15J8GVlVYdXTIId4j6PHejtXwBG/08TAfhJSXlbn6LmOkaXwaP3q930SYUlsHYqrwN3aj058qdN2BQcgjAn7tfNi4GkkqUE/qWMTwn2B2Wd+nQIeTJTmsYE9STdh1Ew6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASpAgWIokP0WF3qsPmbmO/oC4CJO2UJytpgDpegGevA=;
 b=Qq0khGyFSbMIyjPeMBF9r4GnAHAXLEiMKu6je15jc38B2iMSiIFkHl9VUFQX5Rihc5R4awKwJ7ZtxmQ+XhRFJSzdWBFaKVBfR1b5RjJBaVFMKm2sH+ee9zYXp2gGCqyR2aK1gXLfj93cF3k+Q7GgXmZpG4XhuZoL8AQ2n7Xn/JiCwnwRdXSPSnIbVuvPhPmk9M53WsZ8kxh1s6YoTwLCoKV+GGGTh8FQ2we5XJz7UO7GpFivbCKkQm/wF9HR1LWhLP0KCA2TEhJcKFx4PykT0VJo3jatL/1psR0jprp6dibgCP8FOrcHjOyIrRizvhrsU/1idj/n5Cf71pZ0CfcG0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASpAgWIokP0WF3qsPmbmO/oC4CJO2UJytpgDpegGevA=;
 b=EBjkzv55u4aoFaa3lmhbCan0PYQ8LGYMcCFWStkBqMRSKiWmBkQOAX4EmnH655hItoWLFDk9c8kwVEBbzFm60s/WT2MaQniegcu1KM6ZTmt8DwxLXDAQlrkDBHjucD3Az8yBDUs2JCNVq0lrcrI2Q1LaFDqDqotX0+EqfQD/JLavkZSEymYbXW3BNomu+xkNay1z2Ac4ht9SRUJ33aUjuRDSGwa+0ymU1CWaqlkXOa8xIUV78qc41akz4AoIEhfZqTjetj9HIFyPMldE7RFVanO65OXdNyBHUiWTepanhv2CSwXHWIG+1uG0wgTM4OA1h6uaOZZDHLYPgiFyGtEPYA==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by MN6PR12MB8542.namprd12.prod.outlook.com (2603:10b6:208:477::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Thu, 5 Oct
 2023 08:06:22 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::7e45:fc48:aaba:6716]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::7e45:fc48:aaba:6716%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 08:06:22 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Liming Sun <limings@nvidia.com>,
        David Thompson <davthompson@nvidia.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [bug report] platform/mellanox: Add BlueField-3 support in the
 tmfifo driver
Thread-Topic: [bug report] platform/mellanox: Add BlueField-3 support in the
 tmfifo driver
Thread-Index: AQHZ9qZz9fIJSAvkFU25N5U381WcVrA62B8g
Date:   Thu, 5 Oct 2023 08:06:21 +0000
Message-ID: <BN9PR12MB5381C304FDC21FE96186F651AFCAA@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <fc905665-465a-4929-8fb2-1dcc2aa4db04@moroto.mountain>
 <c93dda64-b5d3-7daa-5d43-4e3e6b0ee1db@redhat.com>
In-Reply-To: <c93dda64-b5d3-7daa-5d43-4e3e6b0ee1db@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5381:EE_|MN6PR12MB8542:EE_
x-ms-office365-filtering-correlation-id: 8ac908d9-bd24-4e60-03cc-08dbc579f681
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qkFMkbUDEgSX1i5BNtQ9qotdfcwaN2IP4ey3OYouwejxbnCdBAP1glzDxnI6LqrVUlCsR3LEqQBWJlaUgavEsPRFODJ/Mv7Nzi3mmXp27qmk33J1ekpFkndj1kk+AGIlTU2U8XU0dKWqqAdHjSM7RlnIXhtGQvDIVOQuTYfIbyZROizu4ehCxKLGk4l2YQCUzdEJdUm1+ep/b+Cnr+k5omkMUvDcwMIubeGAi9Fj9TnzUrxDKZ4DaU/x24u3enV8xMuzszWQ3MXzqNYTqiDO4b2RDulbP/WgzqsrbvQkfE0TdQC6kefO7TxejheYKX7/UOtlUlfabTq28UnbW0luwI18E4vhCrHSpWH+0NfeegVQgt/pA8PzRRC818fbg4SoG/2k/R5Y3g30WGaQAqaWhNR4YYS92s48G0UiJa48Kqzu2OteFQ+PVFrS8girU8EVuUP296NJJLYUmrY2mClhSzmMPKBE8xZb9Qqx5kZKXVcAhDC35oIGhr1B8HIgDJ70IrzA2ssvOMJn3Hi/0n5Zh8KLlV7iPAwNhZBzhkTXnoM45hNhbPX5em9stqadjenEpQwPi93cePTALIVtX9Bau90BqI0ri7N+hFAgL9VwT/OH2diycw3RjLLmNnBHZUS+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(9686003)(316002)(66476007)(66446008)(76116006)(66556008)(66946007)(64756008)(6636002)(8676002)(26005)(8936002)(41300700001)(478600001)(86362001)(83380400001)(122000001)(38100700002)(53546011)(7696005)(33656002)(38070700005)(110136005)(4326008)(71200400001)(6506007)(2906002)(55016003)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Nkg2VVRGUkJjVGsxZ2hMYWpWVGpudlFkL1RKaG12SllqVVNNYjFKazgvNmdS?=
 =?utf-8?B?cVlDYUlXSTZFRmdTOWY2SDhNR1dwQ2VSeS9JSWYzUlhRM3RVMllPMVR2cVlJ?=
 =?utf-8?B?VkVsWVQ1eHU3Q1A3cVBIZmN2ZHZKN1N2dEJrTVBlcHA0a0h1SHFuampYRjJZ?=
 =?utf-8?B?YThLYVdNcmpSZXNPdlNUWEtiaDNRUE5yWGxpVUhvL2xXWTh2azhEa1VqSmo3?=
 =?utf-8?B?aHFNSlU0Q0hOU3ZQWXU5dG92OGRzR3hkRU1WOGY0L0RnMS9QVmQyak51RFQy?=
 =?utf-8?B?OTduYlVjeXpmM1FndEZ1WEo3eW9zclhlbHZmaXpydDZXQU93allOc29FQVgr?=
 =?utf-8?B?Q3VtUEM2dFEreDlmbmUzQnhFcmxUU2ZrWkgwWnM1MktYWVNGUFlhV3VoV3lM?=
 =?utf-8?B?NDYzeUZwWE0yYVpTSzdFOU9BdjJ4OFpzTGx6Q2lYc3hxdkpvZzF1YzZvMG1t?=
 =?utf-8?B?WDVJbmFadFdCK0ZTZXc1eE5abVE4WUg1d0xYWC9BL01USlhGb1d2bTFaZjNE?=
 =?utf-8?B?dVhEc2pSazVVaXlGa0hpV2QxdCtyOGZzT242R0FLalpERlZ6eEQ5R2ZUMzhR?=
 =?utf-8?B?aU5qMW5mM3prUi9LT1pNSHhGQzBTUVNjZDM3aEREQ0p2dHE1Y0NFdDNSWmp4?=
 =?utf-8?B?NlZTdjQ4R1pISHpHdm1XeTlsV3JtbW5RcCtZcnJ6S0V6aEY5T3JlblIvMllp?=
 =?utf-8?B?dVJzWExhdnFILzlqREJUTnU3d2Y0YjFnRmp4TGsrT01JV09YMERCLzJCdExt?=
 =?utf-8?B?YjRSd1lHT2xUTVc3VklLa3ZDeHFrUnhxbkdnem5wcFkyOGRSSk1wc1dEQlA3?=
 =?utf-8?B?Z0ZGc2lwYXZjMG5JZkVxUm9PZ0t1cXo0Y2IyM003YnVDZXhhWnpKamxGSFha?=
 =?utf-8?B?RjE5OC9KYi8wZ2pPR0UrZW9COWpxL2pxNkdjUUhuZlhZTGhjVElCdnlYYkNk?=
 =?utf-8?B?bldRWHFONUc5QWFBaTQ5aEFtd0hTREI3b0xrcFdyVWs5U0YxcGd1TmVhQUtP?=
 =?utf-8?B?Sjk4ZTNQWVZUNXJkblQ5OWR6S2g3RmlSOEgzc0hHS0tUeCtYOEFKanpncGp5?=
 =?utf-8?B?WDRCN3RmUTdXd20vaW5HVytjN2NjL2xESjk1VFJLNXlFRSt2bjJ6ZnljTnpK?=
 =?utf-8?B?MmhaZExOVUhkdTF6UU1iS3AyQ250bEpOUHNmVUxHNVJjandEcWQ2eC9oNEJl?=
 =?utf-8?B?cGVNdkNVb2tud3VQSXNITUN2Wi9pN0V1TVZMUXhVZUtYVlFTOFhEdG5mOGJj?=
 =?utf-8?B?TCtTV3hUdmNIeXo1SFNVMWk5UE9tNmNtQW0wYXRHc0VJNi9KdG03NHFvL1dz?=
 =?utf-8?B?UmNzc1R3czJCbXdNVHV1dUIzQ3dWaWdOdUhKU1lRS1Znd0ZYVjVxQUlHd01X?=
 =?utf-8?B?S1p0SWFsbHN5cUwwUGpyenV6QVJTMXA5cC9mK1E4dkFVeUg3OUV6NXVZbTFx?=
 =?utf-8?B?S3JEY093U1ltcDJYcE1CckhZd2JVZlZ1Mm93cGZIUEFhaXJORjVqMGJMekdY?=
 =?utf-8?B?eS96UE1HM2krRVpDSjczeU15S0lQSnpRV0Q3USswUHVYTUhWWmlMdVJhb2Q1?=
 =?utf-8?B?OFRXVVUxUDFzZmhRTWM2N3pBckNYY21rMTV4clhCa1pRcGlEMXRRQ1dTM0ZY?=
 =?utf-8?B?dDFxazlsb0tua09vL1ZUNit2TTV1SXJJMXRZdWVnS2hNNk1Ock13TFNqRita?=
 =?utf-8?B?Q2doSkNKQ0JNd0p1RTQ2QlM2WWI0Z3NKeklQRVMreVBSMUJCUkdIb3JEdW9I?=
 =?utf-8?B?dndoN1RGSTlwajNKUGYyM3Q5aGFUZ3pTTzFOZUhwZ2pmamVNblZ0eXRYL2dq?=
 =?utf-8?B?WmV2TWNNeXJXVHl5aVF6SHgyQVVKWncwSnUyOXVwVWdQN2Q5WXAxMWlnYXNr?=
 =?utf-8?B?TDNjdGdCN2ZRaGtGeXhSS2IySFM5cW05RXpQczJLZVZJVVptSzJYejRrRFhr?=
 =?utf-8?B?NkhmamRrb2hVQWZjY3hOMFNmeW5FQW8zdTNWM3FaU3pZbVJ1QllUMi85ZU9w?=
 =?utf-8?B?VEkvOHpmZHdPL1NYYlRvR2lUVHNnQzhBV2VucUFuUStLWURBK2I5bFVxSjJH?=
 =?utf-8?B?QVh2ejJLQXM0U0NFN21TbmU1SGtXYTNHOFFOeFVwNE14eVlmVm1Dbm5lOFBP?=
 =?utf-8?Q?2Jnw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac908d9-bd24-4e60-03cc-08dbc579f681
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 08:06:21.9813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m7Z4cSU9oPVa027WTzblyr/XpARnzDKWm5/NQXJyRBwrGJ4HtXslhs9EfSO1PuQzKUGstLTWzI2/KgyKqh7vCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8542
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2VkZSA8
aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCA0IE9jdG9iZXIgMjAyMyAx
MjozOA0KPiBUbzogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3JnPjsgTGlt
aW5nIFN1bg0KPiA8bGltaW5nc0BudmlkaWEuY29tPjsgVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBA
bnZpZGlhLmNvbT47IERhdmlkDQo+IFRob21wc29uIDxkYXZ0aG9tcHNvbkBudmlkaWEuY29tPg0K
PiBDYzogcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFtidWcgcmVwb3J0XSBwbGF0Zm9ybS9tZWxsYW5veDogQWRkIEJsdWVGaWVsZC0zIHN1cHBvcnQg
aW4gdGhlDQo+IHRtZmlmbyBkcml2ZXINCj4gDQo+ICtDYyBWYWRpbSwgRGF2aWQuDQo+IA0KPiBP
biA5LzI4LzIzIDE0OjIzLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0KPiA+IEhlbGxvIExpbWluZyBT
dW4sDQo+ID4NCj4gPiBUaGUgcGF0Y2ggYmMwNWVhNjNiMzk0OiAicGxhdGZvcm0vbWVsbGFub3g6
IEFkZCBCbHVlRmllbGQtMyBzdXBwb3J0IGluDQo+ID4gdGhlIHRtZmlmbyBkcml2ZXIiIGZyb20g
T2N0IDE4LCAyMDIyIChsaW51eC1uZXh0KSwgbGVhZHMgdG8gdGhlDQo+ID4gZm9sbG93aW5nIFNt
YXRjaCBzdGF0aWMgY2hlY2tlciB3YXJuaW5nOg0KPiA+DQo+ID4gCWRyaXZlcnMvcGxhdGZvcm0v
bWVsbGFub3gvbWx4YmYtdG1maWZvLmM6NjM0DQo+IG1seGJmX3RtZmlmb19yeHR4X3dvcmQoKQ0K
PiA+IAllcnJvcjogdW5pbml0aWFsaXplZCBzeW1ib2wgJ2RhdGEnLg0KPiANCj4gRGFuIGFzIGFs
d2F5cyB0aGFuayB5b3UgZm9yIHJlcG9ydGluZyB0aGlzLg0KPiANCj4gTGltaW5nLCBEYXZpZCwg
VmFkaW0sDQo+IA0KPiBDYW4gb25lIG9mIHlvdSB0YWtlIGEgbG9vayBhdCB0aGlzIHBsZWFzZSA/
DQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSGFucw0KPiANCg0KSGkgSGFucywNCg0KU3VyZS4gV2Un
bGwgaGFuZGxlIGl0Lg0KDQpUaGFua3MsDQpWYWRpbS4NCg0KPiANCj4gDQo+ID4NCj4gPiBkcml2
ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seGJmLXRtZmlmby5jDQo+ID4gICAgIDU5MiBzdGF0aWMg
dm9pZCBtbHhiZl90bWZpZm9fcnh0eF93b3JkKHN0cnVjdCBtbHhiZl90bWZpZm9fdnJpbmcgKnZy
aW5nLA0KPiA+ICAgICA1OTMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgdnJpbmdfZGVzYyAqZGVzYywNCj4gPiAgICAgNTk0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYm9vbCBpc19yeCwgaW50IGxlbikNCj4gPiAgICAgNTk1IHsNCj4gPiAgICAg
NTk2ICAgICAgICAgc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYgPSB2cmluZy0+dnEtPnZkZXY7
DQo+ID4gICAgIDU5NyAgICAgICAgIHN0cnVjdCBtbHhiZl90bWZpZm8gKmZpZm8gPSB2cmluZy0+
ZmlmbzsNCj4gPiAgICAgNTk4ICAgICAgICAgdm9pZCAqYWRkcjsNCj4gPiAgICAgNTk5ICAgICAg
ICAgdTY0IGRhdGE7DQo+ID4gICAgIDYwMA0KPiA+ICAgICA2MDEgICAgICAgICAvKiBHZXQgdGhl
IGJ1ZmZlciBhZGRyZXNzIG9mIHRoaXMgZGVzYy4gKi8NCj4gPiAgICAgNjAyICAgICAgICAgYWRk
ciA9IHBoeXNfdG9fdmlydCh2aXJ0aW82NF90b19jcHUodmRldiwgZGVzYy0+YWRkcikpOw0KPiA+
ICAgICA2MDMNCj4gPiAgICAgNjA0ICAgICAgICAgLyogUmVhZCBhIHdvcmQgZnJvbSBGSUZPIGZv
ciBSeC4gKi8NCj4gPiAgICAgNjA1ICAgICAgICAgaWYgKGlzX3J4KQ0KPiA+ICAgICA2MDYgICAg
ICAgICAgICAgICAgIGRhdGEgPSByZWFkcShmaWZvLT5yeC5kYXRhKTsNCj4gPiAgICAgNjA3DQo+
ID4gICAgIDYwOCAgICAgICAgIGlmICh2cmluZy0+Y3VyX2xlbiArIHNpemVvZih1NjQpIDw9IGxl
bikgew0KPiA+ICAgICA2MDkgICAgICAgICAgICAgICAgIC8qIFRoZSB3aG9sZSB3b3JkLiAqLw0K
PiA+ICAgICA2MTAgICAgICAgICAgICAgICAgIGlmICghSVNfVlJJTkdfRFJPUCh2cmluZykpIHsN
Cj4gPiAgICAgNjExICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChpc19yeCkNCj4gPiAgICAg
NjEyICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVtY3B5KGFkZHIgKyB2cmluZy0+
Y3VyX2xlbiwgJmRhdGEsDQo+ID4gICAgIDYxMyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplb2YodTY0KSk7DQo+ID4gICAgIDYxNCAgICAgICAgICAgICAgICAgICAg
ICAgICBlbHNlDQo+ID4gICAgIDYxNSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1l
bWNweSgmZGF0YSwgYWRkciArIHZyaW5nLT5jdXJfbGVuLA0KPiA+ICAgICA2MTYgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHU2NCkpOw0KPiA+ICAgICA2MTcg
ICAgICAgICAgICAgICAgIH0NCj4gPg0KPiA+IGlmIElTX1ZSSU5HX0RST1AoKSBpcyB0cnVlIHRo
ZW4gZGF0YSBpc24ndCBpbnRpYWxpemVkLg0KPiA+DQo+ID4gICAgIDYxOCAgICAgICAgICAgICAg
ICAgdnJpbmctPmN1cl9sZW4gKz0gc2l6ZW9mKHU2NCk7DQo+ID4gICAgIDYxOSAgICAgICAgIH0g
ZWxzZSB7DQo+ID4gICAgIDYyMCAgICAgICAgICAgICAgICAgLyogTGVmdG92ZXIgYnl0ZXMuICov
DQo+ID4gICAgIDYyMSAgICAgICAgICAgICAgICAgaWYgKCFJU19WUklOR19EUk9QKHZyaW5nKSkg
ew0KPiA+ICAgICA2MjIgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGlzX3J4KQ0KPiA+ICAg
ICA2MjMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtZW1jcHkoYWRkciArIHZyaW5n
LT5jdXJfbGVuLCAmZGF0YSwNCj4gPiAgICAgNjI0ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGxlbiAtIHZyaW5nLT5jdXJfbGVuKTsNCj4gPiAgICAgNjI1ICAgICAgICAg
ICAgICAgICAgICAgICAgIGVsc2UNCj4gPiAgICAgNjI2ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWVtY3B5KCZkYXRhLCBhZGRyICsgdnJpbmctPmN1cl9sZW4sDQo+ID4gICAgIDYy
NyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZW4gLSB2cmluZy0+Y3Vy
X2xlbik7DQo+ID4gICAgIDYyOCAgICAgICAgICAgICAgICAgfQ0KPiA+DQo+ID4gU2FtZSBoZXJl
Lg0KPiA+DQo+ID4gICAgIDYyOSAgICAgICAgICAgICAgICAgdnJpbmctPmN1cl9sZW4gPSBsZW47
DQo+ID4gICAgIDYzMCAgICAgICAgIH0NCj4gPiAgICAgNjMxDQo+ID4gICAgIDYzMiAgICAgICAg
IC8qIFdyaXRlIHRoZSB3b3JkIGludG8gRklGTyBmb3IgVHguICovDQo+ID4gICAgIDYzMyAgICAg
ICAgIGlmICghaXNfcngpDQo+ID4gLS0+IDYzNCAgICAgICAgICAgICAgICAgd3JpdGVxKGRhdGEs
IGZpZm8tPnR4LmRhdGEpOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5e
DQo+ID4gVW5pdGlhbGl6ZWQgaWYgSVNfVlJJTkdfRFJPUCgpIGlzIHRydWUuDQo+ID4NCj4gPiAg
ICAgNjM1IH0NCj4gPg0KPiA+IHJlZ2FyZHMsDQo+ID4gZGFuIGNhcnBlbnRlcg0KPiA+DQoNCg==
