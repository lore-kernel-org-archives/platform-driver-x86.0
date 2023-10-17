Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2196FCDB482
	for <platform-driver-x86@archiver.kernel.org>; Tue, 17 Oct 2023 22:06:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234843AbjJQWGc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 17 Oct 2023 18:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbjJQWGb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2023 18:06:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E05CF9
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Oct 2023 15:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697580389; x=1729116389;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=05L5qg/IsVvE+Lr2Gm+4kSebWIUMwZWCk1v9QL2SsP4=;
  b=FY3C9+ADCZdpAD7qjtvkBpVV0uYH0rtu53lOyGSG+cseQheWLAKoklc0
   F1zVj+MAiXJnPA/oMPPs1UGhcRgB4xpkMKCmp/Zii78TqRRH4gCOpzyz1
   QgpCdQ7kYb5OuK4aqgEfW/hM1z4y8si584xV2JjZlnNJjVhrAS46ssvTv
   hFmA8HlccZxCHRpMzTQJcFfYA5HebT0hDBa3wzVJHGeeu69V8HgLUkGK6
   Y1GK3H6O+HoCLDuDbMgKOloZd0Ld3s9rKP+q4ciggIn629jmF1jzg9x2w
   9E/nA53ZiXz2wmEXgC9bbRvRgi0jQcift8i/vR47OpFrV9w5xrtTnOxDw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389763602"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="389763602"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 15:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="749834483"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="749834483"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Oct 2023 15:06:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 15:06:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 15:06:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 15:06:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=es4o8/8h/+XEkdPMapaLihv/N3gw6Q52HWaLEgmThvTZLhcCv9cTcnhZ+4ZwSDDWhcFdODudLQzwnYwEmeV8rzG3U8jQlbiuFUsATrqIp/MV1I2aTqbPQSUtsDJrCgdY4SMrP5sU19opiJiOA50etsQoH3iC4KOnrOD6HSQqTaWXIlMacarWhtjwNqm+Bu7NerApZEP0CKSo7qEF4MmAS0jUXf2G1sqgJo6smElJioox+xVq9ExslvG3YrKGLjDeNdvASS7wsO9RzkG8d68sBGuE6snWpQM6VBGciItLkuN+s4+x5geivtOviQmjOBHeFoOKOVKbWGoA6hpkCDQ+iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05L5qg/IsVvE+Lr2Gm+4kSebWIUMwZWCk1v9QL2SsP4=;
 b=UX6XLq50XbSQh9fgflps0xnmm4yZJlqoAbeuYfWzb0xMvi/+UyymmLChVtOcn6AMamGu8Ez/clmfxjAPnbRBkK86RMLU6L5bA19IIo4g+BgrAPJyiNi22ipooXoRX299XGDfo+8utNWSH8HgF+cDsr2MmicVBZkz0FRp1o4RG8Bf/AZ8fKfJWAf292kAWklhVdcq8wNzYscY8WdEMVHWoVlXr7y6xFayCzILRvsvx9oz8AvFrEpkkQ1+481yXPBcj4DlJ5G7+L6wcRoEuvrJSYme9pc2h47J9BGtC7sIRNFjqa2MDWBvp4OpcexUbqQlmT7gnU2vlip523pEpXWtfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 22:06:04 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::3c56:2e9f:2454:cd41]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::3c56:2e9f:2454:cd41%3]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 22:06:04 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.7-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.7-rc1
