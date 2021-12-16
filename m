Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1420BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Dec 2021 02:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbhLPCIJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Dec 2021 21:08:09 -0500
Received: from mga07.intel.com ([134.134.136.100]:23299 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229978AbhLPCIJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Dec 2021 21:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639620489; x=1671156489;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=uWmAbZMOOr3Gjf0rk+SEQt1bYNdmbhRvQKlhcYhv57g=;
  b=CKaIkYd3QYpVwKpD3sSlrjhDNJWRp9++6KyPPP2FO4YHz7VvelxMRqor
   m3bhmGvX8ZWiqTF2aitn1CaxLuSWLZ5Q16QmimVdQn1ZVR3tQ3KnRCuVg
   gHX4ly8TJqiOADYapDAS1TPqc3Omu9XqEluCo7Xm2NHQYvZg+if6fGuVG
   4rsDQOugYXHQCsOhIvWIQEuA/eozk/1bMJzgeWaSnBPXqiNz8jSmRJyhv
   /ZIOyNYPr5U9X/ieIlqL6iDsirt3Q7ah805jw53swSwgwmAY3VGSWBDdo
   H0afAj/2cIc1GptUdWUM6sHWz64IQOIr5NPUTdK5Oybj5Lj7uG+BTXVpq
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="302755739"
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; 
   d="scan'208";a="302755739"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 18:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,210,1635231600"; 
   d="scan'208";a="465856376"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP; 15 Dec 2021 18:08:08 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 15 Dec 2021 18:08:08 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 15 Dec 2021 18:08:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 15 Dec 2021 18:08:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 15 Dec 2021 18:08:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBJ9Sck5NNkgV+qd0y2GJS11rwc9nJQQb07KOD6hpSEdo/rvG5kYkH6sIGkzzGC9AYN2TfmQqDaS6G+RRsdQT44H4F5Woxz6PeJYJRZcV4ICcat3w7ClZ4r/U3Kb5UhO6VRji0Xh+JKyVW/kLGKL0Gmn/J3veooJrJ9vZmy11XabUixE0jBD7mQAgN+mH3M02jBJxjtiLdSwFHAo9PfyEe0nASXWEzwyd5n6TPJM3Ovqma2a/qSz9oCamZQANyHySkkg+z7JZj87FAXCErwkvQKir+NwKu6jAvyoqe4kzFG4Drh/BIzqogXmAh0wdummmPpeqsWac0SSkzAw+HFuuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWmAbZMOOr3Gjf0rk+SEQt1bYNdmbhRvQKlhcYhv57g=;
 b=PgBmfmYbqIZD6X2HY7Tj1AhJuBjBtllUgBj0giacbuZJFxEVZj3KwcSvjkF4oeUJS+ZEoS13WQI6RyktV7ca+kTyxlgwEuG9ztmfPmUqkd9/ePgoxHKJcsdFGRwbF2j7znejHvvu3p/1PpGw8SxyuDc55ijhA7DtHtGphdzXJtRmF1umFOG7MAtaWgVEAqkxJe7KGyfLcjOcBo8RPXo/RhZ2iHLlS+jtFLcnZIoXjRxwquGiTssG4ugVwSZ/cgolldklQ+0zD4OfzYeboUFgPt0ieUVbphy/2LtW++GynsYox/xXtJYrTRc8bCeBr+bUH3id7klTw3bCd63kPeKU8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (10.242.166.230) by
 DM8PR11MB5590.namprd11.prod.outlook.com (10.242.166.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Thu, 16 Dec 2021 02:08:06 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::c86d:b686:7737:c9ce]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::c86d:b686:7737:c9ce%5]) with mapi id 15.20.4778.017; Thu, 16 Dec 2021
 02:08:06 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.17-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.17-rc1
