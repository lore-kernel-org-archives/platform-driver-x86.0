Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E32CDB48B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Oct 2023 15:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344763AbjJRPqE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Oct 2023 11:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjJROpT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2023 10:45:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C838A94
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Oct 2023 07:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697640317; x=1729176317;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=j0HvSoAFzcGRdPy28+52FIMa94Yb2Hxg2Z1afvCndOc=;
  b=KsepBZ7UQLCMYuIb12fOhjt2MoIt21Vr3h+VNyeM8Y6PtpBiFgKmq5po
   DEOHirWr+3khniMRpzBII1M1KXt5KMFAl+7CveUoJ74s7VXnTUJORLi0r
   gTHWGdOO3wyzD11g1LRwoaT9gRRM8USADEqiVWiZq2Pnyiwz3WB6IVoBc
   rTuYdchI3AoNrO2rp214b6Kv0sgj1HN+ykg+80jZPviB1fVobZhtabJVP
   9Q4lbwcjaXnBzNTxV+iuft7OdJKwURdFDg+H9Wd1nnMUxeqGFqB7XSUPW
   x265F1zzSaI5us97ppBAhMdV73ShgHavZjEj+XrWY9e89Rbh0WbSTpC9l
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="472253216"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="472253216"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 07:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="785952379"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="785952379"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Oct 2023 07:45:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 07:45:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 07:45:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 07:45:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPNk2Dx72G95erf/xpFSrFh4FOweY8LycnyMV6JbRGp9SlBr6qy+ig06+2uRkjaQET6KReFT6xCvbuAgoAt6IlauA1cCFs7/+opvpHzYitCQbr7SafhPmJCBcH/u3BWRhLfM3zpS41UsERdjVdgnBg71+ZhvcqUY0qpF0SG4ZdbpwhzTfc+SEfCXwITpcy6AM9OF6xj1b/cHSn4a2n7t34CciJu4DzdEap4ls2TyXF2ZfVzPmFMhnUGfV4XBzrsZrACkrFxb7NmcWSCQyLgcx6P8qq0byy5D+XZEoaPMkxRRtXemAWNZO2FQFjqy644FOqypwF8wwy7Cq30dyY6NHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0HvSoAFzcGRdPy28+52FIMa94Yb2Hxg2Z1afvCndOc=;
 b=lb2F2YI968vUuh7tHXUt8Wpq2vtC3K4s8LpebP28tuNehaaO12QNBzBC23Ql6hQh1RZmynz8vsKRF5KPaSIoF81GS4MJDiFCzfV1wN3vvdGsz8lkFude8enEBeGWGmWNJco4ysyrNxWfsVDwcoMwo3VoTQvcFdhtvkYDg3/vpTlygKnhfPDKZnjyJmtp6KU6BFUCMyKmrAIggsn6m3Sr8wkJQTSCYu8SyUwaJ0CVjwGdezXDDbw7dDZ3U16Kwjs3QMWNoMsJ0oHZ+whe8cl2dsuf0o/twm1JQ5Vl/7rSUCe1kFaIMlSCAqkqOnYzAnpdTzCjm5EvzX6PDYgAEHEsgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.23; Wed, 18 Oct 2023 14:45:13 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::3c56:2e9f:2454:cd41]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::3c56:2e9f:2454:cd41%3]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 14:45:13 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.7-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.7-rc1
Thread-Index: AQHaAUYfe+/F/2fStEeBusHyNzLFg7BPkggAgAAHVYCAAAd8AA==
Date:   Wed, 18 Oct 2023 14:45:13 +0000
Message-ID: <bb46e987d42006576bc8503144efc81130597974.camel@intel.com>
References: <8680ce83af5ed5268bb05d87c579a42a1eeb97b4.camel@intel.com>
         <c5c44896-9460-1e5f-51d1-ef8fca040011@redhat.com>
         <e64d9868-34b4-a7ae-dde2-3ea7bdef96b0@linux.intel.com>
