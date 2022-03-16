Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E123C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 17:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239979AbiCPRXH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 13:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232691AbiCPRXG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 13:23:06 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08on2049.outbound.protection.outlook.com [40.107.100.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866995AA64
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 10:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUVyEqdhtDjgAKCxDhU4XTY6lTbZxl1khdc/jgyKi5wogMoq1JIJ/EK30ENqmIhJTP+gCjTjc5DX9jWPwsG8lbA9kxU0R4MENxjL8rb+uroADE1vwgdOdHOLDqdvtjnsnAsRmrWNZdJtK88Vn6n4IfbH4DIEEsIHLcLVF5T6fwdp5FSw3zldb+K5Hd6fswfpigg+AkFEibsv4zJX2sE4E7c2tl0ut6rgKscCW3QT9SFeQwhAYFfRqp6yyTyR2KB9wzTb+3Yw4cmFmwmlETKFrez9d5e3z1fbf3TskHGUW8ZmxoTnpxnvi2eVz/XYUQvuHpQSYty3WGGPIaobWQFC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo+A8HvqrsKfDcSnn2bjW+oOgJ6TxWKikJDTkXuFw7E=;
 b=fDeQVBy5GCJjbdbqRljP9niHLvK8H8eshi2MEdYYnTyTuLMJwGyX49wUtyr6ufjRwxZnxuBNUMLuzXUGgHH35rVgNcgplWcZ+/0e1iY0Oywrak/jys91dT5YvqD+w6DBVpM82YTW+K+iu8udy9rk5L+MxZDsrVfcGAZyOsBTsMdFsRR2YijjjA2Zu+9Xjil/mhoKayL48n9WHKIS3k/UYjqst5DUb5PMQc1hlFaKPzBMuZoiQ90qJoj06GoAbXnOgpSimPwIpR9d9mP0ZuK0BA8JxQbq9iBeV6XHWTBwiiBGU6e9u7bIXeh0B8nZ2zichcZbUOx6X//GtjdkEwJwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo+A8HvqrsKfDcSnn2bjW+oOgJ6TxWKikJDTkXuFw7E=;
 b=e91+we1fE2us8kkNUrsOK2CTZlgu6rdnZkuUdwmZQIXO9ovNvVv9oYZCXkob0z+o24oDzDF5rDawHeZMHthDM0FVUZYV9Wdamy94/+39c0SkRdWkx3imv8oz73TFEa8gKdB+p4JoABAg2BPPRNf9EwNBJiiDG1m1+yaTCRc52b0=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by BN8PR12MB3425.namprd12.prod.outlook.com (2603:10b6:408:61::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 16 Mar
 2022 17:21:49 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 17:21:49 +0000
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
Thread-Index: AQHYONTN37ZmrvSyq0ixjjgRCkZtxqzBT4WAgADO84CAAAQKgIAAHLSAgAACkwA=
Date:   Wed, 16 Mar 2022 17:21:49 +0000
Message-ID: <BL1PR12MB5157CA033FD8117DCC79D0A4E2119@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220316012516.2233984-1-ddadap@nvidia.com>
 <v_ODhOndx3g1l-BhfKGCB6_nLY83LTc5vz1YDrVEVVF5CmgKUs1x9bmROyWXhmYkeQRVVnvfBnyrFyHaEKqtoZE5P7lKJJ1j_vE0J1Piq2Y=@protonmail.com>
 <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <BL1PR12MB5157B047D2DD5548FE08F0ABE2119@BL1PR12MB5157.namprd12.prod.outlook.com>
 <7d56afc0-3428-6ab5-ba41-c5ce4f1a7ad7@nvidia.com>
In-Reply-To: <7d56afc0-3428-6ab5-ba41-c5ce4f1a7ad7@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-16T17:21:15Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=46a24548-121e-46cb-afeb-193732168714;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-03-16T17:21:47Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 1e1d507f-4dfa-4250-8eaa-c3713f3d61f3
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8a2ab11-29b6-4e97-ef1f-08da07717466
x-ms-traffictypediagnostic: BN8PR12MB3425:EE_
x-microsoft-antispam-prvs: <BN8PR12MB3425491475301F3D251FF987E2119@BN8PR12MB3425.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vwurmyXq7elB3NN7A4itrDZmkHMGari6IAnZwTLUihkOM8UNT+pZOosI+zlM4I5Ay1vRbBXfhZAtmpJYehVz37RMFWArA1KeEQPRDwyxD9kghfGv8GxjKn0PGxyJ0ragToOygSFwcq3atpNFT7X4JHzw9MVXVZwr+Y9ee4ZsZZntzRNruuN9R9lc1/lXW2OUgCNBDYZC5CNJmTtVSAondw7rC+/kuNCQGLD34NtseJKPcZIpy3q4VviaYZ9bo9IkosRBbHEQgcykBE1vUH8MYpPLRZBHp5xiruwXdggeakUJGrx0+RwCz71hq5xFNfwkL1BcZfbPQRsng95ruwxFZxwvccgPvIt1m7iJIDaFI5cZs6BPIvfWjLsIBK+O3c93DZXNjwp41u5eBf/Asooxd5M17aANEcx4N4bABSFS448xyeRlnZ24f5hzQjluTvvt+3befGDzL59IdCwSOEHKFMP/uom1ITaGF+TtCWKYHNnH9V18xNasJFO/fMOWuicRujnBdlZ0CKIijQ2TMZZb2jFETRyEq/12JddD2er+irK++3FfrAaicEkPJhxKRcmeshH+bxG4J5dWRb0f2mD1pV+TedkzyCyBAU8Kmct1TyPKjA//qgwQmtidUshILL3tum8HSy3seP6LjmTQ4EJQZPvkd+ZiIapwFgH88Jk+7HJjejyHdRUtXBiSDAcm7CuZZHC6l95dmbG9yxAdqrSa5Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(71200400001)(2906002)(38070700005)(86362001)(5660300002)(9686003)(45080400002)(966005)(33656002)(508600001)(66946007)(4326008)(54906003)(55016003)(66556008)(66476007)(66446008)(64756008)(8676002)(110136005)(83380400001)(52536014)(8936002)(122000001)(186003)(66574015)(38100700002)(53546011)(6506007)(7696005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TE8yOUFtQTZhQlBxNGYvSVJWdzVoQlRTbExMRWlVWC9vUkg2YUR3WlVJVkhF?=
 =?utf-8?B?S0dZaEloeThDbFdNdW9XdzF6M1pCRkl1anVuYm1oekxZdVB6b3hBTzBCYUow?=
 =?utf-8?B?bjRkcHJrRU1tZWphNlJaTWpPcG5USWhsY1BPQmhGWktkaVJ1bDBGNG5QM3hY?=
 =?utf-8?B?WUhlTjRVbGxGdklCalp0UEh4a3RmbG1JTTc5dnhoZDJ4bXd0U3pITWVzcWZi?=
 =?utf-8?B?NlhlNDFlSkxCYkU0NmZaNHVoeXFkQnNiRUNrTU5KdDZlM1NTL1k4ajcyazF0?=
 =?utf-8?B?RGpWVVVHYmcybE5CaHhSSFdoTUlUZGU4S1lzY3FHNzZjOHZwU2JzVk11Y2Zy?=
 =?utf-8?B?T2gwMTNSbS9xTXhYNGlCM2hHSnAxa2N4d2R3aXJDaVBUMXpacG04VFMwKzU4?=
 =?utf-8?B?Z2ZFc002K24raWlKSEVGYXdkbkViczFBS3FYdytxWllGV1A2RDkxK0dyNkdK?=
 =?utf-8?B?ZUhFUFM2WGVvUVF3NSt0US82Zm0rK3FNc0prQTBXS0FUTVVjeGdSZGpsUHNh?=
 =?utf-8?B?MEVaVlFaNzlSbVVXTWlwcEZ3WmtaZms5SnVjNnp0YUE3cGxHdUpTRThvZmVj?=
 =?utf-8?B?d3ZtNUF1RmJOSjEyU3BCSzg4S2ZIWm9iRTAzWUZpN09hbHRERXE3TlE0YzBo?=
 =?utf-8?B?UlhaOWVVM0tPN1ZlV3BYYTF4V0UycXZCbk52bTcybW83Zmlxa2wydUdDWVho?=
 =?utf-8?B?NGNoMVN2d2d1MXdJSGxVYkxKZzRxOWpHTDFqZGV1b3BnTXdCMzRZS2NBaVFG?=
 =?utf-8?B?a01HNmNjbXN3NkhoOG9FcmhPMkZOTHhjbDRyNnp0YkFSRTByK2dadno4Y3Uy?=
 =?utf-8?B?TGc5N0lUYzNYei9uaXRGZXNVODF6d05PclFTclRrTjFXOU9malVyVFlteVM5?=
 =?utf-8?B?SVdVT29XRngrVDl3ZFEzMWFlWGFld3o2SXRtNjhTQnlNNkIwUmNyblc2a2w5?=
 =?utf-8?B?Mjh5dmI5cnZoTWdWSFRsbm5sTHVYbUJLQUJ1eVJ4RGxUbkZxT3FGVnBnMWpZ?=
 =?utf-8?B?cVJrelZaTE42SUZRQjFiNWl6ejkxVmFhaExucVZ6S1FGa3FhYVROZVRkYk0w?=
 =?utf-8?B?aHliWnlRU1dnNjdiR2c0a1VYMjVmZkMwSEk1QU5KdzFEbUt4eEhvMHpRcFo1?=
 =?utf-8?B?YTNDUmxyc3BZUG9yTFhJc3l0bHFweWJQaXlVTkI3TEhuNjR3cGRkNzAza1k4?=
 =?utf-8?B?QW14aTMwZWp4d0UvQ3VTMXpjL0tMdXhRU3pYYWc3RGRORFZhdDZtUjBEekdL?=
 =?utf-8?B?TzNQdGFrUU81ZlVScTgxcVpPb1NWamFjT2gvUnNrb0ZpRU9zdHRwUlVYOWJs?=
 =?utf-8?B?bUZUNTArcjVHcXZQOXlUNG84Si9CRzNscDBYZ25KWFJncWtsenlDTTVUa0R2?=
 =?utf-8?B?RjVXN1MrK05aaFVudyt4TXZFdmt0QjhrWWd5M2dkQmk0SnE0WUhuME9iYmlE?=
 =?utf-8?B?c21ERk1MTURtRWpnNlpHWGJEWnFpdDBNZk9mdmdRRzJ1MjVxZ1owTWJWYkln?=
 =?utf-8?B?SjVNQzV1QVdWZXQ4OWFCc0EyZlBqRlQrSWFyeHA1TE1RczlNOXliNUR2ck9i?=
 =?utf-8?B?KzA3MHV6T2VWYkZqUFAzL01IK0VQTzFCRDhYOExreEdEUmVNZmhRVWRrbWdF?=
 =?utf-8?B?czNqekRQSWZWRTBHWWJxS1BybEdlWEN1MXBJVXB4a2ZkVGhkMUdVMVluU3Ew?=
 =?utf-8?B?c3hQMlFtcm5iSEd5S2Ric29CbFBJeFhlY1piTDhxR3ZkRUdJZEtmRmxJMXYz?=
 =?utf-8?B?enBpbnpmbzBKeHlxTGdscGo1S2NJREllRTJYcGphVGczMzMvcXpaOVNERDV4?=
 =?utf-8?B?Z3hDajZaY0dLUjluQW1QbWVwVWJibHpqYUk5TmlEWEczUlN5WVhaK1AxMWgx?=
 =?utf-8?B?V1ZqOUVMLzZzcUpod3lPVHh4MFY0c2M4LzAxK1pmOUZQUGdIN0c0a2hWWUVZ?=
 =?utf-8?B?UVFFb0c5YjN6TVExMElWaks2cGNnR0hYZ1FXaGthSHI1WmpqNWtmODdGZjVC?=
 =?utf-8?B?WHBaRkJPQ3NFb2pRNTNRYVhrUmdidHVhUXBZbGhqUm1WamNvU3g3M1pXR1NP?=
 =?utf-8?Q?AtDwIP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a2ab11-29b6-4e97-ef1f-08da07717466
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 17:21:49.0229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BkbaQ+yt2RXzbu9dGRcS1TKhH/H58Jq0s01WjB/B5z3D8XsOnb59rN92FjJNnXMdMUhNpAq8iUyqXSmexQoCcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3425
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

W1B1YmxpY10NCg0KPiBPbiAzLzE2LzIyIDEwOjI5IEFNLCBMaW1vbmNpZWxsbywgTWFyaW8gd3Jv
dGU6DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+ICsgQWxleCBEDQo+ID4NCj4gPiBBbGV4LCBqdXN0
IEZZSSB0aGlzIHdhcyBzb21ldGhpbmcgdGhhdCBjYW1lIHRvIGFuIEFNRCBidWcgdHJhY2tlciBh
bmQNCj4gd2FudGVkIHlvdSB0byBiZSBhd2FyZSB0aGVyZSBhcmUgVy9BIGdvaW5nIGludG8gbnZp
ZGlhLXdtaS1lYy1iYWNrbGlnaHQNCj4gZm9yIHNvbWUgZmlybXdhcmUgcHJvYmxlbXMgd2l0aCB0
aGUgbXV4Lg0KPiA+IElJUkMgdGhhdCB3YXMgdGhlIG9yaWdpbmFsIHN1c3BpY2lvbiB0b28gb24g
dGhlIGJ1ZyByZXBvcnRzLg0KPiANCj4gDQo+IElzIHRoaXMgb24gYSBwdWJsaWMgb3IgcHJpdmF0
ZSBidWcgdHJhY2tlcj8gSWYgdGhpcyB3YXMgb2JzZXJ2ZWQgb24NCj4gc3lzdGVtcyBvdGhlciB0
aGFuIHRoZSBvbmUgYWxyZWFkeSBhZGRlZCB0byB0aGVzZSBxdWlya3MsIGNvdWxkIHlvdQ0KPiBz
aGFyZSB0aGUgZGV0YWlscyBvZiB0aGUgc3lzdGVtcyBzbyB0aGV5IGNhbiBiZSBhZGRlZCBhcyB3
ZWxsPyAoT3IgSQ0KPiBzdXBwb3NlIHlvdSBtYXkgd2FudCB0byB0ZXN0IHRvIHNlZSBpZiB0aGVz
ZSBXQVJzIGFyZSBlZmZlY3RpdmUgb24gdGhlDQo+IGFmZmVjdGVkIHN5c3RlbXMgYXMgd2VsbDsg
d2UgY2FuIGFsd2F5cyBleHBhbmQgdGhlIHF1aXJrcyB0YWJsZSBsYXRlci4pDQoNCldlIChBTUQg
Zm9sa3MpIGRvbid0IGhhdmUgdGhlIGFmZmVjdGVkIHN5c3RlbXMsIHdlIHdlcmUganVzdCB0cnlp
bmcgdG8gaGVscA0KdXNlcnMgYW5kIHRoaW5ncyBwb2ludGVkIGF0IHRoaXMgZHJpdmVyLCB3aGlj
aCBzZWVtcyB0byBoYXZlIHlpZWxkZWQgYSBnb29kDQppbnZlc3RpZ2F0aW9uIGFuZCBjb25jbHVz
aW9uIQ0KDQpJSVJDIHRoaXMgaXMgdGhlIGJ1ZyB5b3Ugd2FudCBsaW5rZWQgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlOg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQvLS9pc3N1
ZXMvMTY3MQ0KDQpCdXQgdGhlc2UgdHdvIGxvb2sgcG9zc2libGUgdG8gYmUgdGhlIHNhbWUgcm9v
dCBjYXVzZToNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVz
LzE3OTENCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzE3
OTQNCg0KSWYgeW91IGVuZCB1cCBpbnRyb2R1Y2luZyBhIG1vZHVsZSBwYXJhbWV0ZXIgdG8gdHJ5
IHRvIGFjdGl2YXRlIHRoZXNlIHF1aXJrcw0KaXQgbWlnaHQgYmUgdmlhYmxlIHRvIGFzayB0aGUg
Zm9sa3MgaW4gdGhvc2UgaXNzdWVzIHRvIHRyeSB0aGUgdjIgb2YgeW91ciBwYXRjaCB0b28NCndo
ZW4geW91J3JlIHJlYWR5IHdpdGggdGhlIG1vZHVsZSBwYXJhbWV0ZXIuDQoNCj4gDQo+IA0KPiA+
IENvbW1lbnRzIGlubGluZSBhcyB3ZWxsLg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4+IEZyb206IERhbmllbCBEYWRhcCA8ZGRhZGFwQG52aWRpYS5jb20+DQo+ID4+
IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMTYsIDIwMjIgMTA6MTENCj4gPj4gVG86IEJhcm5hYsOh
cyBQxZFjemUgPHBvYnJuQHByb3Rvbm1haWwuY29tPg0KPiA+PiBDYzogcGxhdGZvcm0tZHJpdmVy
LXg4NkB2Z2VyLmtlcm5lbC5vcmc7IEFsZXhhbmRydSBEaW51DQo+ID4+IDxhbGV4LmRpbnUwN0Bn
bWFpbC5jb20+OyBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPjsNCj4gPj4gbWFy
a2dyb3NzQGtlcm5lbC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0gbnZpZGlhLXdtaS1l
Yy1iYWNrbGlnaHQ6IEFkZCB3b3JrYXJvdW5kcyBmb3INCj4gPj4gY29uZnVzZWQgZmlybXdhcmUN
Cj4gPj4NCj4gDQo+IFsgLi4uIF0NCj4gDQo+IA0KPiA+Pg0KPiA+PiBPbiAzLzE1LzIyIDk6NTAg
UE0sIEJhcm5hYsOhcyBQxZFjemUgd3JvdGU6DQo+ID4+PiAgIFsgLi4uIF0NCj4gPj4+IExhc3Rs
eSwgaXMgaXQgZXhwZWN0ZWQgdGhhdCB0aGVzZSBidWdzIHdpbGwgYmUgcHJvcGVybHkgZml4ZWQ/
DQo+ID4+DQo+ID4+IFBvc3NpYmx5LCBidXQgSSB3b3VsZG4ndCBob2xkIG91dCBob3BlIGZvciBp
dCBmb3IgYW4gaXNzdWUgYXQgdGhpcyBzY2FsZQ0KPiA+PiBvbiBhbiBhbHJlYWR5IHNoaXBwaW5n
IHN5c3RlbS4NCj4gPiBUaGlzIHF1ZXN0aW9uIEknbSBhc3N1bWluZyB3YXMgYWltZWQgYXQgbmFy
cm93aW5nIHRoZSBxdWlyayB0byBvbmx5DQo+ID4gbWF0Y2ggY2VydGFpbiBGVyB2ZXJzaW9ucyBv
ciBzby4gIElmIHRoZXJlIGlzIG5vIGNlcnRhaW50eSBvZiB3aGVuL2lmIGl0DQo+ID4gd2lsbCBi
ZSBmaXhlZCBJIGFncmVlIHdpdGggY3VycmVudCBkaXJlY3Rpb24uDQo+ID4gSG93ZXZlciBJIHRo
aW5rIGl0J3Mgc3RpbGwgd29ydGggYXQgbGVhc3Qgbm90aW5nIG5lYXIgdGhlIHF1aXJrIGluIGEg
Y29tbWVudA0KPiA+IHdoYXQgZmlybXdhcmUgdmVyc2lvbiBpdCB3YXMgaWRlbnRpZmllZC4gIElm
IGxhdGVyIHRoZXJlIGlzIGNvbmZpcm1hdGlvbiB0aGF0DQo+ID4gYSBwYXJ0aWN1bGFyIGZpcm13
YXJlIHZlcnNpb24gaGFkIGZpeGVkIGl0IHRoZSBxdWlyayBjYW4gYmUgYWRqdXN0ZWQgdG8gYmUN
Cj4gPiBkcm9wcGVkLg0KPiA+DQo+IA0KPiBUaGFua3MsIE1hcmlvLiBTdXJlLCBJJ2xsIG1ha2Ug
c3VyZSB0aGUgZmlybXdhcmUgdmVyc2lvbiB0aGlzIHdhcyBmaXJzdA0KPiBvYnNlcnZlZCBpbiBp
cyBub3RlZC4NCj4gDQo+IA0K
