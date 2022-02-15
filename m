Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1828C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Feb 2022 19:21:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238383AbiBOTWG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Feb 2022 14:22:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbiBOTWF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Feb 2022 14:22:05 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E4277A9B
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Feb 2022 11:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644952914; x=1676488914;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=35UaN0GbXRorcERgjf/V/iWimFfYIgc1LwSbmd8SPu0=;
  b=Y/LhNQndwSpDnYGZwB0aZgru17KmzvvbFQhimcQQHKnj+uxh6SA8A/+H
   HP84SwFgJBKL7IH568BsnwNzpaS1cPTpc5+395nTkgXIJ26geqFZRWMak
   aigAky9QR9S50IVar2myH4LXe/aUj0Pb/wCHCatzg+o8YMWHh9TtO/IJm
   4EknZlC9ubgjG840DnpWvh61IY8Xl6g0RCMmQ8JtIqS1NiN6abuNd0SA0
   FojGGGRiDCIimgi0qu0OEfZXj1mBtH5e3Q/xBJn8pcFR0SjkSxNrjovZH
   H7XsFDMZoPcMvfIt6gyGE1dAFyZT++m/ypOj3YN+NtcjDN+z6HdNDFQcY
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="230397153"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="230397153"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 11:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="544458612"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 15 Feb 2022 11:21:53 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 15 Feb 2022 11:21:53 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 15 Feb 2022 11:21:52 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 15 Feb 2022 11:21:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EixJ3JXM/H31mKwOnp+z49n4O92Ho2MedSFNTJ77m0WDI+7M9dAfsmDRVh8EeuLe/mq84oKEXxoMSZmbM2awiOGy2smFXlGGSJf1zchg5s5gwmaxzPFJAZYqRtenp80I9cEVMktqxzX28qt3IBEmH8HkGN/V/WoLWuobI0Udf1kpc5jEXn1w3xmdtboWZNgD/9xwF+NzxdbiKQIz0du+fZ3TuqQfUPA15GejAvt0ycBR7pKGwk6TkoH5/O+WnHOXjd/M6jm7dQPsAL3uPTftTKjg0kUs4/aYxdKEXGU2NdA/2A1EipgWVL6WfnuVwlxNJIMTjxkH0HSsYKO9f24Ucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35UaN0GbXRorcERgjf/V/iWimFfYIgc1LwSbmd8SPu0=;
 b=lhkrWZJvpOoIPVLSKkFyzjfnnGDSnKt3ggIuBgBR0YdGjolQHB4sjnomu6Lagio/6g8oDf/OBOreOusV0mijzvwykccSUCTJU4BRPIGWH/UZabQYp7VoCxKG+Pk1ggU2VUQhHF0sQChty3Jc2xZEyEhJ2tsI3O/GEAElBtBHnWiC0BelilPNe+2yPU3Q63zkEyuP8sjJdFy7biGJLBb8uSxG01g9zheG1qPCAkNvt4XURYiA9UaYuj9kmzswjtQFqa8+J/Ar/Wtb+J+LqcWK27Lh6B1XUiiQ33epx4IIBSGISejxpL14FK8daXzxkzRQxC/RhzXryxSNbYweEXrAQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 DM6PR11MB4106.namprd11.prod.outlook.com (2603:10b6:5:19f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Tue, 15 Feb 2022 19:21:51 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::e40c:6c1b:d066:80ea]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::e40c:6c1b:d066:80ea%6]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 19:21:51 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.18-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.18-rc1
