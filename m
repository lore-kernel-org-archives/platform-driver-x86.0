Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010022.outbound.protection.outlook.com [52.103.7.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8534E3245;
	Tue, 29 Sep 2026 16:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790701135; cv=fail; b=TYfx14b5Qmgwn7xOX5jS73iPUhSXoONd6Px53u9P9tT9Kh+SoHVydTBu/gmZb2v8dSTjmp6W5wJWzPDLHghjmzcrDNxC7QdDICkIVtVMVqUkqniqfjSp027tSU7Ur0o91oU0oDcMHLDVFuSUikTbh7PNsGHSOkT7LRl5ezvCDhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790701135; c=relaxed/simple;
	bh=idpxnuu0zqgxe6lW40rKM8LJIUV+VXSJAlGfy4sAFoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AnSdrgdZOtgUd3FoqyzfDx7IpZiWUK9LMnrDNmhDFKbibj8X3Don2hhXsWGtEkvdyeqlzdEt0I0TdUj9ALBl8otgcIrZo+muUGsH0iKiCphpMaKs/75zjh9XqnQao5JiVG/WtMcnWZS/OyxrOH9jhudgu/X/QJLIfkp/FzYqlQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=Ri2OmGQo; arc=fail smtp.client-ip=52.103.7.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="Ri2OmGQo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFhEG//G6Eg/LmQNBCJIvHVRXKrbM6DxfeyRg5lYPrFu8G9Yv6s3APc+qZlmt+EfHTQGO3V+xDBE/KLkjwP4F2bSI0yTkDvQijG6rwD8LbQFxC4yY0AkHKHTHA1QNV+zDshevrvmghmrTOWIkzK/bGrF3SLm1D4H2kVBHqtiSeW6qIUcxfm9aQyZsz1tOqJYERHfjHySfSARt60CaymDgKPvRSxbN7PVLxubwi6+wR83hLoXTk7dEwErw58EaN1kC+KyfqG2qS0TpHgzszRm+MtonQYEjA0UXeOr+zQURNqRf4SaIr1T1BchtG0Aq29uc+4AEzII2P/TQMeBTeEMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idpxnuu0zqgxe6lW40rKM8LJIUV+VXSJAlGfy4sAFoQ=;
 b=TwZvr4uybmgP0KkxKcaufSXfCTT9xU4MF00gJ1E2Y0dyDJBhjHYWtg05tQffCY4GSPu0L0Mi6hsGAEWbOvEuno0ashdDUtiA7IbPtX1fXVLq3Pu1lDCZ/H27JOUktFSTEmjf0AmDKTynxdAtrsWzgzlpc8hRb0H8IQ3QtRwqDPe8Hu/UQA4fIy3zpA+qUbcQMJjPXtmtZogEljVXJE30YSqNNL3/+a1E+cWYkek/pQ1/n0lmtZA6vC8xVjneo9gRDnxWQ4GcF1ZUI7E+VqA1y1gVPBHzA55Egq/NweHf3LzPR/whKlalWoOlBwlCotlpaOkwSIGbY+yFqQzWtv2M7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idpxnuu0zqgxe6lW40rKM8LJIUV+VXSJAlGfy4sAFoQ=;
 b=Ri2OmGQoG0eLZj4hynurNfrn9HDfknJKfjU9aF5M3NyO2RrDK8DDdb29qI02lSPQMM8Sm7eA3s/o1Twf+x/JvjUbcG5f4OJG5nOOv4ii+7QAg8Uj7ZhaN6tyql8W4SyAnqVz6qo9N4EI8Y98cDA1JFaJhXeBhSvHPodBCwFe5L15Fs6IoaXMc8h8YA+G8wGnOfm3SLUxT2p/PXcsjN6YTKfDDvzjss7lJ3+ReaaH0zIle/H6KOPLWRJGwsbF2bgDwnN5j+Ut6vNF3Q8IymIHGoqDjZqKqms6sMEDfPvPCODRaQTgvP37pSmPpKkt6d1PjQTyw5E11VxccJzBEjUmkw==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by DM4PR19MB5932.namprd19.prod.outlook.com (2603:10b6:8:6b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.24; Tue, 29 Sep 2026 16:58:51 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 16:58:51 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: zekaixie37@gmail.com
Cc: derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ikepanhc@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add PrintScreen key on ThinkBook 14 G8+ IPH
Date: Tue, 29 Sep 2026 18:58:40 +0200
Message-ID:
 <SN6PR19MB23031D5BA941FFCF348AE620FC8C2@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929154023.89492-1-zekaixie37@gmail.com>
References: <20260929154023.89492-1-zekaixie37@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1PEPF000008D5.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::430) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260929165840.35318-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|DM4PR19MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: ce4b61c5-090f-4c31-827b-08df1e4aef09
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|19110799012|260925184616899003|51005399006|8060799015|23021999003|24021099003|55001999006|15080799012|25010399006|4140399003|440099028|3412199025|2607281247196008|40105399003|30101999006;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4E1trTHyJTSuMrWjU6TuGekJ10RDf3nC1zfHtPD6YGbKRRFfFfjMz2rUeiPG?=
 =?us-ascii?Q?iYKRuC6JPrEwDwjDwOlVwGGNwxy1EUt5hyGSLuw7/4Y7lEhTJ8QFOTGsyl0M?=
 =?us-ascii?Q?D30C9Pn0+E1bigE0JS8NfYBbeGs5qkLHvnPLlrx3Gjmsxhm17T/Q9ZexxNAf?=
 =?us-ascii?Q?LOiUnXgDtk0oVLx4GHyBukToRe9+8E2sSw2mdzaDFj7PKl4b7aysDISA6jYH?=
 =?us-ascii?Q?b7YhYtqCrugRixzTBR7ZqQpV1oymhczhtBiN19z9QY05Ho2n5vkfVLb9dHeJ?=
 =?us-ascii?Q?TqgMAnABXy1hTBTy4gGtbXVUMryI39T4QLBzXqpbiKwvZsNafqBtlYZul9MC?=
 =?us-ascii?Q?wSnyM5UxBMaNmLkilIjcHGPjHHauni6Cj2bIkaE/8wqAV1Ah/Gw8eax/qzNs?=
 =?us-ascii?Q?hw6I5MZw/Ebii4RQ0FjLF0Lg+n/sh/CCEvCyqYfMXVVTWuwRcyGBAsHYb3Mw?=
 =?us-ascii?Q?CJfPsFMLXjKoMAVl5z48MChkTwF/1g0+9f2MZVb8Q8aERSF6XYxIBudraD8d?=
 =?us-ascii?Q?6S6/twmA5g7tKnC+zULPPtY9WR3CGmtWRi91Jy+Ikz+CNayo3Ga3nsciolAm?=
 =?us-ascii?Q?0eZZ9qowuRtI0rNs17HErFeTBMEFzbxwiea84RcpeDgO1iVEWu48fJxAhKyE?=
 =?us-ascii?Q?Xp+b82Ab/sRxuvtl23Qt7aDDKJiu2JaEQYPVg0dBttTRMtZj93RojnI70DKZ?=
 =?us-ascii?Q?8vcHdEk95fmmZjaplpONN80GQJ9LRFMPzTcjKviM8IHKyjZYAbFY4m5es9vh?=
 =?us-ascii?Q?iOpUDjaAfH/4GRRYRLB4oQRomv30JTkqlfd2veLUCfWvNAiSL82iPP075TKa?=
 =?us-ascii?Q?b15yh3I1AeAi6M/49QmC2Do67Y2lc9iTZ6jmSQuP5eg9QM0wQyBhUSsoKfcr?=
 =?us-ascii?Q?mKSBq8EdKBJwg/nFwclzKxz9cf4dx3nVMWFvlu14MxL4VGHTj2ddSRzmeTGf?=
 =?us-ascii?Q?YrQgamNdGn1EdEzeRdIYwfG2Uf8rqgXk51RHX9pA+sXHsdnR6+m3zBxxvYyb?=
 =?us-ascii?Q?kXb8?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?INb/YN9DtyWz92wXNKRk99xIxGIEJok+AOIhTFKAf1e9JfiYlp0tp9IjbDd/?=
 =?us-ascii?Q?ApjJZj8w0kbvpxHw2AH+dVXjH6gOuZjnfYTs/41X6nUOV7/bMz+4w4Xm0782?=
 =?us-ascii?Q?OEn5/5G0EihTJizt+hawvScvzjy3WchSswJ4kqL9p7e786Pem753JaIlU8hO?=
 =?us-ascii?Q?BzSLL9NNMt3yb7k5fI+7bdwRQZK2ruRg2ivP6uxnofpEflmKMfuPjpH4f+pl?=
 =?us-ascii?Q?9JjmGBbQq6narkGTLm61H/Pbn1IqG5tTIK5uJ+CzNn9EoQorHDz8dJs6twRj?=
 =?us-ascii?Q?FLL2wTkAIxnmQDg9S61k1FopsB5TWDoy87P9OGYPheJlFmqpjxLq8JNX0zn+?=
 =?us-ascii?Q?+vLypI7qJCbPZxpjm3sb2M7ubfvTc+m0OeWDpFhdt5hLNLddAjANa0q5fGfI?=
 =?us-ascii?Q?2GGK1kgOgtmKBY3kskaAmL3OCAQUS6kYdKmAn0sAXt3t9VdNINGyEA2G4f2w?=
 =?us-ascii?Q?xCFrNKbbU23xJbo1e5rKXbOGA7Q08nlFpSr2qPoDFDW7qRrvvL9vgYbjrvRw?=
 =?us-ascii?Q?VUdesIPUbJUnh4E0D3R2EuP5jO1bTMiZ6FXkFeA9v1SjvGelCnOYcCHPmYQT?=
 =?us-ascii?Q?xKOtuy0ojuT02FMAN9trqQ/WxXmH+8zpkDrqLvnpbEwA71IoJBq1tE7W1unU?=
 =?us-ascii?Q?7Fbs9gUP/1Jckw8L4/D0nQA6DmKUpg1avrjO/iJEGXsBkclVH7lE10nUhruG?=
 =?us-ascii?Q?G2fHLAZDWY0j+Sj/OEJ5adzCrBi0F7Z229YtwYt3uz5egx+oIh+WpKHZdUKy?=
 =?us-ascii?Q?foQ5eQ2Bd3x9jRHcxF7Kwozw+k/Oa0uNiTEWKTg8zuPEZFEYNVECHbDpAHfP?=
 =?us-ascii?Q?NEI7GwuNbwUiwRqlRRQbpcwsDhXB4a7Ol/1uJTwzWw+ShZDUaOERhzmAeyid?=
 =?us-ascii?Q?djkMVLuLISFFTXYv+eMHFcHC5uDUWGFI5mr6+ExHS83Y/oyM2NlZVKH5CRrh?=
 =?us-ascii?Q?bHQ/U4ZVgrB2lIwFuEMx4fwkVDpYYF5XxLG4iRqfFBGx81P3OxecTNhBNn0S?=
 =?us-ascii?Q?7UOklzXQ0kGeWeUpoU5n2aqrp3dhKWkbUhqZ0tRmhhiOxtvIgi2hW5XBZFvB?=
 =?us-ascii?Q?HKizsdKxY+JPAZI0LkHtDTvRFQHTo6dUNqfx3pNE9m7LsPazI8dPIBX6+S+A?=
 =?us-ascii?Q?7H8FLjujzSbwIhkBgPtnHkZ+IeWYRnt/YMUXSr1SVR17WLUe7hH0lQx2DKXO?=
 =?us-ascii?Q?9hR/YwCcFDJcfCkUkKwpbx7oEth2m0haoiWkpGg9xHsskFs9ZlihYtJOz3gT?=
 =?us-ascii?Q?bf9Yrs4M7Otb8oWj/LJ+BqcReimvEEBJhsz4tjMiw1t/dJaDleuNs7XLl/CP?=
 =?us-ascii?Q?PS8fQjbhxUOJER6NdPxLwJU+TKUbweZnFKbGMnRAKy8V4IUKfi63xg7TF3Ui?=
 =?us-ascii?Q?OpdygQrzxlV/w7YjmBAoT1EDW+zE?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4b61c5-090f-4c31-827b-08df1e4aef09
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:58:51.0079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5932

Hi Zekai,

Note that scancode 0x148 is already mapped in mainline: see commit
bc39af8c2c43 ("platform/x86: ideapad-laptop: Map Smart Connect hotkey to
KEY_LINK_PHONE"). Your patch seems to be based on an older tree.

That commit came from my two 2025 machines, a Yoga Pro 7 14ASP10 and a
Legion Pro 7 16AFR10H. On both, the F11 key shows a symbol with a laptop,
a tablet and a smartphone, and the user manual says it starts the Lenovo
Smart Connect app, so the event is mapped to KEY_LINK_PHONE.

I had a look at the ThinkBook 14 G8 user guide (I could not find the G8+
IPH variant specifically, though), and there F10 is the screenshot
selection tool, while F11 carries the same laptop/tablet/smartphone symbol
as on my machines.
Since your commit message describes the key as Fn+F11, I suspect
the event you recorded actually comes from the Smart Connect key rather
than from the screenshot selection tool key, in which case KEY_LINK_PHONE
is already what mainline reports for it.

In any case, if you do end up mapping a PrintScreen key in this driver,
note that KEY_SYSRQ is the magic SysRq key rather than a screenshot key;
KEY_PRINT, or KEY_SELECTIVE_SCREENSHOT as used for 0x04 and 0x2d if the
key opens a snipping tool, would seem more appropriate.

Best regards,
Marco
