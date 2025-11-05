Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A55E3191AA
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Nov 2025 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358281; cv=none; b=P/5l27jBfOux3Nl7lFvOTcMqF2JOjP4moxhj3eUZOcW6uht9fTook7DWf5wSgD2sm0QGG17swLK3w7FbW3QuyJ5+00Wg4d4I4RH+PkvxC7eXYEPBzjmhhx2xk9zGgirYQFMqrDF9jteyYzMxU3ULSrsvg63YdMQ4D6fei6ZgLe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358281; c=relaxed/simple;
	bh=A5WxgB24Iicz/fulYhpscwRvjdTSPTIWkt/b0QOJr80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AEho3EeD0pBgDylqQCa3ty2h9HN974Lad8O9juD///HObpbGtjlhTIxdjZgXB19atXLPYqipOcGJkd9GMV8kr8pU9xU1wG2jjtle2I+qinS2r9a+Xi7LJso6witq9K79urBsxQCB0QbXJaPXKlviVSpl7G8qUlfwKN9l/wHzLlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q7vsxQbc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q7vsxQbc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4711810948aso49114825e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Nov 2025 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762358277; x=1762963077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/A412NFhvhu3H4tQb5Y6cQKOWK78E6hdKCTKbsd/sQ=;
        b=Q7vsxQbcWbCVDwpOJFGcWMB3eYjpQknreIORyPJ2OLs3rvAzTGNK6supncvXzYwJmo
         rzXCpDP8beYY8CvwXxaiAL0h08itQPcylTPTkWUCAW2K7iq6omV1kwjwkDzduBIwXvbp
         95CP7ggiozkDA0NBpHHaobFU1+an+BPN8AeTklo8bVPPUMWmbbzx/Ja8IOK9+5pJjvJL
         UMTcQQE9oYqbtpJtgnadv5IKATQD/oX29G/MBzihvHs8gxq07KmmJ5tMuEU0WacI3JGO
         QIDMpfN6/XiyQDBsM4F0fb7w0cOkV+CnSsw9ZwYly6SrbqmwGtzfJfcWLiIzRqs5i3D2
         oRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358277; x=1762963077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/A412NFhvhu3H4tQb5Y6cQKOWK78E6hdKCTKbsd/sQ=;
        b=PnGig4Ll5ksQlf0nMs514cSA4dm042kt6qWop3XL7k417SjCgI8Ux318emNFeQcP4S
         IDk02XfPu9kbvJsd5IphHgFKvGcg9Ku2LSAEA4UFsgvpwRZ/Y4ix5LxPXhi0zUFmGWjS
         2Up3EknuWBCmH42Ju8VtOroxVuY2VlIT+BiBCvqmCKv4vHJmAis0BJIdTcufw7NSqoby
         UaI9CLxMoQUgcFSwMt+FZPdloKC4wFSdK1VecSk6Xhr/Cv50TfRaAtG9Ij5gxUWycWg9
         aiXGC5fKTjXsvHe7QhcVh5VfFIYVp7yQTUrJB2LiD2fwQAr2TKXEsoX6KhI4i+anUimw
         jE3w==
X-Forwarded-Encrypted: i=1; AJvYcCXktBg5J/wuechP6/u+NUzMBZeg6E5FvN2FtBNojQ0WZd97AzILrwzwFnpMB0f6g0YN2FczE3k6FvQ5R4HC2GKw3BVA@vger.kernel.org
X-Gm-Message-State: AOJu0YwI5bp0020kwMbZdXiqeO1P1m/b5+rroTMfBW5fZlHX+4T5Rv3A
	7UuWZ94zXhMB9DrOeM7eAx74XTxALdtInxmmMhsSa6yPKfTXu9Srv8juABHtV+fvFCw=
X-Gm-Gg: ASbGncsGJQzgv3Flg9m/LicAvt+YjKTOJiTLiOzSidQEJIj5HzhIcUW3OgcgaD42Pdr
	xxWt0VevbNPZ6gBivKX9tSppzcxcFVhm4kZN71axnGm5l1wlBJgwX0DgWVp0DdseN4m4xQ51icy
	P/sd2UnjI/WVZNNOETOA8e/fg3O5CNxvzAxRdrra7HVd3+785HKgYUVohC5uNIXkYt9LTGUqv96
	urVpO3f+c3VpIJA9BHBAQ0TX2AbHSW28+XPOM+0CJsJ8aUZQN/UsP5CslfBDN12ITMpcX1BecHg
	hqqDxIoPhr+EKseP+gwL7BnVqJFaZSJTmg5pt6TB3fJyBU2yT4UOVKZ0xVAj85QIlLCodzLb8qH
	a70OWUYwheDxVStwLIcNxCfLIchdJxlTtlnGTU6s7gI6y0yslR3GOOZv3zi7VBhhM4L8H0PWFyM
	sLpa0E1LqI+E/+O0qeNW/g2zI=
X-Google-Smtp-Source: AGHT+IFjpeqoO70UXV5l6zbIwyENFWbQ0LYrxlDZKajaSiejeP7cbeJkXoreRtd8Wj6Dd3kCS/n7XA==
X-Received: by 2002:a05:600c:5488:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-4775ce15707mr33093435e9.29.1762358277271;
        Wed, 05 Nov 2025 07:57:57 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc2d14sm55567045e9.1.2025.11.05.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 07:57:56 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH 0/2] replace system_wq with system_percpu_wq
Date: Wed,  5 Nov 2025 16:57:34 +0100
Message-ID: <20251105155742.293326-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

=== Current situation: problems ===

Let's consider a nohz_full system with isolated CPUs: wq_unbound_cpumask is
set to the housekeeping CPUs, for !WQ_UNBOUND the local CPU is selected.

This leads to different scenarios if a work item is scheduled on an
isolated CPU where "delay" value is 0 or greater then 0:
        schedule_delayed_work(, 0);

This will be handled by __queue_work() that will queue the work item on the
current local (isolated) CPU, while:

        schedule_delayed_work(, 1);

Will move the timer on an housekeeping CPU, and schedule the work there.

Currently if a user enqueue a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

=== Recent changes to the WQ API ===

The following, address the recent changes in the Workqueue API:

- commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
- commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

The old workqueues will be removed in a future release cycle.

=== Introduced Changes by this series ===

1) [P 1-2]  Replace uses of system_wq and system_unbound_wq

    system_wq is a per-CPU workqueue, but his name is not clear.
    Because of that, system_wq has been replaced with system_percpu_wq,
    keeping the old behavior.

Thanks!

Marco Crivellari (2):
  platform: surface: replace use of system_wq with system_percpu_wq
  platform: x86: replace use of system_wq with system_percpu_wq

 drivers/platform/surface/aggregator/ssh_packet_layer.c     | 2 +-
 drivers/platform/surface/aggregator/ssh_request_layer.c    | 2 +-
 drivers/platform/x86/gpd-pocket-fan.c                      | 4 ++--
 drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.51.1

