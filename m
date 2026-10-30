Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348612;
	b=R3xS5Cl5RUP4Z5/nnuzDdfCuFS32ovuiNHXroZR0NKhSkijcoLgLDIl101Rn/vQeC65q
	 fieOwBB5oYiXBqLnBhNKF93cpkvuV98GMno5J7dBJg/zNCxjhigLN3jo8lUou1IrmkNnk
	 Vof6ThigNbHPTz3QhPAQNup8AkP8cYwb2iNIRr7davYVyBD6Hio7O0jGzX1gFQsryKkwQ
	 Vc7Fb6SGvq/LZYxS02zFGglBUNCR/0/nBYtUaQ1R6q5Bp6rIGCeJ3Jl4YbF0oNQsVj7bt
	 8Oh1M61/yx6u+QGNdc5QDVpz8fJIDmpu9OGr9uMwecLghWQkZwt9/WvnnuPRi9aTTdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=twpZcGMX1zP2ESKIoukSbNlyKJlNlpD1PLJh3BmJrA4=;
	b=IdtGCbzavYo/kzcsJk5oj67sZ1JkPlVTNDAPTl6FB5UkIVu07YcO5ZElny5XkNMvymFL
	 g7ymUpUld9Ab6SQSfRpEb/ndDnmS8bTu6IYO0GLNBiv8rTThPR5zqtDXZbCVdSaWKi9B7
	 Gq/w97DpeYkh660TbsS2D3xscKnzqE+7Us/DGv3neyt3KmwNi1XHq44SoEtK1GwqGg8Si
	 V5nlgxPfwZRss0KCUkLmYLzx1MyZnBdaaYPxIVYnBmap8sxN2UoA3ey7FlRexD9YfmRO2
	 gcS1Ags/7dl6aThkivsAvzyBTC1WR6ojbW63y5oxJ0ZP4WIpjF/MWwfyeNdq0ZsnqjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jvdpfnp2;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A969606A31D
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 08:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A969606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jvdpfnp2
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso731099eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348611; x=1793953411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=twpZcGMX1zP2ESKIoukSbNlyKJlNlpD1PLJh3BmJrA4=;
        b=Jvdpfnp2rAepggoglivU8Jj0dXbrYENF5bizpKkTx2fylTJnf5OhFzBCorBiqjdLqQ
         QQ/AXI/YLOKk9lPR998N9OXo8EFXYumRO3sc+VUST1ZLAXAE5JIMkTa/A9QHWN22fPEx
         lkljwWYLW1KhIwzYdPi+AT2+RVqzhABJU4sJOy6ZvEmCl5pl9b2BzRQy8nZ5Q13VEF1C
         F5ZPbt0A9z4TnJ/Or9S1KHgydaorfYFAgoJ9fx5A9ESODWkTa0it8p2TL879IzqhZCw2
         j//RvctB8Hwo9QXQeNGc3YAaK29+Gl5uItnQhjLV4aun+9hL7AdEoJDuZbpRWvcwZqYD
         nhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348611; x=1793953411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twpZcGMX1zP2ESKIoukSbNlyKJlNlpD1PLJh3BmJrA4=;
        b=jfyCTqzHqNdNSdHiApMbQM9R/anEIvN2QNuijCwbvlfmN1pzDNMNwlOZvF7Vqsqo/s
         Db3zjU4JmjJgc1AaXgLnK30/qvb1AE7AS86GA7brfPpx5Ze1yonwQYOnlXcTjJTxG6sb
         M2ccDaOQj1aZ/qXMOQUa2VNVUyuRgXHNQlhZFsnziALyMX/VD1QsCVJ6Jun4MIROHu1C
         szJj5MIqh8FEsKn8Px1gnJisfzzZzzxQaW/GqyJXerYZm/4Rf1Ef9xkPxQOHug8yGEmZ
         CKKA94ZE5QnXmD3vuCEBkWJgjNOkepTO+V69OXY4JlwnTlABe8BGArKUkP5oxG56iWOp
         yuDA==
