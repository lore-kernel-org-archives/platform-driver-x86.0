Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A32C32771
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Sep 2022 18:31:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiIOSbg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Sep 2022 14:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiIOSbe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Sep 2022 14:31:34 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2082B3684A
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Sep 2022 11:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663266694; x=1694802694;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/XVBlf83EJIOsaai/fMGIaJVzi3zWBNGHdIEhE6F5es=;
  b=eWddskSdoL4axq9e8dwd7XSMTzRodD2sTb0rkveTR0FWVSnJ/IPutNgn
   BJbAcoorqIWD78vRHU0Vc73U1+3kscoGOrIljW7yGhItEQNKsqHkrKMoS
   T2ivUjNlXKpYFdZHNWFshRL3TcBoRCLD6DWa9jMGz5lYmH1V2HRMafG00
   wtgCE9q1YRVBUeUIPDxqHQBw1UwUT99ftDIm6d+FXyW/eDHMjB2Q0ljLU
   zyeKYkOegxMaMbURn6UQ7Ipz9x+m7OHvJRnVOaicOwXE4ceggOaHH3Atq
   9myYzbCMXos6D2TOveXv6yc5Sa2bMJjy3A8qNsdhxgT4tWo/MASlheV5w
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="279186415"
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="279186415"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 11:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="862450049"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2022 11:31:33 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 15 Sep 2022 11:31:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 15 Sep 2022 11:31:33 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 15 Sep 2022 11:31:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdjvBGChWrqzo9JljdOu+phkGeI/jWQN52/EbOY0YmFQrz3n8dW03/3PHyWlSINlI/V8o9cWQzqqPUpmIyHZXpU2D3+laK21mljt6WxQmRQ/SeZFqiEDlis4kne6jFRSwPgDyiZm6bmzyDaVDp3h6b6slPOC+kipJp34wCE2OgxwsGA/jiLucSzb/NTUT/aGbTzOu3D+2C3cpJLzgRyki8q7WAPnChVo82gUScCaNv+UGIUczLPVaI7aPkcjAgV7nrQQtZhjWdgjWJysHzvo7D619pM2QbNTTcX9TBbqnWEjX9L5J4Bn9cND55BlNecDw4fx2SCJrtnHuMTKhlNc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XVBlf83EJIOsaai/fMGIaJVzi3zWBNGHdIEhE6F5es=;
 b=ay7ygBoojT0tGtx2pjfR37TwDuWhqaSRj9U8yT4BHhqar5L8Mr4DMgwwHGOQ5ceNnX5+9EX/6pDGqrPY7qikmxkda6YMz3EnxbsnyzCqv/rAhmOIGZ09r+7e8Vqk48DzF+g7hIpdjSSmLdtTv66hQhpYBMyEx4FaQnID0Wolvqw+0wE45pJL0YXorbVNRmFBMxsaCHDkvEHr5MoHtCRPRxj/UPEUMx6Df9tucI7nsWb4Ums+VzZRs8RbZEYI3+duxhyPVSdWk2uCQP2VAmxfz/LnLmyMlX0HsSMJCqJbTLUVaSN/BDa9CLw778lGWaktAFvVgbdujyEB0NZ3FlIFlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 BN9PR11MB5227.namprd11.prod.outlook.com (2603:10b6:408:134::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.22; Thu, 15 Sep 2022 18:31:31 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::c044:c902:a5ad:60dd]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::c044:c902:a5ad:60dd%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 18:31:31 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.1-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.1-rc1
Thread-Index: AQHYyTFgT7CMTr5Ud02c3gFFWvTCRQ==
Date:   Thu, 15 Sep 2022 18:31:31 +0000
Message-ID: <e53c62fcb89a701e104513ffcd40cd79abd32123.camel@intel.com>
References: <f5d261460d60c546005d126a7629bfd5e4deeaba.camel@intel.com>
         <49ef6e43-eb16-052e-3e58-f0290328cdd6@redhat.com>
