Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378F82C11DE
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 11:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788088517; cv=none; b=BTAax8/QJzj5ELsKIfatnpxJwveAbjgbt395D1s7ybtba4MGA+iUjclA289LlmD30UeK7hmnPmYdTiUZoytKadZylw3MB+sE4dGTWBMmA8w5ahrlpUYd4PZV5RBp8ltqQ+1WLFvcaxSOwNyqLW6ix1JTUIp+0QGpZPsBuGnCVkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788088517; c=relaxed/simple;
	bh=7JC7WsOLkSZR7QF0lv+xw2ku0Pg/QnGWHEpCmQnckiE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rYYj17wYmNCHO9FPIJfnw74AD3OTQxpjyrM71TO1wSywHVZNu2IDoTClGzsy7f/Cm3XTryy9hjMt9MH6LDhjD+VH5/UBAm+7yYHLTi9SKcSAJ9oSdzAHFSqwMl6qpHRjKPqJjDmjve0MoD6muJqW1sPKem+9+VQHhzgggYZP54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pbyf5TaE; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbyf5TaE"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2899334a91.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 04:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088514; x=1788693314; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=swnMIm+9bRtjZwoNNtbbuIBoOIF6i0dGJB4V71AxU5I=;
        b=Pbyf5TaE5uv6s2SdP+VBLaWdwug8458VrEYALbBZKIfT+q6Tfnfxx6fU5lC+oUxlj8
         Npmoq7ea5hOqv1BvkZ5l2vSg82YZMnvQVWn2ls1yt8JkMIVjy0ZAQbRw6qQVzonuSVPj
         nRZT2g1PvOWzwULaO9zlJXyp+vvtETRMahEJRkMbSmQB0WEZuxuWa4ABD2Fff4VeQMGU
         sj1sJFr0d0t1g+0I3od1KopJ6Y2nCdJKIKjFi0uvCtqJaHign3gW8phjFO7AeyB7cKkO
         KeZvpwTnjH5luysT8A5Js0LjMkFm7g0NnK3gbMPofqh+PS3h1awgQQ4mbLsd8AXOA2VL
         2ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088514; x=1788693314;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=swnMIm+9bRtjZwoNNtbbuIBoOIF6i0dGJB4V71AxU5I=;
        b=eNBoFhEIWxC10NRIiK9tvqI8S0Lp80eSsFf294ApKxZaV4NYq7I1wL0D/0Irqu0S+U
         JybvnPcBr2Cx06gA4WJ9dvnZWNRkZXu+KKl5+9xY4KQcl2xwn8JmAnMUrSRbcPVwEd2s
         2UpaaEn4b8JDH8LMUdSZbL3ubAM8UdeoYWBPRgrToq8O0/vgWVIs4AZoC1gZVhV9koIt
         N7UirDm2hbOhbqZkk35d77uYYi8FvA7jzyIrA+AizDwYetgazgcFEP7wL66haZj1c5JE
         yG0LzdShM7b7kaRDu1rb47XY5bdPgmiY5AiXkMPVcz0g/C6kGbE89rI0MR8leLOXYM8B
         HgbQ==
X-Gm-Message-State: AFuF++kIS5nct77LC4HzW+IZ3mNueuIeuDmB1YAFImMe8FH+yVroeiEH
	E52vomInHyHa5V8b5eA6K+NKuYiNEKkNGBu3Yg6ndsHTVtfPFR0RXi8O
X-Gm-Gg: AYBFou0H+wsTZyc8PgnapEeetfD7Rl2tneHlHgx4EHnox1Nuo6A5xyND6Wf+a6YjXDd
	vOkxv2AiSs5C3z5DZSJa7ray9jgBpP8xR5DN9Jwyyh1fq3fWotvByugjyF9wlhUFUG1BkV+bGdo
	W3cNhQY7vpdGUg77IO+ar1LmxNQbS5tCWbWfQtYK0yEzKv4PNMEs0idHirAlK5vPhoaaOZD1xYQ
	6tprFEgJObHFG/G9sLzLsW+IjbTN3e9wS0pQv9RZZhf9L+nEfkZdkPNfi208D6whlyLwRi0ltO4
	XCFpIOSv+26h0vcmEdGugz7UTAYUdTuncnoa0zbkIfHHV7b5FrKzJKp3GP6B9YPrEHg7dQ2G5H0
	QvLyH0eMQ2FivpZwiV3CjIsWYbgWMahKqbhUdnFEG+qDKLgPKaQ1m/5asDacJ90f/0BmsF200ic
	OGad8Gt1LhEOiPomrYx0gjBbEhwyKnQ1L2bAJ7OZRRK5Ze9eeMSuDocGWODrUqDsucnznhHppI9
	Q0mrsyQNcZ3n/TT38lA6atlBFosLwX4ZJfQgrNdxPiYR/X6tts=
X-Received: by 2002:a17:90b:3b90:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-398c150e8d3mr7415565a91.4.1788088513714;
        Sun, 30 Aug 2026 04:15:13 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:c021:485f:75be:3c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32874498f9esm18782313eec.20.2026.08.30.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 04:15:13 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
Date: Sun, 30 Aug 2026 04:15:04 -0700
Message-Id: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALgQlGoC/yXMQQ6CMBBG4auQWTsJNFKrVzEugP7oGDM1HUQSw
 t2tuvwW761kyAKjU7VSxiwmSQuaXUXDrdMrWGIxudr5OrgjL8FzpzEnifyApjmxvTVF8CG04x6
 Nb9E7Kv0zY5Tl9z5f/rZXf8cwfYe0bR+uuGNCfQAAAA==
X-Change-ID: 20260829-x86-android-lenovo-swnode-785f4e165eb2
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f

When gpiolib dropped name-against-label matching in favor of firmware node
identity mapping, lookups referencing unattached software nodes (such as
arizona and gpio_crystalcove in x86-android-tablets) stopped working.

This series fixes the lookups and cleans up redundant software node
registrations on Lenovo tablets:
- Point Arizona GPIO property entries directly to the codec device software
  node, which is attached to the parent device.
- Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
  during devres action teardown.
- Generalize gpio_secondary_fwnode_init() to accept a node group argument
  and use it to attach crystalcove_gpiochip_node as a secondary firmware
  node to INT33FD:00 on Lenovo Yoga Tab 2 models.
- Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
  Yoga Tab 2 models where codec software nodes are already registered when
  attached to their respective devices.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (6):
      platform/x86: x86-android-tablets: fix Arizona GPIO swnode references
      platform/x86: x86-android-tablets: hold device reference for secondary fwnode teardown
      platform/x86: x86-android-tablets: pass node group to gpio_secondary_fwnode_init()
      platform/x86: x86-android-tablets: add Crystal Cove GPIO swnode support
      platform/x86: x86-android-tablets: drop redundant swnode group on YT3
      platform/x86: x86-android-tablets: use shared battery swnode group on Yoga Tab 2

 drivers/platform/x86/x86-android-tablets/core.c    | 35 +++++++++++++++-----
 drivers/platform/x86/x86-android-tablets/lenovo.c  | 37 +++++++---------------
 .../x86/x86-android-tablets/x86-android-tablets.h  |  2 ++
 3 files changed, 40 insertions(+), 34 deletions(-)
---
base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
change-id: 20260829-x86-android-lenovo-swnode-785f4e165eb2

Thanks.

-- 
Dmitry

