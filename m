Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A1EC001DB
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Aug 2023 22:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbjHHW0O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Aug 2023 18:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjHHW0O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Aug 2023 18:26:14 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC14DD
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Aug 2023 15:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691533573; x=1723069573;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=pKL1ZS9cjalCIDRRPcKjvpduJjoBZuSWXpWzHn4NCog=;
  b=eJZsvivgQcN3ydPDp0aNKWPWG84fMJguW69rzIp/WkVeM+2akp9o2A7r
   XeArByU5xE4/n8THih3oInLnY7a3HsKg6yJSTgVGbu2a7rbDylSpyr3FE
   9APxgNcMFfJ17q/lKiEF6Gs6SaJjuv1Znw6Ru5VQr8zX7InjO7D+XjYCJ
   CvPcRJ/FA5rvvH1buEKPIHzR1Wk3xVaTNU5jd0D3xeWo8JnhHG5k19eI7
   ndzOySlUhfepGM7PBUZAyAwvMSBaRaSU3qLDSg5wYRsTBSbkozpSny1qH
   R8sPAolpAjt8Rd6PfEn69sBwZBOhvbGuGx8Cvubjqqm2x86aLaIbJgNl8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361091727"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="361091727"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 15:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="874966868"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2023 15:26:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 15:26:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 15:26:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 15:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG0UcglOpzF13oQJ3pIXaQFR/eQ0MFohnErNRbUO+CEGyzJLE/l4S9TN6CRPe7RlaLRFRIk5j9AlBUoIyKqJ7mefIBwQr8TCviOBNcMKeIykLuS4vA+0EJ+sWZplC9Z5pnwcBQjlV8DRzo8nnbnqfZuyJMF1jIVfyj89sVDAo7yO8divGq8a/vt+BXCSQcgmTZsi7GKfjetmNEqMiu8ntglYEKazKs5lM2Asf0v8w2XEU3RZ1Aj56z+JbbxySJdjalVtPqAmhD3TVIBtXIS+GzxR5VCCiqT/ByhcU1pX6CPGsdIQmJdzHt1d8oHDTNc9FLQ+QVdNc5yhova0miBISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKL1ZS9cjalCIDRRPcKjvpduJjoBZuSWXpWzHn4NCog=;
 b=Ko2Oyg8Lsbim0CutwfVawsaRBnwgJdoY3oifiEoHLlvkE5za856Z8ar+58lezeHda0cUjVSZ43VMozRuw5ltBjoN4m9d6sC7P0BSKosRhVASRQJ6fHQ8Z4yBhjjz39Iy78nf5ZuE9sspPdIfuybZB8KSSGZ2SnldNLag7wOTIWyWSNXsV2/qMSTN3B2GTm+gR8z2QfP5J1dTeNae7+N02XtIxD4sm0uZxlMsGTE2uMn+igack1p6MghTmw7xcr/TwzxIvng84Ns5KTaW7SimAHq830CzS595/BXRGVbnC00NzzL4FXzUaycWb7PUBpdumuMch6TH+qgeCOZkMmezFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.27; Tue, 8 Aug 2023 22:26:03 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::7c37:22cc:1c1d:f285]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::7c37:22cc:1c1d:f285%7]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 22:26:03 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "frank.ramsay@hpe.com" <frank.ramsay@hpe.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.6-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.6-rc1