In-Reply-To: <49ef6e43-eb16-052e-3e58-f0290328cdd6@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|BN9PR11MB5227:EE_
x-ms-office365-filtering-correlation-id: ff2b1533-5644-4b94-c11a-08da974882bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 35gWWbD5rPF3b6x5bVQwkoRZnuUUhaepa8ZDCAQpiURU2LTvTjLfWHnQKQP39nAvuIFun0G9+BCrOORbLp0j3ClsxabtXfjiJUVFg5+IWp2qJeFKByj/K/Afpxyq5NmSqcNxeSTc8PFrGmgUC3gGdW4ClV5woO9DMGpRX/d1XNZhQb3zCfzr06deDBeidERst/OvFKNe2MfoNUQgmRJqk5GAbsVGSwoAwlSan3MH840c1PdLq1wtAvh47tPnhRc7c3o6tMIYcsgf2VnfhiTVq03X+McFp2AGUSizaAGzlaR2V8Y1S+6fOr8QkntKiHPSv9OtmvsxzndhCyVQVMXbqjPbnKDhj2ZR4yi4D9sneng0KBrI6vN2in5Am4HUDiI8N9XFMMqlqq85ay3bpLixHKLdGZGDoijHDTcqesI/p0vwAP5+zU8sLm2M3NIJSfKzP2u5E4ZfdKJwlj/RVVfECbrgNXDaJdL4VAuERX4lRcCqZ26GeM0OXyZ1T/ux2yG1D31B02omXKIHz8mdl59vJRHjKubzfC0oiTuJdpWqvZJrN7twKw73UxwiqW3EccTz2ynrnhsCD+68KBrnmSk2NwEj+1s7Zq0cY+zlQk01Xr0mmjUttbEaJba1lN57XqkerjViXpnZzAuNnbS/1NhnU8bpUWg9rGgb3gMiLRgM94YrCSOy7dZK5htHxA+WsiWKpKGhwRc6clfd6M3o8unBtySez8EosFPetANvnWZQWgoAj8yNGNLxZCUNK4p3lxvbIb2gxeBlfPy2nD8ZDAG0sa8LkfyNdM4oPqHJ1tOtSeqaHN8FX5KWU9G/Ooy7MQ6nbY4zKoGT+mbBma2uY3inlQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199015)(478600001)(26005)(6512007)(38070700005)(41300700001)(6506007)(2616005)(186003)(38100700002)(83380400001)(122000001)(86362001)(82960400001)(966005)(6486002)(8676002)(8936002)(110136005)(316002)(54906003)(36756003)(91956017)(5660300002)(2906002)(71200400001)(66446008)(66556008)(76116006)(64756008)(66476007)(66946007)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGtCaTh3ZGpzR3p0YjhubHIzWnVVa2RKRGFSVUR1MzJOejlXQ2V5aXhNTXp4?=
 =?utf-8?B?L2plNHpFRTZwMzJuOW0vbTdtaDR6WHdCUlI5eEhMQW5GVjNaQkpwNHdVYW1x?=
 =?utf-8?B?MnNCSGZtdTBZVnI3SkNNVFA1dU1WSHIxSm1wbGMvMTIyR1BaeXZzY1FxYlZo?=
 =?utf-8?B?M0JlWUJxSDRQT1QwZFBqSWtNRG1JdzZaTHU5WHQ2bE5FYTZuMUhWSmdmdURR?=
 =?utf-8?B?aWtVcTJ4OTVJemJzMXhjOC85NXJsWld2dCtZYUpzYzVxQjdjMWpxYUF2UHVt?=
 =?utf-8?B?bFl4cC9qcWg1UTNZSU9kRnJJR1FLdHNMem1BZGQ3a1U2WE9jUWIrRXh2WitL?=
 =?utf-8?B?bzI4bDc3ZnFqaFIyWmpFUzZySDZ2dGx4aDlXd2cxMmxBZ3hWUHJEckNtNURT?=
 =?utf-8?B?NU5jMXQ2cWRvbnMzNUFWLy9hZmZOVjZacVZTN1MwVkNSNnFabEMzTW9sTGp3?=
 =?utf-8?B?dHd3UFBNVEZKeHRGSzVpZGlNNlpNdVJGOEkwN0NkeFA0cUUzeHJQVnIxa2du?=
 =?utf-8?B?a0RVc1d2Z2VKNXBKcTFoSWJ2NmRyR3JHQUhEeU5sVFhFTjRWWFF2Wk8zSEZX?=
 =?utf-8?B?VDEzRkZGaHVFSnl6TTd4ME5sWGN2T1BscnNkck9qU3AvbzV1c2FNUkxReENz?=
 =?utf-8?B?Nlgxc0V4Yy9va040bXA2MS9xVWxwS1d2cy9PRGNzdGFLcGl0YlNoeTYzVnhL?=
 =?utf-8?B?eVVIZDZhckNRZGp2RW4xSnJFeTdjdGpqYVFEbVJHMnFHbm13MGZCWXNDMGx2?=
 =?utf-8?B?aG9ZRXkvS3FkTFVLNHpkV2psWXZhTTJqNTM0QUp0eTVBSzNIaGttdkx5VmZy?=
 =?utf-8?B?eDBFWDVXeVQ1Z1diVk1jaUdzNHRQZms4RWh3ZXJtWDB3cVJlZHVZVTFCRGZx?=
 =?utf-8?B?anlqTWlMcTUrNkZGMnQyR2VsN2VPcHBHamxjM0RvakUySDU5WExMZ1BPek5M?=
 =?utf-8?B?a2E3bnZwTUI4L2FtcjZJb0F4T3JsZHZyV1hMREpYaUVPNjhvOE01UFRZcjZB?=
 =?utf-8?B?aC9DZUt5V1NYQW5Rem1PeWNNbm1vbmxJc04vYi9xQXBIdGVTbCtUT2VqQW5W?=
 =?utf-8?B?ZkNhVFZHdGpXc3JZU1haK0p5YmNaMCtvdzExS29UUWFKaGs0YXduWFI1ejhk?=
 =?utf-8?B?UElKQVRrUUJQNFl4NStJSmYrdklDSXQvOGtJOGsxREtxVjdJU1BCUmVHemlp?=
 =?utf-8?B?VDYvMDFocVZyNmhxbDNCS0tmcW1VQ2dhdVBUN0RVSFpIS080LzZPUU5KSzNB?=
 =?utf-8?B?d1o2MWFmMFpLb0p5amU4ZXh4NlhxQm5LYkUrTEJQdjl2Z0hkZzVhMy9TekJQ?=
 =?utf-8?B?bFdoRndyZWorU3B0OTIzd3h1TDcybXBncmNTWStRWndSS3NuM3dpSUljTmxL?=
 =?utf-8?B?Qkx3V2hHZDdpUDFKOGpvcEhwTWRxZWwxUStWMWlLSmZINUU4MTZ1RDJFK2tW?=
 =?utf-8?B?RkF6aW9udUJJMHlrSTFZb0ZhWjU4cDlZd0lIcmVpb2J2SFh0bXNhSzNvNmx3?=
 =?utf-8?B?dGlScWhQb2lsQ1JyM2p1cTNUZXh6NXVUQ201bVJSdkZ4cnhOYTdYbDF6ejI4?=
 =?utf-8?B?RHIrUnJtZEIxVlIxdUlnNHZEZ3FBTkdyYXdNZ0V5bW1vbEo1RUYzRGFKMnlE?=
 =?utf-8?B?VE0rKzhaeU1iRjNESE03SVExYndBVFJWT3JRNHMwQTBVVmcrRTFNR1NzR0pL?=
 =?utf-8?B?ZjVGZ1FMczc4T0w3Znl6bnBOdVhTaWx4MlAvSHN6d1Vrcm1rS2FtZllRRnY2?=
 =?utf-8?B?WlBIbUZaOGpjU1R1Rm8yWlU5emtsZjNyczFjRXVkK3N6a2FsUEs0NTRPTEpO?=
 =?utf-8?B?QU9rYlg3TDBnUlBTS0dKaERZSjJKOUV3NHdmL3FkNUJJcGpKRG1yRjJyVkhG?=
 =?utf-8?B?bkU0UWhxRmtVZXdHSEhtSUJmTGluNWYxZkE5VGR3WUFtSkJVSmg1bnVHWm0z?=
 =?utf-8?B?YTdBMXk2anMzU1dQcGVScW5jazA1OUNwYm10STlQdTU0aTBjekd4aXNBZWg1?=
 =?utf-8?B?UnJKS3FyZW5xWmtWVUZsWUkrK2g5Vk02U2pLY1Z2cGJnYVZHME1QMEtHcGpm?=
 =?utf-8?B?aWE5aUl3MkZObEdJVFhpY013NjZmSnVOZDU3cWdPd0tIdUtjRUIrZnJIdzlO?=
 =?utf-8?B?bEZFdHVBY21TRXY0aUMrTnZkV0grbnB6eGFxeWk2U3BxY3hDazFzRjdPTkpG?=
 =?utf-8?Q?N1cvdp3skOdbVeFshPi99c0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00B912084D433348A5896DD98E89A3EF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2b1533-5644-4b94-c11a-08da974882bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 18:31:31.2816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 11BvzXDC+jqgwCRGjSr+mUGzXXN0Evyab4MjAO+VfJBkBAGXCyB73pn5D39hIBvmLRg4J1HaJXbESwCDNnoe7RrPRxGTuVW3HU3EdDsYn8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5227
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KVGhpcyBwdWxsIHJlcXVlc3QgY29udGFpbnM6DQotIE9uZSBmaXggZm9yIGlu
dmFsaWQgZGlzcGxheSBvZiBjcHUgY291bnQgZm9yIFREUCBsZXZlbA0KLSBSZW1vdmFsIG9mIHVu
dXNlZCBjb2RlIGFuZCBkYXRhDQotIGNvbnNvbGlkYXRlIHBhY2thZ2UvZGllL2NwdSBpbiBhIHN0
cnVjdCBhbmQgdXNlIHRoaXMNCmluc3RlYWQgb2YgcGFzc2luZyBhbGwgYW5kIHJlY29tcHV0ZSBw
YWNrYWdlIGFuZCBkaWUgaWRzDQoNClRoZXNlIGNoYW5nZXMgYXJlIG9uIHRvcCBvZg0KaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGR4ODYvcGxhdGZvcm0t
ZHJpdmVycy14ODYuZ2l0DQpmb3ItbmV4dA0KDQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5j
ZSBjb21taXQNCjc2ZmJhMTIyMWUzMDQ1NTcwNDc4MzgxYzM0MzZjOGMyYTI2NTYzNzY6DQoNCiAg
TWVyZ2UgdGFnICdiYWNrbGlnaHQtZGV0ZWN0LXJlZmFjdG9yLTEnIGludG8gcmV2aWV3LWhhbnMg
KDIwMjItMDktMDUNCjExOjAxOjU2ICswMjAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vc3BhbmRydXZhZGEvbGludXgt
a2VybmVsLmdpdCBpbnRlbC1zc3QNCg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo5
N2VjODkwZDA3MDE1OGYxNWZlOGVmMjQxOWE1ZmY2NzdiZGJiYzIwOg0KDQogIHRvb2xzL3Bvd2Vy
L3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFJlbGVhc2UgdjEuMTMgKDIwMjItMDktMTUNCjExOjE2
OjA2IC0wNzAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpTcmluaXZhcyBQYW5kcnV2YWRhICgxKToNCiAgICAgIHRv
b2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFJlbGVhc2UgdjEuMTMNCg0KWmhhbmcg
UnVpICgxMyk6DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBGaXgg
Y3B1IGNvdW50IGZvciBURFAgbGV2ZWwNCmRpc3BsYXkNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9p
bnRlbC1zcGVlZC1zZWxlY3Q6IFJlbW92ZSBkZWFkIGNvZGUNCiAgICAgIHRvb2xzL3Bvd2VyL3g4
Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFJlbW92ZSB1bnVzZWQgY29yZV9tYXNrIGFycmF5DQogICAg
ICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBJbnRyb2R1Y2Ugc3RydWN0IGlz
c3RfaWQNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEFkZCBwa2cg
YW5kIGRpZSBpbiBpc3N0X2lkDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0OiBDb252ZXJ0IG1vcmUgZnVuY3Rpb24gdG8gdXNlDQppc3N0X2lkDQogICAgICB0b29scy9w
b3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBDbGVhbnVwIGdldF9waHlzaWNhbF9pZCB1c2Fn
ZQ0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogSW50cm9kdWNlDQpp
c19jcHVfaW5fcG93ZXJfZG9tYWluIGhlbHBlcg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVs
LXNwZWVkLXNlbGVjdDogRG8gbm90IGV4cG9ydCBnZXRfcGh5c2ljYWxfaWQNCiAgICAgIHRvb2xz
L3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEVuZm9yY2UgaXNzdF9pZCB2YWx1ZQ0KICAg
ICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogUmVtb3ZlIHVudXNlZCBzdHJ1
Y3QNCmNsb3NfY29uZmlnIGZpZWxkcw0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVk
LXNlbGVjdDogVXRpbGl6ZSBjcHVfbWFwIHRvIGdldA0KcGh5c2ljYWwgaWQNCiAgICAgIHRvb2xz
L3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IE9wdGltaXplIENQVSBpbml0aWFsaXphdGlv
bg0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9oZmktZXZlbnRzLmMgICB8
ICAgNSArLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1jb25maWcu
YyAgfCA1MTENCisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQotLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVl
ZC1zZWxlY3QvaXNzdC1jb3JlLmMgICAgfCAzMTMNCisrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Qv
aXNzdC1kYWVtb24uYyAgfCAgMzYgKysrLS0tDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVk
LXNlbGVjdC9pc3N0LWRpc3BsYXkuYyB8ICA3NiArKysrKy0tLS0tLQ0KIHRvb2xzL3Bvd2VyL3g4
Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC5oICAgICAgICAgfCAgODggKysrKysrLS0tLS0tLQ0K
IDYgZmlsZXMgY2hhbmdlZCwgNDk2IGluc2VydGlvbnMoKyksIDUzMyBkZWxldGlvbnMoLSkNCg0K
VGhhbmtzLA0KU3Jpbml2YXMNCg0KDQo=
