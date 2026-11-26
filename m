Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795676779;
	b=MxX7z7ZKr9as6e4+n0dqk/Z/HUC7D7+xzerhza3uG9D8s62M59DmGV5j0OUjLKwPB3ip
	 RayL09QFrYGeuKLxRDBPEbjZtppLa9u+GTVY6k2PWWoJfAC5mYQmKIayoA0wA9m8IJhqf
	 sTp65myYypJmOkmQ7qpkpYsXdq/je8NLXgai8X+3/rE9q7k2I9EhqUgUV4vrUPSOKS5G3
	 KLDHswzqMk+4Q22dmoqTkQCudZQMxZZ9sHWgcIFHH1WEidtO+X/DINnMeE3w/lD/gtyfm
	 CE68TeesmHSZET8mlAlRETQIjDva468H/Pqcugj63QYIT+8CwZ/RrZnF5HrgOA1kOKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=JGkzya9dAjnn+jPv3SgcvQ46bNDRabbKXhUISQinlYA=;
	b=mEG6p874HXfIbY+wMkXgCV4RLNC8u4QnW90dNICmTAYGbrBUKTmFVzQFJ1RhXn2BbFEV
	 6wCDGfbNzo/dU75UdMed1f6k4f3xziJHFdvj1UNLDef9etqcvLUL8XUWhSwVSPzWYMVmg
	 ss3roXlEK660IoOmKmQDswSSm01/S5QBZ6/BSgA4D68r6vDFDKiU1W4GnSS016OJItovW
	 TO5lrdQBs3F2WbJSVmQU7agQGzZyh9VEO8KNNpmiUyZw0AYkZZ0XGtxQP3TwM36r3ilK2
	 LfW7/N4zn1YA2ReUx0s1AYvP/ygR+3zGwLdfyIGPkG3k0be4YzzT3zN24xQJJf+rVcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UH5HQHFq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59080606A326
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 07:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59080606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UH5HQHFq
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4c5d8c7f326so2664615b6e.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:06:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795676778; cv=none;
        d=google.com; s=arc-20260327;
        b=ZRwG/P0z8CztbHkWU42YGYeVgwIgtPb5dKkrrYcHK6Ab2lQelf5/cYoKVu0fz/u9yb
         jJRq9xC5rCIpIbBH8yS1srsvmZUi8cqPMd4qvVGr9tXgsSDC43WMcj2IfOdUpBXgvitZ
         tBA8swx55KPR18Ym9ebmsHrVzLyuR3Ys9EC3lXXJxQF5TLX5hVNCtku23MBVsie5AKWj
         kTBxrqMpo9mZsftYtYYLTSTWLmXd04KMk7ZfVMq8Fm2FW4SyXyIoplwL4ZDkaHdOMuSD
         OmbMsgqzJZvDAv3sgY3Vcg2MWWkM8zrezL0MKu8y7Umd2JF2C9qWdGzsBw35L8+2ZPjW
         SWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JGkzya9dAjnn+jPv3SgcvQ46bNDRabbKXhUISQinlYA=;
        fh=Qa8JRcM48A41L+Oc4N3M9ZUuPVCx55hMOpyr2e5xNi4=;
        b=TpgLTFeWP7MbbXsSvA6ugf6P9gka1xk5fkbcRQ6uAdyl5VDkVpnsxJAP91FWnItXci
         ZFi1Y49Q6tROziB4U8KQlNxe42hbBMMQUWRF6IjkNMrrvJzFZrxK/nUk3OgIPYaS+yWJ
         uEwrKrX4fSzI5lujw9tXzv3gi0WLWLUsSyviE/hCANOq5lvc3/gJ4u339vhSnkKUPs1H
         TZG1eoEEosK74w0fo+12Wvf8lVChgMvAQzt/A6TZI6BRN2GDkaJGdKrEtkIwO2uZRlcq
         tjd856QLVTBnUMdM23ViKWUeCbYujP+Zya9OlBqSgNoTmx7D9emac7oQBaqQ5XtDSU+3
         Nxjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676778; x=1796281578; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGkzya9dAjnn+jPv3SgcvQ46bNDRabbKXhUISQinlYA=;
        b=UH5HQHFqTxWVAe4pNETG3TgSSnfdvawd8ZQqFQpTnXL8pklkBd3jqxrX4e1K60dzCN
         mCk/ExxbGY7CHX9BaicRT/mUMnD59Wl7VG2ao0I/MrUgavg8Dk4k1G6IFokyh5mZ0oDm
         AjSe3P7IfgcbvQxru2NKz9hbmP8nCLfrcNQSyS28j/dZUrchIitIru9PMmoFrvN9okV1
         7uMLKIV+zxO1B36TBVevbRi0bE9Huy4j3dCL5Ht6IN2bT5Jmslw8xPBv7Wn1/997vVCr
         F+iCkk8pUWDQq9JJqWyWFuq4UR1ZEf8IbZhe6Y6FfyXuRqPr5atBZEKVDCLveet/ZI/6
         K7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676778; x=1796281578;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JGkzya9dAjnn+jPv3SgcvQ46bNDRabbKXhUISQinlYA=;
        b=n95s5BpuCZrcNa/dAJJxB12fZpUVSIodKHcFzwS6fEv/iyctA7aIuZbVSwzfKx4O1o
         7B+ycncNbzSYfvPOq01PAvR8WNCkWxy4EnDIt//OeJKUpXezEoHAMiGdhw8BsrMtwpFu
         oBoV2hl4uaoRmlfYExZVkRnWjjevdiUCgMeVUZWHX1pRiR3z1DCCz7cQWJi9oTCMARnt
         XboQQJzgPZ0dL2PJdjfunO8/JLT8Xi4U9NbONLETVfQS4AFrZKn9iq2wceng8Vh1mbyJ
         MJP/buiNqNB9R4mrhvAge29hOAlS3S6sbH/hUQcVht2z5Un9YY8EdfY+LhT4YDgyaS0Q
         GZ1g==