Thread-Index: AQHX8iHDyHklckFkn0+DSRHAMyY6Zw==
Date:   Thu, 16 Dec 2021 02:08:05 +0000
Message-ID: <b92dc5d21512a6393fb16a6f55f9ed09b2cc1ef9.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.4 (3.38.4-1.fc33) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ab2567c-dfb9-4e93-bd18-08d9c038e633
x-ms-traffictypediagnostic: DM8PR11MB5590:EE_
x-microsoft-antispam-prvs: <DM8PR11MB55901245BF2AADE506ECA3B7E4779@DM8PR11MB5590.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:483;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SXJ+Dgg5nP0Lm7COmKWMX1F+CRWB6ipp7WSgj0r01DUEwhXNGN7enF4ZRwWvBY0sZgfajuSzplTTdh1Pr4Xc2dAugAuq3xsG3V6YD6Sr22sR4YyfWa3cfqGj+6KF9a2QPGUA1PhnIp6wp3oY0VLPmfwIJHZXka9DTQpy7ctRaFhl3Auu9s0HUUhQfavfmAqNPr1c4v8NvVSV1Ux9BUXrcd2dGBH03ziDuj+2eqVyvXVvTixarfw5YP+hKFvLgCWj6OiJMEBR8fa03KKnuT16gW5KbgO8TGHOwD+YGKd3d/gvjiwBUJoav+/MpBv2rMlJ5Z8DhbxHt6UViuuFcf0ZcJA5x5e/57FyNnlNTC7SoEUjQ1kGyB1HeZE6Smlp3ZS8udBPpCI3DLq9IXqfR97R0nPkeR1EEuqlzK+YpPjlG/4Lfi2rBjcSNtl7MSCOg46gs4RpQF3QLnCFWXu6oClV9115F/61SJzE0bFWjZY6JNSScATVLFeaJKWb0L/JYVJy1H3LNwk4NZp8FACEQz9P2jY1Z5iYJhdD9IfU+RR3Btl3aqqXcRiRtHsosEyva5fUK+dA78G6+fYzTS6l/tos1C3h9adwtCFr83f6Rzesc1D5HcsuRxrdG/atcfgyAi0B0u4Cy/J/SRzFhN1a1tg77Ccd5K6HENPXk5iwua1KhypL5MmQfmwOfJgmHYFb4BX/8wsBi3kD2olFSXaPHf7DBxT7GZFTFD2aOLGpeMxduMsyBby3D0XK9/vM1We3owUICCsjNNiACCFhJIyxUvJ2ox5d2/hkq0pk8wm3j2JayY4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(4001150100001)(38100700002)(76116006)(64756008)(5660300002)(4744005)(36756003)(6506007)(66556008)(186003)(82960400001)(508600001)(38070700005)(54906003)(8936002)(66476007)(91956017)(8676002)(316002)(2906002)(966005)(6512007)(86362001)(66446008)(110136005)(66946007)(71200400001)(4326008)(6486002)(122000001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0NESGRWcWovSmJVMkRqM0FQd29iTFBJUi94T20yT1hTYXhzdmpjUjlia05H?=
 =?utf-8?B?R1o1SG9GSFlqR3VrUHYzUU9JVXVMaVNVWk5rNlNNSUNXTE05M2FPK3FvU1FZ?=
 =?utf-8?B?U2loano0TkJNeCticU52YW0yN0hiUC9jYURtd2pEaU0wNUNhWmtnM2lMenNP?=
 =?utf-8?B?ekFhNnZoMDdhWWZTZkRIeVVuL0JRYzZoTTAzQ0h3SGhCMWRUYmloUmd2Tjc1?=
 =?utf-8?B?K1hRTmdpOTNUTS90NmkwRHNqalhvUGtzZXMrNDZ5Q3A3OXA0djQ0bklSRUV3?=
 =?utf-8?B?TzRid3k0OFROdlZKRGxodVEwT3ZRVm9QMVFyeWdBM2dsOC9FTmVPeWFheFZH?=
 =?utf-8?B?d1laelkrSG9PZzhKV0tqQkNYN0JRM1Z0aEpWSnVmVUNoN3ZRbWM4Y2VuUFRz?=
 =?utf-8?B?VExZYU5rK3dkU09XaHd5a3IyZDNhVlhSdEhXMCtIV2E5VFAzeWdyTlBzUXR3?=
 =?utf-8?B?M0U2bkU1S09NdTFqbWx0dEljb3ZGTHROMWtSbDcwTEdMU25tc296eFk1aVJP?=
 =?utf-8?B?WHZmR2RSWHhYWHB2KzFGSVNvd3FxV3JERTZ5TnZ3MEh5cGIvbHNGbXBpdTB5?=
 =?utf-8?B?MHhQWHA4QVl5NFBiU2ZWMGNPRnU1d0RwOFBBWHpNUmxJTmpkT29SYmlqdEVZ?=
 =?utf-8?B?TFpCZjh6cnpPYUVjRFNibXNrdXNoTlAyek5zSHA2V1I0L21USXBYSkMwYzJJ?=
 =?utf-8?B?ak5WR05vTWNFbnhvYlY1NXFZYlhkSVJ0a1AzVEtWa1R0VHJpcGNaV0RlSDIx?=
 =?utf-8?B?SzV2OEI3T0NUcE54b2JSTVMzaXdIWmQwS3hJemNoTzB1Z2pvbnd2d1dMV3Qv?=
 =?utf-8?B?TmRTN0xrbUY3d1JReS9jZkR0Qzc4RzdLeTV0T1pNUDlEL0NFaEtPSE53ck9S?=
 =?utf-8?B?WndJQkdKdGVaWWpVaC93b1QxTTE3a2pVMlN1eWhxV0hxODZjMnp2MCs5alpn?=
 =?utf-8?B?eHlEQ0pvUmg4aG1MSHJCYmdmL2dSZURTMTBMSUV5d01XelpXNHZ6UjBCamV1?=
 =?utf-8?B?UC82K0o0QUxTQWhwcFNMQ3FMOTlxVTVBT3lMS1JkVEY2ZkhyY3B5MlRnbURY?=
 =?utf-8?B?N1FGUGFzYitySURzOVVyRzVIOWlGTXFXRlExNm4zcUw4QnU2TVpiTXpId0xh?=
 =?utf-8?B?YnFIKzNWTkN0QUltSUdFQTZwUDBodkhaU0FOalJFdjdycG1RcWJyNE5PQTNF?=
 =?utf-8?B?RzlDcHNrRFZVemViNVlIaGdFU3BIdzMvaDNoeE5obGt0M3dvcXpucFJoWGpp?=
 =?utf-8?B?aWtlbU1scDdGY3BQWGo2WnV6elFqajFZN0xybDZoaGcraFYrLzl1ZWgxQ0tu?=
 =?utf-8?B?MFhJZVUrYXhtRWVJM3d2Sis2UjdlUHFZdUE0S0NKNkhhcHlCYkpPNnhlYVBw?=
 =?utf-8?B?MlYyREMweTlTd1hnRXVTcllpNnFUZUVGSmhWU1lFNVRhOFZXY2E2UjBTYnIz?=
 =?utf-8?B?Q0xDWXVCa1JYSSs0RzlrZVJZOS9rTS9ZT25Xc2YyaVJlVngzSHo0V2xraDN1?=
 =?utf-8?B?QjA2L1F5a2l3cnhwM0JrTkl1UDNTVC9tZm1tVHd5dG9zZjJvQzVtZFNrU3hI?=
 =?utf-8?B?clloMEJLOUNBbVMyTVNVbmhsOEVERVgxQ0ZFbXVOVVFacUhydXJiZDVzbTJv?=
 =?utf-8?B?TEZLSTNWcFByNmpNMWVnK1VZQ05yK2JlYmY5eGtycjNmU3Q2bDUrZjlBaFlo?=
 =?utf-8?B?RUttZ0t4NXJicFNxbG5NaksrM1o2STZYWFA3REpmQ2FPNGVmMEtxLzREKzBN?=
 =?utf-8?B?aE1HY1FQL1hoaXA5cFJ4SDF6UzVsd0dFemF2ZHFwb0ZJU0NKYkc1ZmJEMEVp?=
 =?utf-8?B?UUY1QStmM3JlOTY4ZEFSRnVvWjRseUQ1ZitaYXNWckQvbmlFTWFsbEgzUFhS?=
 =?utf-8?B?NVU3WHZPK1BTU21YUWV0cGdzcnh5bndyQ1pjNytoaTg0YkhxYVJYa3NDZ1Jp?=
 =?utf-8?B?b1J2Mmh5cGNWSGxYdStzRUdZdjI4Um80WXpDaGZnR2lUelJZNDA2MFZtYW1m?=
 =?utf-8?B?Nnp5aERlb0FDUUVnbi9NWDZXTFdvMUY1NHdZbitIZ1daUHVBZGU5ZUVEbDJM?=
 =?utf-8?B?N2luWDUxU1I0NTJ2djZvVEhIQnFSUDFGbGc0K3FacUJjYTNRWVBvT3Z5S0tF?=
 =?utf-8?B?VHlvbmxZM3JHVDBBdExPbS96ZUhtZ25NTUpsT2tDZDJkdmExUU54c3NCN01x?=
 =?utf-8?B?eFNFMGlETmV2U0pmSlNFRDRSWEhFclM3d1hpcHBDQ0l5UjZlSUxpck1BY2JU?=
 =?utf-8?B?VnRuUUYrSlRRejR6VG9nNGZOSHpMNW80cTBDQlpuVzlJbTBwd1VoZFNLaWEy?=
 =?utf-8?B?YUhnbjNYbVVKUmRJK0pMK1hMT2FOaXZiTGJTZXd3a2JJUmFsOE42emdQQmtw?=
 =?utf-8?Q?lRf6Oe79jiL0VxuI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36CB2B21CC4C9D4F88D177C18B816B6F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab2567c-dfb9-4e93-bd18-08d9c038e633
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 02:08:06.2019
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dZE4xQLA/57IZHB26t4D7ecipr5UiWq/JmH2QQ8FY6DrEJZAVcVL/m5KLlG9aLJxJSWUPNxKDa7wWoEa9gG9U4CXn7JOjtJ/Dc1kHtuWuP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5590
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KVGhlc2UgY2hhbmdlcyBhcmUgb24gdG9wIG9mDQpnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGR4ODYvcGxhdGZvcm0tZHJpdmVycy0NCng4
Ni9mb3ItbmV4dA0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQphNjAyZjUx
MTFmZGQzZDhhOGVhMmFjOWU2MWYxYzA0N2Q5Nzk0MDYyOg0KDQogIHBsYXRmb3JtL3g4NjogYW1k
LXBtYzogRml4IHMyaWRsZSBmYWlsdXJlcyBvbiBjZXJ0YWluIEFNRCBsYXB0b3BzDQooMjAyMS0x
Mi0wMiAxMjo1ODoyNiArMDEwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRodWIuY29tL3NwYW5kcnV2YWRhL2xpbnV4LWtlcm5lbC5n
aXQgaW50ZWwtc3N0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KOTM0NmVhMDgz
YWJlN2YwOGQwM2E4YTRmM2U5YTNlMDBhYzA4NWMzMDoNCg0KICB0b29scy9wb3dlci94ODYvaW50
ZWwtc3BlZWQtc2VsZWN0OiB2MS4xMSByZWxlYXNlICgyMDIxLTEyLTE1DQoxNzo0Njo1NiAtMDgw
MCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KU3Jpbml2YXMgUGFuZHJ1dmFkYSAoMik6DQogICAgICB0b29scy9wb3dl
ci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBVcGRhdGUgbWF4IGZyZXF1ZW5jeQ0KICAgICAgdG9v
bHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogdjEuMTEgcmVsZWFzZQ0KDQogdG9vbHMv
cG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWNvbmZpZy5jIHwgNCArKystDQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KDQpUaGFua3MsDQpT
cmluaXZhcw0K
