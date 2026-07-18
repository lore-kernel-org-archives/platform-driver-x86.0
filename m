Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5A43CE495
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385628; cv=none; b=o/VRjY2YHQuAtHp3p8/c5O18137byMpcNH4GTBhw9LK247pU8hLhHlZ+MSS7fv1bWX1ohMRHnNTKhwvCdDwRYyKJWvyf6LKcUcGdkgQ3ZkIFc5SVcScuR8t3svlOHxusgs5cpYCphKFX+msDYLB/iAvpqxi4vHvb/EaoV++w9as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385628; c=relaxed/simple;
	bh=j39GOa3PVc1fWFVRIS1uufyG4HQ+wA9fG/2mMZMMEv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U0ihHwE0oyVhUXDxv2bAKDKKWo6sAJo822vinrmB2S/rZRLcTAm2PDDEkxsxpXKM6Vab7ISg7DuPNdpaqrasknoXt/bh4eMi5teA1Xq22Qhto80se9UcDqYCS97bA6ytWlU3g/2Omn/eFhg3ziOwZyNKqNG4uLnuSVs/YO0Biqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=muQdEw7L; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="muQdEw7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784990425; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding:Feedback-Id; bh=gEVJueUvVmiBnGL04oQrnQ
	VuiZjMXN26cNk25Dk652w=; b=muQdEw7LH2YJBu6KWxxA9eSZeap7iIBnfncCmY
	oBg/Qbbs4fGO7pGF8gnlge9OxGWSfacUpLccmBwSIZaZXLIDmrCr4I+D5BAAWwvm
	tZEbBNwV7I5yvBy5EIoSWYoQwzAHAep6U/wuDw6uK3YKsRX8q0saPizy8j6bybYZ
	PREhQ=
Received: (qmail 1927064 invoked from network); 18 Jul 2026 14:40:24 -0000
Received: from 105.76.9.106  by turbo-smtp.com with SMTP; 18 Jul 2026 14:40:22 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e639f574342e007-007-4288be1d
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, linux-doc@vger.kernel.org (open list:DOCUMENTATION), linux-kernel@vger.kernel.org (open list), platform-driver-x86@vger.kernel.org (open list:LENOVO drivers)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH 4/5] Documentation: fix spelling typos
Date: Sat, 18 Jul 2026 15:40:03 +0100
Message-ID: <20260718144004.1880551-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Fix 'Minumum' -> 'Minimum' in lenovo-wmi-other.rst and 'maintainance' -> 'maintenance' in housekeeping.rst.
---
 Documentation/core-api/housekeeping.rst        | 4 +++-
 Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
index ccb0a88b9cb3..f4dc5f9337b1 100644
--- a/Documentation/core-api/housekeeping.rst
+++ b/Documentation/core-api/housekeeping.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ======================================
 Housekeeping
 ======================================
@@ -9,7 +11,7 @@ extreme workloads can't stand, such as in some DPDK usecases.
 
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
-- 
2.55.0


