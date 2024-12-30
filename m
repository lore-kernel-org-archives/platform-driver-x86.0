Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28188156C71;
	Mon, 30 Dec 2024 05:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735536572; cv=fail; b=oU1YyVfczfMOUB88Uz/JT0ctruZl+CKR3LqVKgslJrO2eZTuRiblzOKk8AayDQjabUVsx874ZiYrMMJT6priOSPXZksryhTrj4nTvyfo1xM0XRIVLCKPXO033Yw/jOUPwCC2suqajwXY+D0ThEh1AghPkA9JdNPk8xTjG6fAUTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735536572; c=relaxed/simple;
	bh=aZ6OsArsMRaoQcBiqBrqdgHBj89NOsIDjwNDcYiobH8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k5AGtwGQcvzFsf5NsaymGDHV20GTvxXx7E+0mPd7g9GbQbNPASEEJyfwhdd91zEpm4sUCQ/mAidm3lJ9EjiwVJ2nKBKF7AYM6VWtiCf85FPVeDZtTfwz+ZWQHZfVE5pqEtdxE2LDg/VjRPfXYnmJVme7OxKuSIEFqN4KPQ+SuKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=FpDM5Nle; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="FpDM5Nle"
Received: from pps.filterd (m0355088.ppops.net [127.0.0.1])
	by m0355088.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 4BTHo9DZ032549;
	Mon, 30 Dec 2024 00:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=49oI0/q/S1pJBPUyoxKJTVXZAVmydizB3JfMuRU3k6o=; b=FpDM5NleEB3k
	aNMpdlJ9A/r9jsjiW7LyGyRtKFetPCtE5AOqBICfLtNZ04HAE/WELhdmOgVdxhnD
	z1q8601+I/4VeU8to0dwOY7jI69pQXWcmWoHeisYu8PCQYAPeMPI2im9Ci8hKysX
	Ja4Bl4hXn4R+HOzi58l/EfD0fvamcDs587x6Ao1qnG3jhhtT4P5hKAa2Zq3kTje9
	RbIRxMj9RRUXgUg5rrCGcDNRRJBki0bKxFugiW0blEQ4GHJEMjVw1lJoW+BNyaTi
	aCPUUcVSXJpF+qoZXgDKfmDvWrWIa4KkpvqL+LvJYhjxePOBDze0D/2rRMQysrgh
	LG8EzA23tA==
