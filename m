Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7EB31714C
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 22:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784501022; cv=none; b=pKvHAe4kjPubMAFuLJiSAH4DNNzeng4nzKCfZTs+iTnn4wpCT/Cea0G3a0/xdOJ4oTiM2Sbc/QzRO0XK2VQhscIzddZMnwKLWLbqQV7bPvP5s4FrEw3Vob5jHp+gG4B55fexK3hfeSgm5qhczjQGgAI4zZzY0GN3km/c3OQ42cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784501022; c=relaxed/simple;
	bh=bU9rfzZw+sYihYNfDvN67BphozTyaKjVAaqwYvV7cOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BW+7SKDmOv6NBVGPqrwMjOHMMBg337wOzdQ/AL25ePATBxTXxlvgEKXhcemvYhBe30WyUlvYIrfiQobO4gsGoi5/0oLjqyeu1yII1qzPevpumorzpjlQlB/TlvGMiWC7n0eriCc3zXyP3Ln9dUwROvSShg/UeLcXGliZd420WE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=NNzR+yMt; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="NNzR+yMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1785105821; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	References:MIME-Version:Content-Transfer-Encoding:Feedback-Id;
	bh=Lowszjnb5rLCrQz02KnFZwZejwYL9GUBNjyM8sCLN5I=; b=NNzR+yMtKqI5E
	PoqGz/DHD4xCk0fH7m3wIYTOko+qKop3qEOkf9iKPaMGPvw1vWkc93GS9kQ/d2we
	sxyZn1ONZX3JRgjN4ZEuuD6nLbx3un4Ooiv+VWsHAIBKYBy5p/68G0NordTDJEjz
	BRZqcEXqF+jlUoUKtc81evbSgNuHak=
Received: (qmail 1075180 invoked from network); 19 Jul 2026 22:43:39 -0000
Received: from 197.145.178.94  by turbo-smtp.com with SMTP; 19 Jul 2026 22:43:37 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e655789a1c2c005-005-4288be1d
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Yahya Toubali <yahya@yahyatoubali.me>, Weijie Yuan <wy@wyuan.org>, mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: wmi: lenovo-wmi-other: Document intentional BIOS misspelling
Date: Sun, 19 Jul 2026 23:42:46 +0100
Message-ID: <20260719224317.2450320-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87o6g250ya.fsf@trenco.lwn.net>
References: <20260719173710.2367930-1-yahya@yahyatoubali.me> <87o6g250ya.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Hi Jon,

Yes, I used an LLM to help me format the email text because I am still learning how the mailing list process works. 

I will work on my next patches to make sure they are well-structured and follow the proper git mailing list standards.

Thanks for the patience and the explanation,
Yahya

