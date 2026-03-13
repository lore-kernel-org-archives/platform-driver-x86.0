Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CCD381B13;
	Fri, 13 Mar 2026 21:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773436005; cv=none; b=QQn196WzGlFVx1S9rmh5K0Vasr1+O6N1BX9J46UiyLGJlIYSWWgicoVdxVoMpTfYIIz/7oAV6OWXGL8QrC/qTt1OhrkmwSo7NhBnjlCyNGqfM7VjunmXMxyCGrX/fMmvEPGfjtgK2MkdTP01idlGQiNV+pvt1gRI0p3FCCL6xnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773436005; c=relaxed/simple;
	bh=XAWtM2q3EmT2ZNv6iVBuhG0lYX2PO0uGucNM3PV6lvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AquFkJap73kG+wJXqYnF0AbrR1JK0DJxTBNEw5w0B7ZMOcqEVQTYUwG0TRtX4rijXmxNv5cAelC5QdcqJ+Rc52FB6oYYMhEI4jcy1TzGKY2et4j+6BZB7+4y6n7yvkccBQdROWsZICqMKk+Gg1ywRORT2tRZp9yrVhSCkaMBnuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsJh4M7H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsJh4M7H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5C2C19421;
	Fri, 13 Mar 2026 21:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773436005;
	bh=XAWtM2q3EmT2ZNv6iVBuhG0lYX2PO0uGucNM3PV6lvY=;
	h=From:Date:Subject:To:Cc:From;
	b=MsJh4M7H78hsZSqNuFhnxZZGICpKofkepNOWMbgz3Olig3STJE45uzd1FQFPf0HHI
	 NZAa+6ldnlafYRUWYgWP4wSZ0SRsC03j857sOfav2XS3RGdFDsbEOcPAN0+0uG101a
	 UsAzyrdiGogxsudKCiwU+pswEKzIy/Sw7y7JHQzJMyn7xi6f2B5vAiN7jKkuw2whuq
	 L2q8zKNvgehXk+v7f7I2HyADBNw7kwIZErnBefrXY/V3DJVW9jM8iV7L0VZC+keZOo
	 j7Q2aIXq/eKxDxxn3WA0msFdUCZvUmlGcCHnlkIK4D++2RgO4L/M9ecSPCJKkKaLgt
	 AARBoO+O5NJ/A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 13 Mar 2026 14:06:34 -0700
Subject: [PATCH] platform/x86: lenovo: wmi-gamezone: Drop gz_chain_head
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-lenovo-wmi-gamezone-remove-gz_chain_head-v1-1-ce5231f0c6fa@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNUQ7CIBCE4as0++wm0DZqvIoxDZaRrhEwoGja9
 O6iPn4P889CGUmQ6dAslFAkSwwVetPQOJngwGKrqVXtVnW64xtCLJFfXtgZjzkGcIKPBezmoW4
 kDBOM5Z22/b7XylitqObuCRd5/66Op7/z83zF+Pj2aV0/sMYdeIwAAAA=
X-Change-ID: 20260313-lenovo-wmi-gamezone-remove-gz_chain_head-71d48410ad10
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=nathan@kernel.org;
 h=from:subject:message-id; bh=XAWtM2q3EmT2ZNv6iVBuhG0lYX2PO0uGucNM3PV6lvY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlbapIaP3/4YCEmPu2CSE+p+cS1u1IaPItc5pw/X/JKP
 zDdoM67o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkuT7D/8oFv+5c2ZVueXS+
 kXnYojuTy1Vz1tyVXb9Kl/95zr9D0l8Z/ilsmz6j80yb/7U/X9ua14Yo3DfoL7lv9nzmBzb/vMt
 NWpwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After commit 1ea4b473504b ("locking/rwsem: Remove the list_head from
struct rw_semaphore"), which removed a reference to the variable passed
to __RWSEM_INITIALIZER(), certain configurations show an unused variable
warning from the Lenovo wmi-gamezone driver:

  drivers/platform/x86/lenovo/wmi-gamezone.c:34:31: warning: 'gz_chain_head' defined but not used [-Wunused-variable]
     34 | static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
        |                               ^~~~~~~~~~~~~
  include/linux/notifier.h:119:39: note: in definition of macro 'BLOCKING_NOTIFIER_HEAD'
    119 |         struct blocking_notifier_head name =                    \
        |                                       ^~~~

This variable has been unused since the driver's initial addition to the
tree. Its use was eliminated between v3 and v4 during development but
due to the reference of gz_chain_head's wait_list member, the compiler
could not warn that it was unused.

Remove the variable to clear up the warning.

Fixes: 22024ac5366f ("platform/x86: Add Lenovo Gamezone WMI Driver")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Peter, as 1ea4b473504b is in -tip, this should go there as well. Even
though this only shows up after 1ea4b473504b, I think it is more fair to
say this fixes 22024ac5366f.
---
 drivers/platform/x86/lenovo/wmi-gamezone.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index 381836d29a96..c7fe7e3c9f17 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -31,8 +31,6 @@
 #define LWMI_GZ_METHOD_ID_SMARTFAN_SET 44
 #define LWMI_GZ_METHOD_ID_SMARTFAN_GET 45
 
-static BLOCKING_NOTIFIER_HEAD(gz_chain_head);
-
 struct lwmi_gz_priv {
 	enum thermal_mode current_mode;
 	struct notifier_block event_nb;

---
base-commit: 739690915ce1f017223ef4e6f3cc966ccfa3c861
change-id: 20260313-lenovo-wmi-gamezone-remove-gz_chain_head-71d48410ad10

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>

