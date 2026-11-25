Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645088;
	b=VtwB5VuIvPl6an1NiGgCttH2Zduxs/D7yO6AwAN61rWunGFwfZ3jNBrw1Ky0a7r4vLgO
	 pvuKrGbPYHkD1BNyFU4BaJpxIgFjDJYntAa/7MlbMx5CCqfjmYQZEP/iJcmGMp8uqnOBS
	 txt04/OX3bY5rJKyeUdLVDEYLX/erxzgUXmjATIOgqwlmcwGzMTps0dOJeDjPutqVbDV3
	 eeHZkxyWhb+PIt3ol9xegFwTvQJpo+DHgFDhqrFomYyNAT2cMD0eah8l0ix23QQ3M+wjP
	 Rj4XhyasxmcZ4B1EEmziGD850aGSg0BjMwr6+C4bBW5BPnTOEK6vMZFiTaYxsf6zcIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kKJiwYR+cu5mrPZf9A39ckCZmDdoMlP8HFoXJiTcA30=;
	b=YZYPwZo0yg/tqEzSeHBadvCwzij2aSNuyrjkf6o5NcGB2kvS9EuGuiW3ZAaqtczleYiH
	 7LsCXMppXMZPpzAreFHlUrjnFDL/KszKENUBrHyYiuZG6zQKKGKkCypFP0ihtNXXrQ1kJ
	 tptyB2UsZb+iOh4p5BIuIUsMv4nf+11jduu4jGYz7sCnydjnoog8Za4EJybSLiu1TApGI
	 nq93oRXEaLepiHDALuEeYeU9GKpLMnefVWG8Vb5ng+Qz98U9JqVzXuhpxS9BrFxC0xRoC
	 92Gxq5kHsWsbPvf/6NTBNqd2OaFWO9XglpPY30axmJ6XA7gG7+LNW7ipniAMlrI3XhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVY8mCqs;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E14606A338
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 22:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E14606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVY8mCqs
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38692f62b22so7636922eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 14:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645088; x=1796249888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kKJiwYR+cu5mrPZf9A39ckCZmDdoMlP8HFoXJiTcA30=;
        b=ZVY8mCqsBddZObOYIXIcss49XEgjhI0oEJgatBFM7cmxjhdOEXS0El9GvbTlT0WULY
         9i2iWLH1dX0WdE5V15u8Y4JibImKiTs2g5oByUP+osAHP7L/fWW+xEOrLbgycTHKuGYN
         FxCzpaN8287ZRGpFtnYy51KJ7IiSKqSMTab4JYPsyAQIjBNj3BJTCIYvSWKmN1OtGz0f
         GMaPnJELkgByGFo2IQNiPGsRHGwMAE22xqRkfijG4eMPE4GTi0lu/k4RzAqDjxeYPS98
         +TvkzDW9yo0zD66xDNH3QS9yE1fDmz6W/TAlYCxHkAkDWzR9Z96Cv+Y6AIwSODhHt6+/
         G00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645088; x=1796249888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kKJiwYR+cu5mrPZf9A39ckCZmDdoMlP8HFoXJiTcA30=;
        b=CRHNT2JbXic4PEU0TiYGVhFajx2rVM/rhH6zSEacIae4s0tnIyBlRm3Jeav0/Q6H0n
         AN46STcchDtBf58CFJyxCfqNzDe15+jjdjUhqTrG8VKsW2hy11NcYL99rXOzI8LZdcyH
         1qO+AA1DpydA7DPAnyyhHLkg6P589RqekAoYkghalQSMtDjwb2cU1JQYckj9ZyGKi5uQ
         FuPQt5MExj8/eQ4vsuPeMwZ7YJ1kUjxB3EEfjUvkF3kJLN9wMkq3H7hH4iU2QdFppXHT
         UYlnIyn6N5bda8dykDx+g5FWBZmiNmQpzhlMTbjNd7jmeOAdflAKVX9wHIcmavVaEnaV
         WDww==
