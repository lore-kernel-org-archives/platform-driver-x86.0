Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E24A364024
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jun 2026 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620517; cv=none; b=QrrL9+pKmt869ZzsflXpAKkzvPJ97yBmicyh/9gc/QuktxDSzkYkpPu5lY3ligJ0Vkv1r8ttZwRxRleKNQF39MdAKjqcg5P5Gn3tz4gB0Moh4UyTz/m/G4XrAc5OFE63/iuPsdYoBGajiWZesgNHea2d7GO49bAbNlx8RyKCms8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620517; c=relaxed/simple;
	bh=qIKNnZDo8EUGzXo7wgRqCdxxihauVPtsMOheJpNoXq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crGreIsh7mtrhfReLeRi0Jk1sg+Vm20ecnL9VZXwK0Fk6m9X4MPyu+sbzcFCl44VVQc2UGx1fpoRVLAZ8KqNZn2NFVLRxiFAPrxIhaqgHAKC55Hy3+UcIQ4Ro/fodC/xN7TtMZwLcoU1zuVBVHHXh0MuCbsEYDz0VbKttR3kTFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaS2v88r; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaS2v88r"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ce9df49c5fso71713256d6.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jun 2026 07:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781620515; x=1782225315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmq/QimsdhEtIpRxf4UbhGsrfIFEnRT43zk1gpvst3Y=;
        b=iaS2v88r4gLEWzd5RJUb1AjkGL0b91Z5L7Q1Fb2OrvoUeT3zCXSXAjDPQBWWpDSCYX
         LzPRB5+r8ii7PZf7VrOkIdEndOvYwy2aAY3jc/NaIF7dS0dywV8cpd0Z05kNLv5lC1Ij
         9WHBVz/oUi0f1cjtPCe0EmLIQ0OXDhvAGhiPKRKz3AYyVKoZZS1GtXzMmjH6BJzeoMW3
         51Wce8h1MBvhIuFDGHlpevZlQ2IGejaPE+QnUfEnlUABInu0wzKeOj0MTtzah0MyCSww
         +fROgMkKq/sUg98U/z0do7sVWyX3AGC+8Mkor4VkezlyXcPtPZYBuJS29IE44WapakKP
         qWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620515; x=1782225315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mmq/QimsdhEtIpRxf4UbhGsrfIFEnRT43zk1gpvst3Y=;
        b=PNKPQlVik1J910R0ArAXeWf7WgVPlHQHmeRvI3T+w/g8qzYK8w3bCA5ZQdAf6BwvuH
         mB4LiKVCrhdya1TsqwsytlYrFyseqIspdprnV+nSY5n+zRvT5ecZL8tLjPrzdscsXoOM
         VuNWfmzM6fB0qCmseIv84G7yq29mmWNzU9zoTIgtUSbPfXLpG57XUssf0Fiib0kYHkRm
         K9Hs9bb86bzdaJYlaOV6LnL7EjvcawFJftTVlUXhWUPrvJ1o3iSfMi277nOIGj/XNHXU
         pIpBpX/Pv5enI5V/frLt56VTBszA0E7AkGiT7L9WgUqvbI0VHEes0C39oxtZUEBz4f34
         8s+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Cfib2+xabbT+tHcqahxkOBgE2d6mdvjx8Y3g/O31e+glB6BOjunvgr9AxQn5sgQ2Jt+iF+7pgs4e3wC0LMmKl2rAX@vger.kernel.org
X-Gm-Message-State: AOJu0YwHg2iYdspchzxC+L+OwYTIiUKPpbXs0Gyjx3mt/SqPIDvpkzle
	DWsL92NpzqmQvjHri6cl++yVEFLiyKnKwBfY3RUglN2w+sJXblH9R3bpS8fzT7SD
