Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB10339390
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 06:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132477; cv=none; b=puXvSOmwP3fql3rVCzKhpV9bkUq8k6ye31HFNXuJ9b9I4U++jWc50NqW91QZvUMGit8ljEHQK2OvQIf3InHCVvjmrJ/2khEF+yS0MECJkqEloZePkqGfeF74r6t1vT6dojMFLrV6enIJ74BwIFGGyQk4zNRC/9DT9ShnvUDdpt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132477; c=relaxed/simple;
	bh=ckd8Z01py6nfMuc7JfJGjW9DMPCumhB1KgWSdYZ3e0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnweKVnAswUMYR6NoWDfCpMHeyZSxpUVfDTCr+M8Mwd8bMqgNRFbyiF0ja499jNLcWXasEa7AUOQo/1uoeekB5e63PhkDZGEuKL3D6fCZfvqKMacBsmCLOUA3QAEBYwyejd54bXOV2zWEvhcv8hr0OfFkNTAecMENBWDFrYgJI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjphkV2I; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjphkV2I"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1294243a91.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 23:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792132476; x=1792737276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckd8Z01py6nfMuc7JfJGjW9DMPCumhB1KgWSdYZ3e0Q=;
        b=LjphkV2ILgevGHXbwcsAEwbzCks+3pGhEr+G+Yx6d7SJ+5fJI3cjg8RXJEtOdaS4yG
         pF9hdemfgU6ESqR3JwqHKx7VHN9R51vfrFFZEGPmr8nYg6q0X4eeRI5ywsjzIr6MpvYe
         XhwR/XIXSpGnhaLY1o6Jfs5ZB40BDmdtkCdyu42r85hI4rbbZTF+oW/uH8KZdTzEQpIf
         Cvx/br3BgF5Cpu3NUFgLfsbkfWC+bm6SWQPlWfDAiRtCtSSWEwXPQtOLeAmviH3UDA6W
         ktCriXMkUxLCcCuQRzS5eCpzNiORSxIl1z7kfb/A6tu+qpU37Cas/xjkE40eNlE1ufDU
         /zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132476; x=1792737276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckd8Z01py6nfMuc7JfJGjW9DMPCumhB1KgWSdYZ3e0Q=;
        b=soIqlK4E6iyE7xL88cSfvxj38q+JMsgEoxtSSmSe0r5Ky3Bktk8Y245u32z6kkBNAY
         d5htPZuYGjOU8Qx9t1dOExSUO9Qs7QGZvzVusOwdaB8DFemhacufwahlmdbOSqPtTWF2
         9Y1RLkS0eEYRIbSG+0mDLhtMXAGE9Z4nJ2ZVG7NbF4+EK97duo6PG80wDIp5lEknqyet
         XkcRme/MToU13PHBDFjTYQOIi0pE/s75CkMYRd5nGRYEvEhOW6ixZblZnJDr8GfWB8OB
         ETJM1Mvye2SzB6dPAtvZn+WkfIpurzLSuDg9sP/mDBuhmYMEb+J6DNiFkDOewQ439y8d
         u/0A==
X-Forwarded-Encrypted: i=1; AKwUvByW2JtRLYb2PPbc3K6yg1+lekfIUBLPch5r1/a+p9+Y/UbERETBDVFhsZTW4Y4hTLdoS/MeumT4scef4QqTMH/X+VXh@vger.kernel.org
X-Gm-Message-State: AFq9FYKYq7D4up/ll2xaaHXlj+P33RHtVaegtsGZY6n1wunFUtatc/BO
	qItYq7gJq7UOqLM4PukKs92hnFPBpGoX9y/lLRnvaZd8A6p7exk9M4pW
X-Gm-Gg: AYBFou1OfaFdtN/PzlUKLmGyk+fdhXL0UPx5zr7Ij40xk+i10SWOrGiAGS5YoVuj14U
	UTMznH+rER4iSPsm5EAcXEyz1vjyxhFV/fRuwDgpsFly5Gd+lLIYIM0veQE6N8m5dciZPpwT/qF
	LJQF2yuy4+yCGh1lZpa1HuTFOQnTDUn1mVYhvDRHd1KR74uIEAvuv0dtWkyPCAXYkoM8tmMAc1+
	q0EWr3kC1pPjFZygZra0xOh6r6TsgQ+RuC9kodbDW1ca/3IB6aW9nsbTj9+Vz2rpmNY9RC+zhhh
	BJaYdYwsaPAT3ySfWOGocW4sK1jHXTeGZ+gIOlrWCdTAhih5Je6Bmkzt0xycC6Pn6+UJDq1BpJr
	J77jcy5+NYK1QTmokAzrJfvWePwLMuV9YP/EF5sNF6s4dMBzYuVUNyMa8lhfzt1usUPj+JVlc38
	/6cMvnrFnprR26VyP/BdnXBcT0ZwOzFxl9aALXC27Z6qwytLHPWLcdY349MeMAAxRRPRyGrIwMP
	KXPFbX3YpHTr1/oWgKoHujLqANsAFRkN4+I
X-Received: by 2002:a17:90b:2885:b0:3a8:495b:d64b with SMTP id 98e67ed59e1d1-3ab3a32cbb8mr16897575a91.4.1792132475742;
        Thu, 15 Oct 2026 23:34:35 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947dfa00sm7678169a91.17.2026.10.15.23.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:34:34 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: hansg@kernel.org
Cc: W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	scardracs@disroot.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to wmi/asus
Date: Fri, 16 Oct 2026 14:34:27 +0800
Message-ID: <20261016063427.664738-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <41d6bd7a-e4ea-4077-87e3-e60102ebfef3@kernel.org>
References: <41d6bd7a-e4ea-4077-87e3-e60102ebfef3@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin, Hans, and all,

I tried moving the ASUS-related platform drivers from
drivers/platform/x86 to a dedicated drivers/platform/asus/
directory. Most drivers compile successfully after this
restructuring, except for asus-armoury.c, which depends on
firmware_attributes_class currently defined in
drivers/platform/x86/firmware_attributes_class.c.

I found that Sean Rhodes has submitted a similar change to
move the firmware attributes class:
https://lore.kernel.org/lkml/ar0DNFlI7MEA8zp2@tzungbi-laptop/

The patch has been applied to the Chrome Platform tree's
for-firmware-next branch, but I haven't found a corresponding
pull request to Linus' tree.

Is this change expected to be sent to mainline for an
upcoming merge window?

Best regards,
Chipang Kao
