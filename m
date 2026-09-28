Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CB74F68B2
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 20:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625813; cv=none; b=QysHGsIX5eqV/L3eS5AYlfhs5kHzc7RIfknKn9sIDxgJ/v7Je2KyAGpCysK8+BldCV6j2vHya5v7fJt/AsryGKBFsWQKA5nfd0efXI3CATK28YzYmmAnpw4Re88D7ma3NHhkqy/zY+jyQNq0YPH7dqZWdSm1g7Vd1dXCvD0qZDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625813; c=relaxed/simple;
	bh=e79APqvYPYxLoCGsyadc7ocTHlw1rax0P3YjVlJP9aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hu1yyeO2eoopmzd7XA2H4RHBWHhT9SYBk9UaPCeqgMMgb3V6E1drtOfFv5rLoCb8Kq/hUvc84Zt+c75WGSxXh/20qG47JaMc8wjMrF8BfUf8lmnMZ3BCpR5UNDT6LmWmlJnIVGeOqRmhLP/exYVTvRcRv+X83dBFUuOUQf0UiR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jhwxdpee; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jhwxdpee"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so26293385e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 13:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790625810; x=1791230610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CViBSPtF4LBYd0VEUs46UXkR40K1KrpVeCYIgI+4SRY=;
        b=JhwxdpeejmUWvh3medXcyG14siz1WJ5edbK23U5KTXeIQLhj1cmVqsM5u51jnMUPdK
         I/haRMc+kvuL68gOabf8rKM/zpq4ZVF+pmYY3jHWHbfFIhFKcYbKagvbVfwquGrZLsCY
         JBk54NpC/EEH7ELoZYjQT5lq4CAJQkYjKu7ijETpHzk3oUkbBTJjNdYg/qNaHwboV6Fb
         f5Jo9CgLsc8yJ7dAbOsWJuegC72DG6Tm0L8KdqmnFYYQB8gdPcaq+dI6kar5BJ9rOgg0
         zJdrY0MdG+MyNzq6sYuXtuRmhdkWL8K4K3wVQwIB7+G/gAs4AZ2bsMAcUN8xPVFEfaBC
         gUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625810; x=1791230610;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CViBSPtF4LBYd0VEUs46UXkR40K1KrpVeCYIgI+4SRY=;
        b=nyGEjf4+BoGO0DX41L5ftYH5kjvDAmtJVszIy78IF78tghChhXdVIAL9veVztIhkfd
         xVomKOgQlnaSittPcBx6QWBr2y3GztwWBS7zSs07yNWYnQphRlxpvPzde+7nFtwD/hSo
         gvZoyCR1sLXgS8HdJlAj5HKkT//kUuzch4aGqF7LXzU1tsQB65c7DMGj3st/Z4C1SQ3I
         CUtN+oplimhHLKJByBLuVccmp8+cQKvGqR8QTEb6DdJ/DoP12FdQfT9Yi0Ctaikmjh4h
         tD1w2lyT7aFc+99yHG5uZHMfF4iL6YJ3S51W7Pcsjhwh/usch99KD4EEKth+d4lr+NFd
         rQUg==
X-Forwarded-Encrypted: i=1; AKwUvByETH1PzvLdbc8lSdoNkP47BK99jtge2YqNq+NQQgTQ68pZUKdKzGhljjsvoGiBPGSvXKFEblzEhOvD6C3A4FfHakcG@vger.kernel.org
X-Gm-Message-State: AFuF++nKn66HkLWt7pjohEcOHqS77qYBpcMCUpJd2qdniQMyAL2tWuk1
	IJJ5KHV5QytxxOp+xaQHWOVIR+KZJAtOkzgXEdyABolbCtGqA8IPuqaW
X-Gm-Gg: AYBFou3YNAWfSFO7XZpEEF9yjXaGcb2wc8AgbWT3umyOjiof+RNiv4bnH7FjyFdCbcT
	PyfyM3WUAgn34Dk16A9idynBTuAvEYGz4UUEoEP+qHPhnuowgbaCD79OIAla1Z4B1UxBG6BoPzW
	dkeQf3zENouYrX0cJbido4H7WjBRCF3+SD2OZ5mJrMFc4/A78mSM8PDz4U/Zgwp8ojWC4g0M0ua
	HfpXboiKb6negLG7Lb8h1hWXGUlqDMMaOlfcOQv7PWB/2NJB9vPuTRJvI/G+k7YT9kUuqPE7x7U
	258wuAjrf8UInf4TKEsS9K4c/uG+bidzL8YAP+67NVZFlcyH+e7vHbo+mGqEZkYZh3zIJFjRS4n
	Rw60J5Pi7311HBXr8eiLgRjCWmycAPHVN1GXBL2JWHkeecfx+ttzPiagRmp0OVdj+zyByaHrPv/
	RSDz8CaoopHfzNmqnhmYLsFe0gwRllf3GuIeLAu/wOf/PHy4IJu68EcgiWeboWb4gKW42rsweNb
	y1KUi18IgQlo0E8tNQp6sYTsWmJoeA8PDAWw5Xn5SeEorrX0ZUV
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-49fe66f4c7dmr234761645e9.18.1790625809613;
        Mon, 28 Sep 2026 13:03:29 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c0730a8sm26506625e9.0.2026.09.28.13.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:03:29 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 0/3] platform/x86: hp-bioscfg: string buffer and password fixes
Date: Tue, 29 Sep 2026 01:03:15 +0500
Message-ID: <20260928200318.63383-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series addresses string buffer issues and password validation
in the hp-bioscfg driver.

Patch 1 fixes bounds checking, prescan OOB read, and character count
accounting in hp_get_string_from_buffer().

Patch 2 replaces the truncating manual conversion loop with a two-stage
conversion: utf16s_to_utf8s() into a scratch buffer followed by
string_escape_mem().

Patch 3 fixes validate_password_input() returning positive
INVALID_BIOS_AUTH (0x0E), which caused userspace writes of
out-of-range passwords to appear successful.

All patches tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7).

Changes in v2:
 - Split hp_get_string_from_buffer() fixes into two logical patches
   (bounds/OOB reads and UTF-8 conversion rewrite), as reviewed by
   Ilpo Järvinen.
 - Dropped lib/string_helpers patch: pass "\\\r\n\t" to string_escape_mem()
   with existing flags (ESCAPE_SPACE | ESCAPE_SPECIAL) to escape the four
   characters without altering quotes, as reviewed by Andy Shevchenko.
 - Added password validation errno fix as patch 3/3.

Muhammad Bilal (3):
  platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: fix non-ASCII truncation in
    hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: return -ERANGE from
    validate_password_input()

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 77 ++++++-------------
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  6 +-
 2 files changed, 27 insertions(+), 56 deletions(-)

-- 
2.55.0
