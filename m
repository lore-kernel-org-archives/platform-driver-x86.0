Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793527378;
	b=UEFzoHtWp1IrAlhvFkNqION0bUar2Sp+xP9l6n8DqjTquG4DbRWKT8YPw9wq41AUqPJd
	 5nnLRvZOX00AUTDgR+9+rFHjCjErXJ0KFulusWf2HDAAlP8MsGRsVeYfv97/6oMwwQRJY
	 0zjQP5Xy9OXus9JkTFHcL2GLBnivvb0kLh3Bfa9TRB/DxWMK34E+Jr89hDRoIq9e6qPrS
	 V0aPpenKJKGKl4IZt2AkVxPGzmMdaPot6kfZUfKJQgisSpY5N7tLf054SJG4D//WQMVBJ
	 /j+sqrgrcnIgkJ5CAvGgxzBB8NcByGeIXjxtD5wSH6XLsPTOki9OqN2Zznf7ZRo22cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793527378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LugNflWSTGYWWTtxsSZYRFunR5npiQJObm4IegZVYlY=;
	b=XMhu4xWr5d8o7SWJ8okvSwJbasrzELRKz+Ge+5NoS3SMiV28LQuWeDOnDmjQMlswkU5c
	 deH3gUi90C47cPPS4LYQW6TluVeYIrrU7wRdH8Nu3IgIdL/P8lQvMS9ZKgFpRdwFt9h8z
	 soqbjZ6HzdU5ecOJpJ1/qoNMw2tANg6oPmSfZXAACGWz2ro6mLUpfD2CP2IVwp1gaxmQ0
	 dE+rBGH76sVUpCfcg4fnz/BbaN0wUPlBaeXaw2cqtoHEBmMLM4Le2QF2nu4MCpN8me4KA
	 dcryQxDbEZqR5iLSSpB8G+ggIwka8/ORs/7ud7nbA2l+Q6wU5zZmvrKYoKGkIYND/5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ABBzA/E1";
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEFE606A326
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 10:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EEFE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ABBzA/E1
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3acb41888c0so84735a91.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 02:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793527377; x=1794132177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LugNflWSTGYWWTtxsSZYRFunR5npiQJObm4IegZVYlY=;
        b=ABBzA/E1yzC/XyNbaXLATPDWKlLSVhgz9WDD6gJQXh5+SyImZxFMRf8wMbqdz8um8n
         vH2Kt83PfykJPKhdkAtM5dhKf+1DLnKouyBXZ3lZPSUKuFT7+AzMfsCkYq2Z7ys4DZRU
         0Iw+as4m+yH7pHKCtk74wB+05etUgxOmkl+p5W3qn6I+Flr15fU6Z+39Sd/ufb4eXhsQ
         ujE2k4Sfk/hBv786opeI/diPCPoCpl7yazZWgH5Nq5sgB53uHySnvLEYjqmAdT5+rMGD
         wH6aGH1hFQ0j/nbZLltNvO39LNZ2sbEO/wq4XyP9wzpy0nYzPKAPUuSvNWzciKxc/sNt
         y+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793527377; x=1794132177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LugNflWSTGYWWTtxsSZYRFunR5npiQJObm4IegZVYlY=;
        b=2056BdMD1L25kXYIwxLP9+p6dhRvPFUtpiit2FNdLykBhMDHee8evgb4CkFq44nhg4
         e8t5x2ohJ5/FUs/3X0BI8z3zyxQHM+qJr9mGW/iHbozOVeKSlxG2eWc0MtKYcy/aPwkS
         5RXuKuSgRdiI0nOOvzpoiYeJ17Waq73YgEaliu0vraZlRd6+SKPGjuve1/azN4Hizzod
         q/w+Uc/yNN39bfg9b9lje2xH+JdKO9RsRM2RB9tGepnPloCRV7Zkv5ayJzBJzM9HvN/5
         kOqGbX31LWvPYbdBeAmvnjjYF3lY5Fx5AtUxb8NO9gvr8P/XVGkcRxwbo9zKDe/BvbgX
         hGpg==
X-Forwarded-Encrypted: i=1; AKwUvBxZb+y0BsjRLVscyO1qgmmZ9+3vxIy9MtYmdLcMI11KvVlInY/srhsyxgaexxYbxlZ6ZgxLlhyoMeQx9Wu5RfWwXv9L@vger.kernel.org
X-Gm-Message-State: APuU4Z+SlWj1eqA4JVPUpKe+XEDD1f2hPfmM+B4sSWfYaOb6j6vz9t4B
	mwY/4uizR0Kxj62o8gFcVrCqAH4issbm6GflrXiBtqzQO7mNv9mrupCX
