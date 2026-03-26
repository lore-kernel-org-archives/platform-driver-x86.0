Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CB534EEFB
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 23:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566720; cv=none; b=FlkStiyK3Ju2GyLUS2w3Mu6ig2KEFlR6skUmDUJSne9s6EUDni077zpxBPqrp1w+zUNLMpc2gBkc1WQ81yDQVu/QrCZHtvBh8yYdgNW1nO5XQEsLv+1SJRRX7HHdpQHwFoNhF9RoHvZQm8K/Za0K8coWfXQDGipR5oH3AyD+gJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566720; c=relaxed/simple;
	bh=J4eO02+QzGvfFg7I5hMKGmY2nQ01YfbM1tG4RywxB9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mX8NI6y0Ceqa73Wh52oKFeqybHjzlZQb34sy9mhsn3aSI0fLUXYCIlkrIbvLJMD2kKk7JROdYU+HpXPO0CG0J6VLkjTrD0wr3VFtp/pbi22XZp6uiJiojdCCnC5eoHcpGUFyqUMLYtSIpwtbjUYigBxfybaACPt0HIwJfOvaNlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tMEY9Cck; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tMEY9Cck"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fc4425b6bso16184977b3.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 16:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774566719; x=1775171519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxYBoEkLa1OVizV4YZ63a2ig7qDekbivfUit9dhfc2g=;
        b=tMEY9CcknzE9Rs0NXSKZ6Zuj7xi3mRpm3nEzSUreiGM5iWLBQo1lq0XhQ718sXS4+v
         BvgfpERzSzQeFYQYRLEkKxf+195X0SgxKL7Jyy53ZnQB0YVttAH94TMbe6OAkczuiPdH
         CAF7CJXNU+onOmqdptwZRtI/OiW/yxpsUvw2fLPc2oNY5Ag6NTMwI80J5Xt2dTAeaz1G
         9sHh2IhQ8iWPdT1lMuAvJaMLkZdvE+5r5CPpO0emuzQGgWseVdrUQ95okYtc0kwyt9J/
         TQg/sb/r1kc9H2FfzGFFDT/OAnnVJezIzoe4azQ6m2PBLg2fag4+Y8Ceyp/VKoli2Ksy
         3Nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566719; x=1775171519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxYBoEkLa1OVizV4YZ63a2ig7qDekbivfUit9dhfc2g=;
        b=LuCUWTupez6dYhjNXNOCAUn5VeuEXN+PCjU+5WuiJ0KAyEyAOIZLdemEAttbMMn/vv
         ptDDRbBXkoLgxxfNBzOgP6XaEIl25uA4thgGUWfBeQSv5Rm3RHHBscbcmQyGXxtTkIT/
         S7iPDT24zGG55iQvI6JBO8MhYQfRSNV7Do5ipV0ofmQp7bDs1sU2h4CyCKbR5e/3PdOb
         mJPtpWVfhU4HZ+J0YdbgGW0LTank9ZC802TK8j7QOwXKB/Tx5qO8MOS2e1mbdJoilP+Z
         6vKOh65EbzENAVBXss0hsIwiWhdBRcL2/GEARhGg5W/TpLW+7Cv9HP6wx1LEm3QtuZqj
         rtUw==
X-Gm-Message-State: AOJu0YwbE4v+Vi6yJ01dUlpoZDfV/0yCZRBOZfuAjcrOQA1rGPkSwD+a
	MmfHUjhrSNj/v81yEaLzryNkM+0axQzC4RxuMQOMR0Q/mwtE9vkWBzet
X-Gm-Gg: ATEYQzxk0KvOA7Cu3ilnWZ+9VAZRflK8GiixHGqTZcnq+r8F6xyF84IqY7hHXbjNtOg
	9+vpJTvij75TXh6FXJssnEf2QkiPFzMzzKqa2GmKE2c1ZvNQkuriYvV8ZLih5sETUWMUAPTogZO
	TnssXwY97rWSHjnBg858WGd32AG2NQbMH55DB6dbrwSbot/jJzoBlj+OT5iTykbsi/92ZJ+iIro
	8Jgg0kdn6y4e/bMsN5ucw3xoAvKKZQ1f9BlbvqyqlENQgFhsbx5dYTwwPGk3vhPebsmb9xyuSHi
	xeivWSEt1J8o//8dqy4r9CFlJZjqcGZ53TMUnheMvNUtqbEZHN+tfWvjnRh7LgWsrpIlVl+edoC
	dtcZOm4Bw1FHTx3FLCguBqTHkkXWUQddFhRwODOg36F92SL5jCjLKv6m/abtV2ioelgi7FMZfDj
	7Icq39tr4QrVrSvKBmSUDH0KUFzeo3/yQpwiq8JvCDXDNbwEqH3nIQxElODeKbc4O+x5hx5UIRf
	nudjtkFgwhxQU2bwTT3Lb7O
X-Received: by 2002:a05:690c:1e:b0:798:138c:76de with SMTP id 00721157ae682-79bde0e71e5mr1952817b3.41.1774566718626;
        Thu, 26 Mar 2026 16:11:58 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79b1e3fc9fdsm20925527b3.38.2026.03.26.16.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:11:58 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH 0/2] platform/x86: asus-wmi: Clean up asus_wmi_set_devstate()
Date: Thu, 26 Mar 2026 18:11:52 -0500
Message-ID: <20260326231154.856729-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant control flow in asus_wmi_set_devstate() and refactor
control flow to improve readability.

Ethan Tidmore (2):
  platform/x86: asus-wmi: Remove redundant condition
  platform/x86: asus-wmi: Refactor control flow

 drivers/platform/x86/asus-wmi.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

-- 
2.53.0