Thread-Index: AQHYIqFIWCAYzZvuo02EyjyrsUQwPQ==
Date:   Tue, 15 Feb 2022 19:21:51 +0000
Message-ID: <cbd2f7727419301acc17c4479b81637829db4c9f.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.3 (3.42.3-1.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d29ded0-0940-46b4-bd84-08d9f0b86b6b
x-ms-traffictypediagnostic: DM6PR11MB4106:EE_
x-microsoft-antispam-prvs: <DM6PR11MB41064141DC3272B2B9F4B781E4349@DM6PR11MB4106.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TAYubOoyZl8VRsbgs4GIlgHNIAHOwzX19mdpvFZmwOR9v/g/JdWMFQ9nJHwC7B2hiI/xujjUrnARGutsnoklAcq6E+t1jY/9rHNt23JZTAEvkv4jQfu3MLeIeycxPVPfMydkNeoLKF6DYpy1AQAwGVr2D6CvAvPBPfCUriP/9PUl6tIM/27cSvdqiLkGUQ3kzHfEuTP3+VYBb/I2et4UOq2AOfzU8V1Tc3ITLgSHM4sF7ZSuHC7ct5ESj/zPe8un+c8BxBL0HCKBUay2qe23zgyn5o20HI7mFSCc9tBG9/lPX3wbjCHFYPUNWulPLCdMFUqXM0sHVDKfO2xxM8YwpLshBK3RQAX03j9drKk/iWyUtdkQwT3HKCoRa9LDbvqPLOvUPvjTFmMQnQYLokTuJ/BUfd31jkcZ0pkxbX4H7c0a8RLaHOT3wMxBqHeZaFMerQWZD4quOPAWR6lBVYmF31yfEerqJJ6DKs5R3EOBdBz0C5YfM0bO7aySfVPJnSbhD0ZIkqpnB/2IC8OxDahCi9/kRJBsGXMxoecsf3K5/v810y4QoYiNNjDm6B4CFwdP2Jpn71ODEok12GSVvyCTAJFujb4+IeCkcGIU0tHkKMXuTXEbUkRsJdaxe/J9WcAjCcnf8fjXi1uCgtz+CCNCW0w5baTlJZjM0BZmQKwcemIf3ZG7YzbKJK1sl+UrpsY3tAZtAnlZu5Av76VuUv0sgalVSTKxW2vCHSsY2mZFSic0otcLSQUVoJO9MmGRSvl3vDV+YceVgfslYKCJMT26kfKSKn6PgUCBIXI8+pjrG5OYGRtP8QjwR5wV9MBTqe+kyVD0KMoY6uL+NJnYiiMU6g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(82960400001)(6512007)(2616005)(71200400001)(6506007)(966005)(83380400001)(508600001)(6486002)(64756008)(76116006)(91956017)(316002)(4326008)(8676002)(86362001)(66556008)(66446008)(66476007)(66946007)(5660300002)(36756003)(2906002)(26005)(8936002)(110136005)(122000001)(54906003)(186003)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?LytKdmdhM0pJTFFYT2ZvWjdhbW1XTVpTV0dUQytKcjgvcWMxb1dvVUpORW0w?=
 =?utf-8?B?aytZYjNUVFhDVzdYRjhnSUNuSThmK1ltbGVINCtiU3RHcE8ybm9JRTJ5aHBD?=
 =?utf-8?B?YTZBL1Y1aHUyYWpvLytWK09KYVZpVjFWU2dST2JhRVNtRVlnZXBVekxzK3ZO?=
 =?utf-8?B?LzNwSkhabmJWRjdsbGJDcldWVWhRVDlNcVZLczd2a0RPN2x0bjA5aWFRTEJZ?=
 =?utf-8?B?U2QvMXZqZUl6ZmZJRDg4dnRTZXNIdGZMRGtDd0UwWStyUmxvNE5TRDNEazNy?=
 =?utf-8?B?djc5bW1UMnAzRklibFRadWJkYml0VlZLeUkzZFRmbWZ6bVcwSHN0NS9BN1c4?=
 =?utf-8?B?NVRFMHFSdzhnZHVUL25MVEltMXV2RTg5UXpnUVh0dFFQcldDc2hRaUM5d240?=
 =?utf-8?B?V0loaXJwYmtWV3BlUERNVFRaSHAvam5xSU5xSUc5c0lySno3dEh0SnNRelNW?=
 =?utf-8?B?bWFBdkVaOGN0QnRvVmg2UVJRWUlFM1ZJZmNQZXcvUGVHaC82emxJb0pYeDZ4?=
 =?utf-8?B?cnA3NExPOUpTaGVqK0Q5ck9QZEo2S0w3Z2lxMjZrUkFTQmdVOTNWUGFneXM2?=
 =?utf-8?B?RkZ3RTBZWkJIa1hpcmRWNGVrR25QWFZZclZhYkViMVZia3ZmRjN4elcrRGxV?=
 =?utf-8?B?OENsc2VyWmJMbDRyVy9EdTVNbDBPMUNCS0hETi9CeitCcklLSndPZXB0alkv?=
 =?utf-8?B?RFJ2OExmYnFGdWwrc29XZER6Mm93RnZOZkVaWU9yZ2dhTmh1U2h6eUxXRWFP?=
 =?utf-8?B?TkQ1eGJjc2pZcXNDbFVXL00ydnF3aU96MlZXTUMrdXhTcTN3SG5LQ3RhQ1VS?=
 =?utf-8?B?dnZISHRZLzhJdFhzMFd2MDhUQkp2SEFpWGpadnFiTG90WlhVUFEwNUZ0TFNp?=
 =?utf-8?B?ZG5CTnF1dEJkMGFmZEgrUVBGaktaZDZyQTNoOUxkcWRqMS9iNGZJdjJxSGw5?=
 =?utf-8?B?cnR4aTF6U1JGc0VjZmI2clZNNTJqSjkrRjJNN0ZUY0tYZGs4L1o4TSs1OUh3?=
 =?utf-8?B?QVNPeXhJb25zWk5ENTZxR0NJd3N2TWE1dDd4Mk5ENXVBQUlhcjBaZGs5cnov?=
 =?utf-8?B?TFM5ejc0NXJIeDMyZzFWWlB4YlNEVzc3ZEZiKzNuRlVkYjR2RnN3RXFwM0R2?=
 =?utf-8?B?RVl6TlN0eHBBaURORkkydFgzMklOMzdzaXMrcytHa2dpME5TVmFFZXhYYTVy?=
 =?utf-8?B?ZHRPL3ZqYkh6Wlhsb3JJN2hwRUUrMkt6SUNVck0xa0xhY2huYllld3lhMjVJ?=
 =?utf-8?B?RWRHc0VzRG5kZzM3a2dNWEJ5TUJYUHpKM0ptenh2ZFJoOHdBckErNjNoNVl4?=
 =?utf-8?B?QUs3Z0Vabm5tTXc0cWVMNXN2a3ltUTJ1QjUyMEVGQW9kT1ZCTEVJS09IeEtq?=
 =?utf-8?B?NWt4VXROVllIazdtY3h5NFp6Z2NueU42Y1k0NEtCWWxCZWRZS0FreC9zanNS?=
 =?utf-8?B?WXRUUDhuSGczTnFXUi9xTlgwdWpreTNSN1J5MlNWejdLTTBQcWszNURXS0w3?=
 =?utf-8?B?QjJiT1ozVVlwSXlXU21EUVByVTljWUtMM2tDQWlldkFOeGlpMDBaenpQVlVI?=
 =?utf-8?B?Z2hkNkNza2VvbmEzbmU1dzZwTEVwUU5XbGNkeWRxSVVwTFM1eUxiazA2ckJk?=
 =?utf-8?B?RjhML29jNjVKR3g1K3Y2c2hZRGM2ZG1SQ0JuY1NEbWkwRUZVNFAzNjZ4WGFx?=
 =?utf-8?B?YXIxellsVTZNUmpUUUtoQ01sN3hMMS9jWkRXT1c3MUt6U3poZFRLaEpDaUhK?=
 =?utf-8?B?UUgzYkFhNHJ4Z29JUG80RlpPM0lIb0w5RUY0Wi92aytPQTZyNlg3LzZBQ1Rx?=
 =?utf-8?B?ZlhTeWEraGZDeFdheitSc05sVmlhNFNvRTFmUkhXSGlBTWhreFkwVXFiUGEr?=
 =?utf-8?B?dU0zTEpJR2NDcVBOQjEzUnVEK0xnWXdKdjg4Z2FYUHBWdWYzTy8vclgrOWI0?=
 =?utf-8?B?TTZnK3Nkd1dPK1YzbzFZaWhlYk43WllSNG5SQTd5ai9tRysvVlo4K0FISnR2?=
 =?utf-8?B?ZG4yVDBiZ3d1d1lkR0RZTkttMGYycXVabWN0NU5sZ1B0U2pVbERsT1ByM2RZ?=
 =?utf-8?B?SjJQbkcvdExBZUg3Mk1EQ0JGMEVJK1BvVmkxQis5TEtGRVQ2Ym1oZVNJSnRv?=
 =?utf-8?B?WDNNNWV1VElrN3l3enNVUzN3UFQvVGM3c081YUJGNDY1U3ovVmVrNlNqaGNI?=
 =?utf-8?B?TE9KbklVdXFscGp0UjdpVk9XYmM1YXpTZHkzTEp6bXpJZ2hTRmllVVNGRDRV?=
 =?utf-8?Q?a8TnvjG9d6pafItxE2kLaxmKchKMpBL1hwxZET0LDg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <988B74DA44F9D449BDEDBEAE77A18B7E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d29ded0-0940-46b4-bd84-08d9f0b86b6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 19:21:51.5882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: df/JgsmS36P7cS41JOYVgITTfUhnKL7RBrT9J6Xn3IoJHterwQZyyirkcrwIVuiP8mO0WaWO5J2x0DYQYAdCIl80gAQeaQDe5gmNVq48uHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4106
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KUGxlYXNlIGNoZWNrIHRoZSBwdWxsIHJlcXVlc3QgZm9yIGludGVsLXNwZWVk
LXNlbGVjdCB0b29sLg0KDQpUbyBidWlsZCB0aGUgdG9vbCwgd2UgaGF2ZSBkZXBlbmRlbmN5IG9u
IGxpbnV4LW5leHQgY29tbWl0DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC9kcml2ZXJzL3RoZXJtYWw/aD1u
ZXh0LTIwMjIwMjE1JmlkPWU0YjFlYjI0Y2U1YTY5NmVmNzIyOWY5OTI2ZmYzNGQ3NTAyZjA1ODIN
Cg0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQphZTcwN2QwZWI3MDdiNWZj
NjU4ZTg3MGRiZDhiMjE4ODdiMGE1MjQwOg0KDQogIHBsYXRmb3JtL3g4NjogaW50ZWxfY2h0X2lu
dDMzZmU6IE1vdmUgdG8gaW50ZWwgZGlyZWN0b3J5ICgyMDIyLTAyLTExDQoxMDo1Mjo1NiArMDEw
MCkNCg0KYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6DQoNCiAgaHR0cHM6
Ly9naXRodWIuY29tL3NwYW5kcnV2YWRhL2xpbnV4LWtlcm5lbC5naXQgaW50ZWwtc3N0DQoNCmZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KOWFhN2YwZDVmZTUyNmNiOWNlZWVhMDc4N2Ri
MGRjMWMwODFiYzYxZDoNCg0KICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB2
MS4xMiByZWxlYXNlICgyMDIyLTAyLTE1DQoxMToxMjo1NSAtMDgwMCkNCg0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KU3Jp
bml2YXMgUGFuZHJ1dmFkYSAoMyk6DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQt
c2VsZWN0OiBPT0IgZGFlbW9uIG1vZGUNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVl
ZC1zZWxlY3Q6IEhGSSBzdXBwb3J0DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQt
c2VsZWN0OiB2MS4xMiByZWxlYXNlDQoNCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0L0J1aWxkICAgICAgICAgfCAgIDIgKy0NCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQt
c2VsZWN0L01ha2VmaWxlICAgICAgfCAgMTAgKysrLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1z
cGVlZC1zZWxlY3QvaGZpLWV2ZW50cy5jICB8IDMwOQ0KKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCisrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0
L2lzc3QtY29uZmlnLmMgfCAgNTQgKysrKysrKysrKysrKystDQotLS0NCiB0b29scy9wb3dlci94
ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtZGFlbW9uLmMgfCAyNDQNCisrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQorKysrKysrDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LmggICAg
ICAgIHwgIDEzICsrKysrDQogNiBmaWxlcyBjaGFuZ2VkLCA2MTcgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1z
cGVlZC1zZWxlY3QvaGZpLWV2ZW50cy5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Bvd2Vy
L3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1kYWVtb24uYw0KDQpUaGFua3MsDQpTcmluaXZh
cw0K
