Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF5D46983C;
	Wed, 16 Sep 2026 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548952; cv=fail; b=YXeSxVQKwHFMaN7JCQtiq0ksGz8YIo8iTlZoFnz8t4fQ87PV0yFhQYqPb7lfUn080w9qvQBRtqNozdwnR5QBARU2SFgkvRuC3Wxv4iPGMs0MbW0DrUO4QEmuslXvuFpNcuDjesQDA7unn65AUho/vwbwa5DNkxhkRCWf+uTuCM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548952; c=relaxed/simple;
	bh=j4llVGyXInZeNzrm+N2p7/gg3XlNce1XcKF9MOAopPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t09swqam+uNundMK+9K/vxVerO9O6lPxmV6OoRz6KxoiwybTPE2LO8hVHf9oBZ+W72ZBtPz3UefHwRlNBZEGL8Bn30BcC1LmtKd6rsLcN5fl0i3VMcRXV28AblkGZcuLunI6LwW4XTFiXX3lSqkoB3jGEErTZEE+QEsEa8PIP8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=eAVXADma; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="eAVXADma"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSNmyRrKkADBfm8FRBA/0bV0cOhbgJUXUQ/bN2cgwQKO3IOuKY2OR1tocqLFpmYLTg+1mkpK0R9WbuFd/zipsHzoWOrVGR1fF/2K8qzWLy59Mqd/med8PmjRMQX/L2puNuPrTjp7A+fB60Oou/fFfD6mnPZHeI27v/O8zPNbWeiHgdGxoUIKqIUETeWxkyFSlCVXquabUThsXLCTyRD4lsHotxFY33sjDJ12tuAV7tgo7+H0tiIbGZ5qYoREoBr9ikFbPRfcsOeQw4thpsq7IiELaiezLYiZ72pR2vpM81+AjQ62xQxhU0YdieeNjac4oIcfE3DaRmaaV3ks00qcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yu5AmusNpNON3i8F109QftsFIXrJ1jZplS02DN1eAs=;
 b=c9NsKiZ7DehZi0DnumXzdqfLGJR3dwXHtC78JGiRL7V2BB8eL6bem+XCZx2ooUrPK0TPeCdRd19kjZbg66wUtXrmzHED+LIge++SJtHM78BmZdepOLduG1lTIQs0n3aEx3rXYn59Dt1d8OdNLy1fu0dJwbuHPR6RZxPHSAJlNVEnw+M5w4lEZVToYstl6A02b2jueJ0SDOFiNaiYWaUm75rFwokzNtsZWrMAYeQ9dF9HtgD6N/hWnSDS+vHKE0PtZmp1DWu/IH67BgGAa3xDrhnY3/JxoiG8K7i+3pai4ct4vEDmp6pwCYEA6CwZR+ilJIsR5zdFlFsSVblDS+E9FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=pm.me smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yu5AmusNpNON3i8F109QftsFIXrJ1jZplS02DN1eAs=;
 b=eAVXADma4mYtdNZ20kKnpNNxpR0YCxZoIIrcUTcmDWuga4MbVSTqHb7pOpNZeosGGubV6EJAX24VEyD823CUjMhjxb/hFBL6sCJlXzyirTAOZvE7TsbR4nadydNOGkFf/Um7C33hsTZ7cpOXluIE/px+JzDUpmduEJcoo3WrBKkK7ek4cBL5ATKcn2roXiwBH5fNchbapKigWq3aoreLVL8prixbhoRtP0PTNlFnql4UXCLyrhNWaNOVE9Nuuh7CNsXBhH6Lan3V5FWLbDG51g7wwVNe4fCn2QbB7xKxi0heXdXa8eo35HjTuKWlLyWoYW9Yjcnkepqh5bX35qQi5w==
Received: from DU7PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::7) by DU4PR10MB8612.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:55c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Wed, 16 Sep
 2026 08:55:27 +0000
Received: from MAD0EPF000008B1.eurprd04.prod.outlook.com
 (2603:10a6:10:50f:cafe::a1) by DU7PR01CA0007.outlook.office365.com
 (2603:10a6:10:50f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Wed,
 16 Sep 2026 08:55:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B1.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Wed, 16 Sep 2026 08:55:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 16 Sep
 2026 11:00:54 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 16 Sep
 2026 10:55:23 +0200
Message-ID: <df4edb95-82e9-4989-be43-7d9cc408d268@foss.st.com>
Date: Wed, 16 Sep 2026 10:55:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] media: i2c: st-vd55g1: Genericize driver and add
 VD55G0 support
