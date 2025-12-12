Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5971A3029
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Dec 2025 08:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765526972; cv=none; b=FCcnkp4tYJLBvAsGF/nlyuyN1uPIqgZ9Ihuzay1lMFqW8BRPKnrR6RrE8QOn3650TmFuLwvnhfEmOWj3oY5d6TUVXB146wKRR7GvfhUyBkwbqYGrp/+mGWZ+LyTj5dESwpclrESHjGnwaYCTlmCpGhHPo/toc3ypksUqu8Ge/pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765526972; c=relaxed/simple;
	bh=K06CTF1+H8fsvJB8Sz7I3QqOSTfTlCxCmD4vCQHcp/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MD/IxzMsAIxYP28Ch/UieU9xsyD8BKC5eC0FYZU9uZQ1C37kdOE1h/8yacFezR28Xi8a1w1suD6jDHSVASooQvL+fwb/dhYZOAtj5dy6TnhQnUqbmqlHYSXpht6Lki/64XvA3If5fW+iMwICfKxVYXRIYqLl+1xp2mThbRCTj8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VQyN9t+s; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VQyN9t+s"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b735487129fso158767466b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Dec 2025 00:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765526967; x=1766131767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z4ODxaS91WWg8dms1l29deWZrC7eVseakTTbVZP9TPM=;
        b=VQyN9t+sLEL/hIuBW/KIOEI00UrAqUlJjnEqwC+FdON6JLO9z7/yUMsP/cwtSqfOcx
         D7CdkARndnfuvifT8wNgW11N7IwwnAqmWK76Q4E6b9iHh3M2IG58U9pMWbkCF9wzs89u
         LEbhI9HYa8BioFTqLVMf3lTio7rhTTeZPMsbq9cJMopoD9HyqdTEaSxCv9TR08ZHx5wZ
         XJ/cvZqmrLgksernPaiaU1JoiqT8GmGzmq6iliUP772TD72w6G4WKrXV97682fTIqvn+
         3ud+YZOH7fC4TyMqbm9XTuEwPnEMnKm8nsLAGUF/YoZWkh5MivVoMJ7gJdRJrj90CoCx
         p1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526967; x=1766131767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4ODxaS91WWg8dms1l29deWZrC7eVseakTTbVZP9TPM=;
        b=Q5sdwGK+0KpZN4amaCu/TGyqzCSUYU7n58DySJ3hvh6l4XRqtEm4ZCUp792JfMWYDX
         AxrF+lxZUfYes+UXxoLYgeNB1Gl7zhOVeLYE/pGI65mHdp+VGnSs9olE8pNyM/RAl7Nh
         h9d0aeA063LSJhvTu3gRPQ6jw/5p26uGDUxqmJ40GPpD4ZVqOkR5YGTtWxPyHbBxCoL7
         LmGjE17be9sIrf5pBBbAqpwoxhiVTmD6IEpiRk9ZOiWEd8xThrAxLvzetWoaUJ9/ySUy
         Ilj/O4RjyH6wkXg17FHOMb33lqfGTM+seIaMNM+h3zQh6WNsGH4yitaPAdvyp6K1Xlhx
         Si7A==
X-Forwarded-Encrypted: i=1; AJvYcCVCbkq0GltGiQulZpEjbARmtsG70PWvJmxwm9wUdNUNJfmusXPjJAPzZOzqy9IGHLTQhvp8ygtAR6TCiavtWrseFxCD@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ/Rb5FZjmvh2l9GBSPSe0ModaD0IVhuS9+VM0RRKCop8nFjeh
	1KqTVfdVU3afe1kcaYg1Lif5wqOt3HF9m/PcnLOyq79O1+i6ze5oHyVHJfSbZvbejKs=
X-Gm-Gg: AY/fxX7U+r7BHNKkAe3AKhvSIaMEvgRaAY/AAojCZdL3BPv5WX+4ePjHkvkXV+jbZEx
	mGv4Ou/09ZZJqookV4+qS8q4wY5smzfzQY3R8bKCzzXhcdMReswzk2KA+mrdEeS3as6EWG8K4JW
	1zxQhjNCgfVCAyqjKSuDe20fuN9w8DjVWwQZnIEhgDdy19Deia3NlkeddV8st34gcp4X/3ybQ40
	YyzJ2H2TI1NVh9IBSy72mggRf4vsD2Xvsju1zzXx4tuvjm8ZD7G8cPi9IZcskTuRTBriY/06UJd
	lAI4vR4XW5HQ0AXuNCNUmarR7pmGiZiuIJhvtqbx962HaoXyTYgTCP9Z4DeRYCMJcx57BahqMbP
	sUNyzqzYL8TjVRNjsQG2LUxtx/JjN52SqQPBjukIYqUBBLNZ7KlquMIRyyzGgXtCKMWq4Ms/+S8
	Rpsgq1fL3cVjOJVhAXzs/MiJ1QZr5RC4KjaYBcOeJAF2XemszjhE8dTDYjXzL0CNVkCrXZWMAWz
	Rw=