X-Forwarded-Encrypted: i=1; AL+hErGDPUTVYffXHOPNock1/VUVTdPPQCD1nLEbF5/VzutAuhYmtrehmEZ17KbqoRj11kmSnnaFNEgzsNfcc15AM+X8em1D@vger.kernel.org
X-Gm-Message-State: APuU4Z82EhE5eE6IMGZxM5VLQJsEYh//YShlU2llOf/TCjqopuBtVixs
	02KS+kRP6klc0c4LDY6weJkwJhsIwWgyHNILgT1BqYOjOhserNf2grqj
X-Gm-Gg: AZFdTZd9NCpMi8td6rlsMDsInjEpXfHiKLSDh62qPztRsllqsoWqkBLbiKwOaAdTc/H
	o4Ym2FzN+y0ZQaJGbKIWgI3SVNJqAMLxiMHM7Qqrcnx6MVkBspxCv6fvGjI9W4CW7B84J7dE9S/
	Z2/tpf5LsNQbpX33njJ8pf0tCqmcIJamIHE1/JRXNgbS7+6y3CktitNe31P4NvD6F3mSCTJ/8tt
	FTY72Ir1UGcneIKivcbWhE+9hi6xHGnuoNQJa/QzwwPpRfXaIOyaksXNmguYJs3fzlHZIs7ZGIv
	8rbE1USzn9zTpA34IaShasyq1hisIuqf1w/12DDPkgHsVirlSGtIP3sO5BHeD0VPDsNr/XE7gq1
	UQkWuunX8HZvM81ouExTNeqWkiucT6I6WV0djFyPeBR+vCpJ3mziEEeJM8R2RgeE6tp8duzWcRq
	aLTKO8aswZKGUujM5mwjcvJjmY4X6fP6qn3kY6GFREUrBT3Yvg8J45uem6Oxc3Q+O4XpGTuiz9k
	nzGCmbFhza/jld2iqgYtMx8cSOZl+LUiB/m0UCbNthRi8dtMn2zmu1GrU8cDPKFBaGrqGl+plqy
	n7aKbaFT6a739eidFQmG
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr18010876eec.39.1795645087464;
        Wed, 25 Nov 2026 14:18:07 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm69581357eec.5.2026.11.25.14.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:06 -0800 (PST)
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
Subject: [PATCH v2 2/3] docs: ABI: hid-lenovo-go: Point one entry at the top-level attribute
Date: Wed, 25 Nov 2026 22:17:57 +0000
Message-ID: <20261125221758.2535044-3-takano32@gmail.com>
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

The protocol_version entry at line 389 describes the internal MCU, but
its path carries a right_handle/ prefix, which is the group the
removable right controller lives in.  The entry at line 566 already
uses right_handle/protocol_version for that controller's own attribute,
so two entries claim the same file and abi_parser reports the symbol as
repeated.

The internal MCU attribute is not under a group directory.
LEGO_DEVICE_ATTR_RO() takes its fourth argument as the prefix of the
_show() callback, not as a sysfs group name, and mcu_attr_group has no
.name:

  LEGO_DEVICE_ATTR_RO(version_protocol_mcu, "protocol_version",
                      USB_MCU, version);

  static struct attribute *mcu_attrs[] = {
          ...
          &dev_attr_version_product_mcu.attr,
          &dev_attr_version_protocol_mcu.attr,
          NULL,
  };

  static const struct attribute_group mcu_attr_group = {
          .attrs = mcu_attrs,
  };

So the attribute appears directly under the HID device, beside
product_version, and the path loses the prefix.

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

 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
index c8221373ef76..6ba874913c1e 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
@@ -386,7 +386,7 @@ Description:	This displays the product version of the internal MCU.
 
 		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
 
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/protocol_version
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/protocol_version
 Date:		April 2026
 Contact:	linux-input@vger.kernel.org
 Description:	This displays the protocol version of the internal MCU.
-- 
2.53.0

