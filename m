Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.13.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794493698;
	b=xXp+k6h0Iy0CE941QT01rD8Q11KbiwmHmtRKzvGYi/C6kaMzIv2XK+TxTl17ZgbudzGz
	 xOUiB/fv0dhC9VzUFbgynNRRO3k+JHNPVkRXzaZlzRJCY2LHOH4gwEOT/OMRYyr7CsPMz
	 1nsthlKUtgiPHlYXYeHD4KwO0jmpYR/Ixtogi5442ILbyXEPtvybltHgapROSHPF+imLg
	 SycQyIEjToziv2viCQl6KMUbPyCgh8/LOqqAO4JbiEmNT4FXrEuqV678WEjKrfYJ245Hn
	 +rLAYNqRPY5ZsqwgQqIm+k4kAXipVH7rHJuRDfiEcVrVRf2yzUEoJCU5Nsnu6qWGQMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493698;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+02LkofJOlb7nN0tHnPm/L/qcZfKiboREpzNLGcBZpA=;
	b=Yx5gEZ/dOP9ve768vddXgDoP8taGN988ixUxupXyt2mGCYfb7JU96e509Ohjdd44G/tL
	 CMdVw4FGtP1+zeHKzFx3BzJO5lfJeI/El+0rQdcDwRBPuots0ey3Cn/IaPTdYnL56/uo0
	 R093mHIE3f9kEWAMmswzDtNtm8e0T2T1hpLixeGyzXv1E7g0HqRPdrCw4QRppt3wfQWDP
	 gp75ZpgPdo3NlxGJV7UyoEochCIEbnMcn+aEeulLeeW1oVFBfqLOtmxfjFn0TOmOKDIuC
	 mmVrcUOesgemcDsUgicnFTvJ95NTfSR9OcP6QRaFNp71lF5qZ2TVTWo586sX5dsT5eQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=RYLnOpxv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.13.23
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010023.outbound.protection.outlook.com [52.103.13.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E6606D55E;
	Thu, 12 Nov 2026 14:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396E6606D55E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=RYLnOpxv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/Ge6GuvxGbjCMkIk8wG0G4BbIIhB4HcvWl4PZXOuhPxph0Yo5ANZyVNr5tQF0IZpsJz/oBiKqv4qFSxYlH34Gr5Sumq5X9nkBfor6wJlNrrk9vUmDJxJaUhdWDT0yfqry1sAH6iF//40pvrPDANYuIEO45nhXaava8HFodc52FNB/8a1JzgnYENCu+q0e5BXIUhQYUY3k96DKS4trupgSzmlyVtSuZbC1oZufIV2DX+CJZ5a8Rj58TKki84qzhXwXbRxC04S8J/Lr7VzURTanLxqwlO4cbX+pry7Eh4beCAm/w37NK9Ydf5vkqHo9YODI84pmyI1IzRyabU9myB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+02LkofJOlb7nN0tHnPm/L/qcZfKiboREpzNLGcBZpA=;
 b=YeISyXhJfdfhbAdwAXX3o4+4/pDa/ps8tuVXGlkbrbcSb29waBcqMaUkzpCllBXatT/HDxwxFWRelImyc+Pws58E8UepQJv8vNYwLZMi+uKeQQjHK+lg0gC17SMArjRm7CpBQz7Ml47h5qrLJjztMkz/2dOgW6ZZGchVJHeDOXU7RJ5EOJPGMLP32anOCO6Nym1jrYEEit74wfEMCMcBBFj3Ag6eMpLj1hPIuLphYgMgPCfc06I9JimI/KorXmOQ1F4ss9nLiaOUVKk+/Ra3vcVxFg9F26Cya1SrZmTWsN8cSOJ7bP4iYOVk2NnMI2GPr18LhyLIGBKci6aBx06hNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+02LkofJOlb7nN0tHnPm/L/qcZfKiboREpzNLGcBZpA=;
 b=RYLnOpxvQdyM06yvPmIKix7ZZMnukq8hM1Sx8UsQf6VM1m9mptGguxjPMr9wJrzCp2WfOFJ/DkReneaCEZPZHBcY+pAx+TwfXFgbgxD6mXbEUy7ICkmlPIX/l30pxlmBw3iLbTUlzJzyhi/YDOMNtB20t4WVXH1p93JPQHg3o8unXnXDDcGc28Uavwvjy2bLRgZHLP93FabyIlcpnVw51IB0+imfa/n5Vqfur0SbLQk4jN2VehM3GuR0nqMeVq2c04wCSxjpJ8WjJKeHYYFhPOucttSZtcvipW9FJj0EGNW6QA0rllFIVU6oRaflLFKPF4j3ENCO2qoJfeXhJDbPYg==
Received: from BYAPR19MB2293.namprd19.prod.outlook.com (2603:10b6:a02:be::11)
 by SA1PR19MB4895.namprd19.prod.outlook.com (2603:10b6:806:187::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 14:28:09 +0000
Received: from BYAPR19MB2293.namprd19.prod.outlook.com
 ([fe80::c4e4:5169:dd46:c0f0]) by BYAPR19MB2293.namprd19.prod.outlook.com
 ([fe80::c4e4:5169:dd46:c0f0%7]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 14:28:09 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: ilpo.jarvinen@linux.intel.com
Cc: guanlan@awinic.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: serial-multi-instantiate: Do not request IRQ for AW88399
Date: Thu, 12 Nov 2026 15:27:32 +0100
Message-ID:
 <SN6PR19MB2303434E2E267790D5DC2858FC702@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <ccd77135-cb25-d49f-7e30-1777682485e9@linux.intel.com>
References: <ccd77135-cb25-d49f-7e30-1777682485e9@linux.intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0272.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::13) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261112142732.18305-1-marco_giunta@outlook.it>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR19MB2293:EE_|SA1PR19MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: f9219d91-ec77-4734-dfdf-08df40c9203a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8022599003|23021999003|5072599009|15080799012|19110799012|8060799015|24021099003|260925184616899003|25010399006|440099028|4302099013|3412199025|1602099012|10035399007|3071699003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ad33hctNah34U+tfPAQnDw1EIeN35Qe2GC1ltxEEukmP0+j8aX8SmZxNxHRp?=
 =?us-ascii?Q?9auuoDQIHVUJ67++D9+V0jVPOLZfmWgStf6ngdHcK7JcexSnEErdAJkfaA1V?=
 =?us-ascii?Q?y1bXAVRdZH72+pD8q0ddWsahfWFv9Sqx9cl42eE5Sl7oh8K/YF6Pun4bzPyE?=
 =?us-ascii?Q?XixwNfKl5A/nf+OISUxGyEslabRhJE7mfPz2dNmYWHLs0LFBNC8KCuGgs3Hf?=
 =?us-ascii?Q?cxuPqVziIXuHBE2t+rqiyeUcvuWptLRTaXuz66ls7iMrPTCNDYpxCtvOLE8E?=
 =?us-ascii?Q?qP3Gdvt0kekpss7vMxHnXCp2vWCTddsaUVqG73E4YzsPE6OctujTv2KF6Gpx?=
 =?us-ascii?Q?L0J7iOD/wE9awkU/aFShAbNN6GljmSlr0Xq/u7vmgWpvQmgSxWpGz8Co0X0w?=
 =?us-ascii?Q?BkTkn8zx1Xvr5imVhuUZpGTOXmyzPL8n0y8vKn8R6wpwUNX3FGfZopx4pc+1?=
 =?us-ascii?Q?dTh2lvphwd5dpnIFMECQiagfvqQrHGZeK78+/kTTdKVOp4G2CFHy5diX3cUf?=
 =?us-ascii?Q?e5H/QNpZQ628Br5PAPSov1B9HqecVbV4+kHMOEqYsFRU89IqVHXi1Sct4G17?=
 =?us-ascii?Q?LYnMExHHa2eUtuSLpgQo8R5pnP49OWjmtaowzT0BWASnxb8A7YuP/ve9KdM9?=
 =?us-ascii?Q?Wfy5JkTeOQB8KTy4JmrlQO/2stSZWADwTpPRT+H8LMa8F4fjRFaNSXCE4QL4?=
 =?us-ascii?Q?keU7r8cKZQO1FmrMD+uXMU8MZPBDYoH4eUBd0sickPk590ayUhBfiYZom/Qr?=
 =?us-ascii?Q?hg6KDJRRskTe4yHK1HOiTV7lsFaPqRWrD1KvrWt/kavWYHrOoB2O4DfUjPee?=
 =?us-ascii?Q?AUcYt//KBe2vwVS8ch28zHGLlRQPHFBx8/GtXgly5g5d5THJhwdVBDnC4lNd?=
 =?us-ascii?Q?lFXq/oQrw0VERSmgOPnW8MwHg77LXWQ8SeHuVNJkismJzyFm7SjfoLcOwBOl?=
 =?us-ascii?Q?LM4N/+xj4cwqElSuGQ++RIT+lcVte6JSBQUkFMeIIyk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z8437htzkl7O+oUV2pKk7GwY1ZuIjTy1K18ZAElGYOI1kDeSwpfWZYo9CJxZ?=
 =?us-ascii?Q?TFeCkkN/6tCDJaEQJRIQBlIAgsVOQnPCssK8R4h5dEPRy6Se1K26KxS9NBjC?=
 =?us-ascii?Q?nvNcH+Rlk6mqj2JUZFWxYxRnkVZcMIYucPBhSepOulV572mXsLwXewU/DRHm?=
 =?us-ascii?Q?saS2NcvcyCKLZnOwY+OWPvZijGuADDgnSSmvJjPoQdRi6++ke1jh9xnbSMbb?=
 =?us-ascii?Q?uABKdTUgcdGcV3Vjb3ty6ZIV4h/PXhdfDRkD/P8Q22BmRdg09phaE5ddZnI0?=
 =?us-ascii?Q?GQ+5hOE0jqbGZ6KyMR6l0ObWMHd3+P8WTu3HMpu5UTBRP0xc7AJadKdmXDNT?=
 =?us-ascii?Q?X0bzDGSiSLLtRV4V3nQQPl1N45XmoeSJ4YrcWaQotf16fdr/xVA19QsbUrvN?=
 =?us-ascii?Q?75KkkTQZr3iF4+mw/fRUchlQUsfrIiJxRXDVAj9eFOAKfnRqnrhYFqL8CUEo?=
 =?us-ascii?Q?is/sQ7++Dzb8jI6Q0kC3Abxwp7qWuJa5E95A9DT2VcOf1xwJ63BgqWcx4vhx?=
 =?us-ascii?Q?30HCbAsAkRi9wtt+ITrXa8BYtKYCErPW6CO9bf+0u2FRwb8B95b/cM/QKBuc?=
 =?us-ascii?Q?mSau5bu2a1Sk1SmZsSC8vHkJESVM7rGc45WQFxmrkRdnSbvqBLKSJwfTNpmC?=
 =?us-ascii?Q?k5okWQ9DXU43x870uoxlyaAvMVT8gDLB7txlJPSfXEkdu9BeqX9fv+Pc2f81?=
 =?us-ascii?Q?hh7YAjwEswkZ1Rp7K88CRLt4V5xt9IPaX8GsHltmAH1azZBVV9nPAqn/7oOB?=
 =?us-ascii?Q?68jux5QuwOu05/7q0Af3vxtriqwqBhWnvZpdkqQaK5yuYi8/O2vBpLHVJPED?=
 =?us-ascii?Q?JCicGo+zMmSun2Q0xCqpTj9zR1OT/1ycPS7qd96+/9oFRdslqIl5Jc1PUH9u?=
 =?us-ascii?Q?QN2CIAPBdJq076lJgIkhX58nhl5YGa1/KBtt9oiwVd/oDcAAWNmnoTf09o9N?=
 =?us-ascii?Q?TwTGMXiWmGpx8FDRsYWkj6bgcBjEgLdw07bkTvSe7ZaqKW+m4xydh9o3mQiI?=
 =?us-ascii?Q?zzX72HaWiUfgGb/ytFPqcpgqoT6n759eerijARe3/s9exUFOzGVrBhJhB+YH?=
 =?us-ascii?Q?r9vFBG3C52aJtmjfydO1WvwwiSukkgIYVjxWOqn5tSkOkwth8Bis+OJFZb7m?=
 =?us-ascii?Q?l5ruTHdkpjAuHt0Tp+HQVResbWNEMULbAi1bdqQspMoiuIoZN+ceZ39aaV+r?=
 =?us-ascii?Q?4MEWkWafVoEWzyV+EqC2sgHEfbKtpBNKW7hVMW0gI9qIAeVuq3O2fkKR1txn?=
 =?us-ascii?Q?4oC+Io5KSoti2CP0s17NIvK8tO39qN9kuiKtafeA2+desYBthXTgYYdlN8rE?=
 =?us-ascii?Q?+fwDyGH4lCm/VNJzFy1xe2BGI9D5+sFTDzPtKfl8sx90+2dxpJm0A6yvbxSl?=
 =?us-ascii?Q?xgVR8fJdrKEbbxZcasXMJk5U/YYn?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f9219d91-ec77-4734-dfdf-08df40c9203a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 14:28:08.8821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB4895

Hi all,

chiming in as the AW88399 HDA side-codec driver maintainer.
I agree with Ilpo that more context is needed. What's the issue with
IRQ_RESOURCE_AUTO exactly? For all supported Lenovo laptops, so far no one
has reported problems with SMI i2c device instantiation (as far as I'm
aware). On my own Legion Pro 7 16AFR10H with debugging enabled, the SMI
driver simply prints "Using gpio irq".

Based on this:
https://lore.kernel.org/linux-sound/20261111043601.306427-1-guanlan@awinic.com/
I know awinic is adding support for a new Lenovo device. Does this laptop
have issues in its ACPI firmware, that cause SMI to error out before
instantiating the I2C devices?

That said, given that we currently aren't really using anything
IRQ-related in the HDA driver, this change doesn't look particularly
problematic if this new Lenovo laptop lacks a GPIO assigned for IRQ.
However, I think IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT would be more
appropriate than IRQ_RESOURCE_NONE, as we can keep IRQ resolution on the
laptops where ACPI firmware provides one, while avoiding SMI erroring out
on those where it's missing.
This is the same approach taken for tas2781 in commit 1d1b8b0734af
("platform/x86: serial-multi-instantiate: Add IRQ_RESOURCE_OPT for IRQ
missing projects"), which addresses the same situation.
The corresponding HDA driver also doesn't make use of IRQ, so I think
the tas2781 precedent applies here cleanly.

Tao, can you confirm if this is the case (no IRQ assignment in the ACPI
tables for this new device)? And could you share the ACPI DSDT excerpt
for the AWDZ8399 node of the device in question? For reference, my
Legion's one can be found here:
https://github.com/marco-giunta/lenovo-acpi-dump
If the above is correct, then please submit a v2 with this change (with my
Suggested-by); alternatively, I can submit it myself if preferred (e.g.
with your Reported-by).

Also, I know the get_maintainer script won't print my name for changes
like this, but please CC me anyway for anything impacting the HDA AW88399
driver; I'd like to catch potential regressions early. Or at the very
least, I can provide Tested-by tags since I actually own one of the
affected laptops.

Best regards,
Marco
