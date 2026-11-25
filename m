Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633667;
	b=IRGbJubkS2sA4sz71AsOaXrAeWIgHcorU3hHA5MH1sXEl5TzlXxUuEzTFyhaTg/6ihj1
	 tHS/+HoavixJ8wwbzI14o6hQLNewGZrmigh8RjVQgvnj9ze7SAbpyai9t4iHfDOmb9X4y
	 cqUPOeofGZfHjSnYbewZVpXVYmylNUMZPjUplIgTx8qrzFM3CDPF47y6vxdSKEXJyhnIo
	 pZBHbTFkdWwdo4Bn21yJTl4BwMszQmdMDhh1FpXUH5TSby4H6t+2X7ekCGcqNLKZrdKM3
	 UXtoVrF/hqlzemsxtRD8GNDH44SYaHWmmF1rzid+fc5ExxKpVFYQZYy6mDYnP6K+4eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sKg8ZyMEEgOXaGd8usgF3WU02o1HXUcHjHUf4a0nWGw=;
	b=dAVHMfiVbSmCaMiLhI1cg3/zIg7oolmX1cYgZPZPeNN9iIB9vEOf1h54JXAwJhly+jRG
	 XMR5QGnn/LvVacWxAwk/+bapfDKWfPGh99INIrDq+sqK61uarUPUx1sLUiPgL+qxQ8iah
	 IUHWyzz1sn+kD3qLTlBp7o4P4xNYVsoriY5tyfIOIs3DFiVUfLB0OB4pOi28XD0NEM1DC
	 HHdvrP4+PVWBpfusjAlm6JwN4JvEPzIt+e8rYrs/xw764ZyTQfmmxsOoKZVIjXMvGeTK4
	 /bOLOh8nmHBAA6qeBNrGQSCoJcgdqVhxTdUnoYChRNXd9Jrk2THHZI/iJGE6ScIbqhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFWesse3;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF5606A327
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 19:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62AF5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sFWesse3
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so4033358c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 11:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795633666; x=1796238466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKg8ZyMEEgOXaGd8usgF3WU02o1HXUcHjHUf4a0nWGw=;
        b=sFWesse3cL28V8jFgtWKa3sArLJ4cUGPF0a1k6zvtoIheXiQiv5m6nQpFjhjQtjnUs
         0lP3pojglMhy+AKhtXLwRPasBn8iWb2/zwFHh/ZNTgUqil0PsHQcUp4kh5cPrW9ClEeL
         SBABfdnKBjwA5PZYNa2zLx522WUpM0wiOOAEhFAsNqVIHuCdejxAXi5TyuqSrHNtJNuL
         4UWrWZTTrO6I/JktPfRL0NjX+f17O6l6KxKZwfpc41OOaztXyiEWUv3ImSjvemOY11fz
         H+fEGFLrFH/pP+oXWjMuwBWjgtaSdCPSCc33VyBnNk1lHlJFu2PDvdD5NLGbjMJi31BL
         HBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633666; x=1796238466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKg8ZyMEEgOXaGd8usgF3WU02o1HXUcHjHUf4a0nWGw=;
        b=0yxtc0A5X7hQDSj2xAE+KEsYZn51h1Uv+awMmTA1fN2pdcgfCsNDL/sbPut126wjwf
         WQgm5u5a+f65c2/yxh+UaQ3Rpvi2GBqfbYQC0gOkO57Hgs5//x66kYlT88bUQ6jVwNBg
         zjQJUWbR7BeO+QnObjQpz1o+APF2UTYiMA0J0DUZrBPuWrGzHolmI8QI42Eva9vTdgzg
         JEX+VH8FvrFvM1SDPYBqJE/Ir6XDLVYY+OmU6v99YJULgwAnxtwq7aaVRErtnT8qw0ti
         yxYHICAK9eG9UHFM5cufe441PZ7qP5kmZb5gmjHFUXcBbRNzEF1rNCVoIYSP5sLar73U
         pXUw==
