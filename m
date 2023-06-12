Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED32C7EE43
	for <platform-driver-x86@archiver.kernel.org>; Mon, 12 Jun 2023 23:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjFLXSa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 12 Jun 2023 19:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232236AbjFLXS3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jun 2023 19:18:29 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E42BE78
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jun 2023 16:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686611906; x=1718147906;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=AC0M8jq75wMG4LvYepkWILwuXGpFSv4xY1rlun82caU=;
  b=aa+OFVCvzWCHkQU6nVae7OWF17ww5yvT9Tab1+S4ogrB1gR8/tkkdf8N
   e6W/vKIQgrNoB1/KrKdmG0CXSfMUAM2JoBfC59qEfTX0QzvNG6y0gVJpf
   7mQelFYA5aj/yKN1Td5h3Q1W7sSIb3h08c4HolZ7o/4BUjbF7oNY6DSQN
   j1SGcvuQB+66gN7F3heSznX+PT7tVRvQM/e8f57Y457wF2i/R6gDFq2E7
   xXn11fVJPePci5sJH4dw4G0cbFbwHLYk2sTRr/jLA1GKzCFmVoLNaHJZY
   rjicyxFgC3SFq1OwOg/W0Kx0kiapAXOvTrWO1WMJ1bdNNo8dXCUJi/Q4C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="347836283"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="347836283"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 16:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711399443"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="711399443"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP; 12 Jun 2023 16:18:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 16:18:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 16:18:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 16:18:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+ZydIxgCRDKzVKY/axFl3SZ8LTOEkWPW+byFTSzWyRjfbhuBBND8q2Ak224OJGKQkDidC/pyldgUEb0xbQ8g+N66gLpK9bVhCekL3rDqVGh03Ef3U5QGW6zDj2ych8llckQ+JyeM74MfkPQ7uAQCo9pPIhSarAfHHWdZV/MNzkhPFzHOL0p2S7X9Hj5qXOmLd3wmlIlBA3y4MiizX1Zz7iD0uhI5b+8FdAThsc3L4xwT5Q8ewhLcj0V+ZCq7swEMFLO0/sEezw8l9VRV5vUjVb/EBDxAD2o9GAeZEYROMdqwVD39fcSMKEjYpTVw8EL3TSQkuvLTTTiIS1TcHa1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AC0M8jq75wMG4LvYepkWILwuXGpFSv4xY1rlun82caU=;
 b=NkTJnByAG/M0j23QRAw49U1OEd2wxWekJDY/Q3+qSvg5KS36UtujqQz/a9pzuNtI9rPhaNYxgoCpAU2eiII8Yykich9KQ3ed6x1LAcaLgOT+SjjCKcltcZ7kUta6txPT3IXZRGh55f75FKoA8H95bu9GcP80qnakr8+2/CsA3AOVu7yQVgnWuQA1R/G34WpAapTVooJKrCy0DjqPA64rEDTFPhnYK/dXdR1j3MC3w1IPMu0uDxe8tEaV1lcrULDECIyLMzcpt4ZFRXSjlYx72r9UjQqXDFNVcA1cc/Amwq2b5lQ4qlPWQrF+gufo6LAoSECYz99vRsC+COxiBsSaXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.44; Mon, 12 Jun 2023 23:18:23 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::988c:a824:835:5dbf]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::988c:a824:835:5dbf%4]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 23:18:23 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.5-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.5-rc1
