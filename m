Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F15EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 18:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244345AbiBQSgq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 13:36:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242738AbiBQSgd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 13:36:33 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236047644
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 10:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645122978; x=1676658978;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=I7Q+oqwphAshPvO8LAOVoTsJmTnR4+vNUIxskwPPVqU=;
  b=ZcHVwBS18VGmI/ku+OayjJSk1NvJ0HGokJvwEA12hvQz7yDwNGSLvlVn
   1qlRXFh+H9/1OQo+K08KBV2TcguqdwtXaJx1xzFL2bjIgExOqLxQZ/7Me
   37NBUMtlU8tkVY/yuV6d4igT8mjKpuI6e30Y6wqAm/FZ2jMttu9SuPF1a
   3hKHRn8UgTzwAbLVjHHNNPC0pKpR004sdbgcQcvPr6IL3r95b43kdTaQI
   cqO1r712cOl2Ka3rLju5hrfajN3aDf5E1ATr/Mrn43kFs3RhJSxIukFn0
   KpMYsGhhmVl+MsEGSLi0uHj4Fyum+h8iJBash8LyZ/EwGQYzzxxXatins
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="311687750"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; 
   d="scan'208";a="311687750"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2022 10:36:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; 
   d="scan'208";a="545776488"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga008.jf.intel.com with ESMTP; 17 Feb 2022 10:36:17 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 10:36:17 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 17 Feb 2022 10:36:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 17 Feb 2022 10:36:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 17 Feb 2022 10:36:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kfr89+wsigrmeXeh3ViuTBsxGmxO3bMYRLugqQOSew47dGD4LUa4F/yoUuavYaDGP10cTdBZ5N3XUMExiIC/l0jnE/NI4q54KCHoc/88aV69tq5Y9PuP26aqZZnkht3ICFjS+JABYcJwUxY78OLUo4LhIxVAFBmKL/zP4Q9nwR3TTYZ9Sfpn5W5zGqmmrJ3QRDUovthSHi7KdYeBWplQ1HDXvB1maMR4RJqdMjdLkX97J9cfxkW24AkJKcxpv9QtLK6Qyo4xpJaHLBqvorgjh38j1sb4k0L73IkINrh5S3mqwH1MqqqLS3EDDyJActNb7RjDOIvQ97z1FfqzNwzsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7Q+oqwphAshPvO8LAOVoTsJmTnR4+vNUIxskwPPVqU=;
 b=jIWD6YQvnWUEfDzphxjK9QqGxcQ5ceHjYlBDi7PbAeLS3HHlPMoRAyOnH1Oe+XIgVnhDcmTY3MVugDZyOnX8vZ2i+StMfkUMJ26j2kBUZ32kijDxHzUSNpgdIxan/JZLekvxpByYG/Rd5VWErxUXYkDEzBNlpSQvjuMaSpIPCYsmUXowTkN8o5DJ2YkWOcgTbLLKp+8VXqYgOc+VkM+uuuT+QoWlRGQZAZ7rU+XpIrLS8lOy6oxZWnAB8l9G9VlfyuFYr/MH/WhN7o4zBVsMZuOYL2Ilo7jdraseJm7ZhmgdOSZAatUdvC683Yzy+CgF8GewCuYMYiGHOYluF2I1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 CY4PR11MB1493.namprd11.prod.outlook.com (2603:10b6:910:11::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.15; Thu, 17 Feb 2022 18:36:11 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::53c:25cb:8a4c:536a]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::53c:25cb:8a4c:536a%3]) with mapi id 15.20.4995.018; Thu, 17 Feb 2022
 18:36:11 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "rafael@kernel.org" <rafael@kernel.org>
