Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4036C04A6A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Aug 2023 08:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235138AbjHOIVE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Aug 2023 04:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbjHOIU2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Aug 2023 04:20:28 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F6C21990
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Aug 2023 01:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcbrPVrc4MCs6aa+5FBRCUgiW7ClgtBrSdZ5IImu08bGW+IsMZk5hzZ0Ub5TB5RKHOoIICAElSJOBlT3A4rlPITAzQp7w8YI1CldXrYRA9xIHsTdCw1691TznlkXzvr3DYrTFcUwjXgkGV0nhkHdVzAyQmYm+T/1199Ec84MvYUtcgGj/pYVEYsh+yuHt+NTY8D+f7ug97UuaV77WBScu4cXOVdp8WSl1YbzCDEcaXh+iofcB7z79Xv6kJSD2wghK30nBe2zvUALwmPEO5mqTuzCdFJAfMWYvpgO3aOZUbqkT1c6LAK0ALPHGr3IpqpkDU8+KbGPpEBOrbUwKsZRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bm/9iB64aTTfS9FQ91Q9/NCtWFqMu1fcfusLfxDL7H8=;
 b=Hx/yabGh/Dtg7qW4BrO2USFKxLAab5APICfhPhi8tQgTN/i2xjj2jbLdQmikIap1DPUg1vnBPlRT0Ea9lL5oxWIuRMXfBN2BsjqEK6lkB+J21dWsB3WSpZbSpbrW+SZ+54Ufp+x/2LfxIhUMI1hq4PnoYGcgI/6epSUA+hHPkfhPpuKf4nDEhR8Z2T5GyCUFluXm+T6qck997Jn0zP7TTHA2PsEWgmiQ6etHIvRKn8+0JlBaZxA+pZiisxrFpcSCtcKL9Z1rQ7UQ4Dk5gf+z/rNlpV5MmRwBwvZY2TNhLNl1K+8vpjpRs37kWCYnqOTOKmI5wVRUU0nPWNKMtDdyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm/9iB64aTTfS9FQ91Q9/NCtWFqMu1fcfusLfxDL7H8=;
 b=oOTQgjI/xPWOaMrC4WaxFUFcS1FpjeBdz0mkq3x4bN6PkX+YQizsJ4zggTHUnDfHbDvAc8byWU7wV61mqmSQhYYQOzVge1DLmu9f2Hnh+f82e/fCQq6b2sisg1zAPHJtue+yEeS1MWyjbWMwMi3SbFGPOLJ9in5uFbfH/6HhB39QCzNBX3g8pjCMIBkhySovDWabuMyNykY5G5jHvXkVomViJIXU0y8m49G/635sa97XVhUtpDwJveekZ1iJgtFO8L2D+Ddx8eBaMsEinSxSxQgNyjMR714sjoiabaAJ2SmSG752atFf3E+esf7U207wpnTluMwRRqRKCdQxpO09ng==
Received: from BN9PR12MB5381.namprd12.prod.outlook.com (2603:10b6:408:102::24)
 by DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 08:20:21 +0000