X-Forwarded-Encrypted: i=1; AL+hErGfWz2hHslqY6FScyTNKDVbvx9oD0WiXGD1pc8rGkj97AS8kKXtOhdj5sywe318M6ZYDPUIBGMimMckVxdRllBoKmLc@vger.kernel.org
X-Gm-Message-State: APuU4Z9WnidJSj66jML4N1sAPKOGfvjM9u/pcgG5FeyFLekkwz5Bls3Z
	hkC1XCU+rM0K6t9q6KquhdWtIYQ59Zyj2hSi2FywUQdi/1kKEyFTCZRyHPjBgnEWqOXqhgZ6N8g
	haZR+jKxMqioZfRgcSC4DW6lt7+i9OME=
X-Gm-Gg: AZFdTZebfN1PGZp4FvUMMs8XN7z7PIkw8e5wf3/nNktMRKixXCRbPZpw+TeFVvvLGZz
	x5t90RUS1aYtA2Vt6rxy2Etr/VB4aEy+ND11PMmiPEucp40NziC9loq1bSk1o8sQOO/doIydtJq
	MuVi95QDYRlDz60FWXBpvllDqR12qsEvv5xs/YVewGgjqvaaBjAbW+C6iXjqwdPUNcOPFP9NFPk
	S/6cSXfxlHhG4lPavvZiZx4Mcf49SzKFvECQiWXToMeDzeJWuLCqXwKfQ02tdJDXoZipQBcg9te
	88JFFqtXAcSkA+VNqkmgTa14Od9qvZWSAzCGWvD8/eDBLMYLaDqMadL80xjEwzcqouk6QZATLj6
	cvX6Zk1xJ+HzFpg1hI8MMnX243o4LhzCsXZEuzF6qH1OpOdz83VtiStXKsw3nqS0etE+iADxxmL
	3pZHaPAocXjBc=
X-Received: by 2002:a05:6808:6413:b0:574:9463:5511 with SMTP id
 5614622812f47-57a0b64e63emr19810454b6e.48.1795676778214; Wed, 25 Nov 2026
 23:06:18 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 02:06:16 -0500
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lee Youngjoon <getfeus@gmail.com>
Date: Thu, 26 Nov 2026 02:06:16 -0500
X-Gm-Features: Aa3M54omcjTpSdcnmVtJqEgoipl0t9iwMSKeuCL-vk9fRXRWXqfRUnArp4WiGRM
Message-ID: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
Subject: [PATCH v1 0/2] platform: arm64: huawei-gaokun-ec: Fix short transfers
 and PAN ACK masks
To: Pengyu Luo <mitltlatltl@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

These two independent fixes address the host side of the Huawei MateBook
E Go EC protocol. A short I2C transfer can be reported as success, and
the normal no-port-update case evaluates a negative shift before sending
its acknowledgement. Both issues are present in the pdx86 fixes tree.

For patch 1, a host-side test fed the actual request helper adapter
returns of 0, 1, -EREMOTEIO and 2. The first two now return -EIO.
A complete transfer still returns the EC status byte, including a
nonzero status. For patch 2, UBSan reproduced the negative shift on
the base commit. With the fix, -1 sends a zero mask; ports 0 through 7
set their respective bits, and out-of-range indices return -EINVAL
without a transfer. Both patches were built individually and together
as an arm64 Image and EC module.

For reviewers interested in firmware inputs, the PAN write can also be
checked with a fixed cable configuration on a Gaokun. In an earlier
instrumented run, the left charger was online and the right port empty.
After a normal left ACK, D3 still reported update mask 01 and port
records 05/00 and 02/00. A test-only driver hook rechecked D3 and pending
work, then issued one empty PAN ACK while both ports were left untouched.
The I2C trace captured the following exchange:

    host -> EC    03 d2 01 00
    EC -> host    00 44
    D3 payload    02 01 05 00 02 00 40  (before, after, +2 s, +5 s)

This observation documents the existing empty ACK encoding. The EC
accepted the command and the update mask stayed set. The series preserves
that input and makes no change to firmware recovery or hotplug policy.
The host-side cases above can be exercised without a board by stubbing
i2c_transfer() and recording the request bytes and return code.

OpenAI Codex assisted with source inspection, the fixes, regression
tests and drafting this series.

Thanks,
Lee Youngjoon

Lee Youngjoon (2):
  platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
  platform: arm64: huawei-gaokun-ec: Validate the PAN ACK bit index

 drivers/platform/arm64/huawei-gaokun-ec.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)


base-commit: d4000e7b99e06e92f21a3c92098a0476d316e9d6
