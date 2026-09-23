Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19012010.outbound.protection.outlook.com [52.103.23.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6573052E07A;
	Wed, 23 Sep 2026 13:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169117; cv=fail; b=AC66dxS1nZdi48sImCvNCQy40GFxN67yT0FayvPRFpG1pM5YSbKUunrTTQP9N5EOFD/WABF5v30KSBxA11p5RNJpoZRSkuxrJwiSzijRNKXFx2YdD0SPj3QyRyhVbKWsrEX+OP2m0KX1CK8lF5x+uMQkB/EHMZDqFIvXWbjpLwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169117; c=relaxed/simple;
	bh=oIVQsfU8kEaozWdfV8LSMDiEh7uhpLDDp8u1thXueF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VvK7qXsTi4UvrX4VNSVvTwfbHlJZIy/6PFy95bSqkVSTA1fjrkALnZIHyHYRzL5V+YxHQPSvkkxdbY/lQ5zLQGOC5Sh20MPaNBZQMA50bCiXng0cy5mg/qud/ffLnD/Zzxbszw5Qm0U+LY0Mx+kaqIfuFs1/wJtEFE5A2I1yHeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=NQ2gapKr; arc=fail smtp.client-ip=52.103.23.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="NQ2gapKr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+JzE69aHVm9i8SXvQmoSzxrggAp3F/6eaSoaPgnK3Fo5UpNcRnLpJVenpM7ifPlTeQEMNU29xccNbUuE1ztiXOlxOJZXyhA0yMboId4g95np8o8Bng8ezw7EWf9SY4wc3pRA+6hvmb+iUMMBEvJeBrZDuLDt49s6iV53d4bcZpdAAwwsnuqFIR886UVU6BRrXOY9E8zEYNxC2eVuGu5Dd/HoaQUopx1u1za/KYxFbc1XyDdJ7IgHUZlWpDvNNR0Rk4NonvGg+97EYom17ckljDrnUuo7AJbgy+51cg23SWoQfZm33SBSPcv6NNlAa6BvHm5m2bvpS1QT/9vHjLTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZd6fZdNdb5ukGaZl7HeAynNgx5bmGy7kVes5DAc8No=;
 b=yDNc7iG7p371cDR1rL2G/bmi/G5rMa7QJytsYChgxouMCArBaO6+H2OfPihe+ZMmB8SC0DTcojm3Vn2qXdpzagg/BM7HyMd8/MGsjLsiTHib9S5uu+V5NNQwPGeA5tUnQ9mp46SAQTgR9tZ2PfoY7ahrexleqyM0HvO37ucUjw5R9ax+jhDztzrsDCW+Cqp6wpodUVfmtxHR0ayH87Chb19A53Xkaij5FWAtnvZns1tBXwVJfr9OIoZZbbw9U2uimoWB8Ki34ZmKIQP5DPenLjHweogPX0tayO3dzRJx6ZU32ks8yf++MvxAtby620HxISoSuiiK0UhPFrZP7FcSbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZd6fZdNdb5ukGaZl7HeAynNgx5bmGy7kVes5DAc8No=;
 b=NQ2gapKrNJZxDeGBkbp+RcNh2B4U1PdkO7XFyzn6RLvwGZ+eGDCiX5RkK02SQaFvNcLA3CT9H71rM1WYIwPwOeCSVU82UVdrV0MB3jT7Z+vjV87KEvB4TiIK6Xbh5067UTecCA02F1zuP51ZXHOIzzWFsMqQLX3gEVWKSvxNYn6bDhYB0+/1fG6GL1SxX8+DzUP7dzWqJLJpWR8WRV/wSNh0EpPXHZcljSpLNOynZcbwOiEG1vmnvWlqUJOMf3OtYKaZr1t1OkVCpDzz0foCBBz8Fz5NpfrY55EXJSCyJeFBEizfFLkRXEVRtCjY1QlZb063T1mHkVYGzAMIGxVY0Q==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by CH6PR19MB677206.namprd19.prod.outlook.com (2603:10b6:610:30a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 13:11:50 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 13:11:50 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: i@rong.moe
Cc: derekjohn.clark@gmail.com,
	hansg@kernel.org,
	huangwei@kylinos.cn,
	ikepanhc@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	marco_giunta@outlook.it,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Wed, 23 Sep 2026 15:11:39 +0200
Message-ID:
 <SN6PR19MB2303D1D68AF234EBC6C95113FC822@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <356cc2817ce72c4f2d7b4f623ae73b979d314ac8.camel@rong.moe>
References: <356cc2817ce72c4f2d7b4f623ae73b979d314ac8.camel@rong.moe>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0200.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::11) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260923131139.45247-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|CH6PR19MB677206:EE_
X-MS-Office365-Filtering-Correlation-Id: b67d7b9d-adbf-407b-4d86-08df19743a2d
X-MS-Exchange-SLBlob-MailProps:
	znQPCv1HvwUXBahuwteIkQeW30lJPuxOwO3pf6IWOGyOI28cUKxQy3cLVGoSnEseeVzbQb1/Lm1EN8dWo9H32DOSMoUdnmODAlUTUyQAHn1tj5gAvRzmgqC9FK99CeGzH6FUd7YO/QOTQCbW5ggeEU3AnfbZW8sjM2ShHWW+5NchPMAqXqp2JYdmHHRNcN6KT6GN3Qyg2OFo0pQBL6HHEg40M4tHDaB++CHDg1Y7d58kwCkeIcSCMFhL/Enx9bbACzV0R9qg6aA6yHLt9B5vcG+W/0ccfVbY/eCNEUz9VgWkDbqwYkFHBX6ZInscRy3HphtCRQON+TcTLFtZ2PKUIghMoZZrl9SznhLRyCSj75cownyrQCjC+7ise2OUcUnIFbdse2vsL6V/whn0DDCf8x4F0vYDw6vBPCk6+0OLkuKzcYn+cfev8YlIXVVWPrbroVOXIe8fD4bapy0jQC+RSVUHIpx+YU2wVm74g8X+1bk+CEnJ0MiZtA/honBr7zJNSZ2q3fVryesG4wnoxjJ0vQrsfE08r6zrHqT6sQK3eWoY6W8wY8yEEgbvXgCpAsraLamla1MNPDeWY1boY1e+Gp9LhoBbDpQazlGrQy+jJYAEpO+hqPRuTluPickcjlWWi8oJ9JFVgpcWGUY7pL9UqV86ASDa0Cc9VQCoRgO6I7BsFZwoIotiQLIAUqZyVHWoRt99WM1czCwUlMhfaSvp7qgwIyztp5/TMph5N6NpVsTLfFDJeCX2xeFEJk1SBEXCN8ZavKv5aTI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|51005399006|25010399006|19110799012|12121999013|8060799015|55001999006|24021099003|15080799012|5072599009|40105399003|12091999003|10035399007|2607281247196008|56899033|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ui36LqqjG5pBzcB4G0Us9CHhZolm+osvQ+eJXXBMK0b8UXmKUQwBV1zB8w0/?=
 =?us-ascii?Q?nJpJHxpy6LCKrNge70wzOhLgCtwuKaHSSgQSUpeUlCICNZW8Cym+rnQU9DJT?=
 =?us-ascii?Q?gF3vLxZ+C6iUS7ZRCobUthYoFSL7Rm4mSNZHCmClOBHu62jjPWNZsAa4pBpR?=
 =?us-ascii?Q?ELPCcR9D9YU+NOxQXm82GK9uULTYA2R1xgszSKGlH4wg2CJ7tB1M76f/xRBN?=
 =?us-ascii?Q?Rt9o4/XrW0xfjwgyv2WPOvmtv4nRxzEVgEzOy95yeEtkdlT+3lARn2JbE+Q2?=
 =?us-ascii?Q?Gq2FwXwqcyHxisHfcImASWycqktoSD6gazSfAGDzIrKvbnhyqv5hj10PEnyk?=
 =?us-ascii?Q?kUOtAPoS/NQrt1yPoHEcoRCr/JbbA5hgaU60JnkjxeabaasXfhEQZcQLY8aV?=
 =?us-ascii?Q?FSluoB6k3SB+BmOqidC2s4LWtFwjBUR2i8zH+naZqcl1EJe77uVXs68JdSD1?=
 =?us-ascii?Q?mqE45fmsLo58jn2Puh0b0qn6rtLBJetmI2T+ZQbLsoz38tC2iZ53Jo8pkkSL?=
 =?us-ascii?Q?ZytJZc5dhowf2FFQyu1+wFJL0fNZuU3jN4N2noGYU4Hk9QQcyJSk8agZNXUt?=
 =?us-ascii?Q?o7HBoXiR/M2nYfb9Eb7u9x7Ktp62hGk2BwDatbWfVWPKsqIAVrk7kC7Oy79S?=
 =?us-ascii?Q?dOCh8k8Il198db37WYf5doQ+gAJGY31VvH6PgFPtIbCZApGg9D8Pg7KFL3Pz?=
 =?us-ascii?Q?HNAfopI6H/3E0EJgzPYkAD9Znmm00STEJENmo1mqq4uBIKDKGEXfxRVkrbIS?=
 =?us-ascii?Q?Mr3gP6Zx/W5PCP//5XOS+Ugn71M0X1grkf/Oh6VFzNEkeR388Xm6WZzmnKKK?=
 =?us-ascii?Q?V+xrZ526ANLn/u3HzOoMB9OCvAccVnG2nlHsm5i0maoFl+wLTGfZxVP5tz21?=
 =?us-ascii?Q?3o9Nvz2oce7Wsf/uC1HFO7ow3Ojc2yQVWeNGZXmafRItFGK44Sc+B4349Kod?=
 =?us-ascii?Q?vik55C9KQvMIgbxOgBLP6SeqB5PBN1xzWc76xll1ftby5XGp90Xf+GACDgoc?=
 =?us-ascii?Q?P0Vl8gjCTOlsFiHTdu/i25T3W5AEKAXUfJlP86DisHb2uBc=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gqBHxD5i/vP/yk4dyvjNce/3pS8aB7kOALCRKhwTkm00wEi7Woc+Hrpz7Xu8?=
 =?us-ascii?Q?LhOl7B8A3cCOr5mLPyiQC8TE8dpWYnwYD3pXspxBTGzA1kYkoZ89PR8gbuoc?=
 =?us-ascii?Q?IeaId5skTETUUfgJ+TDzCpL9pbstCmvCtK0TQUm5PzdesNFrf6HFGXn8EDtf?=
 =?us-ascii?Q?HWpS2MrzXlkTUeP7Mgf7ezpgzB4meevNMRu1u1i5oljcWYLF0G2G19ybwJUr?=
 =?us-ascii?Q?xx96Q35QR2SFC0XiFvAlrMwwNBb+8NMT0sOMW4LM6Os7DaD9JuXO+V1OnYfx?=
 =?us-ascii?Q?pa+Nj3TirWhhZrRyMsleT/2hQCIM0/956ZXeOosQl2nlyuE+u3pGgwvCg7wA?=
 =?us-ascii?Q?VU7m4HKtwxx6N+8DtoF8GFEgpHfASVGsGtGkDzXEvliFqqkSpj/rGZJX6bKU?=
 =?us-ascii?Q?ewWnVistkSK/pUF4+fhokbkVWWwTwpsPkTjBg14m5mjjYaz4DiKpKp5dZjAb?=
 =?us-ascii?Q?bMuAl+LvXsf/Pg6SyJltojR3TGr5QXuFYRsQpCdqtTL48RGvB9nmqhADSX24?=
 =?us-ascii?Q?TSVgr0WXf2KqDoOPEQkXIfeY9Psw0y6P5Ct64EF/MbeSxBdyP/Kb7molKN9w?=
 =?us-ascii?Q?eq4mm8mLbXoqiUqJUHIBvBLOwAGReEs5TExFL9q0KIClAmKeM1ZLBc/+wExw?=
 =?us-ascii?Q?XH9m4LSPYjfjWuFAER5YUYVmUKShzdFh6uEx73RrFNDVTgScMMM8LWueMsEo?=
 =?us-ascii?Q?L9D97mNpYJuOmlyU4JzAKH8WCcBT5H9R1LOtzHWjQB4jEhc39htbh+/rfvFN?=
 =?us-ascii?Q?Q4ZC8aOomJpf3mo5bTaczwBQ9Vn4MKZMK4opHyV1PYxyvzTdhLJjTy/2k0mI?=
 =?us-ascii?Q?EdNg2rM/qHJ51dQm++kJeJ1gOHmTr14nbqqNh0BU8RPIr6U1D0riZ0VraouM?=
 =?us-ascii?Q?A75AZDIynXPNrxCcK8LtCmDURrDxqFBoHNvZW9lku9KbxJqmUD4kp8OavVg7?=
 =?us-ascii?Q?p95m4aNqkNus6/vFhNsl1fP//IjfQTE6rC37M4VWNOK+IvvNPGcAkpSPm23y?=
 =?us-ascii?Q?7eGiovrgP3bC992+NhOxdQGeIW9VRySvt8crQh2cGaA4p2GotxIHPT5LvQVy?=
 =?us-ascii?Q?4LxbKVpsrzIY1aWbyI3R4EMqmpYQUjyOEjxt4ILsF61YyLIwaqeVJ5BtYWSO?=
 =?us-ascii?Q?Yips9IpnFdyw7F/5PlIid7hLC23h3dv+PbiIi9cTNJ3BDJZvxmI9AIa9jWoj?=
 =?us-ascii?Q?180IsKwWU01FeBUzxiHIRbpkxjni/L/T3b6oD9Hb61+qnJz7Jd+vXmkB3ou7?=
 =?us-ascii?Q?qp0Vy42c7myKIh3af+ztFFRq8pFEJAQsnhG4ZJFvGbIfKC2sMLA1kk9vAfRA?=
 =?us-ascii?Q?ha7RP9AvuOMfs+UXtJZ0IBVhwsGag71iaLYU8kzc+Pm+caVsqGr4wZrXR4Xh?=
 =?us-ascii?Q?NY5S5kMRWCnuzBOerqNxSX5I971f?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b67d7b9d-adbf-407b-4d86-08df19743a2d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 13:11:50.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH6PR19MB677206

Hi Rong,

> >
> > 1. overall I changed my mind regarding the conditional switch registration.
> > I no longer really see it as particularly problematic in practice; as Rong
> > said earlier, in practice it's mostly a theoretical concern given the
> > typical userspace usage of this switch.
> >
> > I do agree that if we can find a smart way to filter for switch presence
> > based on a good criterion, like a suitable wmi method, it would
> > definitively be an improvement to patch v3. And I also appreciate that
> > gaining a better understanding of these issues may improve other lenovo
> > drivers. Finally, in general, I am certainly not trying to stifle the
> > useful discussion going on here; what I'm trying to say is: as far as the
> > camera switch patch is concerned, I am perfectly fine with the simple
> > approach of v3 (at least for now, we can add more complexity later IMO).
> 
> Agreed. More comments below.

Nice. Mark, any thoughts on this?

> 
> >
> > 2. here https://github.com/marco-giunta/lenovo-acpi-dump you can find
> > all raw & decompiled ACPI tables and bmof files from both my yoga and my
> > legion. Feel free to ask for more data.
> 
> Good job. They are exactly what I want to cross-check with. They'll also
> be useful when I develop future patches for lenovo-wmi-*.

Thanks, I'm happy to contribute this data (I assume no one has assembled
a general database of this stuff)

