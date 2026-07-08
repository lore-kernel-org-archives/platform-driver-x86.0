Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235D643934B
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jul 2026 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523359; cv=none; b=CZhAWlPyMHb7PEkUKGelO3XLUXRro0BoVjqxVcvuvHMQo0M2GLk29Or3gfdhnObh499pyGBAUIK8iiLItLVbYMetjNMe3a0cDW2Mm/GJgVGg2xsA2T94IdDZ5xnHO5g3c6O639Rd5QZ2NiTqogzLllq5n4OLdFu3STuw3C50XI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523359; c=relaxed/simple;
	bh=6FHB2KVdyCs7Ev/ACZ4h/nmqM0qYfR9aN11iuDUGpiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qU3IkLoWxy+5fx4huleXvL3dC8ib8RzrJSrpay7xZ3hu2tpQyoKV5sX/ALatMvX7NrpDde6/nRtb/Pqa+Qsvq85Vid8uwFYk7jEL18vEc61amh/mbaRoYWbfvauy8zscPhJTbuF58yeZr4CPwKd8PJSS2gvawbwzjwxvq3FPOCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcN9G8rz; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcN9G8rz"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6651bc57458so672825d50.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jul 2026 08:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783523357; x=1784128157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GIvOAqP0mpaS0VshVHzhofdgPrfSaI1TpwUsXOmOKMg=;
        b=VcN9G8rzOJnWgrZVFeGMxaG9bjyw8LakXuFH+7mKP79OnGXWpCH1isXz+3QNAcc2fp
         L27BeS8aKbMLUi3HOsSrgk5GGhjbMZIAIaK2dhmi0mVbHj8Ee8Bj5Jex6Vma6NyuXi3n
         0EVedziBKDe/OPim6PjJtdwurCtjn4RGa3Vv4D0Jnc0bGbNQNHYmWu8hq8tS79BT95Q2
         t0rPhPdXeSTZO7Wn7cnbDL5Rhllc5PofE0WH0GlsSGFpX3RNkcpuDFzaP2NMYMrdTGWc
         E3jCb1gVaqYjqSuZLBVZFD+ap6cfYs8z5Tjq1gTnmoEQLya0KPAWK9S4b8Quwe2G06uR
         aVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523357; x=1784128157;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIvOAqP0mpaS0VshVHzhofdgPrfSaI1TpwUsXOmOKMg=;
        b=oTZXm4R9cCA+bLBxhq6WGlFdULSs6HTn1UQCC3Xa7bYRvCCqU9uUb6RPssgaWI+CMo
         S1Q3wB1Q3pTdGnpe7OteO0R5TUKAOh+oocuKhLvVJuPRd0KqR+H8Ee2YzSGGVEvMQaA+
         Ae62yBm1sQlLiZCyeoOfgcICtxD4jW15KdMvzw344RiTI0O2lHc1EN108M3DyCzakPk3
         2D8afT6r/T63MTm+UMSY8Drxjl7KI6WSJEIRL+PPKz6H146xCXuHnNbUZ+x6gmQv9nVZ
         xWzpTfzyXwzMgGIjdjxRuGRm1UMHuDXE+23lCOUiK9CoP4DzSQIuwrP3BNoIJvAYCHgE
         pizA==
X-Gm-Message-State: AOJu0YwJ6Y9DfCDNUT2sQyYzfUDiiXjUBFqyLfDC2nMQibV9kPUkAcQy
	3faTBaxMn4O+cOCxINVTgG7h6cpVhPeBVeG2jfvqcT6w2Wm0CUY5EHk2FZHYYkFm
X-Gm-Gg: AfdE7ckqWHbVYKizAlwxz+kABa/Pia6rCINUEHHn3cW/slLEWrw/DSQPp9uNQ7sNFds
	YcTsc9MnuFEBPO2/WX6XlqdrbtFw8/yqXi+PgPZNQJEvPz1ImjaZl98fzZJf4BaGPIOmuBplhRl
	UOAMlry4QhXPzuI30XKRxQJl59cUGFrjPQzsCmvHVClwuTVIut3CHEsKacN8C8o5k1ng34V8Aju
	N6cK/hpXTBTEH3kpnL1Wbuusa95TCjIz/u6ibaWXOWlw9sGQL7TjK+5sR1GwqLMDtRuazwBJHti
	GXatp3MQRE+TyimwoHplhXnBnTbHoefjYFoQiSoJy5XCDmSshvIaKsOqRfI42D7nFFa+klgTnIj
	F5024T1AgcLRE4cFu/lXUWwPPzpaI3RyE4anA3SReETqNh/6VBPUHECs22CsUyfFNaeNY3Uqdei
	OE8VXoygS8mcc=
X-Received: by 2002:a05:690e:1917:b0:664:da95:cf4d with SMTP id 956f58d0204a3-6679f2cda01mr2102192d50.18.1783523356877;
        Wed, 08 Jul 2026 08:09:16 -0700 (PDT)
Received: from fedora ([2600:381:b514:354c:5185:bf38:e2f9:b87d])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a35d07sm2189485d50.15.2026.07.08.08.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:09:16 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de,
	johannes.goede@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v12 0/2] Lenovo Yoga Book 9 keyboard dock detection
Date: Wed,  8 Jul 2026 11:09:07 -0400
Message-ID: <20260708150909.23404-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260623125914.833063-1-carvsdriver@gmail.com>
References: <20260623125914.833063-1-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v12 (addressing Ilpo Järvinen's v11 review of patch 2/2):

  - Add #include <linux/sysfs.h> (for sysfs_emit)
  - Add #include <linux/types.h> (for __le32 and __packed)

Changes in v11 (addressing Armin Wolf's v10 review of patch 2/2):

  - ABI doc: correct Date to "June 2027" and KernelVersion to "7.3";
    these fields should reflect when the ABI lands in the kernel, not
    the submission date.

Patch 1/2 (lenovo-ymc) is unchanged from v10.

Changes in v10 (addressing Armin Wolf's v9 review of patch 2/2):

  - Update ABI doc: Date: June 2026, KernelVersion: 6.16
  - Add #include <linux/compiler_attributes.h> and <linux/types.h>
  - yb9_kbdock_query(): change return to pointer-out u32 *bkbd to avoid
    a 0xFFFFFFFF status value being misread as -EPERM
  - struct yb9_kbdock_data: add spinlock_t lock
  - yb9_kbdock_report(): hold lock across input_report_switch + input_sync
  - yb9_kbdock_sync(): return int, propagate query error to callers
  - yb9_kbdock_resume(), yb9_kbdock_block_probe(): propagate sync error
  - struct wmi_buffer out: remove zero-initializer (not needed)
  - yb9_kbdock_notify_new(): drop manual length check; use
    .min_event_size = sizeof(__le32) in struct wmi_driver instead

Patch 1/2 (lenovo-ymc) is unchanged from v9.

Dave Carey (2):
  platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
  platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver

 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock |  19 ++
 MAINTAINERS                                               |   7 +
 drivers/platform/x86/lenovo/Kconfig                       |  14 +
 drivers/platform/x86/lenovo/Makefile                      |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c                  | 322 ++++++++++++
 drivers/platform/x86/lenovo/ymc.c                         |  19 ++
 6 files changed, 382 insertions(+)

2.47.0
