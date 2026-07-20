Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFA5271443
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jul 2026 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581604; cv=none; b=SE1v2ZpVtndHHF2b8va1wpORXc0H3Iy6WEqlFdRVQp8LaZvVajQgAP6+kgpUuhr7xuCgya9yFmB24rkbAKL6NWf0BnXOjhgibeh3aR4rZMY2KGSy/UoYG9AfNbe6CSF6vzRt7yQrUD0yZAnPvdukjPAAv6XreUtqzdfDdU9dTw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581604; c=relaxed/simple;
	bh=dnPKkHLDeZOU1SRB530o3OYDQDQrdZWq/oWfrL15QqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JkDQfIKEWdFAb2hce4qvAF9VFrUI2EN5xZeXvJd0YWbYOFjvdZCDqFcKMQ6lH6cE/PH79j2C+ts1xjk6Bg9Wc0kUucsSDAA2povMImcEwAghQN3iYB0jjxZu61oD6TKNgNRNFnf3ykcWbaO7otg3w8okpN0Z28gxkL4GzXgsVpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=L7/8lPlm; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="L7/8lPlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1785186402; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	References:MIME-Version:Content-Transfer-Encoding:Feedback-Id;
	bh=gk+Duh3U+2GqGyNshJ3yqZYza9L+Tbhu3Jwcch32Gog=; b=L7/8lPlmNnRMI
	gUlq6J4Oe8hWmNWE9ZNuMhz1xdCm641o1FeV6EU9ZgQTnMz/LspQHFt93cq1f/rR
	0Ww5EZC1qURsnvCUVFEpJsVK1gKkRzQ7Bvs0+WBrFLTGiUcMywT46tggIkBqiyVq
	oyJ5fRU5eeNRWiLSxy1f0RVr7ra/y4=
Received: (qmail 3692701 invoked from network); 20 Jul 2026 21:06:35 -0000
Received: from 105.68.139.29  by turbo-smtp.com with SMTP; 20 Jul 2026 21:06:33 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e668ae8fc42c005-005-4288be1d
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Yahya Toubali <yahya@yahyatoubali.me>, Weijie Yuan <wy@wyuan.org>, mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: wmi: lenovo-wmi-other: Document intentional BIOS misspelling
Date: Mon, 20 Jul 2026 22:06:06 +0100
Message-ID: <20260720210613.2797477-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87jyqp4yf4.fsf@trenco.lwn.net>
References: <20260719173710.2367930-1-yahya@yahyatoubali.me> <87o6g250ya.fsf@trenco.lwn.net> <20260719224317.2450320-1-yahya@yahyatoubali.me> <87jyqp4yf4.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Hi Jon,

Thank you for the link. I have read the policy carefully.

To be completely honest: I used an LLM to identify potential typos and 
whitespace issues across the documentation files, as well as to draft 
the initial commit messages and email syntax. 

I see now why sending automated, low-value patches creates 
unnecessary churn for maintainers. I take full responsibility for 
those submissions. 

Going forward, I will not rely on LLM output for patch generation. Any 
future contributions from me will consist strictly of manual technical 
work and substantive fixes that I thoroughly understand and verify 
myself.

Appreciate your patience and guidance,
Yahya