X-Gm-Message-State: AFq9FYKmXhVfc0tp37sDa54WN49NYxuCG6uWJgij9O8DVY13B/B6HEjO
	YEaguaoAWe/SQ66jD1fWuH8GHBYRPNb5hKpICRzDahEVxOBK69VtGfUS
X-Gm-Gg: AYBFou2uDQRkodbD89Ls2OHkMTKuGucC0bXPPKvyVv0ERqnGc9Ewp7137TSaZFAV0qC
	nveLmGizrS3KAj6VE5ohfMuVeTeT2pnz/4uJH1ruYcU+srL3oz78bBRjf8MhJjKehDQDO9zdBzm
	2jlsq4rmetyFrEKexMIdEHyDuNpDC8ORLGevRaojb6icuSj342bDUI9OuNuJ6EjBynf6pfekJKM
	McDbOuKfgCbWrRLzkQSClNyVzjOUr2RZ6NFZbw+0yQvPgrCpzY2zty1uon1XZH1fLBzin04PS41
	Q6nBdEExrVVXG7HwZwUJxnGjh92MkAM+7ATdNeyOu4N0Zr0sXyY5sIIhLUT4y+4JNTBeRQb3277
	HgeVZusXFxZk/7w7dve5DbyzkhxsC4FRjzHPUk1wM6e/p87+oNF1WOjXkJlpB6tUs6I47+InXNb
	HVwwImho+OrmYPqh+8vzTbNAvEPzQPmnlXGKW+69twYoMovPnHDZ62sdc9LV7iUl2nd3nAIVpaS
	JXOz2cOIGmSjgaN/k5vHF+MSjn5qNZSOEdMBu5O5VwDIHadh3mqTp46vG2l/OVJ2TvrfKQWe1t6
	uHX/wdU8HFMck0U7td9QF+pTAIbTDr+Ay5XzHzBUoSH8XUcoXPOyR71VwvFj/h9Yvg==
X-Received: by 2002:a05:7301:3a95:b0:36a:12c4:8bdd with SMTP id 5a478bee46e88-36a42389979mr3233844eec.21.1793348611213;
        Fri, 30 Oct 2026 01:23:31 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:23:30 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 0/8] platform/x86: intel: switch remaining mutex_init() to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:54 +0530
Message-ID: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Convert the remaining mutex_init() calls under drivers/platform/x86/intel/
to devm_mutex_init() so the mutex lifecycle is managed by devres.  This
removes the need for manual mutex_destroy() calls and fixes several
drivers that were missing mutex_destroy() on the teardown path entirely.

Each patch converts one driver and is independent of the others.

Build-tested on x86_64 with all eight drivers compiled in.

Chitransh Mandhaniya (8):
  platform/x86: isst_if_mmio: switch to devm_mutex_init()
  platform/x86: isst_if_mbox_pci: switch to devm_mutex_init()
  platform/x86: pmt_crashlog: switch to devm_mutex_init()
  platform/x86: crystal_cove_charger: switch to devm_mutex_init()
  platform/x86: telemetry/pltdrv: switch to devm_mutex_init()
  platform/x86: ishtp_eclite: switch to devm_mutex_init()
  platform/x86: punit_ipc: switch to devm_mutex_init()
  platform/x86: sdsi: switch to devm_mutex_init()

 drivers/platform/x86/intel/crystal_cove_charger.c    |  4 +++-
 drivers/platform/x86/intel/ishtp_eclite.c            |  4 +++-
 drivers/platform/x86/intel/pmt/crashlog.c            |  6 ++++--
 drivers/platform/x86/intel/punit_ipc.c               |  4 +++-
 drivers/platform/x86/intel/sdsi.c                    |  4 +++-
 .../x86/intel/speed_select_if/isst_if_mbox_pci.c     | 12 ++++--------
 .../x86/intel/speed_select_if/isst_if_mmio.c         | 11 ++++-------
 drivers/platform/x86/intel/telemetry/pltdrv.c        |  8 ++++++--
 8 files changed, 30 insertions(+), 23 deletions(-)

-- 
2.43.0

