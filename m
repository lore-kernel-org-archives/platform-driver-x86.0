Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896528;
	b=MrGRlIzpZiUioHuMUvGd/smwZexyx9OROlLSOaRs3vDJYTQxcWxjwafzaoA31HvMg713
	 /vjaiZlJBr+S90pTFhDdRHln4aT/UhwhOgst2xRiKAD9L7sjOn3ZSUSATA1sV0BaqL9y0
	 MuNnPVeQnJccY549HXBnDHhwYKXMsIfJPfZv5kKumjg+wJsNrN6pmpVlrixEIkEhFJDlR
	 HXQ5XDYopFDdFWqkyW5srRkW5E4B38QdRigeMPE8aiMwx32YYJ063Iu14UoODklmXq79Y
	 vHOl70eYB0ywOJnmMJ/xkEkN7UKHKu6Iidgmdt1Y5IsromywAUYqzYcC99NxenA0Lkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=zUKQcLBNuUzfdigPpCeMKgQJglhu7H0OTyY8O85pHlA=;
	b=S3YABrwLQCd5B0IUIBvM7g5M9H7d488dFGYhvF/OVUqbfN3IwXohS3b2O9/HrFzgCmyJ
	 0Mb6GbAU7anbDRxd89eqluk4pajWhyUCuoBgEvIFzjpoSFq6A+PexK7suB4ODHJNrnUiv
	 V1rjJzYDlIQUA6/cO8p7zayzqFlZjuYoq+48acd86fDP/7aFNbCynaS2XKW2uGg1cZIKr
	 rcCkidWKFzze6X9xGnDjzNH4Y0wmzrOJNgu0t/+zRbQEQvN3yzstPsmkxCu/I9cuw4Gu/
	 o+ygEiX25csb9+ZGiHg2XNi72+YuyxxFVyt6m4edyz1/8r98A77pq7aQYuyZ4cefohA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BnZdFL02;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117D606A31A
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 02:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1117D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BnZdFL02
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so2656139c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 19:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896527; x=1793501327; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zUKQcLBNuUzfdigPpCeMKgQJglhu7H0OTyY8O85pHlA=;
        b=BnZdFL02ObgqDdlRhZQVGeDOr1hl5bQP9RSCGMuwGhcWXvjsvfQYDrj4Wf5qsZVtKh
         JQnQODsdbE3HCc9RLQwb8IeYH5EU0Tb8v8PDXsVtXh9DbxKkEd8/NP1ZJNfsT+F/SUij
         ugaMNlo5N9Kwqhfz/8O4RQNlBNNk2Dg7f1KyRuS62mV46ZHB5WNFwNBR3GYD3/DLzRue
         tct6QOYLVfYERH51QLZAZTmGuZwrbIAzMjtSOqKuzdZtKGEjXUNP7xQC7v2cvVYDV6u2
         6aVciLAG/ooH6QwJDJqHo2G04nyKzPj69t99i3U0TjdkfAmpXc5aaRGwrGjQdkz+7XrU
         OQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896527; x=1793501327;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zUKQcLBNuUzfdigPpCeMKgQJglhu7H0OTyY8O85pHlA=;
        b=KKaggFcQ5CMAAWQqJW6X7zQYe4NaTD8RWdffwtbAiE38S/bRMrUMgbePcr5k31d+kY
         P7RV7Mf7Dh74DVHr9/JlpvDfryTPNzFxlWV+gvJTwIpZ/74U5APup3znvFW8wfI1kEX+
         PW++KbNJU0nqku51FXPQRtbwc68nGuZ+eqR3+vBagHSnPtLiH8mizbGp8IOUU8CsKJk9
         Ue8bdnbPNkZRluAGZZvDcHRCbLhQvZfLw26bZ9gTA3O+nXy7wEoIzpehF5h8uvvhBwqM
         Dn9SjIIsCeRw6dCzI0Toxug2wbMM44Wab9Ly9pMInMBkubdFy/0XlFOqjySjPlTC9jEV
         tRhw==
X-Forwarded-Encrypted: i=1; AKwUvByahWAYOmoul8z48vEEeMYBGnDaPo6Jc3fGtOqr905oqgE1/Vc+OwWeaGFGb7u+9TtL8AhvCMC3rapThIXLzKbo9mDJ@vger.kernel.org
X-Gm-Message-State: AFq9FYLXck46cONS52vNO15BzeLCgtrDxD4RROiYJWSWMyS6s470NXtJ
	XzkIj93f+MOayTfoAEyTg7vzY8NgQJRHGXR9lw20LuHqaoIX8094bg2l