In-Reply-To: <e64d9868-34b4-a7ae-dde2-3ea7bdef96b0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|IA1PR11MB7891:EE_
x-ms-office365-filtering-correlation-id: e274c0a0-ae58-4954-f92c-08dbcfe8d614
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ENW7YynKMXjl3HWIxrazM3vgAROQiyYOXBFxl08xfXdyZjEDpjHvoWKXx9Y0UAFl6y+b+eeAluFZTICRhvp5l+eNy8m0m00T9u0T5JF68BtpK9/7rP+lla3apicWWnTABqQThnZ9EZ3epKg7trTbBZ/lKLbGFyf8gAjBIuS+tqmHCXMXK0nST2N95oTmkDbs+8n/tL9mQSwp79Sku+/6EJzbZRtfXeFs7n/dGhWVWjSkjNo7cBpGHpc9qGUm4TD3EeCogNoK8TiY37QitvQgTWNkOvwavr//FOo/NtpKUqsZj6oIt+wUNZWevV0b3RxwmLzp+lgMIe0c+1jxtbhPhZScR7eBhpztvmXvJ9qYNtbEsVzm42uBMeAIOCOk7h5Lc6kLSdJNEXX9YTOab9eB9cypaUuBTLlPpG7nU6CKFtRI2DdDz9K9R2EzIiiHK1tnaiA/6hbn75ANwwM+sqSYIJUcMsj1QAfSAB1w9pWmRMx2PfesqBZRqUIh1qOuntblXCUS3RkVzB5ecDuidatCuGLIUSsZl2fg0TF3JD3yekCZw38cToT9NbIlyMDqpcDL0KX2OQ1oAAKrFBoaa3b4QQpGJ9PwSsuaic7EZn45gyQXDvlomEEsu+ESrHq36t5Q
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(376002)(346002)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(38100700002)(478600001)(5660300002)(6486002)(66946007)(76116006)(91956017)(110136005)(83380400001)(66556008)(4326008)(8676002)(8936002)(71200400001)(86362001)(4744005)(2906002)(41300700001)(53546011)(6506007)(38070700005)(54906003)(64756008)(66446008)(66476007)(316002)(4001150100001)(6512007)(2616005)(122000001)(26005)(66574015)(36756003)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFkwKzlZYnhQQkdGK0Y4dWo1R2I2d2JJdjdvU0ZvSGxlWkxOVWdTcEJxdEcr?=
 =?utf-8?B?UXhLRGFLQVB3cVAwR1B3eG1taWRrZWJiTjMyTnlHYWY2bEZ2MjdtelkyQjM3?=
 =?utf-8?B?MElkRW1icFkvRnFYNXdDOFlVcmdVT1NzMUtQYVlEUU4xOWhJckRtVklRUXE3?=
 =?utf-8?B?MXBKb2twTEtNbmtnK3Zrekw4by9ONFc3UVRuYjBRakYwQW5yNjB6b2k3VG52?=
 =?utf-8?B?ZmJXbEVJMzNnRVMzMXJDejhOK0wybkdpVDRSMlJ1cTRtRmtZM2dCaEVySmU1?=
 =?utf-8?B?QzlWbzNpN2gvWnFyQUw4RmlOQlpvL25jaHdGbC8xQWdnOUR4SUNtZFJWRTNo?=
 =?utf-8?B?MGYyZ3F6ZWx2WERJRVZROVlGVmozOHJ2cnZad2NkcDVoQW9JQm1DQTNzUlA5?=
 =?utf-8?B?TW9pbnJmYzhVaGd0RXpBVkM4bEtPekJudUJXdkc1MklScDFPbm95aTRhdTJ2?=
 =?utf-8?B?YkxaN2ZlaGRKaE9RMFZqMmhwa0t6bXZpKzlaSjJxMU9oSFFVeGNyY1dhUnND?=
 =?utf-8?B?RExMTDBlTGk3czZLSmI0TTUxS3lDRkZEWmwybzRVSlQ4YXJKd1JnY1RsZmRj?=
 =?utf-8?B?eGlWSElZVzJrcHNYKzNySEdCU3BTdGhNano3Q0Q5WWd1cExDOTNBMkpBSm5W?=
 =?utf-8?B?Uzc5VXBFcGFmZzhwd1p4S25vZjBjaHZlSFlGZjVjZ3BwanpOMkJjOUJ3WWFK?=
 =?utf-8?B?OEVPcXFnYlJrblhYTzE1bWQvNWVKeVFoM2FKeDB3VXlsZEpVVXdnVTJrSWNP?=
 =?utf-8?B?U0ZZa04rSkcrL3IrSXUwWC9ySzdJWHNGZG5nNEl5VmJWSU51a2F0VHlzRVRa?=
 =?utf-8?B?SWozTG90b242SEMvdlowc1ArUFdjQjVPZEZyVFcxWDg2L3JHWU5ndGJTell2?=
 =?utf-8?B?ZmMxSkJrK3F2b2pwcVVZL0VmU2hRaE85ZlUyK2Y3cXhVaU8raXpCL2hCTVR4?=
 =?utf-8?B?b0NMdlFsaFpOSE11ODBJbmNiUDJEUm1sQzFnMW5kc0dIN3JNc05VQnJuY3pX?=
 =?utf-8?B?dnRvZjRXME9SZ240ZWNlemxWTFhjQXg3aFNxM1hhWlY2TzFwRzg4bkhvMTQ2?=
 =?utf-8?B?ZWkvSm8ra08ydjRydHFMNGVoK1pCc2hTbUloYWVNZVFNd2V5SnhpVFFwcVdi?=
 =?utf-8?B?OGZtUmorZTQyVlpOMUFrY2tHY3VhbHJWdEN4RUUwcTVRQ1BDLzI1cUZGRjF2?=
 =?utf-8?B?UityZ0luY2R5bTM5Wjh3Q2tnTXhOc2gwVGxSMUl4TGNvRitpQXBrU1dyZnRV?=
 =?utf-8?B?UENwZ3lYNUJOTy9heVRRNnZ0UUUydHBmcnMydmpGTGg2aVdOdkQxNHl2NFd2?=
 =?utf-8?B?MmVUd3J6a2NDZEVVdVdDVlowTEI4ZXU1R0d1UVVHVU96ZUc0Y09pOWdZaGRs?=
 =?utf-8?B?QkQ5amttc3ZEMFBoR3hHa0FmajlVVmUxdFMwMHBUeFpkaDlDZ0FDSE8yZlJh?=
 =?utf-8?B?Y0ZpNkR0QXNvN0ZBNkhrcFFYZXBnRlNLVXhPNWlWb0VpR0dlbklSRFRFd0wr?=
 =?utf-8?B?WFFYc2RwdHRESHlvTFlkUm9nQVo1Tk1wQkRFUE1JYTU3NGNJRlFmMisvWmM0?=
 =?utf-8?B?MTExWUQ4K29VamxOaGtHOCtiTUM1dDBrckk4ajFDRUlXaTB1WDVDcUZiWUwx?=
 =?utf-8?B?UlJJRzI1a2tFQU5acGJjZi9CWXRnaEpWNU9vbkcxK1pKbFRpdUhPZklmYXFx?=
 =?utf-8?B?WUxteHloR3ozemQ4b0xMRG1HRFBmYTVkNmVEbkZqemFrT3Q3YmpkMkZDNGxD?=
 =?utf-8?B?WFUxWVhPbCt5MW1aYk9zZnJ4aTRjajRpeVFiZ0JlUlRrTElXT0xMMmE3RTZI?=
 =?utf-8?B?QmlMVUx1RWVuRXBtc0Z0Y25ablduVzIzaUdDdHg2NHByOEpONjBkVW9GZDdr?=
 =?utf-8?B?V2YzdDhTcWIwWkZpNWhzcWVBcnV2ZGZRV0dzSHp3NDRsT0o1NDZsUFlxd2F1?=
 =?utf-8?B?WmlBOXdtNUpsNkdmZG01VGQyK1ZUMkdsSXY3U1NQUFFCd3g5NGg5b2dXM25y?=
 =?utf-8?B?YWhYdGh1dCtlaFJwbm0wRkl2UGViY1dTcGtDL3pHVjNIN2UvSVpYUnloTEpI?=
 =?utf-8?B?Z2V0RmM0OGNZeG96R29uL1RkN29zRGNVdGl5YVMveDNSaUNZN3Ava0VvZXVs?=
 =?utf-8?B?ODBiendyU2Q0MkJRWWxlZ1U5M3UzL29KOHR2c2JkSU51eHlSNzNXWnNxaFRv?=
 =?utf-8?Q?4rLy3kqQGVRD/4tKYUbhUZw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F31830B6E1B2AC43911A349666D171BD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e274c0a0-ae58-4954-f92c-08dbcfe8d614
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 14:45:13.4047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwtQ/dW869Wg9oYjTHmvPuBOs+8/bsZovrv17UTw5ayxYwzQaNn+BUYw+4h2rv4mpwHtQcGdkgZo/aAYzbOLF6bzUL07d2Uvrw35PMv44s8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7891
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