Received: from apc01-tyz-obe.outbound.protection.outlook.com (mail-tyzapc01lp2042.outbound.protection.outlook.com [104.47.110.42])
	by m0355088.ppops.net (PPS) with ESMTPS id 43txgshqdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 00:33:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsdxpX+VcWs/sY3Ix3ASc/wM5ERluZPCDlTDayf9+Y2D2ZyAmWTMfPLvi1uSPWbxJl6+9f3XCSY5MG+ZNKgst2IRGc43r1FXDTgG15tUiqMAPl0rrBqQ+80KtujVMnBmRfYOK+OUkDKCZNy+27VykZdaA6cRxE7g2B0mkRgNB4IXVx6bW5s6rVCK9JA+IfG2Gza8ejgPvGi3LNBlyjL+6HcbTvUGNugX2ioAVZQ8yA2uC9A0CW9/k8yrkTxtgJlwK3gCJSOlIWeTshRpXN1vBGj9Src24Y4lj1cbVMH/TpcohnWqgHeXMUUNgGK6/+2BgiiuRD20yaiWV1A7W0f6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49oI0/q/S1pJBPUyoxKJTVXZAVmydizB3JfMuRU3k6o=;
 b=HIricSMiKEiNqzMGh+Sukq8u6+DAcF1B+jMYgfev+4SEF001oTnRAtuLl3aEF4RzvCITb4PMepie+9WSTYmYNW1W5pi3BSEJn/zZBcP7N53nl5JUAOcdOHaahmYb4LY1PIYcqEMdKDSRq79DMlkMDzMvUU2JPA48/jgydf2R6+e6/osZqNLp8z9rVRGkjESBzx4oymbPw/PRrCNvxLmTg6qamdsBlgDDIftdTAp7L7SE1JBwxLiw5NYg87M3g+dcSKIQG9qR5oafl4F/YUYvu9a+Pa1huuq1LWISU+bxFZwSz36cZOMBqFFo2pxzJawC0R8Skvjq6aUnkkS9k4Islg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from SEYPR03MB8067.apcprd03.prod.outlook.com (2603:1096:101:167::9)
 by TYSPR03MB7762.apcprd03.prod.outlook.com (2603:1096:400:413::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Mon, 30 Dec
 2024 00:33:02 +0000
Received: from SEYPR03MB8067.apcprd03.prod.outlook.com
 ([fe80::c366:f663:c467:87b7]) by SEYPR03MB8067.apcprd03.prod.outlook.com
 ([fe80::c366:f663:c467:87b7%7]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 00:33:02 +0000
From: Jackie EG1 Dong <dongeg1@lenovo.com>
To: Takashi Iwai <tiwai@suse.de>, Jackie Dong <xy-jackie@139.com>
CC: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "bo.liu@senarytech.com" <bo.liu@senarytech.com>,
        "kovalev@altlinux.org"
	<kovalev@altlinux.org>,
        "me@oldherl.one" <me@oldherl.one>,
        "jaroslaw.janik@gmail.com" <jaroslaw.janik@gmail.com>,
        "songxiebing@kylinos.cn" <songxiebing@kylinos.cn>,
        "kailang@realtek.com"
	<kailang@realtek.com>,
        "sbinding@opensource.cirrus.com"
	<sbinding@opensource.cirrus.com>,
        "simont@opensource.cirrus.com"
	<simont@opensource.cirrus.com>,
        "josh@joshuagrisham.com"
	<josh@joshuagrisham.com>,
        "rf@opensource.cirrus.com"
	<rf@opensource.cirrus.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "mpearson-lenovo@squebb.ca"
	<mpearson-lenovo@squebb.ca>
Subject: RE: [External] Re: [PATCH v2] ALSA: hda: Support for Ideapad hotkey
 mute LEDs
Thread-Topic: [External] Re: [PATCH v2] ALSA: hda: Support for Ideapad hotkey
 mute LEDs
Thread-Index: AQHbWdClFPjZnA9flEadQWWjkkLrsrL97sFA
Date: Mon, 30 Dec 2024 00:33:01 +0000
Message-ID:
 <SEYPR03MB8067D30F466738C51808461995092@SEYPR03MB8067.apcprd03.prod.outlook.com>
References: <20241224083316.20222-1-xy-jackie@139.com>
 <87ikr2dfnc.wl-tiwai@suse.de>
In-Reply-To: <87ikr2dfnc.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB8067:EE_|TYSPR03MB7762:EE_
x-ms-office365-filtering-correlation-id: 5e2b206a-1b69-427f-0d1b-08dd286984b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Jc4hn1oDZKX6S7v3JDcb1JtizoquhcRPR+Mixo4K+CQ4DPC4mDgUGh/KsFpc?=
 =?us-ascii?Q?MlpXu6q4e6lZMeMv3KYk4a5oFmwpr2jk7C4M1CaW/e3a1ru+tziAoYjiFJ5M?=
 =?us-ascii?Q?MkH+03WxXoap/v5EqrOdTfyS4z/xMMRqAtDP0M7k00WOufsLDogUOXeY6tbx?=
 =?us-ascii?Q?1QxZngnvoGv2KrlB5z8VWuUuf/9Boi0Q8wbXfSvXp7ewD8kb8mKFVLvF2hkN?=
 =?us-ascii?Q?AXp9LZkgXndztFSeDIisX49cwu7o5POGEBWcecW1VcJXcN1+cOAgDJ/5wEJS?=
 =?us-ascii?Q?ze/tyQRlTG64qH3CZNyTRSIEmxGTKQCtRunCaGNkbpoNyARsFnrRndWvYKji?=
 =?us-ascii?Q?3L5Xkakku2odswRncmKgnVCFw/PeGWnA0EgPlQsmlGKCDQD4BsDToZ4Xm0xP?=
 =?us-ascii?Q?ana2Qq6x/QQv4gvbWXrv7ZGCCMj+M+OHMGrw7DQ6ZXzrqF56lwdtwWespRaT?=
 =?us-ascii?Q?p/sGSx1J75LCDfMmem2uH1pO8jl1ayeVKN7CUkCfjlzTf2KppQIaX2whbKXl?=
 =?us-ascii?Q?dFWXuq0qFjs4mzDh9kDVNa/6KSdfrKpC7HNGg3xdpgUsDwEl8dtWTgqe58VG?=
 =?us-ascii?Q?EpbTQofpw1ibz7gM8ZL1Xo4ZPVMCzyQjPmM4ErNL4Ge5RgKC7qxr0mnkxXgc?=
 =?us-ascii?Q?16XDhLvrpT9jT3rE0GHd6CWOhSpb9cuVDbzxQ0Xb5vB3tvS0CwSQlfBqHvIg?=
 =?us-ascii?Q?9ctNBHM+5jCxd0OOv4W/ylQ/fOW4nfncPbLVHEw0sRaF3vrBCzEQ46Wbkk1J?=
 =?us-ascii?Q?2Ed6YK7KTxxM7uZq7KxQOvzLyXnv9MpWZw/VYt84RYV3JphagtLvgfENTgSB?=
 =?us-ascii?Q?tBAn0+66Avu6C6VlAXTykwu5qPu9WKJQLwTTA5WwbWuQASsiLSOsQjWhEH3k?=
 =?us-ascii?Q?68J+E3S121rypXjWiUlec8YtWltyS8vY79yZde0W4tskkRVPohpwJipRaRKB?=
 =?us-ascii?Q?6FEFQsvtFW3OnI/rwLnWcvBFoMqwAxm/ckoy9BFiY6/2ujwjvX/8MFBazwsb?=
 =?us-ascii?Q?iZrVvuLOBw1xOMtVgRBe/IqY+1bAXZO212DGZuxOnc3wi4Wu2SJ4aKbGmO8M?=
 =?us-ascii?Q?EDxuV0XAOAWx6B79yUTzIvt6A/RK8I3gnk9i5zpVlw3oGf9jVgy7MizE9wLj?=
 =?us-ascii?Q?MN8eQRC+/qgCIqVMBJxPeZ/4mWeJFCTb676vsxVCpUW+E5FiNmpAvG/+v/UU?=
 =?us-ascii?Q?fdFZMvUnWNmmJdLx7mued9lkEiAncRylGP5VYkc36DTd6Qq3HyVpB6KfcsOK?=
 =?us-ascii?Q?SmG/+xQizGzU83RArocSeAkOrEHPYt09tCy6B4KW4L/7xRgAeKciI/M8uBxG?=
 =?us-ascii?Q?Z5lpG+hIt2shVsby9BPX23p4cYIi3tvlQAPEiAm9DeI+Bm5djMcuVx0Gxu6F?=
 =?us-ascii?Q?krdpsV2LzrOIFPdlpwnqfyX5jbEkBpPpepzpYxtDbq8jEAW8J+8lrA9KmmV1?=
 =?us-ascii?Q?6WfM24px+D5rbcmjkJf0XBAF2whMH9Zv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB8067.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Qmbdlx+ILXG8WNKOiKp3lHk6BYHRFYc5FhOvQyJjKUnsREg0eLrQWskZiL/3?=
 =?us-ascii?Q?tCLQrHNbhVv8W/BOPAnJTGImidCU47D4G6+kb7DV2mG/bMP6qhuHlVkrCXCh?=
 =?us-ascii?Q?EQGOYn4s1JqsbWfruNulu33fC00O4FkYH6SIfd9Pg5bdNSFThf78h5O/aHHl?=
 =?us-ascii?Q?WkCYGR6xE35qbr219UH7WsKK/c/9UBKVjCw44tlhLCPdZXI5rhhMaQbkGr2S?=
 =?us-ascii?Q?yy4md9tJiLtSRRSDAL95WViS1cQPco3ipWgV9jwjPUoMlcxRzxO3w/vUzedh?=
 =?us-ascii?Q?xYCdQCEEf2zqUCDZUqsrz93IHCnrtuvo+ARIlwrI2ls+nDl+ISGdOmveIl44?=
 =?us-ascii?Q?FRGbsPqiS9VvcwPkN2dBGNtX6bEiIZsZIPyOelUiHvKl3UVmUBmEhbuA6PrQ?=
 =?us-ascii?Q?DUJt2jSvI0apbts0ro6HeC9LS2yR8OQ/6wG/+gsISh6O7gLm76FZBhA1MlAJ?=
 =?us-ascii?Q?ATcc73GtIq6ap1AST4zKrR1XhvB3zQW6MylOgSk0pkCbDk0JYDB8h2gIEEy0?=
 =?us-ascii?Q?s+2oQ3bPoQkQIgpycUfsu4QoHpRlyyBnsDSZ32gfdKJizrWwF1QjXPQ3300s?=
 =?us-ascii?Q?iT38WHjflLtCVl0eI7oLlDQ/UE8nisGoGKEwE3qPjiGvqwS4vzdAiHgC2McM?=
 =?us-ascii?Q?L39A5dLnnJLPHXP78DyMYJO2X+QJ1Bn4ivFiObGaoNWr2o3FPTeWw4eYbnkh?=
 =?us-ascii?Q?MQZQqehUxfHC2PWIX2UTusEJGOqMXENSfUgqii5bM154gebd66tVJccQyn93?=
 =?us-ascii?Q?xSyYWTeLOQmmQpK0fkFUoSiQrCPXxD0BLSmWF/DaFpRBufWCCdMkotgSACLY?=
 =?us-ascii?Q?ibok1j/26XwKOPtGNdS5zDXxQV+Uf2RMYXjrFswVOIgf25XjrRvt/CSCZ7eJ?=
 =?us-ascii?Q?jd4gnXTKKUHPtRENMQRZN5x+vfHyqJ94SXhHNn9uM4Pb6WbpOsFLwBsIf4e+?=
 =?us-ascii?Q?fPT1LwkP4DeONhdIrDnhkiGfI7LPErO745TdOjnKxRaQjPAsilOm/mwKb7MK?=
 =?us-ascii?Q?5djrfHEHzbgCs2qCHwtSegxdwl+gM5mJ/BAkL7Lv+93yQBxGB+Ca3IVKqX4S?=
 =?us-ascii?Q?tzMqauNSsIv6mKmVRCdgUtCbTqpnmjFH2qK/razCaPEgn+L71BIjPV9ARKW5?=
 =?us-ascii?Q?YkzNwPT9lKaGtWUJZQFd1jHC7eLrGz+Lq+Dy3d9aCXpuFRzubKsKkIgku6CD?=
 =?us-ascii?Q?0A+HQKGdz/HzaqQmgIhyK8CD6rVoAYZTEk+NDjUWaQhdEiGky7vhgGy/40lG?=
 =?us-ascii?Q?wVoh+b4ZrepHHOp8BfWv//IHlerfqwHE39lDlZVjDe8wRm8UJVMaBT3Gl6Mr?=
 =?us-ascii?Q?T9tHDWJ5/ujf3zaZGQq7g+nNbdWGUUEBXagBWhuCfLMD+Of/Yc7v1yW8BecI?=
 =?us-ascii?Q?DDuy49KEeTl0BzwfdDmEbYmAljKipuS6KzgD8z3bfKnuB6g0ZOzAOE90EC7X?=
 =?us-ascii?Q?KI7iUFekf/v3js1v8lkmkSYXwuQcb6y3MbjWRBkO6kh6prVGiYbQkjmWDXsj?=
 =?us-ascii?Q?NT1rnrtS/ENlocvOJ5osKkQO8+2EfZT4XhtiovPX+MLOSi7IxpZBGloMt7ph?=
 =?us-ascii?Q?SSOzDLvndj9Dq8dVCW4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB8067.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2b206a-1b69-427f-0d1b-08dd286984b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 00:33:01.9431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kf7QChR5QCY0ur2R0RaJ06szMvd21SB1PKITH/5dzJYJg3G6hrvr9GGpJX3HJ231bpvtUk7TRPVLAoBZU2GIvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7762
X-Proofpoint-GUID: jmiOY4n15dMzJ1Yl2BGGFEa84pN_dOZS
X-Proofpoint-ORIG-GUID: jmiOY4n15dMzJ1Yl2BGGFEa84pN_dOZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=738 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 adultscore=0
 classifier=spam adjust=-20 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300001

> On Tue, 24 Dec 2024 09:33:16 +0100,
 > Jackie Dong wrote:
 >>
 >> --- a/sound/pci/hda/patch_realtek.c
 >> +++ b/sound/pci/hda/patch_realtek.c
 >> @@ -6934,6 +6934,16 @@ static void alc_fixup_thinkpad_acpi(struct hda_c=
odec *codec,
 >>   	hda_fixup_thinkpad_acpi(codec, fix, action);
 >>   }
 >>
 >> +/* for hda_fixup_ideapad_acpi() */
 >> +#include "ideapad_hotkey_led_helper.c"
 >> +
 >> +static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
 >> +				   const struct hda_fixup *fix, int action)
 >> +{
 >> +	alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
 >> +	hda_fixup_ideapad_acpi(codec, fix, action);
 >> +}
 >
 > So this unconditionally call alc_fixup_no_shutup(), and this  > introduc=
es another behavior to the existing entry -- i.e. there is a  > chance of b=
reakage.
 >
 > If we want to be very conservative, this call should be limited to  > Id=
eapad.
 > For alc_fixup_no_shutup(codec, fix, action),
 I want to keep same behavior with alc_fixup_thinkpad_apci() and alc_fixup_=
idea_acpi() for one sound card. So, I add alc_fixup_no_shutup() in alc_fixu=
p_ideapad_acpi().
----------Related source code of patch_reatek.c are FYR as below.
static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
                                     const struct hda_fixup *fix, int
action)
{
         alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
         hda_fixup_thinkpad_acpi(codec, fix, action); }

/* for hda_fixup_ideapad_acpi() */
#include "ideapad_hotkey_led_helper.c"

static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
                                    const struct hda_fixup *fix, int action=
) {
         alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
         hda_fixup_ideapad_acpi(codec, fix, action);
}
Thanks,=20
Jackie
> thanks,=20
> =20
> Takashi =20
>

