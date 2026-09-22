Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB2A522696
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 21:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112751; cv=none; b=sntMZci7Ni0tOUEVgzbJKAqp4d91tNEqnIVR2RcUmXjAESBux8JSOx0+oKYAjAScpwAywtXMevWHekJX54lI/0XK9tjAcQIjFgeLrMihB0THT4XJwkjzK1htDsLIUbSkKYZk1JM21NHTp42yMaSAmmex/9hZxXyxeWGueD3S9c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112751; c=relaxed/simple;
	bh=2WvlPAIbOGzbHSxW451eh2EWgHCeMfyZm2VVp4rH9Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tTSx0jCcr4uT7bs6kzCG2LLnKALAQpXeGfMIxjxgneBhBZQoJVBwU3Gl6z3zTd9Pfs0zJAezYZgg9GfbeoAGhtDyEepf84sYNhpHqmY+3uZrGPU+rPmCTsA4n5w0agEetIZUgClyKBRlwqglpNJ2ux6OWyRDrBkO81XoJ9jWM9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/VYMqbZ; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/VYMqbZ"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-8137b129131so307116a34.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 14:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790112739; x=1790717539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QDHhaSJenqoO/XxOlzKnAhXngtK3EcH5UtYe0wHr2pQ=;
        b=O/VYMqbZaieVBBW2hYUtA9maSTNTZCqIsRdEiVvUQmhD0AS+RjN+57nDZMC5fnmVXX
         xn4LOMA0GHSCNJGm+4ayNdAQwGNzaPEwiQI1MhT1Lm7fl5RW1UJKFtVPz4SAY/Fa7sTv
         ydTssnVoyQFgGglKGG6gey4motxa/zNudQPmeUIj0faS4218VF5a2qF6ZphyEo0RRt27
         pV0uMgfiUsjZ+GccbAtKgk+b+9DgB89BKTiAQQTHKeLZ+gz+2ql+mL2DyFTprX73utnE
         nwH7CsUR2CPNFAUAX+pzj617+vtjKDMfxLEzu5IGJ2MAW3UNl4A2cjtQnYlguLhK731N
         1XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790112739; x=1790717539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QDHhaSJenqoO/XxOlzKnAhXngtK3EcH5UtYe0wHr2pQ=;
        b=ezag5Irg0g8PV09c/ypGCK13CHLgOD9BqJ6Jhw/Qn8v4Xnven/esJEMOrl89rUUilg
         0uT9TK4fGGkVFYVzbQP0ttFegIdnyYnqFY07hE59iKEva7qUXZjT7jaowfxCYIQgiuu6
         tORjOCD7RVnY8SQJoyVXnCYKan53rzTgwnQa7ETqhOHfJ+IU0LGFa104CyfUvBa4LafP
         iUFL53VG4ao0dbL9V1bGKGIfxOiNK09uTbS8tJCBs97JMbPdc70/PQNft/oWtlf3g6QV
         Hxoif3Gst3QIE8cZ15BqDxw1gnPVaRABn9oID67EfPJZ/69d2pSihJMinPQY1r1bs8hG
         JpWg==
X-Forwarded-Encrypted: i=1; AKwUvBzOU6NegzUw0+TWI3NeBd36vZHRVXwBML1+tBaIYJlZ1iuvT30f+2WnNmq0wwEBi6hDuMeNLPgPJOKhuw1b1yH9wYUP@vger.kernel.org
X-Gm-Message-State: AFuF++ng584p4SK8JZVs2x9n12eHE7VulcuC1wpNqNf7aru3gPMToqB4
	XOaiUv5r4fJsO/pzYJ5nrd4DohH3lxIjrRpBt5nzzICU2POoYAvKADfIFnwb1EH/MIo=
X-Gm-Gg: AYBFou2XgHIceVpG6wpdR5XNr8nq+nCeK/hMywZ5P5JPhSQTx3CLnMD2oMt1ION0Jlj
	XvxqUCjEWrCUxkugcbdlkJU05ODzFN8sX9nynDzVsq/g54HASqb7dWAeUPf1EeARHTiBPvU7WX8
	YrjN2lq/++D8XptKlxozekLlab+h+RsWmFwLqS3rM/8LAORlBHvFA3PgNG6BWYGpN0JkxpU8A3X
	Dd4adlAJvnxbhH7b9YS94pkFSqiCXHfM9UgGwMIKcgszuozS8tx9hsd1AQVOJcwv8OIpiJvmL9E
	LAehVUp00+LaDpNBlZtjBxgmsatUrigfDeq8XaH1dqar8Rh/CxgpMAlcbfEgDtjoixIsX2PSzCE
	o29LxytNhePwR+bDmT+qBKG1L4WJEHIJpPD8mXfo3J9lUDZPNbP9UZzxKiWN3SXQ9IX+CDzKxoU
	mnp61XRkC8Z8I6yJFvy7AQVOVlFHXTS5F5xTQ/z6GdtJOj+sID1B50O73guETF2LFQWyomTP1W0
	442pU0k55GomUbq
X-Received: by 2002:a05:6830:2b2b:b0:801:6bec:ff18 with SMTP id 46e09a7af769-815f007097emr1057735a34.2.1790112739471;
        Tue, 22 Sep 2026 14:32:19 -0700 (PDT)
Received: from localhost ([35.11.35.209])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-816044c858bsm947461a34.19.2026.09.22.14.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:32:19 -0700 (PDT)
From: sjunhyuk1@gmail.com
To: linux-usb@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [BUG] HP OMEN Transcend 14 (board 8E41): GPU power ceiling on 65W USB-C charger is non-deterministic across sessions (25W vs ~65W)
Date: Tue, 22 Sep 2026 17:32:18 -0400
Message-ID: <20260922213218.5334-1-sjunhyuk1@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922192312.40607-1-sjunhyuk1@gmail.com>
References: <20260922192312.40607-1-sjunhyuk1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Important correction to my earlier report: I ran the same charger
through HP's OMEN Gaming Hub on Windows (same laptop, dual-boot) and
found this is very likely *intended* HP behavior, not a bug:

  "Performance settings are overridden by system defaults while using
  battery or a low-power AC adapter. Connect a compatible AC adapter
  to restore normal system performance."

HP's own first-party software explicitly classifies the 65W charger
as a "low-power AC adapter" and documents that it intentionally
overrides performance down. So the 25W ceiling itself is apparently
by design, not a fault.

More importantly: **it also reproduces on Windows.** Same laptop,
same 65W charger, Windows test session: 25W ceiling from cold boot,
OMEN Gaming Hub's presence/absence made no difference, and the full
poweroff+physical-unplug/replug workaround that reliably restored
65W on Linux did *not* recover it on Windows in this test (stayed at
25W for a 60-second FurMark run, 60/60 samples). So my claim that "I
don't see this at all under Windows" was wrong - apologies for the
bad data point.

What's still odd, and still possibly Linux/kernel-relevant: on Linux,
the same 65W charger sometimes lands on ~65W instead of the
(apparently intended) 25W, non-deterministically across boots/
reconnects, and stays fixed at whichever value for the rest of that
session. If 25W is the intended default for this adapter class, the
~65W outcome looks like an unintended bypass of HP's low-power-
adapter policy rather than a "fix" - I just don't yet know whether
that bypass happens on Windows too (only tested one Windows boot
session so far, which stayed at 25W throughout).

So the interesting question is probably no longer "why is this
laptop sometimes clamped to 25W" (looks intended) but "what makes
the negotiated result non-deterministic instead of consistently
matching HP's stated policy" - which could still be something in the
UCSI/PD negotiation path. Sorry for the noise, and thanks for reading
this far.
