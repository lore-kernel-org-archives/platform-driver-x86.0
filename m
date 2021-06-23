Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7757BC4743C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 14:12:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 593AB6023E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 14:12:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhFWOOj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 10:14:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:64260 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231187AbhFWOOj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 10:14:39 -0400
IronPort-SDR: ronEJaA0S1eAZNyzlN2HdNeDV/GBWOp3yU+XBGBr3GVb3XUGr0vAqRgLcY8MuAiO/EmPdlbUAj
 6OmMppdOk8gw==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="228841468"
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; 
   d="scan'208";a="228841468"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 07:12:21 -0700
IronPort-SDR: lN0uaY+nxjDnmnLPbCH6yydjfv72F8uHabzY42RbdN10PSX9/IPVHvAIonCzNi9kFL3Y63UP46
 jsNYWelxVgBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; 
   d="scan'208";a="481159836"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jun 2021 07:12:21 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 07:12:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 07:12:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 23 Jun 2021 07:12:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 23 Jun 2021 07:12:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1yIq5WdRp8/3KWjDQev231AOGss5Xfda35TgwLk/s3DImrlzpMg56NLbgKzsURwM+SakYxijPH6ZbymQ6hMtfLt7WEJZVTDE1KH51LbFAaoUOXCp0uZWVxYQ5uje27au7dZPG40WwcPR6/R0AzdXoVeubKIN3+UQiE3D0Bqk7hJpfCitysY+ut5G5MpLizc2nbaAzU59NcxA7o8of2msbyI/baUO4sJSJ1gNjQlo3WMwTCEHgSoR5oJ0TkZwuXYhbmEZXlBiv9q5VTAp8qWNts1jQAyRjREvJN8fKeEpKRErLguLy34Kmm2BQIr8Zr3QkbzuqsxQlgrJhrCXh+2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfS92nGeSbmAh2KeGf0WzvI5FN8iWMr3KxUogTCUJI0=;
 b=HtIhT03tS76iewsYwI7iEIYdYT+UgXDEqXYXrG+TYsIjaUsJrSPqzjM37zV6UeEetGupyZXTkefeQfnulxDJ13kCl/oqMDZusTPNAuRhKb1y92doGVNqSszOL3KN0baUSIGIJ8clj9SiI6TSI/dKurzEiiopT/j665J4lrZLYj2AzaPP9RPuB/HjDdTPIDnXGwooEWtwN6dwih+bwJEH/RbxRu5anm1Qg7hxwYy+lI4p52Q9G3OfYH61RkQ+rlgEh36zL1tNSq1T01ZmnxaOKME336nHp39RleFWkmsvVBl8EZz920rQCNtfP0CMxhdU8/bczHAS5nJAzBhC4aT2zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfS92nGeSbmAh2KeGf0WzvI5FN8iWMr3KxUogTCUJI0=;
 b=Crq8Kn+J6A8xJ3H9mT4K2r3qtzmaXzaHfvYDYX5yJGvNenNhGV1GjUjQqy2W/x0NlpE3mmGL8ZW+KiLzGTh+I0ASDlah4IAwVQValuurehJ3kImuz+SOROWGvugvi+NTKGpFrW1Nisla6hb6LRl+k/MwGg6Iky5EjyCh2wYqhjg=
