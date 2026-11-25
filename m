Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633672;
	b=rp+eiG50LSdJ565PH0qhs4iKBo7qEFVKfHLMl8APxdyAhpdaT3fQLqrQVuK88aPmWqoy
	 klnPc5gYOHnGwPs62v1oOQYiSdRbXHxRc6q9xx8le5SjHIoTipvs7YlYmjO2krZJqxRtR
	 1lrDb0c3dyuZNKDqf9qw4T4JIF0SQM77lNRpf5AzXl9usQAxgE1s3mv2XBUMq+5iXer9g
	 z/ubyrAYEGpeqZEKwXmm9ydCvekpKcAFz8vmfx+3dFTMs3xOW5OZkJeAF05nXrcfsSrkv
	 zeFS1iHSCg5ozSxELS+A3UzIK/5oZg9Z5+LgZP8GI+of3puFEfExzkF331mlxsyZnHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z7oO1+idE1YuSoFAPc2/i5u2CikChDsikplJrvQUM+4=;
	b=NOX9iBZI0HLsclWFA3tTI+t1/A4dsuvdmbpGC3AvC/oKluJnqFAD6R2X++3va4UqRvcB
	 Qpnk9/ifmbtOyUaqEBZbsB8DDF6LNP7lwouYYj+LjDh797rXEunwqoso8l583NhTvhsEe
	 m/Ddn+WKfYOXOqxSQDFLVaczkB6IMrHY2SeBL8GbtjiE4GLftUzGdzvKodkoeg5LvoXXC
	 RnynnjjujywkPFQqJRITW3In9pQ9ENbZh3sTjVRL8S7ORSohdqCDTq13rNQenJJH0XA6C
	 9Z1p+SV3DGwzuo8mKM6vXPh0z+gX4Gux8cWhYQyBflA9iMOIdgwPkAM2RnYn7FQr9bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPZENFQ8;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64153606A332
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 19:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64153606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IPZENFQ8
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b5786e099cso4572649c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 11:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795633671; x=1796238471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7oO1+idE1YuSoFAPc2/i5u2CikChDsikplJrvQUM+4=;
        b=IPZENFQ8+nUfUPdU5/BAlejZdB21DpJJ9TBHmw1H3RyPgU9CH7UK7dfJp17y4rm6sb
         oQhEgNUkXKkhqklAF48CSxETEkYxf9IuenME0V1c1IsGwsJlRdAs6NumOPv16JHLJoRg
         8uwj8QmzErb6jz4NYbIZAPZSIgwgIFXy7iWuwQNS3ZabBlnkyzOWzouuw8DVkkfW+6tq
         5g0yos4Ioz7P/mJqFaHMOs6QOl0rEeSTKS9vY7ZBZarPDkfBzIeoJiAAfBJOeNYBd50a
         BGQfoDsEE8y2rGY81xZKBt+KDUpvDCH1FW4rLjH3IviTzt0DCXRY0TKYp6s636IW2JcO
         ni+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633671; x=1796238471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7oO1+idE1YuSoFAPc2/i5u2CikChDsikplJrvQUM+4=;
        b=U2p73SNR2ExZAnhfCRA8ayDeXa9GwWGqe927Ur8FwJw8HynPlXGtKmoikCv8dNy3ke
         +Hb32EhG11ATX2yxGtcsCyqZmAw22JHEqvjLNDQB3oKlZ9eALo7G2btIq/hxQHEliyad
         YYHHiz0d2KnT4lt19UHfyo7zXUksguWGbdG1T5GxONazvB+yDXDAWfq6fqYHes2enyBy
         cx1ygmFVHFK8Z4VHBMq0khD6yVFdge0pH8TgLM+pnZ7WxvmiT6NbceLXNkBzf4asYx1k
         BV3JNcNB+oda7pD5CPJxDFNnswETL3qt1/2UHg7b/gomlJZda93ExO8sjqn4EgB1ijO3
         11OQ==
X-Forwarded-Encrypted: i=1; AL+hErHB8R9YArl/8e2ADOnhWWmNth6f46rHtwTHx4IJrU6+JRvLjBKbXUxU5d6kXPsX+x0l2g7TQgZoWiGUsXDdbDRMK8wy@vger.kernel.org
X-Gm-Message-State: APuU4Z9tnJNG09ptP8WB977TWzKKh19ljps8eRaxPXKfMcdYP6BpT8hk
	xap62cSa0fubBQsHpsHi/aMSAZpPAWZ5Az4lDXiZ0eVa7MU31J8Lvw5X
X-Gm-Gg: AZFdTZdEf2WzEFIilyOiP7cxO1nZ9x8VEXcDgIL2CZilw22YddA8obKVqZPSXu6D2jn
	nvKPi5C6pmxr4gwugtBtM5rFJmFL0+OZf6hdjajlkKTs8jaO+AicWZfqvMnIWPyyu6kLvv6PVO1
	Yr6MPn7HOoqjO17UUNkBjJq7FYCK4OoR1SBqQqJnoIcSYYpi+a4+UShghDuiyErjeG7B7Z9plRi
	G1/aXj8JJUEVGMLXkB4t0j3DbxPpr2yyWG/jPU8qZDMbHwnZiQxm4aQuK+0679C0D8femdbZi9Y
	CVwqiRg5fefj0s4MWMkzjZ5kq6QlkoaKFq/W8AFh4YghS5zo7Jbkh3OuvWgvzWhw6LUDMMGBjy6
	OqLlmNZlYoQbIN2Ow3+ahRCeIKDKga92vS5np54uxjrqfDPu2X7vCDjQqXQLchVBWIZvy17GxNn
	jY5wozOnyQwzE5wwmA7svUuaNm07SD8LgyaA0XsNRqSinUuzw5DRfZIib8ULdXEOx7svlAD1/LZ
	nbvmMRIHFRNxKBWGI0HVQTkCa/wAkBwVI6/fehJv7YSAF+zA/uilzU29MAMhkTECSsR/0wlwfWB
	b4tXdqXGKu24R+UZakZJ
X-Received: by 2002:a05:7023:a8b:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b5568feb77mr18978686c88.25.1795633671181;
        Wed, 25 Nov 2026 11:07:51 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm42584510c88.2.2026.11.25.11.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:07:50 -0800 (PST)
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
Subject: [PATCH 3/3] docs: ABI: mlxreg-io: Drop the second shutdown_unlock entry
Date: Wed, 25 Nov 2026 19:07:42 +0000
Message-ID: <20261125190742.2420486-3-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125190742.2420486-1-takano32@gmail.com>
References: <20261125190742.2420486-1-takano32@gmail.com>
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

Verification: get_abi.py --dir Documentation/ABI validate no longer
reports shutdown_unlock twice.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
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

