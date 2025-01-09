Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01E21A459
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jan 2025 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736434646; cv=none; b=C2kuN+2cjMfyPMy/dXXwPXyWWA3Nae7vqtkocuwUB7nAk2EA2EQ6BG3U9izwUWzrkkJeUOi9RsVs744I91UIImfV4NmzUyBjeNg35T4xN8QtNK5RVkaCf0x4f2nfzS0Q3OxQ+UklfUQps+Nmq9ZNxTSsKNZG57Bo3LLFubbPHM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736434646; c=relaxed/simple;
	bh=7tQK1wBY4mJ8bG4Ad/Y+Y/toEwYxTRlAh9cV8ggwguo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y+Wk4Q+c4UdgyqvQx3Yofn4MNNMbw+PjvMEU284AcO+LC3Gu3drH5Ub4sEbkvpXriaEXY9roDaa6MZXGqD14aYmIYvvZL1R2IOVXzoikH4P6edvyJ9QvBkrbEUPpVDeVXrzHZftTCnJenKxpEto0Lu9Pwbim0TEvewGceRpcxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fO878uUb; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fO878uUb"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YTSYm5CWBz9t12;
	Thu,  9 Jan 2025 15:57:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1736434636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PIcf94QpdY4vCtUlne7B4MNOeArydMMKo6iwMMk+Eg=;
	b=fO878uUbCoCdeKfyMJM/P/H8ESgCLhxica4T70sPqMzo02ZUC64kIP5/DDZFyBy6uGvroS
	qj4+E+UfFKF1HlSTrksPLBUIaRjfe2FZfitY4UaND+4VL1d4+WAYDkUYqX0kYvTcl8TyYh
	pqzf3tOtnLtuzsGjINUAqJyLVaI+inaMRTqGj31E0aagPPuFwQMRuyy/a64fVwqDJ/sKo8
	lBBgYX6mCCC8C3QOLeBpYcDhtFAQ7roSTMDpXelKiya4KHNLKiN4rdNbvaKTIBnk86tPIB
	Op1pTFuFHf9EiuVwSbrdQPkzaH0EAmRKu8jdGw9NfHd4Io+4q66DOiJT+jv9xQ==
Message-ID: <7893ceda-5260-46f2-8a87-ffb7734fa99b@mailbox.org>
Date: Thu, 9 Jan 2025 15:57:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: amdgpu 4k@120Hz / HDMI 2.1
To: Mischa Baars <mjbaars1977.backup@gmail.com>
Cc: amd-gfx@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org
References: <CA+b5WFEXPJ==vruf-6DHrhS7j3pnTaj_EQE08BimxqyaNvktQQ@mail.gmail.com>
 <d1028755-6a7a-4db4-bd4b-e5a2d682af61@amd.com>
 <CA+b5WFFa4hMeGnN0J2xd=FpU2Cxe_AjapWBpTFjfNhzUSOUAzA@mail.gmail.com>
 <0281e6f7-4ccd-4369-9182-d1580c9e6bc5@amd.com>
 <CA+b5WFEv1Qj3NYcwXaZz1EYW9omj7FmB8FdSKZnixsMNoi1+DQ@mail.gmail.com>
 <ddd7bf09-31aa-4e4a-93ea-b1336ced8578@amd.com>
 <CA+b5WFGDstoJTjgaT+hm4r-78zup1pLa2Ada7PqbTY=wCutSbA@mail.gmail.com>
 <98b3392f-2860-4a32-a769-b4dcd3f5dbbe@amd.com>
 <CA+b5WFGkDJhpRRywQLx2okttXGasBu6K8ScLZyakKrk1+FZWAw@mail.gmail.com>
 <5321c9af-6df7-4bf0-98b2-d6c4b2861374@mailbox.org>
 <CA+b5WFEjG1DE1+_gG0qwmEf4nQZFg=9O+rHDJZmiADL5Hi7fbA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <CA+b5WFEjG1DE1+_gG0qwmEf4nQZFg=9O+rHDJZmiADL5Hi7fbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d8e73b97bab921b69da
X-MBO-RS-META: e3bycfzjg6t1xar7phm19hhzjn63i3ng

On 2025-01-09 12:00, Mischa Baars wrote:
> On Mon, Jan 6, 2025 at 4:41 PM Michel Dänzer
> <michel.daenzer@mailbox.org <mailto:michel.daenzer@mailbox.org>>
> wrote:
> 
>> I'm sort of a fan of Michael Abrash, as he inspired me to learn
>> programming assembly language a long time ago, but in his Graphics
>> Programming Black Book, Chapter 23 <https://www.phatcode.net/
>> res/224/files/html/ch23/23-03.html#Heading6> he shows how the CRTC
>> Index Register is used to change what is shown on the screen by
>> alternating between two memory pages at PAGE0_OFFSET and
>> PAGE1_OFFSET.

That's much lower level than OpenGL. OpenGL implementations can and do internally use page flipping under the right circumstances, it cannot be enforced via OpenGL / GLX / EGL APIs though, it's an implementation detail.


> The glDrawBuffer() <https://registry.khronos.org/OpenGL-Refpages/gl4/
> html/glDrawBuffer.xhtml> reference page however does speak of
> initial values for double buffered contexts and the use of both
> front and back buffers.

The OpenGL app can use single-buffered drawing to GL_FRONT if it doesn't care about the artifacts possible without double buffering.


> Can you explain to me why we are only drawing in GL_BACK and how
> that relates to what portion of memory is shown on the screen?

A big point of GL_BACK (and double buffering in general) is that it's not what's currently visible on screen, so there can be no artifacts due to visible unfinished frame contents.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
