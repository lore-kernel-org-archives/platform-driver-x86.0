Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121D73081D6;
	Fri, 27 Mar 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625798; cv=none; b=fxl/Y30K1LYT9qJZbm1jJA4b/c2ui1R5BafDX+5CqJERjwNPLsHSgEmUgWYHKvrclPvSGVhnB+lMoBFcwYVl3jF7LMjLCy/X+gen3V/TG4w7FYoCR3/x4GSXqTiJJR/g3CCkhh6MdsZG6Q67O/SOYRbwNus3KMawUDEqunOXKG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625798; c=relaxed/simple;
	bh=PX/AiGiOaLbq65I3d9bgwoLDuppZEpzjy8vcVM1G1P4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q0sLItXigFv57GulQeucTPd+sekQaxeRKTJEocU98eMnSFvU+JoyaNJi7Qg+1ypMiC1UrjmQpHkCmxnz6n3YAzMbDUCQenfTXWhB+u8WhLpWtZceU20QDTHM8/k3KE+CPBdEMu8Fv29YV39ll3oVsJc3peNxgh0sYg6LKPZ+AKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VwI7p1VS; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VwI7p1VS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774625793; x=1774884993;
	bh=l0TtS5B9Qvw7HzIM0w4ocrgzCQO1oVw4r8AiPt3/SJA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VwI7p1VSukEmnf3tE4RBNZ+TWnZkBOSTbWCDYUHAx6BF8mIGkyLEC+2hm1Q2b3Ar/
	 kGWsaLg5oO7MTTvLPnIe9/w1w50qbszajaBXoIzApr1ydan8Z1TeVjeeePXvDDpVFS
	 oHq5igW1N4YxiZFvrW8gvQgkCzQRg7rzXdd1lmy0yL5RKvmHXzqJrjUfX522tXrpOn
	 aqyuRYe6XknSQTBHEIPycRpAL1iyrkRYECKx0ZqLYBeTiSVG0MO0Y9MK9UHy5dBnSG
	 YrsrEiMzk93diWAvoR0ykL/QQNbuTX9wRry+sGwvix6m8OVB13+TNXxN0VJ32TicdO
	 qI1QA7nftomtg==
Date: Fri, 27 Mar 2026 15:36:30 +0000
To: hansg@kernel.org, srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, m.wieczorretman@pm.me
Subject: [PATCH v1 0/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
Message-ID: <cover.1774625521.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 3b32e32d2221dd43a1c92500f64c13216b6a0d81
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In TPMI devices, an instance is a feature copy that's local to the TPMI
device. It has its own control and header registers and it is tied to a
die that is a unit of uncore control.

Uncore Frequency Scaling (UFS) is a special feature in the sense that it
can have instances further split into clusters if there is more than one
per-die.

On older systems the domain_id value exported in sysfs matches the
instance value, as in it is unique in the single TPMI device scope. But
on newer systems that can have multiple clusters on a single die, the
intel-uncore-freq driver behaves differently and the domain_id is a
globally unique value - unique on all TPMI devices. Therefore it's
difficult to match a specific instance to a set of UFS registers for
example visible through /sys/kernel/debug/tpmi directories.

Separately exporting the instance value that's local to a TPMI device
and not globally unique can help restore the now lost value association.

Maciej Wieczor-Retman (2):
  platform/x86/intel-uncore-freq: Rename instance_id
  platform/x86/intel-uncore-freq: Expose instance ID in the sysfs

 .../uncore-frequency/uncore-frequency-common.c  | 16 +++++++++++++---
 .../uncore-frequency/uncore-frequency-common.h  |  8 ++++++--
 .../uncore-frequency/uncore-frequency-tpmi.c    | 17 ++++++++++++++++-
 3 files changed, 35 insertions(+), 6 deletions(-)

--=20
2.53.0


