Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9644158870
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Dec 2024 06:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734329776; cv=none; b=AyizCaLZz6AOhSI0xGRGPajNW8iKaC8GmXXvsGlYiXfe+gb7LdkcEgto0bJuouHE46rOGNJbJdwCfp620UxMYIxjydlrt4i2YOMwPirLl6F2nzA8c6VTOXTpuSM45SSMgcYp97v2xye2pZidfBMRjWONc6taxQG0HTqQqg5e9fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734329776; c=relaxed/simple;
	bh=Fmn8kmTaRIctXuMIFKOrhgLrmiXgK9vucAcFKIHg4HM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=dLAQT2Eiy2HdQTD4QBmVm1SMm5xakSwMzTcCSQ5L24NufEwBzNSw3J1lcluHM2dTyEDq7CK1Jg+RGsq26iZStKQF8CgSB24Y3Bmzmj5EzYtVHnkFMcnrudm6QRoubxZ5zF2rxMU6Vt6Y7Jj0A4BGOc3BOLRJxBWA1KBnmmB8BWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSwXP8WH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSwXP8WH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216728b1836so25614325ad.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Dec 2024 22:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734329773; x=1734934573; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fmn8kmTaRIctXuMIFKOrhgLrmiXgK9vucAcFKIHg4HM=;
        b=lSwXP8WHSJYr57OwrNtpYFNGEQSBr4FIZXjQ4xviBBRtMUlWdgnTTncWl/rQx2js7c
         7jXt81CoXPHsjYcp0o1zXxd+Ry1BX3D+sWjYGcjVzM6TWDdFAiaQu9kDk/jRmQ0PPkP/
         LpzEa4QUSlQoUdLhm3Yp7ywTDbJ/JYCXBsJ6DrENxT0oQ4nkLJteABlJTInttWPXDU7k
         sBJ/r8X5rca1MdB3VVDaEKOJ73Xyo+z6NXpDMfKGaEXZUdxf7taxyhYtUSNMH4Jtvrsz
         aZ8cs/caMPTBuCXH9y7bvA99qb+8dY5AdSnv6t01IJyjhcDkIiWPxWWuDj5U0iUqwR2l
         RsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734329773; x=1734934573;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fmn8kmTaRIctXuMIFKOrhgLrmiXgK9vucAcFKIHg4HM=;
        b=w+B2t/2YIFbQE4pzXfAna//g8/GkJdYPqhAX8qXELeOqe1asOBmSJ50R9oqDQB+0BI
         XZWSK94BbP9eVQkb0rLwG7GdlpkaZp3n9gbLblhoIA89o1LOpQDxfHnsNIFAymjidjvZ
         O5vL8gWi994+EnLeC00cvvJX1vX5Jwupnn2WQG5tB5uBTzhnC3CO6ThR0tH8UE58VdDa
         7UPOUmzZ63dZkWWCG1V9Qshh7PHUfUeJTE/3Nzo2plsKe2PjElUkapaaHeiWfpf7sjYk
         wEblg3kvhq7bfq0PnRuE1yT3hYZn+HZAFuutwrALDrpcZw23S9jVoMYoUnxeN66iT2ag
         N3cQ==
X-Gm-Message-State: AOJu0Yzb+NTFA9lVttzXp1a1LGs98esnLcw6MLGjsJFMqmd2rnAt1VTq
	lLyNOxt5VM/P/j0RVT2dPPR7BD+8CqNfBfMhUQw6YxZLuLih+gp39nBbJfJMan0i5t0UtQvsazf
	gdTsTIzXzRhc5lH3cUDNnSDlK3wRM5mVKVXQ=
X-Gm-Gg: ASbGncuKwOwcwup8PcG17lAzb7gvPHe6tdEtRQR/MuXO9LAadXEzN5SgJWiBxBEJY1J
	+60Bj0kyXLntZYLwlcbVlPut35K+4Drkz2loJogU=
X-Google-Smtp-Source: AGHT+IH04uYeZxUT9tD+dKkksOAuASj8/BMriqviDa/zoNFUKWI+7jcfHhRrb57+UdGJVithTZ+L5vnDs5elq2teXqI=
X-Received: by 2002:a17:903:2382:b0:215:94e0:17 with SMTP id
 d9443c01a7336-218929f0d25mr124985465ad.23.1734329772785; Sun, 15 Dec 2024
 22:16:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hridesh MG <hridesh699@gmail.com>
Date: Mon, 16 Dec 2024 11:45:37 +0530
Message-ID: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
Subject: acer-wmi: Nitro button doesn't produce a WMI event
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm currently in the process of writing a patch for my Acer Nitro 5
AN515-58 laptop to support Turbo Mode. The OC WMI calls have different
input values on the nitro, and I've managed to reverse engineer the
nitro sense app to obtain them. However, im facing a small difficulty
-

Currently, the driver listens for WMI events to call the
toggle_turbo() function, the problem is that on my laptop the Turbo
Key does not seem to produce a WMI event (as observed by acpi_listen).
It does however show up on the output of wev with the keycode 433 and
symbol XF86Presentation.

I'm not sure how to proceed right now since I'm not that familiar with
the input or wmi subsystem. Any suggestions?

Thanks,
Hridesh MG
