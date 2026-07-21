Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6643E071
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 22:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672435; cv=none; b=AiuOJCFxv/9kDPVzLUN1Qk9TssXNBNWfpNPllDnB1YNvAQCNMdCMXCy4T7qQdAhEk5o42wADIu6d3iZdHX5nmoRPJjb/V6UnYROXM1720e25Qh90qmlNH8Pp3iMBakvJsVMm0RDCA2DM/G5CCpVLSaLKML4ubK0acodiYTYX7dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672435; c=relaxed/simple;
	bh=9DdbuqtaKzZh1R9CCTERSF6RAA9dk/W15l0/lydYcy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k2jpYI5eATCKtNRZ9vjasaksAxoqbOzi01X9snZap/ZaWeu+dSLStwOLrhAgX8raBAwsEd3dynvJ94DnfPvgZ2NoB0dTMlRPk8PyFpD0oU4QstNFu30e6pmum3ulJGQqVBQTjIP0XmXUYWWUx/tqdwXJXCBNtwL3x92HXbxo3yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YArgwRh6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YArgwRh6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso28838975e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 15:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784672432; x=1785277232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbYwlGxaKCBfrz/Uw34KPIkl62TxQPT5RnrnjwxhvGM=;
        b=YArgwRh6y+w5mRDkieWcT9Y99AiZ2k7gtkIQbADw010wphVY2ScRJYGvZEa4Rw/8yB
         WIwsCLbdNads9a0c6Hu+GI/w8KmODBt0JPaP5GWZZiblJDD5lecZsmmy5yZI1TTQta/P
         YT1Pz7g9qTUBjcJSYekuIlnOmMwz8cGPDeRcA7ZPHo4oaAWox+JHFr7PuTy++5jZLwXn
         UdB7P53YSCXHuQ4/xMzKmqB8UXc1pIeasGh06zZCp2I/Z7EDo5MtMiuuFONwLoofAPDl
         NS2NYEywQnMqowiwSlH7YgafjwLWXOq962X0OqiiH8t+NiGBHwFyq6ji8ZnfkaHy2v/V
         n9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672432; x=1785277232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbYwlGxaKCBfrz/Uw34KPIkl62TxQPT5RnrnjwxhvGM=;
        b=SYVuGDNPdQHRSR2tDAX7AAeD/rAjwUI+DoO00e48cH8v6W87zEBDLEUbwaga+4YPCv
         6naGP8lbCPofNMxK1xoRhbJH0+J5KSvqENHW2qllzT9TWpVNCuJlOSj/8O36VAwNKKyD
         NmxnqBKu8Fbb8RRBEQa8uqwsLlnWn/3mdyoB4MO594mnAMfGJQIFukl0m+XzaVLdfQa3
         S5PTjQuYlF/ZwmNNx4JSKhWMRFXWA2KsW/CkpgWp1NnpObA9Np1zDh4UckQMuizDVheQ
         U7Kb8hPl4PWlP+mGo+KkUzvMKBhHF65yNZhor/s7r7iuhPhEdO7qBr1NEZ7KQvKfqQ3g
         wwDA==
X-Gm-Message-State: AOJu0YzhBfglV/z/uS7qi0OQl4cy4Tbc7OZhebWorxC3LfNtEU/VlgfO
	R7lFxscF7LZVfZ1Qa4MKs5Z5/UDZ/NjHpo/Gah09g2M4avU+CYbr9kIT
X-Gm-Gg: AfdE7ckXpAL+0Dd0oyDQzy6DNHOJLS7e0SAfKlDBnqMK4G8VVCgtaMBLaCvZykq9OQP
	JIecuoZKOiqxzQwOhOKz/Q9/evyg7ii6JrHhoccfEdO/zoaieP1PGXq1QKKUinwpbd8aFinDg1J
	as0qKp78U2DSkwIQ6u8QEJ2ouTgstguPoxq998zCVy5yGx6Tz6xAYHDK0uhUIAQdnxH7mGOt8Ze
	1B1RlTMDrgqeEKtSyPrHRqp2nC34uwPfEqqAFxKkUlZhJYJNJ1fJgmRBxMFPfLERBUOEBrd6EFS
	MS8SueQFhNbtit4I1NqY5TutppaqZBd5SGBKvwjgyrDfD8lRToK8PXkiG2A1b5K59mGnu7+JDo9
	Ar1ysRhfk3ufTqWerTYbHxbO+51iqP7rFCTUbLCsypF7Ry/cieXd+nYN/wywNuzD/MK7Osxo15t
	curg==
X-Received: by 2002:a05:600c:4515:b0:495:4689:7147 with SMTP id 5b1f17b1804b1-4954a3f4a34mr273388575e9.12.1784672432277;
        Tue, 21 Jul 2026 15:20:32 -0700 (PDT)
Received: from user ([154.176.96.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bffefsm89553165e9.9.2026.07.21.15.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:20:32 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH 0/2] platform/x86: hp-wmi: Modernize driver API and perform_query()
Date: Wed, 22 Jul 2026 01:20:18 +0300
Message-ID: <20260721222025.29917-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Refactor various parts of hp-wmi, including hp_wmi_perform_query() and 
encode_outsize_for_pvsz(), to adopt modern kernel APIs, resource cleanup
attributes, and buffer bounds safety checks.

Patch 1 migrates the hp-wmi driver from the deprecated wmi_evaluate_method()
API to the modern wmidev_evaluate_method() function by registering as a
WMI driver.

Patch 2 refactors encode_outsize_for_pvsz() with a switch statement, adds
early ACPI return buffer length validation to prevent potential integer
underflow in hp_wmi_perform_query(), replaces kmalloc with kzalloc_flex
to zero memory, and use __free() macro to free variables.

yahia (2):
  hp-wmi: Modernize hp_wmi_perform_query() to use the modern API
  hp-wmi: use modern cleanup and refactor allocation functions

 drivers/platform/x86/hp/hp-wmi.c | 98 +++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 33 deletions(-)

-- 
2.55.0

