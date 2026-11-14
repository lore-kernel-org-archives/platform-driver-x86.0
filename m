Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637102;
	b=JgLmqQ3jox8uAVvw5H39eIkNz88OrY9TKz7PX9qot60XsWdIqNQvmLuNL4epsFi8UR+X
	 5yUGaLNR4Fh9lxCaj9myxdR/EaTHMl26ZGUHnP1NZPQDJc9+oEjcM6LQBYCDPbBKsmey5
	 OSWuSbjsdXAhRqBKWxvxMUzEdkADDRAXPTcDORd9fOYkiBDit/Mjm/DYtztTwrNxNQeGT
	 sXyWzlXkDGoHfmLiBLbO3UFq+JF0Mn9J3ONZ69PjuQYQQ7EgdrWWr1QQyOLbiLi4HTZyu
	 VfMwjxuSMUfyXrAy6d24r/JlPg7ahilCfdtM1p/pZ18YD5f3NPSdN7uRiM5ol3kSyEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ySLBNxOo+g4OD1IhnmaXb2gimmvucxqU85MBcPIWLnk=;
	b=3E+n7DCCP/vFAy7fOGg8SIXOsdX+hQQfThAmEbiGcl4ym3TQnK3mYcd+8AemxEjlbWZt
	 4j5M/pVDILzOIpkci7RhKi8FY9KP1RJ4tVLKG2+GqnxlBAq96A4gLWBrIZ36w2iB0lobH
	 fUqUEJIkB+g/2RGd2XA9tLkRKx+kRSrWVTvLmnyaUg5AJkThlK9d7g2FIPdugwLa9GApG
	 JIH3AriC+FKIeYrG7481Yz8UIMMm2+SpYYXGYDPuiTr4pH+Hgtysx1EjMIiVJTAgQQUfj
	 l/AQyy9yIrnTsqT1QTWZ7q05B2Y1kXK8Ebk9PJ7XX6XSl8yWLrBEvZi2y1NPRYclJZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRzIjsOX;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C40606A33F
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C40606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nRzIjsOX
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37000e7234bso2873222eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637100; x=1795241900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySLBNxOo+g4OD1IhnmaXb2gimmvucxqU85MBcPIWLnk=;
        b=nRzIjsOXc4DTjGb5V4uDM4oX14T2LtQ0PM7wEyYQ+jT9JPkies50fumeh094yuZp68
         CTrtXN8Op3D/NoB7Ei4hOfWccncs3w4jYoR0VMyozZgDpr/q6MY9eBVoh3cWzSSfvHS4
         NgI4otlKxLyX1l9w7cdMFKnG47TRJAhIcyWnrehClAKRyksaXThBqIdCJj5kZyOrFTst
         qCWr+BVvTnJ8csQWMGblp9d1V5vXV0miVN0WewRzxRTKd4F1C/CKmmZ7ilGgYfMNWxaE
         2VM19jBCXKIEYJy/ZJkltYlucdE64MoaKD4sx0ToFesx7FSkS3AWYrPPInvSO4cn8RH6
         1TLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637100; x=1795241900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySLBNxOo+g4OD1IhnmaXb2gimmvucxqU85MBcPIWLnk=;
        b=Sc6lNlZBUUgD/7q87PQPMLsK0bQcm4cYwwLpnMX4E6+40kmk1df32EOvQDC2OAP7Eu
         UdZhT8mQhhAORBTe6xFECAD0M8gHbfBsvDSWg0K3f0/AnNg/ajqOB/l2I9KBxdvydmuX
         XpBhuliGkwh6/ZfiYEA3slh1QQd3JHENtYcDQV3tgZRcfCzsmZQYNUF4ueCbc05AiTp2
         8LVr4l7qjBlOiMlPW1AyhiQ3uVRCKLu9Wksxs+NxmAEPLZDw9XUTAxE9nVIkqNYFE4XZ
         BL2a2V6aaYAfiruTmxYkzNMGQDAcohKdU6zs8e0psCtPfw72CmoTMK8zDz/JHpk4+ghf
         RVCQ==