X-Gm-Gg: AYBFou1/rL/2YEygrnjQxJO5BZEJu6RDpq2YZHQpZEeduxQ5MmrSxfK2+GHTKffvlyn
	BQJUVKHREimzXqU57wDsAtjG/nUsIEOd9+vzTzckYAO5nu1Y4qIQcOHc1MzrftYUbpILEUMeLWR
	5kdIYRyfWRV8HNeoXpzdpx8dKOoGwLxZOJmywGtn6/dzJjniud9hZ8/ulSWrU1wcij+h11dZKlw
	hkBuSEW1OEeqnCEom96Pr03zPSYaznmy+IAlyrJxzGuVXDN6cpYvlxNJFxQQG3w0sgQLscDOE06
	XQKUTaRG7Y1APNK6J0HWHee7eBxTmIfh1ibQAseFM/+Qb0ymtMNAW7Pd535b6zj0fGg9c/jLxRn
	kFHD3QAywwNvDgKyORp4tnsWFGCz8SenD51FM4ZdeJC0h3b0tLTd+Yt4D0VxtG3sJAazPSLd/NZ
	OGp9VKTWSKXQt+UU0MZ7wd0lLACc0UaaCy7kJb1L8bp6nMzMPuhZrIl2rvp1WnjqYkSEAYPPxQu
	krd/hBAZNjrsNKRBWajvAaJS4Jniwc2e6o3O1tZIyyQPk8n4Q2/CLN08vSoNZPblYK1ftiQJZAG
	Y1AjJya3uWtNAPH9dytJJ0QeIKbLpcxzg2bzWnKzQOQ=
X-Received: by 2002:a05:701b:2414:b0:14c:d84c:7182 with SMTP id a92af1059eb24-199356256c7mr3987099c88.22.1792896526990;
        Sat, 24 Oct 2026 19:48:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:46 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/8] i2c: convert i2c_smbus_read_block_data() users to pass
 buffer length
Date: Sat, 24 Oct 2026 19:48:40 -0700
Message-Id: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAhu3WoC/yXMTQ6CQAxA4auQrm0yFDDqVQyL6UzB+gNkCsSEc
 HdHXX6L9zYwSSoGl2KDJKuajkNGeSgg3PzQC2rMBnJ0LB0RKgW0Fy+GSXxEfo7hgdHPHtnVVdM
 4Pp3rCnI/Jen0/Xtf279t4buE+TuEff8AdQ4tLn0AAAA=
X-Change-ID: 20261022-i2c-smbus-read-block-data-b043550b8943
To: Mika Westerberg <westeri@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Convert callers of i2c_smbus_read_block_data() across input, ACPI,
IPMI, platform, and power supply drivers to pass destination buffer
sizes, adopting the 4-argument form introduced in commit 68f382641f8c
("i2c: smbus: make i2c_smbus_read_block_data() safer").

Because the prerequisite commit 68f382641f8c is in mainline now,
subsystem maintainers are encouraged to pick up their respective
patches directly into their trees.

The hwmon subsystem conversions will be sent out in a separate series.

In cyapa_gen3 and rmi_smbus, passing the requested chunk size bounds
the transfer and avoids potential out-of-bounds writes when reading
blocks smaller than the SMBus maximum of 32 bytes.

In vexia_atla10_ec, the redundant intermediate bounce buffer and
memcpy() are removed so the response is read directly into the caller
buffer.

Additional conversions update callers in ipmi_ssif, i2c-core-acpi,
elan_i2c_smbus, and sbs-battery to provide explicit buffer lengths,
and update the prototype in Documentation/i2c/writing-clients.rst.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (8):
      i2c: acpi: use 4-argument i2c_smbus_read_block_data()
      i2c: docs: update i2c_smbus_read_block_data() prototype in writing-clients
      Input: cyapa - use 4-argument i2c_smbus_read_block_data()
      Input: elan_i2c - use 4-argument i2c_smbus_read_block_data()
      Input: synaptics-rmi4 - use 4-argument i2c_smbus_read_block_data()
      ipmi: ssif: use 4-argument i2c_smbus_read_block_data()
      platform/x86: x86-android-tablets: use 4-argument i2c_smbus_read_block_data()
      power: supply: sbs-battery: use 4-argument i2c_smbus_read_block_data()

 Documentation/i2c/writing-clients.rst              |  2 +-
 drivers/char/ipmi/ipmi_ssif.c                      | 39 ++++++++++++----------
 drivers/i2c/i2c-core-acpi.c                        |  2 +-
 drivers/input/mouse/cyapa_gen3.c                   |  8 +++--
 drivers/input/mouse/elan_i2c_smbus.c               | 36 ++++++++++++--------
 drivers/input/rmi4/rmi_smbus.c                     |  4 +--
 .../x86/x86-android-tablets/vexia_atla10_ec.c      |  4 +--
 drivers/power/supply/sbs-battery.c                 |  8 +++--
 8 files changed, 60 insertions(+), 43 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261022-i2c-smbus-read-block-data-b043550b8943

Thanks.

-- 
Dmitry