Thread-Index: AQHZnYQvTi3q9UjjhEWOy3Kt9oChTw==
Date:   Mon, 12 Jun 2023 23:18:23 +0000
Message-ID: <3e334999c26d2e9a71f8ee62d78c8356c074c19a.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|DM4PR11MB6237:EE_
x-ms-office365-filtering-correlation-id: 806cd4cf-8adb-4de7-3b66-08db6b9b51a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +eFyv7eKGWMp54n1fUReSSzLjMbmiygtuFl0lNC2V4le+5/IxYVKTnpLnfIvnf9gNxBSayT8ABYwdW/ewgs2bBRJSw1eXEX6BIyEHI4vHqSyy+99nyqGjF5R1V9RQSTO4Vyje7s49FEB6bU978ubzGUQ3IVJiC8lYTsjLNzOJW1oFHmocwFkFlVe0olf6qvxS0dFmts0qeUfk1crUTa3hK+IF8SI9bWhkLUsDOz+pFglBcol8XrzuO8Nz+vV9+zF3T9/fR5pbluaZj3lsMc5vcdw8y1b06OPsfzSSvHuzEbmV1FwJgFJP4eBQpr5/+YsFC/QiImXJkp4xUbLg1/PIccMYxhC5+h73g2rDu/7WFmHUSlYQBh95LyB4UVZnh/qGF1dkvK8LcgzSgKPsm9aifVfG+pBfUAhSf8+2EXbt10SazYTLHEXabelqm5SDxAFBc3Whwo6QAjLyYvp4nOGFARMPaouCFEnMtCBLMvMJJuav8nEB8IZTWp5NKT/uvfMKet6ZT0dCgO0EI7tE/93h1kmj/Ank4MeNg2o8yYsY5+SfNg/QTkuPZe3RXKOTv/pcE/x8VZCphSwxyO8YjVouFdVNW0MH0O8Q/jdFekOvdbvci6+C+6nDh99Y+H+tbC2NUzvJjopdoecsmtZYG/nCMw8rSlvMFhgZy2kLmeMvHY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(376002)(39860400002)(396003)(451199021)(71200400001)(110136005)(54906003)(36756003)(2906002)(38070700005)(86362001)(478600001)(64756008)(66946007)(5660300002)(8936002)(8676002)(76116006)(4326008)(66476007)(91956017)(66446008)(122000001)(66556008)(38100700002)(82960400001)(316002)(41300700001)(83380400001)(6512007)(6506007)(2616005)(26005)(186003)(6486002)(966005)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDNyeDc2MFk2U1dWclFZTUdKK3ZpSWdPVEFKRnlVeWR4K09aTWp1bW9uZktF?=
 =?utf-8?B?K3JqWTlXaWNZTGVLMEZKNm5CUGpLbUdPRVhIdU41QUtjZVpTTjZqRmxWbWlW?=
 =?utf-8?B?QUJNZHRYS3NkNTc0bUdsK1laQlFoTHBnMTBDamFSQ0NtNHN3b1hEZXVuQW1W?=
 =?utf-8?B?dS8yS2ZNd3ZBalFWZ2UxejRvSkkyOUp0RXRZWHdLand5NXFZVjJCakhWeXND?=
 =?utf-8?B?TUdoVFlueUF2bTVBODhCdnBsM1FJUFRNcFdDcmUvWFNRcEliRzAvSnMwalNB?=
 =?utf-8?B?bDVwL296dDBzQ1lQNU0zMktHYkNCVlV4cjdadkREcm1VUUFQQmxRWWhZSG95?=
 =?utf-8?B?aEhSZTdPZG15NlUyZTFVaEZKRDIzWVhWM0xBRk1naGFMK3p3Y0tmaVZEbkJK?=
 =?utf-8?B?eCtpOTh5VjRIeTBKbXAxUUt4UDV3OTFXVTdyYnVIcHIwN2pienkwczBhdFY5?=
 =?utf-8?B?NkFkK09qY0lBb0x6NlpkR1hsb2VRZVRhQVhzV083U0lHMWc4a0M2QmpiRXA1?=
 =?utf-8?B?dE41QkdRL2NSTnp3aGM5MzYvRmFtUVdrSy9nNElTN2dicElGQmMzUVJzOW1m?=
 =?utf-8?B?Vm1WMjBMRXJsSlo2RmJtWGpzTUYzbW16MVJNdXVka3M1eEtMZUR2SzFkSnVm?=
 =?utf-8?B?QTRCR0drTVAvdGV0VDEwb2hpRFBrYUhGeDVzRnM1NnF1SU5zRXN5amRNVTI2?=
 =?utf-8?B?Umc2aWxLREgxYXMzR2tyQnVsUDU1TU5GUldHNnVPaVA1UjdZaDArV3Fxdm05?=
 =?utf-8?B?OW1scnpSU3AyTnQ5Z3lvZlpDbUU2OW1DejdLd1JpV0g2bktYcjBqaExZdVZB?=
 =?utf-8?B?L1ZrWnhXY0g4YVpqd1NTRzdVQTVlWTBPemFIdkhxNU0vTndpSUE5NjdBVEsv?=
 =?utf-8?B?SXJGSjJZVmRPVHJzN2dpNEZFWFB5TWphZmxKSURPME1BU0VlOGh2cnhHMjRV?=
 =?utf-8?B?V3ZUSUM0MzJUSXVaUEFmRmN0UjNXWmF0UURRTkZJc2JGM2kxdDkray8yVGlR?=
 =?utf-8?B?aGFUVjRoc0NDRGZYZEJ3SzRNb3JzbFNYemlBL3FONnVuMDQyYkVuVzhrK1dx?=
 =?utf-8?B?TlA1UzMrd2czaVhMNGNSMlQvOVhoUDBONjNTUi8xNVF2cXY3T3pwd3NMZWdJ?=
 =?utf-8?B?eHc0MXlnUTVYZ2Q0YTY3SUJRamZqd01zMWZEQWR4dFRWMGM3K1U0ZkwyL0s0?=
 =?utf-8?B?bDRETmNKRWpYbThUMEFJZG5kU2w5WTJIeXFCMyt3T3RvbmpXdEhXeDlMU0dp?=
 =?utf-8?B?RjVjUjl2bU84VmcvankrMkhVRFE0SlJBZ1pWWVd0U284cHVza1pMd2VWTlpn?=
 =?utf-8?B?RTFTYk9sTlc3QWNIOCtrV3h4Y2g5UlhCZDd2N014bmUwRS93c3l4MDA0ejdz?=
 =?utf-8?B?OGJia09pc3lkY2k0VEtaS3cwN2FXL2tUVHFYZTlUTkxwOEpxeG02MXNOcWM3?=
 =?utf-8?B?ZFE4Y2Z6RXVjZUM0WjBJZTFFMFF6WCtoY1RHUkpUNGlXNFNkUmkxdVVPLzZn?=
 =?utf-8?B?T09xbmovU3hBdjZFa1JxWjExQnRhOGd5RnkrTFNEQ0RKaWpjcG9ZcnZHTDFx?=
 =?utf-8?B?SW82djYxa2JLTzlEcjVHdFdwN0VVNGdqMnp1SEl1bTBranBZcFhTeTQzK09R?=
 =?utf-8?B?TVVqd1ZNQTcvZ0VQSk4vQ2o3R0F2OFlWN1RHNU5rUExmeENqcUJGR01MbFlQ?=
 =?utf-8?B?azhqVlFLZ3Q0c2FjTXVld2tmVHhZeklkbTRDSGY5SC8vZVhneXNXNVVqNW5k?=
 =?utf-8?B?UEZScXlNdVZYN0Q5V2cxRkFzUlR5aWQ1YXJkc3ZreHZ4Y0xsY2xxUTNIWllX?=
 =?utf-8?B?YWl5NElwNnVMcjZrYkljRDVBUHdhRjdMSWRDVll2RVZQU1FGYytiVDBoVWxQ?=
 =?utf-8?B?dzFNUU00NzRodk96TDZ2UzRibENaNmxyUS9vSHR1K3BhVFZ1REZ0b0o0S1VE?=
 =?utf-8?B?SFpjREZSNlY0WUlkNHpIWGpTOGg3RG0zMExoeTV3Kzh4WFpFeUpicU1wdnpO?=
 =?utf-8?B?em9PYm1iOEx5M1J4VGVPZ2puYW5CcW1uNjN1Ym90bGxUQVlNcjZEMGZXVVdN?=
 =?utf-8?B?Ymx2N1U2ZVViRllFZ1R0Ry83NFF0djE2UUJoTkRUUkdnOEtReGU4ME40MnFQ?=
 =?utf-8?B?a0lwY0pzNUZDM3VCV21lVVpra3dLTkgxVlAzMkhWQ2pLMmw2WG9TZWtkM21h?=
 =?utf-8?Q?h0m6jQE2ERoq+R4/eTAU3Bo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED2CCA33A0356B4B82718813096E5FB1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806cd4cf-8adb-4de7-3b66-08db6b9b51a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 23:18:23.6076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oh5ahOtvusTRH77P95ywXBRuwVT2vDX5HlpIUwvZT52J6F4wP2hAg8Kc6TwQ5Hd2GbZYRAqRn6uEq02h1zAiXtjBjlhzjexrdZ2begGDayE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCiANClB1bGwgcmVxdWVzdCBmb3IgSW50ZWwgU3BlZWQgU2VsZWN0IHZlcnNpb24g
