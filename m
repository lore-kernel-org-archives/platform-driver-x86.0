Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911472;
	b=EeRUIA7Pj82GNCPG3oYWmyyBgca4roMjV6KD15GnmfdK4+bcPlopP3jlsaz754lTCpOp
	 lHkxuIJJ2hdDl+tfxj7evcA0NXEi27oJu5cHrCH0HPYoUG2RFA7z+BSnI0CmJyyYrGTAw
	 HsyPsJ5NFHj2rKtE2y0y/id/5Y8nh+MIpYI2lZeN+MFn4MmLwgRtQZieh44ohISUMr5Ib
	 s694Lgd/H0nxWrmGQCLXqNkWZNke06jq+s0fnAE8K3rAfgLwZDB0Vldcwz4ygx07xUtst
	 RGaAmoIqHKq3GnZ6mhfPzHfawvodXZ6bcxsS/L5lanDR7TBBeoCPuB0C70LYR/jCQgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=B8DzAG1W7QnI0kYpFrg3m+CAd4h8w0m8XB//rCcaTD8=;
	b=tXSVNUCZrK3xm4JAvU/E1VeJhxyX6RJZ3XcMASuT2YuB632YFr+CkK3Ayksdps2w+ed6
	 Pc4fvb2SJ4hb/JWPu9A1MjqSym1l7tQt9roUDdf4GhyAFHuuy3ywOTlEKD+Np8O5r7UQk
	 mKFRzXghty/3nMXKUNQnkANSFlgEdN4B0vRrPZgQKdgYdIU+QHxxlAbrFMMTLD0EPVlp6
	 hxfBowVCZ61cJlAceyj29FxWsYGDYj5vIg+tL6U42xeXv4I7jX7AcXinDRFU62J2ufFsQ
	 RSTR1v9GfDe8iN9oxBQ5qMB1uMbLe0k0q7jjcJT9yPz6JTajEu/oUYcjilk676vjOLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lciq8CFU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB14606A8A0
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 10:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB14606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lciq8CFU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so22751725e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 02:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911471; x=1795516271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B8DzAG1W7QnI0kYpFrg3m+CAd4h8w0m8XB//rCcaTD8=;
        b=Lciq8CFUmsi0phFxpoNj/PDmR73W4oYMEkld19bInRXoTzN8yWNjupdmL+sei6lYdh
         NKIwMnml/mOY/eCl3/O85Fnk+H+PiugOpVZ9/Fit00nSMLWs3zbab696mF08xaWTmMMt
         xoy0YdEHQmLeO8pYtkxnOu9qp1u3KuuNhR5RJey0nLbokGFni6K0EaGtOq4kNkXtUnxG
         xM3VgCdIqts5ZIdDVYzDHiEf9kRj3di+kxX9rI5UMYAObj5ph/FvLDj9jn+aaqcDDgpK
         FuJ7lfhpN/QUWvap3foFKV80nNA8BO3gUzkeu/09pr1gRXqP4Lff+jw7IbxAYziKIyBT
         x6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911471; x=1795516271;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B8DzAG1W7QnI0kYpFrg3m+CAd4h8w0m8XB//rCcaTD8=;
        b=hKkBmpcShXRRhhE0N9eqzOIWsAfrs89qyx7hYJY4U5igNIs9lRVu8+JJjjPp44PzOl
         rlM2zDFGG/UetMXayqYB0krT6B1LM/s9r12L8PjLN+yJ9zxTANh2prlY353uY3moAiE+
         Z8hOg/H4/uXrDHNCzLbHznRQvp/3KS8ZlgUGsfFG/id3lAQbYf1EW6lDNR4WILAo/NAe
         e1zSwJkKXA5qnKahZBoHR2GLH34i/dAN2Qo3852cgxBWZDV0fpZ3EtiwRV2um2bm7xwv
         Q7/afibOQoPibcHQEcibjPpTZn0ntDrYGx3Q0hQ1Q8wm+VLJO7PDmZDrhAon+ikPswCX
         f7Hw==
X-Gm-Message-State: APuU4Z8+LA25CBRkS6F+cpYzwmuF5sqSSTgZ6CWT9d+6Vf6PsFohN4gD
	AkIlZZEr6XsZn9V3Ej+o5lbbb5Dj4Z3mpL3wM6+Ai9ctuRnf7gYYe09u
X-Gm-Gg: AYBFou1OMx/DCWCS/w6p6j/Pq+gxJZS+FfctLII7b+lIL0DVbFIsaium48/MTCZn7+E
	OJnzpuP2UoZaagaJx+ryeVY613pIMmUsyMM14FQAj9o1QBwvTkJHhJ2/Tr3b7Ef5fTnsBOB8X6v
	ex9Luih0jTiCNbPqHwgOYQYXK0b5hTFplDcWfB5zsAtbJhzcvQ1Xl/QsYEnTmBdbRKTFiKjQY0z
	fh4M/v1D9WwHWpG4bocEpyWMp12hI3CG/RfB7S5UCQ2vdAShm3LMsUKIaYYxf+MngH6S0Jwkqnj
	Bjq/KkyKZbT6oxQpaZoGfE4zuj2um8vnxrxYp6XceM9qSg/9idO+Y/9CswS/K7A/Q3FS/7sfwyu
	4RhefE2QnLRxoHgpz1qsD8el159aqNJ3XbP9H6AorK9/KcpjfF3jxM3aFAO/CLSry7IJBsbPhzF
	SuNeagfuqTG3doVLPexL9nPspDwNDUQ5e8twAbSfjJayzcRXwfzwCf/Xf/b4/YvbGySNmkcYa61
	2aWf7zZIddfcl9PtGmlJzNTEbAKZAfJyHbBpyAmChGWeGx4GVXYJfKVbjVtK5aFlCJ3vOsg3rs/
	wca8+3ux+3MFGEosVLGfUZaq40BA
