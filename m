Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447987;
	b=x7Of1zqRHlaS7bCA0HU3dzziRZwFgLBu34YGj88vvByKiAZQRQouy5fGzkT1cf9YmPyw
	 G1kEAGUP68+++d8F/AbVvkRhnns37EeYJw9dnH1mNjuMsZvr1YmxkydJvPs3Q9TNBdY56
	 ScS7NC+iuujIhGSFsHYVS6m9bY+U93LsA3cC25FaDR3Ayf5bh3r+pR0YaZpS+ygSBgdw8
	 tBmD8XqeER8YtAV3IfEg2uYS2hJgTXkDlRCKAToPiU6+c7JeUYJhYOZcOG2A4xutNLgbW
	 OL7ushNiRcRmzh4s7OzDwjmO0/tE6+4UkqakuuYsbEJqzS3ancH5nPxdh39QEImVQXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yHaWE7Xm/pHnXA2ZfNvoIACRk3sBe6flWjeltIsyBVE=;
	b=QYaSixCIFS+lhwzQDxrA7rjAJyN3bH6D887GImlOumv/DtKgwAM9M1hXvITXw22wSV08
	 TwZMsFBOM7dt/FvRkRSF6doSXkavCiwB+wYHbKfQBXooOipsG5q4oHZH+AAyyFeqhEHD3
	 dQJiM4Vo6I7tHb01B+HZCagu9VODk94VmtRkr+PjCDOmF78W1X7YVoGxglpVD2wG7ND2h
	 xbGKT+UzjYcXNx9QAq6HTDg5HffVc01jwPip07/JenRs8jq0NTu7Qko8NTN8bIWIKqWYV
	 JZBc8/WtQKCoCQU4d5u6Lr3H/D6pNXcrrB7Sc2UL+xHjxAG355tqRKPIMOuq+m9Yf1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j02peN5/";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEB1606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 15:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DEB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j02peN5/
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4306144c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 07:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447986; x=1796052786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHaWE7Xm/pHnXA2ZfNvoIACRk3sBe6flWjeltIsyBVE=;
        b=j02peN5/pfnvC8AN61pK3Zt26cDDY51Olo5mB9VLHRWZH6m2FJE3YBsbwecVtu+8Z7
         /ZJpVNVcWOkl+Reee5uOwga4jrDyKlLStxiG7Ckl4YPS+wP/ZG38LAg21BYmMVjcg60I
         NheNnaIGwF8Z3hptx216+g+jMe8jm9Xzqys4lLILm/qLvP4eiW9zG5xbfFizmT98LJ+3
         1+PV8GhS96hwUBbn41vlL1priMrYL1aFsgJX4J+yAlFSpPqXSom2ubhRXpqvsZRCQeJw
         kYJduH3vLDa8tRII2hJQNzLwlMz/IhzKrmniEBivLbZXI/YKrv9M4b89LhXPA0+wayaL
         8d1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447986; x=1796052786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHaWE7Xm/pHnXA2ZfNvoIACRk3sBe6flWjeltIsyBVE=;
        b=jyblRTQwktAKZK6u6z6oDQ95Vn7a8RZN6lv4HHVNdJGPBoAYKkw28YjU6Mkf4RcGMm
         RNPdPT7Kgn8mOmyi0WTvmjWKY0J/v4FNeaBQsx+fI47zu1crQxpjl6cXJ55RgNeY5R5h
         d/1mZKFIJIzrTSlbYx/2wedxKh8fA7GA/V9FUiwrzGDCGiySBToYQxE+AIUY/MV/NX6C
         K2YOP6caxLf49ZSi9xtUypYTggqbthx1JDCvREguTYUAPjgp9yGvyZWhWsjulWxRFxff
         OOy1b14K9KbRTVRuPU3iUBKsPt7WPontueb2Y2xgK/hoLC6+V61FWIXVSleat+Z/PrCC
         2UEQ==
