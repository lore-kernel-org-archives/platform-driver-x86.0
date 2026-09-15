Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB874AE13F;
	Tue, 15 Sep 2026 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472890; cv=fail; b=NiGxg6CxFnq4IMUlLbGl9mA5kFYXcjv7qiYs/VD0yrQyChDDxAXPotG1KbXVnA2bfBV/HL7DVR5W1qsz44QoupAdpCly8KP5PxocXwcRIpTLywr92azKUtD/R/en80D9TOx4oMeucXCJGEWMuqb6iSc1iLHSnJAftkFxs/RpHGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472890; c=relaxed/simple;
	bh=KMM6eL0UbZzjA6KrzI7IpmUxEQW0M+E81rqUznoqvUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LiFGiRn/5byJSIplO6pCpG6c34FnhcJu8qA4fC+UN1jR4JPYgzt0GhdNK+6bSIJ/P/LqldZ1Fg1Z8/J1v+RrOnk7UHa1hJaWWUbt/kmghA81JLaH0QYJr7JtXubOJO3HPChohlcbWROK4Ag1di0mrfj523M52AcKHVjGyz8taDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lTsBCRu8; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lTsBCRu8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzlKMmctVluHo7GCPF23ITjjf1QrLLGy5q1685xaMkH4FRf4E5+CyQPOsbLI5pw9wJ2VTgIx1cx9KnlJ/logeG2TXuk+ZL/odHsXoL9JGrHY3co7gpNNYsUinL7XXtyjRKLxtbsMUISUJpOZ2+dEHMT3UDsfAcN1/6y+KVQrz4FUmHsdPa3XWElj2mk4qCbsGFT+y56s73RIOcteelsZIapEGQctmIAvaE8TIy09CbtyIn+Ksk7+X6LKdsgN8zB6xtEOXCORbjuALG2Prs+Nb397aS5A6UV2ZsKrNPMXwP6fCWW6CO/VjxeRF09q0q4WjwnrUAEXrlfOv+aAH1l/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaNZAyVMr9TQ0PhI2P+tfwgddyQY1zp845jlWmkLxoE=;
 b=RQnSXLi+zrmO+zGnkkSy8pXgBE/Q++q3YRI7Tw2ZJ8Z1NnpASMKeSe+65E+n2wtu32uMRPL3fbRPUBTyxxOFw2Ggy2BK3risu5oqV0HIV3doh9WyW9+UHkhDdhY4ijSLuMk6R7bKWeYseB3EtMG/omqXjRW4bQqRbMVuEAeXjSswwMkDP/xH6iTFqAl/hLj4RBO7qlyPyRsNXBYMaDjsSlwk40+XPCi2YlJSQQgHRZWRN7gI/l+78nkVmOKdd4z0jpr9ce/Xk3mwalMvS+izj3cb9G52UklJcdn2MNIktmBpgNb0zlWnSbKwvPZyv3VjR4PfMKvh3g7yH+7O2tgW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=pm.me smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaNZAyVMr9TQ0PhI2P+tfwgddyQY1zp845jlWmkLxoE=;
 b=lTsBCRu8mFzkDoh0Tf+UuprzfxeivHv1uVjH7UDpIuP6mYkbgOpQ73mG27VJzW5NGC4zYgKGKH03mBj51LLPJ6s43LVumNtlfabRlEpiTubhYBYo0NDod8DTq8rzVjbS2rLRocTJJE6piFmMx/PMGRU/3o6nXM12oWOrFOtgLRqcs8RJYMDLWl3JoIeh0nsD0kge6mGROkFCVtFD4SzRczljZ3Kti0Gn/UvrxUcM/cs/XF6dhrEsWBh1tLM1amOHYu1S9tNDQktJLa/21fRphQxwI7bw8Mk6bfp+Ch+MFCO30scAPzNeCN5CsUCkqjVfWQnkNFEKPDGGftMLwSPDOw==
