Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B3EC04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 16:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiG1QD1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 12:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiG1QD0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 12:03:26 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B86E6BC15
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 09:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659024205; x=1690560205;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=gcmhSvunfvf0TztkosAQoTO8Ih9Lzdm7TGu/z//+tE8=;
  b=FvJGiH4AoSdn1C73niD1MPKLqrWXX56YRrqrhj3LP4NxsorEauz+sMzT
   w+lhQ21oZklgfJ/EX8N9PrXFE4wirblw8FhZIa0k9zajCP7CGSZYOOwbc
   4YRwZMTVOl7xQF7r6qYo8GuUUoGf7qb555M9jy1eKlcB8nJgcMtYcVq19
   HfUmsLWOIRNwnIkNTFxQppARHnifqadoonlZUZkMOUxQlFQUIwWaH1GAM
   MEIfe61TCQMSphK/tFtJ9NXr0z2QyN6SYmL2H/6Q1gUEf8LD4Z3lhUWDO
   j+F8rmxpyETld0487S7qJbzdZNQDrV0sedTioSAW2cM6MmJnPFo/cd+oY
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="350254002"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="350254002"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 09:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; 
   d="scan'208";a="743170853"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2022 09:03:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 09:03:16 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 09:03:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 28 Jul 2022 09:03:16 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 28 Jul 2022 09:03:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F04vfI/yiqQmMdrDOIXjD0Nrg/LaBV7Sbd5KxE3R9YaUusX+uVAcR/5MEU7Ujdvt13DBFC3pKQhJ/Rkm3HwMICpJhIkc4wkc00KnF4h1dfCk704Bt85nlZDWjQhpo5AMls30OZqxQR9SQHaaaQhhjQcdzOg3BbuBrmwe4GhOdguW3ZZJFRheXkM3znBX9yNyw3kXf0uasHWTMWYlfJUxWlOoXlj1XadTonYU/qHjU4+eUN3SuASE2yOEb6Z1bYhMDXB788mDuEoxvMYp9g/vAjb5I4lvePKESJdSareg+FB3jQ5Pgdmp23mAWonj0sPEviwwkE96yey+M8/VtpCMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcmhSvunfvf0TztkosAQoTO8Ih9Lzdm7TGu/z//+tE8=;
 b=aYZWHJ6BZfuw2q77quCZ1h+w1Tgcg+hs8FG+/Jg7aEVg8yzKXzQ0gYdb2uIAb1VIUhF28OPgtxctfhCWWx2WvG8MAea1S+V4DxFjjNQ7dUmjWhf2Jp6BqAMva4UC4k1q2HYpZIw8glAPA7GfLNl6rLkwYVloYXAl0rOa5dXUB3IccZPsxnjbA/NCyzT7/TP+roDy14RkMOUEb7Lb02zvLtyu5f+jGO4J0Qlzt2cS7Xl3etpdl6/nyYDPmQXcD1zUpAf2GUikQj0X4GWx3Jfwt1Yt+4XDgPEiNARCqFGv4iDcUN+XMJ0+xyhDOb1DIvwwPJxihxHPFigLYRbyu03Scg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 BN6PR11MB1410.namprd11.prod.outlook.com (2603:10b6:404:4a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.6; Thu, 28 Jul 2022 16:03:12 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::edfb:f0d6:92aa:c7ee]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::edfb:f0d6:92aa:c7ee%6]) with mapi id 15.20.5458.026; Thu, 28 Jul 2022
 16:03:11 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.20-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.20-rc1