To: Sergey Lebedev <lsa.uz@pm.me>, Peter Marshall <pm@petermarshall.ca>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Daniel Scally
	<dan.scally@ideasonboard.com>, <linux-media@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260910213308.53429-1-lsa.uz@pm.me>
 <1070f707-8a23-419e-a0a2-a6f295ceb5a0@foss.st.com>
 <20260915100722.38504-1-lsa.uz@pm.me>
 <1e798c12-2272-471a-9e71-82188439de82@foss.st.com>
 <20260915173604.65023-1-lsa.uz@pm.me>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260915173604.65023-1-lsa.uz@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B1:EE_|DU4PR10MB8612:EE_
X-MS-Office365-Filtering-Correlation-Id: fdc3fbfd-d3bb-41c6-6b22-08df13d0410b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|4143699003|56012099006|5023799004|11063799006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OTbLRlvjeXebzb9XMRmKh/qCylQQDdpB+WPSyIzIzB4q8to2/TBN6VkfzTzh3FHpo/tJHiUawnLFQ7sLCeiaisHFZz7rixPugLBFxcXpas2vLaPbcCqNS+icYZHxuur/keN3gjrsIJw8h7KqaEDEo/1ImtwE+sYzCgo05evhORvnk1s3u7uHz8/ZP3FBWuqowIcHlt4JiVmvIf1pjiKSThicbxqPe3zIsvPYfVZYvv9bpduuxdo8rvsBq4v2r1h+lucY+U3fznAO7XsgEm7RwS3ypZ0SAAclgk0sHb+PE8SqVRplshHdH1S1653A0wCNWp0Gwvg7MO/q09NikHcYR9hVnzSm0Wh0oc4zhFY+h4hyNtL2ku26gCP57ug3fJqPfmOKaC3AW/AtD5908Y7qybrxmq4VuEyfSkFST9Z39L9uPV6JaCKEk5HVyhpaBYfOuSJqgvvHy5o+RYeW+wLPi/lPzMNwhh/wUT+OyQ9Qg1ZaoJWbzXNUtCJsfEevrlxKcL/XZNT8O2M3nYUosS528u32TCd3uKaNjD+1Br4eItPLcg/+8Ju6FM7WQ7qT8H4/D2Qnc+OlkqgNsnQP1tv4F7otXwQBKMV5r3yQiue1If8twQwTejss/TOESi43vCLzuC9huiUC27z4GmbWRumV9SHVDK39hpq3zYjNEO4oYd61mIsNK+dXevBqI6t72cnGNg++MeI3PGeQZuVEc+GZUQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(4143699003)(56012099006)(5023799004)(11063799006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qnLEih50NNZbAc7QSzE32R/+aNyAbfbZTfOXwMRAZG3L9JaQpWQA1vNsftr+vKQfgTp3bTv+iWudjWya0bvKhIVYgGa+imfdBSnI3YlIYu7E+KN0UcJjPpxqFTHtuP5flItaB4GDntv4gFug4Dmdf0bFyDeWMSuNNkkq+skIqGiSo/Emgewqagit0+KIHEatejMkHHXv0Uor4Gv37OMHReGLI9HgWCST2/TOV42XT0E/IZ7kAg8PYnvAzJ2akyumYUBfcu7VG8c1pfdUcJdFiB8L+arQSHMwgn5CQ3GJFhyzFxfLWujdfoCbLPKuFfRxZJw2nA3KM5tijL4F+gHqxWAy4jqQHRulEUGNqj5eEj36yuEPgZcrzMUXg0tpsEcxvUfBnzUW9fZYO561I3GFx0gS3oemQJ16lA5pN8DRnVaGcq6CHQdN2M4jDAdo5mhT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 08:55:27.4042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc3fbfd-d3bb-41c6-6b22-08df13d0410b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8612

Hi Sergey,

Le 15/09/2026 à 19:36, Sergey Lebedev a écrit :
> Benjamin,
> 
> Thank you - for the explanation, for the link, and for saying where you
> stand. All three are worth more than an ack would have been.
> 
> Sorry for the slow reply. I spent the hours reading rather than writing: the
> repository you pointed at, the two drivers side by side, and the in-tree
> binding. The checking changed what I have to say, so it seemed better than
> answering quickly. Three things below, separated so you can take whichever is
> worth your time.
> 
> 1. The licence question, and my mistake
> ---------------------------------------
> 
> Settled, by your link. vd55g0_patches.h carries
> "SPDX-License-Identifier: GPL-2.0" and "Copyright (C) 2024 STMicroelectronics
> SA", with cut1 and cut2 arrays. ST published the firmware itself, two years
> ago, under a licence that answers the question I was asking.
> 
> There is nothing for anyone to grant, and the right source to take those
> bytes from is yours rather than any third-party copy of them.
> 
> I should have found that before raising the point twice. Your standalone
> driver was named to me in this thread and I did not open it. The blocker I
> reported on 7 September is not a blocker and never was.

That's fine, I'm glad you're unblocked :)

> 
> 2. What the work would actually be
> ----------------------------------
> 
> I measured it rather than guessed, so that we are talking about the same
> thing:
> 
>   - twenty-five LINUX_VERSION_CODE guards, all of the form
>     "#if KERNEL_VERSION(x,y,z) > LINUX_VERSION_CODE", about 180 lines to drop
>   - s_stream to enable_streams and disable_streams, with vd55g1 in-tree as a
>     line-by-line reference written by you
>   - st,vd55g0.yaml, adapted from the 3.3 KB st,vd55g1.yaml
>   - Kconfig, Makefile, MAINTAINERS
>   - checkpatch, sparse, builds across configurations, and testing here
> 
> That should not take as long as I expected.
> 
> 3. The question I cannot answer on your behalf
> ----------------------------------------------
> 
> A 2100-line driver arriving beside a 2100-line sibling by the same author
> invites "why is this not an extension of vd55g1". If I answer that badly,
> the third version is a rewrite in the direction you have already rejected.
> 
> Reading the two files I can see arguments for your position. vd55g0 is
> monochrome-first, Y8_1X8 and Y10_1X10, where vd55g1 carries the Bayer codes.
> vd55g0 has real strobe and flash handling that vd55g1 barely touches. The
> register namespaces are essentially disjoint.
> 
> But those are my inferences from one reading. What I would be repeating to a
> maintainer is your engineering judgement, and I would rather have it from
> you.
> 
> So: you offered to elaborate. Please do, if you have the time. Not to
> convince me - I have no stake in either shape. It is so that when Sakari or
> Hans asks why VD55G0 is not folded into vd55g1, the answer comes from the
> person who wrote both parts.

I think the fact that the vgxy61, vd56g3 and vd55g1 already coexists as
separate files in the kernel file structure, all reviewed by Sakari,
could be seen as an implicit agreement. They all share some common IPs
but are pretty different. Sakari, if you have anything to add, please do so.

Sorry for repeating myself but I personally think having everything
separated is better for code clarity. As the register map is
fundamentally different, you will need an indirection map pointing to
each register i2c adress for each sensor, like shown in Peter's serie,
i.e. :

  expoure_register[vd55g1_sensor_type]

While I appreciate the idea, IMHO this boilerplate adds unnecessary
complexity and feels pretty error prone.

As you mentioned both sensors don't offer the same functionalities, so
you will also need some kind of :

  if (vd55g1_sensor_type)
    foorbar();

On top of that, it makes testing a bit more tedious as each change in a
generalised driver might break the other sensor, which you might not
want because, well, let's say you made a change for the vd55g0 and don't
have a vd55g1 to test you didn't break anything on its flow. This issue
disappear if both files are separated.

I'm also a bit concerned about the history, since an heavy refactoring
will alter the git history and make git bisect harder. As we already
have a v55g0 downstream driver, that I think is mature enough. I see it
as a better idea to use it as a starting point.

This are all the downsides I see while typing, of course I might have
forgotten some, but you get the idea.

> 
> If a separate driver is right, I will start and send you something to look
> at. If the two really should converge, that is worth knowing now too, and
> Peter's series already points that way.

Thanks a ton, I really appreciate the work you and Peter are doing. If
you start this journey please add yourself or/and Peter as MODULE_AUTHOR
and in the maintainers file. Don't hesitate to contact me either.

> 
> Sergey
> 

-- 
Regards,
Benjamin

