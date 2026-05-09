Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA9364AA4
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 01:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778290748; cv=none; b=fVmyvP1KDIXvL/GBsYJvuTqXx6A0EtL5vNdEstuY2M2/zCbepWKb+DneU6X0PoayiWvFH1slHms9iV9SyB0Joe2rmHQ1GvDy/VQW0bqQlO9XMEAW3bb2sKr1ldSXfJVXivfhdl749B8A8FRXJmu0YBHicXyKv2FcVAYobtX6/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778290748; c=relaxed/simple;
	bh=dZBzxIAy7lF2ul65Go/tb0xNb8XJB86LNAGd9kZFD8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4SeG6ZDex8tQ+flMotGzmQ5zT6Zsccvc2wVPRVl4Hb68Gha9rpwDqBzToAZK6SuXs3o/uz8SRZPRpEKHV1W5YYZKEfSD0XQIKJJbpUhoKTogLisjmuVxJcoWEerrak6moNXWySGedO8VEwtZrgRrFESzoSFuHK53gDGByQ+vd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=BVudDNo5; arc=none smtp.client-ip=185.125.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="BVudDNo5"
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gC7jn32h8zZTH
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 03:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778290269;
	bh=ihbvjxvr97zedo1FQaExWZwtDYT441IOd4ui/OieJps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BVudDNo5AIeCeGukudy6rJqwT33l+Ql4fP6X3sY+q/3F9jL3vFNNGvU+ElrRiUplF
	 8lWeKv11qCbzwNF2zbpfcwDNouIKS1/fa1UFry5M2nHoGO8ErKdXux7ri7y+n9LbND
	 nqWnkz6gHJiHyfpnAHks98tECCgygsJBFhJJk2IHBNP23rrPKsa2iwzGIx9ADpyt1G
	 J/sptzdle3YQWDj9aPZQ/eNfYmyWMjVqKqbz8jzMoEhCx+vZX10c/oMDnFzZF9aIta
	 NBT6kpCl0pfhF3e/0baRQjbxSoTkFud+5PeHdG8mqmYUn5mp/3/mPYTDmfin+FVPk2
	 72q4mZwged5iw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gC7jn0FdJzmNJ
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 03:31:08 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Sat, 09 May 2026 03:31:08 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v2 5/5] Documentation/arch/x86/amd-debugging: Add section about delay_suspend
Date: Sat,  9 May 2026 03:31:04 +0200
Message-ID: <20260509013105.816339-6-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260509013105.816339-1-daniel@gibson.sh>
References: <20260509013105.816339-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

must be updated with the actual commit IDs when they are merged

Signed-off-by: Daniel Gibson <daniel@gibson.sh>
---
 Documentation/arch/x86/amd-debugging.rst | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
index 3176a1240fee..3af7799cca1a 100644
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -249,6 +249,31 @@ state entry.
 
 `commit 40b8c14936bd2 ("drm/amd/display: Disable unneeded hpd interrupts during dm_init") <https://git.kernel.org/torvalds/c/40b8c14936bd2>`_
 
+Keyboard and Lid Switch stop working after resume
+-------------------------------------------------
+On various variants of the Lenovo IdeaPad Slim 3 with Barcelo and Rembrandt CPUs
+the lid switch and keyboard, or at least the Fn/Multimedia keys, stopped working
+after resume, until the next reboot.
+
+This was caused by buggy firmware having timing problems, the EC needed some idle
+time right before the CPU cores are suspended, or it got into an inconsistent state.
+
+For laptops that are known to be affected this workaround is enabled
+automatically, to test this workaround on other machines you can set the
+``delay_suspend`` parameter of the ``amd_pmc`` module.
+
+If you need to set the ``delay_suspend`` parameter to fix your machine, please
+report this at platform-driver-x86@vger.kernel.org for it to be added to the
+list of devices that need this workaround, so in future kernel versions it's
+enabled automatically.
+
+Note that the current workaround isn't perfect: The problems can still happen
+if resume is triggered by a timer (wakealarm).
+
+`commit TODO ("platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops") <https://git.kernel.org/torvalds/c/TODO>`_
+
+`commit TODO ("platform/x86/amd/pmc: Add delay_suspend module parameter") <https://git.kernel.org/torvalds/c/TODO>`_
+
 Runtime power consumption issues
 ================================
 
-- 
2.48.1