X-Google-Smtp-Source: AGHT+IGjlZGO7rwXFONsbS/nqwyomTwF06cuS1NBQZnSkxQyjYYdO5U9mb9vjrawLsD5RVoidrAzyQ==
X-Received: by 2002:a17:907:8011:b0:b7a:6c98:32ba with SMTP id a640c23a62f3a-b7d235c977amr57851566b.1.1765526967412;
        Fri, 12 Dec 2025 00:09:27 -0800 (PST)
Received: from localhost (p200300f65f0066082ad4229ee042f7ed.dip0.t-ipconnect.de. [2003:f6:5f00:6608:2ad4:229e:e042:f7ed])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa29bedbsm510984066b.9.2025.12.12.00.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:09:27 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Yang Li <yang.li@amlogic.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 0/4] serdev: Stop using device_driver callbacks
Date: Fri, 12 Dec 2025 09:09:05 +0100
Message-ID: <cover.1765526117.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=K06CTF1+H8fsvJB8Sz7I3QqOSTfTlCxCmD4vCQHcp/Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpO82hS2J33V3DvLBVORXLLnffbAMzV3OfWdh2a VVjbXTGbp6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTvNoQAKCRCPgPtYfRL+ To3JCACryjD6szyIbOAJaZIbJtZMnL1IOkIiXNzrMoIlqNyOhOwBe/3SwVg+zplh4KCp8HCJk+O y0YB98avclKkhAN8MqyBBiONeBwksmxil9PatLgexVwxQlb3BRfFCKaWkdecsThmRQoVC1dJ3FZ TiFdiZZFveRo4TT2RE2fj8mlgtdtwzponNXPqcznoA5L7QN5w2ZVUAGB3tRk585tZwFkZMYm56s B5YrvZ2zovmO2vhkdWeMc0rXKgJN2FjP4GVbYm8aWcSz3qFSY8cmzChofq/YnzdzSrPxuN+ttjD whNGQH+Nu7ZdRFUDa0F+PD93nRgzYZjNFt74aRphPSZAJzWw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the serdev subsystem currently doesn't provide a shutdown callback, thus
drivers that want being notified on shutdown have to implement the
respective callback in struct device_driver. This (and more)
functionality can be provided by a bus method as it already done for
.probe() and .remove().

The eventual goal is to remove .shutdown() (and .probe() and .remove())
from struct device_driver.

Note that the first patch introduces a warning when the three affected
drivers are registered (in driver_register() because `drv->bus->shutdown
&& drv->shutdown`). Patches #2 - #4 fix these warnings. So from a user
perspective it would be good to get the whole series in during a single
merge window---either by creating an immutable branch containing patch
#1 that is merged into the respective subsystems before applying the
following patches, or merging the complete series via a single tree.

At a later point in time the added check in
__serdev_device_driver_register() and the function
serdev_legacy_shutdown() can be dropped. I intend to cope for that in
the merge window that removes the callbacks from struct device_driver
because drivers that I might have missed to convert or that are rebased
over that change break silently as long as struct
device_driver::shutdown exists.

Best regards
Uwe

Uwe Kleine-König (4):
  serdev: Provide a bustype shutdown function
  Bluetooth: hci_aml: Migrate to serdev specific shutdown function
  Bluetooth: hci_qca: Migrate to serdev specific shutdown function
  platform/surface: Migrate to serdev specific shutdown function

 drivers/bluetooth/hci_aml.c                | 16 ++++++++--------
 drivers/bluetooth/hci_qca.c                |  5 ++---
 drivers/platform/surface/aggregator/core.c |  6 +++---
 drivers/tty/serdev/core.c                  | 21 +++++++++++++++++++++
 include/linux/serdev.h                     |  1 +
 5 files changed, 35 insertions(+), 14 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3