> Then we can't query the switch's state via WMI on the Yoga.
> Then we can't query the switch's state via WMI on the Legion.

yeah, that leaves only the v1/v2 approach as feasible for a conditional
registration AFAICT. If a maintainer prefers that, it's easy to revert
to the older patch, but my guess is that the simplified v3 is overall
preferable.

> > 5. I have basically no experience parsing WMI data and very little with
> > ACPI tables in general. Please feel free to correct me! And in general
> > take the above with a pinch of salt.
> > I hope the linked files will prove more useful than me in this regard.
> 
> Your interpretation is well done and impressive!

Thanks, I spent the last few days studying acpi and wmi documentation/code
to be able to parse these files.

> 
> In conclusion, I agreed that we should take the simple approach, i.e.,
> exposing KEY_SW unconditionally. If we see a report for a 0x00200000-
> capable device, we can add support for it then. For the time being, let's
> focus on what we have first.
> 
> >
> >
> > Thanks again for your work on this, I am learning a lot from this thread.
> 
> Thanks a lot for your help, too.

Happy to help.
I'll make sure to CC you for future pd/x86 patches targeting the Legion.

> 
> I will submit my patch with your C-d-b, S-o-b, and T-b.
> 

Looking forward to that. And don't forget to cc Huang, so they can offer
their reviewed-by for v3 as well.

Best regards,
Marco