T24gV2VkLCAyMDIzLTEwLTE4IGF0IDE3OjE4ICswMzAwLCBJbHBvIErDpHJ2aW5lbiB3cm90ZToN
Cj4gT24gV2VkLCAxOCBPY3QgMjAyMywgSGFucyBkZSBHb2VkZSB3cm90ZToNCj4gPiBPbiAxMC8x
OC8yMyAwMDowNiwgUGFuZHJ1dmFkYSwgU3Jpbml2YXMgd3JvdGU6DQo+ID4gPiANCj4gPiA+IFB1
bGwgcmVxdWVzdCBmb3IgSW50ZWwgU3BlZWQgU2VsZWN0IHZlcnNpb24gdjEuMTguDQo+ID4gDQo+
ID4gVGhhbmtzLCBub3RlIEknbSBjby1tYWludGFpbmluZyB0aGUgcGR4ODYgc3Vic3lzIHdpdGgg
SWxwbw0KPiA+IG5vdyB0aGUgcGxhbiBpcyB0aGF0IHdlIGFsdGVybmF0ZSBtZXJnaW5nIHBhdGNo
ZXMgbGVhZGluZyB1cCB0bw0KPiA+IHRoZSBuZXh0IG1lcmdlLXdpbmRvdy4gSWxwbyBpcyB0YWtp
bmcgY2FyZSBvZiBtZXJnaW5nIHN0dWZmIGZvcg0KPiA+IHRoZSA2LjcgbWVyZ2Utd2luZG93LiBG
b3IgZnV0dXJlIGludGVsLXNwZWVkLXNlbGVjdCBwdWxsLXJlcXMgaXQNCj4gPiBpcyBwcm9iYWJs
eSBlYXNpZXN0IHRvIGp1c3Qgc2VuZCBpdCB0byB0aGUgYm90aCBvZiB1cy4NCj4gPiANCj4gPiBJ
bHBvLCBjYW4geW91IHRha2UgY2FyZSBvZiBtZXJnaW5nIHRoaXMgPw0KPiANCj4gSXQncyBub3cg
bWVyZ2VkIGludG8gcmV2aWV3LWlscG8sIHRoYW5rIHlvdSBhbGwhDQpUaGFua3MuDQoNCi1Tcmlu
aXZhcw0KPiANCg0K
