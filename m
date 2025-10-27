Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A67C2D7DC3
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 20:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761598022; cv=none; b=l9VrAqfD4utqCqwQbvBl81woko9PWKw+lvwOdHKRrqgmJzB74BxsAZ+FBg9wQR6NPmbZ2zNN/p3iQAbqQdGJgY4bfGwVqSYp06OcFXYDkXPbElSZDHF3llVZ50cBPzxW461tBZLJv4ccjv1U3pNb0D8C0ezYvL8fn/XG/altIxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761598022; c=relaxed/simple;
	bh=faQQ2D7iNDuwMMcVay/vKPIZsHYBvavIxWyh90urfNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az/FxFT1MFaVlbbo+0vUgPCzaEkUABamMdWAfAZhjv78JSvYrRmAZgvyBisY9Lyjd/0qyLeWURILK58/EX3FXb3bs+5CBrF58jVM2xmBoEt2rsXubACNawd6YmXCWrTN/GD/KpZtiWrrfR223Zs6bbTXlba+FgUOicH9aBh5vCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/2ZGi5M; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/2ZGi5M"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-89e81dff0d1so395251085a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Oct 2025 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761598019; x=1762202819; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rIE1S6YW7y5Vhasoo7IG8SzB4lofI3YU332wGzx094w=;
        b=Z/2ZGi5MlrlAmTnpJswJRSK/0QAkNYY3XoXmo/1nf8Owx4etUQXQ1wjSNlG690Rjth
         EBMpJwQ2Qxam2+FsgQlLFEb/aP+yVvthYSHxiOh+7VpY86djlI/S+jmGxQe7wkfmTew5
         ZBTlDnuehG2mFFYbK0tsfvph4Ohml2/IwIZIJZvuJNNOYE1hwmUXtRsJlpbcMvuWmunm
         /nwfRTi0Cb23VaYSthlY/TUsoiH+buoI7j/k26DJwDBeN87Qslt75lALoRKDmwljPvJk
         xXEAcizYMK9VxmFjPIev7lFToXFZTjmxmGPnriUmsznv/cmYnBtBOW7cyF7wWQbMQn7P
         YQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761598019; x=1762202819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIE1S6YW7y5Vhasoo7IG8SzB4lofI3YU332wGzx094w=;
        b=jZMW9HQz22yVglmpCaDArFqZXhD0feL1P4mNyQMzmdQGedeHbSXKr70gaSUY+Mnsk/
         +ljkN1fO9vQl9eGLP1vYCv84ASxBo9UNrMrWG5cleq8htXANl06+C0EcseumbVnsKWju
         2xGZchk6Fl9eU22D0R3T+lZrKiA9buGsEdHAp7CKH1yfG7WthwFOYN6yVaC9sM6CWcnQ
         9CKUwXeict90LiUh/HWb4Xdmu7MlX0kYEFcMoi57cDPtO9nxW9cZVV58idmlu9eUDmpv
         9gWHlBe3bSWCrF9KCoySLAct9ZbOknqkwyAep7QVjSWFd0MNzQrEM4MaXKD6EM8R9SSf
         SAYw==
X-Forwarded-Encrypted: i=1; AJvYcCVamCkzZfu8OuHHqPL90nHlhrEI8SE/lx6OkQHsGqmLP+zH6GBgKivJEmmDJbm2vm8EIVNeCI174AleR5C1ZiGfh1oA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Ae9G69sKZ7EmMot1h4nuYVHVCUswOh0Kjwf+fUfqRpFOSthu
	nbLieAU1ghwwo0kLi9U21QRTyF7CaUbafDejSDXFohQm4Y9dw/OG1290KWX/vlgS4aue8L0H6B+
	xFqhvrfiEkFpGzzHujn+Fta+876yxW5c=
X-Gm-Gg: ASbGnctv/4R1tg4ku/A5XSNYMAToEj5g1YmR9hC89WLdoauKqmH/M9cWyZs4e1JGfnx
	vDGN+cPuV1TX19uP5AQ3IbDtzcqkLlo5vIfUnMKEBKltKmVc0X4yhfQ3pSRnUi0DafLkI8QUy/2
	39M7+feUH990vEfddpusUh5Vy+NLHliwZavdEvxdq5pufsp1NuLPYszYTY71moiUEsIJp+uwHj8
	lcU+X4p4c7pzKdYWVKKVVmKsdcjrCTAVoS4F8amsH47hy0K4qUV7l3rqGXbqF7bmdqVUHSA9CcP
	ayhcBGmWk+BIMDK78iNB3MT0fThXFO1E1cF7Z3LB55EMy3wc577i
X-Google-Smtp-Source: AGHT+IEdQ34YMbSl3Vtgs/HEKyWEoWJBHDhw0yXCNWap7EasniTNIQCulWMfUVAq8O2AvzbP3T/AXMBY2oaOO6HCh60=
X-Received: by 2002:a05:620a:4146:b0:859:a927:e7cf with SMTP id
 af79cd13be357-8a6f4e91fe2mr185835785a.36.1761598019306; Mon, 27 Oct 2025
 13:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com> <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com> <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org> <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org> <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com> <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
 <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>
 <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org> <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
 <3896a83f-c7b4-4ba4-a223-946562fb21a3@kernel.org>
In-Reply-To: <3896a83f-c7b4-4ba4-a223-946562fb21a3@kernel.org>
From: Lars Francke <lars.francke@gmail.com>
Date: Mon, 27 Oct 2025 21:46:23 +0100
X-Gm-Features: AWmQ_bkgJFt7wzkD27Z1lw8gutJcu-Q2dwNRlD4bSA8RO8AmM74BCKui7HUe-I4
Message-ID: <CAD-Ua_i7VY+a1Mpn6_iubouYCLYOcx7ZYaKNBgtGQw6w8wuU0A@mail.gmail.com>
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Mario Limonciello <superm1@kernel.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	John Allen <john.allen@amd.com>, platform-driver-x86@vger.kernel.org, 
	Patil Rajesh <Patil.Reddy@amd.com>
Content-Type: text/plain; charset="UTF-8"

> OK thanks for checking.  Any chance there is a trace below that?  Or is
> that is all you see?

That's all I see.
After booting & logging in I get to the console and immediately get
kernel logs printed to the console.
I can't do anything then and have to do a hard reboot. These logs are
the last thing before a "boot" line when looking at the logs using
"journalctl -b 1 --system".

I've tried adding a bunch of log statements now - will recompile again
and report should I find anything.
That said: I'm very much fishing in the dark :)
