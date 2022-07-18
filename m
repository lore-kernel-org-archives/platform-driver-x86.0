Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB35EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Jul 2022 17:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235832AbiGRRGA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Jul 2022 13:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235787AbiGRRF6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Jul 2022 13:05:58 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826AA2C123
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Jul 2022 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658163951; x=1689699951;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=hbMGL2qOoEg9Bn5KDB7Cl6LEX7tm4o2Ef28mabbRImM=;
  b=nnhKs0RYYqWtlobLaItL98kSrrN/Tfjz9hfQjRoexg6GzSK4M9PbtHZA
   jptnZXuY0uyUqexmcB26T4c760qqR9NxWbRy4cF3s7RfJqCkcLQV1BCSr
   Ld+AQT9LCHWy455NHy70QK4cpG75EIewP6uug4qX0ckcd2MHHy7bUc5Ya
   3wERM491a405IwOQifEHZ5HtZTZ+fdxsvrrhSGC3MvMr6znybtYkNH7+T
   1gcU0ogA74Ml03JIASW0bcaxHnS7kHExXPolrrNiUeggqaPse/1QpMTup
   Fs5dB/ADUnAcqnqi6zX8piW37x16GbIyN2ui5jhrK7T0ZvIkftU4RoaO7
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="286290504"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="286290504"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2022 10:05:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="686809891"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jul 2022 10:05:48 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 18 Jul 2022 10:05:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 18 Jul 2022 10:05:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 10:05:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RiYT8UorjmIPch8xxvHBTCf6Ms2qmy+umgZ3K45yfrXU2cuYQ6JsCT7AxRyGHshGKWn7oo724AUKDurAq4WCy3TAqohCHP2QLV4W9wo4pADLomiC41k1QISA7VR1mMNaqg12A6NjWUoHqRiPdvlpqtgC4q2MUIdgGu+3Gha2dnuxO1T/iRdj9uDt0QWmrDTSffyojj3pIgXaSzJGIiAkqX10QwoYZkFbox9r5iX+qpK/eTu1JxiBoFyfmphO873r1FHVXms1m+e2YeGwQthGcVugf19kK4MOkDeB3Jjy7fQm3ovtk/KywuluVqkfOPV5pvyWojcJ6tNbN3UC8Wv6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbMGL2qOoEg9Bn5KDB7Cl6LEX7tm4o2Ef28mabbRImM=;
 b=V85OXz8qLOyZlezWq6r26e6okzqbSgFMqKgGiqO4gX/Zor7gJlUWw/ZS+Oqx+fN4wRC5gtWEHTu4Fi4H43pSVPTaQidn7nVixG4vTiaSdVktggDuttUMJZE0rtgKCr1yr5f7B30sUEtf+NYlSr0aLOj6rJ4N5D2IxBVR6scmJOoVfvRk6dfR/w7EM/Sg4Qvl0oi/sqCQYUaDmQFo62RHx4qQwsWc58rOp3ERcQeDV5f4fBZhZssShFLORkWVeKyQOF7z/1LbX1ddhUA/3zLlqujLGgkHH7JhWZ/tFoYF1QG1HmbqIl4Ksja9PSLcpkwjnembDgPkTj1QAIBQ0Z79ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 CH2PR11MB4422.namprd11.prod.outlook.com (2603:10b6:610:4a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.12; Mon, 18 Jul 2022 17:05:46 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::f51a:e3e7:96c5:d23c]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::f51a:e3e7:96c5:d23c%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 17:05:46 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.20-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.20-rc1