X-Received: by 2002:a05:600c:3551:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb55a99d21mr291016705e9.16.1794911470633;
        Tue, 17 Nov 2026 02:31:10 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm57712355e9.7.2026.11.17.02.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:31:10 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v5 0/3] platform/asus: asus-wmi: TUF keyboard RGB readback
Date: Tue, 17 Nov 2026 13:31:03 +0300
Message-Id: <20261117-asus-tuf-rgb-v4-v5-0-95268035eef1@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Q3YrCMBCFX0Vy7ZTJND+NV76HeJG0sUbUStKGX
 aTvvk0Xll4sMlcHzvcNnDdLPgaf2GH3ZtHnkMLwXILc71h7tc/eQ+iWzAhJcSQDNk0JxukCsXe
 QBaCynamtQoWOLdQr+kv4Wo2n829Ok7v5diya0riGNA7xe32ZeemtdjQkCVELUXEymgvg4GwcJ
 3v3+dg/bLhX7fBgRZppiylEqUhWXHOp8BNW/2Ec11PIq6ZpNJpPmNhg/0xQVgDsatdo3VFb45a
 f5/kH8xXn92UBAAA=
X-Change-ID: 20261029-asus-tuf-rgb-v4-06ad93a6060b
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>, 
 Bartu Alev <bartualev@gmail.com>, Daniel Pereira <danielmaraboo@gmail.com>
X-Mailer: b4 0.15.2

Patches 1-3 of v3 are in review-ilpo-next already; this reroll carries
the remaining two patches plus a new prep patch hardening
asus_wmi_evaluate_method_buf(), as discussed in the v4 thread, and is
rebased on the current review-ilpo-next tip.

DSTS device 0x0010005B evaluates the DSDT method EC0.KBLS(), which
snapshots the EC's host-visible keyboard state into a 16-byte buffer:
lighting mode, red, green and blue levels, animation speed, and the
four power flags.  kbd_rgb_mode and kbd_rgb_state become readable and
report the write format with n/a in the command position, because the
command word belongs to the write verb and has no state equivalent.

Changes in v5:
- new prep patch: asus_wmi_evaluate_method_buf() decodes integer
  replies through a u32, mapping ASUS_WMI_UNSUPPORTED_METHOD
  (0xfffffffe) and 0xffffffff to -ENODEV and any other integer to
  -ENODATA so bit-31 status words cannot alias negative errnos, adds a
  missing NULL check on the ACPI output object, and adds kernel-doc
  for its parameters and error returns (suggested by Ilpo Järvinen's
  sashiko question and Denis Benato)
- kbd_rgb_read_status() uses asus->dsts_id (matching the existing buffer
  helper caller and probe) and translates -ENODATA to -ENODEV so
  firmware that answers 0 for 0x0010005B while reporting 0x00100056/57
  present (e.g. FX505DT) fails with the errno the ABI documents
- Documentation/ABI: carry Daniel Pereira's Reviewed-by, fix ReST
  literal block markers, and bump Date/KernelVersion to Nov 2026 / 7.5
- rebased on the current review-ilpo-next tip, where the driver moved
  under drivers/platform/asus/
- Link to v4: https://patch.msgid.link/20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com

Changes in v4:
- report n/a in the command position on read instead of a synthetic 1,
  as discussed in the v2 thread: the command word belongs to the write
  verb, so there is no state to report there
- ABI documentation: describe the n/a command word, state the mode
  clamping exactly (mode 9 and modes 12 and above are sent as 10), and
  note that reads fail with -ENODEV on hardware without readback
  support

Provenance: the KBLS buffer layout and the speed-code semantics were
recovered by static analysis of the EC firmware (ITE IT5570VG), with
the help of an LLM-driven toolchain.  Tested on a TUF Gaming A15
(FA507NV): the v2 readback on kernel 7.2.6, and the S5 behaviour of
the shutdown flag by A/B testing both values.

v4: https://lore.kernel.org/all/20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com/
v3: https://lore.kernel.org/all/20261010101601.888709-1-bartualev@gmail.com/
v2: https://lore.kernel.org/all/20260926005625.171560-1-bartualev@gmail.com/
v1: https://lore.kernel.org/all/20260925200744.129714-1-bartualev@gmail.com/

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
Bartu Alev (3):
      platform/asus: asus-wmi: decode integer replies in buffer helper
      platform/asus: asus-wmi: add TUF keyboard RGB readback support
      Documentation/ABI: asus-wmi: document TUF keyboard RGB attributes

 Documentation/ABI/testing/sysfs-platform-asus-wmi |  46 ++++++++
 drivers/platform/asus/asus-wmi.c                  | 134 ++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h        |   3 +
 3 files changed, 172 insertions(+), 11 deletions(-)
---
base-commit: 9c82959c37bf69c2ace8a0f975cf2129ec1fd982
change-id: 20261029-asus-tuf-rgb-v4-06ad93a6060b

Best regards,
--  
Bartu Alev <bartualev@gmail.com>

