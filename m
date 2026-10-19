Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CA54F4CE8
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 13:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416184; cv=none; b=dKoemvJRqnraxjKdpJbKf1N1w4605SZB44/HnGkXohm6Xr6d+NrN469CyWDhUqhgspGVBTui97GGbiBtu61vRVshsX5pChdQGVfhWL6VRbaN5Jkg5ctM+Z/bBM9Q5D7QPzgLDR9qEiYBBRqBQjZ4f5TMQNcuzOMeCtylCFqGCTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416184; c=relaxed/simple;
	bh=9jueSkqmYlMHIeeg3lBLkqecovEhWPcOyvJaWRBbUCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cY+/xOb0AoJIOKXH4aAFx7DREqpVCfiihIa0d7ObSOy+y5XAHBrY6p+xoGQb7Oc0K6zm3EQ9BOWs9ZlGYEiAKj4Uf9hQAIEo4L/uo7v6UQAxKZGdbX26roJtLnGVlycQRgMhy73O4oaHzyAiV0886abkyuBghJI/zDEf80VaA2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+VW8taB; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+VW8taB"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc758830601so1435752a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792416183; x=1793020983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9H/VnVxiusPMdBOAZJp3aIaXjPwvC+3D1EpnDU0RU8=;
        b=a+VW8taBeuR9F0x+cjdTRiyfB1JWcjyyjNZcslw65vJbvesuJq3S55cCUvvwxvzaaq
         u85kVOUGyvxZIqCsnMBBXZcXiBUbOTXMcyokxiyk3yZAKLHHxbW7X/Z0vIjy6JzQvVHb
         W6pJyvWVvpcNdTCEcpEPlWsR/74XF5b2KLN32zcO0XXeXoCcPPjvTxuHsJ23JAr6SrpC
         OGWPL5aQKE7wtdIwShpz8mtfsithoTdJY+qEcnRLwRGTt77LqY1RaaX1SaOup8///j7g
         1clbiBWlGmdEapuwA3jQ71Y1OCqlEJIQAIg5Aqcnhmx22S2t0Jsv+aTP3QGQomK0qFKR
         Okfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416183; x=1793020983;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q9H/VnVxiusPMdBOAZJp3aIaXjPwvC+3D1EpnDU0RU8=;
        b=QnY+fUvf9mlc06sPc33onZW/4EnzAHb+X6mPJM3uyXvnsOFIpItmSmMUN8zqnYs12x
         1YXs4Shdf+y7aLffJgBef5AMsdELa97J+AOa+OroitZ3tCiL9qjsizH538yezBs+aOZo
         OG15EN1lP/f4epYfflc0TYquYaa9fpcj1CtrzD0FWE/P4MYLpIYIA8wcN1KfrdF0Wz8e
         vc1uts0jRt7OInHpvRMzjWsHKOcDnFVgP+rbawLm9Jr/0FMoYsWAbLE20kMSk4utuiH0
         fqJRs2Wz56fpWhY8A2JxlzD7RD1dWt3a3LaFF5Ejoi28ElS3EAnP4OSJcmLG2IV1mG9m
         b5cQ==
X-Forwarded-Encrypted: i=1; AKwUvBy89LWP9U4i+FBoOVOeSWgBBhYAtukT12GRjJ1s9xh5miIwP8aOJcAOFydlp/EzqvDfOnoln/NTE3Uz8mLyEqUVpCxq@vger.kernel.org
X-Gm-Message-State: AFq9FYKgCD85MI/dGUVIl4HUAHfZ1PPWFeRtvTNdFQUDYyrXYUCYFFXB
	BcpMkHivjilY+1+3XOqjRdmMLb0eH+C0hwRMoSTDxQyf5hQIwWKGly1k
