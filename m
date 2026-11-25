Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633670;
	b=F9CoR7tnyP1MIhhgHN+vigLboBQOuuos+8XG9M7SpMf4QPYnRGk4xj4R2pJTOtV/+FZn
	 TJrn2RsjWz5aHkq4JQJ6Br5COckxo5chvsBFOKQp0Dr4r5WEoBitImB3UNm32+yMZAhZO
	 pCGZMeUd54x0pM3ZChfH7WMoGZXRlbB2BldrvBMabUHhprB8lu1JUHcfFsWpYmqVvfJ6p
	 h3k6JxKYp+Zl8GefdE9wYO+L1SAU0iJq3FqayxaR0w3JN8vnLb0+ievmqgcbx7ekCVzgW
	 C1zD1fKRFG0GwM9Id2KU3yVlJ7oj9s/AGsU9Kdmb/wORl9mJtO5P4zDvxxzPlb6oaVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ZkxxOMDqkeVS9tns9euuwURcFwSWkP/LQaqu5Nm+FY=;
	b=IaME/ePnV7IKCg5k1czuSMuMQzM6RX1ybr0CYZhlv1od3ZLJ+dm8xFE1ttYFsMa70VfW
	 tNU1RiVO3T1Pcj094tP686lD/tl+DBDSjMQ7v0lQ8XvvnJA0nRYVTSAV3Yvw6UaBtjie/
	 q4hrvvjXne+Je6Tf9SbYnYViBt+ZNeHhRcRN1EOIW4NKSpZhVdnl5gLCBOc4px7lcZRHu
	 xfotMwnTsGnITEdqSIOYliEycS8kDXmNJJb2Se86XRIE3R1zaAFgDg204/zKGTP7zWiOr
	 9kKz8tWykJgoNY7F5ruv91o4AnNYke3MqG5nY18ZVdnt5uXt3NwaT8TcEigCPwjSgvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="x5RI60/M";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B5606A332
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 19:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D46B5606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x5RI60/M
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso3145510c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 11:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795633669; x=1796238469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZkxxOMDqkeVS9tns9euuwURcFwSWkP/LQaqu5Nm+FY=;
        b=x5RI60/MzFExmOQJVqzH9dvtf9/5lpQ5aEuFTCyldPxwdRHMWReCZiM66m5mQevnOC
         24p9Ye7iBrEJ8KQK39KIzPq5dIHWgKtvq2ZnBi8cPgFm04uy38keKwpG5GvuzQ3bwyAJ
         6acVwshjCzHd4fvWMq1+0yts0TF4McBIGvmIpTZm1qKhUXf2AlOl83pNfwD4UonhQDzt
         qWqa49LV0UMkbStyt8cWxbbQkJvFqHvOd0x8gU43WRPJgfoSiqpcaDHeUO/Jt1Q1yCSx
         GDUaRHjSy5wfPzmETe/Ogh6STqW4g/OgRfIW7EXwK5iLBFw7Z56qh0wnalg7RdHrbaU2
         YTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633669; x=1796238469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZkxxOMDqkeVS9tns9euuwURcFwSWkP/LQaqu5Nm+FY=;
        b=LRY2HGd+E2T2VEiG0YXnjhBlGuqyd/ysichRjsIo2MBIVNi7j1tKiGc8D9qlhLyBmA
         kFXZJYLihJl6nczBBs38mf/g0iYjIXuRGYMAFLZxY6qu9HqEIZtH3GNvoz0oijBSpqpj
         N++tBdurLKpHTTC3v/RQtwWFFLelAjW/BLM4yybEVEGJgKzK3Yb2w+dLaSzhY8GicRwW
         y9krbMwAekqmtn2gqEQwBDfl4AvgPfM2DjeKM72DmxRcY7h4lxyaUjDT2beMOXQ8jP2i
         7QUCBDNhqmrvJvI3hYLYrJxeiwhR1bbiWWvmCzTYJfY/p1O7LZ/shI9zCKAHNjiKDUQq
         fZeA==
X-Forwarded-Encrypted: i=1; AL+hErGiflURt/x3ZJfMncFHXXftISaG0p15Qrwhv2tXW5wdKdU57Ab8Fak+RiN1W4oyVYjy1IvgCxXWXR8VeYe37F225d/U@vger.kernel.org
X-Gm-Message-State: APuU4Z8xR6mxyGNRYTspELxUasoZ5en+bQbogvslDGC+REHAuF2d3MVg
	EvOcpzEMFXx/U8GMr9DGDXf/L6vQ1fiZ5qCkPpxFyVKBaurPIlt/LrXl
X-Gm-Gg: AZFdTZcvvyfQXKst/sgtXwmQQc1tOsM7x3SChdbEBYXG78VFQLOJbQ9QXWzgbvPvCeh
	x9dciZm3Msu6zxZbAMqaF9hLeaPeegAW03p7B0TPZDLVLn/DSoucnl8nS/5kaYzWC0sn6yT6/tP
	CpHhjBn48IH+1V2X8nYFZzrH8Zy6tizUqM2JYJb99YkyiyZF8adzVRT4YSvuPcMcjPsF+ulq91Q
	I8GZaofcviWJCstnyGko+0njGvhrj4UENUpmIe57uMqFT2dgeu6HzkxjZbj6k4dff733FZinnB1
	HxaSDH+bpiqUGvN01vahl3N02SbJb7wQMzJEwoniHI60H/ruuDjbOmEnU81766r210um63py2rP
	vZ4xt9RdGQg9L18yX65ysC8spTiU8i7wdcDLZdE3SoFUqIiRwHrGCIa6UidnWIVf2M5FN/QVzE8
	AW1s72Sy7gS7ZFTxy+yW4dpWAJC0iPo9fVj35I+NfNWGR8/r+35CSMXmjCwWmqfdCqXJjk8yNDz
	p8hD8dFxXsCa3vacwOKTbR9UczdxBnE/3SbT8qmGg6DAhHi63+yU0/pf/PR0SmcOX+dK0+Jq0gj
	ZqbAYtB5NFKoHMVb7zs1
X-Received: by 2002:a05:701b:4213:10b0:185:6c8c:d860 with SMTP id a92af1059eb24-1b5568aac8emr18988658c88.5.1795633668803;
        Wed, 25 Nov 2026 11:07:48 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm42584510c88.2.2026.11.25.11.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:07:48 -0800 (PST)
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
Subject: [PATCH 2/3] docs: ABI: hid-lenovo-go: Point one entry at the version group
Date: Wed, 25 Nov 2026 19:07:41 +0000
Message-ID: <20261125190742.2420486-2-takano32@gmail.com>
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

The protocol version of the internal MCU is exposed through the
"version" attribute group, but two entries claim
right_handle/protocol_version: the one that describes the internal MCU
and the one that describes the right removable controller.

The "version" group has no entry at all.  Point the internal MCU entry
at version/protocol_version, which matches the description it already
carries and the group hid-lenovo-go.c puts it in:

  LEGO_DEVICE_ATTR_RO(version_protocol_mcu, "protocol_version",
                      USB_MCU, version);

Verification: get_abi.py --dir Documentation/ABI validate no longer
reports right_handle/protocol_version twice.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 Documentation/ABI/testing/sysfs-driver-hid-lenovo-go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
index c8221373ef76..ed8d9a35b8ca 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
@@ -386,7 +386,7 @@ Description:	This displays the product version of the internal MCU.
 
 		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
 
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/right_handle/protocol_version
+What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/version/protocol_version
 Date:		April 2026
 Contact:	linux-input@vger.kernel.org
 Description:	This displays the protocol version of the internal MCU.
-- 
2.53.0

