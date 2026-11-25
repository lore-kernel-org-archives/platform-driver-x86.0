Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645086;
	b=y6N/FOUP5fTsHamuSRefcGu+inoe0ltD/JAU3TpLtnx5vCmvF1OzQoHIYMDBQJwD1eZD
	 cli0oaOOGz/6DSK9vgrsGLjdf7auy0jMdivCr93LvSQ0xnntl4Aw43MmcpKI7V05rbovO
	 n/vmhq8IHLbzHrOTLkiQcHZVmWMLbH9l5awcqvPUuiHzbG2rOTLJdJ6Uuj9xIOkZu7ZVx
	 /s+zNlPNzOqtyDHYoe9Zr4yuTS9/xA92EmD4ERgFcqD9sFZtXpXrWmxpAmLbC80y4T5xh
	 u/zjFmVKX52fmEByfO2dsFDX6wO+h7E+pxcCP1oJ3xHiEeujuyChgyJucdjJs1FVnaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0ipuY/GPGnzCJlnHWCO1S3xz7owRUdE8H+HL99PrQAY=;
	b=5idPw5WWf6TrmcCVF6Cytc7lZZ4Q+GhIJxJR2pDEH/nWmole3BdLxl3gxyC3ZIWo/Awg
	 ftMgkKOqljwhL/x9mNN8bCqD1cCVtVYTWxIfOYF6jrx3Qhy9VIg15xVg3a1iIy0ARM08X
	 sBTpY9BI80bz+9Nn73Cuoc3UaWwZ65P5Zqkfc4CQ5FqqWyKhp7z7fgNgsqH7n2lbMBRi5
	 WX6jkrLRxtnmIakgpivUDkR9fLwtRZH1gvdf0kluU3uViIOAF1twLNMmJr/n4UlyUCw+x
	 lEBT93xcFD02sBWRyfbyoK62WfkSamjdUBKdDSfWixfO/4DIPCO+IxP/hyQdmQff+ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4C4hDru;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A963B606A323
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 22:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A963B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4C4hDru
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38644aedba1so9571293eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 14:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645085; x=1796249885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ipuY/GPGnzCJlnHWCO1S3xz7owRUdE8H+HL99PrQAY=;
        b=d4C4hDruGezjryJjUXDGrcMNv91JTeaHoH02IBRRrhMTYsm+KdaIq8zPvV135GrEUc
         cvTs7SLLqIRI3xDB36dHNrwLjadHZcmthjeYZBAcbMxsjuMh6oR1Xuj7J8OhSDZxXLWh
         HRNsSiqMMhd1VVny4P3EaxuOdbqriGk/39ad7BTzpvIXsVMvfLzWWJ5nH4uow1MRDTeY
         UhRPjh+jgIiUaw8Au4cOkmXtrbFuYujQGXJAvddaXTjGjbNpXX2RlpIR0po5hxehRSXu
         Rl6cw/hPk0q9VfnwoiSJaYbhSkZwBtCc8ZoEGexB5piGnbQYaLNac+56G22AemftWcA+
         dLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645085; x=1796249885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ipuY/GPGnzCJlnHWCO1S3xz7owRUdE8H+HL99PrQAY=;
        b=kigZyWyhHIJZBKIOW7lE02uzDYPsBZLJz9/vInkDuCda/xTkgNOoxpuk/1Omu0l/em
         NGUiEHlvRwjed4xjzN3389u/Bl2W40wyfHE0nzBubfto0KzFiiiLpMb/Rf8gHM87HSoc
         tPShIaIkFp4mEVu/aYAwFemAZ5M2ia6S76HWYZCjpZ3T3F346lVNX/U7WJrdatNQw13l
         sSjGOIeJPl5mMkR2ut9fSdCBMifCLMty4MNWayP7TkxoB3vInXIn9Rf+xYatqmxa1ObB
         f5JZ+MCu2Pjk1i0wB5ZBUn9H7tqASfZS5BA110xk5taoQp1qLWksA+huJTLfwac7yoj2
         8vmQ==
