Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC9EC004D4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Jan 2023 19:16:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjASTQb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Jan 2023 14:16:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231364AbjASTQR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Jan 2023 14:16:17 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B32C9574F
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 11:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674155698; x=1705691698;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=EU3P2Im6Dy5mc9GFQ0XeQIjIYYiEW/K5Xed7+dtDo3g=;
  b=SNKFAO99wLb9w4mYGRlJnXdKaWJO+VbnGNTSnBHAJRRO3Ot5A/2QSaa0
   e2Pkejsb0VlkBmehihqRNOl7TqcAhPFKSAQPBr3Rw5irfr6DPWc+btMA2
   ytN4L8a284VikeBkeYPKgjhuQcg2z3V306E7OHJoSH7pMd72/KkaRrmQ+
   cINU8J2gL0VQUz3k4S7z7+s88MW8ko4+10GGwRlhqI193xv7HdoT6+hTr
   CW98aE50EHC/6IvqEK8Ts+S0jw3oJabsyT2covM9t65K5kGPAhC1mD0WU
   +STwA9fbHAbfX42/3ZB1RssSUmBi+qy6f+g9GYSFecXEsVOU+nRZaBW9m
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305063757"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="305063757"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 11:08:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692543081"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="692543081"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2023 11:08:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:08:49 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:08:48 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 11:08:48 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 11:08:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjrU4P2FYwbT9Pkf3yds5NxYDalLeZ+RtgfX2n16JfJIT/DKArEm22HpEdrNLFnf7DijPiXoaaXeMVBQ11EmHU4Tun3YDzs8BcsKU0F7j6UsKFpH5BhGdsjXMehhFUzAJUebjLLcgIEFFYc6sHIiuz/XV04XxgsrbZXS/Nc5Qu7kaPEXf2hhksxzR9fSotboYxzftCi1qdxsbsYcRTEkI4gURmmuIuu37kdbBdlP9Rcov22vhNdNe6uNvCq8m4vAf7oxvW+7zZs0cXG6CzB5SNVlZwH4OD1e99BDp4Fu+zz4Nh05y3owPgYBOhTy0bb5JGbf3d4PF3kWn6Oji61Cwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EU3P2Im6Dy5mc9GFQ0XeQIjIYYiEW/K5Xed7+dtDo3g=;
 b=DqEBABp8hPJnu0AnxLt2oeJa9NqQTVoSoAJ/v6VEyieUJVhrWWXiEwxix7wAjgMKpKZeR48d1sbqpc0by/q1foLFhKTUuX3tG86LfyjgWkEJr9h7yxx2oYQXS7xzXgzG+Hu/damJY7Amw9Z7hVyYheKP8Y16/Es4DgvOqk8+ziPQPETeOhtKtSzGLCq2n5Ev9u3w7DZkb0f6huztizsxSyzuKJiVdRIzFRzvyu+kJH3SalHiLzFEuicZwcpLAaXcWqtTa5VMwc9YHznqvYspvHcQ24NYXFgPt9n2U+8owYc0q8M9E7scALMkI62G8+kGVF0BtdJFU5PHzm16k03WRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 19:08:45 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::cb97:479e:f527:c6dc]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::cb97:479e:f527:c6dc%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 19:08:45 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.3-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.3-rc1
