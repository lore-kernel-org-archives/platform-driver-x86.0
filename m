Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azolkn19010021.outbound.protection.outlook.com [52.103.12.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AB6501F3E;
	Mon, 21 Sep 2026 19:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017270; cv=fail; b=QJgn6dkdadQ8xI94A84QalZ0konRmZVUXi6r1DBr0fcfaKDQCVEqmUE4+S/h/t/LqUxUdENdatoRiksKXhsA9Nj5fLFT74Y8Nqex1NaUV3R8QCdovccw4CgGrWjQyKqN/vE8C5rxIbwNOl3g/HAhDB4ueNvPXLx/VoqDtUzH6x4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017270; c=relaxed/simple;
	bh=l8S1TRtPetX4XVps5ygD1fs3dIVht2CPEtXBbpDWQdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uV2zYb90iG1dtcWGA9A28gugEAsu/EpJnk5DlL7ABsgDWW8s7hYkV7+HY/uAOAiqs40zKCU7atNpjl5jWWH8Rt8IgHbLRxEDbioxjK1aJYdCZ9knodg8nJ+t5w85+1rXowyX+9D/gvIbdJVZxW6YKuaAGNHCuF6ARNqOnU6dhFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=Wg9XcVbv; arc=fail smtp.client-ip=52.103.12.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="Wg9XcVbv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keYiLE42WHlAC+lwovcu4yAQ7W+4C20JU5cJ7UUjDLQlgWz1kby1By16osIfS8na8uX0RUCboiBDak0G4Eo/ZNCw3JXtK6EqS8bTKYFdaZFTGHvJQbxRcsROsaWmZvUHd3VGxjffJMbcGzjG/Dtq2DWLHKAxpH+r0C+5bL7/OBJ7c5gPWO/MoougxebpHFm4vGLg8tJWfq4CWjrvXYEkZMzFucXcwwj+J11ZVx+FdaNS+HUzlZKHj/OshEFex6S8w0m4GDPd2OIIXfGkvvtIW5ELQ7NMLbwY7Q2hzrBEYLmOC8JY/ZrzSmCejNrg9xRWaPMRTl+KHbTH+KSQfxI/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19J1XNuXJjtMPRudC8YW1ZiXaTBC0NQZRLu/pTrLjoA=;
 b=iSWv8efO+deMJY0PJ+5BrDtnBfH2m10RmB1Qk4q1652odhmlBpjViaJgeLAwJU9AobyUkQX8sdgRKtmvMsrIlMFvdlL2jkQpz1kkk3cYIiYfTNBj6Pu0DPOm4F1Vu5Fi2qt7odsppUun3tnjLqr4U1lpwyAx7sYoIndrqyJNbbSuQHFmkoq6CGg/HCys4kVSGEH00p7AwXNqXxBwm/9IEqVf9pLi0/p5N2XvisVBb1TBNYrPGvEZUZ22gVvsdWaipoc0YsQXB5aPhnWlxdRndHWLdbTA6IM7i8yJLb1a5S+GjXLJfbNik83vvBvSHrV+YnM0dS9BHgDvpXkyEXU0uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19J1XNuXJjtMPRudC8YW1ZiXaTBC0NQZRLu/pTrLjoA=;
 b=Wg9XcVbvzJQSQvbXW3JV7ckbBv8FQkjIguHQZdu9qRRJlV8t1QTF+kzBUe1wj14W0F+1/z2eKIt4xmXH44BzQVf02/qaNBbN1qoPe+0PvrHkz6Tp5CrHaJmXdr2XagJmftjQbMqV+lthy7DwKAiRI2qfegK3ZuLJz2aGM5DIMpiieWKjiZ1H4COz85mhjeY9A96FbNSkWYkrYJW+d1j+/5KtjTggeNUL6XOYD2pF6NxUx+xNSRnujNOsd5JfG86QiVh60e3ffbzLAoP1H/2y6I7olGZFRUI7ZoS1sT9V87S+4NXBiHTTFk05V0Cm5rhbtDGKmm6nzWFMnE/yKjCYfA==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by PH7PR19MB7463.namprd19.prod.outlook.com (2603:10b6:510:27a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 19:00:39 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 19:00:39 +0000
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
Date: Mon, 21 Sep 2026 21:00:26 +0200
Message-ID:
 <SN6PR19MB2303278926469783FA99824CFC842@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe>
References: <d867a4f6b798809776164542972e68d724f29fd5.camel@rong.moe>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0001.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::16) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260921190026.16544-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|PH7PR19MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f44f1c2-b2e1-4e99-6d9b-08df1812a004
X-MS-Exchange-SLBlob-MailProps:
	Z68gl6A5j2981iOqa3TIFE7v3cGH1r/4NC5G3cnY7FPTNVKCgUloA9ipHQbJQskJKJNyPqOkLug+8Rdc/3en5Hd9Zo+gHaG/McY+d1fD9MaMEKj2Zb5G5A3UTsKlt928O3s90bbuVYFNlhK0SHYS6TnbRgqRFLREjWURyOSHHuPCqdtQhBvYlTaT5NNT215KVoxxzkWv5AwFuBS6QjQ9UBwF7KdP/6fys+V15KzciiP/rylukYxYttFFR6tgj0ltiOTXMuDWZ8hUsb6nM8y9r0/AzLMRnOLlmOYgb78f5Ly5Vpa0nWJ72QjqIAp7ViFIRAPQ23vrHEebvveqtvsRsKVItIzplx17FMaqZT1yN5sO4LsxSRCZKFesgO+i9ozMXgnR8F8XqPsUwsf2yp2lFiq5cfHX7MJeMsTrEww05C8qloYhX0cR62ieUcvw/lMNefTligl5Ca0NbpIv3U7K14uo5hhvsQQnyiyN/CXACLRj5GmgDnCX48gANtbOhGlfsolWWx4mYR2+OehOsYvtpy1TDJAbyLvShF/9w5xdTZWI2unMcy6VuG8yxJ955NJ3Jeo4hIWtD3PXqXbu1HUPOWinrrfm2jqP0YyCN0XFIDVYZJxkvGDuZQd/FJ00af1jXkx7nNATZoDEyWy6Le3/+PXg5Fqwddws5XrB4qdbL88KfzosDD4zbTo/Q9jxYHjJOGhoTQgKjkhFbfrm0NPAjtRLmBwCrjXLTDofLU8xoGMjxokW3h3SvhaC3z1Kn6mQgOgvrtv62GW28NSaLp/1SamLXk2PiZVAnEVXUw3azATbD3P+p6+IxOcAacAQJGZE
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|24021099003|51005399006|55001999006|25010399006|41001999006|15080799012|5072599009|23021999003|40105399003|12091999003|10035399007|2607281247196008|56899033|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Xc/wQQOGmJSbQewMQh8OaXG2R+ThXaSHW1i/vLEnSqKL8G0SQRcJcwhPLmD?=
 =?us-ascii?Q?DfhyiJiPRdKMuKaPUorLc/8yYOdVqNRQpisWpCLivzAsq3dKOav3P2s7/3lj?=
 =?us-ascii?Q?pGIPeer39MNTV6/Egns9iM/FyMa98+TZXuEDXbk2B3Zv/l3QQ/pUF/oeno1N?=
 =?us-ascii?Q?YfmD4QjsGFsN5yQfB0hokAF5juxf4ey+Ac7EBZ/6sQjgJTsZsb+sr322bcw5?=
 =?us-ascii?Q?CrEqlmRNnAFgPONPXKDpXl1meGCOj9w3bIYxa2s/vFuHTlti26pBltHQnMTN?=
 =?us-ascii?Q?SLJfBIApB0clVbptDGGVv5C6M/0nG2GE7OnfW52+wXmfksd4yj+G1+eLjACC?=
 =?us-ascii?Q?NQNWdGjYqz5H5aCXRCwyUoA08YHALENgJnBLB3Y5MPSVHkhsB9CS8NLlp16+?=
 =?us-ascii?Q?+apAl6xteXmVQ39VQGlxR3AgjgNy4B9jYZQ5pPMVUooFz7uzZjp3Kl4BKpuZ?=
 =?us-ascii?Q?mf1a3IoyyEvqYdft/l9nay4fYYor9ybscBF7gEkRR2a5xz1wFzVJ35kffL+5?=
 =?us-ascii?Q?foRmDQSLBZ17Thj+Ej7PW244OqzQKY93T/korwQf/koxfAyIiFE8iMMVD+1Y?=
 =?us-ascii?Q?JPG9Z4oXqI4/TJ0o4/JZZdL0y73El/097+prb9zrJXBp/LhFSs2DtRdl67fV?=
 =?us-ascii?Q?LWz8FDCMLbdfdQe8PYijZl5/x983J8x/MOWzEpUQnBaC6/DWRO7jDOW98HR/?=
 =?us-ascii?Q?1jKScLiJj+BugtFOI5eSXF8HZ7qSZ/XJnAoVyIhp29XSiAZ7U0lbtEmsEljs?=
 =?us-ascii?Q?tEvuvhlmpnBwVgmyPq3LhSVUFNoDgAeDv4Fs+zP/DJd0hWUTPPda1VW7/zj9?=
 =?us-ascii?Q?oej+ppWxjxv5PHedp1qYL3/QWHZWX/nXJ3J2G80Zmzxsh8yWIuybDJWAr4fa?=
 =?us-ascii?Q?O2sZudEYhIR2cfsG8Pc3aysOkuovZ9jAQ4AeCOL0FXf3vywT8QNeRHUwbvFp?=
 =?us-ascii?Q?A4xS0MgJc5pZogntdY+JOTytMqJupcb8IelkrKQheeSLcqPynPi3fAgnX5hp?=
 =?us-ascii?Q?XAJ+9n5l9xZRH4nSMxb4g/EhEnvY0NxXWOGRwIXZ2/rR26c=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f40Do/nYyJFkw+vDzidA46GGQ7t3m32oJCfzj/IuQZK2F4XE13dUCkbv/6EK?=
 =?us-ascii?Q?uycxbwxLKhieE6RiwLxKBtT1wRmA6GcrKMyEKUpU+uNtS1Br14KSD0StkH6w?=
 =?us-ascii?Q?7M9YbMfC2bAL7ZBUItAZZs2UWLZunYrojflu3bmejYMdoZcZS6IpueYswplo?=
 =?us-ascii?Q?7/eW+RTilf/iVzmvy8vJt48cDf2AaV9ntMy19Az9eNIje2oscVFlvaKsioca?=
 =?us-ascii?Q?dr5tbZpW6j7KRtQOJI8VETDlzZcqJ6P+g32jGeLI858NS2ItHdQSThDPhOWR?=
 =?us-ascii?Q?d+52VPejSrOWrlr9YDNbiqtvFHjYF2HlTJcsfliiTKs7XU2bT8FEwqEi5q7m?=
 =?us-ascii?Q?QfT85s6cnUyQTr/IUdiYTvX4KCV0M91gb+uGcDwgVsshjTUqi4si64Rkn0Ao?=
 =?us-ascii?Q?8PA3Cuc+ezb4lICB+BiMKU5OdjjTT9VF6tJWEHJksOy6CgK56fshyI8By1BL?=
 =?us-ascii?Q?Ic/StBR8i18wDX9rTCv1zxm52ECWhEWXZXbHFn7h+IhmmD0vo+mvF5cDb9Er?=
 =?us-ascii?Q?VJR5zqxtXnGFjn6+06vGV3tREtSajS728pFf1DhWMaw2deKnrrZcr0MkvDak?=
 =?us-ascii?Q?3JzKhQXbiP48KC9nyrskwMdJTeZ0eH+0uzwphp1guo3Fei42oGRnkky6WBUP?=
 =?us-ascii?Q?DG39MSv3IXrlOBjXIj9/0me9T7477/SASCmV8szXQcQN+rRL+rOOEPfCoql7?=
 =?us-ascii?Q?wUIZCbd6LSByenaZln6IrND1ulGTN523tJa39VZzSLEbJbGsiD95zOnogutK?=
 =?us-ascii?Q?VwwcD3caDXa3TdkYjuAlnsUKo9ILr5PWCJ48UEgtCqp4RFcnpS2UbCbaNOwg?=
 =?us-ascii?Q?cDcs6GVZZg1MeM2SYxhbi6JJcgbo2nrqKaYCpEAbc6NL3cK5FIhuYkU8H0lR?=
 =?us-ascii?Q?weZ1q/n/WBsHDaqz9/h4TULucmN9h7vbniWls13QTYp3NswTCsuxI1fo3pcp?=
 =?us-ascii?Q?aaonC44w5rwqSr0gWHWvAFuyYY5I3FeiQjk6qhAS0xMMjT6WpUGvnPfdn4Ak?=
 =?us-ascii?Q?tmCxYiMHPEF+pVs5CzoMmroB/2vUF8iCsAbeuw188xPvM+x4rp/EWB9cIEsg?=
 =?us-ascii?Q?LM4AQm3XR5/PMssZZamLyEoX0DCm2yFj6QTEswpH2/1coXQ8dpU1mG4gAQs7?=
 =?us-ascii?Q?TXIpn05Ls8SI9Yt7+OVQKsnP3O63kFtr5xI1n4vYpubjVkTE8P+WlHcqFgf3?=
 =?us-ascii?Q?SXyQOXX3i1l2I6vvmw8FOdy00EkvV7prUgM/ninPp2bmDs+HznQDy8QCr1XN?=
 =?us-ascii?Q?3bdAN2B4PtXBQlaD3nqnsBwcmSyo37Hbba4IS2/ELPIPidytAFu0TbHVAZk2?=
 =?us-ascii?Q?f+qaCPI9vXJhiU83PF5Uw2WGjf7o1iIW1YE+2Ip96OwhzgJLWZn6l6STPUSq?=
 =?us-ascii?Q?w/r/Dii5ify4fIeGRM01ovVMqU2O?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f44f1c2-b2e1-4e99-6d9b-08df1812a004
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 19:00:39.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7463

Hi Rong,

Thank you so much for your detailed reply and the much improved patch.

Let me immediately go on record and say that, apart from a small addition
to the SMI driver and one line in ideapad-laptop, I am mostly active in
the sound system, and therefore consider myself a platform/x86 newbie.
So I really appreciate you sharing your knowledge here.

> > * I considered a couple of alternatives to the approach in this patch:
> >
> >   1.  Simply map 0x0c and 0x0d to KEY_CAMERA_ACCESS_ENABLE/DISABLE:
> >
> >       { KE_KEY,	0x0c | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_ENABLE } },
> >       { KE_KEY,	0x0d | IDEAPAD_WMI_KEY, { KEY_CAMERA_ACCESS_DISABLE } },
> >
> >       similar to the touchpad off/on hkey events (66/67) this driver emits
> >       after the firmware has toggled the touchpad state. However, HUTRR72
> >       describes these hkey events as asserting a camera access state for
> >       the host to apply, rather than reporting one the firmware has
> >       already applied.
> >
> 
> Well, it really doesn't matter how the specification says; what matters
> is how devices in reality do: whenever the HID Usage Table doesn't define
> a usage for hardware/firmware to report the already-applied value but
> defines a usage for notifying the host to apply a specific value, a lot
> of devices will emerge, using the latter even when the former is
> intended.
> 
> For example, many USB Audio Class devices come with volume control
> buttons or knobs. Some of them tune the volume themselves as well as
> emitting Volume Increment/Decrement HID events.
> 
> In this case, the audio stack, in response to the HID events,
> intentionally overrides the volume set by hardware, effectively
> synchronizing the hardware and software volume value.
> 
> The pattern has become so common that many devices like that also
> implement an internal timeout mechanism. They only set the volume
> themselves when reaching the timeout with no UAC volume control request
> received.
> 
> IOW, it doesn't matter whether the hardware/firmware has done its job as
> long as the subsequent software control is harmless. That's why we can
> safely use KEY_TOUCHPAD_ON/OFF even if the firmware has toggled the
> touchpad state. They cause the desktop environment to mask/unmask
> touchpad input, which is essentially a no-op (thus a safe operation) when
> the firmware has already disabled/enabled the touchpad.
> 
> Fundamentally speaking, using KEY_CAMERA_ACCESS_ENABLE/DISABLE is also
> OK. It's just...
> 
> > Furthermore, lenovo-wmi-camera moved away from
> >       these hkey events in favor of SW_CAMERA_LENS_COVER in the quoted
> >       commit, which is arguably the closest relevant precedent.
> 
> ...relatively new and isn't widely used compared to SW_CAMERA_LENS_COVER.
> 
> Thus, I agreed that using SW_CAMERA_LENS_COVER is a better approach as it
> aligns with other drivers' behavior. The patch seems over-engineered
> though, see below.

