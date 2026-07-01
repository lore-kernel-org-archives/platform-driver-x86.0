Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D243B27EE
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Jul 2026 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782898961; cv=none; b=VagjB9kAeQWg95NzIzgoEQVIO0TECjLYk2E43EAIIGOJJQJqKjsEReSoGEtfs2QKeH/O/JCuyfP7c9P5wupG4JRDcXHIB3RN5ybdFNSGtRRzOtvs0je6Gj739Dr1j79igQiykhc/T3BoXKNMF62AeJelP5fZKO4RYG5xEVm/pn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782898961; c=relaxed/simple;
	bh=A350OkbddcsU4dBKSFpxsA4KZQPSJIVFfYaugvls928=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VS6S8kuX8lFNa+Ns+PD3WtRYYWZFFLxoOOeXw3qESDBeAMsGaDv0tvDsarQxvUpplUrB+3+ozzDyXcUN6sx1Fyouu/cfXhl7ucaA4WD5Lbfmen5MnHb31Ljc3xNUiXrL1gvL/oFJXFvvUmtjWYfoqdrRhA3Trgs5PgEZ84rQYsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRu3NIMz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRu3NIMz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so2240925e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2026 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782898958; x=1783503758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A350OkbddcsU4dBKSFpxsA4KZQPSJIVFfYaugvls928=;
        b=QRu3NIMzpsEJSY06hNpHuPH6E4U24/Uq7zUlJHF7/IT+tsyyoLcZbJj59NWesNcV/r
         oyzT5wLT5LVhCJ1HjEeOzmNnVdt1cIiDaUjp0oG3C3EBoXc85Ym+Ni515ieEb3hjxIMo
         80+b+lVg7h/Sn8XPIzqm0meO0Kxmgo/eCMR6NhmowrrrAOJS52DCa0PXLbUKAMtcEWv8
         EUjyZbBN5aZJS51j/PgEDwwXa7yjZ+2pHlpxw3aAxRg66x8AIWiVaFMQDDqUinYRhU/w
         ISNsYZQqqZJM4VT63CwzXLQLfkHm9UpsQnMm5l9QnYOGg0hYfWkL6JytiGRzuuoqTcGQ
         +32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782898958; x=1783503758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A350OkbddcsU4dBKSFpxsA4KZQPSJIVFfYaugvls928=;
        b=fX+ya81bAt0I8J9c3bn9BDq7gBL93Z3QHcIkVaraWXvaV1FGEkrM/ZilNHP0iMJq+M
         ne73/4qV72ROwEOb0FIJS0iS/x+bksTVBcIGgJFKXnEoE1WJdtIG4rDzfRkg8jK48VKq
         tgggE5T9FQlnU6Ja1x8c9aiEd9+DdriK6HY3PxKU1x5vFOxyE8SSbmWn22WX8WsPCSBy
         YQBwdzKJt/+dRnre5U2glG4yoGCCwZgvVEPXuNiEPovxmF3P9Nx0QUruiVY5Nq8+bLbA
         48kHLFhNSFpiFKkGu4/PcvpgLmZ24x9pBa5+bfjeGNoMWcX5qx7RU65+nLrihN1zWKzH
         OFAQ==
X-Gm-Message-State: AOJu0Yz724MYxRky2gc4zd8SGtYN9DncWGXD8fyb5PXRzB6uMSkxMLeh
	vZFVWdrEWOk5oEckE1GBNAChMkkZSW/XnHFwJe/tl6/VRSQkXt5BAOkx
X-Gm-Gg: AfdE7ckZtvyCnukAZ2GDC5dPkYGnztBLX1pwPjTaRr3oJPNPGqZ92comvQWyZqle2v/
	4zjolZfiO/KGPi7jTPwmObXNLNcHH+IXtl9Ioiq5fQC/E3NhuAyIcfjp866UqWTIyk8xawh04mi
	dO5vC0kqb5PaKguMSXEiyKtXyG/LwIC7tPK+9kalMKxj1kZtxXQC/L8lTqP/v7oiEai1fiB0fIK
	pOax3r3+wuwYaUj65Q4O8TyROQewNc4CvSQh9mhJR7r9jN3ZHp1TqXo0osufgxeD6TDI5hXBoOY
	9u+aOxfmGYOvgyW6+cb7JSAf1dLFKwlWdySTiez1cRLogSxodVDdPuXV8e35HA9MTS7R3dary2B
	l86fWiMMWACrwCpw5h5+LRKC+A2mPRqGj+E5DM+3tgc/W0mTCvZ8M7GRzcheGsOmjXoch6r8s6Q
	ThuhNGx4r1lmMP9icPMKhCew==
X-Received: by 2002:a05:600c:8217:b0:492:5e71:f6ab with SMTP id 5b1f17b1804b1-493c2b84c14mr13561425e9.20.1782898957922;
        Wed, 01 Jul 2026 02:42:37 -0700 (PDT)
Received: from user ([104.28.162.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm14539194f8f.32.2026.07.01.02.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:42:37 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
Date: Wed,  1 Jul 2026 12:42:35 +0300
Message-ID: <20260701094235.5603-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1584d299-20e6-4270-b033-ab3296e7b624@gmx.de>
References: <1584d299-20e6-4270-b033-ab3296e7b624@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin,

Thanks for clarifying the design
on the design interaction

Best regards,
yahia