Thread-Index: AQHZykdQzaXbkyI4AUqfap4qGBky3A==
Date:   Tue, 8 Aug 2023 22:26:03 +0000
Message-ID: <9994927f661f93289b9c4c78c7346cea93c8869a.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|DM4PR11MB6144:EE_
x-ms-office365-filtering-correlation-id: 754c6359-8294-4e88-3fe2-08db985e733d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A3V8VK/PzCSxXlTzxyFDCx/EB9KHhTEFUUCwBrnyX7XAFTN3F4pEXupsQC1G4xhauueAdaUeokEoZFGK40ZPU7ZFQi7dVTDgO3HDfWDT27cCCfWeN80l8lTk0UzgEKs8B1aiHFutHHEXuwkgFc5N0CvU4zH6u2uYrEaa9an9Vd3qFSfL82bBWBmsnU6vGEYrPx7jTJMTQrr97qlvDUbdFkh/4ySstQHO5It0ObHZiRXuYsK7UXuxGfELbAuPOOlNH030PRrU5roTZnWMf/mPIKekyaQI2/2LED4SqMoobPWk6rV8NCTOd9cYSfSAd6KSuW6Vtqp/Yf9TQXwkpYoLnQE69F0f4IRjSfaIw23BzUEk5KUKtHLG/TEamHhZGEgH2M3+ZbGzUhMPAB3+IrzOhivDpgoirzWJk6/PwknUlH4r0Z+rcdDUXh3pNAJox0OytKloAZ67GAQAS/OwJY7Xku7OnNJTJPu0T/cMd1SO0wUmDh8Sdaap9q4hAYXLmV0N+ma/nuSv2gLxzDwnK1k6DcIAXS9JAfOwxPmq62J/IlDg/qUqTJ1mn/bhAW6e1ObsvWxtnmP7mt3G8zCPNsM8tb/li9RJS8rpewLQkM6aYyRAtHht4WRiiSoHgSiZ54rbnldSUfxJWyDjpi/6usKdLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(376002)(39860400002)(396003)(136003)(186006)(1800799005)(451199021)(2616005)(36756003)(26005)(6506007)(71200400001)(6486002)(6512007)(966005)(122000001)(478600001)(82960400001)(38100700002)(110136005)(54906003)(91956017)(66476007)(66556008)(66946007)(76116006)(64756008)(66446008)(4326008)(316002)(41300700001)(8936002)(8676002)(5660300002)(38070700005)(2906002)(83380400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzkyaWdQMTlvbVM5b2pTbDNDdmxvNmxFSG44R0s2ZnJiRW4rL2pGUlFvMWJU?=
 =?utf-8?B?TlZ3QTVwWTZBNWdDdGdqWGlBS3ppV3dHdDMvb0daYW1DUUFSb3p6am4zcUZZ?=
 =?utf-8?B?UWN1Tktma1RVMVFOeDA5VzZJdytFVzNHbStWcEpIdmwyU3djVmpiVWRGNjE1?=
 =?utf-8?B?VU1raTYveVlDUmwxaEh2TVNteHFIUHJpQTZrWnlqVVJ6aEpYMjB5cUpVSWNv?=
 =?utf-8?B?VCtsc3M3YXdaS2tLVjNrK0hCVm5DSlNSbTNrbTlwMllZKzU1QWdjSEFoNzkz?=
 =?utf-8?B?YjJEZCtzK0QwdXR0dFVNS2FzSW4zdmpxUFlyL1A0ZXhwNy9vTDhhVDZWcWd5?=
 =?utf-8?B?eEM5NE1GbzFPU0dENkhmUnRkYkNRR1I2TGZYdDlUS2lPbFpYTk43N2I5dkxj?=
 =?utf-8?B?eTN5Y3IybzlZN2VTQlZqUkNHSGllOHZJQVYxbU5pNXdQL1orWVA4Yjg5TUd1?=
 =?utf-8?B?M2IyVkR4eG0xOWZMeEMwQjFSSHMwRHFTVHJ5dXlxTUVyM3duTktuUzF5ZllP?=
 =?utf-8?B?SnNZVkV4cytkL3pOblIvVmpnZjFzSFdRT3lQaFVBTWtvU2ZmZ2tjRzZaQURw?=
 =?utf-8?B?TkVsZE1hejBUWVBJQ0pxSjhEeXZpL29QK1VMR0lYczdGTmZQU1ZLZ3Jhbzc1?=
 =?utf-8?B?K2twcmlJbjZsL3JseS80KzA4bzJQVHgyWVhQYXdCblkrYUZROHYwTE5TKzRs?=
 =?utf-8?B?R0xqS3FZbVlxeTkwaC95eWZXVGQ5ZEpsSnRid1dmalhCQWNOU1RiamJFODl4?=
 =?utf-8?B?TVZqSzlaSlBlbGwrV2ZqVkFTSG14eDV6Y0REU1htbWNoZmo2bFFmZGpkRzBm?=
 =?utf-8?B?MmIxNFJpUFZQajdGWVpydFlSZUg5ZWdQUWtKQUdocHhmNVlEYlVNY1FFMWZV?=
 =?utf-8?B?T2R5NkkvVWlRZlRPeGxSODVOb0FINStpeWVyOHptaVIvU1M1RVI0eFdaVEdI?=
 =?utf-8?B?L1EwcDNRb0pwWHNYaU1zeDFmSTAvYkw2THJYU1pxVkgzakcxRC9Ic1g1UWpB?=
 =?utf-8?B?YVJrU0lBTUpFZ21IdWVjR2EvSGwrNWpTMy9Dd2ZVSEJpRHF3bDI5c0x3Tk50?=
 =?utf-8?B?SE0wNG5OVkh1UytxZ0lMWjBocUQ4SllJd2JMVWNrcjNjcUpOVC8wRjhlMHlW?=
 =?utf-8?B?a09CL1M5OWZkbHVrUXRwSFpzN2VJQUdvR0tzQVhNeG40QWVQS08rc3RGK1BT?=
 =?utf-8?B?WkdCYnpvaHdZYmJNR3BTSGRXZklBZlplb2l5RHZqeks4ZGZyVUx3ZTRUYnFM?=
 =?utf-8?B?YlVKQXpPcTJFNjFMRDk0ZEZDb0FEajFISDd2ZDRmczFGSE9ISGtOVWVKdVJs?=
 =?utf-8?B?dE9IZXdROWtrOVNJaFJxa2I2MjlpUXN6bGZ0cUZXL0NaZkhiOXpTb1FsZ0Zs?=
 =?utf-8?B?NTNTbHd5SUZFRm9kOE12OHFzdnM0YXc1S1dFTEp2UXpXMmI2ckp2K1hVSlR0?=
 =?utf-8?B?bG9sOG5yaDN3SDhYekIyZXVpRE5xdFdUN01MSXlMSnhWeGRrVE9oRTh1ZmlN?=
 =?utf-8?B?d01ia0p0WlNGSWNZcWlwcS9tUE4vMVZmWktDOFEvZnBPcEVlVFRGUlVXNjFE?=
 =?utf-8?B?OTUyclAzVVdMYzR0SDNhRWtjYVdDN2NNR2lpSTkyMWhBL0diQkdjM2ZyM0VE?=
 =?utf-8?B?ekZWaENyb011UE5ESWhUMlMxdlBJcUtyMXZJVUd4TmRTaGJrcWN1VHhUb3Z5?=
 =?utf-8?B?cGFXbElrM1NGakJ0NG4zV0pSajkyTm94SUQ4Q25oMGlha0FWMGZYNnozVlo3?=
 =?utf-8?B?V2VmMW9oWTFlZlkxeGVoZ2lrc2o1TEJ4RkdJV1dJWUI2cTh2OGtxY0haU05D?=
 =?utf-8?B?OUVwK1FMRmVSYlRLbkI4ZDdFUjhiTStDdEtOZlZNTG1TVDgycldGU25MOVhn?=
 =?utf-8?B?dmNaZ3hBY3ZSZzJBWVYwSVZDRGpCWDVWa05CMGIybnB0ZnBhWURUQkptTHho?=
 =?utf-8?B?aWpWUHRFaGVEbmdIWUdubFFXdFQ2SFJ4SVlycnNYa0t0RlJuVTN6MG9UcXFR?=
 =?utf-8?B?dnRqbi9YUzExSUhpWGw2MU5FQWszWjF1SzhmdkkwMjJaUnFFeHJEdUY1bU12?=
 =?utf-8?B?QTc3d3ZZNEpMZVY2UnQzNS9kWUtvQnBWOGdGZng3aTZSYnpuYksrTTRhNEVv?=
 =?utf-8?B?VUhpT1JIbHlzQ2w3bVZGd1VwQUIzVUpqWENNYzVFK0dXTkxpWTl5dTQrcFUw?=
 =?utf-8?Q?PWJxKfWfxbQkzCeBn7IiabY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB380DC75F8E73478D1F2C3185D49201@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754c6359-8294-4e88-3fe2-08db985e733d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 22:26:03.0299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6z9VFo9kPD2TH3oqAvW3jOUqTF8XlyXLQyolOrqij+adpS5U+cIzTFysAxK99bdvpxw2nJUa13dyekHHR/rwJTFBtD+9y1zFBWmkeYaUNSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KUHVsbCByZXF1ZXN0IGZvciBJbnRlbCBTcGVlZCBTZWxlY3QgdmVyc2lvbiB2
MS4xNzoNClN1bW1hcnkgb2YgY2hhbmdlczoNCi0gRml4IGRpc3BsYXkgaXNzdWUgZm9yIGNwdSBj
b3VudCBmb3IgcG93ZXIgZG9tYWluICE9IDANCi0gSW5jcmVhc2Ugc29ja2VjdCBjb3VudA0KLSBQ
cmV2ZW50aW5nIENQVSAwIG9mZmxpbmUgZm9yIGtlcm5lbCB2ZXJzaW9uIDYuNSBhbmQgbGF0ZXIN
Ci0gRXJyb3Igd2hlbiBudW1iZXIgb2YgQ1BVcyByZXF1ZXN0ZWQgbW9yZSB0aGFuIDI1NiBpbiBv
bmUgcmVxdWVzdA0KDQpUaGUgYmFzZSBicmFuY2ggZm9yIHRoZXNlIGNoYW5nZXMgDQpodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZHg4Ni9wbGF0Zm9ybS1k
cml2ZXJzLXg4Ni5naXQNCmJyYW5jaDogcmV2aWV3LWhhbnMNCg0KVGhlIGZvbGxvd2luZyBjaGFu
Z2VzIHNpbmNlIGNvbW1pdA0KNmY4OTcyYTAyYTZjMTAzYjY3ZGMzYTBlZDliMTcyMjk0M2Y2NTI3
NjoNCg0KICBwbGF0Zm9ybS94ODY6IGhwLWJpb3NjZmc6IFVzZSBrbWVtZHVwKCkgdG8gcmVwbGFj
ZSBrbWFsbG9jICsgbWVtY3B5DQooMjAyMy0wOC0wNyAxMzozNjoyMCArMDIwMCkNCg0KYXJlIGF2
YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6Ly9naXRodWIuY29t
L3NwYW5kcnV2YWRhL2xpbnV4LWtlcm5lbC5naXQgaW50ZWwtc3N0DQoNCmZvciB5b3UgdG8gZmV0
Y2ggY2hhbmdlcyB1cCB0bw0KNWFiYzM5MmIzOGExNzE2ZDE5NGM5MDRjMGY0ZjVhYTIwMWIwYzBk
ZDoNCg0KICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2MS4xNyByZWxlYXNl
ICgyMDIzLTA4LTA4DQoxNToxNjo0MCAtMDcwMCkNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KRnJhbmsgUmFtc2F5ICgx
KToNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFN1cHBvcnQgbW9y
ZSB0aGFuIDggc29ja2V0cy4NCg0KU3Jpbml2YXMgUGFuZHJ1dmFkYSAoNCk6DQogICAgICB0b29s
cy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBGaXggQ1BVIGNvdW50IGRpc3BsYXkNCiAg
ICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEVycm9yIG9uIENQVSBjb3Vu
dCBleGNlZWQgaW4NCnJlcXVlc3QNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1z
ZWxlY3Q6IFByZXZlbnQgQ1BVIDAgb2ZmbGluZQ0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVs
LXNwZWVkLXNlbGVjdDogdjEuMTcgcmVsZWFzZQ0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNw
ZWVkLXNlbGVjdC9pc3N0LWNvbmZpZy5jIHwgNTENCisrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1z
ZWxlY3QvaXNzdC5oICAgICAgICB8ICAyICstDQogMiBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpUaGFua3MsDQpTcmluaXZhcw0K