X-Gm-Gg: AYBFou1jZ8JkqKZ5g9Kv0Rt2lrydcx1v2ZjqRNfOwrhCx55W64nRafqnov+s7hOSHaD
	z2XwFNSlvslsP14FCYKAi1kxdu2OLwrYtuj64gKnuPJe4zTYhZFbjkleQicKhkK8qTegq6lU4x/
	y25yHfJvFCHXctzRMvGrF2Kd8Z+/E3W8UICUAcgrxaVGpSzWhyn2CNVzOR5LCGf1F9ma2oY3mbx
	KIKydsGxK5aNo022mW/BxtZprsQkdVieOGYO9K23tLop3rQc6CxQTLHoJA+ap9Z7dAwOfn2gPUs
	7iq3fJUGmqVAfBr6mrFv/rkOsfrFmRq9fyopkF744eIsizhm2U3ZvxCSWiZe9DJOjLoMirVsfGC
	4FRZSXta2v+CtDTxAaLVTSIz/rCusfEYH5uUzE3NSLtVGmbieIxqgqKQ5TWZ42UXeEDuJYD6SSk
	c9Ev+NezdmrlKktoOx1rIfOdHYtORKqB/qSgGw10Xd5DwZK+0JMfaI9EbEV/cVbbkNcL8UJ8BcE
	OoZ5g==
X-Received: by 2002:a05:6a21:8284:b0:3e1:c08e:38f1 with SMTP id adf61e73a8af0-3e2262511cbmr7173396637.14.1792416183098;
        Mon, 19 Oct 2026 06:23:03 -0700 (PDT)
Received: from [58.206.202.11] ([104.28.215.70])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017244sm3871323b3a.47.2026.10.19.06.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:23:02 -0700 (PDT)
From: Haoran Wang <haoranwangsec@gmail.com>
To: Tony Luck <tony.luck@intel.com>
Cc: Ashok Raj <ashok.raj.linux@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, haoranwangsec@gmail.com
Subject: [PATCH] platform/x86/intel/ifs: fix slab OOB in ifs_pkg_auth indexing
Date: Mon, 19 Oct 2026 21:23:00 +0800
Message-ID: <179241618048.5916.3224181188475430685@whr>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

scan_chunks_sanity_check() indexes the per-package boolean array
ifs_pkg_auth with topology_physical_package_id(cpu).

    curr_pkg = topology_physical_package_id(cpu);
    if (ifs_pkg_auth[curr_pkg])
        continue;
    ...
    ifs_pkg_auth[curr_pkg] = 1;

But ifs_pkg_auth is allocated and zeroed by topology_max_packages()
(core.c:128, load.c:330), the count of *logical* packages, and its valid
indices form a contiguous range 0..N-1.  topology_physical_package_id()
returns the HW physical package id, which may be non-contiguous (e.g. on
VMware VMM or any platform/firmware that assigns non-contiguous APIC
package ids).  When a physical id >= N, the read (load.c:344) and write
(load.c:355) go out of bounds.

Use topology_logical_package_id(cpu) instead, which returns a contiguous
0..N-1 range matching the allocation.  This is the same fix already
applied to the ISST driver in the same subsystem, which uses
topology_logical_package_id() for its per-package array
(drivers/platform/x86/intel/speed_select_if/isst_if_common.c:301).

Signed-off-by: Haoran Wang <haoranwangsec@gmail.com>
---
 drivers/platform/x86/intel/ifs/load.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/ifs/load.c b/drivers/platform/x86/intel/ifs/load.c
index 50f1fdf7d..1563b47e7 100644
--- a/drivers/platform/x86/intel/ifs/load.c
+++ b/drivers/platform/x86/intel/ifs/load.c
@@ -340,7 +340,7 @@ static int scan_chunks_sanity_check(struct device *dev)
 	/* copy the scan hash and authenticate per package */
 	cpus_read_lock();
 	for_each_online_cpu(cpu) {
-		curr_pkg = topology_physical_package_id(cpu);
+		curr_pkg = topology_logical_package_id(cpu);
 		if (ifs_pkg_auth[curr_pkg])
 			continue;
 		reinit_completion(&ifs_done);