X-Forwarded-Encrypted: i=1; AL+hErHfa7g7/5NK8PGkrwEUjLaVTUJAZOMeqmlo5zrXmSLGDeon3uu7Y4WBRpS/AuSnPf/KkO1WraqKomBcGRdY/m5O7JAm@vger.kernel.org
X-Gm-Message-State: APuU4Z+flDdCwPZWAV2M/c4rYjizQ2exLjVIKOF22V6aRpKLmxgGMMM8
	jzAtrJW9tezgYegKUnKLR+ZwX/DVRQxf3nTP7YI/S0FC6/pFjjp7HKcS
X-Gm-Gg: AZFdTZcdXOToF/HJBJvIjaWL1nlwbtdpHKOBGKFTYJWNgZkzMxuGzbssPD8A6+z5QdA
	sdDqb5y1m1J4ERpVKLCKcHq2rU2MY1sDolzCV3eyBIhOPMnZGzcZtvehLwRVmQQJhGNSogu8ReB
	/TThUvGsrILDDVPDMqxJE4XVat0D+FpCJfAKyNTP0JVf2Bl9ZzZsKsScIc+XyQG/zP8a0vc/jXn
	6wwH1Q+CTt9gh0gtElIgd+urooW+HNbcMzUSYPTeyvQxGCnQ7DaxbcQEPkGSfbhZc8fB2dlH0tM
	vTfWA7BymmbYzGCUrfoL5qJAsUvu4qAw74gH0/t1kNd9P2rclevYVwsL0/95ox+ipswsR+AEu1s
	8hICkKLV9/nlOElyyznYQ6Js3nv8klftm4UaPVu/yIZJm5f4GI3oZel/u/eut0cxwTeCjWLtaB1
	XYSFKXcgvBwojwmM+cMOp3IAQBk/nYhs+ZNa8Z1VOp2RF99mqlUtysKYOhDAjTDz3dXjsbUo7LT
	ASW41lkQipuGAnuY15qVgTk0vXtB6se5Z0raamX7BDZc15PrEOm6oPtJaTS5VdRaNlFaBLhXFOZ
	sjOBnq/T/O3/c6r8FeMdFb/Anwf3cI2XVYrktVaEXA==
X-Received: by 2002:a05:7022:7f01:b0:1b2:6a01:f55e with SMTP id a92af1059eb24-1b56f39c712mr9624578c88.34.1795633666143;
        Wed, 25 Nov 2026 11:07:46 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm42584510c88.2.2026.11.25.11.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:07:45 -0800 (PST)
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
Subject: [PATCH 1/3] docs: python: abi_parser: Detect a symbol repeated on one file
Date: Wed, 25 Nov 2026 19:07:40 +0000
Message-ID: <20261125190742.2420486-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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
 tools/lib/python/abi/abi_parser.py | 47 +++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/tools/lib/python/abi/abi_parser.py b/tools/lib/python/abi/abi_parser.py
index d7bb20ef3acc..519ccacbadca 100644
--- a/tools/lib/python/abi/abi_parser.py
+++ b/tools/lib/python/abi/abi_parser.py
@@ -554,28 +554,41 @@ class AbiParser:
     def check_issues(self):
         """Warn about duplicated ABI entries."""
 
-        for what, v in self.what_symbols.items():
-            files = v.get("file")
-            if not files:
-                # Should never happen if the parser works properly
-                self.log.warning("%s doesn't have a file associated", what)
+        # Two entries on the same file that claim the same symbol are a
+        # copy-and-paste mistake.  The parser gives every entry a key of its
+        # own, so such a pair shows up as two entries here.
+        per_file = {}
+        for key, v in self.data.items():
+            if v.get("type") == "File":
                 continue
 
-            if len(files) == 1:
+            file_ref = v.get("file") or [None]
+            fname = file_ref[0]
+            if fname:
+                fname = fname[0]
+
+            for what in v.get("what", []):
+                per_file.setdefault((fname, what), []).append(v.get("line_no"))
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
+                             ", ".join(str(x) for x in lines))
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

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