X-Forwarded-Encrypted: i=1; AL+hErF6mK+KBIslUhSq5TT6gOaDGO653lu+uq7TBUevfIG5RjQe0HAgfMwNv5TTh5NRaUZgusdZ6pqE43PBB87y8/cGRDo+@vger.kernel.org
X-Gm-Message-State: APuU4Z8o4r8QvNwOyf5PwtlRPI2/6x2xZWC88aRGhbsfcQW0p+HCyPwh
	WFMznQVkBKxtjYft/PwcE+4ah4a4y764SU2lMZIIE4FhHtLllIK1JSOl
X-Gm-Gg: AZFdTZehvVM206da6uNi8HO6lCq5u6720CoiCOIA6lJuEAVrb/kMQyFYSOOolEp7BqL
	x/gaWKiP0CD9/3luGUDUM6hhtDJBtUhX235jMzJEO3n6qJKbXiEfYHcE3yQIZ5Cly+BuFsqmxbu
	hVtoESuLTlAh8zoGpes5APcuwgUIfotQg7UdrUAs5t5hDSn8zW29tH9SYbkTa3yegVRnUs3jhRf
	4emEKhMel7/GnvXXSlUvOv95AiL5TVFLkndgNGkm7fUpBHYf+oM5bL6A7Q5/ppgyG/6BKlHusEY
	cC1IIXqME2ygewVU9XbKuV7V9KHZxwNZd73eqLGtTj116MqIAnVujZJve4vHvqHcRPdApXGWeZU
	oubzT9+vW5kzn8kWvIcXVuoHKQtFFNCdLaiIA3ruInLfjpHYHMrQ/wijMrkR6ZtZNxG9MQrD1Tu
	vhLcR4RFb7S2jC5l/UvM9wx+xG6mKdz+WgKfjuCAqzelaifGTZIK9YRkEQGLf+9vlLDY9bopvuD
	TbcIpOrz79iabHextyll3U8bCPz4VjpZhNcdZz4z+gaTn8Yyx5PV3/qzLCdbLXKUNJyvsVfiYUC
	CZstB0sHgfFTVaN9HeEUGA==
X-Received: by 2002:a05:7300:ce93:b0:36c:a44c:1763 with SMTP id 5a478bee46e88-386bbfa6402mr7456394eec.32.1795645084664;
        Wed, 25 Nov 2026 14:18:04 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm69581357eec.5.2026.11.25.14.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:04 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 1/3] docs: ABI: mlxreg-io: Drop the second shutdown_unlock entry
Date: Wed, 25 Nov 2026 22:17:56 +0000
Message-ID: <20261125221758.2535044-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125221758.2535044-1-takano32@gmail.com>
References: <20261125221758.2535044-1-takano32@gmail.com>
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

Commit 4e29dd3821df ("Documentation/ABI: Add new attribute for
mlxreg-io sysfs interfaces") added shutdown_unlock as a new attribute,
but sysfs-driver-mlxreg-io already described it in the October 2021
block.  The tree ended up with two entries for the same file, and with
two different defaults: the older one says "Default is 1", the newer
one says "Default value is 0".

Keep the entry that came first, which documents the behaviour in full
and carries the kernel version the attribute appeared in, and drop the
later copy.

Which default applies is a property of the board's CPLD, not of the
driver: mlxreg_io_attr_show() returns the register bit as it is.

Verification: get_abi.py --dir Documentation/ABI validate no longer
reports shutdown_unlock twice.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
Changes in v2:
- The documents are fixed before the checker is added, so the tree
  does not gain warnings in the middle of the series.
- The internal MCU protocol_version entry points at the top-level
  attribute; v1 gave it the prefix of the removable controller's
  group, which made it name the same file as that entry.
- The checker keeps its warning for an entry without a file, counts
  lines rather than occurrences, and drops an unused loop key.

 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index f59461111221..00cff8965b22 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -741,18 +741,6 @@ Description:	This file, when set 1, indicates that access to protected
 
 		The file is read only.
 
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/shutdown_unlock
-Date:		May 2025
-KernelVersion:	6.16
-Contact:	Vadim Pasternak <vadimp@nvidia.com>
-Description:	When ASICs are getting overheated, system protection
-		hardware mechanism enforces system reboot. After system
-		reboot ASICs come up in locked state. To unlock ASICs,
-		this file should be written 1
-		Default value is 0.
-
-		The file is read/write.
-
 What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/*-00**/mlxreg-io.*/hwmon/hwmon*/boot_progress
 Date:		May 2025
 KernelVersion:	6.16
-- 
2.53.0

