Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98772221DA5
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 07:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604344; cv=none; b=ouIFKS8+OpAh4sJTEiXvTuHFlvqWLuEYrtwiZQ3ydvmzzXTfq5DLapoC/IJQVYZeRTIEFKmOzPzPqODIdHKHVVWst+bDmGduPR2Dz9jQCdaf634iyBkMIKXG8wEhPOTY/8PQ9ciwQ38/lmh3nvq8uRIP8l1VexrWPqEdxvGjYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604344; c=relaxed/simple;
	bh=Si1QvVZW2cyZhFItNCPhnZgDqOaPxdjxwEHoeO/uyhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RH7xGymCkJoNdlR1QXoP6Od7LvE3Fie/YpZN/px+45TSp1nOkUrr3UZdiZtqBGRm+ayV50GjfUybNWS7iHegD/EKhVSN+CiZHM1jwTQFAfGzbOtd30JuJTZDJK/2ilfYmF6ukpXCxgZQ1Zo0ZWSSXacprmxAqDiGZIsK8fuvNqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SqLtbziP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SqLtbziP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746604341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lRVyImEnQpTkFTjBNjAdsm9T3PFY6JNS8zC6D6rKBZg=;
	b=SqLtbziPMsHpbi+WccSRywb7PaxvQ2fwHGBYBAJAxRG7QIx6rGksgiarDREw8CSMQYfzx1
	048LB2gASVXOTJTu6OtfBgy5YaPdYPFwQsdJGyBA0rNTz63TgFBxliU7clG9DYhS3P4chM
	WtMJvGMcr1HD8JZkr7ObARLNZ3ea14A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-WSJa5m5nO82zes01H4Q6Ww-1; Wed, 07 May 2025 03:52:20 -0400
X-MC-Unique: WSJa5m5nO82zes01H4Q6Ww-1
X-Mimecast-MFC-AGG-ID: WSJa5m5nO82zes01H4Q6Ww_1746604339
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-440667e7f92so39111845e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 May 2025 00:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604339; x=1747209139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRVyImEnQpTkFTjBNjAdsm9T3PFY6JNS8zC6D6rKBZg=;
        b=SIGGvcNmlkbFzEE1lSEjdqhZNFIxFzzk2ktM2KqnWRygR1g0QSTerSobS2tOXcS9o7
         oNwqrhgTVjYfYwaX39P7YsWjXIXDXF0Fo8j5QBu3JzKNmkcATQPfpUlc9tfT2g2RqK5w
         afKK8dWJA+iK0i4H59YhCZi86GDdnxvOEWqf2sZIxBHShaw0XIoqVSuBPRpM3ULJ+f/f
         MPC1qxFDMWB6ilU/ccCpscGRy7FrwM4nVcMzP7sEe8SpvW4IpALH39JwKLAFYs2PM7Cp
         jBb5B5oyL0bKKnXDUZqh1U2lz2hbkiAzoiTmUooXWVs+L1f/8vIi6EWgl+iACTMY5uth
         mywQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWHmyObWFA40rwmeSVeENa8D0o34EhLpve+D/Qg5OxWDP2FiLk9IA67/mxiyb7GyJwTacARM1OLvC4LIwcc8GhZsAD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn4bxdJCo454FlT5DULjWvbkGtzXgJA07uXMwS/rcaA8/SueCh
	rKSvQsdp5cujV3fhVqGjoSedp52cwQ5jxCM57g+xogoKsnX1sDUf5309Ucqu8wBtiDUrhwzscbA
	M2OBQ4ePOskzhhBRBQnFWttJ3sUuII+00dU4X5kS/K+y8MQcEpvTXNubcGWTkWtPJNEQpuYM=
X-Gm-Gg: ASbGncs1xDm8cqKAUrArdu2k+HOxNgqvZzOoLhZur2g+pq7OO6Nk6NkE40y5zi4YDxa
	TCwVy3+FwMzQQYwEn0eFfFzBifpETfnhkQ1fQN+lxuVc2tamGqtdVrK7IFgb8YRFJCpm8+qnWhy
	92ndSeWHQPqm9AND7Nw1WM54EN7axanGD914mlaHLnfafpjE7ztwzqBHjGs+F5SAjVGo24V8YN6
	9cFEcAbgyrZfRNMaX7p6OW6ZGOoc6TIVH4a+FJVobBHhDW5mzeutGaUA58KUQNBhu+up/XBA7Lp
	zLnXdFKJ2Sf9XUVPJ73gL/KMFlQMGTp32miFOw0RAbB17amlab2vV/PGwg==
X-Received: by 2002:a05:600c:4f12:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-441d44e0919mr17543285e9.30.1746604339056;
        Wed, 07 May 2025 00:52:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6bbFfoJUlE32ZpjhY8SNYfXA9NoideZRSClq3CU4H3TaCkDCmJ5dagaVohFcNt3ifY5S59g==
X-Received: by 2002:a05:600c:4f12:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-441d44e0919mr17543005e9.30.1746604338689;
        Wed, 07 May 2025 00:52:18 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d43a802csm21562885e9.39.2025.05.07.00.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:52:18 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: rectify file entry in DASHARO ACPI PLATFORM DRIVER
Date: Wed,  7 May 2025 09:52:05 +0200
Message-ID: <20250507075214.36729-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 2dd40523b7e2 ("platform/x86: Introduce dasharo-acpi platform
driver") adds the platform driver drivers/platform/x86/dasharo-acpi.c and
a new file entry referring to the non-existent file
drivers/platform/x86/dasharo_acpi.c in section DASHARO ACPI PLATFORM DRIVER
rather than referring to the file added with this commit.

Adjust the file reference to the intended file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34a55e3ff863..82e7b053ea76 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6576,7 +6576,7 @@ DASHARO ACPI PLATFORM DRIVER
 M:	Michał Kopeć <michal.kopec@3mdeb.com>
 S:	Maintained
 W:	https://docs.dasharo.com/
-F:	drivers/platform/x86/dasharo_acpi.c
+F:	drivers/platform/x86/dasharo-acpi.c
 
 DATA ACCESS MONITOR
 M:	SeongJae Park <sj@kernel.org>
-- 
2.49.0