Thread-Index: AQHZLDlzmu/J4AyyEky67At5fELZFw==
Date:   Thu, 19 Jan 2023 19:08:45 +0000
Message-ID: <46c25f3c9426d038ca773da56a273a03e237dc23.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|PH7PR11MB6881:EE_
x-ms-office365-filtering-correlation-id: 7cda0397-1308-4c5b-f4ff-08dafa509662
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wpH+EQ+P/6Oboe2DwdpecSQIpQDoIOF5epDLz/7ljyq1o5ikrJXbwGRkSXIL45mzTVm/vUeih8BBCBb0aA0uwJx4yBqRshiDJb8sBJ0rhHtKTSKbikg0aLeaNQVDS+ZecSL9SbVt8Beg7+d+/8/cP8h4FyRQA1x0ARM30a8IDXwjzUZ5oQzrcWttahLirl2HLCyM/HMwRGfZbKf6ABbz+mTKOU8/jhKH+tnIiNUcjWMlKJEWS/OTA8cJsPQ4Dizr2EKNW+QA4RKlf0MyQCz0MhezPw6vHaRgzFuno4qmBfPJXQVNXFF97HE8HJ3BjSHpooPVnqt9T9FhcpgCym6gIFEjNZEk9q4YKHgtjBAAbAx1bnaZ9c5oEqdNQgCugTMQUUg654wi4npQilgW3OR27jz1mAwZ57JRdwAuEmjiBxCovSs4tbzBB5cX3R4AypssY4mITMCp+A9dnAnJcjy5qLMfVV/kWeAbp24xTvuDXoF3GcCNGZ9fyjGGU+1cMiUfTu7p7xQJ2Ima0NiM9LFwYi3bmhcnHIKJ8m3+nCChDb2FYVSkeKyh3cmFRi6kQZtg1CPTjAeuc+HZcM8cNq35XCdy5IsO/ASPUKjohyonus7DtPiP6bb4RG5OupCZfh78ZDGaifC+Ukala0je+6pUAla3l5Hv5DQaZPgpZvNA4dlPH6UaRveQ6QpQCXl9hKqyPk3i4FUnNAewe7JjyA38PpLa6ojYanyC8VltE8DT8tA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199015)(2906002)(6486002)(71200400001)(966005)(478600001)(86362001)(91956017)(41300700001)(8936002)(5660300002)(66446008)(66556008)(66476007)(82960400001)(64756008)(66946007)(4326008)(8676002)(76116006)(36756003)(83380400001)(122000001)(38100700002)(316002)(6512007)(6506007)(26005)(186003)(38070700005)(2616005)(110136005)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHFHSEZhQTQ4ZlhGMzNjZTYzMWFsdXZZSWZ4b3V0ZzUxRVo5cWdUbXg3YVhD?=
 =?utf-8?B?YXNsZk84V2pwd01PT29hcFJUd0gzKzU0UlhHMzNlanFhcW9hQTJjTVNVNXZ3?=
 =?utf-8?B?MXFzSGsvRHl4ZlVCcDdKQVFsbXh5dWt4VHRuWkMrUTdXZzJ0ekdCaHRGNjdE?=
 =?utf-8?B?dHVWOThZb1VLc3ptM0s2cmkwc1ZVVE5LTmIzQ2k3UVRmRjBEbFFDMXdCdEFr?=
 =?utf-8?B?WVR5bTdWcnVlOHBOVmVuMGxyWUs4UUgyRzRvU1FuR3BGOG5sZzNFNHk1ZkRk?=
 =?utf-8?B?L2dXUnJXSm5JNjF3Tm9WVTZRT0hwMU1uU0RoeklESk5Id1U5WmUrbUNkZm5q?=
 =?utf-8?B?b09IUUdhTi9FUUhPdUNUSUJIbFFzRlFpc3VzbEF5RnhuSzBZTDFxWW1LbVky?=
 =?utf-8?B?cWpnU1NsbnZndVUweFM2VU9WY210dGFicytIci84bHpJRzBmRTVpNTRjZU5x?=
 =?utf-8?B?WXphYjRydFhZR3l6d2lyWWh4NzVucDNDQmZzTEF2dHI3RllYVWpmR3B2NGRW?=
 =?utf-8?B?V3BuVHg4TllLV1Q3WDl0UjdQT0FIeEdzMUdkSDhrcjRGdk01VFB5QWVPRXZ5?=
 =?utf-8?B?d0xCeGxPZDRzSitHc29DOUFvbUpEV0hNQ1VFcnoyK2R5ZW5xaHdYUWhhK1kx?=
 =?utf-8?B?cTBzcXNzM0d4eHNSbCtERHBhSCtCZDNlb2wwSWQxWmRoQktNR3diYnovemV1?=
 =?utf-8?B?OUYwRXRRaEdtMU9pUi8xaG5ndDc1ZjVERS9ldTJoNnlrUjBqclNFeEZsaDhp?=
 =?utf-8?B?bFRVeXl6Snp6NW9rWjQ4WkRkaXE2cGhHaG1rOXhXQlJaMXV1cXNZWDFVV3ox?=
 =?utf-8?B?TTJzaFJieDlpRGZyRkcrWlh0SmQvZlJTay9DQmZsRGNGeFdpbW0yU3BYckJ5?=
 =?utf-8?B?WjY3aW1ucE41eVBxdmlkaVJhSXVIWW5mcTFFbmpyQnJQUlY2OVVvQU5FN05V?=
 =?utf-8?B?aFZYbGtOMUJ0WVRwd1hFZzlOUWRtdTE2NTNjT1hOdEN0RExUODgvYkhuZnVw?=
 =?utf-8?B?aW5hM1J0T3ZFVkM4ZmNwM2hnREZSdklERjkvdlNBSkwvOUxKdlVWMWI4aWV6?=
 =?utf-8?B?V25LdWR0SzdCZk8rOFR6VHRPN3JuMnlNVWhHc20zQ2xsM1NCRWhuN1ZwTXEr?=
 =?utf-8?B?UVJRQS8zZFRPMjc1cmJWL1hOTTA2M2VkUGxuUDU5aGVZVFpVVE80L2g4M1k0?=
 =?utf-8?B?eTIrN2lrTGFrVURJSTBsd0Y1WVZoQjRrbDRXT0RKQTdrTEtSTXhLZndaaVMy?=
 =?utf-8?B?MFMrQjBKaC9KZG1hT0JPWGhheHQrdU5uQUxPbkVyUHZQZG1KajZXcDdYWVV0?=
 =?utf-8?B?WjUyNTVGdnlUTzhITnRRbndwSHRQNnZ6VzFWd1JIOVU0T1VTbW1MM1BWUHZV?=
 =?utf-8?B?bjFJR3NiRVp6NVJWNnBzUkVCMTBKcC9hMjlYSXQ0K2luMVozd3huUGc3ODRL?=
 =?utf-8?B?Vk94dmlqb2FITTNET2gzellycG53SHNwcUR5TlVkdi8zMGpZbDVZbllnbW8z?=
 =?utf-8?B?NVRuMDJYRWZjeVB6T1BiWHhpQUN0dUF1ZExCNG5WLzRRbEZySzhZSHg1MzJG?=
 =?utf-8?B?NjZ5ZTFYVFZ3bGplVE4wMnlENmttQlU4QXRqM2wxSVFQQUVKdWFrNndaS25m?=
 =?utf-8?B?SW5RK2NFMXFWZ0RxRkxXaTFkc0RDalVCVWwxLzQwSlZ3U2VsdCtPYUw4eHZU?=
 =?utf-8?B?U1lOelVYd2hvdmVvZDNQOU1UZlFHSXJoWUJENGE3VWduakxSM3FRWUJ2Qmt0?=
 =?utf-8?B?amJaUlFqenZ3OFdsVzFmMXpsOUFFVzFNWlVDMDZkdlpIMVJ5Um1MMTBJMXRG?=
 =?utf-8?B?Z3ZReFhCNGJtUXZoTHVxTkRPV21nbjUvVzVZQTQxTHcyMGpsUGlaTkV3bDhr?=
 =?utf-8?B?QktLVE1lYUlNTldnQ1hkamhYS3JpRmliTzVWcEJLTjBqREVBY1g5NUZlRW1n?=
 =?utf-8?B?dUc2OHNQZzlnazkvbVlXbnNKSCtINU5XVU5qdlV2UVdldjladUtrVzB2Y0pW?=
 =?utf-8?B?Y0FyOWlWQUxoeXRlZVZmbEVmWWJFYmw0cE5hc1c5L3RlUnI2R3l6eTFST2Ns?=
 =?utf-8?B?UlBBbGFFMElrQS82UkpzWjhiejdwbE1PMDhjZXpRVk1ydDh6SHMyNjdVRUZT?=
 =?utf-8?B?RjE1d0tJNTkwOGhkZGp6RDY2VzJUK0orNVdybHB4K3VwVnM5SEFZZ3YyVkx6?=
 =?utf-8?Q?R5+jwjlMvLCtt3HFZlEb0Zk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2AA60E18AEF6C44A13B6ABA1CA3CC8D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cda0397-1308-4c5b-f4ff-08dafa509662
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 19:08:45.3273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v78YYuboTOhLakHdhqLYaDAq2pEmLIWuhZPL3LLd9cdbhEGdhIfYBSiyg0li0/EU/6lwERekCGUTAlJLCUJML3uMhS4cdiGblX63l8u0tRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KVGhpcyByZWxlYXNlIGFkZHMgZm9sbG93aW5nIGNoYW5nZToNCiAgICAtIE1p
bm9yIGZpeGVzIGZvciBjb3Zlcml0eSBzdGF0aWMgYW5hbHlzaXMNCiAgICAtIERvbid0IHJlYWQg
Y3B1ZnJlcSBvbiBvZmZsaW5lIENQVXMNCiAgICAtIFNTVCB0dXJiby1mcmVxIGVuYWJsZSBvbiBh
dXRvIG1vZGUgd2hlbiB1c2VyIGRpc2FibGVzIFNNVCBmcm9tDQogICAga2VybmVsIGNvbW1hbmQg
bGluZQ0KICAgIC0gRml4IHVuY29yZSBmcmVxdWVuY3kgZGlzcGxheQ0KICAgIC0gU2V0IHVuY29y
ZSBmcmVxdWVuY3kgbWF4L21pbiBsaW1pdHMgb24gcGVyZiBsZXZlbCBjaGFuZ2UNCg0KQ2hhbmdl
cyBvbiB0b3Agb2YNCmh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20vcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3BkeDg2L3BsYXRmb3JtLWRyaXZlcnMteDg2DQpyZXZpZXctaGFucw0KDQpU
aGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQpjNmE0MWMxNGE5NjkxZmYzNTZiN2Qz
ZTBkOGRhM2Y5YWZkNGI3MmNjOg0KDQogIHBsYXRmb3JtL3g4NjogaW50ZWw6IHB1bml0X2lwYzog
RHJvcCBlbXB0eSBwbGF0Zm9ybSByZW1vdmUgZnVuY3Rpb24NCigyMDIzLTAxLTE2IDE3OjMyOjIy
ICswMTAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBo
dHRwczovL2dpdGh1Yi5jb20vc3BhbmRydXZhZGEvbGludXgta2VybmVsLmdpdCBpbnRlbC1zc3QN
Cg0KZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvDQoxNTNjMDViZmRhOTkxNGM3MjExNzFi
NmFhZDM1NDk5ZjE1MDdjODNmOg0KDQogIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxl
Y3Q6IHYxLjE0IHJlbGVhc2UgKDIwMjMtMDEtMTgNCjE3OjI1OjM0IC0wODAwKQ0KDQotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
DQpTcmluaXZhcyBQYW5kcnV2YWRhICg1KToNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1z
cGVlZC1zZWxlY3Q6IGNwdWZyZXEgcmVhZHMgb24gb2ZmbGluZSBDUFVzDQogICAgICB0b29scy9w
b3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiB0dXJiby1mcmVxIGF1dG8gbW9kZSB3aXRoIFNN
VA0Kb2ZmDQogICAgICB0b29scy9wb3dlciBpbnRlbC1zcGVlZC1zZWxlY3Q6IEZpeCBkaXNwbGF5
IG9mIHVuY29yZSBtaW4NCmZyZXF1ZW5jeQ0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNw
ZWVkLXNlbGVjdDogQWRqdXN0IHVuY29yZSBtYXgvbWluDQpmcmVxdWVuY3kNCiAgICAgIHRvb2xz
L3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IHYxLjE0IHJlbGVhc2UNCg0KWmhhbmcgUnVp
ICg2KToNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFJlbW92ZSB3
cm9uZyBjaGVjayBpbg0Kc2V0X2lzc3RfaWQoKQ0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVs
LXNwZWVkLXNlbGVjdDogUmVtb3ZlIHVudXNlZCBub25fYmxvY2sgZmxhZw0KICAgICAgdG9vbHMv
cG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogSGFuZGxlIG9wZW4oKSBmYWlsdXJlIGNhc2UN
CiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFJlbW92ZSBkdXBsaWNh
dGUgZHVwKCkNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFVzZSBu
dWxsLXRlcm1pbmF0ZWQgc3RyaW5nDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQt
c2VsZWN0OiBBZGQgRW1lcmFsZCBSYXBpZCBxdWlyaw0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVs
LXNwZWVkLXNlbGVjdC9oZmktZXZlbnRzLmMgICB8ICA0IC0tLS0NCiB0b29scy9wb3dlci94ODYv
aW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29uZmlnLmMgIHwgODINCisrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCiB0b29scy9w
b3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29yZS5jICAgIHwgMjQNCisrKysrKysr
KysrKysrKysrKysNCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtZGFl
bW9uLmMgIHwgIDMgKy0tDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0
LWRpc3BsYXkuYyB8IDExICsrKysrKystLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1z
ZWxlY3QvaXNzdC5oICAgICAgICAgfCAgNCArKysrDQogNiBmaWxlcyBjaGFuZ2VkLCAxMTYgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo=
