Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010002.outbound.protection.outlook.com [52.103.13.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F9B36D9FE;
	Sun, 20 Sep 2026 09:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789898332; cv=fail; b=CwnZ3d9qk7WX6nikDrBd94RMZ+clsEP6Pv0Wl1Y2y0JS6uo3xM07ZAe971h571OeVhphrlEBOI/N3cf5zoCOVWPSaNJvMlczfgjSqqzsMWwooADLwEXD4iRaD3vWRG+AdkvicS3mVArdLVuZtBlQBIqflb+2ySbs/QbgEPwC4WM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789898332; c=relaxed/simple;
	bh=4T5VtIK5dJghCM1DA56mCSCSJsEaOD9qEL3LMHPbeEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o3jSY2wtJX+lAzQpdcfFy+OM8ebQw9ta+hhCT+x/7kZuQ4UJKB/mxuuluwjuSCcm4CNIGQteRE7PaZs5WwoGZphz+YTZsDzTEL3WpujD0yx5kSPT6iDILhzYcTjN/LX3Zs0bIwZ9/IL1i5lsweMlVlngv0hbPYVg8Ddtvf9zz3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=lWpRILCF; arc=fail smtp.client-ip=52.103.13.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="lWpRILCF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmrHJkVfzqyqRWyF0edV0bK4tZuDoCanPs963G6g5hk9SnxCewiIaVVXwjBWyVPojjw/QE9aAEORLBMePJ15clsztF0+GnLaJ89zBha6sa4uoSnyyIwXefVOQoSye7hZe6kbxZF9DvDmUEjAzr2lK3XL8eaCs5JYbcKNKz3gthrkAG5IWkgn9qAw4udabvl9GOU+HeleknVgw4XudBH6Yj2tS40f4gRKW7StggXzPJehWjmhsj91VNW5dd3fuscPCFyMY1FFsl1mzZYq9Bulp3QDk0Q7XXj0SRFdOYXeoIt4N2HdWEx8wxa8WQy/ytYVNeyjTNHhzKq1zTwRbHkvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YllfAZrfM1h8tnHQvHnWpU/C3IpmUA77+wwtIGQc9iI=;
 b=rbmRrfxSVUh5yyGfzxPyPMvp8LghhPm3s3R2JXLZZ+0Rp56rBKvmcsZ1mrf2oi4R2NQlsfW3jdi4D2+n6IWTyDVsTU+6jnDoRNMNjUWV4Y5kM0SJqvXmLt5Vf1EZ6pLwYDJFWVpmWeqfJJz8b/hwJAGdGrYDziOqYgGUvLPOS5vsPhPoYyKWyAbmQVcQeolUmDm5iDUxBftyIXgLFlhZ224vscOVAYmDdxCQEDBCIn+RzDUsm7YxD9x89fY8DnspOW+rTq4VF5LVfoXwHJ18qxfOqj72oKc0jIIuFhyQNvhRtuM8d5b96tdKOqgy1bgKFN+y5JO58bZzCjafpLdUfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YllfAZrfM1h8tnHQvHnWpU/C3IpmUA77+wwtIGQc9iI=;
 b=lWpRILCFFR5udC0cKGh2+MXV07ID2YHiApMAYKC67urR9+rI0AZZVto3xLhEGElx3BwtVpVDjAtJUt9W5LQVJeDDU15a1xnDernbMyPaHnr3MuWgU7XCA9Wj4QehdURr6Ob4fvO6pa/05Ngl7F9IbgX+Ge27DehuuAnuUplpwcnEJb8HuV9cir0YEfeClFwuORjBwmP7iDkea0HjK3WuOdTqFm53yRLFQ67L0VDu+jkqSO9ofeFO7giDK2rxQhPhI86qvJrVXcRFSk6pv460ryyL42uka3fOlcT24s6GKGkkhhWd8TfvuP65jqC/SEH03JYv3UvSISoTAEbzvUc6TQ==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SA3PR19MB9425.namprd19.prod.outlook.com (2603:10b6:806:49b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.15; Sun, 20 Sep
 2026 09:58:43 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%5]) with mapi id 15.21.0428.014; Sun, 20 Sep 2026
 09:58:43 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: huangwei@kylinos.cn
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	marco_giunta@outlook.it,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Report camera switch as SW_CAMERA_LENS_COVER
Date: Sun, 20 Sep 2026 11:58:29 +0200
Message-ID:
 <SN6PR19MB23035785AA29213284ED87C0FC852@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920064218.619667-1-huangwei@kylinos.cn>