Thread-Index: AQHYmsifSXkGEAVo6kazuh6l+TUgx62T5OwAgAAckwA=
Date:   Thu, 28 Jul 2022 16:03:11 +0000
Message-ID: <825cc2af82cda0a408f279cec6632920ff1193fb.camel@intel.com>
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
x-ms-office365-filtering-correlation-id: 352e6535-a1bf-41ef-137d-08da70b2ac0b
x-ms-traffictypediagnostic: BN6PR11MB1410:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eC2UBn151p+Ilkn8RejwUfPAvIZKZVhwWHYeMiPNkW9T4z2MgHKwmKhnBJ+yz5SeVF9b42LaQfS/xAQOvNJuP52FBQ7Pqw4+TFlzwDLpAyPBSnTEuUZcMyJZx8K9jII861Us5IaAGIiO2C/2eeLfLAFkKO0/rdhSvZ0yyn/TaBwfiRcGbnb8tQ3NFLcKNmFKYSkShtl3fX2Xf+v9D37B0l4Wnj8GIw/b7Gt2jxPqTp3JeT+cj1/ezKNmOOQDeLojy8X0PZolW6Bu/QQujaAvuhqAb7V1hrnsPP5MUhZEgNHTx68Xo4ZnHZ81CO2Eo9K5wSqUIW0CJeZOAC7Dmb8mXykY9wqwLmVCyMfEpfWXArTzRYEXjXQs/BVHO4sDfFQt6E2Gn0kFMN+AWuV4Nr7KnrBWR8QolNJbqlPzhlp+8e8HUt9lMLXY0RvMGx6T+QTuKhoNNKNpj5Ok4A+zqidfW/YwoQqAe+r9DdNQjgdjNb9l1l7zCI0ekZMn5lpbtsTi8jk6J1V4ualQlYtzzegthJN4zvqv+oAXh8OWZa9DtyV7irSfnm+feWngPKPUzTvmVWfaeMJNWXK1PewvELnhxTFY6uIjmxBpwKX5kXP+dX0b8prpg02Gi3mm4PvW9bhtoZJYM9JWKXB0qi3nhKQvEaGuq4pnhJJrrTB4uBA6q/RwiwcwcVitNI+u02aEoedSOli4ZV6h+JzZoqop83l3zPM2AZJIZOEQ+wET1K1m3PV0yVlSxhJQ0n2WxDjUygH4UDCfEG3HIGTRwhHd3sshGk0lTtn5qiW0xECIVNPFJXfHvr46wqUdECpogTR75QJaELSyJtPxwjn4UC8FoysyeA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(396003)(376002)(366004)(346002)(122000001)(38070700005)(38100700002)(41300700001)(82960400001)(5660300002)(6486002)(8936002)(966005)(478600001)(71200400001)(83380400001)(76116006)(66946007)(66446008)(64756008)(2616005)(66476007)(66556008)(8676002)(4326008)(316002)(91956017)(186003)(53546011)(110136005)(6506007)(26005)(86362001)(6512007)(36756003)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3krS0JTS1NMNWh6YVBISHNXaWI5am1acDQ3ekYwREVxWEVXWXBIV0xjQVhy?=
 =?utf-8?B?Y0YxUGJPNE55WmhWMHU4K0RIUXBiSDJLSHIyZGEzM3hDb1JDV0ZGZmlnTFE5?=
 =?utf-8?B?a1Z5MlpNb05rZDVMK0o0MnpIOHRMN2FJQ0RSLzJFK081bEtlNGtGUFhDMTNv?=
 =?utf-8?B?L25TZUduSTJoT3JLdkRxd015STZTU1MwU3AraVd5dWxXWlc1aXNIRWdWNUVI?=
 =?utf-8?B?RFpmcWhzU0R1VlVCVi9nMkQ5TEJ4N3BuTFpTVDFYaUhxQzNvNnZlbHVLUWF1?=
 =?utf-8?B?RHJLbkRaMmZMNE9YWnZKVVp0YjdzRE9FQTBJMlp0WlI1SVNwelZMWWtMUGI2?=
 =?utf-8?B?aGcxNzIwQjVLQ2kxL2xDTmt5NDJpTFFtdzVuT0xTU3pUMk45S1kreDE4eDhQ?=
 =?utf-8?B?OFN6SVJPQk5KMXlpZHJ4OCtsbVhMaGtLb0k5M3FrTUttUzcyYjUxNDU2L3VY?=
 =?utf-8?B?MzJBVHJLLzBjenVsSVJDcW44VHJxd2c0MmlPV3RoV1U0STNjRWlKclpsemdu?=
 =?utf-8?B?ZWMvWUxlMUt2NE9GaHRKNEt0bGswSEZaVnA1emdSVWdkNnNoRVVIR3hhUVFF?=
 =?utf-8?B?VXRKNWpYNkVLVEo0VE5CUS9TekZBVzFmUzdUQTJVOHlzbC82UzJvR1lXaVRG?=
 =?utf-8?B?S21xWjRvWnVTMTQ0dURIckR4elE0TFEvQkhlY2lNeHVBeW04WWVDNnE5WjN2?=
 =?utf-8?B?bzZobURZN21NUUJyQWxSSzNtUEkyNzVlL0ExM3NiVUNMYWxhZVlTbjE0R29k?=
 =?utf-8?B?Z0Z4andOTGRhb2ROMWh2ekIxeFdUQWF3cGlRT1QrZjZJVGwrN1QxYmtwMUxL?=
 =?utf-8?B?em9vN0dZTmREY2ZFaVVBT0k0enVIZ3VPN3J5OW80am0vQUNQTFNLcTBuellv?=
 =?utf-8?B?ajJpU1VjbVBIVG03TmFNbVc5QmJmWVl3ZnlqWUwrSzI5aWEzZzZ5Z29pMXd2?=
 =?utf-8?B?MUcvOHNwUmw3SXJrZUgxeCttZ2tEaTNMSXpZeW9EdDlkZjFvV1V2WlVnemEy?=
 =?utf-8?B?N09GeEU3MFlQN3BkZk1BRWZNcTR5d3pkVEpYVDdSb0FNYWtSOFNFWWJYd2Jz?=
 =?utf-8?B?dGhvWmxocGNTZ0dqeElRU2I5K3BNSTk4NTUybjZzRUhDak5rMmZNUWRUZFhk?=
 =?utf-8?B?MSt1ZkZMdWFjT1dDMFVVb3ZUNUozdWlGSW1BWVNqbFNqWmtCYWsyTnN6eUFK?=
 =?utf-8?B?cWQ2RU1sVFRWQ1BGU2MvS2VIMUU5K2pHT3FZQ2IreGRMMVovYmJaaTd3VVM3?=
 =?utf-8?B?Tjd3WnpxdXU0ajEyTG9QMUZEV3l5eThGRm00S3Z3Lzl3Zjk4UG95SitseFNB?=
 =?utf-8?B?UElQdVpWaUpKQytiZXpZM3BheUhqbFB2RE9VODNTNmRmZW1jblFsMGhPaEw4?=
 =?utf-8?B?ZEFBR21Ud2J2dHkrVW5BamJ2LzFJNWxnRzJkbUFTM2NwaVcwLzJjTTl6Zm1x?=
 =?utf-8?B?MzQwaTR5R3c1Q1p1bzZUNmtmUSsvZU13YmppT0sxbFpBYWtNU1huOStvTzFs?=
 =?utf-8?B?QVlRM1JJTnBiSStBWmFreW0zT2RxSnZacnQ3M2hOazVrS2UzY0lDVEZXdmNi?=
 =?utf-8?B?RWU5UjQ3L1NDY0R6aXpDNTdxeTR4MURXYlN0K2poZElNZlZCb0ZVWGRRK0lp?=
 =?utf-8?B?anpxcmdydjZ4ODJrdWVwYVJJMXN3UW01UGZaNnNiUHFVNy9SMVNXS3IwLzF5?=
 =?utf-8?B?WUp5akZOUEx3MHdlVmgra0RYSXFwS3BoYW1JRUtzWlR1TWxqVEs5WDhZRmVX?=
 =?utf-8?B?NlRvNjQrbU41M0wwUUM5Nkx6Y20xdm1RcVEzRlhOMVFQaE9HMnp4UHgyZ0E2?=
 =?utf-8?B?akdveStnTnNSVldKNndTMTFiajlmVkNiUXBiQXFUeWNNb2pQc3BCakdhSU5E?=
 =?utf-8?B?MkpSai9sdFQ5Z04zSkZrTmN1R0dtbWp0dXlzS0gwQ2RJL2RFUDhFZUh6TEFr?=
 =?utf-8?B?eVB0WWZOcVQvejZHcmJxWTJGc0hxVmJyTDR6TzNqek9PK0xkY0o5Z3k3WnV5?=
 =?utf-8?B?T0ZOYkRVTitzdm5ISXh2aWJTTGV2RksyVHYvSGFmRERacHdReG9uNzVSTTVE?=
 =?utf-8?B?WGNESDZ4NFpwdWx0cDVKRkd0QzZSZHlJY0IyUWFtRjRabWI5UHpDaVBiN2Vm?=
 =?utf-8?B?bngyN2Z3MVRtbE9qdDNUb0hyckdNejIzM2xDbDZ1NHhHUGhMUG1uNzRxZXZl?=
 =?utf-8?Q?D/l0YmL4PUaeaNz48uL7zus=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8913459002A78D42A4C02505071A1117@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352e6535-a1bf-41ef-137d-08da70b2ac0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 16:03:11.8930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQcOjgZYZsK68ABGfykTSy1rN19u/vJ9tx6drckXCeZbcJHLvJhrfsC15pup183gkDa6D4d1ypBzPx+hG8y/QuW8M3EJCedZ2MjBVRtfCSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1410
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