CC:     "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Zhang, Rui" <rui.zhang@intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.18-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.18-rc1
Thread-Index: AQHYIqFIWCAYzZvuo02EyjyrsUQwPayX9JwAgAAAdACAAADFgIAAGxQAgAAETIA=
Date:   Thu, 17 Feb 2022 18:36:11 +0000
Message-ID: <8218cf7d6ec5b474dcb26999d9d4d8ba2fe840ec.camel@intel.com>
References: <cbd2f7727419301acc17c4479b81637829db4c9f.camel@intel.com>
         <3d178ca8-2fa9-1886-a04c-f3722db131eb@redhat.com>
         <CAJZ5v0hdA8YDgHyjV3tXbPwyETRi=EJG_8R6=QX3S9ZtaEV8cg@mail.gmail.com>
         <5ce192a8-ced8-0bf1-6825-d65cacfc8b3e@redhat.com>
         <CAJZ5v0hmBwziRS7uMjK+CAz-D1CuyCA4dt3n0QPc62Uy1MgUpQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0hmBwziRS7uMjK+CAz-D1CuyCA4dt3n0QPc62Uy1MgUpQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.3 (3.42.3-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a84032fc-9a83-43f4-193e-08d9f2445f22
x-ms-traffictypediagnostic: CY4PR11MB1493:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB14934856C303DDE002D54929E4369@CY4PR11MB1493.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oILKapPU5POP2KsX7KGFvUdrQtyLKEDlYchy2nGnovVjhEDfnajesx8U19xSLqhMQGETeJxZHsRYPChrodF1vwyIc5m4WPG6WPjGDOF01HD1g2bCE3CjylJAeyGhtTN9KzddFyXo1A0htUB1LHRCCNxBam81bTNPuqQkA5yE0Qhr3u1BtqHgnEZv55BvbXv6ZRymHv/YE+78Scgcd736Bl9TJszdeyYPRTbQz22vjPa24llEoYWoEcybOnJjBWytXw7chUOtRm+kELplJFWpJo7CkaM7+u3V1+TidYjAetwCXbhJE16SGubGGfnYgQR2UG1kqI1gO5NTl5fErN+prornOhbZ/syH2p99RwPZ0sMrRJk/uRVP1aQ0imHORLPwX0aiqS6/4zMlIQARIluNb3DGIhBDNikFTBnDVAG+4oAP+vAtKOGy7ZgrSuTwPkMvSMg2USY8eCjNo8olV63KmxeNtKHI7zuPS+dvYV1OBl76EBo6BqA5FmUsWyL6B4r3txXnT6nar3ZFs04KW4x/7XnzP9dkeUkkeJjftLdx756/dj+gAYKw0EUvOnIPrJFNO+SkEYyxaJFe1ZGfLacv4pLeQK6XOSDLaVc8jU18UY3pArehL2ylEZG8URgTh5ET3I0RT4mPV4XwQpnB6H7yvd58260IpmhWlMCLmkJbwohrToCqSraN81gQthsw1K829Vgyw6kJrcniIAanP/TDDCXy+SsMLxomClfMBJ7O+2b23dTDhn9gIK/2g/VHwAK4CJuNE4BUnQFg+SzrGkWCYR4EORbLVwxh6ZEG3hinmbCqu22HbnFaho++jB9LEU0KtI7Mu1xA3ZEW3b93ym+yBw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(966005)(53546011)(2616005)(86362001)(6486002)(508600001)(8936002)(110136005)(186003)(316002)(26005)(54906003)(5660300002)(6506007)(83380400001)(38070700005)(122000001)(38100700002)(82960400001)(71200400001)(4326008)(91956017)(66946007)(66446008)(8676002)(66556008)(66476007)(76116006)(64756008)(2906002)(6512007)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEIzNkltUFVaNU9KNnhJN0czR2pPYmMwaFVIMWFSWjNGdUZMRmQyOEZidUt2?=
 =?utf-8?B?S1FmVGg1TEhMSDZxeEZzTFlBVmtJSDQyMmxsMXpGTFBHMDRwdWZITjhBUU9P?=
 =?utf-8?B?OXJTcVZRajMwa0thSGN2bGYzRzJHb1EwZkdPelVJclg4YzFhWUtHNEh2dTgv?=
 =?utf-8?B?akMvc0pOYWlHMmRRV25LSHkzQVhlOXRITWNxcU1vcTgwNWU2dVNkRGc5Mnlv?=
 =?utf-8?B?eVpZNzRndm52Z2dveXlYeHRScWI5clFLT2k2ZGllRW42cXZFa01oNFVGZlVN?=
 =?utf-8?B?aGtCa1ZJbzQybUtpUitnUjNReVlrYktjZEhNbTF5ZVI5VDRCelltb1dQdWcx?=
 =?utf-8?B?M1o3Um5vN2FFS255UWc5RWdiZXh5U0ZsV3E0ZWxXbXNqbTZTcVloanBJWFdi?=
 =?utf-8?B?NFFRSGE0MHQ4K0F1V04yMy9FQW5YV2NMRjZDYXZUMThEOEMvRzROT3hlUHFh?=
 =?utf-8?B?QzIxUm5wWUs3cTJtQ2MzbmROT0tWaHovVVdxMlNzVW5IOGtvYWxXVE4rZUgr?=
 =?utf-8?B?azhKakp2THJRR3pqWFBzcm9Ta0l1TFdFQU9adGlMaU40SXhvWEZqMDhaQzFs?=
 =?utf-8?B?STZzeWNyM1VSeWNETjYzYjlHOXgrRE9lcHloNFZYb1RkVGY4bEtnZysxNEFL?=
 =?utf-8?B?b0o4M2M3VVlkeGR2UHpDcUZXYXRmcXhtenQ1S3Z2SUt4UDFHRWd5SHhCSCs0?=
 =?utf-8?B?SjRETU9QMEg0KzdaRWRKK0JOcVoxT1NKenNNcVVGVEpHZGJubE9PdzhYTnZL?=
 =?utf-8?B?QUMreXphMW9WUGxIUElDemtIZXcvbm45QklFK3BjNXRKU2U4OTMwWC9kbktt?=
 =?utf-8?B?T21GU3lkL2w0aUJtUVdpMUFNR2J6MmZOUGtkOHp0YUZoVnVrcGlGeG40Z1pC?=
 =?utf-8?B?bjkwZG1qVHlpVWNWRzYvVXVRemlnamUxb3ZDYmlNVldzd0RXNktPUDMvYU1o?=
 =?utf-8?B?RXpzSnRJUW1tUlJqTmMvVXJWUnRRcEh1blVNUkhIeERtU0lCV2NaWFA0Q205?=
 =?utf-8?B?UDlZaEd3NmtiZE1vV0luNUVKb2Jadi80V2VjNUtMYmZJNHJHd2JBWGdZbGEv?=
 =?utf-8?B?UHUzVldUdTFpekduNVhEZjcyRWVZTUF5L2pPRjVFT2k1U3UrYWVDVGZ3ejdK?=
 =?utf-8?B?ZWx2WVVXdUxJcEh4aDU3T2VTRTF6TCtLN0ZRbytuWk9taFJrQkljaW5SK0Ni?=
 =?utf-8?B?SWNHZzlxU1lVUGxkeUxKc05zMEVQMy9HZlozQjdMK2FHektWdHZLcXRvVWY3?=
 =?utf-8?B?NFZxYzlXUmJqemgrcmlxMVBmOE9wekkrTFkwanZaM2J3RkhFbzA4NEdVa3V1?=
 =?utf-8?B?cjNaUFFiRFppWlp3cVNGaktldGo5b0RTbGtTTzA5L3l0UGMvZWphbXVrdzZw?=
 =?utf-8?B?RlJqZ0srckdBZGdqK3RjRVpUMXovVTdhdElSejZFYmp1MkwxM2t4NEJSQWlk?=
 =?utf-8?B?bURUc3VJYTFiMndXLzBMTlFwYURNd1VIL3Z5OFZ1dE0wL3Z3aS81S1BkV05T?=
 =?utf-8?B?NldlUEMzOTF6RWMrUGpHZU03N2hkZE5lSXpINmNuUzVtdUtNQmd0TTZGRTBq?=
 =?utf-8?B?dE9GSVhrYThycFdYNmllZ1A3SWtkUUlmOTlna2grNGNKQmNoMnZpNE1qRE55?=
 =?utf-8?B?TjhNUGhOOTR1MStRQVJBeEFibUNRT1ZxVHdFVjVsZnpSamJROWRxOUlNdm40?=
 =?utf-8?B?OU9weU94eHdXcTF1d2VBZVZXQWl0SkRUQ2ZXVmVYcVR1RkVUSjZnYUlZU1g0?=
 =?utf-8?B?NnhRalh5RE0rOHZzSVZ0TkVoWGlyZWlnR3ZjR1YxMUhRYVBKZGpLNW9lMWZk?=
 =?utf-8?B?bldTTnpDZE1YUjNWaG83QlNGTHlkaC9FUVZzVTRwc3VqcTBTUzBqc0RLTms1?=
 =?utf-8?B?cGVDeWhmZXJNWTJtVkVYNVAxdlNFNzVPMEFVTC83dkNyWGhxcVY3Rk9HQ3ZB?=
 =?utf-8?B?YmI0YURtbkQ4czFMTG1Yd1RGQzR4S1hkMEdVUDBXeWhFYmVPRy9XRlV2aUE5?=
 =?utf-8?B?dWVPYlM0cW1BRGY5TEgxWWtIcTlXSkdGcm82Y0Vma0Q1eHlhSVA2UGFLbDds?=
 =?utf-8?B?V2NFbTZRMnJ0eFc2VEU0RktOd2RadDVaQk1Eb2FDNHFnN3hOUmtlNE1tVE1p?=
 =?utf-8?B?TEgyekUyVHpUa3V1emxpTFlEVTRUV1hBbE5iWjVtaGNXU0lXdGxOV3NFT0Jo?=
 =?utf-8?B?WmVKcUFzcXVGU3ZLSWJvZHdBVFNIWEhuM1ByQWFDOU43QW5aVGgzLzltL2ox?=
 =?utf-8?Q?5uhRjooKAz7G8nc0jkwmeDEjtHEu01Q4ViBPCH/EOs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <743F939520391D4F9614C9DF9ABA3B83@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84032fc-9a83-43f4-193e-08d9f2445f22
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2022 18:36:11.6779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xhLYI9xsJKiwA7eFyshmdwdxkIkMYZ8hJNdXWayUhdHjbdW79jEZuFIP+k+CnsU+KJoqov1CAVRv5BvgAPZYseFWFcSOlTquhYUlL6m+H+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1493
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

T24gVGh1LCAyMDIyLTAyLTE3IGF0IDE5OjIwICswMTAwLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90
ZToNCj4gT24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgNTo0MyBQTSBIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBIaSBSYWZhZWwsDQo+ID4gDQo+
ID4gT24gMi8xNy8yMiAxNzo0MSwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6DQo+ID4gPiBPbiBU
aHUsIEZlYiAxNywgMjAyMiBhdCA1OjM5IFBNIEhhbnMgZGUgR29lZGUNCj4gPiA+IDxoZGVnb2Vk
ZUByZWRoYXQuY29tPiB3cm90ZToNCj4gPiA+ID4gDQo+ID4gPiA+IDxhZGRlZCB0aGUgdGhlcm1h
bCBtYWludGFpbmVycyB0byB0aGUgVG86IGxpc3Q+DQo+ID4gPiA+IA0KPiA+ID4gPiBPbiAyLzE1
LzIyIDIwOjIxLCBQYW5kcnV2YWRhLCBTcmluaXZhcyB3cm90ZToNCj4gPiA+ID4gPiBIaSBIYW5z
LA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFBsZWFzZSBjaGVjayB0aGUgcHVsbCByZXF1ZXN0IGZv
ciBpbnRlbC1zcGVlZC1zZWxlY3QgdG9vbC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBUbyBidWls
ZCB0aGUgdG9vbCwgd2UgaGF2ZSBkZXBlbmRlbmN5IG9uIGxpbnV4LW5leHQgY29tbWl0DQo+ID4g
PiA+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4
dC9saW51eC1uZXh0LmdpdC9jb21taXQvZHJpdmVycy90aGVybWFsP2g9bmV4dC0yMDIyMDIxNSZp
ZD1lNGIxZWIyNGNlNWE2OTZlZjcyMjlmOTkyNmZmMzRkNzUwMmYwNTgyDQo+ID4gPiA+IA0KPiA+
ID4gPiBIbW0sIHRoYXQgbWVhbnMgdGhhdCBpZiBJIG1lcmdlIHRoaXMgaW50byBwZHg4Ni9mb3It
bmV4dCB3aGljaA0KPiA+ID4gPiBpcyBiYXNlZCBvbiA1LjE3LXJjMSB0aGVuIHRoaXMgd29uJ3Qg
YnVpbGQsIHdoaWNoIGlzIGJhZC4NCj4gPiA+ID4gDQo+ID4gPiA+IFNvIEknbSBnb2luZyB0byBl
aXRoZXIgbmVlZCBzb21lIGltbXV0YWJsZSBicmFuY2ggZnJvbSB0aGUNCj4gPiA+ID4gdGhlcm1h
bCBtYWludGFpbmVycyB0byBtZXJnZSBpbnRvIHBkeDg2L2Zvci1uZXh0LA0KPiA+ID4gPiBvciB3
ZSBjYW4ganVzdCBtZXJnZSB0aGUgaW50ZWwtc3BlZWQtc2VsZWN0IGNoYW5nZXMgdGhyb3VnaA0K
PiA+ID4gPiB0aGUgdGhlcm1hbCB0cmVlIGZvciB0aGUgNS4xOC1yYzEgbWVyZ2Ugd2luZG93Lg0K
PiA+ID4gDQo+ID4gPiBUaGF0IGNhbiBiZSBkb25lLg0KPiA+ID4gDQo+ID4gPiA+IEVpdGhlciB3
YXkgaXMgZmluZSB3aXRoIG1lLg0KPiA+ID4gDQo+ID4gPiBPSw0KPiA+IA0KPiA+IFRoYW5rcyBm
b3IgdGhlIHF1aWNrIHJlcGx5Lg0KPiA+IA0KPiA+IElmIHlvdSBkb24ndCBoYXZlIGFueSBwcmVm
ZXJlbmNlIEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gbWVyZ2UNCj4gPiB0aGUgaW50ZWwtc3Bl
ZWQtc2VsZWN0IGNoYW5nZXMgdGhyb3VnaCB0aGUgdGhlcm1hbCB0cmVlIGZvcg0KPiA+IHRoZSA1
LjE4LXJjMSBtZXJnZSB3aW5kb3csIGFzIHRoZSBjaGFuZ2VzIHRvdCBoZSB0b29sIGJ1aWxkIG9u
DQo+ID4ga2VybmVsIHdvcmsgZG9uZSB0aGVyZS4NCj4gDQo+IFJpZ2h0Lg0KPiANCj4gU3Jpbml2
YXMsIHBsZWFzZSByZWJhc2UgdGhpcyBvbiB0b3Agb2YgY29tbWl0IGM5NWFhMmJhYjk3NCAodGhl
IGhlYWQNCj4gb2YgbXkgdGhlcm1hbC1oZmkgYnJhbmNoKSBhbmQgcmVzdWJtaXQgd2l0aCBhIEND
IHRvIGxpbnV4LXBtLg0KPiANCkkgc2VlIHRoZXNlIGJyYW5jaGVzIGF0DQogaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmFmYWVsL2xpbnV4LXBtLmdpdA0K
DQogcmVtb3Rlcy9yYWZhZWwtcG0vYWNwaQ0KICByZW1vdGVzL3JhZmFlbC1wbS9ibGVlZGluZy1l
ZGdlDQogIHJlbW90ZXMvcmFmYWVsLXBtL2RldnByb3ANCiAgcmVtb3Rlcy9yYWZhZWwtcG0vbGlu
dXgtbmV4dA0KICByZW1vdGVzL3JhZmFlbC1wbS9tYXN0ZXINCiAgcmVtb3Rlcy9yYWZhZWwtcG0v
cG0NCiAgcmVtb3Rlcy9yYWZhZWwtcG0vcG5wDQogIHJlbW90ZXMvcmFmYWVsLXBtL3Rlc3RpbmcN
CiAgcmVtb3Rlcy9yYWZhZWwtcG0vdGhlcm1hbA0KDQpUaGVyZSBpcyBubyB0aGVybWFsLWhmaSBw
dWJsaWNseSB2aXNpYmxlLiBJcyB0aGlzIE9LIHRvIHJlYmFzZSBvbiB0b3ANCm9mIHRoZXJtYWwg
b3IgbGludXgtbmV4dD8NCg0KVGhhbmtzLA0KU3Jpbml2YXMNCg0KPiBBbHRlcm5hdGl2ZWx5LCB5
b3UgY2FuIGp1c3Qgc2VuZCBhIHBhdGNoIGZvciBtZSB0byBhcHBseS4NCg0K