X-Gm-Message-State: APuU4Z8dOSkz/jyEqy0cFolmzURH5ezoZUiPD8itb6Cti+mRkYJNSPKd
	WK5Uzz8T8nkAd6r0y6axz0F+okEpGpxkhFhwWZcp5/aHvmZQnvnQ+6pn
X-Gm-Gg: AYBFou1jMHLe2QD7evl73wIC/3wqyRTr2H1NVb//qtAHsee/tP+QRYBAISSxdNETO/P
	XxhRQdIH7Ug7zPAd0xvCXytcxOgUiKMGp3qm/RPQ7xbeYjvYhcWV3Jz0Pb78XSgf/bhYBjxji5U
	EJqKoIPpO+LmoTrZNxqrrvavDbkcOQ+5KHSA6s9P/kzk/7TIq9CY3BzgssZsXfIRnAej1b7K/AU
	8fupJoLlDI1z/5DvAvIVBXAYCkaiWZHcQN3O+ZOy1YIMwbcOOAnLlauLuEHjh03CW/7Pmzrf7Qz
	myaLUPcCQ+7ccTUe1Zfe9L7ztDrHxWfOfFHI47/lRjXoHQoPnNKnt87b5XjMTJFz3Dsij4caOdg
	tWcjBml0LUKGCwWW6ZxJwBkGDiN+qH6URf35ojhrDayZU4OYg4m8xjV5uDMDwRrfddQV7KzOYaN
	8S2J4kXNCOEHI/TX5mEiJu7rrA3sMhj7zwf8NsEldwcz4kPXYWuuUTlkyUjWt3RWLYLtD13eHw7
	nce2sHVWhvtJgdOO+pchz6q2OfqVGxUcaSAgZqn3gIs9vi7ZZ3d9W47aius8d5aVYWM5OsV27yg
	Je0xL8+N8U4r5xaWxMuxbpfZMVItNK6JPy4YHIkUyXzE4TRXj+YjL+uOA1dmEx1DAqspBrIb9Ei
	hYOZ3GP7z4MgvWvw6H68uAiXSDlVTaQ10X5O4tOSVz2pYghDVxpUH41Dv9p3/AvMp+FvrFsNFHr
	cVQg==
X-Received: by 2002:a05:693c:2804:b0:37b:7bba:8199 with SMTP id 5a478bee46e88-37b7bba83dbmr56245eec.6.1794637100147;
        Fri, 13 Nov 2026 22:18:20 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] platform/x86: dell: dcdbas: Fix SMI completion wait and buffer handling
Date: Fri, 13 Nov 2026 22:17:53 -0800
Message-ID: <cover.1794633178.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Fixes for dcdbas.

Patch 1 fixes the host control SMI wait for types 2 and 3, which the
compiler removed entirely because the status was a plain memory read.
Patches 2 and 3 fix the SMI buffer lifetime on unbind and module
removal. Patch 4 validates the firmware-provided WSMT buffer
description. Patch 5 converts the type 1 wait to
read_poll_timeout_atomic() as well.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
the driver probes, and growing smi_data_buf_size and then unloading and
reloading dcdbas with dell-smbios on top is clean, with the buffer freed
on remove. The host control SMI (only used at power-off) and the WSMT
paths were not exercised.


Rosen Penev (5):
  platform/x86: dell: dcdbas: Actually wait for the host control SMI
  platform/x86: dell: dcdbas: Suppress bind attributes of the platform
    driver
  platform/x86: dell: dcdbas: Release the SMI buffer in remove
  platform/x86: dell: dcdbas: Validate the WSMT buffer description
  platform/x86: dell: dcdbas: Use read_poll_timeout_atomic() for the
    type 1 SMI

 drivers/platform/x86/dell/dcdbas.c | 80 ++++++++++++++++++------------
 drivers/platform/x86/dell/dcdbas.h |  1 -
 2 files changed, 49 insertions(+), 32 deletions(-)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