X-Gm-Gg: Acq92OFq5/0J2pzD5nUzMOjj7gTAs/p2ZnrZkEpt2F5StPQ5lUSTodSA2dIJO8ZfVlG
	eofslt+Q1CI4etqyFucMkfb4sg5H3k1koZ4RRCVb/aPJD4FuUNx859czm6+qj4fIUlBC1Ng5iBO
	32Uka/7ZvxFa2di+kzRDZ9EvKBmFbyaY10RmCoYG4iIi+AGMyv7sAUAoZYKGK7D8Rj7rOrGHc2F
	8GzWmrjy8s+gQwuQwKnsaAQZ8vaW8a+491SIwK68RaMjkuvj3CucfGsGOGIwdG0F3jHXiP/eva2
	+ZYRfNrC6nKSPdoZxA6NoCbCf6CanO+36HcmHevozzM/3fMwPyYmclt4yoh0V6ik/gRiol59sIK
	I+GfiKyefbYB0pSE70GR/uo7sLe6VvaWaMESko4ymbKriEWLiBcWe01W/yEhuEev+f7X+DTiYTL
	aksl01uNLVB8kmZLaZOhfaaIou1S2H/VXrgNC1JqvlVyJ4E8IJorCn+tT2RDBvbC76iY5W
X-Received: by 2002:ac8:5916:0:b0:50e:635b:5579 with SMTP id d75a77b69052e-5195351925dmr222413111cf.19.1781620514735;
        Tue, 16 Jun 2026 07:35:14 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a3c4asm141855521cf.14.2026.06.16.07.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:35:14 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	Dave Carey <carvsdriver@gmail.com>
Subject: [PATCH v9 0/2] platform/x86/lenovo: Yoga Book 9 keyboard dock detection
Date: Tue, 16 Jun 2026 10:35:06 -0400
Message-ID: <20260616143508.124122-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610155340.342949-1-carvsdriver@gmail.com>
References: <20260610155340.342949-1-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin,

Thank you for the v8 review.  All nine items are addressed in v9:

  - Added struct lenovo_feature_status { __le32 id; __le32 status; } __packed;
    and used it for size calculations and field access via le32_to_cpu().
  - Added ID verification: return -EIO if le32_to_cpu(fs->id) != 0x00060000.
  - Dropped the error message from yb9_kbdock_query(); returning the error
    code is sufficient.
  - Replaced the global struct + mutex with a BLOCKING_NOTIFIER_HEAD at
    module scope.  The event driver fires the chain from .notify_new(); the
    block driver registers a notifier_block and owns the input_dev in its
    per-device private struct.  No global state, no mutex.
  - Switched from .notify() to .notify_new() to receive a pre-parsed
    wmi_buffer directly.
  - Marked yb9_kbdock_attrs[] and the attribute pointer as const.
  - Moved dmi_check_system() to yb9_kbdock_init(); DMI table is now
    __initconst.
  - Used le32_to_cpu(fs->status) directly (BKBD is zero-extended to 32 bits
    by ACPI); removed BKBD_FIELD masking and the BKBD_TOP_HALF /
    BKBD_BOTTOM_HALF constants (not needed by driver logic).
  - Dropped #include <linux/bitfield.h>, <linux/bits.h>, and <linux/mutex.h>
    (no longer needed); added #include <linux/notifier.h>.

Patch 1/2 (lenovo-ymc) is unchanged from v8, with Hans de Goede's
Reviewed-by tag added.

Tested on Lenovo Yoga Book 9 14IAH10 (model 83KJ), kernel 7.0.

Dave Carey (2):
  platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
  platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver

 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock |  19 ++
 MAINTAINERS                                                |   7 +
 drivers/platform/x86/lenovo/Kconfig                       |  14 +
 drivers/platform/x86/lenovo/Makefile                      |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c                  | 310 ++++++++++++++++++
 drivers/platform/x86/lenovo/ymc.c                         |  19 ++
 6 files changed, 370 insertions(+)

--
2.54.0
