Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875601D86DC
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768678636; cv=none; b=Vt0zYzDXPboez1wzCGcKL5icwi7kD100EOlduJLmqI8pfsUQ7u0vMLdsSwrN7IEQXjQPMg4YvvQrRjXSZhhoXV28BHwxgIolFfG7dbyUbjS6XNDBMC/YgYMZ0uG/yFkqdX6cPex3MfVR13upe4zojIkq+B7RPbWK6h001nXLRes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768678636; c=relaxed/simple;
	bh=7MhmRHG5OmWUrhM6cpa3CWRK7GYpks9krQuH1JNGUFM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=i58TF4Cd5RTNEWMvzZggwfLwOT2XD5hF9GmCol2PxsP+JTwkFlSPD6xEkvfaeAw/30Srp53ctA6Dekr4+H9VojvqEMDNQlY8TjKUeARMBoc1FEanz0/hi7T9tIa9Ic53TwJ1wGymOWiTRUS7bgmvwstfdY6VRLY94TEyHkfZEt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbvoDP+0; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbvoDP+0"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38305f05717so27099891fa.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 11:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768678632; x=1769283432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=46KVe15tN8TpcCSkpGIyJmZvxVcuVxo2lcJNsvw24l4=;
        b=cbvoDP+04V5PxI0p2hD045rKNsIpgxeNnRQLeJd0hDr8Jp/zQRh0mZMGfB6v/W825x
         a8761fonuowWLFs1mDX93FIpBbM/wtqB7wcMLBKNgkTrXI/edH8T5wjzsQq4ttC0sK8K
         Qjf2B0PM56sdozQ2PtQzjlFeub8bP0sRWjjpepKNpDm+Q1qnBOzn9CvRM9uGGMXgHU5Y
         h+3pjspczjEepYZD13rLy5+IgX1yy4ZnAWpiXrb6XMza0B62OYGW93LMod4y8hqDYwvh
         U3ti2Ut+KC0OL/AWFTDiA+qXBqp+JvUI2gEAL4JZKqB4X0cwxNpM+2HPr+hcAT3R2F5v
         GTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768678632; x=1769283432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46KVe15tN8TpcCSkpGIyJmZvxVcuVxo2lcJNsvw24l4=;
        b=OV20IMB3qQ9HX/mrZn+Z5yURfyYxLSYslHL8k/UAEYXCp7/6qWvVEutrhQTPQUC1Pt
         0IR8b+nuA7RFZoXajEhfqov/AVDlq+yFAlLlg1uStzJ49xwS4zDOhm5v6gx6yANGJFsW
         djB8/NT+HV6ymuvHpafn1E2WHMgu+Vr7/PWkHFtWxHucjRAzTI9R5tZM1J8ODJTFJJBQ
         O5r80yTYd/3Q+p3iRrbA56i8b25GC2INCttQCZ6E9V1uwP1bM9grjOL1j7U+Di9kzMN8
         00zWDod431CGBBqXwZHnGTAziPqjNNr2rveyWpnkfZZ5tNdZecRHD/JILeVC4FSFRjV8
         cjvw==
X-Gm-Message-State: AOJu0YyIeCIomXBlOT9ajjxV3ic+YsxE8QVADQvmoVLgUJZq+mIU7S1g
	HNs4hu0o+wi+igpvpXvJHQOcWwe1i7pyYebqsQJEkM9Zompe5EFJaeNAuORL6Nlt
X-Gm-Gg: AY/fxX6F7Ek57CmTBCKZxUqgkhSt2A3cE6DZVFWP3Y7ojxyjXzzkggSbvhzG8kwBQ9V
	A3ANPGp3zExqp+RGKwqv1vRoUqejFaL2LrMBThk/KzKNi2eX9c8m05CqQOKtcjsm9mnW6vO27t3
	b4C1UviwRC3QBrrBdX/0nhqPulE6ndvrGa1HyC7HFk/5GQg7DLgI5bz5cp50Fi+nK7u1Swfm5OG
	fOwU28IEMk/ryQ3n9Sdmbc4c25bIynGWmwQCKgTUfQ+gn4VVZkoMnIUiIj4VS/sgPPdKXZpEL16
	AfRoeSU0uB+SeIE49NrBBnFyUemR9C8mEVfNjOiWG+DupNbPmFdSEJv0bw7j59IgEs0pNq5LfrW
	2ccgEOftErMMwkUK5bKGYU0U6iNewMMU5cvWD2cccD8CfnSoWHIrFw/72l1zHGCKphjXuVRiqsT
	K/bdR694fB12Xh8Q==
X-Received: by 2002:a05:651c:b25:b0:382:fd3d:b66d with SMTP id 38308e7fff4ca-38384269522mr18903401fa.25.1768678632248;
        Sat, 17 Jan 2026 11:37:12 -0800 (PST)
Received: from gl-laptop.flowwow.loc ([2a0c:9a40:8950:800::67d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384d3d92csm17630171fa.5.2026.01.17.11.37.11
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 11:37:11 -0800 (PST)
From: Alexey Zagorodnikov <xglooom@gmail.com>
To: platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/1] platform/x86/amd/pmf: Introduce option to disable Smart PC function in PMF
Date: Sun, 18 Jan 2026 00:36:56 +0500
Message-ID: <20260117193709.401879-1-xglooom@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces an option to disable Smart PC function in amd_pmf driver.
Sometimes, the vendor firmware may contain bugs or other unwanted behaviours in the power management domain.
This option allows the user to manually disable Smart PC power management and fall back to another strategy.

Alexey Zagorodnikov (1):
  platform/x86/amd/pmf: Introduce option to disable Smart PC function in
    PMF

 drivers/platform/x86/amd/pmf/core.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

-- 
2.52.0

