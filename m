Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2314158DAC
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 22:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731969551; cv=none; b=cA89kAgKfcEAI7oKffBSmGagBRN0fTcL47PwbuNCA+oSl8SZAXXXycihnIn2YD4/JLujdXoAX0K6JGBB4nYOCLecVsf7DwDmFn8csg0liUEpkvPcW2E38EdAfTZpjR6l7NhyiDn2w3u+eGrZ/exnay28AFKw4VMog/7+YLa+iQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731969551; c=relaxed/simple;
	bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=tGlnC5rk383Q4yGALgpPi1NfAQbQTFqhOjPX2BTteJY/6skOulF+8eb5riHVbKodo9P9+q/EPd9or86A+bv/0vLXAXYh9pW1fWsM29YwxFVTXlDA+flNGRHsF6Dms5VGLVEDDtp28mzldnd0kp6xJfjAdj6Qw4DeC429YgIRrGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAXwVGXL; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAXwVGXL"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-431695fa98bso1832075e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Nov 2024 14:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731969546; x=1732574346; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=XAXwVGXLdZrf1MuyJ4yiqV3zaq/NmhhtA3GunUDCP1+iwCtnaobfXgoJcIV50dH+3Y
         nOY0UxS1bgK/VppZhrwHNaxmnjLV4nhME2vCqXH4yHtmLyo8zLnIohu+iqsEDRGi354y
         s23JBfMCNqnUUtbBFXAtdoZT+4duJ20YBoggYBB3jFlFaEP/zm/j/W1jV8IhTIUbno3K
         dQtr7nXVW25nOkQeeJNZeEMuIPOZa0Xvg4V361cyx4fhNfP778v+xgIivKmLnzEmybEs
         +jUlj7hYFiLgt3WC9sZMdr6fq6H3T736p0ZDh/FsweXKiwoNTY/3MhHPVUSAFg53PT4a
         tIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731969546; x=1732574346;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=nuA/kML8xnCFlXpIM3CWny39W3UP00ynP0FLjoi3ziLqn9vyixOZcwYcXKUzrSWYOu
         7gBt/vDsFpCNvq2UCDKEHXDU001bM2Be6R+7cMmyVe0ByKdIXdNWOqI5gi3r2+Hrisfz
         Viej5XYp5cQQhMX37qMoe1MtWJiX6PojJ1AwwnQFDRIjtoev4g8ofsnvss+YU2ZYsmPK
         LdUVGEphL/mjcXSH7C8ub4Pc6xMIWQvxOUB5I2DdK1SEbl190+h6k4yOknQGHiglIBk0
         kqsVBpwLTNlJKseAkroWOs2YQlVeWK76TQu+O9U/sQAGFUHODs0L2d0UR5w9Tg93QhsK
         VXaw==
X-Gm-Message-State: AOJu0YzQjjtM+xJcwkRxy/6REKyH8qC9qbkFOEaU8tQiB9C0JH5KBX+i
	Lo8GTEaXAecO4E34SRg7H2SvZs7oSC0bV3ZSTJFEzAiL2/rpRvemR74slqay
X-Google-Smtp-Source: AGHT+IER8q0ZbLF3RwX+D9sKmFRTkPtJL6krdn2qMMdtA78+Q4Jl+tcmO/fMvuNipojP8ecinduliA==
X-Received: by 2002:a05:600c:a4c:b0:42c:a580:71cf with SMTP id 5b1f17b1804b1-432df78f0f9mr133630665e9.30.1731969546561;
        Mon, 18 Nov 2024 14:39:06 -0800 (PST)
Received: from [87.120.84.56] ([87.120.84.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab789fasm174720225e9.18.2024.11.18.14.39.03
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2024 14:39:04 -0800 (PST)
From: William Cheung <muralidhoron73@gmail.com>
X-Google-Original-From: William Cheung <info@gmail.com>
Message-ID: <c228473b3af65b8f806e54425601b327dd9ca0563877164b16ec2dd91ef14d46@mx.google.com>
Reply-To: willchg@hotmail.com
To: platform-driver-x86@vger.kernel.org
Subject: A Proposal
Date: Mon, 18 Nov 2024 14:38:52 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

I have a lucratuve proposal for you, reply for more info.
