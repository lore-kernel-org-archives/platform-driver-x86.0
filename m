Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77E43C3F4F
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076335; cv=none; b=RxUwHh5TS9mxd3vD2XQOYLnF5zkoqFKfxyI9bZTbLpMP4pTylnty71XTE3LqSNJVteElN83ByzN3EwTldxA9YsHoHD0pPw3tk+V7P6oE+sLiRYaerHrAomtnduSBwpJVhrUhd6ATCkadkQkz5dQHwCq8c4Y9P1NaEpsRVQMq4nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076335; c=relaxed/simple;
	bh=Pniyv4Tjn7uigkyv/0BCG5J8YLV0tpVRxHViqIJWGRk=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oA0aDppUP02Gq5pOLGFD4pYM8e95gzSW6CqI9FdyOoxt7MA9T9Jj0zYAqW+XTQMQ9estky+YuFmqbG8F/oG6TPZQh/E73EnaOuNC3rv6+/posZnfV9lw49y7rHic7Ky5NY3asbkep72zKhgV6zX8YaYCa3buEb4vUz+PnmdP9Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lzx5ZYOV; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lzx5ZYOV"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso53728b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 07:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792076333; x=1792681133; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pniyv4Tjn7uigkyv/0BCG5J8YLV0tpVRxHViqIJWGRk=;
        b=Lzx5ZYOV3MHhsAU50jFPnYUzA+N27kaVnWFZh1ZX4V2QYIob/6YKs7QfFI0q9T/Y8S
         UE92nLTFp8SH9diZsdqDl/zeKh9u3rHlp48QCvdv1dxjCn+FZfqSY4zq9hGyswPueruR
         KR75V2clRkwuexrh3VUwC239IGld534fmmhOJpL2x/Jj3INrtY9H5WWH31S/dSgSL4Wc
         ilx/gIAtKVv7CLHFlH321i9K8FLqWmZRHyREPQ/iQ9p7VTFFKcbG/YK5wxH6Jh35CVjl
         D9iBU7CnfJAPRivRy4pDEYrsDs4+NHmr7oFN9QNY4iuDtVwBph1QLDQ5nm/yyghIxNHI
         LdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076333; x=1792681133;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pniyv4Tjn7uigkyv/0BCG5J8YLV0tpVRxHViqIJWGRk=;
        b=APewFAfiq9KF0NqJe4JkGkOCKlWPNnIaYZTe2/6WB2Oj451ONppNphavPQJbnIZu+h
         sFk4ZixWuS3bruWKhdnyCgCqntw00CTPdo5XQfF/wF0RpfrgVzCE/hSkFz4o6FOie3N+
         JUJoLMzbMivSCMP3dfJ5UXW4Z1Zzj2zm7N24odX+EbYULCmHnF0T39gnROiQcIdaSCSy
         cVfzde3LoiVKIaW50kc2c77JH7dctZrtCyWcTs0jc1JN+4+s/Mdikwa3fHcDEfsqVdYU
         yh54eTLvaF6K5CLknovO32jWBwY7sXtmkdNY29CwEhyzr9ibWiY+vVAMfIUNJfIPWA2w
         /2KA==
X-Forwarded-Encrypted: i=1; AKwUvBzmrjxHYydvpQyI9CLV2VmWLxwNtKK5inDh2NY/l9Py+e4euCBkN1XNfK+nwFeW9ILHPG9cieT82NeCLHOK8gHahDMT@vger.kernel.org
X-Gm-Message-State: AFq9FYK+kzkkVNAGcJ86uoGfCuNb2/VNqhsjQ/d27+TTQvvhzOU49X3n
	JpLjJUC///cAizCcrAl4dNJRfYl3GA3x6l3QEak+lIEDr2qbiyv7at2uD7pY18QH/Po=
X-Gm-Gg: AYBFou26G/zNWFaEhLNDruWVtTr3Gden1creCP34wHH8UZzn2mmP3bGj7RmG7dkuYK1
	skItY3CBGSJ0tA3o0FnN7DwvkdhoqpU5yeFINXOEfkvQFmUUVLL+jN/aj3+eY1XYWKGHFv+59LV
	c/dn4O3x6mUk5IdFIieYvPfbKUX2niLkq7twtYt/Jl9KdFisd1V5y97ewuUPex8DZ9lKZepURDt
	qyOFyWH8jvx/PdS/ocE0o6he+WZ3jZgFQXcNck5j3HlTkddhVuKE/mAQytrY1INzLJiLmm/WZZW
	jJc3n70n1QFbwbt3lvLLcLC9Y1RpW+tLYwT0gMxsZxk+jgT8VxWU5aoDPYiG+G3SHjAdgCnVK40
	uZ9oztH/2NpXLNoS1zKmEPoiZDot45gL2hFV4UxhJzWu2duJfGY8jaexixuvWkjA18vRlLoW3Jy
	2TbI9yJVExMr1trx1F7XWaOYSRam1YvtFLbiZBjwbSD3BkirxgSMGjZ6dJmBj6IGKRjuZ0mQ==
X-Received: by 2002:a05:6a00:928b:b0:882:26ea:cd56 with SMTP id d2e1a72fcca58-897c73f3112mr16335178b3a.35.1792076332556;
        Thu, 15 Oct 2026 07:58:52 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89e8064e424sm926212b3a.31.2026.10.15.07.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:51 -0700 (PDT)
Message-ID: <6ad0ea2b.5be36480.2ae40.b460@mx.google.com>
Date: Thu, 15 Oct 2026 07:58:51 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Martin K . Petersen <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Marco Scardovi <scardracs@disroot.org>
Subject: Re: [RFC v10 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
In-Reply-To: <20261015140051.1159817-2-nbg2974@gmail.com>
References: <20261015140051.1159817-2-nbg2974@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The 0/1 cover letter for this series was blocked by my outgoing
mail provider and never reached the lists; resending its content
here.

v10, wiring the driver into the tree. A driver source file
without Kconfig and Makefile entries is dead code in the tree,
so this version adds them: LEDS_ASUS_AURA_SCSI sits inside the
LEDS_CLASS_MULTICOLOR block in drivers/leds/rgb/Kconfig with a
depends on SCSI, and the Makefile line beside the other rgb
drivers.

The only code change is strscpy() passing the buffer size
explicitly now. The two-argument form is supported by the
current string.h macros, but with the size written out the call
builds on any tree.

v10 was verified on hardware again after these changes: built
with clang against 7.2.4, the four LEDs set to independent
colours and confirmed by eye, 60 sequential and 100 concurrent
updates, the sdev deleted mid-write (zero splats, clean
detach), rmmod after detach, and a fresh attach through a host
scan.

The interface direction is unchanged from v9: the LED side will
move onto Marco's Dynamic Lighting class
(OpenGamingCollective/linux-unstable#17) once that settles.