X-Gm-Gg: AYBFou0ggAGHQ61cHnYLWAZUGk31Zv21fqPJc8XLwSo7C1jpEyyvPNVj/+HkgNfl9jK
	wM5YAquZzy3Aiei9nFyBL1RfcFyq+c0TRfXlwxX4iGBgFePdhKCkFEfYRPBCZYZwEjaYUe86Stu
	TvIgtQcacVAlYuP1V6PQbsBewKuO90+4GXjYtKNI26dnwa8IPjDPncdMfvklgZPrr2GnWVWb+0L
	T7mNqvOKOr7ke4EBi+nE4Wtg5G57b1dDFUd/e3DrGSPgG95CnY+AaYukheKagEhINiar2b20RO2
	t+R3ccFUTT/pUCEmPCg62qmKTQY6cUIRQVrEdDvNg++MIlCJBD+y61esKWkgM03jtpEj1p07xq2
	u/xcaoJ7NaLp5vbrQMvRRY7NT2/MwRnRUGYn2bObPwUBaX5Jd4Cp0KydvS8QM9xIS9vwDRzzxH5
	0Cr7T5lpye7yV/ao9dSK/CRmrCURRte3zv6IovEgmXzVSXgyQeQ1FWNhTGFPwB64UuyOeo1xKe1
	nyJuzJJnYECF3faLoqs0CkWKEDuXLSH9AlcgaYwMQk8cfpxpp4ORWeURlkFZfuXU/4qa9bFGADQ
	m01/nkxU5UGDFEswm5tiXI3d9aojkfkhQQ==
X-Received: by 2002:a17:90b:57c5:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3ae89559f3amr4097204a91.2.1793527377532;
        Sun, 01 Nov 2026 02:02:57 -0800 (PST)
Received: from ThinkPad ([240e:46e:8710:e4e:e10f:cd51:e533:58a5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm14314906a91.14.2026.11.01.02.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:02:57 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [RFC PATCH 0/1] platform/x86: thinkpad_acpi: Add support for auto keyboard backlight
Date: Sun,  1 Nov 2026 18:01:22 +0800
Message-ID: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mark, Ilpo, Rong,

Recent ThinkPads with an ambient light sensor (ALS) support an auto
mode for the keyboard backlight: the EC picks the backlight level
according to ambient light. The mode is EC keyboard backlight level 3,
above the two fixed levels exposed so far, and it is reachable only
through the Fn+Space shortcut, which is handled entirely by the
firmware. Userspace can neither select the mode nor observe whether it
is active.

This series wires the auto mode up as a private hardware control
trigger, "tpacpi-kbd-auto", on top of the hw control trigger framework
that recently landed in mainline [1]. With it:

  - selecting the trigger writes EC level 3 (auto mode on); writing
    "none" turns the backlight off
  - the trigger state (bracketed in the trigger sysfs attribute, and
    the new trigger_may_offload_to_hw attribute) is the userspace
    view of auto mode; reading brightness returns -ENODATA while
    auto mode is active, per the framework semantics
  - Fn+Space keeps cycling through levels and auto mode as before,
    and the trigger state now follows hardware-initiated transitions
    automatically

This is the thinkpad_acpi counterpart of the ideapad-laptop wiring
from the same framework series, which is still queued; this patch
depends only on the LED core parts already in mainline and can be
applied independently.

For background: the February discussion settled that auto mode must
not be exposed as a brightness value [2], but no agreement was
reached back then on how to expose it instead; the hardware control
trigger approach was established later by the framework series [1].

Tested on a ThinkPad X1 Carbon Gen 14 (MT 21V8) running linux-next
next-20261030: 61 scripted user-visible assertions covering the
software paths, the Fn+Space event chain and the unchanged legacy
behavior, plus manual exercising of both the Fn+Space cycling and
desktop-environment brightness controls; checkpatch --strict clean.

Deliberately unchanged (details in the commit message):

  - max_brightness stays 2; auto mode is not multiplexed into the
    brightness value
  - writing 3 to /proc/acpi/ibm/kbdlight keeps returning -EINVAL
  - module unload still turns the keyboard backlight off

Two open questions, the main reason for the RFC tag:

  1. MLCG returns capability bits in the upper 16 bits; does one of
     them indicate auto mode support? If yes, I would gate trigger
     registration on it. Mark, does the EC documentation say?
  2. On models without an ALS, the EC behavior when asked for level 3
     via MLCS is unknown to me. If it is undefined rather than
     rejected, optimistic registration would need a rethink (e.g.
     DMI whitelisting).

Rong, happy to rebase this on top of your series or fold it in, if
you prefer to keep both wirings together.

Comments welcome.

Regards,
Qiling Zhu

This patch was developed with LLM assistance; I reviewed every design
decision against the framework sources and validated the behavior on
real hardware myself.

[1] https://lore.kernel.org/r/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe/
[2] https://lore.kernel.org/r/20260203232219.11683-1-vishnuocv@gmail.com/

Qiling Zhu (1):
  platform/x86: thinkpad_acpi: Add support for auto keyboard backlight

 drivers/platform/x86/lenovo/Kconfig         |   1 +
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 104 ++++++++++++++++----
 2 files changed, 88 insertions(+), 17 deletions(-)

-- 
2.56.0
