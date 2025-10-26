Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5EB26B0B3
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 20:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761511181; cv=none; b=PtVMihg1ovoRTyah2JBDbRCASnQTk9sroW2BET0Xd2cizj0bbAb8ijTlo/qhRo0bfX+rMcu1CkQyPT4VEUzK7qhrK0mwRHf6sc476YIK/+xF9ijYPtTYoUQEmTnbf2NBLhgh5WAsrY97X5rcHfP3NwSyAq5StO3Qmyev5RQ4gwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761511181; c=relaxed/simple;
	bh=xo7RxmSCsxnLo9thySaG+4ooMU/RBAmrRoS7APNAql8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSwEhp5Fudf78J11AzjgjWfW4liGbjMEyPBWft4gYL2mM2vx3P1PLX4wKB/2IM85YXueDkiHtmgl+WMr9senq2S+JbxpwTDcwaokhU+mB/OsV9T2FffeDpfaBTl1iwy2brXgOsf1wU22TgAch7EL0rZBW3xyBI4GW/bCnsdTZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZJpKpdm; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZJpKpdm"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4eba0adfa04so20158841cf.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 13:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761511179; x=1762115979; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xo7RxmSCsxnLo9thySaG+4ooMU/RBAmrRoS7APNAql8=;
        b=JZJpKpdmwxLhFKsogYTDsxJ1T4bjtZK+36LvNHmiop9X+I5shbYWd1Mhp9zhe4gazG
         YTullUPpwfQyUyUkPX6GwKmxjEM27GC+lLEPVwRHIitJIUpVvgbP6ikbQM2L4fn9WMU3
         /zd0XQ4NvzMLpYmVQvhbvLAyz0DZvrfCEt/kF6v3vJ/+ejo4CLE3WYMxRwANO+v8m26j
         EoINxX850mQ35tI9o36Cma5wiImI/eqk7uJiacz+ZJ8UgWJGo80CIQuwex+1wlu5vcSD
         h7sjVkKA8jRBjbX7faOr+hGBwhgVcmmvuxD3bhxAkeHwPSFmqQwEiB0+mVrk7Z4NmqZM
         nVgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761511179; x=1762115979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xo7RxmSCsxnLo9thySaG+4ooMU/RBAmrRoS7APNAql8=;
        b=LRhcEUuRpqZnBPWkmQrHaL+mQDhKD2AUbxhNoLie+it4pS3JuveVfXZ5zHgMfRXMCR
         VXxbwpA2ZJFqgldYjKsyeddySE6hKGWeYD1d8l/qLjYhXo/KL9N7EJZhULnVSpr7mtOI
         qzhD2DBRwr+bYO68o+afWtGJ7MlMb93MFCQYdOth7w5dLWlLW4ixn6cWLS5rKDxDv4ng
         uedS8uidrBqBDCs857LuhxSRvp0l6gFyq8w4uJMOrw7DWpKRqPqIZ6rmIPkuRDvPwq/N
         3mnNZoJC9JOD48S2rGnjDIx6djKsYuj8LMD+fyJMC0x1SLa3QptEf5d4kv0YmeuwzLEM
         0bCw==
X-Forwarded-Encrypted: i=1; AJvYcCWfMcNiIL6H9J+uq1s5gW6vja5jD9jK+wlXctJbmqXE6eXv//Ej4bbjS9bt0fF1+RacgzYJaHt0VEsivCKtBwAg8rfv@vger.kernel.org
X-Gm-Message-State: AOJu0YxvMPke/spcZQa1xZKqWKecvLqaB1zfuO1KZ0/iI1eO1qLIm3+T
	G/8nFhAQd0V7n1joFwZghG/Elnrc++hurEQ6B/5qjPuWc84/HnrTomFyjKIh/oSq1MbiL95ozMm
	sYKW5Qw9+1f5sI7y8YzGH2Z+HiXChylv2ZYl6F1Q=
X-Gm-Gg: ASbGncvJlxf3IsVFQcNMgj1nm4MnNpzg9xIQGQrPn/VYDMYIwoyzSPxt+JLylS74DbV
	m8JprAnCL/KX3f1qiXBO0rAzn6O6XxAr/N4A2xbPejgh7uiBGJegFG0G3pfOCFZVWdfFxePd604
	hxCmu6OjTI5Qbmh/BQTwpKm1uoXhC8TiYdjtxBg3o6BsMphIq2rrI+IlztQj90E2KRfMOHnJl6X
	SWNoL5Y19hmJ6COLPV6ZDL2jp321OYmsPrkPt/+kr/9ZL2j28A0eEkrKUdLig==
X-Google-Smtp-Source: AGHT+IFVCvzd0K+KK8GaBU4tnRcVpixiXebWSKMWonx611agvoPQcoHgxWAaBgpekwTUjo8Qjl6QdogIlFDIUkf/nPo=
X-Received: by 2002:a05:622a:1991:b0:4e8:bae7:4d13 with SMTP id
 d75a77b69052e-4e8bae74dd2mr377410621cf.41.1761511178664; Sun, 26 Oct 2025
 13:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com> <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com> <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
In-Reply-To: <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
From: Lars Francke <lars.francke@gmail.com>
Date: Sun, 26 Oct 2025 21:39:02 +0100
X-Gm-Features: AWmQ_bnvwGRGS4okRi8XETX41fjN5mUIX5NNT-qopz3QrJLuNdo5GCbybvt5wr0
Message-ID: <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Mario Limonciello <superm1@gmail.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org, 
	Patil Rajesh <Patil.Reddy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"

> Can you try this attached patch which inserts that flow to see if it
> helps?

I haven't build my own kernel in a good 20 years, I'm on it though.
I've applied it on top of 6.17.5 - is that good or do I need something
newer (6.18 or similar)?

Thanks!
