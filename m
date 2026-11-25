Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645092;
	b=cQwP5dAiGGfiB9KufMPf6JdsePvgPKzhqM2rbq6lpL1KOkRWOGVs3RQ7KZJOm4I1Vl1g
	 /cuaSeAyALTlAjt6g6WziV2Odaf5QdFW9zdMi87Dwq51YFAnsd1UhOuOaozTynK5OGVZH
	 pyi5BIn0s2S9GO1TxpTm5Nub+Gxxt/TDEDzNto0wKAFnwuvR1TumOvMo+YU9KYg4I4vg8
	 C4Haa0QJkUWR0YYMCXOb8PNO6fvx4KPob9UQftn2FGh+r96GODU0Rf4tKVeqWgjKmqs9J
	 s4VsLdcozGGHzrH3I980rNAHak9RSh48cNzF4oFxIzV+ae2R+61HlNaF6/ZhRdjSfzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AkD/EULkjYCTOVN6ONVEcYCDVTXRZ/wAEijqIncHQyo=;
	b=FJgs+E1ojWxW9bdPkV5OGOeoXC+pu3PKaoLac6NgjQ3ufQ0/F/ZjcB2G1191eqDqLfWT
	 ltL3rQRmj72o10U+K1j7w2/wEVu+PYgR/TMgWBPDoe0/UGJ85/U1+GVzzWrai40MhVf49
	 cXSzLjL0KlbeJf6tAZ0VSMuaFnmByVy6/n5KTMj4raWt/pgGX791SfCTCOp2SeyuKvXgb
	 ZHb2lFCs8hyyQGg2FVmYW5ChoR8FakzLy+pOubBLr3z33JfvWNgwlMHCqqlTqwtUQI6Qm
	 ISNcuYq34jSHz5JWvOmqdfrjoDJ40ahDavzbl+huNcwubp5Oax2tz4h6vJjBeyXgqOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EtI0OK/n";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A0B606A692
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 22:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53A0B606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EtI0OK/n
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385c497bf94so3951179eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 14:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645090; x=1796249890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkD/EULkjYCTOVN6ONVEcYCDVTXRZ/wAEijqIncHQyo=;
        b=EtI0OK/n6MC4BVKd3pAxgf03MybUyrEr/pFVhAvp+iXntfUDeaRqHxKpVaXFVHcGwC
         iLd4TDiqO9K2xRY0HvB79J3Ioam3j2ErwGhwdFBb2v2tdlUYK0Lsp7ONeo6Yf3A+GWqJ
         yUIACEFFlbyETHReWI2yAt3TjbRHcFEKmOzAFsuiTEFWvTbeZGyBYRwxoLTCVvDyr9Ig
         Fv7l1CLYjd03F8L3YdmLoBuXrxqbPP+hN4JnLCvOBLjxwHw2AOq5XdDsLxxA8dA2k+EM
         RNzjz6pVDloaKsrMUUxfbNRAYTw9LYv7STFicpVJsI2EBu37+Qghxv4fAkP3gd0hXMY6
         zNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645090; x=1796249890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkD/EULkjYCTOVN6ONVEcYCDVTXRZ/wAEijqIncHQyo=;
        b=QtTqDgm9gXvNIZIA1hh2UZ4fsP1+FFbzWqNK4nq1dHoYjMyFgDHqQlJ5om2ra/TL/5
         KnphM6dh5LkTtGaxbCbVNhGrW5Cy+Fss+P2vq7sSG1epWRk9/Zvr/ZxLpHFkg21xebmr
         Rz7d8X+UWpFQX4HlPz0Zn0V/6Z0Wsq6Y+H558kek1msED1xfzhIHH+I/jdUxFmUcnTEc
         uiWziRBWYADOR3G4thC1ZPDPwrFMca8qhzsDLEK2TGGklhIDhk+2uksVZsRy8zOYtoK0
         vn9B1evchVMVuUF5+xbQOLH/Fco0atHLErlgS+ug2LX/fACD2fxIXoy1vPrq/ArhC5xU
         IyAw==
X-Forwarded-Encrypted: i=1; AL+hErEtcagfwxEMIfMNpcz+bsePyNYftLOE4y/o84AuIf+XgJ0mENfphGvgf2Q4qHi2cafETEbjIPXQZFh9FIc75Dv5+ZMv@vger.kernel.org
X-Gm-Message-State: APuU4Z9GN1DWAhqDSsjuxIySl0aU+uYnm/GIdxFIcQM/+7oSc615I9tP
	4YnyKPXp+LxZnR9/M7DQ+GMAwlviTqEZehfCV8ml+2Tq035HhOo/+Ivq