Received: from VIXP296CA0021.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:36c::6)
 by DB9PR10MB6714.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 11:48:00 +0000
Received: from WA1PEPF000099D0.eurprd04.prod.outlook.com
 (2603:10a6:800:36c:cafe::86) by VIXP296CA0021.outlook.office365.com
 (2603:10a6:800:36c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 11:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF000099D0.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 11:48:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 15 Sep
 2026 13:54:03 +0200
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 15 Sep
 2026 13:47:59 +0200
Message-ID: <1e798c12-2272-471a-9e71-82188439de82@foss.st.com>
Date: Tue, 15 Sep 2026 13:48:03 +0200
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
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20260915100722.38504-1-lsa.uz@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D0:EE_|DB9PR10MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 855fd9b3-a9ad-4a53-77ec-08df131f3154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|82310400026|36860700016|6133799003|18002099003|22082099003|13003099007|4143699003|10067099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	g2TO6f+/w5WIkpTV7ktE6CZAeh6YvYiTATIgY48jrRuFb0tVijX+zxPxZNt+47VHGyvzdnYrHzm/g4Hi7pPbOrlV48osBiZuI6uxtY9x4QluaK8hK7T2sl/nvdv2Ideo5O4fxFROK/zkt9tz/pLj3mIqgA4T5xsG4LHRECzm7FLAr7Cm9eiCbRu9uOgQSbi1w7182wk9i9xVYk5IdwUMM4TAXIlMoKKkRg/C4Yl8CChzSp7V141eA5AMMpqmm9tqu/wYMEXI94UAiNYtpLYzuB08Tqdhh+xstG9W9QGC2UxqGFsXx64Qlelf0wbPLjs0i4GGO6WP0FnI4AM/pNp1CmCVbHJKiQ1Wdd1N1lGCnPF4g8iqb7bQdOuPGhGFvUEu5duLmcjilSxNECQXgOcPLrcSsyBDAuC2oH3YQnm8CLjes3W1n/0DrtbUaXqClfNR195nKPr0ZnFiqO3tMGbFhC38TkNXV5ZckHh3Esp5rJgSFj1FLr796oRrxfbMrjz4VF8WnQ3p24j6xXVAAPBALREiY886h95ce2npPKpfMUuiUtfiQG6JOEszLNyPkGAJkfn50IGZsmk0dNlnkDRURbFkTLzxc86BxhBS3FCFvh3Sd7RYoop0qNy8Es0GshMKAyjTEJkCoTxC2LXyrtuxoeATQu1Ywlpz77hjNBoAytLaSuFThBiBjzNU0ZcR0kSKcorKvWxCiE77c5DD9RqZ2A==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(82310400026)(36860700016)(6133799003)(18002099003)(22082099003)(13003099007)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eLJNt3vnBXQ7RUZuELUA047zKTP9q9DivrMf3O+gHWXQBRO+yzcG19tTLbPkPwsLW1T76kA4taKGNaa0gVUgaWDN6Mh4Ax6LZDKfZhzdmfIDLWKLd1LH5iU0YBlhpK3UGLveRL+Kxl28AWEbS9GqV7b70Td3bnOL2RXbjPLDjJBgUGSfRsemxn5VHnIQQ2TZd/SyLkKUGw5DsZ7a2pcZV/RRtLP4MIL0I8oFPd5b3HQY5OISXlB3veZNu5Z2r+Uz/BpctybykitMapI/fmrw2ZVjdggs2vdytvxJzUX8PqZgpEPPYxpadVcOrcFGf8Oe00/c6z1lW7DmbQ7nqRN+6yI+XGNv/pLkbXDDOko/Uw9jr9VgiEyLs1TtW8Br5utWgAHKAu++KLJFThmNawwR0UyngXJzkxfTmN28U/ETWLKNyNviicN0Zsg5m0ccelvm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 11:48:00.1367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 855fd9b3-a9ad-4a53-77ec-08df131f3154
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099D0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6714

Hi Sergey,

Le 15/09/2026 à 12:07, Sergey Lebedev a écrit :
> Benjamin,
> 
> First, an apology: I wrote that badly. Reading it back I can see it lands as
> a request to move vd55g1 to request_firmware, and it was never meant as one.
> You have had to defend a position I was not attacking, and that is my fault
> rather than yours.

No worries, It didn't feel like an attack of any sort ;)

> 
> What I meant, and should have written: the VD55G0 firmware has to reach users
> somehow, and I do not mind which of the two mechanisms carries it. Your three
> reasons settle the mechanism for me - built in, and no more about it. Peter
> preferred linux-firmware and I relayed that with his agreement; whether your
> answer changes his view is his to say, not mine.
> 
>> I'm not sure I get you. Is this a licence problem of some sort ? Could
>> you rephrase ?
> 
> Yes, and it is not about the API at all. It is about who may put ST's
> firmware into the kernel tree.

Ah I got you. I'm not a licence expert in any way but since we already
disclosed the firmware patch in our out of tree driver as GPL2 [1], then
I guess it's free to use it as long as you respect GPL2, whether you're
from ST or not.

[1]
https://github.com/STMicroelectronics/vd55g0-linux-driver/blob/master/vd55g0_patches.h

> 
> vd55g1.c raises no question. ST holds the copyright and ST put its own array
> in its own file, GPL-2.0, 3512 bytes, no request_firmware path anywhere.
> Nothing had to be granted, by anyone, to anyone.
> 
> VD55G0 is not in that position today. The bytes this series would carry were
> extracted from a third-party out-of-tree driver, by people who are not ST.
> That is the same question whether they land as a C array or as a file in
> linux-firmware - the mechanism does not change who owns them. linux-firmware
> only makes it audible, because WHENCE asks for the grant out loud, where a
> built-in array lets the same question pass without being asked.
> 
> So there are three routes, and only one of them is clean:
> 
>   built in, sent by someone outside ST - which is the series as it stands.
>   Works technically. Leaves the provenance question unasked rather than
>   answered.
> 
>   linux-firmware - needs an explicit grant from ST in WHENCE, and you have
>   now ruled out the API change it would require. So: closed.
> 
>   ST upstreams VD55G0 itself, with its own array, exactly as you did for
>   vd55g1. Nobody outside ST has to ask for anything, because nothing is being
>   redistributed by anyone who does not own it.
> 
>> By the way we didn't upstream the vd55g0 because it requires a bit of
>> cleaning, but this is something that could also be done.
> 
> That is the one I would hope for, and it is worth more than getting my own
> machine working. It is the only route that ends the question rather than
> moving it. And it puts VD55G0 on the same footing as its sibling, rather than
> leaving it the part with an awkward history.
> 
> If the cleaning is what stands in the way, say what would help and I will do
> what I can. I cannot clean code I do not have. I can carry the mechanical
> half of it - checkpatch and sparse, builds across configurations, dt-binding
> checks, a review pass. And I can test on hardware you may not have: a Surface
> Pro 11 where the VD55G0 is the face-unlock sensor, so it is exercised by
> something real rather than by a capture tool. Peter's series in this thread
> already does a good deal of the genericising, if any of it is useful as a
> starting point.

I still stand against the refactoring and generalisation. I can
elaborate on that point if needed.

Now about mainlining vd55g0 out of tree module, my current priorities
won't allow me to do it anytime soon, but if you want to start from the
out of tree module and clean the driver to submit it I'll be happy to
assist. On top of my head we need to remove the KERNEL_VERSION guards
and move to streams api. Having the vd55g1 as reference is also a good
idea. I can test on device trees platforms.

> 
> Whether GPL-2.0 on the surrounding code carries a blob with it is still a
> licence question, and still not one I will answer.
> 
> Sergey
> 

-- 
Regards,
Benjamin