Received: from MWHPR11MB1455.namprd11.prod.outlook.com (2603:10b6:301:9::22)
 by CO1PR11MB4850.namprd11.prod.outlook.com (2603:10b6:303:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 14:12:17 +0000
Received: from MWHPR11MB1455.namprd11.prod.outlook.com
 ([fe80::1ce1:6055:85e9:8c15]) by MWHPR11MB1455.namprd11.prod.outlook.com
 ([fe80::1ce1:6055:85e9:8c15%11]) with mapi id 15.20.4264.019; Wed, 23 Jun
 2021 14:12:17 +0000
From:   "Shravan, S" <s.shravan@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
CC:     "An, Sudhakar" <sudhakar.an@intel.com>
Subject: RE: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
Thread-Topic: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
Thread-Index: AQHXY4UJeNOuLV2+ZEGiRU0i34+lPasYRToAgAlmhqA=
Date:   Wed, 23 Jun 2021 14:12:16 +0000
Message-ID: <MWHPR11MB14558B1E81705599C74239E5E3089@MWHPR11MB1455.namprd11.prod.outlook.com>
References: <20210428032224.8299-1-s.shravan@intel.com>
 <ab991a6d-e973-9e16-8e8c-382c27f41368@redhat.com>
 <375f3643-de21-3c71-3041-86d9b54f5d3c@redhat.com>
In-Reply-To: <375f3643-de21-3c71-3041-86d9b54f5d3c@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [49.207.224.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f67e52b-c0c1-4b0c-e0ea-08d93650e832
x-ms-traffictypediagnostic: CO1PR11MB4850:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB48505D46F8B18F6DD6957B75E3089@CO1PR11MB4850.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n4LkKQysKK8THdsSI7C12fQEQeU7pAsX4Ud2XWEuo72dNr+CQfYC/8vDNOtIhESHGFPa/dDA6JgC75NVNl9jPQtUO0xWnRkYXjrSbh1eWN6a4NiMANwnnL0vCY3faBLO6uE+fm9mTL+Sodtg2AIK9m87RMfOvypKUoqKL2TIwgXWRUN64ZDDV45vhKDlszqPBGXejWlYOwzuxbCWvCMJTnGDKQn6xukMSRmEjFjkYS2mdkFHz+3tn8Ts4Ny2NvqkRzVW7dZqRCPG9Tt5Ymu0BO+Sqj5WTyqPCKKs3bMfD7mUK7jMmmbXd3OSq2+LNA+v3YU91Atc9GPLx26l4YRipJFoMYvQDdqvhjqjbVhomL1rsRziMFOoIOQba11e5/1IxqKYmu3RtGaSfGg/LNmeTvaeDM9PIi+dwsbx+VWtxKJ1y9Do3/adfm35iTHuFU9NtGsdJA8eItajOcP144MKfagW++xYExHqYTFkkjLJwCv/MZ5TYsbWuWrjskWZtYYaZP6JcekwU1vlv3QtiQvix4CGcOrcZRIJ7lpWDQ/mf1gm84rbIg0TivoSY2qK7o7cTgRtDnl696Th+/8xFN8ywj0GAcNjjGvgp+u5bJPEWlM366OWFUGwX7U2OyQthyNxS+em2uNiQheqfpdV9zMmVPSQgdqJfs+7TVkl4OqxjdHyq5DcBxSoN/n3YWX1MwDlIMN8b2gdpz2LQ/hpSBSuHf70PKrTajwAiK4MQQgZey0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1455.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(39850400004)(346002)(366004)(76116006)(66556008)(26005)(8676002)(66476007)(316002)(38100700002)(55016002)(8936002)(9686003)(4326008)(186003)(86362001)(66946007)(7696005)(33656002)(66446008)(110136005)(122000001)(64756008)(478600001)(83380400001)(2906002)(52536014)(966005)(5660300002)(6506007)(53546011)(55236004)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlpSNmtTQ3g4eHI1TXB4T2szMUFmazR3Rk81bytGQ2lGdUgzM3luVUc5a0Yw?=
 =?utf-8?B?c21lbVc3a1plSERHYXpUbE82Y2g1RVBqVThZYW1vZmMzUS9hcDJMWXNlSW52?=
 =?utf-8?B?c0l4Q2NMVXM0MnZkdFVzTzB2NkdRa0FjWnRMS1RIS2k5ZTFEM25UZmQvSVpx?=
 =?utf-8?B?eENncnRUOTRaaXd3a1YzNDcydWFnZXV6UHVWN1d4TUJYYXYzSlhHY2ljRFRE?=
 =?utf-8?B?V3h2QjMwYW5xNUdaNGJISC9nZkpJOEwwaWJnZzFXdUxCUndtUUhnYWV1MWlZ?=
 =?utf-8?B?cGYwVlp4bEx1TEh1RzJUcjFKTGhVaE5FK1BBUGxyOTlWNUtmNnQxM21yRFc4?=
 =?utf-8?B?emVXY0lhbzFLQWdBUmZFSUVMNnoyNEFoZW00TTBLbWZWNk1CQldMUjdzZ2pL?=
 =?utf-8?B?WjlYcEUvcVB3WFhuMXlEL3lIVG5IbGdFQTQramhUd2pqekpyVjZ2V3ZuRkh3?=
 =?utf-8?B?SkxCd2lYcmRGRDBYaGtERXh1L1VVSGhiZ3dwWi9EcFlid3A5THZBNGFtUjNj?=
 =?utf-8?B?VDc3aWpuMkpvTEhhUzVpMFNWdkZPb0h0SkRENjFoMUxkM2lNMlN6b01Vd2JB?=
 =?utf-8?B?L01INVBiRCtSb0ozdTZpT3pUakRDTkcwNkdYUTJWN3huaWowUjF6MUY4ZHQx?=
 =?utf-8?B?dnZ5YTV5dVJ0WU5lUWhYV1VDYXFGSVN3cTF6RWFWeXJ3NEdMUW1SbHRyaURM?=
 =?utf-8?B?TDdlem03U0gyMExVSHlwMGJrSUEzcXA3OC90MUZ5WHlpQU1CY2R5cEtSMFg0?=
 =?utf-8?B?cmlVd1RudHpLc3QwUmNKa2FIQkFFaFQ5VDV4SWxWLzk0NlkvdWQ0dWYxamto?=
 =?utf-8?B?NjRzblFENGRQSy9zNGdnb2xRQkRvSjdiU2o1U1M1ZEUxZmJITmg5cE5SanRX?=
 =?utf-8?B?WE84bWJBUFF2dGtvZnh1SnBJd09scjZ2MzJrM1VCTzNVNkg2aFlqL0p5b21C?=
 =?utf-8?B?VC9UVExpQXdLTlJMNG50OVBSVzIyYVZZalllaU95MXdjK0ZmSDN5UUlBOHVR?=
 =?utf-8?B?TFVIR0ZobnBuMFBjQmpkdUVEUkRyMEpzT3kzTzc2SnFYQ2w0Nk42dkc5UXhP?=
 =?utf-8?B?VE4veGNjWVBKUGxINWlsVng1b0lqQUtCRFhDY1l5cEdYVWVKNXlrYklxMXZ1?=
 =?utf-8?B?ZUpJdTY4OCtOM21sNkdtVEEzc1UxbStqWGJJWlBqbnlIdkdNeC9CT3F3NHpP?=
 =?utf-8?B?MjQyekxURkdTc2d2c1FHYWhvL2dqcFRWdUlCQ3NvWXZuZFVWMjhoaXhIMU1Z?=
 =?utf-8?B?bUUyY2hjZEVjMi8xcHRxSDN4aGdoZHNLMXNoaGwyaFVCSERkVStISXlqWmFy?=
 =?utf-8?B?eVptL1R0SGVGUXZZZEVMUWZDa2xwSFp5T1ZSNVRuWnRKZUx5S0NlYTN0RWJu?=
 =?utf-8?B?d2huNklPWjJicXlxcUYxL2tpTzVic1dIMHZxWFNPVE9hdTV1MXJnN3h2ZzJL?=
 =?utf-8?B?SFNMM1VTRGZaWkdQelVnOUtDU05yYU10WDB0UTNWL1FRWk9IMHJoSWxGK2Zz?=
 =?utf-8?B?b2ZHYWd0ZjBiYVRSdER2TVYrSHErRHhaWEF6VDVDK1BMdVNpSVIxR3FxQ1J0?=
 =?utf-8?B?UkdrL29pZUh0L1lwQnhlQWRWcVpJZ1VqRXpwalRESE9BZStjVzlETGJJQ2Er?=
 =?utf-8?B?VWZPalJCY1JIdDVOWU9nUU5wc0lMMVUzSGJ5TEdZb1pibm1hQ0ttRUhSVzVY?=
 =?utf-8?B?UWV0U2ljMENwUHVqeUxvaXFUbUNlNWEzWmltdE9ZeVVvUEZZT0l5emo1QVoz?=
 =?utf-8?Q?EufkzaiCSM1jir5w9N98GSnGOZAeUItiY2C/f/Q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1455.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f67e52b-c0c1-4b0c-e0ea-08d93650e832
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 14:12:16.9468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KtQyk/Xvsbn6efMFs2L833NFXc96VVMJ009iqujP5nyriJGZr26uuQu+c/jvNXs5jJt8vuUoE950JIiJB+RjwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4850
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGksDQoNClRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLiBSZXNwb25zZXMgSW5saW5lLg0KDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSGFucyBkZSBHb2VkZSA8aGRlZ29l
ZGVAcmVkaGF0LmNvbT4gDQo+U2VudDogVGh1cnNkYXksIEp1bmUgMTcsIDIwMjEgODowNiBQTQ0K
PlRvOiBTaHJhdmFuLCBTIDxzLnNocmF2YW5AaW50ZWwuY29tPjsgbWdyb3NzQGxpbnV4LmludGVs
LmNvbTsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmcNCj5DYzogQW4sIFN1ZGhh
a2FyIDxzdWRoYWthci5hbkBpbnRlbC5jb20+DQo+U3ViamVjdDogUmU6IFtQQVRDSCAwLzFdIFt4
ODZdIEJJT1MgU0FSIERyaXZlciBmb3IgTS4yIEludGVsIE1vZGVtcw0KPg0KPkhpLA0KPg0KPk9u
IDYvMTcvMjEgNDoyOCBQTSwgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4+IEhpIFNocmF2YW4sDQo+
PiANCj4+IE9uIDQvMjgvMjEgNToyMiBBTSwgU2hyYXZhbiBTIHdyb3RlOg0KPj4+IFNBUiAoU3Bl
Y2lmaWMgQWJzb3JwdGlvbiBSYXRlKSBkcml2ZXIgaXMgYSBob3N0IGRyaXZlciBpbXBsZW1lbnRl
ZCANCj4+PiBmb3IgTGludXggb3IgY2hyb21lIHBsYXRmb3JtIHRvIGxpbWl0IHRoZSBleHBvc3Vy
ZSBvZiBodW1hbiBib2R5IHRvIA0KPj4+IFJGIGZyZXF1ZW5jeSBieSBpbmZvcm1pbmcgdGhlIElu
dGVsIE0uMiBtb2RlbSB0byByZWd1bGF0ZSB0aGUgUkYgDQo+Pj4gcG93ZXIgYmFzZWQgb24gU0FS
IGRhdGEgb2J0YWluZWQgZnJvbSB0aGUgc2Vuc29ycyBjYXB0dXJlZCBpbiB0aGUgDQo+Pj4gQklP
Uy4gQUNQSSBpbnRlcmZhY2UgZXhwb3NlcyB0aGlzIGRhdGEgZnJvbSB0aGUgQklPUyB0byBTQVIg
ZHJpdmVyLiANCj4+PiBUaGUgZnJvbnQgZW5kIGFwcGxpY2F0aW9uIGluIHVzZXJzcGFjZSAoIGVn
OiBNb2RlbSBNYW5hZ2VyKSB3aWxsIA0KPj4+IGludGVyYWN0IHdpdGggU0FSIGRyaXZlciB0byBv
YnRhaW4gaW5mb3JtYXRpb24gbGlrZSB0aGUgZGV2aWNlIG1vZGUgDQo+Pj4gKEV4YW1wbGU6IHRh
YmxldHMsIGxhcHRvcHMsIGV0eCksIEFudGVubmEgaW5kZXgsIGJhc2ViYW5kIGluZGV4LCBTQVIg
dGFibGUgaW5kZXggYW5kIHVzZSBhdmFpbGFibGUgY29tbXVuaWNhdGlvbiBsaWtlIE1CSU0gaW50
ZXJmYWNlIHRvIGVuYWJsZSBkYXRhIGNvbW11bmljYXRpb24gdG8gbW9kZW0gZm9yIFJGIHBvd2Vy
IHJlZ3VsYXRpb24uDQo+Pj4NCj4+PiBUaGUgQklPUyBnZXRzIG5vdGlmaWVkIGFib3V0IGRldmlj
ZSBtb2RlIGNoYW5nZXMgdGhyb3VnaCBTZW5zb3IgDQo+Pj4gRHJpdmVyLiBUaGlzIGluZm9ybWF0
aW9uIGlzIGdpdmVuIHRvIGEgKG5ld2x5IGNyZWF0ZWQpIFdXQU4gQUNQSSBmdW5jdGlvbiBkcml2
ZXIgd2hlbiB0aGVyZSBpcyBhIGRldmljZSBtb2RlIGNoYW5nZS4NCj4+PiBUaGUgZHJpdmVyIHRo
ZW4gdXNlcyBhIF9EU00gbWV0aG9kIHRvIHJldHJpZXZlIHRoZSByZXF1aXJlZCBpbmZvcm1hdGlv
biBmcm9tIEJJT1MuIA0KPj4+IFRoaXMgaW5mb3JtYXRpb24gaXMgdGhlbiBmb3J3YXJkZWQvbXVs
dGljYXN0IHRvIHRoZSBVc2VyLXNwYWNlIHVzaW5nIHRoZSBORVRMSU5LIGludGVyZmFjZS4NCj4+
PiBBIGxvb2t1cCB0YWJsZSBpcyBtYWludGFpbmVkIGluc2lkZSB0aGUgQklPUyB3aGljaCBzdWdn
ZXN0cyB0aGUgU0FSIA0KPj4+IFRhYmxlIGluZGV4IGFuZCBBbnRlbm5hIFR1bmVyIFRhYmxlIElu
ZGV4IHZhbHVlcyBmb3IgaW5kaXZpZHVhbCBkZXZpY2UgbW9kZXMuDQo+Pj4NCj4+PiBUaGUgU0FS
IHBhcmFtZXRlcnMgdG8gYmUgdXNlZCBvbiB0aGUgTW9kZW0gZGlmZmVycyBmb3IgZWFjaCBSZWd1
bGF0b3J5IE1vZGUgbGlrZSBGQ0MsIENFIGFuZCBJU0VELg0KPj4+IEhlbmNlLCB0aGUgU0FSIHBh
cmFtZXRlcnMgYXJlIHN0b3JlZCBzZXBhcmF0ZWx5IGluIHRoZSBTTUJJT1MgdGFibGUgDQo+Pj4g
aW4gdGhlIE9FTSBCSU9TLCBmb3IgZWFjaCBvZiB0aGUgUmVndWxhdG9yeSBtb2RlLiBSZWd1bGF0
b3J5IG1vZGVzIA0KPj4+IHdpbGwgYmUgZGlmZmVyZW50IGJhc2VkIG9uIHRoZSByZWdpb24gYW5k
IG5ldHdvcmsgYXZhaWxhYmxlIGluIHRoYXQgcmVnaW9uLg0KPj4gDQo+PiBJZiBJJ20gcmVhZGlu
ZyB0aGUgYWJvdmUgY29ycmVjdCB0aGVuIHRoaXMgY29kZSBpcyByZWFsbHkgZG9pbmcgMiANCj4+
IHRoaW5ncyBpbiAxIGRyaXZlcjoNCj4+IA0KPj4gMS4gTGlzdGVuaW5nIHRvIHNvbWUgc2Vuc29y
cywgd2hpY2ggcmVhZGluZ3MgbWF5IGltcGFjdCB0aGUgbWF4aW11bSANCj4+IGFtb3VudCBvZiB0
eCBwb3dlciB3aGljaCB0aGUgbW9kZW0gbWF5IHVzZS4gV2hhdCBraW5kIG9mIHNlbnNvcnMgYXJl
IHRoZXNlID8NCj4+IEN1cnJlbnRseSBjaHJvbWUtb3MgYmFzZWQgZGV2aWNlcyBhcmUgdXNpbmcg
aWlvIGZvciBwcm94aW1pdHkgc2Vuc29ycywgDQo+PiB3aXRoIHNwZWNpZmljIGxhYmVscyBhZGRl
ZCB0byBlYWNoIHNlbnNvciB0byB0ZWxsIHVzZXJzcGFjZSB0aGF0IHRoZXkgDQo+PiBpbmRpY2F0
ZSBhIGh1bWFuIGlzIGNsb3NlIHRvIG9uZSBvZiB0aGUgYW50ZW5uYXM6DQo+PiANCj4+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC9jb20NCj4+IG1pdC9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWJ1cy1paW8/
aWQ9NjUwNWRmYWIzM2M1MTkzNjhlNTRhZTcNCj4+IGYzZWExYmY0ZDk5MTZmZGM1DQo+PiANCj4+
IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIHVzZSB0aGlzIHN0YW5kYXJkaXplZCB1c2Vyc3BhY2Ug
aW50ZXJmYWNlIGZvciANCj4+IHlvdXIgdXNlIGNhc2UgPw0KDQpbU2hyYXZhbl0gUHJveGltaXR5
IHNlbnNvcnMgY2FuIHdvcmsgaW4gc2NlbmFyaW9zIHdoZXJlIHRoZXJlIGlzIG5vIG90aGVyIHNv
dXJjZXMgb2YgaW5mb3JtYXRpb24gd2hpY2ggY2FuIGFsdGVyIHRoZSBzYXIgaGFuZGxpbmcuDQpP
RU1zIGhhdmUgZ2l2ZW4gZmVlZGJhY2sgdGhhdCB0aGUgZGV2aWNlIG1vZGUgKHRhYmxldCBtb2Rl
L2xhcHRvcCBtb2RlL2NsYW1zaGVsbCBldGMpIGFsc28gcGxheSBhIHBhcnQgaW4gU0FSIGhhbmRs
aW5nLiBIZW5jZSB0aGlzDQpoYXMgdG8gYmUgYWdncmVnYXRlZCB3aXRoIHRoZSBwcm94aW1pdHkg
c2Vuc29yIGluZm9ybWF0aW9uLiBBbHNvIHN1Y2ggYW4gYWdncmVnYXRpb24gaXMgc3BlY2lmaWMg
dG8gZ2l2ZW4gaG9zdCBwbGF0Zm9ybS4gQXMgYSBjb25zZXF1ZW5jZSwNCnRoaXMgaXMgYmVzdCBy
ZWFsaXplZCB3aXRoaW4gYW4gZW50aXR5IGxpa2UgZW1iZWRkZWQgY29udHJvbGxlciBhdmFpbGFi
bGUgb24gdGhlIGhvc3QgcGxhdGZvcm0uIFRoaXMgbmV3IGRyaXZlciBleHBvc2VzIHN1Y2ggYWdn
cmVnYXRlZCBTQVINCnBhcmFtZXRlcnMgdGhhdCBuZWVkcyB0byBiZSBjb25maWd1cmVkIG9uIHNw
ZWNpZmljIFJGIGRldmljZS4NCg0KPj4gDQo+PiAyLiBFeHBvcnRpbmcgYSB0YWJsZSB3aXRoIHZh
cmlvdXMgaW5mb3JtYXRpb24gZnJvbSB0aGUgQklPUyB0YWJsZXMgdG8gDQo+PiB1c2Vyc3BhY2Uu
IFdlIGRvIHByb2JhYmx5IG5lZWQgYSBuZXcgdXNlcnNwYWNlIEFQSSBmb3IgdGhpcywgYnV0IEkn
bSANCj4+IG5vdCBzdXJlIG5ldGxpbmsgaXMgdGhlIHJpZ2h0IGFuc3dlciBoZXJlLg0KPj4gDQo+
PiBNYXliZSBqdXN0IHVzZSBhIGJpbmFyeSBzeXNmcyBhdHRyaWJ1dGUgdW5kZXINCj4+IC9zeXMv
YnVzL3BsYXRmb3JtL2RldmljZXMvSU5UQzEwOTI6MDAgPw0KPj4gVGhhdCB3aWxsIG1ha2UgdGhl
IGludGVyZmFjZSBub24tZ2VuZXJpYywgYnV0IEkgYXNzdW1lIHRoYXQgdGhlIHRhYmxlIA0KPj4g
Y29udGVudHMgYXJlIGdvaW5nIHRvIGJlIEludGVsIHNwZWNpZmljIGFueXdheXMgc28gdGhhdCBz
aG91bGQgYmUgDQo+PiBmaW5lLiBUaGlzIHdpbGwgYWxzbyBhbGxvdyBzaW1wbHkgZXhwb3J0aW5n
IHRoZSB0YWJsZSB3aXRob3V0IHRoZSANCj4+IGtlcm5lbCBuZWVkaW5nIHRvIHBhcnNlIGl0Lg0K
Pj4gDQo+PiBVc2luZyBuZXRsaW5rIGlzIGhpZ2hseSB1bnVzdWFsIGZvciBhIGRyaXZlciBsaXZp
bmcgdW5kZXIgDQo+PiBwbGF0Zm9ybS9kcml2ZXJzL3g4NjsgYW5kIGlmIHlvdSByZWFsbHkgd2Fu
dCB0byB1c2UgbmV0bGluayBmb3IgdGhpcyANCj4+IHRoZW4geW91IHNob3VsZCBmaXJzdCBkZWZp
bmUgYSBnZW5lcmljIHByb3RvY29sIHdoaWNoIGlzIGFsc28gZ29pbmcgdG8gDQo+PiB3b3JrIGZv
ciBvdGhlciB2ZW5kb3JzJyBtb2RlbXMsIHdoaWNoIGlzIGltcG9zc2libGUgQVRNIGJlY2F1c2Ug
d2UgDQo+PiBkb24ndCBrbm93IHlldCB3aGF0IG90aGVyIHZlbmRvcidzIG1vZGVtcyB3aWxsIG5l
ZWQuLi4NCg0KW1NocmF2YW5dIEFzIHBlciB5b3VyIHN1Z2dlc3Rpb24gd2UgYXJlIHN3aXRjaGlu
ZyB0byB0aGUgc3lzZnMgaW50ZXJmYWNlIHRvIGV4cG9zZSB0aGlzIGluZm9ybWF0aW9uLg0KV2Ug
aGF2ZSByZXdvcmtlZCB0aGUgZHJpdmVyIGltcGxlbWV0YXRpb24gd2l0aCB0aGUgbGF0ZXN0IHBh
dGNoIHRvIHJlbW92ZSB0aGUgdXNhZ2Ugb2YgbmV0bGluayB3aGljaCBzaG91bGQgYWRkcmVzcyB0
aGlzIGNvbmNlcm4uDQpQbGVhc2UgZG8gaGF2ZSBhIGxvb2sgYXQgdGhlIGxhdGVzdCBwYXRjaCB0
byBjb25maXJtIHRoZSBzYW1lLg0KDQo+U29tZSBtb3JlIHJlbWFya3MgZnJvbSBhIHF1aWNrIGxv
b2sgYXQgdGhlIGNvZGUsIEkgc2VlIHRoYXQgYmVzaWRlcyBhIG5ldGxpbmsgaW50ZXJmYWNlIHlv
dSBhcmUgYWxzbyBjcmVhdGluZyBhIGNoYXJkZXYgYW5kIGRvaW5nIGlvY3RscyBvbiB0aGF0Lg0K
PlRoYXQgaXMgcmVhbGx5IG5vdCBnb29kLCBpdCBzZWVtcyB0aGF0IHRoZSB1c2Vyc3BhY2UgQVBJ
IGZvciB0aGlzIG5lZWRzIHRvIGJlIGNvbXBsZXRlbHkgcmVkZXNpZ25lZC4gVXNpbmcgYm90aCBu
ZXRsaW5rIGFuZCBpb2N0bHMgYXQgdGhlIHNhbWUgdGltZSBub3QgYWNjZXB0YWJsZS4NCg0KW1No
cmF2YW5dIFdpdGggdGhlIGxhdGVzdCBwYXRjaCB3ZSBoYXZlIHJlbW92ZWQgdGhlIElPQ1RMIGlu
dGVyZmFjZSBhbmQgc3dpdGNoZWQgdG8gc3lzZnMgbW9kZSBvZiBjb21tdW5pY3RhaW9uIHRvIGFu
ZCBmcm9tIHVzZXJzcGFjZS4NCg0KPkFsc28geW91IHNlZW0gdG8gY3JlYXRlIHRoZSBjaGFyZGV2
IGFuZCBuZXRsaW5rIGFuZCBtb2R1bGUtbG9hZCB0aW1lLCByYXRoZXIgdGhlbiBmcm9tIHRoZSBz
YXJfYWRkKCkgcHJvYmUgZnVuY3Rpb24uIFdoaWNoIG1lYW5zIHRoYXQgdGhleSB3aWxsIGFsc28g
YmUgY3JlYXRlZCBvbiBsYXB0b3BzIHdoaWNoIGRvbid0IGhhdmUgYW4gSU5UQzEwOTIgQUNQSSBk
ZXZpY2UgYXQgYWxsLCBhZ2FpbiBub3QgZ29vZC4NCj5QbGVhc2UgZHJvcCB0aGUgc2FyX2luaXQo
KSBhbmQgc2FyX2V4aXQoKSBmdW5jdGlvbnMgYW5kIHVzZSBtb2R1bGVfcGxhdGZvcm1fZHJpdmVy
IHRvIGhhdmUgbW9kdWxlX2luaXQgLyBleGl0IHJlZ2lzdGVyIC8gdW5yZWdpc3RlciB0aGUgZHJp
dmVyIGFuZCBoYXZlIHRoZW0gb25seSBkbyB0aGF0LCBldmVyeXRoaW5nIGVsc2Ugc2hvdWxkIGJl
IGRvbmUgZnJvbSB0aGUgcGxhdGZvcm1fZHJpdmVyIHByb2JlIGZ1bmN0aW9uLg0KDQpbU2hyYXZh
bl0gVGhlIGxhdGVzdCBwYXRjaCBhZGRyZXNzZXMgdGhpcyBjb25jZXJuLiBQbGVhc2UgZG8gY29u
ZmlybS4NCg0KPkFsc28geW91IHVzZSAic2FyIiBmb3IgYSBsb3Qgb2YgaWRlbnRpZmllcnMgaW4g
dGhlIGRyaXZlciwgYnV0IHRoYXQgaXMgdmVyeSBnZW5lcmljIHdoZXJlIGFzIHRoaXMgaXMgYSBo
aWdobHkgSW50ZWwgc3BlY2lmaWMgZHJpdmVyOyBhbmQgbGlrZWx5IGluIHRoZSBmdXR1cmUgZXZl
biBuZXdlciBJbnRlbCBtb2RlbXMgbWF5IHVzZSBhIGRpZmZlcmVudCBkcml2ZXIsIHNvIHBsZWFz
ZSByZXBsYWNlIHRoZSBzYXIgcHJlZml4IHdpdGggc29tZXRoaW5nIG1vcmUgc3BlY2lmaWMsIGUu
Zy4gImludGMxMDkyIg0KDQpbU2hyYXZhbl0gQmFzZWQgb24gdGhlIGZlZWRiYWNrIHNhcl9kZXZp
Y2VfdGFibGUgbmFtZSBoYXMgYmVlbiBjaGFuZ2VkIGZyb20gInNhciIgdG8gImludGMxMDkyIiBv
biB0aGUgbGF0ZXN0IHBhdGNoIFYyLiBQbGVhc2UgbGV0IHVzIGtub3cgaWYgdGhlc2UgY2hhbmdl
cyBhZGRyZXNzZXMgdGhpcyBjb25jZXJuLg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpTaHJhdmFu
IFMNCg==
