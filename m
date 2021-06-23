Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68AEC4743C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 14:04:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CDA36023E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Jun 2021 14:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhFWOHK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Jun 2021 10:07:10 -0400
Received: from mga07.intel.com ([134.134.136.100]:16073 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230061AbhFWOHJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Jun 2021 10:07:09 -0400
IronPort-SDR: R3GA0Clv1ZlsC+H6qmDPYJ91FR0g5DGUtQiuO1bcGoG/PqK8klu0WmaGWZdJbX9H/Rut+LwHAt
 hNrXPeIyRSzg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="271112064"
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; 
   d="scan'208";a="271112064"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 07:03:56 -0700
IronPort-SDR: lp6IbqRrDIWzPZ+qXlEfz63u8lnk+Pte+XSsSw7M2SWE7S6+D/jF0QKp1UgDekDfwxOJJhUT7d
 fVzcHVZIefTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,294,1616482800"; 
   d="scan'208";a="639460639"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga006.fm.intel.com with ESMTP; 23 Jun 2021 07:03:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 07:03:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 23 Jun 2021 07:03:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Wed, 23 Jun 2021 07:03:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 23 Jun 2021 07:03:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J31OHIc43RaXlWAa3rW5e2qmz94OMC1sFtZE63DmBlZF6QBd4m56mZtoExjXj6pdETuNjwhcjxYVwCACfPDb+CgUpxOdQkIXzTwh6nniOqwjItc5Rl3oIZL9j5mgmZjuHtfpzJJfrK97bsb8NAQVKVaV8Z+sgWAlbiZ6YvhAIRxr6X7XshAjCGb2eKFsVqxoINIvMwAdfpHC1VmdIyfPf8PZjR0U6mHeWO0XmSlmFNuvcSLO4F+WJWCINmNN27bSMnW/3DKmmVUepG9VwSPBvWRpGpucgFKEhZTmsCrx2oDL4hF5vOtpPkqYm3Do22H265yAsuT48ziKs6SveV0QSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZOOMs9SHwQynHIK6rCYnCB0tuHiKwO7qBn645FVuWI=;
 b=c3i/kRenU9IsZI92usieh2oBJmzkK2fr7oTTg+Z1uAJoq8bvodjROYVr6smBPkRQWjmC8ztoBKEbUMsqWkf7DfNJIWVzApqtmlo8yQjTtkyTWTd6m42P95Fqa+LOthvt0sZGSyaOuP/n67YkOKI/O1OFWQwcqF2YKX6HUWp5r/EFtLdr55JcjkSe2qnWkuNe1C0vMxSp1RwJUa80v3HDrttOUAnPQozZx0wE9Nv/TIKs1S/R4O/dkzhrJqA/tooZELvBvSlsIe1/K9iOsGLa8ZBoe6nwjl33yT2cVMzEif/SZNbtf3fZ1ki1BTbYHSr30kAvCDAshtmco9AYOox6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZOOMs9SHwQynHIK6rCYnCB0tuHiKwO7qBn645FVuWI=;
 b=DUkzYpJJXl1IZHw35N8kDMe80LJKh7UXS0P+M59ff9lhUg6Go/VOuSvyOXrBMytjzz2Ac6QyZGyfjjGAIKZaxw/O2kUc0SyZV/CmyQb361EwDe4+Xz+o68vRFR2GJBkrz23dtnY549tCmvDN2b/JGf1KuS0VLPT740/Cy5xi5cU=
Received: from MWHPR11MB1455.namprd11.prod.outlook.com (2603:10b6:301:9::22)
 by CO1PR11MB5123.namprd11.prod.outlook.com (2603:10b6:303:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 14:03:53 +0000
Received: from MWHPR11MB1455.namprd11.prod.outlook.com
 ([fe80::1ce1:6055:85e9:8c15]) by MWHPR11MB1455.namprd11.prod.outlook.com
 ([fe80::1ce1:6055:85e9:8c15%11]) with mapi id 15.20.4264.019; Wed, 23 Jun
 2021 14:03:53 +0000
From:   "Shravan, S" <s.shravan@intel.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>
CC:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
Subject: RE: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
Thread-Topic: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
Thread-Index: AQHXYF+VeNOuLV2+ZEGiRU0i34+lPasTYxbggAH9FICAACkyAIAMES0g
Date:   Wed, 23 Jun 2021 14:03:53 +0000
Message-ID: <MWHPR11MB145562EBE171DD3B40595DD0E3089@MWHPR11MB1455.namprd11.prod.outlook.com>
References: <20210428032224.8299-1-s.shravan@intel.com>
 <CAHp75Vfq6B0=q0dsQPTP_A8sdPh9tepBooa7cW=KJYX78ekWtw@mail.gmail.com>
 <MWHPR11MB1455D055108F1DBEA6EB9285E3319@MWHPR11MB1455.namprd11.prod.outlook.com>
 <c7c3d395-826b-fc34-b396-a9c7631d981b@metux.net>
 <CAHp75VdLhxv4PqRznZGXQiWtdM7Ssx29xDkH4BaZ_DmHWa=-Nw@mail.gmail.com>
In-Reply-To: <CAHp75VdLhxv4PqRznZGXQiWtdM7Ssx29xDkH4BaZ_DmHWa=-Nw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [49.207.224.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 68fdcc88-c1e2-4465-079d-08d9364fbc19
x-ms-traffictypediagnostic: CO1PR11MB5123:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB512318B292067B7E70C5D132E3089@CO1PR11MB5123.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OaXZ6L4OfsDxFe2+hJCUZOvrzYMjQnItfrn3b0PuZgVps3EY5PPAmtr9P2Hk7sA/YX/IYZ58FjxHnAAitQqlrYT/gg6jkjf1pFUkGs4XOjq6oEXzdrCWBDf1Sbt0XTK5MMWchyNmudR/Fj/IAg1ZOld/veX0tmvP2kPmlJc3ChJgWoj07XUIsBjV+Fi9Vj1MceOSDBqet2MW/XpuRkkaUR40GUpdlQWIDj/Y7jIQomIl5CjHF3o9+Rz1QrpDPc8sDmpDlIlHGM/2c3J2DRl1pfY4j8qOjdKh1hzlUq6eNEm4v1+49K2PmbaxxtBWKkiMztisA4Gpbv1Atz+NkLyfIUgeP6pKgKe/dVd4vaQXfkotkGOEJ8QWNrtFq1QTovpPwPXxIE1Sp424EvZUe6HCvTojGxMkbOgSMZIs3G6Vjxjs6AcOM6Rca1lGOnELFbOvN+2CULv9RW2wmlj8yUqViUtMpWPuVmtU/Ti0SkBqlDd5s0NewC26wNUNyoUxe0lit1KBNMvK9nETcDPJVtpDK6kUs5OYLuoEz28g4PzLPOfR44msM5kN/KzIUwtyOPi8xe+U+xpjn8IZ852gbhFujBENknRv124Bp7ZsWSmE7hDaXY+kdYHVkp7MQAYKN1pcMy6ThSlSLk9ssvWCtJD75Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1455.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(396003)(346002)(376002)(39860400002)(55236004)(54906003)(26005)(110136005)(186003)(66446008)(52536014)(53546011)(66556008)(64756008)(76116006)(66476007)(2906002)(6506007)(83380400001)(8676002)(55016002)(8936002)(86362001)(33656002)(7696005)(9686003)(478600001)(66946007)(38100700002)(5660300002)(122000001)(316002)(4326008)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGxGQVZTWCtZNDRVZ2xVajgyNmdmRWVwenh2a25pMmpvYTF1WC8zc0U3QjhG?=
 =?utf-8?B?NTlRaDRrM1hTekh4eDdYSy9wTGxneDFyWUFSZHlKZUZQSDFyQWZNOUkxMEhw?=
 =?utf-8?B?RCtKNm85cEJZYWxBR2cwS2RlWlNiNnpsbU5pOG52Sk80NU16VDVpNExHWitJ?=
 =?utf-8?B?bGgzQWFrNkszZU1xZmJ0MnJOQ3N4Qm5RTVZuNFlNMjBpUDJ3Sm9sKzVyNkNa?=
 =?utf-8?B?TWw0U0daYTdNaHk5VzN5cU9lMW5mL1Y0a2I2UlNkTWRNbHVoQUFJSmMyd0wy?=
 =?utf-8?B?ZVlpdHBwSXVxYWlsMlprUVBMcW5SMzdleHA3MVBxcHhjWW9sZDR2WldobkNl?=
 =?utf-8?B?cktJMzlveEcvS3R5T1FtaTluS3V4QWhCaGI5b0pMSzY1OGw2ZHJTVjhvR3RI?=
 =?utf-8?B?b08rQmpWRnlIVEhVYndFckN1ZVJSMFl3UHFmNUhzbEsxMlpTQ2hScGxiNEUv?=
 =?utf-8?B?UkRLWmZQbzlSS1g2bUp5TnNRQ09OVXlESnBxVEh2ekpKRGZhM3VBeDRiRDFD?=
 =?utf-8?B?ODdMcjJyRmtuMXBsTURYQTlNek4wc3FidmxSZ3hFVlZVNFdpZklsMXZrSkdY?=
 =?utf-8?B?S1cvc3J2TnZSaXlZUTNlMWg2WlhjbVJqUitSNUdzUjlYTDZRc3pJcVRGa1Vp?=
 =?utf-8?B?dDNNNytaM3Jya3k1akRkWVdydmNrQW91cjl5eW90Rlo2ejRlYnZNU2lCbUtT?=
 =?utf-8?B?aXA5SXlOVGNzOTVNUTR5U3NJOEhWMmdETW5taEtteDIwZ00wVDVzbXIrNjlF?=
 =?utf-8?B?V3lwTVluL2NCbU8xZ0RNMXBHaVVqZGxRdlFMdWRuUnprSjdDdzJvWDNWS0Mr?=
 =?utf-8?B?cVZlNGhFNUhXZXFKWGxSSTdRL2RJdUhiNDRxeFdkaU9MTHJ5UmZSckVuaDFK?=
 =?utf-8?B?Y29ub09SSFZTbm5tbDlSQzFIYVlPdSt3RWhqNDl4SG82M0ppdVR5b1NldmVU?=
 =?utf-8?B?L2JsWHpmdkNEU1NGVFRlYnhVTVozTkVjNGRGdEZHUHFRK0JoM3NrRGhnaFFa?=
 =?utf-8?B?a09GdW43dlVvWXNhMUFzd3kvQ1kzZjNnbzdnQm9QdHZQVDhIb0E1aGMzOElm?=
 =?utf-8?B?dXBMVXQrN0pZbWxhbG83MGJjWUhQRXNGQVZOZkFTU2hGem44dDhEdER3QjRJ?=
 =?utf-8?B?bFJuckl6aDhzcWxTZEtKcDN3RlBoSzVBOWh4QlE0cWVtU0JlV2xZUjJnR1c4?=
 =?utf-8?B?ZEdKbmlDalNyaXdtOXBTOVE2QlowZ2k4bnI5dUZ2bG5aTlU2TnRxR0FEUUc2?=
 =?utf-8?B?cWZVY21WZVpPRzFOSjl4dFlMYjdFZjhKSk5DMXVqNWJUdWk5UUZ1L3Z1cnNj?=
 =?utf-8?B?dnlISGE1REFWQlJqL3g0RHBhajVlNmMxYkhneC9MWUQ5dllXcmtZTjI2UmVT?=
 =?utf-8?B?WUwzRy9tR1NSbmRvTitTaEo3WWJSVjk0QlB2RDZORWpRSkczQlQzcDVCNFhs?=
 =?utf-8?B?OHIreThoT0ZLRkhxVDBYdUpMSVhNZWNFcGxTc0pQOTFZY0dmTGJEb0d4R0pl?=
 =?utf-8?B?dnpKVnFkSFd2Vk0zbW1LeFh5R0VrMjBLSnhWUXZTc1BsWVV1aU1GNk9ERWdO?=
 =?utf-8?B?M3dYdmY5QWYwd2VwQUxYRTVxSytka1VBUlJ3eVlTdjlWNTd2bU5zcWtPQnFN?=
 =?utf-8?B?VEwyZmp3eWlPVTBSMlRKalpQUk9qbmVFdkl2ZTduTDhHbHlFL3RXUXdXSUtT?=
 =?utf-8?B?TDJuSFBma3FQVjV6V1lVQ1AvZjhuY0E4eGJnYjB5RzNNcGZVMm52eWxvWEEw?=
 =?utf-8?Q?sdF2T9qM5TX+z/4ugblfCsB1SwxxqUxD8vM9DEA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1455.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fdcc88-c1e2-4465-079d-08d9364fbc19
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 14:03:53.3679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QOgJgezVXdvSBb5qm1TIoKZqJCSfiMKz2wfhQdFSSC29DgAo/cq2VaKSzv4tYzciZ2LRZ2ff5XBKOgamLignKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5123
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGksDQoNClJlc3BvbnNlIElubGluZS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPiANCj4gU2Vu
dDogV2VkbmVzZGF5LCBKdW5lIDE2LCAyMDIxIDE6NTkgQU0NCj4gVG86IEVucmljbyBXZWlnZWx0
LCBtZXR1eCBJVCBjb25zdWx0IDxsa21sQG1ldHV4Lm5ldD4NCj4gQ2M6IFNocmF2YW4sIFMgPHMu
c2hyYXZhbkBpbnRlbC5jb20+OyBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPjsg
TWFyayBHcm9zcyA8bWdyb3NzQGxpbnV4LmludGVsLmNvbT47IFBsYXRmb3JtIERyaXZlciA8cGxh
dGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc+OyBBbiwgU3VkaGFrYXIgPHN1ZGhha2Fy
LmFuQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzFdIFt4ODZdIEJJT1MgU0FS
IERyaXZlciBmb3IgTS4yIEludGVsIE1vZGVtcw0KPiANCj4gT24gVHVlLCBKdW4gMTUsIDIwMjEg
YXQgOTowMSBQTSBFbnJpY28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdCA8bGttbEBtZXR1eC5u
ZXQ+IHdyb3RlOg0KPiA+DQo+ID4gT24gMTQuMDYuMjEgMTM6NDgsIFNocmF2YW4sIFMgd3JvdGU6
DQo+ID4NCj4gPiBIaSwNCj4gPg0KPiA+ID4gV2h5IGlzIGl0IG5vdCBhIHBhcnQgb2Ygc29tZSBn
ZW5lcmljIHN1YnN5c3RlbSB1bmRlciB3aXJlbGVzcyBuZXR3b3JrIHN1YnN5c3RlbT8NCj4gPiA+
DQo+ID4gPiAtLSBUaGlzIGRyaXZlciBpcyBpbnN0YW50aWF0ZWQgb25seSB3aGVuIHRoZSBCSU9T
IG9uIGdpdmVuIGhvc3QgZXhwb3NlcyBBQ1BJIG5vZGUgY29ycmVzcG9uZGluZyB0byB0aGUgQklP
UyBTQVIuIFRoaXMgZGVwZW5kcyBvbiBzdXBwb3J0IG9mIHRoZSBCSU9TIFNBUiBmZWF0dXJlIGJ5
IGdpdmVuIE9FTS4NCj4gPiA+IC0tIEl0IGlzIGFnbm9zdGljIG9mIHRoZSB3aXJlbGVzcyB0ZWNo
bm9sb2d5IGxpa2UgV1dBTiwgV2lGaSBhbmQgQlQuIEhlbmNlLCBpdCBpcyBub3QgbWFkZSBzcGVj
aWZpYyB0byBhbnkgZ2l2ZW4gd2lyZWxlc3MgbmV0d29yayBzdWJzeXN0ZW0uDQo+ID4gPg0KPiA+
ID4gUGxlYXNlIGRvIGxldCBtZSBrbm93IGlmIHlvdSBuZWVkIG1vcmUgaW5mb3JtYXRpb24uDQo+
ID4NCj4gPiB0aGUgcHJvYmxlbXMgSSBzZWUgaGVyZToNCj4gPg0KPiA+IDEuIHRoZSBkZXZpY2Ug
dWFwaSBpcyB2ZXJ5IHZlbmRvciBzcGVjaWZpYw0KPiANCj4gV2UgaGF2ZSBhIHBsYXRmb3JtIHBy
b2ZpbGUgd2hpY2ggaXMgYWxzbyBxdWl0ZSB2ZW5kb3Igc3BlY2lmaWMsIG5ldmVydGhlbGVzcyB3
ZSAoYXMgdXBzdHJlYW0pIGFyZSB0cnlpbmcgdG8gaGF2ZSBwb2ludHMgb2YgdW5pZmljYXRpb25z
Lg0KPiANCj4gSSB0aGluayB0aGlzIGRyaXZlciBzaG91bGQgYmUgcGFydCBvZiB0aGUgY29ycmVz
cG9uZGluZyBwcm9maWxlIC8gbmV0d29yayBzdWJzeXN0ZW0gcGFydCBhbmQgYmUgYSBvbmUgKG9m
IHRoZSkgaGFyZHdhcmUgaW1wbGVtZW50YXRpb24uDQo+IFNvbWVib2R5IGNhbiBhZGQgbW9yZS4g
VXNlcnMgaW4gTGludXggc2hvdWxkIGhhdmUgYSBjb21tb24gQUJJIGZvciB0aGF0LiBBbmQgSSdt
IG5vdCBzdXJlIGl0IHNob3VsZCBub3QgYmUgYSBuZXRsaW5rIGJhc2VkIG9uZS4NCj4NCg0KW1No
cmF2YW5dICBUaGlzIGRyaXZlciBpcyBleHBvc2luZyB0aGUgU0FSIHBhcmFtZXRlcnMgc29sZWx5
IGluZmx1ZW5jZWQgYnkgdGhlIGN1cnJlbnQgc3RhdHVzIG9mIHRoZSBob3N0IHBsYXRmb3JtIGFu
ZCBpcyBub3Qgc3BlY2lmaWMgdG8gYW55IFJGIGRldmljZS4gSGVuY2UgaXQgaXMgcGxhY2VkIGF0
IHRoZSBwYXRoIChQbGF0Zm9ybSBkcml2ZXIpLg0KQWxzbywgd2UgaGF2ZSByZXdvcmtlZCB0aGUg
ZHJpdmVyIGltcGxlbWVudGF0aW9uIHRvIHJlbW92ZSBuZXRsaW5rIHVzYWdlLiBUaGlzIGlzIHJl
cGxhY2VkIHdpdGggc3lzZnMuIFBsZWFzZSBkbyBoYXZlIGEgbG9vayBhbmQgc2hhcmUgZmVlZGJh
Y2sgb24gdGhlIHNhbWUuDQoNCj4gPiAyLiBpdHMgdW5jbGVhciBmb3Igd2hpY2ggYWlyIGludGVy
ZmFjZSBpcyB0aGUgZGF0YSByZWFsbHkgcmV0cmlldmVkID8NCg0KW1NocmF2YW5dICBUaGUgaW5p
dGlhbCBpbXBsZW1lbnRhdGlvbiBzdXBwb3J0cyBwYXJhbWV0ZXJzIHJlY2VpdmVkIGZvciBXV0FO
LiBTdWJzZXF1ZW50bHkgb3RoZXIgUkYgZGV2aWNlIHR5cGVzIChXaWZpLCBCVCkgd2lsbCBiZSBz
dXBwb3J0ZWQuDQoNCj4gPiAzLiB1bmNsZWFyIGhvdyB1c2VybGFuZCB0aGlzIHNob3VsZCByZWFs
bHkgaGFuZGxlIGluIGEgZ2VuZXJpYyB3YXkNCj4gPiAgICAgLS0+IGhvdyBkb2VzIGl0IGtub3cg
d2hpY2ggZGV2aWNlIHRvIHR1bmUgPw0KDQpbU2hyYXZhbl0gVXNlcmxhbmQgd2lsbCBjb25maWd1
cmUgdGhlc2UgcGFyYW1ldGVycyBvbiB0aGUgc3BlY2lmaWMgUkYgZGV2aWNlLiBBIFRhYmxlIG9m
IFNBUiBwYXJhbWV0ZXJzIGlzIGFscmVhZHkgcHJvdmlzaW9uZWQgb24gdGhlIGdpdmVuIFJGIGRl
dmljZS4gDQpUaGUgaW5mb3JtYXRpb24gcmV0cmlldmVkIGZyb20gdGhpcyBkcml2ZXIgc3BlY2lm
aWVzIHdoaWNoIGluZGV4IGluIHRoaXMgdGFibGUgaGFzIHRvIGJlIHVzZWQgYnkgdGhlIFJGIGRl
dmljZS4NCg0KPiA+IDQuIGRvZXMgaXQgcmVhbGx5IG5lZWQgdG8gYmUgKG5vbi1wb3J0YWJsZSkg
aW9jdGxzID8NCj4gPg0KDQpbU2hyYXZhbl0gVXNhZ2Ugb2YgSU9DVExzIGhhdmUgYmVlbiBhdm9p
ZGVkIGluIHRoZSBsYXRlc3QgcGF0Y2guIFRoaXMgaGFzIGJlZW4gcmVwbGFjZWQgd2l0aCBzeXNm
cy4gUGxlYXNlIGRvIGhhdmUgYSBsb29rIGFuZCBzdWdnZXN0IGlmIHRoaXMgY29uY2VybiBpcyBh
ZGRyZXNzZWQuDQoNCj4gPg0KPiA+IGJ5IHRoZSB3YXksIHdobyBoYXQgdGhhdCBmdW5ueSBpZGVh
IHB1dHRpbmcgc3VjaCBpbmZvcm1hdGlvbiBpbnRvIGFjcGkgDQo+ID4gaW4gc3VjaCBhIHdlaXJk
IHdheSA/DQo+IA0KPiBJIGJlbGlldmUgaXRzIHNvdXJjZSBpcyBhIFdpbmRvd3MgZHJpdmVyIGFu
ZCBXaW5kb3dzICJjdWx0dXJlIiwgdGhleSBzaW1wbHkgZG9uJ3QgZ2l2ZSBhIGNyYXAgYWJvdXQg
YW55dGhpbmcgZWxzZSBhbmQgV2luZG93cyBpcyBhIHByb2R1Y3Qtb3JpZW50ZWQgcGxhdGZvcm0g
KGVhY2ggcHJvZHVjdCBpcyB1bmlxdWUgZXZlbiBpZiA5OS45JSBvZiB0aGUgaGFyZHdhcmUgYW5k
IGZpcm13YXJlIGlzIHRoZSBzYW1lIHdpdGggdHdlbnR5IG1vcmUgcHJvZHVjdHMpLg0KDQpUaGFu
a3MgYW5kIFJlZ2FyZHMsDQpTaHJhdmFuIFMNCg==