djEuMTY6DQoNClN1bW1hcnkgb2YgY2hhbmdlczoNCi0gRml4IEpTT04gZm9ybWF0dGluZyBvZiBv
dXRwdXQNCi0gRml4IGNvcmUgcG93ZXIgY29uZmlndXJhdGlvbiBmb3Igbm9uIENQVSBkaWVzDQoN
ClRoZSBiYXNlIGJyYW5jaCBmb3IgdGhlc2UgY2hhbmdlcyANCmh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3JtLWRyaXZlcnMteDg2Lmdp
dA0KYnJhbmNoOiByZXZpZXctaGFucw0KDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBj
b21taXQNCjI1MTVlNTQyNjdjOThkYzkxYTYyNzM3NjViNGJiZjU2MGM1MmI3NzA6DQoNCiAgcGxh
dGZvcm0veDg2OiBocC13bWk6IEFkZCB0aGVybWFsIHByb2ZpbGUgZm9yIFZpY3R1cyAxNi1kMXh4
eCAoMjAyMy0NCjA2LTA4IDExOjAwOjE3ICswMjAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBH
aXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vc3BhbmRydXZhZGEvbGlu
dXgta2VybmVsLmdpdCBpbnRlbC1zc3QNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
DQo3MjQ0NzIwYWMxMzdlMzE5M2RiMTFiMDA5ZmMzM2MwZGQ0ZTk5OWM5Og0KDQogIHRvb2xzL3Bv
d2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IHYxLjE2IHJlbGVhc2UgKDIwMjMtMDYtMTINCjE2
OjExOjA0IC0wNzAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpTcmluaXZhcyBQYW5kcnV2YWRhICgzKToNCiAgICAg
IHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEFkanVzdCBzY29wZSBvZiBjb3Jl
LXBvd2VyDQpjb25maWcNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6
IEZpeCBqc29uIGZvcm1hdHRpbmcgaXNzdWUNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1z
cGVlZC1zZWxlY3Q6IHYxLjE2IHJlbGVhc2UNCg0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVl
ZC1zZWxlY3QvaXNzdC1jb25maWcuYyAgICB8IDEzICsrKysrKysrLS0tLS0NCiB0b29scy9wb3dl
ci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29yZS10cG1pLmMgfCA0Mw0KKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNDMg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQoNCg0KVGhhbmtzLA0KU3Jpbml2YXMNCg==
