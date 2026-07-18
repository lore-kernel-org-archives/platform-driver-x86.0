Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69793DCDBD
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2026 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784393799; cv=none; b=EtEEO6Vy5PiK4r06iFsGIEI1gmNBpgejg0d2UuuwA5NOt++x8nACabCJuY9ECd8LHRQZjr0n1igkj5mHRhQkm9SyNIOVyNMQMQUclITfr5xtEd+rUKX9EDMCJekg5eZJtmtstw75UTKb6J6KNcvuM/QJUpkgBMayupsW1dgzg18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784393799; c=relaxed/simple;
	bh=9YB16brPyNPuuW1IStmVHGrD2spc3gWHgY0E+r5+Mfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BpvXQi9m/U0VUtmPRviL2ZCimJltp4vYHsWVuSLzslkfex9mb9nxbuEoTKNn61w7oKPT9toeYfQ7sFhlTrHHfgGuuX26wQ83/rcgCUKwPqooVrOQpuJUSF1FWGdN2XkaQATUXylnyd/76lul96MwCTRn3qdzH/cxaf2L59v4eko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=v8elIt4h; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="v8elIt4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784998597; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	References:MIME-Version:Content-Transfer-Encoding:Feedback-Id;
	bh=yg2pGrJLB8HFYTH9GcIe9QXXOQJKTfygaoWIW5tmY9s=; b=v8elIt4hs1LqL
	ZbOzPKlm1JtjUgxp6w4WiPX6eSWNHYHRpKwxUDUkK7R3ViCk3ctt6/iillj/r6VM
	2EnxT7TgMv3h8AfNFEwfndknNqVuHo10yRyJoMD8e3Ld3b+0Jz6eVj6Fe6YipIPt
	twsuTK3rLXYDkyvn9dfitAbrjtZCC0=
Received: (qmail 2893999 invoked from network); 18 Jul 2026 16:56:35 -0000
Received: from 197.145.178.94  by turbo-smtp.com with SMTP; 18 Jul 2026 16:56:34 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e63be8304c2e007-007-4288be1d
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, linux-doc@vger.kernel.org (open list:DOCUMENTATION), linux-kernel@vger.kernel.org (open list), platform-driver-x86@vger.kernel.org (open list:LENOVO drivers)
Cc: Weijie Yuan <wy@wyuan.org>, Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH v3] Documentation: fix spelling typos
Date: Sat, 18 Jul 2026 17:56:15 +0100
Message-ID: <20260718165616.1923610-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <alukuB0r73qfc1PG@wyuan.org>
References: <alukuB0r73qfc1PG@wyuan.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Fix 'Minumum' -> 'Minimum' in lenovo-wmi-other.rst and
'maintainance' -> 'maintenance' in housekeeping.rst.
These were flagged by checkpatch.

Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>
---
 Documentation/core-api/housekeeping.rst        | 2 +-
 Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
index ccb0a88b9cb3..71ba5d86f249 100644
--- a/Documentation/core-api/housekeeping.rst
+++ b/Documentation/core-api/housekeeping.rst
@@ -9,7 +9,7 @@ extreme workloads can't stand, such as in some DPDK usecases.
 
 The kernel work moved away by CPU isolation is commonly described as
 "housekeeping" because it includes ground work that performs cleanups,
-statistics maintainance and actions relying on them, memory release,
+statistics maintenance and actions relying on them, memory release,
 various deferrals etc...
 
 Sometimes housekeeping is just some unbound work (unbound workqueues,
diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 011054d64eac..65cb78ef285a 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -163,5 +163,5 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
     [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")] uint32 FanId[];
     [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
-    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
+    [WmiDataId(4), read, Description("Minimum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
   };

base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
prerequisite-patch-id: c8aee5eb39e3cd6f2b2f28c82163565665288d2a
prerequisite-patch-id: 60ad32e9f0e74902635d7886b97c4225ac8dc5ce
prerequisite-patch-id: 76849a9365b2ef77eae25f4ee42c11f124b1ea0d
-- 
2.55.0