X-Forwarded-Encrypted: i=1; AL+hErG+vx55RmJ779Xz6kZjLrC2dXpbJ3D0UtCT8yx6NriGeklLdHesfkNDDpDydqNj6Nbed/nUpEOWfKWX6DPQHJWqyYxr@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fh9QkhV5PGU6vfBb4/KsL4ok9OGJNTSyG3ouQc4XK8IAogAKO
	sis2lA2JBnm1fzqW5oPHzi5OQAMOMVUfYnqfVxdqN5clFUg8mGGiEoo3EM58Jg==
X-Gm-Gg: AZFdTZeabcbcaMaOhmD5BzRST8PpfttvPEjS/oIS+FZndNZhtJrc/s1zJuYh1re1uBb
	s9ABuAVQ5d7AgKa4FFzmP9bOK3qANT6knuNBKaFCc3WTP/P47Il8ksJvs4q269u3lYC9Vobfwga
	N6lh/r6OgNWtO7n0Fj+qnQJt3FX4FFmZFjMfXC+ImZGH/mhVNke9cqorUXz/pxXK9/C5dUqRInm
	8TKGNGdS/h8XFgjaRh7QMuUJUpxlcOPnrWz7ABat9bgjubAGGGY3wY+LV5pD6kcLNWp9anhJbPi
	e9kcgRY8aBA0H3A758gPj1Pl9/MzqGvJicQhcD9DDH7nsLhVx7+qBZvY0vTVBGv0QTqbeqRLmYF
	ZtHfdK6Kbz/r3xdqeV8DUuTSakxXjmkfhwEy1ZzqsjqKVtN8joN9NJXpNuerX2rTel3WDpozg3N
	lCJfWQb9evym5K9N899KbpEwvRVndYdQztRBRr0y3r206pCHLXYYFgZQjewz7xOTRYzUZdoas/z
	P2H5/pu8cMOceM6ZDzdygSC/et1qWNCaqHV/ZPhvRJScVLJMPjjr48EEtAJa02Alt+zeWylUp48
	qYDn8vifAqkSHhVHFz7UHMdeDeHO40F4wtDSbIxCCrXfZtHIR1k1ig==
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr1595856eec.34.1795447986140;
        Mon, 23 Nov 2026 07:33:06 -0800 (PST)
Received: from localhost.localdomain ([2409:40e2:122d:3887:9ee5:1e78:760d:3a39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm34587395eec.16.2026.11.23.07.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:33:05 -0800 (PST)
From: Sourav Nayak <nonameblank007@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	nonameblank007@gmail.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 0/2] platform/x86: hp-wmi: fix platform profile values and fan freeze Victus 15-fb0xxx (8A3D)
Date: Mon, 23 Nov 2026 20:59:15 +0530
Message-ID: <20261123152917.14260-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <47c9dd58-774b-20ea-b78e-0d3453be0a42@linux.intel.com>
References: <47c9dd58-774b-20ea-b78e-0d3453be0a42@linux.intel.com>
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

changes for v3:
made patches seprate for clean merge (thought it would be better?)

- v3 changes are mainly for fan freeze pointed out by ilpo,
- added a bool in fan profile params struct 'hp_wmi_fan_speed_auto_reapply'
created a new victus_s_ec_fan_profile_prams with new bool. 
- also made that bool a wraper and re-made the 'if' statement with it

changes for v4:
as per feedback from ilpo,

- drop tested-by tags from both commits.
- redo of commit msg for 'fix fan freeze during load for Victus 15-fb0xxx'.
- redo of commit comment added (on check no warnings were produced).

Sourav Nayak (2):
  platform/x86: hp-wmi: fix platform profile values for Victus 15-fb0xxx
    (8A3D)
  platform/x86: hp-wmi: fix fan freeze during load for Victus 15-fb0xxx
    (8A3D)

 drivers/platform/x86/hp/hp-wmi.c | 46 ++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

-- 
2.55.0

