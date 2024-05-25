Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7FB54BE7
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 May 2024 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716665946; cv=none; b=NKVSEoudBVbSX6LgSRVlLhonn+BpbMzA5IS5TjbVo4C0M1N3pnFPhNyrDRfyZmTeyWEt5eyUNcTxQaAd8hkU3Ii4YJfDG0r8rcjK6dxW6YOuF4a4FeH2LJIBrg2Y9978saKWFay4MJpR9z9JMmIocP0boa1ORNPzdbh5m829uWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716665946; c=relaxed/simple;
	bh=OSNW2roLMfiUSA87R4pPRPVYZcVL7aMGo6pv3vq94MY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qqq04J6VloRRW4nQaqaFNBy0+t7XysUaip1VCuMQl8pgxxMzHXx6x1RpREMfA8wHQks7N+vCcwjwNnKjtt8YENXCMjTiVJpslf2dpk8DwKthZA3syqSJM+qmH64XrqQ3RJenf11pXd/M+7j+CBg7S0suppu9OZV8TkT9p9tPiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DM6pXh14; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DM6pXh14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716665943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DzMdNhGLyb4+fTr0O7p7PfknaZkUc8mWopOF7BZ5LKY=;
	b=DM6pXh143fctrvkOxkoWrz2d9H1kg+WXdFeFt9sY08dfpubitaLch/7+WyWrQo+kMhNNB3
	Gwvh1Tr/LoGokCDTguiwIjYlK9Da4EAaMcou2yMzIgyc5bpNTievi2AcFNpk6YixBqJ7c8
	+CTwpf+vyv0lIcQhO53MwxgfDRRaqmk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-613-t75SzW66Nv-5obuJwYj81g-1; Sat,
 25 May 2024 15:39:01 -0400
X-MC-Unique: t75SzW66Nv-5obuJwYj81g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8C2B29AA399;
	Sat, 25 May 2024 19:39:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB0EF7414;
	Sat, 25 May 2024 19:38:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] Input: silead - Always support 10 fingers
Date: Sat, 25 May 2024 21:38:52 +0200
Message-ID: <20240525193854.39130-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Hi all,

The first patch in this series stops making the maximum number of supported
fingers in silead_ts configurable, replacing this with simply hardcoding it
to 10.

The main reason for doing so is to avoid the need to have a boiler-plate
"silead,max-fingers=10" property in each silead touchscreen config.
The second patch removes this boilerplate from all silead touchscreen
configs in touchscreen_dmi.c .

Dmitry, since touchscreen_dmi.c sees regular updates I believe it is
best to merge the 2 patches separately. As long as I know that patch 1/2
is queued for merging for say 6.11 then I can merge patch 2/2 independently
for the same cycle.

Regards,

Hans


Hans de Goede (2):
  Input: silead - Always support 10 fingers
  platform/x86: touchscreen_dmi: Drop "silead,max-fingers" property

 drivers/input/touchscreen/silead.c     | 19 +++------
 drivers/platform/x86/touchscreen_dmi.c | 56 --------------------------
 2 files changed, 5 insertions(+), 70 deletions(-)

-- 
2.45.1

