Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B76C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Mar 2022 15:51:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbiCIPwq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Mar 2022 10:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiCIPwp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 10:52:45 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75EF91385AF
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Mar 2022 07:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miDw8bRIr8khwkG/Rhr+DqlxWz7fTXS6/NtVy4HXYgXpqlA6ttLGBTvs5jW1fVmraF38sA+Ciob+tTtPLomNHuT74FM0goVA7IgnD4fdv7Fn89L1uIFwFz46+G+uhtlGVXd0IAyfR2y22iQfgBx8GvdpCPkwRAEbJhA1YjUtBSl7hxeBo/nsJHxxd5afvd60NWTCVyguJHoDkJ71FiqFXA901yqyrADyEcc1IL5NLz17cJlJy5b9fth742SzhUs2bjffPdd31V6SirOJ0F+TBmmK+74Vd/DRAtXhB3vjt72GhMFAef/ERarvmdpp6hwh/fByUuUje0xmBQf3g43Flw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZPvFo+9WuGxSQemsKJ4p/OKj8NeC3qrQ6cnGSLGTVc=;
 b=GZ44bjfZs3UpXDigZ2Jicf7+JROkLI2O6syFPrEsRbRxcFBvlGFIL5aJ5Qdv/NzkyZp6rGzEO7Sixbg6GHIo5NnB2QaCIeEf1x6F7qvdwlhOnQTiivbomDTVC2jW2PweVURzmOtkJ7AhR4bHI9mhJOrNW8lD5SAE02J6TcGFh7LJk7GpQyIpAjKynqVAzqD8lnE+k/XkKK40gtu/LW3fPz9dlOrk22YOneBl90L1/LoqObYXwq22y8ei9oqzcgRAnS+yCoIfZ/fqcDSuSFPWnSarBSIXlHsGNl4Q+TVAMkhOiXX7z80bySkBkjP/QNl3BQBz0zV+eggja7PLvakFPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZPvFo+9WuGxSQemsKJ4p/OKj8NeC3qrQ6cnGSLGTVc=;
 b=lx/Lwci2eS053nGcaXHL3Ia/vy+wevPbjpUvl3oRFrVI1CdDNsqhL4eS4k/P2XFm7d6wXMz1z9Zc8Ff8Ztgca5d3ZqRta+FfiWXsQKY8H9bGoiv/XW76QIa/ML/Zwfgv6T2jXr6eGE4Yysa8w5UpyX8swXx6rogLbaPE9iaRlNc=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MWHPR12MB1326.namprd12.prod.outlook.com (2603:10b6:300:10::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Wed, 9 Mar
 2022 15:51:42 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5038.029; Wed, 9 Mar 2022
 15:51:42 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
CC:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "Goswami, Sanket" <Sanket.Goswami@amd.com>
Subject: RE: [PATCH] platform/x86: amd-pmc: Validate entry into the deepest
 state on resume
Thread-Topic: [PATCH] platform/x86: amd-pmc: Validate entry into the deepest
 state on resume
Thread-Index: AQHYM8RpuOymftISbk+rfiuRjSlGOay3MuyAgAAAUMA=
Date:   Wed, 9 Mar 2022 15:51:42 +0000
Message-ID: <BL1PR12MB5157EAB7BBA8B26E5D197D9FE20A9@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220309144403.213756-1-mario.limonciello@amd.com>
 <9e6f2b59-22ec-568b-6b30-8f739d241098@redhat.com>
In-Reply-To: <9e6f2b59-22ec-568b-6b30-8f739d241098@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-09T15:51:19Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=8b0b8e5f-b5e9-4776-9456-815e2202f0e1;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-03-09T15:51:40Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 17e27118-ba8d-43c8-b65d-bd6f0b0b9301
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f556a566-bd85-4a67-2429-08da01e4b509
x-ms-traffictypediagnostic: MWHPR12MB1326:EE_
x-microsoft-antispam-prvs: <MWHPR12MB1326D62BF97A4E7A68740250E20A9@MWHPR12MB1326.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TwxLflbYJSAZLuB59MCe0vTCDiV1FZuBZLd0YCNJj/SwrN71ZVdx1183thrFndlh88fIrl86tHtEfkaCXAdrInolMqDoOK2dNiUvvQVVtIISANfhqy2sCdzj4BA/8oJ5lhUalCoYeRwl5TLlibL0VU8rScxC6VlpWngWn/8eZy9BBz8IRnwh3ZA1dmp9gzajiKHgy4axEVLpXKmtjiYK9N85CPis3LpapxpO6Wt06b7g91SVp+gG6FRkSG92Xg6J2HHqnLbmF9Ro2EIFPYPLb99uiIz0GY6ar2Odwwzaz84RBCiwl4D1XZJmVXfWBmCQ4bP+cTmoYM37pVr9QpL4HCu3wBmKxgBkmx2bfdsCjQOzRA6egMTDnqx2Yu2WfmfOKG7NFJf7MjWvOqxYLA6FbuaRByUCAkIhrii7QFR9mEXJQvTY6J529jmji1tWPHPJtylXT/IhoT7rpNvpxGKBRtXtWV2UHdfJhu4e/fbfMpQXdPUpjkQYD3fLt7u8pZbOVI50F+p9RSr2nTR2Fh56c9p5ryayCh2MgWls5rK0mb/0MTKsIEFrCtKCmqz8bXhbKMAfq3BGWAuUAfKrssLu55CA5HwVt192pf4t9qF4yCiLVj/RBqBwbQJAzwSbxZ/8mtZvkiKp0aogxsI7JpCgyhWJ07v1boMO2HXwgyDlyvFyfvqQmq7hWY+OzlXwHlxzH5Rv4eHL69AZ/YYUKmO9gA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(54906003)(5660300002)(86362001)(66556008)(66946007)(52536014)(66446008)(64756008)(38100700002)(66476007)(110136005)(8936002)(15650500001)(2906002)(33656002)(76116006)(55016003)(508600001)(122000001)(53546011)(6506007)(9686003)(7696005)(71200400001)(38070700005)(186003)(26005)(83380400001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUlHMmttdHc1Z05PUVg4YjQ1cmhmUlpqTmI0TDJ3WVZoYk1zUXZIWEppa3Y5?=
 =?utf-8?B?KzFhSzNNKzBGa3hkaENMNGFzNzRueDc4RUtRdWFKZzVJTmVFMlJwa2N3ZEp5?=
 =?utf-8?B?Uyt4VE9odG5nbjg3TVRQMFNtTDB5MTJvNlV3VUpDN01kenorY1UzVjBEeEV1?=
 =?utf-8?B?SlI5VTVLMUpQQ0tFZEZjbGRTNlp5QWIwcW84MUVoekpCZTNyZGhaTERvRDhz?=
 =?utf-8?B?L3p2a3VHUm1wYUhzTjlBZFNQMlVJcUlPNGtIS25vR2pXeXN4WVlwVWVBdG8w?=
 =?utf-8?B?M205dFFHaVpnWHUrdGRmd3Zsa2FtNS9JT1k4Vm5lR0RTdGdIdUg2QzhJSGVQ?=
 =?utf-8?B?ZG9BcWpzNTVpR2dQM0I0ME1hOG9UVmY4RzRHSDk4eXRBVm5aVjA3UGZOcU1z?=
 =?utf-8?B?QzVaUFlYbFJHTnBWZzVLS3RFSW9zQy9VQnYvUTEvN2JLREQ1UDFzNlB2Z0ZB?=
 =?utf-8?B?eFRlTXFUQVBVdTJpYStXUkJwTjBRSmpyN1hIYWhxR080aU80OTkwdW90cTdw?=
 =?utf-8?B?Yis3aGFZeDUwaDJ2WVV5MXJteUJ0VkhsZ3JhckdBRm9rc29YRUFPNytEN1VB?=
 =?utf-8?B?b05IVHlxS21qOUhnR2d6ZXpmY29LVS9IcW11Q0ZDRDdKVmtKSFN2UWVBYTI3?=
 =?utf-8?B?TVVQSEhwaDlOOEg2U2ZRYWxPY3dWWFdaOTBSN0ZxbTVQZ2cvVEhrbGNBTVNM?=
 =?utf-8?B?NFZnY0F1QzdPSUZ1WmRydnFMQ3liMFM1cmwvcTJTRlo1VGNxWjJwOWp6UFhR?=
 =?utf-8?B?MlVwZ1hJZkV4cnlYRGRjMkFLTGpYb3lKUWI3aFpiR01qK3hnLzNYbG1OSVRo?=
 =?utf-8?B?V09aeURkNEZ0OXpwdnhSV1R1Y0VNVVBnMVNXZFdUR2RwanUreDZSdzVBaUxz?=
 =?utf-8?B?R21WRkQyMjNoYjdZUHhCd3F0Q0VkOFVUOXVVaUs2RDg3R0FZVEtuMmduclIw?=
 =?utf-8?B?bGo0Yyt3b01RM3VMSWtkU3pPVzJ1cFhyZmV2cVd5Z2g4elMza2FrS214UWNB?=
 =?utf-8?B?NlVsWmp0bHpPMHlTV0E4VkZFeVNLNWNNTHJsRCtRYjFCSFNURFlhdndmWUR5?=
 =?utf-8?B?b0dYVG9vYUFjR2ZhQU8yV0ozZi9WY2lhT3JhMytDRmRWN3JJYWxWOTYwRFc4?=
 =?utf-8?B?eFN0SkloNGFjaFpkZDlmVUM5SGhKSE0xN3ZPNEkrTkh2emNXa3AvQ0hDek9y?=
 =?utf-8?B?Q2w5SkdIVHEzNXVhRGIzS3BBejRaazFYbmR5dkN3NUF1R3pEeW5lVFNhSlJq?=
 =?utf-8?B?SW5VY2RKRXFnK0VNMDdOcjA3S29QN3E2VWNSVmlLM1Y0QzdyOGR1TzZKdS9o?=
 =?utf-8?B?bnFVRG9LVjhlemxJdElUczF3UjZvVjFaQm5pOEdRL2JhZzVtcitoeHRhQ0xj?=
 =?utf-8?B?L1Y2a2kxZC9nbDVrbXBpRVRlODIzeUNCb1VwemxmR2M5WDlyd2VDVDMxdVpN?=
 =?utf-8?B?TlhLRFRGQndncWY1RnY1STdsK3VZSGlWWjFZeTRqZWx6Y1JQU1p3UmhjZlAx?=
 =?utf-8?B?WWRnOENUMHNSUEQ2a3BrVVgwOWdDckdaN2VNNmRuYnVjUWFQSnlkajkzdFZF?=
 =?utf-8?B?aktoUlA2OUhnZkRGbThhaXBXOFExaFZNaXlQUmo4TStabWpxL0NHcFhRY01L?=
 =?utf-8?B?ekU5UHBETGoxYmdaeFZ5eDdhYURKNHFobER2NXJteWVmTWl3TFhLU2Z3azJm?=
 =?utf-8?B?NHdxN1JtdVJjek5iMXJoV3E3Wm94b2RrMVFGcG5kTE1VR2JnR3VuL1pYY1JC?=
 =?utf-8?B?cU1jMmUwM29UWnM0VGNJV3ZBVFhEOGdESVpXUnhJU3ZoTlhBK2RET2pLSVdG?=
 =?utf-8?B?V05kQUpITEVBcm5pWjArOUtscGk5SnI5czQ0N0d4VjRmUFNnMlB1cEJaT00x?=
 =?utf-8?B?emFkRjIrT2FSN3hrcDU4bGJwaFV5NUUvRHY1OEQrZXpiK09EaGZES2lQTENx?=
 =?utf-8?B?RUE4OEhVL09sTE45V2Y2K3FhdTJoZHoxS0xuNC9GVTZOZXh1Z04wNTcvMURS?=
 =?utf-8?B?OVd3TWhlU1pvWUpma0U1UlQrVUtrYi9nUmtoN2Q3amw5RloxZUR4Sng5TVpL?=
 =?utf-8?B?b25rc1VzaXJPZHlSN2t5ZW1NMUEzM2t3S3lvaTg0NTB2S3ZQcmFBR0Roemk5?=
 =?utf-8?B?K09LejYzWnJyL09wTFRkMnEweWNUQ3plNkJsVldWaWR4cXUvREVXekRiQXBJ?=
 =?utf-8?Q?r+IRb0X/pcm0oAdrAaTcEbM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f556a566-bd85-4a67-2429-08da01e4b509
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 15:51:42.6855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HaPYWXQGMELsSkO75pYTliiRZ8Ai8/nFiFhHnBaGdtKHBOG8dNGC7MjScLO4P5Ah5Wgihe+Y7fCd8IYVcBPyIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1326
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFu
cyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXJj
aCA5LCAyMDIyIDA5OjQ5DQo+IFRvOiBMaW1vbmNpZWxsbywgTWFyaW8gPE1hcmlvLkxpbW9uY2ll
bGxvQGFtZC5jb20+OyBNYXJrIEdyb3NzDQo+IDxtZ3Jvc3NAbGludXguaW50ZWwuY29tPjsgb3Bl
biBsaXN0Olg4NiBQTEFURk9STSBEUklWRVJTIDxwbGF0Zm9ybS0NCj4gZHJpdmVyLXg4NkB2Z2Vy
Lmtlcm5lbC5vcmc+DQo+IENjOiBTLWssIFNoeWFtLXN1bmRhciA8U2h5YW0tc3VuZGFyLlMta0Bh
bWQuY29tPjsgR29zd2FtaSwgU2Fua2V0DQo+IDxTYW5rZXQuR29zd2FtaUBhbWQuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBwbGF0Zm9ybS94ODY6IGFtZC1wbWM6IFZhbGlkYXRlIGVudHJ5
IGludG8gdGhlDQo+IGRlZXBlc3Qgc3RhdGUgb24gcmVzdW1lDQo+IA0KPiBIaSwNCj4gDQo+IE9u
IDMvOS8yMiAxNTo0NCwgTWFyaW8gTGltb25jaWVsbG8gd3JvdGU6DQo+ID4gQ3VycmVudGx5IHRo
ZSBvbmx5IHdheSB0byBkaXNjb3ZlciBpZiBhIHN5c3RlbSB3ZW50IGludG8gdGhlIGRlZXBlc3Qg
c2xlZXANCj4gPiBzdGF0ZSBpcyB0byByZWFkIGZyb20gc3lzZnMgYWZ0ZXIgeW91IGZpbmlzaGVk
IHN1c3BlbmQuDQo+ID4NCj4gPiBUbyBiZXR0ZXIgaWxsdXN0cmF0ZSB0byB1c2VycyB0aGF0IHBy
b2JsZW1zIGhhdmUgb2NjdXJyZWQsIGNoZWNrIGFzIHBhcnQNCj4gPiBvZiByZXN1bWUgYW5kIGRp
c3BsYXkgYSB3YXJuaW5nLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFyaW8gTGltb25jaWVs
bG8gPG1hcmlvLmxpbW9uY2llbGxvQGFtZC5jb20+DQo+IA0KPiBIYXMgdGhpcyBhbHNvIGJlZW4g
dGVzdGVkIG9uIHN5c3RlbSB3aGljaCB1c2UgUzMgc3VzcGVuZCByYXRoZXINCj4gdGhlbiBzMmlk
bGUgPw0KPiANCg0KUzMgc3VzcGVuZCB3b24ndCBleHBvcnQgQUNQSSBkZXZpY2UgdGhhdCBjYXVz
ZXMgYW1kLXBtYyB0byBwcm9iZSBzbyB0aGlzDQpjb2RlIHdvbid0IGV2ZXIgcnVuLg0KDQo+IFJl
Z2FyZHMsDQo+IA0KPiBIYW5zDQo+IA0KPiANCj4gDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvcGxh
dGZvcm0veDg2L2FtZC1wbWMuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2FtZC1wbWMuYyBiL2RyaXZl
cnMvcGxhdGZvcm0veDg2L2FtZC0NCj4gcG1jLmMNCj4gPiBpbmRleCAwNWI0YmFjMzg5MjAuLmUx
MTc0MDRlMWJiMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQtcG1j
LmMNCj4gPiArKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQtcG1jLmMNCj4gPiBAQCAtMTcx
LDYgKzE3MSwyOCBAQCBzdHJ1Y3Qgc211X21ldHJpY3Mgew0KPiA+ICAJdTY0IHRpbWVjb25kaXRp
b25fbm90bWV0X3RvdGFsdGltZVtTT0NfU1VCU1lTVEVNX0lQX01BWF07DQo+ID4gIH0gX19wYWNr
ZWQ7DQo+ID4NCj4gPiArc3RhdGljIGludCBnZXRfbWV0cmljc190YWJsZShzdHJ1Y3QgYW1kX3Bt
Y19kZXYgKnBkZXYsIHN0cnVjdA0KPiBzbXVfbWV0cmljcyAqdGFibGUpDQo+ID4gK3sNCj4gPiAr
CWlmIChwZGV2LT5jcHVfaWQgPT0gQU1EX0NQVV9JRF9QQ08pDQo+ID4gKwkJcmV0dXJuIC1FTk9E
RVY7DQo+ID4gKwltZW1jcHlfZnJvbWlvKHRhYmxlLCBwZGV2LT5zbXVfdmlydF9hZGRyLCBzaXpl
b2Yoc3RydWN0DQo+IHNtdV9tZXRyaWNzKSk7DQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+
ICsNCj4gPiArc3RhdGljIHZvaWQgYW1kX3BtY192YWxpZGF0ZV9kZWVwZXN0KHN0cnVjdCBhbWRf
cG1jX2RldiAqcGRldikNCj4gPiArew0KPiA+ICsJc3RydWN0IHNtdV9tZXRyaWNzIHRhYmxlOw0K
PiA+ICsNCj4gPiArCWlmIChnZXRfbWV0cmljc190YWJsZShwZGV2LCAmdGFibGUpKQ0KPiA+ICsJ
CXJldHVybjsNCj4gPiArDQo+ID4gKwlpZiAoIXRhYmxlLnMwaTNfbGFzdF9lbnRyeV9zdGF0dXMp
DQo+ID4gKwkJZGV2X3dhcm4ocGRldi0+ZGV2LCAiTGFzdCBzdXNwZW5kIGRpZG4ndCByZWFjaCBk
ZWVwZXN0DQo+IHN0YXRlXG4iKTsNCj4gPiArCWVsc2UNCj4gPiArCQlkZXZfZGJnKHBkZXYtPmRl
diwgIkxhc3Qgc3VzcGVuZCBpbiBkZWVwZXN0IHN0YXRlIGZvcg0KPiAlbGx1dXNcbiIsDQo+ID4g
KwkJCSB0YWJsZS50aW1laW5fczBpM19sYXN0Y2FwdHVyZSk7DQo+ID4gK30NCj4gPiArDQo+ID4g
ICNpZmRlZiBDT05GSUdfREVCVUdfRlMNCj4gPiAgc3RhdGljIGludCBzbXVfZndfaW5mb19zaG93
KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqdW51c2VkKQ0KPiA+ICB7DQo+ID4gQEAgLTE3OCwx
MSArMjAwLDkgQEAgc3RhdGljIGludCBzbXVfZndfaW5mb19zaG93KHN0cnVjdCBzZXFfZmlsZSAq
cywNCj4gdm9pZCAqdW51c2VkKQ0KPiA+ICAJc3RydWN0IHNtdV9tZXRyaWNzIHRhYmxlOw0KPiA+
ICAJaW50IGlkeDsNCj4gPg0KPiA+IC0JaWYgKGRldi0+Y3B1X2lkID09IEFNRF9DUFVfSURfUENP
KQ0KPiA+ICsJaWYgKGdldF9tZXRyaWNzX3RhYmxlKGRldiwgJnRhYmxlKSkNCj4gPiAgCQlyZXR1
cm4gLUVJTlZBTDsNCj4gPg0KPiA+IC0JbWVtY3B5X2Zyb21pbygmdGFibGUsIGRldi0+c211X3Zp
cnRfYWRkciwgc2l6ZW9mKHN0cnVjdA0KPiBzbXVfbWV0cmljcykpOw0KPiA+IC0NCj4gPiAgCXNl
cV9wdXRzKHMsICJcbj09PSBTTVUgU3RhdGlzdGljcyA9PT1cbiIpOw0KPiA+ICAJc2VxX3ByaW50
ZihzLCAiVGFibGUgVmVyc2lvbjogJWRcbiIsIHRhYmxlLnRhYmxlX3ZlcnNpb24pOw0KPiA+ICAJ
c2VxX3ByaW50ZihzLCAiSGludCBDb3VudDogJWRcbiIsIHRhYmxlLmhpbnRfY291bnQpOw0KPiA+
IEBAIC01NzEsNiArNTkxLDkgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZA0KPiBhbWRfcG1j
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gIAlpZiAoZW5hYmxlX3N0YikNCj4gPiAg
CQlhbWRfcG1jX3dyaXRlX3N0YihwZGV2LCBBTURfUE1DX1NUQl9QUkVERUYgKyAxKTsNCj4gPg0K
PiA+ICsJLyogTm90aWZ5IG9uIGZhaWxlZCBlbnRyeSAqLw0KPiA+ICsJYW1kX3BtY192YWxpZGF0
ZV9kZWVwZXN0KHBkZXYpOw0KPiA+ICsNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4NCg==
