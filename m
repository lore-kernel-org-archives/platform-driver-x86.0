Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646903B9617
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 04:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015526; cv=none; b=OiXp+Zl3XV2/q7sBJNmxY1w7kyK7rkrz5hTvNW3DrYBJXtCv+MVfEzwOkKr49Jfik6yLO4txrpkpEKZMgHstBXUdadqLDD+Op4Gt6vVm6+A2bqa8a2lix2n/dD5b8sXFfVvBPS7ytHtG2NYoo27pDsEPDJQc+vjh/s+wSUzDm88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015526; c=relaxed/simple;
	bh=/SGMNQzj/4EL3t7wbB85AeQ89qFG0uN3NaQ/roGeogU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYnHaKfcUkIFPVb0xbuXkkMRVnbydZfNY0jf7e+dG6e1dGgc2PABx0lxpQaTXReRXqYNz8aaIefTwqogOYwGpSJu+EsVJE8hjsvG39bAWE7largOPMWBebgCLyIhSYhfCt1XfCX/BZmjiC9p/fPGRwDhYJRR/5M7eNwg/TL66VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaX/Wg8I; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaX/Wg8I"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d6efd73032so5774665ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 21:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015524; x=1789620324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6R3tUgx0jRGxvkYAalDKt/ASQNyF7HuoOOF7PFysXC8=;
        b=CaX/Wg8ImOMP4O0QCsek0JSR7pDfud23gACnZN8UCqMAqhr2mE1baIGoDyZTbc6sPD
         FKPsPYaDVNeI+um5J2sd5JaK5GrG49mcWPUEVyb6voPpyC97HVtL7tcnz5ZNGYG0uYzA
         v2D3MP1bbQZ0lyUvaZ3CDLiWd/ZQoN+9Mj3Dook9XxUKnXtu1nBnoS3UfIGUpGAMi8Uu
         h0VfZjeJ0Flb7zDp7qevEi/J+YmMYJKjijuIXj0EJZ391pMN06+TvSL7WekOssjM5sYN
         vY8oNyATFxAf/6nYt07CByqGPAvTJkdx4PilL64dFIOsMVx0BQta4fKWphXE0EANL3i3
         Cv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015524; x=1789620324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6R3tUgx0jRGxvkYAalDKt/ASQNyF7HuoOOF7PFysXC8=;
        b=KowTqlVnEQotemZtkIWUTtKZNNe9tWMtGCxS088KeLzl6f4P2uL/jr5GhF7MERAS6F
         N2Odd/nBTYnHPMn9RZ94Kinbx/uYPtVas8AJ/jZHTJAUeSRw2t3ImdjPnrhGc6Akh8e7
         JWDoHK+d5bwhuvOEww5QyRk7u8eJmca5YooxRBsQhV021/weat0ZOdd1wOP1UYcxOZG8
         QcVTFFJ6vUN3+/GeldMJ/Wp82poEMPd+2nbNx3N3AM/ysmbzkSxoye40/Q7tHcXTuWSS
         HQhIy/x7sU1mL/lhDdp7tHgwMONonh4VB/5piJCU2PxUh+DWXSfOViXdm1SNMK8NJIKY
         9GXw==
X-Forwarded-Encrypted: i=1; AKwUvBxmygB0840J5jSMSdKudd0YL9h8O130yljO/zEchKEoLCm4SD+pae020khNazOjgvHZ92cQGA63t60qqM3gxyGxWVtS@vger.kernel.org
X-Gm-Message-State: AFuF++lmHI4iimGKTkTYNgyFgKpoMPZqsj+rymJPKcuUitRhOpPDPtn1
	A9NeH+pIpmjo1BNBLVRK9kmCZj7tvZXT6jJmBJ6FLmUoQKaHdId3FoL/
X-Gm-Gg: AYBFou3TbW6//420dcqYFmbTol+FdzbEdLLOh5HJKk43nKzXCkWdkKLV+pntUaHxibH
	qz1Q4SgOu8Jw4Hi/Sczvy9Y/eC5tQEMEEdTL1fSrJKlM9MqOs3eAXMhf8Yxh/QB1PEuZ7OhWQ2i
	eqCJ+uHHWALhgWzLRajExX4LjQbnpEpQCkouiFHBfVL8/EFKepB9iGxS0CmlNU2CmoE5L4AGnDU
	O4NetQvnnzLPy/gefXhRFeXCGu1DkPn/KKR4EZBKLsCVZ4I7QEuB4+JpXH87ZB4pgFC8i+iLjMq
	qpe6cfGYJx/+HrfIuS00i3rBfpB4s0lXomxTvJkSa3/OAi0D2XDr5cdLNkZ+iIqqAsIDSrT3Sn8
	F4MmkAmNCUWL695954YcneZyYB1IvmyJ6U222yvE7ABSBYEUuh6OsuAbi4VsxTJgC1UKFxxv8Cg
	k69wuukDY9ucbgtXQYL135ioKfurE0D6GTVtJ2llw0ZCulEmkolkP0HXXIuB2kIaWOM8M7KhnbV
	1BV4NjzEJWPsqer0CPSo2TIqLc=
X-Received: by 2002:a17:90b:3d81:b0:398:9beb:a2bc with SMTP id 98e67ed59e1d1-39d77d1752cmr3286225a91.30.1789015524494;
        Wed, 09 Sep 2026 21:45:24 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:24 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] platform/x86: samsung-laptop: Fix typo in sabi_configs comment
Date: Thu, 10 Sep 2026 10:14:42 +0530
Message-ID: <1ef5ab664c2b4e0080641271a278c1659a29a167.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "wihout" to "without".  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/samsung-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 710f3d5bf84c..18631e96bb17 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -295,7 +295,7 @@ static const struct sabi_config sabi_configs[] = {
  *   d0, d1, d2, d3   - data fields
  *   call             - call SABI using command and data
  *
- * This allow to call arbitrary sabi commands wihout
+ * This allow to call arbitrary sabi commands without
  * modifying the driver at all.
  * For example, setting the keyboard backlight brightness to 5
  *
-- 
2.48.1