X-Gm-Gg: AZFdTZcI5VOw5XkbAcMuXULAJZQRrEnEWPw/Gp+5+OI6FxOOEji7hE9POoNvXH9QgS4
	4PEHEJkyPSAeGh/gHyj4M4zVOpxeJdz1WRkGTVPHj7hEvAe+jqCZEKrGkKPn+oeJ+toCtPTnb2P
	Bh81mINsBJX1kmUbKo2g9WArcfSKyWWT1XotW3EiXx4h47FqoTZ8q4exJos/KPs8b+M60Z4PDiU
	ai90xZ+XCDwuky6UUgF5gMLT2j2P+Vbj67Kkx0892QvGOOPcLXDl8W+pJuCIjiQ/znbUXUinH/M
	7/3xKK1i6byRimEQs7Hj5lq7dSM2g2NM/R39hwAFQ1S4EV3tUragJo0QMIwm8VLU7ca8/rXNRXL
	hwvd8WTMZ4uojPuRwZT0kbyicjIQhEmp0Odbyr9aaDQs3T7WvWLDN+c3xIr2n7qe7dWV4zX4L5+
	ZIdGyG191PqNPg+zwr5r60OAdshulZdVZuiciDdifEorIYR5Z6iW9vb5tqp/ZQCRuGouQb0zAZC
	B2XU8vzH7Ec1FblztaOEbEZVuoPSc5O0c2TxMP4R0TIvZh1jXXwArX7wcV07BZu7q5Zvt569WDE
	TaT48kP/eO85i1rpxYPM
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr19243959eec.22.1795645090140;
        Wed, 25 Nov 2026 14:18:10 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm69581357eec.5.2026.11.25.14.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:09 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 3/3] docs: python: abi_parser: Detect a symbol repeated on one file
Date: Wed, 25 Nov 2026 22:17:58 +0000
Message-ID: <20261125221758.2535044-4-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125221758.2535044-1-takano32@gmail.com>
References: <20261125221758.2535044-1-takano32@gmail.com>
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

check_issues() warns when a symbol shows up on more than one file, but
it never looks at a symbol that two entries on the same file claim:
"if len(files) == 1: continue" skips that case.

The parser stores every entry under a key of its own, so a repeated
symbol on one file is visible as two entries with the same file.
Compare at that level and warn, and keep the cross-file case
informational, because two drivers may expose an attribute with the
same name for different devices, as sysfs-driver-hid-lenovo-go and
sysfs-driver-hid-lenovo-go-s do.

Verification: get_abi.py --dir Documentation/ABI validate used to
print four warnings for the cross-file case and nothing for the
repeated one.  It now prints four informational messages for the
former and two warnings for the latter, at sysfs-driver-mlxreg-io
lines 348 and 744 and at sysfs-driver-hid-lenovo-go lines 389 and
566.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
Changes in v2:
- The documents are fixed before the checker is added, so the tree
  does not gain warnings in the middle of the series.
- The internal MCU protocol_version entry points at the top-level
  attribute; v1 gave it the prefix of the removable controller's
  group, which made it name the same file as that entry.
- The checker keeps its warning for an entry without a file, counts
  lines rather than occurrences, and drops an unused loop key.

 tools/lib/python/abi/abi_parser.py | 48 ++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/tools/lib/python/abi/abi_parser.py b/tools/lib/python/abi/abi_parser.py
index d7bb20ef3acc..8b51659fb6ca 100644
--- a/tools/lib/python/abi/abi_parser.py
+++ b/tools/lib/python/abi/abi_parser.py
@@ -554,28 +554,44 @@ class AbiParser:
     def check_issues(self):
         """Warn about duplicated ABI entries."""
 
-        for what, v in self.what_symbols.items():
-            files = v.get("file")
-            if not files:
+        # Two entries on the same file that claim the same symbol are a
+        # copy-and-paste mistake.  The parser gives every entry a key of its
+        # own, so such a pair shows up as two entries here.
+        per_file = {}
+        for v in self.data.values():
+            if v.get("type") == "File":
+                continue
+
+            file_ref = v.get("file")
+            if not file_ref:
                 # Should never happen if the parser works properly
-                self.log.warning("%s doesn't have a file associated", what)
+                self.log.warning("%s doesn't have a file associated",
+                                 v.get("what"))
                 continue
 
-            if len(files) == 1:
+            fname = file_ref[0][0]
+            for what in v.get("what", []):
+                per_file.setdefault((fname, what), set()).add(v.get("line_no"))
+
+        for (fname, what), lines in sorted(per_file.items()):
+            if len(lines) < 2:
                 continue
 
-            f = []
-            for fname, lines in sorted(files.items()):
-                if not lines:
-                    f.append(f"{fname}")
-                elif len(lines) == 1:
-                    f.append(f"{fname}:{lines[0]}")
-                else:
-                    m = fname + "lines "
-                    m += ", ".join(str(x) for x in lines)
-                    f.append(m)
+            self.log.warning("%s is defined %d times at %s: lines %s",
+                             what, len(lines), fname,
+                             ", ".join(str(x) for x in sorted(lines)))
+
+        # The same symbol on more than one file is normal: two drivers may
+        # expose an attribute with the same name for different devices, as
+        # sysfs-driver-hid-lenovo-go and sysfs-driver-hid-lenovo-go-s do.
+        # Report it, but do not call it a problem.
+        for what, v in self.what_symbols.items():
+            files = v.get("file")
+            if not files or len(files) < 2:
+                continue
 
-            self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
+            self.log.info("%s is documented on %d files: %s", what,
+                          len(files), "; ".join(sorted(files)))
 
     def search_symbols(self, expr):
         """ Searches for ABI symbols."""
-- 
2.53.0

