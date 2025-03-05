Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B727C205514;
	Wed,  5 Mar 2025 15:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741189780; cv=fail; b=d7lXbBbj+Q8g42kIEQ8jHoY8HPKJnNYbu86cGnXA/HDyGiOV87Vtb9F/1/hYcmHcqE4K6Pe5hzS+J7ZxSzLlwTdCMGmOHpgHFT+C9MVS7lMXfWCdiKCjSiY+6mQW2sfzcFqXEc5VTHMCMKfI7V1LkywsdSRnX6Xj74CBM8KXw0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741189780; c=relaxed/simple;
	bh=G9NQsS/JtknlCV7ZECHgjdPPBZbPQ7T4s1gfqGbCZVA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M1DzbnAAbLYWLBX8ceHc/Du/5jILWQPaDRrhDmCQldmYxoJESytxDRd6t/uQkh1TfE6Xtod8HHLHt8tgywpO940g2wzD7an/ts0eEUaYQQe598j8v8UoRIre+Eda+KrO+BSmZ2Myt0qr5zvbN5OA2b/4OWLUxLs/nunx13IUY0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=XcP4MkfO; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="XcP4MkfO"
Received: from pps.filterd (m0355087.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525Es2JR008487;
	Wed, 5 Mar 2025 15:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=G9NQsS/JtknlCV7ZECHgjdPPBZbPQ7T4s1gfqGbCZVA=; b=XcP4MkfOYSJW
	jLmVq1E4QtCNSTWfpHhIlhjwI95gtat7Gag2kgx0bT7e1K1K9DoNK+LDrAdYlsJ7
	sRKwoJfehqn3N1IQHcJe8O/ZiQGzqfEkAqbi0yda0nHeNvyVPiiwVJo0zbAVG+0h
	l9qdlD3f/IHyGH16SLGAYt/gBYsLA7VXREMqMIvdVWnoM8PI+dBtQuDo5jJSkzCh
	Dc0MNK8Eph5PfGArs4YrjsuwwVhhIWlBYcVD2R5GisOzF/3qy04VXx7yarNS+G0G
	YZbcMaD1eZOUGIfKep3quXADjnUVE7wgzbJzE2ku9VUPpkMFTAsVTHxsOfnufXTW
	tjkJc9LaBA==
Received: from apc01-psa-obe.outbound.protection.outlook.com (mail-psaapc01lp2047.outbound.protection.outlook.com [104.47.26.47])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 456jxg8wqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 15:49:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z4an9td/+L13ODZK+MNv9p5PKijxuw0sTX+1m5ZNeBcrCu2jyItg66HaGxDtbISNMzmcvjdPNVas5068PNFcBKXExdp3B530rUdnm3YIcqduy/oPDZ57kYfyG0zv5J4pZt0UnaHwfGIbdWArZsy307oz4BcvoN2Y5j7JuL7aSijucZnbpddnOnrRZXh2jyM66UejYBiPpxzB27/YOSR17d3WhdsJyRnr7NxyiG5fYNlroWsYINpvBoYGhRWtzPyMz3gWzu+moUxfMmjgSUfzNyRTRXChhUKsfuF6Wdq83SzWKTh4U/ZO9QwjBNS3kXLcKb6nljNaf27LhDpck7JtCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9NQsS/JtknlCV7ZECHgjdPPBZbPQ7T4s1gfqGbCZVA=;
 b=XwiUZm3IJwHiDYaqBiYcBkGqYTHAphCNA95h7PbCdIw+sxTBYJK6B2F9trQuudxlaRp0KtQlSyj31wesipm2sXneJjV774t4x2ufrJNKmOuJFf8wcZeHCODck795g3uXGwHkb4VnpBz+7yaK/bZXUoV5frg1r26B9viBzqXi5Y2Sfkq9sFUgb26r3VCGY4pgZzwLh+dpKwisuBoCpkxUk6jCZy8ijz2Mi4bV8Wj48tcxeqts4yu6XI5IJRREihcy3P6DfwfbDQ89UxzJQWMpnnwT/hyJrjVwOh10kzb+wWyhRkS1eIp0uDnVO3JC0Kp/nGNamavB2FwZOI7FkOTrfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from SEZPR03MB7959.apcprd03.prod.outlook.com (2603:1096:101:18a::10)
 by KL1PR03MB8307.apcprd03.prod.outlook.com (2603:1096:820:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 15:49:19 +0000
Received: from SEZPR03MB7959.apcprd03.prod.outlook.com
 ([fe80::6df6:a96c:dd65:a7ab]) by SEZPR03MB7959.apcprd03.prod.outlook.com
 ([fe80::6df6:a96c:dd65:a7ab%6]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 15:49:19 +0000
From: Nitin Joshi1 <njoshi1@lenovo.com>
To: Hans de Goede <hdegoede@redhat.com>,
        Mark Pearson
	<mpearson-lenovo@squebb.ca>,
        Nitin Joshi <nitjoshi@gmail.com>,
        =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>,
        "ibm-acpi-devel@lists.sourceforge.net"
	<ibm-acpi-devel@lists.sourceforge.net>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [External] Re: [PATCH] platform/x86: thinkpad_acpi: Add new sysfs
 to check user presence sensing status
Thread-Topic: [External] Re: [PATCH] platform/x86: thinkpad_acpi: Add new
 sysfs to check user presence sensing status
Thread-Index: AQHbjX2aiGWHOI+QSkKz5vW5Ykhy1bNkavGAgAAYaGA=
Date: Wed, 5 Mar 2025 15:49:18 +0000
Message-ID:
 <SEZPR03MB7959A3EF8AFF7922D54F92738CCB2@SEZPR03MB7959.apcprd03.prod.outlook.com>
References: <20250305023319.6318-1-nitjoshi@gmail.com>
 <0cedc065-8cb7-4ef8-8989-6b113eb43460@app.fastmail.com>
 <f853b726-898c-4400-ab5a-50d3c19caea9@redhat.com>
In-Reply-To: <f853b726-898c-4400-ab5a-50d3c19caea9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7959:EE_|KL1PR03MB8307:EE_
x-ms-office365-filtering-correlation-id: e2788117-a301-42fd-cffb-08dd5bfd4a73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?eXR1dzJXOXRxZnhLeWlJZUtpSjQ5TGFIbS9QTUdwek16RHFoR3JlaGJyUGFW?=
 =?utf-8?B?MnR5MStkOTgxajQ2cHFDZm1ZZVRXZUt3ekVoUjNEM2RQR1JsM2U1SVMxNzRO?=
 =?utf-8?B?bG9xNlhyVExWZ2Z4ak14ZFVLUkR6UGVlNnM2UFBJV1dFKy84MmVKa0Ezano4?=
 =?utf-8?B?TGRYM3QwVnRGUGdQcUVFM3Jna0NsUXIvN0xrYVRYYS9kd0JSYWpkOTE1Q1VP?=
 =?utf-8?B?enNucFFJb0tnR1cwTzQzaFp2bFJOMHE3enRtanJjNTVaa3dVaTVnTStoT0Rj?=
 =?utf-8?B?UGJEYzNMNmVqbE1yRk1SZmxzVVoxQjNmeTZOMDVBallNSVlvblVIS2xtaE9p?=
 =?utf-8?B?a0RHRFU4RjVnWkh0RWorbmU3WVNZRDhqTEtNZGRrM01IWmZCa29CdkJhYmxm?=
 =?utf-8?B?Q1grdlo3elY1dy8rT0gxSlZnamc2aXNtc0MxblhWa0VWVFUrZ2VpYXJ2d3dU?=
 =?utf-8?B?ZzlCMHJBMVpQNldIU3dCWlZrcFJ2UnhxYWpUdzJYUmI1SzFHbm5BeVduaDFQ?=
 =?utf-8?B?eUZsdDdEb0dEc1AwRzdINWFyY0R6cmJSdlNmUWlub090ajFQTXZrdDl4RTNM?=
 =?utf-8?B?ODJCS3B0d290OVRyK0FvNWxJb3FId25ieWNROHJiMEF1VWlDeUlUSWNMS0ps?=
 =?utf-8?B?Zmt1T1hOMWsyczhrZzhDalQvZUJXUmRydEwxd09uM1QyTDIzZUsvL21SQTZn?=
 =?utf-8?B?NDRaOXRCem9kTy82eXRSMk5jNW83L3I1RlMzeExPcm5SbjBWTEM3THRSbnV1?=
 =?utf-8?B?Zmdqbkd5RlJLM1RXRVhvRkRVYzdrbDBqcTVaYkJvTlYraG9IeXFvUjI2ZEpa?=
 =?utf-8?B?RTJoZW9TdThLZTFjK0FCK09sbXArTDZsbTBCNG40N05GSEl5REhMbmtORUIr?=
 =?utf-8?B?MHp2MVZVMWdJR2JkUW4rSlVnek5EZ1NVMU1MM0FyOEZpUzFiUmpFa0pXYUYx?=
 =?utf-8?B?ejAwVWZ5MFZ6ZkZ4ckZvR2JVZHRUdkVqbXpwVGRGd3h3dUpZRUlPaEFaYlIz?=
 =?utf-8?B?RnhPTWR5amphVU9DRWRXVCs0eTh6ci81WHlYQmlxaXgrUitRQVIrZ0xsRlkr?=
 =?utf-8?B?SDdES0c5ZS82NkVQQUJ4UjNCQXRSaVVaMVR0R0pZb1NGMmlZZ1NBUjdQMlQw?=
 =?utf-8?B?bm1KaVQzZzRHTlBxa2ZHaFF2eUwrL1ZSOGNqT25XUVI3R2ZHNURJZmlRcUpG?=
 =?utf-8?B?Sm8rLzVRc01MTEN6NWM3WDNkWHpXQ09FVEY5K0tXWS91Y29xTlRaV1FZTkFP?=
 =?utf-8?B?Rzk4UkYvQ3d0aWV6OFVCVkY3eUFVWlVLclZ5M3k0MWc0OTIyMlJ2djlUKzdV?=
 =?utf-8?B?bFZ5UjdveHE2Q1RxbGlDMFhhZ3FWVGVGOTJrT2srUFpRRDF4dThaelNtckZ2?=
 =?utf-8?B?WXpadWZLWlA2SmdNVEVtSFoyR1NEcktMNDJrUktDSmxiUU1Hdm9qSk5BMWhY?=
 =?utf-8?B?N1N1dkpBUHhCNE9XR0pTTTZvd3llRGgxMVBUSzRIaWQ4SVVrMDM5Mm5sTjhR?=
 =?utf-8?B?UVhkdkEveHY2VHlEQlVXdkhqOEhhSTBrL2c2bDJ2Z0lPMXFNY3NWb0dvM1ZI?=
 =?utf-8?B?TmJsdkRDcmpna2RIZmJvNFJYRGdsdHJNTU04OXJ1aFVOUmQ5QWxZU1VmL25m?=
 =?utf-8?B?Q3RPOHcyRTUxMmlaSkNnSWwvQU11VG00S2ZwejhHN3pTbUptZExyODd6RTFX?=
 =?utf-8?B?aGJEdUxEeUQvQnZ1ZTdqUGNXcDFQeG1SSStwU3ZxUkVSaW5Dc2JZK2Nyb0dR?=
 =?utf-8?B?cHhmc0xkWDBhNkx5U3h6bjMvU2tHb0traGgwK1V6a0h1UkxnL0oyUUdTWm9r?=
 =?utf-8?B?ZjYwUkJIWlkwRzRVMCtRM2RBL1BseVlOT1lUcWEwSThlQjBHYk5wWDRaSVRK?=
 =?utf-8?B?ZU01bjhHZklHMlhHMnl2c1k3cUphSS82LzJ3Y2Ntb21jZDAzdVhTQzd1ZURO?=
 =?utf-8?Q?z8uFT9ngKswZo3y7eAvJJd/VjAf8zf3U?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7959.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVhzbXpYSmIxYWV5NER1bHR0d2M0MU9hUlBjMFlmd1FORzE4dXlFRlVrZXNu?=
 =?utf-8?B?aVl4OEpzTi9yZDNVV05LVWFvUGdRZWRwY0lsSy9jbEgxNThpL0ZSUGxaWXJi?=
 =?utf-8?B?dk5FcHh4VldWQ0NkR3hWcjdQMW83OUtMSzl3OWtuaXEwSEdDSmVHNjRURlc2?=
 =?utf-8?B?TXh2RmI0b041ZWxlWmxXdjdnaC8xUzc2anprdTY0ckFrVm9DUC8zS2NlL1FN?=
 =?utf-8?B?a3VqcUxoV3lzMkg2eUlzanM0SzltRkM4N0NlQ2E3cmsvaU5hNXBZL1ZWZmpB?=
 =?utf-8?B?QnlUK0N6MXdNZFkvL3dJTnRFLzdXVW5HLzQxUzZ0QjRKVHBrK2hIMys5M25F?=
 =?utf-8?B?QU9TN0N2V3psVlNWeFRXdmx1Z2Y4UWxWcDJOV3VSLzRjVHVDNDI2RXdTS2F2?=
 =?utf-8?B?N1ZJWnc2bHFkYkxGQnZoeDFSb211RU52ZThLcUJxQ2p4UFhmTXAxV3VnWXha?=
 =?utf-8?B?MmVNVnRkSjhIdkhjT3F3RjdLS0RvSFVoYWk5ZHFnL3lHMCtSaG1hNitqWW5w?=
 =?utf-8?B?R3hMSkJGOEJIbTlCTFl5a056UDU1RUs3Tjg0SC8vMzhoR0dNQVQ1K3JoUTNl?=
 =?utf-8?B?UWRkdlgvay9ERHpTbzVTek9abVVPYWtaZ0JaRHhlUTNJQmhmMjg2Vkh6cm1r?=
 =?utf-8?B?NkhzNnNrUWhSR3NJRGdjcTM0eTZ1ZHVzZXBENmhlZmRmOHJ3WjNhby91eStV?=
 =?utf-8?B?V2NQc1gramgycUhsTzlHVFdJS1NuUHRjS3pTQVZnZTlCVXpZS2x6Rmh2bFl2?=
 =?utf-8?B?ZktMVFl5Nk1QcUJVUDNoNzlxRG5xYlllbEowWERvUGl6L3h0dXZmWHQwL0F4?=
 =?utf-8?B?bzZUNHB5QlVQaUs0UHl6SGg1S0dmbkM4VGVFVCtwdDJwM0k0cHQvU1dXLzJH?=
 =?utf-8?B?UVc0aDgrdHo5RVl4STNUVk9xYXM0M0l1dkN0dU5DZUV1YTMxcUs3NWJyR0Jv?=
 =?utf-8?B?c0NJS1B6N2lzcFR2MFhnSXdOZ1A5YnY1OGI5Mm9HWnpUcUtweSsxaSthUktV?=
 =?utf-8?B?UGE4U3BKVnM5b29tRnAydFkzN0wzYVJKQzBUNGZMZGpvcUlIalhRYWVNNnJQ?=
 =?utf-8?B?QWQ1UG5sTk9xL0VYeEFXYzIzMDdJM0hkSEZTNkMzNE5mMDlHUUZIYnlqdjEz?=
 =?utf-8?B?Z1FDTmxJcGxSU1Y3T1VHb1F4ZXJJdnBaVGRRUjZEYTZsRFVLSDRCM01TZXVB?=
 =?utf-8?B?TEdMZFEvY0F4M1o3OTlMUHVzN3JhVlFoMHhTVDRFdElJMGNxd3RyTzVhYjkv?=
 =?utf-8?B?VEdlekt4b3k4bE1iL0hON1hTbWx4WGdabVNndnhlUVl0T214K2YyUW1EZzE2?=
 =?utf-8?B?RUM0a1lXTUQzQmVDK3pGYlpYYlBESFBvSzNsQjZiM3RjNE1POG94UXhzVFd6?=
 =?utf-8?B?Y1hOdTlQUmV0cGU4dFBNQ0RyZS9zWXIxejVHWWk5dWlWeEtibzF1UWp2Vk1q?=
 =?utf-8?B?QlRJVTRaUWU5QmM1My9PRVB6RjNZOEx6WWxHNTV3MU00dFFmdklUeW9GS0tr?=
 =?utf-8?B?S2pYb0x0ejNyM0tKWmJFdk55TVZrZXFSSFViUlRSWmtySlBKU0pOdU9RcnEx?=
 =?utf-8?B?bm50U3FhaDRyU0RSRUQ4dURwZDNxMDRNSXFwVTdRWHBLYllrUVppTTdhOEgy?=
 =?utf-8?B?YmZJNmREeUFITEcrV2dRUzA5NEpnTkFEQmd3TWJsVlZraHMyTi9LNGIyeWRw?=
 =?utf-8?B?eldvOFhmV2wvVW9FamxYbmFud0ZRSnN5TmJBdm1CRXA2VjFHSGdPZkR4SjM4?=
 =?utf-8?B?eXY2bzV2Rlc4TDFHTGY4REZyNFF5bFJBWlNLVGZMM1F1eFBDWlBndmxKVHl6?=
 =?utf-8?B?VmROVE1PcEsrQzVJZlUwVWQ2czUrdjJvb3d4TXJsbnJoeXgxRFNGWWIvUWpJ?=
 =?utf-8?B?cjk2Wk5ib0lJVnVZSDVhc3BBZ2U3REdPNTFZUTE2Vk8vbDkwWEo4MmNYMEZ3?=
 =?utf-8?B?dnJtWGNXTU11b1cvNjRLKzJtSy9sMjlwMmhuMUNIc0oyQ1U2SjUxUHdlZTNY?=
 =?utf-8?B?NC9XNVhTVVVGZDhDSVFHU04rRnpib3ZENUtUUHRWcDJlVHRxUys2elhkeG41?=
 =?utf-8?B?YmxwZjZqRUkvK3N0ZklDTmV2bEhjZWdIR3N5Sm5pVmpiclV2OEMzY1F6L2NL?=
 =?utf-8?Q?qXPCYR88B1rPhBywNlR7NLAXl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7959.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2788117-a301-42fd-cffb-08dd5bfd4a73
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 15:49:18.9933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Da0KlKZBdv1ekFX8JkYKkq3xbQll5CSLOk8TgyR4ZwY8spHabG6is5fgSFl6nnamaXwy3sS1IuAvbIDCGmIlUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8307
X-Authority-Analysis: v=2.4 cv=L4PnQ/T8 c=1 sm=1 tr=0 ts=67c87282 cx=c_pps a=lrVmRuJdjBIap5iKQhXVww==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=AtrZnsR-UShDiYK-:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=20KFwNOVAAAA:8 a=XVxARQIAAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=FP58Ms26AAAA:8 a=8k6WQxmsAAAA:8 a=Ycz7HtZvw9HTtHpKjCEA:9 a=QEXdDO2ut3YA:10 a=p77dMD-AzHemhwI1qD6W:22
X-Proofpoint-GUID: Mjy399YMuO_B8j95ab6tFFSD_21rFOLm
X-Proofpoint-ORIG-GUID: Mjy399YMuO_B8j95ab6tFFSD_21rFOLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_06,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050122

SGkgSGFucywNCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBjb21tZW50cy4NCg0KPi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVA
cmVkaGF0LmNvbT4NCj5TZW50OiBXZWRuZXNkYXksIE1hcmNoIDUsIDIwMjUgODozNyBQTQ0KPlRv
OiBNYXJrIFBlYXJzb24gPG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+OyBOaXRpbiBKb3NoaQ0K
PjxuaXRqb3NoaUBnbWFpbC5jb20+OyBJbHBvIErDpHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51
eC5pbnRlbC5jb20+DQo+Q2M6IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnOyBp
Ym0tYWNwaS0NCj5kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LWRvY0B2Z2VyLmtl
cm5lbC5vcmc7IE5pdGluIEpvc2hpMQ0KPjxuam9zaGkxQGxlbm92by5jb20+DQo+U3ViamVjdDog
W0V4dGVybmFsXSBSZTogW1BBVENIXSBwbGF0Zm9ybS94ODY6IHRoaW5rcGFkX2FjcGk6IEFkZCBu
ZXcgc3lzZnMgdG8NCj5jaGVjayB1c2VyIHByZXNlbmNlIHNlbnNpbmcgc3RhdHVzDQo+DQo+SGkg
Tml0aW4sIE1hcmssDQo+DQo+T24gNS1NYXItMjUgNDoyMCBBTSwgTWFyayBQZWFyc29uIHdyb3Rl
Og0KPj4NCj4+IE9uIFR1ZSwgTWFyIDQsIDIwMjUsIGF0IDk6MzMgUE0sIE5pdGluIEpvc2hpIHdy
b3RlOg0KPj4+IFNvbWUgVGhpbmtwYWQgcHJvZHVjdHMgc3VwcG9ydCBIdW1hbiBQcmVzZW5jZSBE
ZXRlY3Rpb24gKEhQRCkNCj5mZWF0dXJlcy4NCj4+PiBBZGQgbmV3IHN5c2ZzIGVudHJ5IHNvIHRo
YXQgdXNlcnNwYWNlIGNhbiBkZXRlcm1pbmUgaWYgZmVhdHVyZSBpcw0KPj4+IHN1cHBvcnRlZCBv
ciBub3QuDQo+Pj4NCj4+PiBSZXZpZXdlZC1ieTogTWFyayBQZWFyc29uIDxtcGVhcnNvbi1sZW5v
dm9Ac3F1ZWJiLmNhPg0KPj4NCj4+IEp1c3QgaW4gY2FzZSB3ZSdyZSBicmVha2luZyBwcm90b2Nv
bCAtIEkgaGF2ZSByZXZpZXdlZCB0aGlzIG9mZiBtYWlsaW5nIGxpc3Qgd2l0aA0KPk5pdGluIGFu
ZCBnYXZlIGl0IHRoZSB0aHVtYnMgdXAuIFRoZSB0YWcgaXMgY29ycmVjdC4NCj4NCj5BZGRpbmcg
YSBSZXZpZXdlZC1ieSB0YWcgYmFzZWQgb24gaW50ZXJuYWwgcmV2aWV3cyBkb25lIGJlZm9yZSBz
dWJtaXR0aW5nDQo+djEgaXMgZmluZSwgbm8gd29ycmllcy4NCk5vdGVkICwgVGhhbmsgeW91ICEN
Cg0KPg0KPkkgZG8gd29uZGVyIHdoYXQgdGhlIHVzZS1jYXNlIGZvciB0aGlzIGV4YWN0bHkgaXM/
DQo+DQpUaGlzIHNldHRpbmcgd2lsbCBiZSB1c2VkIHRvIGVuYWJsZSBvciBkaXNhYmxlIGZlYXR1
cmVzIGxpa2UgICJMb2NrIG9uIExlYXZlIiBldGMgZnJvbSB1c2VyLXNwYWNlLiANCg0KPlRoZSBj
dXJyZW50IGRvY3VtZW50YXRpb24gb2YgInNvIHRoYXQgdXNlcnNwYWNlIGNhbiBkZXRlcm1pbmUg
aWYgZmVhdHVyZQ0KPnJlbGF0ZWQgdG8gSFBEIHNob3VsZCBiZSBlbmFibGVkIG9yIGRpc2FibGVk
LiINCj4NCj5pcyBhIGJpdCB2YWd1ZS4gVGhlIHJlYXNvbiBJJ20gYXNraW5nIGlzIGJlY2F1c2Ug
SSdtIHdvbmRlcmluZyBpZiB0aGlzIGlzIHRoZSBiZXN0DQo+QVBJIHRvIGV4cG9zZSB0aGlzIHRv
IHVzZXJzcGFjZS4NCj4NCj5BbHNvIGlmIEkgdW5kZXJzdGFuZCB0aGluZ3MgY29ycmVjdGx5IHRo
aXMgaXMgb25seSBhYm91dCBjaGVja2luZw0KPmlmOg0KPg0KPjEpIFRoZXJlIGlzIEhQRCBzdXBw
b3J0IG9uIHRoZSBtYWNoaW5lIGF0IGFsbCAoaWYgeWVzIHRoaXMgZmlsZSB3aWxsIGV4aXN0KQ0K
SSBhbSBhbHNvIGNoZWNraW5nIHNlbnNvciBzdGF0dXMgaS5lIENIUERfR0VUX1NFTlNPUl9TVEFU
VVMgZnJvbSBCSU9TLg0KU28gLCBpZiB0aGVyZSBpcyBubyBzZW5zb3IgcHJlc2VudCB0aGVuIGZp
bGUgd2lsbCBub3QgZXhpc3QgLg0KDQo+MikgSWYgSFBEIGlzIHN1cHBvcnRlZCBvbiB0aGlzIG1h
Y2hpbmUsIGlzIGl0IGFsc28gZW5hYmxlZCBvciBkaXNhYmxlZCBpbiB0aGUNCj5CSU9TPyANClVz
ZXIgbmVlZCB0byBleHBsaWNpdGx5IGVuYWJsZSBvciBkaXNhYmxlIGl0IGluIEJJT1MgZm9yIGV4
YW1wbGUgdXNlciBuZWVkIHRvIGRpc2FibGUgaXQgLCBpZiBkb2VzIG5vdCANCndhbnQgdG8gdXNl
ICJIUEQiIHJlbGF0ZWQgZmVhdHVyZXMgbGlrZSAiTG9jayBvbiBMZWF2ZSIgZXRjIC4NCg0KPg0K
PklPVyB0aGlzIGlzIG5vdCBhYm91dCBhY3R1YWxseSBnZXR0aW5nIHRoZSBIUEQgcmVzdWx0LCB3
aGljaCB3b3VsZCBiZSAiaHVtYW4NCj5wcmVzZW50IiBvciAiaHVtYW4gbm90IHByZXNlbnQiLCBy
aWdodCA/DQo+DQpZZXMgLCB5b3VyIHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdCAuDQoNCj5Bbnkg
cGxhbnMgdG8gZXhwb3J0IHRoZSBhY3R1YWwgSFBEIHJlc3VsdCA/DQpZZXMgLCB0aGVyZSBpcyBk
aXNjdXNzaW9uIG9uLWdvaW5nIHdpdGggSW50ZWwgdG8gZXhwb3J0IGFjdHVhbCBIUEQgcmVzdWx0
IGJ1dCB0aGVyZSBpcyBubyBmaXhlZCB0aW1lIHBsYW4NCmFzIG9mIG5vdy4gDQogDQo+DQo+QWxz
byBpZiB0aGlzIGlzIGp1c3QgYWJvdXQgY2hlY2tpbmcgdGhlIEJJT1Mgc2V0dGluZyB3aHkgbm90
IGp1c3QgdXNlIHRoZSB0aGluay1sbWkNCj5kcml2ZXIgLyBmaXJtd2FyZS1hdHRyaWJ1dGUgc3lz
ZnMgQVBJIGZvciB0aGF0ID8NClNvcnJ5LCBJIGNvbXBsZXRlbHkgbWlzc2VkIGl0IC4NClllcywg
YXMgb2Ygbm93ICwgIHdlIGNhbiB1c2UgZmlybXdhcmUtYXR0cmlidXRlIHN5c2ZzIHRvIGNoZWNr
IGVuYWJsZSBhbmQgZGlzYWJsZSANCnN0YXR1cyAuIEluIGNhc2UgLCB3ZSBuZWVkIGFkZGl0aW9u
YWwgaW5mb3JtYXRpb24gYWZ0ZXIgYWN0dWFsIEhQRCBkYXRhIGlzIGF2YWlsYWJsZSAgdGhlbiAN
CndlIGNhbiByZXZpc2l0IHRoaXMgcGF0Y2ggLg0KSXMgdGhpcyBhY2NlcHRhYmxlID8gU29ycnks
IGlmIGFueSBpbmNvbnZlbmllbmNlICENCg0KPg0KPg0KPj4+IFNpZ25lZC1vZmYtYnk6IE5pdGlu
IEpvc2hpIDxuaXRqb3NoaUBnbWFpbC5jb20+DQo+Pj4gLS0tDQo+Pj4gIC4uLi9hZG1pbi1ndWlk
ZS9sYXB0b3BzL3RoaW5rcGFkLWFjcGkucnN0ICAgICB8IDIwICsrKysrDQo+Pj4gIGRyaXZlcnMv
cGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYyAgICAgICAgICB8IDc5ICsrKysrKysrKysrKysr
KysrKysNCj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCA5OSBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9sYXB0b3BzL3RoaW5rcGFkLWFj
cGkucnN0DQo+Pj4gYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2xhcHRvcHMvdGhpbmtwYWQt
YWNwaS5yc3QNCj4+PiBpbmRleCA0YWIwZmVmN2Q0NDAuLjAyZTZjNDMwNmY5MCAxMDA2NDQNCj4+
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2xhcHRvcHMvdGhpbmtwYWQtYWNwaS5y
c3QNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2xhcHRvcHMvdGhpbmtwYWQt
YWNwaS5yc3QNCj4+PiBAQCAtMTU3Niw2ICsxNTc2LDI2IEBAIHBlcmNlbnRhZ2UgbGV2ZWwsIGFi
b3ZlIHdoaWNoIGNoYXJnaW5nIHdpbGwgc3RvcC4NCj4+PiAgVGhlIGV4YWN0IHNlbWFudGljcyBv
ZiB0aGUgYXR0cmlidXRlcyBtYXkgYmUgZm91bmQgaW4NCj4+PiBEb2N1bWVudGF0aW9uL0FCSS90
ZXN0aW5nL3N5c2ZzLWNsYXNzLXBvd2VyLg0KPj4+DQo+Pj4gK1VzZXIgUHJlc2VuY2UgU2Vuc2lu
ZyBEZXRlY3Rpb24NCj4+PiArLS0tLS0tDQo+Pj4gKw0KPj4+ICtzeXNmczogaHBkX2Jpb3NfZW5h
YmxlZA0KPj4+ICsNCj4+PiArU29tZSBUaGlua3BhZCBwcm9kdWN0cyBzdXBwb3J0IEh1bWFuIFBy
ZXNlbmNlIERldGVjdGlvbiAoSFBEKQ0KPmZlYXR1cmVzLg0KPj4+ICtBZGRlZCBuZXcgc3lzZnMg
ZW50cnkgc28gdGhhdCB1c2Vyc3BhY2UgY2FuIGRldGVybWluZSBpZiBmZWF0dXJlDQo+Pj4gK3Jl
bGF0ZWQgdG8gSFBEIHNob3VsZCBiZSBlbmFibGVkIG9yIGRpc2FibGVkLg0KPg0KPiJBZGRlZCBu
ZXcgc3lzZnMgZW50cnkgLi4uIiBzb3VuZHMgbW9yZSBsaWtlIHNvbWV0aGluZyBmb3IgYSBjb21t
aXQgbWVzc2FnZQ0KPnRoZW4gZm9yIGluIGFuIEFCSSBEb2N1bWVudGF0aW9uIGZpbGUuIEluIDUg
eWVhcnMgdGhlICJhZGRpbmcgbmV3IHN5c2ZzIg0KPmxhbmd1YWdlIGlzIGdvaW5nIHRvIGxvb2sg
cmVhbGx5IHdlaXJkIGluIHRoaXMgZmlsZS4NCj4NCj5QbGVhc2UganVzdCBkZXNjcmliZSB0aGUg
ZnVuY3Rpb24gKyBpbnRlbmRlZCB1c2VzIHdpdGhvdXQgdXNpbmcgIkFkZGluZyBuZXciLg0KPg0K
Tm90ZWQgLCBUaGFua3MgIQ0KDQo+Pj4gKw0KPj4+ICtUaGUgYXZhaWxhYmxlIGNvbW1hbmRzIGFy
ZTo6DQo+Pj4gKw0KPj4+ICsgICAgICAgIGNhdCAvc3lzL2RldmljZXMvcGxhdGZvcm0vdGhpbmtw
YWRfYWNwaS9ocGRfYmlvc19lbmFibGVkDQo+Pj4gKw0KPj4+ICtCSU9TIHN0YXR1cyBpcyBtZW50
aW9uZWQgYXMgYmVsb3c6DQo+Pj4gKy0gMCA9IERpc2FibGUNCj4+PiArLSAxID0gRW5hYmxlDQo+
Pj4gKw0KPj4+ICtUaGUgcHJvcGVydHkgaXMgcmVhZC1vbmx5LiBJZiB0aGUgcGxhdGZvcm0gZG9l
c24ndCBoYXZlIHN1cHBvcnQgdGhlDQo+Pj4gK3N5c2ZzIGNsYXNzIGlzIG5vdCBjcmVhdGVkLg0K
Pj4+ICsNCj4+PiAgTXVsdGlwbGUgQ29tbWFuZHMsIE1vZHVsZSBQYXJhbWV0ZXJzDQo+Pj4gIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYw0KPj4+IGIvZHJpdmVycy9wbGF0
Zm9ybS94ODYvdGhpbmtwYWRfYWNwaS5jDQo+Pj4gaW5kZXggNzJhMTBlZDIwMTdjLi5kYWYzMWIy
YTRjNzMgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvdGhpbmtwYWRfYWNw
aS5jDQo+Pj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvdGhpbmtwYWRfYWNwaS5jDQo+Pj4g
QEAgLTExMDM5LDYgKzExMDM5LDgwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXR0cmlidXRlX2dy
b3VwDQo+Pj4gYXV4bWFjX2F0dHJfZ3JvdXAgPSB7DQo+Pj4gIAkuYXR0cnMgPSBhdXhtYWNfYXR0
cmlidXRlcywNCj4+PiAgfTsNCj4+Pg0KPj4+DQo+Ky8qKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioNCj4qKioqDQo+Pj4gKyoqKioq
Kg0KPj4+ICsgKiBDSFBEIHN1YmRyaXZlciwgZm9yIHRoZSBMZW5vdm8gSHVtYW4gUHJlc2VuY2Ug
RGV0ZWN0aW9uIGZlYXR1cmUuDQo+Pj4gKyAqLw0KPj4+ICsjZGVmaW5lIENIUERfR0VUX1NFTlNP
Ul9TVEFUVVMgICAgICAgICAgIDB4MDAyMDAwMDANCj4+PiArI2RlZmluZSBDSFBEX0dFVF9CSU9T
X1VJX1NUQVRVUyAgICAgICAgICAweDAwMTAwMDAwDQo+Pj4gKw0KPj4+ICtzdGF0aWMgYm9vbCBo
YXNfdXNlcl9wcmVzZW5jZV9zZW5zaW5nOyBzdGF0aWMgaW50IGhwZF9iaW9zX3N0YXR1czsNCj4+
PiArc3RhdGljIGludCBjaHBkX2NvbW1hbmQoaW50IGNvbW1hbmQsIGludCAqb3V0cHV0KSB7DQo+
Pj4gKwlhY3BpX2hhbmRsZSBjaHBkX2hhbmRsZTsNCj4+PiArDQo+Pj4gKwlpZiAoQUNQSV9GQUlM
VVJFKGFjcGlfZ2V0X2hhbmRsZShoa2V5X2hhbmRsZSwgIkNIUEQiLA0KPiZjaHBkX2hhbmRsZSkp
KSB7DQo+Pj4gKwkJLyogUGxhdGZvcm0gZG9lc24ndCBzdXBwb3J0IENIUEQgKi8NCj4+PiArCQly
ZXR1cm4gLUVOT0RFVjsNCj4+PiArCX0NCj4+PiArDQo+Pj4gKwlpZiAoIWFjcGlfZXZhbGYoY2hw
ZF9oYW5kbGUsIG91dHB1dCwgTlVMTCwgImRkIiwgY29tbWFuZCkpDQo+Pj4gKwkJcmV0dXJuIC1F
SU87DQo+Pj4gKw0KPj4+ICsJcmV0dXJuIDA7DQo+Pj4gK30NCj4+PiArDQo+Pj4gKy8qIHN5c2Zz
IGhwZCBiaW9zIHN0YXR1cyAqLw0KPj4+ICtzdGF0aWMgc3NpemVfdCBocGRfYmlvc19lbmFibGVk
X3Nob3coc3RydWN0IGRldmljZSAqZGV2LA0KPj4+ICsJCQkJc3RydWN0IGRldmljZV9hdHRyaWJ1
dGUgKmF0dHIsDQo+Pj4gKwkJCQljaGFyICpidWYpDQo+Pj4gK3sNCj4+PiArCXJldHVybiBzeXNm
c19lbWl0KGJ1ZiwgIiVkXG4iLCBocGRfYmlvc19zdGF0dXMpOyB9IHN0YXRpYw0KPj4+ICtERVZJ
Q0VfQVRUUl9STyhocGRfYmlvc19lbmFibGVkKTsNCj4+PiArDQo+Pj4gK3N0YXRpYyBzdHJ1Y3Qg
YXR0cmlidXRlICpjaHBkX2F0dHJpYnV0ZXNbXSA9IHsNCj4+PiArCSZkZXZfYXR0cl9ocGRfYmlv
c19lbmFibGVkLmF0dHIsDQo+Pj4gKwlOVUxMDQo+Pj4gK307DQo+Pj4gKw0KPj4+ICtzdGF0aWMg
dW1vZGVfdCBjaHBkX2F0dHJfaXNfdmlzaWJsZShzdHJ1Y3Qga29iamVjdCAqa29iaiwNCj4+PiAr
CQkJCQlzdHJ1Y3QgYXR0cmlidXRlICphdHRyLCBpbnQgbikNCj4+PiArew0KPj4+ICsJcmV0dXJu
IGhhc191c2VyX3ByZXNlbmNlX3NlbnNpbmcgPyBhdHRyLT5tb2RlIDogMDsgfQ0KPj4+ICsNCj4+
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgY2hwZF9hdHRyX2dyb3VwID0g
ew0KPj4+ICsJLmlzX3Zpc2libGUgPSBjaHBkX2F0dHJfaXNfdmlzaWJsZSwNCj4+PiArCS5hdHRy
cyA9IGNocGRfYXR0cmlidXRlcywNCj4+PiArfTsNCj4+PiArDQo+Pj4gK3N0YXRpYyBpbnQgdHBh
Y3BpX2NocGRfaW5pdChzdHJ1Y3QgaWJtX2luaXRfc3RydWN0ICppaWJtKSB7DQo+Pj4gKwlpbnQg
ZXJyLCBvdXRwdXQ7DQo+Pj4gKw0KPj4+ICsJZXJyID0gY2hwZF9jb21tYW5kKENIUERfR0VUX1NF
TlNPUl9TVEFUVVMsICZvdXRwdXQpOw0KPj4+ICsJaWYgKGVycikNCj4+PiArCQlyZXR1cm4gZXJy
Ow0KPj4+ICsNCj4+PiArCWlmIChvdXRwdXQgPT0gMSkNCj4+PiArCQlyZXR1cm4gLUVOT0RFVjsN
Cj4+PiArDQo+Pj4gKwloYXNfdXNlcl9wcmVzZW5jZV9zZW5zaW5nID0gdHJ1ZTsNCj4+PiArCS8q
IEdldCBVc2VyIFByZXNlbmNlIFNlbnNpbmcgQklPUyBzdGF0dXMgKi8NCj4+PiArCWVyciA9IGNo
cGRfY29tbWFuZChDSFBEX0dFVF9CSU9TX1VJX1NUQVRVUywgJm91dHB1dCk7DQo+Pj4gKwlpZiAo
ZXJyKQ0KPj4+ICsJCXJldHVybiBlcnI7DQo+Pj4gKw0KPj4+ICsJaHBkX2Jpb3Nfc3RhdHVzID0g
KG91dHB1dCA+PiAxKSAmIEJJVCgwKTsNCj4NCj5QbGVhc2UgYWRkIGEgZGVmaW5lIGZvciB0aGlz
IHJhdGhlciB0aGVuIGp1c3QgaGFyZGNvZGluZyBhIHNoaWZ0IGJ5IDEuDQo+DQpBY2sgLCBUaGFu
ayB5b3UgIQ0KDQo+Pj4gKw0KPj4+ICsJcmV0dXJuIGVycjsNCj4+PiArfQ0KPj4+ICsNCj4+PiAr
c3RhdGljIHN0cnVjdCBpYm1fc3RydWN0IGNocGRfZHJpdmVyX2RhdGEgPSB7DQo+Pj4gKwkubmFt
ZSA9ICJjaHBkIiwNCj4+PiArfTsNCj4+PiArDQo+Pj4gIC8qDQo+Pj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
Pj4gKi8NCj4+Pg0KPj4+ICBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqdHBhY3BpX2RyaXZlcl9h
dHRyaWJ1dGVzW10gPSB7IEBAIC0xMTA5OCw2DQo+Pj4gKzExMTcyLDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAgKnRwYWNwaV9ncm91cHNbXSA9IHsNCj4+PiAgCSZrYmRs
YW5nX2F0dHJfZ3JvdXAsDQo+Pj4gIAkmZHByY19hdHRyX2dyb3VwLA0KPj4+ICAJJmF1eG1hY19h
dHRyX2dyb3VwLA0KPj4+ICsJJmNocGRfYXR0cl9ncm91cCwNCj4+PiAgCU5VTEwsDQo+Pj4gIH07
DQo+Pj4NCj4+PiBAQCAtMTE2OTQsNiArMTE3NjksMTAgQEAgc3RhdGljIHN0cnVjdCBpYm1faW5p
dF9zdHJ1Y3QgaWJtc19pbml0W10NCj4+PiBfX2luaXRkYXRhID0gew0KPj4+ICAJCS5pbml0ID0g
YXV4bWFjX2luaXQsDQo+Pj4gIAkJLmRhdGEgPSAmYXV4bWFjX2RhdGEsDQo+Pj4gIAl9LA0KPj4+
ICsJew0KPj4+ICsJCS5pbml0ID0gdHBhY3BpX2NocGRfaW5pdCwNCj4+PiArCQkuZGF0YSA9ICZj
aHBkX2RyaXZlcl9kYXRhLA0KPj4+ICsJfSwNCj4+PiAgfTsNCj4+Pg0KPj4+ICBzdGF0aWMgaW50
IF9faW5pdCBzZXRfaWJtX3BhcmFtKGNvbnN0IGNoYXIgKnZhbCwgY29uc3Qgc3RydWN0DQo+Pj4g
a2VybmVsX3BhcmFtICprcCkNCj4+PiAtLQ0KPj4+IDIuNDMuMA0KPj4NCj4NCj4NCj5SZWdhcmRz
LA0KPg0KPkhhbnMNCg0KVGhhbmtzICYgUmVnYXJkcywNCk5pdGluIEpvc2hpIA0K