References: <20260920064218.619667-1-huangwei@kylinos.cn>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00004EA6.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::45c) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20260920095829.18057-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|SA3PR19MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e37552-cff2-4b9c-04b2-08df16fdbfbe
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8022599003|23021999003|5072599009|15080799012|25010399006|12121999013|19110799012|8060799015|41001999006|24021099003|55001999006|3412199025|440099028|2607281247196008|3071699003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F5WO4UWGDNHbtr/0I/sZMO2+14AmBWDMGZmEO/xyRgbT6uTHfX/A05J3cpnA?=
 =?us-ascii?Q?tm9zlbv2sqNH5i2ag6j5cwRd9kqUeutX85sQ9+rK44PXhCvzpMfqPuzny9Nm?=
 =?us-ascii?Q?iAF9ArQoNL3b49iGazn4C+wwKa5983G/iWjELnyVcLjwQpuVd1aI7EMyZpq9?=
 =?us-ascii?Q?C9+Dq5zTRdXaGffQEIAQM1llAFMyph19M+pZiDBls1UFlEabGuLf0irlUcEs?=
 =?us-ascii?Q?eh+JWVmWLTAwXf2UGvfU6e03J28DOQEqTF7FEsM7a+NkwlMdgy3pxB5MgvQG?=
 =?us-ascii?Q?lm/cerJZ01144GASdI+IECO8jK4AqZJLuCPbGfw9r2gFSUCFTrl9E3nlsNp8?=
 =?us-ascii?Q?hc94B/RKfQsMs9PgVzt0uTNCw4BQHnAlmSRCb/rPgL5wTRgWENzJjpUdceXC?=
 =?us-ascii?Q?aFexr92ftL1ZCO9OeEyHs4N8Kr6ClxhWsDijyFES4N/rWZZTLknRVL9K8sRY?=
 =?us-ascii?Q?2TUEYj0z3qMK2b+kJ0fX93vjGdtiOZA4zqRrir6UTDJ2auJeo+Uqa37hxL8X?=
 =?us-ascii?Q?ho5hfLsTx7DFjVo0MVz+WQiapjxiz1SH27sanMjy44j6gazZCbYI99L6VOKQ?=
 =?us-ascii?Q?QzPKt72Bz2zOMcAk8kd6MhZdtvYWmD93/82TyCHE8st9BFmPTTkc0T/Oltyp?=
 =?us-ascii?Q?DMpdH7oZH9A+BFTB8s+lWO58a4Vk7fvoGgjwi1gZhVS6A5uhuUHGfG5azeBn?=
 =?us-ascii?Q?Esa8kGl4gRATeB3knM5X5JMwxdDxwvNs8pyMG9pCCeIV729k5hYWsiPtdA5/?=
 =?us-ascii?Q?6Gviq08xcIbHO2bkN+Yin7dNxnbQuEUmhFpI4W0PtfnpH4rOdACuwirX96Uj?=
 =?us-ascii?Q?SVkCCjbmmWD4ZaDmQ25CA2obwychS8BcdQTiIna13Gh13fbnOW/D3stCQprS?=
 =?us-ascii?Q?EdkHURx+vUNLo0U8jATxSOcd8PzD7qApY33lNkzlQJ172gnszF4BaFfVKL//?=
 =?us-ascii?Q?t85IeG9EbhJm8kxeOcVthyjLP+40vCkEvHa34vN7BIc/vizv66cZOS4K5Yws?=
 =?us-ascii?Q?tY/VNc+Fc5MoK6ZMARNLNt6fX9k0vX5Z/opoPUsG0ymV1Xg5ghozB0zqI7FM?=
 =?us-ascii?Q?29m6tUF7?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zEzoe9ah1WjtLUbXKbSz0A4mPkwTuLy83eFPzCXP0Pzc3zZmZf2XFHS0fWwn?=
 =?us-ascii?Q?DeedhhdEsTzdXX3jr7hK/nuDoRzU2RrlIJDLo4wFE5fOAyc/W5Ev3UTBloS7?=
 =?us-ascii?Q?vlZiShO8vY5MBRJXbVvi3jJVKoLmYdm3HouoJT3Bpbu26o09TyEcjjQ3a+8/?=
 =?us-ascii?Q?+5U1dHC5E7l61D7Ol7X9gfH+E2l5HZO21fRpDbjEvKqtWGqJFc9APDQkU0TJ?=
 =?us-ascii?Q?sGnLT8azVPWh4Qe9UFyjusKzOzcaTv15mwmJ2ojGQq/93D5GkqLzlfr3GSm2?=
 =?us-ascii?Q?iR9JALBKyWIicDZPrsQTVVoHHhTn1Lyx3DxoMU2/5bjnWF68vgtylmZcM2mf?=
 =?us-ascii?Q?d82OtYds+IBhyFIqVBS7nyAcv1ZRk/O8UWaeDXDUFWBd49W31HsnveDrv7sb?=
 =?us-ascii?Q?W5h3ezPaGp4f3RZvSql0ktx4ZcFHrNZG4im92Z4Md+PXRFZ/5IG/or2BOL7p?=
 =?us-ascii?Q?yXQG5EBZnTEI6/fNki39N85FTj7ivKqprSbgqWKD1FK9hAbFR0OrGXn6KLkc?=
 =?us-ascii?Q?a1+E/4pqLnVWXDjuwZLb22Tce0lgB8ihkd142i9lLURoyzzQGpoqwdoYmZ9B?=
 =?us-ascii?Q?eAx78uLkY74A1X6hPaUjzMZa+3v+NibVZJd/7pjlrywvPyCxUpT8I51GCZGe?=
 =?us-ascii?Q?JcBDxWRYHdQkCVvuHLRjvUSdwUg4Bxugq7La2RB6nGNqShsdwsz5nr39Tphy?=
 =?us-ascii?Q?qttfS3LhRuOWEtwRJz3R0RjKxfmTqfaXg6oQpV3RxOKhYrdC/+zResnGmuc5?=
 =?us-ascii?Q?llA4kfimccbBWgGHRDb6K6RxRHwi+j8xZBN78n9HmxAWiskW3MUbugvcP1s+?=
 =?us-ascii?Q?AzQK9s8BwhKc6xJnsUsTcW0y0EPdKd0cC7To2rhnpRAqxeP/k38Z0qPbYRAR?=
 =?us-ascii?Q?jnGZFh5cJZSYYIuI4r0k/d7eKwkyvHTmtwmmLeWv1IwmX/vgevjPnLHoFsGd?=
 =?us-ascii?Q?aoAYo/+Jb3sAeVQwdaXsWHByZ77Igt8qtMAHl98CmaJovbollmjT2xEMCyKd?=
 =?us-ascii?Q?B0Wsi6EMtZDxjfN06EUI3Uv5bezCPZX0GWUEgsDErgXmkGHtdkKF309Hletu?=
 =?us-ascii?Q?mffyze/nKTE3AeIrU7h0SGsbNbLsdMF7gCopP0tGv6TJbl+7p420alCiXSYj?=
 =?us-ascii?Q?HajbukF+X9XhaZOQ0KOaMfMTJ5k8pfcuA0f9WNFINLFhz3cqLGSu46thAZpu?=
 =?us-ascii?Q?kL0QOseq0McfcjPJ0E9LGpRWbLOvYPeD0/ZFeS+GkT3DEALFkPK8Tf0JoaK/?=
 =?us-ascii?Q?Q2RANju3YbmUHKE5dR8TAbARTM1Qi3DUXDQX7dafYZk99OeV1vRkCTVsTGUM?=
 =?us-ascii?Q?Qe5BNkowXIKufSl2Tci8RLRPXTfel5jE47fcE3qfeXP02a3aZK898bk4RyfY?=
 =?us-ascii?Q?cuqF3J2ijsiI2a63E8rRqdIn/biH?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e37552-cff2-4b9c-04b2-08df16fdbfbe
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 09:58:43.1374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9425