T24gVGh1LCAyMDIyLTA3LTI4IGF0IDE2OjIwICswMjAwLCBIYW5zIGRlIEdvZWRlIHdyb3RlOg0K
PiBIaSwNCj4gDQo+IE9uIDcvMTgvMjIgMTk6MDUsIFBhbmRydXZhZGEsIFNyaW5pdmFzIHdyb3Rl
Og0KPiA+IEhpIEhhbnMsDQo+ID4gDQo+ID4gVGhlcmUgYXJlIHR3byBtaW5vciBmaXhlczoNCj4g
PiAtIE9uZSBmb3IganVzdCByZW1vdmluZyB1bm5lZWRlZCBzZW1pY29sb24NCj4gPiAtIEFub3Ro
ZXIgZm9yIGFycmF5IHJhbmdlIGNoZWNrDQo+ID4gDQo+ID4gVGhlc2UgY2hhbmdlcyBhcmUgb24g
dG9wIG9mDQo+ID4gaHR0cHM6Ly9rZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcGR4ODYvcGxhdGZvcm0tZHJpdmVycy14ODYvKy9yZWZzL2hlYWRzL2Zvci1u
ZXh0DQo+ID4gDQo+ID4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiA+IDdh
NGEwNGY0ZTkwZDc0NjkyODUwMWE2ZDU1MWRlODdkMDJjMjgzMjM6DQo+ID4gDQo+ID4gwqAgcGxh
dGZvcm0vc3VyZmFjZTogdGFibGV0c3c6IEZpeCBfX2xlMzIgaW50ZWdlciBhY2Nlc3MgKDIwMjIt
MDctMTcNCj4gPiAxNjoyMDozNSArMDIwMCkNCj4gPiANCj4gPiBhcmUgYXZhaWxhYmxlIGluIHRo
ZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4gPiANCj4gPiDCoCBodHRwczovL2dpdGh1Yi5jb20vc3Bh
bmRydXZhZGEvbGludXgta2VybmVsLmdpdMKgaW50ZWwtc3N0DQo+ID4gDQo+ID4gZm9yIHlvdSB0
byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQo+ID4gN2Q1NjU1NDJmOGJkYzA5N2Q2MTEwMzA1NzJlY2Y4
ZDk3MDZmMTRkYzoNCj4gPiANCj4gPiDCoCB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0OlVubmVlZGVkIHNlbWljb2xvbiAoMjAyMi0wNy0xOA0KPiA+IDA5OjUxOjA5IC0wNzAwKQ0K
PiANCj4gVGhhbmtzLiBCb3RoIGNvbW1pdHMgZGlkIG5vdCBpbmNsdWRlIHlvdXIgU2lnbmVkLW9m
Zi1ieSB0aG91Z2gsDQo+IGlmIHlvdSBhcHBseSBwYXRjaGVzIG9mIG90aGVycyB5b3UgbXVzdCBh
dCB5b3VyIFMtby1iIHNpbmNlIHlvdQ0KPiBhcmUgcGFydCBvZiB0aGUgY2hhaW4gaG93IHRoZXkg
Z290IHVwc3RyZWFtLg0KPiANCj4gQWZ0ZXIgcHVsbGluZyBJIGVuZGVkIHVwIHdpdGggMiBjb21t
aXRzIHdoZXJlIHRoZSBTLW8tYiBvZg0KPiB0aGUgY29tbWl0dGVyIG9mIHRoZSBwYXRjaCB3YXMg
bm90IHByZXNlbnQuDQo+IA0KPiBJbnN0ZWFkIEkndmUgcGlja2VkIGJvdGggcGF0Y2hlcyBkaXJl
Y3RseSBmcm9tIHRoZSBsaXN0LA0KPiBub3cgc2V0dGluZyBtZSBhcyB0aGUgY29tbWl0dGVyIChh
bmQgYWRkZWQgbXkgb3duIFMtby1iKS4NCj4gDQo+IFNvIHRoaXMgaXMgcmVzb2x2ZWQgbm93IGFu
ZCBib3RoIHBhdGNoZXMgYXJlIGluIG15IHJldmlldy1oYW5zDQo+IGJyYW5jaCBub3cuIEJ1dCB0
aGUgbmV4dCB0aW1lIHdoZW4gYXBwbHlpbmcgcGF0Y2hlcyBmcm9tIG90aGVycw0KPiBmb3IgYSBw
dWxsLXJlcSBwbGVhc2UgZG9uJ3QgZm9yZ2V0IHRvIGFkZCB5b3VyIG93biBTLW8tYi4NClNvcnJ5
IGFib3V0IHRoYXQuIA0KDQpUaGFua3MsDQpTcmluaXZhcw0KDQo+IA0KPiBSZWdhcmRzLA0KPiAN
Cj4gSGFucw0KPiANCj4gDQo+IA0KPiANCj4gPiANCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gRGFuIENhcnBl
bnRlciAoMSk6DQo+ID4gwqDCoMKgwqDCoCB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0OiBGaXggb2ZmIGJ5IG9uZSBjaGVjaw0KPiA+IA0KPiA+IFhpbiBHYW8gKDEpOg0KPiA+IMKg
wqDCoMKgwqAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDpVbm5lZWRlZCBzZW1p
Y29sb24NCj4gPiANCj4gPiDCoHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaGZp
LWV2ZW50cy5jwqAgfCAyICstDQo+ID4gwqB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0L2lzc3QtZGFlbW9uLmMgfCAyICstDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBUaGFua3MsDQo+ID4gU3Jpbml2YXMN
Cj4gDQoNCg==