Thread-Index: AQHYmsifSXkGEAVo6kazuh6l+TUgxw==
Date:   Mon, 18 Jul 2022 17:05:46 +0000
Message-ID: <f5d261460d60c546005d126a7629bfd5e4deeaba.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52341554-d005-422d-63c7-08da68dfc1b8
x-ms-traffictypediagnostic: CH2PR11MB4422:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YK+aYlqEpsrqYJJY5Bneuto8nVumKRg+4eQKm+erm1/V/zTwRphwmdX7lxDj0xxyw6HVeXU/E5EGjbdd4KFlCDyee6krpVdu+7vD/1s9p9W6Gu1Q2TrefbPrsigUvXLnM+MjGqrgrYOWNkJ7ElX0/5OtywkDZdgXIVa7e+Sb9Z4mCZZETqc2QEgdVkpy7N+ZzkArlLPWFwCXsd4bTksl8h6VT8GdF7eiuK/NckFUoeXd6E1JQ56BYpEUGqCNMsOuc7gfldgu1JlfO8YzfafCqZZ6YRRwpmycCY6EzLVxdEici6xrrZdgHJZX50gBdHaO5E+ZoZ3cPn0wyf4AGKCVZXdnGlDoeq9IqcT6JM3asNf7EfZlX1mDLcclLT9XZWPOUlbInLQocI2kv+utYFOBeGd5e1Gc4Zgpsfq7G51CG5GyTXX7UjmqVE/1qfBdkIAHQlucXK+U+WsYZpC/e6nBHH7A86BEat6IJD99Rizr5+H4vtPrAXCqo1NH3/DzDK5VYRH2jxPfAntiInjcfRKJa0crA3YQbutHY/q0K5PkGmpYVVbPOS1iqMaYpoNatsTPYdgdSRmkejl+QeVy4Btkb0xa4TujwfwAfwtuqnVzMqiZ51Nc8Vjx3Vritj777CaDmF4UyjdFaUPrBIHjQUwTRoUgGoeZ7iDuJyKORrse7nmCz6X+qS69eP8SbEjw4+4xNJxeE0tZJxBayb6eVO4DrN3VorD4KATo65rL7/s1ILXWZ0/fwF4tTigiUYONkuTZILBn+1NWee4sUGN8jXBFOmTIW3ocnLsWSvb3FKRBxi0gdZZT25VsHZ757ikbVPg0WTdK/pHScblybE5dHyyGx/QA1iWxSz+2qPhdaE0hhkg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(346002)(376002)(366004)(2616005)(86362001)(6512007)(5660300002)(6486002)(6506007)(478600001)(41300700001)(2906002)(8936002)(4326008)(26005)(82960400001)(122000001)(38070700005)(110136005)(186003)(966005)(66556008)(66446008)(36756003)(66476007)(64756008)(38100700002)(76116006)(316002)(66946007)(8676002)(91956017)(71200400001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW9MdFh6RktVUFd2R3hwU29jM3IvUUZieS9OYjBFd3pPM2ZlOWZoSXZxVi92?=
 =?utf-8?B?R0taZmg0MzIycFFXRlNtbHhHQ2Y2djdEWDYzeXplMWVibHJVdStFNEw1c1Iz?=
 =?utf-8?B?cUhOc2xIa0pIbTFKY1VnUGpoOWwvL0ZoU0YxMjZKR1VKeGtNSjZSZmxnQnJT?=
 =?utf-8?B?YUxzSjduSzBvUmJQM0FNYkVvdGYxTk9XM1ZkbWFYcFRST0x1ajhqRXA3cDkz?=
 =?utf-8?B?aTh0VWpFMC8zUWhjd0tiZXdBU0tkc2QvRThOc0tsNG5VWlNMUHE5M1F6THkz?=
 =?utf-8?B?MEplek9JR1NqSEFtSzdmYlptU25ZQk56U2xYUnpVeGQ2b1hRajB4YWcxdlAv?=
 =?utf-8?B?ZDlWaXQyV0dvZ0tkZW00d08yYmlnNTh3YnN1L3kzN3gxaDhNbHJrR2UwTkFk?=
 =?utf-8?B?QXN0ZFFTQk5kbTFVQ2dUeEJseUdMaGx4aXlyblQ5WTRIWFl6Wk1oeEwxUjc1?=
 =?utf-8?B?bGl3czN4c0tBd2c4WFFFV2JQMTJXVlFyTjhsRVFPUlU5QUMyTFVabHFKSFhm?=
 =?utf-8?B?ZWVVZFkxSmdYQUNYZXZVSnZPZkpOdEhFK2JOamI5eUlTUGJiYnpQYjE5cDhP?=
 =?utf-8?B?dHYwRW9QWUxTY1FVSUtXeWF1eFJIbE1hS2l6dmNCS29VeW5KS1RJUDJXTTJr?=
 =?utf-8?B?eVBKRzRqbEdkUkFENmYwVzJ4RjJEUmFmY0xDb1QvcTVNT0oySFk0WUtTMmFL?=
 =?utf-8?B?aEJ5bTNpYmRWR1BINDhPTkdSNDFseFBsdnNKNHVBQnpHRXNjY1FJN1hsajZI?=
 =?utf-8?B?bkxKZ3Iyb3VQWG03TzVHcjhrVGJRYmd0WGdEdjE3Zk56V0tMNHYrVXZXa1JT?=
 =?utf-8?B?cS9BcCt6dkF4T3Bvb29oMVA2OTYxWlhMdXloQ0YyVTVpZVJvVERkUWhvTDJx?=
 =?utf-8?B?RTlOR3NOSEJhM1l3MnRCZUpkRS9iRmRlaGtpWjFqL0cxZWFicnlWbCs2TWMr?=
 =?utf-8?B?bkJqUStlNHg2NVI1V2t0VS9yYkhkVDhmN0cyK1FNMm5DV3JaVzBienBqVXJT?=
 =?utf-8?B?MGtUaXpaMDdsWnRaMDRQeFN6cDNPRDB5QnlJQzZDS0xTSXZYZFVvT0IzZWti?=
 =?utf-8?B?czJmSDRqUDBjaU8wUkdib2hCZXgyR3prKzY4YkRYMkEzUzR2TGR1Rm50T0ZF?=
 =?utf-8?B?bnp6OHNOMTVGZUoyay9ONk1GZXdrY1J1UXBsZDg4ZVQ3VjNvVmFVUCtwaFE4?=
 =?utf-8?B?eVlRSUljdjhjcUxiK3pQV3l6cFFDV2FTc3BvWXVYSVZySjE0MWRKU0QyWjVN?=
 =?utf-8?B?Lzg2Y0RHOUY5V0tweXhLTHlrMHMyUFp4SEg5WDF2YU5LNmRMenZNdUNTMGls?=
 =?utf-8?B?c2FUa3lhNEI0bEIxYWZYUHFWbE0yeW42Mm43amJwTkFrRVlOaTBrdzhhbHFq?=
 =?utf-8?B?ZTVRUnMzRGFVd1hxa0lsZGZOK3lGeG5nUXJVRFpvSUN4dHN3bThhZW9ZQ0Y4?=
 =?utf-8?B?MExBZFo4U0NRRE5pUjU5cUcvVVdnNnhvd3cwSnYyU2RYRjVFeWViMFE0Y0Ey?=
 =?utf-8?B?ZzJxNTJFM1dkd1BYLzI4OXczMm04TUpXRDd2Qm8xMlNLOWpDY3lVRG91MmFR?=
 =?utf-8?B?RW9IbFpxYmtSbkFHNVI2dHpIYWNKOGFkeERtUTFVcWtycTRqWDNYOUdBK2Ur?=
 =?utf-8?B?UWEvM1pnaHBJc0RnUlZhSHFoZzAyK2w4ZzlST0hBRmMyb3FOUVpRa3U3Szhq?=
 =?utf-8?B?R1prUFEvc2ovc253VndzWTltaUxkOXFORnBtQjF0TlN0WUVpOC9wOGdzczg3?=
 =?utf-8?B?ZGZRQkRVR2JpanZCcU00dVdpUTRaNVMxS2haRGYyR2kxTmV3Vjdha3J1WVpI?=
 =?utf-8?B?Ni9FQVgweVJ1Uk5QWHVaWkhhS0w3U3pGaUFxZjF2LzZCaDB6QUZtTmdLTmdn?=
 =?utf-8?B?cGVWOFA5OHJraFFtdGVqT2VqZlhPTDh0dXlzUEJOZURaWC8vdW9TK2ozTEs5?=
 =?utf-8?B?bkQ2eWcwTjN4Z3ZuTjVEaExzaEdNL0k4Rkx5ZHRPWmpPWEYwT2hKaFhxRjdt?=
 =?utf-8?B?cFFyVXdDTkp4dHdBcXVBU0x2TitBUWNGSjNzeVQ5L3lsVnFITFRxK2M5MU41?=
 =?utf-8?B?QUFLNmRSRjhwd3MrY0VsU2VwWWRmN3lWcjZDVGs2MlNEeFFqVVh0TkN1UFJa?=
 =?utf-8?B?SXZjUzVjUjZWSGpIUllBNHVVOUZ3NHArUFFuWXowSmQ5eHRwbmg2dE4xdjlU?=
 =?utf-8?Q?7dOkzxITrLRN6wOhW/460jg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04464F0D8CF50647999E232BD42663D4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52341554-d005-422d-63c7-08da68dfc1b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 17:05:46.2804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yDMAOO/QI6bpImIFhqr38OwAddzosAO+xtOTuYg9yGuduMnYm4AWC/1faEIVLTsc3zOvlS7Lpae8Qi3z5IjKnmxOyDDbqAOf6jWPGQGBo9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4422
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KVGhlcmUgYXJlIHR3byBtaW5vciBmaXhlczoNCi0gT25lIGZvciBqdXN0IHJl
bW92aW5nIHVubmVlZGVkIHNlbWljb2xvbg0KLSBBbm90aGVyIGZvciBhcnJheSByYW5nZSBjaGVj
aw0KDQpUaGVzZSBjaGFuZ2VzIGFyZSBvbiB0b3Agb2YNCmh0dHBzOi8va2VybmVsLmdvb2dsZXNv
dXJjZS5jb20vcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3JtLWRyaXZlcnMt
eDg2LysvcmVmcy9oZWFkcy9mb3ItbmV4dA0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2Ug
Y29tbWl0DQo3YTRhMDRmNGU5MGQ3NDY5Mjg1MDFhNmQ1NTFkZTg3ZDAyYzI4MzIzOg0KDQogIHBs
YXRmb3JtL3N1cmZhY2U6IHRhYmxldHN3OiBGaXggX19sZTMyIGludGVnZXIgYWNjZXNzICgyMDIy
LTA3LTE3DQoxNjoyMDozNSArMDIwMCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRodWIuY29tL3NwYW5kcnV2YWRhL2xpbnV4LWtlcm5l
bC5naXQgaW50ZWwtc3N0DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KN2Q1NjU1
NDJmOGJkYzA5N2Q2MTEwMzA1NzJlY2Y4ZDk3MDZmMTRkYzoNCg0KICB0b29scy9wb3dlci94ODYv
aW50ZWwtc3BlZWQtc2VsZWN0OlVubmVlZGVkIHNlbWljb2xvbiAoMjAyMi0wNy0xOA0KMDk6NTE6
MDkgLTA3MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCkRhbiBDYXJwZW50ZXIgKDEpOg0KICAgICAgdG9vbHMvcG93
ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogRml4IG9mZiBieSBvbmUgY2hlY2sNCg0KWGluIEdh
byAoMSk6DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OlVubmVlZGVk
IHNlbWljb2xvbg0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9oZmktZXZl
bnRzLmMgIHwgMiArLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1k
YWVtb24uYyB8IDIgKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCg0KVGhhbmtzLA0KU3Jpbml2YXMNCg==