Thread-Index: AQHaAUYfe+/F/2fStEeBusHyNzLFgw==
Date:   Tue, 17 Oct 2023 22:06:04 +0000
Message-ID: <8680ce83af5ed5268bb05d87c579a42a1eeb97b4.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|MW5PR11MB5788:EE_
x-ms-office365-filtering-correlation-id: 3fe0e18d-d88b-4b0a-3389-08dbcf5d41db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CmIZGfRdl+4G/1o5XiCe/XtYv4WfbDTDmPPXpqwYLSo6oL6Yh6An2FmXBI8u0RKTpzDQ7wEctvaa0OHQrH9kWIQv+lkgGrUbrliuzfF0GYUygnqBvKpwe7wFXHgTej+c6Rba+RUQ1RbRdqHKlGefgVqRvpDJofr5Jgo0Jq2X7+HIg8tiL8Xx8rN2y/NijB4pHSdJ5I3RMuzuPTiN+UFrs33KLQfL7i+fAywspYr1CoHQU6GU+TK+vlo9OwbKBptdoJyVm1WmbzYJw6cHrsEeHrbgg5M7tqqlT7YyAWm3wbh6+po54meAWOfEp4hDHlgB5wPf2s6Ou03XJwRLxH8MsnWgMrpGTDO5d5/rP5wRBVtQjYWZsCKWvWOB3SSvqKZg8sc6ZvjFJiuOEOHnMjX27tfC+Qu6NSmDyvhhSGnpqmW9Obf+Ma3/l5BektHIPECF4LDJe3ijih8HIjHsPKEu2pZX+SJ0oAywcVPotihiJNqNv/EwWokjXQWvlDkDy4vSbZ1IX2viL0CiHmdRl0hcS3fJChpbO2hC08lMKr06lr/2AidF2hr7NpqD3D+KlKcFg/ZhzkYp/JLv8osFYo3SLqPdfJhjne8n5rDSP45AA9Oe82COfsVN6BUDYZJAepGYMS1u+kiHJL7vKa+5Ap2Gkw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(366004)(396003)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(83380400001)(122000001)(26005)(82960400001)(6512007)(38070700005)(38100700002)(4001150100001)(2906002)(86362001)(8936002)(6486002)(4326008)(8676002)(71200400001)(66476007)(36756003)(110136005)(54906003)(76116006)(316002)(66946007)(66446008)(64756008)(66556008)(91956017)(41300700001)(5660300002)(2616005)(478600001)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGhQSmd3bEZjY1I4QjhDQzZXY2tJYkRqdVRQNjMwSFJQQTdvY3l2Z3FTMGVF?=
 =?utf-8?B?N2lCclZrMXBpNkljMlN2b2Z2Q010YVBhZlMyZ1RmQUMzdjVIU3pKeWJ6NHhY?=
 =?utf-8?B?NDdrVE4xYURRL2xQNzZ0QWZYcFF5RkNkUVliTGVETm5Wc3dHQVVGeEIyVUZh?=
 =?utf-8?B?Y0Y3U1g2eVUrWExRRjRjNUc1R3hISm93NENYbVoxVzE3cEFFODNzUTZHQkFD?=
 =?utf-8?B?RXpxUmlOY0hPT1kySk1BMHRGdFR1d1IvWnpXOVhjVVlQb2tSU1RKaWJMRThV?=
 =?utf-8?B?d1plVndwbk95WHhCYVJaVUluYjY2aGZYeUVpM0FydnNRVUNGSVJ1cUZUbGM3?=
 =?utf-8?B?L0laSElwRkhDOVNFcktCeWlUcDBtd2hlVCtYcDBlZGsyMHZuQ2MzVDB5SUww?=
 =?utf-8?B?cElEQXBWeUdVcHQxcjFiODNMQmR5czViMkFuNXdjOHYyVUluQnFhcm9GTUhY?=
 =?utf-8?B?Qm1IN1BzZXRpUmk2MEtBc3dodnlPeDE2WDd2NzFONEhjNzR4WEJ3bnhVeVlh?=
 =?utf-8?B?QVVSSURlTUljUVJscnI1Z1pTSG1ZcEliQWIxYXRvS2VDMGxNTGkxdnhEM2VV?=
 =?utf-8?B?emZJUG9LQWo4Vll6ZTFPdWluYUwzRC8xUUdLMTBTdCtrOVZzYVArVitaSDJh?=
 =?utf-8?B?Nzd2b3pwcUlnam5OODVvRUR6akNXNWVvNVN2NHordHdtYncyeTdsTjNycGVx?=
 =?utf-8?B?TDMzUHlkZ3ZaM0YrQlJTOGk5RWUrNjFzVDMvTG1OZ0ltOGtCbHNSSGxqenIv?=
 =?utf-8?B?OXJ6ZXREVXB5ckd5Zndjb1FWamhMR0lXcHBoTXFBcTFtTlduelFPRXl0eWZE?=
 =?utf-8?B?eXJNTWZMcnA0Qlp4VWtDRXd6NlNCd2xVOHdqNm84MmpPN09pcTZmaDB6b3ds?=
 =?utf-8?B?UjB2SU5nQytTbDZZY05yRUQ1NTVVT2pmNGxJQWRCdTZmRXo1TUpmbnpJN0tP?=
 =?utf-8?B?UFl3TERNYzV1U3dLSWVNNE40aHgxS3hhOEsvc2M5a1A5QkljZmZJRndMMDF6?=
 =?utf-8?B?QWhjekNLWk9WakdybE93bFluMVZyWllIYTJmeVVGei9vNGE5THRCdlVKRHk1?=
 =?utf-8?B?YkF4dDFXcUJIc2luQ1hDNjZCM3c0RmdsUmVvZDk4bXJTb2UranN2bDVTQ21i?=
 =?utf-8?B?QUJleHZXTmZQNGVVdmlXOVJCZmlqelBuUHB1cmR1aGNObUNWY1NmSnp5VjBD?=
 =?utf-8?B?VmhYU0tzTzhGeERZbmFBakt5N25LL1RiTGcxbUo3eUs2ZWZlcGlWckNxUWlv?=
 =?utf-8?B?QzkzWkhTcU1jY3U3emRtcjY3ekkxckhyM3FxdkxXZDd2YmpqRVBRVCt0QU5k?=
 =?utf-8?B?eGhuZG82bTJCMy9LYklnRHgzdStDS1RQU0liSVVEKzNFYzliYVRRb1VlWGh5?=
 =?utf-8?B?Rm5QSVlDbXZBdjJreTJRbGRSRGRReEQva0NCU3FUNm0vNytJbERzMGhlOU5E?=
 =?utf-8?B?RHE3T1Z5OVlRUFJyellyR280WFhGSEhBQ2cxU2NMbjRyOWFCc1ZUczRVcEdn?=
 =?utf-8?B?ZEZOS0RPeDUxck55alFJc1dUeGRVNWx5NEs5WEVkdzdBK09pSklxS2tGejI4?=
 =?utf-8?B?WkJLU1VPV1Rnd0pKTDlua1NzWUlrU25jRDZrTUtORTlHeTFYV3UzeHhXUHNm?=
 =?utf-8?B?MmFoUko3Mzk1NjZScVNid2xPUU1FNjhzL3Y0M0MwREtGMGlrQ3BSNk1YcXhS?=
 =?utf-8?B?dG05bzJacmp0M2YvQTNWVVFrTVNZTTA5UUdZUE5WRmZUN1RoV1JneTkwS3Jh?=
 =?utf-8?B?cUMvUEVGNDBGbzY3V21aNHVTMXh0ME5nL01mVnJXcmZwRGpjMHUreHd2SXh3?=
 =?utf-8?B?akxDTWVtcnczVEZ2bWJtWWtmSllSWXhKV01hYWhkczJHT3FMWFB6c1RBWlVQ?=
 =?utf-8?B?VG5kZ1NvcVJ4NGMxV2R2RzZBemU1czdKR2tpdk93WXkzWnE4dzM2L0daTEVo?=
 =?utf-8?B?YS81UkRGbHFzZzV5SmhQdzZMTkoyZndBeEJ0U2VGM0NXNk1NSjRwWmJtcHE5?=
 =?utf-8?B?S2F5Nzh6eCtFNThKN0JBTnZkb21MbDY0MlJWZTlSU0xseXFBS0RIaFdoZjRO?=
 =?utf-8?B?OGk3UWErRlcyMGh6ZHNIMG04RTdkWHBZc1dSeVE2ZlFpeE56UXloWG5PU1Vv?=
 =?utf-8?B?RGwyU213UTJ5MlpYNFlVejFZbVhuejR6UkJyTFBmSVk0NnZQMWVVK05DMUtU?=
 =?utf-8?Q?he2T3jWVwu28uoUbhsVj+SQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D66F7C5C42239D46AE7831CCC596D6BD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe0e18d-d88b-4b0a-3389-08dbcf5d41db
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 22:06:04.6640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7NjOc6KnEfQJeqQ1mE8cRPsOQg9Z/twyYJ09qpUn1uHwD7auY4pUoXj3JD+3vBoQcASYu7Iyy0ShD/sSCBrIrN5IYa/nTMfSeR46KY8BS3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KUHVsbCByZXF1ZXN0IGZvciBJbnRlbCBTcGVlZCBTZWxlY3QgdmVyc2lvbiB2
MS4xOC4NCg0KU3VtbWFyeSBvZiBjaGFuZ2VzOg0KLSBDUFUgMCBob3RwbHVnIHN1cHBvcnQgaXMg
ZGVwcmVjYXRlZCBpbiB0aGUgdXBzdHJlYW0ga2VybmVsLiBUaGlzDQpjYXVzZXMgZmFpbHVyZXMg
ZHVyaW5nIGxldmVsIGNoYW5nZSBmb3Igc2V2ZXJhbCBjdXN0b21lcnMuIFNvLCBhZGQgYQ0Kc2ls
ZW50IHdvcmthcm91bmQgdG8gdXNlIENncm91cCB2Miwgd2l0aG91dCB1c2VyIG9wdGlvbi4NCi0g
SW5jcmVhc2UgbnVtYmVyIG9mIENQVXMgaW4gYSBzaW5nbGUgcmVxdWVzdA0KLSBGaXggdHVyYm8g
bW9kZSBlbmFibGUvZGlzYWJsZSBpc3N1ZQ0KLSBFcnJvciBoYW5kbGluZyBmb3IgaW52YWxpZCBp
bnB1dCBvcHRpb25zDQoNClRoZSBiYXNlIGJyYW5jaCBmb3IgdGhlc2UgY2hhbmdlcw0KaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGR4ODYvcGxhdGZvcm0t
ZHJpdmVycy14ODYuZ2l0DQpicmFuY2g6IHJldmlldy1oYW5zDQoNCg0KVGhlIGZvbGxvd2luZyBj
aGFuZ2VzIHNpbmNlIGNvbW1pdA0KNmNiOWM4NjM3YzY3MjU4NGQ0OTE1NTU5MDAxMDIwMjM3ODQw
YWNiYToNCg0KICBwbGF0Zm9ybS94ODY6IHRoaW5rLWxtaTogVXNlIHN0cnJlcGxhY2UoKSB0byBy
ZXBsYWNlIGEgY2hhcmFjdGVyIGJ5DQpudWwgKDIwMjMtMDktMjEgMTg6MzE6MTkgKzAyMDApDQoN
CmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0
aHViLmNvbS9zcGFuZHJ1dmFkYS9saW51eC1rZXJuZWwuZ2l0IGludGVsLXNzdA0KDQpmb3IgeW91
IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8NCmE1OTBlZDYyMjY5YTA0OWE3MjQ4NGNlNjE3ZmUyZjM0
ZTJkYTY2Y2Y6DQoNCiAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogdjEuMTgg
cmVsZWFzZSAoMjAyMy0xMC0xNw0KMTQ6NTQ6NDQgLTA3MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClNyaW5pdmFz
IFBhbmRydXZhZGEgKDgpOg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVj
dDogU2FuaXRpemUgaW50ZWdlciBhcmd1bWVudHMNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRl
bC1zcGVlZC1zZWxlY3Q6IFVwZGF0ZSBoZWxwIGZvciBUUkwNCiAgICAgIHRvb2xzL3Bvd2VyL3g4
Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IHR1cmJvLW1vZGUgZW5hYmxlIGRpc2FibGUNCnN3YXBwZWQN
CiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IE5vIFRSTCBmb3Igbm9u
IGNvbXB1dGUNCmRvbWFpbnMNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxl
Y3Q6IERpc3BsYXkgZXJyb3IgZm9yIGNvcmUtcG93ZXINCnN1cHBvcnQNCiAgICAgIHRvb2xzL3Bv
d2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEluY3JlYXNlIG1heCBDUFVzIGluIG9uZQ0KcmVx
dWVzdA0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogVXNlIGNncm91
cCBpc29sYXRlIGZvciBDUFUgMA0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNl
bGVjdDogdjEuMTggcmVsZWFzZQ0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVj
dC9pc3N0LWNvbmZpZy5jIHwgMjEzDQorKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1kYWVt
b24uYyB8ICAgMyArLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC5o
ICAgICAgICB8ICAgMyArLQ0KIDMgZmlsZXMgY2hhbmdlZCwgMTY4IGluc2VydGlvbnMoKyksIDUx
IGRlbGV0aW9ucygtKQ0KDQpUaGFua3MsDQpTcmluaXZhcw0K
