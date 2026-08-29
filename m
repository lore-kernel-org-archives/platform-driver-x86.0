Received: from www74.your-server.de (www74.your-server.de [213.133.104.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13F340F749;
	Sat, 29 Aug 2026 16:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.133.104.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788019813; cv=none; b=UXDziutHQgJHIQ/FuxWRnSZLE0Fj67wFaQUF6m4NmMvbUXiY+yD1UrhZLNCVW9X8UXbc6so0ChY7pa/2Y/LQp0A9cy8+FLw8TPVhDzRT13tFDrqn1oQk+GCXc1ziJ605sor8EN4Ci8c8ZPc2v7IcaHXmwxzfsQEWFvb/Ni7gJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788019813; c=relaxed/simple;
	bh=NgOheKEQojj7ZB5mxcRlKJrHrMPsNR/KQAFrGu4KfEo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=mo8JfZOLBbePp19ttOlcQtSlmkuzC5ozuSABi9JgwGcTQbXkZG7bSrIqvd3aW74JNSbl4VdfOjazrxmAEgszhGUEKwX7YYsjA8KmS36ZUGZRAA7N2HWkPw8L1lvFaczhP/Z4jA563tSoTOQy22mRsY2Aqoz2ipu3gxIuiXNrvOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info; spf=pass smtp.mailfrom=computerix.info; dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b=krRlffmT; arc=none smtp.client-ip=213.133.104.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=computerix.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computerix.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=computerix.info header.i=@computerix.info header.b="krRlffmT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=computerix.info; s=default2306; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=5JPZHw3lLUqythwjkdXzN3t8neOTkjT3tYApG+tbo/U=; b=krRlffmTklLEIHcAP+vpqnhbwv
	1f/biutkhfptOVnK7o8LVRFgSqhg1mvgH4fGH/H/D5dRh3dpwBsq+YuGVvu5zONUV/P+fKSQZjwfJ
	o5s8n0GXxWb1V8v5XS3SeP3Srp9ow+NaU9XEN7Z5GIyfMNnF7KEPTV9WpmauJJX8aNFPjJ8wVOB4w
	DYjUqtBBL1TQkvMxWSf4VqnTJ1KcgUdhUP+K2Kx8G5ZlGSbYH630GDWRa6ww2zId85PgOkVE/N4B7
	3VSKC0EO7v2FSWnQySkrkHUbVO3EcCHFtRLFuRsp+Q37rsD3ZX7S+9nTSB9E5/5UZwQGDpEksk972
	NnaMUlKA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www74.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x0LCC-000E4N-0Z;
	Sat, 29 Aug 2026 17:42:16 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <klaus.kusche@computerix.info>)
	id 1x0LCB-0003X5-20;
	Sat, 29 Aug 2026 17:42:15 +0200
Message-ID: <2180ea5a-eb28-4152-8d4d-cd00b0c24b2e@computerix.info>
Date: Sat, 29 Aug 2026 17:42:15 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Mario Limonciello <mario.limonciello@amd.com>
From: Klaus Kusche <klaus.kusche@computerix.info>
Subject: Cache-aware scheduling does not work well with amd big/little cores
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28107/Sat Aug 29 08:23:59 2026)


Hello,

I'm running linux on an AMD Ryzen HX 370.
I use Gentoo and compile a lot of things (including the kernel)
with Clang using full LTO, which results in a single LTO process
running for minutes on an otherwise idle processor.

Before Cache-aware scheduling was introduced,
AMD's pstate driver informed the scheduler about big and little cores,
and the scheduler always moved those LTO processes to a big/fast core.

Now, the cache-aware scheduling takes precedence over big/little
scheduling: All big cores form one L3 cache domain,
and all little cores form the other L3 cache domain.

When a process is started on a little core (and LTO is in most cases),
it will no longer be moved to a big core,
even if it runs for minutes and all big cores are idle.

In case of LTO this hurts twice and badly
(slows down LTO not just noticeably, but dramatically:
In total, any compilation with LTO-linking takes much longer
compared to earlier kernels without cache-aware scheduling):

* The little cores run slower (3.3 GHz instead of 5.1 GHz).

* LTO linking is very cache intensive,
and the L3 cache of the little cores is only half the size (8 MB)
of the L3 cache of the big cores (16 MB).


So if a big core is idling, and a process on a little core
is long-running, big/little scheduling should overrule
cache-aware scheduling and move that process to a big core,
even if this moves the process to another cache domain.

Greetings

-- 
Prof. Dr. Klaus Kusche
Privat: Söllmnitz 32 d, D-07554 Gera/Söllmnitz
036695/859909 klaus.kusche@computerix.info https://www.computerix.info
Dienstlich: DHGE Gera, Weg der Freundschaft 4, D-07546 Gera
klaus.kusche@dhge.de https://www.dhge.de