Hi Huang,

Thanks for the review and the useful feedback.

> I went through the patch and the approach looks right to me - matching
> what lenovo-wmi-camera does with SW_CAMERA_LENS_COVER is the correct
> call, and reporting the initial state before input_register_device()
> is the right way for EVIOCGSW to pick it up.

Good to know the approach makes sense, thanks for confirming it.

> I initially wondered whether the lazy device creation could race
> against a concurrent notification, but ideapad_wmi_notify() holds
> ideapad_shared_mutex across the whole handler, so the init is
> serialized. It might be worth a comment on the init function saying
> it relies on that, since it's not obvious from the code itself - I
> had to go and check.

This is a fair point. Indeed the patch as it is relies *implicitly* on
the pre-existing mutex infrastructure.

I think there are at least two possible approaches to act on this.

  1.  A comment above ideapad_camera_switch_init() stating that the caller
      holds ideapad_shared_mutex (or something along these lines);

  2.  using something like lockdep_assert_held(&ideapad_shared_mutex) in
      ideapad_camera_switch_report(). This documents the requirement and
      checks it on PROVE_LOCKING kernels, and is the approach recommended
      by Documentation/locking/lockdep-design.rst (sec. "Annotations") and
      Documentation/process/maintainer-tip.rst (sec. "Documenting locking
      requirements").

As for 2, the documentation above is not specific to this subsystem, but
the same rationale seems to apply here, and the annotation is already used
elsewhere in platform/x86, e.g. in intel/sdsi.c and amd/hsmp/.
It would be one line that compiles away without CONFIG_LOCKDEP and warns
with CONFIG_PROVE_LOCKING.
On the other hand, I may be missing some context regarding how this class
of annotations is meant to be used. And of course 1 & 2 could be used
together.

Any preference or other thoughts?

> One small thing: if ideapad_camera_switch_init() fails, the state
> carried by that event is dropped, and every later event retries the
> registration and warns again. Probably fine in practice, but a
> persistent failure would log one warning per toggle.

That's another fair point. I admit I copy-pasted that dev_warn() from the
lenovo-wmi-camera driver without too much thought.
Do you think it's a good idea e.g. to replace dev_warn() with
dev_warn_once()? Or something else entirely?

> Thanks also for the notes on the alternatives and the
> suspend-staleness limitation, that context is really helpful for
> review.

Thank you for pointing this out, I have never included such a section
before and was wondering about its usefulness.

I will collect any further comment before sending out a v2.

Thanks again for your review and feedback.

Best regards,
Marco