Received: from BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb]) by BN9PR12MB5381.namprd12.prod.outlook.com
 ([fe80::5fa6:31e7:e6fb:3beb%4]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 08:20:21 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>
CC:     "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH platform-next v2 00/16] Add new features and amendments
 for Nvidia systems
Thread-Topic: [PATCH platform-next v2 00/16] Add new features and amendments
 for Nvidia systems
Thread-Index: AQHZzu7BZ4Lf1qukW0+SX5tJvSVk/q/rALcAgAAAf4CAAAI7AIAAATbQ
Date:   Tue, 15 Aug 2023 08:20:20 +0000
Message-ID: <BN9PR12MB538131AECB8E8DCC8F9EA0E2AF14A@BN9PR12MB5381.namprd12.prod.outlook.com>
References: <20230814203406.12399-1-vadimp@nvidia.com>
 <34f2c08b-c07b-b789-487b-615868cde500@redhat.com>
 <BN9PR12MB538136ECEF25054EC6EAE9B1AF14A@BN9PR12MB5381.namprd12.prod.outlook.com>
 <484a6287-d434-95a9-4c9d-af06de5960e6@redhat.com>
In-Reply-To: <484a6287-d434-95a9-4c9d-af06de5960e6@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5381:EE_|DM4PR12MB5311:EE_
x-ms-office365-filtering-correlation-id: 1a0e93b3-1e4d-4264-db38-08db9d687782
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n3eazi+XjJ/b+fXy13zpx2xMjoy/gIsTBpH/i/oyOktqZw/pAU39Dhpk5pBWiAs/mFyaMxeR9UEhA9F7E172E+cCx4moObp/aDCJxidyB0uPFTOts+1a8Qp+AKgYpW84FreKOTBhCwtsrjsgERLCdezGqrfIMovMgHGkfH03/wVR4Hw10xGpBItSaNDMRuNJQDFOgHI6FZzIRt7+q6yi7hdKgzGORsW8skdXd4yMuFbVNq3OJ7xq0LapGz/Cvl2R/5BzKoHbd9lsddpKF9DienlpLRMz/rN0VifotTn0I2A41qwyJI+ricIChYXbwmP7OoYIw2U6W3iEkoCKrTC6XLbpKVXVcMjSMu6fQItQMLoXojhtm+qn1vTsGpGceyy6382pS/mkVTPcQZnqH//eQx6QcCX4xApcda8fbYRy7Upa0/BlZ5unidKl/XGUlL0jN+4CUMEFtKDM7APgr88kp0WK6rOz1BUm2E78ywsqTx4K85ILtgseD/gJdUM2EUXSacNWMmqz6QsbHolfMUNohFClEUk1vM4jdFXZVvlD7El1lQ2CqReDiDLNgS1eRO7tKSm5x5NcS4MRwP1qY/tuvulYP0J5oHq10C5hM6QjaDy1t+TamCD8Y0Bshkce0ayy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5381.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199021)(186006)(1800799006)(9686003)(53546011)(83380400001)(7696005)(6506007)(41300700001)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(6916009)(2906002)(316002)(5660300002)(52536014)(8936002)(8676002)(4326008)(478600001)(71200400001)(55016003)(122000001)(86362001)(33656002)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVVOOUoyWUlSdjBOQkpHS2dPc0hDcjNISmhiWFhpcjE0eVhjQnZma3FrNndK?=
 =?utf-8?B?d0dXMm8zcXNoWlo3Vnk0ZkdLU1JhZHREbnNhZndzTVdNc21WVmdBWjBJeTV5?=
 =?utf-8?B?NU81dHdjdXFpdGtKTHVxTStqNGVnZWcwNWhXMW5oSWEzZzk1MjVLckhncGI1?=
 =?utf-8?B?VnpaVzFYWlB3U0h1TlNReGhKRzNkSWhSanJXaGNQMmVOODJ4QktDWnJ0b3Qy?=
 =?utf-8?B?WWhqWnlJZ2pFR29vcFdTOTVtMUxGSFhEWGFNS0t3RzI5b2tkQkFqbnJnMHEw?=
 =?utf-8?B?ZFczakJWYkt3R2IrRWpPb3ZlVzVLc2ZjMit6MWtqbnFPTUY4ZGh2OEVkZkgz?=
 =?utf-8?B?SWd1NHQ2eEQwdE1LRWNSMmtaRWxVOXR4UmRWa054OWU0d1pGbmU5TDdiRVFD?=
 =?utf-8?B?dzlUckVBbjlOWWo2RjRnWlZIeTRuYlF6Ris5YUNXQktDeXZQU3Z2OTM5emFs?=
 =?utf-8?B?d0NjNDBiS2Q1cWRGaHhPVUJDTFJDK0JYUU14SGJYQ1lqSHBSUHRnUnpBRTAv?=
 =?utf-8?B?cGRyMlpEMm1HZXFDbmNuSHNseFJKbFRYbk1QcmI2SklwZVJ3VkRGOXJ0ckJw?=
 =?utf-8?B?VDd2dS9GcHJNM2RxMWJMajNqVDU3MjhObnFUTFpjaW1QelVmWExUcnpZNXFx?=
 =?utf-8?B?OERJeXpYT0ZpbDZDeUU2ekx6dC9rSk1QcFNsWWtwZ1NlTTBXVzAwalpsSmNn?=
 =?utf-8?B?OUpSaE9BejF0T1F4YnpCL1AxbCtHRTVuU1ZZS1JiV1dQY3p0SWFxc2kxNFIy?=
 =?utf-8?B?MDJGb1AxRWhEd0YydTFzWE9uREdRVFo3K0NCdlhZeXo0aDBsclBSVzJCNmVm?=
 =?utf-8?B?MHI2aHpaN29mZ2N2c2pMWEYzWHJYYk5TZHBlVVd2MGtXbk5PWmlXazJyUjB4?=
 =?utf-8?B?LzVwVFJsaHUvYm5rTzNSMFY4MFl0Vk5OemtKb2ViTUJnbCt0K2VaYXpLSDNM?=
 =?utf-8?B?S1luaVR6V0FXYkRaaW5LUW5TMHRhb0xaOUQ3Tnh0K002bFIzbEN0ZjdrSUZ2?=
 =?utf-8?B?VFFPWkxtSzNKMVdMaXZZNFZyaDVrd2hJUzI1bGVES3F2V3NFdkZzT2YrMXhw?=
 =?utf-8?B?MEcwN0g2alB0c29adnhvZHJVaUd2d01kSVlqQ0Z5OGRIY0ZGNnFqbXFOLzUw?=
 =?utf-8?B?OEVXVUpuZFp0TS9NeityM1YvQTc4RlZMN0RTb2NqcnhQNDhWSmYxaGVSeDlq?=
 =?utf-8?B?aEdFZHpCQ3U2OWt4VkUxemIvTzNkMnhYSzZobVo1OXkrODM3RVFNUk1FQmx6?=
 =?utf-8?B?ZWFUcXpkUWg4enVhU2tLQmhHdGMwY216NmM1T0djRWFlcWdDS0Z5T0pPSEF4?=
 =?utf-8?B?Y3g2d1EyeDNaVDZCT3lrNzZ1emRDSEN4VFd1bktTSFpaYzlSdVp6bWt4djRM?=
 =?utf-8?B?YVdmVFpFNUFXNlBmN2lGYkF0QVhpbElITDgyVmdPcW1qaWJ0bVVzaDg2eXl5?=
 =?utf-8?B?OVl5UzlteDdNV0hYdjhldDRmbEtRbFREMFNGeXhqSE1YR0xGVy9xNk5WZG43?=
 =?utf-8?B?UHZRRkFYb0tPZFQ2RWFQWTNRWXMzWUNSUkZITHNQaFVqTWdWNEwvZUZMcWcz?=
 =?utf-8?B?TWFZaWhlMkgvVUxobWRXNUpZZDV3bitpMFR3RTQrdzBHYUdxRTBzK25rR3VG?=
 =?utf-8?B?UkwzTFFUNDdGNUdOWjlVNGczY3Y1OGUxR09JOG00R3ArWFZzZXk3U0lvM0FE?=
 =?utf-8?B?NUNSMFlwbXRGdjcvcTlmWGY1NytWZ2Y4SkJsd3E4TFQ2eDVXU2ljRUVJZmhV?=
 =?utf-8?B?enRIbk9pSi9NNFVja3FkbFM4Tm9YWEdXdE9meGZvczRkL2VLdTZudklmVTJI?=
 =?utf-8?B?cWpFVVRtZ0JyaGhpYUR3SXJ6ZkI4aURzTlVlaEtLSkxwelFMaUpsUHhTaWV2?=
 =?utf-8?B?eHFDcDZ0SStMczV1RTcvei8zWkMvclhBRWIyeUlueEsvMDlXUlZWNTJsK1Js?=
 =?utf-8?B?R0NVYnI5NlhNMWhxdkVCVHV4OWMxbzl4S05sRUVkRlExTk1PMDRtbTg0N0JF?=
 =?utf-8?B?WXZIcG0xNWdpd1pwNXh5c2FBTzRDN0NpNUgySDUyQkIrUEV6WlJNK3FTZmpE?=
 =?utf-8?B?TTJXN3NxWlBKQVdwYTB4bmZZdjZ1Qks3SWNYUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5381.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0e93b3-1e4d-4264-db38-08db9d687782
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 08:20:20.9795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Kr0sGUOP3qcf1B4475gW0W2YZj+TRQRUzkNZEgQxfEko6YFghPrJEu60dusd/2sPgOp9QDwVid4s7NpXQgVkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5311
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFucyBkZSBHb2VkZSA8
aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgMTUgQXVndXN0IDIwMjMgMTE6
MTYNCj4gVG86IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52aWRpYS5jb20+DQo+IENjOiBpbHBv
LmphcnZpbmVuQGxpbnV4LmludGVsLmNvbTsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5l
bC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBwbGF0Zm9ybS1uZXh0IHYyIDAwLzE2XSBBZGQg
bmV3IGZlYXR1cmVzIGFuZA0KPiBhbWVuZG1lbnRzIGZvciBOdmlkaWEgc3lzdGVtcw0KPiANCj4g
SGksDQo+IA0KPiBPbiA4LzE1LzIzIDEwOjA5LCBWYWRpbSBQYXN0ZXJuYWsgd3JvdGU6DQo+ID4g
SGkgSGFucywNCj4gPg0KPiA+IEkgcHV0IGNoYW5nZWxvZ3MgaW5zaWRlIGVhY2ggcGF0Y2gsIHdo
aWNoIHdhcyBjb21tZW50ZWQgKHYwIC0+IHYyKS4NCj4gPiBXb3VsZCB5b3UgbGlrZSBtZSB0byBw
dXQgaXQgaW4gY292ZXI/DQo+IA0KPiBBaCBJIHNlZSB0aGVtIG5vdywgSSByYW5kb21seSBjaGVj
a2VkIDMgcGF0Y2hlcyBmb3IgdGhhdCBhbmQgZ290IHVubHVja3kuDQo+IA0KPiBOZXh0IHRpbWUg
cGxlYXNlIHB1dCBhdCBsZWFzdCBhIHN1bW1hcnkgb2YgdGhlIENoYW5nZXMgaW4gdGhlIGNvdmVy
LCBlLmcuIGZvcg0KPiB0aGlzIHYyOg0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBBZGRyZXNz
IHJldmlldyBjb21tZW50cyBmcm9tIElscG8sIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMNCj4gICBm
b3IgZGV0YWlscy4NCg0KU3VyZS4NCg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IEhhbnMNCj4gDQo+
IA0KPiANCj4gDQo+IA0KPiANCj4gLQ0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IFZhZGltLg0KPiA+
DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEhhbnMgZGUgR29l
ZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQo+ID4+IFNlbnQ6IFR1ZXNkYXksIDE1IEF1Z3VzdCAy
MDIzIDExOjA2DQo+ID4+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPg0K
PiA+PiBDYzogaWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb207DQo+ID4+IHBsYXRmb3JtLWRy
aXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggcGxhdGZv
cm0tbmV4dCB2MiAwMC8xNl0gQWRkIG5ldyBmZWF0dXJlcyBhbmQNCj4gPj4gYW1lbmRtZW50cyBm
b3IgTnZpZGlhIHN5c3RlbXMNCj4gPj4NCj4gPj4gSGksDQo+ID4+DQo+ID4+IEl0IHdvdWxkIGJl
IG5pY2UgaWYgdGhlcmUgd2FzIGEgY2hhbmdlbG9nIHNvbWV3aGVyZSBpbiB0aGlzIGNvdmVyDQo+
ID4+IGxldHRlciBleHBsYWluaW5nIHdoYXQgaGFzIGNoYW5nZWQgaW4gdjIgPw0KPiA+Pg0KPiA+
PiBSZWdhcmRzLA0KPiA+Pg0KPiA+PiBIYW5zDQo+ID4+DQo+ID4+IE9uIDgvMTQvMjMgMjI6MzMs
IFZhZGltIFBhc3Rlcm5hayB3cm90ZToNCj4gPj4+IFRoZSBwYXRjaCBzZXQ6DQo+ID4+PiAtIFBy
b3ZpZGVzIE5ldyBzeXN0ZW0gYXR0cmlidXRlcyBmb3IgbW9uaXRvcmluZy4NCj4gPj4+IC0gQWRk
cyBzeXN0ZW0gcmVib290IGNhbGxiYWNrIHRvIHBlcmZvcm0gc3lzdGVtIHNwZWNpZmljIG9wZXJh
dGlvbnMuDQo+ID4+PiAtIEFkZHMgc3VwcG9ydCBmb3IgQUNQSSBiYXNlZCBpbml0aWFsaXphdGlv
biBmbG93Lg0KPiA+Pj4gLSBBZGRzIHN1cHBvcnQgZm9yIEZQR0EgZGV2aWNlIGNvbm5lY3RlZCB0
aHJvdWdoIFBDSWUgYnVzLg0KPiA+Pj4gLSBBZGRzIGFkZGl0aW9uYWwgbG9naWMgZm9yIGhvdHBs
dWcgZXZlbnRzIGhhbmRsaW5nLg0KPiA+Pj4gLSBDb250YWlucyBzb21lIGFtZW5kbWVudHMgYW5k
IGNvc21ldGljIGNoYW5nZXMuDQo+ID4+Pg0KPiA+Pj4gVGhlIHBhdGNoIHNldCBpbmNsdWRlczoN
Cj4gPj4+IFBhdGNoZXMgIzEgLSAjMywgIzU6IGFkZCBuZXcgYXR0cmlidXRlcyBmb3IgbW9uaXRv
cmluZy4NCj4gPj4+IFBhdGNoICM0OiBzZXRzIGhvdHBsdWcgZXZlbnQgYWN0aW9uIGZvciBoZWFs
dGggYW5kIHBvd2VyIHNpZ25hbHMuDQo+ID4+PiBQYXRjaCAjNjogYWRkcyBDUExEIHZlcnNpb25p
bmcgcmVnaXN0ZXJzIGZvciBzeXN0ZW1zIGVxdWlwcGVkIHdpdGggZml2ZQ0KPiA+Pj4gCSAgQ1BM
RCBkZXZpY2VzLg0KPiA+Pj4gUGF0Y2ggIzc6IG1vZGlmaWVzIHBvd2VyIG9mZiBjYWxsYmFjay4N
Cj4gPj4+IFBhdGNoICM4OiBjb3NtZXRpYyBjaGFuZ2VzIC0gZml4ZXMgbWlzc3BlbGxpbmcuDQo+
ID4+PiBQYXRjaCAjOTogcHJvdmlkZXMgc3lzdGVtIHJlYm9vdCBjYWxsYmFjayB0aHJvdWdoIHN5
c3RlbSByZWJvb3QNCj4gPj4+IAkgIG5vdGlmaWVyLg0KPiA+Pj4gUGF0Y2ggIzEwOiBwcmVwYXJl
cyBkcml2ZXIgdG8gYWxsb3cgcHJvYmluZyB0aHJvdWdoIEFDUEkgaG9va3MgYWxvbmcNCj4gPj4+
IAkgICB3aXRoIHByb2JpbmcgdGhyb3VnaCBETUkgaG9va3MuDQo+ID4+PiBQYXRjaCAjMTE6IGFk
ZHMgQUNQSSBtYXRjaCBob29rIGZvciBpbml0aWFsaXphdGlvbiBmbG93Lg0KPiA+Pj4gUGF0Y2gg
IzEyOiBhZGRzIHN1cHBvcnQgZm9yIGdldHRpbmcgc3lzdGVtIGludGVycnVwdCBsaW5lIGZyb20g
QUNQSQ0KPiA+Pj4gCSAgIHRhYmxlLg0KPiA+Pj4gUGF0Y2ggIzEzOiBhZGRzIGluaXRpYWwgc3Vw
cG9ydCBmb3IgcHJvZ3JhbW1pbmcgbG9naWMgZGV2aWNlIGNvbm5lY3RlZA0KPiA+Pj4gCSAgIHRo
cm91Z2ggUENJZS4NCj4gPj4+IFBhdGNoICMxNDogRXh0ZW5kcyBjb25kaXRpb24gZm9yIG5vdGlm
aWNhdGlvbiBjYWxsYmFjayBwcm9jZXNzaW5nLg0KPiA+Pj4gUGF0Y2ggIzE1OiBkZWZpbmVzIHRo
ZSBleGFjdCBpMmMgYnVzIG9mIGZhbnMgb24gdGhlIFNOMjIwMSBzeXN0ZW0uDQo+ID4+PiBQYXRj
aCAjMTY6IERvY3VtZW50cyBuZXcgYXR0cmlidXRlcy4NCj4gPj4+DQo+ID4+PiBNaWNoYWVsIFNo
eWNoICgxKToNCj4gPj4+ICAgcGxhdGZvcm06IG1lbGxhbm94OiBudnN3LXNuMjIwMTogY2hhbmdl
IGZhbnMgaTJjIGJ1c3Nlcy4NCj4gPj4+DQo+ID4+PiBWYWRpbSBQYXN0ZXJuYWsgKDE1KToNCj4g
Pj4+ICAgcGxhdGZvcm06IG1lbGxhbm94OiBBZGQgbmV3IGF0dHJpYnV0ZXMNCj4gPj4+ICAgcGxh
dGZvcm06IG1lbGxhbm94OiBBZGQgZmllbGQgdXBncmFkZSBjYXBhYmlsaXR5IHJlZ2lzdGVyDQo+
ID4+PiAgIHBsYXRmb3JtOiBtZWxsYW5veDogTW9kaWZ5IHJlc2V0IGNhdXNlcyBkZXNjcmlwdGlv
bg0KPiA+Pj4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9ybTogTW9kaWZ5IGhlYWx0
aCBhbmQgcG93ZXIgaG90cGx1Zw0KPiA+Pj4gICAgIGFjdGlvbg0KPiA+Pj4gICBwbGF0Zm9ybTog
bWVsbGFub3g6IG1seC1wbGF0Zm9ybTogQWRkIHJlc2V0IGNhdXNlIGF0dHJpYnV0ZQ0KPiA+Pj4g
ICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9ybTogYWRkIHN1cHBvcnQgZm9yIGFkZGl0
aW9uYWwgQ1BMRA0KPiA+Pj4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9ybTogTW9k
aWZ5IHBvd2VyIG9mZiBjYWxsYmFjaw0KPiA+Pj4gICBwbGF0Zm9ybTogbWVsbGFub3g6IENvc21l
dGljIGNoYW5nZXMNCj4gPj4+ICAgcGxhdGZvcm06IG1lbGxhbm94OiBtbHgtcGxhdGZvcm06IEFk
ZCByZXNldCBjYWxsYmFjaw0KPiA+Pj4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9y
bTogUHJlcGFyZSBkcml2ZXIgdG8gYWxsb3cgcHJvYmluZw0KPiA+Pj4gICAgIHRocm91Z2ggQUNQ
SSBpbmZyYXN0cnVjdHVyZQ0KPiA+Pj4gICBwbGF0Zm9ybTogbWVsbGFub3g6IG1seC1wbGF0Zm9y
bTogSW50cm9kdWNlIEFDUEkgaW5pdCBmbG93DQo+ID4+PiAgIHBsYXRmb3JtOiBtZWxsYW5veDog
bWx4LXBsYXRmb3JtOiBHZXQgaW50ZXJydXB0IGxpbmUgdGhyb3VnaCBBQ1BJDQo+ID4+PiAgIHBs
YXRmb3JtOiBtZWxsYW5veDogQWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgUENJZSBiYXNlZCBwcm9n
cmFtbWluZw0KPiA+Pj4gICAgIGxvZ2ljIGRldmljZQ0KPiA+Pj4gICBwbGF0Zm9ybS9tZWxsYW5v
eDogbWx4cmVnLWhvdHBsdWc6IEV4dGVuZCBjb25kaXRpb24gZm9yIG5vdGlmaWNhdGlvbg0KPiA+
Pj4gICAgIGNhbGxiYWNrIHByb2Nlc3NpbmcNCj4gPj4+ICAgRG9jdW1lbnRhdGlvbi9BQkk6IEFk
ZCBuZXcgYXR0cmlidXRlIGZvciBtbHhyZWctaW8gc3lzZnMNCj4gPj4+IGludGVyZmFjZXMNCj4g
Pj4+DQo+ID4+PiAgLi4uL0FCSS9zdGFibGUvc3lzZnMtZHJpdmVyLW1seHJlZy1pbyAgICAgICAg
IHwgIDQyICsrDQo+ID4+PiAgZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90cGx1
Zy5jICAgIHwgICAyICstDQo+ID4+PiAgZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9udnN3LXNu
MjIwMS5jICAgICAgIHwgIDEyICstDQo+ID4+PiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvbWx4LXBs
YXRmb3JtLmMgICAgICAgICAgIHwgMzc2ICsrKysrKysrKysrKysrKystLQ0KPiA+Pj4gIDQgZmls
ZXMgY2hhbmdlZCwgMzgzIGluc2VydGlvbnMoKyksIDQ5IGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4g
Pg0KDQo=