This seems pretty reasonable to me, I figured that a single standard was
hard to enforce and also not strictly needed in practice (the "harmless
no-op" argument above).
I was mostly wondering about certain discussions I saw online while doing
research for this patch of people arguing that such a no-op should be
avoided, see e.g.:
https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/merge_requests/181

Still, your point that userspace duplicating an action already applied by
the hardware is common practice, and fine as long as it is harmless, makes
perfect sense to me. So overall I have no objections to your reasoning here.

> >
> >   2.  Ignore these events like the firmware-handled FnLock events:
> >
> > 			{ KE_IGNORE,	0x0c | IDEAPAD_WMI_KEY },
> > 			{ KE_IGNORE,	0x0d | IDEAPAD_WMI_KEY },
> >
> >       This fixes the KEY_UNKNOWN issue, but userspace gets no information.
> >
> >   Overall, in the end I copied the approach of the lenovo-wmi-camera
> >   driver. Kindly let me know if there are other/better solutions.
> >
> > * Unlike the touchpad, whose state this driver reads with VPCCMD_R_TOUCHPAD
> >   at probe, on resume and on each event,
> >
> 
> At least for the input device, the synchronization on probe or on resume
> does not matter, as no input event is emitted due to !send_events.

Good point, I was conflating stuff.

> > the camera switch state is only
> >   available in EC-private fields, and the two tested laptops even use
> >   different ones. Hence the lenovo-wmi-camera approach: the switch appears
> >   on the first event, and a change made while suspended is not reported,
> >   leaving the state wrong until the switch is toggled again.
> 
> So the difference compared to the lenovo-wmi-camera approach is only
> about when and how the input device is registered.
> 
> On recent models, the firmware neither emits VPCCMD_R_TOUCHPAD nor
> toggles the touchpad. It leaves the job to software by emitting WMI key
> event 0x29, which is converted to KEY_TOUCHPAD_TOGGLE via ideapad_keymap.
> It'd be tidier to take that approach and reuse the existing input device.
> Sparse keymap supports KEY_SW, so it's viable to map the two WMI events
> to SW_CAMERA_LENS_COVER with appropriate switch value.

This makes a lot of sense to me. I appreciate the simplicity of this
approach.

Part of the reason why I initially adopted the "separate input device"
approach was this comment from
drivers/platform/x86/dell/dell-wmi-privacy.c:

/*
 * Unlike keys where only presses matter, userspace may act
 * on switches in both of their positions. Only register
 * SW_CAMERA_LENS_COVER if it is actually there.
 */

and so I implemented a conditional registration (which was then easy to do
by copying the overall approach of the lenovo-wmi-camera driver).

However, I understand that with your patch the switch will simply be
advertised by the existing input device with a default state of 0,
i.e. "camera enabled", which never changes on a device without a
privacy switch, and is indeed a correct description of it. So I
don't think there's any harm in going with your approach.

> I've attached a patch implementing the approach. Could you test if it
> works on your devices?

I compiled it on my Legion and it works as expected. Right after booting,
evtest says:

Input driver version is 1.0.1
Input device ID: bus 0x19 vendor 0x0 product 0x0 version 0x0
Input device name: "Ideapad extra buttons"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 1 (KEY_ESC)
    Event code 138 (KEY_HELP)
    Event code 148 (KEY_PROG1)
    Event code 149 (KEY_PROG2)
    Event code 186 (KEY_F16)
    Event code 202 (KEY_PROG3)
    Event code 203 (KEY_PROG4)
    Event code 212 (KEY_CAMERA)
    Event code 227 (KEY_SWITCHVIDEOMODE)
    Event code 240 (KEY_UNKNOWN)
    Event code 247 (KEY_RFKILL)
    Event code 248 (KEY_MICMUTE)
    Event code 364 (KEY_FAVORITES)
    Event code 445 (KEY_PICKUP_PHONE)
    Event code 446 (KEY_HANGUP_PHONE)
    Event code 447 (?) # commit bc39af8c2c43 was included in this kernel
    Event code 530 (KEY_TOUCHPAD_TOGGLE)
    Event code 531 (KEY_TOUCHPAD_ON)
    Event code 532 (KEY_TOUCHPAD_OFF)
    Event code 562 (KEY_REFRESH_RATE_TOGGLE)
    Event code 618 (KEY_ROOT_MENU)
    Event code 634 (KEY_SELECTIVE_SCREENSHOT)
  Event type 4 (EV_MSC)
    Event code 4 (MSC_SCAN)
  Event type 5 (EV_SW)
    Event code 9 (SW_CAMERA_LENS_COVER) state 0

Starting from the "camera enabled" state and toggling the privacy switch
twice causes:

Event: time 1790013067.697647, type 5 (EV_SW), code 9 (SW_CAMERA_LENS_COVER), value 1
Event: time 1790013067.697647, -------------- SYN_REPORT ------------
Event: time 1790013069.208581, type 5 (EV_SW), code 9 (SW_CAMERA_LENS_COVER), value 0
Event: time 1790013069.208581, -------------- SYN_REPORT ------------

This is the same behavior as my original patch, just on the same input
device as everything else (as expected).

The switch starts on state 0 at boot even if the camera was disabled
while the device was turned off, in which case a new event is reported only
after toggling the switch twice. However this is expected and is the same
behavior as in the original patch if e.g. the switch is toggled during
suspend, so this is not a critique, only a confirmation that your patch
works as I expected.

> If so, you may submit my patch yourself by adding
> a From: pseudo header with my identity and swapping the two Signed-off-
> by: tags. I can also submit it myself as long as you permit me to do so.

I am happy to have you submit the new patch as its main author; it's your
code now!

I'll only add that, apart from

Co-developed-by: Marco Giunta <marco_giunta@outlook.it>
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>

I think it's also appropriate to add

Tested-by: Marco Giunta <marco_giunta@outlook.it>

> >
> > * For reference, on KDE Plasma 6.7.5, using the Legion's touchpad toggle
> >   button shows an OSD, but nothing on a SW_CAMERA_LENS_COVER change or if
> >   sending KEY_CAMERA_ACCESS_ENABLE/DISABLE events. I am not sure whether
> >   this is simply a case of "not implemented yet" or if I misunderstood how
> >   these events are supposed to be used to communicate with userspace.
> >   Please feel free to correct me here.
> 
> I believe KDE Plasma has not implemented it yet. You may raise an issue
> on their Bugzilla.
> 
Noted, thanks.

> > Hi Macro,
>
> Whoops, I mistyped your name. Sorry for that. My fingers definitely have
> their own thoughts.

No worries!!

Thank you again for your very informative review and much simpler patch.
And please feel free to correct me again if there are further inaccuracies
in my understanding of the problem.

Best regards,
Marco
